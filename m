Return-Path: <linux-usb+bounces-14579-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0537996A322
	for <lists+linux-usb@lfdr.de>; Tue,  3 Sep 2024 17:46:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3771A1C23EC3
	for <lists+linux-usb@lfdr.de>; Tue,  3 Sep 2024 15:46:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 515BE18953E;
	Tue,  3 Sep 2024 15:45:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m0XfDLK0"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 640DB188A1B
	for <linux-usb@vger.kernel.org>; Tue,  3 Sep 2024 15:45:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725378344; cv=none; b=l2vSfEwvySrrKMO9NywfOMaCZM8FN7I7EjjcZ7297ApR9rQkGsnbQ9ThdNqgeRTuJPxMrR4Z3dxO5xpi8T50dmawbBLMlsXdaCJ7/7a6m97w9laETCG0U0/PuGdHLxHPtMSkKfOVdElPlAmZZjDbF8IMa7zf0eM0CAjiCmUGtgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725378344; c=relaxed/simple;
	bh=pPWuHicBGmldMjZLxKgK684U0dIc3UBd+xnPCtUm+ug=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JBKUQHKQb9yYMLE/fZi8rzGV8vCAvtzu3U1KMYvABaUFdURIcWQR2JmeDrr9z80RihWCR458lzIHzMamBBReNi+XRbykpY9gsyyjc9FRVfT7GHkXCBlsxiCTCI9PSgZ/EHfBMqcLjKHCYH0tXyAGTvjSO9O/mJpATooEr8d6DHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m0XfDLK0; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-534366c194fso5044454e87.0
        for <linux-usb@vger.kernel.org>; Tue, 03 Sep 2024 08:45:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725378341; x=1725983141; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2f33qveoBj+wxgpurz25czc5JkpTGYrVLfBbH2cpw/c=;
        b=m0XfDLK0ZUL0RrxfPXf+6H1kMV2g7c4wHL/Jomsw9pk08tdqtjnKxU/xTo5HtxqpCC
         /xKuKvlrkwFk26mRFRSqkHNLDmJPi2FD04qICZpEL4sEVZwaz0Ehq0NEnJS+8HS5M/Kh
         baIypsm7y3Nxv7M5IrHB3Uwvpt2YRonXATXcbK+KUUFhMtpgZYJ6W1cTIIz9rImeOcPe
         BWiiX+LShFTR/hEdx5DJ1LeNU6DEUqUEA6Yp3Ia81W02KmiiuRGnU9AGht6rAKrVzBLf
         q93DcNGMF/HEH1EInNl8gEfy1HyrX4B0KYPfxPIFlY59FUVL6EWKV/E1pY9c9J7585Pc
         fzYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725378342; x=1725983142;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2f33qveoBj+wxgpurz25czc5JkpTGYrVLfBbH2cpw/c=;
        b=O7/mgZAPDrZlxb4vT+vt2WOjD/7NBRptGo/zFItMcAOmugfDETZgi2MzNegYkOD3Tg
         Q5BwdwoDd2OTRAbZ0O3Oq1zSHVk9Tlwj8fuWK9kaPV4YNJyju2jBMm1cs2Qj6abJ1o2x
         HxArrsjly7uLF5SKFQ7M9ApCqoKz0aF8189UHv8ro3yRqgqG5E6avd+XZPdRL1MFRcTo
         yIB1AJ4TfHVN7BFgM6+mMIxafwICxK/gYJYpkOaaaBjiH1p8PPU4R5p0GLwa6bWScmWg
         Ru9+5CkjIiSa4o5/PzwgIgM67Gk+DUWuQkfN83Ua0DN+DTNHu42K14f0AsUlSC5wIH0Y
         wz4g==
X-Gm-Message-State: AOJu0YyoIE2c9u8eLbLq6Ts1yFm2b7zn5V71Op5B9AS6Rtr2s+A5mvAJ
	JRWtDGz4cDtjr3tN1fM20MeI38JuWzTLsEQHfhEfSfjWYiF3I/ER
X-Google-Smtp-Source: AGHT+IFnGutTV4t0Ln1TVAmFDAnO53Lv6pFxJtCGAmvsVh712szLfkq9KZRaGZhqq2iC1md4s4E/Vg==
X-Received: by 2002:a05:6512:68c:b0:530:aa53:60f6 with SMTP id 2adb3069b0e04-53546b33ecemr10056056e87.15.1725378341001;
        Tue, 03 Sep 2024 08:45:41 -0700 (PDT)
Received: from foxbook (bfh247.neoplus.adsl.tpnet.pl. [83.28.45.247])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53540827bb5sm2103255e87.165.2024.09.03.08.45.40
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Tue, 03 Sep 2024 08:45:40 -0700 (PDT)
Date: Tue, 3 Sep 2024 17:45:35 +0200
From: =?UTF-8?B?TWljaGHFgg==?= Pecio <michal.pecio@gmail.com>
To: Marc SCHAEFER <schaefer@alphanet.ch>
Cc: linux-usb@vger.kernel.org
Subject: Re: Strange issues with UAS URB cancellation
Message-ID: <20240903174535.6e5e581b@foxbook>
In-Reply-To: <ZtcVXoI6jNM9Lqbl@alphanet.ch>
References: <ZswP0+cLIqkTF0D/@alphanet.ch>
	<20240903094822.3ae297cb@foxbook>
	<ZtcHOlqlQMMD4LzY@alphanet.ch>
	<20240903152218.74393a9e@foxbook>
	<ZtcUGe0FWxpO6058@alphanet.ch>
	<ZtcUq37F6gqgzifm@alphanet.ch>
	<ZtcVXoI6jNM9Lqbl@alphanet.ch>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

> On Tue, Sep 03, 2024 at 03:52:43PM +0200, Marc SCHAEFER wrote:
> Sep  3 15:53:37 video kernel: [  355.639064] I/O error, dev sdb, sector 13962240 op 0x0:(READ) flags 0x4000 phys_seg 128 prio class 0
> Sep  3 15:53:56 video kernel: [  374.766217] xhci_hcd 0000:01:00.0: Stop Endpoint Context Error & Stopped on slot 9 ep 10
> Sep  3 15:53:56 video kernel: [  374.766227] xhci_hcd 0000:01:00.0: Stop Endpoint on slot 9 ep 10 failed with comp 19 ctx_state 3
> Sep  3 15:53:56 video kernel: [  374.766587] sd 15:0:0:0: [sdb] tag#3 FAILED Result: hostbyte=DID_ERROR driverbyte=DRIVER_OK cmd_age=225s
> Sep  3 15:53:56 video kernel: [  374.766593] sd 15:0:0:0: [sdb] tag#3 Sense Key : Illegal Request [current] 
> Sep  3 15:53:56 video kernel: [  374.766596] sd 15:0:0:0: [sdb] tag#3 Add. Sense: Invalid command operation code
> Sep  3 15:53:56 video kernel: [  374.766601] sd 15:0:0:0: [sdb] tag#3 CDB: Read(16) 88 00 00 00 00 00 00 d5 04 00 00 00 04 00 00 00
> Sep  3 15:53:56 video kernel: [  374.766603] critical target error, dev sdb, sector 13960192 op 0x0:(READ) flags 0x4000 phys_seg 128 prio class 0

Hmm, this is possibly not a coincidence, but it's also not the same
"ERROR Transfer event TRB DMA ptr not part of current TD" that happened
last week. Let me know if you see the other one, because those messages
should now contain more information thanks to the patch.

But this is interesting in its own right, I will have to think about it.
Maybe it's not a HW bug but a SW one, maybe also on my NEC controller.

Regards,
Michal

