Return-Path: <linux-usb+bounces-3370-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AD7427FA65E
	for <lists+linux-usb@lfdr.de>; Mon, 27 Nov 2023 17:29:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 68B2B28198A
	for <lists+linux-usb@lfdr.de>; Mon, 27 Nov 2023 16:29:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1AE0364C0;
	Mon, 27 Nov 2023 16:29:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="cXZDY253"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com [IPv6:2607:f8b0:4864:20::b31])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1BCA5CE
	for <linux-usb@vger.kernel.org>; Mon, 27 Nov 2023 08:29:01 -0800 (PST)
Received: by mail-yb1-xb31.google.com with SMTP id 3f1490d57ef6-db35caa1749so3942568276.2
        for <linux-usb@vger.kernel.org>; Mon, 27 Nov 2023 08:29:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1701102540; x=1701707340; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=i70tntcGFXXrEjgo++8Q6tFowckjpLWeV9hv9uXKYaM=;
        b=cXZDY2536itPDE7PfXTWEbUbOkFgqOcwJI7VnOisF1flRRAZhcwHFcV63m2oLNHb5N
         ndXJVc7U8CZiJ0YUV0V7CuAnXuWV6emssx43Rhr5Y91B52v6umhWH1Tm3za2TqVTzqMV
         3/F+JJ4ojKAOp9azsK8pOMdcNROb4qRfyR/EQplABsKQRYuWbpNkVtqqf/sh1euusfzX
         S7HDrCSGsFtVZIMa3gpDMc0IrxikXi5bH98VC1F32r99u9/J1iK4v1A57jOss7TA+MJf
         yIXUX2eSoVPdsqw5EzT2yfHwb04A3py2eedK6c4vtXQ3vuhaYlEN5qScdPz4tXGYX8Ug
         V0yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701102540; x=1701707340;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i70tntcGFXXrEjgo++8Q6tFowckjpLWeV9hv9uXKYaM=;
        b=Bm+ZXzYz04IKhtR3qEcfQkhQuEOuBDfSvyHfsFf5PNoSBbK+kYigP+yyAkl/2BNCz9
         qWJjP8hOnM8SByKNoHV6nfjplKyUBcvCKLKEb0tC87m/jh+Wtz0Cl+81q3yEf1k/zgcI
         hDuSNrfuN0//+uV8tAwc2T+a8Umv/T2IS1QF9EqMQCrGr0Axu8hVAa368xhe7sH/wAsZ
         kuU36m24efdvmYAUOdUyRMa0Ik4LqhKLmHXwZNPZjLPy3NwRmR9mxi9Gz9T9c7EDBaTj
         15DxHEeuK8ODWcLvOK4L5pLqT4pIwuii353yqyA4LTTbHd6vGB7TtAD4hXKVY0AtstTw
         N+FA==
X-Gm-Message-State: AOJu0YyKmo2AjfFFxEQrlzyG/xqANJ/7zCjILKuNFrAvfmS/VU+RFLhr
	MCPWnVMYUQyJb1+fHFHMp9hPOlMW1et2MpVcZTEv+Q==
X-Google-Smtp-Source: AGHT+IECO7V4AYcbg7yNybQqcBKejUQe6X0wJ0B9pkzgEqrXskYntB79d2VRHm4J8BZo27Bj904D9w0enPPVZtjnbSg=
X-Received: by 2002:a25:3626:0:b0:d9c:7d48:3020 with SMTP id
 d38-20020a253626000000b00d9c7d483020mr11734725yba.20.1701102540286; Mon, 27
 Nov 2023 08:29:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231126025612.12522-1-wahrenst@gmx.net> <53e1f6e6-a28e-45af-991e-75b283a21b34@broadcom.com>
 <46320840-09ab-4c86-90c9-bee7b75f248a@gmx.net> <CAMEGJJ3SXHSnasqoMJnshf5Wu92NVi8+NoMdxmMsJH7WH2WjWg@mail.gmail.com>
 <a78f9ba5-ad34-4af2-9817-eeb7dd9d02ef@gmx.net> <CAMEGJJ3PpEgD_davgTn9e+re4hosunU+uj_i5sdKMFNLFR5hBA@mail.gmail.com>
 <624b79b1-f2dc-4f2e-a225-d1623d905b19@gmx.net>
In-Reply-To: <624b79b1-f2dc-4f2e-a225-d1623d905b19@gmx.net>
From: Phil Elwell <phil@raspberrypi.com>
Date: Mon, 27 Nov 2023 16:28:48 +0000
Message-ID: <CAMEGJJ0aL4VDoq06+JGHz9yx5nVvgbNULNKoT07myzVGNiyCoQ@mail.gmail.com>
Subject: Re: [PATCH 0/3] ARM: dts: bcm2711-rpi-cm4-io: Enable xHCI host
To: Stefan Wahren <wahrenst@gmx.net>
Cc: Justin Chen <justin.chen@broadcom.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Mathias Nyman <mathias.nyman@intel.com>, 
	bcm-kernel-feedback-list@broadcom.com, Cyril Brulebois <kibi@debian.org>, 
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 27 Nov 2023 at 12:39, Stefan Wahren <wahrenst@gmx.net> wrote:
>
> Hi Phil,
>
> >>>> Hi Justin,
> >>>>
> >>>> [add Phil]
> >>>>
> >>>> Am 27.11.23 um 07:02 schrieb Justin Chen:
> >>>>> On 11/25/23 6:56 PM, Stefan Wahren wrote:
> >>>>>> In contrast to the Raspberry Pi 4, the Compute Module 4 or the IO board
> >>>>>> does not have a VL805 USB 3.0 host controller, which is connected via
> >>>>>> PCIe. Instead, the BCM2711 on the Compute Module provides the built-in
> >>>>>> xHCI.
> >>>>>>
> >>>>> Does this work? I maintain this built-in xHCI controller internally. I
> >>>>> wasn't aware the Compute Module uses this block.
> >>>> i successful tested this with a CM4 (arm 32 bit,
> >>>> multi_v7_lpae_defconfig) with eMMC. Before this series the USB devices
> >>>> (mouse, keyboard) connected to the host interface didn't work. After
> >>>> comparing vendor DTS with mainline i noticed the missing xHCI block [1].
> >>>> Unfortunately i wasn't able to get further information from the public
> >>>> datasheets. I don't know if the VideoCore does some magic tricks on the
> >>>> xHCI or i missed some downstream xHCI changes.
> >>>>
> >>>>> This block is held in reset and needs a bit toggled to get things
> >>>>> going. Florian, just to confirm, this is our "brcm,xhci-brcm-v2" block
> >>>>> correct?
> >>>>>
> >>>>> Justin
> >>>> [1]  -
> >>>> https://github.com/raspberrypi/linux/blob/rpi-6.1.y/arch/arm/boot/dts/bcm2711-rpi-ds.dtsi#L119
> >>> What's the question here? Does the XHCI block present in the
> >>> raspberrypi/linux dtsi file really exist? Yes it does.
> >> since i don't have any documentation about the xHCI block, i assumed the
> >> compatible generic-xhci is correct. But Justin seems to suggest that the
> >> xHCI block needs some special treatment and we need a specific compatible.
> >>
> >> Did i missed some xHCI driver changes?
> >> Does the VC firmware something to the xHCI especially on CM4?
> > The firmware switches the on-board USB pins from DWC-OTG to XHCI if
> > otg_mode=1 is set in config.txt, or if booting over USB MSD.
> is this pinctrl/pinmux available from ARM via 0x7e200000 or a different
> IO address?

It's in a different, undocumented block.

Phil

