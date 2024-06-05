Return-Path: <linux-usb+bounces-10898-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C33E8FCFB9
	for <lists+linux-usb@lfdr.de>; Wed,  5 Jun 2024 15:43:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F1F6E1F26BB6
	for <lists+linux-usb@lfdr.de>; Wed,  5 Jun 2024 13:43:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59528188CD6;
	Wed,  5 Jun 2024 13:33:29 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D353188CBD
	for <linux-usb@vger.kernel.org>; Wed,  5 Jun 2024 13:33:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717594409; cv=none; b=PCHjqViYiV94RIO3Vphm5Wf7OyIiQLpAJal0jyV9nH8SQc+gh5Y9d7LAsOeSARwv35gA7e+JG4csJejJlr3MaKN9IdOBX+VyV2K/x3w+288EclWXxTAmf1wQ8qa+jknXdYoxn4WVzf0rddr97MGls9RQ/7rBZyxWbf/xjC+vfeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717594409; c=relaxed/simple;
	bh=nzwOUB/3TfUa5izLjCVVEoWwp/ZvfHPS0VQi2npBz0k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oVtIw8xqDUnEYGPjk7i200U4OWMQzrrLUCG02NISHR9pbrl45cvYM1Q5KM7hgA88ffEsEjm5WXz1xTX50UJ78CyQMRCNPt1uiyvIKxfCMPHhRVRspMAWzjinGWP7Q0NVUcDeLjFo87bOm0gG10AmLDtwUUWXExH7feQtjg0GL1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <m.grzeschik@pengutronix.de>)
	id 1sEql4-0006Vf-Br; Wed, 05 Jun 2024 15:32:54 +0200
Received: from [2a0a:edc0:0:1101:1d::ac] (helo=dude04.red.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <m.grzeschik@pengutronix.de>)
	id 1sEql3-000LFf-78; Wed, 05 Jun 2024 15:32:53 +0200
Received: from localhost ([::1] helo=dude04.red.stw.pengutronix.de)
	by dude04.red.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <m.grzeschik@pengutronix.de>)
	id 1sEql3-00FRCH-26;
	Wed, 05 Jun 2024 15:32:53 +0200
From: Michael Grzeschik <m.grzeschik@pengutronix.de>
Date: Wed, 05 Jun 2024 15:32:47 +0200
Subject: [PATCH v6 1/3] usb: gadget: function: move u_f.h to
 include/linux/usb/func_utils.h
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240116-ml-topic-u9p-v6-1-695977d76dff@pengutronix.de>
References: <20240116-ml-topic-u9p-v6-0-695977d76dff@pengutronix.de>
In-Reply-To: <20240116-ml-topic-u9p-v6-0-695977d76dff@pengutronix.de>
To: Eric Van Hensbergen <ericvh@kernel.org>, 
 Latchesar Ionkov <lucho@ionkov.net>, 
 Dominique Martinet <asmadeus@codewreck.org>, 
 Christian Schoenebeck <linux_oss@crudebyte.com>, 
 Jonathan Corbet <corbet@lwn.net>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: v9fs@lists.linux.dev, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
 kernel@pengutronix.de, Michael Grzeschik <m.grzeschik@pengutronix.de>
