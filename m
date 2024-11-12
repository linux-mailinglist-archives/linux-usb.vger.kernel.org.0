Return-Path: <linux-usb+bounces-17521-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1722E9C6527
	for <lists+linux-usb@lfdr.de>; Wed, 13 Nov 2024 00:27:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CB00E2873B2
	for <lists+linux-usb@lfdr.de>; Tue, 12 Nov 2024 23:27:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76C7D21C18C;
	Tue, 12 Nov 2024 23:27:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Yo+ECA2q"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6354021A4B7
	for <linux-usb@vger.kernel.org>; Tue, 12 Nov 2024 23:27:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731454028; cv=none; b=M4D6JeywsHTNaTAI3o8P7scU4DsRx+QiI7vvjrRzK9lCvoKG1/yiTBeNsKRbtWFSYWJ8HpAzswU2UbgLfSxgkiYxzgLhKAVcyBMkFJzeN+xKgcQV+xXdZwWOQmZ1ixmkXTVTtpX3LIGOuNaTLRN6FvNnYHkyrrKfMsEQPUng1g0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731454028; c=relaxed/simple;
	bh=X8rLu2ahY8mm0g2HCUTbwQ5gBfvpIxXGxFDF3tTWeFw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=pkKpuf2MgwzUKgXb1oNA0cOtqaJPuTphmcer3bWdkFLnJ17KwsMiITEQY6FsFmfNqA3GtrY1jB8eybhPc+sIW0H6uy9GBcpZAyMO+NxZTkqGdt+RwV1f3ccmF6ntQyDv44bUtC6DtKY0FOsZoRhKZtOBk0giZ4/EVBF9MEP0M78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Yo+ECA2q; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2fb49510250so55613251fa.0
        for <linux-usb@vger.kernel.org>; Tue, 12 Nov 2024 15:27:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731454024; x=1732058824; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:subject:cc:to
         :from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rt433rfdVAjt1GyNloL4NMq194SeyGmfEAG22kOvYRU=;
        b=Yo+ECA2qsspBXDKtvnbKPevXkE3jAnFzLsvCcnEZrGKCDICKNsNJWsmdhhF11/0R6m
         jawoHXyd8wR21TxL3/r1C3uN63ziJ+DdD8qUjqkRolydLFoX6iLh/ORgWVD4TK/DODfE
         6NrdPRQY8EMD0rFkSNMZMpk/o8wcpqpi7KywHohYzPq/wtCs3EHZF7MP5mnfRU0n2zNO
         Ns4f04IWA9XhuqDpe4k1OjeJdjsuhTlowVSbTeQpl5Td6AbnI5qp15Ms4kUFxNi+TeLi
         uZAUUJKbyBqLUP9GEofnX/kId6nySRk7EYGn7wLiHyw/h+v80qvPxf4V6XHoMIzS06h5
         2Yew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731454024; x=1732058824;
        h=content-transfer-encoding:mime-version:message-id:subject:cc:to
         :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rt433rfdVAjt1GyNloL4NMq194SeyGmfEAG22kOvYRU=;
        b=InBW4KdMamWR8KFD2ZUof7yhdtJHGKoZ88A/vXYA4i01wHNjT6hfxhZpP0Weqbvt7O
         UkSDSFVuk9KsBYd4jjF84kO+PnNB6xinEZqzhEblEtHo83GhAX733MkJ8ZFNYCmwJ8Rm
         pBwW81yUKAlss1tSMGDnoFhUy1uvGk9Cd7rzs8EQCCWWdv9LlX7ItACV6SzVAzX2VfwG
         VfOoAUYaEIZwePADWzOMIIjDFdlvYcUfrZfSn4wfvnu+42D1k8d07VyM1A1dNsG8npqr
         kUAlIo6GwYBDm5FcKaXYiLUyFFQy3FMTvMm/K8AFhMFjig2ZzLdbQ0T+G04ywyCqGSgT
         62dA==
X-Gm-Message-State: AOJu0YymbYPsVIdE9NTrDuJyHKQwvdc19hEkrGnOQSDC9fmeyl6lBOov
	YeibT8wQP6xtpEgPSXDbKq3X2pFidzgMnbYWpl0PIWFuGf44vI5L9eJ9BA==
X-Google-Smtp-Source: AGHT+IGqOJ+Zlbk2AUBcISQ3VFG+1SmdHtSJqxKsVYF1qHTg6DewMnzbmSy65CYLsoJV4GAqaMvhHQ==
X-Received: by 2002:a2e:a9a8:0:b0:2fb:c6e:9a36 with SMTP id 38308e7fff4ca-2ff4c59ed25mr4536701fa.24.1731454024079;
        Tue, 12 Nov 2024 15:27:04 -0800 (PST)
