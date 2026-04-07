Return-Path: <linux-usb+bounces-36034-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mIR1Ioyn1GmkwAcAu9opvQ
	(envelope-from <linux-usb+bounces-36034-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 07 Apr 2026 08:43:24 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DCDF53AA642
	for <lists+linux-usb@lfdr.de>; Tue, 07 Apr 2026 08:43:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 533DD3068EF8
	for <lists+linux-usb@lfdr.de>; Tue,  7 Apr 2026 06:40:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 211DD23C4F3;
	Tue,  7 Apr 2026 06:40:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B+Ma0meQ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A60A9374170
	for <linux-usb@vger.kernel.org>; Tue,  7 Apr 2026 06:40:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775544036; cv=none; b=F7gEAE9akLtjPkMYfHS2lekUYd5LC5EPYE6hie2UYRaMcIf42oShPJ5HKQIQGhc9ACnuchIoPh3O2hlDxc/z3v4pIt0Rs1+8fdO0rZkrgb15CXxFx+QJ5sYCPUEX1bHuU3972ZPRXyOXEolBWx36CDIshTKVyQvM9EaHA0JagyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775544036; c=relaxed/simple;
	bh=PXH0Ixexzq4lbu1fRyzM+naW8Di7HO4c4pNCbFLJpSg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ERpRM/lpY9wIp9gRc6RI4vZ+pss+d+R3uxdYUokrN8M2M4sI8IdQZjO9OtJ5patGYdyqUNTdhLtfI/Yakswm4uQ3OnTqlVFnWFayzXJw61S/gCRkISShaHm4VvFCbWlSOTxbQS8YCYdTjnsYNFDNERcjLq28V9WQXA+eN93VNQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B+Ma0meQ; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-c6e2355739dso2019061a12.2
        for <linux-usb@vger.kernel.org>; Mon, 06 Apr 2026 23:40:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775544035; x=1776148835; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Wy9jQVOnIYjxy7FWem5JONQKIoJoRbyZ+S+kpmjt+7Q=;
        b=B+Ma0meQAYta8Py4pKX8zi8JHd5JY0A3rpW3/FO5X0QrLMwFiHHUd5slvkKYPkl7uj
         TVlGxNnBnCfGn61xGHVRYhyb9D/ldNf3KRJm2mXhcIWt3sJP/d9NDhnOe48L7ApTDFiM
         krPEfGQJf3qZejZJ7hQC2IqnmJ3CE+icNEg6LM9Nafk6JlB1BVmW9dclgguwXVH/mRVC
         apM8l30czuWVD6xwokc/iDtzP/3X0CwzO5lHWMzpuU9aVj7wprv9h7SCQS4GJ7/jXFQ7
         8ocCDJWE8ljUhRp7K/+ZMR2I5on8RuSOsxKUo/MDZeJXYdlB8Fo52wy6/xe6xkFZlihk
         Kkrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775544035; x=1776148835;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wy9jQVOnIYjxy7FWem5JONQKIoJoRbyZ+S+kpmjt+7Q=;
        b=lOUaNVvqhs/JDUm/uCrfFGngB/ITUnTazhlP5KUEjGOZoUy4HGb5DBgNFuf3VygaJK
         UsnjK5+ScHV7zPbklrPjFR5l66fE9wc3ilyIF8GNtUMOooJ/+DuHB4P025QCKDAIqx30
         ZXEN3wGi+6p52XX2CfM5KQTj+BAL0EbgcZ/lLT/EYRH7sRsG36acLbr0Iio5kRxucKYr
         scdRAwhC/MIbhVPq7uSadhenP5ZKdina5kkP18klXn5gLfer75p2dHuQ00y/XtXTHZ34
         z1vqcWhMb//tX5b8HqrNcTQpr20ehIcQq54wsigyCsava7PmarNQbcDqHp5EXSckWSwJ
         Qumg==
X-Gm-Message-State: AOJu0YyjhMh78mMFssad/YouBH9xCOZVkHoDEgtt6Gs9Vm6m1K14zo5z
	2qmbjLxkhDxysZGB5OhEWjoz3/HVT70eKs5uc44bw1/X1Inv+wgWKTL/xbfXyhTQiQturQ==
X-Gm-Gg: AeBDiesIqGw2iWP5ETAD+rNn6SXaEILxP1IXCUVWFogGSxQF4d6nsGzWGEk3Wnhedqj
	m+GfVOg2B98vd5t4du//WkhSYr1tL7CvOD32aBLtzTn4DU92HRpzNAVIlJOETcYF1k7tZP2EY7U
	ASoFQ9hJtMZS6huSr0SKfBh2hn/tErOR8/VHyMdklHJGy6ZfHkZwtyBXzJ9ABnibma3dqluDyYw
	l/j3MWc6zPW33Db0ZKCsMlGW9mlyc/1KrEruoT2oLLQseDucA4Jt6VnxIkwPiik3x0dH6r6otUS
	JyXsUJIS2J6AybYyVVnE6L5ziDPi5+7RxFAxqLdxGL1FIkkxPn/yGDveqZLmUTaFT5A+H3Z3fxm
	+2dn9ceA4smT+9Eg0H0Iaxnc/9+pk19gagtn4J+EJVo/zzYf4K+54cOCJq56FL68NxFNDq/8uXf
	mY11xDh0Tl/fyd5AyvB7VeKqE0XtzE6g0ULGVYwX4YPVrw9+cQgP9PMqFq7nSS5OvPSqf2Uq4s7
	ByaIlw6VWh7m7r/
X-Received: by 2002:a05:6a21:9983:b0:39b:fbb2:5e31 with SMTP id adf61e73a8af0-39f2f09eec8mr15328230637.43.1775544034900;
        Mon, 06 Apr 2026 23:40:34 -0700 (PDT)
Received: from localhost.localdomain ([45.248.78.44])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c76c65995a9sm13954320a12.27.2026.04.06.23.40.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 23:40:34 -0700 (PDT)
From: Nathan Rebello <nathan.c.rebello@gmail.com>
To: gregkh@linuxfoundation.org,
	heikki.krogerus@linux.intel.com
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	tiwai@suse.de,
	stable@vger.kernel.org,
	Nathan Rebello <nathan.c.rebello@gmail.com>
Subject: [PATCH] usb: typec: ucsi: skip connector validation before init
Date: Tue,  7 Apr 2026 02:39:58 -0400
Message-ID: <20260407063958.863-1-nathan.c.rebello@gmail.com>
X-Mailer: git-send-email 2.43.0.windows.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-36034-lists,linux-usb=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,suse.de,gmail.com];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathancrebello@gmail.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.976];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-usb];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,suse.de:email]
X-Rspamd-Queue-Id: DCDF53AA642
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Notifications can arrive before ucsi_init() has populated
ucsi->cap.num_connectors via GET_CAPABILITY. At that point
num_connectors is still 0, causing all valid connector numbers to be
incorrectly rejected as bogus.

Skip the bounds check when num_connectors is 0 (not yet initialized).
Pre-init notifications are already handled safely by the early-event
guard in ucsi_connector_change().

Reported-by: Takashi Iwai <tiwai@suse.de>
Fixes: d2d8c17ac01a ("usb: typec: ucsi: validate connector number in ucsi_notify_common()")
Cc: stable@vger.kernel.org
Signed-off-by: Nathan Rebello <nathan.c.rebello@gmail.com>
---
 drivers/usb/typec/ucsi/ucsi.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index b77910152399..7df3a7b94a40 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -43,7 +43,8 @@ void ucsi_notify_common(struct ucsi *ucsi, u32 cci)
 		return;
 
 	if (UCSI_CCI_CONNECTOR(cci)) {
-		if (UCSI_CCI_CONNECTOR(cci) <= ucsi->cap.num_connectors)
+		if (!ucsi->cap.num_connectors ||
+		    UCSI_CCI_CONNECTOR(cci) <= ucsi->cap.num_connectors)
 			ucsi_connector_change(ucsi, UCSI_CCI_CONNECTOR(cci));
 		else
 			dev_err(ucsi->dev, "bogus connector number in CCI: %lu\n",
-- 
2.43.0.windows.1


