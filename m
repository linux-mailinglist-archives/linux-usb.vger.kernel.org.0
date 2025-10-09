Return-Path: <linux-usb+bounces-29080-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id AC73BBC8B83
	for <lists+linux-usb@lfdr.de>; Thu, 09 Oct 2025 13:14:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 2CB71351C62
	for <lists+linux-usb@lfdr.de>; Thu,  9 Oct 2025 11:14:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1B5A2DD5EB;
	Thu,  9 Oct 2025 11:14:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MMklCDdH"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CE2325A659
	for <linux-usb@vger.kernel.org>; Thu,  9 Oct 2025 11:14:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760008493; cv=none; b=IWR2jIWZboJHZ4WO5baAVueyv7QdfVnRWA5PhSZ4+UBoskiWn847ioj4mOshSdYjhTwfc5TDuK/TG25pXj7ui8v1Hq7q2/6p1NwoofP1bpAuevaPP0xvjgkAJPtn2tINshRgFuzH6+ShECh3zGzmOCEUZHx3GzSGFg6Z04BShxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760008493; c=relaxed/simple;
	bh=9J9nNWGV7vJp3qLFK66g+Dl/TNTTfEakolL/lYaRMwA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Fo3vD1DLBdbn8X1CsNlM64FzTRTrbgw7atKaFFXKQTlOoh+NonF64nqk6z97e6JMAeCVT+789J4zWCCZRzURXpFVEXiRRfbXi4T4BTtrI9MJV3qrbWP47caHD2r+09NQsUh1TIZGpJdooEsd4j3/H324glHzH8ZFhFGh00NO/j4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MMklCDdH; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-636de696e18so1671864a12.3
        for <linux-usb@vger.kernel.org>; Thu, 09 Oct 2025 04:14:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760008490; x=1760613290; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fLMYgsfNTFFI/O68TRr8vgYO3AsgFRuWnjyuhxCaGCY=;
        b=MMklCDdHQeaMy3MvjfDEzj72alDQWKQaapc42dpQPN6JqP7YpnRoDmWCQhLYvOh4Dw
         kq5T9b6BmkEZDVM8gudoELHsado4AwnvF0ymZ66sFvRW2hMqPNPKu4AtNlBBJEWCgi4o
         NwKkP1zMiipqrP2gZtEatXEVAkfxnj4p8FLx/BsMUIvPnJ27Mr0FsD6vIs/9PyB/HESu
         FbH7NRQ6M/ETBJ1sEJvpKpVTqBH/iReUAhKbVUyTHz1UJAAd0bsub+yunFjtUm8gQWws
         45RADWxKHC+sD80Kup26t7T2dLUynvePQbUi7PFPQTH4eHQB9zt3hSxAyj13sVw58kso
         WweQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760008490; x=1760613290;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fLMYgsfNTFFI/O68TRr8vgYO3AsgFRuWnjyuhxCaGCY=;
        b=O//1pZoBWyR91Hi+4P7KROxUvAsPyzeVYInzE2hk8NQ5zYWn3S/MIcSYKlp/AfOewP
         X2F2jXDVmPbsucjxuFHkG4JFqjujRXVoYFinWO9srzb0We/lRUmk53jPiaKtHLwJXcAl
         xKlMt6LyzeQ1p9k/B7VKsLCiDBqIA5whXkGEHyLwgwUpNA+qFZWPRizAk4BeK+MWetJS
         i5dxfEjbi06AQYkH7kjhZIcINiHlICmW4YJ95BR8eoVgiSHeGEGoOC3m2IeXkMoNitEe
         AjC68EFpGB4oJ6VdDurRjCH8Ww+h53WLxQ/EiSj/2cPMhtEynoq2mCfYqUqEKhk2Ejd9
         3UWA==
