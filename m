Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4163D2F9E07
	for <lists+linux-usb@lfdr.de>; Mon, 18 Jan 2021 12:26:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390058AbhARLSF (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 18 Jan 2021 06:18:05 -0500
Received: from mail.kernel.org ([198.145.29.99]:56330 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389977AbhARLOV (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 18 Jan 2021 06:14:21 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id CE36C229C7;
        Mon, 18 Jan 2021 11:13:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1610968420;
        bh=7ONUXsP3mlzBDyTQmfltqwQMxBokUGZgZ2sCZjW9zxA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=QoVX/En+UQuaIzUJVymz9XctFcB9ApuqWeRecZTk3LuqrfbkQvFIT6ziB+uvbOwtS
         1atR19JFgDoS2IrVDsEkXLv3mwgzHHzrLmJQkNO0OUPfeAkN8Cz0yebt3LWAp/xyNV
         7MT51T1p/bEvGx3feFWo/bh26ZqbWFRE9yzlbdgFPwJRVPZiqUjCgDug06u64FaCj3
         3C7q687HIDNg8X15ftzSn9RH9Qr2Jx9BDpvQQDdZ8M6aRK58Ai1jGMJJYJo8bnGU3u
         baMbtKcDxlTVWx/MURSTKuYj8RbCSXTKgX6WPPELt9IcgBiBOuOYJrJFW794KaVuvt
         OrqBdfvBV6k+w==
Received: from johan by xi with local (Exim 4.93.0.4)
        (envelope-from <johan@kernel.org>)
        id 1l1STh-0001KO-Uc; Mon, 18 Jan 2021 12:13:45 +0100
From:   Johan Hovold <johan@kernel.org>
To:     linux-usb@vger.kernel.org
Cc:     Sheng Long Wang <china_shenglong@163.com>,
        Wang Sheng Long <shenglong.wang.ext@siemens.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Johan Hovold <johan@kernel.org>
Subject: [PATCH 1/6] USB: serial: cp210x: add support for software flow control
Date:   Mon, 18 Jan 2021 12:13:26 +0100
Message-Id: <20210118111331.5048-2-johan@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210118111331.5048-1-johan@kernel.org>
References: <20210118111331.5048-1-johan@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Wang Sheng Long <shenglong.wang.ext@siemens.com>

When data is transmitted between two serial ports, the phenomenon of
data loss often occurs. The two kinds of flow control commonly used in
serial communication are hardware flow control and software flow
control.

In serial communication, If you only use RX/TX/GND Pins, you can't do
hardware flow. So we often used software flow control and prevent data
loss. The user sets the software flow control through the application
program, and the application program sets the software flow control mode
for the serial port chip through the driver.

For the cp210 serial port chip, its driver lacks the software flow
control setting code, so the user cannot set the software flow control
function through the application program. This adds the missing software
flow control.

Signed-off-by: Wang Sheng Long <shenglong.wang.ext@siemens.com>
Link: https://lore.kernel.org/r/20210104094502.3942-1-china_shenglong@163.com
[ johan: rework properly on top of recent termios changes ]
Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/usb/serial/cp210x.c | 67 +++++++++++++++++++++++++++++++++++--
 1 file changed, 65 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/serial/cp210x.c b/drivers/usb/serial/cp210x.c
index fbb10dfc56e3..5bd14770065b 100644
--- a/drivers/usb/serial/cp210x.c
+++ b/drivers/usb/serial/cp210x.c
@@ -377,6 +377,16 @@ static struct usb_serial_driver * const serial_drivers[] = {
 #define CONTROL_WRITE_DTR	0x0100
 #define CONTROL_WRITE_RTS	0x0200
 
+/* CP210X_(GET|SET)_CHARS */
+struct cp210x_special_chars {
+	u8	bEofChar;
+	u8	bErrorChar;
+	u8	bBreakChar;
+	u8	bEventChar;
+	u8	bXonChar;
+	u8	bXoffChar;
+};
+
 /* CP210X_VENDOR_SPECIFIC values */
 #define CP210X_READ_2NCONFIG	0x000E
 #define CP210X_READ_LATCH	0x00C2
@@ -1074,11 +1084,38 @@ static void cp210x_disable_event_mode(struct usb_serial_port *port)
 	port_priv->event_mode = false;
 }
 
+static int cp210x_set_chars(struct usb_serial_port *port,
+		struct cp210x_special_chars *chars)
+{
+	struct cp210x_port_private *port_priv = usb_get_serial_port_data(port);
+	struct usb_serial *serial = port->serial;
+	void *dmabuf;
+	int result;
+
+	dmabuf = kmemdup(chars, sizeof(*chars), GFP_KERNEL);
+	if (!dmabuf)
+		return -ENOMEM;
+
+	result = usb_control_msg(serial->dev, usb_sndctrlpipe(serial->dev, 0),
+				CP210X_SET_CHARS, REQTYPE_HOST_TO_INTERFACE, 0,
+				port_priv->bInterfaceNumber,
+				dmabuf, sizeof(*chars), USB_CTRL_SET_TIMEOUT);
+
+	kfree(dmabuf);
+
+	if (result < 0) {
+		dev_err(&port->dev, "failed to set special chars: %d\n", result);
+		return result;
+	}
+
+	return 0;
+}
+
 static bool cp210x_termios_change(const struct ktermios *a, const struct ktermios *b)
 {
 	bool iflag_change;
 
-	iflag_change = ((a->c_iflag ^ b->c_iflag) & INPCK);
+	iflag_change = ((a->c_iflag ^ b->c_iflag) & (INPCK | IXON | IXOFF));
 
 	return tty_termios_hw_change(a, b) || iflag_change;
 }
@@ -1086,13 +1123,29 @@ static bool cp210x_termios_change(const struct ktermios *a, const struct ktermio
 static void cp210x_set_flow_control(struct tty_struct *tty,
 		struct usb_serial_port *port, struct ktermios *old_termios)
 {
+	struct cp210x_special_chars chars;
 	struct cp210x_flow_ctl flow_ctl;
 	u32 flow_repl;
 	u32 ctl_hs;
 	int ret;
 
-	if (old_termios && C_CRTSCTS(tty) == (old_termios->c_cflag & CRTSCTS))
+	if (old_termios &&
+			C_CRTSCTS(tty) == (old_termios->c_cflag & CRTSCTS) &&
+			I_IXON(tty) == (old_termios->c_iflag & IXON) &&
+			I_IXOFF(tty) == (old_termios->c_iflag & IXOFF)) {
 		return;
+	}
+
+	if (I_IXON(tty) || I_IXOFF(tty)) {
+		memset(&chars, 0, sizeof(chars));
+
+		chars.bXonChar = START_CHAR(tty);
+		chars.bXoffChar = STOP_CHAR(tty);
+
+		ret = cp210x_set_chars(port, &chars);
+		if (ret)
+			return;
+	}
 
 	ret = cp210x_read_reg_block(port, CP210X_GET_FLOW, &flow_ctl,
 			sizeof(flow_ctl));
@@ -1118,6 +1171,16 @@ static void cp210x_set_flow_control(struct tty_struct *tty,
 		flow_repl |= CP210X_SERIAL_RTS_SHIFT(CP210X_SERIAL_RTS_ACTIVE);
 	}
 
+	if (I_IXOFF(tty))
+		flow_repl |= CP210X_SERIAL_AUTO_RECEIVE;
+	else
+		flow_repl &= ~CP210X_SERIAL_AUTO_RECEIVE;
+
+	if (I_IXON(tty))
+		flow_repl |= CP210X_SERIAL_AUTO_TRANSMIT;
+	else
+		flow_repl &= ~CP210X_SERIAL_AUTO_TRANSMIT;
+
 	dev_dbg(&port->dev, "%s - ulControlHandshake=0x%08x, ulFlowReplace=0x%08x\n",
 			__func__, ctl_hs, flow_repl);
 
-- 
2.26.2

