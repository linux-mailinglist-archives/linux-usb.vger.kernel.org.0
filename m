Return-Path: <linux-usb+bounces-23819-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 85CF6AB0F61
	for <lists+linux-usb@lfdr.de>; Fri,  9 May 2025 11:42:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B51217A919B
	for <lists+linux-usb@lfdr.de>; Fri,  9 May 2025 09:41:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87B6228DB5C;
	Fri,  9 May 2025 09:41:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CUaKP4rH"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3563228DB57
	for <linux-usb@vger.kernel.org>; Fri,  9 May 2025 09:41:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746783708; cv=none; b=CTAPGlmUpwbPboi33jze6WygwFxhiLVnymRQhEnce+rtWEYxUpHIvl4UnfPfXINkSWgyFFmQ1BBF1TTSl+s7z6Y5KNH5uy/Rp5zm7gOCNudkdrlsdiai2WhY/ZAvWOSgenoSlh4x5aRC7AoDuBq3E5sq1Q405FZV4f9IYKqdbUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746783708; c=relaxed/simple;
	bh=tM3jHQC0FzbG0zNDUbEMp6melenNS3754YzFOfUWIpM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=ZFT4LLwSdUI9d3kEYqYyPiqBlcuiaAZx+hSD8K35rGxajoIt+vRF1DPe3GhzukJwnYcabZYta2RTB86GIR50Pve5tAMaUbQ1vSnMfJcXao0RVRDCo4Y3K8eZUAxw2fTkC5jTRixoC/viu6rnEcE+Ig8RogfXlamBWZ8U0BxVWII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CUaKP4rH; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-54fc80df9b7so487055e87.2
        for <linux-usb@vger.kernel.org>; Fri, 09 May 2025 02:41:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746783704; x=1747388504; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:subject:cc:to
         :from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Eo93QEWFKoPB7prBtCqkGvwnSudfeoxXBZplSqxpx9Q=;
        b=CUaKP4rHpk+ZRDe2mgMHUUrHnUYtOJb1sLQX+qywAEi9vw1zSlzz6vLpS5KfrVHa4E
         kM0za66IwXueptKoTQ+OLbMd86hstjqjvLx1e8a0/41molDGvkOtFUm1Es26TpmAy6tH
         31/xo+AZPwJWcmunkvUrGKURUnx2KPmOmemovvvK7IKp4FQKqzn0Td/x7pbn9jGUkG0e
         Ysw1VpPDAOXB1o6reBKNujqIs8wUNojQ80F67kXwcywT9i+f0tvoSTEEM1Blug55ktL/
         Y2yso/BuKI5DQXT/JDbv4mZfEOfGZyzm2SR//O/HLW2j46wOkW7pjWWye6yUFt7x6cIX
         7V3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746783704; x=1747388504;
        h=content-transfer-encoding:mime-version:message-id:subject:cc:to
         :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Eo93QEWFKoPB7prBtCqkGvwnSudfeoxXBZplSqxpx9Q=;
        b=FalgvYzh/KhsgFYv6b6nbl8//hb95HWn+FyejyyWaACit6Rd3cQQJCwqtMKooBcOMz
         CDCbD1nL/TOM34NSkfFXwj9kx3U69fGqZcd+cZ24pHzX5HULgDoVJNqzLwko9JEAUy7G
         i5u4Z+5ucLDvBUq5hWAkG65nIZPtNo6+ayv+xBUg9ULmvMMBL4yBM4AiE4ioelID9SG+
         WXN9PZqvzYdI3XFSwc9IBE2idTLh/5Wa2w2WbAXcj2UJ7ei0Amojn67eDa5jGsFNIKh0
         bx1BFWXFf1AJG/cOicdpHHjaL10BQxqgTkis2Ifi/MHK7EMDEIC1BMSaUrUFMRFuzvmp
         XZgA==
X-Gm-Message-State: AOJu0YwFAY4KsawjvJdCU+BXKxWE+WBNhQQMscnwCupfp3MLhjKPPwFR
	e3oCnnfiBM8h4FtBEWKCys65iuX9D6RQlhD3ZtL/EKDNBDHWkH2U
