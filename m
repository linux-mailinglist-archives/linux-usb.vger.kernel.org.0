Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 23AE7E3938
	for <lists+linux-usb@lfdr.de>; Thu, 24 Oct 2019 19:05:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2410142AbfJXRFV (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 24 Oct 2019 13:05:21 -0400
Received: from dougal.metanate.com ([90.155.101.14]:54823 "EHLO metanate.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2410129AbfJXRFU (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 24 Oct 2019 13:05:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=simple/simple; d=metanate.com;
         s=stronger; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
        Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=PoG+jqjBMytnM1gatI3jmNtM0gsY06tyPc72yvO/HYg=; b=D1yvgpRULaB1mKyWHCbVFn4c8u
        cRFTQ1loJE+5qXEMmbcztInnKopFcnS3Vltzi2/alsX4hUcqDlDFZm6zGO0WIrBVJSN3+j4UbG8ri
        L9pSyO0w7it/0ChxdawH6otOFYETlEia/KoKoUIbdxNF2obJi0KQRBYWXrGl8Y16oztER4ec9lO8j
        bdbjebvaZ6snehknEJQ01Tzf9XCKc6sUJiHfl7B0HkAcSjUnpSJowoYSJt+hY8S2EY+YfzPLesqoY
        IN96jN5FgJw+icYkaz3OQFmlrCFqLIR74OoFpNZnVgoy/mAuYnx5j/jOnovH2eS6AhU6RFxCCGB6I
        42SVf02Q==;
Received: from 188-39-28-98.static.enta.net ([188.39.28.98] helo=donbot.corp.numark.com)
        by email.metanate.com with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
        (Exim 4.92.3)
        (envelope-from <john@metanate.com>)
        id 1iNgFA-0004oc-0T; Thu, 24 Oct 2019 17:45:48 +0100
From:   John Keeping <john@metanate.com>
To:     linux-usb@vger.kernel.org
Cc:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org, John Keeping <john@metanate.com>
Subject: [PATCH 3/6] USB: gadget: f_hid: find f_hidg by IDR lookup on open
Date:   Thu, 24 Oct 2019 17:45:35 +0100
Message-Id: <20191024164538.3161474-4-john@metanate.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191024164538.3161474-1-john@metanate.com>
References: <20191024164538.3161474-1-john@metanate.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authenticated: YES
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

As a step towards decoupling the cdev lifetime from f_hidg, lookup the
f_hidg structure by minor number from IDR when opening the device.

Signed-off-by: John Keeping <john@metanate.com>
---
 drivers/usb/gadget/function/f_hid.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/gadget/function/f_hid.c b/drivers/usb/gadget/function/f_hid.c
index 838256086bd2..4d20347fe908 100644
--- a/drivers/usb/gadget/function/f_hid.c
+++ b/drivers/usb/gadget/function/f_hid.c
@@ -441,8 +441,14 @@ static int f_hidg_release(struct inode *inode, struct file *fd)
 
 static int f_hidg_open(struct inode *inode, struct file *fd)
 {
-	struct f_hidg *hidg =
-		container_of(inode->i_cdev, struct f_hidg, cdev);
+	struct f_hidg *hidg;
+
+	mutex_lock(&hidg_idr_lock);
+	hidg = idr_find(&hidg_idr, iminor(inode));
+	mutex_unlock(&hidg_idr_lock);
+
+	if (!hidg)
+		return -ENODEV;
 
 	fd->private_data = hidg;
 
@@ -827,6 +833,10 @@ static int hidg_bind(struct usb_configuration *c, struct usb_function *f)
 	if (status)
 		goto fail_free_descs;
 
+	mutex_lock(&hidg_idr_lock);
+	idr_replace(&hidg_idr, hidg, hidg->minor);
+	mutex_unlock(&hidg_idr_lock);
+
 	device = device_create(hidg_class, NULL, dev, NULL,
 			       "%s%d", "hidg", hidg->minor);
 	if (IS_ERR(device)) {
-- 
2.23.0

