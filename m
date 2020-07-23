Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DEBCD22AD3E
	for <lists+linux-usb@lfdr.de>; Thu, 23 Jul 2020 13:08:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728489AbgGWLHz (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 23 Jul 2020 07:07:55 -0400
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:20528 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728379AbgGWLHx (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 23 Jul 2020 07:07:53 -0400
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 06NAwU4d027391;
        Thu, 23 Jul 2020 13:07:34 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=NC66LXZjmLY/7RkhYeapttuiG2FsOB8AremXJ31q5Cs=;
 b=BV+6W6MVzfghOuS3Zmgjn7Kw8JjHugMSrihFkuq2sMpeU4uWMLCr3xpBoOxbn1Wpbpw+
 IdAu45jPnujsNZIuUTJYU0Tra2szHmuvPAoBlP4hOh7zoXiUeQ6iHXinMwowIUmVZFyA
 TjZHEOif+/67pG9Jc78cTm/6sjxhhMxJxCPOhqqpyTsHXwCQegeH9fGtL1Ged1S8iqYQ
 Gk4xMe57fgwDa+2DbiFpPEL1rBFVPZdAO15kDXaAVp2nzy/eGgljlUr0GPPRNp5BUufF
 6MOlKv3ZJYERvJeOrYflE0EBOSOzjnONCgm6O/j/N7jCXP8fGgjO0EVj0LbLwkrMZSMl Xw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 32cux0mrg5-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 23 Jul 2020 13:07:34 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B0B8A100034;
        Thu, 23 Jul 2020 13:07:33 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A253A2AD9F6;
        Thu, 23 Jul 2020 13:07:33 +0200 (CEST)
Received: from localhost (10.75.127.46) by SFHDAG3NODE2.st.com (10.75.127.8)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2; Thu, 23 Jul 2020 13:07:33
 +0200
From:   Amelie Delaunay <amelie.delaunay@st.com>
To:     Minas Harutyunyan <hminas@synopsys.com>,
        Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@st.com>
CC:     <linux-usb@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        Fabrice Gasnier <fabrice.gasnier@st.com>,
        Amelie Delaunay <amelie.delaunay@st.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH v2 2/3] dt-bindings: usb: dwc2: add optional usb-role-switch property
Date:   Thu, 23 Jul 2020 13:07:16 +0200
Message-ID: <20200723110717.18699-3-amelie.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200723110717.18699-1-amelie.delaunay@st.com>
References: <20200723110717.18699-1-amelie.delaunay@st.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG8NODE2.st.com (10.75.127.23) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-07-23_03:2020-07-23,2020-07-23 signatures=0
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This patch documents the usb-role-switch property in dwc2 bindings, now
that usb-role-switch support is available in dwc2 driver.

Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Signed-off-by: Amelie Delaunay <amelie.delaunay@st.com>
---
New in v2 patchset.
---
 Documentation/devicetree/bindings/usb/dwc2.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/dwc2.yaml b/Documentation/devicetree/bindings/usb/dwc2.yaml
index 9352a8ef60a6..7b226eeffe82 100644
--- a/Documentation/devicetree/bindings/usb/dwc2.yaml
+++ b/Documentation/devicetree/bindings/usb/dwc2.yaml
@@ -100,6 +100,10 @@ properties:
   dr_mode:
     enum: [host, peripheral, otg]
 
+  usb-role-switch:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description: Support role switch.
+
   g-rx-fifo-size:
     $ref: /schemas/types.yaml#/definitions/uint32
     description: size of rx fifo size in gadget mode.
-- 
2.17.1

