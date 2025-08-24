Return-Path: <linux-usb+bounces-27216-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 06D99B3311A
	for <lists+linux-usb@lfdr.de>; Sun, 24 Aug 2025 17:13:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 78AED7A17BC
	for <lists+linux-usb@lfdr.de>; Sun, 24 Aug 2025 15:12:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A127329AB13;
	Sun, 24 Aug 2025 15:13:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UgSogNzO"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0DCE244663
	for <linux-usb@vger.kernel.org>; Sun, 24 Aug 2025 15:13:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756048411; cv=none; b=Trn8CUggUQ6zeXJQ6LYxY9EKWb25M4osyM93mbpIcJ0BlsXVO5JOg+ic9fQYaEb+gD9Cw9ZCWkETpIZeWG3/Ijgud8TLRwg5wGEb99VfU91f/0gLxCRJYFQ6ocM+c3yhSB54QLxwPqQYChMu/f4WZCLfBzuOm9N1USlx5zqia0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756048411; c=relaxed/simple;
	bh=dFNv3kuKX6xNETfwvmPN0ESJ7Y4BSG4qSLKcoxFk+oI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DTEGu6gl6JGqFwEW0lebuXrQGGi6r+ufeCV8Xk7zFhtB7HcMfZGhn6/yDz/1e7nERWZLtjlMLPihUYXW9xX46bMPf/taqS0aR//0xbQbr+xnJs4s8AzygRTGL4iii5wdaDWN8hEsHtqe0E/k7VIiztjvZ7JTV6HXYz8U6S5ik6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UgSogNzO; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-4b2cf656e4fso3512631cf.0
        for <linux-usb@vger.kernel.org>; Sun, 24 Aug 2025 08:13:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756048408; x=1756653208; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2HX9YUCYX4wD+L8eYWIxV5b+Y9/4LeqoXjBA/t1VUmk=;
        b=UgSogNzOs9C+bdilCK2G6EzHKs9p5hrbIa5s3MJFJlj0aBD793WiurzLunCbh4TUyp
         zLC9zxpSgFRomOCw+bLGqeM8eH6Ox7KFazllfj7ZmRXq/BPIzvziPomeOLx+Lfz3PBic
         BIqMCTa0RZ19A6aOmKyFydjpmwHzSaccKLjvqHFUqC2kTrXexk5hxdmPxz2u565Pi6gG
         3TWUAjM5FfS8Y8RyM+ybE6ioHPyogDNh6kJ3gOiUHhC31LfrMM+sMiw+udXdRwkA8rIQ
         JUim+pRcvZzLfWP8AY/cVCJiA/Fj4TNgcpTkvDowiyr2h4iYc6GDp3q60LNzbyKFAPmr
         o56w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756048408; x=1756653208;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2HX9YUCYX4wD+L8eYWIxV5b+Y9/4LeqoXjBA/t1VUmk=;
        b=uToRp5Uh1ozNE2WskCwEVaUU92lux8pLZqi35CILDKeJ0e1rxLcnHgWRH9zD86LiAv
         9lFVkpvWg8OGeFfEOWIskXpgNN3DqhG8Xay5JZGHe7VczU+Q6SlObzFe9kJi+V0dOHgl
         DGuJnpNFhm9Og0h317uG2eebWrqMHObymnICtoTPyXYu6kH4OOEegvTYnZbVjc6i032L
         JHTBb2XbVzv7hrehXy+R6ydZE1ipeeU2c9PuKOzHueH1nttvwBm7bUGLN9oWqg/VuaXT
         xQbx5GfGvxAzd3Ow/ayiL9Xhi2IgRGrndE0vcPAENz+aYh05V62NNuRAxIMD2OfWkTZt
         muCw==
X-Gm-Message-State: AOJu0YyYHHE0A+X20lEPeEZ0+9/pN+Nr9eevEUB8p7LjIVcneQBNH5EW
	owCbiVIWWqoQPitT5iC8Yxh0fyWGyTwEQaRQs7FRKYEfKn8ZmZxN+ekS
X-Gm-Gg: ASbGnctC71GwItWKaX3zPqjIcUHzf2haYU5zC1g1yf8+TVNjtWyTvygRUys6Ec3DTdW
	FzvFClBX2oD+ovthumUupbxnmsH6Oih9D45WRErTDcn4cunM5MhuPKLHXcSM092tcuIHbCvFkta
	rsYF7TxnhB2SqV9heiEQPIgf9WuNX0MTm2Q9Z/RbfyTcZqhooO+tnRns4ZATRkFcJgwC+j/m58d
	EhB+I7CXDA08WH6dpqIqVQhMqhNevqacQitf0wQWIdWREj2mOj7s+d98i84UotlwPPYBXS8jj71
	MAHNWfY3C+FBhkjGOFkJ4pA4a8+ZzySpqvY81ctd1gQYgYswM7BTogK+uVSFU8uflhnjpMAwRie
	fREWtyJphbxYfzY/I9KqcY6+5F75Ymps6/RCqcedplAwg4jP+n+bHdckR+Q==
X-Google-Smtp-Source: AGHT+IEIqH9duUT7lFwviPRhNVrA9H4qelpELN86rmSQ04BWlw1NWWeSo/7150bP+HyT1y4qDKLXUQ==
X-Received: by 2002:a05:622a:4d2:b0:4ab:3963:c650 with SMTP id d75a77b69052e-4b29fe9bb8cmr121552871cf.10.1756048408172;
        Sun, 24 Aug 2025 08:13:28 -0700 (PDT)
