Return-Path: <linux-usb+bounces-15943-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F0B44997090
	for <lists+linux-usb@lfdr.de>; Wed,  9 Oct 2024 18:08:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9C4271F23D0C
	for <lists+linux-usb@lfdr.de>; Wed,  9 Oct 2024 16:08:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54C44198848;
	Wed,  9 Oct 2024 15:46:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GxofUnRq"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFBB8193432
	for <linux-usb@vger.kernel.org>; Wed,  9 Oct 2024 15:46:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728488762; cv=none; b=GWtkKj7nHqKGLDfcfdBU4ujKSFxZXQy88a76qirU4VQ9c+djYArpdNUBqEpvz68SnGJoS8GnHn+b6y0cEL6KxHtCrQtvzomEtpDpEQeUU3ZDq+oXe2BfaV0hYrQYxSGuUlC+qQXZsegq+yOYYPV0vl/DEXC8eQeabnnu8ox00+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728488762; c=relaxed/simple;
	bh=q1raLt/se/IaRREnU+aqWX9hS7Y3VzlMHFb/cwbBQ6c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UfIRI56Eiwla3Qjym+b4J0qpFbytkpEy+pAdHeyJCJLxyVD9HYXcVHGtcm441I9Mx1V7G+zUdMd48bQMB6Yr4vkJNSO9tPJyookeTV6bxeRM2hVNs64Mfrtq7RIcY96JNNHX1IZrBNU+Zx8ODbetMMgOHU8eVv3XbUGUCFHqdOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GxofUnRq; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728488761; x=1760024761;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=q1raLt/se/IaRREnU+aqWX9hS7Y3VzlMHFb/cwbBQ6c=;
  b=GxofUnRqjimrrIq3BsWolD2G/bAwJ7cDnAptDZLLT8mZ77+Ca5aKXKBR
   PvuOjv/mn9EXAHBsNGwlfW2MDKMkki/mARvChK7bfmBF0ZKrlqyf4wLfP
   AN8z3aeXsLMUkeFFVwn0hcHQ1pf9BBsf/taSmB/YIJdRUYh849HRtFiIl
   8WdbeevpB731u110pWDf+H/dmFzrg8UlNJsX5Xyp+Hwfp1+jnTngd43jr
   VvBMqIUtHvJh3Qnyg/bc+39GIsXIDggJAsOSi24on4/SrqNJB1PCYVMCO
   SISD7KvfpHdW4Bs/FBJqO6k+sb/wu7U5/u6lc6x0PcLYo7ohNWLu2mUdS
   Q==;
X-CSE-ConnectionGUID: +6xaUkQuR/W5TSNpMvX48w==
X-CSE-MsgGUID: YQbdcUwST6aVfxAaizbPGg==
X-IronPort-AV: E=McAfee;i="6700,10204,11220"; a="50334586"
X-IronPort-AV: E=Sophos;i="6.11,190,1725346800"; 
   d="scan'208";a="50334586"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2024 08:46:00 -0700
X-CSE-ConnectionGUID: /dnCr7ufR96KgBNvqH+iXA==
X-CSE-MsgGUID: N1xqtT3QSOCW6Z4Wk58sMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,190,1725346800"; 
   d="scan'208";a="81102513"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by orviesa005.jf.intel.com with ESMTP; 09 Oct 2024 08:45:58 -0700
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	=?UTF-8?q?=C5=81ukasz=20Bartosik?= <ukaszb@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Jameson Thies <jthies@google.com>,
	linux-usb@vger.kernel.org
Subject: [PATCH v2 0/4] usb: typec: USB Modes
Date: Wed,  9 Oct 2024 18:45:53 +0300
Message-ID: <20241009154557.2836656-1-heikki.krogerus@linux.intel.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

Changed since v1:
- Leaving the usb_mode file hidden if the usb_ capabilities are not known - Dmitriy
- Fixed kernel doc warning - kernel test robot


This was originally a proposal of mine that I posted back in 2019 as
an RFC [1].

The goal is to expose the USB Mode - USB Mode as defined in the USB
Type-C and USB Power Delivery specifications - to the user via sysfs.

With ports the mode will show the supported and the default USB Mode,
which is the mode that is (or should be) used in the next Enter_USB
Message.

With the partners the mode will show similarly the supported USB
modes, and also the active mode. Changing the active mode should cause
Data Reset (as described in the USB Power Delivery spec.). This should
happen even if there is no active USB Mode (in Alternate Mode).

I've modified the original RFC patches based on comments I've received
(offline). The major change is that I renamed the sysfs attribute file
for the port from "usb_mode" to "usb_capability".

I'm taking the USB mode in use in the UCSI driver with these, but I
did not add support for the "Set USB" UCSI command yet. I have no way
of testing it. Also, I don't really like that we have to construct the
Enter_USB Message from the abstracted information that UCSI supplies.
The interface should supply the Enter_USB Message that was used as is.

[1] https://lore.kernel.org/linux-usb/20191230152857.43917-1-heikki.krogerus@linux.intel.com/

Heikki Krogerus (4):
  usb: typec: Add attribute file showing the supported USB modes of the
    port
  usb: typec: Add attribute file showing the USB Modes of the partner
  usb: typec: ucsi: Supply the USB capabilities to the ports
  usb: typec: ucsi: Add support for the partner USB Modes

 Documentation/ABI/testing/sysfs-class-typec |  27 +++
 drivers/usb/typec/class.c                   | 204 +++++++++++++++++++-
 drivers/usb/typec/class.h                   |   3 +
 drivers/usb/typec/ucsi/ucsi.c               |  15 ++
 drivers/usb/typec/ucsi/ucsi.h               |  10 +
 include/linux/usb/typec.h                   |  22 +++
 6 files changed, 277 insertions(+), 4 deletions(-)

-- 
2.45.2


