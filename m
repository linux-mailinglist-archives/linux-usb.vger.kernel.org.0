Return-Path: <linux-usb+bounces-34305-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OMJVLe3Ermn2IgIAu9opvQ
	(envelope-from <linux-usb+bounces-34305-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 09 Mar 2026 14:02:37 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C7C52395B3
	for <lists+linux-usb@lfdr.de>; Mon, 09 Mar 2026 14:02:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9F29F3032DF5
	for <lists+linux-usb@lfdr.de>; Mon,  9 Mar 2026 13:02:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D61C33B8932;
	Mon,  9 Mar 2026 13:02:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nNMhND+Q"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A1197FBAC
	for <linux-usb@vger.kernel.org>; Mon,  9 Mar 2026 13:02:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773061328; cv=none; b=bAnCao66jbn0SsdNRkUhMLd5PrbR+TRrV8yS8QmKjmt3Wk22w4Z+bi/yUKZ+LC49pNKI6AnADM+Om9gatwoaSWFWCkQ/qlAcJwwuAKPbqVesIiJhLMNuB7gXb1yDncYAlnj5woV5SAIWhVikUNmhFxHvJKs0cGACVlwTSjiBHhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773061328; c=relaxed/simple;
	bh=ALyK2tDzOq69vZFtTRTy7/ixCtwbIJysr7ZFSKwKjc4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EnQsmwqT4gjnJddZIMwkeSj+v1q87kEMgfbsrV4GqgBqlV3gohNw7KbsfxsgfL6Jn61r4/CBlwS0Ox4/iWR3XoeWRiN1y88T6TpPK9CfMMDuqzvwlZ5hhIq0HrCq6/lc/elh6ZXEgJFMSGrcTPeUnVVcwC/l98QTjJ8VA09vyKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nNMhND+Q; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773061327; x=1804597327;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ALyK2tDzOq69vZFtTRTy7/ixCtwbIJysr7ZFSKwKjc4=;
  b=nNMhND+QJPV0zIUvL6vwco+qX8Dzw68TRvDXwulqYlEY0yUwyWSbAoXC
   vTPrj40w900vzwlPPjQwmULcmIwAOYkGDji4dWJ2/tsPKhZxeH9AmU2Gf
   3ArtcSCt4ivZOE8iOFrwV57btpxhkH+pZHbAdKOIzKwuuurPc7OW0DcJ1
   nsgDEwzO6JaKL2xZ8wQEEvcU5COtDW840ZpetuYm/gd+c87nfy3lo+Yux
   /gfu9NKATFJI2yzzPinEdholCFe4YQ6s7/N9a9HL5q1KG8x6rEanPVs8C
   IHiaKMY2uEQbr7qYLRG3E6/Rf+fltKkyM+Dq7V91+vaDb5y6XyrhRIRBE
   g==;
X-CSE-ConnectionGUID: 7SqVXiDARsaHuYyCPSft0A==
X-CSE-MsgGUID: GwyB6kTiR5irW95aaonb3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11723"; a="73960244"
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; 
   d="scan'208";a="73960244"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2026 06:02:06 -0700
X-CSE-ConnectionGUID: o0IXng2wTZyUV+YMKLo1hw==
X-CSE-MsgGUID: HxjO/fVzSGKIgIbqcvUKOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; 
   d="scan'208";a="218958292"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa010.jf.intel.com with ESMTP; 09 Mar 2026 06:02:05 -0700
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Subject: [PATCH v1] usb: dwc3: pci: add support for the Intel Nova Lake -H
Date: Mon,  9 Mar 2026 14:02:04 +0100
Message-ID: <20260309130204.208661-1-heikki.krogerus@linux.intel.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 4C7C52395B3
X-Rspamd-Server: lfdr
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
	DKIM_TRACE(0.00)[intel.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34305-lists,linux-usb=lfdr.de];
	RCPT_COUNT_THREE(0.00)[3];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[heikki.krogerus@linux.intel.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-0.992];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,intel.com:dkim,intel.com:email,linux.intel.com:mid]
X-Rspamd-Action: no action

This patch adds the necessary PCI ID for Intel Nova Lake -H
devices.

Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
 drivers/usb/dwc3/dwc3-pci.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/dwc3/dwc3-pci.c b/drivers/usb/dwc3/dwc3-pci.c
index 6ecadc81bd6ba..6c1cbb722ca85 100644
--- a/drivers/usb/dwc3/dwc3-pci.c
+++ b/drivers/usb/dwc3/dwc3-pci.c
@@ -56,6 +56,7 @@
 #define PCI_DEVICE_ID_INTEL_CNPH		0xa36e
 #define PCI_DEVICE_ID_INTEL_CNPV		0xa3b0
 #define PCI_DEVICE_ID_INTEL_RPL			0xa70e
+#define PCI_DEVICE_ID_INTEL_NVLH		0xd37f
 #define PCI_DEVICE_ID_INTEL_PTLH		0xe332
 #define PCI_DEVICE_ID_INTEL_PTLH_PCH		0xe37e
 #define PCI_DEVICE_ID_INTEL_PTLU		0xe432
@@ -447,6 +448,7 @@ static const struct pci_device_id dwc3_pci_id_table[] = {
 	{ PCI_DEVICE_DATA(INTEL, CNPH, &dwc3_pci_intel_swnode) },
 	{ PCI_DEVICE_DATA(INTEL, CNPV, &dwc3_pci_intel_swnode) },
 	{ PCI_DEVICE_DATA(INTEL, RPL, &dwc3_pci_intel_swnode) },
+	{ PCI_DEVICE_DATA(INTEL, NVLH, &dwc3_pci_intel_swnode) },
 	{ PCI_DEVICE_DATA(INTEL, PTLH, &dwc3_pci_intel_swnode) },
 	{ PCI_DEVICE_DATA(INTEL, PTLH_PCH, &dwc3_pci_intel_swnode) },
 	{ PCI_DEVICE_DATA(INTEL, PTLU, &dwc3_pci_intel_swnode) },
-- 
2.50.1


