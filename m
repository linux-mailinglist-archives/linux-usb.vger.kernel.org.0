Return-Path: <linux-usb+bounces-23718-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C9F1FAA93B8
	for <lists+linux-usb@lfdr.de>; Mon,  5 May 2025 14:57:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 68C671886937
	for <lists+linux-usb@lfdr.de>; Mon,  5 May 2025 12:57:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BBF72512D6;
	Mon,  5 May 2025 12:57:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jw4fXRko"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8CF72512E5
	for <linux-usb@vger.kernel.org>; Mon,  5 May 2025 12:57:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746449844; cv=none; b=JQjhyfVuSgfFXMMx4VcbfQoB0S4ojo6LBLWhgQqB02zy8Z8TDnSWm+F2y6+QL04GrVoXFAUwa7nIHv/7ABaedpgTue98uk3sCknfQt2hwX8/i2dpbeh19iWeZcOy93tddM+C7uJEgIuwjnL5PR0PE+tXCZ4ABgB2L956KTzYTtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746449844; c=relaxed/simple;
	bh=Qmr2PpjmSbDjRLZGwIajUn3a2kXLh/OpxPxj8PK6lfw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=OzhwxFaj9woWXL4uK/ro2nd07VGwwS6xRDwnrg4egUhjktoPMmeBB4mLjkDr6jEva9gJ5aMW7+GLbME1QgrTvhpgBw8iGW3SggJof1MfXi4HFlrYO7+nbdAQBEAzfJG8m7l7w5keQx9EJEkJwORjwVRAZedChj0rJNGRuUMJrCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jw4fXRko; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746449843; x=1777985843;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Qmr2PpjmSbDjRLZGwIajUn3a2kXLh/OpxPxj8PK6lfw=;
  b=jw4fXRkoEWLWwvWraBytQ2735F3gzv2Sqo4xQCRo607yFMzoeieJWHVS
   3PufFl5LcrqDZM9LMVSPX+OZ8yaNZF/dulKxU2ByQR9OcKPYqo5vsFKJo
   Le5Mz/KInE7/u7xZkpITOIQjP1+YP4Pf2fcJnLkfzuvQZBT3SGLhOVpvz
   njpabjP14vdGNZMq6gcQTjiAvCutYY91V+8bU40mIO69S1o78DKzkYa3v
   ga4NDCLPQBBC2eY6N5oH1NRRNaN3dsSjIEO6mKq/lyeRl4T/pxuH24fxZ
   gHoJZxaziqgzDmhRLEjF7QSvL+RM+5wY8Qg+mu8/1/YSEGLgoyT76tWVJ
   A==;
X-CSE-ConnectionGUID: tMDI20P0S6uzXVkHE5hQ8A==
X-CSE-MsgGUID: o9zHbziBTiOMSwEzVk595Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11423"; a="35675900"
X-IronPort-AV: E=Sophos;i="6.15,262,1739865600"; 
   d="scan'208";a="35675900"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2025 05:57:20 -0700
X-CSE-ConnectionGUID: od+wMQ7LSxKfmgwHaPG4Cw==
X-CSE-MsgGUID: fUXqiXR+RTywTBN8Tr7p2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,262,1739865600"; 
   d="scan'208";a="135151077"
Received: from unknown (HELO mnyman-desk.fi.intel.com) ([10.237.72.199])
  by orviesa010.jf.intel.com with ESMTP; 05 May 2025 05:57:18 -0700
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 0/2] xhci fixes for usb-linus
Date: Mon,  5 May 2025 15:56:28 +0300
Message-ID: <20250505125630.561699-1-mathias.nyman@linux.intel.com>
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

A couple xhci fixes for usb-linus.

Fix one DbC busyloop issue, and a VIA vendor specific issue.
The VIA issue is not marked for stable (yet) as it changes code
in the active path for all hosts.
A previous attempt at solving this caused regression, so letting
this get some real life exposure before adding it to stable.

Thanks
Mathias

Mathias Nyman (1):
  xhci: dbc: Avoid event polling busyloop if pending rx transfers are
    inactive.

Michal Pecio (1):
  usb: xhci: Don't trust the EP Context cycle bit when moving HW dequeue

 drivers/usb/host/xhci-dbgcap.c | 19 ++++++++++++++++---
 drivers/usb/host/xhci-dbgcap.h |  3 +++
 drivers/usb/host/xhci-ring.c   | 19 +++++++++----------
 3 files changed, 28 insertions(+), 13 deletions(-)

-- 
2.43.0


