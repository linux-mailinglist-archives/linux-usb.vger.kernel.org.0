Return-Path: <linux-usb+bounces-22068-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C676A6EB9B
	for <lists+linux-usb@lfdr.de>; Tue, 25 Mar 2025 09:33:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 53EF43A8236
	for <lists+linux-usb@lfdr.de>; Tue, 25 Mar 2025 08:32:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 558AC2528E5;
	Tue, 25 Mar 2025 08:33:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HxAEbcAr"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 217F71946AA
	for <linux-usb@vger.kernel.org>; Tue, 25 Mar 2025 08:32:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742891581; cv=none; b=C13D3SHarDj2hVJI5vJiSm7JlDDOF/oiMNDspxoCeolsdkOw8hLepNukLULhOx0q5G1WEkAFypt/MJgRn7cH/v0+6ZVxDJ9lWA2KGpzqMt7WjANPSNM6RvvY+q7/E+AMVc2fT+jl4ull18kq6DzsZSAY9xuwfyT1n0VeSNFeLpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742891581; c=relaxed/simple;
	bh=9LOHqqu3GKdYbTQtUJcHnzcKXiVm53w6SCayd4oaM9c=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:MIME-Version:
	 Content-Type; b=VryrKkvHv7+YF3WD4yBfwjFtVMIuJ4IL/FQwQ+a4itcXe7fnj8MydMmCnvyF4S/c2nj+imlw9he1VcbBAgNKRKSF1MjIXGjij4MVu0uxxgSdzxU8JQcQQnSJz3zAuH6ssxH1TFrWRObk/Bm5YFkab/xCk2cnhqFGEtQWPvU2Mcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HxAEbcAr; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-30db2c2c609so3079531fa.3
        for <linux-usb@vger.kernel.org>; Tue, 25 Mar 2025 01:32:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742891578; x=1743496378; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:in-reply-to:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9LOHqqu3GKdYbTQtUJcHnzcKXiVm53w6SCayd4oaM9c=;
        b=HxAEbcArVLmegPAosAShvyPwg9IZspvqGLVw+6fz7Cu8y6nzwu9ZkY01sQJ0Wxr7y/
         tvVyAOmRUMxysY/Njp9ZcM2ZJR7r+2qL94ZX5WXl0RwFjWLExwd6YH3tWm3FW57ucQ1l
         LuL2sP/s7gAfG7okNhTNsOgNfmP86MK9+ufG37bLhMdWwMmOSWXJ8Z/wb8CsNAKfEqym
         1Ew9UYDyf8358u9+wB4X9PTM3mu2KdwdAo/mpBhEeUbfhz50VDUG/p0wnk3e103DEr4j
         SIxGMG2i3oUtVaCBmVLksj4athfohxRB6mx8Mg8XcS05AnuI6qFCYxjXRsk6+pUFU9sp
         v6Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742891578; x=1743496378;
        h=content-transfer-encoding:mime-version:in-reply-to:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9LOHqqu3GKdYbTQtUJcHnzcKXiVm53w6SCayd4oaM9c=;
        b=WiN19bKbtQuHa7ddCTKB/4NWrLlBZBrQs0HvfywyBtJagzosVuZvkq5qAubc2mmnjR
         gXT/9YA0ogWV8qEwlXd6/OUa/gWTb6hQM8pdHej29eo1no7URt/U1tYgOYc1ZxvE4Jpn
         e9RgP9fbc4L10vFk1a6MRpaiKgzwfKP+g1M8DewT5OTw60Vs6d65zFlxfSNNtEoO6KzJ
         o0D1Kn/fN7wdC/DajexQfrA4msynDQl3d2pF1n/16tavo7808G5EPnSVVhSwThFM815h
         8sjIEGONEeqpnjFy7fnAMgNE8b9F9LPqEmAFDGq+ir/vHLxAHoJbvxhZg5GrpM54msmv
         kEXg==
X-Gm-Message-State: AOJu0Yx7KokPVrKl2WhbOpy2wxw1xmMTfN/AC0rBKjUsQCQWgV7HPOng
	5n2VL+OiJZvMz7nZS0FvxFPB+pxcSnM1bksnKmtHocIUDNELuqmQ
