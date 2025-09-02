Return-Path: <linux-usb+bounces-27445-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D0D6AB3FD0A
	for <lists+linux-usb@lfdr.de>; Tue,  2 Sep 2025 12:53:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6BAC91895538
	for <lists+linux-usb@lfdr.de>; Tue,  2 Sep 2025 10:53:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C9B62F5302;
	Tue,  2 Sep 2025 10:53:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="luePoTkF"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F24C5145355
	for <linux-usb@vger.kernel.org>; Tue,  2 Sep 2025 10:53:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756810399; cv=none; b=eooaBTmRMiGm+3ZzwIaOLWlaDFqPTeqa+UlDTSWNgLkKGyCkjnf6HBOnxOrEujv2Q6Kth6E7toRwPo9h5AsDxV/H8jb36ByhoOcId4DmNgSSOGsKG16Fk9e2aW5qSTr0mMjzgq95IycEIAtG5bvWXiBOlz84ruN0kRxZt3R2zCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756810399; c=relaxed/simple;
	bh=0JLIsZqom/1ZnX0RAui67TXJdwX/PdEU0JNvgWmppDU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=juMW7UE5YalAVRqPO/z07lXlU8sEqVYEYe+ZMmtDKuzu0Gzm3n3WIL8MXL0B+xHTUxJVhEuFPzRZu+e2s/6hNpUfOoysZWu5D3czB0gAbcaCJpTvb1MyEcY2cNLxj8lYTsGOrxLQrabP0N8Jq1FZuNu+8hpkHz5szKtHM5rGWk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=luePoTkF; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756810398; x=1788346398;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=0JLIsZqom/1ZnX0RAui67TXJdwX/PdEU0JNvgWmppDU=;
  b=luePoTkFmwUr9lkJHMtPxcEZr/5+p4gJaS5fLXlpzWsmgfJNpiui+VaJ
   W5kb+kgTvOKjhbcxItK/LBT/gTtky43+56IMIkHFO01wp03fNMvM7yCDz
   1J4KxGMJQ4BxBeOjqn4jWGSavWhHbGjdnaCx5X+L2AtBdnlJPpgz8+F4t
   IBbwNtGkVLlq665SKTi2352lgVw9PxIh1FEBzmp5EZiF1Qd+K5Pn+J6fI
   S1L8pMwR316ZwMBCGYERW2zk0ZTKPWviAZUFZa1XYM5g92+iuy37tvOss
   jRivBqoQf8/KTw5FPTnnmSjrprHBM+mfg0B5Hi75xBEwfZL+cawsrnENu
   w==;
X-CSE-ConnectionGUID: E68UtcILTziGOOczlJkSdA==
X-CSE-MsgGUID: TBUDHQIcTR2AIwuxToFPag==
X-IronPort-AV: E=McAfee;i="6800,10657,11540"; a="76678007"
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; 
   d="scan'208";a="76678007"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2025 03:53:17 -0700
X-CSE-ConnectionGUID: EJYJ6lKWR3GTUiIyu8yZag==
X-CSE-MsgGUID: plySjc+yQvq6QZU3rqSf7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; 
   d="scan'208";a="171609562"
Received: from johunt-mobl9.ger.corp.intel.com (HELO mnyman-desk.intel.com) ([10.245.245.90])
  by fmviesa008.fm.intel.com with ESMTP; 02 Sep 2025 03:53:16 -0700
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 0/3] xhci fixes for usb-linus
Date: Tue,  2 Sep 2025 13:53:03 +0300
Message-ID: <20250902105306.877476-1-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Greg

A couple xhci fixes for usb-linus

Fixing a xhci memory leak regression in 6.17-rc3, and a DbC issue
triggered when re-connecting DbC cable ~10 times without data transfers
in between

Thanks
Mathias

Mathias Nyman (3):
  xhci: dbc: decouple endpoint allocation from initialization
  xhci: dbc: Fix full DbC transfer ring after several reconnects
  xhci: fix memory leak regression when freeing xhci vdev devices depth
    first

 drivers/usb/host/xhci-dbgcap.c | 94 ++++++++++++++++++++++++----------
 drivers/usb/host/xhci-mem.c    |  2 +-
 2 files changed, 68 insertions(+), 28 deletions(-)

-- 
2.43.0


