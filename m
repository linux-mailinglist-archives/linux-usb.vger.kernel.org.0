Return-Path: <linux-usb+bounces-30308-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D652CC4A475
	for <lists+linux-usb@lfdr.de>; Tue, 11 Nov 2025 02:13:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5F4373AF2EC
	for <lists+linux-usb@lfdr.de>; Tue, 11 Nov 2025 01:08:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0972931283E;
	Tue, 11 Nov 2025 01:05:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MUCYvg0r"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 449DB305E24
	for <linux-usb@vger.kernel.org>; Tue, 11 Nov 2025 01:05:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762823153; cv=none; b=hVgKTVmQroAOAXthegKCnNqjiN7y+g+8IpE8eng+WUVjmlw0BcuomrAfS+fVwWyQ7lxxWpG40QQwanrwNalvxHb0PUWJDSyUsMDfHZCsQIsau0bkryifUaAhIvQf+ut6cUnh6nnrUkPWryhr0RWjv949JcT5dFbHWM7zKEPIx/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762823153; c=relaxed/simple;
	bh=zoaJWkh6BFdghSAUNArPV7iTe5Ektktbb+pOIIxP8zo=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jJGOLaKV+WwrJbLt730fFDlA+XK6dFvRoDnVkLx8n4DXKqhJQXOmspyihMat9CLTzirOqXvRZHzO9A8xNmtUHTkLuXUEjq1xIcX9JG2wKYkFZgI9NEFM1m9euyZCYalVj8YoVodLMIXsOODri9to2lFxS0mllP6YNU1gZib3jRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MUCYvg0r; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-7aab061e7cbso4354827b3a.1
        for <linux-usb@vger.kernel.org>; Mon, 10 Nov 2025 17:05:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762823150; x=1763427950; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g9OzIqPmPfxJecOLxd5sV7dij2CavVRjVBl1sDZ2zms=;
        b=MUCYvg0rqZbTG5hxIaACJjH90uY1h0bT/91eFbEfkPydq3IGGejvEVX/O9tkLdCQR9
         pDNwszsuqDV5uPFJhmZYiEWRMUjfBrc61za322SiTiyN+cXn4A/g9eTb2zBy8UuVOiWK
         BjmHX6KUGVO4KCp7n8q45b6H55+EU9MfPmySCkcSyHYjxj2RRljzgJD+Lv3IWyc0mnWf
         hXBgdW/jkaUaGD0njx0nho4OOGsBu2Y4Yvn/iH7QNDSs7iKBnbnF207kk7fPqD6XvPm6
         cw2ePJkz5cKxoNhcGpIPP04L720ufhhbrGe51r8NSj5wUwf8z0kduoo5QUewh7u92btm
         g6cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762823150; x=1763427950;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=g9OzIqPmPfxJecOLxd5sV7dij2CavVRjVBl1sDZ2zms=;
        b=InVca3Zsy3xkPH/abTOEfqWjWWwexQ0KXW3o7TC2II4HxBfN1axajeLBLigubVlRyf
         a6o2sE6D3J/30pu/U12d5Bdcz2xPNGihreA5t6pOdOhm/czJMHZ3hmM08mN0fLa/3W2L
         Wo50jtuizqqk4HiYZ3R0dQ9NeVGBCzaflr7roq8pvFWW7VzjmQ2l2HHBmi8IapXWkGH3
         AR+w8DeE0fJ0wQ2fI+3IuJSNP/jSSW2wdd/K9+vD1BcnO5VRhp0qEweEEllVDirZ9NZf
         fSpDyhozdrNn04urpuSlhU76dnIeqWWqdiEv4LqFUhITuK8MYzdXoDabxl/EUPJXETrL
         biCw==
X-Forwarded-Encrypted: i=1; AJvYcCUq928AcbobZhLoBHUAof9sNNBA5Atsn6XBaCLha5pa6U6QG2KqEMCXNOyOzq9Ch3zM7CIJzwYNXjs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzsr4r2GTK2YuX4ru0OjyTVrHHzLxbegFGE8/lhqZKUd0evANor
	JSSwpPkTzz2eG6+NusjzIL1OTcSoXUCo9Yh830fUy6PlcL/49TaxcY4I
X-Gm-Gg: ASbGnctTzAdQ9/qh6XhhDnYOLWV2f6PjJj48h9yimniJzyyeWBdDceHn4yk9On/ySUk
	gcAgxECrMr6EhLHGDB7vB808vYQ57ck+nmI5/GXFdO6DPLYlLXpt0378mayMPE02Pvmp/l+eFol
	CcSq+VYl++oioQ3RQ+nh15abk7Khfx+XZ0gRdBklCabURkNzbnJ+XS2ajY1RpxJqBaRTYhM4e+Q
	Ji6Ds0Gj1INsrMFPFgzLsa+UUcuZQRAqtP3lHDn6tOoguJfnh/wMuvd5aseHLfobFs6plyBp/rM
	RMULfGzNMqxq739SARuVohUHgyg4286ws9iceuBNdnaXadgTyOlbCM3jb6bxUwMxhGENdFShUeE
	WjheTrJEvXkQrTh9FmFqyEofp4LHNjTuIweAfxn515JeRSTBJ59sbiSLr6zgliP5do+nIKEInhy
	3bS3OL+al4BmysdEjKLPk5RFx2Qjx0FecmbyQzfKV/
