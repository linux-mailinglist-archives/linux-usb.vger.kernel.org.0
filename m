Return-Path: <linux-usb+bounces-18163-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5094A9E541C
	for <lists+linux-usb@lfdr.de>; Thu,  5 Dec 2024 12:39:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2AE7816406B
	for <lists+linux-usb@lfdr.de>; Thu,  5 Dec 2024 11:39:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F05FE20764F;
	Thu,  5 Dec 2024 11:39:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fW3c0cb4"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C54A5206F3A
	for <linux-usb@vger.kernel.org>; Thu,  5 Dec 2024 11:39:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733398764; cv=none; b=pLzhibxWUa+A+t/XWZI3VrBUbsoloMxuQk4S/gc1JwZ5UplEr16RE5FsjaECe7afzbFh/UsRILniSOO5FHfVmsx6RwNnR7lBOgnMF+kr/N/+j3owOnzRk12spfzF/f29IEIG48g/O/kZKrztgYSOQuuFuizJ9X81hCNgzY2SeHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733398764; c=relaxed/simple;
	bh=IOecpit39uK1zz0V4oWMuEghMneSee+ddX+JwmodRr0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KUxj0VKoml0j54QotXD9l+gSEMAX/1QL7clA0DeYYcC5+IHqrLJ3ybac0pka3S+g5I8cgm22VBnqzqchkxUZZ4MhEIXZyg9R2FaTmZfSk6aBiFpgcH78M2UDzFqfgrCJDS7ab8e/J6+K2h/RatrPkiP0cGKuuhqOctiVXOqhFSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fW3c0cb4; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733398762; x=1764934762;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=IOecpit39uK1zz0V4oWMuEghMneSee+ddX+JwmodRr0=;
  b=fW3c0cb4h5QV7sdv9GJYr7ucglTL3GQmQ4oFg+UxEu6eWGZ3cux8JOx9
   UD5H/2pMh+1LbpR9XjRKGO9hULGKNR0qbY7u9jNNJsLt7GFgmUOWI+6YU
   +3wGGFdPWGD0hJCHzMwq3MuncGMzNgGBh5PSoAyJy5O7EUz8Mu9/xOuD1
   WCccNuq6qjFORtw+V3TxwFAhWI9/TgKpb3Cs85LHlS5lyZ8ytyC6yFKb3
   qGcvYFQ3LuGIRP2eXOZm4Tn7oCiK54uV/a0PBZ+VoTkDIfNGISKdZR3+N
   DZaqeBc35UKHEkcQDAlarRKxYlQtM0SNLjFuftFrWcSugMg7X0r2yCo6K
   Q==;
X-CSE-ConnectionGUID: nZF1XiQLTTOY2zQTEipyhQ==
X-CSE-MsgGUID: msv5u4GuTuG13KQC+95BCg==
X-IronPort-AV: E=McAfee;i="6700,10204,11276"; a="33059633"
X-IronPort-AV: E=Sophos;i="6.12,210,1728975600"; 
   d="scan'208";a="33059633"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2024 03:39:22 -0800
X-CSE-ConnectionGUID: r1G//U9BTDipAW7Aj1kmzw==
X-CSE-MsgGUID: b0HbqW/DTwCZmOjSN1ur7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,210,1728975600"; 
   d="scan'208";a="94511708"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by orviesa007.jf.intel.com with ESMTP; 05 Dec 2024 03:39:21 -0800
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	kernel test robot <lkp@intel.com>,
	Rajat Khandelwal <rajat.khandelwal@linux.intel.com>
Subject: [PATCH] usb: typec: intel_pmc_mux: Silence snprintf() output truncation warning
Date: Thu,  5 Dec 2024 13:39:19 +0200
Message-ID: <20241205113919.1182673-1-heikki.krogerus@linux.intel.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In the function pmc_mux_port_debugfs_init() the buffer for
the name of the port is limited to six bytes. That makes the
compiler think that the output of "port%d" may be truncated.
That can't actually happen as the interface can support
maximum of eight ports. To make the compiler happy just
increase the buffer to where the warning goes away.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202412031437.vX580pxx-lkp@intel.com/
Cc: Rajat Khandelwal <rajat.khandelwal@linux.intel.com>
Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
 drivers/usb/typec/mux/intel_pmc_mux.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/typec/mux/intel_pmc_mux.c b/drivers/usb/typec/mux/intel_pmc_mux.c
index 5dfe95754394..65dda9183e6f 100644
--- a/drivers/usb/typec/mux/intel_pmc_mux.c
+++ b/drivers/usb/typec/mux/intel_pmc_mux.c
@@ -718,7 +718,7 @@ DEFINE_SHOW_ATTRIBUTE(port_iom_status);
 static void pmc_mux_port_debugfs_init(struct pmc_usb_port *port)
 {
 	struct dentry *debugfs_dir;
-	char name[6];
+	char name[8];
 
 	snprintf(name, sizeof(name), "port%d", port->usb3_port - 1);
 
-- 
2.45.2