X-Gm-Message-State: AOJu0Yyi2B2RU68/QP+YMkZdEnEWDwi0H7crKZqpL2UHM2dayrxjvRfg
	Ya7lK3S/is5d7lnVaBL0azoTJhDec2JYYvLNgyy7caWxgN1oy/cBNjwd
X-Gm-Gg: ASbGncu8386sooGDmkd4X56IBLnof2QtWiotN45gLXPP0OZDkNH+lNon9osLoJG0c5N
	R0uwJ4dzOkgH1kGn5vtQC/4BppQ9DAC0MNZAeIeAaumSt/gtB8pIXbaZMUyX6J0h4nhCl/QlVsM
	KNUQWovAhGAjvciU1cNK0cXL7AkHbQDHymopISQ8WFOdF0H+iYNd2wk3YkZuz+YoHxpgtrKtcSE
	9+5X7JVxpFB6E++KkDI0qvWcfG/7hZ0kxUewgbdHqJBCg/Htm49ohc6+yPDy09WAVscl294KBGr
	Q6G49dauBAe/lYp/bB9/mxA5IK3c2WiOlIeJ+ADE1Xcup/qEhKxCCjogsPkXmp9y09Nohgh4mUT
	l6DYY88JFQVJUl5H7l7MFECg0CCzPewjQCX7ra3djTp56tJN95AzaKPtIA6OJD0WuAY+GOQ==
X-Google-Smtp-Source: AGHT+IE5z2pgz+A7dCNJyyG8QIYblNGkCNhflqCvxeuwB8uHuEdSU3kMGBtjMr8q2Qj/c9XSy1qHwg==
X-Received: by 2002:a17:907:1c15:b0:b4b:4692:6927 with SMTP id a640c23a62f3a-b50aa292d83mr791802766b.23.1760008489434;
        Thu, 09 Oct 2025 04:14:49 -0700 (PDT)
Received: from foxbook (bff184.neoplus.adsl.tpnet.pl. [83.28.43.184])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b4c7396b863sm1148406566b.65.2025.10.09.04.14.48
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Thu, 09 Oct 2025 04:14:48 -0700 (PDT)
Date: Thu, 9 Oct 2025 13:14:44 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Arisa Snowbell <arisa.snowbell@gmail.com>
Cc: linux-usb@vger.kernel.org, regressions@lists.linux.dev, Niklas Neronin
 <niklas.neronin@linux.intel.com>, Mathias Nyman
 <mathias.nyman@linux.intel.com>
Subject: Re: [REGRESSION] [REPRO] USB-A devices not working on boot after
 recent USB merge
Message-ID: <20251009131444.2c221922.michal.pecio@gmail.com>
In-Reply-To: <CABpa4MBDvgJcgJf3_E7k1dBXs7v1tW-79dmc_sQDVM1bES5YDQ@mail.gmail.com>
References: <CABpa4MA9unucCoKtSdzJyOLjHNVy+Cwgz5AnAxPkKw6vuox1Nw@mail.gmail.com>
	<20251007231709.6c16802e.michal.pecio@gmail.com>
	<CABpa4MCUnLUR_0Vzgd=rTr0+Hot=nxHirKrX6xtJWowDoLhWJw@mail.gmail.com>
	<CABpa4MCg7yixe7O8Pp+YwvpxeC=1JPhMhAap12RjtV6pcxFYgQ@mail.gmail.com>
	<20251008082055.5646dadc.michal.pecio@gmail.com>
	<CABpa4MCm8hQXvtSYqUA+Dh3rCLVM5rTC1p+FsgmFemv+Vyz=RA@mail.gmail.com>
	<20251008130532.49922d58.michal.pecio@gmail.com>
	<CABpa4MAsvK68CyQ7bVdie1j2m2O2YAEuFJHq8D-65uFT3FzKzQ@mail.gmail.com>
	<20251008223406.13f16f19.michal.pecio@gmail.com>
	<CABpa4MBGW=OJi+j34TbL2g=zyTg7-rxqpHYfAW-1DXTPk=g5Fw@mail.gmail.com>
	<CABpa4MBDvgJcgJf3_E7k1dBXs7v1tW-79dmc_sQDVM1bES5YDQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 9 Oct 2025 00:25:55 +0200, Arisa Snowbell wrote:
