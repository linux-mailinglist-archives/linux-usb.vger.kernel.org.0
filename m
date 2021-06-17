Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2A61A3AB0B2
	for <lists+linux-usb@lfdr.de>; Thu, 17 Jun 2021 11:58:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232186AbhFQKBA (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 17 Jun 2021 06:01:00 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:38426 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232137AbhFQKAr (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 17 Jun 2021 06:00:47 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1623923920; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=zoPvpNKKvCWJMyO+xPVnOtlCzZjE3qdxV7UQ46n46gY=; b=lXV2XKUXJIshedL/s4tnpwIezfveXkAGmu29jGuNnZdS7EnmaM7Vqri/HwE2GLiCdBuHVbz4
 Bv/5RIoxGmjOv0iPA4lujqo99im213cUrzpcu6YVMACRVxnG4vetvKvMYPC3l8AyJ1QFEGjq
 pi0ddpHMVUvG/3t/j7k/1nho3xI=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyIxZTE2YSIsICJsaW51eC11c2JAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-west-2.postgun.com with SMTP id
 60cb1cc5b6ccaab753d3bb4d (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 17 Jun 2021 09:58:29
 GMT
Sender: wcheng=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 8E9DBC433F1; Thu, 17 Jun 2021 09:58:29 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from wcheng-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: wcheng)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id B7309C433F1;
        Thu, 17 Jun 2021 09:58:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org B7309C433F1
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=wcheng@codeaurora.org
From:   Wesley Cheng <wcheng@codeaurora.org>
To:     balbi@kernel.org, gregkh@linuxfoundation.org, robh+dt@kernel.org,
        agross@kernel.org, bjorn.andersson@linaro.org,
        frowand.list@gmail.com
Cc:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        jackp@codeaurora.org, fntoth@gmail.com,
        heikki.krogerus@linux.intel.com, andy.shevchenko@gmail.com,
        Wesley Cheng <wcheng@codeaurora.org>
Subject: [PATCH v10 4/6] of: Add stub for of_add_property()
Date:   Thu, 17 Jun 2021 02:58:17 -0700
Message-Id: <1623923899-16759-5-git-send-email-wcheng@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1623923899-16759-1-git-send-email-wcheng@codeaurora.org>
References: <1623923899-16759-1-git-send-email-wcheng@codeaurora.org>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

If building with OF Kconfig disabled, this can lead to errors for
drivers utilizing of_add_property().  Add a stub for the add API, as
it exists for the remove variant as well, and to avoid compliation
issues.

Signed-off-by: Wesley Cheng <wcheng@codeaurora.org>
---
 include/linux/of.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/include/linux/of.h b/include/linux/of.h
index d8db8d3..abd39a4 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -946,6 +946,11 @@ static inline int of_machine_is_compatible(const char *compat)
 	return 0;
 }
 
+static inline int of_add_property(struct device_node *np, struct property *prop)
+{
+	return 0;
+}
+
 static inline int of_remove_property(struct device_node *np, struct property *prop)
 {
 	return 0;
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

