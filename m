Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D3762359992
	for <lists+linux-usb@lfdr.de>; Fri,  9 Apr 2021 11:43:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232996AbhDIJnk (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 9 Apr 2021 05:43:40 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:16873 "EHLO
        szxga06-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232855AbhDIJnh (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 9 Apr 2021 05:43:37 -0400
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.59])
        by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4FGtSG21N4zlWyJ;
        Fri,  9 Apr 2021 17:41:34 +0800 (CST)
Received: from huawei.com (10.175.127.227) by DGGEMS412-HUB.china.huawei.com
 (10.3.19.212) with Microsoft SMTP Server id 14.3.498.0; Fri, 9 Apr 2021
 17:43:12 +0800
From:   Ye Bin <yebin10@huawei.com>
To:     <yebin10@huawei.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     <linux-usb@vger.kernel.org>, <kernel-janitors@vger.kernel.org>,
        Hulk Robot <hulkci@huawei.com>
Subject: [PATCH -next] usb: ftdi-elan: use DEFINE_MUTEX() for mutex lock and LIST_HEAD for list head
Date:   Fri, 9 Apr 2021 17:51:37 +0800
Message-ID: <20210409095137.2293813-1-yebin10@huawei.com>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
Content-Type:   text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
X-Originating-IP: [10.175.127.227]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

mutex lock can be initialized automatically with DEFINE_MUTEX()
rather than explicitly calling mutex_init().
list head can be initialized automatically with LIST_HEAD()
rather than explicitly calling INIT_LIST_HEAD().

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Ye Bin <yebin10@huawei.com>
---
 drivers/usb/misc/ftdi-elan.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/misc/ftdi-elan.c b/drivers/usb/misc/ftdi-elan.c
index 8a3d9c0c8d8b..6dc17092b095 100644
--- a/drivers/usb/misc/ftdi-elan.c
+++ b/drivers/usb/misc/ftdi-elan.c
@@ -61,9 +61,9 @@ extern struct platform_driver u132_platform_driver;
  * ftdi_module_lock exists to protect access to global variables
  *
  */
-static struct mutex ftdi_module_lock;
+static DEFINE_MUTEX(ftdi_module_lock);
 static int ftdi_instances = 0;
-static struct list_head ftdi_static_list;
+static LIST_HEAD(ftdi_static_list);
 /*
  * end of the global variables protected by ftdi_module_lock
  */
@@ -2761,8 +2761,6 @@ static int __init ftdi_elan_init(void)
 {
 	int result;
 	pr_info("driver %s\n", ftdi_elan_driver.name);
-	mutex_init(&ftdi_module_lock);
-	INIT_LIST_HEAD(&ftdi_static_list);
 	result = usb_register(&ftdi_elan_driver);
 	if (result) {
 		pr_err("usb_register failed. Error number %d\n", result);

