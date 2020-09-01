Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C6D72585F5
	for <lists+linux-usb@lfdr.de>; Tue,  1 Sep 2020 05:01:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727989AbgIADA6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 31 Aug 2020 23:00:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726858AbgIAC7h (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 31 Aug 2020 22:59:37 -0400
Received: from mail-qk1-x749.google.com (mail-qk1-x749.google.com [IPv6:2607:f8b0:4864:20::749])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A668C061379
        for <linux-usb@vger.kernel.org>; Mon, 31 Aug 2020 19:59:37 -0700 (PDT)
Received: by mail-qk1-x749.google.com with SMTP id c67so7644057qkd.0
        for <linux-usb@vger.kernel.org>; Mon, 31 Aug 2020 19:59:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:in-reply-to:message-id:mime-version:references:subject
         :from:to:cc;
        bh=YMdKxgp/ypLtEnd4viDdyZTg0ysmMpLgXStTpt9Ak68=;
        b=JEYnWOYQ3h6zljGhK0HJKcDxcPo4mEIiSjSRZNzxkdndwwuaJWXp0mcXUZDFSQ6in3
         frbp3hEASK2UN01GoP9NvJZdHJeeLBg4c8gjn3dkBfLyTpQhohGDBz4+Ej1SdM4eHzcE
         EDyy+rPstNyttgyHHfjMtEm4g7/mPxZk6QTDWGP6bXFgG/TrW1gSBj/8DhB8ntSHFXEq
         BguM1U5Y2BtHM+PkqzsJ3LxhOw+VxTbRzW66NiwLwFJ5nwWr+L5kY1ywGwGKVNzAoCXP
         1/0a8e1fwQFrHdEgzD2RoeNqXOlGUT2MmkUYQykuUD0jEsZbMEg7R/1lBM+jwPlOQRSp
         FNxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=YMdKxgp/ypLtEnd4viDdyZTg0ysmMpLgXStTpt9Ak68=;
        b=MFxpQTf9+easYF+B1TWgXl5iwyFRzZckv6QHJBE/wTFTJ7buCEDRYUooOMS8leXwVE
         HHPQ5naBuMbPQhpFSVeRKR/pt/SrApW8bNg1Rs7wkVDmKIeFnTPSKdv+SKyJi8Oz9OsG
         dymd3Gj27qRCtCo3e0reHeWRhKzsvKpgfrb7XBUmUGUalo4KulW2YkJNN1+OyhRkO3UK
         7ZiEvuuSpIY0xdJ73enHigiPKNyC8jRha7TVR4T64cSYlLFKZuR9wjKuairFGdlT8yoF
         YxyGJ8JhyBE/irEA8dmKRq3P5MfESCNjO7aGiN75CgG8MtQwedCkm1usm7H10Y9SXzsw
         nSEg==
X-Gm-Message-State: AOAM5338EQZ5vrc1TuclssVqxH6M9+K/sERJsIgQ1Bwk9aRUywksY6UU
        g0JLXJi5TpbwH1p7KQf4RoHCQWogXVY=
X-Google-Smtp-Source: ABdhPJypibf5wBpNvtYlxpfMzNAO8uqcLQhPEl8G0KxcPk07KYikGDG1tp3uzefzyH5FK1wHheOuuOejCM0=
X-Received: from badhri.mtv.corp.google.com ([2620:15c:211:1:f292:1cff:fee0:66cf])
 (user=badhri job=sendgmr) by 2002:a05:6214:2a:: with SMTP id
 b10mr313595qvr.0.1598929176432; Mon, 31 Aug 2020 19:59:36 -0700 (PDT)
Date:   Mon, 31 Aug 2020 19:59:16 -0700
In-Reply-To: <20200901025927.3596190-1-badhri@google.com>
Message-Id: <20200901025927.3596190-4-badhri@google.com>
Mime-Version: 1.0
References: <20200901025927.3596190-1-badhri@google.com>
X-Mailer: git-send-email 2.28.0.402.g5ffc5be6b7-goog
Subject: [PATCH v6 03/14] usb: typec: tcpci: update ROLE_CONTROL for DRP
From:   Badhri Jagan Sridharan <badhri@google.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Badhri Jagan Sridharan <badhri@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

ROLE_CONTROL register would not have the actual CC terminations
unless the port does not set ROLE_CONTROL.DRP. For DRP ports,
CC_STATUS.cc1/cc2 indicates the final terminations applied
when TCPC enters potential_connect_as_source/_sink.
For DRP ports, infer port role from CC_STATUS and set corresponding
CC terminations before setting the orientation.

Signed-off-by: Badhri Jagan Sridharan <badhri@google.com>
---
Changes since v1:
 - Changing patch version to v6 to fix version number confusion.
---
 drivers/usb/typec/tcpm/tcpci.c | 37 +++++++++++++++++++++++++++++++++-
 1 file changed, 36 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/typec/tcpm/tcpci.c b/drivers/usb/typec/tcpm/tcpci.c
index 7d36d5e2d3f7..7d9491ba62fb 100644
--- a/drivers/usb/typec/tcpm/tcpci.c
+++ b/drivers/usb/typec/tcpm/tcpci.c
@@ -191,12 +191,47 @@ static int tcpci_set_polarity(struct tcpc_dev *tcpc,
 	struct tcpci *tcpci = tcpc_to_tcpci(tcpc);
 	unsigned int reg;
 	int ret;
+	enum typec_cc_status cc1, cc2;
 
-	/* Keep the disconnect cc line open */
+	/* Obtain Rp setting from role control */
 	ret = regmap_read(tcpci->regmap, TCPC_ROLE_CTRL, &reg);
 	if (ret < 0)
 		return ret;
 
+	ret = tcpci_get_cc(tcpc, &cc1, &cc2);
+	if (ret < 0)
+		return ret;
+
+	/*
+	 * When port has drp toggling enabled, ROLE_CONTROL would only have the initial
+	 * terminations for the toggling and does not indicate the final cc
+	 * terminations when ConnectionResult is 0 i.e. drp toggling stops and
+	 * the connection is resolbed. Infer port role from TCPC_CC_STATUS based on the
+	 * terminations seen. The port role is then used to set the cc terminations.
+	 */
+	if (reg & TCPC_ROLE_CTRL_DRP) {
+		/* Disable DRP for the OPEN setting to take effect */
+		reg = reg & ~TCPC_ROLE_CTRL_DRP;
+
+		if (polarity == TYPEC_POLARITY_CC2) {
+			reg &= ~(TCPC_ROLE_CTRL_CC2_MASK << TCPC_ROLE_CTRL_CC2_SHIFT);
+			/* Local port is source */
+			if (cc2 == TYPEC_CC_RD)
+				/* Role control would have the Rp setting when DRP was enabled */
+				reg |= TCPC_ROLE_CTRL_CC_RP << TCPC_ROLE_CTRL_CC2_SHIFT;
+			else
+				reg |= TCPC_ROLE_CTRL_CC_RD << TCPC_ROLE_CTRL_CC2_SHIFT;
+		} else {
+			reg &= ~(TCPC_ROLE_CTRL_CC1_MASK << TCPC_ROLE_CTRL_CC1_SHIFT);
+			/* Local port is source */
+			if (cc1 == TYPEC_CC_RD)
+				/* Role control would have the Rp setting when DRP was enabled */
+				reg |= TCPC_ROLE_CTRL_CC_RP << TCPC_ROLE_CTRL_CC1_SHIFT;
+			else
+				reg |= TCPC_ROLE_CTRL_CC_RD << TCPC_ROLE_CTRL_CC1_SHIFT;
+		}
+	}
+
 	if (polarity == TYPEC_POLARITY_CC2)
 		reg |= TCPC_ROLE_CTRL_CC_OPEN << TCPC_ROLE_CTRL_CC1_SHIFT;
 	else
-- 
2.28.0.402.g5ffc5be6b7-goog

