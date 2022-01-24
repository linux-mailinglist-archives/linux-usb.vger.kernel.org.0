Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A8D08497AEF
	for <lists+linux-usb@lfdr.de>; Mon, 24 Jan 2022 10:02:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236480AbiAXJCX (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 24 Jan 2022 04:02:23 -0500
Received: from mga11.intel.com ([192.55.52.93]:18482 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236425AbiAXJCV (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 24 Jan 2022 04:02:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643014941; x=1674550941;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=3Rovh4/lKcqg1XxFNXgd6wxamVJA43dqc0CU4uCld5I=;
  b=GR0s8vzTpOUcWzwJErqw+uw1sMl6QZagzqc1rMw69vzdDvUMkPXfg3fv
   +gdelPFDfkWN6Qi8g6kW19UElda/xuQ+I/WxlPC8kJCXQhl0OCSwTjmWq
   mqzjfJAuz0ucY+eQE09k/CviVo+COAsgGKPWYZ1/MbQfCiwBNJzObwuKL
   YkkJwyZtoNh32+E2QvH7ympUl4e+8t0aQ4cd3flTxnehrC/UFTovmVw55
   xMbK6LqoB6IoH986y1XrGNxUBRsVA4CjlTHgGIyfbe1EXdjfTWH/9TZXA
   J7+yUB9d6h7EL5H6gA9xiLVShAhejJYa+TRdGOqnorv8M3joFy5tLwrKN
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10236"; a="243596455"
X-IronPort-AV: E=Sophos;i="5.88,311,1635231600"; 
   d="scan'208";a="243596455"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2022 01:02:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,311,1635231600"; 
   d="scan'208";a="673561141"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 24 Jan 2022 01:02:18 -0800
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org,
        Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>,
        John Stultz <john.stultz@linaro.org>
Subject: [PATCH 2/2] usb: typec: Don't try to register component master without components
Date:   Mon, 24 Jan 2022 12:02:28 +0300
Message-Id: <20220124090228.41396-3-heikki.krogerus@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220124090228.41396-1-heikki.krogerus@linux.intel.com>
References: <20220124090228.41396-1-heikki.krogerus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This fixes NULL pointer dereference that happens if
component master is registered with empty component match
list.

Reported-by: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Tested-by: John Stultz <john.stultz@linaro.org>
Fixes: 730b49aac426 ("usb: typec: port-mapper: Convert to the component framework")
Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
 drivers/usb/typec/port-mapper.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/typec/port-mapper.c b/drivers/usb/typec/port-mapper.c
index b6e0c6acc628c..a7d507802509f 100644
--- a/drivers/usb/typec/port-mapper.c
+++ b/drivers/usb/typec/port-mapper.c
@@ -60,6 +60,8 @@ int typec_link_ports(struct typec_port *con)
 		return 0;
 
 	bus_for_each_dev(&acpi_bus_type, NULL, &arg, typec_port_match);
+	if (!arg.match)
+		return 0;
 
 	/*
 	 * REVISIT: Now each connector can have only a single component master.
-- 
2.34.1

