Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 310DD2C582
	for <lists+linux-usb@lfdr.de>; Tue, 28 May 2019 13:37:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726500AbfE1Lhc (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 28 May 2019 07:37:32 -0400
Received: from guitar.tcltek.co.il ([192.115.133.116]:59810 "EHLO
        mx.tkos.co.il" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726305AbfE1Lhc (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 28 May 2019 07:37:32 -0400
Received: from tarshish.tkos.co.il (unknown [10.0.8.2])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mx.tkos.co.il (Postfix) with ESMTPS id F21AC440459;
        Tue, 28 May 2019 14:37:28 +0300 (IDT)
From:   Baruch Siach <baruch@tkos.co.il>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, Baruch Siach <baruch@tkos.co.il>
Subject: [PATCH usbutils] usb-devices.1: don't mention bash
Date:   Tue, 28 May 2019 14:37:04 +0300
Message-Id: <920def362c8890ea3bed391cd120df17ce00a0cd.1559043424.git.baruch@tkos.co.il>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Since commit 508d1acf42e ("usb-devices: use /bin/sh hashbang")
usb-devices does not require bash.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 usb-devices.1.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/usb-devices.1.in b/usb-devices.1.in
index c5c1b798e4c3..2b142371cd67 100644
--- a/usb-devices.1.in
+++ b/usb-devices.1.in
@@ -11,7 +11,7 @@ usb-devices \- print USB device details
 
 .SH DESCRIPTION
 .B usb-devices
-is a (bash) shell script that can be used to display details of USB
+is a shell script that can be used to display details of USB
 buses in the system and the devices connected to them.
 
 The output of the script is similar to the \fIusb/devices\fP file
-- 
2.20.1

