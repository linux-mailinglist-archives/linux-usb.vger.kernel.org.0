Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A506D2126C4
	for <lists+linux-usb@lfdr.de>; Thu,  2 Jul 2020 16:49:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730161AbgGBOrf (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 2 Jul 2020 10:47:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730096AbgGBOrH (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 2 Jul 2020 10:47:07 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 249E1C08C5DD
        for <linux-usb@vger.kernel.org>; Thu,  2 Jul 2020 07:47:07 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id j4so26347520wrp.10
        for <linux-usb@vger.kernel.org>; Thu, 02 Jul 2020 07:47:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=iWzVZz/7UdELZYlP3FhiTP4gcXKvtcBfoc9CQcE8FIc=;
        b=fmzINiOYDHpN5/coulur/6WfMZq1rarCvkcLJwqIc1Y/vuMXSWLwF+MLPBxRgaKlQK
         4Ji78wYEgQDaVwbW+4aRXxTfZHJm77A0AyZrWNa8iwJEB939IQCZ3ynS6uLTOiB1a9I2
         4IxSgs+zF3yxBmJD+DssJh5yua5pBPdkwPunbhnQf1J3GyvfXFXkW96zLVRS7zZMabR8
         ez3irtf10ueuJ+NkEVZeYLDkvDyEzRDUV9dqwNeV0UJKx0GjdO/0nuaBTDtHbguY/KLw
         w9sj5TX+PniKeuvfQirEYAfhKEOWP1kIfpkYj8uGLXc46IX1tnBfuHJbgybJsR6P9RS+
         yfeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=iWzVZz/7UdELZYlP3FhiTP4gcXKvtcBfoc9CQcE8FIc=;
        b=N5K7pnYJfIZWG/Q0R1QS0AFehiDCjGsoRkysjAyi/eP+OddHSFG4QbkFI78z6t4HGd
         zy0jF3864juM8vWcPEUXQO3oD6/hmh69nTWGAv2cDcVMAqETw0fX/hNN0thl3BDomBmi
         UOgQ9QYab1Yh9ZOrcMXeMiryaCpUJSD0wYTvVF61a4PIsRkJAZIUbBQUGcDHxaQI67rx
         E9IO08t29Wli3Ft9TqpXltu+m60u1uHVxb7cTkbgaYzDiugFlU0s9o1tW10jujkFLRWC
         Kfe3cv8djZHs7e3t2ips+RCfKlDDUcNWUwp8aQrIDW2ENavVsSgq9F4IGpNKvH3CXQDx
         jpyw==
X-Gm-Message-State: AOAM532uzeyTO//dGsD4fwQeZmeH8kyvlmzKyxaWY5J/LWY1J8eZpD/r
        fv2lDicYOl9OWZeJmwNTJ4ZyTg==
X-Google-Smtp-Source: ABdhPJyebZwL479ANazYAPU87dJ7Xv2lt4Tl/LxXMiJfnCK83vmeGTFhFdEYRoQEiRdz8686JpwKIw==
X-Received: by 2002:a5d:4984:: with SMTP id r4mr31222396wrq.215.1593701225820;
        Thu, 02 Jul 2020 07:47:05 -0700 (PDT)
Received: from localhost.localdomain ([2.27.35.144])
        by smtp.gmail.com with ESMTPSA id g14sm7002737wrw.83.2020.07.02.07.47.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2020 07:47:05 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     gregkh@linuxfoundation.org
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, Lee Jones <lee.jones@linaro.org>,
        Peter Korsgaard <jacmet@sunsite.dk>,
        Oliver Neukum <oneukum@suse.com>
Subject: [PATCH 28/30] usb: c67x00: c67x00-hcd: Demote obvious misuse of kerneldoc to standard comment blocks
Date:   Thu,  2 Jul 2020 15:46:23 +0100
Message-Id: <20200702144625.2533530-29-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200702144625.2533530-1-lee.jones@linaro.org>
References: <20200702144625.2533530-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

No attempt has been made to document any of the functions here.

Fixes the following W=1 kernel build warning(s):

 drivers/usb/c67x00/c67x00-hcd.c:237: warning: Function parameter or member 'sie' not described in 'c67x00_hcd_irq'
 drivers/usb/c67x00/c67x00-hcd.c:237: warning: Function parameter or member 'int_status' not described in 'c67x00_hcd_irq'
 drivers/usb/c67x00/c67x00-hcd.c:237: warning: Function parameter or member 'msg' not described in 'c67x00_hcd_irq'
 drivers/usb/c67x00/c67x00-hcd.c:267: warning: Function parameter or member 'hcd' not described in 'c67x00_hcd_start'
 drivers/usb/c67x00/c67x00-hcd.c:279: warning: Function parameter or member 'hcd' not described in 'c67x00_hcd_stop'

Cc: Peter Korsgaard <jacmet@sunsite.dk>
Cc: Oliver Neukum <oneukum@suse.com>
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/usb/c67x00/c67x00-hcd.c | 6 +++---
 drivers/usb/class/cdc-wdm.c     | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/c67x00/c67x00-hcd.c b/drivers/usb/c67x00/c67x00-hcd.c
index c39eee17c0e46..39f2376663314 100644
--- a/drivers/usb/c67x00/c67x00-hcd.c
+++ b/drivers/usb/c67x00/c67x00-hcd.c
@@ -228,7 +228,7 @@ static int c67x00_hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue,
  * Main part of host controller driver
  */
 
-/**
+/*
  * c67x00_hcd_irq
  *
  * This function is called from the interrupt handler in c67x00-drv.c
@@ -260,7 +260,7 @@ static void c67x00_hcd_irq(struct c67x00_sie *sie, u16 int_status, u16 msg)
 	}
 }
 
-/**
+/*
  * c67x00_hcd_start: Host controller start hook
  */
 static int c67x00_hcd_start(struct usb_hcd *hcd)
@@ -272,7 +272,7 @@ static int c67x00_hcd_start(struct usb_hcd *hcd)
 	return 0;
 }
 
-/**
+/*
  * c67x00_hcd_stop: Host controller stop hook
  */
 static void c67x00_hcd_stop(struct usb_hcd *hcd)
diff --git a/drivers/usb/class/cdc-wdm.c b/drivers/usb/class/cdc-wdm.c
index 4dceaeca46e73..7f5de956a2fc8 100644
--- a/drivers/usb/class/cdc-wdm.c
+++ b/drivers/usb/class/cdc-wdm.c
@@ -941,7 +941,7 @@ static int wdm_probe(struct usb_interface *intf, const struct usb_device_id *id)
  * @ep: interrupt endpoint to monitor for notifications
  * @bufsize: maximum message size to support for read/write
  * @manage_power: call-back invoked during open and release to
- *                manage the device's power 
+ *                manage the device's power
  * Create WDM usb class character device and associate it with intf
  * without binding, allowing another driver to manage the interface.
  *
-- 
2.25.1

