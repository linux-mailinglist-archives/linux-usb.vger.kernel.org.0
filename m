Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7CE65B9005
	for <lists+linux-usb@lfdr.de>; Fri, 20 Sep 2019 14:53:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726646AbfITMxh (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 20 Sep 2019 08:53:37 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:51638 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726635AbfITMxh (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 20 Sep 2019 08:53:37 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 76335611DC; Fri, 20 Sep 2019 12:53:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1568984016;
        bh=6VLpHyiGOFZJyxCD0JkVlmylj7GYadsObC8yfDEfLp4=;
        h=From:To:Cc:Subject:Date:From;
        b=kklqKz6oqHrbj6NueMibwIk0+N2lkSOi/8kdd7WLS/mo7a5caFnBk2xKvUC8BS89i
         C/EZlmSiiXxbp1RuhhMWV5fcyy6vAwYQQo5f5LehzHIFojYJMwIskSQd2Ootiurkc/
         YC2RTtWvXYJbsWWb2ZCYAizfCQPjO71DH/sh9+sU=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from cchiluve-linux.qualcomm.com (blr-c-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: cchiluve@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 0334D611DC;
        Fri, 20 Sep 2019 12:53:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1568984016;
        bh=6VLpHyiGOFZJyxCD0JkVlmylj7GYadsObC8yfDEfLp4=;
        h=From:To:Cc:Subject:Date:From;
        b=kklqKz6oqHrbj6NueMibwIk0+N2lkSOi/8kdd7WLS/mo7a5caFnBk2xKvUC8BS89i
         C/EZlmSiiXxbp1RuhhMWV5fcyy6vAwYQQo5f5LehzHIFojYJMwIskSQd2Ootiurkc/
         YC2RTtWvXYJbsWWb2ZCYAizfCQPjO71DH/sh9+sU=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 0334D611DC
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=cchiluve@codeaurora.org
From:   cchiluve <cchiluve@codeaurora.org>
To:     balbi@kernel.org, agross@kernel.org, david.brown@linaro.org
Cc:     linux-usb@vger.kernel.org, cchiluve <cchiluve@codeaurora.org>
Subject: [PATCH V4 0/3] ADD interconnect support for Qualcomm DWC3 driver 
Date:   Fri, 20 Sep 2019 18:23:14 +0530
Message-Id: <1568983997-20004-1-git-send-email-cchiluve@codeaurora.org>
X-Mailer: git-send-email 1.9.1
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This path series aims to add interconnect support in
dwc3-qcom driver on SDM845 SoCs.

Changes from v3 -> v4
  > Fixed review comments from Matthias
  > [PATCH 1/3] and [PATCH 3/3] remains unchanged

Changes from v2 -> v3
  > Fixed review comments from Matthias and Manu
  > changed the functions prefix from usb_* to dwc3_qcom_*

Changes since V1:
  > Comments by Georgi Djakov on "[PATCH 2/3]" addressed
  > [PATCH 1/3] and [PATCH 3/3] remains unchanged

Chandana Kishori Chiluveru (3):
  dt-bindings: Introduce interconnect properties for Qualcomm DWC3
    driver
  usb: dwc3: qcom: Add interconnect support in dwc3 driver
  arm64: dts: sdm845: Add interconnect properties for USB

 .../devicetree/bindings/usb/qcom,dwc3.txt          |  13 ++
 arch/arm64/boot/dts/qcom/sdm845.dtsi               |  12 ++
 drivers/usb/dwc3/dwc3-qcom.c                       | 145 ++++++++++++++++++++-
 3 files changed, 168 insertions(+), 2 deletions(-)

-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

