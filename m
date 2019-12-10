Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D57C2118E42
	for <lists+linux-usb@lfdr.de>; Tue, 10 Dec 2019 17:55:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727590AbfLJQza (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 10 Dec 2019 11:55:30 -0500
Received: from lelv0142.ext.ti.com ([198.47.23.249]:49648 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727541AbfLJQz3 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 10 Dec 2019 11:55:29 -0500
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id xBAGtS3p021249;
        Tue, 10 Dec 2019 10:55:28 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1575996928;
        bh=n7bWpTtUNGULyAuIrBTsF52K4yyT7sT54IS8E5MilTY=;
        h=From:To:CC:Subject:Date;
        b=QkDpdlx+2pIRorssFf1iU6TnjGFOPrsftYzFlx0KImsYuKuwIRxayKjtWwjh1ZbCt
         YjiUUnFTyosZ6euBYvqpnCZf1fkC5h2xssT+vnvDWeAaiR6tidXJQ32Lo1uL9iPRkf
         TTCYhyM4zxthkwuFG4MyiYeMLWKvrDHYsy1sM5Po=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xBAGtSvR073659
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 10 Dec 2019 10:55:28 -0600
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Tue, 10
 Dec 2019 10:55:28 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Tue, 10 Dec 2019 10:55:28 -0600
Received: from uda0271908.dal.design.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id xBAGtSPE006664;
        Tue, 10 Dec 2019 10:55:28 -0600
From:   Bin Liu <b-liu@ti.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     <linux-usb@vger.kernel.org>
Subject: [PATCH 0/2] musb fixes for v5.5-rc2
Date:   Tue, 10 Dec 2019 10:54:52 -0600
Message-ID: <20191210165454.13772-1-b-liu@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Greg,

Here are couple patches for musb fixes for v5.5 -rc. Please let me know
if any change is needed.

Regards,
-Bin.
---

Jia-Ju Bai (1):
  usb: musb: Fix a possible null-pointer dereference in
    musb_handle_intr_connect()

Mans Rullgard (1):
  usb: musb: sunxi: propagate devicetree node to glue pdev

 drivers/usb/musb/musb_core.c | 3 ++-
 drivers/usb/musb/sunxi.c     | 2 ++
 2 files changed, 4 insertions(+), 1 deletion(-)

-- 
2.17.1

