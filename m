Return-Path: <linux-usb+bounces-1252-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1018A7BD1FE
	for <lists+linux-usb@lfdr.de>; Mon,  9 Oct 2023 04:36:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5B38E28158A
	for <lists+linux-usb@lfdr.de>; Mon,  9 Oct 2023 02:36:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BE6453AA;
	Mon,  9 Oct 2023 02:36:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KtWWDye0"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCBD75229
	for <linux-usb@vger.kernel.org>; Mon,  9 Oct 2023 02:36:31 +0000 (UTC)
Received: from mail-il1-x130.google.com (mail-il1-x130.google.com [IPv6:2607:f8b0:4864:20::130])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B703BA6
	for <linux-usb@vger.kernel.org>; Sun,  8 Oct 2023 19:36:30 -0700 (PDT)
Received: by mail-il1-x130.google.com with SMTP id e9e14a558f8ab-3528b1c4977so881755ab.1
        for <linux-usb@vger.kernel.org>; Sun, 08 Oct 2023 19:36:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696818990; x=1697423790; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1YpJRfA7TG7AdA4wVD14GsthsiZfPenRr6qG8Q1whA8=;
        b=KtWWDye0EQJ14B9tjIvm1G1eVMDTShEYXcQ84rq8aGNYuo5xNqjb+2Gz7JsmVNNHeD
         c1AzUA7DMI4i6bICJDHcyTRk3sQl/97CBd5ZkUtaHFYI8QsV24zupuCwWQMTVLQ3Pf+R
         65hRF9sQYN3ct4mW9uHtTl1zu9PxyNe4UzE3+uqUP26VlJcFjnjUg5q6oS5koc6z5ZTr
         mqcSfvfkB2n0gpwHb1y0KOAsje9bt3DJ/4dOG9Xi8SUWngT4hyyu5quFYCZzgB+0Esu+
         IrA4EFXg1T6FP8DAmCkRbWD0gRKiOh67zg3RmkpZHjdkAg9eDVQCzMEDxInEKDbFkkFv
         apSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696818990; x=1697423790;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1YpJRfA7TG7AdA4wVD14GsthsiZfPenRr6qG8Q1whA8=;
        b=SvSIJTqrhFnnLFP1pgcjfZ2ouxmhEutjIsybEiVkUUCSIyBnytb3tPEZLz5B/zP6EO
         QBvSUkDdzvR1OUN/Yd2SH6MeeDkxjEkVnTzjbJ8a27WiWjUHYTt66zuElohwuQ2+BPl1
         fH/gv0BldHHhtXcRQjGFegi5cTvZC1m6ufEAylmOvD42BSLF64H7wa6ltk6Won/Y+L5j
         yegYfGgRGi5/BkC6PCbpNdx6yQXC59BYKu6tQ9B0j2u2/pt7MAOsHRDZGbZYeRul1dFK
         KEOHaaVJoUa6qtfMR8kv4DCbl8dUa3pia6De78Hssz+wlAKmj2JL4hd9IBS70szX4YuK
         8AVg==
X-Gm-Message-State: AOJu0Yx94c1W3L3EW2RvpcX7RThM+07oTphI5Ca+701n+VK+Be9eM3tJ
	D8goYBKPzFUJpy8LW/7VGRo=
X-Google-Smtp-Source: AGHT+IGZAbyPMILKp/ueuH5zfOpARpn0i5AkPQEi88UU5gCAzdx2v/YiGQr+jX8zxLOeR+i9CUeCdA==
X-Received: by 2002:a92:d1d0:0:b0:351:54db:c1bc with SMTP id u16-20020a92d1d0000000b0035154dbc1bcmr13443434ilg.0.1696818989968;
        Sun, 08 Oct 2023 19:36:29 -0700 (PDT)
Received: from epislon.kloppenborg.net ([2601:281:d47f:ffab::18db])
        by smtp.gmail.com with ESMTPSA id m11-20020a924a0b000000b00351375f30b4sm2637583ilf.51.2023.10.08.19.36.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Oct 2023 19:36:29 -0700 (PDT)
From: Brian Kloppenborg <bkloppenborg@gmail.com>
X-Google-Original-From: Brian Kloppenborg <brian@kloppenborg.net>
To: Johan Hovold <johan@kernel.org>,
	linux-usb@vger.kernel.org
Cc: Brian Kloppenborg <brian@kloppenborg.net>
Subject: [PATCH 1/2] Make cp210x respond to modem status changes (CTS, DSR, RI, DCD) by default.
Date: Sun,  8 Oct 2023 20:34:24 -0600
Message-Id: <20231009023425.366783-2-brian@kloppenborg.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231009023425.366783-1-brian@kloppenborg.net>
References: <20231009023425.366783-1-brian@kloppenborg.net>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

