Return-Path: <linux-usb+bounces-36690-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mF3jMB4O8mkynQEAu9opvQ
	(envelope-from <linux-usb+bounces-36690-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 29 Apr 2026 15:56:46 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 45D5449535E
	for <lists+linux-usb@lfdr.de>; Wed, 29 Apr 2026 15:56:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DBCDB30342B2
	for <lists+linux-usb@lfdr.de>; Wed, 29 Apr 2026 13:53:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FDDC313E10;
	Wed, 29 Apr 2026 13:53:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amicon.ru header.i=@amicon.ru header.b="S0Q+AYzH"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail.amicon.ru (mail.amicon.ru [77.108.111.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E7072FD1B3;
	Wed, 29 Apr 2026 13:53:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=77.108.111.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777470821; cv=none; b=PjpFRNilrR4fdCUGMsAH7HHLVlproY+OQse60eb4eYFdeme1QjrdG0PS9s3DmS0PgktY6ByBEY4ew92TXVmFYbdCieJKhbE7ahAmshvUv/beflGFBgUO3Nv+DII3dXEseOrQfSu7r7vKY+tYvVibvJBhTi0VSta7bLVBJ2CNU1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777470821; c=relaxed/simple;
	bh=FuV6t38owbOwUeQ5bl5rvJjuJFhjtOXS4dXpe55g2dc=;
	h=Content-Type:From:To:CC:Subject:Date:Message-ID:MIME-Version; b=hzIwfepIRKdyD2qjphUBjVGjreEAN5dPBgQ4KCmr0zu+/NXvA0eMydTvMxfrvQ3NiBqJm4eb2q5dV9DXGc/JD0JYZA7vB9BQmt9Mcy+lM+y2Mv0IKW3TAd/xAPB6tmCdFudZmQGhPlgkIJHvvM1NyowASpctyufptG7gwGhtAjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amicon.ru; spf=pass smtp.mailfrom=amicon.ru; dkim=pass (2048-bit key) header.d=amicon.ru header.i=@amicon.ru header.b=S0Q+AYzH; arc=none smtp.client-ip=77.108.111.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amicon.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amicon.ru
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; d=amicon.ru; s=mail; c=simple/simple;
	t=1777469907; h=from:subject:to:date:message-id;
	bh=FuV6t38owbOwUeQ5bl5rvJjuJFhjtOXS4dXpe55g2dc=;
	b=S0Q+AYzHzvRlPeccqgK0RXwZagzRlkraVMomN+AaTBIiiiK4+DQ36xuOzsILyAh7kcugNzX65uO
	YQ+4JYUeWXtsfvidUTwr3fAXXPtTwoKNeODNY52StgJZrnqzRrRtZydh+g4HuLIg98G4HXUmRS8KW
	cKv194kAOMZrIUnDcLh6DiAZcNkNvNJO/nWaIdV6Rl997NpfThiNYDbIbDN9apFuSQkeI9fbnVOzH
	qwg4vfbnESy/FAXpIusAeu09Se1T1XZirVglKNNfOjtcbMV/g3ww6sBxbl7AhLCT11O/UQ1OvDAXS
	164MhjxNdik3WjX+LQuSYyJ7GEstOh+V1oIw==
Received: from example.com (172.16.2.46) by mail.amicon.lan (192.168.0.59)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.27; Wed, 29 Apr
 2026 16:38:27 +0300
From: Agalakov Daniil <ade@amicon.ru>
To: Johan Hovold <johan@kernel.org>
CC: Agalakov Daniil <ade@amicon.ru>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, <linux-usb@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <lvc-project@linuxtesting.org>, Roman Razov
	<rrv@amicon.ru>, Iskhakov Daniil <dish@amicon.ru>
Subject: [PATCH] USB: serial: mos7720: fix actual baud rate not reported back to TTY
Date: Wed, 29 Apr 2026 16:38:12 +0300
Message-ID: <20260429133815.317534-1-ade@amicon.ru>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ClientProxiedBy: mail.amicon.lan (192.168.0.59) To mail.amicon.lan
 (192.168.0.59)
X-Rspamd-Queue-Id: 45D5449535E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[amicon.ru,quarantine];
	R_DKIM_ALLOW(-0.20)[amicon.ru:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36690-lists,linux-usb=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ade@amicon.ru,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[amicon.ru:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_SEVEN(0.00)[8];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[]

The calc_baud_rate_divisor() function computes a divisor from the
requested baud rate using integer arithmetic, which means the actual
hardware baud rate may differ from the requested one. Previously this
rounded value was never propagated back to the TTY layer, so
tty_encode_baud_rate() was called with the requested rate rather than
the actual one.

Change baudrate parameters in calc_baud_rate_divisor() and
send_cmd_write_baud_rate() to pointers so the actual resulting baud
rate can be written back to the caller. Update *baudrate with the
computed value (230400 / custom) after divisor calculation.

In change_port_settings(), pass &baud to send_cmd_write_baud_rate()
and guard tty_encode_baud_rate() with a status check, so the TTY is
only updated on success and receives the true hardware baud rate.

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Fixes: 65d063ab21fe ("USB: mos7720: clean up termios")
Co-developed-by: Iskhakov Daniil <dish@amicon.ru>
Signed-off-by: Iskhakov Daniil <dish@amicon.ru>
Signed-off-by: Agalakov Daniil <ade@amicon.ru>
---
 drivers/usb/serial/mos7720.c | 29 ++++++++++++++---------------
 1 file changed, 14 insertions(+), 15 deletions(-)

diff --git a/drivers/usb/serial/mos7720.c b/drivers/usb/serial/mos7720.c
index 94459408e7fb..1052217edf26 100644
--- a/drivers/usb/serial/mos7720.c
+++ b/drivers/usb/serial/mos7720.c
@@ -1264,9 +1264,9 @@ static const struct divisor_table_entry divisor_table[] = {
 /*****************************************************************************
  * calc_baud_rate_divisor
  *	this function calculates the proper baud rate divisor for the specified
- *	baud rate.
+ *	baud rate and updates the baudrate parameter with the actual value.
  *****************************************************************************/
-static int calc_baud_rate_divisor(struct usb_serial_port *port, int baudrate, int *divisor)
+static int calc_baud_rate_divisor(struct usb_serial_port *port, int *baudrate, int *divisor)
 {
 	int i;
 	__u16 custom;
@@ -1274,10 +1274,10 @@ static int calc_baud_rate_divisor(struct usb_serial_port *port, int baudrate, in
 	__u16 round;
 
 
-	dev_dbg(&port->dev, "%s - %d\n", __func__, baudrate);
+	dev_dbg(&port->dev, "%s - %d\n", __func__, *baudrate);
 
 	for (i = 0; i < ARRAY_SIZE(divisor_table); i++) {
-		if (divisor_table[i].baudrate == baudrate) {
+		if (divisor_table[i].baudrate == *baudrate) {
 			*divisor = divisor_table[i].divisor;
 			return 0;
 		}
@@ -1285,18 +1285,19 @@ static int calc_baud_rate_divisor(struct usb_serial_port *port, int baudrate, in
 
 	/* After trying for all the standard baud rates    *
 	 * Try calculating the divisor for this baud rate  */
-	if (baudrate > 75 &&  baudrate < 230400) {
+	if (*baudrate > 75 && *baudrate < 230400) {
 		/* get the divisor */
-		custom = (__u16)(230400L  / baudrate);
+		custom = (__u16)(230400L  / *baudrate);
 
 		/* Check for round off */
-		round1 = (__u16)(2304000L / baudrate);
+		round1 = (__u16)(2304000L / *baudrate);
 		round = (__u16)(round1 - (custom * 10));
 		if (round > 4)
 			custom++;
 		*divisor = custom;
+		*baudrate = 230400L / custom;
 
-		dev_dbg(&port->dev, "Baud %d = %d\n", baudrate, custom);
+		dev_dbg(&port->dev, "Baud %d = %d\n", *baudrate, custom);
 		return 0;
 	}
 
@@ -1307,10 +1308,10 @@ static int calc_baud_rate_divisor(struct usb_serial_port *port, int baudrate, in
 /*
  * send_cmd_write_baud_rate
  *	this function sends the proper command to change the baud rate of the
- *	specified port.
+ *	specified port and updates the baudrate parameter with the actual value.
  */
 static int send_cmd_write_baud_rate(struct moschip_port *mos7720_port,
-				    int baudrate)
+				    int *baudrate)
 {
 	struct usb_serial_port *port;
 	struct usb_serial *serial;
@@ -1325,7 +1326,7 @@ static int send_cmd_write_baud_rate(struct moschip_port *mos7720_port,
 	serial = port->serial;
 
 	number = port->port_number;
-	dev_dbg(&port->dev, "%s - baud = %d\n", __func__, baudrate);
+	dev_dbg(&port->dev, "%s - baud = %d\n", __func__, *baudrate);
 
 	/* Calculate the Divisor */
 	status = calc_baud_rate_divisor(port, baudrate, &divisor);
@@ -1474,10 +1475,8 @@ static void change_port_settings(struct tty_struct *tty,
 	}
 
 	dev_dbg(&port->dev, "%s - baud rate = %d\n", __func__, baud);
-	status = send_cmd_write_baud_rate(mos7720_port, baud);
-	/* FIXME: needs to write actual resulting baud back not just
-	   blindly do so */
-	if (cflag & CBAUD)
+	status = send_cmd_write_baud_rate(mos7720_port, &baud);
+	if (!status && (cflag & CBAUD))
 		tty_encode_baud_rate(tty, baud, baud);
 	/* Enable Interrupts */
 	write_mos_reg(serial, port_number, MOS7720_IER, 0x0c);
-- 
2.51.0


