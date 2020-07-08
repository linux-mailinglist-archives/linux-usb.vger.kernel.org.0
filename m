Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D0FA921880C
	for <lists+linux-usb@lfdr.de>; Wed,  8 Jul 2020 14:50:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729357AbgGHMu2 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 8 Jul 2020 08:50:28 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:38512 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729349AbgGHMu1 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 8 Jul 2020 08:50:27 -0400
Received: by mail-lj1-f193.google.com with SMTP id 9so54049585ljv.5
        for <linux-usb@vger.kernel.org>; Wed, 08 Jul 2020 05:50:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=76o7TPyG5W7HRmbJ1JPr6DNE58uGocp5+r9r210o0c0=;
        b=jMJfdmsvJ2LsLvJzMi1nM5UPyzGpTbVNwDZ8VQodZGUopFWYblPJt2WsBJbI2k1aVi
         5u6WS1POKq88f4SahoKxpGiaMmcSSf6W2GL85JKbFIQCnxvJ8jrBZwvuXp9SC8q8Rayt
         BC9ywmzF7WNZ/ht1fEYkHEK49TgzchERylvU4N2EPb25CLvRinGVBym6dGjuiF2wYG1m
         VI6iDlaY2u/W1tqZZZh/TM/94eMAz0EmnSZSFhBJB3RU04mocZ+Lgelbqq2/bvuPpdSo
         +5WAXg44SjsF1jgvHd3u7Pu9mbqAYiq19gzm2n+bUZN4JDePe/Lsq5LbgBDhM82LsqTo
         Dgtg==
X-Gm-Message-State: AOAM53106hJOxqgpOdDxH/Ql6cObTm3QgIXFyWS/A17Mf/hqCttO5g4Y
        4IFVm39t1aN+JNJAP/uzAM7AcjqYKbo=
X-Google-Smtp-Source: ABdhPJyH2LfAILJTOLzGcQYg686siHv2bXWwq6i35+hpbgrpM0tpTEc1dZEMfBBiCOHAMUUnpjEINA==
X-Received: by 2002:a2e:3202:: with SMTP id y2mr32723273ljy.465.1594212623548;
        Wed, 08 Jul 2020 05:50:23 -0700 (PDT)
Received: from xi.terra (c-beaee455.07-184-6d6c6d4.bbcust.telenor.se. [85.228.174.190])
        by smtp.gmail.com with ESMTPSA id o21sm10040545lfo.2.2020.07.08.05.50.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2020 05:50:19 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.93.0.4)
        (envelope-from <johan@xi.terra>)
        id 1jt9Wg-00046C-NX; Wed, 08 Jul 2020 14:50:14 +0200
From:   Johan Hovold <johan@kernel.org>
To:     linux-usb@vger.kernel.org
Cc:     Johan Hovold <johan@kernel.org>
Subject: [PATCH 09/10] USB: serial: drop extern keyword from function declarations
Date:   Wed,  8 Jul 2020 14:49:59 +0200
Message-Id: <20200708125000.15659-10-johan@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200708125000.15659-1-johan@kernel.org>
References: <20200708125000.15659-1-johan@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Drop the redundant extern keyword from function declarations in the
subsystem header file to improve readability (and make it easier to spot
the global variables).

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 include/linux/usb/serial.h | 81 +++++++++++++++++---------------------
 1 file changed, 36 insertions(+), 45 deletions(-)

