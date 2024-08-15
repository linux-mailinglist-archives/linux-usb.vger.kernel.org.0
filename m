Return-Path: <linux-usb+bounces-13516-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 768FA9532F0
	for <lists+linux-usb@lfdr.de>; Thu, 15 Aug 2024 16:12:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2AD8A1F21F54
	for <lists+linux-usb@lfdr.de>; Thu, 15 Aug 2024 14:12:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6767F1B3F18;
	Thu, 15 Aug 2024 14:09:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IF3hL7Js"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E9A71AD9C5
	for <linux-usb@vger.kernel.org>; Thu, 15 Aug 2024 14:09:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723730959; cv=none; b=LEG6RsLQejuVOAWFyCZnJJXbAV0LsSbayDOfuqTfm0jcnb3Ootmg4ITaWvZpm2N3hGkNc0KZj7Re9k4EKNuTgR8jZ9CLcAc3v9RhlYgj2cbyqyXavV/Kqztepvmww4dutCAVB4jTXXiYiGEsc6t3DrJi5PvOcsdhUoepETpC14M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723730959; c=relaxed/simple;
	bh=Nito48bbn1FcKY5hnoOXRV8SpEcR8pDqPvp5/BVD4CQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=gcU6t5+0LDtvfWJsJzigh0ix71aoZr9eBvG03JwS9SnI/NqfOzbUpKQhMDJUxo6g4njcy95DyQbfFGUByQGXJm1w85Hp7I9/3kcMghUcbCNPYPampdX19DoTCr4ADBradsGq6u8Qfeg/HC5x4zV8TcpFVuRHmdFMn3t82S/ue1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IF3hL7Js; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723730957; x=1755266957;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Nito48bbn1FcKY5hnoOXRV8SpEcR8pDqPvp5/BVD4CQ=;
  b=IF3hL7Js9F7S8ojYDcX1PhvvFVw+GE/qmcHq1PWsaZODmKmM16i40r8d
   GCIUFCzGfMwa5tWy7388AKK80yeC3hE+ND45Bf4MpQIlbZSm3uHZOPnlJ
   GGrqbjCO7YWza1aowoN/Hicijl4ofzgL5F5d1XXUt7V4Z7VXNX8EaSGx/
   ZiPjtDy5LthwIMKLJq7ojbggl7wo+pyTxkMPM2lPIvhyvvGkTOTjtnkPx
   hNFxw+Ns3e2Soy1Lp5ncFcwBYAsdEg1lkT60AhQYetRzz1PJ2ha2SfEMm
   q8TYQaXpqbpiMIJE0ay2bi8WW3s6dNEPCAh3HMbS45Ae+ERjF5xQgddZw
   g==;
X-CSE-ConnectionGUID: 2gXpIegzTPCN6erTp69puA==
X-CSE-MsgGUID: 0/QrfyfaS+KGIsbJVS/O6w==
X-IronPort-AV: E=McAfee;i="6700,10204,11165"; a="25852512"
X-IronPort-AV: E=Sophos;i="6.10,149,1719903600"; 
   d="scan'208";a="25852512"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2024 07:09:16 -0700
X-CSE-ConnectionGUID: 87VvXevyQDeHtTIAkFJVXw==
X-CSE-MsgGUID: s8JOFuz+Tka3QgM6Q+a/Jw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,149,1719903600"; 
   d="scan'208";a="64022921"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by fmviesa004.fm.intel.com with ESMTP; 15 Aug 2024 07:09:15 -0700
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <linux-usb@vger.kernel.org>,
	<gregkh@linuxfoundation.org>
Cc: Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 0/1] xhci fix for usb-linus
Date: Thu, 15 Aug 2024 17:11:16 +0300
Message-Id: <20240815141117.2702314-1-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Greg

One xhci patch for usb-linus to solve a NULL pointer dereference found recently

Thanks
Mathias

Mathias Nyman (1):
  xhci: Fix Panther point NULL pointer deref at full-speed
    re-enumeration

 drivers/usb/host/xhci.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

-- 
2.25.1


