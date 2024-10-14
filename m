Return-Path: <linux-usb+bounces-16194-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 36CE999D703
	for <lists+linux-usb@lfdr.de>; Mon, 14 Oct 2024 21:08:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D68ADB21379
	for <lists+linux-usb@lfdr.de>; Mon, 14 Oct 2024 19:08:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D38D21CB330;
	Mon, 14 Oct 2024 19:08:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VUWbEO8Y"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB077231C83
	for <linux-usb@vger.kernel.org>; Mon, 14 Oct 2024 19:08:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728932929; cv=none; b=E4A81tb5lKmMRIUqefH/7c/h3Z0YqiXB3MvhapT3FU1LuNQl8Zi6YzajvBhzB3ZF/2og0fJq3jykE3abiE1fy46I6DKpn1AVlJSHcXdoSBC6rKmTa5V1bVSVG1xp3kFgbFQ4Tacmmbjm1L70fBsCAoBLd//CHtWgl0lai+KS+1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728932929; c=relaxed/simple;
	bh=MieaqyIErl8rec8aifOzdqWvCEzlZSK2p06kqJRRHS4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=jpot92uJGsQ4nu9oEAdIGaQNUQx2YWh6NjdUfPnC7fLfP8aRiWaTlOA2RCpcd4PXutPIGEoW6Rm8THmp4SikNIwlP06m8QsdRKnlbJV0SEgziFG3cu4v+CYs3q36jhQwqy+ClhSZXMtr7Se7TK6jeqELueU1FqKnhHwtd2Vntl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VUWbEO8Y; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-539e8607c2aso2351105e87.3
        for <linux-usb@vger.kernel.org>; Mon, 14 Oct 2024 12:08:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728932926; x=1729537726; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:subject:cc:to
         :from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MieaqyIErl8rec8aifOzdqWvCEzlZSK2p06kqJRRHS4=;
        b=VUWbEO8YxZHkKq4Aa6l3ZGjTh0Gpl1lGdSa9HKI0Kxl0MoVYh7+ILmFAd9oGkN4Vdh
         q8fQRsxHhmPDlqxNbZDC7k4vRQVVm3tHz22EhqzxcTUJl4IQqaGJjMwSwoMbTIQNCH/e
         sYqn/1k1vir0bt8N3Ke7PzIbPGemnhx7TkY+lEO60gNvwsgr7hLcYHBrO6lIftKjD1Mj
         XnI1FeItg6oBoXkqUBSnmzGx53XokIQNxqc6Qlwnuv1mAhpo6tgI4g6gNR1uBXRsCYq6
         YmPXpUl0XAy/kALd3FsjsxMz+LzKEVWYJz+9TXEiyhCk4riC4CkCaPm5bomombB6UjTD
         ag9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728932926; x=1729537726;
        h=content-transfer-encoding:mime-version:message-id:subject:cc:to
         :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MieaqyIErl8rec8aifOzdqWvCEzlZSK2p06kqJRRHS4=;
        b=YssZq+uhk4eFtaoPERR7TD9eD+NxhQsNPhojzZaBn+SNarwDiMrIMEZEPFBQG4arsQ
         9PkWYt4/sCZlT27wxoXY1VLk2JLBL6sqzjtebO7WupmrwMn1zFU1hDcLdlHOBHV6aGlv
         9nNZTX71rI2Gj0egb7hAxISRIT2XGyI4WKmYwV4cXEISxueZTbkN+FtadhU/mpAC7P1n
         HJrogMTP8Uvn7BAaJGSBeUbRv68b5KjZyo4PQee2bj9NqIT+FoDCzbkHZTj2uLmdYo28
         2ZgE0uvCTjGWoLP73eb36cBncZ2Fsmd75ARAgyHzbvXGQMGuIDVnreLSZHHbiAIIsBty
         4rsQ==
X-Gm-Message-State: AOJu0YyGxGHTZQ4a3JDOiDpfOy+w0QZsIwB9vMZru7A+bCOsRE5EYH/n
	a4Xq0jRxFvkFPOoDxJKzUSR5Gyv1xSrzdN8uWZOhZjVEWdD12wBK
X-Google-Smtp-Source: AGHT+IGnj6P/tPSZ5+sDwoKbd5B5gq57S8k3EKfkMzKsQ3icrrpmrSdV0qru0xoK+LjF8K6DqQgFBw==
X-Received: by 2002:a05:6512:1113:b0:539:f1ad:b7a6 with SMTP id 2adb3069b0e04-539f1adba78mr2723370e87.37.1728932925449;
        Mon, 14 Oct 2024 12:08:45 -0700 (PDT)
Received: from foxbook (bfe48.neoplus.adsl.tpnet.pl. [83.28.42.48])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-539f49f5227sm567135e87.47.2024.10.14.12.08.44
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Mon, 14 Oct 2024 12:08:45 -0700 (PDT)
Date: Mon, 14 Oct 2024 21:08:40 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Mathias Nyman <mathias.nyman@intel.com>
Cc: linux-usb@vger.kernel.org
Subject: [PATCH 0/2] Fix the NEC stop bug workaround
Message-ID: <20241014210840.5941d336@foxbook>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hi,

I found an unfortunate problem with my workaround for this hardware bug.

To recap, Stop Endpoint sometimes fails, the Endpoint Context says the
EP is Stopped, but cancelled TRBs are still executed. I found this bug
earlier this year and submitted a workaround, which retries the command
(sometimes a few times) and all is good.

This works fine for common cases, but what if the endpoint is really
stopped? Then Stop Endpoint is supposed to fail and fail it does. The
workaround code doesn't know that it happened and retries infinitely.

I have never seen it in normal use, but I devised a reliable repro.
The effect isn't pretty - no URBs can be cancelled, device gets stuck,
if unplugged it locks up connections/disconnections on the whole bus.

With some experimentation I found that the bug is a variant of the old
"stop after restart" issue - the doorbell ring is internally reordered
after the subsequent command. By busy-waiting I confirmed that EP state
which is initially seen as Stopped becomes Running some time later.

I came up with a few ways to deal with it, this patch implements #3
which I think is the lowest risk. But for completeness:

0. Do nothing, revert the old patch. Not great, we are back to those
races and DMA-after-free. Seems particularly dangereous on Int IN EPs,
which may take a few ms to start - plenty of time to reuse URB buffers.

1. Ring the doorbell before queuing another Stop Endpoint. This ensures
that the EP will restart even if it wasn't meant to yet. Then a retry
succeeds and we are done. Super-simple and seems to work 100% reliably,
but what if there are still more gotchas in this hardware?

2. Set a flag on doorbell ring, clear on Stop EP or Halt. Look at the
flag to decide if it's the bug or a legitimately stopped EP. But I
didn't like adding overhead to DB ring, even if almost unmeasurable.

3. Set a flag when we know that the command will fail. This appears to
actually be doable. Then we just look at the flag and retry only if it
wasn't supposed to fail.

And some further ideas, considered but not implemented yet:

4. If we know that the command will fail, don't queue it at all. Other
commands are pending in those cases, so modify their handlers to do
our work for us. A little more invasive than the simple fixes 1-3.

5. Maybe it would make sense to ensure that the command can't ever
retry infinitely. Just give up and call hc_died() after 5 seconds.

Regards,
Michal

