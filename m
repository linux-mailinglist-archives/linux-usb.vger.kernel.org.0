Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2AE8C1E3D37
	for <lists+linux-usb@lfdr.de>; Wed, 27 May 2020 11:06:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388512AbgE0JGm (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 27 May 2020 05:06:42 -0400
Received: from esa4.microchip.iphmx.com ([68.232.154.123]:2344 "EHLO
        esa4.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388508AbgE0JGm (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 27 May 2020 05:06:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1590570401; x=1622106401;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=DOpb3K0aIjX1Jxk/hBoXZvrpF80ZSQ9sxNZGXH4xfe8=;
  b=rB8gazjg/TaP51dYd3+GDZfYcQWk5JqykCLWnmm3wmBLR/N11vQCE7kE
   T6E8gubU4Efa+uvlg2smi1pMnOKhNk90EQtbsGApYX51hU3Mr5l5Rw4GT
   eC+ayik4WUWszcMy2xRtzdjPH3nYvH0z0zNaIok1zW35+hJHiKGjelpPi
   zMxyTc24qwx+QrkzwpC0BVZCsrKpvOIxQpgpkYRzFeRoi9x3L/sbHQrso
   swq2A3CWiCmG4IfCOJ1mLLSW4DlXXsByiejp5yEfCvv2OPDG4jzH5Ze+J
   6k3mPGL24Fh4nfj7Yb1vJ2Bpx4Z8P7hV8F88Ui5tRPazxy2DfKCk73a7S
   g==;
IronPort-SDR: 83eZVGeqgznz8y55BfM+32M3oGIH+gDGjXDMTW8VwEiiq6G/0eIQX+rCaVScW70ceN/6YUELn9
 eJikdtuRfVYX8kEW4+qP/53LA7tY2oWCJn5bgs691W0qlKfY7GQnQphQUOCFAMVluQ3vRJd3N7
 urg+JQJX8R2QMnTpExlqTUPlTpzMmZUmpYAz40NyN52yLDihDIfoHdUzdDFNkIG2VW1BgmFm0K
 1HUTftr5C2YWxkN+fE9h8PtPnhyLNF73vr5mHyfZry4qXTrKAEjIZ+5zLnXdgaaNNpg8MagM09
 dG0=
X-IronPort-AV: E=Sophos;i="5.73,440,1583218800"; 
   d="scan'208";a="74590234"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 27 May 2020 02:06:41 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 27 May 2020 02:06:34 -0700
Received: from localhost.localdomain (10.10.115.15) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.1713.5 via Frontend Transport; Wed, 27 May 2020 02:06:40 -0700
From:   Christian Gromm <christian.gromm@microchip.com>
To:     <gregkh@linuxfoundation.org>
CC:     <driverdev-devel@linuxdriverproject.org>,
        <linux-usb@vger.kernel.org>,
        Christian Gromm <christian.gromm@microchip.com>
Subject: [PATCH 08/10] staging: most: usb: use correct error codes
Date:   Wed, 27 May 2020 11:06:25 +0200
Message-ID: <1590570387-27069-9-git-send-email-christian.gromm@microchip.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1590570387-27069-1-git-send-email-christian.gromm@microchip.com>
References: <1590570387-27069-1-git-send-email-christian.gromm@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This patch uses the -EINVAL return code where -EFAULT is wrongly being
used.

Signed-off-by: Christian Gromm <christian.gromm@microchip.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/staging/most/usb/usb.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/most/usb/usb.c b/drivers/staging/most/usb/usb.c
index 468aabf..3575a40 100644
--- a/drivers/staging/most/usb/usb.c
+++ b/drivers/staging/most/usb/usb.c
@@ -813,7 +813,7 @@ static int get_stat_reg_addr(const struct regs *regs, int size,
 			return 0;
 		}
 	}
-	return -EFAULT;
+	return -EINVAL;
 }
 
 #define get_static_reg_addr(regs, name, reg_addr) \
@@ -835,7 +835,7 @@ static ssize_t value_show(struct device *dev, struct device_attribute *attr,
 		reg_addr = dci_obj->reg_addr;
 	else if (get_static_reg_addr(ro_regs, name, &reg_addr) &&
 		 get_static_reg_addr(rw_regs, name, &reg_addr))
-		return -EFAULT;
+		return -EINVAL;
 
 	err = drci_rd_reg(dci_obj->usb_device, reg_addr, &val);
 	if (err < 0)
@@ -870,7 +870,7 @@ static ssize_t value_store(struct device *dev, struct device_attribute *attr,
 	else if (!get_static_reg_addr(rw_regs, name, &reg_addr))
 		err = drci_wr_reg(usb_dev, reg_addr, val);
 	else
-		return -EFAULT;
+		return -EINVAL;
 
 	if (err < 0)
 		return err;
-- 
2.7.4

