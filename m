Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 526E06183CE
	for <lists+linux-usb@lfdr.de>; Thu,  3 Nov 2022 17:08:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232135AbiKCQIi (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 3 Nov 2022 12:08:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231669AbiKCQII (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 3 Nov 2022 12:08:08 -0400
Received: from mx0b-002e3701.pphosted.com (mx0b-002e3701.pphosted.com [148.163.143.35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8881A14D39;
        Thu,  3 Nov 2022 09:08:02 -0700 (PDT)
Received: from pps.filterd (m0134423.ppops.net [127.0.0.1])
        by mx0b-002e3701.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2A3FWFMe019085;
        Thu, 3 Nov 2022 16:07:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com; h=from : to : subject :
 date : message-id : in-reply-to : references : mime-version; s=pps0720;
 bh=KrxVRU/txJr2LMOTCV8p6clKZuVcvyAEuFzxM3lBwpc=;
 b=FAiP2GxscvuKyQweDNLiAhk3cDiA3gxMbsYNKHqRB8gmLBcYISlS7LxUU9NwwUAwYhhP
 pzJmywD3NrDYt6yTRoM7dwa0stDv/jf9leU7qYvpjv9HkbLIc9byxGUPABKGIdOaOqJG
 gw7uYQr2XNsi/v6lXFQceUtkczISU5eVsARBqNou6aug65YsjzT7OyBTPDbnzcGOULsN
 lQo47jWfPNLG51oFd9vgiQvO61slOIrfSsmY7Ln5dDCFnETPyEVc5nrZml5AzoxYX2z0
 b8BFvG8B61ljuFJSwqntAIGafWusLsgp14As7HpysWFQcLiFnVhTmXzVhVUqM+ae+T7i /A== 
Received: from p1lg14881.it.hpe.com (p1lg14881.it.hpe.com [16.230.97.202])
        by mx0b-002e3701.pphosted.com (PPS) with ESMTPS id 3kmg5h0f6y-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 03 Nov 2022 16:07:35 +0000
Received: from p1lg14885.dc01.its.hpecorp.net (unknown [10.119.18.236])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by p1lg14881.it.hpe.com (Postfix) with ESMTPS id 8A34980471E;
        Thu,  3 Nov 2022 16:07:34 +0000 (UTC)
Received: from hpe.com (unknown [16.231.227.36])
        by p1lg14885.dc01.its.hpecorp.net (Postfix) with ESMTP id EEE93808992;
        Thu,  3 Nov 2022 16:07:33 +0000 (UTC)
From:   richard.yu@hpe.com
To:     verdun@hpe.com, nick.hawkins@hpe.com, richard.yu@hpe.com,
        gregkh@linuxfoundation.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux@armlinux.org.uk,
        balbi@kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH v1 3/7] dt-bindings: usb: hpe,gxp-udcg: Add binding for gxp gadget group
Date:   Thu,  3 Nov 2022 11:06:21 -0500
Message-Id: <20221103160625.15574-4-richard.yu@hpe.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221103160625.15574-1-richard.yu@hpe.com>
References: <20221103160625.15574-1-richard.yu@hpe.com>
X-Proofpoint-GUID: 8JILtnqF2AvCm6AjX6Bx_3Z9U2RD3sWX
X-Proofpoint-ORIG-GUID: 8JILtnqF2AvCm6AjX6Bx_3Z9U2RD3sWX
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-03_04,2022-11-03_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 malwarescore=0 spamscore=0 phishscore=0 mlxlogscore=902 clxscore=1015
 bulkscore=0 suspectscore=0 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211030107
X-Spam-Status: No, score=-3.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Richard Yu <richard.yu@hpe.com>

Create documentation for the hpe,gxp-udcg binding to support access to
the gxp USB gadget group.

Signed-off-by: Richard Yu <richard.yu@hpe.com>
---
 .../devicetree/bindings/usb/hpe,gxp-udcg.yaml | 34 +++++++++++++++++++
 1 file changed, 34 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/hpe,gxp-udcg.yaml

diff --git a/Documentation/devicetree/bindings/usb/hpe,gxp-udcg.yaml b/Documentation/devicetree/bindings/usb/hpe,gxp-udcg.yaml
new file mode 100644
index 000000000000..f1dd681c8d7d
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/hpe,gxp-udcg.yaml
@@ -0,0 +1,34 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/usb/hpe,gxp-udcg.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: HPE GXP Gadget Universal Device Controller Group (UDCG)
+
+maintainers:
+  - Richard Yu <richard.yu@hpe.com>
+  - Jean-Marie Verdun <verdun@hpe.com>
+  - Nick Hawkins <nick.hawkins@hpe.com>
+
+properties:
+  compatible:
+    items:
+      - const: hpe,gxp-udcg
+      - const: syscon
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    system-controller@80400800 {
+      compatible = "hpe,gxp-udcg", "syscon";
+      reg = <0x80400800 0x200>;
+    };
-- 
2.17.1

