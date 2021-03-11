Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A30BF336ADE
	for <lists+linux-usb@lfdr.de>; Thu, 11 Mar 2021 04:44:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231138AbhCKDnh (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 10 Mar 2021 22:43:37 -0500
Received: from smtprelay-out1.synopsys.com ([149.117.87.133]:50224 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230451AbhCKDnL (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 10 Mar 2021 22:43:11 -0500
Received: from mailhost.synopsys.com (sv2-mailhost1.synopsys.com [10.205.2.133])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 84524C0A41;
        Thu, 11 Mar 2021 03:43:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1615434191; bh=PxYPRyGX1yaXN3zcvxxCDEdYJq7tfVqer9tCBgnO01A=;
        h=Date:In-Reply-To:References:From:Subject:To:From;
        b=HCzqXbxW/Jcj4F3FRY105b6Nn/Xq9aqT15KlnKzp6HYTCq4AcmJnjTI6ScLlRAlzn
         +O2dnT90ZtXc24X1bZicpVgO5GxiNKLvtFxrmHV6aistO3P63JXiSD7zUJ1uzLyZ5l
         PTwLtfLoG0Po+5g8jhViz/sCxVchSHW0aMrnp2xqSeu8QWRGNh6ubCKNikqurgxehU
         lJ5U7WTXPmT80tFxmofDiHZVZU5gkP69RyUc2mQGmwhh16acwCz2bKdxpawrbN/y9j
         jqlbVxf8jcl2jEW3qA2i1ePRVezOiEQgXEWX6XBJCMqqQkree+I8KnNVIExjFGPeFi
         Pm375DsO1zxew==
Received: from lab-vbox (unknown [10.205.137.201])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id A3127A0096;
        Thu, 11 Mar 2021 03:43:08 +0000 (UTC)
Received: by lab-vbox (sSMTP sendmail emulation); Wed, 10 Mar 2021 19:43:07 -0800
Date:   Wed, 10 Mar 2021 19:43:07 -0800
Message-Id: <80a3214592b30da6ca95bb87984f2a9779de0b14.1615432770.git.Thinh.Nguyen@synopsys.com>
In-Reply-To: <cover.1615432770.git.Thinh.Nguyen@synopsys.com>
References: <cover.1615432770.git.Thinh.Nguyen@synopsys.com>
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [PATCH v3 4/8] usb: core: sysfs: Check for SSP rate in speed attr
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh.Nguyen@synopsys.com, linux-usb@vger.kernel.org,
        Alan Stern <stern@rowland.harvard.edu>,
        Rikard Falkeborn <rikard.falkeborn@gmail.com>,
        Zeng Tao <prime.zeng@hisilicon.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Check for usb_device->ssp_rate to output the signaling rate for genXxY.

Signed-off-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
---
 Changes in v3:
 - None
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

