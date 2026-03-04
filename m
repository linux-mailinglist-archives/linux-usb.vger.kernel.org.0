Return-Path: <linux-usb+bounces-33990-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MEvzLOVbqGmZtgAAu9opvQ
	(envelope-from <linux-usb+bounces-33990-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 04 Mar 2026 17:20:53 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B0122041B1
	for <lists+linux-usb@lfdr.de>; Wed, 04 Mar 2026 17:20:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C0ABC31E9A07
	for <lists+linux-usb@lfdr.de>; Wed,  4 Mar 2026 15:58:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F282835B63B;
	Wed,  4 Mar 2026 15:58:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UgDpCbj/"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8917935B12B
	for <linux-usb@vger.kernel.org>; Wed,  4 Mar 2026 15:58:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772639904; cv=none; b=kBv0riqkRkCVkeqbaeAc4NgpFfBEZbX3yoemimgieqdwU5NsTsKGg2rQ9ntitz23l5i7hRoKfgb0RBmNrjwqfAukSrCZUaxpjItuixWovvF1zeQThg3ZRFBueG5gwLReDAu34ryCaMh+Tgo8yMq1eRUGKX+EvomKBubFTRJKcl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772639904; c=relaxed/simple;
	bh=MpMb9Xcs4/CrTop1yaufH8JVWEJ4IiYczfsYxp0w4Qg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=e7Y7KepJUnpKoV+KdkF+p+nU29ZbOo/rWrKFgSf1BLjy8eaIVTg3PcsGFJWq1Ee89nJoUNaWkmVI7ogi+CKS3sFNU+gazRq35Xr3dTUC0kIWn+L1I7jqpeBTEZEyJ5NpxVUdTNiN0JZaNdhbeaMTLRX398dIqRuWkJVbZHHG0AA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UgDpCbj/; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-8296dabef74so977066b3a.1
        for <linux-usb@vger.kernel.org>; Wed, 04 Mar 2026 07:58:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772639903; x=1773244703; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aOnCrhdJegN14Pwp5FsJabv2Wi4xLhwtkHY2ui0eSo0=;
        b=UgDpCbj/WEK1OPynkrqQyq3A5N+zhmyXTtRQ1Ojbasq9Pc1AKlgmjs0OTc8MFou7aC
         8/EA/EV1R9H9g/NKh/JoLSrrHp1qBpI33ciZrw1h+Yk1e2JlPCIzNBLSuLx7zkDUxbeM
         aHLUeJdXviuVSKh9EFVikJ19s4/XeBvatzGPNksyY8Qk534fISwIlqzcmLGw0/usOhdc
         Sd/MWcp58jm62WWFMkm6kBKkngrpl5PNty7Js8lUWD64SCdQxgsB1tsLa7sh4VB07h3p
         p/eZiLCO8WqRCIkrKtv+YmSaAeYWjJYXnuNP9OjLI5rz2EmOQ45+O9vIYqWZMUsGM6sm
         X4Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772639903; x=1773244703;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aOnCrhdJegN14Pwp5FsJabv2Wi4xLhwtkHY2ui0eSo0=;
        b=KK1JeAyT24Bt9K3s/ni10ixuG7/AwNGg9IRIx4t7Fl440EfcdK/9Ss2/ZwPJJ+9x5W
         asDGSCzuQ8caOyHCfMaXOnNn4CSPo/JgJwP+U/D2U/kDWwb6LN9kHS/+1CvYU1Jguku8
         w+7mFNWOK3r7n+l5+r4UGeTn4NpoYOulkkgyAPIcIKNiM4AO3oKGQ/XUnDnC/GRWwMkK
         5tHdnIBalrlJdpF3j2WaV5gvmNAzsM+ENm0uGVn6yHIBEipToapThbW/RhwINlTGhmS8
         dFY5DTyyGSlhZzVwWOHh6LwqpB2gVnnt+zltMB1E1EmNdtEea8l/s3PzNooATeeW5sk8
         XsYQ==
X-Gm-Message-State: AOJu0Yw55xmUaYVHRo6RaMP/LglShQXT22TcS3/ZdBZOugDAi5CEd7Oz
	dZ89nTtNOWtD0MvFUcEBzy5csxQbXxBInNk0gcJu4YP1alOBEEBbwR1AxUKwlVk5
X-Gm-Gg: ATEYQzwBVJwsa94kbgKYm3Qy0xSIOa5J+QXhyBfhHVGYIUkG1a5ESBYUjeCeTNs9Mdc
	InwiXZE89uiiZd/Y7YtBffD63Y2Ov4xAlOih61TN/wGV6K/Iv1c6nNBSmMfyRi+UW810K0/Asy/
	9wNiEbSfJ2wqxdeVvd708Cd3BE0vaaCjslfQ269iAsUV4i63Pv7D/YtGlnZxlSKQZsKPtrLZiM0
	JSqNoWzET9LnK1p1ZUV+tdcWhjjdPN233XqZh8z9SBcfSjN2pRXhSPUmc8IVpXxmItwYq22A5uE
	ZkYOr1wrl3PsnMC1AEpP2Wml68374KKlVM9sY1mz5cBYw+ueILqdffxT6crwo1HIyKJfC3VEp7+
	t9rVYdLLR08wREgN94Sv+wL29s3N9gWEO2f8IJszQGh5BA25UU8VXm1JI5M6AIcp3fXChAeFxc+
	iTzxmKLvD6gPkMXEsP/HUBh38bghqT95FFWZ4HW1Qk1de03J4/2Zzl7dNSE3Q1g8g3dL5hyAaqD
	uuatQPAamdl5UC6Opov8KDSO8A=
X-Received: by 2002:a17:90b:1dcf:b0:359:7ae5:89e7 with SMTP id 98e67ed59e1d1-359a69c10ecmr2293681a91.4.1772639902574;
        Wed, 04 Mar 2026 07:58:22 -0800 (PST)
Received: from tower (c-73-37-64-97.hsd1.or.comcast.net. [73.37.64.97])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8273a05e831sm19096426b3a.58.2026.03.04.07.58.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 07:58:22 -0800 (PST)
From: Mark Adamenko <marusik.adamenko@gmail.com>
To: linux-usb@vger.kernel.org
Cc: gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	Mark Adamenko <marusik.adamenko@gmail.com>
Subject: [PATCH v3] usb: core: remove unnecessary goto in usb_create_newid_files()
Date: Wed,  4 Mar 2026 07:58:12 -0800
Message-ID: <20260304155812.4559-1-marusik.adamenko@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 5B0122041B1
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33990-lists,linux-usb=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[linuxfoundation.org,vger.kernel.org,gmail.com];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_NEQ_ENVFROM(0.00)[marusikadamenko@gmail.com,linux-usb@vger.kernel.org];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-usb];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

The goto to 'exit' only returns the already initialized variable
'error', which would be 0. At that point it could not yet be anything
else. Replacing with an early return 0 removes the
need for the label entirely.

Signed-off-by: Mark Adamenko <marusik.adamenko@gmail.com>
---
v3: fix missing return statement at end of function
---
 drivers/usb/core/driver.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/core/driver.c b/drivers/usb/core/driver.c
index 2574e65bc640..752ff84a8dc1 100644
--- a/drivers/usb/core/driver.c
+++ b/drivers/usb/core/driver.c
@@ -186,7 +186,7 @@ static int usb_create_newid_files(struct usb_driver *usb_drv)
 	int error = 0;
 
 	if (usb_drv->no_dynamic_id)
-		goto exit;
+		return 0;
 
 	if (usb_drv->probe != NULL) {
 		error = driver_create_file(&usb_drv->driver,
@@ -199,7 +199,7 @@ static int usb_create_newid_files(struct usb_driver *usb_drv)
 						&driver_attr_new_id);
 		}
 	}
-exit:
+
 	return error;
 }
 
-- 
2.53.0


