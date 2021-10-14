Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A36042D02B
	for <lists+linux-usb@lfdr.de>; Thu, 14 Oct 2021 04:03:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229876AbhJNCFI (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 13 Oct 2021 22:05:08 -0400
Received: from mailout.easymail.ca ([64.68.200.34]:39262 "EHLO
        mailout.easymail.ca" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229660AbhJNCFH (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 13 Oct 2021 22:05:07 -0400
Received: from localhost (localhost [127.0.0.1])
        by mailout.easymail.ca (Postfix) with ESMTP id B1AECA89A0;
        Thu, 14 Oct 2021 01:55:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=braewoods.net;
        s=easymail; t=1634176512;
        bh=MtsGuuXECPfZ6guO2aEMT/PgZ/kSN45WyBiRtMm7rHA=;
        h=From:To:Cc:Subject:Date:From;
        b=pk3x+DHNC/GmkJBjugaFsp8KNDMkZypGjTip2O0QqUAapL3HZsnD+1CElnbBy+bMW
         mH5CP2vhI37FDaFiU7ah5/z2od8hDul34BJttkCuEx0CQr3YzLNSvL2nW6KYyMg8HX
         zwadrXmMMl+SCURIZCVf3Io6GQEzCp/xIj6rkWkt/bm8JjDw9p8B4OtugyRh73RjlX
         eRGQVatet1OBriqda71HuMI6npNS6RQZMFWnBPqGsgUk9TD8dPmMgl9WJ3aqfv+dm2
         ZtxUPsAp4xVgDtwvj2b9q+v1WS0ED1nZtLaj98QYgqt3TzAVRWeVPi4rwpsKkWCgZn
         kSmQbpZp4ZmwQ==
X-Virus-Scanned: Debian amavisd-new at emo04-pco.easydns.vpn
Received: from mailout.easymail.ca ([127.0.0.1])
        by localhost (emo04-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id OC3yTqStumtt; Thu, 14 Oct 2021 01:55:12 +0000 (UTC)
Received: from uc.lan (cpe-75-81-17-79.kc.res.rr.com [75.81.17.79])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by mailout.easymail.ca (Postfix) with ESMTPSA id C3401A899F;
        Thu, 14 Oct 2021 01:55:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=braewoods.net;
        s=easymail; t=1634176512;
        bh=MtsGuuXECPfZ6guO2aEMT/PgZ/kSN45WyBiRtMm7rHA=;
        h=From:To:Cc:Subject:Date:From;
        b=pk3x+DHNC/GmkJBjugaFsp8KNDMkZypGjTip2O0QqUAapL3HZsnD+1CElnbBy+bMW
         mH5CP2vhI37FDaFiU7ah5/z2od8hDul34BJttkCuEx0CQr3YzLNSvL2nW6KYyMg8HX
         zwadrXmMMl+SCURIZCVf3Io6GQEzCp/xIj6rkWkt/bm8JjDw9p8B4OtugyRh73RjlX
         eRGQVatet1OBriqda71HuMI6npNS6RQZMFWnBPqGsgUk9TD8dPmMgl9WJ3aqfv+dm2
         ZtxUPsAp4xVgDtwvj2b9q+v1WS0ED1nZtLaj98QYgqt3TzAVRWeVPi4rwpsKkWCgZn
         kSmQbpZp4ZmwQ==
From:   James Buren <braewoods+lkml@braewoods.net>
To:     linux-usb@vger.kernel.org
Cc:     James Buren <braewoods+lkml@braewoods.net>
Subject: [PATCH] usb-storage: Add compatibility quirk flags for iODD 2531/2541
Date:   Wed, 13 Oct 2021 20:55:04 -0500
Message-Id: <20211014015504.2695089-1-braewoods+lkml@braewoods.net>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

These drive enclosures have firmware bugs that make it impossible to mount
a new virtual ISO image after Linux ejects the old one if the device is
locked by Linux. Windows bypasses this problem by the fact that they do
not lock the device. Add a quirk to disable device locking for these
drive enclosures.

Signed-off-by: James Buren <braewoods+lkml@braewoods.net>
---
 drivers/usb/storage/unusual_devs.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/usb/storage/unusual_devs.h b/drivers/usb/storage/unusual_devs.h
index c6b3fcf90180..29191d33c0e3 100644
--- a/drivers/usb/storage/unusual_devs.h
+++ b/drivers/usb/storage/unusual_devs.h
@@ -406,6 +406,16 @@ UNUSUAL_DEV(  0x04b8, 0x0602, 0x0110, 0x0110,
 		"785EPX Storage",
 		USB_SC_SCSI, USB_PR_BULK, NULL, US_FL_SINGLE_LUN),
 
+/*
+ * Reported by James Buren <braewoods+lkml@braewoods.net>
+ * Virtual ISOs cannot be remounted if ejected while the device is locked
+ * Disable locking to mimic Windows behavior that bypasses the issue
+ */
+UNUSUAL_DEV(  0x04c5, 0x2028, 0x0001, 0x0001,
+		"iODD",
+		"2531/2541",
+		USB_SC_DEVICE, USB_PR_DEVICE, NULL, US_FL_NOT_LOCKABLE),
+
 /*
  * Not sure who reported this originally but
  * Pavel Machek <pavel@ucw.cz> reported that the extra US_FL_SINGLE_LUN
-- 
2.25.1

