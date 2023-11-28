Return-Path: <linux-usb+bounces-3416-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4142E7FBD18
	for <lists+linux-usb@lfdr.de>; Tue, 28 Nov 2023 15:46:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EB3C0282CD1
	for <lists+linux-usb@lfdr.de>; Tue, 28 Nov 2023 14:46:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3C295B5BD;
	Tue, 28 Nov 2023 14:46:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="Ow16Q7sg"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yw1-x112d.google.com (mail-yw1-x112d.google.com [IPv6:2607:f8b0:4864:20::112d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 945E3D62
	for <linux-usb@vger.kernel.org>; Tue, 28 Nov 2023 06:46:41 -0800 (PST)
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-5d0572434afso20421317b3.1
        for <linux-usb@vger.kernel.org>; Tue, 28 Nov 2023 06:46:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1701182801; x=1701787601; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4Q/moD1HPV0hXuVQmjjgbBf8FXS8oQMIJ2nGE30iwTI=;
        b=Ow16Q7sgnu5LXNMvwd/4xSJ5XWdN4FNHzUIrqKPMkJ16TbM1LQwf0RJwUAp0AUFZrm
         /sUGGMrowFzHX/ExXnms9GNl+W0amKhpkUTzjM06Dv71PLTHMNlSxbvuNmY0ktKEyoQh
         2H28UZRzHrQ4MjsDkRigG2cEfBCPjep4LSPwaP56vY/bEh1G86wOkAPj7YsI2fvFUP8i
         53mMuTaVoJDsi+gvojVKxo1uAVijm5dab1HOnwbJIGVqrKVIXknz3B/Lrk6CbWC2/i7X
         pwk9CXJoRZCU+REdUeD7vUnHHyDbwoyyUptppESqGw2tX26KHK47u694kFnQowQWMPRl
         IC6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701182801; x=1701787601;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4Q/moD1HPV0hXuVQmjjgbBf8FXS8oQMIJ2nGE30iwTI=;
        b=VrUHgBw0ABi6ao99XWyFYtpu1SIh+P439EaBDqwYu1px2yAM35MJgnRhu/ruaV5B9N
         dcJXhHIkx9WkPZ9w5TfUU4YTlCnjwbBmIaPHhIPIVIqsEGMu2tHAMLRuNdNGETWHJrdv
         W1q+ex4XcDnqHvyCLJI6sXbFNE1APwJzzFj3tgGqO5iywHzJLLtGg5yiGsT63W3J3IoJ
         vDqQIF33HTdrMZWs7IP0h4Lju0fic/cRKE/mBI4olizgT22Wm5/UZnEB20Ld5QlNK7Ly
         rb5GTQm7x5xOiTmphwRG9lVB6NKJkFS+bFehp2HdskMHW1y3/aK18UL/Ipk5g6MsAkbB
         d4mQ==
X-Gm-Message-State: AOJu0Yw69/snkAWAdaSuacFD6sGXC56B1cssSEh9XOD3gNv9JzG8vyrx
	3nrl1AvJ1mjGvIuHvsMoT7tUf6aXvvXM2lNDKB/5GA==
X-Google-Smtp-Source: AGHT+IF0gdIBMmCN7xzCkPdVkItSlQZrtQ9wdoaigGcyWr9S9Uz0vx3wYmHCkGPHzq9ZHsHDSECwLLim+EG2g29lBrI=
X-Received: by 2002:a05:690c:2e02:b0:5d1:f8ed:b4c5 with SMTP id
 et2-20020a05690c2e0200b005d1f8edb4c5mr612548ywb.42.1701182800783; Tue, 28 Nov
 2023 06:46:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231126025612.12522-1-wahrenst@gmx.net> <53e1f6e6-a28e-45af-991e-75b283a21b34@broadcom.com>
 <46320840-09ab-4c86-90c9-bee7b75f248a@gmx.net> <CAMEGJJ3SXHSnasqoMJnshf5Wu92NVi8+NoMdxmMsJH7WH2WjWg@mail.gmail.com>
 <a78f9ba5-ad34-4af2-9817-eeb7dd9d02ef@gmx.net> <CAMEGJJ3PpEgD_davgTn9e+re4hosunU+uj_i5sdKMFNLFR5hBA@mail.gmail.com>
 <624b79b1-f2dc-4f2e-a225-d1623d905b19@gmx.net> <CAMEGJJ0aL4VDoq06+JGHz9yx5nVvgbNULNKoT07myzVGNiyCoQ@mail.gmail.com>
 <b8a90433-e0fe-4148-a512-c0e9ace2b4b6@broadcom.com> <91ceed68-fe3a-408c-a858-095d5749b4d2@broadcom.com>
 <10383aa9-942b-415d-b70e-ade3a7aae6fa@gmx.net> <71e96b4e-a0b4-4145-8174-a18cf1ccd06e@broadcom.com>
 <ab4b6629-9e30-4385-bf14-c31223e68769@gmx.net>
In-Reply-To: <ab4b6629-9e30-4385-bf14-c31223e68769@gmx.net>
From: Phil Elwell <phil@raspberrypi.com>
Date: Tue, 28 Nov 2023 14:46:29 +0000
Message-ID: <CAMEGJJ0wEc-X=z9h3coM8abdbTBMet-AK_Eqvfi6px4wuThxEA@mail.gmail.com>
Subject: Re: [PATCH 0/3] ARM: dts: bcm2711-rpi-cm4-io: Enable xHCI host
To: Stefan Wahren <wahrenst@gmx.net>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>, Justin Chen <justin.chen@broadcom.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Mathias Nyman <mathias.nyman@intel.com>, bcm-kernel-feedback-list@broadcom.com, 
	Cyril Brulebois <kibi@debian.org>, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 28 Nov 2023 at 06:44, Stefan Wahren <wahrenst@gmx.net> wrote:
>
>
> Am 27.11.23 um 22:49 schrieb Florian Fainelli:
> > On 11/27/23 11:22, Stefan Wahren wrote:
> >> Hi,
> >>
> >> Am 27.11.23 um 19:41 schrieb Florian Fainelli:
> >>> On 11/27/23 09:44, Justin Chen wrote:
> >>>>
> >>>>
> >>>> On 11/27/23 8:28 AM, Phil Elwell wrote:
> >>>>> On Mon, 27 Nov 2023 at 12:39, Stefan Wahren <wahrenst@gmx.net> wrote:
> >>>>>>
> >>>>>> Hi Phil,
> >>>>>>
> >>>>>>>>>> Hi Justin,
> >>>>>>>>>>
> >>>>>>>>>> [add Phil]
> >>>>>>>>>>
> >>>>>>>>>> Am 27.11.23 um 07:02 schrieb Justin Chen:
> >>>>>>>>>>> On 11/25/23 6:56 PM, Stefan Wahren wrote:
> >>>>>>>>>>>> In contrast to the Raspberry Pi 4, the Compute Module 4 or
> >>>>>>>>>>>> the IO board
> >>>>>>>>>>>> does not have a VL805 USB 3.0 host controller, which is
> >>>>>>>>>>>> connected via
> >>>>>>>>>>>> PCIe. Instead, the BCM2711 on the Compute Module provides the
> >>>>>>>>>>>> built-in
> >>>>>>>>>>>> xHCI.
> >>>>>>>>>>>>
> >>>>>>>>>>> Does this work? I maintain this built-in xHCI controller
> >>>>>>>>>>> internally. I
> >>>>>>>>>>> wasn't aware the Compute Module uses this block.
> >>>>>>>>>> i successful tested this with a CM4 (arm 32 bit,
> >>>>>>>>>> multi_v7_lpae_defconfig) with eMMC. Before this series the USB
> >>>>>>>>>> devices
> >>>>>>>>>> (mouse, keyboard) connected to the host interface didn't work.
> >>>>>>>>>> After
> >>>>>>>>>> comparing vendor DTS with mainline i noticed the missing xHCI
> >>>>>>>>>> block [1].
> >>>>>>>>>> Unfortunately i wasn't able to get further information from the
> >>>>>>>>>> public
> >>>>>>>>>> datasheets. I don't know if the VideoCore does some magic
> >>>>>>>>>> tricks on the
> >>>>>>>>>> xHCI or i missed some downstream xHCI changes.
> >>>>>>>>>>
> >>>>>>>>>>> This block is held in reset and needs a bit toggled to get
> >>>>>>>>>>> things
> >>>>>>>>>>> going. Florian, just to confirm, this is our
> >>>>>>>>>>> "brcm,xhci-brcm-v2" block
> >>>>>>>>>>> correct?
> >>>>>>>>>>>
> >>>>>>>>>>> Justin
> >>>>>>>>>> [1]  -
> >>>>>>>>>> https://github.com/raspberrypi/linux/blob/rpi-6.1.y/arch/arm/boot/dts/bcm2711-rpi-ds.dtsi#L119
> >>>>>>>>>>
> >>>>>>>>>>
> >>>>>>>>> What's the question here? Does the XHCI block present in the
> >>>>>>>>> raspberrypi/linux dtsi file really exist? Yes it does.
> >>>>>>>> since i don't have any documentation about the xHCI block, i
> >>>>>>>> assumed the
> >>>>>>>> compatible generic-xhci is correct. But Justin seems to suggest
> >>>>>>>> that the
> >>>>>>>> xHCI block needs some special treatment and we need a specific
> >>>>>>>> compatible.
> >>>>>>>>
> >>>>>>>> Did i missed some xHCI driver changes?
> >>>>>>>> Does the VC firmware something to the xHCI especially on CM4?
> >>>>>>> The firmware switches the on-board USB pins from DWC-OTG to XHCI if
> >>>>>>> otg_mode=1 is set in config.txt, or if booting over USB MSD.
> >>>>>> is this pinctrl/pinmux available from ARM via 0x7e200000 or a
> >>>>>> different
> >>>>>> IO address?
> >>>>>
> >>>>> It's in a different, undocumented block.
> >>>>>
> >>>>> Phil
> >>>>
> >>>> Well if it works, then maybe I am misunderstanding something here.
> >>>> Maybe its time for me to pick up a CM4 board.
> >>> There is one on my desk that you are welcome to use, or remote into if
> >>> you prefer.
> >>>
> >>> To answer your earlier question, yes this is the same block as the one
> >>> present in 72112 for which we use the "brcm,xhci-brcm-v2" compatible
> >>> string, it would be preferable to have it backed by that compatible
> >>> string in case we happen to support suspend/resume on the Pi 4B one
> >>> day, if nothing else.
> >>>
> >>> I did confirm that after applying Stefan's patches plus changing my
> >>> config.txt to have otg_mode=1, USB continues to be fully functional.
> >>> This is the case with using both "generic-xhci" or "brcm,xhci-brcm-v2"
> >>> so with the minor request to update the compatible to
> >>> "brcm,xhci-brcm-v2", this is:
> >>>
> >>> Tested-by: Florian Fainelli <florian.fainelli@broadcom.com>
> >>>
> >>> Stefan, I am getting a deadlock on boot if I leave your changes in and
> >>> uncomment dwc_otg=1 in config.txt, is there an alias or something that
> >>> the boot loader should be patching?
> >>
> >> sorry but i'm unable reproduce those deadlocks, neither in arm or arm64,
> >> with eMMC or without eMMC, xhci builtin or module. If i uncomment this
> >> in config.txt, USB host is just disabled.
> >
> > Here is my config.txt FWIW:
> >
> > # A bit too verbose
> > uart_2ndstage=1
> > enable_uart=1
> > arm_64bit=1
> > # Custom kernel images
> > kernel=kernel8-upstream.img
> > #kernel=kernel7l.img
> > #device_tree=bcm2711-rpi-4-b-UPSTREAM.dtb
> > device_tree=bcm2711-rpi-cm4-io-UPSTREAM.dtb
> > force_turbo=1
> > # DWC-OTG <=> XHCI
> > #otg_mode=1
> >
> >>
> >> I'm using the following firmware:
> >>
> >> raspberrypi-firmware soc:firmware: Attached to firmware from
> >> 2023-03-17T10:50:39
> >
> > OK, my CM4 is at 2022-07-25T15:10:17, updating to 2023-10-17T15:39:16
> > does not really show any difference.
> >
> >>
> >> Is this DTS difference a problem?
> >
> > It does not appear so, changing the node unit-name does not affect the
> > results.
> >
> >>
> >> upstream   -> xhci: usb@7e9c0000
> >> downstream -> xhci: xhci@7e9c0000
> >
> > Side question: does the VPU boot ROM or firmware take care of
> > configuring the USB PHY somehow? Should not we also have a Device Tree
> > node for it eventually?
>
> Sorry, as the person with the least knowledge about the hardware i
> cannot answer this question. But we should avoid those nop-PHY because
> they have source of regressions in the past.

The EEPROM firmware initialises the USB PHY.

Phil

