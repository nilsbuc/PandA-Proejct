from common.python.simulations import BlockSimulation, properties_from_ini, \
    TYPE_CHECKING

if TYPE_CHECKING:
    from typing import Dict

NAMES, PROPERTIES = properties_from_ini(__file__, "integrator.block.ini")


class IntegratorSimulation(BlockSimulation):
    ENABLE, INP, OUT = PROPERTIES

    def __init__(self):
        self.last_enable = 0
        self.integrated_value = 0

    def on_changes(self, ts, changes):
        """Handle changes at a particular timestamp.

        Args:
            ts (int): Timestamp of the change
            changes (Dict[str, int]): Dictionary of field changes
        """
        super(IntegratorSimulation, self).on_changes(ts, changes)

        enable = self.ENABLE
        inp = self.INP

        # Detect rising edge of ENABLE to reset integrator
        if not self.last_enable and enable:
            self.integrated_value = 0

        self.last_enable = enable

        if enable:
            # Only integrate when enabled and if INP is 1
            if NAMES.INP in changes and inp:
                self.integrated_value += 1

        self.OUT = self.integrated_valuefrom common.python.simulations import BlockSimulation, properties_from_ini, \
    TYPE_CHECKING
import numpy
if TYPE_CHECKING:
    from typing import Dict

    