diff --git a/include/linux/usb/serial.h b/include/linux/usb/serial.h
index 4becca7ae264..6d756d03f46f 100644
--- a/include/linux/usb/serial.h
+++ b/include/linux/usb/serial.h
@@ -315,19 +315,19 @@ struct usb_serial_driver {
 #define to_usb_serial_driver(d) \
 	container_of(d, struct usb_serial_driver, driver)
 
-extern int usb_serial_register_drivers(struct usb_serial_driver *const serial_drivers[],
+int usb_serial_register_drivers(struct usb_serial_driver *const serial_drivers[],
 		const char *name, const struct usb_device_id *id_table);
-extern void usb_serial_deregister_drivers(struct usb_serial_driver *const serial_drivers[]);
-extern void usb_serial_port_softint(struct usb_serial_port *port);
+void usb_serial_deregister_drivers(struct usb_serial_driver *const serial_drivers[]);
+void usb_serial_port_softint(struct usb_serial_port *port);
 
-extern int usb_serial_suspend(struct usb_interface *intf, pm_message_t message);
-extern int usb_serial_resume(struct usb_interface *intf);
+int usb_serial_suspend(struct usb_interface *intf, pm_message_t message);
+int usb_serial_resume(struct usb_interface *intf);
 
 /* USB Serial console functions */
 #ifdef CONFIG_USB_SERIAL_CONSOLE
-extern void usb_serial_console_init(int minor);
-extern void usb_serial_console_exit(void);
-extern void usb_serial_console_disconnect(struct usb_serial *serial);
+void usb_serial_console_init(int minor);
+void usb_serial_console_exit(void);
+void usb_serial_console_disconnect(struct usb_serial *serial);
 #else
 static inline void usb_serial_console_init(int minor) { }
 static inline void usb_serial_console_exit(void) { }
@@ -335,40 +335,32 @@ static inline void usb_serial_console_disconnect(struct usb_serial *serial) {}
 #endif
 
 /* Functions needed by other parts of the usbserial core */
-extern struct usb_serial_port *usb_serial_port_get_by_minor(unsigned int minor);
-extern void usb_serial_put(struct usb_serial *serial);
-extern int usb_serial_generic_open(struct tty_struct *tty,
-	struct usb_serial_port *port);
-extern int usb_serial_generic_write_start(struct usb_serial_port *port,
-							gfp_t mem_flags);
-extern int usb_serial_generic_write(struct tty_struct *tty,
-	struct usb_serial_port *port, const unsigned char *buf, int count);
-extern void usb_serial_generic_close(struct usb_serial_port *port);
-extern int usb_serial_generic_resume(struct usb_serial *serial);
-extern int usb_serial_generic_write_room(struct tty_struct *tty);
-extern int usb_serial_generic_chars_in_buffer(struct tty_struct *tty);
-extern void usb_serial_generic_wait_until_sent(struct tty_struct *tty,
-								long timeout);
-extern void usb_serial_generic_read_bulk_callback(struct urb *urb);
-extern void usb_serial_generic_write_bulk_callback(struct urb *urb);
-extern void usb_serial_generic_throttle(struct tty_struct *tty);
-extern void usb_serial_generic_unthrottle(struct tty_struct *tty);
-extern int usb_serial_generic_tiocmiwait(struct tty_struct *tty,
-							unsigned long arg);
-extern int usb_serial_generic_get_icount(struct tty_struct *tty,
-					struct serial_icounter_struct *icount);
-extern int usb_serial_generic_register(void);
-extern void usb_serial_generic_deregister(void);
-extern int usb_serial_generic_submit_read_urbs(struct usb_serial_port *port,
-						 gfp_t mem_flags);
-extern void usb_serial_generic_process_read_urb(struct urb *urb);
-extern int usb_serial_generic_prepare_write_buffer(struct usb_serial_port *port,
-						void *dest, size_t size);
+struct usb_serial_port *usb_serial_port_get_by_minor(unsigned int minor);
+void usb_serial_put(struct usb_serial *serial);
+int usb_serial_generic_open(struct tty_struct *tty, struct usb_serial_port *port);
+int usb_serial_generic_write_start(struct usb_serial_port *port, gfp_t mem_flags);
+int usb_serial_generic_write(struct tty_struct *tty, struct usb_serial_port *port,
+		const unsigned char *buf, int count);
+void usb_serial_generic_close(struct usb_serial_port *port);
+int usb_serial_generic_resume(struct usb_serial *serial);
+int usb_serial_generic_write_room(struct tty_struct *tty);
+int usb_serial_generic_chars_in_buffer(struct tty_struct *tty);
+void usb_serial_generic_wait_until_sent(struct tty_struct *tty, long timeout);
+void usb_serial_generic_read_bulk_callback(struct urb *urb);
+void usb_serial_generic_write_bulk_callback(struct urb *urb);
+void usb_serial_generic_throttle(struct tty_struct *tty);
+void usb_serial_generic_unthrottle(struct tty_struct *tty);
+int usb_serial_generic_tiocmiwait(struct tty_struct *tty, unsigned long arg);
+int usb_serial_generic_get_icount(struct tty_struct *tty, struct serial_icounter_struct *icount);
+int usb_serial_generic_register(void);
+void usb_serial_generic_deregister(void);
+int usb_serial_generic_submit_read_urbs(struct usb_serial_port *port, gfp_t mem_flags);
+void usb_serial_generic_process_read_urb(struct urb *urb);
+int usb_serial_generic_prepare_write_buffer(struct usb_serial_port *port, void *dest, size_t size);
 
 #if defined(CONFIG_USB_SERIAL_CONSOLE) && defined(CONFIG_MAGIC_SYSRQ)
-extern int usb_serial_handle_sysrq_char(struct usb_serial_port *port,
-					unsigned int ch);
-extern int usb_serial_handle_break(struct usb_serial_port *port);
+int usb_serial_handle_sysrq_char(struct usb_serial_port *port, unsigned int ch);
+int usb_serial_handle_break(struct usb_serial_port *port);
 #else
 static inline int usb_serial_handle_sysrq_char(struct usb_serial_port *port, unsigned int ch)
 {
@@ -380,13 +372,12 @@ static inline int usb_serial_handle_break(struct usb_serial_port *port)
 }
 #endif
 
-extern void usb_serial_handle_dcd_change(struct usb_serial_port *usb_port,
-					 struct tty_struct *tty,
-					 unsigned int status);
+void usb_serial_handle_dcd_change(struct usb_serial_port *usb_port,
+		struct tty_struct *tty, unsigned int status);
 
 
-extern int usb_serial_bus_register(struct usb_serial_driver *device);
-extern void usb_serial_bus_deregister(struct usb_serial_driver *device);
+int usb_serial_bus_register(struct usb_serial_driver *device);
+void usb_serial_bus_deregister(struct usb_serial_driver *device);
 
 extern struct bus_type usb_serial_bus_type;
 extern struct tty_driver *usb_serial_tty_driver;
-- 
2.26.2

