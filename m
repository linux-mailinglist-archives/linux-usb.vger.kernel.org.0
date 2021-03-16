Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6539B33E13A
	for <lists+linux-usb@lfdr.de>; Tue, 16 Mar 2021 23:14:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230486AbhCPWNl (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 16 Mar 2021 18:13:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39638 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230435AbhCPWNL (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 16 Mar 2021 18:13:11 -0400
Received: from mail-qv1-xf4a.google.com (mail-qv1-xf4a.google.com [IPv6:2607:f8b0:4864:20::f4a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6766EC06175F
        for <linux-usb@vger.kernel.org>; Tue, 16 Mar 2021 15:13:11 -0700 (PDT)
Received: by mail-qv1-xf4a.google.com with SMTP id u8so26404782qvm.5
        for <linux-usb@vger.kernel.org>; Tue, 16 Mar 2021 15:13:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=vtgRgwp3OG8K6vsJvF4Dtg98thkG7u9zuASSiMamQUE=;
        b=ijrskwi4mMFIwGdOD/3UdD7CM1bNzbhCcBR9MI66cVybuo1/Wbx/Jh3af0ZJ20EVe6
         ynTZxggxAzItdPSQvGA2+guqcclfMer4/TMTZv5bSd0nMJUgz0TGFNGjz1kwiQMYq4Fl
         e9kyB1usbegxxpms9ht0LYP3Xhr++QtQ12WODJeiMDFY2T5KoRTOeFHofBxUpM4aamLX
         DTtITKL9G6mwHXlEjwSbjcaZm5DaVAzQq4Laytbe798Ey8nWdfGSfXp0QiRaIOQjk8jO
         ft7aly5LFgSPFcWwzzMn0PlHm6lG0VNT5eY/rd0aUQsUHylzMqwVpti6vZB9Gqz9gwkH
         yOXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=vtgRgwp3OG8K6vsJvF4Dtg98thkG7u9zuASSiMamQUE=;
        b=P3yp0lilJNAn6yLoetuMIyric3GIKwQq7wcjqKz8YAI1wzo3zo/kkx9lzwTe2M1TcJ
         v7ZE+5N9B93sSHo9dhK8NUuXTiglssHwXVXdh0P9C2ukYNC7Q3ModBrnRa2fT1oBJcCJ
         1bAIC3GJXkeYhXfALXemV/Ady5Rx+YX3a7wfKKYT7AsEhdWyKFI0z/ASQpaKY5SNHit5
         3BtnsAb5oE9c/XZIKrJVS47I9ECOA9FqH1wxia6S85KNXxCj5hGEfZj1a1SC8cj/9yDS
         XkPIZMxNwKpMjapqO9FLvEcK3tnOIDKyFMHXGwJiW5kRZqolpWg1QeLISq3hnfc5zaUq
         kjtA==
X-Gm-Message-State: AOAM530l++G/7c9Q2fAYWZ2R+jvb9PMrJsKslAxclqEZCnOo8U0qBPsq
        q/E/ek4+FM9vrV10mClW1tPh/MAttDo=
X-Google-Smtp-Source: ABdhPJxtuQmNVTMcIyTjuNgp/SF3U6Zj7cJYEHydLeEX3QTW1V8z5873ecf9mE3scX2erSDdHnjubwky9u8=
X-Received: from badhri.mtv.corp.google.com ([2620:15c:211:201:e53d:77e7:f975:af74])
 (user=badhri job=sendgmr) by 2002:a0c:e9c7:: with SMTP id q7mr2129267qvo.7.1615932790400;
 Tue, 16 Mar 2021 15:13:10 -0700 (PDT)
Date:   Tue, 16 Mar 2021 15:13:04 -0700
Message-Id: <20210316221304.391206-1-badhri@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.31.0.rc2.261.g7f71774620-goog
Subject: [PATCH v1] usb: typec: tcpci: Added few missing TCPCI register definitions
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

This change adds some of the register bit definitions from the TCPCI spec:
https://www.usb.org/sites/default/files/documents/
usb-port_controller_specification_rev2.0_v1.0_0.pdf

Signed-off-by: Badhri Jagan Sridharan <badhri@google.com>
---
 drivers/usb/typec/tcpm/tcpci.h | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/usb/typec/tcpm/tcpci.h b/drivers/usb/typec/tcpm/tcpci.h
index 57b6e24e0a0c..2be7a77d400e 100644
--- a/drivers/usb/typec/tcpm/tcpci.h
+++ b/drivers/usb/typec/tcpm/tcpci.h
@@ -47,7 +47,10 @@
 
 #define TCPC_TCPC_CTRL			0x19
 #define TCPC_TCPC_CTRL_ORIENTATION	BIT(0)
+#define PLUG_ORNT_CC1			0
+#define PLUG_ORNT_CC2			1
 #define TCPC_TCPC_CTRL_BIST_TM		BIT(1)
+#define TCPC_TCPC_CTRL_EN_LK4CONN_ALRT	BIT(6)
 
 #define TCPC_EXTENDED_STATUS		0x20
 #define TCPC_EXTENDED_STATUS_VSAFE0V	BIT(0)
@@ -74,21 +77,28 @@
 #define TCPC_POWER_CTRL_VCONN_ENABLE	BIT(0)
 #define TCPC_POWER_CTRL_BLEED_DISCHARGE	BIT(3)
 #define TCPC_POWER_CTRL_AUTO_DISCHARGE	BIT(4)
+#define TCPC_DIS_VOLT_ALRM		BIT(5)
+#define TCPC_POWER_CTRL_VBUS_VOLT_MON	BIT(6)
 #define TCPC_FAST_ROLE_SWAP_EN		BIT(7)
 
 #define TCPC_CC_STATUS			0x1d
 #define TCPC_CC_STATUS_TOGGLING		BIT(5)
 #define TCPC_CC_STATUS_TERM		BIT(4)
+#define TCPC_CC_STATUS_TERM_RP		0
+#define TCPC_CC_STATUS_TERM_RD		1
+#define TCPC_CC_STATE_SRC_OPEN		0
 #define TCPC_CC_STATUS_CC2_SHIFT	2
 #define TCPC_CC_STATUS_CC2_MASK		0x3
 #define TCPC_CC_STATUS_CC1_SHIFT	0
 #define TCPC_CC_STATUS_CC1_MASK		0x3
 
 #define TCPC_POWER_STATUS		0x1e
+#define TCPC_POWER_STATUS_DBG_ACC_CON	BIT(7)
 #define TCPC_POWER_STATUS_UNINIT	BIT(6)
 #define TCPC_POWER_STATUS_SOURCING_VBUS	BIT(4)
 #define TCPC_POWER_STATUS_VBUS_DET	BIT(3)
 #define TCPC_POWER_STATUS_VBUS_PRES	BIT(2)
+#define TCPC_POWER_STATUS_SINKING_VBUS	BIT(0)
 
 #define TCPC_FAULT_STATUS		0x1f
 
@@ -121,6 +131,10 @@
 #define TCPC_RX_DETECT			0x2f
 #define TCPC_RX_DETECT_HARD_RESET	BIT(5)
 #define TCPC_RX_DETECT_SOP		BIT(0)
+#define TCPC_RX_DETECT_SOP1		BIT(1)
+#define TCPC_RX_DETECT_SOP2		BIT(2)
+#define TCPC_RX_DETECT_DBG1		BIT(3)
+#define TCPC_RX_DETECT_DBG2		BIT(4)
 
 #define TCPC_RX_BYTE_CNT		0x30
 #define TCPC_RX_BUF_FRAME_TYPE		0x31
@@ -139,6 +153,8 @@
 #define TCPC_TX_DATA			0x54 /* through 0x6f */
 
 #define TCPC_VBUS_VOLTAGE			0x70
+#define TCPC_VBUS_VOLTAGE_MASK			0x3ff
+#define TCPC_VBUS_VOLTAGE_LSB_MV		25
 #define TCPC_VBUS_SINK_DISCONNECT_THRESH	0x72
 #define TCPC_VBUS_SINK_DISCONNECT_THRESH_LSB_MV	25
 #define TCPC_VBUS_SINK_DISCONNECT_THRESH_MAX	0x3ff
-- 
2.31.0.rc2.261.g7f71774620-goog

