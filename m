Return-Path: <linux-usb+bounces-38097-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UB/9C/PZFmpVtgcAu9opvQ
	(envelope-from <linux-usb+bounces-38097-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 27 May 2026 13:48:03 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E82A5E39B4
	for <lists+linux-usb@lfdr.de>; Wed, 27 May 2026 13:48:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 473C8301B307
	for <lists+linux-usb@lfdr.de>; Wed, 27 May 2026 11:46:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5652F400E17;
	Wed, 27 May 2026 11:46:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JWOfGpm8"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 760E9400E02
	for <linux-usb@vger.kernel.org>; Wed, 27 May 2026 11:46:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779882383; cv=none; b=F8GJPOaXwCbSaePF8rcHdBLr1oPYIcPRFVPW08G+sJstHOgPVTnfuKN6lmQ8nyT5tJ0+NMeuXacaqCtkK9uRbXrnCbm18Jkn1phZWKDCw12HOYHQa4F8TVfwOIxyWO0uspAgB9WQzZGkMg0iqcuu184/dXaeUaUR2l8UrPnmUuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779882383; c=relaxed/simple;
	bh=g3K3kjzo4h4Yw4PI3ZebZ1RdrnLML8MPT0Kp1gm7o8k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sd2hVSg1fwzO6/QT6cK3w5orJFqsyjGmkegw1/AhvcY1XLuQGWPR6PTzpOUUPw+f1xkbiDcYASvrXeiDZBdb/o1PUXBzlxHrR8j0lOjs47LYwPGJtP+XPohcaNhnvOJs1fuu9LiGuzxDjlOuqkj0y0TsXUAIgHi4aIDiLuS5cz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JWOfGpm8; arc=none smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-8acb856a674so141140246d6.0
        for <linux-usb@vger.kernel.org>; Wed, 27 May 2026 04:46:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779882381; x=1780487181; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=irXQtbhRBkvp9yH1UkJ164KDCO7pyrFnYr4plfnFx/E=;
        b=JWOfGpm8ytu58drOsdYRRZIO6HET2mcbRd3G5T5aIbs1ESdFpZ5dyvmJlaWHCdYZRv
         WsWjOLCgO6GgJEaWmAM+svQRqc5wR7NHheiXpZB2/MjoxKRn9FoVEt5wLBTm2XsZm/kd
         /HHAS9D1J9TMYawYT7B8MxRv0eJ7Yhm8g/F3UwURdwYKK4wVJhUiBQHsU7Bo3a7Rets6
         2u9y+Fd8gWAPDS51wkT42TJhv+GMd4DRCsNZgZaK6q+R3+RuRvIyMTBfDIX0A6AglDL6
         /RzkEUCw0pi4tpTw79RAWMuZ74V6qGe9rgNc7aD02nLPu/Bb294y+ywGG2O9TcLxxKh+
         Txrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779882381; x=1780487181;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=irXQtbhRBkvp9yH1UkJ164KDCO7pyrFnYr4plfnFx/E=;
        b=QvinLnu1bLLZVkSmEu9aK2kklhzCjdosP+1UC5Yy4yK+bUEuiA1TBQIcQZvnamjQw+
         QLVgVFVFEMjUPdO1FGjRODrJ/CXejHqeQfx9Toe7or0IjLxOPEy/SqqwT0/yAKqJs3Nh
         dsGjSQcjBrWrHZaa96O/y86WziXsRX77vmNnbq1MyjYIyBfyEiyFuiAgx0vK5mc5P9uR
         DYHKHhK9WMeN6EQCTpUs4ViREvShAX9hFheln53V3bna0EGrYOhqrU2cGY5Be3X8QH9K
         Jv4DwkwlKJamPMWYJrdP5lAbRBJelIyLOvsT9Cal8alK6cR6kMv1XukLWSUWLPIaAD7H
         Tgdg==
X-Gm-Message-State: AOJu0Yz8P26DN4oyicbVndTcvhgV/6advONCRt1JNXaUw4WWX73rZZgb
	RwaYyC4WXaKA6krhW/S+VHtCl4Ef1Y6UHRR7KTXOxtmq3BWaEtLAvb3F
X-Gm-Gg: Acq92OGeTG4JvPCCcT6MorAx91zkb5z/+7N19qMwA5x5Wfl/OrTW2MuLJcj3SaBOtCR
	areY2JraBnAbJOhCMeeHO+maCRt+Y4+oG1AEWCAN2MJpbNSFXckOEboHI5ClrC/A1Rpo6LW1mL6
	yiYpXNsso+LqDjuESNrk7UZClTMEGWuFCBf49dzZPMjXZgssJgyiS3u0vPwKCKJX8mxu8zONYKl
	9nByLMqhJHRaZzp3azo4es/4m58/q0Csu8OIilhVf+CUDbI1gOqmSiPADDsOuHDvoyT6Vu+PqHH
	TFEA5KIuUOcHPR9gcre39OF9dhW4omjQSE62ARug4omvNf9HwD5OGY6Da4EtETCioJFeubpRtWP
	6vAinbWTsPcrZdcoxh7Q4Zl+SshxLZgVRYJITCTvVgzxXjAQ2FFMu7Vc9kn5MOc6GwsPscekUWb
	0HKB4gPkWlWx6ZPVs3fiK6/AVmVYptASotk4/qRvdTWd0QOdT6xo522QCe0YKNM64YWFASZV/+2
	AU2YktD1glC5CeZ2faQIDa4CwCnn8eQz6ALObfMLB75aSMGwwiCYg==
X-Received: by 2002:a05:6214:5403:b0:8cb:e6bf:d473 with SMTP id 6a1803df08f44-8cc6e708327mr358801106d6.35.1779882381376;
        Wed, 27 May 2026 04:46:21 -0700 (PDT)
Received: from server0.tail6e7dd.ts.net (c-68-48-65-54.hsd1.mi.comcast.net. [68.48.65.54])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8cc8132c625sm163933166d6.48.2026.05.27.04.46.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 04:46:20 -0700 (PDT)
From: Michael Bommarito <michael.bommarito@gmail.com>
To: Mika Westerberg <westeri@kernel.org>,
	Andreas Noever <andreas.noever@gmail.com>,
	Yehezkel Bernat <YehezkelShB@gmail.com>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] thunderbolt: prevent XDomain delayed work use-after-free on disconnect
