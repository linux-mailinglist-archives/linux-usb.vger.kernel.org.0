Return-Path: <linux-usb+bounces-31947-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A918CF6CA5
	for <lists+linux-usb@lfdr.de>; Tue, 06 Jan 2026 06:38:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2ADE330194F8
	for <lists+linux-usb@lfdr.de>; Tue,  6 Jan 2026 05:38:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 741972DEA77;
	Tue,  6 Jan 2026 05:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j2U9XJjK"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED8E014A60C;
	Tue,  6 Jan 2026 05:37:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767677877; cv=none; b=O2NmnLeo8i8YcZNU8BlX/YjI0BQ48hHev2dkRJizCFI9XJMdx97y5c4c6f/YTL+ETei9DYSFNwj3dM0nSQBw+xDoHdyRenXKBSwleDNEIYZyPkCm7ThEhwi2QLU39R7f1avgzyZt9qihqChj7HEvj5KURcMlwJE2RKapBiI/PXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767677877; c=relaxed/simple;
	bh=SCCvw8YNm/wHaEFCIrrtqZPDzgQEq/wH/N3ncc8skLE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lhSx+5idY/ZywdK3sqh8n+Grf5cifDV914NPjxh6wnJdZpIDSDCtruixjCol2at9SNh3O4NnsaHt8ZliuRavOZwtF/YfKSGU78s3MoDSw2ihpqoQs+dXXIqFqIzFP+5CHXrLpfma6cFSoNXals0ypXhBQNMltECfV+QUkmY+b7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j2U9XJjK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A9BAC116C6;
	Tue,  6 Jan 2026 05:37:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767677876;
	bh=SCCvw8YNm/wHaEFCIrrtqZPDzgQEq/wH/N3ncc8skLE=;
	h=From:To:Cc:Subject:Date:From;
	b=j2U9XJjKVdgmY6/HmCInakB5zKzVfTV/Bec7awGCFEJxw5vm31k30gDp3YkRtrkzX
	 fOI0z9bIrHQwgXuVP+eEXf5o5abGeFVg5KqKnY6/ule7tLjkFeJ962k2Q1TXvSPV1b
	 8W92zU6DteNReUUiRx3x7O7wrtqqKqHK0DYmIS41DdaLRfrR82XM+rWMdempet0Z6M
	 A2TX4RPwCavSzTdXq4iJ0p1iLmAEX6DTpg6I+p8PJ2+OdhEkgbh8PTemV+pTPUbcjq
	 hVOr6vhDjYTm+w7+W7JBcDAe8qk3MWiCel9F+UBzBVzDOOHsDFKbbCRAY/v5pAe3as
	 sLX1K3oKKOr/w==
From: "Mario Limonciello (AMD)" <superm1@kernel.org>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: linux-usb@vger.kernel.org (open list:THUNDERBOLT DRIVER),
	linux-kernel@vger.kernel.org,
	Andreas Noever <andreas.noever@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Yehezkel Bernat <YehezkelShB@gmail.com>,
	"Mario Limonciello (AMD)" <superm1@kernel.org>
Subject: [PATCH v2 0/2] thunderbolt: Fix S4 resume incongruities
Date: Mon,  5 Jan 2026 23:37:47 -0600
Message-ID: <20260106053749.61440-1-superm1@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When a machine is restored from S4 if the firmware CM has created
tunnels there can be an incongruity of expectation from the kernel
when compared to booting from S5.  This series addresses those.

v1:
Link: https://lore.kernel.org/linux-usb/20251023050354.115015-1-superm1@kernel.org/

Mario Limonciello (AMD) (2):
  thunderbolt: Move nhi_reset before pmops declaration
  thunderbolt: Reset NHI during S4 restore_noirq() callback

 drivers/thunderbolt/nhi.c | 77 ++++++++++++++++++++++-----------------
 drivers/thunderbolt/tb.c  | 29 ++++++++-------
 drivers/thunderbolt/tb.h  |  1 +
 3 files changed, 61 insertions(+), 46 deletions(-)

-- 
2.43.0


