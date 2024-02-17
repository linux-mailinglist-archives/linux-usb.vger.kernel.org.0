Return-Path: <linux-usb+bounces-6667-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9346D85920B
	for <lists+linux-usb@lfdr.de>; Sat, 17 Feb 2024 20:26:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C53FEB22BB3
	for <lists+linux-usb@lfdr.de>; Sat, 17 Feb 2024 19:26:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39F667E571;
	Sat, 17 Feb 2024 19:26:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hmdfn1B6"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C8377E0FB
	for <linux-usb@vger.kernel.org>; Sat, 17 Feb 2024 19:26:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708197979; cv=none; b=gfmNxY6gfasJEyD2f9O8k1kV8ISGd7yX9KHWoubpgvMJI819fOAEW/ncjurv2zqEb3uAnhGUSyrEOgF3r/fweq0FfiIn5L1nkcHHUMypZc4xhNhZ6V8PRDUKBNSXNr2zPSwGlUJW1LYkdsuMd3YqQ1/1DuOodd/dC245ZBW1Ckc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708197979; c=relaxed/simple;
	bh=iSiW9c3CU5WTFFBjL8iHs0Awbvo51KsRP8ujxAsmN9g=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ea7wAHyFmwTotfjljIni81fHfwO1UpTKuSiX3vjobti2OVOPdVP3hj9JOY0SB9QMP9DHsTDFW5Kb9bHE0D4XpU5kGZnGJdvRe9r784AUYZAZEeysxP2xDgq2kJv2qVP54qPccP+e2DTdyVumyrDqu4nfZchxz/kmpt2g6CKM3WI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hmdfn1B6; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-56399fb02b3so3824375a12.1
        for <linux-usb@vger.kernel.org>; Sat, 17 Feb 2024 11:26:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708197976; x=1708802776; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OG83zPeWy7OhgbWZTvCMgKE6GRZE+eSjEwX2Yfrznko=;
        b=hmdfn1B6BK9n+M2VNpCYG65NZawqyZGufDCcMVEtzQE2a1w2MwteeXTPcn0n7Bow7O
         wuVmNMiMylr1+IHG4Y/vaUiDygm5N3KlPvEUZhHhst8ZcwJaci6GIxZa4Q3GNLKAIQ9l
         fehijh/ZjhqWqUIyHuVYpWOv1TKJj8Eyt/GENRfOFrffTzekXtscTsv31mNvpzeUE6az
         bqikiGOm7z3MiEzfwvXTL+Q6KSXKSRFO8dh1fESOfiO5ruIl4jTzYJ4hEfQoy44xSQ4S
         /NeKXGt9kFi0fB0FvA12huThnCkOi9QSLgTk80ovSr9oT3BtJeG+a9GswH/O0km7/zDl
         5G7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708197976; x=1708802776;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OG83zPeWy7OhgbWZTvCMgKE6GRZE+eSjEwX2Yfrznko=;
        b=M6fDZ7WoBbrYY8CQGBxhWrbj56Jsf+nwdNmvLNJ1uxMojrxd7nUGPNCGUYNHen86EK
         PhPQZvYenJR5cUz8beFDzo4DKRmak54+GnLVQav14hAiFPotryuxPIESMZIL9p2VYa5l
         No60wLG2FkB+eXkB7bfUf/2ucRMbzZruMsp2y6AcGFOJfgnbTJQq2pAh2oFlh1YTEUcZ
         iMRAVQnvy4RbiYnaFUCUOd5HOAa3YjXtRhk2kCgfLsArRtJXPv1u5JHo6TX1ItTAme6E
         cB9EKAT6XMPBQiz+w1Rb/7oOGuFVsruIgWftYsHS4+cqBLB42sqMQrdedxYRHVyNQnGo
         x/tA==
X-Gm-Message-State: AOJu0YzUxKQQG8BkPIb2+7l1sm2fVc6Vf3cSVaUE/VRlzHH3yIei+RDu
	+m+4gWe+iShfzHAhM2cEiLOyR7RnPahLxaiyzcaIK7UZBzkS8fq+
X-Google-Smtp-Source: AGHT+IFdEUv7DgTVCV/zSuzuHYJk1Y2ftup0es3Muwo1h8C/XbnW2gelF5yhnwCJGgP3pXbfznLx/Q==
X-Received: by 2002:a17:906:c57:b0:a3c:d108:2168 with SMTP id t23-20020a1709060c5700b00a3cd1082168mr6043010ejf.38.1708197976126;
        Sat, 17 Feb 2024 11:26:16 -0800 (PST)
