Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 945C2293846
	for <lists+linux-usb@lfdr.de>; Tue, 20 Oct 2020 11:37:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405821AbgJTJh2 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 20 Oct 2020 05:37:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2392926AbgJTJgg (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 20 Oct 2020 05:36:36 -0400
Received: from mail-pf1-x449.google.com (mail-pf1-x449.google.com [IPv6:2607:f8b0:4864:20::449])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76AE5C0613D1
        for <linux-usb@vger.kernel.org>; Tue, 20 Oct 2020 02:36:35 -0700 (PDT)
Received: by mail-pf1-x449.google.com with SMTP id c21so787768pfd.16
        for <linux-usb@vger.kernel.org>; Tue, 20 Oct 2020 02:36:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:in-reply-to:message-id:mime-version:references:subject
         :from:to:cc;
        bh=gF6Pjoh1f+yIZcYu0T3DSXgXFFwPaCjBFuOcvKV2l2A=;
        b=RMCsqbTgRC3IaVo+F4Ocj30Rry4PPr0GFX2zM9cMCd2Xdg/eFtEQpg6sDDD/Vxo5SN
         3Jb1lzCCurBn0eaJ0fxM69P3po8kSUD1LOA3WKs84YRnILL48vYwq9zQRppcwbaT1P6/
         jE7+kg8MoJ1PF830XyjbkJAvsEvPLNcbgQCukDfINVaLhc2Bc1tkThVSHjQGPBozzfos
         8S6MAUnWZnEXUrL4knHtWX641/rzr+rp1nDaIS54BbN+JMY38lNm8HU9md74zCx+x0Eq
         j/Hj0vZ0T6JLby51cxLXn+hJl5uM6TctO+X7QB5b0EJcvTmJ4EYAXl8hXLilhtMQGeVp
         cpiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=gF6Pjoh1f+yIZcYu0T3DSXgXFFwPaCjBFuOcvKV2l2A=;
        b=GTbT3Fi41htWf1ZsM+jEBSOugPpoFk52XGCka9uqoWpcUiobPr90EOthggpk5upYhK
         jDDZYDuBDgdTn6di7FAK26HxdL3HY8gp3dFlcdHjPygJRYepHO+G8zoZNrDqvMwSl1Gg
         2DN0Ddj2wvS4fHmZQqXVMxa+8zFtV1Ek6bHWj+Xk9ARO9VBEMwWJMAgYdFwxoOLY/xJh
         NnZgZ3BdOJHpBCLTQu/qd3KE8ctBJ7V3IVNrBnl1dJeLOqc/CQN3G51vzkjb+QROHc3+
         QlfeHUQ4feqKo0wW8ZUK4p9ffh9hKBCc3SMJcOmk6x6pQV4XW1VA8j++BfWDIhf8BEdU
         ZOzA==
X-Gm-Message-State: AOAM531WrBClB0UJjzSvAHdCxbw0pMPFRSFSKl5M7aEAU5WJ13zPLnkz
        jHIlf90Dt20RbhEU0+W0yT009yTLn9Q=
X-Google-Smtp-Source: ABdhPJx8El60a/7IQDv7c1OW4HwS6slfJE4mGfil10iJwpB5G/6zPfgFDQDzP+BreXnkkwJIwo0RJfoSjko=
Sender: "badhri via sendgmr" <badhri@badhri.mtv.corp.google.com>
X-Received: from badhri.mtv.corp.google.com ([2620:15c:211:1:f292:1cff:fee0:66cf])
 (user=badhri job=sendgmr) by 2002:a17:90a:c7c4:: with SMTP id
 gf4mr2090483pjb.154.1603186594893; Tue, 20 Oct 2020 02:36:34 -0700 (PDT)
Date:   Tue, 20 Oct 2020 02:36:18 -0700
In-Reply-To: <20201020093627.256885-1-badhri@google.com>
Message-Id: <20201020093627.256885-2-badhri@google.com>
Mime-Version: 1.0
References: <20201020093627.256885-1-badhri@google.com>
X-Mailer: git-send-email 2.29.0.rc1.297.gfa9743e501-goog
Subject: [PATCH v11 01/10] dt-bindings: connector: Add property to set initial
 current cap for FRS
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
        linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This change adds frs-typec-current which allows setting the initial current
capability of the new source when vSafe5V is applied during PD3.0
sink Fast Role Swap.

Signed-off-by: Badhri Jagan Sridharan <badhri@google.com>
---
Changes since v1:
- Changing patch version to v6 to fix version number confusion.

Changes since v6:
- Removed the redundant usb-connector.txt that I created by mistake.
- Moved to yaml.

Changes since v7:
- Rebase

Changes since v8:
- Redefine new-source-frs-typec-current as string enums to address
  Rob Herring's comment.

Changes since v9:
- Removed FRS constants from usb bindings.

Changes since v10:
- Suggestions from Rob Herring:
 - Going back to u32 for new-source-frs-typec-current
 - Removed the definition for "not-supported"
- Bringing back FRS constants for usb pd binding.
---
 .../bindings/connector/usb-connector.yaml     | 19 +++++++++++++++++++
 include/dt-bindings/usb/pd.h                  |  8 ++++++++
 2 files changed, 27 insertions(+)

diff --git a/Documentation/devicetree/bindings/connector/usb-connector.yaml b/Documentation/devicetree/bindings/connector/usb-connector.yaml
index 728f82db073d..62781518aefc 100644
--- a/Documentation/devicetree/bindings/connector/usb-connector.yaml
+++ b/Documentation/devicetree/bindings/connector/usb-connector.yaml
@@ -147,6 +147,25 @@ properties:
     required:
       - port@0
 
+  new-source-frs-typec-current:
+    description: Initial current capability of the new source when vSafe5V
+      is applied during PD3.0 Fast Role Swap. "Table 6-14 Fixed Supply PDO - Sink"
+      of "USB Power Delivery Specification Revision 3.0, Version 1.2" provides the
+      different power levels and "6.4.1.3.1.6 Fast Role Swap USB Type-C Current"
+      provides a detailed description of the field. The sink PDO from current source
+      reflects the current source's(i.e. transmitter of the FRS signal) power
+      requirement during fr swap. The current sink (i.e. receiver of the FRS signal),
+      a.k.a new source, should check if it will be able to satisfy the current source's,
+      new sink's, requirement during frswap before enabling the frs signal reception.
+      This property refers to maximum current capability that the current sink can
+      satisfy. During FRS, VBUS voltage is at 5V, as the partners are in implicit
+      contract, hence, the power level is only a function of the current capability.
+      "1" refers to default USB power level as described by "Table 6-14 Fixed Supply PDO - Sink".
+      "2" refers to 1.5A@5V.
+      "3" refers to 3.0A@5V.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [1, 2, 3]
+
 required:
   - compatible
 
diff --git a/include/dt-bindings/usb/pd.h b/include/dt-bindings/usb/pd.h
index 985f2bbd4d24..0352893697f0 100644
--- a/include/dt-bindings/usb/pd.h
+++ b/include/dt-bindings/usb/pd.h
@@ -85,4 +85,12 @@
 	 PDO_PPS_APDO_MIN_VOLT(min_mv) | PDO_PPS_APDO_MAX_VOLT(max_mv) |	\
 	 PDO_PPS_APDO_MAX_CURR(max_ma))
 
+ /*
+  * Based on "Table 6-14 Fixed Supply PDO - Sink" of "USB Power Delivery Specification Revision 3.0,
+  * Version 1.2"
+  * Initial current capability of the new source when vSafe5V is applied.
+  */
+#define FRS_DEFAULT_POWER      1
+#define FRS_5V_1P5A            2
+#define FRS_5V_3A              3
  #endif /* __DT_POWER_DELIVERY_H */
-- 
2.29.0.rc1.297.gfa9743e501-goog

