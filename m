Return-Path: <linux-usb+bounces-31741-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 21591CDB8DC
	for <lists+linux-usb@lfdr.de>; Wed, 24 Dec 2025 08:01:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C72CB302E861
	for <lists+linux-usb@lfdr.de>; Wed, 24 Dec 2025 07:00:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D8A02F7445;
	Wed, 24 Dec 2025 07:00:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="efUx4c65"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A3A52E8DEA
	for <linux-usb@vger.kernel.org>; Wed, 24 Dec 2025 07:00:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766559651; cv=none; b=fBJeQDD7NFIj3JyKBiYHZPmIHlgMnV7cFItsU3YlR9Hpn0r1VZ5qtXrj4sP2W3p1+oudTELQ9JCtarXpFjX3wlaoPv9O+srO7sx38PJqJQRdVhoqBBhZlCTAk9iQY3d+BRA/1Y8GTzygemB5bKStYyN4a2xSOHE63CFdPSPJa9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766559651; c=relaxed/simple;
	bh=X4YNszymi67cvqDx0r605mpfLRctrcxu5rYY4etxIPU=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=V2AdnZbaarKnVvlHzl/ooqIoIhNLgW54Nl5Amampl25e8OTawtfN3yXJyNFNyz8Ysf9WLCr6MNUUfwu/UbyWYGsvMBXKos4Lc2vPJI7oKmG3yJLQVr4Cj+Ms4Y1dtYIDQ0C6SYX/kI2hbnU5XfLZbB5Kf6TaH1MxynNpbaJHAoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=reject dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=efUx4c65; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-7a9c64dfa8aso4414845b3a.3
        for <linux-usb@vger.kernel.org>; Tue, 23 Dec 2025 23:00:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766559647; x=1767164447; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O1syORaoZB4GZ15xwqBQocGrk5Mo6Ls1+izJMCL7eio=;
        b=efUx4c652BL/44+7T6QK092yd8Zx5Gy52pyV5kGXx9u1rlQLkud1szi5y42pcD6xpd
         9rwAaLfWwQVMqhNEu6/JbWIIVgQv6+hTjf+FpTXTKL2joPvLlvWZ2JCK6OfZoFq6SEqw
         g0y9VdHRcK3+C5tz17FebXXPgMnqUzT/ioAd2ssoRe8bdxQl+c3KxliIsDaW8hXrfCma
         7OV6YYAoMaKRwlSp447wX8tvDqwX41/PeRel4+Z4xsydCt5boTSY6CmxlK7nZP6L7DqF
         SkENKZwuCloWLYZMfezKJgVQrGRw0mCaat4anIE0Q3UpVad/QndWry0vP7f/Xj0Pr4nh
         kghA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766559647; x=1767164447;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=O1syORaoZB4GZ15xwqBQocGrk5Mo6Ls1+izJMCL7eio=;
        b=ZErpXqC6SrYF4AZcXD1FUYBfTIwRPIBmaER+LgqoB1DjJ6PEgrx5kJHQY1qs0mKXjK
         QsZzqWvyGzT1otwZbM10Ei45yrB87w4egSyR+ijeeiQ7z7HQDwZ6F39wMAEJhT06kxia
         ExJqBV4Vuzw457mrc/KKeTU+EV4ObkWX/i4Fp8jblYZMVPbGBF5GyTtaKX0P+YgtnFjl
         Ev9m9kAE2/A6iQMAk0wVDs0DR6NWAEUOU2Rz5iXDlFTaqtwt/d7iFYL21LLryl89WYtU
         /NaQ002VUVwpjRzhxYqxCvmn55xUUPqoWKb8UbjBXyBxDQkMc/WVyHAeuhPZqp0OX4+z
         32gA==
X-Forwarded-Encrypted: i=1; AJvYcCUwxK6rcFn3AOmXgjzoSHEOKPGEvg5eTM5PgS3THeM5SjkEoDVmhkAsSwlSCatuB8XRoTXWbT3WPb0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwdB9z3BJfgVl9IcsiwkSIzpEv3d0UowKhwr6EaoQgWfWk5BHrG
	iEvtccwl8C3NW1egfkvtZTb0FPi7Z0xPXdmWENxCvDb0RqIMjrzY630Y
X-Gm-Gg: AY/fxX4q5rIJzftUg1EU0KwN9+cMB6zG3HyvItnyT5l5irZCwLXAcKH1bTtkeZUkJAW
	7p296n1ANxYZC6w6AHbwRDiuIkoK4Xm5Txbyxu/REu1TODTKNiUQLDYbeTHnfgUQC+xs0Qr8WyV
	VqOtjBWLeXDsp897S22KA2GuWNQHi9F+G4+GIXWJUQlhY2Q1sIBF1QIC0nYFYtISMcD03aCO9Ls
	7DSzIbIwesb4nkJo0V9O31nZpPhZM+uU6tDxPF3LHF1Ie2UWaObhaPITMyZi2GeX38MV2C87mZn
	EWkyNFxzN14SS2wIuVQ84z2zQBX+7x4Lggq4RYy/Cs4X/xLuJ4iOn+V0dsoqWe53qqCUIc68/GO
	iIPmOtWQHhGS5E8z4KA4g9/xvvidvs9qV2xm33Y0PLExlZ+9Eu/srj6PzZkARtj/SxJpFwQ==
X-Google-Smtp-Source: AGHT+IHgKGKMQSPmhWkryjHE26bt4OZ6n7CmEA9rIhNkuWvSMwQo3JSZAKVnkve737KvIHpBhXFbPQ==
X-Received: by 2002:a05:6a00:6ca8:b0:7e8:43f5:bd51 with SMTP id d2e1a72fcca58-7ff676624demr14762804b3a.61.1766559647081;
        Tue, 23 Dec 2025 23:00:47 -0800 (PST)
Received: from localhost ([2001:67c:1562:8007::aac:4468])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7a93ab3csm15617471b3a.7.2025.12.23.23.00.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 23:00:46 -0800 (PST)
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
Subject: [PATCH v3 3/3] usb: typec: ucsi: yoga_c630: Remove redundant duplicate altmode handling
Date: Wed, 24 Dec 2025 15:00:22 +0800
Message-ID: <20251224070022.4082182-3-acelan.kao@canonical.com>
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
index 299081444caa9..564c1e660d53c 100644
--- a/drivers/usb/typec/ucsi/ucsi_yoga_c630.c
+++ b/drivers/usb/typec/ucsi/ucsi_yoga_c630.c
@@ -136,28 +136,6 @@ static int yoga_c630_ucsi_sync_control(struct ucsi *ucsi,
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
@@ -171,7 +149,6 @@ static const struct ucsi_operations yoga_c630_ucsi_ops = {
 	.read_message_in = yoga_c630_ucsi_read_message_in,
 	.sync_control = yoga_c630_ucsi_sync_control,
 	.async_control = yoga_c630_ucsi_async_control,
-	.update_altmodes = yoga_c630_ucsi_update_altmodes,
 	.update_connector = yoga_c630_ucsi_update_connector,
 };
 
-- 
2.43.0


