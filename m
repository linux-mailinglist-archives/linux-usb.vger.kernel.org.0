Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B6AA822B5A5
	for <lists+linux-usb@lfdr.de>; Thu, 23 Jul 2020 20:28:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726996AbgGWS2K (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 23 Jul 2020 14:28:10 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:46877 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726349AbgGWS2K (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 23 Jul 2020 14:28:10 -0400
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
  by alexa-out.qualcomm.com with ESMTP; 23 Jul 2020 11:28:09 -0700
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/AES256-SHA; 23 Jul 2020 11:28:07 -0700
Received: from c-sanm-linux.qualcomm.com ([10.206.25.31])
  by ironmsg01-blr.qualcomm.com with ESMTP; 23 Jul 2020 23:57:41 +0530
Received: by c-sanm-linux.qualcomm.com (Postfix, from userid 2343233)
        id 810A92C81; Thu, 23 Jul 2020 23:57:40 +0530 (IST)
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
Subject: [PATCH v10 0/2] ADD interconnect support for Qualcomm DWC3 driver
Date:   Thu, 23 Jul 2020 23:57:35 +0530
Message-Id: <1595528857-25357-1-git-send-email-sanm@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This path series aims to add interconnect support in
dwc3-qcom driver on SDM845 and SC7180 SoCs.

Changes from v9 -> v10
  > Removed cooments for enable,disable functions.
  > Handled the enable,disable failure cases as in v8.

Changes from v8 -> v9
  > Addressed comments from Matthias.

Changes from v7 -> v8
  > Only driver change is pending all other patches are merged so dropped
    from the series.
  > Removed the device_is_bound call and getting speed from device tree
    and rearranged interconnect functions to avoid forward declarations.	
  > Added patch to specify maximum speed for dwc3 DT node.

Changes from v6 -> v7
  > [PATCH 2/4] Fixed review comments from Matthias in DWC3 driver.
  > Other patches remain unchanged.

Changes from v5 -> v6
  > [PATCH 1/4] Addressed comments from Rob.
  > [PATCH 2/4] Fixed review comments from Matthias in DWC3 driver.
  > [PATCH 3/4] Ignoring 80 char limit in defining interconnect paths.
  > Added [PATCH 4/4] in this series. Adding interconnect nodes for SC7180.
    Depends on patch https://patchwork.kernel.org/patch/11417989/.	

Changes from v4 -> v5
  > [PATCH 1/3] Added the interconnect properties in yaml. This patch depends
    on series https://patchwork.kernel.org/cover/11372641/.
  > [PATCH 2/3] Fixed review comments from Matthias in DWC3 driver.
  > [PATCH 3/3] Modified as per the new interconnect nodes in sdm845. Depends
    on series https://patchwork.kernel.org/cover/11372211/. 


Changes from v3 -> v4
  > Fixed review comments from Matthias
  > [PATCH 1/3] and [PATCH 3/3] remains unchanged

Changes from v2 -> v3
  > Fixed review comments from Matthias and Manu
  > changed the functions prefix from usb_* to dwc3_qcom_*

Changes since V1:
  > Comments by Georgi Djakov on "[PATCH 2/3]" addressed
  > [PATCH 1/3] and [PATCH 3/3] remains unchanged 


Sandeep Maheswaram (2):
  usb: dwc3: qcom: Add interconnect support in dwc3 driver
  arm64: dts: qcom: sc7180: Add maximum speed property for DWC3 USB node

 arch/arm64/boot/dts/qcom/sc7180.dtsi |   1 +
 drivers/usb/dwc3/dwc3-qcom.c         | 127 ++++++++++++++++++++++++++++++++++-
 2 files changed, 126 insertions(+), 2 deletions(-)

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

