Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8234F218806
	for <lists+linux-usb@lfdr.de>; Wed,  8 Jul 2020 14:50:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729343AbgGHMuX (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 8 Jul 2020 08:50:23 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:44769 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729207AbgGHMuV (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 8 Jul 2020 08:50:21 -0400
Received: by mail-lj1-f196.google.com with SMTP id s9so54044938ljm.11
        for <linux-usb@vger.kernel.org>; Wed, 08 Jul 2020 05:50:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=aDuUk3K2Ne/be8X+ATcbR7rLDEPHbUhT4BRk6qHTxNs=;
        b=mtAKNPInbMMFSVnDZKmcZ1e2POlsg261H1//haS7csOOZk0XgKrhWsIM1guSbLHem5
         u4mPQSpYFBDCCfOCp9Qtb06G3yDqfWIdPIb0GRNul3QFwt6Hy7pNlK6dHtzodcQth9yS
         zn1AACFS1OGaz7bJn5aqrz5mAAe6Z157Gq8cPQLyMTcHi6+sBwGnurH1LlkRzLsSAMwu
         Q6aOB8ES+/cVnCnGu+xzfWrc+PFsuzakZuGDX+klTTrb4hkZKm/Sw6KGLOSnb0jfX0TF
         zH7XV6zm5T/ByDA7uAVd/qVk0Jb1R3ElwOveDbeFPg/tTdi66u2KpUqMoDSf0OFG16dt
         9HEw==
X-Gm-Message-State: AOAM533CMlKXZ0OUdLsSKOEYn+LEkLWCmwUxo9Xu0Ijp0mEQWo2FI5Ks
        CSd9BG1EuVDd28yKXfVf4+rMSZ4CP4Y=
X-Google-Smtp-Source: ABdhPJzoHChsS6pXKnj+7FjwGzCJMnxn3302xnBHJmqzcd6nAO+ZS+p+uBJq+IN5mT/dZrH5ERShgg==
X-Received: by 2002:a2e:8992:: with SMTP id c18mr25516482lji.388.1594212619060;
        Wed, 08 Jul 2020 05:50:19 -0700 (PDT)
Received: from xi.terra (c-beaee455.07-184-6d6c6d4.bbcust.telenor.se. [85.228.174.190])
        by smtp.gmail.com with ESMTPSA id x64sm10357704lff.14.2020.07.08.05.50.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2020 05:50:16 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.93.0.4)
        (envelope-from <johan@xi.terra>)
        id 1jt9Wg-00045g-6B; Wed, 08 Jul 2020 14:50:14 +0200
From:   Johan Hovold <johan@kernel.org>
To:     linux-usb@vger.kernel.org
Cc:     Johan Hovold <johan@kernel.org>
Subject: [PATCH 03/10] USB: serial: ftdi_sio: fix break and sysrq handling
Date:   Wed,  8 Jul 2020 14:49:53 +0200
Message-Id: <20200708125000.15659-4-johan@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200708125000.15659-1-johan@kernel.org>
References: <20200708125000.15659-1-johan@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Only the last NUL in a packet should be flagged as a break character,
for example, to avoid dropping unrelated characters when IGNBRK is set.

Also make sysrq work by consuming the break character instead of having
it immediately cancel the sysrq request, and by not processing it
prematurely to avoid triggering a sysrq based on an unrelated character
received in the same packet (which was received *before* the break).

Note that the break flag can be left set also for a packet received
immediately following a break and that and an ending NUL in such a
packet will continue to be reported as a break as there's no good way to
tell it apart from an actual break.

Tested on FT232R and FT232H.

Fixes: 72fda3ca6fc1 ("USB: serial: ftd_sio: implement sysrq handling on break")
Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/usb/serial/ftdi_sio.c | 24 +++++++++++++++++-------
 1 file changed, 17 insertions(+), 7 deletions(-)

diff --git a/drivers/usb/serial/ftdi_sio.c b/drivers/usb/serial/ftdi_sio.c
index 33f1cca7eaa6..07b146d7033a 100644
--- a/drivers/usb/serial/ftdi_sio.c
+++ b/drivers/usb/serial/ftdi_sio.c
@@ -2483,6 +2483,7 @@ static int ftdi_process_packet(struct usb_serial_port *port,
 		struct ftdi_private *priv, unsigned char *buf, int len)
 {
 	unsigned char status;
+	bool brkint = false;
 	int i;
 	char flag;
 
@@ -2534,13 +2535,17 @@ static int ftdi_process_packet(struct usb_serial_port *port,
 	 */
 	flag = TTY_NORMAL;
 	if (buf[1] & FTDI_RS_ERR_MASK) {
-		/* Break takes precedence over parity, which takes precedence
-		 * over framing errors */
-		if (buf[1] & FTDI_RS_BI) {
-			flag = TTY_BREAK;
+		/*
+		 * Break takes precedence over parity, which takes precedence
+		 * over framing errors. Note that break is only associated
+		 * with the last character in the buffer and only when it's a
+		 * NUL.
+		 */
+		if (buf[1] & FTDI_RS_BI && buf[len - 1] == '\0') {
 			port->icount.brk++;
-			usb_serial_handle_break(port);
-		} else if (buf[1] & FTDI_RS_PE) {
+			brkint = true;
+		}
+		if (buf[1] & FTDI_RS_PE) {
 			flag = TTY_PARITY;
 			port->icount.parity++;
 		} else if (buf[1] & FTDI_RS_FE) {
@@ -2556,8 +2561,13 @@ static int ftdi_process_packet(struct usb_serial_port *port,
 
 	port->icount.rx += len - 2;
 
-	if (port->port.console && port->sysrq) {
+	if (brkint || (port->port.console && port->sysrq)) {
 		for (i = 2; i < len; i++) {
+			if (brkint && i == len - 1) {
+				if (usb_serial_handle_break(port))
+					return len - 3;
+				flag = TTY_BREAK;
+			}
 			if (usb_serial_handle_sysrq_char(port, buf[i]))
 				continue;
 			tty_insert_flip_char(&port->port, buf[i], flag);
-- 
2.26.2

