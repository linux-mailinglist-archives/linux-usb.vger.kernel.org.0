Return-Path: <linux-usb+bounces-31235-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D5CE8CAB320
	for <lists+linux-usb@lfdr.de>; Sun, 07 Dec 2025 10:22:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CA4F43002689
	for <lists+linux-usb@lfdr.de>; Sun,  7 Dec 2025 09:22:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B3652EC0A1;
	Sun,  7 Dec 2025 09:22:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dm+3ITeT"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEDC722173D
	for <linux-usb@vger.kernel.org>; Sun,  7 Dec 2025 09:22:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765099377; cv=none; b=u30iNYDiaadcZMWDHVp72XGCwNS41tpEn/iozTcB7mu2MyCB7W0biH1pCquKgKGLhpsVXMqhSTlgMnuCJfU1O2cdSDWeNQc8wOBiDwIw0RrIcwlnr+dMZ4acEi0ZiiipzLOryUTL5xxvtQpcH1VcRgtE2ObqItw0wgOTdK2PPpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765099377; c=relaxed/simple;
	bh=SXF0bE9nLp3M0vBH9bJ2nGAxuDIoAMqYXu8nmQYv3xs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RBZo/kMhg+s6hHPvpPQx15CQLeonAMMltb5SKZlSnflv0CsbAC8IOzEFNgXXzCoYAuz1uf2DWzKFHWKyIG6NF8231HkabOBYHUWuNz/pNsLUTrhInfe0TafxIaPNXEyPiMix1c5UUzZR0HIk1VHt6brw+B8dODehV8557JFNFL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dm+3ITeT; arc=none smtp.client-ip=209.85.210.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-7c765f41346so2024912a34.3
        for <linux-usb@vger.kernel.org>; Sun, 07 Dec 2025 01:22:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765099373; x=1765704173; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3f33dqJphsE+SQ1QjST+HL8RoULsgS/U0uQYE+SHE48=;
        b=dm+3ITeTLPeaStDCUgMikc9kDOzaHiVjVhr73BAWRmctOpSWEEsQ+cqf2jtSCiwvo9
         n4jq+e2nw4vK4BSBB75Mfqt8d8D6C1WyAr3kbv6zvBoTBIO54Hx2b9PHLh/mFnqWiet1
         i7WGMjNSsPIiN7TePjsEwpaCiqRxG97pq4d2uKbhpjvDhtaZTmXNEqsRFKYXEM2WOxI3
         Rz0AxDwUMWre0q0IiYXZHKanb9LjWeLXgSlklZNAOPVQdpIWcCLMJbD/cso1KoGSCCLg
         LYgSxPKTkmU+6qWsmIK4JdWbZQM1v18g6XSFCo/eAePUE/Ibi2IuuKipbVEuDFrzNkv7
         3p5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765099373; x=1765704173;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3f33dqJphsE+SQ1QjST+HL8RoULsgS/U0uQYE+SHE48=;
        b=ZqFn/odc4LSWRfHcxXQrPsJ+GMMWXMjU62PSIBUTJRu+H4jIWgBPytjIZk/Z2ViBky
         FVGNLpr5dCCpxQSlRxaQF15vKeEqwxgcP89OTLwxZFIuuAS2FrEp9tCejqrSdbbMa2xv
         53bAL7cx57Ew+ZZlQomEmphrprwX8MXA7EqWQ9vPN2ozqE++JQh3NSDw0QzLjGF+29OA
         HB0bfN9CnsXRxHG9o4I1GkmEi2lxo6LHLSwkYal3Cb5+MecZ+bjUCctIend0DKRb+4yD
         XjijAWXvQyJpdofnnyLgvF5AlrBC5DuxRRBjXLmc0lNBEDNOlEnZ8UPmI2ZFOmwAHXVM
         7PPA==
X-Gm-Message-State: AOJu0YwofA6RgoYce9oLJUCvZOuVrLCzDyxNSCsCoUjqbW2ZiJP/e+qW
	0a8T+/CBB8JiqAZwym1NzHFanhzGrZ9VGgF24qu0fP9Spb9fkFXtDZi+XPaYpTwahjQn8HZjdR4
	Fw1OOxQee0vY61WsQ6rbg7ULLCH3NGQo=
X-Gm-Gg: ASbGncsZY2Ji5Pcr5Ldfns2f6vgnZMUOO7s2QrE6v8lQtVt27q3bfTf3E2Dg3xIGvl9
	HEImeRz/VJawTFwR7w6NowgKa6R6n/+sFgqt/V03mQuqe6xXKuGOVCNLlPI6Iv85sy2MWGS0dF5
	y0M0/MybcQZgC7BzTcG3o4aJYgDHpE+CMF74tPAdydTTQyKpGuicgPvlIdGjOLLYu65o7+7W5TG
	uYKAnWSGRcayOGX66OSSV0fLQPfglilCg8/iyS2GiqCaJtzXIbhwbruS14B0RX5kaLl+CbD
