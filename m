Return-Path: <linux-usb+bounces-15683-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BDBF98F91C
	for <lists+linux-usb@lfdr.de>; Thu,  3 Oct 2024 23:43:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CE6901C21459
	for <lists+linux-usb@lfdr.de>; Thu,  3 Oct 2024 21:43:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 040281C2334;
	Thu,  3 Oct 2024 21:43:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M672gzI/"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6BE01C242D
	for <linux-usb@vger.kernel.org>; Thu,  3 Oct 2024 21:43:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727991788; cv=none; b=CmGpuU80b6vu6PW2Oq7Tylza0KLVpWjdD4WavnSou8z49FwDAQbdBCS5RMGnmNQU09csfYBTcrqrp+ihASHMNAUyxb7cAnTlq0yM0BG5RKZgKp17PHAzTUaHpNwlAFsEoTQTPGvmRAqi1aKho8VJhHyds/zf/0ux3Bf9Nlv5kTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727991788; c=relaxed/simple;
	bh=VDXJk6/dnSS8sn9qohZVdF+AvHEy5J4pjidawrVOoHk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ktuoMulg+njm6/3aN3wvwzdpFcvEU1nLujTRgU/hSP00EJwlXkpGT29VFjiBMWPBqfh9ZI0PDAhWKM+erp+/EbCTrOgDuFPOsdSmb+p5Fh/g0I6JXwL7fa7oxRmUbng6p64MfJX1uMvYIwmuxjKhdFsYLJhc4zRS01HwvEhzHS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M672gzI/; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5398d171fa2so1819013e87.0
        for <linux-usb@vger.kernel.org>; Thu, 03 Oct 2024 14:43:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727991785; x=1728596585; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VDXJk6/dnSS8sn9qohZVdF+AvHEy5J4pjidawrVOoHk=;
        b=M672gzI/0h8FL0P/XL39+/2bJ3VAXhh5Q6pCDaCQqX4CHXnWmu6kUz+kHKp7lnCM8H
         3ZdjQ8/xxFqC61CeuXaspQWDhjwwPg4cWFOZDEG5QxwgCzcdjMtQf+GrhYJuzgKBZ/GS
         5Y1wKMGCGGVDGuWCDLWwwxG+q2cm1zjG+iDikuHcRUVF0v40g/TK/zG2Q+yCzHvXGrwb
         m/J6A+QXJ3k6VI2v+XYUxPMIffhwbJGIJMkR7Fsfgfub0EFoj16fzPSWn81O2vzStvXy
         k5XVIU/971eG+H6I7CZbXuQtKQRYT8BwUUAlQeLB6Yz+VFZtP/P8UO1Ql6utlPYCA2E2
         Iw9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727991785; x=1728596585;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VDXJk6/dnSS8sn9qohZVdF+AvHEy5J4pjidawrVOoHk=;
        b=bHN34iithFolaDznQvrQIlziXGupxyp5whbok6BrNvKqLw/PuBwbVQ5smhVox7xUCR
         d6ck3MN4GlNH4sMsOVPxWiDGD8Z1zZKX43GpMp4rM0siktl8d+/euDad9pR24UbhMh7n
         S44DnTWESdckxiIcXGPyvRkYjVG43QhzNTVeVt+EFqlJGUkc35D0Ub1gmdalLYJL+mSQ
         RfVSaZ90fQUwVP8q3N3nih/jDgeKmoNz4/Q/EyAsOhd/aSKkB/LbSnwkz3Cm/8GvnbNP
         acUqurXCQLoOrIc6cPE1M2ThTsazdkzzY7qDzV0i93qhZDoooGRr/PltorY/QjAeK2f8
         BxTA==
X-Forwarded-Encrypted: i=1; AJvYcCUJv9GgyHN9dwh0ZyAvh0NyVrIxR7rc+dGP7OIs/TfREk5r7i48gbCDgysrGrfvZgVHmgUw5ms8o/M=@vger.kernel.org
X-Gm-Message-State: AOJu0YzSad/KTHQqYTAGZDzLGc/aBzCsCzzaOqDkn2RUxrLd5zHM+uCb
	kxhwHIeWUXqn3xSXP2IhuJKA2sKIR7FkOeIybQIekmIBIp2EcLEh
X-Google-Smtp-Source: AGHT+IHgY/sKkr2jZT5s5Fvv9m89t/4drKmCvgrDFQwI2KFMP/IgkeOS8RulT8F0pGYHdHoA/l4nfQ==
X-Received: by 2002:a05:6512:b94:b0:539:8f4d:a7c9 with SMTP id 2adb3069b0e04-539ab9de2fcmr474571e87.41.1727991784536;
        Thu, 03 Oct 2024 14:43:04 -0700 (PDT)
Received: from foxbook (bfk18.neoplus.adsl.tpnet.pl. [83.28.48.18])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-539a82974dcsm264903e87.166.2024.10.03.14.43.00
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Thu, 03 Oct 2024 14:43:01 -0700 (PDT)
Date: Thu, 3 Oct 2024 23:42:57 +0200
From: =?UTF-8?B?TWljaGHFgg==?= Pecio <michal.pecio@gmail.com>
To: Harry Wentland <harry.wentland@amd.com>
Cc: Raju.Rangoju@amd.com, Sanath.S@amd.com, gregkh@linuxfoundation.org,
 linux-usb@vger.kernel.org, mario.limonciello@amd.com,
 mathias.nyman@linux.intel.com, mika.westerberg@linux.intel.com,
 regressions@lists.linux.dev
Subject: Re: [REGRESSION] usb: acpi: add device link between tunneled USB3
 device and USB4 Host Interface
Message-ID: <20241003234257.7e87b675@foxbook>
In-Reply-To: <82aa97b6-4b3a-48d3-a022-04563eb01e45@amd.com>
References: <20241003214827.4edb8731@foxbook>
	<82aa97b6-4b3a-48d3-a022-04563eb01e45@amd.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

> No 'quiet' option and with loglevel at 4 I still don't seem to see
> any prints.
What's the loglevel of your printks? If they are INFO, NOTICE or DEBUG
they will not appear on loglevel 4. In particular, the patch you are
testing added a dev_info, which is INFO and will not show on level 4.
I would simply change it to dev_err, then it should show.

> Interestingly if I set loglevel to 6 my boot gets much farther but
> then gets stuck at "A start job is running for Load Kernel Modules
> with ever increasing timeout values".
So the kernel isn't crashing, but probably some module gets stuck on
initialization and 'modprobe' never completes.

Not sure if it really gets much further or simply prints more noise?

If Magic SysRq doesn't work, maybe systemd simply disabled it? It does
so by default, unless overriden by custom config files. It looks like
your root FS gets mounted, so those configs may work.

You could also try blacklisting xhci_pci. I don't know what sort of
kernel config you are using, but on Arch Linux xhci_hcd is built-in so
your blacklisting attempt failed, but xhci_pci is a loadable module.

If this helps, then the next logical step is to 'modprobe xhci_pci'
while running 'dmesg -w' and see what happens.

Regards,
Michal

