Return-Path: <linux-usb+bounces-22644-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 340F5A7DF6C
	for <lists+linux-usb@lfdr.de>; Mon,  7 Apr 2025 15:36:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BF0D91895FD0
	for <lists+linux-usb@lfdr.de>; Mon,  7 Apr 2025 13:33:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 087C43594A;
	Mon,  7 Apr 2025 13:33:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TcH50iPS"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2AE83594E
	for <linux-usb@vger.kernel.org>; Mon,  7 Apr 2025 13:33:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744032792; cv=none; b=rJpSfkLLexRZs388x93g8ed6mry0Zp6eKkK49iM33TkclHaxLiI7nm43IMCHfzSYqPdKiUd9sCV0zMCsVBYWNy7yijDlrXye2ygPlyVwm9IidBCcVRJoCZzMDYIvX/WYox3EEVSXLbsBrY9ReVQpW4twcmb9vcI2e/j9ngM1+AY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744032792; c=relaxed/simple;
	bh=mILCVLSvJBZLbDv7c/jllR89Bo+tWwbGnV6kOc7SLpU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fsN7pUPvzucHKKfdaGahKSVrFjP0yJgFMu57cf9LZ3utLxoBja/29A2ifbF5qnJZjiowigXi/L20qW9jtac7n4V5Ftc+79e1yV/WYQj3Udcy72wXfJzuZI4rb95s7qCyNpJi2431YJPKUdBIdTLH5PFJsqggjMjHV3kdhr4vHqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TcH50iPS; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744032791; x=1775568791;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=mILCVLSvJBZLbDv7c/jllR89Bo+tWwbGnV6kOc7SLpU=;
  b=TcH50iPSX7FOp76VflAHM+dLUcUZ9WMIQ1hgXQriD7KQ7QYqtQ0sPvPP
   oNI0nxzeD1Bre5+4Rk6jBAwLUynzyKQLhgO3UfXdXaWv1I1CfDEAu8Oum
   Zd/Uqd+5cSQlZ5RAMA8YVT7a6lkJ27yA7yIRKrNq2S4CxG09fcsYwLjHF
   vhcZYV5qmIR2tDkUs/8+VRV/6CIZ549lyx7Q5h467P0l6TaJume+w4bz3
   HUM7IbSKkAd215dg6ks7XYY4eetRp2wRvkepUoQJhO2zDaklw8xlWkmkY
   /rRVu+m+DRw0/ozjG6tL2EEK/WUoE73itNyMAd6A7HuirWVn51mi8VM0N
   Q==;
X-CSE-ConnectionGUID: WEQRqADwSMa16SwrF+0iIQ==
X-CSE-MsgGUID: 4flA7+m0TvqkXUlUaz17rQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="45510603"
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="45510603"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 06:33:09 -0700
X-CSE-ConnectionGUID: KL5o6tu0QKy09O4S7IsQRw==
X-CSE-MsgGUID: Q9z25LaFR/aB2pfyB4m1TA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="127841226"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by orviesa010.jf.intel.com with ESMTP; 07 Apr 2025 06:33:07 -0700
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Amit Sunil Dhamne <amitsd@google.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	=?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>,
	linux-usb@vger.kernel.org,
	Badhri Jagan Sridharan <badhri@google.com>
Subject: [PATCH] MAINTAINERS: Assign maintainer for the port controller drivers
Date: Mon,  7 Apr 2025 16:33:06 +0300
Message-ID: <20250407133306.387576-1-heikki.krogerus@linux.intel.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Especially the port manager (tcpm.c) is so major driver that
it should have somebody watching over it who really
understands it, and the port controller interface in
general. Assigning Badhri as the designated reviewer and
restoring the status to Maintained from Orphan.

Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Badhri Jagan Sridharan <badhri@google.com>
---
Hi,

I'm proposing here that Badhri takes the role of the maintainer of
the core tcpm.c and tcpci.c. I think he would be the best person for
the job.

Badhri, I hope this is okay with you.

thanks,
---
 MAINTAINERS | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index de65f37966ef..ad28ecc7cc63 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -25127,9 +25127,13 @@ S:	Maintained
 F:	drivers/usb/typec/mux/pi3usb30532.c
 
 USB TYPEC PORT CONTROLLER DRIVERS
+M:	Badhri Jagan Sridharan <badhri@google.com>
 L:	linux-usb@vger.kernel.org
-S:	Orphan
-F:	drivers/usb/typec/tcpm/
+S:	Maintained
+F:	drivers/usb/typec/tcpm/tcpci.c
+F:	drivers/usb/typec/tcpm/tcpm.c
+F:	include/linux/usb/tcpci.h
+F:	include/linux/usb/tcpm.h
 
 USB TYPEC TUSB1046 MUX DRIVER
 M:	Romain Gantois <romain.gantois@bootlin.com>
-- 
2.47.2


