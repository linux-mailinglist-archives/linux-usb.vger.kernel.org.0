Return-Path: <linux-usb+bounces-35145-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GHY/AK0AvGnqrAIAu9opvQ
	(envelope-from <linux-usb+bounces-35145-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 19 Mar 2026 14:57:01 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 291952CC457
	for <lists+linux-usb@lfdr.de>; Thu, 19 Mar 2026 14:57:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 11CBD3012C90
	for <lists+linux-usb@lfdr.de>; Thu, 19 Mar 2026 13:56:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 151D02D0C97;
	Thu, 19 Mar 2026 13:56:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IO5Kxn09"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F07512C027E
	for <linux-usb@vger.kernel.org>; Thu, 19 Mar 2026 13:56:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773928617; cv=none; b=CNI5t7qwVdzIQPJp2qq6ZRNjDpz8GXAHQW3UUJ2XYRW4rET5we/inbJxW/KKqmk4ehKXfPtjs7quzWAcCMOGiYi+FjTEn8og8x3KnB+cAAjlbE/ApMn+yrvXTRhG5BO43dh7L4LhhmXBztGRvQqR6iitN2siIm7+TFkAu5BATlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773928617; c=relaxed/simple;
	bh=vrsKJ1yA/vD5+ZJs4sl2aE1Bi54xDiW5cuuI+wRplnU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dOZdpcuNW3NeWxu/4+sRl5q2jTkOWNaI2qPipT5Px8TG4CXkDCVlkl2xzYmZBwtM4+Ly8yWMG4WC2RbsUsTqsQjPDx1N5r/YtBBevkuzknjhF9nobUyaC/ZGtiCPvWxbeMGBROmrNQ0+ZwDIIZ/Irpa7Oh5x6E/NhdhICqBjFmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IO5Kxn09; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773928616; x=1805464616;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=vrsKJ1yA/vD5+ZJs4sl2aE1Bi54xDiW5cuuI+wRplnU=;
  b=IO5Kxn09KQlEJF+IN63nFzRBNSdnG9lasy+0lQuv6XuKWRtV40+1PJqA
   S+OBTlDSLieg997tqGd4mTEx44J6IrEEdbay90PdDDp6sS29iLlOLR/Br
   sA2R9lqNTdjPE0y+fix06JRnr3/gcZ3ie/WLswaTl4MLSxwin4i+xuuWr
   apU6krhloKOY2TFk+XhqSK5lHggVfp8FAJqPiXpgoyOTYfiszWck4fNOb
   IdhG3bn30WH0UJlavQlT7CbVZXCKLgDWFW3em0bazehoDyaZROVnldCM9
   FTPspnXyUogyqeM1AjB4bu4htWaetcJQsR1D6RB6gbKBa9Zp93ZL1RCMJ
   A==;
X-CSE-ConnectionGUID: zzwl3BeSReaKUEXvgTqCdA==
X-CSE-MsgGUID: OPtHj4YBTemOYSbQtAlJJQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11734"; a="74971443"
X-IronPort-AV: E=Sophos;i="6.23,129,1770624000"; 
   d="scan'208";a="74971443"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2026 06:56:55 -0700
X-CSE-ConnectionGUID: IVlMQVcmSa6Gb3+ROhbHEg==
X-CSE-MsgGUID: FpMR+uKUTo63wqAav/RyOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,129,1770624000"; 
   d="scan'208";a="223185492"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa007.jf.intel.com with ESMTP; 19 Mar 2026 06:56:54 -0700
Received: by black.igk.intel.com (Postfix, from userid 1058)
	id 32F4A98; Thu, 19 Mar 2026 14:56:53 +0100 (CET)
From: Niklas Neronin <niklas.neronin@linux.intel.com>
To: mathias.nyman@linux.intel.com
Cc: linux-usb@vger.kernel.org,
	Niklas Neronin <niklas.neronin@linux.intel.com>
Subject: [PATCH 0/9] usb: xhci: rework USB request parameter handling
Date: Thu, 19 Mar 2026 14:56:15 +0100
Message-ID: <20260319135626.3077643-1-niklas.neronin@linux.intel.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35145-lists,linux-usb=lfdr.de];
	RCPT_COUNT_THREE(0.00)[3];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[niklas.neronin@linux.intel.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-0.992];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linux.intel.com:mid,intel.com:dkim]
X-Rspamd-Queue-Id: 291952CC457
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Clean up how xhci_hub_control() handles USB hub-class request parameters.
The function receives the raw USB request fields (wValue, wIndex, wLength),
which must be decoded differently depending on the request type. Many of
the decoded values also have direct equivalents inside the xhci driver,
but the code mixes the USB-level representations with the internal xhci
ones.

Standardize the handling by decoding USB request parameters up front and
converting them into the xhci driver's expected internal forms.
Additionally, ensure that the correct macro set is used for the correct
source.

This results in clearer logic, fewer assumptions, and a reduced risk of
mixing USB Chapter 11 values with xhci-specific encodings.

Niklas Neronin (9):
  usb: xhci: stop treating 'wIndex' as a mutable port number
  usb: xhci: rename 'wIndex' parameters to 'portnum'
  usb: xhci: clean up handling of upper bits in SetPortFeature wIndex
  usb: xhci: clean up 'wValue' handling in xhci_hub_control()
  usb: xhci: separate use of USB Chapter 11 PLS macros from
    xHCI-specific PLS macros
  usb: xhci: add PORTPMSC variable to xhci_hub_control()
  usb: xhci: add PORTSC variable to xhci_hub_control()
  usb: xhci: rename parameter to match argument 'portsc'
  usb: xhci: cleanup xhci_hub_report_usb3_link_state()

 drivers/usb/host/xhci-hub.c | 383 +++++++++++++++++-------------------
 1 file changed, 178 insertions(+), 205 deletions(-)

-- 
2.50.1


