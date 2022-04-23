select * from inventTransferLine inventTransferLine
join  inventTrans
on                 
                inventTrans.StatusReceipt            != 5--StatusReceipt::Ordered
               and inventTrans.ItemId                   = inventTransferLine.ItemId
            join inventTransOrigin
			on inventTrans.InventTransOrigin        = inventTransOrigin.RecId
            and inventTransOrigin.ReferenceId        = 'ITRF12694996'--inventTransferTable.TransferId
               and inventTransOrigin.ReferenceCategory  = 22--InventTransType::TransferOrderReceive

        where inventTransferLine.TransferId  = 'ITRF12694996'
		and inventTransferLine.PARTITION=5637144576 and inventTransferLine.DATAAREAID='phct'

		and inventTrans.PARTITION=5637144576 and inventTrans.DATAAREAID='phct'
		and inventTransOrigin.PARTITION=5637144576 and inventTransOrigin.DATAAREAID='phct'
