Return-Path: <linux-usb+bounces-29385-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AB38BE5BE5
	for <lists+linux-usb@lfdr.de>; Fri, 17 Oct 2025 01:00:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9E96A19C03A7
	for <lists+linux-usb@lfdr.de>; Thu, 16 Oct 2025 23:00:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66C842E6135;
	Thu, 16 Oct 2025 22:59:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YLXwDKje"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 409CA2E1EE4
	for <linux-usb@vger.kernel.org>; Thu, 16 Oct 2025 22:59:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760655597; cv=none; b=fe4gk9NWg5Aqoq34kPtDHhu/zx+UWdiVOXQ9Z8J0TspgfK+Qoko9w8Pou9z1euujQ1sl9GMuQSC1V54Rha3qC/wQeykImAhf0FG88548HGUo9GRXCE+BSyZgC24amFt8y58lDgf+L6FSapauMIjY7nGuynPWgrUtYbE4MLEPLDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760655597; c=relaxed/simple;
	bh=9B/RSOJrUeqz+fVCixddece2iAFM+eTqOwGDsUX2TbU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gso+SQ44boLMc5x6L7tg7cEPNFxL2X/D21jwA4SDYZ2rphNLjngiKnUEVdwfe8C9sCoABFTMlJfhWp8DcV5uzujhA7pTi92URlSq1FlgqXbNdSTC2g/vW0weR96xHjHrho6O9oJ6d0jCvb2DpHcmo3bpWO0FvQE2DPHCzOK6mfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YLXwDKje; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-62fc28843ecso1783908a12.1
        for <linux-usb@vger.kernel.org>; Thu, 16 Oct 2025 15:59:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760655594; x=1761260394; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4TspyN/fHUM6fwBDOEl68QPaLamhit0nUleG8qg7B+Y=;
        b=YLXwDKjeGkIxywKgZBReAcURCjTkp7H6hffZJYAEUSAGIBUUdko82mOL/mvB1YyhLR
         /TTZKKEJ2U7wilIAWvbzuM37XhT0J9pdVr8jJfftVQaxBsPK8tda4X1mN1GKrA/b10JV
         n1UDWS1KRtqAVA9UGKn3GrdPmRDJWFyPQZhZVcMCOQ1QoJ4vVONjkUpqpLKd5eGBPmCI
         HqOiQQ7meCajcy1A+akHHbbjwKiTeTf+sC9Gqa/oSDqnI2kZdbDKqlS1c5I1bO8AbT1o
         1oJlCu5ZsiuV91kq3N80cHvCrwsfOCBIb1VIGHUIpKhSxLNW1ourB+JgVxRhaHMRnn/i
         Wi5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760655594; x=1761260394;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4TspyN/fHUM6fwBDOEl68QPaLamhit0nUleG8qg7B+Y=;
        b=Lz4y6v2vvN/S9DoyvE8RwFMncqEJTURaBW34NVQYwBb/CdeGmhlNROSshX4Ea5OsLn
         8N+bq+/7EspjbugSoy7qdu5nvzQ6VNqBk+dneTD1wEsIQB7WH7oAyF/C9q7L0C1QkM2k
         wzEa7Wf84TbjxG/9kwA5xPZ8y4w67cDZnBKryEQ3sgJEx4Zz43ZL1f8OMW1oqeNphs90
         VW2pmeB4slmYu/2BVMgcikyZWMEQn4Hnd6lm6JOhFjSllKaDUvZWVtKnb6nAReSOeB6+
         rLLTX2iO5MS5vnO+N1x0T8WPu96WapSWhov/eNJL/MDu1WnRg9rVSnBb5IILXPllybpY
         OfXw==
X-Forwarded-Encrypted: i=1; AJvYcCVN9Lx0zNoPzrtMu91fPXwaM/7hT3ZD9Qnn+ePdyYc/ukATOaawwKICBd2vlXub5hgR5bkxqIDFOZA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyXgf5Rbgxsk5HJVOeOLO+bXhrMWvaTgOXTvzGbueYXkcqxnFdg
	fYRogcPlVHOZnddFp/gY3hBweraJwLWoOdKhFX/51XVCgHE5TNga37uy
X-Gm-Gg: ASbGncuh7BjlEdlts5myxbbBA/RGWgeKzZaSTPRvs5MoAXpaV+VKO5mZV2YAt1e8Eyq
	SatgxYnxzYnRp/S4TDyzLR3KA6dlh+BKvrtegS48lYf/DWIPxQEzUKtfG71GBlEyF4ZUbcUwD/p
	btIHYhKQPRmOlXjyTDQOl8UiY06gHv7/CI4J6CvNuHlfC76cUzT9DvYYO7LifdQLk0z3liPnPEv
	zmLaBl7YOgJoDwuHxC3cWYSSwxT1ibkdhRGAmdCIiQmpQQ9HtkXIBnrsrMb0JDVOeMi2sNaQFUS
	3dEvpCLbNb7LZVd8Kn1UvHG5VpMeeE3wub/fc+Oo4tIai82eQtscrSIG58WhCUZOGBZDPvOwCNG
	hsotCvqgXLUht6NvNWbBXsq5ACxNCzl0knfS9W42hCWnlUTeoHVEPp/rqSfFbPzF1a3STbAQiL7
	XZfKqdB8KsjlKW+D5R/NTRbAWaSPU=
