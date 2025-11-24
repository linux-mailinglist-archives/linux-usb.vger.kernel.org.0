Return-Path: <linux-usb+bounces-30869-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 459B3C816E1
	for <lists+linux-usb@lfdr.de>; Mon, 24 Nov 2025 16:51:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 2CE4C345635
	for <lists+linux-usb@lfdr.de>; Mon, 24 Nov 2025 15:51:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29E05314A8A;
	Mon, 24 Nov 2025 15:51:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="MrSWF12P"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DD8D264614;
	Mon, 24 Nov 2025 15:51:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763999484; cv=none; b=RVIF5ThHLFki3LBZ4aiDmXLlcKUUpZ6bOuLRJzlChtHADaw+fwfzwwDW21MX9EXuTP1zWMLgj8AF7DDrRvNvtF7TUlc4GiLVeD2jy1qXVc62hIbZBgj8ssbxxijQRnMsB8emM9Pdjvsp8muP4iMDZ+I7uKtu4/bN6WUEhWgCuCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763999484; c=relaxed/simple;
	bh=frXpG5kwMr8SBQJYBeyf+rZVJnQYRL42cJ2+Bu3jzWo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aBvuVd8dZ3wbQGRoMbLVCXwXX+F5U3HjoGMQarTvS+WiyL5yY1NfRM4HpdNunWjmCQM4GUSNT1xD6lUhfJcX2Y4E6cppGO7aI6O5CWQEsOZU6k7EZn15hd6KuBBYS1mtXnZ7SsoknhfFA8n+ycjIgj0YGJt9bHbUvk4JtfMRRj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=MrSWF12P; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D1E2C4CEF1;
	Mon, 24 Nov 2025 15:51:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1763999484;
	bh=frXpG5kwMr8SBQJYBeyf+rZVJnQYRL42cJ2+Bu3jzWo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MrSWF12PcZmh9+nuOfzAhO3OjCgyHQL5jx/4J4ok+JL+xPvvDUDZfYM8mr5Qf7zGH
	 627zsq3YaAkiKCHTM92PmhIzTMM+EckADaiVl7kXjo/X36ErPhn1LRqCYAko4PMxN7
	 ZX/xqWpLsauRzFd/MXKaktxlplyciJcxhn7HHpDw=
Date: Mon, 24 Nov 2025 16:51:21 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Pin-yen Lin <treapking@chromium.org>
Cc: jerry xzq <jerry.xzq@gmail.com>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] USB: of: filter disabled device node
Message-ID: <2025112426-seventeen-duvet-d9c4@gregkh>
References: <20251122112539.4130712-1-jerry.xzq@gmail.com>
 <CAD48c-UjbPK4GewGpVVdEY30fhnhdAGQqrXQ3r0RgHc6suMo7Q@mail.gmail.com>
 <2025112237-brush-unseemly-7a95@gregkh>
 <CAEXTbpeKUMJKz-PV-ft5WCg5TYo22knBaMX2WwCWn=ix4OgX+g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAEXTbpeKUMJKz-PV-ft5WCg5TYo22knBaMX2WwCWn=ix4OgX+g@mail.gmail.com>

