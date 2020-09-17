Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9368926D8D1
	for <lists+linux-usb@lfdr.de>; Thu, 17 Sep 2020 12:22:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726659AbgIQKWl (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 17 Sep 2020 06:22:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726640AbgIQKTx (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 17 Sep 2020 06:19:53 -0400
Received: from mail-pf1-x44a.google.com (mail-pf1-x44a.google.com [IPv6:2607:f8b0:4864:20::44a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2DA62C06121C
        for <linux-usb@vger.kernel.org>; Thu, 17 Sep 2020 03:19:17 -0700 (PDT)
Received: by mail-pf1-x44a.google.com with SMTP id o21so1091530pfd.14
        for <linux-usb@vger.kernel.org>; Thu, 17 Sep 2020 03:19:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:in-reply-to:message-id:mime-version:references:subject
         :from:to:cc;
        bh=rCORbbdZXpLr1jRW5bHtDoOyOswjXYpwM2DgJbJUV30=;
        b=SgmGKmY0AFdXXW5YDFIFzA4MbZBFNkye7rP3zlYviy7ENJbOY2WgZPUTSAD/3JBeac
         JVhlUCAU62s4BUETZuvADtF5c2A2yD2EN8YD7b8IyMFQjqa2f1/kDTQc85FoOjz/Njx8
         iUcYhZkbqJiWUyqPCwFRrsxS6jCKG/LG8RpxQa+FsJkVNCbBAWv5aATafKIk+BAHvAtC
         GB0nBf3a0zZew6sn/l09+mBuRBvdsFaduolzyE8oPRXYuC1pvPqknN9h4TVmCA8d4csx
         6cg0qGa62BNGh/vsSHidWg+INwC+ZETkLiWFLS0xcdW6XzxCx+QZMhAx3SBBWXtlm34d
         RfAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=rCORbbdZXpLr1jRW5bHtDoOyOswjXYpwM2DgJbJUV30=;
        b=jkSO5xa67Cla3++4qL6HUng4VbpD//qGxgxlEYhkY4w658DQHpI0TI1yLBHLGwMn+y
         FGiLFEexe0to8FoBtsH9Z4GeEeJiOIhgtAyw2LswCyiST9rsCXB2xXlLGtgwsSXi/tQq
         J29asBRMQNeHobXcxooCI8C/jjMsU/O+at9sE/njBVDYDTNqB0yxdmP0VjZhliUelhtP
         ZPkwLljedQtFDG4hZvJttTq+ZOgB350p5BTy8MaWD+q7BZPb5DZffI+lpPBoDDFV8JaQ
         JePy/4Vx4k29+yrt0i6EW98Apbzm7YvoVRXkUZ7RYkBlpITH6DEW1vxCBq6qRGVhckRg
         tGtg==
X-Gm-Message-State: AOAM530U3bkonTHgUaPZBpxOT8y7oSlaT3v09j7HI+tuxO0EUbLW6mEQ
        25SEGAv4O9CgeDzH3WQAAaAWp6pAwUY=
X-Google-Smtp-Source: ABdhPJytm5HIUjwimE5zxuFROIFy5AoAa5tq9pXltY2pKBPXfYXYXP/6qKusaxyCtR28QAbPocfqiMVA4NY=
X-Received: from badhri.mtv.corp.google.com ([2620:15c:211:1:f292:1cff:fee0:66cf])
 (user=badhri job=sendgmr) by 2002:a17:90a:ead8:: with SMTP id
 ev24mr7933994pjb.89.1600337956665; Thu, 17 Sep 2020 03:19:16 -0700 (PDT)
Date:   Thu, 17 Sep 2020 03:18:53 -0700
In-Reply-To: <20200917101856.3156869-1-badhri@google.com>
Message-Id: <20200917101856.3156869-8-badhri@google.com>
Mime-Version: 1.0
References: <20200917101856.3156869-1-badhri@google.com>
X-Mailer: git-send-email 2.28.0.618.gf4bc123cb7-goog
Subject: [PATCH v7 08/11] usb: typec: tcpci_maxim: Add support for Sink FRS
From:   Badhri Jagan Sridharan <badhri@google.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Badhri Jagan Sridharan <badhri@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Upon receiving ALERT_EXTENDED.TCPC_SINK_FAST_ROLE_SWAP signal
tcpm to start Sink fast role swap signal.

Inform when TCPM is sourcing vbus.

Signed-off-by: Badhri Jagan Sridharan <badhri@google.com>
Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
Changes since v1:
- Changing patch version to v6 to fix version number confusion.

Changes since v6:
- rebase on usb-next
- Added Reviewed-by: Heikki
---
 drivers/usb/typec/tcpm/tcpci_maxim.c | 50 +++++++++++++++++++++++++---
 1 file changed, 46 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/typec/tcpm/tcpci_maxim.c b/drivers/usb/typec/tcpm/tcpci_maxim.c
index 91337ddb4962..723d7dd38f75 100644
--- a/drivers/usb/typec/tcpm/tcpci_maxim.c
+++ b/drivers/usb/typec/tcpm/tcpci_maxim.c
@@ -106,13 +106,22 @@ static void max_tcpci_init_regs(struct max_tcpci_chip *chip)
 		return;
 	}
 
+	ret = max_tcpci_write8(chip, TCPC_ALERT_EXTENDED, 0xff);
+	if (ret < 0) {
+		dev_err(chip->dev, "Unable to clear TCPC_ALERT_EXTENDED ret:%d\n", ret);
+		return;
+	}
+
 	alert_mask = TCPC_ALERT_TX_SUCCESS | TCPC_ALERT_TX_DISCARDED | TCPC_ALERT_TX_FAILED |
 		TCPC_ALERT_RX_HARD_RST | TCPC_ALERT_RX_STATUS | TCPC_ALERT_CC_STATUS |
-		TCPC_ALERT_VBUS_DISCNCT | TCPC_ALERT_RX_BUF_OVF | TCPC_ALERT_POWER_STATUS;
+		TCPC_ALERT_VBUS_DISCNCT | TCPC_ALERT_RX_BUF_OVF | TCPC_ALERT_POWER_STATUS |
+		/* Enable Extended alert for detecting Fast Role Swap Signal */
+		TCPC_ALERT_EXTND;
 
 	ret = max_tcpci_write16(chip, TCPC_ALERT_MASK, alert_mask);
 	if (ret < 0) {
-		dev_err(chip->dev, "Error writing to TCPC_ALERT_MASK ret:%d\n", ret);
+		dev_err(chip->dev,
+			"Error enabling TCPC_ALERT: TCPC_ALERT_MASK write failed ret:%d\n", ret);
 		return;
 	}
 
@@ -122,6 +131,10 @@ static void max_tcpci_init_regs(struct max_tcpci_chip *chip)
 		dev_err(chip->dev, "Error writing to TCPC_POWER_CTRL ret:%d\n", ret);
 		return;
 	}
+
+	ret = max_tcpci_write8(chip, TCPC_ALERT_EXTENDED_MASK, TCPC_SINK_FAST_ROLE_SWAP);
+	if (ret < 0)
+		return;
 }
 
 static void process_rx(struct max_tcpci_chip *chip, u16 status)
@@ -225,10 +238,23 @@ static void process_power_status(struct max_tcpci_chip *chip)
 	if (ret < 0)
 		return;
 
-	if (pwr_status == 0xff)
+	if (pwr_status == 0xff) {
 		max_tcpci_init_regs(chip);
-	else
+	} else if (pwr_status & TCPC_POWER_STATUS_SOURCING_VBUS) {
+		tcpm_sourcing_vbus(chip->port);
+		/*
+		 * Alawys re-enable boost here.
+		 * In normal case, when say an headset is attached, TCPM would
+		 * have instructed to TCPC to enable boost, so the call is a
+		 * no-op.
+		 * But for Fast Role Swap case, Boost turns on autonomously without
+		 * AP intervention, but, needs AP to enable source mode explicitly
+		 * for AP to regain control.
+		 */
+		max_tcpci_set_vbus(chip->tcpci, &chip->data, true, false);
+	} else {
 		tcpm_vbus_change(chip->port);
+	}
 }
 
 static void process_tx(struct max_tcpci_chip *chip, u16 status)
@@ -249,6 +275,7 @@ static irqreturn_t _max_tcpci_irq(struct max_tcpci_chip *chip, u16 status)
 {
 	u16 mask;
 	int ret;
+	u8 reg_status;
 
 	/*
 	 * Clear alert status for everything except RX_STATUS, which shouldn't
@@ -274,6 +301,21 @@ static irqreturn_t _max_tcpci_irq(struct max_tcpci_chip *chip, u16 status)
 		}
 	}
 
+	if (status & TCPC_ALERT_EXTND) {
+		ret = max_tcpci_read8(chip, TCPC_ALERT_EXTENDED, &reg_status);
+		if (ret < 0)
+			return ret;
+
+		ret = max_tcpci_write8(chip, TCPC_ALERT_EXTENDED, reg_status);
+		if (ret < 0)
+			return ret;
+
+		if (reg_status & TCPC_SINK_FAST_ROLE_SWAP) {
+			dev_info(chip->dev, "FRS Signal");
+			tcpm_sink_frs(chip->port);
+		}
+	}
+
 	if (status & TCPC_ALERT_RX_STATUS)
 		process_rx(chip, status);
 
-- 
2.28.0.618.gf4bc123cb7-goog

