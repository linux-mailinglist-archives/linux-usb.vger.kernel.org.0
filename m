Return-Path: <linux-usb+bounces-7107-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F37958684AB
	for <lists+linux-usb@lfdr.de>; Tue, 27 Feb 2024 00:43:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 267881C22704
	for <lists+linux-usb@lfdr.de>; Mon, 26 Feb 2024 23:43:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94833135419;
	Mon, 26 Feb 2024 23:42:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="KUyuvAji"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCEFF1353E4
	for <linux-usb@vger.kernel.org>; Mon, 26 Feb 2024 23:42:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708990975; cv=none; b=PMGQOiXJK7NqNV/u7ywBJKfrhEg+EkODqLsOR4SQhoILqnvpCJYjf494UcT9Mmt9dEAL9GEjYGwIJYWgcV/fiQ6YFJFwIW235I6Kybq/lCDsxE6stA9hMj+23Hsico2jq8ISYPXkQ8xR/q4vtn6JE5So+uEFBseHEsFdjJ3pCiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708990975; c=relaxed/simple;
	bh=5kYeIFVo2xR1oxYSbdUq98xOTZBkvlA2zXrP0sPUMtw=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=ExTIEJEDA3oyQ1G8Ttt/x+RP0bGV00Gv3NJj35QiQtq7kGQ/YOd3HPHvSFgrqd8Ois9bEIIZXa1j8Jul536toYVWgaZZAxnX3DJ2qiLOw/ig2Jv+EcWVgrt5sQD/S4HeISuVks4kFe2KU4OY1tkRfzoXLNmD7GVDhu+d5WqU3K4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--rdbabiera.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=KUyuvAji; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--rdbabiera.bounces.google.com
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-1dcaff13db5so9108645ad.3
        for <linux-usb@vger.kernel.org>; Mon, 26 Feb 2024 15:42:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1708990973; x=1709595773; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=vfgvyT3McQFjbyFi2yOlB8GW53W4hlIR4nzJRu+A9Fw=;
        b=KUyuvAjijrOCmHDeb4BOagQjogokx03FIOMwmWzVhjNvlH2/rkEJ9vKB5rzP7AqhJk
         I3KAadGJOatUmpRtzzPBNISKf6PXMRbNSvwbMFDMt8OLC1CQDWMpiz2I8xSijKdt90g7
         m8lWRz+aaFJ+yqnP47EkLcRKufPQHx9hL7ZeTCT53Hl52iLUhZqlTeHmz6Z+kC5MLpWZ
         PiYigi1bxsSZI8SguJzjcE+d/RwZXP1/sS3FDxhjouPEBBLvYLhTB349gTCp2zIGMT8H
         SQjufGq43YV3QogkohhBQx+J3DxdzTDgiIqqZoJDm6qRfdwNBIXN5UEKqLD8x94fce+f
         +/dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708990973; x=1709595773;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vfgvyT3McQFjbyFi2yOlB8GW53W4hlIR4nzJRu+A9Fw=;
        b=RhUvbH503PpPM8Q96O+xhV++kdc03Ap43zphgRIK/MlVOHZx+kVvnWrUREq61x2sra
         H97BHewDJ0EJWrQNxvDTbPSkdMvkUv98UchUyOhHchuBHfv2ur7i2Q6kOBp2Da5RsgHk
         q7usfa3IBpt1PLe5EnAyJ+9c03DT/r+aIlI86yS9dp2aIZcF02tatH/hNKTA7DO2Aank
         QezFyIRDACsCjaT211pXwKv5QZFlciE9Psj/MhchPy0L03LyYWzkbXDOdlKO9uoJVJz8
         hanOTtRucYNiizXlokszCbJpekqptlBRK7nLXB8du7aJrsEQWHOsxuJrVU8ziU8csTCC
         FQHA==
X-Forwarded-Encrypted: i=1; AJvYcCX7yazVrjwyvuQJ38C+w4Gc8F2PQShAJcKdGf0yiC5TAI/CikToa4LssWvoGJ7zFIb/3MMkWCSmsqGuwVRecDVtJKz+mkZbtc9z
X-Gm-Message-State: AOJu0YxHmMimMujXuHRJ83Y7gt/1Xy4Psi64DTInkIzBb49QN/2tPqYM
	XoCKwRBExA1E3/b/zAeREJ7aEQRgS3w3nEao9sDtLvS0xjXu4lEA5o2jNdDVmyXNZ8xEi4Rv+hC
	5EOzKMJJEKGZ7ug==
