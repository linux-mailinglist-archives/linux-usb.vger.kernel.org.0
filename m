Return-Path: <linux-usb+bounces-28238-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6644AB81E39
	for <lists+linux-usb@lfdr.de>; Wed, 17 Sep 2025 23:08:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E1305188DCD5
	for <lists+linux-usb@lfdr.de>; Wed, 17 Sep 2025 21:08:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70EFD2C21D8;
	Wed, 17 Sep 2025 21:08:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QCNuVtYr"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 672EB2882DB
	for <linux-usb@vger.kernel.org>; Wed, 17 Sep 2025 21:08:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758143292; cv=none; b=ZxmLESqMrpLth3G8A4xuzFK/xkA+UBeVcCeW52sLQxAHPqc+29sWrVkt3vu1UsFlIQkLSmjBvItZmv5bL0hQ+d6UNPre6IOszEhhi90MVIoKCA2jFNRXIcOWE46RfrP6tTtBe83w0IRjAzWVgxxrcpA6Uw/hRpOocIgyZlBDOgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758143292; c=relaxed/simple;
	bh=G474qLjY289Uhv3Zo/eRoaKLxY4RknIiLLJ9k88gqI4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IuopHcmDOZm5ScEEV5XVnLEfEFyfRYM5l2SwzSmyqS00HRM3P3KkCS75Ab4HW2te40QPdTqHqJQQvQ5zMOP+MNigYPQjl8ZvAjrOnWH7BMbjeNULX9his0DsENzZW680dt2haygDaCYusEEvbqQ4+r+p0SPTrYi9Cq/QmnBQSlk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QCNuVtYr; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758143290; x=1789679290;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=G474qLjY289Uhv3Zo/eRoaKLxY4RknIiLLJ9k88gqI4=;
  b=QCNuVtYrLDC/ghWL07prmVg/6JeBd+WoxcdtGdl6Tv67oM1qjUc0CIRi
   KZEWeO17DTv8E4spT+Ctbe4gHwo6KSBCSHxRW6IUEFJiVia2QCtn/e31V
   sM7UMMakLlqVkK0nL5KwBZ6tDZyepzBAMrFVEE/W2csR2n2gRoty4+heG
   APJJHftVuLwuVvGqHVrsxEd/gYMUFaJWm02RVSwMA2WQiVTj+YtXCsaS0
   HWDtr6sy2JwgvUjndPPnTcg+MFYxHcyWLhv1wcR9lWgHMYilLX+5YhVWD
   nxSQJTCvldnQSCuKJOKLGOFnNg3DS0UUK9S45edbDTibczoS4SMv7XL1c
   g==;
X-CSE-ConnectionGUID: nm5ARCRcSk+Itqr5Ib6z+w==
X-CSE-MsgGUID: qNMSm7s0TUOiCcrHSodXqQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11556"; a="48038200"
X-IronPort-AV: E=Sophos;i="6.18,273,1751266800"; 
   d="scan'208";a="48038200"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2025 14:08:10 -0700
X-CSE-ConnectionGUID: omcLoXvZRSuCUgCOFj9BnQ==
X-CSE-MsgGUID: zGzYWk71SDSENXoYFThfnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,273,1751266800"; 
   d="scan'208";a="175800180"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO mnyman-desk.home) ([10.245.244.42])
  by fmviesa009.fm.intel.com with ESMTP; 17 Sep 2025 14:08:09 -0700
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 0/6] xhci features for usb-next
Date: Thu, 18 Sep 2025 00:07:19 +0300
Message-ID: <20250917210726.97100-1-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Greg

A few small xhci changes and features for usb-next, including support
for PCI based xhci hosts with only USB2 ports, and align xhci trace and dynamic
debug log port numbering

Michal Pecio (2):
  Revert "usb: xhci: Avoid Stop Endpoint retry loop if the endpoint
    seems Running"
  usb: xhci: Update a comment about Stop Endpoint retries

Niklas Neronin (4):
  usb: xhci-pci: add support for hosts with zero USB3 ports
  usb: xhci: improve TR Dequeue Pointer mask
  usb: xhci: correct indentation for PORTSC tracing function
  usb: xhci: align PORTSC trace with one-based port numbering

 drivers/usb/host/xhci-pci.c   | 42 ++++++++++++++++++++---------------
 drivers/usb/host/xhci-ring.c  | 24 +++++++++-----------
 drivers/usb/host/xhci-trace.h | 34 ++++++++++++++--------------
 drivers/usb/host/xhci.h       |  3 ++-
 4 files changed, 54 insertions(+), 49 deletions(-)

-- 
2.43.0


