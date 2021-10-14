Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DFA0142D024
	for <lists+linux-usb@lfdr.de>; Thu, 14 Oct 2021 03:58:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229663AbhJNCAH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 13 Oct 2021 22:00:07 -0400
Received: from mailout.easymail.ca ([64.68.200.34]:60148 "EHLO
        mailout.easymail.ca" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229496AbhJNCAH (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 13 Oct 2021 22:00:07 -0400
X-Greylist: delayed 427 seconds by postgrey-1.27 at vger.kernel.org; Wed, 13 Oct 2021 22:00:07 EDT
Received: from localhost (localhost [127.0.0.1])
        by mailout.easymail.ca (Postfix) with ESMTP id A30B2A899D;
        Thu, 14 Oct 2021 01:50:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=braewoods.net;
        s=easymail; t=1634176256;
        bh=MhfOxTpNfJrfodNhm+F/B0KSIbrHJIIOloZg7kceITU=;
        h=From:To:Cc:Subject:Date:From;
        b=lrGXW+s0382w1SubYDvEaNOnDyCYBlEZvdJav9oJUFehUTFTSkWkeWocdObqj4oom
         5DwaFa7TTCmcku4UCpgv73fowNMcSnRzwyCnWxkK7c0KaVbVfkBwYwH4T65u6t7Q/r
         bOj6+CbGgXB+6KluQ08ChOy5mAR8cnmycczuFEiV8zjY6QNCioHfifV+BqTpUOC+1W
         hDcfTh6v1bTB70t/9lvaIk/drwakHdE8xIW0jXzzi46PP7cTQws/ruQYO6fRsklcS7
         /TQqxsURvyX6Bd4Jm95WBbk8klfmxZ5R0OfdMvZWcu/4ixK8nF34+g+j6EODMbvNC1
         taRZBJNO8aFaw==
X-Virus-Scanned: Debian amavisd-new at emo04-pco.easydns.vpn
Received: from mailout.easymail.ca ([127.0.0.1])
        by localhost (emo04-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id FBvgpGoEbQUz; Thu, 14 Oct 2021 01:50:56 +0000 (UTC)
Received: from uc.lan (cpe-75-81-17-79.kc.res.rr.com [75.81.17.79])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by mailout.easymail.ca (Postfix) with ESMTPSA id CE969A8965;
        Thu, 14 Oct 2021 01:50:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=braewoods.net;
        s=easymail; t=1634176256;
        bh=MhfOxTpNfJrfodNhm+F/B0KSIbrHJIIOloZg7kceITU=;
        h=From:To:Cc:Subject:Date:From;
        b=lrGXW+s0382w1SubYDvEaNOnDyCYBlEZvdJav9oJUFehUTFTSkWkeWocdObqj4oom
         5DwaFa7TTCmcku4UCpgv73fowNMcSnRzwyCnWxkK7c0KaVbVfkBwYwH4T65u6t7Q/r
         bOj6+CbGgXB+6KluQ08ChOy5mAR8cnmycczuFEiV8zjY6QNCioHfifV+BqTpUOC+1W
         hDcfTh6v1bTB70t/9lvaIk/drwakHdE8xIW0jXzzi46PP7cTQws/ruQYO6fRsklcS7
         /TQqxsURvyX6Bd4Jm95WBbk8klfmxZ5R0OfdMvZWcu/4ixK8nF34+g+j6EODMbvNC1
         taRZBJNO8aFaw==
From:   James Buren <braewoods+lkml@braewoods.net>
To:     linux-usb@vger.kernel.org
Cc:     James Buren <braewoods+lkml@braewoods.net>
Subject: [PATCH] usb-storage: Add compatibility quirk flags for iODD 2531/2541
Date:   Wed, 13 Oct 2021 20:50:50 -0500
Message-Id: <20211014015050.2694967-1-braewoods+lkml@braewoods.net>
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
index c6b3fcf90180..4267b13962e1 100644
--- a/drivers/usb/storage/unusual_devs.h
+++ b/drivers/usb/storage/unusual_devs.h
@@ -415,6 +415,16 @@ UNUSUAL_DEV(  0x04cb, 0x0100, 0x0000, 0x2210,
 		"FinePix 1400Zoom",
 		USB_SC_UFI, USB_PR_DEVICE, NULL, US_FL_FIX_INQUIRY | US_FL_SINGLE_LUN),
 
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
  * Reported by Ondrej Zary <linux@zary.sk>
  * The device reports one sector more and breaks when that sector is accessed
-- 
2.25.1