> This is what I get when I use good kernel:
> 
> kernel: xhci_hcd 0000:7a:00.0: xHCI Host Controller
> kernel: xhci_hcd 0000:7a:00.0: new USB bus registered, assigned bus number 9
> kernel: xhci_hcd 0000:7a:00.0: USB3 root hub has no ports
> kernel: xhci_hcd 0000:7a:00.0: hcc params 0x0110ffc5 hci version 0x120
> quirks 0x0000000200000010
> kernel: xhci_hcd 0000:7a:00.0: xHCI Host Controller
> kernel: xhci_hcd 0000:7a:00.0: new USB bus registered, assigned bus number 10
> kernel: xhci_hcd 0000:7a:00.0: Host supports USB 3.0 SuperSpeed
> kernel: usb usb9: New USB device found, idVendor=1d6b, idProduct=0002,
> bcdDevice= 6.17
> kernel: usb usb9: New USB device strings: Mfr=3, Product=2, SerialNumber=1
> kernel: usb usb9: Product: xHCI Host Controller
> kernel: usb usb9: Manufacturer: Linux
> 6.17.0-1-mainline-12298-gf5bd2142c274 xhci-hcd
> kernel: usb usb9: SerialNumber: 0000:7a:00.0
> kernel: hub 9-0:1.0: USB hub found
> kernel: hub 9-0:1.0: 1 port detected
> kernel: usb usb10: We don't know the algorithms for LPM for this host,
> disabling LPM.
> kernel: usb usb10: New USB device found, idVendor=1d6b,
> idProduct=0003, bcdDevice= 6.17
> kernel: usb usb10: New USB device strings: Mfr=3, Product=2, SerialNumber=1
> kernel: usb usb10: Product: xHCI Host Controller
> kernel: usb usb10: Manufacturer: Linux
> 6.17.0-1-mainline-12298-gf5bd2142c274 xhci-hcd
> kernel: usb usb10: SerialNumber: 0000:7a:00.0
> kernel: hub 10-0:1.0: USB hub found
> kernel: hub 10-0:1.0: config failed, hub doesn't have any ports! (err -19)
> 
> where the 2.0 USB's work, mice is powered on, with the bad kernel the
> mice doesn't even power the LED's on.
> In the bad kernel its missing the New USB and all.

Okay, thanks. I now see what's going on.

I have successfully reproduced it on a normal controller by patching
the driver to simply ignore any USB3 ports. With this patch, no root
hubs are registered at all until I revert the "bad" commit.

In my case it's an idiotic little problem:

xhci_pci_common_probe()
{
	usb_hcd_pci_probe() {
		// allocate xhci
		xhci_run(xhci);
	}

	xhci->allow_single_roothub = 1;
}

The thing is that xhci_run() needs allow_single_roothub to already
be set when it executes, but we can't do it before xhci is allocated.
And some non-PCI drivers don't want it to be set.

Can you check if this patch fixes things for you?

It is obviously not a real solution, but it's good enough for xhci_pci
and sufficient to check if no other problems remain in your case.

---
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index 485ea7fc0433..354443316bfb 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -1735,8 +1735,7 @@ static inline bool xhci_hcd_is_usb3(struct usb_hcd *hcd)
 
 static inline bool xhci_has_one_roothub(struct xhci_hcd *xhci)
 {
-	return xhci->allow_single_roothub &&
-	       (!xhci->usb2_rhub.num_ports || !xhci->usb3_rhub.num_ports);
+	return (!xhci->usb2_rhub.num_ports || !xhci->usb3_rhub.num_ports);
 }
 
 #define xhci_dbg(xhci, fmt, args...) \


