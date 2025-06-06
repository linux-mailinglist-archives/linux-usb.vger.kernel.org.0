Return-Path: <linux-usb+bounces-24530-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0586AACFACA
	for <lists+linux-usb@lfdr.de>; Fri,  6 Jun 2025 03:38:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 64EBE3AEC3C
	for <lists+linux-usb@lfdr.de>; Fri,  6 Jun 2025 01:38:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2248935966;
	Fri,  6 Jun 2025 01:38:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="enOGs+sw"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA3C3DDC3
	for <linux-usb@vger.kernel.org>; Fri,  6 Jun 2025 01:38:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749173904; cv=none; b=ETe2aix4dZFpA0N+DoxYUbRUG/BwsyABQyNUo5akQO2UtVWnAjnPZrCSoDhn02cVzlv72yiJ/5aDTpHBkILHfZvHnWy0UZbWpcxBBWaXGZ8UhPCQ4Usj5s5ShOqCdnpbcRZdUiHVnFffnXucdnhzoeklY4d7ZzFUD8ysoUc8GmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749173904; c=relaxed/simple;
	bh=vZWuNaRPKgP9/YCojZB3k4HZKUcv7sf0pxLhZIPDavw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ThNQz+bL6tzm16gZyOkmqroZZn7wQk9IEyVXqW2OTSW6h9Ts+onV1eKFAQW2WYi5JQzbwLQ6RIFnHHWjwiQAyvJugNDPtjzJVGW08nJPFqOXVBKjujAaDquzf71aE+tbaS0Cjwyr/OiwEaxNz/kXAJ75YozvMMYjGYpiTM5XTVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=enOGs+sw; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749173902; x=1780709902;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=vZWuNaRPKgP9/YCojZB3k4HZKUcv7sf0pxLhZIPDavw=;
  b=enOGs+swatsTQBtmQbHfi2L8VE2ym4aZKjSCN49XdqLSX0pvmZgT1mYM
   HDVLAWJqWP5Q+ogIXo+JKRyxYoNSLkcgkIxqHzDN1yxgZ3/WArmd5p/Fm
   +0EE68Rm8tXe4TDI/p4zox7WUv8Bl48JzNKAOQpob/a+cct78QAzeGhHe
   2uuwIgqQcP22/OmY6JUatH/wTtkZvPwRwK9BdKec4aANxIKc8YFPU32uH
   J2VFqQQ1ync5JCXcghmucfUQSYkdCX5noF/BmSBSRCryjmCYeGeMZLzy/
   UfTzHrGWcTQJ91MIesCMSWUg/9QJgGJ02TzWx2Tjc48659PTtaB5BeFnX
   g==;
X-CSE-ConnectionGUID: FUuEJK9gTPGMlipKMg58XA==
X-CSE-MsgGUID: YCDPYmugRmOfYr4Sh155bA==
X-IronPort-AV: E=McAfee;i="6800,10657,11455"; a="38947559"
X-IronPort-AV: E=Sophos;i="6.16,213,1744095600"; 
   d="scan'208";a="38947559"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2025 18:38:22 -0700
X-CSE-ConnectionGUID: ep3WF1xfToaOMeMYeq4M1Q==
X-CSE-MsgGUID: lNTN8j+MRZSvVtTBjOrmOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,213,1744095600"; 
   d="scan'208";a="146276724"
Received: from pooja-lin-vm.fm.intel.com ([10.80.128.159])
  by orviesa007.jf.intel.com with ESMTP; 05 Jun 2025 18:38:21 -0700
From: Pooja Katiyar <pooja.katiyar@intel.com>
To: linux-usb@vger.kernel.org,
	gregkh@linuxfoundation.org
Cc: heikki.krogerus@linux.intel.com,
	andriy.shevchenko@linux.intel.com,
	pooja.katiyar@intel.com
Subject: [PATCH 0/3] usb: typec: ucsi: Add support for SET_PDOS command
Date: Thu,  5 Jun 2025 18:38:12 -0700
Message-Id: <cover.1749142912.git.pooja.katiyar@intel.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series implements support for UCSI SET_PDOS command. It provides
interface to send message out data structure and update source or sink
capabilities PDOs on a connector over debugfs interface.

Pooja Katiyar (3):
  usb: typec: ucsi: Add support for message out data structure
  usb: typec: ucsi: Enable debugfs for message_out data structure
  usb: typec: ucsi: Add support for SET_PDOS command

 drivers/usb/typec/ucsi/debugfs.c   | 32 ++++++++++++++++++++++++++++++
 drivers/usb/typec/ucsi/ucsi.h      | 17 ++++++++++++++++
 drivers/usb/typec/ucsi/ucsi_acpi.c | 16 +++++++++++++++
 3 files changed, 65 insertions(+)

-- 
2.34.1


