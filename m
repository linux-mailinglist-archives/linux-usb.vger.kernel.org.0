Return-Path: <linux-usb+bounces-16692-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6039D9AFFDC
	for <lists+linux-usb@lfdr.de>; Fri, 25 Oct 2024 12:18:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 24734281739
	for <lists+linux-usb@lfdr.de>; Fri, 25 Oct 2024 10:18:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC9271DAC99;
	Fri, 25 Oct 2024 10:18:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M+PhviGE"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 570D0192587
	for <linux-usb@vger.kernel.org>; Fri, 25 Oct 2024 10:18:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729851497; cv=none; b=qWbPDSzDd5G+g0M8ShMowPEam7yt1+qg3kQ7gPd6EtUxjuAHehti714WjgA+RXq95fMAQtBhzJgcniHUnQnzPnOsji1UXYSBU5ROdaGypm/1lrsXPnu4jOAF+i0wqrdD5QsFgJNMVUsWs/zurVpHgm+Un6OMN5GaNvIsvoYcr+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729851497; c=relaxed/simple;
	bh=dem5SHPTQ9/P43Ou4+ZOcovgF0Khsy5EwOdsgzDUjx8=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type; b=AAZQSig3hw3NR+BRtzxZhT50EGu32Gnb9rKG+NPJc8RPRfGmiImJFXnTKDIDOWj1EHeUoQHx+5zC7KzDPFNiTQnukLhrH7YsJbCg+VgpeahnhMm8hSEz+8iK5doDZZQrdKrWdJG5qMIa2BnlenOmxh98SUuNJ2RAK63XwwTSExk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M+PhviGE; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2fb59652cb9so19129981fa.3
        for <linux-usb@vger.kernel.org>; Fri, 25 Oct 2024 03:18:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729851493; x=1730456293; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:subject:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=VClYHkRI1HBJhvgWb2up79t9Z5KFXYplikAxjaQSY2E=;
        b=M+PhviGEuM9MPtsJOHCFTGtHJ/mPdoDVWTE0L6cZpwOxmagm78ZbX+bVeeGAVHKVtH
         pTrMvK+g49sxdS9O5yKLxFI5j7FSpcYQR6CCnvZJkAVQ92TdQTxdZpxXQFpNB5QptnbZ
         nvfx2rBPJbsP8dAO04za5HYP6h1b2X7zscQ7HWNMIaZNWHiYdfp4EeHYR9RxUxzCAgJl
         rJdz6v85oNEljncwkzFdR5zMhNplgTfQOKrdn3TYw+vrlB46qXH/p0z3Uxx3Qx3mkayq
         6jFu0c77tJN5TSAfxYm7HiJekbqmO7KabQ6l93rnNcTfUcwBWtKSrTqpiE+xaE8tq8xp
         KMHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729851493; x=1730456293;
        h=content-transfer-encoding:mime-version:message-id:subject:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VClYHkRI1HBJhvgWb2up79t9Z5KFXYplikAxjaQSY2E=;
        b=tkOWMA089nVlsDFIH6vIMDM0eZ0g/4UB9do+FZa8n0uJjRV+lcBXSRXt/B+0DFhUPf
         0Vwdfej6RehuMJBHYlV7egdLU2TmAkATg8USZ5LWT3j10Zz7oYmI9HOO34r/+tAvtXaP
         5xvt1UQoO5EebbKGYcATv7tNc5vPKHzt5kjp+gAwDzhwLzxY8g0IFVoVhW4WB03uOHgT
         QWLmkN7UWA3DGxsKCPSp8S/ypeCPq9gjKPz15lTZ2wRO1mO6kDxAtscIcaRZ0KWjbxU3
         XIbhuK3EKlZrLYYCfKOkbJGS3onSDclnUWdf+kpdAWWmqHW4rAyXiO1NFJbWcllIgHGE
         Eo6w==
X-Forwarded-Encrypted: i=1; AJvYcCU2C41gUPOOJ7GQfefB5LuOkvIbziBhWe/rDxt4n3wIuQksMRhgGKo5VZPzxdR+y768d9uM19IfO7o=@vger.kernel.org
X-Gm-Message-State: AOJu0YwgpeoDLwJQ4odj1VsGscjg5d5KcCy866HnRaFyppnxLDE3ZCwR
	Wqa6UMwx24oWmWpJy6V72OwBv6/1eU76JBHLc/fKeZIGa7hdYrlE
X-Google-Smtp-Source: AGHT+IGOY0xm2KMnls/Z1S/2KBp/oOZE9xXPbxuCO9uMEZ7GRBf8bKJJH0f/t68lkoKNP2GsGnm+9A==
X-Received: by 2002:a2e:4e11:0:b0:2f7:58bc:f497 with SMTP id 38308e7fff4ca-2fc9d59f0camr38795661fa.28.1729851493051;
        Fri, 25 Oct 2024 03:18:13 -0700 (PDT)
Received: from foxbook (bfe176.neoplus.adsl.tpnet.pl. [83.28.42.176])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2fcb45d1f6bsm1307891fa.86.2024.10.25.03.18.09
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Fri, 25 Oct 2024 03:18:11 -0700 (PDT)
Date: Fri, 25 Oct 2024 12:18:06 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Mathias Nyman <mathias.nyman@intel.com>, linux-usb@vger.kernel.org
Subject: [PATCH 0/2] xhci: Fix the NEC stop bug workaround
Message-ID: <20241025121806.628e32c0@foxbook>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hi,


This is the promised v2 of this bugfix. It took longer than expected
because I got sidetracked by two (related) issues:

1. looking for similar bugs in other chips
2. simplifying this to avoid adding the STOP_CMD_REDUNDANT flag

Changes in v2:

1. Dropped the warning patch, because dealing with other chips is a
   separate issue from fixing the bug in existing code.
2. Added CC:stable to make the patch bot happy.
3. Some comment updates/clarifications to address questions asked by
   reviewers. Comments made vendor-agnostic, no longer mention NEC in
   preparation for other buggy vendors.
4. Added an RFC patch to simplify things and avoid queuing redundant
   commands instead of trying to handle them. Still a little dodgy in
   one place, problem described in a C99 comment. But it works for me.

The simplification is a separate patch because that's how the code
evolved and because it could enable the more straightforward and lower
risk patch 1/2 to be used in stable without patch 2/2, if desired.

Or otherwise, I could squash the patches together, of course.


Regarding other chips, the following was found:
1. NEC discovered this bug and fixed it in a silicon or FW revision.
   Some chips have the bug, but I have one which doesn't.
2. I couldn't reproduce this bug on VIA VL805 and Etron EJ168A.
3. Two ASMedia chips tested, both have the bug. ASM3142 aka ASM2142
   is quite subtle, because it only seems to happen when multiple EPs
   are used at the same time. I suspect it's a matter of the command
   ring fetching commands asynchronously before we ring the command
   doorbell, or simply increased xHC load triggers some internal bug.

ASMedia presents an additional challange because it sometimes gets
stuck: Stop Endpoint fails in Stopped state even though our ep_state
says it should be running, and it never starts. I need to investigate
what exactly goes wrong and if our ep_state is bad or the chip.

This is dangerous, because the naive workaround would simply retry
the command forever. I suppose it may be a very good idea to add some
timeout. Say, if 100ms passes and the commands are still failing, just
assume that it is stopped for good and go ahead.


Regards,
Michal

