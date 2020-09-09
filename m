Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F40D262C09
	for <lists+linux-usb@lfdr.de>; Wed,  9 Sep 2020 11:36:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730184AbgIIJg0 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 9 Sep 2020 05:36:26 -0400
Received: from mx07-00178001.pphosted.com ([185.132.182.106]:58756 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729912AbgIIJfi (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 9 Sep 2020 05:35:38 -0400
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 0899WagC011169;
        Wed, 9 Sep 2020 11:35:20 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=s219bebDsKh1L2vM/1ayxJLzmLx96sr1VIGMZeYyaqg=;
 b=Wyl2+qVUL1ic0S0ClwNcFUaQZDySPG6x1GZ35qKPJ9aK9Zf5K+IsO2bI/9hz4LpMIM0W
 XR+vye8ttOF8iFN/teAXPvwhnYqkPP/zXLgiGCX4l2BSOqNMpy/h1rt1x9HtKqNq0ij+
 NnOhGvLdAgmm9CPmkIHKGKprS4cVLpNfO/K4pQG6p+93sv9hCxqszpeZ5CPMDl4Vh9va
 0cT8m0RtIsPVN6sMBHfPzm5j0mlHB/A5ax0Thk1bKkeTAw/z4/nPIw48OrxsIaYzmbBj
 M09ajOa57KCTm8DzSzIm3N9tA1wDQnxdWOBrsXnWoRUhizVDRfGEj4dMfoB7q8o2t1Ob xQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 33c0euv558-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 09 Sep 2020 11:35:20 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 53D20100034;
        Wed,  9 Sep 2020 11:35:20 +0200 (CEST)
Received: from Webmail-eu.st.com (gpxdag3node5.st.com [10.75.127.72])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 3D683220AE9;
        Wed,  9 Sep 2020 11:35:20 +0200 (CEST)
Received: from localhost (10.75.127.46) by GPXDAG3NODE5.st.com (10.75.127.72)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 9 Sep 2020 11:35:19
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
Subject: [PATCH v6 1/3] dt-bindings: usb: dwc2: add optional usb-role-switch property
Date:   Wed, 9 Sep 2020 11:35:09 +0200
Message-ID: <20200909093511.4728-2-amelie.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200909093511.4728-1-amelie.delaunay@st.com>
References: <20200909093511.4728-1-amelie.delaunay@st.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG8NODE2.st.com (10.75.127.23) To GPXDAG3NODE5.st.com
 (10.75.127.72)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-09-09_03:2020-09-08,2020-09-09 signatures=0
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This patch documents the usb-role-switch property in dwc2 bindings, now
that usb-role-switch support is available in dwc2 driver.

Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Amelie Delaunay <amelie.delaunay@st.com>
---
 Documentation/devicetree/bindings/usb/dwc2.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/dwc2.yaml b/Documentation/devicetree/bindings/usb/dwc2.yaml
index ffa157a0fce7..fa6612551d08 100644
--- a/Documentation/devicetree/bindings/usb/dwc2.yaml
+++ b/Documentation/devicetree/bindings/usb/dwc2.yaml
@@ -102,6 +102,10 @@ properties:
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

