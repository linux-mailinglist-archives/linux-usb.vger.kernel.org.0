Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 585D8221AEC
	for <lists+linux-usb@lfdr.de>; Thu, 16 Jul 2020 05:41:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728266AbgGPDle (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 15 Jul 2020 23:41:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728262AbgGPDle (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 15 Jul 2020 23:41:34 -0400
Received: from mail-pj1-x104a.google.com (mail-pj1-x104a.google.com [IPv6:2607:f8b0:4864:20::104a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14B11C08C5CE
        for <linux-usb@vger.kernel.org>; Wed, 15 Jul 2020 20:41:34 -0700 (PDT)
Received: by mail-pj1-x104a.google.com with SMTP id jx16so4372706pjb.6
        for <linux-usb@vger.kernel.org>; Wed, 15 Jul 2020 20:41:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=JVqaQcsA9ryghGPWNt77bGonDTUiuVmDFOB6lIrP5uc=;
        b=K5ymQTs8/rpyXUKrYTyN/1HyUfnkOXOQil8fcN+1PzFV2h3fAH1SKSK//Ow6Okgu7R
         Uo5T1G1IWymG9mTvR22lPQ3wwNa3rrPYNhuFuDUueieKeMhNJ9fj3crby4bRj16wlmTe
         I/tuIVus84MZhHHQBrflnlrPk1H6AkhUWuJtL/ie9+q+BJIW3FuvDs3AMsiqMeMFDYbs
         yvdSEndTLz+KzUHvhDcpW7ruGhoDSETHfVSDYjDW+khHq9IWWLCp4P1wdCm4Y1pSuUMt
         x2/7FQc0k4Qn+8QZsPLrVbkqgp7LdJAI25ZgfY+wEzyQKmKJ0br0l0ejoL3IM/w/iVLx
         NKJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=JVqaQcsA9ryghGPWNt77bGonDTUiuVmDFOB6lIrP5uc=;
        b=KloMtvi+QAGX1BsSU5TSvT6rNC7EuEmACQwRSwgg/9JChu8b4HRycv2RoFrqFDdzN7
         E/40iPwv1xGQZajq7o57oOFMS2yCgWwV7iOe5OsUaQ6Fiq2V5nBCfF6usu3SueH6Z0aS
         E8lwxRYrHRvhRDlmk9X6M209tQLUW9n2KWNSmtjApp7BAMZFJsdMqhgWDc4lgW6QP3Hc
         RMYs36g1izPD/9QLb6OggMUCoEW3G83gCohiZB1EHGPZWV/0j/++Hl7yCGFkgmVK4EmE
         ckpKYKdwqpGiQEwgwzyfx7EcOTHpFTW6qqDDAJZsI0nZi8W4rFFuQoid56F3PECh0FsN
         Onsg==
X-Gm-Message-State: AOAM533J/aJoa/q9EY/AvHvlu7KCjtjRodCZoCrHCwlsDCGOhCS1VViQ
        2EDyo3iWDop7KiX2z9HD4fomZ2qzF1A=
X-Google-Smtp-Source: ABdhPJzW0b2j+f3mJfI3L/UXfvtVozfUxZ2l5SINSWF+xaz86zYtZAGYzDR31ITKGuaXsDjlTmAxOGsQgBY=
X-Received: by 2002:a63:6c5:: with SMTP id 188mr2508631pgg.33.1594870893475;
 Wed, 15 Jul 2020 20:41:33 -0700 (PDT)
Date:   Wed, 15 Jul 2020 20:41:26 -0700
Message-Id: <20200716034128.1251728-1-badhri@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.27.0.389.gc38d7665816-goog
Subject: [PATCH 1/3 v3] usb: typec: tcpm: Support bist test data mode for compliance
From:   Badhri Jagan Sridharan <badhri@google.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        reg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Badhri Jagan Sridharan <badhri@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

TCPM supports BIST carried mode. PD compliance tests require
BIST Test Data to be supported as well.

Introducing set_bist_data callback to signal tcpc driver for
configuring the port controller hardware to enable/disable
BIST Test Data mode.

Signed-off-by: Badhri Jagan Sridharan <badhri@google.com>
Reviewed-by: Guenter Roeck <linux@roeck-us.net>
---
Version history:
Changes since V1:(Guenter's suggestions)
- Split the change into two: TCPM and TCPCI
- Move BIST log to TCPM log

Changes since V2:(Guenter's suggestions)
- Re-ordered patchset
- Included Reviewed-by tag
---
 drivers/usb/typec/tcpm/tcpm.c | 11 +++++++++++
 include/linux/usb/tcpm.h      |  2 ++
 2 files changed, 13 insertions(+)

diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
index 82b19ebd7838e0..379fcab9dbd973 100644
--- a/drivers/usb/typec/tcpm/tcpm.c
+++ b/drivers/usb/typec/tcpm/tcpm.c
@@ -2746,6 +2746,11 @@ static void tcpm_detach(struct tcpm_port *port)
 	if (!port->attached)
 		return;
 
+	if (port->tcpc->set_bist_data) {
+		tcpm_log(port, "disable BIST MODE TESTDATA");
+		port->tcpc->set_bist_data(port->tcpc, false);
+	}
+
 	if (tcpm_port_is_disconnected(port))
 		port->hard_reset_count = 0;
 
@@ -3555,6 +3560,12 @@ static void run_state_machine(struct tcpm_port *port)
 		case BDO_MODE_CARRIER2:
 			tcpm_pd_transmit(port, TCPC_TX_BIST_MODE_2, NULL);
 			break;
+		case BDO_MODE_TESTDATA:
+			if (port->tcpc->set_bist_data) {
+				tcpm_log(port, "Enable BIST MODE TESTDATA");
+				port->tcpc->set_bist_data(port->tcpc, true);
+			}
+			break;
 		default:
 			break;
 		}
diff --git a/include/linux/usb/tcpm.h b/include/linux/usb/tcpm.h
index e7979c01c3517c..89f58760cf4800 100644
--- a/include/linux/usb/tcpm.h
+++ b/include/linux/usb/tcpm.h
@@ -79,6 +79,7 @@ enum tcpm_transmit_type {
  * @try_role:	Optional; called to set a preferred role
  * @pd_transmit:Called to transmit PD message
  * @mux:	Pointer to multiplexer data
+ * @set_bist_data: Turn on/off bist data mode for compliance testing
  */
 struct tcpc_dev {
 	struct fwnode_handle *fwnode;
@@ -103,6 +104,7 @@ struct tcpc_dev {
 	int (*try_role)(struct tcpc_dev *dev, int role);
 	int (*pd_transmit)(struct tcpc_dev *dev, enum tcpm_transmit_type type,
 			   const struct pd_message *msg);
+	int (*set_bist_data)(struct tcpc_dev *dev, bool on);
 };
 
 struct tcpm_port;
-- 
2.27.0.389.gc38d7665816-goog

