Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E2D442585DA
	for <lists+linux-usb@lfdr.de>; Tue,  1 Sep 2020 05:00:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727088AbgIAC7u (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 31 Aug 2020 22:59:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727041AbgIAC7n (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 31 Aug 2020 22:59:43 -0400
Received: from mail-qk1-x74a.google.com (mail-qk1-x74a.google.com [IPv6:2607:f8b0:4864:20::74a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28A9BC061366
        for <linux-usb@vger.kernel.org>; Mon, 31 Aug 2020 19:59:43 -0700 (PDT)
Received: by mail-qk1-x74a.google.com with SMTP id 196so7601225qkn.6
        for <linux-usb@vger.kernel.org>; Mon, 31 Aug 2020 19:59:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:in-reply-to:message-id:mime-version:references:subject
         :from:to:cc;
        bh=YmypCvt0GTO9TngCUZyl18kzUPGJakzF+npVltizd4g=;
        b=NcyR/6nOOprsALH1y/XOZ+6IsHBhRUr5VnnI7M1QWjQ0hCt8qAPY8Ww005y8GeLFqZ
         xI50vV/SaK3yrKWUoh6Qnok2Nzbddaq4OoBdWQD1kYy1d5hgiST+wTFls5GkmBanLL+K
         MwaCNi/MozQCxAw2c3/KwcCt727T/RWybnwaMEO8zAqVD1zP/1cFX9FFtLIzCnRrlYur
         0FQf/S7rwT6W/3cETt3prTWU35AiJFUwGWHFpTfPznsNigw4KzHGoMa+4ZkyWx+5Rk9i
         cWniGf0MdgvgKrGU4zCCGcL2JHGLK/m8wA6OUhAqxfaQ1pI3Grs51kBeQVFd4+2ue2rh
         2A9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=YmypCvt0GTO9TngCUZyl18kzUPGJakzF+npVltizd4g=;
        b=M1YEZqQgoIRkALZnCHGZ3gFkZIIJ8QCA00QBcgMZOr88Ne0DOmgG/pnBMXY+vznVwF
         3aLJEvuSQpZbhKydrgJ/L8VbXwWALgi5tU14O9D6XS05f1Mtol2erXwEQTNJ5fRUh9dX
         BycZk4wqiJvmDzgqRJFsxMkaf1VYJVv/8Hd9AjmgalKruBaCy4uB9vv07dC1vXM2aQ+Z
         0GHrCMYWwne+4R1Ae6vTm/6jamcCadh7vVvvzJPFLnLIJC6rzT7f6iaEYqVK/Dd4YPhR
         nN6CghksPHZxHztEgI1qiopjsU9I6w9eyw6Sg88s3T+QzUqM7CopokiMa3fcEIek96TJ
         zJhA==
X-Gm-Message-State: AOAM5305g019N/ZL6XBRduFKQwurxp0ZLsUs7qrzSzvIdwOOVO7MTThe
        stSIwzpBxIjppMS8m7cviMVhAnvHx/8=
X-Google-Smtp-Source: ABdhPJzMEAVY2Ge8dAOHg87wIFAYI34/CLnRne8aY7Zc3SAwXmi3XvqtyPzwSrw5aV+Y2m3kL5UN4SR/VF8=
X-Received: from badhri.mtv.corp.google.com ([2620:15c:211:1:f292:1cff:fee0:66cf])
 (user=badhri job=sendgmr) by 2002:a0c:b626:: with SMTP id f38mr1400471qve.0.1598929182318;
 Mon, 31 Aug 2020 19:59:42 -0700 (PDT)
Date:   Mon, 31 Aug 2020 19:59:19 -0700
In-Reply-To: <20200901025927.3596190-1-badhri@google.com>
Message-Id: <20200901025927.3596190-7-badhri@google.com>
Mime-Version: 1.0
References: <20200901025927.3596190-1-badhri@google.com>
X-Mailer: git-send-email 2.28.0.402.g5ffc5be6b7-goog
Subject: [PATCH v6 06/14] dt-bindings: usb: Maxim type-c controller device
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
Changes since v1:
- Changing patch version to v6 to fix version number confusion.
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
2.28.0.402.g5ffc5be6b7-goog

