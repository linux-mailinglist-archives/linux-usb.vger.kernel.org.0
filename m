Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 20C9937929B
	for <lists+linux-usb@lfdr.de>; Mon, 10 May 2021 17:25:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237191AbhEJP0S (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 10 May 2021 11:26:18 -0400
Received: from netrider.rowland.org ([192.131.102.5]:39623 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S237702AbhEJPZj (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 10 May 2021 11:25:39 -0400
Received: (qmail 866184 invoked by uid 1000); 10 May 2021 11:24:26 -0400
Date:   Mon, 10 May 2021 11:24:26 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Felipe Balbi <balbi@kernel.org>
Cc:     USB mailing list <linux-usb@vger.kernel.org>
Subject: Disconnect race in Gadget core
Message-ID: <20210510152426.GE863718@rowland.harvard.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Felipe:

I just noticed this potential race in the Gadget core, specifically, in 
usb_gadget_remove_driver.  Here's the relevant code:

	usb_gadget_disconnect(udc->gadget);
	if (udc->gadget->irq)
		synchronize_irq(udc->gadget->irq);
	udc->driver->unbind(udc->gadget);
	usb_gadget_udc_stop(udc);

usb_gadget_disconnect will turn off the D+ pull-up, telling the host (or 
upstream hub) that the gadget is no longer connected to the bus.  The 
udc->driver->unbind call then tells the gadget driver that it will no 
longer receive any callbacks from the UDC driver or the gadget core.

Now suppose that at just this moment, the user unplugs the USB cable.  
The UDC driver will notice that the Vbus voltage has gone away and will 
invoke the gadget driver's ->disconnect callback.  After all, it doesn't 
realize it should avoid making these callbacks until usb_gadget_udc_stop 
has run.

As a result, the gadget driver's disconnect callback may be invoked 
_after_ the driver has been unbound from the gadget.

How should we fix this potential problem?

Alan Stern
