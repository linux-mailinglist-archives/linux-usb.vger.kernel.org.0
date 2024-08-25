Return-Path: <linux-usb+bounces-14044-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id DA55295E1C2
	for <lists+linux-usb@lfdr.de>; Sun, 25 Aug 2024 06:58:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6EF8BB2184F
	for <lists+linux-usb@lfdr.de>; Sun, 25 Aug 2024 04:58:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 565692AD15;
	Sun, 25 Aug 2024 04:58:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PE8NuIC9"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D4E429408
	for <linux-usb@vger.kernel.org>; Sun, 25 Aug 2024 04:58:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724561919; cv=none; b=AuBte4/1ydN7qVnQFkjQOMWgiTcWAK55LHU0jMWKDL2wDSh1MgjSkqHnLnLuzy0kxMg39HXEz9AOMM7lGL9Y6KkX/LSfOQsZiZELxUlz0i7iPNJNRhmCAjrPjZyQ23HCXbB/dac5KxF70NybCaDqkht/vbLcUg+ZvWHI2aOIUzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724561919; c=relaxed/simple;
	bh=N5OkSEHsu/C3dlcfx8ILpDBsgh13WinUuefZv4qkvvw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TcB8TGqzvZwFNubVGcpOPbvvO63c7SQNQypVgIPsSbyXYQcZCDCKATKDvzJ5FzN0j2043uAMqLmQAyTlcxUfjTtpBkvS0VONxGC6PQiimOo7yeHYCLl5k3VGOBMBBs92BJlJ2Ejh/Fx48DR39v74wFZLy1CMvm3IpVb7yRWHlJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PE8NuIC9; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5a108354819so4293364a12.0
        for <linux-usb@vger.kernel.org>; Sat, 24 Aug 2024 21:58:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724561916; x=1725166716; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N5OkSEHsu/C3dlcfx8ILpDBsgh13WinUuefZv4qkvvw=;
        b=PE8NuIC9ciwtvxL3bbdSn2BgFR9/EfKr8X8wL4qCWph4CmlOUO6aM2wC+xl7nnbf0N
         JncuhBceiR/JJGBo7OcKjW2pD4hF9LQFCyr7ErsnLxpafMLc89nY/rZuZgo0ESN418ob
         3Pvkc2W77Q/aoD4g0cplrypwVheyXWfKst2oFWYxwE1zbEQZpsKRSmOSoThuRZTatAJS
         nwsEa1mWSthXHAHAo+lNkzBLr3dxg2GYCNGwK8rwg9wDyNoLIayQ0LxlGK6D9bzIv4gg
         FMYsExZrLlGxWloDdLQ0RgarGzAQ+rcZ21XG/poy/YEDa4sA9QeNq7qzCU/1D4CccmJ2
         Mmmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724561916; x=1725166716;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N5OkSEHsu/C3dlcfx8ILpDBsgh13WinUuefZv4qkvvw=;
        b=Uz4CU3pAKqy7dW7SN+G0K4icchaleam27hqgyd4eK7D2ECXwdPNe651roAL5wNT82n
         tWg9kWpY9kcDgn6zLr18F6R2JmTNKrG3dfkgQaraTNL/X6tAYGNHWnb6RinBWnPkhwa7
         16CW43zm1g1yJwTXW70tph5IUASRuSb4pyTJdm8WC9tLiRSweHd9f4TGSTdlshO+QNoq
         EWeo6bZOAx1uBpm6iILsOcalRGdDExcrDVjLQTD/lrMa7Yoq0frymtDbwFryBnnrpFJh
         3dus9q1kS8kXAfM7cEOEaarU3RU091DQvK5Q+altctct7yQ/rpfYdD2x+kIaUJGQU18K
         9FeQ==
X-Forwarded-Encrypted: i=1; AJvYcCWiIA7L/JJMv0x6v9rwIWElQVG6/dkGjSlvtX81RIW673yEF84FB9zpbzGHz8Fy43gOX0MEIEO3oDM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxTno7g8CkmS49mxIfgkNdetIgLRDzL1l7TPW1ttIzAshUT6Cb4
	SX2ArlTQ6bYeXUsx4f+7mA3lYp/VxufiKYpCmKu8zF61d8rzfQGF
X-Google-Smtp-Source: AGHT+IEjqmYSFrBrMGlQdH6LTdFqCWY+wlAmZFQ3NrFT+wxrVldKdvKSXjvQOeTONXl40P6JNmDkwQ==
X-Received: by 2002:a17:906:6a18:b0:a7d:c148:ec85 with SMTP id a640c23a62f3a-a86a54bff7dmr404324366b.62.1724561916206;
        Sat, 24 Aug 2024 21:58:36 -0700 (PDT)
Received: from foxbook (bfe111.neoplus.adsl.tpnet.pl. [83.28.42.111])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a868f47c12dsm494123666b.144.2024.08.24.21.58.35
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Sat, 24 Aug 2024 21:58:35 -0700 (PDT)
Date: Sun, 25 Aug 2024 06:58:31 +0200
From: =?UTF-8?B?TWljaGHFgg==?= Pecio <michal.pecio@gmail.com>
To: FPS <mista.tapas@gmx.net>
Cc: Mathias Nyman <mathias.nyman@linux.intel.com>, linux-usb@vger.kernel.org
Subject: Re: Misbehaving Alder Lake-N PCH USB 3.2 xHCI Host Controller
Message-ID: <20240825065831.0eaba5b2@foxbook>
In-Reply-To: <ffb0be5f-11f9-4f94-b292-f47885cfa26a@gmx.net>
References: <20240820130158.339b4d87@foxbook>
	<bb565e29-10e9-4211-a854-fdd9771149b4@gmx.net>
	<20240821150233.4f8f66ef@foxbook>
	<e6879e07-3548-41c1-b18a-55c40d041b86@linux.intel.com>
	<2b81ac60-32f5-4b71-98de-d336b7282cfb@gmx.net>
	<ffb0be5f-11f9-4f94-b292-f47885cfa26a@gmx.net>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

I believe what happens is that in full duplex, either by request from
Jack or on its own, snd-usb-audio attempts to synchronize the playback
and recording streams by scheduling packets to move in specific USB
(micro)frames.

With playback only, the queued packets are only marked "ASAP" and the
hardware can cheat by delaying them to the next frame if either:
- it fails to do the transfer on time for internal reasons
- we fail to queue the transfer before its due time

See discussion in xHCI spec 4.10.3.1, 4.10.3.2.

Regarding capture, snd-usb-audio seems to always queue about 10 packets
or so. Latency depends only on the hardware returning them quickly and
no delays in the IRO-drivers-application pipeline. There is almost zero
risk that the URBs won't be resubmitted on time and the hardware will
face either an empty queue or an already stale packet.

That being said, I'm seeing Missed Service Errors on the recording side,
so it's possible that in my case the ASmedia controller is to blame...

