Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 75E36251D0B
	for <lists+linux-usb@lfdr.de>; Tue, 25 Aug 2020 18:17:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727091AbgHYQRl (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 25 Aug 2020 12:17:41 -0400
Received: from mail5.windriver.com ([192.103.53.11]:51630 "EHLO mail5.wrs.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726457AbgHYQRl (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 25 Aug 2020 12:17:41 -0400
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
        by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 07PGGq4Z005452
        (version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL);
        Tue, 25 Aug 2020 09:17:13 -0700
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.40) with Microsoft SMTP Server id 14.3.487.0; Tue, 25 Aug 2020
 09:17:01 -0700
From:   <yanfei.xu@windriver.com>
To:     <gregkh@linuxfoundation.org>
CC:     <linux-usb@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH] USB: core: limit access to rawdescriptors which were not allocated
Date:   Wed, 26 Aug 2020 00:16:59 +0800
Message-ID: <20200825161659.19008-1-yanfei.xu@windriver.com>
X-Mailer: git-send-email 2.18.2
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Yanfei Xu <yanfei.xu@windriver.com>

When using systemcall to read the rawdescriptors, make sure we won't
access to the rawdescriptors never allocated, which are number
exceed the USB_MAXCONFIG.

Reported-by: syzbot+256e56ddde8b8957eabd@syzkaller.appspotmail.com
Signed-off-by: Yanfei Xu <yanfei.xu@windriver.com>
---
 drivers/usb/core/sysfs.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/core/sysfs.c b/drivers/usb/core/sysfs.c
index a2ca38e25e0c..1a7a625e5f55 100644
--- a/drivers/usb/core/sysfs.c
+++ b/drivers/usb/core/sysfs.c
@@ -895,7 +895,8 @@ read_descriptors(struct file *filp, struct kobject *kobj,
 	 * configurations (config plus subsidiary descriptors).
 	 */
 	for (cfgno = -1; cfgno < udev->descriptor.bNumConfigurations &&
-			nleft > 0; ++cfgno) {
+			nleft > 0 &&
+			cfgno < USB_MAXCONFIG; ++cfgno) {
 		if (cfgno < 0) {
 			src = &udev->descriptor;
 			srclen = sizeof(struct usb_device_descriptor);
-- 
2.18.2

