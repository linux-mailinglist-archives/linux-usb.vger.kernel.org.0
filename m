Return-Path: <linux-usb+bounces-36177-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cE1hGD+e3GkeUgkAu9opvQ
	(envelope-from <linux-usb+bounces-36177-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 13 Apr 2026 09:41:51 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AFCE13E860B
	for <lists+linux-usb@lfdr.de>; Mon, 13 Apr 2026 09:41:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 846FA3067743
	for <lists+linux-usb@lfdr.de>; Mon, 13 Apr 2026 07:36:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7B9639657E;
	Mon, 13 Apr 2026 07:36:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zmxu2ajT"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91F58396567
	for <linux-usb@vger.kernel.org>; Mon, 13 Apr 2026 07:36:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776065790; cv=none; b=aIN7G9HXqWl8qI8bygJgA2v1/9g15Gy2MZheoqDOFRMp3ey3b1bGjihPoCCcvQWYLihA1/8MX/xr0aThBQXSKK6MKEtVf6GuLISp2KARgeX9ljz+nRk5N8H0jpWFiCXAi0gR6sxgB0aTVS4RbPr3jfhpnGkfTR/3/gMoHG0P//s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776065790; c=relaxed/simple;
	bh=Q/7DI/418Z9BXvFQ898YzPEBILzR4ohpk0WcU0PIjM0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Z5fxQiAFL5wHYEUzC8Kbjfr3D6GEbxON3jsb2lZ/vSoKZyejWLuV1LrM9CmciD2zvgPI6t/DKAaVWLHsfCERhYT7YTQG7oi3QJ+XRLJ8WZetG85webJZPn1mP55jjipLK0F+l4hwW9d1DBFnaAm+3jvrdCpqMNMut+dRu8+YvTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=reject dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zmxu2ajT; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2a7a9b8ed69so31227215ad.2
        for <linux-usb@vger.kernel.org>; Mon, 13 Apr 2026 00:36:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776065783; x=1776670583; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gzVsgDZby9PDM2/13YNZf1kQ3sR73SnBQtInxpnAz7s=;
        b=Zmxu2ajTmjojAAik6yaNin8mVIbJSAHoj1tjrj7J0Q/sIS24KdfO3qh2dHBGUg7esU
         f5dzefMKQuKuiHF0MeDDCcJhGj4SyE/vs/Njm5ELbqzEVQvbjyKvugSOAgTdL8uGb+g1
         Z4UAuXork3Q7dv258z3kVwzce/mb6eTcIU6svYiofJfOjYraISGCbfgxINF0t8IeqZek
         u5VoRM8H9/fKsgL0W67YDbnSX26EzWzQHV2ADDmhqv4U3KAdfmqU8XxlJVuBhFOd51Qf
         XyFdcwaj6XQXONCY4D0lv9XTxGhMjsUVQHaIXX8UJ6q/Z8YaRCIG7ziDvsq4YeXrbixi
         Jruw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776065783; x=1776670583;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gzVsgDZby9PDM2/13YNZf1kQ3sR73SnBQtInxpnAz7s=;
        b=WVyR65AqTulKTtm92l+bCStp2N7sWANmx66cwEJ8L2VERwhrZbet9TXv8n2+49xRWg
         RttiiVYstD2hMLpNIYEWkQ9BM7WuGzZg/zu3U5RD5Kc2fm0s20/0NEp6FuvtkARQZv77
         uW8cMhtr4ipJAQ30QkfRKlr3vbeAeJoZw6qjkihFESdndkhWWL2A77TSWxh5FkanMjJs
         JX8C6DdSauH/jgb/d/3Z7egE7ZKLVBoJ69nVXVpd67a/KZHNIFrNp6Nz0YNdP4vnvwtG
         929jYVYHeNysW3YdC18F8s1UXYALpAjoh+AAUfcnAilr7h/X6cIu2wF7BHOG8rKjoDtJ
         LU3w==
X-Gm-Message-State: AOJu0YxiicP34OxtNdMgzCU9zgbCLrSn3KuWIVv9nAyXW6Rkm6jL6mNi
	XQwbbPvbR2fSsCJ5spiBItfBFff9KbGaCDSZN4HesSxCpGvKMZe1PzUP
X-Gm-Gg: AeBDies60Tp3yyQY7pr3KHE5xM+lWZkns/P1SD1HRkJuJl5UU+YfDxsWUrhwr87sScd
	n3PY+1I7aDHF6HpoFd+0BkSZ1yv/7360xz5LW8WNlmWXed2Dp3IzY+Vu7lcIQ474Fm4F/MqOy0C
	dUXEJoZRmnazbz/jLguH4buLl0/ZWO+khydaLVnOmtiwaMpRLpcPpCLsaqc8Kcmxi7j+FHNgk7j
	7Z6US9Zk705yQlJpf67uvfkUqCTXDyOplULHMqKGQ+VAVSEvPLT3ogDpPHjHJo30U2VxLQPB9w1
	iUoZaI4uD/8Os2EfeE+z1NvRKAoDJEeYqUiFX+DE3NTHWJ34KUJioDtYlt3ifc2LEYdAr2dMVRN
	WknkM2+F4et1ojkq9oCCNNs0R6sIG02sGto5nQkyCqiXuWNNEM5IwMu1dCddV5ariHUEnbmV37/
	y1Qy51Qw==
X-Received: by 2002:a17:903:2f08:b0:2b0:5923:5194 with SMTP id d9443c01a7336-2b2d5a45e89mr132959755ad.27.1776065782666;
        Mon, 13 Apr 2026 00:36:22 -0700 (PDT)
Received: from localhost ([2001:67c:1562:8007::aac:4468])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2d4f26cf3sm112167325ad.60.2026.04.13.00.36.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 00:36:22 -0700 (PDT)
Sender: AceLan Kao <acelan@gmail.com>
From: "Chia-Lin Kao (AceLan)" <acelan.kao@canonical.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andrei Kuchynski <akuchynski@chromium.org>,
	Johan Hovold <johan@kernel.org>,
	Jameson Thies <jthies@google.com>,
	Pooja Katiyar <pooja.katiyar@intel.com>,
	Hsin-Te Yuan <yuanhsinte@chromium.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 3/3] usb: typec: ucsi: yoga_c630: Remove redundant duplicate altmode handling
Date: Mon, 13 Apr 2026 15:35:51 +0800
Message-ID: <20260413073552.894395-3-acelan.kao@canonical.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260413073552.894395-1-acelan.kao@canonical.com>
References: <20260413073552.894395-1-acelan.kao@canonical.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [1.84 / 15.00];
	DMARC_POLICY_REJECT(2.00)[canonical.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),reject];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36177-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DBL_BLOCKED_OPENRESOLVER(0.00)[canonical.com:email,canonical.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	FROM_NEQ_ENVFROM(0.00)[acelan.kao@canonical.com,linux-usb@vger.kernel.org];
	RCVD_VIA_SMTP_AUTH(0.00)[]
X-Rspamd-Queue-Id: AFCE13E860B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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
--
v4. rebase
---
 drivers/usb/typec/ucsi/ucsi_yoga_c630.c | 23 -----------------------
 1 file changed, 23 deletions(-)

diff --git a/drivers/usb/typec/ucsi/ucsi_yoga_c630.c b/drivers/usb/typec/ucsi/ucsi_yoga_c630.c
index 0187c1c4b21ab..dae2f41f8d823 100644
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
2.53.0


