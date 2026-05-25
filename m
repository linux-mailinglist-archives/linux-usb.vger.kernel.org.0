Return-Path: <linux-usb+bounces-38004-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sLKoJmwWFGo4JgcAu9opvQ
	(envelope-from <linux-usb+bounces-38004-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 25 May 2026 11:29:16 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 122805C895D
	for <lists+linux-usb@lfdr.de>; Mon, 25 May 2026 11:29:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9E373300AB19
	for <lists+linux-usb@lfdr.de>; Mon, 25 May 2026 09:29:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2A593E5EDA;
	Mon, 25 May 2026 09:29:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ToYbmhyA"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDD682D77E6
	for <linux-usb@vger.kernel.org>; Mon, 25 May 2026 09:28:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779701341; cv=none; b=mFgdoSpiJDL2qpqjtghGwZ9EVWnL57f40NFeAh1bOfPfQgbLDficYNc97DpjFFo98RpqVXi/dkWi3eXjseRrvSXMFLx1yi+VrZOY8r1UcK8eB/m1u9Iud9k6XCJTL4XsMXuWfV67DdayIZMklzH0KBXHxq9FFpkLxgOfJn2kOs4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779701341; c=relaxed/simple;
	bh=ZvshB2ooF1g8TGrIn+ikDHiQxOs9MPOpKhXgUDDQHR8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Oj/2+SEVY8M103j+hLoGifUaRqP35Ey6rCOfOY2/DyBi6MypPAdT2MOBO2TxA6k/esdeU4CJmhEeLy8W3fsX4potXpSSE2ZkdxF1XZvyh/BrTltgfJmUj5v1FwYHjtIN16JOIrHeelLR4WkUjFdtkkOcwgrrgOECbsMSUldPOFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ToYbmhyA; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-50e5c7eb565so102443401cf.3
        for <linux-usb@vger.kernel.org>; Mon, 25 May 2026 02:28:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779701339; x=1780306139; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=b+TrKzH8rOxpTql1iz6i/KxFDzEdUSC9ltFm8VOZKto=;
        b=ToYbmhyA9BBZUTmiomwGIdfy4FP0KjTGboohKa22VxJw3beh08u7E4KRCiyr+A1ZFn
         OqdUHuSerOITEr52d28GOOzUBqvFBLfc7JyJu5uOm4UJnlocZ0eJXbQSlvgCGTcAWjXv
         bwwyQUZx4/NnilyADPH/af1LxOTbFxApKCK0KALVV/Dzd0lI6SbASUr2ShDuSoBvy4Eb
         cIuxpUs4lnZVUSRsNSnVrL9lxTDkRcO+5D7zEFzVE7yY5OiN/gj/jqmjHlgk1V2mznR7
         j3nmEUEjeUe37C8a21bLEIWlUqmMWjk8F4vaxRkOMe5JTvGxc7pI2rXT7Vl1nrM33+9i
         FEfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779701339; x=1780306139;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b+TrKzH8rOxpTql1iz6i/KxFDzEdUSC9ltFm8VOZKto=;
        b=igCBNQblzQX4Y7Z0G7ECKSnrSICcmEZHgavBi9zsIn0sczsbRiKhYZkhHSe+A26V6t
         WA9OFcC0VEvUVBM45zKHEAKNT9BNqeiABBoGVbhpQMida3XFrFr4o8BMyKqe9SrDHWTx
         bj7K9fiy6RP0Ae5qVxQM5WWPigCMmlYB7LQ4ndlaFcQO2N8r8qbFj1ygL5LdsC4wM6Ub
         f5vqw6Mo4sn8jU/AZQnQm3RM9mu2EZhr83P5BlbDzkxbdPYj9TFXyfcq6SdX59KR13iT
         MogpICUB3Pqc5PeVYYIiiLmlaByXagdRKuBTRmrQ+vSXyfW9+KcWYJrjWphmiD8nn9xl
         s9xA==
X-Gm-Message-State: AOJu0YzoFtZHoF9Vfo2Og++EEOEWvwEhcx1WeDqN2JzTgNXULB7VsgLm
	y7nCT10bu+p4YB+dH6TyFisOgfvFqE6+vPs4gU7iwxg3y2MYZ5XlzMm0
X-Gm-Gg: Acq92OGwk9fQWuCJQzQXRt+6T3KS/Uw8e4JY0ZncLCwmP3Qd2xj9zOBEZOE+j2Qm1Ec
	x9VgTdRoYj9ULX+k6BA+ViTp17jBR9T3a/oJDXI3hx4bLliO2hTl+YSgP74gsdjTtRHGds+0RPN
	NQduHuxHHDfusgu69jpSLja8bWNmtTmJW75TyPDKk9oTfEzYV+w9ZT0ZTros8s3WblbWjs+RJAR
	apUmm2o+7Vn2TjgfVx2NbSCTxDfL0ro9PKa94RAh8h+OSGoq+5TldHZHcCEF9C3g/f0JGcqE2VV
	XkF8+1LEEMvnXDvGvh2vncXnmU9uzuNQZKhJhE16nb3xeMGaAUnVZhyK4ZkaKgxQofvbPEQIj2y
	uQ+a8N1WPUHO3TWZuLMgiVzbKoDhDodtJifPkB3aEPXG5Jq+6Dnv6wT6Y4FVOEg8Ds3qlAFb2yk
	IiR0lC5OZZMd8QO1rlHuxbtg8MyhowFP/5O8Pi5gKf5MJWkE527ZZQ7KIgtTBXbMzKohOa2ajex
	0b2e+3bsU1hvtTDUjJ8ASMN15XJ4U6ARV+QIm4pdNA=
X-Received: by 2002:ac8:7f8a:0:b0:516:889b:ac9b with SMTP id d75a77b69052e-516d4368673mr178951211cf.39.1779701338829;
        Mon, 25 May 2026 02:28:58 -0700 (PDT)
Received: from server0.tail6e7dd.ts.net (c-68-48-65-54.hsd1.mi.comcast.net. [68.48.65.54])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8cc80dcf4a9sm104255826d6.2.2026.05.25.02.28.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 02:28:58 -0700 (PDT)
From: Michael Bommarito <michael.bommarito@gmail.com>
To: Mika Westerberg <westeri@kernel.org>,
	Andreas Noever <andreas.noever@gmail.com>,
	Yehezkel Bernat <YehezkelShB@gmail.com>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/6] thunderbolt: harden XDomain property exchange
