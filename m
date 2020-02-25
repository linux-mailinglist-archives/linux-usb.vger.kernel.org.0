Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3829A16BE98
	for <lists+linux-usb@lfdr.de>; Tue, 25 Feb 2020 11:25:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730225AbgBYKZC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 25 Feb 2020 05:25:02 -0500
Received: from mail-lf1-f67.google.com ([209.85.167.67]:38736 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730139AbgBYKZB (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 25 Feb 2020 05:25:01 -0500
Received: by mail-lf1-f67.google.com with SMTP id r14so9349864lfm.5
        for <linux-usb@vger.kernel.org>; Tue, 25 Feb 2020 02:25:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Nqc1T3tLFwl6/n8IE17fY+ZfysXPyqEYknzDgr5/DKI=;
        b=lPO1GsrtsLh3VdoNo73XAS6uCWxXNfpftVZunkxFrGHxPOHBAPcMlrC2bY/PQkKBPd
         w13da2u5jmlRl+sSkHTovAzbLnjKSsKSZAChwI8bs75LfEU89HbxNA3kDdCz19usOar6
         GO9nGjriinqh0zexqbHw9diLwzDRqVZGC545eRxx3aev4GyPImFs8AzBsQANe/HaoV0J
         KYf72YVbVPGOFSLIFAenB7kOg6j6hmmeeil6ZFzQmTRT3iiPWa3BHljst+/dUcIzJ+st
         U7I5euram77Oc/12mnw4eoGX1JDdUa03CgXA6NfsOgBrC4F9EI2/28AvRm/pNup9xR1H
         A/QA==
X-Gm-Message-State: APjAAAXnFH6U75b/FI0HjgbwEyAjy+tINbInzlraSAMiu1qE11SmtUJB
        hJmA3tHwvlWzG2UuU7gP6Fc=
X-Google-Smtp-Source: APXvYqyTIkagtsxpBxf3CUyPPvUYhCGkpg+kdsjpyJdPEuQLRTZTFeHhfgo+lcHOrLddH1e0kQLTyQ==
X-Received: by 2002:ac2:5ca5:: with SMTP id e5mr9379981lfq.122.1582626299399;
        Tue, 25 Feb 2020 02:24:59 -0800 (PST)
Received: from xi.terra (c-12aae455.07-184-6d6c6d4.bbcust.telenor.se. [85.228.170.18])
        by smtp.gmail.com with ESMTPSA id y18sm7432546ljm.93.2020.02.25.02.24.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2020 02:24:58 -0800 (PST)
Received: from johan by xi.terra with local (Exim 4.92.3)
        (envelope-from <johan@xi.terra>)
        id 1j6XOY-0004ok-MI; Tue, 25 Feb 2020 11:24:54 +0100
From:   Johan Hovold <johan@kernel.org>
To:     Johan Hovold <johan@kernel.org>
Cc:     linux-usb@vger.kernel.org
Subject: [PATCH 1/2] USB: serial: clean up carrier-detect helper
Date:   Tue, 25 Feb 2020 11:24:20 +0100
Message-Id: <20200225102421.18262-2-johan@kernel.org>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200225102421.18262-1-johan@kernel.org>
References: <20200225102421.18262-1-johan@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Drop the struct tty_port pointer and rename the struct usb_serial_port
pointer "port", which is the named used throughout the subsystem and
incidentally also matches the kernel-doc comment.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/usb/serial/generic.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/serial/generic.c b/drivers/usb/serial/generic.c
index 546a1c2ce2f2..5cdf180cda23 100644
--- a/drivers/usb/serial/generic.c
+++ b/drivers/usb/serial/generic.c
@@ -609,12 +609,10 @@ EXPORT_SYMBOL_GPL(usb_serial_handle_break);
  * @tty: tty for the port
  * @status: new carrier detect status, nonzero if active
  */
-void usb_serial_handle_dcd_change(struct usb_serial_port *usb_port,
+void usb_serial_handle_dcd_change(struct usb_serial_port *port,
 				struct tty_struct *tty, unsigned int status)
 {
-	struct tty_port *port = &usb_port->port;
-
-	dev_dbg(&usb_port->dev, "%s - status %d\n", __func__, status);
+	dev_dbg(&port->dev, "%s - status %d\n", __func__, status);
 
 	if (tty) {
 		struct tty_ldisc *ld = tty_ldisc_ref(tty);
@@ -627,7 +625,7 @@ void usb_serial_handle_dcd_change(struct usb_serial_port *usb_port,
 	}
 
 	if (status)
-		wake_up_interruptible(&port->open_wait);
+		wake_up_interruptible(&port->port.open_wait);
 	else if (tty && !C_CLOCAL(tty))
 		tty_hangup(tty);
 }
-- 
2.24.1

