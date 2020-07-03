Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D4470213ED1
	for <lists+linux-usb@lfdr.de>; Fri,  3 Jul 2020 19:45:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727050AbgGCRnB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 3 Jul 2020 13:43:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727045AbgGCRm7 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 3 Jul 2020 13:42:59 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B928C08C5E0
        for <linux-usb@vger.kernel.org>; Fri,  3 Jul 2020 10:42:59 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id j4so31133838wrp.10
        for <linux-usb@vger.kernel.org>; Fri, 03 Jul 2020 10:42:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=VAH0h+7DeZ3eQjU7VALJC/mf2qMz8anOgwTIw8YZObw=;
        b=PqlMQ+89zMViNPk7JL5130tgUlbfPGYO64AK9MX0N4n06iS4TcAGsDGRMlCqj/pLc4
         J7LXAhiaUeGsjyG6alIrflqs8cE9EUzRJxrzjIgV4Yn8DOhedEbVURZIu8RG6k3K0+k1
         vDuR7IPN3O/ymZb5dVv1YzrGrTJwsbIF/ioCS5GI0RU1XrxXvWedyGPmAP4IhR/CuSjo
         itAnCnYz27iOwJdYedBW9z+9UFp06jyHOZAY5e9JzO2IDH2ldJlKr6OPo2600mUwNwY+
         +4RWwtan+5aC8XkRvuarA9Nrm5tJYS29s4fJWjGzdwrw6u2kCnRtykuQ1yQzyQOYA+Is
         hRlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VAH0h+7DeZ3eQjU7VALJC/mf2qMz8anOgwTIw8YZObw=;
        b=r2VgChHMuwnQJgYIEPJGkApMxSFFzknJy5i/gFpmLNhWscWM6hYxoj5CHCAAijitnG
         dkgu2wkLth0j0axTAWk5/kRbeIjMC44TjL5ePapoWG+q3LbN/hWlmh8JNBq52nHef7EK
         w1SgNybHzkyu9CGhYRDIRulznZDhfagcWcBdO5Y9Y9kFohirIiUe8DHHC4AlGx2hcr1E
         Ql5Yiu8tp1+T05LTCtYchVxyCod2ImwBcQNQ7UYkQt6yx31l/eTwLAgqgxIHIRWbk46c
         tiVT3i3rnbQfC/qtaEMRJupc0N+KjPkYFvK3hCNv9Mq36aso4CCzVXz8+qeXR+np1riq
         UywA==
X-Gm-Message-State: AOAM533sBax9ZUQwht3fCs8txpogG3eOYccES3AZO+sz8+N4fGBinFrf
        DED50NQb/VKFX+Tgr1q7HVXf3A==
X-Google-Smtp-Source: ABdhPJwvENXbvIfsvJuGeCkbqKnfV/8/YK5NLdOwN0orSzzJI2mmMqY6taVoPjgC6b3Rw9Xggnm+pA==
X-Received: by 2002:a5d:6748:: with SMTP id l8mr42092231wrw.347.1593798178228;
        Fri, 03 Jul 2020 10:42:58 -0700 (PDT)
Received: from localhost.localdomain ([2.27.35.144])
        by smtp.gmail.com with ESMTPSA id x11sm13625799wmc.26.2020.07.03.10.42.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2020 10:42:57 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Lee Jones <lee.jones@linaro.org>,
        Johan Hovold <johan@kernel.org>,
        Michael Hund <mhund@ld-didactic.de>,
        David Glance <advidgsf@sourceforge.net>,
        Juergen Stuber <starblue@users.sourceforge.net>
Subject: [PATCH 27/30] usb: misc: ldusb: Demote obvious misuse of kerneldoc to standard comment blocks
Date:   Fri,  3 Jul 2020 18:41:45 +0100
Message-Id: <20200703174148.2749969-28-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200703174148.2749969-1-lee.jones@linaro.org>
References: <20200703174148.2749969-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

No attempt has been made to document any of the demoted functions here.

