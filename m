Return-Path: <linux-usb+bounces-31232-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 363A5CAB28D
	for <lists+linux-usb@lfdr.de>; Sun, 07 Dec 2025 08:40:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 293713007E72
	for <lists+linux-usb@lfdr.de>; Sun,  7 Dec 2025 07:40:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D24622E612E;
	Sun,  7 Dec 2025 07:40:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IR7thdXu"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1EDE1E991B
	for <linux-usb@vger.kernel.org>; Sun,  7 Dec 2025 07:40:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765093220; cv=none; b=njoBKrfAYy+br0ZyeB3lnEGELyplJMolwjTXKj/ZhwDwsI29PDbana4JYoZ3COsYETqDo2/dOX0iQNeA02D4ffI4IKJ5W7FanLC3HEVtdgUd9pF51wsRqgnYOPXn01RnjgaYlOiD9t4mmj8H4HU2v3SIySIKcJJPYWylsINvykU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765093220; c=relaxed/simple;
	bh=tXmJ/JFNSfPF+CvIOumIhtukPDuJWz8lz4TrlDEj/Fo=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=itnJ2FEb6nV12vCDQEMk1v1dRPlIW2Fj0oWeNiQq/5R1KWA12bYVUjzOQiO49xVeExaYiniI/WXPHP7YkcPTSQVmi//G1fcic36W6tMVuLauo4t1f/pBBRGqfPICZ1trRxR7c68rkpXTQEcKMt4JSxYOyf8MYOjWmhDF2BpS20E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IR7thdXu; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-b73b24f1784so657603566b.0
        for <linux-usb@vger.kernel.org>; Sat, 06 Dec 2025 23:40:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765093217; x=1765698017; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lIp/rGJUcot3sKS5Ii5wi+VM+r/ql++A8jXbpEAj19g=;
        b=IR7thdXuVuhKRvTjifO8SRrGAcDFY1ym2KnVqths90OE+GC2XFkKP3tSSqOni3kQuR
         YZz1P9bY4dVYH4rsEUpr6lznquJyGHeWnUBx2wchF/dmsmgmqp3UePM9ahWzxjFd/Ty1
         ilLlANA0rKfW6s4wBE593cwADc0VoRMpJnkrgr46hkShwtVQ+bjx80b2RiRmgYWozVmw
         DlT8BUKUP6ta2Sm59S8hIW+lPhjti2w6qDNsIhm1Dn1x+BN6EzEZB8oWZiUw4CLd/QIL
         sofFVzTQkdv0lKgljdH/kheGdeL4kk6L87CYFKWPdi8kiIMwrRWyM/FFxhfJ6JRvP29u
         kYQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765093217; x=1765698017;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lIp/rGJUcot3sKS5Ii5wi+VM+r/ql++A8jXbpEAj19g=;
        b=XkTkNxzhzycOhiOh4fyMKcGguP7FkwyrHr+IZePovrzzYZzGCpSRjNU45hr2v+ZKU9
         QrXdP9P8jmhkmboH9inA1+JRyB4f62/VMA6kKKZV0UumPyAkTvKPQyBavHVGqd2M4UeC
         pB1NnIvTlBDRCS7/rwIVZpMptCeQXQm4O1DQk1FDxYtwz7YWzkjGeP5A6j83ztaxMqu+
         QOQdDkipWWeiToAIc3kB7LKO5C5k5pDc4L8Dn7EdyhU/IhIx2FRpLmprD4/pHQTqFveY
         vHcoBZBaXv7q4qNU2WbUhjZ67U+OgqVhBYSZ2tPaKd8RcAsrwy7nZr+sGMmx1ZrYen95
         V8xQ==
X-Gm-Message-State: AOJu0YxfPUTjSUAroRqzS5DQiglSCSl+TvkKWkpzn2OtSeRq0/+YZpuR
	cf7w3e6jXM2IfkQw0qFqFQxa5is4rwaoz++rGl8DRM+43p5K1zRhzFOZ
