Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5FCD0193D26
	for <lists+linux-usb@lfdr.de>; Thu, 26 Mar 2020 11:43:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727781AbgCZKnk (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 26 Mar 2020 06:43:40 -0400
Received: from mail.kernel.org ([198.145.29.99]:35488 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727560AbgCZKnk (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 26 Mar 2020 06:43:40 -0400
Received: from localhost.localdomain (unknown [180.171.74.255])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 85EC820714;
        Thu, 26 Mar 2020 10:43:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1585219419;
        bh=OZQ6h2G5aW8cEj+kZSt+w47jzOr4L+jzrjMQVhuLEZ0=;
        h=From:To:Cc:Subject:Date:From;
        b=eDPVPrwwvGcfGlgDaCwYu1QuQ4ZIu0tDUCIOeZ8xqiMxS2MkYi+YnmuwkW7mV6nwl
         KutwQELWMuOgKDSF7bjId5pqXK8HnN/WdD/kmaDa8LZKSOFsEbVvpnWowLNUIuVYvd
         ZYw7z0+p9Qf6cDAcGtJMdTE05+rEsG6MliaSZWXQ=
From:   Peter Chen <peter.chen@kernel.org>
To:     linux-usb@vger.kernel.org
Cc:     linux-imx@nxp.com, jun.li@nxp.com, Peter Chen <peter.chen@nxp.com>
Subject: [PATCH 1/3] usb: chipidea: udc: fix the kernel doc for udc.h
Date:   Thu, 26 Mar 2020 18:43:23 +0800
Message-Id: <20200326104325.5628-1-peter.chen@kernel.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Peter Chen <peter.chen@nxp.com>

The kernel doc for td_node is outdated, update it.

Signed-off-by: Peter Chen <peter.chen@nxp.com>
---
 drivers/usb/chipidea/udc.h | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/usb/chipidea/udc.h b/drivers/usb/chipidea/udc.h
index ebb11b625bb8..32b56f84f77a 100644
--- a/drivers/usb/chipidea/udc.h
+++ b/drivers/usb/chipidea/udc.h
@@ -67,10 +67,7 @@ struct td_node {
  * struct ci_hw_req - usb request representation
  * @req: request structure for gadget drivers
  * @queue: link to QH list
- * @ptr: transfer descriptor for this request
- * @dma: dma address for the transfer descriptor
- * @zptr: transfer descriptor for the zero packet
- * @zdma: dma address of the zero packet's transfer descriptor
+ * @tds: link to TD list
  */
 struct ci_hw_req {
 	struct usb_request	req;
-- 
2.17.1