Received: from cr-x-redhat96-nsd-2.fyre.ibm.com ([129.41.87.0])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4b2b8c61627sm33356731cf.8.2025.08.24.08.13.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Aug 2025 08:13:27 -0700 (PDT)
From: Chelsy Ratnawat <chelsyratnawat2001@gmail.com>
To: andreas.noever@gmail.com,
	westeri@kernel.org,
	michael.jamet@intel.com,
	YehezkelShB@gmail.com
Cc: linux-usb@vger.kernel.org,
	Chelsy Ratnawat <chelsyratnawat2001@gmail.com>
Subject: [PATCH] drivers: thunderbolt: Use string choices helpers
Date: Sun, 24 Aug 2025 08:13:16 -0700
Message-ID: <20250824151316.2388812-1-chelsyratnawat2001@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use string_choices.h helpers instead of hard-coded strings.

Signed-off-by: Chelsy Ratnawat <chelsyratnawat2001@gmail.com>
---
 drivers/thunderbolt/debugfs.c |  3 ++-
 drivers/thunderbolt/nhi.c     |  3 ++-
 drivers/thunderbolt/usb4.c    | 13 +++++++------
 3 files changed, 11 insertions(+), 8 deletions(-)

diff --git a/drivers/thunderbolt/debugfs.c b/drivers/thunderbolt/debugfs.c
index f8328ca7e22e..628337ac880e 100644
--- a/drivers/thunderbolt/debugfs.c
+++ b/drivers/thunderbolt/debugfs.c
@@ -13,6 +13,7 @@
 #include <linux/delay.h>
 #include <linux/pm_runtime.h>
 #include <linux/uaccess.h>
+#include <linux/string_choices.h>
 
 #include "tb.h"
 #include "sb_regs.h"
@@ -691,7 +692,7 @@ static int margining_caps_show(struct seq_file *s, void *not_used)
 		seq_printf(s, "0x%08x\n", margining->caps[i]);
 
 	seq_printf(s, "# software margining: %s\n",
-		   supports_software(margining) ? "yes" : "no");
+		   str_yes_no(supports_software(margining)));
 	if (supports_hardware(margining)) {
 		seq_puts(s, "# hardware margining: yes\n");
 		seq_puts(s, "# minimum BER level contour: ");
diff --git a/drivers/thunderbolt/nhi.c b/drivers/thunderbolt/nhi.c
index f3a2264e012b..679c51440174 100644
--- a/drivers/thunderbolt/nhi.c
+++ b/drivers/thunderbolt/nhi.c
@@ -20,6 +20,7 @@
 #include <linux/delay.h>
 #include <linux/property.h>
 #include <linux/string_helpers.h>
+#include <linux/string_choices.h>
 
 #include "nhi.h"
 #include "nhi_regs.h"
@@ -146,7 +147,7 @@ static void ring_interrupt_active(struct tb_ring *ring, bool active)
 		dev_WARN(&ring->nhi->pdev->dev,
 					 "interrupt for %s %d is already %s\n",
 					 RING_TYPE(ring), ring->hop,
-					 active ? "enabled" : "disabled");
+					 str_enabled_disabled(active));
 
 	if (active)
 		iowrite32(new, ring->nhi->iobase + reg);
diff --git a/drivers/thunderbolt/usb4.c b/drivers/thunderbolt/usb4.c
index fdae76c8f728..4729b45aac1f 100644
--- a/drivers/thunderbolt/usb4.c
+++ b/drivers/thunderbolt/usb4.c
@@ -10,6 +10,7 @@
 #include <linux/delay.h>
 #include <linux/ktime.h>
 #include <linux/units.h>
+#include <linux/string_choices.h>
 
 #include "sb_regs.h"
 #include "tb.h"
@@ -172,8 +173,8 @@ void usb4_switch_check_wakes(struct tb_switch *sw)
 			return;
 
 		tb_sw_dbg(sw, "PCIe wake: %s, USB3 wake: %s\n",
-			  (val & ROUTER_CS_6_WOPS) ? "yes" : "no",
-			  (val & ROUTER_CS_6_WOUS) ? "yes" : "no");
+			  str_yes_no(val & ROUTER_CS_6_WOPS),
+			  str_yes_no(val & ROUTER_CS_6_WOUS));
 
 		wakeup = val & (ROUTER_CS_6_WOPS | ROUTER_CS_6_WOUS);
 	}
@@ -191,9 +192,9 @@ void usb4_switch_check_wakes(struct tb_switch *sw)
 			break;
 
 		tb_port_dbg(port, "USB4 wake: %s, connection wake: %s, disconnection wake: %s\n",
-			    (val & PORT_CS_18_WOU4S) ? "yes" : "no",
-			    (val & PORT_CS_18_WOCS) ? "yes" : "no",
-			    (val & PORT_CS_18_WODS) ? "yes" : "no");
+			    str_yes_no(val & PORT_CS_18_WOU4S),
+			    str_yes_no(val & PORT_CS_18_WOCS),
+			    str_yes_no(val & PORT_CS_18_WODS));
 
 		wakeup_usb4 = val & (PORT_CS_18_WOU4S | PORT_CS_18_WOCS |
 				     PORT_CS_18_WODS);
@@ -260,7 +261,7 @@ int usb4_switch_setup(struct tb_switch *sw)
 	tbt3 = !(val & ROUTER_CS_6_TNS);
 
 	tb_sw_dbg(sw, "TBT3 support: %s, xHCI: %s\n",
-		  tbt3 ? "yes" : "no", xhci ? "yes" : "no");
+		  str_yes_no(tbt3), str_yes_no(xhci));
 
 	ret = tb_sw_read(sw, &val, TB_CFG_SWITCH, ROUTER_CS_5, 1);
 	if (ret)
-- 
2.47.3


