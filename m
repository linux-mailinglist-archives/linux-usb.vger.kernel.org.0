Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A29BD60E5B
	for <lists+linux-usb@lfdr.de>; Sat,  6 Jul 2019 02:54:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726411AbfGFAyQ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 5 Jul 2019 20:54:16 -0400
Received: from gate.crashing.org ([63.228.1.57]:42822 "EHLO gate.crashing.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725887AbfGFAyQ (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 5 Jul 2019 20:54:16 -0400
Received: from ufdda393ec48b57.ant.amazon.com (localhost.localdomain [127.0.0.1])
        by gate.crashing.org (8.14.1/8.14.1) with ESMTP id x660rlMQ017940;
        Fri, 5 Jul 2019 19:54:10 -0500
From:   Benjamin Herrenschmidt <benh@kernel.crashing.org>
To:     linux-usb@vger.kernel.org
Cc:     balbi@kernel.org, Joel Stanley <joel@jms.id.au>,
        Alan Stern <stern@rowland.harvard.edu>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>
Subject: [PATCH 09/10] usb: Add definitions for the USB2.0 hub TT requests
Date:   Sat,  6 Jul 2019 10:53:44 +1000
Message-Id: <20190706005345.18131-10-benh@kernel.crashing.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190706005345.18131-1-benh@kernel.crashing.org>
References: <20190706005345.18131-1-benh@kernel.crashing.org>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Signed-off-by: Benjamin Herrenschmidt <benh@kernel.crashing.org>
---
 include/linux/usb/hcd.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/linux/usb/hcd.h b/include/linux/usb/hcd.h
index bb57b5af4700..094ae7c71198 100644
--- a/include/linux/usb/hcd.h
+++ b/include/linux/usb/hcd.h
@@ -587,6 +587,10 @@ extern void usb_ep0_reinit(struct usb_device *);
 #define GetPortStatus		HUB_CLASS_REQ(USB_DIR_IN, USB_RT_PORT, USB_REQ_GET_STATUS)
 #define SetHubFeature		HUB_CLASS_REQ(USB_DIR_OUT, USB_RT_HUB, USB_REQ_SET_FEATURE)
 #define SetPortFeature		HUB_CLASS_REQ(USB_DIR_OUT, USB_RT_PORT, USB_REQ_SET_FEATURE)
+#define ClearTTBuffer		HUB_CLASS_REQ(USB_DIR_OUT, USB_RT_PORT, HUB_CLEAR_TT_BUFFER)
+#define ResetTT			HUB_CLASS_REQ(USB_DIR_OUT, USB_RT_PORT, HUB_RESET_TT)
+#define GetTTState		HUB_CLASS_REQ(USB_DIR_IN, USB_RT_PORT, HUB_GET_TT_STATE)
+#define StopTT			HUB_CLASS_REQ(USB_DIR_OUT, USB_RT_PORT, HUB_STOP_TT)
 
 
 /*-------------------------------------------------------------------------*/
-- 
2.17.1

