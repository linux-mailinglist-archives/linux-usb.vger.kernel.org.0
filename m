Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 255AF1329EB
	for <lists+linux-usb@lfdr.de>; Tue,  7 Jan 2020 16:22:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728329AbgAGPWX (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 7 Jan 2020 10:22:23 -0500
Received: from fllv0015.ext.ti.com ([198.47.19.141]:60832 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727944AbgAGPWW (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 7 Jan 2020 10:22:22 -0500
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 007FMLXg026421;
        Tue, 7 Jan 2020 09:22:21 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1578410541;
        bh=FdGqPjlwscAfgqVd66Y9d/hPy7lkvDyDaY92AbLz2IQ=;
        h=From:To:CC:Subject:Date;
        b=giMQW/cMNhSjp36oJQ6ksVNnHGdrmwGjPWRqz4WnOs0Ax2CWnmk2L677k7EXIpE+q
         bWb2zN7R28PZqTqv8EBbB1TgSaGBoOZV//6J0TOYo+6O04dOqol0snf7owz3qHebi6
         s8LiElaYxyH49CG9kJdgzPqr7eEo1p91C0d1oFB8=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 007FMLie029774;
        Tue, 7 Jan 2020 09:22:21 -0600
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Tue, 7 Jan
 2020 09:22:21 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Tue, 7 Jan 2020 09:22:21 -0600
Received: from uda0271908.dal.design.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 007FMLwl130758;
        Tue, 7 Jan 2020 09:22:21 -0600
From:   Bin Liu <b-liu@ti.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     <linux-usb@vger.kernel.org>, Bin Liu <b-liu@ti.com>
Subject: [PATCH 0/2] musb fixes for v5.5-rc6
Date:   Tue, 7 Jan 2020 09:26:23 -0600
Message-ID: <20200107152625.857-1-b-liu@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Greg,

Here are a couple musb fixes for v5.5-rc6. The DP/DM pullup fix is
applicable to the very first commit which brings in the musb drivers, so
the patch probably should apply to all active stable trees if possible.

Please let me know if any change is needed.

Thanks,
-Bin.
---

Paul Cercueil (1):
  usb: musb: Disable pullup at init

Tony Lindgren (1):
  usb: musb: fix idling for suspend after disconnect interrupt

 drivers/usb/musb/musb_core.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

-- 
2.17.1

