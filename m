Return-Path: <linux-usb+bounces-35865-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yHneG8VuzmnxngYAu9opvQ
	(envelope-from <linux-usb+bounces-35865-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 02 Apr 2026 15:27:33 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id DDB71389B44
	for <lists+linux-usb@lfdr.de>; Thu, 02 Apr 2026 15:27:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DEDD130E52AC
	for <lists+linux-usb@lfdr.de>; Thu,  2 Apr 2026 13:17:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEC002D73B9;
	Thu,  2 Apr 2026 13:17:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nVv2IRM4"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AEAB40DFAC
	for <linux-usb@vger.kernel.org>; Thu,  2 Apr 2026 13:17:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775135832; cv=none; b=Lf/rPHBXksZjR/kuSN9uGcwugmBfH98MqUP59ZH71aWubz5tFsmN+wUgj17xzNozowVxZTq2bZUTZOVuNdV48pOV3i/Mj7Kbgo8sHeL53ga/M04u8yeL4XVpmrpbdc1isf7evywUhwSLa5LxZlVhb6VqwD+7j8iG7Zj01j7r79I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775135832; c=relaxed/simple;
	bh=Fs1lU5CUxeetgrsZt4Y2bs0p8z18NOqM2Z3aKWtLeNc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VI1TZVTrlcubP6TyKLHm7CmYcQMT7ezXHyadDZkmlK/N2OyZKSo3bpYZoTCxi7hf0IkSZJc2kUEqf03md9XiFrEbK7EljsaY3t/cp3uUx+cuT00yG4OlEE8TZAdEZKg1AjwSQTu/vB701EhxzX/T9IEZmPRcg6pw6mvEnW9SLiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nVv2IRM4; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775135831; x=1806671831;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Fs1lU5CUxeetgrsZt4Y2bs0p8z18NOqM2Z3aKWtLeNc=;
  b=nVv2IRM43GVIwlMLGvqsVJzDmw4/lAI9NtzF2iaqZl/AQP4QsZYqv4ur
   txxrtSeoid0YbvQTWGkqAYoCsl+R12ixFTw1fMntOq/CwJ1xVfrxUFvJA
   7t4zRLn3IZMu3bCAQp/LFpRfgcdpaYIX2rTif7A7hgF/VWCADAqZN4SdE
   afACcZV1NDk8zE6CB9kNS6yyUN4s/q9FMZc8xb1EZXXzvBkOmrOzH+lU0
   QRO3WrgCjD+Qbown4pyAGhDOWFosZyaJjd0glETBeF4Ij8nonPbk4MHbc
   YisUOlQ+Su/X25IJKh2XW7ItpsOSiAI5/iF9i/0PxEfKp3Y/yx2yuVqqP
   Q==;
X-CSE-ConnectionGUID: Ao5FEgPwT1SzIKzkjnPt2w==
X-CSE-MsgGUID: /2qneTXKQPGfXWhYB858eA==
X-IronPort-AV: E=McAfee;i="6800,10657,11746"; a="87650778"
X-IronPort-AV: E=Sophos;i="6.23,155,1770624000"; 
   d="scan'208";a="87650778"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2026 06:17:10 -0700
X-CSE-ConnectionGUID: 4oaub5reSzGK1ODBMZNSRQ==
X-CSE-MsgGUID: 2XfORkCsS/WbBHavbcOenQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,155,1770624000"; 
   d="scan'208";a="227241472"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO mnyman-desk.intel.com) ([10.245.245.50])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2026 06:17:09 -0700
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 00/25] xhci features for usb-next
Date: Thu,  2 Apr 2026 16:13:17 +0300
Message-ID: <20260402131342.2628648-1-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.43.0
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[intel.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35865-lists,linux-usb=lfdr.de];
	RCPT_COUNT_THREE(0.00)[3];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mathias.nyman@linux.intel.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.intel.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,intel.com:dkim]
X-Rspamd-Queue-Id: DDB71389B44
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Greg

A couple small fixes and a lot of xhci refactoring, decoupling and cleanups
for usb-next.

Thanks
Mathias

Michal Pecio (3):
  usb: xhci: Simplify clearing the Event Interrupt bit
  usb: xhci: Fix debugfs bandwidth reporting
  usb: xhci: Make usb_host_endpoint.hcpriv survive endpoint_disable()

Niklas Neronin (21):
  usb: xhci: simplify CMRT initialization logic
  usb: xhci: relocate Restore/Controller error check
  usb: xhci: factor out roothub bandwidth cleanup
  usb: xhci: move reserving command ring trb
  usb: xhci: move ring initialization
  usb: xhci: move initialization for lifetime objects
  usb: xhci: split core allocation and initialization
  usb: xhci: improve debug messages during suspend
  usb: xhci: optimize resuming from S4 (suspend-to-disk)
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
  usb: xhci: simpilfy resume root hub code
  usb: xhci: move roothub port limit validation
  usb: xhci: remove duplicate '0x' prefix

Oliver Neukum (1):
  xhci: use BIT macro

 drivers/usb/host/xhci-debugfs.c |  10 +-
 drivers/usb/host/xhci-hub.c     | 381 +++++++++++++++-----------------
 drivers/usb/host/xhci-mem.c     | 133 +++++------
 drivers/usb/host/xhci-ring.c    |   9 +-
 drivers/usb/host/xhci.c         | 229 ++++++++++---------
 drivers/usb/host/xhci.h         | 124 ++++++-----
 include/linux/usb.h             |   3 +-
 7 files changed, 444 insertions(+), 445 deletions(-)

-- 
2.43.0