Received: from foxbook (bff246.neoplus.adsl.tpnet.pl. [83.28.43.246])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ff17901111sm21433411fa.54.2024.11.12.15.27.02
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Tue, 12 Nov 2024 15:27:03 -0800 (PST)
Date: Wed, 13 Nov 2024 00:26:58 +0100
From: =?UTF-8?B?TWljaGHFgg==?= Pecio <michal.pecio@gmail.com>
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: linux-usb@vger.kernel.org
Subject: Strange issues with UAS device - repro
Message-ID: <20241113002658.0a031681@foxbook>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Context:
https://lore.kernel.org/linux-usb/Ztn2ZsPtxmCTiR78@alphanet.ch/T/


Hi Mathias,

I found the holy grail - a simple way to trick the uas driver into
unlinking URBs and bringing death and destruction.

That driver almost never unlinks URBs, which is why streams unlinking
remained broken for years and no one cared, until that long and angry
patch which fixed it this summer.

The long and angry commit message suggested one reproducer: reading
a disk with bad sectors. Unfortunately, I don't keep such hardware
around and two not-broken disks I tried don't implement the commands
which would make them pretend that they are broken.

But the "strange issues" story shows a different way: certain failures
of SMART commands. I don't know details, but this is enough for me:
Intel 320 series SSD triggers it on 'smartctl -x'. And it looks like
"strange issues" reporter's disks did something similar.

So a suitable disk must be found, and also a suitable UAS enclosure,
because the first one I tried is buggy (or runs into a bug in uas?)
which causes an "Invalid Stream ID" error and end of fun. So I bought
a new one with the cheap and common JMS578 bridge and it works fine.

With this, it becomes trivial to reproduce the bug which I fixed with
"Fix TD invalidation under pending Set TR  Dequeue":

[ 9264.504123] xhci-pci-renesas 0000:03:00.0: Set TR Deq already pending, don't submit for 0x0x000000017323fe00
[ 9264.504125] xhci-pci-renesas 0000:03:00.0: Failed to clear cancelled cached URB ffff88816a293cc0, mark clear anyway
[ 9264.504127] xhci-pci-renesas 0000:03:00.0: Failed to clear cancelled cached URB ffff88812361c840, mark clear anyway
[ 9264.504128] xhci-pci-renesas 0000:03:00.0: Failed to clear cancelled cached URB ffff8881002e43c0, mark clear anyway

All it takes is running a few 'smartctl -x' in parallel, in a loop.

And I was curious to see those TRB Errors on Set TR Deq on ASM3142.
This is triggered (rarely) by 'smartctl -x' while reading the disk:

[ 4541.290234] xhci_hcd 0000:02:00.0: 5/6 (010/3) ring_ep_doorbell
[ 4541.290237] xhci_hcd 0000:02:00.0: 5/6 (010/3) ring_ep_doorbell
[ 4541.290281] xhci_hcd 0000:02:00.0: 5/6 (010/3) ring_ep_doorbell
[ 4541.380361] xhci_hcd 0000:02:00.0: 5/6 (010/1) urb_dequeue urb ffff88816a268a80 td-dma 0x000000000341ba50 stream 3
[ 4541.380368] xhci_hcd 0000:02:00.0: 5/6 (014/1) queue_stop_endpoint suspend 0
[ 4541.443637] xhci_hcd 0000:02:00.0: 5/6 (014/1) handle_tx_event comp_code 26 trb_dma 0x00000000034da400
[ 4541.443642] xhci_hcd 0000:02:00.0: Transfer event 26 for unknown stream ring slot 5 ep 6
[ 4541.443711] xhci_hcd 0000:02:00.0: 5/6 (014/3) handle_cmd_completion cmd_type 15 comp_code 1
[ 4541.443715] xhci_hcd 0000:02:00.0: 5/6 (014/3) queue_set_tr_deq stream 3 addr 0x0x000000000341ba60
[ 4541.443769] xhci_hcd 0000:02:00.0: 5/6 (011/3) handle_cmd_completion cmd_type 16 comp_code 5
[ 4541.443772] xhci_hcd 0000:02:00.0: WARN Set TR Deq Ptr cmd invalid because of stream ID configuration
[ 4541.443774] xhci_hcd 0000:02:00.0: 5/6 (010/3) ring_ep_doorbell
[ 4541.443777] xhci_hcd 0000:02:00.0: 5/6 (010/3) ring_ep_doorbell
[ 4541.443808] xhci_hcd 0000:02:00.0: 5/6 (010/3) ring_ep_doorbell

An interesting detail is that this bug is sometimes (seen twice so far)
preceded by a Stopped event which doesn't match any known stream ring.
This might possibly be our bug, or it's just the HW being broken.

Otherwise, there is nothing remarkable here. I hoped that it might be
triggered by the start/stop race, but it doesn't seems so. Fairly long
time between endpoint restarts, and yet it still happens.

This is all I have for now. I'm leaving this repro running on a Renesas
controller to see if anything pops up. I feel it's a HW bug in ASM3142.

Regards,
Michal

