Return-Path: <linux-usb+bounces-1253-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FEED7BD1FF
	for <lists+linux-usb@lfdr.de>; Mon,  9 Oct 2023 04:36:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 36E2A1C20AC2
	for <lists+linux-usb@lfdr.de>; Mon,  9 Oct 2023 02:36:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A505A46A4;
	Mon,  9 Oct 2023 02:36:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Kx7pN7qv"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 913765241
	for <linux-usb@vger.kernel.org>; Mon,  9 Oct 2023 02:36:33 +0000 (UTC)
Received: from mail-il1-x134.google.com (mail-il1-x134.google.com [IPv6:2607:f8b0:4864:20::134])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3ABB9AB
	for <linux-usb@vger.kernel.org>; Sun,  8 Oct 2023 19:36:32 -0700 (PDT)
Received: by mail-il1-x134.google.com with SMTP id e9e14a558f8ab-3526ac53d43so2237025ab.1
        for <linux-usb@vger.kernel.org>; Sun, 08 Oct 2023 19:36:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696818991; x=1697423791; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qxl5aMBpLKNGgqxRvmsqFYnSYsg9sj9eq9LrU4GbWw0=;
        b=Kx7pN7qvHTQn78DoLuc1z5I4O5ICYXOBzu52aWONSkRrg+HWT3H1mqcIo/4slqWasp
         KZbPE2p1Qz4+84a8wSBGqT5C4UlzYOMBANpymTc69Si+JNAH0rZ0PELW/VLbF6zxZthb
         PC+xiAdAp96Q0Xd0K9HBK6kKAlqohk09s6/WwpWL2AMUbWVR3J8nFatL4QZt1AEHrlsO
         ggmHqziasGN5vrhzZy0zaJ3UFgZ4sXzD0F3P5WLWKzkSo4yoWKlvfmn5jJmtAXazXPmf
         FLqv7/FiXMW6Gpw3Q9vUI3NVsOHJiuRJkUONHfBtgCSY4BVSEa+OqSqX+cbZNR4YPq5a
         I17w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696818991; x=1697423791;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qxl5aMBpLKNGgqxRvmsqFYnSYsg9sj9eq9LrU4GbWw0=;
        b=xPzHV3f2jtZjar0dxOco6aW5TXQj0crSjm6cNUZU3wVeg+aSJBlBSxin0Db8QQpHUc
         lK4GMZy+GKDCH8j/ro3YCFHm8PQbHF9bp+Ih24KR64Ep9FyX5hkSoipI0eKMZzRxDjin
         i1QpYZVklQWiaZX4U938CZRwjmprWc/t7wKIyYkF3FLU+JrPhLjckVOSeB2VA39ub16H
         Rg1KWs1ulIXAsdIEG7JTyTxOVnfwuNP68P0alFG4EbfFE1weQN7q1Ka0DlZwspgyquF7
         o3QY0/6uuQvHMMNHjfCkDpU9xWSS9+QF3lQq2+S1h8fD2W+jiTIF4ZB9rBNA94KQL27O
         kboQ==
X-Gm-Message-State: AOJu0YyhS3P6KnOtNj6OchRAi9HQrGqhuArdLa4o20+rsIfgbVr9VQh6
	nuv/XUriGThKaGwKYp8GxeA=
X-Google-Smtp-Source: AGHT+IEANyh2RX+uNEd/aNNllLWEyn3o75rOeOX4eR89j5r3vhZk7fYQZgnAuM/Gln2S2vtRq9A8UA==
X-Received: by 2002:a92:c847:0:b0:352:a3f5:6314 with SMTP id b7-20020a92c847000000b00352a3f56314mr12348004ilq.0.1696818991511;
        Sun, 08 Oct 2023 19:36:31 -0700 (PDT)
Received: from epislon.kloppenborg.net ([2601:281:d47f:ffab::18db])
        by smtp.gmail.com with ESMTPSA id m11-20020a924a0b000000b00351375f30b4sm2637583ilf.51.2023.10.08.19.36.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Oct 2023 19:36:31 -0700 (PDT)
From: Brian Kloppenborg <bkloppenborg@gmail.com>
X-Google-Original-From: Brian Kloppenborg <brian@kloppenborg.net>
To: Johan Hovold <johan@kernel.org>,
	linux-usb@vger.kernel.org
Cc: Brian Kloppenborg <brian@kloppenborg.net>
Subject: [PATCH 2/2] Make cp210x register GPS PPS signals on the RI pin.
Date: Sun,  8 Oct 2023 20:34:25 -0600
Message-Id: <20231009023425.366783-3-brian@kloppenborg.net>
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
 drivers/usb/serial/cp210x.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/usb/serial/cp210x.c b/drivers/usb/serial/cp210x.c
index af96d592456b..458360851a71 100644
--- a/drivers/usb/serial/cp210x.c
+++ b/drivers/usb/serial/cp210x.c
@@ -857,6 +857,15 @@ static void cp210x_process_msr(struct usb_serial_port *port, unsigned char msr,
 
 	if(msr & CP210X_MSR_DELTA_RI_BIT) {
 		port->icount.rng++;
+
+		// Support PPS signal on Ring Indicator pin. While uncommon, this is
+		// found on some devices, like the Adafruit Ultimate GPS USB-C edition.
+		tty = tty_port_tty_get(&port->port);
+		if (tty) {
+			usb_serial_handle_dcd_change(port, tty,
+				(msr) & CP210X_MSR_RI_STATE_BIT);
+		}
+		tty_kref_put(tty);
 	}
 
 	if(msr & CP210X_MSR_DELTA_DCD_BIT) {
-- 
2.34.1


