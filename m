Return-Path: <linux-usb+bounces-3307-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D288C7F79A5
	for <lists+linux-usb@lfdr.de>; Fri, 24 Nov 2023 17:44:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 89484281C63
	for <lists+linux-usb@lfdr.de>; Fri, 24 Nov 2023 16:44:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEF3E364AA;
	Fri, 24 Nov 2023 16:44:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-usb@vger.kernel.org
Received: from hi1smtp01.de.adit-jv.com (smtp1.de.adit-jv.com [93.241.18.167])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E45D3173D;
	Fri, 24 Nov 2023 08:44:45 -0800 (PST)
Received: from hi2exch02.adit-jv.com (hi2exch02.adit-jv.com [10.72.92.28])
	by hi1smtp01.de.adit-jv.com (Postfix) with ESMTP id 7E15A5201D5;
	Fri, 24 Nov 2023 17:44:44 +0100 (CET)
Received: from vmlxhi-118.adit-jv.com (10.72.93.77) by hi2exch02.adit-jv.com
 (10.72.92.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.34; Fri, 24 Nov
 2023 17:44:44 +0100
From: Hardik Gajjar <hgajjar@de.adit-jv.com>
To: <gregkh@linuxfoundation.org>, <quic_ugoswami@quicinc.com>,
	<brauner@kernel.org>
CC: <jlayton@kernel.org>, <john@keeping.me.uk>, <linux-usb@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <erosca@de.adit-jv.com>,
	<hgajjar@de.adit-jv.com>
Subject: [PATCH] usb: gadget: f_fs: Add the missing get_alt callback
Date: Fri, 24 Nov 2023 17:44:35 +0100
Message-ID: <20231124164435.74727-1-hgajjar@de.adit-jv.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: hi2exch02.adit-jv.com (10.72.92.28) To
 hi2exch02.adit-jv.com (10.72.92.28)

Some USB OTG hubs have multiple alternate configurations to offer,
such as one for Carplay and another for Carlife.

This patch implements and sets the get_alt callback to retrieve the
currently used alternate setting. The new function allows dynamic
retrieval of the current alternate setting for a specific interface. The
current alternate setting values are stored in the 'cur_alt' array
within the 'ffs_function' structure.

Signed-off-by: Hardik Gajjar <hgajjar@de.adit-jv.com>
---
 drivers/usb/gadget/function/f_fs.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/function/f_fs.c b/drivers/usb/gadget/function/f_fs.c
index efe3e3b85769..37c47c11f57a 100644
--- a/drivers/usb/gadget/function/f_fs.c
+++ b/drivers/usb/gadget/function/f_fs.c
@@ -75,6 +75,7 @@ struct ffs_function {
 	short				*interfaces_nums;
 
 	struct usb_function		function;
+	int				cur_alt[MAX_CONFIG_INTERFACES];
 };
 
 
@@ -98,6 +99,7 @@ static int __must_check ffs_func_eps_enable(struct ffs_function *func);
 static int ffs_func_bind(struct usb_configuration *,
 			 struct usb_function *);
 static int ffs_func_set_alt(struct usb_function *, unsigned, unsigned);
+static int ffs_func_get_alt(struct usb_function *f, unsigned int intf);
 static void ffs_func_disable(struct usb_function *);
 static int ffs_func_setup(struct usb_function *,
 			  const struct usb_ctrlrequest *);
@@ -3232,6 +3234,15 @@ static void ffs_reset_work(struct work_struct *work)
 	ffs_data_reset(ffs);
 }
 
+static int ffs_func_get_alt(struct usb_function *f,
+			    unsigned int interface)
+{
+	struct ffs_function *func = ffs_func_from_usb(f);
+	int intf = ffs_func_revmap_intf(func, interface);
+
+	return (intf < 0) ? intf : func->cur_alt[interface];
+}
+
 static int ffs_func_set_alt(struct usb_function *f,
 			    unsigned interface, unsigned alt)
 {
@@ -3266,8 +3277,10 @@ static int ffs_func_set_alt(struct usb_function *f,
 
 	ffs->func = func;
 	ret = ffs_func_eps_enable(func);
-	if (ret >= 0)
+	if (ret >= 0) {
 		ffs_event_add(ffs, FUNCTIONFS_ENABLE);
+		func->cur_alt[interface] = alt;
+	}
 	return ret;
 }
 
@@ -3574,6 +3587,7 @@ static struct usb_function *ffs_alloc(struct usb_function_instance *fi)
 	func->function.bind    = ffs_func_bind;
 	func->function.unbind  = ffs_func_unbind;
 	func->function.set_alt = ffs_func_set_alt;
+	func->function.get_alt = ffs_func_get_alt;
 	func->function.disable = ffs_func_disable;
 	func->function.setup   = ffs_func_setup;
 	func->function.req_match = ffs_func_req_match;
-- 
2.17.1


