Return-Path: <linux-usb+bounces-81-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D2D87A0B9A
	for <lists+linux-usb@lfdr.de>; Thu, 14 Sep 2023 19:24:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B4E3B1C20E80
	for <lists+linux-usb@lfdr.de>; Thu, 14 Sep 2023 17:24:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F348262B7;
	Thu, 14 Sep 2023 17:23:56 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B10D1C2A1
	for <linux-usb@vger.kernel.org>; Thu, 14 Sep 2023 17:23:55 +0000 (UTC)
Received: from kozue.soulik.info (kozue.soulik.info [IPv6:2001:19f0:7000:8404:5400:ff:fe00:d7d6])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5EC754685;
	Thu, 14 Sep 2023 10:23:55 -0700 (PDT)
Received: from ritsuko.sh.sumomo.pri (unknown [10.0.12.132])
	by kozue.soulik.info (Postfix) with ESMTPSA id 79D153001F1;
	Fri, 15 Sep 2023 02:23:42 +0900 (JST)
DKIM-Filter: OpenDKIM Filter v2.11.0 kozue.soulik.info 79D153001F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=soulik.info; s=mail;
	t=1694712223; bh=91ZYByAiQ0k1Ldqa97fT7yCCM4KmbxhRMMYPhoLTlgM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QaeQ31BUa3hgH9EqcJMVDjhMF1p7mUjW6+gnxALzHwkStegEc0enCTVwcrlINIrl7
	 Nh0Eu0JvYi31Min0bJqQV6Crg0PsWN4bGY4FwaA7gOZpKpE93nVSH/mgjdFGhm6P32
	 ftSEVc2kUbJCE9XBJghXLYtCiZ2PnmgxH7iMdAps=
From: Randy Li <ayaka@soulik.info>
To: linux-usb@vger.kernel.org
Cc: Randy Li <ayaka@soulik.info>,
	stern@rowland.harvard.edu,
	gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	corbet@lwn.net,
	linux-doc@vger.kernel.org
Subject: [PATCH 1/2] USB: dma: remove unused function prototype
Date: Fri, 15 Sep 2023 01:23:23 +0800
Message-ID: <20230914172336.18761-2-ayaka@soulik.info>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230914172336.18761-1-ayaka@soulik.info>
References: <20230914172336.18761-1-ayaka@soulik.info>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

usb_buffer_map_sg() and usb_buffer_unmap_sg() have no definition
since the beginning of v5.4. The rest are gone from 2.6.12.

Signed-off-by: Randy Li <ayaka@soulik.info>
---
 include/linux/usb.h | 16 ----------------
 1 file changed, 16 deletions(-)

diff --git a/include/linux/usb.h b/include/linux/usb.h
index a21074861f91..8c61643acd49 100644
--- a/include/linux/usb.h
+++ b/include/linux/usb.h
@@ -1823,22 +1823,6 @@ void *usb_alloc_coherent(struct usb_device *dev, size_t size,
 void usb_free_coherent(struct usb_device *dev, size_t size,
 	void *addr, dma_addr_t dma);
 
-#if 0
-struct urb *usb_buffer_map(struct urb *urb);
-void usb_buffer_dmasync(struct urb *urb);
-void usb_buffer_unmap(struct urb *urb);
-#endif
-
-struct scatterlist;
-int usb_buffer_map_sg(const struct usb_device *dev, int is_in,
-		      struct scatterlist *sg, int nents);
-#if 0
-void usb_buffer_dmasync_sg(const struct usb_device *dev, int is_in,
-			   struct scatterlist *sg, int n_hw_ents);
-#endif
-void usb_buffer_unmap_sg(const struct usb_device *dev, int is_in,
-			 struct scatterlist *sg, int n_hw_ents);
-
 /*-------------------------------------------------------------------*
  *                         SYNCHRONOUS CALL SUPPORT                  *
  *-------------------------------------------------------------------*/
-- 
2.41.0


