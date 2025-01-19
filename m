Return-Path: <linux-usb+bounces-19528-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D3BCA16208
	for <lists+linux-usb@lfdr.de>; Sun, 19 Jan 2025 14:23:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CA9E87A2AFD
	for <lists+linux-usb@lfdr.de>; Sun, 19 Jan 2025 13:23:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A94131DE2A6;
	Sun, 19 Jan 2025 13:23:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V+snM4k7"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 311022913;
	Sun, 19 Jan 2025 13:23:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737293007; cv=none; b=XXK26e/RuVThOzRUEnhh64qPjCJXa/mVyy8vD8Srhvv/o5AOStmsBSGBnPuy2R2bxsIoJ65hwd/Xeen4rg1/qzdF+LNB2ZpXqJZtNxhRWLD46Nxe9gKXO42hVUVwpKeW5BYk3PrBgB7g35mifc7R6wzTuTbkkPoZ2JqU6nmJt8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737293007; c=relaxed/simple;
	bh=apAejWxM2p1IrYcJzbnAfZQ16W7H8cjoDYzJtb3BiPg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=CqK0XAQ9n1F5tbstF0VVYtsVG8+L+fHqULmIFsu6x9pwqgn+Hk07hX4/ORMC2gkQ7R/6NQxqzSqgSHsm44eBCSookld5oo8P8NnwHYSuEEl6lM8RmfKQIXlMx55fO22qR4t+QIGdOxAvUEAOgK2WWTvVh60AM4ejIBrFAiwSDP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V+snM4k7; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-304e4562516so35741491fa.1;
        Sun, 19 Jan 2025 05:23:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737293003; x=1737897803; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vJasc6KreJk89EWrzshYGri4kzO0NwSzLBjjkq1EhMQ=;
        b=V+snM4k77JK6TUklLzGZJ5W+3m6Ds3Fd9l2ZFpijAp2hh7m6FVgXe8gibhN23kosXp
         H6nI88Bul815fD/aNPU9k4b9E6TJaKp7NMlTLJBR0h0lllC9v99mrFMPaFzF2uHI740Z
         bX20+qdrrbb4p+xIOe08bmqldd68Z0jEzEH940l0dgJ9yudEmoTc0/ZYG2Fdxy01ZRCQ
         YQRDbOvs6eTB6GvxGKUEMivVHJ+Lvg8iPiNgyLsRsZ2ZQ9F/y2d6rOijN1wdxf6ytMsQ
         frYGfEMuQTGqdFiDFvfGbzSAl1WqZDAIV4NsKjkValV1dpiF1Hw7xaC1sWYxRCRymXeI
         L9dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737293003; x=1737897803;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vJasc6KreJk89EWrzshYGri4kzO0NwSzLBjjkq1EhMQ=;
        b=qClTV0DpdC0Wc1tWFbd+n4hgF0AF0K18hszeukOnIyNlFnh485d4/J9J7RS1aozP9w
         gli8vBx5g72ScjqTncpGtnHELf54N7G06hzfVjYyZSiPbIC3jdD5LMl+IWJPs0R0IqRZ
         s+bLXlWW831zTLa1QPWR8Q4XAwj1XOhXDV4vE0zfAIhD6F8asKEFjW/5iZMQXAamVt13
         85EF+D9X/zDwKLfCpbYF81TytADVnmaM/P7S+2oxK2uFkhnTLMRVRoMrDRQUJyygQdGT
         Do+qqKOv6EGRmlFFo83LE5GhegXQurpUA5ZIkkTgd4el3pm1y33QssH6Lq8mlHdRp2Dw
         20cA==
X-Forwarded-Encrypted: i=1; AJvYcCVGKwikyTTVLDFFXUcU2UAzdJxdZVZhltx6aWPK542yENzgQvttOwc9AVHo22zvSFSCapwy64LjlWo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyfFOCYk/BPLyRs6EJJFRDusHdaEd8Rf29+tTJyL/bXWxhtQxPV
	QA+OUbqy2fkpGzVadUrOaHW0ueqU1hya3Ql+05b+ShfkBblwdD7b
