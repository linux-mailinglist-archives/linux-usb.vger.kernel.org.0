Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EFA0F321BCE
	for <lists+linux-usb@lfdr.de>; Mon, 22 Feb 2021 16:48:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231161AbhBVPsK (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 22 Feb 2021 10:48:10 -0500
Received: from mail.kernel.org ([198.145.29.99]:60546 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231370AbhBVPsD (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 22 Feb 2021 10:48:03 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 630CF64E24;
        Mon, 22 Feb 2021 15:47:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614008840;
        bh=fShdMEHqdIYWDkjLvCRnUwkQHgDcPkfwGLHGj2lnCkE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Vx3pCzUiOBzlJMLnzrPdg9Tzl/PKzBUEqIt7/jVbm5S/c3me0Ha1BIXGvo7p97SSa
         ryb32uJxHikBtil+E3AJi1luyD+KL3gpivhT2HdIkwsVvHYWN8kMDL1EuggbUdKTmI
         7Th7xo6Sax+LyK+x+K2qBza00mbbaKaRVYw24IRhdsOdhq0Wf/JdwzQyPEiIYgvAj8
         lgPY3aMIUBRsjw5/Lj0SRDVBp7wLmTEoRPy3yhA3qD6WzG+RTrYvmo0Pe9nlNBPcJ/
         AAutriZcyiNWZXXlgtGrF8NueVd4pnn/Id3XcO05I7IkFB9yGwA1OM0YaLmjjtBb2o
         UaotkCPKqJvOg==
Received: from johan by xi.lan with local (Exim 4.93.0.4)
        (envelope-from <johan@kernel.org>)
        id 1lEDQu-00063s-7N; Mon, 22 Feb 2021 16:47:36 +0100
Date:   Mon, 22 Feb 2021 16:47:36 +0100
From:   Johan Hovold <johan@kernel.org>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Manivannan Sadhasivam <mani@kernel.org>,
        gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, patong.mxl@gmail.com,
        linus.walleij@linaro.org, angelo.dureghello@timesys.com
Subject: Re: [PATCH v5 1/3] usb: serial: Add MaxLinear/Exar USB to Serial
 driver
Message-ID: <YDPSGE5vLphfFNJn@hovoldconsulting.com>
References: <20201122170822.21715-1-mani@kernel.org>
 <20201122170822.21715-2-mani@kernel.org>
 <YAlVLOqzx8otPgOg@hovoldconsulting.com>
 <20210126154604.GC29751@thinkpad>
 <YBBCvHvduivta07b@hovoldconsulting.com>
 <20210222161119.0bd70a2b@coco.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210222161119.0bd70a2b@coco.lan>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Feb 22, 2021 at 04:27:34PM +0100, Mauro Carvalho Chehab wrote:
> Hi Johan,
> 
> Em Tue, 26 Jan 2021 17:26:36 +0100
> Johan Hovold <johan@kernel.org> escreveu:
> 
> > On Tue, Jan 26, 2021 at 09:16:04PM +0530, Manivannan Sadhasivam wrote:
> > > On Thu, Jan 21, 2021 at 11:19:24AM +0100, Johan Hovold wrote:  
> > > > On Sun, Nov 22, 2020 at 10:38:20PM +0530, Manivannan Sadhasivam wrote:  
> > > > > Add support for MaxLinear/Exar USB to Serial converters. This driver
> > > > > only supports XR21V141X series but it can be extended to other series
> > > > > from Exar as well in future.  

> I'm now facing an issue with this driver. I have here two different
> boards with those USB UART from MaxLinear/Exar.
> 
> The first one is identical to Mani's one:
> 	USB_DEVICE(0x04e2, 0x1411)
> The second one is a different version of it:
> 	USB_DEVICE(0x04e2, 0x1424)
> 
> By looking at the final driver merged at linux-next, it sounds that
> somewhere during the review of this series, it lost the priv struct,
> and the xr_probe function. It also lost support for all MaxLinear/Exar
> devices, except for just one model (04e2:1411).
> 
> The original submission:
> 
> 	https://lore.kernel.org/linux-usb/20180404070634.nhspvmxcjwfgjkcv@advantechmxl-desktop
> 
> And the manufacturer's Linux driver on their website:
> 
> 	https://www.maxlinear.com/support/design-tools/software-drivers
> 
> Had support for other 12 different models of the MaxLinear/Exar USB
> UART. 

IIRC Manivannan only had access to one of these models and his original
submission (based on the patch you link to above) didn't include support
for the others. And keeping the type abstraction didn't make sense for
just one model.

> Those are grouped into 5 different major types:
> 
> 	+	init_xr2280x_reg_map();
> 	+	init_xr21b142x_reg_map();
> 	+	init_xr21b1411_reg_map();
> 	+	init_xr21v141x_reg_map();
> 	+
> 	+	if ((xrusb->DeviceProduct & 0xfff0) == 0x1400)
> 	+		memcpy(&(xrusb->reg_map), &xr2280x_reg_map,
> 	+			sizeof(struct reg_addr_map));
> 	+	else if ((xrusb->DeviceProduct & 0xFFF0) == 0x1420)
> 	+		memcpy(&(xrusb->reg_map), &xr21b142x_reg_map,
> 	+			sizeof(struct reg_addr_map));
> 	+	else if (xrusb->DeviceProduct == 0x1411)
> 	+		memcpy(&(xrusb->reg_map), &xr21b1411_reg_map,
> 	+			sizeof(struct reg_addr_map));
> 	+	else if ((xrusb->DeviceProduct & 0xfff0) == 0x1410)
> 	+		memcpy(&(xrusb->reg_map), &xr21v141x_reg_map,
> 	+			sizeof(struct reg_addr_map));
> 	+	else
> 	+		rv = -1;
> 
> Note: Please don't be confused by "reg_map" name. This has nothing
>       to do with Linux regmap API ;-)
> 
> What happens is that different USB IDs have different values for
> each register. So, for instance, the UART enable register is set to
> either one of the following values, depending on the value of
> udev->descriptor.idProduct:
> 
> 	xr21b140x_reg_map.uart_enable_addr = 0x00;
> 	xr21b1411_reg_map.uart_enable_addr = 0xc00;
> 	xr21v141x_reg_map.uart_enable_addr = 0x03;
> 	xr21b142x_reg_map.uart_enable_addr = 0x00;
> 
> There are other values that depend on the probing time detection,
> based on other USB descriptors. Those set several fields at the
> priv data that would allow to properly map the registers.
> 
> Also, there are 4 models that support multiple channels. On those,
> there are one pair of register get/set for each channel.
> 
> -
> 
> In summary, while supporting just 04e2:1411 there's no need for
> a private struct, in order to properly support the other models,
> some autodetection is needed. The best way of doing that is to
> re-add the .probe method and adding a priv struct.
> 
> As I dunno why this was dropped in the first place, I'm wondering
> if it would be ok to re-introduce them.

Sure. It was just not needed if we were only going to support one model.

> To be clear: my main focus here is just to avoid needing to use 
> Windows in order to use the serial console of the hardware with
> the 0x1424 variant ;-)
> 
> I can't test the driver with the other hardware, but, IMHO, instead
> of adding a hack to support 0x1424, the better (but more painful)
> would be to re-add the auto-detection part and support for the
> other models.

Sounds good to me. 

Johan
