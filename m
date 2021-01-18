Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2AD132FAAF4
	for <lists+linux-usb@lfdr.de>; Mon, 18 Jan 2021 21:08:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2394179AbhARUHF (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 18 Jan 2021 15:07:05 -0500
Received: from mail.kernel.org ([198.145.29.99]:57288 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2390062AbhARLRB (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 18 Jan 2021 06:17:01 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id EFEC022AAA;
        Mon, 18 Jan 2021 11:13:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1610968420;
        bh=M9zxGtlH9hPe41bPLOZaX41IfFeTJfowhNd7mr+NTEI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=uxzsl+0ZOPu/MCyzlRcT/RvmLkjwSiG1PDMwgptXLOo1VwXaUP8WPheck5sAfb29q
         OGVEAAdSvhKJx/TESrWAxoHYLvuQIxVZj2+IS11WzBLy8h1m7Mt/7+NIR/cRy/frbJ
         Cdup7dl3ykSNNTKgr3+gYV0awPXvO7ot6cmRDNfFd0vSjctkre+DYsLQ/9bqKHsbG/
         SrneOi5L+2AhzlsBlUapjLVCGRcANzCQKTxksYQRKDeZFE+StVuV/x1lmJjkb3EnL6
         9VgbEkcIZISZ/0CJAZZvuBJ/TiFQsxWQMrgpgPcuWYoiYXivapq7ja96zrarQME8Yj
         RMZQcLO6I2Pig==
Received: from johan by xi with local (Exim 4.93.0.4)
        (envelope-from <johan@kernel.org>)
        id 1l1STi-0001KT-5a; Mon, 18 Jan 2021 12:13:46 +0100
From:   Johan Hovold <johan@kernel.org>
To:     linux-usb@vger.kernel.org
Cc:     Sheng Long Wang <china_shenglong@163.com>,
        Wang Sheng Long <shenglong.wang.ext@siemens.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Johan Hovold <johan@kernel.org>
Subject: [PATCH 3/6] USB: serial: cp210x: update control-characters on every change
Date:   Mon, 18 Jan 2021 12:13:28 +0100
Message-Id: <20210118111331.5048-4-johan@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210118111331.5048-1-johan@kernel.org>
References: <20210118111331.5048-1-johan@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Update the XON/XOFF control characters also when no other flow-control
flag has changed and software flow control is enabled.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/usb/serial/cp210x.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/serial/cp210x.c b/drivers/usb/serial/cp210x.c
index ee0139eb6636..4f90573c0d2b 100644
--- a/drivers/usb/serial/cp210x.c
+++ b/drivers/usb/serial/cp210x.c
@@ -1113,11 +1113,13 @@ static int cp210x_set_chars(struct usb_serial_port *port,
 
 static bool cp210x_termios_change(const struct ktermios *a, const struct ktermios *b)
 {
-	bool iflag_change;
+	bool iflag_change, cc_change;
 
 	iflag_change = ((a->c_iflag ^ b->c_iflag) & (INPCK | IXON | IXOFF));
+	cc_change = a->c_cc[VSTART] != b->c_cc[VSTART] ||
+			a->c_cc[VSTOP] != b->c_cc[VSTOP];
 
-	return tty_termios_hw_change(a, b) || iflag_change;
+	return tty_termios_hw_change(a, b) || iflag_change || cc_change;
 }
 
 static void cp210x_set_flow_control(struct tty_struct *tty,
@@ -1132,7 +1134,9 @@ static void cp210x_set_flow_control(struct tty_struct *tty,
 	if (old_termios &&
 			C_CRTSCTS(tty) == (old_termios->c_cflag & CRTSCTS) &&
 			I_IXON(tty) == (old_termios->c_iflag & IXON) &&
-			I_IXOFF(tty) == (old_termios->c_iflag & IXOFF)) {
+			I_IXOFF(tty) == (old_termios->c_iflag & IXOFF) &&
+			START_CHAR(tty) == old_termios->c_cc[VSTART] &&
+			STOP_CHAR(tty) == old_termios->c_cc[VSTOP]) {
 		return;
 	}
 
-- 
2.26.2

