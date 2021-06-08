Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5760539EDC6
	for <lists+linux-usb@lfdr.de>; Tue,  8 Jun 2021 06:42:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229518AbhFHEoF (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 8 Jun 2021 00:44:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229462AbhFHEoE (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 8 Jun 2021 00:44:04 -0400
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD3D9C061574
        for <linux-usb@vger.kernel.org>; Mon,  7 Jun 2021 21:41:58 -0700 (PDT)
Received: by mail-pf1-x430.google.com with SMTP id c12so14804615pfl.3
        for <linux-usb@vger.kernel.org>; Mon, 07 Jun 2021 21:41:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Vo3NJty67H9WlqWGdWdy1tsQX5S3NEsXmRsVFk6RZqk=;
        b=Rh26pxZmKg386ytlVn26uRfuo8vwnTiwGSlBUmArS93WHF0/Qldutc3uzytG646ZJM
         rEcDT1qaQfnAkR9+nnAeW74tXCGSz3+jbOYpR+c4yh+e5U1dKzbG4L8KCQDB0ECikkqn
         pFoqhnIhJhtWmLKj0xhWKQNQOWBf+H6IcrrgR0yCMLk+FZoDHKRDvXD2p/sCIBpKjBKY
         XZxdnbyKcF7J9aftz9leo6w5ovtcy1al6kUP+X6svSgsGf/chZaPoj7BRqY02N4pu9xs
         3tABPj/LEjQgMYkw27Dj6OYum3dmJgVm/CmR3V+gxO/pMigwy6q3Q/uISi1WTYDYJv9S
         KpmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Vo3NJty67H9WlqWGdWdy1tsQX5S3NEsXmRsVFk6RZqk=;
        b=LmGGkSAt0YH8Cv+f/vN9VTDmA+TWNDWHSURaBKmFR166IaNXJLBp8II6PbeaIr84dj
         ur8kNx+cMDGxIcu+QofQwY6KktN4mnkidK8pHagzDlNXLVi7CUrXIZUI+HWJlhP11KfR
         dEbX5ibZZXJzKJj6/5fh3YxniydfPKUjXwffpCn7G/hm+fciJ3oUKGuN+bsICHmHKgfx
         XM7gx6+3l76RRZvorpa9YEJDINwSODDztLhRQkaw+qTrIV/hZB0yUGwC5v14QNkJQA/M
         Kf0pWaBwYSaDcbQOmyZIzXvaizUBXz8XlUH3PxSEaa+vPCwsr/LeRyXraW1KA4xcD0w9
         0PJA==
X-Gm-Message-State: AOAM5339ymjuvhpMDy85XeTyUbmfz9WNnJIN4zBW49lIzQbSv1bBU4Ee
        imNey/i0oZnaUvwJL9h+Mi8=
X-Google-Smtp-Source: ABdhPJyLZjqYL05+OjNsdTnJLP0whgoacRxFCzmFzcMdt9jyHsE6aKBNAqpnBJYYKY5oah8RER0YUw==
X-Received: by 2002:a63:3fc6:: with SMTP id m189mr16268443pga.239.1623127318283;
        Mon, 07 Jun 2021 21:41:58 -0700 (PDT)
Received: from athina.mtv.corp.google.com ([2620:15c:211:0:34c3:22d8:b92a:ddfa])
        by smtp.gmail.com with ESMTPSA id 195sm9457764pfz.24.2021.06.07.21.41.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jun 2021 21:41:57 -0700 (PDT)
From:   =?UTF-8?q?Maciej=20=C5=BBenczykowski?= <zenczykowski@gmail.com>
To:     =?UTF-8?q?Maciej=20=C5=BBenczykowski?= <maze@google.com>
Cc:     Linux USB Mailing List <linux-usb@vger.kernel.org>,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Gustavo A . R . Silva" <gustavoars@kernel.org>,
        Lorenzo Colitti <lorenzo@google.com>,
        "Martin K . Petersen" <martin.petersen@oracle.com>,
        Michael R Sweet <msweet@msweet.org>,
        Mike Christie <michael.christie@oracle.com>,
        Pawel Laszczak <pawell@cadence.com>,
        Peter Chen <peter.chen@nxp.com>,
        Sudhakar Panneerselvam <sudhakar.panneerselvam@oracle.com>,
        Wei Ming Chen <jj251510319013@gmail.com>,
        Will McVicker <willmcvicker@google.com>,
        Zqiang <qiang.zhang@windriver.com>
Subject: [PATCH] usb: fix various gadgets null ptr deref on 10gbps cabling.
Date:   Mon,  7 Jun 2021 21:41:41 -0700
Message-Id: <20210608044141.3898496-1-zenczykowski@gmail.com>
X-Mailer: git-send-email 2.32.0.rc1.229.g3e70b5a671-goog
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Maciej Żenczykowski <maze@google.com>

This avoids a null pointer dereference in
f_{ecm,eem,hid,loopback,printer,rndis,serial,sourcesink,subset,tcm}
by simply reusing the 5gbps config for 10gbps.

Cc: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Felipe Balbi <balbi@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Gustavo A. R. Silva <gustavoars@kernel.org>
Cc: Lorenzo Colitti <lorenzo@google.com>
Cc: Martin K. Petersen <martin.petersen@oracle.com>
Cc: Michael R Sweet <msweet@msweet.org>
Cc: Mike Christie <michael.christie@oracle.com>
Cc: Pawel Laszczak <pawell@cadence.com>
Cc: Peter Chen <peter.chen@nxp.com>
Cc: Sudhakar Panneerselvam <sudhakar.panneerselvam@oracle.com>
Cc: Wei Ming Chen <jj251510319013@gmail.com>
Cc: Will McVicker <willmcvicker@google.com>
Cc: Zqiang <qiang.zhang@windriver.com>
Fixes: eaef50c76057 ("usb: gadget: Update usb_assign_descriptors for SuperSpeedPlus")
Signed-off-by: Maciej Żenczykowski <maze@google.com>
---
 drivers/usb/gadget/function/f_ecm.c        | 2 +-
 drivers/usb/gadget/function/f_eem.c        | 2 +-
 drivers/usb/gadget/function/f_hid.c        | 3 ++-
 drivers/usb/gadget/function/f_loopback.c   | 2 +-
 drivers/usb/gadget/function/f_printer.c    | 3 ++-
 drivers/usb/gadget/function/f_rndis.c      | 2 +-
 drivers/usb/gadget/function/f_serial.c     | 2 +-
 drivers/usb/gadget/function/f_sourcesink.c | 3 ++-
 drivers/usb/gadget/function/f_subset.c     | 2 +-
 drivers/usb/gadget/function/f_tcm.c        | 3 ++-
 10 files changed, 14 insertions(+), 10 deletions(-)

diff --git a/drivers/usb/gadget/function/f_ecm.c b/drivers/usb/gadget/function/f_ecm.c
index 7f5cf488b2b1..ffe2486fce71 100644
--- a/drivers/usb/gadget/function/f_ecm.c
+++ b/drivers/usb/gadget/function/f_ecm.c
@@ -791,7 +791,7 @@ ecm_bind(struct usb_configuration *c, struct usb_function *f)
 		fs_ecm_notify_desc.bEndpointAddress;
 
 	status = usb_assign_descriptors(f, ecm_fs_function, ecm_hs_function,
-			ecm_ss_function, NULL);
+			ecm_ss_function, ecm_ss_function);
 	if (status)
 		goto fail;
 
diff --git a/drivers/usb/gadget/function/f_eem.c b/drivers/usb/gadget/function/f_eem.c
index cfcc4e81fb77..e6cb38439c41 100644
--- a/drivers/usb/gadget/function/f_eem.c
+++ b/drivers/usb/gadget/function/f_eem.c
@@ -302,7 +302,7 @@ static int eem_bind(struct usb_configuration *c, struct usb_function *f)
 	eem_ss_out_desc.bEndpointAddress = eem_fs_out_desc.bEndpointAddress;
 
 	status = usb_assign_descriptors(f, eem_fs_function, eem_hs_function,
-			eem_ss_function, NULL);
+			eem_ss_function, eem_ss_function);
 	if (status)
 		goto fail;
 
