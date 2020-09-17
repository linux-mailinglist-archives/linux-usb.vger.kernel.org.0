Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3D1B226D863
	for <lists+linux-usb@lfdr.de>; Thu, 17 Sep 2020 12:06:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726584AbgIQKGq (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 17 Sep 2020 06:06:46 -0400
Received: from mx2.suse.de ([195.135.220.15]:37668 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726524AbgIQKGd (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 17 Sep 2020 06:06:33 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=cantorsusede;
        t=1600337189;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:in-reply-to:in-reply-to:references:references;
        bh=02ogVbl2/wFuqInSwBJuVrTNQykLfclOjm8SmDAqKiE=;
        b=hsf4IaSZ93RRF1iBPCIkPPynJH7AdJRUYWf9ObLABI2Yd57PB2+UMVArMSfARY/R0gClyA
        t63hfAUMRTpZgaIIw69M/6BTsoYZ3MbjPIhyJaPLcMCZJFl+IvjOTPV9NdMujDcSyB+Utx
        v5MxeuumhvzxgWmSk3VjkU78jSx4zSkG+tb5MAv0TCpDFzHxTUMWgtnxNuvgc3+3Jjc4oO
        1i0dhLvyMUrw/pUp7yF9lLfDDgJo5NDLYA3V6wfwnJXm5a8pCE7DCAgQH90dIAzEUCtvU+
        P+7mk8xrcwlVpmygbbkosbiAAC7rQdJWB10br6BLiTclahOTPfCWrC6/miVq6Q==
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 854ADADA2;
        Thu, 17 Sep 2020 10:07:03 +0000 (UTC)
From:   Oliver Neukum <oneukum@suse.com>
To:     penguin-kernel@i-love.sakura.ne.jp, bjorn@mork.no,
        linux-usb@vger.kernel.org
Cc:     Oliver Neukum <oneukum@suse.com>
Subject: [RFC 4/7] CDC-WDM: fix race reporting errors in flush
Date:   Thu, 17 Sep 2020 12:06:11 +0200
Message-Id: <20200917100614.1010-5-oneukum@suse.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200917100614.1010-1-oneukum@suse.com>
References: <20200917100614.1010-1-oneukum@suse.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

In case a race was lost and multiple fds used,
an error could be reported multiple times. To fix
this a spinlock must be taken.

Signed-off-by: Oliver Neukum <oneukum@suse.com>
---
 drivers/usb/class/cdc-wdm.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/class/cdc-wdm.c b/drivers/usb/class/cdc-wdm.c
index eee19532e67e..930000b1d43b 100644
--- a/drivers/usb/class/cdc-wdm.c
+++ b/drivers/usb/class/cdc-wdm.c
@@ -610,10 +610,14 @@ static int wdm_flush(struct file *file, fl_owner_t id)
 		return -EIO;
 	if (rv < 0)
 		return -EINTR;
+
+	spin_lock_irq(&desc->iuspin);
 	rv = desc->werr;
+	desc->werr = 0;
+	spin_unlock_irq(&desc->iuspin);
+
 	if (rv < 0)
-		dev_err(&desc->intf->dev, "Error in flush path: %d\n",
-			rv);
+		dev_err(&desc->intf->dev, "Error in flush path: %d\n", rv);
 
 	return usb_translate_errors(rv);
 }
-- 
2.16.4

