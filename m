Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C010A212699
	for <lists+linux-usb@lfdr.de>; Thu,  2 Jul 2020 16:46:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729924AbgGBOqe (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 2 Jul 2020 10:46:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728179AbgGBOqb (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 2 Jul 2020 10:46:31 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58CD1C08C5C1
        for <linux-usb@vger.kernel.org>; Thu,  2 Jul 2020 07:46:31 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id s10so28743645wrw.12
        for <linux-usb@vger.kernel.org>; Thu, 02 Jul 2020 07:46:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=RiTsEZKmlrzourRVHCJd/NwIY5VqtrX1m5y/ulB1wRo=;
        b=yjw82WJumj6TMXLOmN6bgq7tVJe2v9ktMtN5LLLzLsyFajiTkccyVGCqhIIoIgn9nk
         W4z1Pdizwukxe0IgqzppErqYZo4B4OtFCVjVHQAhZxhhobGjo/AIsXha180UVL5qRthe
         EjEV4rXnDAVI5ybO4mgNTPAlJJAUuBxtsddJJ3jOReOByTqhha7Q3uXXRZcIkGUrSeKp
         KZENFOfSgKjU1I+6zmtgpRt7qZzFAhJhvm1WToZq3yEP9zul/OZHLtD5kEAp0c9UxejV
         oYtECedB2DTkEotpndOoPU6k+9mkozdv/NYbyn6yjk5Od3IehJWQ3BSbfIpuVa6YKMRV
         66NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=RiTsEZKmlrzourRVHCJd/NwIY5VqtrX1m5y/ulB1wRo=;
        b=bC2ucKx1SL2j6QcRVArxF9RmKI3A0v2mK0crKaeyeWkORUCPyyuEpeWnie65Q/Bpnv
         XAHnqNbaunfq4/I4qE5PDXEvavbHTvAgZVg6tvWEwDYbeW68WwE2eONbm4vWZb3m0k/X
         7xQOZJUOXDOftAymuoIDxqNGbK1bMzINyFqXkrqBEf0e/6hbbhblenCZ3fAHk3xiDYsZ
         ULR9a86LU09PV+l7xKOSVTqULeUsKIH0CBGwu282V9nPKp2iYUx+iq/Tj4bU48lmdM2Y
         SK63WZQQAWmIdsQmY9TTgcUPmIihfa/i58CUJ/RPDhxSfC81TLE6obAqXLBYP/gLQ1Hh
         1KNA==
X-Gm-Message-State: AOAM532PtCzOZXeOBfmaiibcSvNGVPdvq/5VmeD3jYeEcIJqDp40/swU
        nMGb4JyOGiC4gEcEIrN6NcYijQ==
X-Google-Smtp-Source: ABdhPJyu1qYT+zYhfBDupaUqz6hH9CufCcR9P1VbeJq9vW8PPkJ7AzfYwDapsXNKbDEY85XbGnvUZw==
X-Received: by 2002:adf:f445:: with SMTP id f5mr32586837wrp.339.1593701189928;
        Thu, 02 Jul 2020 07:46:29 -0700 (PDT)
Received: from localhost.localdomain ([2.27.35.144])
        by smtp.gmail.com with ESMTPSA id g14sm7002737wrw.83.2020.07.02.07.46.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2020 07:46:29 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     gregkh@linuxfoundation.org
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, Lee Jones <lee.jones@linaro.org>,
        Felipe Balbi <balbi@kernel.org>
Subject: [PATCH 01/30] usb: phy: phy: Fix-up a whole bunch of formatting issues
Date:   Thu,  2 Jul 2020 15:45:56 +0100
Message-Id: <20200702144625.2533530-2-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200702144625.2533530-1-lee.jones@linaro.org>
References: <20200702144625.2533530-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Kerneldoc expects arg descriptions to be in the format '@.*: '.  If either
the '@' or the ':' is omitted then kerneldoc complains that the description
is missing.  Add the missing ':'s here.

Also provide a new description for 'event'.

Fixes the following kernel build W=1 warnings:

 drivers/usb/phy/phy.c:106: warning: Function parameter or member 'work' not described in 'usb_phy_notify_charger_work'
 drivers/usb/phy/phy.c:172: warning: Function parameter or member 'nb' not described in 'usb_phy_get_charger_type'
 drivers/usb/phy/phy.c:172: warning: Function parameter or member 'state' not described in 'usb_phy_get_charger_type'
 drivers/usb/phy/phy.c:172: warning: Function parameter or member 'data' not described in 'usb_phy_get_charger_type'
 drivers/usb/phy/phy.c:194: warning: Function parameter or member 'usb_phy' not described in 'usb_phy_set_charger_current'
 drivers/usb/phy/phy.c:194: warning: Function parameter or member 'mA' not described in 'usb_phy_set_charger_current'
 drivers/usb/phy/phy.c:244: warning: Function parameter or member 'usb_phy' not described in 'usb_phy_get_charger_current'
 drivers/usb/phy/phy.c:244: warning: Function parameter or member 'min' not described in 'usb_phy_get_charger_current'
 drivers/usb/phy/phy.c:244: warning: Function parameter or member 'max' not described in 'usb_phy_get_charger_current'
 drivers/usb/phy/phy.c:281: warning: Function parameter or member 'usb_phy' not described in 'usb_phy_set_charger_state'
 drivers/usb/phy/phy.c:281: warning: Function parameter or member 'state' not described in 'usb_phy_set_charger_state'
 drivers/usb/phy/phy.c:427: warning: Function parameter or member 'dev' not described in 'devm_usb_get_phy'
 drivers/usb/phy/phy.c:427: warning: Function parameter or member 'type' not described in 'devm_usb_get_phy'
 drivers/usb/phy/phy.c:456: warning: Function parameter or member 'type' not described in 'usb_get_phy'
 drivers/usb/phy/phy.c:500: warning: Function parameter or member 'dev' not described in 'devm_usb_get_phy_by_node'
 drivers/usb/phy/phy.c:500: warning: Function parameter or member 'node' not described in 'devm_usb_get_phy_by_node'
 drivers/usb/phy/phy.c:500: warning: Function parameter or member 'nb' not described in 'devm_usb_get_phy_by_node'
 drivers/usb/phy/phy.c:558: warning: Function parameter or member 'dev' not described in 'devm_usb_get_phy_by_phandle'
 drivers/usb/phy/phy.c:558: warning: Function parameter or member 'phandle' not described in 'devm_usb_get_phy_by_phandle'
 drivers/usb/phy/phy.c:558: warning: Function parameter or member 'index' not described in 'devm_usb_get_phy_by_phandle'
 drivers/usb/phy/phy.c:590: warning: Function parameter or member 'dev' not described in 'devm_usb_put_phy'
 drivers/usb/phy/phy.c:590: warning: Function parameter or member 'phy' not described in 'devm_usb_put_phy'
 drivers/usb/phy/phy.c:627: warning: Function parameter or member 'type' not described in 'usb_add_phy'
 drivers/usb/phy/phy.c:721: warning: Function parameter or member 'event' not described in 'usb_phy_set_event'

Cc: Felipe Balbi <balbi@kernel.org>
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/usb/phy/phy.c | 49 ++++++++++++++++++++++---------------------
 1 file changed, 25 insertions(+), 24 deletions(-)

diff --git a/drivers/usb/phy/phy.c b/drivers/usb/phy/phy.c
index ad25546308897..b47285f023cf7 100644
--- a/drivers/usb/phy/phy.c
+++ b/drivers/usb/phy/phy.c
@@ -88,7 +88,7 @@ static void usb_phy_set_default_current(struct usb_phy *usb_phy)
 
 /**
  * usb_phy_notify_charger_work - notify the USB charger state
- * @work - the charger work to notify the USB charger state
+ * @work: the charger work to notify the USB charger state
  *
  * This work can be issued when USB charger state has been changed or
  * USB charger current has been changed, then we can notify the current
@@ -160,9 +160,9 @@ static void __usb_phy_get_charger_type(struct usb_phy *usb_phy)
 
 /**
  * usb_phy_get_charger_type - get charger type from extcon subsystem
- * @nb -the notifier block to determine charger type
- * @state - the cable state
- * @data - private data
+ * @nb: the notifier block to determine charger type
+ * @state: the cable state
+ * @data: private data
  *
  * Determin the charger type from extcon subsystem which also means the
  * charger state has been chaned, then we should notify this event.
@@ -178,8 +178,8 @@ static int usb_phy_get_charger_type(struct notifier_block *nb,
 
 /**
  * usb_phy_set_charger_current - set the USB charger current
- * @usb_phy - the USB phy to be used
- * @mA - the current need to be set
+ * @usb_phy: the USB phy to be used
+ * @mA: the current need to be set
  *
  * Usually we only change the charger default current when USB finished the
  * enumeration as one SDP charger. As one SDP charger, usb_phy_set_power()
@@ -231,9 +231,9 @@ EXPORT_SYMBOL_GPL(usb_phy_set_charger_current);
 
 /**
  * usb_phy_get_charger_current - get the USB charger current
- * @usb_phy - the USB phy to be used
- * @min - the minimum current
- * @max - the maximum current
+ * @usb_phy: the USB phy to be used
+ * @min: the minimum current
+ * @max: the maximum current
  *
  * Usually we will notify the maximum current to power user, but for some
  * special case, power user also need the minimum current value. Then the
@@ -269,8 +269,8 @@ EXPORT_SYMBOL_GPL(usb_phy_get_charger_current);
 
 /**
  * usb_phy_set_charger_state - set the USB charger state
- * @usb_phy - the USB phy to be used
- * @state - the new state need to be set for charger
+ * @usb_phy: the USB phy to be used
+ * @state: the new state need to be set for charger
  *
  * The usb phy driver can issue this function when the usb phy driver
  * detected the charger state has been changed, in this case the charger
@@ -414,8 +414,8 @@ static int usb_add_extcon(struct usb_phy *x)
 
 /**
  * devm_usb_get_phy - find the USB PHY
- * @dev - device that requests this phy
- * @type - the type of the phy the controller requires
+ * @dev: device that requests this phy
+ * @type: the type of the phy the controller requires
  *
  * Gets the phy using usb_get_phy(), and associates a device with it using
  * devres. On driver detach, release function is invoked on the devres data,
@@ -444,7 +444,7 @@ EXPORT_SYMBOL_GPL(devm_usb_get_phy);
 
 /**
  * usb_get_phy - find the USB PHY
- * @type - the type of the phy the controller requires
+ * @type: the type of the phy the controller requires
  *
  * Returns the phy driver, after getting a refcount to it; or
  * -ENODEV if there is no such phy.  The caller is responsible for
@@ -480,9 +480,9 @@ EXPORT_SYMBOL_GPL(usb_get_phy);
 
 /**
  * devm_usb_get_phy_by_node - find the USB PHY by device_node
- * @dev - device that requests this phy
- * @node - the device_node for the phy device.
- * @nb - a notifier_block to register with the phy.
+ * @dev: device that requests this phy
+ * @node: the device_node for the phy device.
+ * @nb: a notifier_block to register with the phy.
  *
  * Returns the phy driver associated with the given device_node,
  * after getting a refcount to it, -ENODEV if there is no such phy or
@@ -540,9 +540,9 @@ EXPORT_SYMBOL_GPL(devm_usb_get_phy_by_node);
 
 /**
  * devm_usb_get_phy_by_phandle - find the USB PHY by phandle
- * @dev - device that requests this phy
- * @phandle - name of the property holding the phy phandle value
- * @index - the index of the phy
+ * @dev: device that requests this phy
+ * @phandle: name of the property holding the phy phandle value
+ * @index: the index of the phy
  *
  * Returns the phy driver associated with the given phandle value,
  * after getting a refcount to it, -ENODEV if there is no such phy or
@@ -578,8 +578,8 @@ EXPORT_SYMBOL_GPL(devm_usb_get_phy_by_phandle);
 
 /**
  * devm_usb_put_phy - release the USB PHY
- * @dev - device that wants to release this phy
- * @phy - the phy returned by devm_usb_get_phy()
+ * @dev: device that wants to release this phy
+ * @phy: the phy returned by devm_usb_get_phy()
  *
  * destroys the devres associated with this phy and invokes usb_put_phy
  * to release the phy.
@@ -615,9 +615,9 @@ void usb_put_phy(struct usb_phy *x)
 EXPORT_SYMBOL_GPL(usb_put_phy);
 
 /**
- * usb_add_phy - declare the USB PHY
+ * usb_add_phy: declare the USB PHY
  * @x: the USB phy to be used; or NULL
- * @type - the type of this PHY
+ * @type: the type of this PHY
  *
  * This call is exclusively for use by phy drivers, which
  * coordinate the activities of drivers for host and peripheral
@@ -714,6 +714,7 @@ EXPORT_SYMBOL_GPL(usb_remove_phy);
 /**
  * usb_phy_set_event - set event to phy event
  * @x: the phy returned by usb_get_phy();
+ * @event: event to set
  *
  * This sets event to phy event
  */
-- 
2.25.1

