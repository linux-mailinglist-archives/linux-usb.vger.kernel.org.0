Return-Path: <linux-usb+bounces-18276-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1923E9EA2D0
	for <lists+linux-usb@lfdr.de>; Tue, 10 Dec 2024 00:28:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0A2DD1654C9
	for <lists+linux-usb@lfdr.de>; Mon,  9 Dec 2024 23:28:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 520361FD7B0;
	Mon,  9 Dec 2024 23:27:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fCS1Zigp"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FCFC1FD785
	for <linux-usb@vger.kernel.org>; Mon,  9 Dec 2024 23:27:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733786857; cv=none; b=jC4BhosNPYwGyXMRQFP4tWEdzd825OHeyo/ipDlU5X5lpR+cagzfEaVOH/aFv8oAnkQXQgd9jtEpKM5eIWhGnA/KV/NYru9PFy/Px2+jQGSKllIPR5wKmg029SZzI4DLZOWy982zC1k0pMZDR5tOvG2XinPKPZJrp+eJKAEg1qE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733786857; c=relaxed/simple;
	bh=QozwQD5OLjkiuqy19zcn8jZR2qhsLSZ83nZ22lhXMqk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=J66wlJNPL62H6NJccJ1Faq99hmA0a/7zoR7eC68qyg7fQYiXtEq9aQWqOcVacG1e/2c5jSTqA4L4B8ETRl0kYbIhbArDZlqySUnUck0C/eGN/7eU8CxUDpR2fzUMXBgR62pP2a4BJ79Xb6nnkP3Yse9nfbqDR2O4e9QuzrffDzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fCS1Zigp; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-30039432861so32155101fa.2
        for <linux-usb@vger.kernel.org>; Mon, 09 Dec 2024 15:27:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733786854; x=1734391654; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MjXiA9e4SN/omPxnMZF+fDTrxjPRl85cvbgjGLB3J8A=;
        b=fCS1ZigppPVCHWZeSmZDfrMcb14FJkOpFko27FyFTis/CteHcw6B7niABKY5b0c9E6
         CGHih/7XWI1ym+ErQWmUpRWsTcqkPvzXl5ARy0kjjgSSey/RK0h1ygRx2Wq27AVKaC9J
         YgxFnHTQPh2v/JlmpZXhZt8GDBFjf/rDOIdqaG87iE08OWbgizSYEITBGAcVh1BDXiuU
         f/RuJMSiFDYOUsexGOA93FqPsoyECdVxHQpmlN7Q2hxV6yQmrAP/kznQ/H5vtqwNVB4U
         gTzc1xwKdacZhwPJNA32oMvBi6IPqmlkb0I9DggHQEAyYGEMRd7E5moGhw+2Lf2gYnen
         hHXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733786854; x=1734391654;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MjXiA9e4SN/omPxnMZF+fDTrxjPRl85cvbgjGLB3J8A=;
        b=AusV/GFXzDfEX4NB0CVWjvAlFgKR/tb40knHq/8uziy9u5os7myXwwlDLWwFv6TR4G
         LVGpedVCV/T2DTG/yVvlc4TNUv1kZXSpi8P8ZDKqm5jOQ/SCoFoxzWhg2AmXoQx7TBQ9
         ISArDo9Yvf65e0L5cD8wPCmKWRZXxJx4FdrVfk7C6KCZP1ug+eewtsCb2d2mtivRcO8T
         aePwBW2R3dF+/QDqn5bhGC0UXswWjnQWFYkWojVtof3sMw9mMykXkCQNm8w8pN1UwKAL
         IxhfwYJUi43eDACSYMziJeDQLFdL0QPBMxovnihjFXEZrvsdOkpTYz083N1i7t0Q/MiK
         9EpQ==
X-Forwarded-Encrypted: i=1; AJvYcCXLshmnl67o3cd6LXn7k4P5YeCiFza8DoTNEUdUsFlmplgl4osHp8VMQY4I0NPl6HTEk7Yj+cLqvUI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxU7+sOAr9x6G69DKWQRYwxFODo9buLb2G4NPGk7SBwv7yzDC5B
	ok+Lj+OIw+HikNMsZMRkjs0uo4Hb03ry+7MmkehOPlhQ+ExtK0af
X-Gm-Gg: ASbGncvM5apqdKGOCipv+gfYy7rnj3GTY+DxqDVa0X2t8Wf6Adkgiz9EGb6wirUXZE2
	IDubkmhBDuSFf4G+NpIsrNZu9IONFSa1wyZ0lN7f2CcGwv4IQqx4gCdHy55Iy5dYa/3ZVMrGWr3
	uZ5uDj11yYdeDFg4Wffz3Ndss3UhSeMPhjibb/0SmRsVqxHyThdZqfEkUPruHiJ3GeiluAy9dsf
	gw/3eWv6EmTaD8A7UQ+GRSaUjm+NirzzeYCarmdK2PD/f31PzuiDeiVtB5AxYQSN1iYON8=
