Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E34C92C5FE9
	for <lists+linux-usb@lfdr.de>; Fri, 27 Nov 2020 06:58:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392516AbgK0F5a (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 27 Nov 2020 00:57:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2392514AbgK0F5a (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 27 Nov 2020 00:57:30 -0500
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ECC30C0613D1
        for <linux-usb@vger.kernel.org>; Thu, 26 Nov 2020 21:57:29 -0800 (PST)
Received: by mail-pl1-x642.google.com with SMTP id l11so2195730plt.1
        for <linux-usb@vger.kernel.org>; Thu, 26 Nov 2020 21:57:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=UpBY/RpoPRSREMNWrrwjrNMJWPpxGLcb5KLNlWk5ERE=;
        b=LO2CJ9mIt2VH3S6cMq+2UXPpTYbAoAg6KEO2YlLFrlm0YuVLhhQG6rP6fAeCKYB6DP
         pS8shI36zYh7bqvUqgB+cfXnX6iRpWUcDclJj8615aexchdIIf3512qHEYfq0/PhRM4q
         fs1LRgvhYmChNe3mUiKeVFt4JlNpeTxQm2Xs3G7fb3oZV+5WVTl2/QyZJfEYq0cKxxmr
         YNQP9wDj7bsbXqIa0+ttoHK4jECCACegRu7GVWEZAMwzBzIQziS8yn+f9ceP6y1shan6
         PlCj9IZ3s7WVH9l0Z22XLXNUkXkKzOk/qZlQYYigSdnNgMtSfBK6vbGZ7lxYVOKoZMge
         trnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=UpBY/RpoPRSREMNWrrwjrNMJWPpxGLcb5KLNlWk5ERE=;
        b=kuYXZZqVloGcbCMgJcYNW1nhuDyZq9TZAHK4M2gbBm1q+FcxO+wFAms8BFOUmmOamP
         YFbbZ1v4GVVBYYJr92IKTQP0v+gcJZB+zOd1zR8VP7fsn7xue3xX66GQTR+JwwI64b33
         fsZPFlwuBKT1WBPDQ0Gxk5tX7p+ZBra9oe8E5uUVI7ditiHax/XT62BVW0McowlZ+H7W
         AX9OZcPzZfQvg6SQr26pM1uzzl2d2p9Wu+2Tqd95/5ECAqpyJGQvWb3M7dxCyjtD4rZA
         eU8o2RIcy83BlA8lpssKe/OHchtZpPIQBebCDeoPwddoBHxUykczG4OC2DnXcAird/vD
         1wng==
X-Gm-Message-State: AOAM530g7XjpZ/4v8lSREK9zOnkkz/jBaNaWQMhp/kU7ByWyc4saS9rM
        WRcvdmzxVTVuNMZPHD/N9Y0=
X-Google-Smtp-Source: ABdhPJya9RBtn6ndgbjCAy5QUJyjjFLZcT4aKqmNtb+Einyxmg0TR8rJcT8Wz4BVAUbf+yOGtgmT7w==
X-Received: by 2002:a17:902:860c:b029:da:1d7d:7320 with SMTP id f12-20020a170902860cb02900da1d7d7320mr5620573plo.56.1606456649528;
        Thu, 26 Nov 2020 21:57:29 -0800 (PST)
Received: from localhost ([209.9.72.214])
        by smtp.gmail.com with ESMTPSA id h16sm6335617pfo.185.2020.11.26.21.57.28
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 26 Nov 2020 21:57:28 -0800 (PST)
From:   lijiazi <jqqlijiazi@gmail.com>
X-Google-Original-From: lijiazi <lijiazi@xiaomi.com>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Jiazi Li <lijiazi@xiaomi.com>, linux-usb@vger.kernel.org
Subject: [PATCH v2] usb: typec: add sanity check for opmode
Date:   Fri, 27 Nov 2020 13:57:23 +0800
Message-Id: <1606456643-31913-1-git-send-email-lijiazi@xiaomi.com>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Jiazi Li <lijiazi@xiaomi.com>

If usb drivers set a invalid value, for example, a negative
value. then a userspace task
cat sys/class/typec/port0/power_operation_mode, will cause a
panic issue:
[154325.262827] Unable to handle kernel paging request at virtual
address ffffff980aad8b68
[154325.262838] Mem abort info:
[154325.262843]   ESR = 0x96000005
[154325.262849]   Exception class = DABT (current EL), IL = 32 bits
[154325.262855]   SET = 0, FnV = 0
[154325.262860]   EA = 0, S1PTW = 0
[154325.262865] Data abort info:
[154325.262870]   ISV = 0, ISS = 0x00000005
[154325.262875]   CM = 0, WnR = 0
[154325.262880] swapper pgtable: 4k pages, 39-bit VAs, pgdp =
000000001cae9c14
[154325.262884] [ffffff980aad8b68] pgd=0000000000000000,
pud=0000000000000000
[154325.262891] Internal error: Oops: 96000005 [#1] PREEMPT SMP
[154325.262896] Modules linked in: rmnet_perf(O) rmnet_shs(O)
wlan(O) sla(O) exfat(O) machine_dlkm(O) tfa98xx_dlkm(O)
cs35l41_dlkm(O) wcd938x_slave_dlkm(O) wcd938x_dlkm(O)
wcd9xxx_dlkm(O) mbhc_dlkm(O) tx_macro_dlkm(O) rx_macro_dlkm(O)
va_macro_dlkm(O) wsa_macro_dlkm(O) swr_ctrl_dlkm(O)
bolero_cdc_dlkm(O) wsa881x_dlkm(O) wcd_core_dlkm(O) stub_dlkm(O)
hdmi_dlkm(O) swr_dlkm(O) pinctrl_lpi_dlkm(O) pinctrl_wcd_dlkm(O)
usf_dlkm(O) native_dlkm(O) platform_dlkm(O) q6_dlkm(O)
adsp_loader_dlkm(O) apr_dlkm(O) snd_event_dlkm(O)
q6_notifier_dlkm(O) q6_pdr_dlkm(O) [last unloaded: rmnet_perf]
[154325.262939] Process usb@1.2-service (pid: 2501, stack limit
		= 0x00000000cb0343ac)
[154325.262946] CPU: 5 PID: 2501 Comm: usb@1.2-service Tainted:
G S      W  O      4.19.113-perf-g0307705d321bc #1
[154325.262950] Hardware name: Qualcomm Technologies, Inc.
xiaomi cas (DT)
[154325.262955] pstate: 80400005 (Nzcv daif +PAN -UAO)
[154325.262967] pc : power_operation_mode_show+0x34/0x58
[154325.262971] lr : power_operation_mode_show+0x34/0x58
[154325.262974] sp : ffffffc1376bf990
[154325.262977] x29: ffffffc1376bf990 x28: ffffffc195aede58
[154325.262981] x27: ffffffc195aede48 x26: ffffff9008c55638
[154325.262986] x25: ffffffc05a44b300 x24: 0000000000001000
[154325.262990] x23: ffffffc19a340018 x22: ffffffc19a340018
[154325.262994] x21: ffffff900bb10038 x20: ffffff980aad8b68
[154325.262998] x19: ffffffc05a44b300 x18: 0000000000000000
[154325.263002] x17: 0000000000000000 x16: 0000000000000000
[154325.263006] x15: 0000000000000000 x14: 00000000080a38f8
[154325.263010] x13: ffffff880b489860 x12: 0000000000000000
[154325.263014] x11: 0000000000000000 x10: 1ffffff30155b16d
[154325.263018] x9 : 0000000000000000 x8 : 0000000000000007
[154325.263022] x7 : 0000000000000000 x6 : 000000000000003f
[154325.263026] x5 : 0000000000000040 x4 : 0000000000000000
[154325.263030] x3 : 0000000000000004 x2 : ffffffc05a44b300
[154325.263034] x1 : ffffff900bb10038 x0 : ffffff980aad8b68
[154325.263039]
[154325.263039] SP: 0xffffffc1376bf910:
[154325.263043] f910  00001000 00000000 5a44b300 ffffffc0
08c55638 ffffff90 95aede48 ffffffc1
[154325.263052] f930  95aede58 ffffffc1 376bf990 ffffffc1
09024b5c ffffff90 376bf990 ffffffc1
[154325.263060] f950  09024b5c ffffff90 80400005 00000000
376bf9c0 ffffffc1 083cdf64 ffffff90
[154325.263067] f970  ffffffff 0000007f 376bfd80 ffffffc1
376bf990 ffffffc1 09024b5c ffffff90
[154325.263075] f990  376bf9b0 ffffffc1 08c55678 ffffff90
0bb10048 ffffff90 5a44b300 ffffffc0
[154325.263082] f9b0  376bf9e0 ffffffc1 085075e0 ffffff90
0a5d43f8 ffffff90 9a9d9f00 ffffffc1
[154325.263090] f9d0  95aede48 ffffffc1 95aede58 ffffffc1
376bfa30 ffffffc1 08506248 ffffff90
[154325.263097] f9f0  95aede40 ffffffc1 00000000 00000000
00000001 00000000 9a9d9f00 ffffffc1
[154325.263106] Call trace:
[154325.263111]  power_operation_mode_show+0x34/0x58
[154325.263116]  dev_attr_show+0x40/0x80
[154325.263123]  sysfs_kf_seq_show+0x110/0x1c0
[154325.263127]  kernfs_seq_show+0x80/0x98
[154325.263133]  seq_read+0x2d8/0x778
[154325.263136]  kernfs_fop_read+0xa4/0x2a8
[154325.263142]  __vfs_read+0xd4/0x2e8
[154325.263145]  vfs_read+0xe0/0x1b0
[154325.263149]  ksys_read+0xdc/0x170
[154325.263153]  __arm64_sys_read+0x44/0x58
[154325.263158]  el0_svc_common+0xd8/0x1d0
[154325.263162]  el0_svc_handler+0x90/0xb8
[154325.263166]  el0_svc+0x8/0xc

Suggested-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Jiazi Li <lijiazi@xiaomi.com>
---
Changes in v2:
 - return -EINVAL when opmode invalid
---
 drivers/usb/typec/class.c | 8 ++++++--
 include/linux/usb/typec.h | 3 ++-
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
index cb1362187..3f55182 100644
--- a/drivers/usb/typec/class.c
+++ b/drivers/usb/typec/class.c
@@ -1559,13 +1559,15 @@ static int partner_match(struct device *dev, void *data)
  * Type-C specification, and "USB Power Delivery" when the power levels are
  * negotiated with methods defined in USB Power Delivery specification.
  */
-void typec_set_pwr_opmode(struct typec_port *port,
+int typec_set_pwr_opmode(struct typec_port *port,
 			  enum typec_pwr_opmode opmode)
 {
 	struct device *partner_dev;
 
+	if (opmode >= TYPEC_PWR_MODE_MAX)
+		return -EINVAL;
 	if (port->pwr_opmode == opmode)
-		return;
+		return 0;
 
 	port->pwr_opmode = opmode;
 	sysfs_notify(&port->dev.kobj, NULL, "power_operation_mode");
@@ -1582,6 +1584,8 @@ void typec_set_pwr_opmode(struct typec_port *port,
 		}
 		put_device(partner_dev);
 	}
+
+	return 0;
 }
 EXPORT_SYMBOL_GPL(typec_set_pwr_opmode);
 
diff --git a/include/linux/usb/typec.h b/include/linux/usb/typec.h
index 5447532..84ed661 100644
--- a/include/linux/usb/typec.h
+++ b/include/linux/usb/typec.h
@@ -56,6 +56,7 @@ enum typec_pwr_opmode {
 	TYPEC_PWR_MODE_1_5A,
 	TYPEC_PWR_MODE_3_0A,
 	TYPEC_PWR_MODE_PD,
+	TYPEC_PWR_MODE_MAX,
 };
 
 enum typec_accessory {
@@ -261,7 +262,7 @@ void typec_unregister_plug(struct typec_plug *plug);
 void typec_set_data_role(struct typec_port *port, enum typec_data_role role);
 void typec_set_pwr_role(struct typec_port *port, enum typec_role role);
 void typec_set_vconn_role(struct typec_port *port, enum typec_role role);
-void typec_set_pwr_opmode(struct typec_port *port, enum typec_pwr_opmode mode);
+int typec_set_pwr_opmode(struct typec_port *port, enum typec_pwr_opmode mode);
 
 int typec_set_orientation(struct typec_port *port,
 			  enum typec_orientation orientation);
-- 
2.7.4

