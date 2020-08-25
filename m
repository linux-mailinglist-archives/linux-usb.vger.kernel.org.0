Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1A9A325107B
	for <lists+linux-usb@lfdr.de>; Tue, 25 Aug 2020 06:23:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726163AbgHYEWq (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 25 Aug 2020 00:22:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728598AbgHYEWn (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 25 Aug 2020 00:22:43 -0400
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3AFDAC061574
        for <linux-usb@vger.kernel.org>; Mon, 24 Aug 2020 21:22:43 -0700 (PDT)
Received: by mail-yb1-xb4a.google.com with SMTP id w17so13264177ybl.9
        for <linux-usb@vger.kernel.org>; Mon, 24 Aug 2020 21:22:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:in-reply-to:message-id:mime-version:references:subject
         :from:to:cc;
        bh=LaXEwiyj3MgKPctp60ipXsQUebEP+5mdaxvo+R2WRtw=;
        b=B42heZafxHivLXm0aOGdLVibiLm0qF8L3IvB4FKYWSdfzVeQcw8YAoeM3uGV1iASBk
         QStfkWVxSFPTJbJeD+It4FOLb8AjJ6vzLOe/RMg5JAwfkLpFm5XN3y5xQ4gwduYKMZ+2
         vWdM3FW1wS9yUociub30p+hdr04vhK5WAMaVU8lDzlMMy2NnH7lFDgTo8bhkinl8MzJF
         zoCrgkEXwTmjv1GHk59JMRF8DZ233ezppxpssME2uLw+CUQySOth4LrkUA7PLVcxjk7s
         UP+7OdA2NtD/Lupell9hj0Q35a70qWkW9PZdrQXvC3bqXphEGo4779HmR5NuOEPnBPly
         lOiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=LaXEwiyj3MgKPctp60ipXsQUebEP+5mdaxvo+R2WRtw=;
        b=joYVCdyq6I5svNBh+xVEUWOVMfnJECmvYuDjE3ozJhishQbS70ehmRspNjuuel1JWE
         BqBp6/im3u8AlCfRB6oi0Q+ySE2z7haKIiIZ9mxjHssi/xQq9RCmpGXZSlWi+IB0iXD4
         D+6p2c97wSS67n8QAmGMUX2GOkhno8JsjtQllh69BtygXX6nAao2zDJJJQWxDkZdmKbh
         zQXXu4SP/46NHO9KNL6kQkvBL4M5kj1EPv8R0alfb4CP1vA5mVXgK+XjGEJTN9p+dfFS
         Yjd5laZ5d0VVMTkvhPgwvmfLZZ1APPtczeayFho/Ts7Slp0rQFaYkwOam7XiT5rQywaf
         sxew==
X-Gm-Message-State: AOAM530xOSn3nfu05TeFMYuAJuiAg9H4YWhOxtLbFvm5zrstzMc+APzM
        dxDd3Sv7TqBcQkGvXVidCpn5TMT2rNc=
X-Google-Smtp-Source: ABdhPJxFkE/6S2bXb/DiC+7xpTwEG+Px60JIceRAjFDtnoEnF2XgbQDbE3vGU5rXuA/vyLvl2tJtvpOXlRs=
X-Received: from badhri.mtv.corp.google.com ([2620:15c:211:1:f292:1cff:fee0:66cf])
 (user=badhri job=sendgmr) by 2002:a25:3b0d:: with SMTP id i13mr11726889yba.314.1598329362488;
 Mon, 24 Aug 2020 21:22:42 -0700 (PDT)
Date:   Mon, 24 Aug 2020 21:22:02 -0700
In-Reply-To: <20200825042210.300632-1-badhri@google.com>
Message-Id: <20200825042210.300632-7-badhri@google.com>
Mime-Version: 1.0
References: <20200825042210.300632-1-badhri@google.com>
X-Mailer: git-send-email 2.28.0.297.g1956fa8f8d-goog
Subject: [PATCH 06/14 v1] dt-bindings: usb: Maxim type-c controller device
 tree binding document
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

Add device tree binding document for Maxim TCPCI based Type-C chip driver

Signed-off-by: Badhri Jagan Sridharan <badhri@google.com>
---
 .../devicetree/bindings/usb/maxim,tcpci.txt   | 44 +++++++++++++++++++
 1 file changed, 44 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/maxim,tcpci.txt

diff --git a/Documentation/devicetree/bindings/usb/maxim,tcpci.txt b/Documentation/devicetree/bindings/usb/maxim,tcpci.txt
new file mode 100644
index 000000000000..8a5b08e57b2d
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/maxim,tcpci.txt
@@ -0,0 +1,44 @@
+Maxim TCPCI Type-C PD controller:
+---------------------------------
+
+Required properties:
+- compatible:       should be set maxim,tcpci:
+
+- reg:              0x25:the i2c slave address of typec port controller device.
+- interrupt-parent: the phandle to the interrupt controller which provides
+                    the interrupt.
+- usbpd,usbpd_int:  interrupt specification for tcpci alert.
+
+Required sub-node:
+- connector: The "usb-c-connector" attached to the tcpci chip, the bindings
+  of connector node are specified in
+  Documentation/devicetree/bindings/connector/usb-connector.txt
+
+maxtcpc: maxtcpc@25 {
+	status = "okay";
+	compatible = "maxim,tcpc";
+	reg = <0x25>;
+	interrupt-parent = <&gpa8>;
+	usbpd,usbpd_int = <&gpa8 2 GPIO_ACTIVE_LOW>;
+
+	connector {
+		compatible = "usb-c-connector";
+		label = "USB-C";
+		data-role = "dual";
+		power-role = "dual";
+		try-power-role = "sink";
+		self-powered;
+		op-sink-microwatt = <2600000>;
+		source-pdos = <PDO_FIXED(5000, 900,
+					 PDO_FIXED_SUSPEND |
+					 PDO_FIXED_USB_COMM |
+					 PDO_FIXED_DATA_SWAP |
+					 PDO_FIXED_DUAL_ROLE)>;
+		sink-pdos = <PDO_FIXED(5000, 3000,
+				       PDO_FIXED_USB_COMM |
+				       PDO_FIXED_DATA_SWAP |
+				       PDO_FIXED_DUAL_ROLE)
+				       PDO_FIXED(9000, 2000, 0)
+		frs-typec-current = <FRS_5V_1P5A>;
+	};
+};
-- 
2.28.0.297.g1956fa8f8d-goog