On Mon, Nov 24, 2025 at 10:22:18PM +0800, Pin-yen Lin wrote:
> Hi Greg,
> 
> On Mon, Nov 24, 2025 at 10:01 PM Greg KH <gregkh@linuxfoundation.org> wrote:
> >
> > On Sat, Nov 22, 2025 at 07:31:47PM +0800, jerry xzq wrote:
> > > On Sat, Nov 22, 2025 at 7:26 PM Zhengqiao Xia <jerry.xzq@gmail.com> wrote:
> > >
> > > > We should not point the of_node of a USB device to a disabled devicetree
> > > > node. Otherwise, the interface under this USB device will not be able
> > > > to register.
> > > >
> > > > Signed-off-by: Zhengqiao Xia <jerry.xzq@gmail.com>
> > > > ---
> > > >  drivers/usb/core/of.c | 3 +++
> > > >  1 file changed, 3 insertions(+)
> > > >
> > > > diff --git a/drivers/usb/core/of.c b/drivers/usb/core/of.c
> > > > index 763e4122ed5b3..6bb577e711811 100644
> > > > --- a/drivers/usb/core/of.c
> > > > +++ b/drivers/usb/core/of.c
> > > > @@ -31,6 +31,9 @@ struct device_node *usb_of_get_device_node(struct
> > > > usb_device *hub, int port1)
> > > >                 if (of_property_read_u32(node, "reg", &reg))
> > > >                         continue;
> > > >
> > > > +               if (!of_device_is_available(node))
> > > > +                       continue;
> > > > +
> > > >                 if (reg == port1)
> > > >                         return node;
> > > >         }
> > > > --
> > > > 2.34.1
> > > >
> > > >  Supplementing questions from the previous email:
> > >
> > > > What changed to require this?  What commit id does this fix?
> > > > And what devices have a disabled devicetree node?
> > >
> > > fixes: 01fdf179f4b064d4c9d30(usb: core: skip interfaces disabled in
> > > devicetree )
> > >
> > > Connect a USB device directly to the USB port, for me, LTE RW101.
> >
> > Why?  Why not just us the normal USB device topology?  Why is this in DT
> > at all?
> 
> In our use case, the USB hub and the USB devices (e.g., modem card,
> USB camera) are fixed on the board, and describing them allows us to:
> (1) Describe the extra resources for the USB devices, like the usages
> in drivers/misc/onboard_usb_dev.c. They are mostly USB hubs that
> require extra power or reset pin, but there are also USB device
> usages.

The USB devices should NOT be in DT at all, only for hub controls that
you need the extra pin controls please.

> (2) Let the userspace know which devices are fixed on the board, which
> makes it trustable.

There is different ways to do this, NOT in dt.

> > > However, a disabled node is attached to the DTS node of this port.
> >
> > Why?
> 
> This is the usage from a downstream DTS that hasn't been upstreamed.

There's nothing we can do about that.  Please work to get it upstream.

> The USB hub and devices are defined in a DTSI file, and another DTS
> inherits it but wants to disable those USB devices. We expected that
> disabling them should be the same as removing them.

No, just disable them from userspace properly.

> > > &xhci3 {
> > >         status = "okay";
> > >
> > >         /* 2.x hub on port 1 */
> > >         usb_hub_2_x: hub@1 {
> > >                 compatible = "usbbda,5411";
> > >                 reg = <1>;
> > >                 vdd-supply = <&pp3300_s3>;
> > >                 peer-hub = <&usb_hub_3_x>;
> > >                 status = "disabled";
> > >
> > >                 ports {
> > >                         #address-cells = <1>;
> > >                         #size-cells = <0>;
> > >                         port@1 {
> > >                                 reg = <1>;
> > >                                 usb_hub_dsp1_hs: endpoint { };
> > >                         };
> > >                         port@2 {
> > >                                 reg = <2>;
> > >                                 usb_hub_dsp2_hs: endpoint { };
> > >                         };
> > >                         port@3 {
> > >                                 reg = <3>;
> > >                                 usb_hub_dsp3_hs: endpoint { };
> > >                         };
> > >                         port@4 {
> > >                                 reg = <4>;
> > >
> > >                                 /* On-board WWAN card */
> > >                                 usb_hub_dsp4_hs: endpoint { };
> >
> > That's the thing I don't want to see, why is that WWAN card described
> > here?  Why can't the normal USB device discovery find it and use it
> > properly?
> >
> > >                         };
> > >                 };
> > >         };
> > >
> > > Based on the current code, the of_node of this directly connected LTE
> > > device is hub.
> >
> > But why is that needed?
> >
> > > If there is only one LTE interface, then the of_node of this interface
> > > is also the hub.
> >
> > Again, why?
> 
> We haven't had a driver for the LTE card on the linux mainline.

Why is it not merged upstream?  That should be a very simple thing to
get accepted.

> But,
> it is using M.2 USB interface and requires reset and enable pins, so I
> believe we want to describe it as a USB device in DT, and implement
> the resource control in onboard_usb_dev.c.

No, that is not how USB devices work, they should control themselves.

thanks,

greg k-h

