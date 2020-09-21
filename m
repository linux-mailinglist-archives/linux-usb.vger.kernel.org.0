Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8E649272228
	for <lists+linux-usb@lfdr.de>; Mon, 21 Sep 2020 13:21:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726632AbgIULVR (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 21 Sep 2020 07:21:17 -0400
Received: from mx2.suse.de ([195.135.220.15]:58124 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726627AbgIULVQ (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 21 Sep 2020 07:21:16 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
        t=1600687275;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:in-reply-to:in-reply-to:references:references;
        bh=dPYL0e0Ftt9dWXB+VlV5J7hKo86XPX/rxVVpKU2I0Q4=;
        b=VV8GTBfGPLCUMpAhc3C2w1Nzrm+lheD729/iQ47fsmTwzySAheQRfOX898g2ds2Wd6K3yS
        1tH8HxjpnKAWlqhTwg/VspIMJKKJ5qODGYb8R+QB9SPOoIPgLqYKy5Che1wu9p6MkC/Nzh
        CkDpYu7PnTckxm1TIKcYTtoEPV1tnYY=
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 9F3D9B207;
        Mon, 21 Sep 2020 11:21:51 +0000 (UTC)
From:   Oliver Neukum <oneukum@suse.com>
To:     penguin-kernel@i-love.sakura.ne.jp, bjorn@mork.no,
        linux-usb@vger.kernel.org
Cc:     Oliver Neukum <oneukum@suse.com>
Subject: [RFC 5/8] CDC-WDM: fix race reporting errors in flush
Date:   Mon, 21 Sep 2020 13:20:49 +0200
Message-Id: <20200921112052.27943-6-oneukum@suse.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200921112052.27943-1-oneukum@suse.com>
References: <20200921112052.27943-1-oneukum@suse.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

In case a race was lost and multiple fds used,
an error could be reported multiple times. To fix
this a spinlock must be taken.

Signed-off-by: Oliver Neukum <oneukum@suse.com>
---
 drivers/usb/class/cdc-wdm.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/usb/class/cdc-wdm.c b/drivers/usb/class/cdc-wdm.c
index 40661b9f6775..89929f6438e3 100644
--- a/drivers/usb/class/cdc-wdm.c
+++ b/drivers/usb/class/cdc-wdm.c
@@ -614,8 +614,11 @@ static int wdm_flush(struct file *file, fl_owner_t id)
 		return -EIO;
 	if (rv < 0)
 		return -EINTR;
+
+	spin_lock_irq(&desc->iuspin);
 	rv = desc->werr;
 	desc->werr = 0;
+	spin_unlock_irq(&desc->iuspin);
 
 	return usb_translate_errors(rv);
 }
-- 
2.16.4