Date: Wed, 27 May 2026 07:46:04 -0400
Message-ID: <20260527114604.1197561-1-michael.bommarito@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260525125736.1268929-1-michael.bommarito@gmail.com>
References: <20260525125736.1268929-1-michael.bommarito@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38097-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michaelbommarito@gmail.com,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5]
X-Rspamd-Queue-Id: 3E82A5E39B4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

tb_xdp_handle_request() runs on system_wq and queues
xd->state_work via queue_delayed_work() in three request handlers:
PROPERTIES_CHANGED_REQUEST, UUID_REQUEST (via start_handshake),
and LINK_STATE_CHANGE_REQUEST.  Similarly, update_xdomain() queues
xd->properties_changed_work when local properties change.

Concurrently, tb_xdomain_remove() calls stop_handshake() which does
cancel_delayed_work_sync() on both delayed works.  Later,
tb_xdomain_unregister() calls device_unregister() which eventually
frees the xdomain.  Since commit 559c1e1e0134 ("thunderbolt: Run
tb_xdp_handle_request() in system workqueue") moved the request
handler off tb->wq, the handler and the remove path are no longer
serialized.  If queue_delayed_work() executes after
cancel_delayed_work_sync() but before the xdomain is freed, the
delayed work fires on a freed object.

Add xd->removing that tb_xdomain_remove() sets under xd->lock
before calling stop_handshake().  Each external queue site holds
the same lock and checks removing before calling
queue_delayed_work().  This provides the mutual exclusion needed:
either the queue site acquires the lock first and queues work that
the subsequent cancel will see, or the remove path acquires the
lock first and the queue site observes removing == true and skips
the queue.

Fixes: 559c1e1e0134 ("thunderbolt: Run tb_xdp_handle_request() in system workqueue")
Cc: stable@vger.kernel.org
Assisted-by: Claude:claude-opus-4-7
Signed-off-by: Michael Bommarito <michael.bommarito@gmail.com>
---
v2: Rebased onto thunderbolt.git/next per Mika's request. Verified
    the race persists on next: tb_xdp_handle_request still runs on
    system_wq, the remove/unregister split does not add
    synchronization with the queue sites. Updated commit message to
    reflect that tb_xdomain_unregister() now does the
    device_unregister (split from tb_xdomain_remove on next).

 drivers/thunderbolt/xdomain.c | 41 ++++++++++++++++++++++++++---------
 include/linux/thunderbolt.h   |  3 +++
 2 files changed, 34 insertions(+), 10 deletions(-)

diff --git a/drivers/thunderbolt/xdomain.c b/drivers/thunderbolt/xdomain.c
index 781d88d06b935..fe6c5ac703f4d 100644
--- a/drivers/thunderbolt/xdomain.c
+++ b/drivers/thunderbolt/xdomain.c
@@ -803,9 +803,13 @@ static void tb_xdp_handle_request(struct work_struct *work)
 		 * the xdomain related to this connection as well in
 		 * case there is a change in services it offers.
 		 */
-		if (xd && device_is_registered(&xd->dev))
-			queue_delayed_work(tb->wq, &xd->state_work,
-					   msecs_to_jiffies(XDOMAIN_SHORT_TIMEOUT));
+		if (xd) {
+			mutex_lock(&xd->lock);
+			if (!xd->removing && device_is_registered(&xd->dev))
+				queue_delayed_work(tb->wq, &xd->state_work,
+						   msecs_to_jiffies(XDOMAIN_SHORT_TIMEOUT));
+			mutex_unlock(&xd->lock);
+		}
 		break;
 
 	case UUID_REQUEST_OLD:
@@ -818,8 +822,12 @@ static void tb_xdp_handle_request(struct work_struct *work)
 		 * received UUID request from the remote host.
 		 */
 		if (!ret && xd && xd->state == XDOMAIN_STATE_ERROR) {
-			dev_dbg(&xd->dev, "restarting handshake\n");
-			start_handshake(xd);
+			mutex_lock(&xd->lock);
+			if (!xd->removing) {
+				dev_dbg(&xd->dev, "restarting handshake\n");
+				start_handshake(xd);
+			}
+			mutex_unlock(&xd->lock);
 		}
 		break;
 
@@ -885,9 +893,13 @@ static void tb_xdp_handle_request(struct work_struct *work)
 
 			ret = tb_xdp_link_state_change_response(ctl, route,
 								sequence, 0);
-			xd->target_link_width = lsc->tlw;
-			queue_delayed_work(tb->wq, &xd->state_work,
-					   msecs_to_jiffies(XDOMAIN_SHORT_TIMEOUT));
+			mutex_lock(&xd->lock);
+			if (!xd->removing) {
+				xd->target_link_width = lsc->tlw;
+				queue_delayed_work(tb->wq, &xd->state_work,
+						   msecs_to_jiffies(XDOMAIN_SHORT_TIMEOUT));
+			}
+			mutex_unlock(&xd->lock);
 		} else {
 			tb_xdp_error_response(ctl, route, sequence,
 					      ERROR_NOT_READY);
@@ -971,8 +983,12 @@ static int update_xdomain(struct device *dev, void *data)
 
 	xd = tb_to_xdomain(dev);
 	if (xd) {
-		queue_delayed_work(xd->tb->wq, &xd->properties_changed_work,
-				   msecs_to_jiffies(50));
+		mutex_lock(&xd->lock);
+		if (!xd->removing)
+			queue_delayed_work(xd->tb->wq,
+					   &xd->properties_changed_work,
+					   msecs_to_jiffies(50));
+		mutex_unlock(&xd->lock);
 	}
 
 	return 0;
@@ -2200,6 +2216,11 @@ static int unregister_service(struct device *dev, void *data)
 void tb_xdomain_remove(struct tb_xdomain *xd)
 {
 	tb_xdomain_debugfs_remove(xd);
+
+	mutex_lock(&xd->lock);
+	xd->removing = true;
+	mutex_unlock(&xd->lock);
+
 	stop_handshake(xd);
 	tb_xdomain_link_exit(xd);
 
diff --git a/include/linux/thunderbolt.h b/include/linux/thunderbolt.h
index b5659f8835171..feb1af175cfde 100644
--- a/include/linux/thunderbolt.h
+++ b/include/linux/thunderbolt.h
@@ -213,6 +213,8 @@ enum tb_link_width {
  * @link_width: Width of the downstream facing link
  * @link_usb4: Downstream link is USB4
  * @is_unplugged: The XDomain is unplugged
+ * @removing: Set by tb_xdomain_remove() under @lock to prevent
+ *	      concurrent delayed work queueing
  * @needs_uuid: If the XDomain does not have @remote_uuid it will be
  *		queried first
  * @service_ids: Used to generate IDs for the services
@@ -262,6 +264,7 @@ struct tb_xdomain {
 	enum tb_link_width link_width;
 	bool link_usb4;
 	bool is_unplugged;
+	bool removing;
 	bool needs_uuid;
 	struct ida service_ids;
 	struct ida in_hopids;

base-commit: d73a08958e66849ea713d2f458b2fcf7b183f987
-- 
2.53.0


