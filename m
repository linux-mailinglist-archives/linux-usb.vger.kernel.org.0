Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D4C42337352
	for <lists+linux-usb@lfdr.de>; Thu, 11 Mar 2021 14:02:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233389AbhCKNCC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 11 Mar 2021 08:02:02 -0500
Received: from mx2.suse.de ([195.135.220.15]:59804 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233326AbhCKNBi (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 11 Mar 2021 08:01:38 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
        t=1615467697; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=iYWa67bnLBkGw/alCLVwpKiXakCsiwfOiELqJkl29H4=;
        b=qw0Lgq9lPWSRMWT94bFYNnN3NVivK/IXWtp4C6asL+Te8mHdHcidpSHCUfSOeUfHw4n9iR
        f9ey71+N9iFuGTBPV7eaBhiGihhq3q7qRuRT90znbhlxnh3YdG651C+FJT+QDhThx1z1w5
        xDJX9xlLem9I/8e3HoSjfAzax7GbH5U=
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id B60C7AC17;
        Thu, 11 Mar 2021 13:01:37 +0000 (UTC)
From:   Oliver Neukum <oneukum@suse.com>
To:     bruno.thomsen@gmail.com, gregKH@linuxfoundation.org,
        linux-usb@vger.kernel.org
Cc:     Oliver Neukum <oneukum@suse.com>
Subject: [PATCH 2/2] CDC-ACM: downgrade message to debug
Date:   Thu, 11 Mar 2021 14:01:26 +0100
Message-Id: <20210311130126.15972-2-oneukum@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210311130126.15972-1-oneukum@suse.com>
References: <20210311130126.15972-1-oneukum@suse.com>
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