X-Google-Smtp-Source: AGHT+IGUCQ7upwGzK2A9984x0NsgNPPuWNkmmYitgWgDEE9wtyrDQw0fgYga1Yd4jxR10qY4fICcTw==
X-Received: by 2002:a05:6a20:7fa7:b0:342:352c:77e5 with SMTP id adf61e73a8af0-353a4287c28mr13280750637.54.1762823150437;
        Mon, 10 Nov 2025 17:05:50 -0800 (PST)
Received: from localhost (211-75-139-220.hinet-ip.hinet.net. [211.75.139.220])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-bad33c801d1sm10500464a12.7.2025.11.10.17.05.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 17:05:49 -0800 (PST)
Sender: AceLan Kao <acelan@gmail.com>
From: "Chia-Lin Kao (AceLan)" <acelan.kao@canonical.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Fedor Pchelkin <boddah8794@gmail.com>,
	Andrei Kuchynski <akuchynski@chromium.org>,
	Venkat Jayaraman <venkat.jayaraman@intel.com>,
	Myrrh Periwinkle <myrrhperiwinkle@qtmlabs.xyz>,
	"Chia-Lin Kao (AceLan)" <acelan.kao@canonical.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/3] usb: typec: ucsi: yoga_c630: Remove redundant duplicate altmode handling
Date: Tue, 11 Nov 2025 09:05:41 +0800
Message-ID: <20251111010541.145421-3-acelan.kao@canonical.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251111010541.145421-1-acelan.kao@canonical.com>
References: <20251111010541.145421-1-acelan.kao@canonical.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This reverts commit e0c48e42d818 ("usb: typec: ucsi: yoga-c630: remove
duplicate AltModes").

The yoga_c630 driver previously implemented its own duplicate altmode
detection in yoga_c630_ucsi_update_altmodes() to work around buggy EC
firmware that returns duplicate AltModes instead of empty ones.

With the introduction of the common ucsi_altmode_is_duplicate() helper
in both the standard and nvidia registration paths, duplicate detection
is now handled automatically in the core UCSI code. This makes the
yoga_c630-specific implementation added in e0c48e42d818 redundant.

Remove yoga_c630_ucsi_update_altmodes() and its callback to eliminate
code duplication and simplify the driver. Note that this causes the
driver to switch back from the nvidia registration path to the standard
path, which is the original behavior before e0c48e42d818. Both paths
now include duplicate detection, ensuring the firmware bug is still
properly handled.

Signed-off-by: Chia-Lin Kao (AceLan) <acelan.kao@canonical.com>
---
 drivers/usb/typec/ucsi/ucsi_yoga_c630.c | 23 -----------------------
 1 file changed, 23 deletions(-)

diff --git a/drivers/usb/typec/ucsi/ucsi_yoga_c630.c b/drivers/usb/typec/ucsi/ucsi_yoga_c630.c
index 0187c1c4b21a..dae2f41f8d82 100644
--- a/drivers/usb/typec/ucsi/ucsi_yoga_c630.c
+++ b/drivers/usb/typec/ucsi/ucsi_yoga_c630.c
@@ -137,28 +137,6 @@ static int yoga_c630_ucsi_sync_control(struct ucsi *ucsi,
 	return ret;
 }
 
-static bool yoga_c630_ucsi_update_altmodes(struct ucsi *ucsi,
-					   u8 recipient,
-					   struct ucsi_altmode *orig,
-					   struct ucsi_altmode *updated)
-{
-	int i;
-
-	if (orig[0].svid == 0 || recipient != UCSI_RECIPIENT_SOP)
-		return false;
-
-	/* EC is nice and repeats altmodes again and again. Ignore copies. */
-	for (i = 1; i < UCSI_MAX_ALTMODES; i++) {
-		if (orig[i].svid == orig[0].svid) {
-			dev_dbg(ucsi->dev, "Found duplicate altmodes, starting from %d\n", i);
-			memset(&orig[i], 0, (UCSI_MAX_ALTMODES - i) * sizeof(*orig));
-			break;
-		}
-	}
-
-	return false;
-}
-
 static void yoga_c630_ucsi_update_connector(struct ucsi_connector *con)
 {
 	if (con->num == 1)
@@ -172,7 +150,6 @@ static const struct ucsi_operations yoga_c630_ucsi_ops = {
 	.read_message_in = yoga_c630_ucsi_read_message_in,
 	.sync_control = yoga_c630_ucsi_sync_control,
 	.async_control = yoga_c630_ucsi_async_control,
-	.update_altmodes = yoga_c630_ucsi_update_altmodes,
 	.update_connector = yoga_c630_ucsi_update_connector,
 };
 
-- 
2.43.0


