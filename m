Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EA7935DC58
	for <lists+linux-usb@lfdr.de>; Wed,  3 Jul 2019 04:22:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727885AbfGCCV6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 2 Jul 2019 22:21:58 -0400
Received: from mail.kernel.org ([198.145.29.99]:54110 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727726AbfGCCPs (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 2 Jul 2019 22:15:48 -0400
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B37462189E;
        Wed,  3 Jul 2019 02:15:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1562120147;
        bh=LSwEiAyPY+KjA1cb5aSdkiBAeVpkrlpKj2sAb7zAvlw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=zrKCo7Td7UdEHYyHGMIdsHYHTgReMRvLk4yDA3SdLNwV3+i4KwzIg1g2UDN4t+NVF
         JrMAHNjlU8AdB7DB2fMs7NtitPwf6Svk6Idrw4aNK5bO7Ok8EhDRxkgOvt8Nr3QW78
         j47NxewCh4BiICfffuF8LsgZ9gPC7WMBPBOxBq5U=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     =?UTF-8?q?Bj=C3=B8rn=20Mork?= <bjorn@mork.no>,
        syzbot+b68605d7fadd21510de1@syzkaller.appspotmail.com,
        Kristian Evensen <kristian.evensen@gmail.com>,
        "David S . Miller" <davem@davemloft.net>,
        Sasha Levin <sashal@kernel.org>, netdev@vger.kernel.org,
        linux-usb@vger.kernel.org
Subject: [PATCH AUTOSEL 5.1 22/39] qmi_wwan: Fix out-of-bounds read
Date:   Tue,  2 Jul 2019 22:14:57 -0400
Message-Id: <20190703021514.17727-22-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190703021514.17727-1-sashal@kernel.org>
References: <20190703021514.17727-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Bjørn Mork <bjorn@mork.no>

[ Upstream commit 904d88d743b0c94092c5117955eab695df8109e8 ]

The syzbot reported

 Call Trace:
  __dump_stack lib/dump_stack.c:77 [inline]
  dump_stack+0xca/0x13e lib/dump_stack.c:113
  print_address_description+0x67/0x231 mm/kasan/report.c:188
  __kasan_report.cold+0x1a/0x32 mm/kasan/report.c:317
  kasan_report+0xe/0x20 mm/kasan/common.c:614
  qmi_wwan_probe+0x342/0x360 drivers/net/usb/qmi_wwan.c:1417
  usb_probe_interface+0x305/0x7a0 drivers/usb/core/driver.c:361
  really_probe+0x281/0x660 drivers/base/dd.c:509
  driver_probe_device+0x104/0x210 drivers/base/dd.c:670
  __device_attach_driver+0x1c2/0x220 drivers/base/dd.c:777
  bus_for_each_drv+0x15c/0x1e0 drivers/base/bus.c:454

Caused by too many confusing indirections and casts.
id->driver_info is a pointer stored in a long.  We want the
pointer here, not the address of it.

Thanks-to: Hillf Danton <hdanton@sina.com>
Reported-by: syzbot+b68605d7fadd21510de1@syzkaller.appspotmail.com
Cc: Kristian Evensen <kristian.evensen@gmail.com>
Fixes: e4bf63482c30 ("qmi_wwan: Add quirk for Quectel dynamic config")
Signed-off-by: Bjørn Mork <bjorn@mork.no>
Signed-off-by: David S. Miller <davem@davemloft.net>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/usb/qmi_wwan.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/usb/qmi_wwan.c b/drivers/net/usb/qmi_wwan.c
index d9a6699abe59..e657d8947125 100644
--- a/drivers/net/usb/qmi_wwan.c
+++ b/drivers/net/usb/qmi_wwan.c
@@ -1412,7 +1412,7 @@ static int qmi_wwan_probe(struct usb_interface *intf,
 	 * different. Ignore the current interface if the number of endpoints
 	 * equals the number for the diag interface (two).
 	 */
-	info = (void *)&id->driver_info;
+	info = (void *)id->driver_info;
 
 	if (info->data & QMI_WWAN_QUIRK_QUECTEL_DYNCFG) {
 		if (desc->bNumEndpoints == 2)
-- 
2.20.1

