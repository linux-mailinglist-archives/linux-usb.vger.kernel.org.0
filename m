Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F330222EA48
	for <lists+linux-usb@lfdr.de>; Mon, 27 Jul 2020 12:46:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728261AbgG0Kqr (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 27 Jul 2020 06:46:47 -0400
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:57473 "EHLO
        relay7-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727897AbgG0Kqr (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 27 Jul 2020 06:46:47 -0400
X-Originating-IP: 82.255.60.242
Received: from classic.redhat.com (lns-bzn-39-82-255-60-242.adsl.proxad.net [82.255.60.242])
        (Authenticated sender: hadess@hadess.net)
        by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 04C5E2000A;
        Mon, 27 Jul 2020 10:46:44 +0000 (UTC)
From:   Bastien Nocera <hadess@hadess.net>
To:     linux-usb@vger.kernel.org
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Bastien Nocera <hadess@hadess.net>
Subject: [PATCH v6 1/3] USB: Simplify USB ID table match
Date:   Mon, 27 Jul 2020 12:46:42 +0200
Message-Id: <20200727104644.149873-1-hadess@hadess.net>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

usb_device_match_id() supports being passed NULL tables, so no need to
check for it.

Signed-off-by: Bastien Nocera <hadess@hadess.net>
---
- No changes since previous version

 drivers/usb/core/generic.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/usb/core/generic.c b/drivers/usb/core/generic.c
index 4626227a6dd2..b6f2d4b44754 100644
--- a/drivers/usb/core/generic.c
+++ b/drivers/usb/core/generic.c
@@ -205,8 +205,6 @@ static int __check_usb_generic(struct device_driver *drv, void *data)
 	udrv = to_usb_device_driver(drv);
 	if (udrv == &usb_generic_driver)
 		return 0;
-	if (!udrv->id_table)
-		return 0;
 
 	return usb_device_match_id(udev, udrv->id_table) != NULL;
 }
-- 
2.26.2

