Return-Path: <linux-usb+bounces-7542-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E2C7872009
	for <lists+linux-usb@lfdr.de>; Tue,  5 Mar 2024 14:25:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 14C5E1F2224A
	for <lists+linux-usb@lfdr.de>; Tue,  5 Mar 2024 13:25:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B222A85C48;
	Tue,  5 Mar 2024 13:24:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="VyW6bH3o"
X-Original-To: linux-usb@vger.kernel.org
Received: from out-178.mta1.migadu.com (out-178.mta1.migadu.com [95.215.58.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B7F285645
	for <linux-usb@vger.kernel.org>; Tue,  5 Mar 2024 13:24:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709645095; cv=none; b=LPyYXWR3xIV+Gl4JO7IAzFPKNKD5vFL43qtgVh94gwJt+skUPJrf71dudcdT7ml5Q3ROb7qDgXL0tRvu2oV5MgKgkh9W1OPNMg5hQFSQchfkSOl5JinlogYwM42pDl56PhXPeOagwBUP7ADI5DVnqT5gRsqsa+HmUJ6RvogslpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709645095; c=relaxed/simple;
	bh=1q5Yl/qte9Q6wO0ustPZcZZlP5R/+aF87r8s/YtOT6s=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=kXrEnD31+7+mFzlt0vwWi+A4tmzbAMwVD2HMRl/aMjTPJsWljls9DkCSuDN0XbfBAM5YlSkwuhPdrtmLQ4Ve1aEwMajN5gEwgX/sQJHvMadvyjWGOJAXOTSWtx8fKtRGt6j88QGBlsyaw/agnr2tKWtSL5E/ftaJs5bm1LZR/nk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=VyW6bH3o; arc=none smtp.client-ip=95.215.58.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1709645090;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gAnWFjhme+Jy4FpyDR7luzM4shNJlsSc/yEtH+AkW4g=;
	b=VyW6bH3oKu7YzBCKju1CvcwXKtZhuqykpIaos9vDEa5cf/lSc31Y7pbrZBxJLqFTx81uzA
	gY66iHhBIEJToOyv+diDoJ04lhG9Dv6+xCqUNBOx2jKNvWGfIeJ+qo8F3PVvkmYkuM7RaT
	vIUCYOLV6/rJKG0239id+M1b3yme3Lc=
From: Chengming Zhou <chengming.zhou@linux.dev>
To: gregkh@linuxfoundation.org
Cc: rui.silva@linaro.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chengming Zhou <zhouchengming@bytedance.com>
Subject: [PATCH v2] usb: isp1760: remove SLAB_MEM_SPREAD flag usage
Date: Tue,  5 Mar 2024 13:24:42 +0000
Message-Id: <20240305132442.2122214-1-chengming.zhou@linux.dev>
In-Reply-To: <2024030555-turbojet-headscarf-e26e@gregkh>
References: <2024030555-turbojet-headscarf-e26e@gregkh>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

From: Chengming Zhou <zhouchengming@bytedance.com>

The SLAB_MEM_SPREAD flag used to be implemented in SLAB, which was
removed as of v6.8-rc1, so it became a dead flag since the commit
16a1d968358a ("mm/slab: remove mm/slab.c and slab_def.h"). And the
series[1] went on to mark it obsolete explicitly to avoid confusion
for users. Here we can just remove all its users, which has no any
functional change.

[1] https://lore.kernel.org/all/20240223-slab-cleanup-flags-v2-1-02f1753e8303@suse.cz/

Signed-off-by: Chengming Zhou <zhouchengming@bytedance.com>
---
 drivers/usb/isp1760/isp1760-hcd.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/isp1760/isp1760-hcd.c b/drivers/usb/isp1760/isp1760-hcd.c
index 76862ba40f35..0e5e4cb74c87 100644
--- a/drivers/usb/isp1760/isp1760-hcd.c
+++ b/drivers/usb/isp1760/isp1760-hcd.c
@@ -2521,21 +2521,19 @@ static const struct hc_driver isp1760_hc_driver = {
 int __init isp1760_init_kmem_once(void)
 {
 	urb_listitem_cachep = kmem_cache_create("isp1760_urb_listitem",
-			sizeof(struct urb_listitem), 0, SLAB_TEMPORARY |
-			SLAB_MEM_SPREAD, NULL);
+			sizeof(struct urb_listitem), 0, SLAB_TEMPORARY, NULL);
 
 	if (!urb_listitem_cachep)
 		return -ENOMEM;
 
 	qtd_cachep = kmem_cache_create("isp1760_qtd",
-			sizeof(struct isp1760_qtd), 0, SLAB_TEMPORARY |
-			SLAB_MEM_SPREAD, NULL);
+			sizeof(struct isp1760_qtd), 0, SLAB_TEMPORARY, NULL);
 
 	if (!qtd_cachep)
 		goto destroy_urb_listitem;
 
 	qh_cachep = kmem_cache_create("isp1760_qh", sizeof(struct isp1760_qh),
-			0, SLAB_TEMPORARY | SLAB_MEM_SPREAD, NULL);
+			0, SLAB_TEMPORARY, NULL);
 
 	if (!qh_cachep)
 		goto destroy_qtd;
-- 
2.40.1


