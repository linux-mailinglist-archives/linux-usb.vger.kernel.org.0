Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0554719392C
	for <lists+linux-usb@lfdr.de>; Thu, 26 Mar 2020 08:07:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727636AbgCZHG6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 26 Mar 2020 03:06:58 -0400
Received: from alexa-out-blr-02.qualcomm.com ([103.229.18.198]:9267 "EHLO
        alexa-out-blr-02.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726210AbgCZHG6 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 26 Mar 2020 03:06:58 -0400
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by alexa-out-blr-02.qualcomm.com with ESMTP/TLS/AES256-SHA; 26 Mar 2020 12:36:55 +0530
Received: from c-sanm-linux.qualcomm.com ([10.206.25.31])
  by ironmsg01-blr.qualcomm.com with ESMTP; 26 Mar 2020 12:36:28 +0530
Received: by c-sanm-linux.qualcomm.com (Postfix, from userid 2343233)
        id 4FEDF19BD; Thu, 26 Mar 2020 12:36:27 +0530 (IST)
From:   Sandeep Maheswaram <sanm@codeaurora.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Felipe Balbi <balbi@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Doug Anderson <dianders@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Manu Gautam <mgautam@codeaurora.org>,
        Sandeep Maheswaram <sanm@codeaurora.org>
Subject: [PATCH v5 0/2] Add USB DWC3 support for SC7180 
Date:   Thu, 26 Mar 2020 12:36:06 +0530
Message-Id: <1585206368-685-1-git-send-email-sanm@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Converting dt binding to yaml.
Adding compatible for SC7180 in dt bindings.

Changes in v5:
Addressed the comments from Stephen in yaml file.

Changes in v4:
Addressed the comments from Doug in yaml file.

Changes in v3:
Dropped the patch for adding the compatible in dwc3 driver from the series.
Addressed the comments from Doug in yaml file.

Changes in v2:
Sorted the compatible in dwc3 driver.
Converted dt binding to yaml.
Added compatible in yaml.

Sandeep Maheswaram (2):
  dt-bindings: usb: qcom,dwc3: Convert USB DWC3 bindings
  dt-bindings: usb: qcom,dwc3: Add compatible for SC7180

 .../devicetree/bindings/usb/qcom,dwc3.txt          | 104 --------------
 .../devicetree/bindings/usb/qcom,dwc3.yaml         | 159 +++++++++++++++++++++
 2 files changed, 159 insertions(+), 104 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/usb/qcom,dwc3.txt
 create mode 100644 Documentation/devicetree/bindings/usb/qcom,dwc3.yaml

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

