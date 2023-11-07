Return-Path: <linux-usb+bounces-2654-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C2017E4CED
	for <lists+linux-usb@lfdr.de>; Wed,  8 Nov 2023 00:24:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7CF6E1C20AD3
	for <lists+linux-usb@lfdr.de>; Tue,  7 Nov 2023 23:24:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 258623454C;
	Tue,  7 Nov 2023 23:24:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="amUiar8+"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D10134540
	for <linux-usb@vger.kernel.org>; Tue,  7 Nov 2023 23:24:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95A4FC433C9;
	Tue,  7 Nov 2023 23:24:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699399465;
	bh=LJ8eOtrvRqn2MCoxinBi1DcpeWZNt4KNVmzOoxSfNfY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=amUiar8+RLUEcz7lvuJ9Ckf0T1DwDkgHVs3ZqT3C5a+Ozjt8Q4XCmH+vt2ElE7zTT
	 mk2PJb3BcCBwQSyxadgDcJYWaHpVBFSxb2QL2DNdgyPjju7G1ZUODy5gxrbhGvT0td
	 j8GAqdT8Qx7EWac/cO4Tns/+6tURHjAW69BCeW+sfelzds7tZ/sHLr/8kJvTXgMpFR
	 pqWHlp2ABSMmR2fNXcjgR4sdOdeoGNTvRTocaqjWutBAKDJ4sJwrzQyo7+OnzZJR2Z
	 qs23KH72cVNAM2pG6iOLmGWMAebthIVX3ZV8ezQRoja7SjLBS3kxdis7gaOoQg4A4y
	 wmtifALDN8wYQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>,
	Sasha Levin <sashal@kernel.org>,
	andreas.noever@gmail.com,
	michael.jamet@intel.com,
	YehezkelShB@gmail.com,
	linux-usb@vger.kernel.org
Subject: [PATCH AUTOSEL 6.1 02/11] thunderbolt: Apply USB 3.x bandwidth quirk only in software connection manager
Date: Tue,  7 Nov 2023 18:24:03 -0500
Message-ID: <20231107232420.3776419-2-sashal@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231107232420.3776419-1-sashal@kernel.org>
References: <20231107232420.3776419-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.1.61
Content-Transfer-Encoding: 8bit

From: Mika Westerberg <mika.westerberg@linux.intel.com>

[ Upstream commit 0c35ac18256942e66d8dab6ca049185812e60c69 ]

This is not needed when firmware connection manager is run so limit this
to software connection manager.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/thunderbolt/quirks.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/thunderbolt/quirks.c b/drivers/thunderbolt/quirks.c
index 8c2ee431fcde8..4ab3803e10c83 100644
--- a/drivers/thunderbolt/quirks.c
+++ b/drivers/thunderbolt/quirks.c
@@ -30,6 +30,9 @@ static void quirk_usb3_maximum_bandwidth(struct tb_switch *sw)
 {
 	struct tb_port *port;
 
+	if (tb_switch_is_icm(sw))
+		return;
+
 	tb_switch_for_each_port(sw, port) {
 		if (!tb_port_is_usb3_down(port))
 			continue;
-- 
2.42.0


