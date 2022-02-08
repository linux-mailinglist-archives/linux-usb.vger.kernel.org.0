Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 630AF4AE00E
	for <lists+linux-usb@lfdr.de>; Tue,  8 Feb 2022 18:57:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1384521AbiBHRzt (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 8 Feb 2022 12:55:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40034 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1384447AbiBHRzY (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 8 Feb 2022 12:55:24 -0500
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com [199.106.114.38])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6580EC0612BE;
        Tue,  8 Feb 2022 09:55:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1644342921; x=1675878921;
  h=from:to:cc:subject:date:message-id:mime-version;
  bh=M8Ph0nKuasgGHKK44tGOaFhAl2INEWkBhz/A/3gubL4=;
  b=MGxRKGqjAZTXYBXqxseIMMl0J/Jzr3gXzChFnp7UeN2BI9nYGI3rjCTy
   wRz1MTW6xrux6LAasOL307vFkaQFdmGscDgzouw6IBOpfc/6fS/OlP0QC
   DPdOvYl8NTdyMceblRyPT9cm0HPaw2JES4d3GSMr37Cd/PDkLODAhW6FB
   Q=;
Received: from unknown (HELO ironmsg01-sd.qualcomm.com) ([10.53.140.141])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 08 Feb 2022 09:55:20 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg01-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2022 09:55:19 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Tue, 8 Feb 2022 09:55:19 -0800
Received: from blr-ubuntu-525.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Tue, 8 Feb 2022 09:55:14 -0800
From:   Souradeep Chowdhury <quic_schowdhu@quicinc.com>
To:     <linux-arm-msm@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <pure.logic@nexus-software.ie>,
        <bjorn.andersson@linaro.org>, <greg@kroah.com>, <robh@kernel.org>
CC:     <linux-kernel@vger.kernel.org>, <quic_tsoni@quicinc.com>,
        <quic_psodagud@quicinc.com>, <quic_satyap@quicinc.com>,
        <quic_pheragu@quicinc.com>, <quic_rjendra@quicinc.com>,
        <quic_sibis@quicinc.com>, <quic_saipraka@quicinc.com>,
        <quic_schowdhu@quicinc.com>
Subject: [PATCH V6 0/6] Add Embedded USB Debugger (EUD) driver
Date:   Tue, 8 Feb 2022 23:24:23 +0530
Message-ID: <cover.1644339918.git.quic_schowdhu@quicinc.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This is a series of patches that implements a driver for the control
peripheral, EUD (Embedded USB Debugger). The EUD is a mini-USB hub
implemented on chip to support the USB-based debug and trace capabilities.
Apart from debug capabilities, EUD has a control peripheral. Control
Peripheral is on when EUD is on and gets signals like USB attach, pet
EUD etc. EUD driver listens to events like USB attach or detach and then
informs the USB about these events via ROLE-SWITCH. At regular intervals,
the EUD driver receives an interrupt to pet the driver indicating that
the software is functional.

Changes in V6

* Added the review tags from V5 and moved qcom_eud.c to drivers/usb/misc.

Changes in V5

* Added the review tags and implemented comments on V4 of the patch.

Changes in V4

* Aligned the device tree node structure of EUD as per discussion.

* Changes to usb-connector.yaml is no longer required and is not 
  included in the patch series.
  
* Implemented the rest of the comments on Version 3 of the patch.  

Changes in V3

* Removed the patch for registration of EUD connector as it is no longer
  required.
  
* Added the description to include EUD in usb-connector.yaml  

* Implemented comments on V2 of the patch.

Changes in V2

* Fixed the yaml issue and also implemented comments on yaml in V1.

Changes in V1

* EUD has now been mapped as a separate DT node as it is an independent QCOM IP.

* EUD is attached to the connector child of dwc3 via port end point since EUD
  driver needs the connector for role-switching.

* EUD driver has been moved now to drivers/soc/qcom/qcom_eud.c.

* All the comments from version 0 of the patch has been implemented.


Souradeep Chowdhury (6):
  dt-bindings: Add the yaml bindings for EUD
  bindings: usb: dwc3: Update dwc3 properties for EUD connector
  usb: misc: eud: Add driver support for Embedded USB Debugger(EUD)
  arm64: dts: qcom: sc7280: Add EUD dt node and dwc3 connector
  arm64: dts: qcom: sc7280: Set the default dr_mode for usb2
  MAINTAINERS: Add maintainer entry for EUD

 Documentation/ABI/testing/sysfs-driver-eud         |   9 +
 .../devicetree/bindings/soc/qcom/qcom,eud.yaml     |  77 +++++++
 .../devicetree/bindings/usb/snps,dwc3.yaml         |   6 +
 MAINTAINERS                                        |   8 +
 arch/arm64/boot/dts/qcom/sc7280-idp.dts            |   4 +
 arch/arm64/boot/dts/qcom/sc7280.dtsi               |  36 +++
 drivers/usb/misc/Kconfig                           |  10 +
 drivers/usb/misc/Makefile                          |   1 +
 drivers/usb/misc/qcom_eud.c                        | 251 +++++++++++++++++++++
 9 files changed, 402 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-driver-eud
 create mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml
 create mode 100644 drivers/usb/misc/qcom_eud.c

-- 
2.7.4

