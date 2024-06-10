Return-Path: <linux-usb+bounces-11060-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9414E901EED
	for <lists+linux-usb@lfdr.de>; Mon, 10 Jun 2024 12:07:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3B171280FAD
	for <lists+linux-usb@lfdr.de>; Mon, 10 Jun 2024 10:07:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FACC78C7F;
	Mon, 10 Jun 2024 10:06:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cBCMLuuK"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCE8D77113
	for <linux-usb@vger.kernel.org>; Mon, 10 Jun 2024 10:06:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718013996; cv=none; b=O9+XBW2BHGt65PPIM+PnY16+jTvU/axvb80/YEtolVHV4uN1oi2kw7frv0ZW/2Pkv8IAix6iQbPhHicn6FJ+lXctAsvT2GXx1Tpm0n9bKAezmqhY8EJsd3awBdKQvzwtZSQckiATnllPY54f+g25JR0k+h2SGLhNV5GwIegQ20A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718013996; c=relaxed/simple;
	bh=ImCWr1gevTlLmylE7rWiGiddeTrZUINULLPv7AeWtBE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MsU5ehUrFr1qcueWSMM5dfwipHBnccJW2lJAIMUIud5EvsAEmGqAF7PO2VYL+TKkIWyF3FKoAZNcjutulNTurDJywR6skanqy3XGwI65BcXk/9L1So4oo+Yft/2yUIYWOkHEipoOjICE6wWMJQjk6Y/yWpkGU0CrOVOwS+yMqRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cBCMLuuK; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718013995; x=1749549995;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ImCWr1gevTlLmylE7rWiGiddeTrZUINULLPv7AeWtBE=;
  b=cBCMLuuKQzX2JH/+PCYraMu2Td96xrrZQouGWc8GYkoZClaTeKZtKJWZ
   wXtsW8Xiv4I3sp8jdzfTNIvJkKuLNpmDEJ11MOjXDAwXM/bT/pudJD86l
   TxeG5IaI4ZjzQN22Nbe9lMPa/qo0viuBN5QJuOO5NJdlwK9pbhQ+KBpIW
   tKQ72qu7z4QUD+KtFBohzEKEtZsu5fX2wkjn+M12wxuf+1PfgK9Q7Yg27
   i8SbBCG1/qSWipcjdoOFi79/lP/SqJQjMRgYqpckeYuWGwCSKwhuPy1Pq
   CpjzC99FDl/SDoxpPCZ1qYUFsGWqNWCakSuENKfeYGhD1oKKh6SjVG2cR
   Q==;
X-CSE-ConnectionGUID: Qtc4EGuTSJSaIf81w0S2KA==
X-CSE-MsgGUID: ct5TrlJ4TcGggJAzA5wNxQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11098"; a="32200990"
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; 
   d="scan'208";a="32200990"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2024 03:06:31 -0700
X-CSE-ConnectionGUID: WIx6MMWHT3qDqmVwxuUdkA==
X-CSE-MsgGUID: M6BMwPXtQgeXG/GCaZZaeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; 
   d="scan'208";a="43590839"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa004.fm.intel.com with ESMTP; 10 Jun 2024 03:06:28 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id C917B1A0; Mon, 10 Jun 2024 13:06:27 +0300 (EEST)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>
Cc: linux-usb@vger.kernel.org,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 0/6] thunderbolt: Sideband access and retimer lane margining support
Date: Mon, 10 Jun 2024 13:06:21 +0300
Message-ID: <20240610100627.3521887-1-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi all,

This series adds USB4 link sideband access through debugfs. This can be
used to run port operations etc. from userspace usable for example in
manufacturing. The other feature is receiver lane margining support for
retimers with similar use case.

Mika Westerberg (6):
  thunderbolt: Move usb4_port_margining_caps() declaration into correct place
  thunderbolt: Make usb4_port_sb_read/write() available outside of usb4.c
  thunderbolt: Add sideband register access to debugfs
  thunderbolt: Split out margining from USB4 port
  thunderbolt: Make margining functions accept target and retimer index
  thunderbolt: Add receiver lane margining support for retimers

 drivers/thunderbolt/Kconfig   |  11 +-
 drivers/thunderbolt/debugfs.c | 623 ++++++++++++++++++++++++++--------
 drivers/thunderbolt/retimer.c |  53 +--
 drivers/thunderbolt/sb_regs.h |   9 +
 drivers/thunderbolt/tb.h      |  47 ++-
 drivers/thunderbolt/usb4.c    | 183 +++++-----
 6 files changed, 657 insertions(+), 269 deletions(-)

-- 
2.43.0