X-Gm-Gg: ASbGncvmd05GECBjU/SZTHtlWFcR4anQE8vZuXSf1PoYtgNFzv0cncWp65+HadMN16M
	zgvAQAuoE+gsxu3Rw2gEqB7nBtYv7Ojror6fLZX16ZXhaxrlgUk8H6kdBcJc2gWj3r898BZYvmW
	W+rrYdzpmKM9ZYs9Y9lmr1iXkEWB93DZDof8wbyLYO49zY3ZxxJi/Rz9ZNqSgppuxHhpemOJpmR
	Y0VYywpYdTcLQMIPEuhhUFlWa8Fjq68pWc2S3vf6edCi7vA4221ue6MEy/Lt/FwDFVSLe/t4zgc
	IIzy0hzUQlXoFyYPkjoUOIqNcgnCVKqOiqwW+klwRyIQ3ft5IVB5JUaKYTgsNA==
X-Google-Smtp-Source: AGHT+IGtZrTLxRpY3Nsq1K7hk9AgfasbtaCAJtGotOTpbO7igrFPNttNjR+ZFGP5ZtAuBt22BoIKGQ==
X-Received: by 2002:a2e:b008:0:b0:30b:ef98:4653 with SMTP id 38308e7fff4ca-30d7e2bd3ebmr46925271fa.36.1742891577772;
        Tue, 25 Mar 2025 01:32:57 -0700 (PDT)
Received: from foxbook (adth234.neoplus.adsl.tpnet.pl. [79.185.219.234])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30d89995ed1sm14291991fa.56.2025.03.25.01.32.53
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Tue, 25 Mar 2025 01:32:54 -0700 (PDT)
Date: Tue, 25 Mar 2025 09:32:51 +0100
From: =?UTF-8?B?TWljaGHFgg==?= Pecio <michal.pecio@gmail.com>
To: laycookie@proton.me
Cc: linux-usb@vger.kernel.org
Subject: Re: USB device enumeration failure after a certain amount of uptime
Message-ID: <20250325093251.4c5330d7@foxbook>
In-Reply-To: <tftazqcClYI-2-p31uywrZ6yeCzD8MkfSdzeBlhODA0739v21m4K2sU20aybeXfJiqBFOWz0BjawusLq1vKkZCpHGYSdRxzKoPUGYZSJFq4=@proton.me>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

> Hello, this is my first time reporting a bug to the Linux mailing
> list so if I make any mistakes on how the report should be formatted
> I deeply apologies, and I would really appreciate feedback on how I
> could have made it better.
>
> I have recently installed a pcie capture card (AVerMedia GC575) into
> my computer, which from my understanding is recognized as a USB hub,
> to which a USB =E2=80=9Cvirtual capture card=E2=80=9D gets connected, as =
well as an
> RGB controller, and while there is no problems with the RGB
> controller, the capture card itself disconnects after some uptime.

I would guess it's a PCIe-based USB 3.1 controller (ASMedia ASM3142?)
and some USB chips permanently wired to it on the same board, you could
investigate with 'lspci' and 'lsusb -t' (when everything is working).

> When the computer boots up, or wakes up from hibernation, the capture
> card spits out some errors but ultimately ends up connecting, and
> functioning properly with the following being logged in to the dmesg.
>
> [73087.256972] usb usb4-port1: attempt power cycle
> [73087.681433] usb 4-1: Device not responding to setup address.
> [73087.887446] usb 4-1: Device not responding to setup address.
> [73088.095031] usb 4-1: device not accepting address 67, error -71
> [73088.580035] usb 4-1: new SuperSpeed USB device number 68 using xhci_hcd
> [73088.649577] usb 4-1: LPM exit latency is zeroed, disabling LPM.
>
> However after some uptime since the boot/hibernation the capture card
> ends up getting disconnected with the following being logged.
>
> [73491.691281] usb 4-1: Device not responding to setup address.
> [73491.898772] usb 4-1: Device not responding to setup address.
> [73492.106227] usb 4-1: device not accepting address 68, error -71
> [73492.857630] usb 4-1: USB disconnect, device number 68
> [73493.184176] usb 4-1: new SuperSpeed USB device number 69 using xhci_hcd

Is this a complete log? And the device was really working during those
six minutes before "setup address" failure? Usually, address setup
happens once immediately after device connection, not sure what would
lead to it being repeated later.

Regards,
Michal