X-Google-Smtp-Source: AGHT+IEyZTVFkgm70LFK0GBHxb5VVbTY8nIkrEL6/h6HTvZiPIlhwJSjyLHv4XJhkcQG2yJrgxGsBbLwsi6VXm0=
X-Received: from rdbabiera.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:18a8])
 (user=rdbabiera job=sendgmr) by 2002:a17:903:410b:b0:1db:f7e5:afd2 with SMTP
 id r11-20020a170903410b00b001dbf7e5afd2mr324688pld.12.1708990973145; Mon, 26
 Feb 2024 15:42:53 -0800 (PST)
Date: Mon, 26 Feb 2024 23:42:29 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Developer-Key: i=rdbabiera@google.com; a=openpgp; fpr=639A331F1A21D691815CE090416E17CA2BBBD5C8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1719; i=rdbabiera@google.com;
 h=from:subject; bh=5kYeIFVo2xR1oxYSbdUq98xOTZBkvlA2zXrP0sPUMtw=;
 b=owGbwMvMwCFW0bfok0KS4TbG02pJDKl3FZ/ULxGdr8xuuKPE/pdU9tnNxT7/l5/PsViUxfhyY
 rqZYENsRykLgxgHg6yYIouuf57BjSupW+Zw1hjDzGFlAhnCwMUpABNZe5Dhf+6culvXpuycd/aG
 1/evWYVK35ef+sCvNJ2Nz4s1U9aQUZThf8x2v1OtilMZfm29z7HsgaXQjlcWzAf5gu7zVMU++6T JywQA
X-Mailer: git-send-email 2.44.0.rc1.240.g4c46232300-goog
Message-ID: <20240226234228.1768725-2-rdbabiera@google.com>
Subject: [PATCH v2] usb: typec: altmodes/displayport: create sysfs nodes after
 assigning driver data
From: RD Babiera <rdbabiera@google.com>
To: rdbabiera@google.com, heikki.krogerus@linux.intel.com, 
	gregkh@linuxfoundation.org
Cc: badhri@google.com, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

The DisplayPort driver's sysfs nodes may be present to the userspace before
typec_altmode_set_drvdata() completes in dp_altmode_probe. This means that
a sysfs read can trigger a NULL pointer error by deferencing dp->hpd in
hpd_show or dp->lock in pin_assignment_show, as dev_get_drvdata() returns
NULL in those cases.

Create sysfs nodes after typec_altmode_set_drvdata call.

Fixes: 0e3bb7d6894d ("usb: typec: Add driver for DisplayPort alternate mode")
Cc: stable@vger.kernel.org
Signed-off-by: RD Babiera <rdbabiera@google.com>
---
Changes from v1:
* Moved sysfs node creation instead of NULL checking dev_get_drvdata().
---
 drivers/usb/typec/altmodes/displayport.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/typec/altmodes/displayport.c b/drivers/usb/typec/altmodes/displayport.c
index 5a80776c7255..5bbdd2c04237 100644
--- a/drivers/usb/typec/altmodes/displayport.c
+++ b/drivers/usb/typec/altmodes/displayport.c
@@ -731,10 +731,6 @@ int dp_altmode_probe(struct typec_altmode *alt)
 	      DP_CAP_PIN_ASSIGN_DFP_D(alt->vdo)))
 		return -ENODEV;
 
-	ret = sysfs_create_group(&alt->dev.kobj, &dp_altmode_group);
-	if (ret)
-		return ret;
-
 	dp = devm_kzalloc(&alt->dev, sizeof(*dp), GFP_KERNEL);
 	if (!dp)
 		return -ENOMEM;
@@ -766,6 +762,10 @@ int dp_altmode_probe(struct typec_altmode *alt)
 	if (plug)
 		typec_altmode_set_drvdata(plug, dp);
 
+	ret = sysfs_create_group(&alt->dev.kobj, &dp_altmode_group);
+	if (ret)
+		return ret;
+
 	dp->state = plug ? DP_STATE_ENTER_PRIME : DP_STATE_ENTER;
 	schedule_work(&dp->work);
 

base-commit: a560a5672826fc1e057068bda93b3d4c98d037a2
-- 
2.44.0.rc1.240.g4c46232300-goog


