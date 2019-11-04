Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EEA1CEDDA4
	for <lists+linux-usb@lfdr.de>; Mon,  4 Nov 2019 12:22:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728731AbfKDLV6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 4 Nov 2019 06:21:58 -0500
Received: from szxga07-in.huawei.com ([45.249.212.35]:48072 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726364AbfKDLV5 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 4 Nov 2019 06:21:57 -0500
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.60])
        by Forcepoint Email with ESMTP id 9FE3BD46CE388845323F;
        Mon,  4 Nov 2019 19:21:55 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 DGGEMS404-HUB.china.huawei.com (10.3.19.204) with Microsoft SMTP Server id
 14.3.439.0; Mon, 4 Nov 2019 19:21:47 +0800
From:   Mao Wenan <maowenan@huawei.com>
To:     <felipe.balbi@linux.intel.com>, <gregkh@linuxfoundation.org>,
        <treding@nvidia.com>, <nkristam@nvidia.com>, <arnd@arndb.de>,
        <johan@kernel.org>, <maowenan@huawei.com>, <krzk@kernel.org>
CC:     <linux-usb@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <kernel-janitors@vger.kernel.org>
Subject: [PATCH v2 -next] usb: gadget: Add dependency for USB_TEGRA_XUDC
Date:   Mon, 4 Nov 2019 19:21:04 +0800
Message-ID: <20191104112104.195329-1-maowenan@huawei.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <51315499-99d0-eca3-a7df-b8dd84628bbd@huawei.com>
References: <51315499-99d0-eca3-a7df-b8dd84628bbd@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.113.25]
X-CFilter-Loop: Reflected
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

If CONFIG_USB_TEGRA_XUDC=y and CONFIG_USB_ROLE_SWITCH=m,
below erros can be seen:
drivers/usb/gadget/udc/tegra-xudc.o: In function `tegra_xudc_remove':
tegra-xudc.c:(.text+0x6b0): undefined reference to `usb_role_switch_unregister'
drivers/usb/gadget/udc/tegra-xudc.o: In function `tegra_xudc_probe':
tegra-xudc.c:(.text+0x1b88): undefined reference to `usb_role_switch_register'
drivers/usb/gadget/udc/tegra-xudc.o: In function `tegra_xudc_usb_role_sw_work':
tegra-xudc.c:(.text+0x5ecc): undefined reference to `usb_role_switch_get_role'

It should select USB_ROLE_SWITCH for UDC driver.

Fixes: 49db427232fe ("usb: gadget: Add UDC driver for tegra XUSB device mode controller")
Signed-off-by: Mao Wenan <maowenan@huawei.com>
---
 v2: change 'depends on' to 'select'.
 drivers/usb/gadget/udc/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/gadget/udc/Kconfig b/drivers/usb/gadget/udc/Kconfig
index acaec3a..d103154 100644
--- a/drivers/usb/gadget/udc/Kconfig
+++ b/drivers/usb/gadget/udc/Kconfig
@@ -445,6 +445,7 @@ config USB_TEGRA_XUDC
 	tristate "NVIDIA Tegra Superspeed USB 3.0 Device Controller"
 	depends on ARCH_TEGRA || COMPILE_TEST
 	depends on PHY_TEGRA_XUSB
+	select USB_ROLE_SWITCH
 	help
 	 Enables NVIDIA Tegra USB 3.0 device mode controller driver.
 
-- 
2.7.4

