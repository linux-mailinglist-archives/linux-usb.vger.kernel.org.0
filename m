Return-Path: <linux-usb+bounces-29761-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 205D7C13179
	for <lists+linux-usb@lfdr.de>; Tue, 28 Oct 2025 07:14:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id E53594E5AD1
	for <lists+linux-usb@lfdr.de>; Tue, 28 Oct 2025 06:14:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B5EA29827E;
	Tue, 28 Oct 2025 06:14:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jMTLL0Jw"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 113FB3C38
	for <linux-usb@vger.kernel.org>; Tue, 28 Oct 2025 06:14:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761632043; cv=none; b=PfrXosWtQMJCCOgx3/q/qc4rbltB2aJr0wh5zEtIjZrl8S1kChfRum0Re2iTHNjDLjGKBFkEd6vc1g9qiyoV60jYxqfKZpc6kFjhKZavop2QiYaYnLFre7QNYeuw0YS1mTGfaFWscbIdSaNgY1eMy74/0PaKOO+yKiuMuhBatEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761632043; c=relaxed/simple;
	bh=jhmjYUfmEFh3WQ1HvUzu/nt+M937PJzAGpje4IuXwL4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VN0wsG2jpQV0NOj0rv+D+VJerZfhi4crqz50h7uCkp8y2aLh29mvIr3PR6Oo0GjZ5TU5NDHGkHJriCFKUAhaDTIlRZYf+y6UScEAc4W1m/WspXNU9kubAfcRzrDHnqLkrBlH7cnKwB20CCVhNrMp8DAY6/osTajlETXVlcoFrQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jMTLL0Jw; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761632041; x=1793168041;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=jhmjYUfmEFh3WQ1HvUzu/nt+M937PJzAGpje4IuXwL4=;
  b=jMTLL0JwI4z65WfrGlkIciLR0+U/sUxDQKyjwPCOcI1dtZAI5feAwJ7L
   B2N+vu2B5WBjeTXijHt50Z0BSrysnFK/PUXKWZYzF9yqdaFTSlgT+fFGh
   D1Fgh3WxLeXca66V3rmNCdHJZvjbE63NHGHrjDBjAV7sbBx1xBADvC/S2
   ex9RQRjgzP4br6LSSeLZUQjvmVycTsz7t4a7AbBm5kO9EtraF8uUCZ0E1
   eN/bvyGvxjJmbr8XciTcGbAWJNit5SA0VS+9FRfaYZz8jWv6Bv+TbRG0Y
   S802nBJ1WWt8Z8WgCPH5fitNBV7Vo57EfD6XhCLaNqaIT96EiIiyL7WZV
   Q==;
X-CSE-ConnectionGUID: NA6DHWspT/uMQn5Pi321kA==
X-CSE-MsgGUID: zAtCwN1PTmqRajqNmgz8mg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="75067209"
X-IronPort-AV: E=Sophos;i="6.19,260,1754982000"; 
   d="scan'208";a="75067209"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2025 23:13:59 -0700
X-CSE-ConnectionGUID: BfIx9jlLSvKVhHamwbFesA==
X-CSE-MsgGUID: JrvCQBcRQoeGTSXvO82QYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,260,1754982000"; 
   d="scan'208";a="215912442"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa002.jf.intel.com with ESMTP; 27 Oct 2025 23:13:58 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 1714195; Tue, 28 Oct 2025 07:13:57 +0100 (CET)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 0/2] thunderbolt: Bring the firmware upgrade documentation up-to-date
Date: Tue, 28 Oct 2025 07:13:55 +0100
Message-ID: <20251028061357.2164810-1-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi all,

The recommended way to apply Thunderbolt/USB4 firmware upgrades is through
Linux Vendor Firmware Service (LVFS) and fwupd that are present in most
distros. These patches update the documentation to mention this too.

Alan Borzeszkowski (2):
  thunderbolt: Update NVM firmware upgrade documentation
  thunderbolt: Update deprecated firmware update site in icm.c

 Documentation/admin-guide/thunderbolt.rst | 50 ++++++++++++++++-------
 drivers/thunderbolt/icm.c                 |  2 +-
 2 files changed, 36 insertions(+), 16 deletions(-)

-- 
2.50.1