Fixes the following W=1 kernel build warning(s):

 drivers/usb/misc/ldusb.c:192: warning: Function parameter or member 'dev' not described in 'ld_usb_abort_transfers'
 drivers/usb/misc/ldusb.c:206: warning: Function parameter or member 'dev' not described in 'ld_usb_delete'
 drivers/usb/misc/ldusb.c:220: warning: Function parameter or member 'urb' not described in 'ld_usb_interrupt_in_callback'
 drivers/usb/misc/ldusb.c:281: warning: Function parameter or member 'urb' not described in 'ld_usb_interrupt_out_callback'
 drivers/usb/misc/ldusb.c:301: warning: Function parameter or member 'inode' not described in 'ld_usb_open'
 drivers/usb/misc/ldusb.c:301: warning: Function parameter or member 'file' not described in 'ld_usb_open'
 drivers/usb/misc/ldusb.c:372: warning: Function parameter or member 'inode' not described in 'ld_usb_release'
 drivers/usb/misc/ldusb.c:372: warning: Function parameter or member 'file' not described in 'ld_usb_release'
 drivers/usb/misc/ldusb.c:414: warning: Function parameter or member 'file' not described in 'ld_usb_poll'
 drivers/usb/misc/ldusb.c:414: warning: Function parameter or member 'wait' not described in 'ld_usb_poll'
 drivers/usb/misc/ldusb.c:439: warning: Function parameter or member 'file' not described in 'ld_usb_read'
 drivers/usb/misc/ldusb.c:439: warning: Function parameter or member 'buffer' not described in 'ld_usb_read'
 drivers/usb/misc/ldusb.c:439: warning: Function parameter or member 'count' not described in 'ld_usb_read'
 drivers/usb/misc/ldusb.c:439: warning: Function parameter or member 'ppos' not described in 'ld_usb_read'
 drivers/usb/misc/ldusb.c:526: warning: Function parameter or member 'file' not described in 'ld_usb_write'
 drivers/usb/misc/ldusb.c:526: warning: Function parameter or member 'buffer' not described in 'ld_usb_write'
 drivers/usb/misc/ldusb.c:526: warning: Function parameter or member 'count' not described in 'ld_usb_write'
 drivers/usb/misc/ldusb.c:526: warning: Function parameter or member 'ppos' not described in 'ld_usb_write'
 drivers/usb/misc/ldusb.c:651: warning: Function parameter or member 'intf' not described in 'ld_usb_probe'
 drivers/usb/misc/ldusb.c:651: warning: Function parameter or member 'id' not described in 'ld_usb_probe'
 drivers/usb/misc/ldusb.c:754: warning: Function parameter or member 'intf' not described in 'ld_usb_disconnect'

Cc: Johan Hovold <johan@kernel.org>
Cc: Michael Hund <mhund@ld-didactic.de>
Cc: David Glance <advidgsf@sourceforge.net>
Cc: Juergen Stuber <starblue@users.sourceforge.net>
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/usb/misc/ldusb.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/usb/misc/ldusb.c b/drivers/usb/misc/ldusb.c
index 8f86b4ebca898..670e4d91e9cae 100644
--- a/drivers/usb/misc/ldusb.c
+++ b/drivers/usb/misc/ldusb.c
@@ -1,5 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0+
-/**
+/*
  * Generic USB driver for report based interrupt in/out devices
  * like LD Didactic's USB devices. LD Didactic's USB devices are
  * HID devices which do not use HID report definitons (they use
@@ -184,7 +184,7 @@ struct ld_usb {
 
 static struct usb_driver ld_usb_driver;
 
-/**
+/*
  *	ld_usb_abort_transfers
  *      aborts transfers and frees associated data structures
  */
@@ -199,7 +199,7 @@ static void ld_usb_abort_transfers(struct ld_usb *dev)
 		usb_kill_urb(dev->interrupt_out_urb);
 }
 
-/**
+/*
  *	ld_usb_delete
  */
 static void ld_usb_delete(struct ld_usb *dev)
@@ -213,7 +213,7 @@ static void ld_usb_delete(struct ld_usb *dev)
 	kfree(dev);
 }
 
-/**
+/*
  *	ld_usb_interrupt_in_callback
  */
 static void ld_usb_interrupt_in_callback(struct urb *urb)
@@ -274,7 +274,7 @@ static void ld_usb_interrupt_in_callback(struct urb *urb)
 	wake_up_interruptible(&dev->read_wait);
 }
 
-/**
+/*
  *	ld_usb_interrupt_out_callback
  */
 static void ld_usb_interrupt_out_callback(struct urb *urb)
@@ -294,7 +294,7 @@ static void ld_usb_interrupt_out_callback(struct urb *urb)
 	wake_up_interruptible(&dev->write_wait);
 }
 
-/**
+/*
  *	ld_usb_open
  */
 static int ld_usb_open(struct inode *inode, struct file *file)
@@ -365,7 +365,7 @@ static int ld_usb_open(struct inode *inode, struct file *file)
 	return retval;
 }
 
-/**
+/*
  *	ld_usb_release
  */
 static int ld_usb_release(struct inode *inode, struct file *file)
@@ -407,7 +407,7 @@ static int ld_usb_release(struct inode *inode, struct file *file)
 	return retval;
 }
 
-/**
+/*
  *	ld_usb_poll
  */
 static __poll_t ld_usb_poll(struct file *file, poll_table *wait)
@@ -431,7 +431,7 @@ static __poll_t ld_usb_poll(struct file *file, poll_table *wait)
 	return mask;
 }
 
-/**
+/*
  *	ld_usb_read
  */
 static ssize_t ld_usb_read(struct file *file, char __user *buffer, size_t count,
@@ -518,7 +518,7 @@ static ssize_t ld_usb_read(struct file *file, char __user *buffer, size_t count,
 	return retval;
 }
 
-/**
+/*
  *	ld_usb_write
  */
 static ssize_t ld_usb_write(struct file *file, const char __user *buffer,
@@ -641,7 +641,7 @@ static struct usb_class_driver ld_usb_class = {
 	.minor_base =	USB_LD_MINOR_BASE,
 };
 
-/**
+/*
  *	ld_usb_probe
  *
  *	Called by the usb core when a new device is connected that it thinks
@@ -745,7 +745,7 @@ static int ld_usb_probe(struct usb_interface *intf, const struct usb_device_id *
 	return retval;
 }
 
-/**
+/*
  *	ld_usb_disconnect
  *
  *	Called by the usb core when the device is removed from the system.
-- 
2.25.1

