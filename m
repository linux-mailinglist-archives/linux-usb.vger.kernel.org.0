Return-Path: <linux-usb+bounces-22872-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 33931A837E4
	for <lists+linux-usb@lfdr.de>; Thu, 10 Apr 2025 06:37:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2025D465789
	for <lists+linux-usb@lfdr.de>; Thu, 10 Apr 2025 04:37:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 464F01EA7CB;
	Thu, 10 Apr 2025 04:37:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZAuxX0DS"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C05CC259C
	for <linux-usb@vger.kernel.org>; Thu, 10 Apr 2025 04:37:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744259855; cv=none; b=WMxufiwI/8tQwmMQCht4kTiLWul2leWebqBeuPVM7Mb3AgN80xpTXjW5u5IPIh/AyT6/9LrHoZamv+qj2wnfhPpHSi101lxVHKdUfNV41+NU054uLaZGsb/SFKzQeNxpy+2eKFtW9PCI1i/d1+APGTvps8b+9CgH4F5qxk5/4GU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744259855; c=relaxed/simple;
	bh=N7JuGvtHxEqezCvsKywGD/8jJxWLtdGtWJiNza9vGxI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=o0pYkyUoWUeoYltw389LTgITYRK5sG+KkQesabd9GxvXH/+x4Z0r28Gwnpb1j2nXM3+WGG6N+pWlzv7BkWgcUlinutb5e4NOJ4JfcqxM5a8XHqJ5sJfgM9r+aBzMFWiINXZDx4asF47A3GnspjQ1SBGJtwfhwbqbYEupiVAAWMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZAuxX0DS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1721DC4CEDD;
	Thu, 10 Apr 2025 04:37:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744259855;
	bh=N7JuGvtHxEqezCvsKywGD/8jJxWLtdGtWJiNza9vGxI=;
	h=From:To:Cc:Subject:Date:From;
	b=ZAuxX0DSqESXghzgbZ+tWGuNfBC+bUUrSoja2BiIBwpyxb2ZChljNkBIPQ3VoOqfy
	 AM5Y7xegy6HWKtrcKhqbtcKsZHl22L99A/rH9dapPQEVOXeig/myLykFYQQEvGwzHy
	 /59gPCGvyzym4F1mzpvc9Q/udVpY2OlXmK59wzoJK4oqUZOxh50KRqetto1Grv5zDR
	 6wYATU32Ehq4/e7NgOVZagThD3NM0Fi4xUHDgXtCzUs8Wv7yGV4yugmfcpL24qnyZ0
	 iX9Eb3p4SXFju4xqCPRULkPInqRtAvh8W5hcw/v4/swPszOUGPSAtMIv/HXkVFlMOi
	 qhF+E8s1tZUnQ==
From: Mario Limonciello <superm1@kernel.org>
To: mario.limonciello@amd.com,
	andreas.noever@gmail.com,
	michael.jamet@intel.com,
	westeri@kernel.org,
	YehezkelShB@gmail.com
Cc: Opal Voravootivat <puthik@google.com>,
	Raul Rangel <rrangel@chromium.org>,
	Utkarsh Patel <utkarsh.h.patel@intel.com>,
	Richard Gong <richard.gong@amd.com>,
	Sanath S <sanath.s@amd.com>,
	linux-usb@vger.kernel.org
Subject: [PATCH] thunderbolt: Use wake on connect and disconnect over suspend
Date: Wed,  9 Apr 2025 23:36:57 -0500
Message-ID: <20250410043717.2291559-1-superm1@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mario Limonciello <mario.limonciello@amd.com>

Wake on connect is useful for being able to wake up a suspended
laptop without opening the lid by plugging into a dock.

Add the default policy to the USB4 router when wakeup is enabled
for the router.  Behavior for individual ports can be controlled
by port wakeup settings.

Cc: Opal Voravootivat <puthik@google.com>
Cc: Raul Rangel <rrangel@chromium.org>
Cc: Utkarsh Patel <utkarsh.h.patel@intel.com>
Cc: Richard Gong <richard.gong@amd.com>
Cc: Sanath S <sanath.s@amd.com>
Link: https://lore.kernel.org/linux-usb/20250410042723.GU3152277@black.fi.intel.com/T/#m0249e8c0e1c77ec92a44a3d6c8b4a8e5a9b7114e
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 drivers/thunderbolt/switch.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/thunderbolt/switch.c b/drivers/thunderbolt/switch.c
index 6a2116cbb06f9..28febb95f8fa1 100644
--- a/drivers/thunderbolt/switch.c
+++ b/drivers/thunderbolt/switch.c
@@ -3599,6 +3599,7 @@ void tb_switch_suspend(struct tb_switch *sw, bool runtime)
 		flags |= TB_WAKE_ON_USB4;
 		flags |= TB_WAKE_ON_USB3 | TB_WAKE_ON_PCIE | TB_WAKE_ON_DP;
 	} else if (device_may_wakeup(&sw->dev)) {
+		flags |= TB_WAKE_ON_CONNECT | TB_WAKE_ON_DISCONNECT;
 		flags |= TB_WAKE_ON_USB4 | TB_WAKE_ON_USB3 | TB_WAKE_ON_PCIE;
 	}
 
-- 
2.43.0


