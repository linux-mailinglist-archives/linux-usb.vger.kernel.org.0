Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8DF9837A28D
	for <lists+linux-usb@lfdr.de>; Tue, 11 May 2021 10:51:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230497AbhEKIwR (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 11 May 2021 04:52:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230489AbhEKIwP (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 11 May 2021 04:52:15 -0400
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C8C8C061574
        for <linux-usb@vger.kernel.org>; Tue, 11 May 2021 01:51:09 -0700 (PDT)
Received: by mail-wm1-x32d.google.com with SMTP id j3-20020a05600c4843b02901484662c4ebso770278wmo.0
        for <linux-usb@vger.kernel.org>; Tue, 11 May 2021 01:51:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9wdsrW9vDLYc6IQvaaSKZQ3XOa1HAhG690/1zHFSgqw=;
        b=SDqe3vIyqiOg3rMT4NazE7yzrdytv5uiYY6zTLZBtlsAPcaBhEbZ+OS+WEClXW2Cvu
         ELlj/Mx9y5PneND99G3Q37+g9rUxSJFcUozSuEwiNEVZc1NIMtw7fDXP/XZyQB876SBL
         +a9NVOrIxk0306JAdRUV0noVQTWnRwglCg8C2Almq7buk/QJ7R5LbYIabzg+1f+HkATW
         BzQHFisDrMQpeaHvQk77MRm4Ss6+l1g4RG7D3zksLVUYiW9qOk8e7H36AhjYV3b5xATC
         RD+A0RvXvXm34QgJ/koAcrIXcHclTqAjtH0vBmEfq6tqavIUlryIRaY9CO8PTMMCLORm
         LGQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9wdsrW9vDLYc6IQvaaSKZQ3XOa1HAhG690/1zHFSgqw=;
        b=CKREcEdGsGf2vrHOWlaIo960+XNohBHSwqcjIn78zJP4c5CQIO9sgBmhXeBC8kV+m1
         h00WCjBXz4rjkcIRFHAt77AOVjdDT+kjd9ZtjZgBeyveZagpQs8Y7OFyzTv5R6pHvXmJ
         o3zQP47Vx1GnKnt8/w2I9sUPuSpRYNXa1jyZLBM27+BANrRmzDVPPMbcNMKnQT21ousj
         6ZarkNvvCxbah1Pw9XYvPJ0HvPZ5VuXnENah75k7M16N+02VZEuy4I6fV748naBvh6Fh
         4Yd0JYxGA7uDchkJRRwDaPcsNspdMThyWFnQIa3x06cNMUFgCuM01g7BLQVAK/91uGdr
         vlVw==
X-Gm-Message-State: AOAM533bDrvlExF9DxI/5rEoK58rP+cRgMVYVDHkucs1kWZKGwLQ82D5
        n4TdkjJrU9du9Hiq9j75xXj7SGtwBfP3MA==
X-Google-Smtp-Source: ABdhPJxD3VLLuc7tR8qw3mX+RO6PR2fTmFtgJ98N6KaULbSGvgPXQ2Edf6BvTlTdmNbLbPGX9aImuA==
X-Received: by 2002:a7b:c0cb:: with SMTP id s11mr31372471wmh.146.1620723068095;
        Tue, 11 May 2021 01:51:08 -0700 (PDT)
Received: from arch-thunder.local (a109-49-46-234.cpe.netcabo.pt. [109.49.46.234])
        by smtp.gmail.com with ESMTPSA id j7sm23042980wmi.21.2021.05.11.01.51.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 May 2021 01:51:07 -0700 (PDT)
From:   Rui Miguel Silva <rui.silva@linaro.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Sebastian Siewior <bigeasy@linutronix.de>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        Rui Miguel Silva <rui.silva@linaro.org>
Subject: [PATCH v2 1/9] usb: isp1760: fix strict typechecking
Date:   Tue, 11 May 2021 09:50:53 +0100
Message-Id: <20210511085101.2081399-2-rui.silva@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210511085101.2081399-1-rui.silva@linaro.org>
References: <20210511085101.2081399-1-rui.silva@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

There are a lot of pre-existing typechecking warnings around the
access and assign of elements of ptd structure of __dw type.

sparse: warning: invalid assignment: |=
sparse:    left side has type restricted __dw
sparse:    right side has type unsigned int

or

warning: restricted __dw degrades to integer

or

sparse: warning: incorrect type in assignment (different base types)
sparse:    expected restricted __dw [usertype] dw4
sparse:    got unsigned int [assigned] [usertype] usof

To handle this, annotate conversions along the {TO,FROM}_DW* macros
and some assignments and function arguments.

This clean up completely all sparse warnings for this driver.

Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
---
 drivers/usb/isp1760/isp1760-hcd.c | 92 ++++++++++++++++---------------
 1 file changed, 47 insertions(+), 45 deletions(-)

diff --git a/drivers/usb/isp1760/isp1760-hcd.c b/drivers/usb/isp1760/isp1760-hcd.c
index 33ae656c4b68..0e0a4b01c710 100644
--- a/drivers/usb/isp1760/isp1760-hcd.c
+++ b/drivers/usb/isp1760/isp1760-hcd.c
@@ -66,44 +66,46 @@ struct ptd {
 #define ATL_PTD_OFFSET		0x0c00
 #define PAYLOAD_OFFSET		0x1000
 
-
-/* ATL */
-/* DW0 */
-#define DW0_VALID_BIT			1
-#define FROM_DW0_VALID(x)		((x) & 0x01)
-#define TO_DW0_LENGTH(x)		(((u32) x) << 3)
-#define TO_DW0_MAXPACKET(x)		(((u32) x) << 18)
-#define TO_DW0_MULTI(x)			(((u32) x) << 29)
-#define TO_DW0_ENDPOINT(x)		(((u32)	x) << 31)
+#define TO_DW(x)	((__force __dw)x)
+#define TO_U32(x)	((__force u32)x)
+
+ /* ATL */
+ /* DW0 */
+#define DW0_VALID_BIT			TO_DW(1)
+#define FROM_DW0_VALID(x)		(TO_U32(x) & 0x01)
+#define TO_DW0_LENGTH(x)		TO_DW((((u32)x) << 3))
+#define TO_DW0_MAXPACKET(x)		TO_DW((((u32)x) << 18))
+#define TO_DW0_MULTI(x)			TO_DW((((u32)x) << 29))
+#define TO_DW0_ENDPOINT(x)		TO_DW((((u32)x) << 31))
 /* DW1 */
-#define TO_DW1_DEVICE_ADDR(x)		(((u32) x) << 3)
-#define TO_DW1_PID_TOKEN(x)		(((u32) x) << 10)
-#define DW1_TRANS_BULK			((u32) 2 << 12)
-#define DW1_TRANS_INT			((u32) 3 << 12)
-#define DW1_TRANS_SPLIT			((u32) 1 << 14)
-#define DW1_SE_USB_LOSPEED		((u32) 2 << 16)
-#define TO_DW1_PORT_NUM(x)		(((u32) x) << 18)
-#define TO_DW1_HUB_NUM(x)		(((u32) x) << 25)
+#define TO_DW1_DEVICE_ADDR(x)		TO_DW((((u32)x) << 3))
+#define TO_DW1_PID_TOKEN(x)		TO_DW((((u32)x) << 10))
+#define DW1_TRANS_BULK			TO_DW(((u32)2 << 12))
+#define DW1_TRANS_INT			TO_DW(((u32)3 << 12))
+#define DW1_TRANS_SPLIT			TO_DW(((u32)1 << 14))
+#define DW1_SE_USB_LOSPEED		TO_DW(((u32)2 << 16))
+#define TO_DW1_PORT_NUM(x)		TO_DW((((u32)x) << 18))
+#define TO_DW1_HUB_NUM(x)		TO_DW((((u32)x) << 25))
 /* DW2 */
-#define TO_DW2_DATA_START_ADDR(x)	(((u32) x) << 8)
-#define TO_DW2_RL(x)			((x) << 25)
-#define FROM_DW2_RL(x)			(((x) >> 25) & 0xf)
+#define TO_DW2_DATA_START_ADDR(x)	TO_DW((((u32)x) << 8))
+#define TO_DW2_RL(x)			TO_DW(((x) << 25))
+#define FROM_DW2_RL(x)			((TO_U32(x) >> 25) & 0xf)
 /* DW3 */
-#define FROM_DW3_NRBYTESTRANSFERRED(x)		((x) & 0x7fff)
-#define FROM_DW3_SCS_NRBYTESTRANSFERRED(x)	((x) & 0x07ff)
-#define TO_DW3_NAKCOUNT(x)		((x) << 19)
-#define FROM_DW3_NAKCOUNT(x)		(((x) >> 19) & 0xf)
-#define TO_DW3_CERR(x)			((x) << 23)
-#define FROM_DW3_CERR(x)		(((x) >> 23) & 0x3)
-#define TO_DW3_DATA_TOGGLE(x)		((x) << 25)
-#define FROM_DW3_DATA_TOGGLE(x)		(((x) >> 25) & 0x1)
-#define TO_DW3_PING(x)			((x) << 26)
-#define FROM_DW3_PING(x)		(((x) >> 26) & 0x1)
-#define DW3_ERROR_BIT			(1 << 28)
-#define DW3_BABBLE_BIT			(1 << 29)
-#define DW3_HALT_BIT			(1 << 30)
-#define DW3_ACTIVE_BIT			(1 << 31)
-#define FROM_DW3_ACTIVE(x)		(((x) >> 31) & 0x01)
+#define FROM_DW3_NRBYTESTRANSFERRED(x)		TO_U32((x) & 0x7fff)
+#define FROM_DW3_SCS_NRBYTESTRANSFERRED(x)	TO_U32((x) & 0x07ff)
+#define TO_DW3_NAKCOUNT(x)		TO_DW(((x) << 19))
+#define FROM_DW3_NAKCOUNT(x)		((TO_U32(x) >> 19) & 0xf)
+#define TO_DW3_CERR(x)			TO_DW(((x) << 23))
+#define FROM_DW3_CERR(x)		((TO_U32(x) >> 23) & 0x3)
+#define TO_DW3_DATA_TOGGLE(x)		TO_DW(((x) << 25))
+#define FROM_DW3_DATA_TOGGLE(x)		((TO_U32(x) >> 25) & 0x1)
+#define TO_DW3_PING(x)			TO_DW(((x) << 26))
+#define FROM_DW3_PING(x)		((TO_U32(x) >> 26) & 0x1)
+#define DW3_ERROR_BIT			TO_DW((1 << 28))
+#define DW3_BABBLE_BIT			TO_DW((1 << 29))
+#define DW3_HALT_BIT			TO_DW((1 << 30))
+#define DW3_ACTIVE_BIT			TO_DW((1 << 31))
+#define FROM_DW3_ACTIVE(x)		((TO_U32(x) >> 31) & 0x01)
 
 #define INT_UNDERRUN			(1 << 2)
 #define INT_BABBLE			(1 << 1)
@@ -292,12 +294,12 @@ static void ptd_write(void __iomem *base, u32 ptd_offset, u32 slot,
 								struct ptd *ptd)
 {
 	mem_writes8(base, ptd_offset + slot*sizeof(*ptd) + sizeof(ptd->dw0),
-						&ptd->dw1, 7*sizeof(ptd->dw1));
+		    (__force u32 *)&ptd->dw1, 7 * sizeof(ptd->dw1));
 	/* Make sure dw0 gets written last (after other dw's and after payload)
 	   since it contains the enable bit */
 	wmb();
-	mem_writes8(base, ptd_offset + slot*sizeof(*ptd), &ptd->dw0,
-							sizeof(ptd->dw0));
+	mem_writes8(base, ptd_offset + slot * sizeof(*ptd),
+		    (__force u32 *)&ptd->dw0, sizeof(ptd->dw0));
 }
 
 
@@ -553,7 +555,7 @@ static void create_ptd_atl(struct isp1760_qh *qh,
 	ptd->dw0 |= TO_DW0_ENDPOINT(usb_pipeendpoint(qtd->urb->pipe));
 
 	/* DW1 */
-	ptd->dw1 = usb_pipeendpoint(qtd->urb->pipe) >> 1;
+	ptd->dw1 = TO_DW((usb_pipeendpoint(qtd->urb->pipe) >> 1));
 	ptd->dw1 |= TO_DW1_DEVICE_ADDR(usb_pipedevice(qtd->urb->pipe));
 	ptd->dw1 |= TO_DW1_PID_TOKEN(qtd->packet_type);
 
@@ -575,7 +577,7 @@ static void create_ptd_atl(struct isp1760_qh *qh,
 		/* SE bit for Split INT transfers */
 		if (usb_pipeint(qtd->urb->pipe) &&
 				(qtd->urb->dev->speed == USB_SPEED_LOW))
-			ptd->dw1 |= 2 << 16;
+			ptd->dw1 |= DW1_SE_USB_LOSPEED;
 
 		rl = 0;
 		nak = 0;
@@ -647,14 +649,14 @@ static void transform_add_int(struct isp1760_qh *qh,
 		 * that number come from? 0xff seems to work fine...
 		 */
 		/* ptd->dw5 = 0x1c; */
-		ptd->dw5 = 0xff; /* Execute Complete Split on any uFrame */
+		ptd->dw5 = TO_DW(0xff); /* Execute Complete Split on any uFrame */
 	}
 
 	period = period >> 1;/* Ensure equal or shorter period than requested */
 	period &= 0xf8; /* Mask off too large values and lowest unused 3 bits */
 
-	ptd->dw2 |= period;
-	ptd->dw4 = usof;
+	ptd->dw2 |= TO_DW(period);
+	ptd->dw4 = TO_DW(usof);
 }
 
 static void create_ptd_int(struct isp1760_qh *qh,
@@ -977,10 +979,10 @@ static void schedule_ptds(struct usb_hcd *hcd)
 static int check_int_transfer(struct usb_hcd *hcd, struct ptd *ptd,
 								struct urb *urb)
 {
-	__dw dw4;
+	u32 dw4;
 	int i;
 
-	dw4 = ptd->dw4;
+	dw4 = TO_U32(ptd->dw4);
 	dw4 >>= 8;
 
 	/* FIXME: ISP1761 datasheet does not say what to do with these. Do we
-- 
2.31.1