X-Gm-Gg: ASbGnctvcMhULqpEi9/Cf9z9DZKOl+RBuRe2kZveTxjEHbL7dPX/8jw6v+t/ZL4vZVO
	a7PQYfxXRK5y+esoPm2nc5KBmPsktzg87CiYK2mLKkhAwcTV3Yt/DFRtQfnaOu4xLlZM2QOkagp
	jOvTLu6+INxyFmKoydhRyw6d1+lBc8qHfLnXsTxFfbV6ka4DMoLodH+T+b/fa2NmiizuYxFM87u
	j65HhbT2H/8L3EkfTeDy3f79GxitX62FrM7xSwqizVI97NLPCHGFD7BgzApTxluQ9WGWFwGtDeO
	vujxkFhOPO1eum2PAdYF/N3ByXh1QVKw3w==
X-Google-Smtp-Source: AGHT+IFsKEbXE2IiPS+PBEkPcuRlZRnksGtPZ3icnuNGYgkvKJKWOTFBpR3CxP71b2iDeFwABo1ZlA==
X-Received: by 2002:a2e:be9c:0:b0:306:16ca:ed05 with SMTP id 38308e7fff4ca-3063068700fmr58184831fa.17.1737293002868;
        Sun, 19 Jan 2025 05:23:22 -0800 (PST)
Received: from localhost (broadband-5-228-116-177.ip.moscow.rt.ru. [5.228.116.177])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3072a3308edsm11700301fa.4.2025.01.19.05.23.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jan 2025 05:23:22 -0800 (PST)
Date: Sun, 19 Jan 2025 16:23:21 +0300
From: Fedor Pchelkin <boddah8794@gmail.com>
To: "Christian A. Ehrhardt" <lk@c--e.de>, 
	Saranya Gopal <saranya.gopal@intel.com>
Cc: linux-kernel@vger.kernel.org, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Prashant Malani <pmalani@chromium.org>, Jameson Thies <jthies@google.com>, 
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, Samuel =?utf-8?B?xIxhdm9q?= <samuel@cavoj.net>, 
	linux-usb@vger.kernel.org, Kenneth Crudup <kenny@panix.com>, 
	Sasha Levin <sashal@kernel.org>
Subject: Re: [PATCH 5/5] usb: typec: ucsi: Clear UCSI_CCI_RESET_COMPLETE
 before reset
Message-ID: <ie6okmkyqr7qiydcrcepghs6aewgi7stipcydgcpaoedhgp2ef@ye7y43aceofl>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Z2Cf1AI8CXao5ZAn@cae.in-ulm.de>

Hi,

Christian A. Ehrhardt wrote:
> The (compile tested) diff below should fix it and I can turn this
> into a proper patch but I lost access to test hardware with UCSI,
> thus this would need a "Tested-by:" from someone else before it can
> be included. Maybe Saranya can do this?
> 
>      Best regards   Christian
> 
> 
> commit b44ba223cd840e6dbab6c7f69da6203c7a8ba570
> Author: Christian A. Ehrhardt <lk@c--e.de>
> Date:   Mon Dec 16 21:52:46 2024 +0100
> 
>     acpi: typec: ucsi: Introduce a ->poll_cci method

WARNING: CPU: 0 PID: 8 at drivers/usb/typec/ucsi/ucsi.c:1377 ucsi_reset_ppm+0x1af/0x1c0 [typec_ucsi]
is triggered on my laptop on roughly every system boot. When it's not,
there is a
  ucsi_acpi USBC000:00: error -ETIMEDOUT: PPM init failed
message observed in the log.

I've tried the above patch "acpi: typec: ucsi: Introduce a ->poll_cci
method" but the issue is still triggered [1].

