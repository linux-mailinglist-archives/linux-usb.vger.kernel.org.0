Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 103C125106E
	for <lists+linux-usb@lfdr.de>; Tue, 25 Aug 2020 06:22:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728520AbgHYEWf (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 25 Aug 2020 00:22:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728483AbgHYEWe (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 25 Aug 2020 00:22:34 -0400
Received: from mail-pj1-x1049.google.com (mail-pj1-x1049.google.com [IPv6:2607:f8b0:4864:20::1049])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 654F2C061574
        for <linux-usb@vger.kernel.org>; Mon, 24 Aug 2020 21:22:34 -0700 (PDT)
Received: by mail-pj1-x1049.google.com with SMTP id t13so924463pjd.0
        for <linux-usb@vger.kernel.org>; Mon, 24 Aug 2020 21:22:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:in-reply-to:message-id:mime-version:references:subject
         :from:to:cc;
        bh=F8R7yB/uW413X5BedlVvfs1XP30S/Fpzu0dI0Wqxoxc=;
        b=n72OI6MoEkQhfKUwJdHzWFQo0b8hAvkNDSD1jmWoyZQ0V8OJBU2zf9TYkIjQYpXtCo
         dUStaSep5gflMaYcmcL10S6XR/DnqRv7amQsr9GxaBe2MnDAxILEhPQWW3VG5ABPS2vh
         gDTLW7GGp0hfHW1TCkZJkfAAwPALmBk/VDLkGb6JSOt8XzTD1AjuqshMjX8wseVt5E8S
         RY6f27PWDyrpbj01THKYTfJ5h+K5UhMQJSGDLhuErTYtZvRFeFQGkDh7vmu1PbxIrVWT
         SBPc9z1H4Ln+WHTzwN1F8WXvd1I+1D7wnSbQtdxyTo2Gbffbf9SRmBA2yLbXStxxNNxR
         C0yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=F8R7yB/uW413X5BedlVvfs1XP30S/Fpzu0dI0Wqxoxc=;
        b=mmHY8U/qv22uZV8LlP0qbhhyoNWoG2rQ7PDnVspff7i0ngne7/oB5H3sdiGMKZEQmU
         baLkp0oHL3iwrxnbuttjeGB0sD3jsk/heMSrnfri0pLYhBdPpE6tBX/ey5/I7uTjLlQB
         WahUg2zY+Tf53j08bhoc3gwD2OOOAt/6W3j+b33TvtQ2Hwv8ACLBIXq3Jxk6fd3AJoyV
         daTcbOThRlfAkVu1qT/oQCCnZXmNFR/WQ7S1UR/oix4ba46mtxh/ci2j4eMujqMyt/PS
         95vKmRXUyISq2bIWi75AkU0uVXF7bhyazO9n2zmnbLz38+O0BWIIThr6mdJnK6QQAzHi
         A9ew==
X-Gm-Message-State: AOAM530pCEIKHBiDEBVqi4y+x5v1A1en0RHALXiuGZDpP+Q1iMCrDJ7u
        kxtSQDvQaOTN/RfwonzaJXheGBDUxuk=
X-Google-Smtp-Source: ABdhPJzj5NrEqS6R/E/pway38JrzWHE+PYmAiWI5fTlEcegdm6POulaQfy5AaYM7tiD79DhVVquGuO7tQkA=
X-Received: from badhri.mtv.corp.google.com ([2620:15c:211:1:f292:1cff:fee0:66cf])
 (user=badhri job=sendgmr) by 2002:a17:90a:638c:: with SMTP id
 f12mr249425pjj.1.1598329353549; Mon, 24 Aug 2020 21:22:33 -0700 (PDT)
Date:   Mon, 24 Aug 2020 21:21:59 -0700
In-Reply-To: <20200825042210.300632-1-badhri@google.com>
Message-Id: <20200825042210.300632-4-badhri@google.com>
Mime-Version: 1.0
References: <20200825042210.300632-1-badhri@google.com>
X-Mailer: git-send-email 2.28.0.297.g1956fa8f8d-goog
Subject: [PATCH 03/14 v1] usb: typec: tcpci: update ROLE_CONTROL for DRP
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
 drivers/usb/typec/tcpm/tcpci.c | 37 +++++++++++++++++++++++++++++++++-
 1 file changed, 36 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/typec/tcpm/tcpci.c b/drivers/usb/typec/tcpm/tcpci.c
index 90d348caa6a8..9e814d454d14 100644
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
2.28.0.297.g1956fa8f8d-goog