X-Mailer: b4 0.12.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5265;
 i=m.grzeschik@pengutronix.de; h=from:subject:message-id;
 bh=nzwOUB/3TfUa5izLjCVVEoWwp/ZvfHPS0VQi2npBz0k=;
 b=owEBbQKS/ZANAwAKAb9pWET5cfSrAcsmYgBmYGkES+Cnx1r/Z7uC2hBt8HbcZtItSw0pCWJOP
 rWRliYB0aOJAjMEAAEKAB0WIQQV2+2Fpbqd6fvv0Gi/aVhE+XH0qwUCZmBpBAAKCRC/aVhE+XH0
 q9EwEAC93heI/w7IRqMFTQ2VNUq9zrD1/hL8xpRAJeg+0hK+OtNG55Nv8rAwuqh+EddOizqYSeG
 Tn5i6b2FP1Ql9PaSDcuAXxCZyhfMUawcszPp56tIs+5JFtQuDgcAjfyO1svGIBCwmbeKkD/OO8V
 07oMQNnUM/qMhRm+7ZlrSFhyrEMabteLhU1QFD6dIfcCxCuIhyvlII9QYJx52QG7LJQFlVF/UaI
 PXn2h49EJ1S0uLDqnEW/4KRlG49zKCV31JQTUMsyh/VoUnFdbPVv0HwYSXpf/Ek9UpxbRhiC5rt
 SWBklp90WO3Z7sRYKdb1RLPV1kvo7Waws7m4cGofmigbCluX3JiinuRycKy6R4V4EZRUlr6v2rr
 xYP4ZmqjMIgLDTygBy0ImQMymUpGY/KmHtVwICyF8rbHgs7ADwFKL3Q5W7hfyu8VdgRAVVY/6IF
 P7vbUTOKoiKUKzuqkikCOAcrrmC2G2OfyKqIFEhEm/uiPh0K5z3WVftuA40/z9zgOB1pDWtSYg4
 XCPWAdX/iEpgyn/iPG4K2KjZibAJraHA9cg2zURAVDGD4QPk3lC7G3oWYOoyF4GGn6cl6ouoq9C
 sK+93gc/XPZQ9j0KUqGQwWEzuQTKAy7qGtdv6bpzekTVmyGQQQ/3ghFiNo3Q0deR5G5UOunVKxn
 UZLHy92f7cQsjoQ==
X-Developer-Key: i=m.grzeschik@pengutronix.de; a=openpgp;
 fpr=957BC452CE953D7EA60CF4FC0BE9E3157A1E2C64
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: m.grzeschik@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-usb@vger.kernel.org

We move the func_utils.h header to include/linux/usb to be
able to compile function drivers outside of the
drivers/usb/gadget/function directory.

Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>

---
v5 -> v6: -
v4 -> v5:
  - renamed to func_utils.h
v3 -> v4: -
v2 -> v3: -
v1 -> v2:
  - new introduced patch
---
 drivers/usb/gadget/configfs.c                              | 2 +-
 drivers/usb/gadget/function/f_fs.c                         | 2 +-
 drivers/usb/gadget/function/f_hid.c                        | 2 +-
 drivers/usb/gadget/function/f_loopback.c                   | 2 +-
 drivers/usb/gadget/function/f_midi.c                       | 2 +-
 drivers/usb/gadget/function/f_midi2.c                      | 2 +-
 drivers/usb/gadget/function/f_sourcesink.c                 | 2 +-
 drivers/usb/gadget/u_f.c                                   | 2 +-
 drivers/usb/gadget/u_f.h => include/linux/usb/func_utils.h | 2 +-
 9 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/usb/gadget/configfs.c b/drivers/usb/gadget/configfs.c
index ce3cfa1f36f51..e3cda6e0cd0d2 100644
--- a/drivers/usb/gadget/configfs.c
+++ b/drivers/usb/gadget/configfs.c
@@ -8,8 +8,8 @@
 #include <linux/usb/composite.h>
 #include <linux/usb/gadget_configfs.h>
 #include <linux/usb/webusb.h>
+#include <linux/usb/func_utils.h>
 #include "configfs.h"
