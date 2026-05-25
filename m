Return-Path: <linux-usb+bounces-38014-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wNvHBVhHFGrzLwcAu9opvQ
	(envelope-from <linux-usb+bounces-38014-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 25 May 2026 14:58:00 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id ADBF85CAD0A
	for <lists+linux-usb@lfdr.de>; Mon, 25 May 2026 14:57:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9DC18301486D
	for <lists+linux-usb@lfdr.de>; Mon, 25 May 2026 12:57:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13C3338398A;
	Mon, 25 May 2026 12:57:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BhqToCpJ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26C69381AE6
	for <linux-usb@vger.kernel.org>; Mon, 25 May 2026 12:57:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779713875; cv=none; b=CBdzED6ytRnlmT7bTGGLwcD7gxB5V83SlxNVklf9YnHSPzixTUnb9aRmTyorQTLuOoErYJKazA7pBE8Chn2nEKz6wyOtxaFOGKGGzY5uc5se2aWiABRKEb10UCYzU1x3qfnj8yQ1yx6SfoyL+Lk5esD0fLc7nxORdhF9R0NLcM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779713875; c=relaxed/simple;
	bh=99aXVm/qYR76ZGN2GPcr6L+i0EGIZZYJzjh5Zkrt2p4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=C9T16u9UBJh4jwGaFZ1IqPpKBVw8YyaQxsheEZIBhMOLY2xQpBAP1jvC3ji3rkaXSx3amfJXu0L5bWyI6OvFmxtfbMuUy33oiO0eA2mUkBlYPlYBFtqxKHQSoN7mg9yHm8dusfV9eFv6Ci38uEVsu2suAe5Q6uIhCMAuvGAHUfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BhqToCpJ; arc=none smtp.client-ip=209.85.219.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-8b6dd874471so144743506d6.0
        for <linux-usb@vger.kernel.org>; Mon, 25 May 2026 05:57:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779713873; x=1780318673; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xsaU2QFciQt/t5B1EUxXsHdEngrBZxj8roxLnaxSrAc=;
        b=BhqToCpJPkuVqsyC5Ze6CUYQUFGsG4VwVmAFYaZyXCEt0sQKIEW9m1G/FOy79AIX0P
         SIBuupv/23QSKF1Wk/hTCRCpby04p7pAuCJfjB1L5sYgXIXGHovmJ5+TQmoJeFTflq4S
         XZd6oz6OJSOcPW5TdQKYIcnjXPeR8Ww7OPhA6upSZ8fIfPjpQibahIWnmX/x+sNgVimz
         +2UuQdO40BlDoirw2oqzN2dcOZdsqvCBv6JZn4zvYIf6a9b17PHsbJrEmqwkKswie+9b
         +6uRs/3XXgAnYf2Ljwc9nafOI6pf7V9jyN0Hx4Oc5S3T8FyM8QI7lprFBkch7bgCwrft
         g8oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779713873; x=1780318673;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xsaU2QFciQt/t5B1EUxXsHdEngrBZxj8roxLnaxSrAc=;
        b=Lz2xtigFNY52GdTXzpJPJ/21ydEo81YdK6DIIZLB3Hk+oSX3fNdFNFMMC5u6aUVmvR
         rV2bBzzVOBp5ptgtfrwNHrh5v/2Lr4faoAnBSM/IuUq2VZWthG9IvVJMAPFZ0DaTMZdB
         TtaRWS4int2n8CecEzor71iqCx9xe2R6G9/cNdh7tSpZOEn5YNRnIOQcALd6EUkgyCYt
         NKIFS+L+jTjMvLTT3bvOR6DAAwQAa83cJfiPOPPhHrl0Qy0V8biByouwD5et2tNdJIi1
         +Juox4tkYAluR17XhWA13Zg3kpd3v/cn3h10jrc8EywKlxTT7ShKNnN++pXexWs+kDFQ
         fWjw==
X-Gm-Message-State: AOJu0YzkzGhjeyL+/8e3XTVRDUR3LCOi/NRK26IRJfV6WKg1fIBJiXqR
	YEJVlQmHVd1hnkkX1A11f/zplaYXeA63YMEqpT2WUrHJ6asDg/0fluX9
X-Gm-Gg: Acq92OFLjPrK2r64o0tAYsI0xEAOjkiDMNY1ZaYjwlS5qozp1H0hInQIh/7VWevTtD2
	r9XF+gXzzfBVox2Ohu7uk1aLaUnLeVXW7MEqW6G0Zl2xOKv2BnfnPuzQstQJp//u+8TDC/t9JTN
	vdLffNu1yhj7l2NuC7a8rATROVznfeidJeiKqZaP594BTHFmRh2tld5S6ClnnlkBwQ8oV0eG2ml
	tHE1Gk0D2oVA8rkiwPSIQvWU0f5RtaP3Dl1iGKIG/w5WbnbEJDGj/pGDU5ob5NY7h6vaUPROXxc
	fm2JSSBq4cEXc75Kg1SpwAXMAslMURo345tUk1ufco+eLckha878JhYz9tCJSNY+1pE+3JkJ9YQ
	YCMFOJecZUPnz7A0Wzppe6aP0VeKr9ZHUvITsb1pt2+OMLm6IZNEp/jNDQwQwhna5BpmVtlvcsc
	vV3ZOSDhv/Aa/JFCmMOK4sHkvQqejklfozZHt5/j0sYWJ2bGNNqSCllBfv0dblD14zv7/8XAh0I
	ma16C4JyKpVkKZLKKLq4Y/n4JFPQ5GQNiI37CJhnM0=
X-Received: by 2002:a05:6214:242a:b0:8ca:15b8:a37c with SMTP id 6a1803df08f44-8cc7b583e4bmr234934456d6.9.1779713872949;
        Mon, 25 May 2026 05:57:52 -0700 (PDT)
Received: from server0.tail6e7dd.ts.net (c-68-48-65-54.hsd1.mi.comcast.net. [68.48.65.54])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8cc80dcedb3sm108973336d6.8.2026.05.25.05.57.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 05:57:52 -0700 (PDT)
From: Michael Bommarito <michael.bommarito@gmail.com>
To: Mika Westerberg <westeri@kernel.org>,
	Andreas Noever <andreas.noever@gmail.com>,
	Yehezkel Bernat <YehezkelShB@gmail.com>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] thunderbolt: prevent XDomain delayed work use-after-free on disconnect