diff --git a/drivers/usb/gadget/function/f_hid.c b/drivers/usb/gadget/function/f_hid.c
index 1125f4715830..e55699308117 100644
--- a/drivers/usb/gadget/function/f_hid.c
+++ b/drivers/usb/gadget/function/f_hid.c
@@ -802,7 +802,8 @@ static int hidg_bind(struct usb_configuration *c, struct usb_function *f)
 		hidg_fs_out_ep_desc.bEndpointAddress;
 
 	status = usb_assign_descriptors(f, hidg_fs_descriptors,
-			hidg_hs_descriptors, hidg_ss_descriptors, NULL);
+			hidg_hs_descriptors, hidg_ss_descriptors,
+			hidg_ss_descriptors);
 	if (status)
 		goto fail;
 
diff --git a/drivers/usb/gadget/function/f_loopback.c b/drivers/usb/gadget/function/f_loopback.c
index b56ad7c3838b..ae41f556eb75 100644
--- a/drivers/usb/gadget/function/f_loopback.c
+++ b/drivers/usb/gadget/function/f_loopback.c
@@ -207,7 +207,7 @@ static int loopback_bind(struct usb_configuration *c, struct usb_function *f)
 	ss_loop_sink_desc.bEndpointAddress = fs_loop_sink_desc.bEndpointAddress;
 
 	ret = usb_assign_descriptors(f, fs_loopback_descs, hs_loopback_descs,
-			ss_loopback_descs, NULL);
+			ss_loopback_descs, ss_loopback_descs);
 	if (ret)
 		return ret;
 
