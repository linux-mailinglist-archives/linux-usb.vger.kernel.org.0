Return-Path: <linux-usb+bounces-15716-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 16F3E99053F
	for <lists+linux-usb@lfdr.de>; Fri,  4 Oct 2024 16:04:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A26161F22D46
	for <lists+linux-usb@lfdr.de>; Fri,  4 Oct 2024 14:04:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3B672101B2;
	Fri,  4 Oct 2024 14:04:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GMZqg+pI"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0B0F1BC59
	for <linux-usb@vger.kernel.org>; Fri,  4 Oct 2024 14:04:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728050685; cv=none; b=RnNX6uInd1vzEjRM/h+3DqE4hSe3bu/z7SPMHi7gd1Diz5zg3c89Kmxo1guooaKwlanXpNQTJoOjglAYuF7IcyJwgcOBDD+do1wPptZOSwmS5N5l/spZOyp7PEhiIzxPEO75Wl6D+IOmGuSzdyDMxkoR28UE3LXr8N/afgO8aYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728050685; c=relaxed/simple;
	bh=vYUCAAKGzajM/+MycN+vMQ2Z5zh/tNLk2RAeGzRmr1k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XRT3jkB5zOGocnBOBIEWnUvEOyaTFdsYEvuYcOWMLCHIj0r5tEm8lhqNiPjAY8/+STSjzzS0S4n8R48pFWxW34/oCFNKmrNXXBHp/nSrVoH1K1kQ5lGM+ceqWQPx5WQZVMXARcsUlX/aEneNuYgWtvMOClUrQQQ57cq47Kx+Frw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GMZqg+pI; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728050684; x=1759586684;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=vYUCAAKGzajM/+MycN+vMQ2Z5zh/tNLk2RAeGzRmr1k=;
  b=GMZqg+pIejMaSxb2bKUyvcG6/5vW5KjFlLQ01N1voiPzliOxSIjpveoP
   k0rJARa6eYsgwXoCz8I4g/a16yro84eBJ2DRmoYVUy1FD45Us9jrNOxrm
   eGpvDNDunlnLyiVRlF4tcYDc861Fh5M7ld2HE0jMtK3ypDLLyC0IyuAzf
   qUzLz06og5ycmztoSE1HBjw/ojzxIBxQhzPAN3+wH7t4rRJWPRqlMB+o5
   IauCp4mWOUmT+QJZk40cC3rKf4a4Ic7V2QWhtbibWE2ENyk9xCyA7w53T
   hcZx+0RBkiqq7q6LhwPz4gLHmbhFiXulmMok2cyCGDXNx6oS2iP9YsTdQ
   g==;
X-CSE-ConnectionGUID: fLRlXeZuSPOcUun+AZWEAQ==
X-CSE-MsgGUID: E+qe9G1WSAu3D4MIN+mvwQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11215"; a="26780788"
X-IronPort-AV: E=Sophos;i="6.11,177,1725346800"; 
   d="scan'208";a="26780788"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2024 07:04:43 -0700
X-CSE-ConnectionGUID: bMmGuQAUSvKa1FvdcjC+Ow==
X-CSE-MsgGUID: WIUfpflASuiLPSAQgsIoAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,177,1725346800"; 
   d="scan'208";a="79144221"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by fmviesa005.fm.intel.com with ESMTP; 04 Oct 2024 07:04:41 -0700
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	=?UTF-8?q?=C5=81ukasz=20Bartosik?= <ukaszb@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Jameson Thies <jthies@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org
Subject: [PATCH v1 0/3] usb: typec: USB Modes
Date: Fri,  4 Oct 2024 17:04:35 +0300
Message-ID: <20241004140440.1882311-1-heikki.krogerus@linux.intel.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

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
 drivers/usb/typec/ucsi/ucsi.c               |  16 ++
 drivers/usb/typec/ucsi/ucsi.h               |  10 +
 include/linux/usb/typec.h                   |  22 +++
 6 files changed, 278 insertions(+), 4 deletions(-)

-- 
2.45.2