Received: from foxbook (bfd245.neoplus.adsl.tpnet.pl. [83.28.41.245])
        by smtp.gmail.com with ESMTPSA id v22-20020a1709061dd600b00a3d8fb05c0csm1233205ejh.86.2024.02.17.11.26.15
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Sat, 17 Feb 2024 11:26:15 -0800 (PST)
Date: Sat, 17 Feb 2024 20:26:11 +0100
From: =?UTF-8?B?TWljaGHFgg==?= Pecio <michal.pecio@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Subject: Re: NULL dereference on disconnection during usb_set_interface()
Message-ID: <20240217202611.6337879c@foxbook>
In-Reply-To: <2024021724-dweeb-peroxide-2036@gregkh>
References: <20240121181815.4ab01525@foxbook>
	<2024021724-dweeb-peroxide-2036@gregkh>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hi Greg,

> There are a number of known-race-conditions in the v4l interface that
> can happen when devices go away and userspace is still holding a
> reference on the character device node.

I wrote to linux-usb because I think this particular crash is a bug in
the USB subsystem - namely, usb_set_interface() appears to crash when
the device is disconnected during its execution.

Indeed, today I came up with an artificial way to reproduce this crash.
I added msleep(1000) right before the call to usb_hcd_alloc_bandwidth()
in usb_set_interface() and pulled the USB plug when it slept.

(BTW, previously the device was not physically disconnected, it looks
like the host controller dropped it due to I/O errors).

Anyway, here's my new crash log:

# this is what normal execution looks like, nothing special happens yet
[  210.644611] usb_set_interface called from uvc_video_start_transfer
[  210.644615] sleeping before usb_hcd_alloc_bandwidth
[  211.668754] usb_set_interface returned

# and now I will disconnect the device during the sleep
[  216.700611] usb_set_interface called from uvc_video_start_transfer
[  216.700616] sleeping before usb_hcd_alloc_bandwidth
[  217.144340] usb 12-1.3: USB disconnect, device number 3
[  217.746182] BUG: kernel NULL pointer dereference, address: 0000000000000000
[  217.746190] #PF: supervisor read access in kernel mode
[  217.746192] #PF: error_code(0x0000) - not-present page
[  217.746195] PGD 0 P4D 0 
[  217.746197] Oops: 0000 [#1] PREEMPT SMP
[  217.746200] CPU: 0 PID: 815 Comm: yavta Not tainted 6.7.0 #4
[  217.746204] Hardware name: System manufacturer System Product Name/M4A88TD-M EVO, BIOS 1801    08/09/2012
[  217.746206] RIP: 0010:usb_ifnum_to_if+0x38/0x50
[  217.746212] Code: d2 74 32 0f b6 4a 04 84 c9 74 2e ff c9 48 8d 82 98 00 00 00 48 8d bc ca a0 00 00 00 eb 09 48 83 c0 08 48 39 f8 74 12 48 8b 10 <48> 8b 0a 0f b6 49 02 39 f1 75 e9 48 89 d0 c3 31 d2 48 89 d0 c3 0f
[  217.746215] RSP: 0018:ffffc90000b07b90 EFLAGS: 00010206
[  217.746217] RAX: ffff8880031ac498 RBX: ffff888003144800 RCX: 0000000000000003
[  217.746219] RDX: 0000000000000000 RSI: 0000000000000001 RDI: ffff8880031ac4b8
[  217.746221] RBP: 0000000000000000 R08: 0000000000000400 R09: 0000000000000000
[  217.746223] R10: 0000000000000000 R11: 00000000000003ad R12: ffff8880031acde8
[  217.746224] R13: 0000000000000000 R14: ffff8880031acc08 R15: ffff888102ca4000
[  217.746226] FS:  00007f8455cf2740(0000) GS:ffff88811bc00000(0000) knlGS:0000000000000000
[  217.746228] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  217.746230] CR2: 0000000000000000 CR3: 000000011af26000 CR4: 00000000000006f0
[  217.746231] Call Trace:
[  217.746234]  <TASK>
[  217.746237]  ? __die+0x2d/0x80
[  217.746240]  ? page_fault_oops+0x15d/0x420
[  217.746244]  ? fixup_exception+0x36/0x280
[  217.746248]  ? exc_page_fault+0x74/0x150
[  217.746252]  ? asm_exc_page_fault+0x22/0x30
[  217.746256]  ? usb_ifnum_to_if+0x38/0x50
[  217.746258]  usb_hcd_alloc_bandwidth+0x208/0x310
[  217.746263]  ? trace_raw_output_tick_stop+0x80/0x80
[  217.746267]  usb_set_interface+0x112/0x430
[  217.746269]  ? _printk+0x48/0x50
[  217.746273]  uvc_video_start_transfer+0x1db/0x650 [uvcvideo]

