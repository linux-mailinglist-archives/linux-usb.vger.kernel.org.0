Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E5F882FB87
	for <lists+linux-usb@lfdr.de>; Thu, 30 May 2019 14:25:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727163AbfE3MZt (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 30 May 2019 08:25:49 -0400
Received: from mail.kernel.org ([198.145.29.99]:33670 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727147AbfE3MZt (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 30 May 2019 08:25:49 -0400
Received: from localhost (ip67-88-213-2.z213-88-67.customer.algx.net [67.88.213.2])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C094A258B0;
        Thu, 30 May 2019 12:25:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1559219148;
        bh=tqtA7clOJM5AZ65r3KdPHuiSBsDSQNKZ4k0bzsmPEoQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=PpfTAeyg6eO7kT9Kxqx1jZnsYoc0Wk3CmIR51zzONeY+qThPIBd9pQRu+Z1EdZDOm
         Fy+c2gS9pPppS1g2lJmoAZt3GzR2pIMa8NTcSelZVEmEE0ATEhTP2C7Ug+yuCGabez
         esXgcqZlAOlYpUcWBtX9i7i5q1X2jmbRy8U2Gz5k=
Date:   Thu, 30 May 2019 05:25:48 -0700
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Peter Chen <peter.chen@nxp.com>
Cc:     linux-usb@vger.kernel.org, linux-imx@nxp.com,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Jun Li <jun.li@nxp.com>
Subject: Re: [PATCH v2 1/1] usb: chipidea: udc: workaround for endpoint
 conflict issue
Message-ID: <20190530122548.GA17070@kroah.com>
References: <20190530085039.34557-1-peter.chen@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190530085039.34557-1-peter.chen@nxp.com>
User-Agent: Mutt/1.12.0 (2019-05-25)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, May 30, 2019 at 04:50:39PM +0800, Peter Chen wrote:
> An endpoint conflict occurs when the USB is working in device mode
> during an isochronous communication. When the endpointA IN direction
> is an isochronous IN endpoint, and the host sends an IN token to
> endpointA on another device, then the OUT transaction may be missed
> regardless the OUT endpoint number. Generally, this occurs when the
> device is connected to the host through a hub and other devices are
> connected to the same hub.
> 
> The affected OUT endpoint can be either control, bulk, isochronous, or
> an interrupt endpoint. After the OUT endpoint is primed, if an IN token
> to the same endpoint number on another device is received, then the OUT
> endpoint may be unprimed (cannot be detected by software), which causes
> this endpoint to no longer respond to the host OUT token, and thus, no
> corresponding interrupt occurs.
> 
> There is no good workaround for this issue, the only thing the software
> could do is numbering isochronous IN from the highest endpoint since we
> have observed most of device number endpoint from the lowest.
> 
> Cc: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> Cc: Jun Li <jun.li@nxp.com>
> Signed-off-by: Peter Chen <peter.chen@nxp.com>
> ---
> Changes for v2:
> - Improve the code sytle
> 
>  drivers/usb/chipidea/udc.c | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
> 
> diff --git a/drivers/usb/chipidea/udc.c b/drivers/usb/chipidea/udc.c
> index 829e947cabf5..21c1344bfc42 100644
> --- a/drivers/usb/chipidea/udc.c
> +++ b/drivers/usb/chipidea/udc.c
> @@ -1622,6 +1622,28 @@ static int ci_udc_pullup(struct usb_gadget *_gadget, int is_on)
>  static int ci_udc_start(struct usb_gadget *gadget,
>  			 struct usb_gadget_driver *driver);
>  static int ci_udc_stop(struct usb_gadget *gadget);
> +
> +
> +/* Match ISOC IN from the highest endpoint */
> +static struct usb_ep *ci_udc_match_ep(struct usb_gadget *gadget,
> +			      struct usb_endpoint_descriptor *desc,
> +			      struct usb_ss_ep_comp_descriptor *comp_desc)
> +{
> +	struct ci_hdrc *ci = container_of(gadget, struct ci_hdrc, gadget);
> +	struct usb_ep *ep;
> +	u8 type = desc->bmAttributes & USB_ENDPOINT_XFERTYPE_MASK;
> +
> +	if ((type == USB_ENDPOINT_XFER_ISOC) &&

usb_endpoint_xfer_isoc()?

> +			(desc->bEndpointAddress & USB_DIR_IN)) {

usb_endpoint_dir_in()?

thanks,

greg k-h
