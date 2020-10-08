Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 70078286E84
	for <lists+linux-usb@lfdr.de>; Thu,  8 Oct 2020 08:16:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728579AbgJHGQl (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 8 Oct 2020 02:16:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36812 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728761AbgJHGQ0 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 8 Oct 2020 02:16:26 -0400
Received: from mail-pl1-x649.google.com (mail-pl1-x649.google.com [IPv6:2607:f8b0:4864:20::649])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7263C061755
        for <linux-usb@vger.kernel.org>; Wed,  7 Oct 2020 23:16:25 -0700 (PDT)
Received: by mail-pl1-x649.google.com with SMTP id bb2so2836344plb.8
        for <linux-usb@vger.kernel.org>; Wed, 07 Oct 2020 23:16:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:in-reply-to:message-id:mime-version:references:subject
         :from:to:cc;
        bh=U+7VAuX+6NzBlNSRK3/qbo0mKYXrvm3847FJpD+uNy8=;
        b=dQCwYaSwe7s2rwAuCm8wl5BjFAMR41J9778DmKbkwQ2duUvQ+nZFy7s7uVfmewQT7c
         M3ypo/V4MyLSbrbsN3rgnwDY91G4T/gnVf7uG5kJ1y2uGl1NP+1Dm599LSGXA+EDDYfA
         76n6csYDJGD6zAhuURrvnitoOtwAGJ1Lw43ahlxi7e/Nm5mtXaMT5Iv+aiomhltQIoaV
         PUJ/EaFdy5N6wrXqKPdcd2YrKTCEQRswzPNZDHvFm400bvJU2sARuf3bS4IJncsSYuh3
         xaGdmpy1a6TerpnrAwGuwP2+0e642AKdZCcLn9ptxR6nenakUhlatfWMuvJ8UB8gwbP8
         oFNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=U+7VAuX+6NzBlNSRK3/qbo0mKYXrvm3847FJpD+uNy8=;
        b=tOV0X57QyNaQylHzZpVZchFq14ig+GDnsI2fDBujODYgMsPplCUYrEwSHc58Q6gQYN
         dJZqLfHx5CG+7aG1hk869mnJ0G4pkwZLHqrR9gBBzKNMwxxISTZ5bbhFIYu09tjlektL
         5vqPjJeSzCwzSfYhHie6PMM2xi/moSlrUuELp3X0OYIgBAP3M6RWmHcdTJ4rq9wvIBA2
         +3bmffiSaz2NOLCfSyJ2q4Hji6Uidvv62IBf1Xp2Wl5jfpmGiEL7jRRUxKqeKBagBm+o
         KiHDF9QUT0dtA6AfyDmYyqB6vFd9icIXkGEk2R6QL7NyN5E8SMd1CtvP/GMqzzlL6Zl6
         PrnA==
X-Gm-Message-State: AOAM530e+z7NoG3jV2MUT0wUGPhurNkhwJm825qMr3eLYwW6fV4itVPo
        2qoXBYm10b3go+AAvq+c3ABP+bQWnhM=
X-Google-Smtp-Source: ABdhPJzb15aIk6jg4abLXX9Q3hsayACHVYwt5r9kKE5YZXk9QEOn+tEMf6kmkIUcGC4HEvb88zNom85vr+g=
Sender: "badhri via sendgmr" <badhri@badhri.mtv.corp.google.com>
X-Received: from badhri.mtv.corp.google.com ([2620:15c:211:1:f292:1cff:fee0:66cf])
 (user=badhri job=sendgmr) by 2002:aa7:9592:0:b029:13e:d13d:a054 with SMTP id
 z18-20020aa795920000b029013ed13da054mr6175887pfj.26.1602137785394; Wed, 07
 Oct 2020 23:16:25 -0700 (PDT)
Date:   Wed,  7 Oct 2020 23:15:52 -0700
In-Reply-To: <20201008061556.1402293-1-badhri@google.com>
Message-Id: <20201008061556.1402293-12-badhri@google.com>
Mime-Version: 1.0
References: <20201008061556.1402293-1-badhri@google.com>
X-Mailer: git-send-email 2.28.0.806.g8561365e88-goog
Subject: [PATCH v10 11/15] usb: typec: tcpci_max77759: Fix vbus stuck on upon
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
        Badhri Jagan Sridharan <badhri@google.com>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, Amelie Delaunay <amelie.delaunay@st.com>
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
---
v9 is the first version of this patch. Added to fix
occasional bug of vbus turning back on when disconnecting the FRS accessory
after disconnect. No changes since v9.
---
 drivers/usb/typec/tcpm/tcpci_maxim.c | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/usb/typec/tcpm/tcpci_maxim.c b/drivers/usb/typec/tcpm/tcpci_maxim.c
index 723d7dd38f75..43dcad95e897 100644
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
2.28.0.806.g8561365e88-goog

