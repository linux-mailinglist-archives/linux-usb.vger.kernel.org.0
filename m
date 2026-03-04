Return-Path: <linux-usb+bounces-33936-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gDtDKQTWp2n/kAAAu9opvQ
	(envelope-from <linux-usb+bounces-33936-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 04 Mar 2026 07:49:40 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 496BA1FB4FB
	for <lists+linux-usb@lfdr.de>; Wed, 04 Mar 2026 07:49:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 625F43055CB3
	for <lists+linux-usb@lfdr.de>; Wed,  4 Mar 2026 06:49:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 453C437F748;
	Wed,  4 Mar 2026 06:49:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eIB0uhyd"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9BDA3537DC
	for <linux-usb@vger.kernel.org>; Wed,  4 Mar 2026 06:49:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772606965; cv=none; b=oZfCsRol3PTQQgYyXiZlua5Tiodg5/QWD0/v/7NHrvTVAtDxKzrZv4U3sy0gTy46ckfd4gHQzv1OgK0j5FNVWZ21ySlD3u7a8+I4FV1g3cgHScaDMWDrL4pY18fgCRRNS+h5UKc765PUxOoFrRA0T7NR15imzyI43UHNejDxR8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772606965; c=relaxed/simple;
	bh=Cxr/PMSO6d3bL/WkDFCeUdTM8tyJIHNVjYWfwPDDpgY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dAptJGJ2HbNf5XTFjYVZvLB9EXhdquCRSwmhKPt8oRBiuvR2OX7dzxgIBPS2rlHvP7Mc8B6g4nL7L5kQavPMRBAiRJn02ObU7rYbuNBbmhMGmSDPCwS08klX9Y8+92j0QxCe3HBiIyuWiDCdBFhAbxmc5UIxGmOlXv8UT/HCDxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eIB0uhyd; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2ad9a9be502so44111805ad.0
        for <linux-usb@vger.kernel.org>; Tue, 03 Mar 2026 22:49:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772606964; x=1773211764; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QOdPWjybRYp/bon5UOZwZfLAsanM1s0IJ7xyUwzxd4o=;
        b=eIB0uhydP7wD2DySTrRYgCZFaezmWrOXDVIF0wrvFO1gCB2e9oYfI+FIIRLj4aYgst
         FJc2lEfReotZDVJlANZLtiGyFsqyt676DITOoR456dZzjyLbl9C+NurGSQC59sUKhKGX
         3Xn+1ruBix6Sf3DWsKMTB1a1tgd/MOBfUexoQsmUSAWDx3vNQ5XkD3zPbJSa/VkZ84XG
         K3drDEIk7PJX2NWucXU4CVXdpMLz0zreDOUTq9lobvM3solH+29B04xmXGJ+ROvD3R+5
         QNK4kMUQdnNrL99fuFHMK9YZyHYkgau3xHeSW9+PByDG1FMoXOFjaaSn+NxQv4aCcw8y
         J5sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772606964; x=1773211764;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QOdPWjybRYp/bon5UOZwZfLAsanM1s0IJ7xyUwzxd4o=;
        b=hrkvVQHB8+sF1K3rjp0KPBneijyurqks2nM1e0sq/tbn8F6whFtOqhhcAXVOBTyLgn
         3iSRAlfb5T1eI8QVj9tnXpu86N5I6LzOwggRGu3JUGVv9MfvyQ0Eks+SKcmAnqOh2U02
         E5KQKZw43UarQIhp7TQ0nQHSxkfS47NoVO0K0VUdtWyGfOR15HEryy6/0hM81aPn6JOc
         8nKE0GqaEKh664acpljL9wOI5HCR8lDJnt1OFFk5gV6tSncM6cWI4SJO+cGdvd6d5NQv
         5dLYS5a9SOfOpgvp8QhdpG0+BD4+yjL1m2M+5mJt9bVRc0UhODIAt4N5IRyCX5RKney3
         RSZg==
X-Gm-Message-State: AOJu0Yy5AxtnpYi9EknSohfT1rgbkj+hccyBx5ExcIXN1AqVgBv51yuc
	drmwYp3wjjy0hi7HozhMUF6JnPRgpUTvLwla7Zz38tR3XEIbgTP3bVGVamJ/h5LE
X-Gm-Gg: ATEYQzwVtACHgTNkhtYJtbqYEgD5fIDG0nasrEl2g7JLs9j4xNvm0b5jurPGNpIfopc
	IEewKcFqJBzPevOdQlzG9gAMNoVp4Q9ccI9OaWowqdAvXePh2aWEMSbtyZZFlVmmtC8QaWyjSjY
	cf1rei1y8BKL4vm+tKEfTMdCi5WcPLfTDe8ZZJBUUurRSQmIHhDNGg+0qBPwZdH7KlUwMgn1Q4A
	70wZ5KRUJoNROW4ly5P+bvaQNzdJCR+mRh30Qhdkp49PjhZXfyHXrs4PE/H9Jyt8Ik8exX/vZK/
	W/STS3QiEbBFUM2Vmdffvq6t42JCtXziN8tFbPTCtHF5s5xjokvX7FIF9Vhdqr4J0R8Uh8hpQz2
	cKD8AklmeqthBP5KpigDaI+1qeKbAloCtpUIjcYKJDxOquXvzJWcleGesurYlZ94ffI+JkJWPSP
	8SDqgsc+zSkyl5AmNRrvARBVdbLWRv0r4hxOgq/fgMxRbUBIyFCZwJp+tXwo1H2iBqS1sTFucmP
	62zxYDKmbAsGXa0
X-Received: by 2002:a17:902:f541:b0:2ae:3a1e:3490 with SMTP id d9443c01a7336-2ae6ab10e95mr13158015ad.38.1772606963968;
        Tue, 03 Mar 2026 22:49:23 -0800 (PST)
Received: from tower (c-73-37-64-97.hsd1.or.comcast.net. [73.37.64.97])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2adfb5c0f2fsm265327635ad.20.2026.03.03.22.49.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 22:49:23 -0800 (PST)
From: Mark Adamenko <marusik.adamenko@gmail.com>
To: linux-usb@vger.kernel.org
Cc: gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	Mark Adamenko <marusik.adamenko@gmail.com>
Subject: [PATCH v2] usb: core: remove unnecessary goto in usb_create_newid_files()
Date: Tue,  3 Mar 2026 22:46:46 -0800
Message-ID: <20260304064646.6612-1-marusik.adamenko@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 496BA1FB4FB
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
	TAGGED_FROM(0.00)[bounces-33936-lists,linux-usb=lfdr.de];
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


