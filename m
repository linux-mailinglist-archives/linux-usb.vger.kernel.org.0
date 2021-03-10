Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E3657333AA0
	for <lists+linux-usb@lfdr.de>; Wed, 10 Mar 2021 11:47:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232552AbhCJKqm (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 10 Mar 2021 05:46:42 -0500
Received: from mga05.intel.com ([192.55.52.43]:7695 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232481AbhCJKqY (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 10 Mar 2021 05:46:24 -0500
IronPort-SDR: mTUDrahXsfBTYqgqDYxO1jkLhytOQl3DLoFIaV/svV+qzoT6aQyfOZtfoz0cujPMqItaFs8jhx
 1+tuCbie6U4Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9917"; a="273475526"
X-IronPort-AV: E=Sophos;i="5.81,237,1610438400"; 
   d="scan'208";a="273475526"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2021 02:46:23 -0800
IronPort-SDR: 6g/pVKzKbrQ38mKK/76vODT+0OdaU4H4YjTOeJI4epDWJwP9D5V1vLuftv85WTAxAXVJrgym26
 RV1Sa1WJ70iA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,237,1610438400"; 
   d="scan'208";a="509624575"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 10 Mar 2021 02:46:22 -0800
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [PATCH 3/3] usb: typec: tipd: Separate file for tracepoint creation
Date:   Wed, 10 Mar 2021 13:46:30 +0300
Message-Id: <20210310104630.77945-4-heikki.krogerus@linux.intel.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210310104630.77945-1-heikki.krogerus@linux.intel.com>
References: <20210310104630.77945-1-heikki.krogerus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Creating the tracepoints only when tracing is enabled.

Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
 drivers/usb/typec/tipd/Makefile                      | 4 +++-
 drivers/usb/typec/tipd/{tps6598x.c => core.c}        | 6 ++----
 drivers/usb/typec/tipd/trace.c                       | 9 +++++++++
 drivers/usb/typec/tipd/{tps6598x_trace.h => trace.h} | 2 +-
 4 files changed, 15 insertions(+), 6 deletions(-)
 rename drivers/usb/typec/tipd/{tps6598x.c => core.c} (99%)
 create mode 100644 drivers/usb/typec/tipd/trace.c
 rename drivers/usb/typec/tipd/{tps6598x_trace.h => trace.h} (99%)

diff --git a/drivers/usb/typec/tipd/Makefile b/drivers/usb/typec/tipd/Makefile
index 4c19eadb5f466..aa439f80a889e 100644
--- a/drivers/usb/typec/tipd/Makefile
+++ b/drivers/usb/typec/tipd/Makefile
@@ -1,4 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
-CFLAGS_tps6598x.o		:= -I$(src)
+CFLAGS_trace.o			:= -I$(src)
 
 obj-$(CONFIG_TYPEC_TPS6598X)	+= tps6598x.o
+tps6598x-y			:= core.o
+tps6598x-$(CONFIG_TRACING)	+= trace.o
diff --git a/drivers/usb/typec/tipd/tps6598x.c b/drivers/usb/typec/tipd/core.c
similarity index 99%
rename from drivers/usb/typec/tipd/tps6598x.c
rename to drivers/usb/typec/tipd/core.c
index 2c4ab90e16e79..9e924db421794 100644
--- a/drivers/usb/typec/tipd/tps6598x.c
+++ b/drivers/usb/typec/tipd/core.c
@@ -6,8 +6,6 @@
  * Author: Heikki Krogerus <heikki.krogerus@linux.intel.com>
  */
 
-#include "tps6598x.h"
-
 #include <linux/i2c.h>
 #include <linux/acpi.h>
 #include <linux/module.h>
@@ -17,8 +15,8 @@
 #include <linux/usb/typec.h>
 #include <linux/usb/role.h>
 
-#define CREATE_TRACE_POINTS
-#include "tps6598x_trace.h"
+#include "tps6598x.h"
+#include "trace.h"
 
 /* Register offsets */
 #define TPS_REG_VID			0x00
diff --git a/drivers/usb/typec/tipd/trace.c b/drivers/usb/typec/tipd/trace.c
new file mode 100644
index 0000000000000..016e68048dc24
--- /dev/null
+++ b/drivers/usb/typec/tipd/trace.c
@@ -0,0 +1,9 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * TI TPS6598x USB Power Delivery Controller Trace Support
+ *
+ * Copyright (C) 2021, Intel Corporation
+ * Author: Heikki Krogerus <heikki.krogerus@linux.intel.com>
+ */
+#define CREATE_TRACE_POINTS
+#include "trace.h"
diff --git a/drivers/usb/typec/tipd/tps6598x_trace.h b/drivers/usb/typec/tipd/trace.h
similarity index 99%
rename from drivers/usb/typec/tipd/tps6598x_trace.h
rename to drivers/usb/typec/tipd/trace.h
index 21917751d61ee..5d09d6f789300 100644
--- a/drivers/usb/typec/tipd/tps6598x_trace.h
+++ b/drivers/usb/typec/tipd/trace.h
@@ -277,7 +277,7 @@ TRACE_EVENT(tps6598x_data_status,
 
 /* This part must be outside protection */
 #undef TRACE_INCLUDE_FILE
-#define TRACE_INCLUDE_FILE tps6598x_trace
+#define TRACE_INCLUDE_FILE trace
 #undef TRACE_INCLUDE_PATH
 #define TRACE_INCLUDE_PATH .
 #include <trace/define_trace.h>
-- 
2.30.1

