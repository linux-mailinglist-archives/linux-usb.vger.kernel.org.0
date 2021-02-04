Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1D5E030EB75
	for <lists+linux-usb@lfdr.de>; Thu,  4 Feb 2021 05:12:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231754AbhBDEMA (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 3 Feb 2021 23:12:00 -0500
Received: from smtprelay-out1.synopsys.com ([149.117.73.133]:43680 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231301AbhBDEL6 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 3 Feb 2021 23:11:58 -0500
Received: from mailhost.synopsys.com (sv1-mailhost1.synopsys.com [10.205.2.131])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 1270740874;
        Thu,  4 Feb 2021 04:10:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1612411858; bh=P9lIQs3Ay7/F/hPW3fAnngcNFmkpC0uUNQuTvgyIUtg=;
        h=Date:In-Reply-To:References:From:Subject:To:From;
        b=eDwVHWSnglwtxwlQVMKU+X8YbSW4cu2tVy1Az5VzlDd6H+a1dVjbAYRybGlmXBbDj
         yQxcCp/TmKfT27zCxYZwNraAtd57rmenpmWjp49edkIk7I360DYzAYh7MtnU8yYHGF
         xAM7rLFs1/bxRQkac0DgAs6wlEwStGsLgeXbhy0dnoQ7VLqzcsmUy9u90IbqjfYhv2
         aqIhplxKfliHIiZN0eTOqjDZ6H8WQdqYh2WebmLtzNY3KmKJBhhlQsOEkOP6Mk0+uw
         q4If2xubTv1p4/Wj7rWw9t+4J8VEElBSIYSkGlOB1oZJ9p0xDNWr8JxkJTmKf70qYv
         94vZ7Yics1NKA==
Received: from te-lab16 (unknown [10.10.52.11])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id 6CCCAA0068;
        Thu,  4 Feb 2021 04:10:56 +0000 (UTC)
Received: by te-lab16 (sSMTP sendmail emulation); Wed, 03 Feb 2021 20:10:56 -0800
Date:   Wed, 03 Feb 2021 20:10:56 -0800
Message-Id: <89cf8d6224e201356433ea3d8332dd4ad0addb49.1612410491.git.Thinh.Nguyen@synopsys.com>
In-Reply-To: <cover.1612410491.git.Thinh.Nguyen@synopsys.com>
References: <cover.1612410491.git.Thinh.Nguyen@synopsys.com>
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [PATCH v2 4/8] usb: core: sysfs: Check for SSP rate in speed attr
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh.Nguyen@synopsys.com, linux-usb@vger.kernel.org,
        chenqiwu <chenqiwu@xiaomi.com>,
        Alan Stern <stern@rowland.harvard.edu>,
        Rikard Falkeborn <rikard.falkeborn@gmail.com>,
        Zeng Tao <prime.zeng@hisilicon.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Check for usb_device->ssp_rate to output the signaling rate for genXxY.

Signed-off-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
---
 Changes in v2:
 - None

 drivers/usb/core/sysfs.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/core/sysfs.c b/drivers/usb/core/sysfs.c
index d85699bee671..5a168ba9fc51 100644
--- a/drivers/usb/core/sysfs.c
+++ b/drivers/usb/core/sysfs.c
@@ -167,7 +167,10 @@ static ssize_t speed_show(struct device *dev, struct device_attribute *attr,
 		speed = "5000";
 		break;
 	case USB_SPEED_SUPER_PLUS:
-		speed = "10000";
+		if (udev->ssp_rate == USB_SSP_GEN_2x2)
+			speed = "20000";
+		else
+			speed = "10000";
 		break;
 	default:
 		speed = "unknown";
-- 
2.28.0

