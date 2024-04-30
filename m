Return-Path: <linux-usb+bounces-9924-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E7B048B6651
	for <lists+linux-usb@lfdr.de>; Tue, 30 Apr 2024 01:34:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9E39A282BD6
	for <lists+linux-usb@lfdr.de>; Mon, 29 Apr 2024 23:34:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E12619DF5F;
	Mon, 29 Apr 2024 23:33:50 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FE89199EA4
	for <linux-usb@vger.kernel.org>; Mon, 29 Apr 2024 23:33:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714433629; cv=none; b=rNRYW9e1B05Ge0o9Fw9SA4Hnx3H0nNGLxRcqJBYvQuJFgGyTynN2o/OoFCEF1XTnhJJiL6IteR8x49KiyGRf1vf+TELzYkf4xiG4OIrs+wemY0n9oaumdTamKykszCGN0wOEMKdYc3wqxBr3Mp5gbcvW7m7zU39d/3xlCpH6N9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714433629; c=relaxed/simple;
	bh=+zNTDxc2X0HVlPVeFYamBBf7VvsMah+sz+1661QG5n0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nVCnBoukBEkvuVno90LHHteLPxR8OAcxqNTvkeXtgAKOSTNIAaUaKB3pLfOfJDbbQ+c9QDIeyJoRiNJkB8+qv4gnAdpX5GBm5m0gy6lBoZ+yoIBlizgCNRLtVprYSg7CJEW2uUmeCUYL7AYob56lp4SvZHJ1mGQ5wE1qqwZyyM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <m.grzeschik@pengutronix.de>)
	id 1s1aV3-0000Er-9F; Tue, 30 Apr 2024 01:33:33 +0200
Received: from [2a0a:edc0:0:1101:1d::ac] (helo=dude04.red.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <m.grzeschik@pengutronix.de>)
	id 1s1aUy-00F42i-Sm; Tue, 30 Apr 2024 01:33:28 +0200
Received: from localhost ([::1] helo=dude04.red.stw.pengutronix.de)
	by dude04.red.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <m.grzeschik@pengutronix.de>)
	id 1s1aUy-004m1K-19;
	Tue, 30 Apr 2024 01:33:28 +0200
From: Michael Grzeschik <m.grzeschik@pengutronix.de>
Date: Tue, 30 Apr 2024 01:33:26 +0200
Subject: [PATCH v4 1/3] usb: gadget: function: move u_f.h to
 include/linux/usb/
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240116-ml-topic-u9p-v4-1-722ed28b0ade@pengutronix.de>
References: <20240116-ml-topic-u9p-v4-0-722ed28b0ade@pengutronix.de>
In-Reply-To: <20240116-ml-topic-u9p-v4-0-722ed28b0ade@pengutronix.de>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4779;
 i=m.grzeschik@pengutronix.de; h=from:subject:message-id;
 bh=+zNTDxc2X0HVlPVeFYamBBf7VvsMah+sz+1661QG5n0=;
 b=owEBbQKS/ZANAwAKAb9pWET5cfSrAcsmYgBmMC5H0VQnCLK/4TOUGMIAapgGFIcndpnxjDa2j
 wPD4udbXzeJAjMEAAEKAB0WIQQV2+2Fpbqd6fvv0Gi/aVhE+XH0qwUCZjAuRwAKCRC/aVhE+XH0
 q5M1D/9HwfYCDA2D5b4GHLzZbdXJqAVPdRWgwbQprtJfJ25seQbRi+mY29xFXGof1bJspCbzq7i
 /FejjD413ZlJeU6Ge0mfOrH4TdlgnbmFABlQOU0vy0ata8Vc2SALcEvvDSNFHP8LSKvXXt7v2Ua
 VpyjgQJvTUYa5WfLL6nGkUos26G26Hr/F6gA0xLKoCBeB8CP/31aj4M7sWrWouKLKuG5laQdNUH
 a/NEny/PtnIqGId36OE/hzi7rJ6yam6dIOVfZXBCc+xGvi7bM5tv5dfpvhxbBhhRh5qYZKifvcN
 f4NL2/+K4UKRTWrQi0OFE1J3iq/L8+gYN2hH63xEhM08DGPSHAJuUQoOWb4lM1EPxNi8WQRd38a
 kpFTH6KRhYkPBwDIn71u30Y03JmfM5JMtEilYXHOcIxHGB4r/b3AG6F8miZgc8K4fg4AbhQcI8P
 XFo7HmhDoQr9Ju5P2IGJxp2nguIIsCGEMxPtqEaOnUiuA59VIai4CXroKXYuaj2Bp55zqvOLmmi
 Va9Ez4StNUdeMjgeWyD34llFx0OBAtw+SxrivnLKaun1jM8nJ9oKLhSkwbZFDtCYfRLJYhHJWjm
 7DMyMLS50rUAh3FKZS3s/tPbs7j5wABidhuokNmM+ArydFaYyPCoBjk6YuXNz4R6x6eDjqEwycG
 BobbDakj2wD6+ZQ==
