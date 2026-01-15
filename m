Return-Path: <linux-usb+bounces-32411-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C1FDD2947B
	for <lists+linux-usb@lfdr.de>; Fri, 16 Jan 2026 00:38:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F29C930402A3
	for <lists+linux-usb@lfdr.de>; Thu, 15 Jan 2026 23:38:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8E44330B34;
	Thu, 15 Jan 2026 23:38:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E0k4dXr3"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EB7E30B507
	for <linux-usb@vger.kernel.org>; Thu, 15 Jan 2026 23:38:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768520299; cv=none; b=sXJ+s2KFGl0Po/h0cHvDahiiOFKj5oe8+pt7vS2ddbiNQfos9aWI08KJ7unIkrffqZNPQI7J1htMGKxiAQhLF+D2R9aMnDlIptqGHanGK0iFUKW6Kru2Plmz2GkqBOxlO53SC7iZSCIvYHsnILIwXW9+kSjAinHkryPbAUpwLYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768520299; c=relaxed/simple;
	bh=BXIKmWMhOqHMab74qmmzQ+0yFxg9gbnrAX+iB91l4xQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Pq7tjzE9mZ9eTmbzWiTPo1Ef8dY7adOtNbZCePiLx16KGOqSPvbZkQbYLolEwwmKLNko2JF5Y08GwWnJNDxh/vrcSFr/mcyPrq/SgH7hGm5xqZU4K33/MLfytRliQAWrC9SiG4uvgTAEeIWkwbTMzTinTfO80qHkLlf0XzZsqOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E0k4dXr3; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768520297; x=1800056297;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=BXIKmWMhOqHMab74qmmzQ+0yFxg9gbnrAX+iB91l4xQ=;
  b=E0k4dXr3F/SXVTR+WfhFaDU8gvkL6J8XQdt4GqpfNkuLhoB641j8D4nn
   mOAZuV6Bmkhhz5i/4N2/9K2tb2tPOLgzEK17FUC9XZjgEzFWpQBwZStny
   /cHORLCjam9AhuSKfE+yXYC5dtL1yV+7EE4+PVumvU/zh6plKPg1an/+Q
   53mcTYw+sp3K8/c77Gbr2FZc2rzfFz+29f3gCO/8v029ymWNwmPAc2izt
   HUhlvuVnD/hymI384o90fg8f+Z1WTcE3oAmCjdSAU7LfeTE65+knKfGq3
   moDsYAifkZYcU49dpjuAzbqHwnyySsrKY9hloAdEQ+whR2QfBhxyqeGio
   A==;
X-CSE-ConnectionGUID: EkK1hQ9sTZ+ZFBMUeD8CHA==
X-CSE-MsgGUID: 00FSNyf9TfqMRPoeUu9qYQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11672"; a="69891640"
X-IronPort-AV: E=Sophos;i="6.21,229,1763452800"; 
   d="scan'208";a="69891640"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2026 15:38:17 -0800
X-CSE-ConnectionGUID: sLVCbzgeQYydYUGzHcWgyQ==
X-CSE-MsgGUID: MUdUdzlGQweFo+6q26eaNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,229,1763452800"; 
   d="scan'208";a="236336655"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO mnyman-desk.home) ([10.245.245.7])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2026 15:38:16 -0800
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 0/1] xhci fixes for usb-linus
Date: Fri, 16 Jan 2026 01:37:57 +0200
Message-ID: <20260115233758.364097-1-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Greg

One patch for usb-linus that fixes the audio sideband crash Lianqin
recently found during suspend/resume testing

Thanks
Mathias

Mathias Nyman (1):
  xhci: sideband: don't dereference freed ring when removing sideband
    endpoint

 drivers/usb/host/xhci-sideband.c |  1 -
 drivers/usb/host/xhci.c          | 15 ++++++++++++---
 2 files changed, 12 insertions(+), 4 deletions(-)

-- 
2.43.0


