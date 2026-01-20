Return-Path: <linux-usb+bounces-32547-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uICKBe3Yb2n8RwAAu9opvQ
	(envelope-from <linux-usb+bounces-32547-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 20 Jan 2026 20:35:09 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 417EB4A88B
	for <lists+linux-usb@lfdr.de>; Tue, 20 Jan 2026 20:35:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 78570862362
	for <lists+linux-usb@lfdr.de>; Tue, 20 Jan 2026 18:13:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B42F243968;
	Tue, 20 Jan 2026 18:12:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bGRv+MdX"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8FA43EFD26
	for <linux-usb@vger.kernel.org>; Tue, 20 Jan 2026 18:12:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768932730; cv=none; b=UwXYqdkqXF/oKsCJUxZ5FU3Lk14ZFWhvMrIelyl51KLMALIFwkB6xKASswpHYRI6STkpYdrWRZ78a3eAln26Mqi29Bx39TuuYSIETOjcqDGOZcdoXEecRaMmI1Ooc3whS7zU4KHqEIf6H+52sf4na/WHHkwNaSJL8yrOl3VnbkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768932730; c=relaxed/simple;
	bh=Y6DpfPXbLuWxeb7qbOTejbLQaJdxJ7FHVwcwfVbD/H8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=cs8j/Zwq6vDegQYtkpxDpkMdKh5ivtWuzuH7fEFyFOS4lWm726UJcJx4Vrhj+rN6aq6y/6/9/SGr/iayOOhynktAL6F6bshNzCjyToKAgqYlLExCWvJhiCXEkN1s1nLMsyt3MUIm+Wy6Wv0dbPNjiMF6rHraHyoRqBzRoztIrNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bGRv+MdX; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768932728; x=1800468728;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Y6DpfPXbLuWxeb7qbOTejbLQaJdxJ7FHVwcwfVbD/H8=;
  b=bGRv+MdXx9Eki9FFiGzaaZ1wsNrgyquSVprSQ15tBajtKaVxV892a5wY
   7Qejh+y47ar/YHGFxwhuQ5XIb3F6Wq2TcotGWMo99kiDLVV67qxWohmpO
   rgrpR17WTZyNPmRn0en3zCzBBXIH1Wkg19k5Si7VEsVGnkyFMKcwv+3WV
   MjKgRaQkXLGQpBtZs5mqr56ThFezZBvzRq2nqLaBB/vRj4g8sYEaa7AJL
   EdwuoAGpFf+1AsDKFA33FVyBylgwElRd4AozZ7CZ1+WQPy+4USVnUwTsM
   qPH+oARaZl8rWHEQWsk+7l7i4qBKM9sm/VygEoK9BnBlGWdhV07rJtSQ0
   g==;
X-CSE-ConnectionGUID: 2w3ifgd2T56yQh0bYEh4CQ==
X-CSE-MsgGUID: SGeGEHJzR5yyZUzHq7zsuA==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="70055574"
X-IronPort-AV: E=Sophos;i="6.21,241,1763452800"; 
   d="scan'208";a="70055574"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2026 10:12:06 -0800
X-CSE-ConnectionGUID: hXyu01HhSpmg92XL9DB2pg==
X-CSE-MsgGUID: D+jLe+4BS7WRK/M0GhGgPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,241,1763452800"; 
   d="scan'208";a="205997428"
Received: from abityuts-desk.ger.corp.intel.com (HELO mnyman-desk.home) ([10.245.244.215])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2026 10:12:04 -0800
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 0/4] xhci feature for usb-next
Date: Tue, 20 Jan 2026 20:11:44 +0200
Message-ID: <20260120181148.128712-1-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.96 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[intel.com:+];
	MIME_TRACE(0.00)[0:+];
	DMARC_POLICY_ALLOW(0.00)[intel.com,none];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32547-lists,linux-usb=lfdr.de];
	RCPT_COUNT_THREE(0.00)[3];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mathias.nyman@linux.intel.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	TAGGED_RCPT(0.00)[linux-usb];
	RCVD_COUNT_FIVE(0.00)[5];
	ASN(0.00)[asn:7979, ipnet:2a01:60a::/32, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,linux.intel.com:mid,ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo]
X-Rspamd-Queue-Id: 417EB4A88B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Greg

This series for usb-next allows users to modify the string descriptors
presented by xHCI when running in DbC device mode.

Thanks
Mathias

Łukasz Bartosik (4):
  xhci: dbc: prepare to expose strings through sysfs
  xhci: dbc: allow setting device serial number through sysfs
  xhci: dbc: allow setting product string through sysfs
  xhci: dbc: allow setting manufacturer string through sysfs

 .../testing/sysfs-bus-pci-drivers-xhci_hcd    |  42 +++
 drivers/usb/host/xhci-dbgcap.c                | 259 +++++++++++++-----
 drivers/usb/host/xhci-dbgcap.h                |  39 ++-
 3 files changed, 262 insertions(+), 78 deletions(-)

-- 
2.43.0