X-Google-Smtp-Source: AGHT+IEtGcyhEGfMeUVdGvXrSJu7QRtjAgiKQDugUbrYacG14advS36uLKrYjaHd6pOOnw9wXC5fZA==
X-Received: by 2002:a2e:ab07:0:b0:302:17e7:e18e with SMTP id 38308e7fff4ca-3022fd42cb6mr8345141fa.11.1733786853865;
        Mon, 09 Dec 2024 15:27:33 -0800 (PST)
Received: from foxbook (adtp154.neoplus.adsl.tpnet.pl. [79.185.227.154])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-301f2e48b01sm7274151fa.31.2024.12.09.15.27.30
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Mon, 09 Dec 2024 15:27:32 -0800 (PST)
Date: Tue, 10 Dec 2024 00:27:27 +0100
From: =?UTF-8?B?TWljaGHFgg==?= Pecio <michal.pecio@gmail.com>
To: torvalds@linux-foundation.org
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
 mathias.nyman@intel.com
Subject: Re: USB: workqueues stuck in 'D' state?
Message-ID: <20241210002727.2331aeae@foxbook>
In-Reply-To: <20241208211712.7d475295@foxbook>
References: <CAHk-=wgBm_x2EfaSHvSL3otbcDbw06XW2j9EFNMK2_8XoMHYqA@mail.gmail.com>
	<20241208211712.7d475295@foxbook>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

OK, I have no idea if it's the same bug or merely similar, but:

Linux v6.13-rc1. My hardware currently seems to insists that there is
overcurrent on all ports. It's an ASMedia chip, so nothing shocking.
This drives Linux nuts and it repeatedly hammers on hub_suspend() and
hub_resume(), apparently in a fairly tight loop, with no end in sight.

I have also seen short bursts of the same a few times while unplugging
some device from two ASMedia controllers (and not from one other HC),
but they stopped after a second. Maybe the HW came back to sanity?

It looks like something is very eager to retry things.

This shows up upon reloading xhci_hcd:

[613292.598841] usb usb8-port1: over-current condition
[613292.726843] usb usb8-port2: over-current condition
[613292.761832] usb usb9-port1: over-current condition
[613292.969830] usb usb9-port2: over-current condition

One core at 100% and junk like this repeats forever with dynamic debug:

[  +0.000001] hub 8-0:1.0: hub_resume
[  +0.000007] xhci_hcd 0000:02:00.0: Get port status 8-2 read: 0x288, return 0x108
[  +0.000005] hub 8-0:1.0: state 7 ports 2 chg 0006 evt 0000
[  +0.000006] usb usb8-port1: status 0108, change 0000, 12 Mb/s
[  +0.000003] xhci_hcd 0000:02:00.0: Get port status 8-2 read: 0x288, return 0x108
[  +0.000004] usb usb8-port2: status 0108, change 0000, 12 Mb/s
[  +0.000002] hub 8-0:1.0: hub_suspend
[  +0.000003] usb usb8: bus auto-suspend, wakeup 1
[  +0.000003] xhci_hcd 0000:02:00.0: Bus suspend bailout, port over-current detected
[  +0.000001] usb usb8: bus suspend fail, err -16
[  +0.000008] xhci_hcd 0000:02:00.0: Get port status 8-2 read: 0x288, return 0x108
[  +0.000004] hub 8-0:1.0: state 7 ports 2 chg 0006 evt 0000
[  +0.000003] xhci_hcd 0000:02:00.0: Get port status 8-1 read: 0x288, return 0x108
[  +0.000004] usb usb8-port1: status 0108, change 0000, 12 Mb/s
[  +0.000007] usb usb8-port2: status 0108, change 0000, 12 Mb/s
[  +0.000002] hub 8-0:1.0: hub_suspend
[  +0.000006] xhci_hcd 0000:02:00.0: Bus suspend bailout, port over-current detected
[  +0.000004] xhci_hcd 0000:02:00.0: Get port status 8-1 read: 0x288, return 0x108
[  +0.000009] hub 8-0:1.0: state 7 ports 2 chg 0006 evt 0000
[  +0.000003] xhci_hcd 0000:02:00.0: Get port status 8-1 read: 0x288, return 0x108
[  +0.000004] usb usb8-port1: status 0108, change 0000, 12 Mb/s
[  +0.000006] usb usb8-port2: status 0108, change 0000, 12 Mb/s
[  +0.000003] hub 8-0:1.0: hub_suspend
[  +0.000003] usb usb8: bus auto-suspend, wakeup 1
[  +0.000002] xhci_hcd 0000:02:00.0: Bus suspend bailout, port over-current detected
[  +0.000002] usb usb8: bus suspend fail, err -16
[  +0.000001] hub 8-0:1.0: hub_resume
[  +0.000007] xhci_hcd 0000:02:00.0: Get port status 8-2 read: 0x288, return 0x108
[  +0.000004] hub 8-0:1.0: state 7 ports 2 chg 0006 evt 0000
[  +0.000007] usb usb8-port1: status 0108, change 0000, 12 Mb/s
[  +0.000003] xhci_hcd 0000:02:00.0: Get port status 8-2 read: 0x288, return 0x108
[  +0.000003] usb usb8-port2: status 0108, change 0000, 12 Mb/s
[  +0.000003] hub 8-0:1.0: hub_suspend

Stack traces are similar: pm workqueue -> usbcore -> xhci.

Regards,
Michal

