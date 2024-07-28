Return-Path: <linux-usb+bounces-12537-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 541CD93E834
	for <lists+linux-usb@lfdr.de>; Sun, 28 Jul 2024 18:25:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 103FB280FD8
	for <lists+linux-usb@lfdr.de>; Sun, 28 Jul 2024 16:25:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79DF5187552;
	Sun, 28 Jul 2024 16:09:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZNocLoDb"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED42718733E;
	Sun, 28 Jul 2024 16:09:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722182956; cv=none; b=iwnqXfj8vMIywmCBx2cyH/fML9SZiXnkBag1XvLi/MZ5qdn5BodSFEvzDUzCNoXgZ9w65gumLDhJRsqti5wcwv6zjnjX2hlcrs0KkD3h9dew9+9c9zCai5/HPTp8+gT+TFDlkoAm1szqE9Q20uELoL0Nb7oPfcT+R9AnQLivhC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722182956; c=relaxed/simple;
	bh=TsJzhlXnYFhgFX62qPKwzT5GmLPzeuEjfJGh8pURNoU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ppBTupD0nuRbhklSuNYR8RnGf/gaWV45Ccf9jQne2S3cwWM9DEZLtzgC7Qq4XM62HT2D0yKnhsu3QO/+LvStVFnk0x3o4OBR+dhBbI1enZ+QzgYNGGV471U/EmcczkQUPaytIHq7U9/Dtaw71mMDxaj25s6+ZULLDKXbkD5iDQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZNocLoDb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A436C4AF0E;
	Sun, 28 Jul 2024 16:09:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722182955;
	bh=TsJzhlXnYFhgFX62qPKwzT5GmLPzeuEjfJGh8pURNoU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZNocLoDb/lNnY3cxKGj1RXBV9CKn5XtfrUkkswTARHz+9QgUpKfC5ygrZ+3XzKtb5
	 l5InXcnkyRxwrLFf8vfNAuV/TcZ3Fdx8cySLmOrNrjTr9F78yeG/QSoab9jphMXBzG
	 eV3bd+dsd6RlcgZNjIm1xakuUOdlMOjgxmnGxK+R0IRvUEU6Vr3v9cqMrBIwcHjMaM
	 Uu7ItLoG4F4l+8b8lC/ojDJswH5HPClw05Ooz8EALD3YkILhKJ+xPED+ERb9ZdFNNk
	 ajib3GyIGf3q2X2pY3NFA/BfeIYmhQLnW+aw1BWIq6BUgxRpHkcOV+GgLzYuZWFov+
	 lPOL3GMWbcCkQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Peng Hongchi <hongchi.peng@siengine.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sasha Levin <sashal@kernel.org>,
	hminas@synopsys.com,
	linux-usb@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 04/13] usb: dwc2: gadget: Don't write invalid mapped sg entries into dma_desc with iommu enabled
Date: Sun, 28 Jul 2024 12:08:46 -0400
Message-ID: <20240728160907.2053634-4-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240728160907.2053634-1-sashal@kernel.org>
References: <20240728160907.2053634-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.15.164
Content-Transfer-Encoding: 8bit

From: Peng Hongchi <hongchi.peng@siengine.com>

[ Upstream commit 1134289b6b93d73721340b66c310fd985385e8fa ]

When using dma_map_sg() to map the scatterlist with iommu enabled,
the entries in the scatterlist can be mergerd into less but longer
entries in the function __finalise_sg(). So that the number of
valid mapped entries is actually smaller than ureq->num_reqs,and
there are still some invalid entries in the scatterlist with
dma_addr=0xffffffff and len=0. Writing these invalid sg entries
into the dma_desc can cause a data transmission error.

The function dma_map_sg() returns the number of valid map entries
and the return value is assigned to usb_request::num_mapped_sgs in
function usb_gadget_map_request_by_dev(). So that just write valid
mapped entries into dma_desc according to the usb_request::num_mapped_sgs,
and set the IOC bit if it's the last valid mapped entry.

This patch poses no risk to no-iommu situation, cause
ureq->num_mapped_sgs equals ureq->num_sgs while using dma_direct_map_sg()
to map the scatterlist whith iommu disabled.

Signed-off-by: Peng Hongchi <hongchi.peng@siengine.com>
Link: https://lore.kernel.org/r/20240523100315.7226-1-hongchi.peng@siengine.com
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/usb/dwc2/gadget.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/dwc2/gadget.c b/drivers/usb/dwc2/gadget.c
index f6b2a4f2e59d9..4422da5613652 100644
--- a/drivers/usb/dwc2/gadget.c
+++ b/drivers/usb/dwc2/gadget.c
@@ -886,10 +886,10 @@ static void dwc2_gadget_config_nonisoc_xfer_ddma(struct dwc2_hsotg_ep *hs_ep,
 	}
 
 	/* DMA sg buffer */
-	for_each_sg(ureq->sg, sg, ureq->num_sgs, i) {
+	for_each_sg(ureq->sg, sg, ureq->num_mapped_sgs, i) {
 		dwc2_gadget_fill_nonisoc_xfer_ddma_one(hs_ep, &desc,
 			sg_dma_address(sg) + sg->offset, sg_dma_len(sg),
-			sg_is_last(sg));
+			(i == (ureq->num_mapped_sgs - 1)));
 		desc_count += hs_ep->desc_count;
 	}
 
-- 
2.43.0