Is there any useful info/logs I can provide you for further
investigation of the warning in question?

As the warning is quite reliably triggered on my system, I may help with
the testing of other patches.

[1]:
[    7.312044] WARNING: CPU: 5 PID: 329 at drivers/usb/typec/ucsi/ucsi.c:1377 ucsi_reset_ppm+0x1b4/0x1c0 [typec_ucsi]
[    7.312181] CPU: 5 UID: 0 PID: 329 Comm: kworker/5:1 Not tainted 6.13.0-rc7+ #4
[    7.312184] Hardware name: LENOVO 21D0/LNVNB161216, BIOS J6CN45WW 03/17/2023
[    7.312186] Workqueue: events_long ucsi_init_work [typec_ucsi]
[    7.312190] RIP: 0010:ucsi_reset_ppm+0x1b4/0x1c0 [typec_ucsi]
[    7.312194] Code: 8b 44 24 04 a9 00 00 00 08 0f 85 36 ff ff ff 4c 89 74 24 10 48 8b 05 8b 6e 1c e0 49 39 c5 79 8f bb 92 ff ff ff e9 1b ff ff ff <0f> 0b e9 50 ff ff ff e8 80 f0 db de 90 90 90 90 90 90 90 90 90 90
[    7.312196] RSP: 0018:ffffc0aec0d0fdc0 EFLAGS: 00010206
[    7.312199] RAX: 0000000008000000 RBX: 0000000000000000 RCX: 000000000043c005
[    7.312200] RDX: 00000000fffb881d RSI: ffffc0aec0d0fdc4 RDI: ffff9f6bbf3b5600
[    7.312202] RBP: ffff9f6bbf3b5600 R08: 0000000000000000 R09: ffff9f6bc3e85360
[    7.312203] R10: ffffc0aec0d0fc68 R11: 00000000ffffffff R12: ffffc0aec0d0fdc4
[    7.312205] R13: 00000000fffb8817 R14: ffff9f6bbf3b5660 R15: ffff9f6bbf3b56c0
[    7.312206] FS:  0000000000000000(0000) GS:ffff9f71e1c80000(0000) knlGS:0000000000000000
[    7.312208] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[    7.312210] CR2: 00007fbdaed6f0d8 CR3: 000000022d62c000 CR4: 0000000000f50ef0
[    7.312211] PKRU: 55555554
[    7.312213] Call Trace:
[    7.312215]  <TASK>
[    7.312216]  ? ucsi_reset_ppm+0x1b4/0x1c0 [typec_ucsi]
[    7.312220]  ? __warn.cold+0x93/0xfa
[    7.312223]  ? ucsi_reset_ppm+0x1b4/0x1c0 [typec_ucsi]
[    7.312229]  ? report_bug+0xff/0x140
[    7.312234]  ? handle_bug+0x58/0x90
[    7.312237]  ? exc_invalid_op+0x17/0x70
[    7.312240]  ? asm_exc_invalid_op+0x1a/0x20
[    7.312245]  ? ucsi_reset_ppm+0x1b4/0x1c0 [typec_ucsi]
[    7.312250]  ucsi_init_work+0x3c/0x9d0 [typec_ucsi]
[    7.312254]  ? srso_alias_return_thunk+0x5/0xfbef5
[    7.312257]  process_one_work+0x179/0x330
[    7.312262]  worker_thread+0x252/0x390
[    7.312266]  ? __pfx_worker_thread+0x10/0x10
[    7.312268]  kthread+0xd2/0x100
[    7.312271]  ? __pfx_kthread+0x10/0x10
[    7.312273]  ret_from_fork+0x34/0x50
[    7.312276]  ? __pfx_kthread+0x10/0x10
[    7.312279]  ret_from_fork_asm+0x1a/0x30
[    7.312284]  </TASK>
[    7.312285] ---[ end trace 0000000000000000 ]---

--
Thanks,
Fedor

