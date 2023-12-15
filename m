Return-Path: <linux-usb+bounces-4204-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A720D814890
	for <lists+linux-usb@lfdr.de>; Fri, 15 Dec 2023 13:55:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 62A862820F8
	for <lists+linux-usb@lfdr.de>; Fri, 15 Dec 2023 12:55:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29F7C2C6BB;
	Fri, 15 Dec 2023 12:55:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KAViAWw0"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F5672C683
	for <linux-usb@vger.kernel.org>; Fri, 15 Dec 2023 12:55:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702644948; x=1734180948;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=1jfeBaqu8AZL9ddcpj6SaXyts8zixX03VqhiBnHHn/c=;
  b=KAViAWw0+U2GVDpS8gsIg70B3eTJIEd0c9YldUymVYuokZxxZwCPdKiL
   ZiJ26Q6IqWniL8/Cwec1xLOVKLaQtn/kVSBlApyPYzZkt/MuDMqHfCvYG
   CGxwCitClFXUOSDKZKPj4h2ArUgAJeqooLEXV0FZEBw9iMCHd3GONpcXf
   9uYnLjEPJqodoAt1bnvZgh751u3OwQ6DW2xqT5LfNBiNJX4HvqWX4hAc9
   qgReUQ4xkebNUWM/ufBXGfwylVYtxKJJwG2Xq6x0cksLQCmfF1BvCvX/4
   B9t6qtznlMJhORa9zRqbA0O6gddAw0NDuaHF2io5enhV9o+EEGqkziMiS
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="392449865"
X-IronPort-AV: E=Sophos;i="6.04,278,1695711600"; 
   d="scan'208";a="392449865"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2023 04:55:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="918434163"
X-IronPort-AV: E=Sophos;i="6.04,278,1695711600"; 
   d="scan'208";a="918434163"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by fmsmga001.fm.intel.com with ESMTP; 15 Dec 2023 04:55:46 -0800
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 0/1] xhci feature-fix for usb-next
Date: Fri, 15 Dec 2023 14:57:06 +0200
Message-Id: <20231215125707.1732989-1-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Greg

One patch in usb-next causes a regression during S4 resume.
This fixes that regression.

Thanks
Mathias

Mathias Nyman (1):
  xhci: Fix null pointer dereference during S4 resume when resetting ep0

 drivers/usb/host/xhci.c | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

-- 
2.25.1


