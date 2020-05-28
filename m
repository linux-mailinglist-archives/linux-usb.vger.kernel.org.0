Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ABEDE1E6123
	for <lists+linux-usb@lfdr.de>; Thu, 28 May 2020 14:41:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389786AbgE1Mls (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 28 May 2020 08:41:48 -0400
Received: from esa6.microchip.iphmx.com ([216.71.154.253]:17288 "EHLO
        esa6.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389746AbgE1Mls (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 28 May 2020 08:41:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1590669707; x=1622205707;
  h=from:to:cc:subject:date:message-id:mime-version;
  bh=XNVYxOXijcfDaVkxWFEMx1vIj2xuYX4rEfvliHK4rFA=;
  b=sBh+ddEG/JF/UuFC7WDI3KbhuP6GAsv8jhr7Wf6J25z4v6hsJTBowsxZ
   gsCuCYHoveWjGVZTQ3a2Cq9gNkHg6YH/J03XfDe8xzVBU6pus7LGQ/tn/
   p/UQ0/JWBZ0lnMdUK2GoaRdighJK/SE6y4kH0AJjK9z/gHlN5hEGL5tb9
   p/oZjjtzDWtmQa0g3ZTKoaXXj1DSZOEabEaAR6jhv7jIRlHTKMHCqP4g+
   18K501EK/C3AZnj4NhvaOubVDqmD7b1EMeyww9qM5g8LWnRVFqdCnoYDF
   d0dIrdKeBo5fvaUjUMWTxoZL5bwmCLpJUdmUa2Aen55XOsLHPA4T5QYfu
   w==;
IronPort-SDR: uI2h0FcwQkTRcsuI6dEqE7CHSXOcqgY3LoESAKQp1ZVtdS0XzrwoNGWZoWZVeomSQI5wKMSkeV
 B9+Y+AZ6p2nJWnKPFqo7aB5DA4/JT6tvABlCj9G7oWhsS8pWszl7XCgM54vkd8yK3T2Et44fMs
 OKkmtyPjyc22GmyFeL00HGcHbmRWuc5IF9/UuI0OPwdxX2FCvNbl46mOE+kGRS2SO/6DrvQvnq
 tjn7TfQHqYrCofgfFqk1mtGFNKTS8vEqNYKJbSvj6OjaRU32D6rQ3DMJFYaoBiGC6w3H3LwJZ8
 zlI=
X-IronPort-AV: E=Sophos;i="5.73,444,1583218800"; 
   d="scan'208";a="13787893"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 28 May 2020 05:41:46 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 28 May 2020 05:41:46 -0700
Received: from localhost.localdomain (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.1713.5 via Frontend Transport; Thu, 28 May 2020 05:41:45 -0700
From:   Christian Gromm <christian.gromm@microchip.com>
To:     <gregkh@linuxfoundation.org>
CC:     <driverdev-devel@linuxdriverproject.org>,
        <linux-usb@vger.kernel.org>,
        Christian Gromm <christian.gromm@microchip.com>
Subject: [PATCH] staging: most: usb: init return value in default path of switch/case expression
Date:   Thu, 28 May 2020 14:41:43 +0200
Message-ID: <1590669703-20004-1-git-send-email-christian.gromm@microchip.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This patch avoids returning an uninitialized value in the default
path of the switch expression.

Signed-off-by: Christian Gromm <christian.gromm@microchip.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/staging/most/usb/usb.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/staging/most/usb/usb.c b/drivers/staging/most/usb/usb.c
index df5876c..2640c5b 100644
--- a/drivers/staging/most/usb/usb.c
+++ b/drivers/staging/most/usb/usb.c
@@ -215,6 +215,7 @@ static unsigned int get_stream_frame_size(struct device *dev,
 		break;
 	default:
 		dev_warn(dev, "Query frame size of non-streaming channel\n");
+		frame_size = 0;
 		break;
 	}
 	return frame_size;
-- 
2.7.4

