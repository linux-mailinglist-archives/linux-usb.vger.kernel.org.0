Return-Path: <linux-usb+bounces-2646-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BD0A7E4CCC
	for <lists+linux-usb@lfdr.de>; Wed,  8 Nov 2023 00:23:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BC5B81C20BFC
	for <lists+linux-usb@lfdr.de>; Tue,  7 Nov 2023 23:23:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36FD93067D;
	Tue,  7 Nov 2023 23:23:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g+UToxR/"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B90E30670
	for <linux-usb@vger.kernel.org>; Tue,  7 Nov 2023 23:23:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F9F0C433CD;
	Tue,  7 Nov 2023 23:23:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699399415;
	bh=T2WHswAAhfKS2jYhrFvo4RtsljSxrhqjsIsZmlPUiu4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=g+UToxR/dx2hu4y8NiFlg6QPG4ehri7RysHkdHRcOvE7pOxvQ3BfAKHlwQ9mAow/r
	 VG11girZm8ty5ARXNFWVsQVzDomP8pRwTd03UU27DGi82YguVhhbOiuhTKaYCNYYGA
	 E+dXXar+wOsKNa0OLIQtjDjWqpuQmmhNfQk+tg+pfcnXbwVAUuMzJ3egTqSDfFxwHl
	 3kr98cxlSaFyIDk80NkFMAGs1fKMEMKv8DS/sGZQBPj/8c5rySlWvDB1DFxVKlezs9
	 d1SD/tIsGJgUzov6msTVfICLJ8zRgkRd9sBBsQPQZEwYPqMFyG5WE6wwsMk3VvItgX
	 wsyQMikrla22w==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>,
	Sasha Levin <sashal@kernel.org>,
	andreas.noever@gmail.com,
	michael.jamet@intel.com,
	YehezkelShB@gmail.com,
	linux-usb@vger.kernel.org
Subject: [PATCH AUTOSEL 6.5 02/18] thunderbolt: Apply USB 3.x bandwidth quirk only in software connection manager
Date: Tue,  7 Nov 2023 18:22:57 -0500
Message-ID: <20231107232330.3776001-2-sashal@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231107232330.3776001-1-sashal@kernel.org>
References: <20231107232330.3776001-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.5.10
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
index 488138a28ae13..e6bfa63b40aee 100644
--- a/drivers/thunderbolt/quirks.c
+++ b/drivers/thunderbolt/quirks.c
@@ -31,6 +31,9 @@ static void quirk_usb3_maximum_bandwidth(struct tb_switch *sw)
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


