Return-Path: <linux-usb+bounces-36508-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EJ0ILCUa72lr6gAAu9opvQ
	(envelope-from <linux-usb+bounces-36508-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 27 Apr 2026 10:11:17 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A10D46ED62
	for <lists+linux-usb@lfdr.de>; Mon, 27 Apr 2026 10:11:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EE1E73005646
	for <lists+linux-usb@lfdr.de>; Mon, 27 Apr 2026 08:11:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8283C39936F;
	Mon, 27 Apr 2026 08:11:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DkpM1RHV"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF9CB2ED846
	for <linux-usb@vger.kernel.org>; Mon, 27 Apr 2026 08:11:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777277474; cv=none; b=gZlqOhP6oXYgE3RF69u1HpNh1mmmMxR1pO4Zwfm/9jzkzWbX/2Ax/zhLTTxD6aeZTUK9f5Wmort5gMCjeFXAHC9ZttdMW+xQ3f1BEBcRSSKrW3Cz7wor/Ubm/7MAJopTlr3ev0BeASuaVcghOscE62u1KkkRxcNn9/7lpw4lmZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777277474; c=relaxed/simple;
	bh=8VGoaPUKwstsECzUwbDl/tr3mEu+K1W04EyryhfgiSg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jHi9DULGnMUhN4KJjSfv0ibxTVV4+RQV+oqn8El1oRbUXJYE1YRw1w5UeOj5v8HFpL4DOUUXpV/a90AGIEJE8gLPFdS/Pmv2ROEJ7ZHCNSIKk+NU/jEylKQD3Dkq441/I2k7ES5Q5A8VeaB3BQhsjwVN/X98FtTtSSXYIzI0/y0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DkpM1RHV; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777277473; x=1808813473;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=8VGoaPUKwstsECzUwbDl/tr3mEu+K1W04EyryhfgiSg=;
  b=DkpM1RHVMO44HiNWFwJQT4FcH2lBNcZgPfr0Fu1AzLtmJ9ffkEwoi34m
   Pm36DmWj5ynq7WPakPB/Z13qshK+eULbeUtVY/eoeU1gTvze9VB4Hbc/1
   uyp+uxPOt58eU5u6HR9lcQjI08MM01vESEMKP87/VS6fouczMUF0JV83v
   CkhxJEHbBqp7HZAIMSwnVdoyPZZ9cHU8WZh3PBQmbIXhpUiOeVmY0m+ND
   q7wiEbtfDRx5+KM5j/6gFELrutnpP2s7bjsKZwUO+F9+wqRIO2vbiUUiV
   4ksAChcAefF16VAic0OzUtBXHnhrHD17hEoi5dE2y59uMt+sTun84wPkH
   A==;
X-CSE-ConnectionGUID: 2aAmI5LKSPaHm+TVodzZhA==
X-CSE-MsgGUID: ET6lh7DcSu6HFw0Tac3CRw==
X-IronPort-AV: E=McAfee;i="6800,10657,11768"; a="78034419"
X-IronPort-AV: E=Sophos;i="6.23,201,1770624000"; 
   d="scan'208";a="78034419"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2026 01:11:12 -0700
X-CSE-ConnectionGUID: XlcMqKrLQ1yHeNyjwg0dsg==
X-CSE-MsgGUID: QbB7oAlUTxi6mCT3qlQ1XA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,201,1770624000"; 
   d="scan'208";a="237531362"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa003.jf.intel.com with ESMTP; 27 Apr 2026 01:11:10 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 6778F95; Mon, 27 Apr 2026 10:11:09 +0200 (CEST)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>,
	Gil Fine <gil.fine@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 00/12] thunderbolt: Improvements to XDomain handling
Date: Mon, 27 Apr 2026 10:10:57 +0200
Message-ID: <20260427081109.2337731-1-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 0A10D46ED62
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36508-lists,linux-usb=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,wunner.de,linux.intel.com];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mika.westerberg@linux.intel.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,intel.com:dkim]

Hi all,

This series improves the Thunderbolt peer-to-peer (aka XDomain) handling in
various places in the driver and tries to make it follow the USB4 spec more
closely.

Alan Borzeszkowski (1):
  thunderbolt: Don't create multiple DMA tunnels on firmware connection manager

Gil Fine (1):
  thunderbolt: Avoid reserved fields in path config space for USB4 routers

Mika Westerberg (10):
  thunderbolt: Don't disable lane adapter if XDomain lane bonding isn't possible
  thunderbolt: Make XDomain lane bonding comply with the USB4 v2 spec
  thunderbolt: Keep the domain reference while processing hotplug
  thunderbolt: Release request if tb_cfg_request() fails in __tb_xdomain_response()
  thunderbolt: Set tb->root_switch to NULL when domain is stopped
  thunderbolt: Wait for tb_domain_release() to complete when driver is removed
  thunderbolt: Keep XDomain reference during the lifetime of a service
  thunderbolt: dma_test: No need to store debugfs directory pointer
  thunderbolt: Remove service debugfs entries during unregister
  thunderbolt: Remove XDomain from the bus without holding tb->lock

 drivers/thunderbolt/debugfs.c  |   2 +
 drivers/thunderbolt/dma_test.c |  20 ++--
 drivers/thunderbolt/domain.c   |  33 ++++++
 drivers/thunderbolt/icm.c      |  15 +++
 drivers/thunderbolt/nhi.c      |   4 +
 drivers/thunderbolt/path.c     |  31 ++++--
 drivers/thunderbolt/switch.c   |  14 +++
 drivers/thunderbolt/tb.c       |  65 ++++++------
 drivers/thunderbolt/tb.h       |   2 +
 drivers/thunderbolt/xdomain.c  | 181 +++++++++++++++++++++++----------
 include/linux/thunderbolt.h    |   4 +
 11 files changed, 269 insertions(+), 102 deletions(-)

-- 
2.50.1


