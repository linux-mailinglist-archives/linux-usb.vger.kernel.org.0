Return-Path: <linux-usb+bounces-23194-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BF97A91A59
	for <lists+linux-usb@lfdr.de>; Thu, 17 Apr 2025 13:15:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9287D7AF785
	for <lists+linux-usb@lfdr.de>; Thu, 17 Apr 2025 11:14:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F39E238169;
	Thu, 17 Apr 2025 11:15:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="CsQb1eXL";
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="pErljyDW"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB95423814F
	for <linux-usb@vger.kernel.org>; Thu, 17 Apr 2025 11:15:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744888510; cv=none; b=ks+KOOJnzwki9rJoIU5qOtclnLN7B3/art9giAe38I9JOAjpOgIV0rM27ZZ2E22eNm6zW+erdkoSaNtZKvQacgxpqLwVZN0ikRYxhO0yd0yDc2canXYNBPUEqDY2AqroQeGJiX58l7HOyBzLSHo7imXK0qMpokmPTyj2mNjc7t8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744888510; c=relaxed/simple;
	bh=mUu4o99OPxuWM4ZRuXlGz4zVyfPqcsGLtasyXQgtJxs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rOov7yrh83ziUhaxC9AYjRS/tJdXwx9V+PgCPwIu8gh8XmApux9w/CAshjRtEzbyGk/EeHGQRfZJ30Ykuu5ATUmnKIOyWKDY+wc5GSZh+WNTd0cZyJmiSj1hVhHCPaVfrGYkt73LyX2+AlHWPvHL9ms3hDspHbPqU1e3zHW/xzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=CsQb1eXL; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=pErljyDW; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id D39991F391;
	Thu, 17 Apr 2025 11:15:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1744888507; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=+RICHLavOZf3tqZjtakJjRO6HPK+YHHklCIKU+fD9LY=;
	b=CsQb1eXLOXJciWC/IL9yP3lEbAaupm0OrtsY6d+sdfTm5TfPnDsLvabPi4z9mMLBxAJ2rO
	CXb6l9vemb2gX1E/YBRobAO8Wq8RSIoLxWYjInks5jtL9TE0K6mSB24wHEyQzCwRBqH5IO
	OZTpyyErb2YHEOn9DtnBlRbPBkuG4hg=
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=pErljyDW
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1744888505; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=+RICHLavOZf3tqZjtakJjRO6HPK+YHHklCIKU+fD9LY=;
	b=pErljyDWi3yOlz92WDfEUWll4lippJ9ay+ganUCVA4WnTsiNFNzCIecOhLt4j14Ioq873N
	bFQ5AHYa/Od45vk1nwDeuyFsX2NAOP+qlRLPBmf7lj1tnksrrm5X/20c29Yvo3n1mSoQ/Z
	0jQI0+BspXLCTU3hlf2qQuWm/6n8VE8=
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id ACEA11388F;
	Thu, 17 Apr 2025 11:15:05 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id mKoEKbniAGiKGAAAD6G6ig
	(envelope-from <oneukum@suse.com>); Thu, 17 Apr 2025 11:15:05 +0000
From: Oliver Neukum <oneukum@suse.com>
To: peter.chen@kernel.org,
	gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org
Cc: Oliver Neukum <oneukum@suse.com>
Subject: [PATCH] USB: initialize struct otg_fsm earlier
Date: Thu, 17 Apr 2025 13:14:54 +0200
Message-ID: <20250417111502.140474-1-oneukum@suse.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: D39991F391
X-Spam-Score: -3.01
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	MIME_TRACE(0.00)[0:+];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid,suse.com:email,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	DKIM_TRACE(0.00)[suse.com:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Level: 

The earlier fix bf88fef0b6f1 ("usb: otg-fsm: Fix hrtimer list
corruption") in effect hid an issue with intialization.
In effect it replaces the racy continous reinitialization
of fsm->hnp_polling_work with a delayed one-time
initialization.

This just makes no sense. As a single initialization
is sufficient, the clean solution is just to do it once
and do it early enough.

Signed-off-by: Oliver Neukum <oneukum@suse.com>
---
 drivers/usb/common/usb-otg-fsm.c | 7 +------
 drivers/usb/phy/phy-fsl-usb.c    | 1 +
 include/linux/usb/otg-fsm.h      | 2 +-
 3 files changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/usb/common/usb-otg-fsm.c b/drivers/usb/common/usb-otg-fsm.c
index e11803225775..a22d536ccdf8 100644
--- a/drivers/usb/common/usb-otg-fsm.c
+++ b/drivers/usb/common/usb-otg-fsm.c
@@ -117,7 +117,7 @@ static void otg_leave_state(struct otg_fsm *fsm, enum usb_otg_state old_state)
 	}
 }
 
-static void otg_hnp_polling_work(struct work_struct *work)
+void otg_hnp_polling_work(struct work_struct *work)
 {
 	struct otg_fsm *fsm = container_of(to_delayed_work(work),
 				struct otg_fsm, hnp_polling_work);
@@ -193,11 +193,6 @@ static void otg_start_hnp_polling(struct otg_fsm *fsm)
 	if (!fsm->host_req_flag)
 		return;
 
-	if (!fsm->hnp_work_inited) {
-		INIT_DELAYED_WORK(&fsm->hnp_polling_work, otg_hnp_polling_work);
-		fsm->hnp_work_inited = true;
-	}
-
 	schedule_delayed_work(&fsm->hnp_polling_work,
 					msecs_to_jiffies(T_HOST_REQ_POLL));
 }
diff --git a/drivers/usb/phy/phy-fsl-usb.c b/drivers/usb/phy/phy-fsl-usb.c
index 40ac68e52cee..7f0fdba689de 100644
--- a/drivers/usb/phy/phy-fsl-usb.c
+++ b/drivers/usb/phy/phy-fsl-usb.c
@@ -845,6 +845,7 @@ int usb_otg_start(struct platform_device *pdev)
 
 	/* Initialize the state machine structure with default values */
 	SET_OTG_STATE(otg_trans, OTG_STATE_UNDEFINED);
+	INIT_DELAYED_WORK(&fsm->hnp_polling_work, otg_hnp_polling_work);
 	fsm->otg = p_otg->phy.otg;
 
 	/* We don't require predefined MEM/IRQ resource index */
diff --git a/include/linux/usb/otg-fsm.h b/include/linux/usb/otg-fsm.h
index 6135d076c53d..26cb7e84cd50 100644
--- a/include/linux/usb/otg-fsm.h
+++ b/include/linux/usb/otg-fsm.h
@@ -183,7 +183,6 @@ struct otg_fsm {
 	struct mutex lock;
 	u8 *host_req_flag;
 	struct delayed_work hnp_polling_work;
-	bool hnp_work_inited;
 	bool state_changed;
 };
 
@@ -308,5 +307,6 @@ static inline int otg_start_gadget(struct otg_fsm *fsm, int on)
 }
 
 int otg_statemachine(struct otg_fsm *fsm);
+void otg_hnp_polling_work(struct work_struct *work);
 
 #endif /* __LINUX_USB_OTG_FSM_H */
-- 
2.49.0