diff --git a/drivers/usb/gadget/function/f_printer.c b/drivers/usb/gadget/function/f_printer.c
index f47fdc1fa7f1..59d382fe1bbf 100644
--- a/drivers/usb/gadget/function/f_printer.c
+++ b/drivers/usb/gadget/function/f_printer.c
@@ -1101,7 +1101,8 @@ static int printer_func_bind(struct usb_configuration *c,
 	ss_ep_out_desc.bEndpointAddress = fs_ep_out_desc.bEndpointAddress;
 
 	ret = usb_assign_descriptors(f, fs_printer_function,
-			hs_printer_function, ss_printer_function, NULL);
+			hs_printer_function, ss_printer_function,
+			ss_printer_function);
 	if (ret)
 		return ret;
 
diff --git a/drivers/usb/gadget/function/f_rndis.c b/drivers/usb/gadget/function/f_rndis.c
index 0739b05a0ef7..ee95e8f5f9d4 100644
--- a/drivers/usb/gadget/function/f_rndis.c
+++ b/drivers/usb/gadget/function/f_rndis.c
@@ -789,7 +789,7 @@ rndis_bind(struct usb_configuration *c, struct usb_function *f)
 	ss_notify_desc.bEndpointAddress = fs_notify_desc.bEndpointAddress;
 
 	status = usb_assign_descriptors(f, eth_fs_function, eth_hs_function,
-			eth_ss_function, NULL);
+			eth_ss_function, eth_ss_function);
 	if (status)
 		goto fail;
 
diff --git a/drivers/usb/gadget/function/f_serial.c b/drivers/usb/gadget/function/f_serial.c
index e62713846350..1ed8ff0ac2d3 100644
--- a/drivers/usb/gadget/function/f_serial.c
+++ b/drivers/usb/gadget/function/f_serial.c
@@ -233,7 +233,7 @@ static int gser_bind(struct usb_configuration *c, struct usb_function *f)
 	gser_ss_out_desc.bEndpointAddress = gser_fs_out_desc.bEndpointAddress;
 
 	status = usb_assign_descriptors(f, gser_fs_function, gser_hs_function,
-			gser_ss_function, NULL);
+			gser_ss_function, gser_ss_function);
 	if (status)
 		goto fail;
 	dev_dbg(&cdev->gadget->dev, "generic ttyGS%d: %s speed IN/%s OUT/%s\n",
diff --git a/drivers/usb/gadget/function/f_sourcesink.c b/drivers/usb/gadget/function/f_sourcesink.c
index 5a201ba7b155..1abf08e5164a 100644
--- a/drivers/usb/gadget/function/f_sourcesink.c
+++ b/drivers/usb/gadget/function/f_sourcesink.c
@@ -431,7 +431,8 @@ sourcesink_bind(struct usb_configuration *c, struct usb_function *f)
 	ss_iso_sink_desc.bEndpointAddress = fs_iso_sink_desc.bEndpointAddress;
 
 	ret = usb_assign_descriptors(f, fs_source_sink_descs,
-			hs_source_sink_descs, ss_source_sink_descs, NULL);
+			hs_source_sink_descs, ss_source_sink_descs,
+			ss_source_sink_descs);
 	if (ret)
 		return ret;
 
diff --git a/drivers/usb/gadget/function/f_subset.c b/drivers/usb/gadget/function/f_subset.c
index 4d945254905d..51c1cae162d9 100644
--- a/drivers/usb/gadget/function/f_subset.c
+++ b/drivers/usb/gadget/function/f_subset.c
@@ -358,7 +358,7 @@ geth_bind(struct usb_configuration *c, struct usb_function *f)
 		fs_subset_out_desc.bEndpointAddress;
 
 	status = usb_assign_descriptors(f, fs_eth_function, hs_eth_function,
-			ss_eth_function, NULL);
+			ss_eth_function, ss_eth_function);
 	if (status)
 		goto fail;
 
diff --git a/drivers/usb/gadget/function/f_tcm.c b/drivers/usb/gadget/function/f_tcm.c
index 7acb507946e6..de161ee0b1f9 100644
--- a/drivers/usb/gadget/function/f_tcm.c
+++ b/drivers/usb/gadget/function/f_tcm.c
@@ -2057,7 +2057,8 @@ static int tcm_bind(struct usb_configuration *c, struct usb_function *f)
 	uasp_fs_cmd_desc.bEndpointAddress = uasp_ss_cmd_desc.bEndpointAddress;
 
 	ret = usb_assign_descriptors(f, uasp_fs_function_desc,
-			uasp_hs_function_desc, uasp_ss_function_desc, NULL);
+			uasp_hs_function_desc, uasp_ss_function_desc,
+			uasp_ss_function_desc);
 	if (ret)
 		goto ep_fail;
 
-- 
2.32.0.rc1.229.g3e70b5a671-goog

