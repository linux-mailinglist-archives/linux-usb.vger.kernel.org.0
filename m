Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 95C1F2200E8
	for <lists+linux-usb@lfdr.de>; Wed, 15 Jul 2020 01:12:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727103AbgGNXMQ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 14 Jul 2020 19:12:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726446AbgGNXMP (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 14 Jul 2020 19:12:15 -0400
Received: from mail-pg1-x549.google.com (mail-pg1-x549.google.com [IPv6:2607:f8b0:4864:20::549])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BDA57C061755
        for <linux-usb@vger.kernel.org>; Tue, 14 Jul 2020 16:12:15 -0700 (PDT)
Received: by mail-pg1-x549.google.com with SMTP id t6so132215pgv.5
        for <linux-usb@vger.kernel.org>; Tue, 14 Jul 2020 16:12:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=glVfOVmyAY7K0ZD6NVMriDJHjHK+kTTDZC66Bbr1RgU=;
        b=DAdGDpkVhQzqvwgvtRqkVAUg8CXYrIkYfcpwYcrtt3ZBsmKLvMxzyjN++3hQc/HGgu
         B/SP9Qzdxxdyzg/5EHN1qiVSl173br6wQ9n4PncL5ETdVSgK+jI340mbtgwuLs4sd81M
         ErjGSEOty/pXXG3R78fUt/2pLE0KWEiChisarivefrfX5/Gb+qVarPsR9C8AeQhLeO72
         7XsPT5pPGlAZ5Rt+Wk00IbjYVvi/0ww4Vpul63Z+ourX7O1I420yIq9f5BGC0LXazgeL
         p2E3gQO2ZxXAu4GkHIxL+e4VHcZgyyMIWeu2I6s00nU5P7MV+ahx6FbW3416W4Siqgh+
         pWDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=glVfOVmyAY7K0ZD6NVMriDJHjHK+kTTDZC66Bbr1RgU=;
        b=KVUY+6Eq0GA5SDmCfckCB439PHTJWWDggqg1XZxmkubw107R2u9IAe0xwgDf9EySo8
         V/iXW/fOkMevaQCVi1mVKThhk++H4DLzFvTsS+XO73hKT2cctSmNqBV92uWh5+lL6QOr
         6jfeKdaWBmT9HF3soSHIRqnDnjiejS8o8/9UXPf1V8NOIeHTx82JxY1GwjjJmMz5cHWB
         s0xQaEBuxMbJMq4aZGoddP06NFKObecDpGkPsfB7e1/uahwWC4CBJ/Li25yXCO5tNoFj
         Urehgc531UeCs6jDfHliYQ9PObcc3zUMnuRKsMxp4ABQ4JlAEZrask1J4PwEzN7C3Nrk
         gsKQ==
X-Gm-Message-State: AOAM530tezmSYXFfFSxDyESo8XYzWbEP4WcCXr2GQozW6rOPXjPElIHN
        n1u78NmIZYJFJ3iZNJKklz4FFK0ZoaE=
X-Google-Smtp-Source: ABdhPJy2Woh67yQ+dkq89F0KCieyS2VJmpYvjZzBWwdWn8etJfQ0b05c4ImwUuY4rj+22iTCTjwdAOlis50=
X-Received: by 2002:a17:90a:1fcb:: with SMTP id z11mr904182pjz.1.1594768335108;
 Tue, 14 Jul 2020 16:12:15 -0700 (PDT)
Date:   Tue, 14 Jul 2020 16:12:06 -0700
In-Reply-To: <20200714231207.866838-1-badhri@google.com>
Message-Id: <20200714231207.866838-2-badhri@google.com>
Mime-Version: 1.0
References: <20200714231207.866838-1-badhri@google.com>
X-Mailer: git-send-email 2.27.0.389.gc38d7665816-goog
Subject: [PATCH 2/3 v2] usb: typec: tcpm: Support bist test data mode for compliance
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
---
Version history:
Changes since V1:(Guenter's suggestions)
- Split the change into two: TCPM and TCPCI
- Move BIST log to TCPM log
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

