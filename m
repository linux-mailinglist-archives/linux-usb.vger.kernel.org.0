Return-Path: <linux-usb+bounces-14188-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EEFDE9615B6
	for <lists+linux-usb@lfdr.de>; Tue, 27 Aug 2024 19:46:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6F99BB2223B
	for <lists+linux-usb@lfdr.de>; Tue, 27 Aug 2024 17:46:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D83A1CEAAF;
	Tue, 27 Aug 2024 17:46:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J7UEYqcs"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD9CF1C7B63
	for <linux-usb@vger.kernel.org>; Tue, 27 Aug 2024 17:46:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724780794; cv=none; b=UshAaJUdMlv42CgA9uSnPSa9dIruo8DofBJOe8+By95OB1zu/Fx5SMElgvHpnZreZ00tV724+6MYe3ikwB6/VuQtkM6wPrjjoEVzWcf09JoFJOdCvHM6Ngzz/o6M3bao4Sxmm/FjhLG3uvhKH/nW5Y4d0NqRCjZrTdRSWbalPQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724780794; c=relaxed/simple;
	bh=uo3jPuoccR1JB0YvPd1RPH9FV9Xsn60huK3zUB8XQDE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=dNH5F9iD10AdlWaJA0YFnZMCvOUsVhFwEd1wKfOrE2G2OxMnjekzVVypNR56QGd649AedTKgBb/s5fI/8W5VoDLHEPpFFb149aCI3LjYWJrwJkue94kMMTR+aUNmgYHwBvIPCnbSHlvnO/KV9Fl3kK9Ev6LDh4Zy8GD3ZRs41+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J7UEYqcs; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5343e75c642so5022323e87.2
        for <linux-usb@vger.kernel.org>; Tue, 27 Aug 2024 10:46:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724780791; x=1725385591; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:subject:cc:to
         :from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=uo3jPuoccR1JB0YvPd1RPH9FV9Xsn60huK3zUB8XQDE=;
        b=J7UEYqcsTHJBqWl9/MST/iPqvQj7Ir5y88RsZnJWuaq2GipLrx6nnnZD43kl9udhvc
         bMYWZqsBH50/No/xKG7jvHz7fIbg9dKy/I9Fq+Y2q3w2Ov0+Lt0+UbABFf2bJD8TXRbv
         wI+5oEj41tyNRDQQSOqlndNa+5nwQM25PrgdqEUzgcyGn2m7FPtwVztJJW2OdBTsTXZL
         J1z1+1W5ZulNTAnF666cYW/rPm3QOs2Ibsn5taOUzj9yLigRtoe3HbJQI+6VSCprXY9A
         ckPD5ct9NeS4x5ZNMfG/OdoQDJhnWAmCJmzROEMoCiLSrs6JZui7CvfBIOXcjl+eFVPq
         bnEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724780791; x=1725385591;
        h=content-transfer-encoding:mime-version:message-id:subject:cc:to
         :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uo3jPuoccR1JB0YvPd1RPH9FV9Xsn60huK3zUB8XQDE=;
        b=ZbqlD+cqdErBUv0BzhNYEqfG1MF7TYhSg8QzNeD9YzdQiRiaMOUNb85M1d6jnk7v6i
         dV6+ZC3KU3D3bIV/5xf7omxkHMf8vnziAGG0fV+D8HaS46h8KDhyjPZZM+ITp7u1dr7u
         ZDF4qbXTPOnywU3O063op6PZMQEBw8JzfKcFOS2aJX9FmDiZyAtK5Kgw+n4JCAj4r53x
         Z5tXYGnlqSxHUteJsMev+X6ikz5aUphj63aGsgpPrSbMAbv3n3lAiOfFvf6FtSsZTi96
         1vMBA6WWoQQvYk2zS4xSrKB1eSLClHz5SFUo7CedQTVa9sAZOStIw4A036Aft088uWdV
         4hVQ==
X-Gm-Message-State: AOJu0YxFV5qj79h2ESWK5PJJQxI7WR7oJgNby7Qh9Uo/4Nh9f8CrDmOk
	btCr4gS+WrLoP2GY6vG/eSdj8dIzFfx3qQ5GA5HsFgYNBqpvSzFYszmHhg==
X-Google-Smtp-Source: AGHT+IFs3hVv+Z8gsZYph+tsKF10VBphbh+CoS2cR1sC/LHErGh9kMxEdSmXsdvVWD+18lTd5eEjuQ==
X-Received: by 2002:a05:6512:234b:b0:530:ae99:c7fa with SMTP id 2adb3069b0e04-5343882e2e1mr9716868e87.10.1724780790417;
        Tue, 27 Aug 2024 10:46:30 -0700 (PDT)
Received: from foxbook (bgu35.neoplus.adsl.tpnet.pl. [83.28.84.35])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5334ea5d6e4sm1861663e87.225.2024.08.27.10.46.29
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Tue, 27 Aug 2024 10:46:30 -0700 (PDT)
Date: Tue, 27 Aug 2024 19:46:25 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Mathias Nyman <mathias.nyman@intel.com>
Cc: linux-usb@vger.kernel.org
Subject: [PATCH 0/9] Various xhci fixes and improvements
Message-ID: <20240827194625.61be5733@foxbook>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hi,

Here's a handful of bug fixes, cleanups and improvements for the xHCI
driver.

The first is a trivial fix, the second also fixes a bug albeit a less
trivial one. These two maybe deserve to go into usb-linus, the latter
perhaps to stable as well, but the patch doesn't apply as-is.

The rest are new functionality or code cleanups with low anticipated
user impact.

All patches were applied and tested on v6.11-rc5, all compiled cleanly
and worked without regressions with some HID, storage, audio, video.
Functional changes received additional functional testing described in
their respective changelogs.


Notably missing is a solution to the "Underrun after Missed Service"
problem. To recap, Underrun/Overrun typically has a NULL TRB pointer
and ep_ring->td_list contains some missed TDs and possibly a few that
have been added after the underrun occured but before we got the IRQ.
No way to tell them apart, at least by the spec, as far as I see.

On USB 3.1+ hosts we can get out of it with "expedited skipping" - it
ensures that the ring is never left with stale TDs in the first place.

On USB 3.0 hosts the underrun handler *will* sometimes face skipping
and it needs to make a decision.

Currently, it skips everything. This may cause DMA-after-free - not
great on IN endpoints - and "TRB DMA ptr not part of current TD" or
"WARN Event TRB with no TDs queued" later.

The obvious alterantive is to never skip on empty ring events, but it
can deadlock a driver which waits for its URBs to be given back when
all of them were missed and we can't get a valid dequeue from the HC.


I wonder if it would make sense to always skip the first queued TD
when we get an MSE with NULL pointer? I think it's legal, and likely
sufficient to avoid the stupid deadlock.

Just a last minute idea. I will think about it, but now I'd like to
flush this patch queue before it grows to infinity ;)

Thanks,
Michal

