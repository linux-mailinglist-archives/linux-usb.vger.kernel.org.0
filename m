Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AFB2C162919
	for <lists+linux-usb@lfdr.de>; Tue, 18 Feb 2020 16:12:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726777AbgBRPMX (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 18 Feb 2020 10:12:23 -0500
Received: from mga11.intel.com ([192.55.52.93]:21496 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726692AbgBRPMX (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 18 Feb 2020 10:12:23 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 18 Feb 2020 07:12:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,456,1574150400"; 
   d="scan'208";a="229497932"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga008.fm.intel.com with ESMTP; 18 Feb 2020 07:12:21 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 91FF2109; Tue, 18 Feb 2020 17:12:20 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Felipe Balbi <balbi@kernel.org>, linux-usb@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v2 2/2] usb: dwc3: Remove kernel doc annotation where it's not needed
Date:   Tue, 18 Feb 2020 17:12:19 +0200
Message-Id: <20200218151219.50121-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200218151219.50121-1-andriy.shevchenko@linux.intel.com>
References: <20200218151219.50121-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The main comment in the file mistakenly marked with kernel doc annotation
which makes the parser unhappy:

.../dwc3/host.c:16: warning: Function parameter or member 'dwc' not described in 'dwc3_host_get_irq'

Drop kernel doc annotation from host.c module.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
v2: new patch (Felipe)
 drivers/usb/dwc3/host.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/dwc3/host.c b/drivers/usb/dwc3/host.c
index 95a90ea08975..86dbd012b984 100644
--- a/drivers/usb/dwc3/host.c
+++ b/drivers/usb/dwc3/host.c
@@ -1,5 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0
-/**
+/*
  * host.c - DesignWare USB3 DRD Controller Host Glue
  *
  * Copyright (C) 2011 Texas Instruments Incorporated - http://www.ti.com
-- 
2.25.0

