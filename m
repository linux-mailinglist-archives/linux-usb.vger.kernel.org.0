Return-Path: <linux-usb+bounces-20219-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 682C4A2A5EA
	for <lists+linux-usb@lfdr.de>; Thu,  6 Feb 2025 11:36:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8E988167D5B
	for <lists+linux-usb@lfdr.de>; Thu,  6 Feb 2025 10:36:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBDBD227B89;
	Thu,  6 Feb 2025 10:36:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ctgdf3FO"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1688A22759D
	for <linux-usb@vger.kernel.org>; Thu,  6 Feb 2025 10:36:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738838184; cv=none; b=iikMhcGzO7lmykzilbdi0jXtjXxemlRhc6u1HQhZ4K2zlXeEWZVrNDauEue4FRGcYUIuyAq0EHJ5tEiL8CXc5jzSZCsnllRS379G4sP6kY5y5i3HnRev1p27o4ZxbhWwjVB2Wll03VDOOsOVQMhuqM7dwlDLsCc8eCaZJJdrdds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738838184; c=relaxed/simple;
	bh=6bCobt3br1NrxP04QOTionRb3Wz6gsB9BodXRYt1xU4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Y7spts3/Y1Ei+tyMl9pOF4XGZ5yryFHl3KgOJkjdmKnV8XGejqTZKqDbfCPRNkKCP5l41vwVndRob7N7iEJ0bS58NTrPNoiNLUQZfrF9SY7gyK7cBMMKPoorX5IIMyLXXZ3uZXEYG6xOziaJJLF56mlb+vcmrypm6elT2iyOVcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ctgdf3FO; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738838183; x=1770374183;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=6bCobt3br1NrxP04QOTionRb3Wz6gsB9BodXRYt1xU4=;
  b=Ctgdf3FOVdFEgjDQeXiCbI16KC16I7FBrON3ZgjY4I1/tvdr7j8nmWUj
   I5oyncaT/QCE92CkdUSg8tZfGVevnBrsgE+8QyipVU6ok85cG4r8LoqWG
   ULhp3kmOBJO77IRL1Kw/foguaZPEch2qdj0DmT26vLcuRmMJ0Qha0XH07
   6s7ARry7bK+E0KcSUjaiTj80mIcJjAgUxcutWpem8zDn0wmrkSHk//Hym
   UOSpT/Emhue5I5RbfrhgevdB47/4TCZVJq6KopQrhpWQgyaFq/K4uZMy3
   Apy10bkV7rtF6lC81dIXF6mLsdVpyS3p5egP+V50NYXCb2Ou0nCYiAvdL
   Q==;
X-CSE-ConnectionGUID: 21y66ZxfQnSXGP4ZUBwWOA==
X-CSE-MsgGUID: 66yybsQeSKSBVFHkYMVrZg==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="50073842"
X-IronPort-AV: E=Sophos;i="6.13,264,1732608000"; 
   d="scan'208";a="50073842"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2025 02:34:44 -0800
X-CSE-ConnectionGUID: 19lnvv7hQ7Kt5udqeCMAcQ==
X-CSE-MsgGUID: CCbwYrToTvu0n8Upn/l0Zg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,264,1732608000"; 
   d="scan'208";a="111370790"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa008.fm.intel.com with ESMTP; 06 Feb 2025 02:34:32 -0800
Received: by black.fi.intel.com (Postfix, from userid 1058)
	id BA874EE; Thu, 06 Feb 2025 12:34:30 +0200 (EET)
From: Niklas Neronin <niklas.neronin@linux.intel.com>
To: mathias.nyman@linux.intel.com
Cc: linux-usb@vger.kernel.org,
	Niklas Neronin <niklas.neronin@linux.intel.com>
Subject: [PATCH 0/4] usb: xhci: improve trb_in_td()
Date: Thu,  6 Feb 2025 12:34:24 +0200
Message-ID: <20250206103428.1034784-1-niklas.neronin@linux.intel.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Function td_in_trd() checks whether a DMA address is within the TDs
boundaries. This patch set aims to simplify and improve trb_in_td().

Additionally, the rework will enable trb_in_td() (with renaming and minor
modifications) to also check whether a DMA address is in a ring queue.
This will be utilized in the upcoming handle_tx_event() rework.

Example of a Ring Structure:
The example segment ring is composed of three segments (A, B, C), each
containing three TRBs (1, 2, 3). Any segment can serve as the start or
end segment, and any TRB within the start segment can be the start TRB,
and vice versa.

      +---+   +---+   +---+
C --> | A |-->| B |-->| C |--> A
      +---+   +---+   +---+
        |       |       |
      +---+   +---+   +---+
      | 1 |   | 1 |   | 1 |
      | 2 |   | 2 |   | 2 |
      | 3 |   | 3 |   | 3 |
      +---+   +---+   +---+

Niklas Neronin (4):
  usb: xhci: refactor trb_in_td() to be static
  usb: xhci: move debug capabilities from trb_in_td() to
    handle_tx_event()
  usb: xhci: rework and simplify trb_in_td()
  usb: xhci: modify trb_in_td() to be more modular

 drivers/usb/host/xhci-ring.c | 143 ++++++++++++++++++-----------------
 drivers/usb/host/xhci.h      |   2 -
 2 files changed, 72 insertions(+), 73 deletions(-)

-- 
2.47.2


