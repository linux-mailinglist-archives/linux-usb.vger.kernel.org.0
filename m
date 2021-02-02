Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B6E9F30B5FC
	for <lists+linux-usb@lfdr.de>; Tue,  2 Feb 2021 04:44:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231494AbhBBDno (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 1 Feb 2021 22:43:44 -0500
Received: from smtprelay-out1.synopsys.com ([149.117.87.133]:36126 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231499AbhBBDnl (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 1 Feb 2021 22:43:41 -0500
Received: from mailhost.synopsys.com (sv2-mailhost2.synopsys.com [10.205.2.134])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 751D0C00AD;
        Tue,  2 Feb 2021 03:42:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1612237361; bh=/tJ4gnxIjgpZJsUeNq4anpHVmMdZnR757wfhgVFnI1Y=;
        h=Date:In-Reply-To:References:From:Subject:To:From;
        b=l7QHrkSU50Zak0g1NkAT+Yc9VcX+8tXqkjM/0+nT6yG7QY17Kx9jz2udyEh/cjSv6
         0M9FZRmvMCFCpfRCKIpb1trCeXTQuQHlalrZSaLlUw7S7VtScvAgMJ7GW0AT0qhqPN
         m81rXkePD63Rw6nRRUEhsVHw8z/pTOxnpzIbHKSkXNE+PhqJTxTyMTJMJ4paqXuAzE
         DDQq6IYw4Mp0VpN+G2QYak/VYoH+uAqzIdeSFhFtbqkVK7fnRFbP7Ay/eDguCgqSqd
         F1qvxBhyWVwFMJQ/st0seNDh1IZT1LSaMc4cLsDE+nX1oYtSlcQAsrmEUHbVolLF3+
         ruOQq31v2Km3w==
Received: from te-lab16 (unknown [10.10.52.11])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id 69E59A0099;
        Tue,  2 Feb 2021 03:42:39 +0000 (UTC)
Received: by te-lab16 (sSMTP sendmail emulation); Mon, 01 Feb 2021 19:42:39 -0800
Date:   Mon, 01 Feb 2021 19:42:39 -0800
Message-Id: <6e416aa293fb10160767f0086daa842739c0e7de.1612237179.git.Thinh.Nguyen@synopsys.com>
In-Reply-To: <cover.1612237179.git.Thinh.Nguyen@synopsys.com>
References: <cover.1612237179.git.Thinh.Nguyen@synopsys.com>
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [RFC PATCH 4/8] usb: core: sysfs: Check for SSP rate in speed attr
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

