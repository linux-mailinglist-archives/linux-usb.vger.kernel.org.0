Return-Path: <linux-usb+bounces-7023-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 11EED86256D
	for <lists+linux-usb@lfdr.de>; Sat, 24 Feb 2024 14:55:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9ECF41F2313F
	for <lists+linux-usb@lfdr.de>; Sat, 24 Feb 2024 13:55:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C591482C6;
	Sat, 24 Feb 2024 13:53:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="NW9o7oUc"
X-Original-To: linux-usb@vger.kernel.org
Received: from out-188.mta1.migadu.com (out-188.mta1.migadu.com [95.215.58.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 024F0482D3
	for <linux-usb@vger.kernel.org>; Sat, 24 Feb 2024 13:53:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708782788; cv=none; b=JixNPWgqZ6dM42ziSFOeqzRoYYkMYLvdvxjyN5ZB4h7UVbe8eTLMvCdv1QzTP8LHaU248lF71Enh5u+5vN56BhPlX7SRoAR29Rp1FSpPbv5/FeF0VMo2U0grBTkvh5HAZIdWd8RD3FxHRI41B4rMqM+vipTa+GjF06nlS9+6+Mw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708782788; c=relaxed/simple;
	bh=VWF64JLHhDBS2pWz1T4oErLsPpNC811AcQE+tvREolE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ZFbD8FyoCqr7aARVHllOKpzVnB315avOP1k5QbmCdgCjZUxNUZgs54jikvid2eKttwc0U5YolVF5uCxg30RjmFZ887aN5Yss/a/j2lGoRj9g+cOGFrJK85E4v1yfU+m1eAt4Fpcpu2YO+VR+xIcyAELuqJWc4ZDnT0eYJ5/x2Rg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=NW9o7oUc; arc=none smtp.client-ip=95.215.58.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1708782784;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=tm1yrXWwpayVhW0izRTuDBy0hwWeAWTE2v2krJfJP6w=;
	b=NW9o7oUcJ1oPsAYqMgb00gRou3FUu3uSSHnH5sYa2qqeMgWisTHbGqpoHn193JC4/gmY68
	Zq+CJvm+QeyYBRlvCxS8urLV2A1DxV8HiaAhTpXxg15OKntYMjYnA0zWxNShpxbf//UNHJ
	7OZQYLU2ZzlItCsW4ilQQ+Dsmjdmr3s=
From: chengming.zhou@linux.dev
To: rui.silva@linaro.org,
	gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	vbabka@suse.cz,
	roman.gushchin@linux.dev,
	Xiongwei.Song@windriver.com,
	chengming.zhou@linux.dev,
	Chengming Zhou <zhouchengming@bytedance.com>
Subject: [PATCH] usb: isp1760: remove SLAB_MEM_SPREAD flag usage
Date: Sat, 24 Feb 2024 13:52:56 +0000
Message-Id: <20240224135256.830413-1-chengming.zhou@linux.dev>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

From: Chengming Zhou <zhouchengming@bytedance.com>

The SLAB_MEM_SPREAD flag is already a no-op as of 6.8-rc1, remove
its usage so we can delete it from slab. No functional change.

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


