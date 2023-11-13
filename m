Return-Path: <linux-usb+bounces-2835-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3604F7EA1DA
	for <lists+linux-usb@lfdr.de>; Mon, 13 Nov 2023 18:31:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B29C6280E93
	for <lists+linux-usb@lfdr.de>; Mon, 13 Nov 2023 17:31:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67951224D7;
	Mon, 13 Nov 2023 17:31:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="dnlZBHzx"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30E7B224D3
	for <linux-usb@vger.kernel.org>; Mon, 13 Nov 2023 17:31:30 +0000 (UTC)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A764F10E5
	for <linux-usb@vger.kernel.org>; Mon, 13 Nov 2023 09:31:29 -0800 (PST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 64A511F854;
	Mon, 13 Nov 2023 17:31:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1699896688; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=5nNubZ/Ee3FJod8ShAdP6IUWuLx4Jvsen7uljEF8kqk=;
	b=dnlZBHzxjJS0NVuodD2b+itgoO3SoaHWUgHPddEXT78K4KDWg8ZvYIrB/CDm3EaAnft2LA
	EUXE50gVmJcp3gQKHcH7XqHCOmMZxtEbL5BD1spzfnx4LoTzcKGM+UYyTir0H9O2kSxUcU
	I264JAHW31AMgoJ6RzcYm1uznzwyghM=
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 36A921358C;
	Mon, 13 Nov 2023 17:31:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id R+mhC3BdUmWbDAAAMHmgww
	(envelope-from <oneukum@suse.com>); Mon, 13 Nov 2023 17:31:28 +0000
From: Oliver Neukum <oneukum@suse.com>
To: peter.chen@kernel.org,
	gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org
Cc: Oliver Neukum <oneukum@suse.com>
Subject: [PATCH] initialize struct otg_fsm earlier
Date: Mon, 13 Nov 2023 18:31:20 +0100
Message-ID: <20231113173125.23696-1-oneukum@suse.com>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The earlier fix bf88fef0b6f1 ("usb: otg-fsm: Fix hrtimer list
corruption") in effect hid an issue with intialization.
In effect it replaces the racy continous reinitialization
of fsm->hnp_polling_work with a delayed one-time
initialization.

This just makes no sense. As a single initialization
is sufficient, the clean solution is just to do it once
and do it early enough.

Fixes: bf88fef0b6f1 ("usb: otg-fsm: Fix hrtimer list corruption")
Signed-off-by: Oliver Neukum <oneukum@suse.com>
---
 drivers/usb/common/usb-otg-fsm.c | 7 +------
 drivers/usb/phy/phy-fsl-usb.c    | 1 +
 include/linux/usb/otg-fsm.h      | 1 -
 3 files changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/usb/common/usb-otg-fsm.c b/drivers/usb/common/usb-otg-fsm.c
index 0697fde51d00..0aa2eb7396ce 100644
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
index 79617bb0a70e..4553aaab3761 100644
--- a/drivers/usb/phy/phy-fsl-usb.c
+++ b/drivers/usb/phy/phy-fsl-usb.c
@@ -844,6 +844,7 @@ int usb_otg_start(struct platform_device *pdev)
 
 	/* Initialize the state machine structure with default values */
 	SET_OTG_STATE(otg_trans, OTG_STATE_UNDEFINED);
+	INIT_DELAYED_WORK(&fsm->hnp_polling_work, otg_hnp_polling_work);
 	fsm->otg = p_otg->phy.otg;
 
 	/* We don't require predefined MEM/IRQ resource index */
diff --git a/include/linux/usb/otg-fsm.h b/include/linux/usb/otg-fsm.h
index 6135d076c53d..cc0bc4edf227 100644
--- a/include/linux/usb/otg-fsm.h
+++ b/include/linux/usb/otg-fsm.h
@@ -183,7 +183,6 @@ struct otg_fsm {
 	struct mutex lock;
 	u8 *host_req_flag;
 	struct delayed_work hnp_polling_work;
-	bool hnp_work_inited;
 	bool state_changed;
 };
 
-- 
2.42.0


