Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7D5E817DCA2
	for <lists+linux-usb@lfdr.de>; Mon,  9 Mar 2020 10:52:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726217AbgCIJwN (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 9 Mar 2020 05:52:13 -0400
Received: from laas.laas.fr ([140.93.0.15]:44750 "EHLO laas.laas.fr"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725942AbgCIJwN (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 9 Mar 2020 05:52:13 -0400
Received: from beetle.laas.fr (beetle.laas.fr [IPv6:2001:660:6602:4:4a4d:7eff:fee1:650a])
        by laas.laas.fr (8.16.0.21/8.16.0.29) with SMTP id 0299q4uM075319;
        Mon, 9 Mar 2020 10:52:05 +0100 (CET)
Received: by beetle.laas.fr (sSMTP sendmail emulation); Mon, 09 Mar 2020 10:52:04 +0100
From:   Anthony Mallet <anthony.mallet@laas.fr>
To:     Oliver Neukum <oneukum@suse.com>, linux-usb@vger.kernel.org
Cc:     Anthony Mallet <anthony.mallet@laas.fr>
Subject: [PATCH 1/2] USB: cdc-acm: fix close_delay and closing_wait units in TIOCSSERIAL
Date:   Mon,  9 Mar 2020 10:51:58 +0100
Message-Id: <20200309095159.14163-1-anthony.mallet@laas.fr>
X-Mailer: git-send-email 2.17.1
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

close_delay and closing_wait are specified in hundredth of a second but stored
internally in jiffies. Use the jiffies_to_msecs() and msecs_to_jiffies()
functions to convert from each other.

Signed-off-by: Anthony Mallet <anthony.mallet@laas.fr>
---
 drivers/usb/class/cdc-acm.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/class/cdc-acm.c b/drivers/usb/class/cdc-acm.c
index 62f4fb9b362f..da619176deca 100644
--- a/drivers/usb/class/cdc-acm.c
+++ b/drivers/usb/class/cdc-acm.c
@@ -896,10 +896,10 @@ static int get_serial_info(struct tty_struct *tty, struct serial_struct *ss)
 
 	ss->xmit_fifo_size = acm->writesize;
 	ss->baud_base = le32_to_cpu(acm->line.dwDTERate);
-	ss->close_delay	= acm->port.close_delay / 10;
+	ss->close_delay	= jiffies_to_msecs(acm->port.close_delay) / 10;
 	ss->closing_wait = acm->port.closing_wait == ASYNC_CLOSING_WAIT_NONE ?
 				ASYNC_CLOSING_WAIT_NONE :
-				acm->port.closing_wait / 10;
+				jiffies_to_msecs(acm->port.closing_wait) / 10;
 	return 0;
 }
 
@@ -909,9 +909,10 @@ static int set_serial_info(struct tty_struct *tty, struct serial_struct *ss)
 	unsigned int closing_wait, close_delay;
 	int retval = 0;
 
-	close_delay = ss->close_delay * 10;
+	close_delay = msecs_to_jiffies(ss->close_delay * 10);
 	closing_wait = ss->closing_wait == ASYNC_CLOSING_WAIT_NONE ?
-			ASYNC_CLOSING_WAIT_NONE : ss->closing_wait * 10;
+			ASYNC_CLOSING_WAIT_NONE :
+			msecs_to_jiffies(ss->closing_wait * 10);
 
 	mutex_lock(&acm->port.mutex);
 
-- 
2.17.1

