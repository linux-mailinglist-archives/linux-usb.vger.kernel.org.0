Return-Path: <linux-usb+bounces-37733-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IPb1EWevDGrdkwUAu9opvQ
	(envelope-from <linux-usb+bounces-37733-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 19 May 2026 20:43:51 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B2C2A583D26
	for <lists+linux-usb@lfdr.de>; Tue, 19 May 2026 20:43:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4F554300E725
	for <lists+linux-usb@lfdr.de>; Tue, 19 May 2026 18:43:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDB3736BCCA;
	Tue, 19 May 2026 18:43:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z3YOCveh"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BD8E31AA9B
	for <linux-usb@vger.kernel.org>; Tue, 19 May 2026 18:43:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779216215; cv=none; b=cd8vINQCpNeyJSKC4m6eo2410rBm4D9bMNvCCtlJuBPLoGMvqRKbTlozs4j1SMDt/Nymb2RnVunLQV6IkH1xEmRPhOVZp2oca1C6qQDrlenrebVUdRB/oEcypwFhmzrHeGCcvg6VLvRDA3PzGdgytHF5JFLSy5NjNU1QI5SPxRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779216215; c=relaxed/simple;
	bh=JTTNAvhgs9kj/J4KYbo9JLwQMm1WjtYwsJiTk37d8Pc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OtLJQTylCvlAKUd11Qqj1Rg44b2+xZDxiK1X8/0mqqylvjpFqKu5VT+947jFTHsAfTpkNI2Rk6ri29SbeGsNtPLCgFNCDZc0KUYpBEMnJ+Qr9xjl9cFtXGGrw8Jd0uhOJnJBrtlVQAqn+4b/rKKzxtxzHqUpGALwmRVV5nl/Sh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z3YOCveh; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779216214; x=1810752214;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=JTTNAvhgs9kj/J4KYbo9JLwQMm1WjtYwsJiTk37d8Pc=;
  b=Z3YOCveh05xnsZ5DcX84SDtK1IDbEPXbjr4zQn98utcc1XWNzz/jN66N
   b54rK4p5XCiV4UffzHkuY9Mp4me7Tr29rVrpuX5BwPoNGAdYHW73nsVCX
   1x4LvvS3P8CfhY5pngkebpq4V/neKrvbGuwUJeSSh/gOlXIm7zNyxuaBK
   fNSgY6O/cvXAAl3XPjWJVmG8tlOMJ9SRptdtbEW5ExN3B7YiOqQ4nWs+J
   Hsw9lbdKFs+Noj6MJlGtYkkmYHF23avA3x7C9erFOvHvPMOsaf0m1OiR1
   aMZF6IvGBwuSYwCVy/FEaAst417/ZfvNaqqjoKs0wl+Bmy/zRu4MnnXO5
   g==;
X-CSE-ConnectionGUID: 2ZhcZGrbS1i3IITVivkqWA==
X-CSE-MsgGUID: pL/XIJiZSqmGj3gpaOar9A==
X-IronPort-AV: E=McAfee;i="6800,10657,11791"; a="102783835"
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="102783835"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2026 11:43:34 -0700
X-CSE-ConnectionGUID: 1YNnqKNcTKqdEwGz505qkA==
X-CSE-MsgGUID: nw89qX6kQNOsrQXa/CdvSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="263633783"
Received: from pooja-nuc9i7qnx.fm.intel.com ([10.80.169.153])
  by fmviesa001.fm.intel.com with ESMTP; 19 May 2026 11:43:33 -0700
From: Pooja Katiyar <pooja.katiyar@intel.com>
To: linux-usb@vger.kernel.org
Cc: gregkh@linuxfoundation.org,
	dmitry.baryshkov@oss.qualcomm.com,
	johan@kernel.org,
	asutosh.pathak@intel.com,
	heikki.krogerus@linux.intel.com,
	Pooja Katiyar <pooja.katiyar@intel.com>
Subject: [PATCH v8 0/3] usb: typec: ucsi: Add support for SET_PDOS command
Date: Tue, 19 May 2026 11:45:11 -0700
Message-ID: <cover.1778798352.git.pooja.katiyar@intel.com>
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
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37733-lists,linux-usb=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pooja.katiyar@intel.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	DKIM_TRACE(0.00)[intel.com:+];
	TAGGED_RCPT(0.00)[linux-usb];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,intel.com:mid,intel.com:dkim]
X-Rspamd-Queue-Id: B2C2A583D26
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This series implements support for UCSI SET PDOS command. It provides
interface to send message out data and update source or sink
capabilities PDOs on a connector over debugfs interface.

Changelog v8:
- Rebase onto v7.1-rc3

Pooja Katiyar (3):
  usb: typec: ucsi: Add support for message_out data structure
  usb: typec: ucsi: Enable debugfs for message_out data structure
  usb: typec: ucsi: Add support for SET_PDOS command

 drivers/usb/typec/ucsi/cros_ec_ucsi.c   |  6 ++-
 drivers/usb/typec/ucsi/debugfs.c        | 31 +++++++++++++++
 drivers/usb/typec/ucsi/ucsi.c           | 52 ++++++++++++++++++++-----
 drivers/usb/typec/ucsi/ucsi.h           | 20 +++++++++-
 drivers/usb/typec/ucsi/ucsi_acpi.c      | 22 ++++++++++-
 drivers/usb/typec/ucsi/ucsi_ccg.c       |  6 ++-
 drivers/usb/typec/ucsi/ucsi_yoga_c630.c |  6 ++-
 7 files changed, 123 insertions(+), 20 deletions(-)

-- 
2.43.0


