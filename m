Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 91FC2273F4F
	for <lists+linux-usb@lfdr.de>; Tue, 22 Sep 2020 12:14:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726509AbgIVKNz (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 22 Sep 2020 06:13:55 -0400
Received: from mx2.suse.de ([195.135.220.15]:57352 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726605AbgIVKNy (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 22 Sep 2020 06:13:54 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
        t=1600769633;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:in-reply-to:in-reply-to:references:references;
        bh=3J4awFmP6XNuAxKP8nvMUO9NLGMgKpv8n8B5oWGFW6o=;
        b=It8rTNJzce86wU+tUp1PnTI34w/VBTqETGCQ5NlyRgXO+iJ19TJ70cVcrcgPpGp3HiOgyv
        b1rtjSZ3TRFCn/huAi2WD3WUwhgQlAXMogv27Gy7hO9i34oROqFYAfwiWQ25LobEzyvWtE
        uXVOsZgtZiPBNklTTkSd0uNHDLIDYgM=
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 1BDF0ABD2;
        Tue, 22 Sep 2020 10:14:30 +0000 (UTC)
From:   Oliver Neukum <oneukum@suse.com>
To:     penguin-kernel@i-love.sakura.ne.jp, bjorn@mork.no,
        linux-usb@vger.kernel.org
Cc:     Oliver Neukum <oneukum@suse.com>
Subject: [RFC 4/6] CDC-WDM: fix race reporting errors in flush
Date:   Tue, 22 Sep 2020 12:13:27 +0200
Message-Id: <20200922101329.14801-5-oneukum@suse.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200922101329.14801-1-oneukum@suse.com>
References: <20200922101329.14801-1-oneukum@suse.com>
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
index 1ca2c85a977d..5fb855404403 100644
--- a/drivers/usb/class/cdc-wdm.c
+++ b/drivers/usb/class/cdc-wdm.c
@@ -613,7 +613,10 @@ static int wdm_flush(struct file *file, fl_owner_t id)
 	if (!rv)
 		return -EIO;
 
+	spin_lock_irq(&desc->iuspin);
 	rv = desc->werr;
+	desc->werr = 0;
+	spin_unlock_irq(&desc->iuspin);
 
 	return usb_translate_errors(rv);
 }
-- 
2.16.4

