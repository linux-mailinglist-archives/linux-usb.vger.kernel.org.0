Return-Path: <linux-usb+bounces-31740-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A7570CDB8D3
	for <lists+linux-usb@lfdr.de>; Wed, 24 Dec 2025 08:01:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 39CC2302955E
	for <lists+linux-usb@lfdr.de>; Wed, 24 Dec 2025 07:00:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDDA92EB5AF;
	Wed, 24 Dec 2025 07:00:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QXq1F9Dw"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFBE327586E
	for <linux-usb@vger.kernel.org>; Wed, 24 Dec 2025 07:00:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766559641; cv=none; b=aSvrEd/RYuvMom8iQaL+sUvnvc3YMM9i7VMu00NUc84B+rgYUOFpEwUw/p+oHY4UMtZ3PqfXNlWUliIkYujA6NUDuupM5O9fnxDLkOGbW57gF/AvfJ4Bwcxe6vh/0zmW+QOS0mbykhYi0AC7cIibndlJkhrdqwZTaP9asJViIig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766559641; c=relaxed/simple;
	bh=KH43oBq4+TPoaYKFrooKp1xqASoTugvbw6ddTqPhTmE=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Z7LHWZoTDNdVWLFp9RkWQxGdInfs0x62JOaJUtH5w4lDX4enKUCUzlFkYDsUvGleaUhFqquQIJgMz7ZY1coaapOHwMx0NVAWDn2uintaovRAQV8IW8nWlwM8X2cL/83gAcH/Ql54v+HpP8zE0rZR3jZq/Ti7t0S/yZb5jWdum+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=reject dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QXq1F9Dw; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-7b7828bf7bcso6528118b3a.2
        for <linux-usb@vger.kernel.org>; Tue, 23 Dec 2025 23:00:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766559639; x=1767164439; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tv5xvbiMyFlxCL9YfZXWb/oehOWWEqTnU3TyA382yEA=;
        b=QXq1F9DwRZg9+Qhhbxim9QVaHKkOK1mo0WXOkuRuCk1zFMXmhsEB+edVECXA8pr12g
         1V+fms+a39xF+iA0L6sAxZp0Vfui37KPeetER5r8VJuWeUC3ytZ2mpovWtOyPWSD8ysI
         8KwaHm21WUKfdGEVbd/Sy3M4pcPodNh042SKqOuB9KG+tPIZ6LGyjCoJLb8dlZGK6reL
         hKvbzGpxvqouhvwqqQW5djFk+emXJYSobD7dxgsDSTy9MZXqG2HM+4Eqsel8Ie8IdaCp
         b4YOD5VtNO6y+sEiAKnMPVy4mfIXyQeJThTw9IAjLuuVJa94fM25PcOOKx8/3w3EAG4Y
         y7ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766559639; x=1767164439;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tv5xvbiMyFlxCL9YfZXWb/oehOWWEqTnU3TyA382yEA=;
        b=fSWesamXviIhEBQ+n5Rf0AIg9yjcAwOvUFQD5SSsNuXP+oXUMOPMFPMpEFEtQcvwjU
         ROBYGNIto/3hfX4VbhR8Z8SGMsWmytvKItZUggDj/bVdLcXb/Ej+j5sMuJO/jpOYHlZG
         XqnFSThYlI0o38hrNUBq2DCJ+etXR3clR+VKz18aRN7tRixl1xLR4hh29QmLCvhd/48o
         T32FbYBoqpaunXbE4vAwj1bF1/o10ywwQ8xw8sRVqItq9jDA6w7jJdT+CYCjahk3n9j6
         /DK4vgNQaZ/D7Fry9oYzR6GNCDWqk4FxgJehqfHf7VKnan+m+ChfBjVWbzGPZMNwgPPs
         kGKw==
X-Forwarded-Encrypted: i=1; AJvYcCW0YPPl+bSU42k3t1Y62PuxHR/Y2q2a1ptDMfMJ+5xAV3wMhy5yJWITQ9WlQBJP1wc+hrVS/yRI8dQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzXB1r6U5eFyWyiDudn8lUgrcEPwPjm6tpc9ND5Qzm18C86cBNX
	SFnzVqct1msHJOVtKMmuR/chiLBum1Gv2SpudGVdJeqmA6YyOqSTetVJ
