Return-Path: <linux-usb+bounces-1311-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C15A7BEC87
	for <lists+linux-usb@lfdr.de>; Mon,  9 Oct 2023 23:14:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3F3C3281C8E
	for <lists+linux-usb@lfdr.de>; Mon,  9 Oct 2023 21:14:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5784B41238;
	Mon,  9 Oct 2023 21:14:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CwgWaQj4"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFCC12030B
	for <linux-usb@vger.kernel.org>; Mon,  9 Oct 2023 21:14:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0770C433C9;
	Mon,  9 Oct 2023 21:14:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696886078;
	bh=Xpx2wND1dP8kwl4XLDHrf+J72l89Jo1/DmvaVFMsN5E=;
	h=From:To:Cc:Subject:Date:From;
	b=CwgWaQj41Xgjp5Mabg+jK4oHXXb0Z0rZeD5Bu+l1pHm9Pf1X2Wnz/FSJTmfRwcqo1
	 6983OL46CLXGOh5uj0mkDHINE7bJeQhe8ILvoiigoHtQMrBslKtXz6/ftBovCFMOyE
	 iLiZCxutDaD3giIvCYLvtrYFMzFyidCZbAMLhNzhGh4MXXjRnj2xEdjECmnO3bxEeE
	 Rb5WFg6jOekJNEG14WxpcMqMUm7mKctFe53rSr2emDSxoWIZKDYRGv7xw3KBhuz02v
	 u4hu3KRnucZ3ts4rYcEzM5+Fz3n+mn52Oy/ZvnyHpauTa4CHchewEFTWL11hls/hMa
	 p7z2tH2UXgq8A==
Received: (nullmailer pid 3246550 invoked by uid 1000);
	Mon, 09 Oct 2023 21:14:15 -0000
From: Rob Herring <robh@kernel.org>
To: Bin Liu <b-liu@ti.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] usb: musb: Add missing of.h include
Date: Mon,  9 Oct 2023 16:13:47 -0500
Message-ID: <20231009211356.3242037-17-robh@kernel.org>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The DT of_device.h and of_platform.h date back to the separate
of_platform_bus_type before it as merged into the regular platform bus.
As part of that merge prepping Arm DT support 13 years ago, they
"temporarily" include each other. They also include platform_device.h
and of.h. As a result, there's a pretty much random mix of those include
files used throughout the tree.

Add of.h which is implicitly included by of_platform.h.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 drivers/usb/musb/da8xx.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/musb/da8xx.c b/drivers/usb/musb/da8xx.c
index 912e32b78ac6..8abf3a567e30 100644
--- a/drivers/usb/musb/da8xx.c
+++ b/drivers/usb/musb/da8xx.c
@@ -17,6 +17,7 @@
 #include <linux/clk.h>
 #include <linux/err.h>
 #include <linux/io.h>
+#include <linux/of.h>
 #include <linux/of_platform.h>
 #include <linux/phy/phy.h>
 #include <linux/platform_device.h>
-- 
2.42.0


