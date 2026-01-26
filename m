Return-Path: <linux-usb+bounces-32743-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MK1CK33kd2k9mQEAu9opvQ
	(envelope-from <linux-usb+bounces-32743-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 26 Jan 2026 23:02:37 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CC6D8DCA3
	for <lists+linux-usb@lfdr.de>; Mon, 26 Jan 2026 23:02:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7F3A330071D6
	for <lists+linux-usb@lfdr.de>; Mon, 26 Jan 2026 22:02:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D1C12DF151;
	Mon, 26 Jan 2026 22:02:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BJSNkoz1"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 646603EBF01
	for <linux-usb@vger.kernel.org>; Mon, 26 Jan 2026 22:02:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769464948; cv=none; b=eaoqCc+3hHBoaIfYOu5+yuxbw+aMsoJ11aZqw/CDtFVyFifJbduBItiQ/lAIspQk9DNQ9EWMTQKXLNy0vnOYMcP24DDzCe/11dW8K6DXTfx/bXKF2WYK28rKJYmjrKQ5n5hKYOZUlEv9PlIcZJgBFFISLqTDcDJGGzINiB1zI6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769464948; c=relaxed/simple;
	bh=B06/JXxi0LxK3hbyLAAjG1pnmbcwlXPlgJHCM/B9FMA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tQQyycPnAuZuFU2AcjvWAiNri+8QeEqy1PMSihemE/nauwaCDcSDpXK2qyPmwOtLRiOnsFZrGNm+9133dvjU7gqoFDxcIz8ZC5x6qDtrD1AtMFVU0zS4EcNUU3+GSRXEw9X8af+3m1vI2dVLnPOMtNrKDIv2s3a/w/vMcbOvIdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BJSNkoz1; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769464946; x=1801000946;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=B06/JXxi0LxK3hbyLAAjG1pnmbcwlXPlgJHCM/B9FMA=;
  b=BJSNkoz1zAyCjj7+X734ecca/HStrvMO8a3jyRcoiUFNNi2uRc4ijgN9
   0CoEWXOcD1WhXTCQK/xw+auJz7k9WkqnfR53C0zGY5+riRmNeQIhrmTPM
   sIPjv4gRV2tHkyyJEEFNBlba+r1Zo1SJ4Bjf6UzcDVuqrnDzpofWuXDW2
   hIXzUdVJf7gP4qj5VrFYJQfjaMUephUx5mqmunDBu0Y0vFYSk3crhvc4R
   m/GdcpJEFY/E8am+OIu9DeUQu1FwwyeybJycvz8mjBVvaKPNPp7D+ADsB
   lqaK8EbjCLx7GVQQBRaDRphaCBpGFZQKF8EiBzNu2uvVY7Ww/D0ox6FuV
   A==;
X-CSE-ConnectionGUID: eRch3s+wTYmG0v5QphA8eQ==
X-CSE-MsgGUID: o79AlLejSqebMk1Hptp76A==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="82019742"
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; 
   d="scan'208";a="82019742"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2026 14:02:25 -0800
X-CSE-ConnectionGUID: LkIEzjFdQVepOPfgL8Uwow==
X-CSE-MsgGUID: F2bXNls6QXKw0VVan/HUmw==
X-ExtLoop1: 1
Received: from cdjpc409-it.jer.intel.com ([10.12.50.120])
  by fmviesa003.fm.intel.com with ESMTP; 26 Jan 2026 14:02:23 -0800
From: Gil Fine <gil.fine@linux.intel.com>
To: andreas.noever@gmail.com,
	mika.westerberg@linux.intel.com,
	YehezkelShB@gmail.com
Cc: gil.fine@intel.com,
	linux-usb@vger.kernel.org,
	lukas@wunner.de,
	Gil Fine <gil.fine@linux.intel.com>
Subject: [PATCH 0/5] CM fixes to follow CM guide more closely
Date: Tue, 27 Jan 2026 00:06:01 +0200
Message-ID: <20260126220606.3476657-1-gil.fine@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,linux.intel.com];
	TAGGED_FROM(0.00)[bounces-32743-lists,linux-usb=lfdr.de];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gil.fine@linux.intel.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 4CC6D8DCA3
X-Rspamd-Action: no action

This series improves Connection Manager implementation to better align with
the CM Guide, including proper state checks, router ready verification, timeout
adjustments, and improved logging.

Gil Fine (5):
  thunderbolt: Fix lane bonding log message when bonding not possible
  thunderbolt: Verify PCIe adapters in detect state before setup PCIe
    tunnel
  thunderbolt: Verify Router Ready bit is set after router enumeration
  thunderbolt: Increase timeout to wait for Configuration Ready bit
  thunderbolt: Increase Notification Timeout to 255 ms for USB4 routers

 drivers/thunderbolt/switch.c  | 22 ++++++++++------------
 drivers/thunderbolt/tb.h      |  2 ++
 drivers/thunderbolt/tb_regs.h | 19 +++++++++++++++++--
 drivers/thunderbolt/tunnel.c  | 17 +++++++++++++++++
 drivers/thunderbolt/usb4.c    | 27 +++++++++++++++++++++++++--
 5 files changed, 71 insertions(+), 16 deletions(-)

-- 
2.43.0


