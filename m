Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 42FAD2C966E
	for <lists+linux-usb@lfdr.de>; Tue,  1 Dec 2020 05:24:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728241AbgLAEXZ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 30 Nov 2020 23:23:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727973AbgLAEXY (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 30 Nov 2020 23:23:24 -0500
Received: from mail-pl1-x649.google.com (mail-pl1-x649.google.com [IPv6:2607:f8b0:4864:20::649])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82399C0613D3
        for <linux-usb@vger.kernel.org>; Mon, 30 Nov 2020 20:22:44 -0800 (PST)
Received: by mail-pl1-x649.google.com with SMTP id f3so491315plb.11
        for <linux-usb@vger.kernel.org>; Mon, 30 Nov 2020 20:22:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:in-reply-to:message-id:mime-version:references:subject
         :from:to:cc;
        bh=+S6WLRShGGihUykEp6F/TgpvlDwlW9co/pvE2ZfqxPk=;
        b=cKar4ywhMR58pQho8kIo4YaeR4KHa7Y81RRJLz7sbmZURNCjko63R3RZyS39uw3t/K
         Zx1hX9k3TtedvNlzfTYMQibox/AZOl1wVNn0svHWgRbZuyN6MmfTsL267PLTZ2HqValh
         z96nc/S1za8177rGE6V4UkTCJlNgij1fdZ9BubHiV3mzWlrpS7g6FLgxUHLKTZ/gA11q
         xFfYEfXkP64ARkgDca4mVMjTymH8vrR8iBWfqXOdtWPScliisBvhun+eWbTkSO95irV/
         +bIAI1Ozveh0XsqogDaSeJJ0rmg5TBjq3V7iVk6ZsnDb92UGSvlqPoAfno/lJAtEDn06
         q3Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=+S6WLRShGGihUykEp6F/TgpvlDwlW9co/pvE2ZfqxPk=;
        b=BokyJnuJGzyGnnCx8rL8tfa8zdvCXD58ay14aWLFfSjbQyQzUQNRsWz4N2VeOQRRon
         3FOmgnuPoOX3wfD9BwXzC8XaJOVja2vwZGDQhUm2epsHFm/8C1nFza5fsTjbl8Hx6JGJ
         JQytck5uz2imvEeE2WUhz3QXx9vOoRW+0UymZwLv1HdEOhWetqhJmTshHWvVCf4cTbQr
         XidtVxxCbJ6k4HSOdZxXa59oMhKG1X91WoTlcByzI3edS2mu4EOGonM2C9cWPyqzb2i8
         21RNpnkjAbeia6ZPJ3fHNKkYYdNmFZ5qmK10lBJ5dgR8UzNy0kyUNCH/sUHVZIfNjxqh
         nupA==
X-Gm-Message-State: AOAM533m0Sa8a0AOd3QDLm2x22HdXL+FCcpGGkdzUWws+aODvOOLDusr
        Jl486Xl44i2Vf6magjjppPdwXojyTbE=
X-Google-Smtp-Source: ABdhPJycUimJ5oQ45SUJnUX+dPS6O5B38tRwI+TJXvAzAzIinHumw9QuIQ2BIc2lF5QDMP1fYwTBHy4UJNs=
Sender: "badhri via sendgmr" <badhri@badhri.mtv.corp.google.com>
X-Received: from badhri.mtv.corp.google.com ([2620:15c:211:201:f292:1cff:fee0:66cf])
 (user=badhri job=sendgmr) by 2002:a63:4956:: with SMTP id y22mr703965pgk.266.1606796563954;
 Mon, 30 Nov 2020 20:22:43 -0800 (PST)
Date:   Mon, 30 Nov 2020 20:22:35 -0800
In-Reply-To: <20201201042237.414235-1-badhri@google.com>
Message-Id: <20201201042237.414235-2-badhri@google.com>
Mime-Version: 1.0
References: <20201201042237.414235-1-badhri@google.com>
X-Mailer: git-send-email 2.29.2.454.gaff20da3a2-goog
Subject: [PATCH v1 2/4] usb: typec: fusb302: Update retry count based on the
 negotiated rev
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

By default the driver sets the retry count to 3 (Default for PD 2.0).
Update this to 2, if the negotiated rev is PD 3.0.

Signed-off-by: Badhri Jagan Sridharan <badhri@google.com>
---
 drivers/usb/typec/tcpm/fusb302.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/typec/tcpm/fusb302.c b/drivers/usb/typec/tcpm/fusb302.c
index 99562cc65ca6..ebc46b9f776c 100644
--- a/drivers/usb/typec/tcpm/fusb302.c
+++ b/drivers/usb/typec/tcpm/fusb302.c
@@ -343,12 +343,11 @@ static int fusb302_sw_reset(struct fusb302_chip *chip)
 	return ret;
 }
 
-static int fusb302_enable_tx_auto_retries(struct fusb302_chip *chip)
+static int fusb302_enable_tx_auto_retries(struct fusb302_chip *chip, u8 retry_count)
 {
 	int ret = 0;
 
-	ret = fusb302_i2c_set_bits(chip, FUSB_REG_CONTROL3,
-				   FUSB_REG_CONTROL3_N_RETRIES_3 |
+	ret = fusb302_i2c_set_bits(chip, FUSB_REG_CONTROL3, retry_count |
 				   FUSB_REG_CONTROL3_AUTO_RETRY);
 
 	return ret;
@@ -399,7 +398,7 @@ static int tcpm_init(struct tcpc_dev *dev)
 	ret = fusb302_sw_reset(chip);
 	if (ret < 0)
 		return ret;
-	ret = fusb302_enable_tx_auto_retries(chip);
+	ret = fusb302_enable_tx_auto_retries(chip, FUSB_REG_CONTROL3_N_RETRIES_3);
 	if (ret < 0)
 		return ret;
 	ret = fusb302_init_interrupt(chip);
@@ -1017,7 +1016,7 @@ static const char * const transmit_type_name[] = {
 };
 
 static int tcpm_pd_transmit(struct tcpc_dev *dev, enum tcpm_transmit_type type,
-			    const struct pd_message *msg)
+			    const struct pd_message *msg, unsigned int negotiated_rev)
 {
 	struct fusb302_chip *chip = container_of(dev, struct fusb302_chip,
 						 tcpc_dev);
@@ -1026,6 +1025,13 @@ static int tcpm_pd_transmit(struct tcpc_dev *dev, enum tcpm_transmit_type type,
 	mutex_lock(&chip->lock);
 	switch (type) {
 	case TCPC_TX_SOP:
+		/* nRetryCount 3 in P2.0 spec, whereas 2 in PD3.0 spec */
+		ret = fusb302_enable_tx_auto_retries(chip, negotiated_rev > PD_REV20 ?
+						     FUSB_REG_CONTROL3_N_RETRIES_2 :
+						     FUSB_REG_CONTROL3_N_RETRIES_3);
+		if (ret < 0)
+			fusb302_log(chip, "Cannot update retry count ret=%d", ret);
+
 		ret = fusb302_pd_send_message(chip, msg);
 		if (ret < 0)
 			fusb302_log(chip,
-- 
2.29.2.454.gaff20da3a2-goog