X-Gm-Gg: AY/fxX5f9aDqhVQgQ1c8URPSm4er6OZoSCmSJL1vXotIy177nqOpX+wC3gEBdocwQQe
	lyUWUYL+jHY3C2lb/xijG5rm/2xbdYrg/6nu+HsNYo/BbtyKMK/Q7mIj0C3JNFwsFbrxKt36xnh
	dYT4QtR5zVmsJDdmRWtEG3/yWpvWLc3tClja1zeUAcFaU70tlIewLxvKYXRTToMVueblAeIj78T
	uFLvEEJfVXHiN5Qr5EAzCuaadh2KDVh05V8Igx1JT3SWsrGif5GqNd4zFfeprE634tt4ySK5Wgb
	MPbBQ2wA/Qyj8xmTIKpKr9sCHvkq881IhL7jWZH32jPWFxV3BnXYvaTV0SMGTXTSvLd9nyzwDye
	QyxRrt7YlWpR47KkdDArDq0sXU7N7L2X/z0UcEoKex++e0eitfwGBpUa/9WT/oCh/gapLiw==
X-Google-Smtp-Source: AGHT+IGCYub4EBMgDYdkOQ6LL5GzRM+qyfK0eE8rnhAVoQQcV0w2n4AIPngpZT2QHZTo3df2rOLnNw==
X-Received: by 2002:a05:6a00:451a:b0:7fc:da5:f85c with SMTP id d2e1a72fcca58-7ff6607b30dmr15241206b3a.38.1766559638882;
        Tue, 23 Dec 2025 23:00:38 -0800 (PST)
Received: from localhost ([2001:67c:1562:8007::aac:4468])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7a93b441sm15536280b3a.9.2025.12.23.23.00.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 23:00:38 -0800 (PST)
Sender: AceLan Kao <acelan@gmail.com>
From: "Chia-Lin Kao (AceLan)" <acelan.kao@canonical.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Pooja Katiyar <pooja.katiyar@intel.com>,
	Abel Vesa <abel.vesa@linaro.org>,
	Andrei Kuchynski <akuchynski@chromium.org>,
	Venkat Jayaraman <venkat.jayaraman@intel.com>,
	"Christian A. Ehrhardt" <lk@c--e.de>,
	Pei Xiao <xiaopei01@kylinos.cn>,
	"Chia-Lin Kao (AceLan)" <acelan.kao@canonical.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/3] usb: typec: ucsi: Add duplicate detection to nvidia registration path
Date: Wed, 24 Dec 2025 15:00:21 +0800
Message-ID: <20251224070022.4082182-2-acelan.kao@canonical.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251224070022.4082182-1-acelan.kao@canonical.com>
References: <20251224070022.4082182-1-acelan.kao@canonical.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Extend the duplicate altmode detection to ucsi_register_altmodes_nvidia()
which is used when a driver provides the update_altmodes() callback.

This ensures all drivers benefit from duplicate detection, whether they
use the standard registration path or the nvidia path with update_altmodes
callback.

Without this fix, drivers using the nvidia path (like yoga_c630) would
still encounter duplicate altmode registration errors from buggy firmware.

Fixes: a79f16efcd00 ("usb: typec: ucsi: Add support for the partner USB Modes")
Cc: stable@vger.kernel.org
Signed-off-by: Chia-Lin Kao (AceLan) <acelan.kao@canonical.com>
---
 drivers/usb/typec/ucsi/ucsi.c | 26 ++++++++++++++++----------
 1 file changed, 16 insertions(+), 10 deletions(-)

diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index b99c86e9f31cb..e41973bd982aa 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -625,19 +625,25 @@ ucsi_register_altmodes_nvidia(struct ucsi_connector *con, u8 recipient)
 
 	/* now register altmodes */
 	for (i = 0; i < max_altmodes; i++) {
-		memset(&desc, 0, sizeof(desc));
-		if (multi_dp) {
-			desc.svid = updated[i].svid;
-			desc.vdo = updated[i].mid;
-		} else {
-			desc.svid = orig[i].svid;
-			desc.vdo = orig[i].mid;
-		}
-		desc.roles = TYPEC_PORT_DRD;
+		struct ucsi_altmode *altmode_array = multi_dp ? updated : orig;
 
-		if (!desc.svid)
+		if (!altmode_array[i].svid)
 			return 0;
 
+		/*
+		 * Check for duplicates in current array and already
+		 * registered altmodes. Skip if duplicate found.
+		 */
+		if (ucsi_altmode_is_duplicate(con, recipient, altmode_array, i,
+					      altmode_array[i].svid,
+					      altmode_array[i].mid, i))
+			continue;
+
+		memset(&desc, 0, sizeof(desc));
+		desc.svid = altmode_array[i].svid;
+		desc.vdo = altmode_array[i].mid;
+		desc.roles = TYPEC_PORT_DRD;
+
 		ret = ucsi_register_altmode(con, &desc, recipient);
 		if (ret)
 			return ret;
-- 
2.43.0