Date: Mon, 25 May 2026 08:57:36 -0400
Message-ID: <20260525125736.1268929-1-michael.bommarito@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38014-lists,linux-usb=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5]
X-Rspamd-Queue-Id: ADBF85CAD0A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

tb_xdp_handle_request() runs on system_wq and queues
xd->state_work via queue_delayed_work() in three request handlers:
PROPERTIES_CHANGED_REQUEST, UUID_REQUEST (via start_handshake),
and LINK_STATE_CHANGE_REQUEST.  Similarly, update_xdomain() queues
xd->properties_changed_work from bus_for_each_dev() when local
properties change.

Concurrently, tb_xdomain_remove() calls stop_handshake() which does
cancel_delayed_work_sync() on both delayed works, then
device_unregister() which eventually frees the xdomain.  Since
commit 559c1e1e0134 ("thunderbolt: Run tb_xdp_handle_request() in
system workqueue") moved the request handler off tb->wq, the
handler and the remove path are no longer serialized.  If
queue_delayed_work() executes after cancel_delayed_work_sync() but
before the xdomain is freed, the delayed work fires on a freed
object.

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
 drivers/thunderbolt/xdomain.c | 40 ++++++++++++++++++++++++++---------
 include/linux/thunderbolt.h   |  3 +++
 2 files changed, 33 insertions(+), 10 deletions(-)

diff --git a/drivers/thunderbolt/xdomain.c b/drivers/thunderbolt/xdomain.c
index 1fd1cf4295a2a..55f91ead8f13b 100644
--- a/drivers/thunderbolt/xdomain.c
+++ b/drivers/thunderbolt/xdomain.c
@@ -785,9 +785,13 @@ static void tb_xdp_handle_request(struct work_struct *work)
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
@@ -800,8 +804,12 @@ static void tb_xdp_handle_request(struct work_struct *work)
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
 
@@ -829,9 +837,13 @@ static void tb_xdp_handle_request(struct work_struct *work)
 
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
@@ -2074,6 +2086,10 @@ void tb_xdomain_remove(struct tb_xdomain *xd)
 {
 	tb_xdomain_debugfs_remove(xd);
 
+	mutex_lock(&xd->lock);
+	xd->removing = true;
+	mutex_unlock(&xd->lock);
+
 	stop_handshake(xd);
 
 	device_for_each_child_reverse(&xd->dev, xd, unregister_service);
@@ -2484,8 +2500,12 @@ static int update_xdomain(struct device *dev, void *data)
 
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
diff --git a/include/linux/thunderbolt.h b/include/linux/thunderbolt.h
index 0ba112175bb39..7204586c10c3e 100644
--- a/include/linux/thunderbolt.h
+++ b/include/linux/thunderbolt.h
@@ -209,6 +209,8 @@ enum tb_link_width {
  * @link_width: Width of the downstream facing link
  * @link_usb4: Downstream link is USB4
  * @is_unplugged: The XDomain is unplugged
+ * @removing: Set by tb_xdomain_remove() under @lock to prevent
+ *	      concurrent delayed work queueing
  * @needs_uuid: If the XDomain does not have @remote_uuid it will be
  *		queried first
  * @service_ids: Used to generate IDs for the services
@@ -257,6 +259,7 @@ struct tb_xdomain {
 	enum tb_link_width link_width;
 	bool link_usb4;
 	bool is_unplugged;
+	bool removing;
 	bool needs_uuid;
 	struct ida service_ids;
 	struct ida in_hopids;

base-commit: 928abe19fbf0127003abcb1ea69cabc1c897d0ab
prerequisite-patch-id: 568123ac4badeed61126aaa6ea4b751522da24a6
prerequisite-patch-id: bbb8fb9eb5ecf865daf2dd1daec056054aead3df
prerequisite-patch-id: 34c0bcaacf7f5a77b1cde8878516b8bbd5ca19dc
prerequisite-patch-id: a7e026bebb71889c4158d186b85eccf5bf64d6bc
prerequisite-patch-id: a6d22495595875ad794fe9fcfcda64b8344b97d6
prerequisite-patch-id: 20125baeeb45edacd9cc1167a89e876e14a88882
-- 
2.53.0


