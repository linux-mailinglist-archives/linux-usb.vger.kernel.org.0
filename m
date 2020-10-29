Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A9FDF29E467
	for <lists+linux-usb@lfdr.de>; Thu, 29 Oct 2020 08:40:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727365AbgJ2HYs (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 29 Oct 2020 03:24:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726848AbgJ2HYf (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 29 Oct 2020 03:24:35 -0400
Received: from mail-qt1-x849.google.com (mail-qt1-x849.google.com [IPv6:2607:f8b0:4864:20::849])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F80EC05BD29
        for <linux-usb@vger.kernel.org>; Wed, 28 Oct 2020 23:31:57 -0700 (PDT)
Received: by mail-qt1-x849.google.com with SMTP id o15so1286498qtp.13
        for <linux-usb@vger.kernel.org>; Wed, 28 Oct 2020 23:31:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:in-reply-to:message-id:mime-version:references:subject
         :from:to:cc;
        bh=I/v9N3bMdj51VutJMwBNr1qmret0DWH4rmxDXCw3fio=;
        b=p3B+Qdvk/iuZoDnunNJNvLqVTXjweBimdZTHAqixxTOR5vA/6/yd/ypsd/ugzfVRGJ
         8beOhDO2Pc+SQIxo9Bo+COMWKaVDMTNgBfGkzPFcxG1jyf7g5e1BEBCeT2HlUErkA7H6
         XABt5Y1lYw2PuzdFQwf1i9C1Noc6NtVf/+xctS/Ki3ytuLv7W+U6huGWG8SQakQ+OW+P
         kdysmHrpX6QraIds7fgOuQT4YmSwJVJckqtpgcsBZO9EMFKjr8VhBz52xzDQ9rC6X917
         Gnv7L3OMQuQIFFa9IMOceJX/jZL1AMbzcmmcHOeBf8BuF+axAxJzw68WtvY0a076Ms9D
         5RRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=I/v9N3bMdj51VutJMwBNr1qmret0DWH4rmxDXCw3fio=;
        b=UpgVWwgB5TpyAFf+/pbS5MRJnQ4Q3vE4Xh8a9cNtgABPHI57gOZjOCJ47VTZpNX1BC
         DzFgOUGCeFIMLzuQovrvmtLju2n9p31fPGy8tKENj3+zXDV554aJQmt32HNwWEamaRaN
         kjrQ7bXLj7yLZ7afUy0gZcwaQ/q0rc/ZbCVtpEdlEa7g+SLv0MFxu8Sih8urbYRohfg+
         jSlyf/eSF6GLFVqelDURr8we5EjXqYr0iLvvhMwNrcsKNTTjWfWMyvUqZai6dKuFGggP
         smVCXMY2Tj819kDDMc7L9ge8zQRnyiRu1uRdRYDbBUbQZ5hyLQUxzu//aSUsUFzAfO9O
         voZQ==
X-Gm-Message-State: AOAM5302SkI8Gc4GF4RNOvPoVIS+tvbCdwLheKV9DaIUVD4EZQFpD7TI
        sT7XW+3qfad4Y0iEYHmLph50fYRsoWI=
X-Google-Smtp-Source: ABdhPJzpnvNIpEiuemOmR7neqGUjcKMslsbSpH6tW0YOe5A3bwrblogyMnHFM6RvhxeJ2S7E5C37um3f2N4=
Sender: "badhri via sendgmr" <badhri@badhri.mtv.corp.google.com>
X-Received: from badhri.mtv.corp.google.com ([2620:15c:211:201:f292:1cff:fee0:66cf])
 (user=badhri job=sendgmr) by 2002:ad4:45ed:: with SMTP id q13mr2536925qvu.55.1603953116548;
 Wed, 28 Oct 2020 23:31:56 -0700 (PDT)
Date:   Wed, 28 Oct 2020 23:31:34 -0700
In-Reply-To: <20201029063138.1429760-1-badhri@google.com>
Message-Id: <20201029063138.1429760-7-badhri@google.com>
Mime-Version: 1.0
References: <20201029063138.1429760-1-badhri@google.com>
X-Mailer: git-send-email 2.29.1.341.ge80a0c044ae-goog
Subject: [PATCH v12 06/10] usb: typec: tcpci_maxim: Fix vbus stuck on upon
 diconnecting sink
From:   Badhri Jagan Sridharan <badhri@google.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Thierry Reding <treding@nvidia.com>,
        Prashant Malani <pmalani@chromium.org>,
        Badhri Jagan Sridharan <badhri@google.com>,
        Dan Carpenter <dan.carpenter@oracle.com>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Occasionally, POWER_STATUS.sourcing_vbus takes a while to clear after
writing to  MAX_BUCK_BOOST_OP register. This causes vbus to turn back
on while disconnecting the sink. Overcome this issue by writing into
MAX_BUCK_BOOST_OP during frs while sourcing vbu, instead of always
into the register whenever POWER_STATUS.sourcing_vbus is set.

Signed-off-by: Badhri Jagan Sridharan <badhri@google.com>
Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
v9 is the first version of this patch. Added to fix
occasional bug of vbus turning back on when disconnecting the FRS accessory
after disconnect. No changes since v9.

Changes since v10:
Added Reviewed-by: Heikki Krogerus

Changes since v11:
none
---
 drivers/usb/typec/tcpm/tcpci_maxim.c | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/usb/typec/tcpm/tcpci_maxim.c b/drivers/usb/typec/tcpm/tcpci_maxim.c
index a5014c3b51d5..dd6171604362 100644
--- a/drivers/usb/typec/tcpm/tcpci_maxim.c
+++ b/drivers/usb/typec/tcpm/tcpci_maxim.c
@@ -238,23 +238,22 @@ static void process_power_status(struct max_tcpci_chip *chip)
 	if (ret < 0)
 		return;
 
-	if (pwr_status == 0xff) {
+	if (pwr_status == 0xff)
 		max_tcpci_init_regs(chip);
-	} else if (pwr_status & TCPC_POWER_STATUS_SOURCING_VBUS) {
+	else if (pwr_status & TCPC_POWER_STATUS_SOURCING_VBUS)
 		tcpm_sourcing_vbus(chip->port);
-		/*
-		 * Alawys re-enable boost here.
-		 * In normal case, when say an headset is attached, TCPM would
-		 * have instructed to TCPC to enable boost, so the call is a
-		 * no-op.
-		 * But for Fast Role Swap case, Boost turns on autonomously without
-		 * AP intervention, but, needs AP to enable source mode explicitly
-		 * for AP to regain control.
-		 */
-		max_tcpci_set_vbus(chip->tcpci, &chip->data, true, false);
-	} else {
+	else
 		tcpm_vbus_change(chip->port);
-	}
+}
+
+static void max_tcpci_frs_sourcing_vbus(struct tcpci *tcpci, struct tcpci_data *tdata)
+{
+	/*
+	 * For Fast Role Swap case, Boost turns on autonomously without
+	 * AP intervention, but, needs AP to enable source mode explicitly
+	 * for AP to regain control.
+	 */
+	max_tcpci_set_vbus(tcpci, tdata, true, false);
 }
 
 static void process_tx(struct max_tcpci_chip *chip, u16 status)
@@ -441,6 +440,7 @@ static int max_tcpci_probe(struct i2c_client *client, const struct i2c_device_id
 	chip->data.start_drp_toggling = max_tcpci_start_toggling;
 	chip->data.TX_BUF_BYTE_x_hidden = true;
 	chip->data.init = tcpci_init;
+	chip->data.frs_sourcing_vbus = max_tcpci_frs_sourcing_vbus;
 
 	max_tcpci_init_regs(chip);
 	chip->tcpci = tcpci_register_port(chip->dev, &chip->data);
-- 
2.29.1.341.ge80a0c044ae-goog

