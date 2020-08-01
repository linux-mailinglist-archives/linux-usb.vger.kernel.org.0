Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B6C3623530B
	for <lists+linux-usb@lfdr.de>; Sat,  1 Aug 2020 17:44:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726977AbgHAPoi (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 1 Aug 2020 11:44:38 -0400
Received: from netrider.rowland.org ([192.131.102.5]:52501 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1725841AbgHAPoh (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 1 Aug 2020 11:44:37 -0400
Received: (qmail 66396 invoked by uid 1000); 1 Aug 2020 11:44:36 -0400
Date:   Sat, 1 Aug 2020 11:44:36 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Peter Chen <peter.chen@nxp.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "balbi@kernel.org" <balbi@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>
Subject: Re: [PATCH 1/1] usb: gadget: core: wait gadget device .release
 finishing at usb_del_gadget_udc
Message-ID: <20200801154436.GB65766@rowland.harvard.edu>
References: <20200731095935.23034-1-peter.chen@nxp.com>
 <20200731115536.GB1648202@kroah.com>
 <DB8PR04MB7162B2FAC7FACD0A11F6D8218B4E0@DB8PR04MB7162.eurprd04.prod.outlook.com>
 <20200731122520.GB1655976@kroah.com>
 <20200731140553.GA8013@b29397-desktop>
 <20200731141248.GC36650@rowland.harvard.edu>
 <20200731234224.GA13414@b29397-desktop>
 <DB8PR04MB7162CC76A1957F83F6079F688B4F0@DB8PR04MB7162.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DB8PR04MB7162CC76A1957F83F6079F688B4F0@DB8PR04MB7162.eurprd04.prod.outlook.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sat, Aug 01, 2020 at 06:53:40AM +0000, Peter Chen wrote:
> > So, the basic routine should like below. I thought the usb_gadget should be
> > deallocated before the UDC driver remove itself (UDC device is the parent of
> > usb_gadget device), I may not need to wrong about it, it is just a memory region, it
> > could release later.
> > 
> > xxx_udc_release(struct device *gadget_dev) {
> > 	struct usb_gadget *gadget = container_of(gadget_dev, struct
> > 			usb_gadget, dev);
> > 	kfree(gadget);
> > }
> > 
> > 
> > xxx_udc_probe(pdev)
> > {
> > 	udc_priv_data = kzalloc(sizeof(*udc_priv_data), GFP_KERNEL);
> > 	gadget = kzalloc(sizeof(struct usb_gadget), GFP_KERNEL);
> > 	udc_priv_data->gadget = gadget;
> > 	...
> > 	usb_add_gadget_udc_release(&pdev->dev, gadget, xxx_udc_release);
> > 
> > }
> > 
> > At xxx_udc_remove(pdev)
> > {
> > 	usb_del_gadget_udc(udc_priv_data->gadget);
> > 	/* need to never reference udc_priv_data->gadget any more */
> > 	udc_priv_data other deinit;
> > 	kfree(udc_priv_data);
> > }

That would work.  It doesn't have to be done exactly this way.  
Depending on the driver's needs, you could do:

xxx_udc_release(struct device *dev)
{
	udc_priv_data = dev_get_drvdata(dev);
	kfree(udc_priv_data);
}

xxx_udc_probe(pdev)
{
	udc_priv_data = kzalloc(sizeof(*udc_priv_data), GFP_KERNEL);
	dev_set_drvdata(&udc_priv_data->gadget.dev, udc_priv_data);
	platform_set_drvdata(pdev, udc_priv_data);
	...
	usb_add_gadget_udc_release(&pdev->dev, &udc_priv_data->gadget,
			xxx_udc_release);
}

xxx_udc_remove(pdev)
{
	udc_priv_data = platform_get_drvdata(pdev);
	usb_del_gadget_udc(&udc_priv_data->gadget);
}

In other words, embed the struct gadget inside the udc_priv_data 
structure.  The difference is whether you want to keep the udc_priv_data 
structure hanging around even while the controller is in host mode; if 
you do then your approach (a separate struct gadget) is better.  For a 
peripheral-only controller, my approach would be better.

> > Since all structures xxx_udc_release uses are common one, it could replace
> > usb_udc_nop_release at udc/core.c.

Yes, it could.  But first all the UDC drivers would have to be modified.

> Since gadget structure is allocated at UDC drivers, I think it should be freed at
> the same place. Current common release function at udc/core.c may not a
> good idea per our discussion.

Agreed.

Alan Stern
