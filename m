Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C6E122547BF
	for <lists+linux-usb@lfdr.de>; Thu, 27 Aug 2020 16:54:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726794AbgH0OyA (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 27 Aug 2020 10:54:00 -0400
Received: from crapouillou.net ([89.234.176.41]:38886 "EHLO crapouillou.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727108AbgH0NOu (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 27 Aug 2020 09:14:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1598534071; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-transfer-encoding:content-transfer-encoding:
         in-reply-to:references; bh=WwRPballsUTfHg7LtDod/X0oRDgxUAPVDJxMko1nRlE=;
        b=mKy0+Na1sG/NaDKdMbQ4pKIYpLLjmD2l24mz7kELAOQAvVNaIjzM7qn5E8qWav1QMcY06v
        a/rCQNHBlv01f7orOOgyCrXMnky+0xaOG8LTanL58v0IVm6whkD6/wwQHayDqFQeDlfdt3
        4xqyMvO7jvQBBuKgY8AmZNU8DUlxLiA=
From:   Paul Cercueil <paul@crapouillou.net>
To:     Felipe Balbi <balbi@kernel.org>,
        =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0?= <zhouyanjie@wanyeetech.com>,
        =?UTF-8?q?=E5=91=A8=E6=AD=A3?= <sernia.zhou@foxmail.com>,
        =?UTF-8?q?=E6=BC=86=E9=B9=8F=E6=8C=AF?= <aric.pzqi@ingenic.com>
Cc:     od@zcrc.me, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH v2] USB: PHY: JZ4770: Fix uninitialized value written to HW register
Date:   Thu, 27 Aug 2020 15:14:25 +0200
Message-Id: <20200827131425.75998-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The 'reg' value was written to a hardware register in
ingenic_usb_phy_init(), while not being initialized anywhere.

Fixes: 2a6c0b82e651 ("USB: PHY: JZ4770: Add support for new Ingenic SoCs.")
Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 drivers/usb/phy/phy-jz4770.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/phy/phy-jz4770.c b/drivers/usb/phy/phy-jz4770.c
index d4ee3cb721ea..f6d3731581eb 100644
--- a/drivers/usb/phy/phy-jz4770.c
+++ b/drivers/usb/phy/phy-jz4770.c
@@ -176,6 +176,7 @@ static int ingenic_usb_phy_init(struct usb_phy *phy)
 
 	/* Wait for PHY to reset */
 	usleep_range(30, 300);
+	reg = readl(priv->base + REG_USBPCR_OFFSET);
 	writel(reg & ~USBPCR_POR, priv->base + REG_USBPCR_OFFSET);
 	usleep_range(300, 1000);
 
-- 
2.28.0

