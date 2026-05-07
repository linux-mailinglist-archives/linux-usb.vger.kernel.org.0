Return-Path: <linux-usb+bounces-37068-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aP0pLxJT/GlOOAAAu9opvQ
	(envelope-from <linux-usb+bounces-37068-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 07 May 2026 10:53:38 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 379E44E52D5
	for <lists+linux-usb@lfdr.de>; Thu, 07 May 2026 10:53:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A61D63035A97
	for <lists+linux-usb@lfdr.de>; Thu,  7 May 2026 08:41:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42C18383C9E;
	Thu,  7 May 2026 08:41:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VpqBGa3n"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35E22390CB7
	for <linux-usb@vger.kernel.org>; Thu,  7 May 2026 08:40:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778143263; cv=none; b=M9cyKs0l0j/As0UtH0H63U0feUKAEHhCh/3JzHUk1dxas6j9NA+HTIMRQX2ACnU5G7eNIDhTRsbPSfcjx/upj7Qynncmu6HbuJAhPdShtGGrFNJT3C638YiyLOiMRt/eNvb7h0gvPX21PYTq6wOEDQQtAxoDP3r7ktuSCtYCYYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778143263; c=relaxed/simple;
	bh=xYnbjo0MUNE4LeJjqeSUyFmi6GdlCIcUNNGyrwyOlB8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=H2YuTvlqabwgIEC3EBDMYzjol0VCJoHunlXMIMMS2J+PgLBebUA8taj06O0tLW6VPmkeJ95P47S3oqX44PBBjBnvqenl25LDR41L+I1P71tGt1tk28Jw6N4AVsTOiufltc/oUQowXDWsmO7c7F8SWBAAd9S0wSLkuJbbhniqJGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VpqBGa3n; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778143257; x=1809679257;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=xYnbjo0MUNE4LeJjqeSUyFmi6GdlCIcUNNGyrwyOlB8=;
  b=VpqBGa3nTFBJW0XUAM3KedgzJNwovXq7pvqRD/bsG+vLWQv1wWWfD61S
   +mjNGzHOTPRcJzzUv65bqqlHcWS9vRY+9a0lcV0AqimpiJ2SAybELnDYt
   0W/9s50fTXi8xWqOMI+bt85zP5SuwDEku19PYpkIYXPvaiDPVIxp9EfRV
   aDDAfKHOJrRBZjDalme7LcvWaW2IHCGcXuTH1yZIPKfO7h2ZZIS+FOMSy
   5/EOv+ee17qFoIvXrC1Rxkyg95+YHkcWMW5BBVS1L4erzHMG/vdOV8j1V
   6Uyeg4vC0OYlIcBBilMVVnkOZQod5fBkksMHf6UGclLExIyi1G+qquNlU
   g==;
X-CSE-ConnectionGUID: 57YgUxPGQrGJsStEXEGqGQ==
X-CSE-MsgGUID: LXlROyv4SCmKP+QmVsOzNA==
X-IronPort-AV: E=McAfee;i="6800,10657,11778"; a="82932287"
X-IronPort-AV: E=Sophos;i="6.23,221,1770624000"; 
   d="scan'208";a="82932287"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2026 01:40:53 -0700
X-CSE-ConnectionGUID: ps2eOFGrT6O+cY0eEVGWIg==
X-CSE-MsgGUID: Gr3IBRjTTBmOMqWVSi6Vvw==
X-ExtLoop1: 1
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa003.fm.intel.com with ESMTP; 07 May 2026 01:40:52 -0700
Received: by black.igk.intel.com (Postfix, from userid 1058)
	id A161595; Thu, 07 May 2026 10:40:50 +0200 (CEST)
From: Niklas Neronin <niklas.neronin@linux.intel.com>
To: mathias.nyman@linux.intel.com
Cc: linux-usb@vger.kernel.org,
	Niklas Neronin <niklas.neronin@linux.intel.com>
Subject: [PATCH 0/3] usb: xhci: allocate arrays based on supported slot amount
Date: Thu,  7 May 2026 10:39:42 +0200
Message-ID: <20260507083945.959370-1-niklas.neronin@linux.intel.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 379E44E52D5
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37068-lists,linux-usb=lfdr.de];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[niklas.neronin@linux.intel.com,linux-usb@vger.kernel.org];
	RCPT_COUNT_THREE(0.00)[3];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-usb];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Action: no action

The xHCI specification allows for up to 255 device slots, but the actual
number of slots supported by the controller may be lower.

Prior to this patch, the xhci driver allocated the devices and device
context pointer arrays to 255 slots, regardless of the supported amount.
Each entry is 8 bytes, which results in 4080 bytes being allocated even
on systems that support far fewer slots.

Address this by allocating these arrays based on the number of slots
supported by the controller. This approach is consistent with how the
driver already handles allocation for ports and interrupters.

Niklas Neronin (3):
  usb: xhci: refactor DCBAA struct
  usb: xhci: allocate DCBAA based on host controller max slots
  usb: xhci: allocate internal DCBAA mirror dynamically

 drivers/usb/host/xhci-mem.c  | 54 +++++++++++++++++++++---------------
 drivers/usb/host/xhci-ring.c |  6 ++--
 drivers/usb/host/xhci.c      | 10 +++----
 drivers/usb/host/xhci.h      | 27 ++++++++++--------
 4 files changed, 54 insertions(+), 43 deletions(-)

-- 
2.50.1