---
 drivers/usb/serial/cp210x.c | 62 ++++++++++++++++++++++++++++++-------
 1 file changed, 51 insertions(+), 11 deletions(-)

diff --git a/drivers/usb/serial/cp210x.c b/drivers/usb/serial/cp210x.c
index 1e61fe043171..af96d592456b 100644
--- a/drivers/usb/serial/cp210x.c
+++ b/drivers/usb/serial/cp210x.c
@@ -285,6 +285,7 @@ struct cp210x_port_private {
 	bool			event_mode;
 	enum cp210x_event_state event_state;
 	u8			lsr;
+	u8			msr;
 
 	struct mutex		mutex;
 	bool			crtscts;
@@ -459,6 +460,15 @@ struct cp210x_comm_status {
 #define CP210X_LSR_FRAME	BIT(3)
 #define CP210X_LSR_BREAK	BIT(4)
 
+/* Bits for Modem Status EMBED_EVENTS as described in AN571 */
+#define CP210X_MSR_DELTA_CTS_BIT 	BIT(0)
+#define CP210X_MSR_DELTA_DSR_BIT 	BIT(1)
+#define CP210X_MSR_DELTA_RI_BIT 	BIT(2)
+#define CP210X_MSR_DELTA_DCD_BIT 	BIT(3)
+#define CP210X_MSR_CTS_STATE_BIT 	BIT(4)
+#define CP210X_MSR_DSR_STATE_BIT 	BIT(5)
+#define CP210X_MSR_RI_STATE_BIT 	BIT(6)
+#define CP210X_MSR_DCD_STATE_BIT	BIT(7)
 
 /* CP210X_GET_FLOW/CP210X_SET_FLOW read/write these 0x10 bytes */
 struct cp210x_flow_ctl {
@@ -786,6 +796,8 @@ static int cp210x_open(struct tty_struct *tty, struct usb_serial_port *port)
 	if (result)
 		goto err_disable;
 
+	cp210x_enable_event_mode(port);
+
 	return 0;
 
 err_disable:
@@ -799,6 +811,8 @@ static void cp210x_close(struct usb_serial_port *port)
 {
 	struct cp210x_port_private *port_priv = usb_get_serial_port_data(port);
 
+	cp210x_disable_event_mode(port);
+
 	usb_serial_generic_close(port);
 
 	/* Clear both queues; cp2108 needs this to avoid an occasional hang */
@@ -829,6 +843,41 @@ static void cp210x_process_lsr(struct usb_serial_port *port, unsigned char lsr,
 	}
 }
 
+static void cp210x_process_msr(struct usb_serial_port *port, unsigned char msr, char *flag)
+{
+	struct tty_struct *tty;
+
+	if(msr & CP210X_MSR_DELTA_CTS_BIT) {
+		port->icount.cts++;
+	}
+
+	if(msr & CP210X_MSR_DELTA_DSR_BIT) {
+		port->icount.dsr++;
+	}
+
+	if(msr & CP210X_MSR_DELTA_RI_BIT) {
+		port->icount.rng++;
+	}
+
+	if(msr & CP210X_MSR_DELTA_DCD_BIT) {
+		port->icount.dcd++;
+
+		tty = tty_port_tty_get(&port->port);
+		if (tty) {
+			usb_serial_handle_dcd_change(port, tty,
+				(msr) & CP210X_MSR_DCD_STATE_BIT);
+		}
+		tty_kref_put(tty);
+
+	}
+
+	if(msr & CP210X_MSR_CTS_STATE_BIT) {
+		port->icount.cts++;
+	}
+
+	wake_up_interruptible(&port->port.delta_msr_wait);
+}
+
 static bool cp210x_process_char(struct usb_serial_port *port, unsigned char *ch, char *flag)
 {
 	struct cp210x_port_private *port_priv = usb_get_serial_port_data(port);
@@ -880,9 +929,9 @@ static bool cp210x_process_char(struct usb_serial_port *port, unsigned char *ch,
 		break;
 	case ES_MSR:
 		dev_dbg(&port->dev, "%s - msr = 0x%02x\n", __func__, *ch);
-		/* unimplemented */
+		port_priv->msr = *ch;
+		cp210x_process_msr(port, port_priv->msr, flag);
 		port_priv->event_state = ES_DATA;
-		break;
 	}
 
 	return true;
@@ -1310,15 +1359,6 @@ static void cp210x_set_termios(struct tty_struct *tty,
 		dev_err(&port->dev, "failed to set line control: %d\n", ret);
 
 	cp210x_set_flow_control(tty, port, old_termios);
-
-	/*
-	 * Enable event-insertion mode only if input parity checking is
-	 * enabled for now.
-	 */
-	if (I_INPCK(tty))
-		cp210x_enable_event_mode(port);
-	else
-		cp210x_disable_event_mode(port);
 }
 
 static int cp210x_tiocmset(struct tty_struct *tty,
-- 
2.34.1


