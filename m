Return-Path: <linux-usb+bounces-35077-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qD2mD3smu2kcfwIAu9opvQ
	(envelope-from <linux-usb+bounces-35077-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 18 Mar 2026 23:26:03 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id D1DF62C359E
	for <lists+linux-usb@lfdr.de>; Wed, 18 Mar 2026 23:26:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1D452301DEC5
	for <lists+linux-usb@lfdr.de>; Wed, 18 Mar 2026 22:26:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D89C36F41F;
	Wed, 18 Mar 2026 22:25:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fA9zJmm6"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C4DB3093B8
	for <linux-usb@vger.kernel.org>; Wed, 18 Mar 2026 22:25:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773872757; cv=none; b=dZ+kg7K3P+5z8SCBf+/3JmOPy01o0hrbHra0rgZrloo5PV8tQ7PHeL5Sb/EsMIgj7CbjVAkBFWIdhUhAU2n3W/VfWyIgHYwhd3E4eclmMMM7K7Xki1o/ZbZxRiRZwptxwiU1Hml8iSu4UfW9jOyvYgZahHv029Vt+AQ1aHq9OBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773872757; c=relaxed/simple;
	bh=av2FWVivAoqy2IEsdQEm5SfeZaUzer1bMzEFJ3PfTOM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QY3DHZkeKZNSa4eC33+R6ZgxabUWSB9I6liB9NGEO6kVLxG+LQjM++b8fD2zV+ptOLfL61zSkUfx/kQBkKanaCnHC9Q+hM1EPAPXNLWgU2NVSslzzZRV4zElnBgNZio38GDnqCL5mA2kyHEMrIaWEv2y20PUHuaAepQ6ZLreQ/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fA9zJmm6; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773872757; x=1805408757;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=av2FWVivAoqy2IEsdQEm5SfeZaUzer1bMzEFJ3PfTOM=;
  b=fA9zJmm6155w63ZUNl2A7NtU9qojIqD0QY12bSdaNLb8g/bq/B9KcxBf
   ZZrVuaZ6rrSDxOmenjKDRSqS/+FgU926pFJzoKj+Is/2u+fCaqaRUtEw2
   Dcu2mKS2/+vmBedzZeDn5su44aK37KZKONyGL78mN2DVHd5uakEH3f6va
   dXF3KSYdCbx5rsUJ3Hsps9BkyC2GAaCwnEvydThiUnUTByH0jCBEaB1Oy
   ghpRE6/K9unn4u+VrXTBTmI9YUsIk3R0nM3CkIygXFVZnUb8wDibNC3oJ
   ymVM7RjQ0JWLHhHZT6HnS/ClUwu/2DXVXLsV7lYcGXGWzOz902/L6c7c+
   g==;
X-CSE-ConnectionGUID: dv/f4LlrTky//T75Ye58vw==
X-CSE-MsgGUID: jtmdw9GORKuBjqAgT/r/oA==
X-IronPort-AV: E=McAfee;i="6800,10657,11733"; a="74637566"
X-IronPort-AV: E=Sophos;i="6.23,128,1770624000"; 
   d="scan'208";a="74637566"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2026 15:25:56 -0700
X-CSE-ConnectionGUID: hHaf0O7UT5eEfbOCAACH9A==
X-CSE-MsgGUID: ZDAlAEe+TGyDh8ePLY5Exw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,128,1770624000"; 
   d="scan'208";a="227467412"
Received: from clke07vm102.fm.intel.com (HELO clke07vm102.amr.corp.intel.com) ([10.80.128.226])
  by fmviesa005.fm.intel.com with ESMTP; 18 Mar 2026 15:25:55 -0700
From: Pooja Katiyar <pooja.katiyar@intel.com>
To: linux-usb@vger.kernel.org
Cc: gregkh@linuxfoundation.org,
	heikki.krogerus@linux.intel.com,
	dmitry.baryshkov@oss.qualcomm.com,
	johan@kernel.org,
	asutosh.pathak@intel.com,
	Pooja Katiyar <pooja.katiyar@intel.com>
Subject: [PATCH 0/3] usb: typec: ucsi: Add support for SET_PDOS command
Date: Wed, 18 Mar 2026 15:25:28 -0700
Message-ID: <cover.1773090896.git.pooja.katiyar@intel.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35077-lists,linux-usb=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pooja.katiyar@intel.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-0.991];
	DKIM_TRACE(0.00)[intel.com:+];
	TAGGED_RCPT(0.00)[linux-usb];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: D1DF62C359E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This series implements support for UCSI SET PDOS command. It provides
interface to send message out data and update source or sink
capabilities PDOs on a connector over debugfs interface.

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


