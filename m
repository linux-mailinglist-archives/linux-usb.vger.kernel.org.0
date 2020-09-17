Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 57E1F26D864
	for <lists+linux-usb@lfdr.de>; Thu, 17 Sep 2020 12:06:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726423AbgIQKGr (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 17 Sep 2020 06:06:47 -0400
Received: from mx2.suse.de ([195.135.220.15]:37706 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726554AbgIQKGe (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 17 Sep 2020 06:06:34 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=cantorsusede;
        t=1600337190;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:in-reply-to:in-reply-to:references:references;
        bh=Xy983x5GYa/afyX2dJHq8mBNPl8bQlZM2OJUHuYc0WQ=;
        b=jTKjfjaRCHiwqyceYDUWgz0/aG5mC6sEK6thyqp9V7vciCK5SVPalulPnoixbeoB85JFei
        a5JQWVkyMrvEQz/C5ZEZK2dyqYxCnnHWpEWKzH9iYQRYzNtNBrzocGmdNWkvKr17Md68e+
        Q50jX9buS1o4wqECNkmh9Glk0OBnp7LaNZcZZrSSUKX0aEfD3sPU7lMOoR5iExE5iPU8Ya
        58sMbVCNAauZUXYYAbX0rj2IglpXzqB80Zy/ZoqeHXLN2JWeioTMjTZrdzm2z0Z2SoxD2r
        gpbU5k8qfA2FFou20vfn+Ncl6FMsi3BaMoZ6eGovxL37IIFnb7/bdf+kTIkBPQ==
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id C37E9ADA8;
        Thu, 17 Sep 2020 10:07:03 +0000 (UTC)
From:   Oliver Neukum <oneukum@suse.com>
To:     penguin-kernel@i-love.sakura.ne.jp, bjorn@mork.no,
        linux-usb@vger.kernel.org
Cc:     Oliver Neukum <oneukum@suse.com>
Subject: [RFC 5/7] CDC-WDM: remove use of intf->dev after potential disconnect
Date:   Thu, 17 Sep 2020 12:06:12 +0200
Message-Id: <20200917100614.1010-6-oneukum@suse.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200917100614.1010-1-oneukum@suse.com>
References: <20200917100614.1010-1-oneukum@suse.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

After a disconnect intf->dev is not a valid pointer any longer
as flush() uses it only for logging purposes logging is not
worth it. Remove the dev_err()

Reported-by: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Signed-off-by: Oliver Neukum <oneukum@suse.com>
---
 drivers/usb/class/cdc-wdm.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/class/cdc-wdm.c b/drivers/usb/class/cdc-wdm.c
index 930000b1d43b..89929f6438e3 100644
--- a/drivers/usb/class/cdc-wdm.c
+++ b/drivers/usb/class/cdc-wdm.c
@@ -603,7 +603,11 @@ static int wdm_flush(struct file *file, fl_owner_t id)
 			test_bit(WDM_DISCONNECTING, &desc->flags),
 			WDM_FLUSH_TIMEOUT);
 
-	/* cannot dereference desc->intf if WDM_DISCONNECTING */
+	/*
+	 * to report the correct error.
+	 * This is best effort
+	 * We are inevitably racing with the hardware.
+	 */
 	if (test_bit(WDM_DISCONNECTING, &desc->flags))
 		return -ENODEV;
 	if (!rv)
@@ -616,9 +620,6 @@ static int wdm_flush(struct file *file, fl_owner_t id)
 	desc->werr = 0;
 	spin_unlock_irq(&desc->iuspin);
 
-	if (rv < 0)
-		dev_err(&desc->intf->dev, "Error in flush path: %d\n", rv);
-
 	return usb_translate_errors(rv);
 }
 
-- 
2.16.4

