Return-Path: <linux-usb+bounces-26658-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3825EB1F9A0
	for <lists+linux-usb@lfdr.de>; Sun, 10 Aug 2025 12:20:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D7C7E3A3827
	for <lists+linux-usb@lfdr.de>; Sun, 10 Aug 2025 10:20:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68871244678;
	Sun, 10 Aug 2025 10:20:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=it-loops.com header.i=@it-loops.com header.b="Tsa9P2mr"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1410C142E83
	for <linux-usb@vger.kernel.org>; Sun, 10 Aug 2025 10:20:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754821250; cv=none; b=H0k5pHN4y8j2IU+c4Tz19DhSyvfwpQdSSqEXU1P+CMaOTMaOAiw9heGwTKZLtDpxw6InzDs8mm/eAyjAGyIJ28BHuvDD4JZSt4U2B2wL8C3h+9WdSAdsqRxD+MDiTJ+8P2dpYm6foE/hsyJw7h7ZJre1b6rCP3DYt/K9zauUTHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754821250; c=relaxed/simple;
	bh=rB+IVz+n0nhsQdvdoato0wJkr+lkzQlFCzDqAKdN7ec=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=p8YM4pBUfZ0Vv/olYPTaQUaxlA7S8llDV2QH251wqLgzhp95fmWbzAsHiIVPgc+GIZS5XW4tzCqojxdr2s1pNb2e+9L0fUkFnLPWCHNAe6wWKrA3Qra2kPT2dF8ifQWMRtlqlzCJKEiGxkbrujZeG3pD9vu/VDHKTQDO4amg95E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=it-loops.com; spf=pass smtp.mailfrom=it-loops.com; dkim=fail (0-bit key) header.d=it-loops.com header.i=@it-loops.com header.b=Tsa9P2mr reason="key not found in DNS"; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=it-loops.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=it-loops.com
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-af91a6b7a06so593436666b.2
        for <linux-usb@vger.kernel.org>; Sun, 10 Aug 2025 03:20:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=it-loops.com; s=google; t=1754821247; x=1755426047; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=DozL9rRRPyQFB77aHdhw2TrfVAdIZd0ifD8iP3rdZjU=;
        b=Tsa9P2mr7qmMbeGUY0ltDg0+mBrUj2v3e2AzGIlY+GrLhi0Fw1vGH+hV8pgSh5Wr2c
         QVcJnmNOtfYmGVoru8KZYQmEqJUSL2jsz0wjgTAoZz0iHsA3/bXOUOxFKoxNZbl6VewF
         3ECjsv1mpFwsFTU0To2Ptr0ohSF5xqxrqwRoc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754821247; x=1755426047;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DozL9rRRPyQFB77aHdhw2TrfVAdIZd0ifD8iP3rdZjU=;
        b=DBJJXcyQRV+GSaaCQZcnJ+miWu/oRo/K17o/osWIXtdFzbu/LMTe4uiV28RG+EzH21
         XrLJ3HohMBF6b1uj27WysGLoCrNgCNe00v5+9waPhdvFOVyR29D/2uSRyjebiwAKOz++
         JkWAF3o729wz3k5sMIs+ivA/iKgzTkQ36dLFG6nAs1s/D9AlAfn84xE7mF77jPmcSs91
         JKdvCqstco2/ss3IAHH0mrT9i81Vfvvv0RoBDLPVonin7ttOhjSTXBUSstis8wrtLp+1
         rER7ni4wlEMSueuKIYvgQ8YpihkcyVJdRaIMC+39Ef9ibr9S8YfsSqvTTNQbXbhrZTyw
         URVw==
X-Gm-Message-State: AOJu0YxvNN3j3iLBXVobpB5Lpkcy3dYeG8TViwHFEQ/KIocsaBY1S/mf
	p9nX0uuA5SzXYpoEAkMJUj/RymgMk/9e4PDOcdt89ETI0RtDBfv/z+KnX2m9YP8Nl9vAH3oGfRb
	TCIBsX9C9BW8tVGbddkCjL837E8bZdiMW1HSVFE7L4ZwO4mkDvZga
X-Gm-Gg: ASbGnctHn7pC/Oh3cn/set1LJILFHw62RaoDnHhTskBA31+rVCuCnR9edNwEqOyQ11J
	FwPLKOXAPb+tLXqC7pFWS6L4XdlvkOWmJBSDuifbvz7N/R77P54FBw7r4xk9ZBeO9z7Rg37xsFy
	6pVps2s8hHz/fKWiAciD2UKRm6l3ZWrUWE3ZiOVhTTrINRf/sT9CIMrrZJXWFnySNknrTLoGHkG
	4Ekk+Ru
X-Google-Smtp-Source: AGHT+IFoc6UW7BwLFpSmDdHN3noN+sunsFaBOpEBIhv5G1OlsBGHL15lFklBpKJCkOS0zJ7mkh6umc3HcJ4qMjGx6Rw=
X-Received: by 2002:a17:906:730b:b0:af9:3611:924e with SMTP id
 a640c23a62f3a-af9c64fcd21mr829741566b.53.1754821247052; Sun, 10 Aug 2025
 03:20:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Michael Guntsche <michael.guntsche@it-loops.com>
Date: Sun, 10 Aug 2025 12:20:36 +0200
X-Gm-Features: Ac12FXzNLC_o-BCHKY7XT04TPLRcHNjQR_Yws3TnRwetax5lkKenkCYTRNQYQ9k
Message-ID: <CALG0vJu32Ynitoy9q_QSm43-g0_Wt++T_0HxfSNFdrwMc=bXnQ@mail.gmail.com>
Subject: Kernel panic after return from hibernate if thunderbolt state change
To: linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello,

I recently updated my kernel from v6.14.2 to 6.16 and started having
problems if I return from hibernate and the thunderbolt dock was
either connected or disconnected while the machine was down. This
results in a kernel panic with no log entries.
The device is a  lenovo X1 Carbon 11th generation and the thunderbolt
dock an old caldigit T3 vanilla not plus.

Steps to reproduce, at least for me.

- Start the machine from a cold boot with thunderbolt connected or disconnected
- Once started up, enter hibernate mode and wait for the device to turn off
- Plug or unplug the thunderbolt cable
- Resume the machine

Result:

The machine goes through the normal startup procedure until it reaches
"Resuming from SWAP" , then the screen turns off, the caps lock key
start blinking and you hear a beep beep sound. The sound is different
if the device was plugged in or removed during hibernation. At this
stage only a hard reset is possible.

If you return from the hibernate state with the same connection status
as before (connected or disconnected dock) the notebook starts up
without any issues.
I had a look at the logs but I could not find anything so I think
nothing gets logged at this stage during the startup, or the machine
is not able to write it to disc. Since the screen turns off as well, I
do not see anything on the screen either.
I also tried a few 6.15 kernels and I see similar behaviour there as well.

Kind regards,
Michael Guntsche

