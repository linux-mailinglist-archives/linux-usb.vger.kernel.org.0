Return-Path: <linux-usb+bounces-11133-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 30683903B58
	for <lists+linux-usb@lfdr.de>; Tue, 11 Jun 2024 14:04:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BF3DD287B7D
	for <lists+linux-usb@lfdr.de>; Tue, 11 Jun 2024 12:04:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDB9E17997D;
	Tue, 11 Jun 2024 12:04:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kiHsjCBQ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7240176AA9
	for <linux-usb@vger.kernel.org>; Tue, 11 Jun 2024 12:04:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718107461; cv=none; b=guYt4c72MgjLKIMWXGIC9EQQHM8w6YJtEidQynW1ZRwpIsv7RIoy3bOyQlAM92qqn7mhvTvRYcSUU07JlMbOOmDgq1OmwF/1bBJ7aUZxweKMYGs+1dGSlLjP9AqFspTrluz7HJC+SqM7EorBck4WXezf3WXcki5ybxuHkmC7DB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718107461; c=relaxed/simple;
	bh=FkXj3Dr4EkTe8KDXy5RIioM0hqiM64rY1/cR18Y2mLM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=KsPMOJuag58Z4UKdpw9YCJ3QBkcAUyVfQW1aP17cVjD/crOdxez7O8jreL4FsWKpUoTQbr+F3Xp0xljpPwbIZ04MkP7K89ygwHfHCE8qYtpIrvO4B3PH3Z1odbQ0r/z+nyuEWkUizuTEekOCeg/sWLbq1DsNPo16CLt4CF/SLew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kiHsjCBQ; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718107460; x=1749643460;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=FkXj3Dr4EkTe8KDXy5RIioM0hqiM64rY1/cR18Y2mLM=;
  b=kiHsjCBQNDZUs6xBreJZ6KbuzEwez0vmMEbYTWxV3FcqJfkVHjghs8a3
   ApGT+1Cqj6ycYuDhKb+X2ZLWB96Ik6URWVg8UZNn0GEmRJxCs9BPww1do
   BTh/v88FdX61g9hSrnKKgwe6L2WUXOrmAEHhb53RU2mgD2q0rvy6fbKkQ
   DdgFT0tt7eGjaaxdTdg7OsMN6GjouXjgzdTuPxxjf6dymRSrZ6XpqMQ37
   yVkcT+1IbLFAN7SCQ4m+yAywDIjxMSauXQfqjx6UuYvtXJvpjuhGKiw2E
   258g6uEOT1KxUTdBBiJPPXETc4WhHisROJSmrjdaHDY19avJAWGKqI/xD
   A==;
X-CSE-ConnectionGUID: BTFhlTbCQI6kq+oX7GQ9jQ==
X-CSE-MsgGUID: ikqU12alQEuIlo4l89dFBg==
X-IronPort-AV: E=McAfee;i="6600,9927,11099"; a="18641730"
X-IronPort-AV: E=Sophos;i="6.08,230,1712646000"; 
   d="scan'208";a="18641730"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2024 05:04:19 -0700
X-CSE-ConnectionGUID: zCRQPWlNQQKNzKukHQJu7g==
X-CSE-MsgGUID: 1SvFpIC4TlyAZBsen/LAfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,230,1712646000"; 
   d="scan'208";a="76879580"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by orviesa001.jf.intel.com with ESMTP; 11 Jun 2024 05:04:18 -0700
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 0/4] xhci fixes for usb-linus
Date: Tue, 11 Jun 2024 15:06:06 +0300
Message-Id: <20240611120610.3264502-1-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Greg

A few xhci fixes for usb-linus.
Adds quirks to Etron host, and ensure cancelled and erronous bulk and stream
transfers are handled properly,

Thanks
Mathias

Hector Martin (1):
  xhci: Handle TD clearing for multiple streams case

Kuangyi Chiang (2):
  xhci: Apply reset resume quirk to Etron EJ188 xHCI host
  xhci: Apply broken streams quirk to Etron EJ188 xHCI host

Mathias Nyman (1):
  xhci: Set correct transferred length for cancelled bulk transfers

 drivers/usb/host/xhci-pci.c  |  7 +++++
 drivers/usb/host/xhci-ring.c | 59 +++++++++++++++++++++++++++---------
 drivers/usb/host/xhci.h      |  1 +
 3 files changed, 53 insertions(+), 14 deletions(-)

-- 
2.25.1


