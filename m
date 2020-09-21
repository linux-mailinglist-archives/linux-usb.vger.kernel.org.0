Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4CD9A27222B
	for <lists+linux-usb@lfdr.de>; Mon, 21 Sep 2020 13:21:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726654AbgIULVS (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 21 Sep 2020 07:21:18 -0400
Received: from mx2.suse.de ([195.135.220.15]:58110 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726532AbgIULVR (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 21 Sep 2020 07:21:17 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
        t=1600687276;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:in-reply-to:in-reply-to:references:references;
        bh=/ngJDL6/z4BJCeT0oPCblUO16rv/1+hCOitTErETCi0=;
        b=ZH5NCXjwyacORxWak9yPY8h/p1Ab6S6o8DhyEpemCng4vexkRw0mGlpbHw2IspJfCdD2OH
        pCHDtpqjpRpQ/YBJNdkGUq2gSVVYSXRS4DzppypFxIRX3boLI6KKB245384dFP/FW3Ep7z
        5ic+98WKbaVAsdxGJUJcIb6tXt2AqGo=
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 8B98EB20B;
        Mon, 21 Sep 2020 11:21:52 +0000 (UTC)
From:   Oliver Neukum <oneukum@suse.com>
To:     penguin-kernel@i-love.sakura.ne.jp, bjorn@mork.no,
        linux-usb@vger.kernel.org
Cc:     Oliver Neukum <oneukum@suse.com>
Subject: [RFC 8/8] CDC-WDM: reduce scope of wdm_mutex
Date:   Mon, 21 Sep 2020 13:20:52 +0200
Message-Id: <20200921112052.27943-9-oneukum@suse.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200921112052.27943-1-oneukum@suse.com>
References: <20200921112052.27943-1-oneukum@suse.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Use the global mutex for as short as possible in open()

Signed-off-by: Oliver Neukum <oneukum@suse.com>
---
 drivers/usb/class/cdc-wdm.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/class/cdc-wdm.c b/drivers/usb/class/cdc-wdm.c
index 7607ab2bbe07..230fe66828e3 100644
--- a/drivers/usb/class/cdc-wdm.c
+++ b/drivers/usb/class/cdc-wdm.c
@@ -704,6 +704,7 @@ static int wdm_open(struct inode *inode, struct file *file)
 
 	/* using write lock to protect desc->count */
 	mutex_lock(&desc->wlock);
+	mutex_unlock(&wdm_mutex);
 	if (!desc->count++) {
 		/* in case flush() had timed out */
 		usb_kill_urb(desc->command);
@@ -716,13 +717,14 @@ static int wdm_open(struct inode *inode, struct file *file)
 				"Error submitting int urb - %d\n", rv);
 			rv = usb_translate_errors(rv);
 		}
+		if (desc->count == 1)
+			desc->manage_power(intf, 1);
 	} else {
 		rv = 0;
 	}
 	mutex_unlock(&desc->wlock);
-	if (desc->count == 1)
-		desc->manage_power(intf, 1);
 	usb_autopm_put_interface(desc->intf);
+	return rv;
 out:
 	mutex_unlock(&wdm_mutex);
 	return rv;
-- 
2.16.4