-#include "u_f.h"
 #include "u_os_desc.h"
 
 int check_user_usb_string(const char *name,
diff --git a/drivers/usb/gadget/function/f_fs.c b/drivers/usb/gadget/function/f_fs.c
index 1f21459b1188c..f06e6c4974a6a 100644
--- a/drivers/usb/gadget/function/f_fs.c
+++ b/drivers/usb/gadget/function/f_fs.c
@@ -33,6 +33,7 @@
 #include <linux/usb/ccid.h>
 #include <linux/usb/composite.h>
 #include <linux/usb/functionfs.h>
+#include <linux/usb/func_utils.h>
 
 #include <linux/aio.h>
 #include <linux/kthread.h>
@@ -40,7 +41,6 @@
 #include <linux/eventfd.h>
 
 #include "u_fs.h"
-#include "u_f.h"
 #include "u_os_desc.h"
 #include "configfs.h"
 
diff --git a/drivers/usb/gadget/function/f_hid.c b/drivers/usb/gadget/function/f_hid.c
index 2db01e03bfbf0..0b7684c4a5b8b 100644
--- a/drivers/usb/gadget/function/f_hid.c
+++ b/drivers/usb/gadget/function/f_hid.c
@@ -16,8 +16,8 @@
 #include <linux/wait.h>
 #include <linux/sched.h>
 #include <linux/usb/g_hid.h>
+#include <linux/usb/func_utils.h>
 
-#include "u_f.h"
 #include "u_hid.h"
 
 #define HIDG_MINORS	4
diff --git a/drivers/usb/gadget/function/f_loopback.c b/drivers/usb/gadget/function/f_loopback.c
index 17ac6ace0cffa..8fce2c2fd18f7 100644
--- a/drivers/usb/gadget/function/f_loopback.c
+++ b/drivers/usb/gadget/function/f_loopback.c
@@ -14,9 +14,9 @@
 #include <linux/module.h>
 #include <linux/err.h>
 #include <linux/usb/composite.h>
+#include <linux/usb/func_utils.h>
 
 #include "g_zero.h"
-#include "u_f.h"
 
 /*
  * LOOPBACK FUNCTION ... a testing vehicle for USB peripherals,
diff --git a/drivers/usb/gadget/function/f_midi.c b/drivers/usb/gadget/function/f_midi.c
index 20c6fbd94f32d..9f8f3a334b579 100644
--- a/drivers/usb/gadget/function/f_midi.c
+++ b/drivers/usb/gadget/function/f_midi.c
@@ -33,8 +33,8 @@
 #include <linux/usb/gadget.h>
 #include <linux/usb/audio.h>
 #include <linux/usb/midi.h>
+#include <linux/usb/func_utils.h>
 
-#include "u_f.h"
 #include "u_midi.h"
 
 MODULE_AUTHOR("Ben Williamson");
diff --git a/drivers/usb/gadget/function/f_midi2.c b/drivers/usb/gadget/function/f_midi2.c
index ec8cd7c7bbfc1..830aa075c130f 100644
--- a/drivers/usb/gadget/function/f_midi2.c
+++ b/drivers/usb/gadget/function/f_midi2.c
@@ -18,8 +18,8 @@
 #include <linux/usb/gadget.h>
 #include <linux/usb/audio.h>
 #include <linux/usb/midi-v2.h>
+#include <linux/usb/func_utils.h>
 
-#include "u_f.h"
 #include "u_midi2.h"
 
 struct f_midi2;
diff --git a/drivers/usb/gadget/function/f_sourcesink.c b/drivers/usb/gadget/function/f_sourcesink.c
index 2edbd9b510d60..c9f38f24a92aa 100644
--- a/drivers/usb/gadget/function/f_sourcesink.c
+++ b/drivers/usb/gadget/function/f_sourcesink.c
@@ -13,10 +13,10 @@
 #include <linux/device.h>
 #include <linux/module.h>
 #include <linux/usb/composite.h>
+#include <linux/usb/func_utils.h>
 #include <linux/err.h>
 
 #include "g_zero.h"
-#include "u_f.h"
 
 /*
  * SOURCE/SINK FUNCTION ... a primary testing vehicle for USB peripheral
diff --git a/drivers/usb/gadget/u_f.c b/drivers/usb/gadget/u_f.c
index 6aea1ecb39999..9f90665827945 100644
--- a/drivers/usb/gadget/u_f.c
+++ b/drivers/usb/gadget/u_f.c
@@ -8,7 +8,7 @@
  * Author: Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>
  */
 
-#include "u_f.h"
+#include <linux/usb/func_utils.h>
 #include <linux/usb/ch9.h>
 
 struct usb_request *alloc_ep_req(struct usb_ep *ep, size_t len)
diff --git a/drivers/usb/gadget/u_f.h b/include/linux/usb/func_utils.h
similarity index 99%
rename from drivers/usb/gadget/u_f.h
rename to include/linux/usb/func_utils.h
index e313c3b8dcb19..9f2a32c765260 100644
--- a/drivers/usb/gadget/u_f.h
+++ b/include/linux/usb/func_utils.h
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * u_f.h
+ * usbf_utils.h
  *
  * Utility definitions for USB functions
  *

-- 
2.39.2


