Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 12D1E2B91F0
	for <lists+linux-usb@lfdr.de>; Thu, 19 Nov 2020 13:01:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726105AbgKSL7j (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 19 Nov 2020 06:59:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725877AbgKSL7i (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 19 Nov 2020 06:59:38 -0500
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com [IPv6:2a00:1450:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1AB72C0613CF
        for <linux-usb@vger.kernel.org>; Thu, 19 Nov 2020 03:59:38 -0800 (PST)
Received: by mail-ed1-x543.google.com with SMTP id v22so5523968edt.9
        for <linux-usb@vger.kernel.org>; Thu, 19 Nov 2020 03:59:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=yXed+0a74u3qm8TIqk9+SjxVFtPdt7Ar5Nm2jWwjYjo=;
        b=rgjOmNuOF54YVpq6DbGP7bAuo75P7pBQHgqiSUYrk8BLEdTalK2kRFMlulSKsGRLl2
         C2jApk3ov9FJ3/zC9wU6z3/BMgiRRqnEOwXXIBm7KUzGb2ZqEQN3ltbXXHQCAUJoF/ER
         fIMM0HaSn7dZt2WB9I0RkC83CzNhBxUtdp8B555EPpnUqo2PwlK1rSyh7FS2I2VvzVav
         SDcBpG9Y43sVY58UVUPY5GY88Vua8TcwPBQqA9EOb9WPqsAaymoXUKQdKhB181q0pB6m
         8LtJny0UjxCj+JK2dDX/Xug6fqs3zpGp09M6wT9KUBAAA92/619vNAsLdqQBiw5LBT66
         AY+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=yXed+0a74u3qm8TIqk9+SjxVFtPdt7Ar5Nm2jWwjYjo=;
        b=ZY3hgEvr5Sw8WyQwo3dfcMDW7wq+NP+UV4pxYKv1AfU7VV32bNTmtuKgrlWATpJPv+
         7AuU+Dy443Fg0kiWgU+MFFgvFo5tG2XR2p3dme4U5uS2DSKvNOHfPq33XxvszqEEkVUD
         EUpkfwXtMU2zSJCsmmqDz6z3DgHXzMO6RHGcT4oOx8v5wrrnmxS65BO+UaZdBa3Rpq7c
         I9fSTn5/lcWPEdCfdS6PMxFY/N5jnOg+oR1xUdfJrfODEtYoILWPgHLR6ehMZXODpFAK
         WUdhThT9wE/nrQwQ8lhOVV5rhniN3fnRcmi+wgTmpmYSI9hvOVxnu/yGD5PJUAOqZYda
         6wPg==
X-Gm-Message-State: AOAM531jqYZa78eaugJ1QC3JYva3UCarIfJFZK3ndoRYZBTZ+SsCrku6
        w7/iqMMk9i87EdcKFmTMbt4HPSkmSek=
X-Google-Smtp-Source: ABdhPJzd3MGYoeDx61JENzPEJbm8+nXoGJaKB5HLfpwfKMaMlMmppaNyUcx4+JgD7i9Yw1d6Undrug==
X-Received: by 2002:aa7:db0c:: with SMTP id t12mr26547569eds.41.1605787176619;
        Thu, 19 Nov 2020 03:59:36 -0800 (PST)
Received: from gci-Precision-M2800.fritz.box ([2a02:8109:8b00:c24:8af:bf85:ef0f:2ed7])
        by smtp.googlemail.com with ESMTPSA id l27sm14290846eja.20.2020.11.19.03.59.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2020 03:59:36 -0800 (PST)
From:   Giacinto Cifelli <gciofono@gmail.com>
To:     linux-usb@vger.kernel.org
Cc:     Giacinto Cifelli <gciofono@gmail.com>
Subject: [PATCH] option: added support for Thales Cinterion MV31 option port.
Date:   Thu, 19 Nov 2020 12:59:31 +0100
Message-Id: <20201119115931.19050-1-gciofono@gmail.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

There is a single option port in this modem, and it is used as debug port

Signed-off-by: Giacinto Cifelli <gciofono@gmail.com>
---
 drivers/usb/serial/option.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/usb/serial/option.c b/drivers/usb/serial/option.c
index 54ca85cc920d..3ad86a6e8487 100644
--- a/drivers/usb/serial/option.c
+++ b/drivers/usb/serial/option.c
@@ -424,6 +424,7 @@ static void option_instat_callback(struct urb *urb);
 #define CINTERION_PRODUCT_AHXX_2RMNET		0x0084
 #define CINTERION_PRODUCT_AHXX_AUDIO		0x0085
 #define CINTERION_PRODUCT_CLS8			0x00b0
+#define CINTERION_PRODUCT_EXS82			0x006c
 
 /* Olivetti products */
 #define OLIVETTI_VENDOR_ID			0x0b3c
@@ -1908,6 +1909,8 @@ static const struct usb_device_id option_ids[] = {
 	{ USB_DEVICE(SIEMENS_VENDOR_ID, CINTERION_PRODUCT_HC25_MDMNET) },
 	{ USB_DEVICE(SIEMENS_VENDOR_ID, CINTERION_PRODUCT_HC28_MDM) }, /* HC28 enumerates with Siemens or Cinterion VID depending on FW revision */
 	{ USB_DEVICE(SIEMENS_VENDOR_ID, CINTERION_PRODUCT_HC28_MDMNET) },
+	{ USB_DEVICE_INTERFACE_CLASS(CINTERION_VENDOR_ID, CINTERION_PRODUCT_EXS82, 0xff),
+	  .driver_info = RSVD(1) | RSVD(2) | RSVD(3) },
 	{ USB_DEVICE(OLIVETTI_VENDOR_ID, OLIVETTI_PRODUCT_OLICARD100),
 	  .driver_info = RSVD(4) },
 	{ USB_DEVICE(OLIVETTI_VENDOR_ID, OLIVETTI_PRODUCT_OLICARD120),
-- 
2.17.1

