Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 05028337340
	for <lists+linux-usb@lfdr.de>; Thu, 11 Mar 2021 14:01:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233036AbhCKNA0 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 11 Mar 2021 08:00:26 -0500
Received: from mx2.suse.de ([195.135.220.15]:58850 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233125AbhCKNAT (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 11 Mar 2021 08:00:19 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
        t=1615467618; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=iYWa67bnLBkGw/alCLVwpKiXakCsiwfOiELqJkl29H4=;
        b=qGijTLAtM/Bvs2xlEEXXIckPdFR8gf4V+UnPD56OSIwARHBpcyyXJ/frkuEDZ0XGMJbEpr
        1RNxwZjFPoX+spL9liBoho9tdm3MZOKnAegV54/+mgrNPtziZRoQaGBaxmiOEF3dLKBjYu
        VZJYrp/mRr53CNzZCob1l84WtDINYrQ=
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 2DF9DAC24;
        Thu, 11 Mar 2021 13:00:18 +0000 (UTC)
From:   Oliver Neukum <oneukum@suse.com>
To:     bruno.thomsen@gmail.com, gregKHusb@linuxfoundation.org,
        linux-usb@vger.kernel.org
Cc:     Oliver Neukum <oneukum@suse.com>
Subject: [PATCH 2/2] CDC-ACM: downgrade message to debug
Date:   Thu, 11 Mar 2021 14:00:00 +0100
Message-Id: <20210311130000.15652-3-oneukum@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210311130000.15652-1-oneukum@suse.com>
References: <20210311130000.15652-1-oneukum@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This failure is so common that logging an error here amounts
to spamming log files.

Signed-off-by: Oliver Neukum <oneukum@suse.com>
---
 drivers/usb/class/cdc-acm.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/class/cdc-acm.c b/drivers/usb/class/cdc-acm.c
index d684cf94b1c0..fd2fce072985 100644
--- a/drivers/usb/class/cdc-acm.c
+++ b/drivers/usb/class/cdc-acm.c
@@ -659,7 +659,8 @@ static void acm_port_dtr_rts(struct tty_port *port, int raise)
 
 	res = acm_set_control(acm, val);
 	if (res && (acm->ctrl_caps & USB_CDC_CAP_LINE))
-		dev_err(&acm->control->dev, "failed to set dtr/rts\n");
+		/* This is broken in too many devices to spam the logs */
+		dev_dbg(&acm->control->dev, "failed to set dtr/rts\n");
 }
 
 static int acm_port_activate(struct tty_port *port, struct tty_struct *tty)
-- 
2.26.2

