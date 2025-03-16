Return-Path: <linux-usb+bounces-21795-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7157DA634FC
	for <lists+linux-usb@lfdr.de>; Sun, 16 Mar 2025 11:28:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7E8A13AE027
	for <lists+linux-usb@lfdr.de>; Sun, 16 Mar 2025 10:27:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05DAA19D89B;
	Sun, 16 Mar 2025 10:27:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QLhoqAhN"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D66C18F64
	for <linux-usb@vger.kernel.org>; Sun, 16 Mar 2025 10:27:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742120875; cv=none; b=pp0IWeiCgGU1+VR+eG4lkLkhk7UaJaq7Hyvp2jUPHk/KegxT8zvbMuiB9MPBVlrCcx2sRrb7vjw5u4NmfMy2LmUBFVca4Pv4On5nNB5fdENyd9TG6IHq0N/Vb1SwfNlqtr7ntNm7gxkqeUGF+5YN7ci8ZrikSRCmWGo++t3Y0aQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742120875; c=relaxed/simple;
	bh=FPJhBm47qLy+jl3cEatJqRcB3aLqGkBckH7dWt1cTZk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=giOrR7F/iIGnNljvo4rHXTs9HePo5uBgnlik4099T6hqtMNWwQZmGl9+hRF4fJBZ+//+zMnS7m4NMHQ9rrQ9VrpumTjWBwj/iQjhv8gG9afFsEuZnLGt35XsWfYqAv/qwgcl0ybOmFNaNAVWkSUXq864unqvi1aecLyIQQ5J7ec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QLhoqAhN; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-30bfe0d2b6dso39095851fa.3
        for <linux-usb@vger.kernel.org>; Sun, 16 Mar 2025 03:27:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742120872; x=1742725672; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kMW/HWdJ4boZJLuq4k+I+P2SO1UCC5Z7dYAptI8AW14=;
        b=QLhoqAhNXrSdLI1jDhd6UPNWNPsVqPK4Q4SlRMWceBxLx3jeERIp3mfqCaUk7SW0ef
         0NMZER4as/cOkQ0i3b1J1VirYUcesdBokcDRNvWNGwnmaHlGQ3rIGFU7UhUvSMOxrRVc
         vNTUdK2qySFGLpHX6+INsimWZx7xH5z3PETTh8uQjZ34Uvs7G3kHCLNuTANxmoRdHoJE
         ruznoi0RUScYksjR1Jz3at+ZCCSxnHKkAeo1w7q8q1G9e2o2kOEeNxx+eOXI5la544MF
         BMGuihD+Z1Tzk87XeOjkUAqBEPUrjVOP8pV+M6CDGfXuYjXHr2EAH1fJTzdk+lNdatpw
         oVSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742120872; x=1742725672;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kMW/HWdJ4boZJLuq4k+I+P2SO1UCC5Z7dYAptI8AW14=;
        b=c2wObnKTrGYdTGzrvUIszxctyu8s6M1G+Y6VADO6sbfpNXyiTxvYpNfHMJgSLETdkb
         JNDKGiM/DwKZY/Xk2NnkWZwdOBGiZ9aSmKpRKQ6oeBFBbLlU7DWa5E21PjxVUD/dSFQ+
         0VrgIQYzVBVe7sfvSzzgUXBswEv+FnUNQ7q0lTyNwPwtrFEsLjWw6t2gDEQWKZvWv/c7
         wOX9fjVIqDEixyvM1REM9F/tHh5Il1PvoUFL4KXBcrplrjakuhU09Uu7ftxOQqNh4g5C
         AhkDOArp9t7jKOVB6So8BzSTH28k7HUnIm6ac+8QeiwL+sboeBGMkaisKsmBF3HUxnYW
         LY5g==
X-Forwarded-Encrypted: i=1; AJvYcCVq9fMhAtQx+9XCsX4kjDJR8ZUG3zAVIEPf7dQVVPlW8krkO++ioRIxKSzZ08zJBNe42ntbk1nakfw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxevZCxjF0vcHFOTznX1G8ofECjGs/5rvDXK1wyxdNFGDYePqzu
	unv1ZlPQ/wrhYmNKi344Y+t2azdIcoqSD6FJB3s0b/6BZbBllSEBHbuBOw==
