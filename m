Return-Path: <linux-usb+bounces-16316-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BA229A0B3F
	for <lists+linux-usb@lfdr.de>; Wed, 16 Oct 2024 15:19:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7B35F1C215ED
	for <lists+linux-usb@lfdr.de>; Wed, 16 Oct 2024 13:19:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8568520C022;
	Wed, 16 Oct 2024 13:18:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jl+4zy82"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D06620A5C6
	for <linux-usb@vger.kernel.org>; Wed, 16 Oct 2024 13:18:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729084720; cv=none; b=CvtN98CpVfGZ/Hm720B9PG4OEUD2RJL7WGuOl4AHXvGuFceUx6jqRttNbEeBC4XIFoTikcOiq8/bShy/8mBuK/XMo31xHQ/p+i06/T/5RVoCk0K0y235Fqp6TzRwd5vnPjcpqcLtk2Uq1El0c2NSl4B1pG3mso0MA7Yb+aJBQ/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729084720; c=relaxed/simple;
	bh=B7zru37GjlcqEhrpSC8JIzeD5ENalABLQe/L2XFfU2M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MppEjUuqe0JoOpJmMSCmYKFaUULkyzve/CWc/nsC8MDMfQ6O5nFhuUomuJYa66CJtBZamn19ID5VU3RrEo17pj9hJj55cPlCBy4LLj3Mavjraz0PIomDBlr14V7ZZ7O27L0L6+plBGtGgITHuX4ayMpbj5cXCZW2RAuJ4E44Nc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jl+4zy82; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729084719; x=1760620719;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=B7zru37GjlcqEhrpSC8JIzeD5ENalABLQe/L2XFfU2M=;
  b=jl+4zy82ts8dxd+gwGvt7g+1CgR3IcAaW0kIDl5qcRyGy6ejfVTqgI59
   m0roHaWPy0kVHAmTbwOr1H0Ae2ViGXSMQCOvOAO5KLV6vjoc2XzVhOiC6
   Q10uKOa9JXGO7eMpO3AXuavl6ugvadotzwVQym/MWu2+mtXdbShNNItg0
   5ujTGvqZCEQUCk53KnHBHVkqaXRpNI3tPhGLZBRsSqwWZ/FiwphwdlDyn
   QGuzvY3hULmiz4JNO+7/Brlc+n6xRjaCp5/ZH+R4QvmkVeI+69C3G0aZ2
   Mpm/SB9RNURpQPtbsbP4rs8fvMmOyVqU3Y2hwm27+ijPyaZ+Ui+rt5EYb
   A==;
X-CSE-ConnectionGUID: pDEuCzlARneKccs0lKJ0jw==
X-CSE-MsgGUID: NrHyNe6YSEOq9EPTSmcRCQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="39077750"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="39077750"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2024 06:18:38 -0700
X-CSE-ConnectionGUID: wBSJxYIIT7GYxvraqBNdkg==
X-CSE-MsgGUID: 2Id6rfphTV+QhPClh03ZXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,208,1725346800"; 
   d="scan'208";a="83300015"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by orviesa004.jf.intel.com with ESMTP; 16 Oct 2024 06:18:36 -0700
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	=?UTF-8?q?=C5=81ukasz=20Bartosik?= <ukaszb@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Jameson Thies <jthies@google.com>,
	linux-usb@vger.kernel.org
Subject: [PATCH v4 0/4] usb: typec: USB Modes
Date: Wed, 16 Oct 2024 16:18:30 +0300
Message-ID: <20241016131834.898599-1-heikki.krogerus@linux.intel.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

Changed since v3:
- Fixed the dates in the ABI documentation - Greg
- Now using sysfs_emit_at() everywhere - Greg

Changed since v2:
- Renamed the callbacks - Abhishek

Changed since v1:
- Leaving the usb_mode file hidden if the usb capabilities are not known - Dmitriy
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
 drivers/usb/typec/class.c                   | 205 +++++++++++++++++++-
 drivers/usb/typec/class.h                   |   3 +
 drivers/usb/typec/ucsi/ucsi.c               |  16 ++
 drivers/usb/typec/ucsi/ucsi.h               |  10 +
 include/linux/usb/typec.h                   |  22 +++
 6 files changed, 279 insertions(+), 4 deletions(-)

-- 
2.45.2