X-Google-Smtp-Source: AGHT+IEhiM2LTo1wcmZzZYv8f76rmtElenS+YxHeo46CODkVCzRbU8lsZgFJFsaWmUoqJ0AAclRY8A==
X-Received: by 2002:a17:907:86a6:b0:b40:2873:a61a with SMTP id a640c23a62f3a-b6472d5bb62mr156304766b.6.1760655594354;
        Thu, 16 Oct 2025 15:59:54 -0700 (PDT)
Received: from foxbook (bey128.neoplus.adsl.tpnet.pl. [83.28.36.128])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b5cb965d24asm640515466b.10.2025.10.16.15.59.52
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Thu, 16 Oct 2025 15:59:53 -0700 (PDT)
Date: Fri, 17 Oct 2025 00:59:47 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Samuil <samuilsgames@protonmail.com>
Cc: "pkshih@realtek.com" <pkshih@realtek.com>,
 "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
 linux-usb@vger.kernel.org
Subject: Re: RTW88 USB Wi-Fi Adapter (8822BU) Disconnects and Fails with USB
 Write Errors - Status -71 & -110
Message-ID: <20251017005947.54e1944b.michal.pecio@gmail.com>
In-Reply-To: <zjR8G0R1ZUFe9h8_ibO-LWc9OOJyMThA9jp9ftYbETLG3IN0cHPvhCAaC9ypGKPbapsbzTH5VqnDhFcX93GkwnG1BEyETplFQmRiGGshBz8=@protonmail.com>
References: <zjR8G0R1ZUFe9h8_ibO-LWc9OOJyMThA9jp9ftYbETLG3IN0cHPvhCAaC9ypGKPbapsbzTH5VqnDhFcX93GkwnG1BEyETplFQmRiGGshBz8=@protonmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Adding linux-usb.

On Thu, 16 Oct 2025 21:32:42 +0000, Samuil wrote:
> My TP-Link Archer T4U (AC1300) Wi-FI adapter has not been working
> properly. When I first boot the system, the device is perfectly
> operational. However, after a few minutes it disconnects. In GNOME
> the whole WiFi GUI is bugged after that: It shows that I am still
> connected but I can't turn off the connection or do anything. `iwctl
> station list` also runs indefinitely without ever showing info. It
> seems like iwd and NetworkManager are blocked by the RTW88 driver.
> When I try to turn off my PC in this state, the driver error blocks
> my OS from entirely shutting down until I unplug the WiFi adapter.

Hi,

So you just join a network (or is this step not necessary?), wait a
moment and it fails? Does it happen every time on every boot?

I have one RTL8822BU (0bda:b812) and it seems to be working fine for
over 10 minutes now. I will leave it running 'ping' overnight.

> Kernel version: 6.17.3 (latest stable)
> 
> Most recent kernel version which did not have the bug: 6.11.*

Any chance you could narrow this more? Perhaps your distribution
has old kernel packages for 6.14 or others versions in the middle?

> The Journal shows following error message during boot:
> ```
> Okt 16 22:10:05 batcomputer kernel: rtw88_8822bu 1-4:1.0: write register 0xc4 failed with -71
> Okt 16 22:10:05 batcomputer kernel: usbcore: registered new interface driver rtw88_8822bu
> Okt 16 22:10:06 batcomputer kernel: usb 2-4: new SuperSpeed USB device number 2 using xhci_hcd

I see it too, but maybe it's just the switch to USB 3 mode?

> When my Internet cuts off, these messages pop up:
> ```
> Okt 16 22:11:55 batcomputer kernel: rtw88_8822bu 2-4:1.0: firmware failed to leave lps state
> Okt 16 22:12:04 batcomputer kernel: xhci_hcd 0000:02:00.0: WARN Set TR Deq Ptr cmd failed due to incorrect slot or ep state.

This shouldn't be here, never a good sign.
May we know what 'lspci -nn' says about this 0000:02:00.0 controller?

Could you boot again, run (the first line needs root)

echo 'module xhci_hcd +p' >/proc/dynamic_debug/control
dmesg -W >somefile

wait until it fails again and attach the resulting 'somefile'?

> Okt 16 22:19:04 batcomputer kernel: xhci_hcd 0000:02:00.0: Event dma 0x0000000105a9e110 for ep 0 status 4 not part of TD at 000000011fd2bd30 - 000000011fd2bd50
> Okt 16 22:19:04 batcomputer kernel: xhci_hcd 0000:02:00.0: Event dma 0x0000000105a9e110 for ep 0 status 4 not part of TD at 000000011fd2bd90 - 000000011fd2bdb0

Yep, definitely xHCI screwup.
Starting to suspect that an AMD chipset may be involved?

Regards,
Michal

