package org.neric.regents.model;

public class XDocumentWrapper
{
	 private boolean selected;
	 private OrderDocument orderDocument;

	 public XDocumentWrapper(OrderDocument orderDocument)
	 {
        this.orderDocument = orderDocument;
	 }
	 
	public XDocumentWrapper() 
	{
		super();
	}

	public boolean isSelected()
	{
		return selected;
	}

	public void setSelected(boolean selected)
	{
		this.selected = selected;
	}

	public OrderDocument getOrderDocument()
	{
		return orderDocument;
	}

	public void setOrderDocument(OrderDocument orderDocument)
	{
		this.orderDocument = orderDocument;
	}

	@Override
	public String toString()
	{
		return "XDocumentWrapper [selected=" + selected + ", orderDocument=" + orderDocument + "]";
	}
}
