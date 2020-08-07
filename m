Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7FEF823EEB8
	for <lists+linux-usb@lfdr.de>; Fri,  7 Aug 2020 16:09:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726769AbgHGOIt (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 7 Aug 2020 10:08:49 -0400
Received: from netrider.rowland.org ([192.131.102.5]:52589 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1726238AbgHGN7e (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 7 Aug 2020 09:59:34 -0400
Received: (qmail 227415 invoked by uid 1000); 7 Aug 2020 09:59:13 -0400
Date:   Fri, 7 Aug 2020 09:59:13 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Peter Chen <peter.chen@nxp.com>
Cc:     balbi@kernel.org, linux-usb@vger.kernel.org, linux-imx@nxp.com,
        gregkh@linuxfoundation.org,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>
Subject: Re: [PATCH 2/6] USB: UDC: net2280: Fix memory leaks
Message-ID: <20200807135913.GA226516@rowland.harvard.edu>
References: <20200807094151.13526-1-peter.chen@nxp.com>
 <20200807094151.13526-3-peter.chen@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200807094151.13526-3-peter.chen@nxp.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Aug 07, 2020 at 05:41:47PM +0800, Peter Chen wrote:
> From: Alan Stern <stern@rowland.harvard.edu>
> 
> As Anton and Evgeny have noted, the net2280 UDC driver has a problem
> with leaking memory along some of its failure pathways.  It also has
> another problem, not previously noted, in that some of the failure
> pathways will call usb_del_gadget_udc() without first calling
> usb_add_gadget_udc_release().  And it leaks memory by calling kfree()
> when it should call put_device().
> 
> Previous attempts to fix the problems have failed because of lack of
> support in the UDC core for separately initializing and adding
> gadgets, or for separately deleting and freeing gadgets.  The previous
> patch in this series adds the necessary support, making it possible to
> fix the outstanding problems properly.
> 
> This patch adds an "added" flag to the net2280 structure to indicate
> whether or not the gadget has been registered (and thus whether or not
> to call usb_del_gadget()), and it fixes the deallocation issues by
> calling usb_put_gadget() at the appropriate point.
> 
> A similar memory leak issue, apparently never before recognized, stems
> from the fact that the driver never initializes the drvdata field in
> the gadget's embedded struct device!  Evidently this wasn't noticed
> because the pointer is only ever used as an argument to kfree(), which
> doesn't mind getting called with a NULL pointer. In fact, the drvdata
> for gadget device will be written by usb_composite_dev structure if
> any gadget class is loaded, so it needs to use usb_gadget structure
> to get net2280 private data.
> 
> CC: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> Reported-by: Anton Vasilyev <vasilyev@ispras.ru>
> Reported-by: Evgeny Novikov <novikov@ispras.ru>
> Signed-off-by: Alan Stern <stern@rowland.harvard.edu>
> ---
> Changes from RFC:
> - Using usb_gadget structure to get net2280 private data, and
> update commit log accoringly.
> 
>  drivers/usb/gadget/udc/net2280.c | 13 +++++++++----
>  drivers/usb/gadget/udc/net2280.h |  1 +
>  2 files changed, 10 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/usb/gadget/udc/net2280.c b/drivers/usb/gadget/udc/net2280.c
> index 5eff85eeaa5a..0b449f4c2da0 100644
> --- a/drivers/usb/gadget/udc/net2280.c
> +++ b/drivers/usb/gadget/udc/net2280.c
> @@ -3561,7 +3561,9 @@ static irqreturn_t net2280_irq(int irq, void *_dev)
>  
>  static void gadget_release(struct device *_dev)
>  {
> -	struct net2280	*dev = dev_get_drvdata(_dev);
> +	struct usb_gadget	*gadget = container_of(_dev,
> +					struct usb_gadget, dev);
> +	struct net2280	*dev = container_of(gadget, struct net2280, gadget);

In fact, this can be done in one step:

	struct net2280	*dev = container_of(_dev, struct net2280, gadget.dev);

The same is true for the net2272 patch and your cdns3 patch, if you want 
to change it.

Alan Stern
