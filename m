Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C4A024A827B
	for <lists+linux-usb@lfdr.de>; Thu,  3 Feb 2022 11:36:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350106AbiBCKgO (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 3 Feb 2022 05:36:14 -0500
Received: from alexa-out.qualcomm.com ([129.46.98.28]:12391 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350066AbiBCKgK (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 3 Feb 2022 05:36:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1643884570; x=1675420570;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=ngqJhiJ5tdkhcY5b0/X08HsrS6YJqNRHbW0yKlAp4sU=;
  b=kuM5ayVEUZGLdLz0+//omhmq9b4mU1GKyfCc3WdkPA1QLl2YWGE7fatc
   yzSQWYSdsoAf95h4fMU9xO/HpoyIWzbtyHZejWdZKCxK/gTGbWqBcfuje
   lm9Eo4RQVBO+qfYWOFdy/l2950VlEEAIFF9QQkbgqHZhHDEMmrb/sH6YP
   8=;
Received: from ironmsg08-lv.qualcomm.com ([10.47.202.152])
  by alexa-out.qualcomm.com with ESMTP; 03 Feb 2022 02:36:09 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg08-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2022 02:36:08 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Thu, 3 Feb 2022 02:36:02 -0800
Received: from blr-ubuntu-525.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Thu, 3 Feb 2022 02:35:58 -0800
From:   Souradeep Chowdhury <quic_schowdhu@quicinc.com>
To:     <linux-arm-msm@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <pure.logic@nexus-software.ie>,
        <bjorn.andersson@linaro.org>, <greg@kroah.com>, <robh@kernel.org>
CC:     <linux-kernel@vger.kernel.org>, <quic_tsoni@quicinc.com>,
        <quic_psodagud@quicinc.com>, <quic_satyap@quicinc.com>,
        <quic_pheragu@quicinc.com>, <quic_rjendra@quicinc.com>,
        <quic_sibis@quicinc.com>, <quic_saipraka@quicinc.com>,
        <quic_schowdhu@quicinc.com>
Subject: [PATCH V5 5/6] arm64: dts: qcom: sc7280: Set the default dr_mode for usb2
Date:   Thu, 3 Feb 2022 16:04:34 +0530
Message-ID: <19f0683c897b4eb73e1c5d6ff3debfffc51050f0.1643880577.git.quic_schowdhu@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1643880577.git.quic_schowdhu@quicinc.com>
References: <cover.1643880577.git.quic_schowdhu@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Set the default dr_mode for usb2 node to "otg" to enable
role-switch for EUD(Embedded USB Debugger) connector node.

Signed-off-by: Souradeep Chowdhury <quic_schowdhu@quicinc.com>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 arch/arm64/boot/dts/qcom/sc7280-idp.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7280-idp.dts b/arch/arm64/boot/dts/qcom/sc7280-idp.dts
index 9b991ba..f40eaa5 100644
--- a/arch/arm64/boot/dts/qcom/sc7280-idp.dts
+++ b/arch/arm64/boot/dts/qcom/sc7280-idp.dts
@@ -61,6 +61,10 @@
 	modem-init;
 };
 
+&usb_2_dwc3 {
+	dr_mode = "otg";
+};
+
 &pmk8350_rtc {
 	status = "okay";
 };
-- 
2.7.4

