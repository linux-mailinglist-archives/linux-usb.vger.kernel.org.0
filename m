Return-Path: <linux-usb+bounces-18559-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A983B9F45ED
	for <lists+linux-usb@lfdr.de>; Tue, 17 Dec 2024 09:22:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 691D9188F3A7
	for <lists+linux-usb@lfdr.de>; Tue, 17 Dec 2024 08:22:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E913E1DA619;
	Tue, 17 Dec 2024 08:22:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mp9yLF7W"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FCC2155393
	for <linux-usb@vger.kernel.org>; Tue, 17 Dec 2024 08:22:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734423747; cv=none; b=AbDckBVWI7N04uKdWiHf54Kfo63OQmPUQtVsZ3nP+SafRgxZShVb5jhZynmZbKws6H8wn7+sTyIBwYhtWZ11A82vLQqQ3HNonuyx8RHtD/lWlJyRkjTB07qmmDh7XbhRzP3vtK6nXwrklUWpXtZ9VHxH1kZ4IEltw1Edy606/s8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734423747; c=relaxed/simple;
	bh=ZsV42QiP5d4Xli9sIZfMFhDkvtsIy9/WRckjSnevGEM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hCyIhSppOZGMAIWN/R72bePbnqOojQQRSq28iF7GkzvNfyRRcjV5W/eU3aG7auIjRDNnJbXHSoKqQOsUK/ll4JCe65ieghtmINxqVjv7k/n11XNYOWJKiHKmy/ED5goltsZaKrNpFp6llk6Yt+H6AKfy6puK4n8DbC0Apo4nUAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mp9yLF7W; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734423746; x=1765959746;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ZsV42QiP5d4Xli9sIZfMFhDkvtsIy9/WRckjSnevGEM=;
  b=mp9yLF7WX/KYa14TmBZfKq4XXjxJAACGAIJsbp3ChW/+hqAp6pqSWI5o
   io9ho0oSyMD69WfnD8EAttFzpCW4H6gcIXGCO1vrK9BWeytuz0SEkry5+
   luy0mNd+TU+P5T6MneA+bZN+t9p07dTWZxPZmy+TMfZwwexS834ozisC7
   6KIsnOtv37Y2d+W5mzmO6DLX0WURZD4Fs7fKNMpGYZWu+2ebfU5HXPu1m
   QcFFzL5bH3auXOZu6hZ/dFBPaa5CqpTmPoAafDeYH05/egUmwbZmjuZ6M
   0/2H9ck6hotr9U5E7X3FSnLTrGUCPzcpOMgP/JWFZ5c5D56bNcOd9WijJ
   A==;
X-CSE-ConnectionGUID: SCfzCbMUSPCSk0Wb/E89fg==
X-CSE-MsgGUID: I5KwRkwrSjKk9l5+0mShlg==
X-IronPort-AV: E=McAfee;i="6700,10204,11288"; a="38511430"
X-IronPort-AV: E=Sophos;i="6.12,241,1728975600"; 
   d="scan'208";a="38511430"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2024 00:22:26 -0800
X-CSE-ConnectionGUID: Yb6PeCp4S9edGjMa38jUOg==
X-CSE-MsgGUID: Jik9FvUJSgCEqiqW/q09XQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="102063221"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa005.fm.intel.com with ESMTP; 17 Dec 2024 00:22:24 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id D6D27165; Tue, 17 Dec 2024 10:22:22 +0200 (EET)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 00/12] thunderbolt: Improve DisplayPort tunneling
Date: Tue, 17 Dec 2024 10:22:10 +0200
Message-ID: <20241217082222.528602-1-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi all,

This series provides cleanups and few improvements for DisplayPort
tunneling. First of all we increase the DPRX capabilites read timeout to
cope with the fact that graphics driver may be runtime suspended. Secondly
we move the DPRX negotiation to happen in a separate worker to allow
forward progress even if the graphics driver is not yet loaded (this is
kind if rare case but common in Intel Graphics CI).

Mika Westerberg (12):
  thunderbolt: Drop doubled empty line from ctl.h
  thunderbolt: Log config space when invalid config space reply is received
  thunderbolt: Debug log an invalid config space reply just once
  thunderbolt: Increase DPRX capabilities read timeout
  thunderbolt: Make tb_tunnel_one_dp() return void
  thunderbolt: Show path name in debug log when path is deactivated
  thunderbolt: Rework how tunnel->[init|deinit] hooks are called
  thunderbolt: Drop tb_tunnel_restart()
  thunderbolt: Pass reason to tb_dp_resource_unavailable()
  thunderbolt: Move forward declarations in one place
  thunderbolt: Rework tb_tunnel_consumed_bandwidth()
  thunderbolt: Handle DisplayPort tunnel activation asynchronously

 drivers/thunderbolt/ctl.c    |  11 +-
 drivers/thunderbolt/ctl.h    |   1 -
 drivers/thunderbolt/path.c   |   4 +-
 drivers/thunderbolt/tb.c     | 196 ++++++++++++-----
 drivers/thunderbolt/test.c   |  90 ++++----
 drivers/thunderbolt/tunnel.c | 406 +++++++++++++++++++++--------------
 drivers/thunderbolt/tunnel.h |  61 +++++-
 7 files changed, 494 insertions(+), 275 deletions(-)

-- 
2.45.2


