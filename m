Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6CFD3366662
	for <lists+linux-usb@lfdr.de>; Wed, 21 Apr 2021 09:45:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237242AbhDUHqP (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 21 Apr 2021 03:46:15 -0400
Received: from mx2.suse.de ([195.135.220.15]:59700 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237138AbhDUHqJ (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 21 Apr 2021 03:46:09 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
        t=1618991135; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
        bh=cRDwRcQvczOIpGR2j/vboOp76HtkJjMqbZw6/7CGivg=;
        b=Jr9cq9PkR+d6w9ai/rx3KLlhoySJlxx/9NREmtzvz8isVEHMdufyy+E1HNT8bGFOvqzoi7
        JhO1FI5sCpReJugsYJHJS64P18O+A92po2Y0IuppCJXLC1UbqhrbK617VtLtY5RYi5ov0U
        afiZRv6aTCbzNiIOSNFqkm0Rg2QcjQc=
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id CAA7EACF9;
        Wed, 21 Apr 2021 07:45:35 +0000 (UTC)
From:   Oliver Neukum <oneukum@suse.com>
To:     gregKH@linuxfoundation.org, linux-usb@vger.kernel.org
Cc:     Oliver Neukum <oneukum@suse.com>
Subject: [PATCH] CDC-ACM: fix poison/unpoison imbalance
Date:   Wed, 21 Apr 2021 09:45:13 +0200
Message-Id: <20210421074513.4327-1-oneukum@suse.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

suspend() does its poisoning conditionally, resume() does it
unconditionally. On a device with combined interfaces this
will balance, on a device with two interfaces the counter will
go negative and resubmission will fail.

Both actions need to be done conditionally.

Fixes: 6069e3e927c8f ("USB: cdc-acm: untangle a circular dependency between callback and softint")
Signed-off-by: Oliver Neukum <oneukum@suse.com>
---
 drivers/usb/class/cdc-acm.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/class/cdc-acm.c b/drivers/usb/class/cdc-acm.c
index 3fda1ec961d7..f5886c512fec 100644
--- a/drivers/usb/class/cdc-acm.c
+++ b/drivers/usb/class/cdc-acm.c
@@ -1634,12 +1634,13 @@ static int acm_resume(struct usb_interface *intf)
 	struct urb *urb;
 	int rv = 0;
 
-	acm_unpoison_urbs(acm);
 	spin_lock_irq(&acm->write_lock);
 
 	if (--acm->susp_count)
 		goto out;
 
+	acm_unpoison_urbs(acm);
+
 	if (tty_port_initialized(&acm->port)) {
 		rv = usb_submit_urb(acm->ctrlurb, GFP_ATOMIC);
 
-- 
2.26.2