X-Developer-Key: i=m.grzeschik@pengutronix.de; a=openpgp;
 fpr=957BC452CE953D7EA60CF4FC0BE9E3157A1E2C64
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: m.grzeschik@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-usb@vger.kernel.org

We move the u_f.h header to include/linux/usb to be
able to compile function drivers outside of the
drivers/usb/gadget/function directory.

Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>

---
v3 -> v4: -
v2 -> v3: -
v1 -> v2:
  - new introduced patch
---
 drivers/usb/gadget/configfs.c                   | 2 +-
 drivers/usb/gadget/function/f_fs.c              | 2 +-
 drivers/usb/gadget/function/f_hid.c             | 2 +-
 drivers/usb/gadget/function/f_loopback.c        | 2 +-
 drivers/usb/gadget/function/f_midi.c            | 2 +-
 drivers/usb/gadget/function/f_midi2.c           | 2 +-
 drivers/usb/gadget/function/f_sourcesink.c      | 2 +-
 drivers/usb/gadget/u_f.c                        | 2 +-
 {drivers/usb/gadget => include/linux/usb}/u_f.h | 0
 9 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/usb/gadget/configfs.c b/drivers/usb/gadget/configfs.c
index ce3cfa1f36f51..4fa3eeafba814 100644
--- a/drivers/usb/gadget/configfs.c
+++ b/drivers/usb/gadget/configfs.c
@@ -8,8 +8,8 @@
 #include <linux/usb/composite.h>
 #include <linux/usb/gadget_configfs.h>
 #include <linux/usb/webusb.h>
+#include <linux/usb/u_f.h>
 #include "configfs.h"
