Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3060FEE2DD
	for <lists+linux-usb@lfdr.de>; Mon,  4 Nov 2019 15:49:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728377AbfKDOtv (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 4 Nov 2019 09:49:51 -0500
Received: from szxga07-in.huawei.com ([45.249.212.35]:45516 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727838AbfKDOtv (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 4 Nov 2019 09:49:51 -0500
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.59])
        by Forcepoint Email with ESMTP id D3A30EF446FB53AE27A1;
        Mon,  4 Nov 2019 22:49:43 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 DGGEMS401-HUB.china.huawei.com (10.3.19.201) with Microsoft SMTP Server id
 14.3.439.0; Mon, 4 Nov 2019 22:49:35 +0800
From:   Mao Wenan <maowenan@huawei.com>
To:     <gregkh@linuxfoundation.org>, <heikki.krogerus@linux.intel.com>,
        <maowenan@huawei.com>
CC:     <linux-usb@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <kernel-janitors@vger.kernel.org>
Subject: [PATCH -next] usb: roles: Hide option USB_ROLE_SWITCH
Date:   Mon, 4 Nov 2019 22:48:50 +0800
Message-ID: <20191104144850.91305-1-maowenan@huawei.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191104135312.GD996639@ulmo>
References: <20191104135312.GD996639@ulmo>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.113.25]
X-CFilter-Loop: Reflected
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The USB role switch class is, after all,
not useful by itself. Hiding USB_ROLE_SWITCH
so we can avoid any of the pitfalls associated
with user-visible symbols and "select".

Signed-off-by: Mao Wenan <maowenan@huawei.com>
---
 drivers/usb/roles/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/roles/Kconfig b/drivers/usb/roles/Kconfig
index f8b31aa..1da58d4 100644
--- a/drivers/usb/roles/Kconfig
+++ b/drivers/usb/roles/Kconfig
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 
 config USB_ROLE_SWITCH
-	tristate "USB Role Switch Support"
+	tristate
 	help
 	  USB Role Switch is a device that can select the USB role - host or
 	  device - for a USB port (connector). In most cases dual-role capable
-- 
2.7.4

