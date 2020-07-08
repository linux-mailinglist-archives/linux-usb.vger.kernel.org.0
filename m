Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 463DF21880A
	for <lists+linux-usb@lfdr.de>; Wed,  8 Jul 2020 14:50:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729352AbgGHMuZ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 8 Jul 2020 08:50:25 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:35702 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728803AbgGHMuX (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 8 Jul 2020 08:50:23 -0400
Received: by mail-lj1-f193.google.com with SMTP id q4so18377077lji.2
        for <linux-usb@vger.kernel.org>; Wed, 08 Jul 2020 05:50:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pOZZQ2mEGRz/QumI30v5ahCBip5V6aX9/P7bGwMt+E4=;
        b=icikPZ7uZ5x9SYjCgZg7h+htUhtPGeXpVwdL3OuG1eQ+r6X1H+HMuSUR8nlunqsZB6
         KKrVM1/YjzLtixd2zLQoUdI9aHlo4uImZkwU/9WRcswaPhuBxF3OZ8YsCvIqs/VFuyXa
         xkxe31vylNdrHt8Cqpb0GAoVYESIhbHjgv4nYxi3ovBgXdosrjLaioWmFI36bZLzzm1l
         EgxNnTCIgM4MPWhTAGiPJqRc+bs7HHR2ZNvWbC3cRN1pmHvvezRjLDko4MWDVs7BUn8I
         AJ7JxIaexP99IYn4fqpqS6p8BSD1pgGhBf9HvWwqhJNXqdDVdaWTWGavyz7ZnqtmngTP
         pDmg==
X-Gm-Message-State: AOAM533c2kmvp6AU+4uxZ15bfaw4LlIiJNRIeYkrrf+lf7PeByH6Epl9
        g6jb0fyia6d7FZmDWE2bwIFjBz80CeM=
X-Google-Smtp-Source: ABdhPJy+81I57mE5K7T8UJ9i1bevssbiiYY5I/V10zPlWtPOHbQFSdS9LQCYRv46WRXuMbqXkjlIOg==
X-Received: by 2002:a2e:9d84:: with SMTP id c4mr2209971ljj.46.1594212621004;
        Wed, 08 Jul 2020 05:50:21 -0700 (PDT)
Received: from xi.terra (c-beaee455.07-184-6d6c6d4.bbcust.telenor.se. [85.228.174.190])
        by smtp.gmail.com with ESMTPSA id g24sm883055ljl.139.2020.07.08.05.50.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2020 05:50:19 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.93.0.4)
        (envelope-from <johan@xi.terra>)
        id 1jt9Wg-000461-Hm; Wed, 08 Jul 2020 14:50:14 +0200
From:   Johan Hovold <johan@kernel.org>
To:     linux-usb@vger.kernel.org
Cc:     Johan Hovold <johan@kernel.org>
Subject: [PATCH 07/10] USB: serial: add sysrq break-handler dummy
Date:   Wed,  8 Jul 2020 14:49:57 +0200
Message-Id: <20200708125000.15659-8-johan@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200708125000.15659-1-johan@kernel.org>
References: <20200708125000.15659-1-johan@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Add inline sysrq break-handler dummy to allow the compiler to eliminate
further code when either console or sysrq support isn't enabled and to
clearly mark the two sysrq functions as belonging together.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/usb/serial/generic.c | 4 ++--
 include/linux/usb/serial.h   | 6 +++++-
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/serial/generic.c b/drivers/usb/serial/generic.c
index a9b6d103aaf6..e60f74f11acc 100644
--- a/drivers/usb/serial/generic.c
+++ b/drivers/usb/serial/generic.c
@@ -585,11 +585,10 @@ int usb_serial_handle_sysrq_char(struct usb_serial_port *port, unsigned int ch)
 	return 0;
 }
 EXPORT_SYMBOL_GPL(usb_serial_handle_sysrq_char);
-#endif
 
 int usb_serial_handle_break(struct usb_serial_port *port)
 {
-	if (!port->port.console || !IS_ENABLED(CONFIG_MAGIC_SYSRQ))
+	if (!port->port.console)
 		return 0;
 
 	if (!port->sysrq) {
@@ -600,6 +599,7 @@ int usb_serial_handle_break(struct usb_serial_port *port)
 	return 0;
 }
 EXPORT_SYMBOL_GPL(usb_serial_handle_break);
+#endif
 
 /**
  * usb_serial_handle_dcd_change - handle a change of carrier detect state
diff --git a/include/linux/usb/serial.h b/include/linux/usb/serial.h
index be73646706a9..c4ed4404335e 100644
--- a/include/linux/usb/serial.h
+++ b/include/linux/usb/serial.h
@@ -369,14 +369,18 @@ extern int usb_serial_generic_prepare_write_buffer(struct usb_serial_port *port,
 #if defined(CONFIG_USB_SERIAL_CONSOLE) && defined(CONFIG_MAGIC_SYSRQ)
 extern int usb_serial_handle_sysrq_char(struct usb_serial_port *port,
 					unsigned int ch);
+extern int usb_serial_handle_break(struct usb_serial_port *port);
 #else
 static inline int usb_serial_handle_sysrq_char(struct usb_serial_port *port, unsigned int ch)
 {
 	return 0;
 }
+static inline int usb_serial_handle_break(struct usb_serial_port *port)
+{
+	return 0;
+}
 #endif
 
-extern int usb_serial_handle_break(struct usb_serial_port *port);
 extern void usb_serial_handle_dcd_change(struct usb_serial_port *usb_port,
 					 struct tty_struct *tty,
 					 unsigned int status);
-- 
2.26.2