X-Gm-Gg: ASbGncvZPN90lkTrK6KqJc0ihF1AUO985SN63YzNnMwaRs0t/Y/4HX/pBmaJKDJS4CV
	DUq+8eBYr3GzgDNWHLBFUMP7FniMaGNoLhDPLEe1IUVSGKchYPpRl5+GXvV5F18fSwGWHfhliVy
	92zrNDruH0na0DGwCKx6TqU4JG1r1DLo4nyu1PvtOsrtc+0CBoDw5XB4daJRT3uO/DcvI4cVj5p
	ifmsKGa+eea+jUS7v0LZVnS/16ceFiTl2CUujKQyk45zwEVFcdxlC15iDoo9Km/3IQLGqZPiugM
	ik2zufLLKnSYYpvxCBmuo6+nv3+cuvK/PbzDQDe0cKwifAyoGX+AyWphsvuLvLJM6CpSYCZTXgq
	m1t3QKXUJ6MZHwCTfQHuncPtdrFni+2jdJ2vr0/VbJne6b9tVULEbURtJ6S+EXPN+ANduHkjcwr
	2dcmWIWyJzt19VPrh+hplP5Dw=
X-Google-Smtp-Source: AGHT+IEAHsLxaw4fVMXrlnfxtzEev0Xlg1JBcl1rBe2/g7TevQgnAJzlXGIkCspPuLVBFJr1lKkoFQ==
X-Received: by 2002:a17:907:8691:b0:b70:aebe:2ef7 with SMTP id a640c23a62f3a-b79eb5d74ebmr1255800366b.14.1765093216904;
        Sat, 06 Dec 2025 23:40:16 -0800 (PST)
Received: from foxbook (bfg212.neoplus.adsl.tpnet.pl. [83.28.44.212])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7a01a3335dsm632349666b.61.2025.12.06.23.40.16
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Sat, 06 Dec 2025 23:40:16 -0800 (PST)
Date: Sun, 7 Dec 2025 08:40:12 +0100
From: Michal Pecio <michal.pecio@gmail.com>
To: Johannes =?UTF-8?B?QnLDvGRlcmw=?= <johannes.bruederl@gmail.com>
Cc: linux-usb@vger.kernel.org, gregkh@linuxfoundation.org
Subject: Re: [PATCH v2] usb: core: add USB_QUIRK_NO_BOS for devices that
 hang on BOS descriptor
Message-ID: <20251207084012.7c232e52.michal.pecio@gmail.com>
In-Reply-To: <20251207012059.7899-1-johannes.bruederl@gmail.com>
References: <2025120708-header-startling-ffaf@gregkh>
	<20251207012059.7899-1-johannes.bruederl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sun,  7 Dec 2025 02:20:59 +0100, Johannes Br=C3=BCderl wrote:
> v2: Return -ENOMSG instead of 0 to properly indicate no BOS data.

Probably good idea.
=20
> Tested unbind/rebind via /sys/bus/usb/drivers/usb/unbind - works
> correctly. Userspace tools (lsusb) handle missing BOS gracefully
> (no BOS section shown).

I thought that lsusb never shows BOS, unless you run it as root, and
then it issues control requests to the device to fetch it directly?

And the other user tried it and reported that it worked just fine.
Do you see the same behavior on yours?

> Before (device hangs at SuperSpeed Plus, then re-enumerates at lower speed
> with different product ID 009c):
>=20
> [    3.284990] usb 2-2: new SuperSpeed Plus Gen 2x1 USB device number 2 u=
sing xhci_hcd
> [    8.574542] usb 2-2: unable to get BOS descriptor or descriptor too sh=
ort
> [    8.600018] usb 2-2: unable to read config index 0 descriptor/start: -=
71
> [    8.600027] usb 2-2: can't read configurations, error -71
> [    8.998412] usb 2-2: Device not responding to setup address.
> [    9.215157] usb 2-2: Device not responding to setup address.
> [    9.422737] usb 2-2: device not accepting address 3, error -71
> [   10.990897] usb 2-2: new SuperSpeed USB device number 5 using xhci_hcd
> [   11.065869] usb 2-2: LPM exit latency is zeroed, disabling LPM.

I wonder if this means that the BOS descriptor returned during
SuperSpeed enumeration is bogus?

What BOS shows up if you run 'lsusb -v' as root after the device
completes enumeratation at SuperSpeed?