X-Gm-Gg: ASbGncvaWO30gi7p+TShv7GTrZKswsnwtw8nBe4BZyQNINiShyZ+kh4P7vKTHyWPvxQ
	rE/y94byuaC7Y/TLqq+d796SCOv86Itp1KtHcI/SGKpGCmpY1s6zMwQK3bbDA9KffD5Ox4Jp0Mq
	pdXG3Bt53oEsbJwMU35YtYBgrExu925P9SjIPUIMkBILPUbuiLYLBig7gEFENEfklH/K6XMnRO9
	24xDyRAahP8ZLT1fvFHE89xeZXGxkeH79B5O/OVohhuc8V/tqi4EspSYL5kR8hXTAy5L4kqSzuG
	Ov4S22YJ5ipGLIF4NbDIPxOCOqU3H1kM1HQePYncyFhxAs9oQJVs2P/4Tz0=
X-Google-Smtp-Source: AGHT+IHE0O6+mbBDf13tquy5uQqyAhnetmZs3EctFbSCn/QV9lYAXvcfZjhz2WmzIkNWfTeOREOVlw==
X-Received: by 2002:a05:6512:3d09:b0:549:8f24:b617 with SMTP id 2adb3069b0e04-549c38f19dbmr3364275e87.4.1742120871446;
        Sun, 16 Mar 2025 03:27:51 -0700 (PDT)
Received: from foxbook (adqh54.neoplus.adsl.tpnet.pl. [79.185.141.54])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-549ba7c11f7sm1038962e87.84.2025.03.16.03.27.48
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Sun, 16 Mar 2025 03:27:49 -0700 (PDT)
Date: Sun, 16 Mar 2025 11:27:44 +0100
From: =?UTF-8?B?TWljaGHFgg==?= Pecio <michal.pecio@gmail.com>
To: David Laight <david.laight.linux@gmail.com>
Cc: Mathias Nyman <mathias.nyman@linux.intel.com>, linux-usb@vger.kernel.org
Subject: Re: My transfer ring grew to 740 segments
Message-ID: <20250316112744.4cf579e7@foxbook>
In-Reply-To: <20250314191536.6c35c777@pumpkin>
References: <20250311234139.0e73e138@foxbook>
	<20250314191536.6c35c777@pumpkin>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 14 Mar 2025 19:15:36 +0000, David Laight wrote:
> Several years ago I found a bug in one of the asmedia chips that it
> only processed one entry from the command ring each time the doorbell
> was rung (the normal transfers were fine).
> It would get 'out of step' so every time you sent a new command an
> old one got executed instead - very confusing.


Interesting, but it doesn't seem to reproduce here.
I tried Promontory, ASM3142, ASM1142, ASM1042.

I removed the check for running endpoint from xhci-hub.c stop_device()
so it queues a Stop EP for each endpoint (as was done before 2017) and
then rings the command doorbell once (as it always did).

This is called before autosuspend so I would expect autosuspend to be
broken by such a bug, particularly before 2017.

The worst I got was a Stopped event from ASM1042 for a command failing
with Context State Error, IIRC it's illegal. But both cmds completed:

[  +2,271097] xhci_hcd 0000:02:00.0: 1/6 (000/3) queue_stop_endpoint suspend 1
[  +0,000006] xhci_hcd 0000:02:00.0: 1/0 (040/1) queue_stop_endpoint suspend 1
[  +0,000003] xhci_hcd 0000:02:00.0: 0/-1 (fff/f) xhci_ring_cmd_db cmd_ring_state 1
[  +0,000047] xhci_hcd 0000:02:00.0: 1/6 (000/3) handle_tx_event comp_code 26 trb_dma 0x000000000341d010
[  +0,000036] xhci_hcd 0000:02:00.0: 1/6 (000/3) handle_cmd_completion cmd_type 15 comp_code 19
[  +0,000142] xhci_hcd 0000:02:00.0: 1/0 (040/1) handle_tx_event comp_code 26 trb_dma 0x0000000003415640
[  +0,000038] xhci_hcd 0000:02:00.0: 1/0 (040/3) handle_cmd_completion cmd_type 15 comp_code 1

Was it supposed to happen every time, or only randomly?

> I don't remember seeing the bug 'worked around' while I was actively
> looking at the changes - so it may still be present.
> So setting up the ethernet interface I was using only worked most of
> the time. Reproducible by adding two commands but only ringing the
> bell once. I fixed it by ringing the doorbell again in the completion
> interrupt path.

I don't see any evidence of such workaround today.

Regards,
Michal