X-Google-Smtp-Source: AGHT+IGyKUattn9s3SmZXhNvs3NidS+/VROOkU0YLZVIWb05wRTsv3AjdxI6yvRip0kvT0X682u/6MxjcOTSjkNByPI=
X-Received: by 2002:a05:6808:1507:b0:450:c0ef:8092 with SMTP id
 5614622812f47-4539e0749dfmr1928446b6e.34.1765099372928; Sun, 07 Dec 2025
 01:22:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <2025120708-header-startling-ffaf@gregkh> <20251207012059.7899-1-johannes.bruederl@gmail.com>
 <20251207084012.7c232e52.michal.pecio@gmail.com>
In-Reply-To: <20251207084012.7c232e52.michal.pecio@gmail.com>
From: =?UTF-8?Q?Johannes_Br=C3=BCderl?= <johannes.bruederl@gmail.com>
Date: Sun, 7 Dec 2025 10:22:41 +0100
X-Gm-Features: AQt7F2oMSq1zK2LNeGYURkBBbGUoWZjBc9KKbPB-lDwwYnbo_ClxDzLYIFo5Dfw
Message-ID: <CAP=XvD+dNNDj75DYjjByE3o7F8i-QxusAdz-5+hG24fCesWYRw@mail.gmail.com>
Subject: Re: [PATCH v2] usb: core: add USB_QUIRK_NO_BOS for devices that hang
 on BOS descriptor
To: Michal Pecio <michal.pecio@gmail.com>
Cc: linux-usb@vger.kernel.org, gregkh@linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Dec 7, 2025 at 8:40=E2=80=AFAM Michal Pecio <michal.pecio@gmail.com=
> wrote:
>
> On Sun,  7 Dec 2025 02:20:59 +0100, Johannes Br=C3=BCderl wrote:
> > v2: Return -ENOMSG instead of 0 to properly indicate no BOS data.
>
> Probably good idea.
>
> > Tested unbind/rebind via /sys/bus/usb/drivers/usb/unbind - works
> > correctly. Userspace tools (lsusb) handle missing BOS gracefully
> > (no BOS section shown).
>
> I thought that lsusb never shows BOS, unless you run it as root, and
> then it issues control requests to the device to fetch it directly?
>
> And the other user tried it and reported that it worked just fine.
> Do you see the same behavior on yours?
>
> > Before (device hangs at SuperSpeed Plus, then re-enumerates at lower sp=
eed
> > with different product ID 009c):
> >
> > [    3.284990] usb 2-2: new SuperSpeed Plus Gen 2x1 USB device number 2=
 using xhci_hcd
> > [    8.574542] usb 2-2: unable to get BOS descriptor or descriptor too =
short
> > [    8.600018] usb 2-2: unable to read config index 0 descriptor/start:=
 -71
> > [    8.600027] usb 2-2: can't read configurations, error -71
> > [    8.998412] usb 2-2: Device not responding to setup address.
> > [    9.215157] usb 2-2: Device not responding to setup address.
> > [    9.422737] usb 2-2: device not accepting address 3, error -71
> > [   10.990897] usb 2-2: new SuperSpeed USB device number 5 using xhci_h=
cd
> > [   11.065869] usb 2-2: LPM exit latency is zeroed, disabling LPM.
>
> I wonder if this means that the BOS descriptor returned during
> SuperSpeed enumeration is bogus?
>
> What BOS shows up if you run 'lsusb -v' as root after the device
> completes enumeratation at SuperSpeed?

Hi Michal,
thanks, I forgot to use root previously when running lsusb -v.

Here's the BOS Descriptor section when running w/ root.
This is without this patch, so it "reconnected" with SuperSpeed (5Gbps).

Binary Object Store Descriptor:
  bLength                 5
  bDescriptorType        15
  wTotalLength       0x0016
  bNumDeviceCaps          2
  USB 2.0 Extension Device Capability:
    bLength                 7
    bDescriptorType        16
    bDevCapabilityType      2
    bmAttributes   0x00000000
      (Missing must-be-set LPM bit!)
  SuperSpeed USB Device Capability:
    bLength                10
    bDescriptorType        16
    bDevCapabilityType      3
    bmAttributes         0x00
    wSpeedsSupported   0x000e
      Device can operate at Full Speed (12Mbps)
      Device can operate at High Speed (480Mbps)
      Device can operate at SuperSpeed (5Gbps)
    bFunctionalitySupport   3
      Lowest fully-functional device speed is SuperSpeed (5Gbps)
    bU1DevExitLat           0 micro seconds
    bU2DevExitLat           0 micro seconds

(Missing must-be-set LPM bit!) seems to be weird? As it looks like
just nulled data.
The device seems to generally show problematic behavior when it comes
to the BOS, both on SuperSpeed Plus and SuperSpeed.

BR,
Johannes

