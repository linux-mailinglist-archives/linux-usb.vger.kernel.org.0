Return-Path: <linux-usb+bounces-14493-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DCEB09687C0
	for <lists+linux-usb@lfdr.de>; Mon,  2 Sep 2024 14:43:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1AD011C21CAD
	for <lists+linux-usb@lfdr.de>; Mon,  2 Sep 2024 12:43:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7426919C54F;
	Mon,  2 Sep 2024 12:43:55 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9D9219E976
	for <linux-usb@vger.kernel.org>; Mon,  2 Sep 2024 12:43:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725281035; cv=none; b=HNlVTCucI1QDR7ARJ0j8zllVnaRl7i7aUrm973bhH1cRzGQkg1WGzr7+26o5Vag+7vKDDniqHetP/2t2R37uT1sOirhyuauJ/CEcs5htlDjz7sktteyr2Hk+vUUtHRB3QbeZqTS2wCKKLXuXClLZx23wL63HXGA5M0Bt+r0lQAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725281035; c=relaxed/simple;
	bh=dBLxSUmlR7SYu09TMr30gJbUjsjyPxs85lSMJNFAYYg=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=W0Tl7toG1bi2xhqFinqd6fiO9dSmf7OWA6q7yi/b7fDqDOl7Rvk2P+ndxltgLA5kHJav1PHrIHjGZHocoNnXM++RTfLhVmjn/Le0QuD2xrqqYeYi/uZdXBX8DbSW8BozfBGhyRTDfVWNy6+T3xzJW95VtyuDRTicKNLby8smtm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.174])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4Wy7gD21r4zpVH0;
	Mon,  2 Sep 2024 20:42:00 +0800 (CST)
Received: from kwepemf500003.china.huawei.com (unknown [7.202.181.241])
	by mail.maildlp.com (Postfix) with ESMTPS id 07378140121;
	Mon,  2 Sep 2024 20:43:50 +0800 (CST)
Received: from huawei.com (10.175.112.208) by kwepemf500003.china.huawei.com
 (7.202.181.241) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 2 Sep
 2024 20:43:49 +0800
From: Zhang Zekun <zhangzekun11@huawei.com>
To: <patchwork@huawei.com>, <Thinh.Nguyen@synopsys.com>,
	<gregkh@linuxfoundation.org>, <shawnguo@kernel.org>,
	<s.hauer@pengutronix.de>, <kernel@pengutronix.de>, <festevam@gmail.com>,
	<linux-usb@vger.kernel.org>, <vz@mleia.com>, <stern@rowland.harvard.edu>
CC: <zhangzekun11@huawei.com>
Subject: [PATCH 0/2] Use helper function devm_clk_get_enabled()
Date: Mon, 2 Sep 2024 20:30:18 +0800
Message-ID: <20240902123020.29267-1-zhangzekun11@huawei.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemf500003.china.huawei.com (7.202.181.241)

devm_clk_get() and clk_prepare_enable() can be replaced by helper function
devm_clk_get_enabled(). Use helper function devm_clk_get_enabled() to
simplify code.

Zhang Zekun (2):
  usb: dwc3: Use helper function devm_clk_get_enabled()
  usb: ohci-nxp: Use helper function devm_clk_get_enabled()

 drivers/usb/dwc3/dwc3-imx8mp.c | 47 ++++++++--------------------------
 drivers/usb/host/ohci-nxp.c    | 18 +++----------
 2 files changed, 15 insertions(+), 50 deletions(-)

-- 
2.17.1


