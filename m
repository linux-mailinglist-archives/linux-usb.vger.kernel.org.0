Return-Path: <linux-usb+bounces-11753-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B7D5191A9E4
	for <lists+linux-usb@lfdr.de>; Thu, 27 Jun 2024 16:54:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 23A46B23D51
	for <lists+linux-usb@lfdr.de>; Thu, 27 Jun 2024 14:54:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23C2B198823;
	Thu, 27 Jun 2024 14:53:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FNNXQrKq"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F4DB197A77
	for <linux-usb@vger.kernel.org>; Thu, 27 Jun 2024 14:53:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719500019; cv=none; b=TXwanFdUfTeOQLNvjmmmBSCdQxuZmuKYTCgPYMrfxU2oG7LezwQTZ4tOo/pPmC5PUGZ+TzFtTsL1SpqKnuz3OtBat1GMLeV6nSSB0iW+rrEEy3Ei6IGYOnkHB4CzUW7L+T7P+yoAy72sOBSU5LYIxvJRFkDRuaHGIcguQxRj2Y4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719500019; c=relaxed/simple;
	bh=0tdRpZNyMaLQSUBO7li6f74+PCFte3s1HcRc/0psCLc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=kk9PyJKW3XkX2btDi/+FOUnWz3n+xJH/ldVPWBGbXdSLwUqqw4815TU8ZrfREIjehsd7/sWbrgqAMYoyLFtgildR9hFFqQg/BTxNPhHACP3l1wtmHhAGPA9gJFlLN2DM4wy3fpIF6el5jcKSCC9GXZJA3MejsDhJhElDVGd+5pw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FNNXQrKq; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719500019; x=1751036019;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=0tdRpZNyMaLQSUBO7li6f74+PCFte3s1HcRc/0psCLc=;
  b=FNNXQrKq0deCYBh8yUG2M7MTVWOQYK3YQSNBH/Lmu0txkcpsHWlKcVuA
   XNrYrHfVqIOrPBRrkP55OvYdBqSk5Okzqf93pgticj3H+KMDEmnZUiymF
   HM8GjeS9gMu77LDcZCFFlouAELS4Jo9SLcUvlGp9N2805K+5PRODUgK1d
   5rBKQV3NpxPtsNSyJBuN8A7c2HYbMfJe48GE716682EjH1DVYwi6b6+aK
   BpnUbphRc+jFtXBnngysAsFnx/LVwbViRdvLv8dGHk+sEwGdqV53VJL5J
   F8GtUABQB8GGVuxThp5p1BodNjySBY/Axjr2FaZ1Xpr7MtmBwSZYiepHr
   g==;
X-CSE-ConnectionGUID: ISpNth6uTPiL9queSJVwrA==
X-CSE-MsgGUID: Iyz2/HTST0WDc+w3PGOF5g==
X-IronPort-AV: E=McAfee;i="6700,10204,11116"; a="20450109"
X-IronPort-AV: E=Sophos;i="6.09,166,1716274800"; 
   d="scan'208";a="20450109"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2024 07:53:27 -0700
X-CSE-ConnectionGUID: SRXtOIWYRjajGf49W6z+jw==
X-CSE-MsgGUID: nC/l4U8VS7qwON+d+1jnPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,166,1716274800"; 
   d="scan'208";a="44301390"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by orviesa010.jf.intel.com with ESMTP; 27 Jun 2024 07:53:25 -0700
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 0/1] xhci fix for usb-linus v6.10
Date: Thu, 27 Jun 2024 17:55:22 +0300
Message-Id: <20240627145523.1453155-1-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Greg

One more small xhci fix for usb-linus

Resovles issue in detecting device connection in case
xHC was reset during runtime resume due to xHC restore error

Mathias Nyman (1):
  xhci: always resume roothubs if xHC was reset during resume

 drivers/usb/host/xhci.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

-- 
2.25.1


