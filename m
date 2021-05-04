Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E6C037264E
	for <lists+linux-usb@lfdr.de>; Tue,  4 May 2021 09:09:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229916AbhEDHKf (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 4 May 2021 03:10:35 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:49311 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229848AbhEDHKe (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 4 May 2021 03:10:34 -0400
Received: from ironmsg07-lv.qualcomm.com ([10.47.202.151])
  by alexa-out.qualcomm.com with ESMTP; 04 May 2021 00:09:40 -0700
X-QCInternal: smtphost
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by ironmsg07-lv.qualcomm.com with ESMTP/TLS/AES256-SHA; 04 May 2021 00:09:36 -0700
X-QCInternal: smtphost
Received: from c-sanm-linux.qualcomm.com ([10.206.25.31])
  by ironmsg01-blr.qualcomm.com with ESMTP; 04 May 2021 12:39:03 +0530
Received: by c-sanm-linux.qualcomm.com (Postfix, from userid 2343233)
        id 8CF963671; Tue,  4 May 2021 12:39:02 +0530 (IST)
From:   Sandeep Maheswaram <sanm@codeaurora.org>
To:     Rob Herring <robh+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Doug Anderson <dianders@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>
Cc:     devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Manu Gautam <mgautam@codeaurora.org>,
        Sandeep Maheswaram <sanm@codeaurora.org>
Subject: [PATCH v3 0/2] Add DT bindings and DT nodes for USB in SC7280
Date:   Tue,  4 May 2021 12:38:53 +0530
Message-Id: <1620112135-1388-1-git-send-email-sanm@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This series includes usb controller and phy binding updates
for SC7280 SoC and DT chnages for SC7280 SoC and SC7280 IDP board.

changes in v3:
  Moved the board specific changes to separate patch.
  Addressed comments from Matthias in v2.

changes in v2:
  Dropped dt bindings patches as they are already merged in linux-next.
  Addressed comments from Matthias in v1.

Sandeep Maheswaram (2):
  arm64: dts: qcom: sc7280: Add USB related nodes
  arm64: dts: qcom: sc7280: Add USB nodes for IDP board

 arch/arm64/boot/dts/qcom/sc7280-idp.dts |  39 +++++++++
 arch/arm64/boot/dts/qcom/sc7280.dtsi    | 149 ++++++++++++++++++++++++++++++++
 2 files changed, 188 insertions(+)

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