-#include "u_f.h"
 #include "u_os_desc.h"
 
 int check_user_usb_string(const char *name,
diff --git a/drivers/usb/gadget/function/f_fs.c b/drivers/usb/gadget/function/f_fs.c
index f855f1fc8e5e1..3fcb957e75386 100644
--- a/drivers/usb/gadget/function/f_fs.c
+++ b/drivers/usb/gadget/function/f_fs.c
@@ -33,6 +33,7 @@
 #include <linux/usb/ccid.h>
 #include <linux/usb/composite.h>
 #include <linux/usb/functionfs.h>
+#include <linux/usb/u_f.h>
 
 #include <linux/aio.h>
 #include <linux/kthread.h>
@@ -40,7 +41,6 @@
 #include <linux/eventfd.h>
 
 #include "u_fs.h"
-#include "u_f.h"
 #include "u_os_desc.h"
 #include "configfs.h"
 
diff --git a/drivers/usb/gadget/function/f_hid.c b/drivers/usb/gadget/function/f_hid.c
index 3c8a9dd585c09..a5b667a03ca83 100644
--- a/drivers/usb/gadget/function/f_hid.c
+++ b/drivers/usb/gadget/function/f_hid.c
@@ -16,8 +16,8 @@
 #include <linux/wait.h>
 #include <linux/sched.h>
 #include <linux/usb/g_hid.h>
+#include <linux/usb/u_f.h>
 
-#include "u_f.h"
 #include "u_hid.h"
 
 #define HIDG_MINORS	4
diff --git a/drivers/usb/gadget/function/f_loopback.c b/drivers/usb/gadget/function/f_loopback.c
index 17ac6ace0cffa..d500025f45128 100644
--- a/drivers/usb/gadget/function/f_loopback.c
+++ b/drivers/usb/gadget/function/f_loopback.c
@@ -14,9 +14,9 @@
 #include <linux/module.h>
 #include <linux/err.h>
 #include <linux/usb/composite.h>
+#include <linux/usb/u_f.h>
 
 #include "g_zero.h"
-#include "u_f.h"
 
 /*
  * LOOPBACK FUNCTION ... a testing vehicle for USB peripherals,
diff --git a/drivers/usb/gadget/function/f_midi.c b/drivers/usb/gadget/function/f_midi.c
index 20c6fbd94f32d..2d551ba385c71 100644
--- a/drivers/usb/gadget/function/f_midi.c
+++ b/drivers/usb/gadget/function/f_midi.c
@@ -33,8 +33,8 @@
 #include <linux/usb/gadget.h>
 #include <linux/usb/audio.h>
 #include <linux/usb/midi.h>
+#include <linux/usb/u_f.h>
 
-#include "u_f.h"
 #include "u_midi.h"
 
 MODULE_AUTHOR("Ben Williamson");
diff --git a/drivers/usb/gadget/function/f_midi2.c b/drivers/usb/gadget/function/f_midi2.c
index ec8cd7c7bbfc1..ad59be1f9c54d 100644
--- a/drivers/usb/gadget/function/f_midi2.c
+++ b/drivers/usb/gadget/function/f_midi2.c
@@ -18,8 +18,8 @@
 #include <linux/usb/gadget.h>
 #include <linux/usb/audio.h>
 #include <linux/usb/midi-v2.h>
+#include <linux/usb/u_f.h>
 
-#include "u_f.h"
 #include "u_midi2.h"
 
 struct f_midi2;
diff --git a/drivers/usb/gadget/function/f_sourcesink.c b/drivers/usb/gadget/function/f_sourcesink.c
index 2edbd9b510d60..4283fb2e365bd 100644
--- a/drivers/usb/gadget/function/f_sourcesink.c
+++ b/drivers/usb/gadget/function/f_sourcesink.c
@@ -13,10 +13,10 @@
 #include <linux/device.h>
 #include <linux/module.h>
 #include <linux/usb/composite.h>
+#include <linux/usb/u_f.h>
 #include <linux/err.h>
 
 #include "g_zero.h"
-#include "u_f.h"
 
 /*
  * SOURCE/SINK FUNCTION ... a primary testing vehicle for USB peripheral
diff --git a/drivers/usb/gadget/u_f.c b/drivers/usb/gadget/u_f.c
index 6aea1ecb39999..90a7f742549a4 100644
--- a/drivers/usb/gadget/u_f.c
+++ b/drivers/usb/gadget/u_f.c
@@ -8,7 +8,7 @@
  * Author: Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>
  */
 
-#include "u_f.h"
+#include <linux/usb/u_f.h>
 #include <linux/usb/ch9.h>
 
 struct usb_request *alloc_ep_req(struct usb_ep *ep, size_t len)
diff --git a/drivers/usb/gadget/u_f.h b/include/linux/usb/u_f.h
similarity index 100%
rename from drivers/usb/gadget/u_f.h
rename to include/linux/usb/u_f.h

-- 
2.39.2