Date: Mon, 25 May 2026 05:28:24 -0400
Message-ID: <20260525092830.735472-1-michael.bommarito@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38004-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michaelbommarito@gmail.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 122805C895D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This series fixes 4 memory-safety defects and 1 data-handling
hardening issue in the Thunderbolt XDomain property exchange path
(property.c and xdomain.c) and adds KUnit regression tests.
All are reachable from an adjacent Thunderbolt peer without
authentication.  The XDomain protocol runs automatically on cable
insertion regardless of the configured security level, unless
disabled with thunderbolt.xdomain=0.

Patches:

  1/6 - reject zero-length property entries in validator
  2/6 - bound root directory content to block size
  3/6 - clamp XDomain response data copy to allocation size
  4/6 - validate XDomain request packet size before type cast
  5/6 - limit XDomain response copy to actual frame size
  6/6 - add KUnit tests for property parser bounds checks

Tested with KASAN on v7.1-rc3 and over Thunderbolt 4 hardware.
KUnit regression tests (patch 6) confirm the fixes and existing
tb_test_property_* tests pass on the patched tree.

Based-on: thunderbolt/fixes (928abe19fbf01)

Michael Bommarito (6):
  thunderbolt: reject zero-length property entries in validator
  thunderbolt: bound root directory content to block size
  thunderbolt: clamp XDomain response data copy to allocation size
  thunderbolt: validate XDomain request packet size before type cast
  thunderbolt: limit XDomain response copy to actual frame size
  thunderbolt: test: add KUnit tests for property parser bounds checks

 drivers/thunderbolt/property.c |  6 ++++++
 drivers/thunderbolt/test.c     | 40 ++++++++++++++++++++++++++++++++++++++++
 drivers/thunderbolt/xdomain.c  | 14 +++++++++++---
 3 files changed, 57 insertions(+), 3 deletions(-)