X-Gm-Gg: ASbGncuKDH7n7ieWfFBu9F3K4HOl4s76QP74BMoltFCEqVM1JJP4Twaja/tI+q08Rid
	HbX+i4EeC/f4RXcqRkXDFYQamliOT5vW4Ny5zbhLej2g5wbcW0ToMX3/vFRId4YoqZcKLhKLCbd
	8CWCKo6q/rbTw4yeai88ElImaUGuT6ud1nPxRb8M4pwZ90F40beHQryKXIUCcRgE7BSx4nRAwH4
	2xWhToLtljoiuIE9DJG/SuotUX7twt6UFsMtxzLqX5Llp01b8hl5ybHVzXox7KIRgIh0dxS84cZ
	LrHl15z7q/VNdpmdwzU/QgGncY5jCH/V8Oz7Cyb6wCePZp2SSsQZK8s=
X-Google-Smtp-Source: AGHT+IGxQfsnHZ7Ne46Us14jP7jpKkMcQFMcjuT5oXUYaS9xFGV0ho641XAZimBN5Gf/KtpJEZYaiQ==
X-Received: by 2002:a05:6512:2619:b0:545:4cb:b25d with SMTP id 2adb3069b0e04-54fc67b7bb6mr600589e87.13.1746783703846;
        Fri, 09 May 2025 02:41:43 -0700 (PDT)
Received: from foxbook (adte44.neoplus.adsl.tpnet.pl. [79.185.216.44])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54fc64b6b7asm224878e87.151.2025.05.09.02.41.43
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Fri, 09 May 2025 02:41:43 -0700 (PDT)
Date: Fri, 9 May 2025 11:41:38 +0200
From: =?UTF-8?B?TWljaGHFgg==?= Pecio <michal.pecio@gmail.com>
To: Niklas Neronin <niklas.neronin@linux.intel.com>, Mathias Nyman
 <mathias.nyman@intel.com>
Cc: linux-usb@vger.kernel.org
Subject: Problematic Set TR Deq error handling series in xhci-next
Message-ID: <20250509114138.7052dd3b@foxbook>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hi,

I noticed that xhci/for-usb-next now includes a series which tries
to handle Set TR Deq errors. It strikes me as a solution looking for
a problem, and frankly creating new problems where none existed ;)

I am aware of three cases leading to errors being handled here, and
none of them is addressed. One is harmless and easy to fix properly,
but this series appears to turn it into a "never give back the URB"
disaster. Tests pending, I hope to find some time this weekend.

There should be no need to handle these errors, they are prevented
by not queuing the command in wrong states. When the command fails,
it means the driver screwed up tracking endpoint state and other
things are on fire too, so the actual bug should be fixed instead.

The case of disabled endpoints is clear: no URBs are allowed, the
core is broken. It would be more productive to sanity-check core:
detect and nuke lingering URBs in places like endpoint_disable(),
drop_endpoint(), reset_device(), free_dev(). If Set Deq is already
pending at the time, give back the URB and let the command fail.

The case of "stopped" should outright never happen, we don't queue
Stop Endpoint if Set TR Deq is pending. It triggers a known HW bug,
so it's a bug. Note that this series already assumes that Stop EP
isn't pending when it queues a new one.

The case of "running" (or "halted", which "running" can morth into)
is possibly more useful, because we assume it's caused by illegal
state changes without driver's knowledge. But these are supposed to
be detected and fixed by handle_cmd_stop_ep(), because they cause
other problems too. It's unclear if retrying Stop Endpoint and Set
TR Deq again will solve any case not solved yet, but risk exists of
infinite retries on broken HW. (And HW is broken if we are here).

Queuing a Soft Retry and then doing Set TR Deq out of the halted TD
instead of restarting the ring is a weird thing to do and IDK if HW
will get it right. IIRC, some ASMedia had issues in similar cases:
it would retry the TD anyway, despite Set TR Deq.

The case of command TRB error looks wrong too. AFAIK, bad stream
ID only halts the endpoint if it's in a packet from the device. The
command just fails. And find_halted_td() will crash on Streams EPs.

TRB error also happens on ASMedia HCs under unclear circumstances.
It's either an HC bug, or (totally guessing) maybe a way the HC is
telling us that the target stream is the Current Stream, forbidden
by the spec. It only seems to happen with some UAS chips, and same
chips also have issues (but no TRB errors) on other HCs. If anyone
with access to the UAS spec (paywall) and a USB packet analyzer
would like to debug it, I can provide detailed repro instructions. 

Regards,
Michal

