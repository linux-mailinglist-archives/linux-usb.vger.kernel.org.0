Return-Path: <linux-usb+bounces-30824-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B504C7CFB4
	for <lists+linux-usb@lfdr.de>; Sat, 22 Nov 2025 13:34:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 2B8014E4C67
	for <lists+linux-usb@lfdr.de>; Sat, 22 Nov 2025 12:34:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D0952AD35;
	Sat, 22 Nov 2025 12:34:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="r9Q9yC01"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06D35DDAB;
	Sat, 22 Nov 2025 12:34:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763814865; cv=none; b=SagI5bzayzEkGi9VNtnvxYDpoNfNo38Pfisuxd6fYDHGLhldXqsCUpwzR6YDGAk9mOwt1lNGyjQr4viOrRKgVWvL3wDzQLIGdWqogRZZy0YCnSWQxWoq3M+vb+wPVabSW3/IsLRVAMcd3rcSuRrhqYhfxGRyMcHzvx1LDqqTOUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763814865; c=relaxed/simple;
	bh=HwWmfcAXgfmoqy8jG01OJU0LrGsdJJ6O1rbCE59VHI0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LdDsE51Pxl6qb4hYdU21iFdwXylkxq1JAJyP09XrUtMpN6hXtLwCcK5jhBpmBhUfMfsFM+OdZ7BFa+ZTQ8pVn+YggtdPIUC1Yu/DJV0IN/rNs5rvNaMP0QFSgyD+19BZlkNt+m4ekOYQH5gD3KQczVoRsQEEClr1iIOnCsYkEGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=r9Q9yC01; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21905C4CEF5;
	Sat, 22 Nov 2025 12:34:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1763814864;
	bh=HwWmfcAXgfmoqy8jG01OJU0LrGsdJJ6O1rbCE59VHI0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=r9Q9yC01K/cWB61C/bT9Os48DYRnxvRAEizA+MIiEdwdyNADEVpbu/t18qcOBNpDH
	 r6hwdFLw+24pYw745ZaZOwNeUDdtAj0t9zlovsKN8/txVVd/S1KW1kpHOqR8/e8soc
	 4//8D6OyLSbxb5ONGCX6l0BSwcgdJIF8SBGkoDUE=
Date: Sat, 22 Nov 2025 13:34:21 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: jerry xzq <jerry.xzq@gmail.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] USB: of: filter disabled device node
Message-ID: <2025112237-brush-unseemly-7a95@gregkh>
References: <20251122112539.4130712-1-jerry.xzq@gmail.com>
 <CAD48c-UjbPK4GewGpVVdEY30fhnhdAGQqrXQ3r0RgHc6suMo7Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD48c-UjbPK4GewGpVVdEY30fhnhdAGQqrXQ3r0RgHc6suMo7Q@mail.gmail.com>

On Sat, Nov 22, 2025 at 07:31:47PM +0800, jerry xzq wrote:
> On Sat, Nov 22, 2025 at 7:26 PM Zhengqiao Xia <jerry.xzq@gmail.com> wrote:
> 
> > We should not point the of_node of a USB device to a disabled devicetree
> > node. Otherwise, the interface under this USB device will not be able
> > to register.
> >
> > Signed-off-by: Zhengqiao Xia <jerry.xzq@gmail.com>
> > ---
> >  drivers/usb/core/of.c | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/drivers/usb/core/of.c b/drivers/usb/core/of.c
> > index 763e4122ed5b3..6bb577e711811 100644
> > --- a/drivers/usb/core/of.c
> > +++ b/drivers/usb/core/of.c
> > @@ -31,6 +31,9 @@ struct device_node *usb_of_get_device_node(struct
> > usb_device *hub, int port1)
> >                 if (of_property_read_u32(node, "reg", &reg))
> >                         continue;
> >
> > +               if (!of_device_is_available(node))
> > +                       continue;
> > +
> >                 if (reg == port1)
> >                         return node;
> >         }
> > --
> > 2.34.1
> >
> >  Supplementing questions from the previous email:
> 
> > What changed to require this?  What commit id does this fix?
> > And what devices have a disabled devicetree node?
> 
> fixes: 01fdf179f4b064d4c9d30(usb: core: skip interfaces disabled in
> devicetree )
> 
> Connect a USB device directly to the USB port, for me, LTE RW101.

Why?  Why not just us the normal USB device topology?  Why is this in DT
at all?

> However, a disabled node is attached to the DTS node of this port.

Why?

> &xhci3 {
>         status = "okay";
> 
>         /* 2.x hub on port 1 */
>         usb_hub_2_x: hub@1 {
>                 compatible = "usbbda,5411";
>                 reg = <1>;
>                 vdd-supply = <&pp3300_s3>;
>                 peer-hub = <&usb_hub_3_x>;
>                 status = "disabled";
> 
>                 ports {
>                         #address-cells = <1>;
>                         #size-cells = <0>;
>                         port@1 {
>                                 reg = <1>;
>                                 usb_hub_dsp1_hs: endpoint { };
>                         };
>                         port@2 {
>                                 reg = <2>;
>                                 usb_hub_dsp2_hs: endpoint { };
>                         };
>                         port@3 {
>                                 reg = <3>;
>                                 usb_hub_dsp3_hs: endpoint { };
>                         };
>                         port@4 {
>                                 reg = <4>;
> 
>                                 /* On-board WWAN card */
>                                 usb_hub_dsp4_hs: endpoint { };

That's the thing I don't want to see, why is that WWAN card described
here?  Why can't the normal USB device discovery find it and use it
properly?

>                         };
>                 };
>         };
> 
> Based on the current code, the of_node of this directly connected LTE
> device is hub.

But why is that needed?

> If there is only one LTE interface, then the of_node of this interface
> is also the hub.

Again, why?

> With the following code, the interface will be unable to create a device.
> 
> if (intf->dev.of_node &&
> !of_device_is_available(intf->dev.of_node)) {
> dev_info(&dev->dev, "skipping disabled interface %d\n",
> intf->cur_altsetting->desc.bInterfaceNumber);
> continue;
> }
> Then this LTE will be unable to create a device.
> this is not the result I wanted.

Then try removing it from dt entirely, it should not be necessary to
describe USB devices in dt.

thanks,

greg k-h

