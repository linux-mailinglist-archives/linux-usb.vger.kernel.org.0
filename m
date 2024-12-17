Return-Path: <linux-usb+bounces-18564-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 454149F45F4
	for <lists+linux-usb@lfdr.de>; Tue, 17 Dec 2024 09:22:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8AC3C160E9B
	for <lists+linux-usb@lfdr.de>; Tue, 17 Dec 2024 08:22:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E546B1DD9AB;
	Tue, 17 Dec 2024 08:22:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X+7TznOo"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07E531DB938
	for <linux-usb@vger.kernel.org>; Tue, 17 Dec 2024 08:22:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734423750; cv=none; b=ugbznDp1GhG68ASKa/o14VYbXcPZ/Ub+RIOJnEMz0J8AqSMHDlg4vM/6zze+dhsjxuLphPt7cgFWlKQQlFlRV/DoFWOMc8YHRfiqy1nDLNycUyYt5oW/s5+Z0KVQEnA8nuOX5ptvGJuWDTI+OYu5TGgde9YDqV8+JaCxHv9vsgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734423750; c=relaxed/simple;
	bh=YYtr0cuhOWs6ELaPPdDPDjxOZ2jg4tQU3j7NGvowirM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Xvgky6kw6hUgrq1IHRnaFIYWUwd00XJGD99ulDNCKt5x4QjN3KL1xu854cSmv21jDtjgVpAC+pt9/cqr6sjAeaMEMAjjRUX7O7kwIRkVEnWvdf8aYoTDPrAQMOkF6WNCOgkrLmn5bpK5Gsqg5DF/OC72YRXqpKy0rtaGQB6HrSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X+7TznOo; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734423749; x=1765959749;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=YYtr0cuhOWs6ELaPPdDPDjxOZ2jg4tQU3j7NGvowirM=;
  b=X+7TznOowJlcIjGo0lkyx7+3rp4rXTN7zh7khiGV8ScyZLAPjqpmwoxd
   08O6HgkeVwNIVwT7U4oySTwUr7FSIlFPVegxseGbqHhk/98oH3lFk5Fzw
   KIU13AEpzLPRe4/Y/GQRMLhZJhP9p16UY8yhytlvKupPbP6ZLZiCF90vE
   NZJOOmd4ruRNIlvTyOAoPEW4CZdao/vCAK8uzNnt8/grE7fW6cnD5Dnvm
   N3AsXko0HH9tSeWlkR74c2ZjLduYR00Yi5UXR5inkuxDF+Tks5XhROCBM
   tHNr0KN0MfoTixsnpzJ254KoNG7/N9q3Dp2iadAOV4DPk1ZEV5nyPPwIp
   w==;
X-CSE-ConnectionGUID: uKV1QuW9T2uH7A3nCR1MkQ==
X-CSE-MsgGUID: iIT/orcETzeulOfxpy9Z3g==
X-IronPort-AV: E=McAfee;i="6700,10204,11288"; a="38511447"
X-IronPort-AV: E=Sophos;i="6.12,241,1728975600"; 
   d="scan'208";a="38511447"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2024 00:22:28 -0800
X-CSE-ConnectionGUID: GZPaYkdMT5GNOeG59/7Mlw==
X-CSE-MsgGUID: mVkfCSItQUW7aIz8lhGBmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="102063245"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa005.fm.intel.com with ESMTP; 17 Dec 2024 00:22:27 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 44B68913; Tue, 17 Dec 2024 10:22:23 +0200 (EET)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 09/12] thunderbolt: Pass reason to tb_dp_resource_unavailable()
Date: Tue, 17 Dec 2024 10:22:19 +0200
Message-ID: <20241217082222.528602-10-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241217082222.528602-1-mika.westerberg@linux.intel.com>
References: <20241217082222.528602-1-mika.westerberg@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since we are going to call this also when DisplayPort tunnel
establishment fails it is useful to have the reason logged.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/tb.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
index 53e4890e3198..60454f9b9475 100644
--- a/drivers/thunderbolt/tb.c
+++ b/drivers/thunderbolt/tb.c
@@ -2088,17 +2088,18 @@ static void tb_switch_exit_redrive(struct tb_switch *sw)
 	}
 }
 
-static void tb_dp_resource_unavailable(struct tb *tb, struct tb_port *port)
+static void tb_dp_resource_unavailable(struct tb *tb, struct tb_port *port,
+				       const char *reason)
 {
 	struct tb_port *in, *out;
 	struct tb_tunnel *tunnel;
 
 	if (tb_port_is_dpin(port)) {
-		tb_port_dbg(port, "DP IN resource unavailable\n");
+		tb_port_dbg(port, "DP IN resource unavailable: %s\n", reason);
 		in = port;
 		out = NULL;
 	} else {
-		tb_port_dbg(port, "DP OUT resource unavailable\n");
+		tb_port_dbg(port, "DP OUT resource unavailable: %s\n", reason);
 		in = NULL;
 		out = port;
 	}
@@ -2404,7 +2405,7 @@ static void tb_handle_hotplug(struct work_struct *work)
 			tb_xdomain_put(xd);
 			tb_port_unconfigure_xdomain(port);
 		} else if (tb_port_is_dpout(port) || tb_port_is_dpin(port)) {
-			tb_dp_resource_unavailable(tb, port);
+			tb_dp_resource_unavailable(tb, port, "adapter unplug");
 		} else if (!port->port) {
 			tb_sw_dbg(sw, "xHCI disconnect request\n");
 			tb_switch_xhci_disconnect(sw);
-- 
2.45.2


