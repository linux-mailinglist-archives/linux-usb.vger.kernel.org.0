Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 484A313C2A0
	for <lists+linux-usb@lfdr.de>; Wed, 15 Jan 2020 14:25:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729073AbgAONZw (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 15 Jan 2020 08:25:52 -0500
Received: from lelv0143.ext.ti.com ([198.47.23.248]:38458 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726483AbgAONZu (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 15 Jan 2020 08:25:50 -0500
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 00FDPndh118452;
        Wed, 15 Jan 2020 07:25:49 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1579094749;
        bh=x/QY4ihjsKJBVgALk/LHBRK870RJVXCBg4TFXkmo0Yk=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=S+EWhdOH/ocGpmIsgFP7DH204wQhwEgQm/QLFQCahXR4Qofc+8OMk1NwRCqWLaNZy
         KXKszsHuftmnSH8nBcS9YQsWmNGRSxxh4vehJ+DiGdcYyE14JqINEgMtqQQ9mt7afa
         z7ZI+KODk0FOdfDlRAQMBRZd9DrytWNO8Jimc4ek=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 00FDPn46110425
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 15 Jan 2020 07:25:49 -0600
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Wed, 15
 Jan 2020 07:25:49 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Wed, 15 Jan 2020 07:25:49 -0600
Received: from uda0271908.dal.design.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 00FDPm3F066537;
        Wed, 15 Jan 2020 07:25:49 -0600
From:   Bin Liu <b-liu@ti.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     <linux-usb@vger.kernel.org>, Bin Liu <b-liu@ti.com>
Subject: [PATCH 17/25] USB: musb: fix __iomem in trace functions
Date:   Wed, 15 Jan 2020 07:25:39 -0600
Message-ID: <20200115132547.364-18-b-liu@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200115132547.364-1-b-liu@ti.com>
References: <20200115132547.364-1-b-liu@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: "Ben Dooks (Codethink)" <ben.dooks@codethink.co.uk>

The trace functions should have __iomem on the addr
pointers. Add __iomem to avoid the following warnings
from sparse:

drivers/usb/musb/musb_core.c:253:55: warning: incorrect type in argument 2 (different address spaces)
drivers/usb/musb/musb_core.c:253:55:    expected void const *addr
drivers/usb/musb/musb_core.c:253:55:    got void const [noderef] <asn:2> *addr
drivers/usb/musb/musb_core.c:259:56: warning: incorrect type in argument 2 (different address spaces)
drivers/usb/musb/musb_core.c:259:56:    expected void const *addr
drivers/usb/musb/musb_core.c:259:56:    got void [noderef] <asn:2> *addr
drivers/usb/musb/musb_core.c:267:55: warning: incorrect type in argument 2 (different address spaces)
drivers/usb/musb/musb_core.c:267:55:    expected void const *addr
drivers/usb/musb/musb_core.c:267:55:    got void const [noderef] <asn:2> *addr
drivers/usb/musb/musb_core.c:273:56: warning: incorrect type in argument 2 (different address spaces)
drivers/usb/musb/musb_core.c:273:56:    expected void const *addr
drivers/usb/musb/musb_core.c:273:56:    got void [noderef] <asn:2> *addr
drivers/usb/musb/musb_core.c:383:55: warning: incorrect type in argument 2 (different address spaces)
drivers/usb/musb/musb_core.c:383:55:    expected void const *addr
drivers/usb/musb/musb_core.c:383:55:    got void const [noderef] <asn:2> *addr
drivers/usb/musb/musb_core.c:390:56: warning: incorrect type in argument 2 (different address spaces)
drivers/usb/musb/musb_core.c:390:56:    expected void const *addr
drivers/usb/musb/musb_core.c:390:56:    got void [noderef] <asn:2> *addr

Signed-off-by: Ben Dooks (Codethink) <ben.dooks@codethink.co.uk>
Signed-off-by: Bin Liu <b-liu@ti.com>
---
 drivers/usb/musb/musb_trace.h | 33 +++++++++++++++++++++------------
 1 file changed, 21 insertions(+), 12 deletions(-)

diff --git a/drivers/usb/musb/musb_trace.h b/drivers/usb/musb/musb_trace.h
index a97d618fe8ff..b193daf69685 100644
--- a/drivers/usb/musb/musb_trace.h
+++ b/drivers/usb/musb/musb_trace.h
@@ -38,11 +38,12 @@ TRACE_EVENT(musb_log,
 );
 
 DECLARE_EVENT_CLASS(musb_regb,
-	TP_PROTO(void *caller, const void *addr, unsigned int offset, u8 data),
+	TP_PROTO(void *caller, const void  __iomem *addr,
+		 unsigned int offset, u8 data),
 	TP_ARGS(caller, addr, offset, data),
 	TP_STRUCT__entry(
 		__field(void *, caller)
-		__field(const void *, addr)
+		__field(const void __iomem *, addr)
 		__field(unsigned int, offset)
 		__field(u8, data)
 	),
@@ -57,21 +58,24 @@ DECLARE_EVENT_CLASS(musb_regb,
 );
 
 DEFINE_EVENT(musb_regb, musb_readb,
-	TP_PROTO(void *caller, const void *addr, unsigned int offset, u8 data),
+	TP_PROTO(void *caller, const void __iomem *addr,
+		 unsigned int offset, u8 data),
 	TP_ARGS(caller, addr, offset, data)
 );
 
 DEFINE_EVENT(musb_regb, musb_writeb,
-	TP_PROTO(void *caller, const void *addr, unsigned int offset, u8 data),
+	TP_PROTO(void *caller, const void __iomem *addr,
+		 unsigned int offset, u8 data),
 	TP_ARGS(caller, addr, offset, data)
 );
 
 DECLARE_EVENT_CLASS(musb_regw,
-	TP_PROTO(void *caller, const void *addr, unsigned int offset, u16 data),
+	TP_PROTO(void *caller, const void __iomem *addr,
+		 unsigned int offset, u16 data),
 	TP_ARGS(caller, addr, offset, data),
 	TP_STRUCT__entry(
 		__field(void *, caller)
-		__field(const void *, addr)
+		__field(const void __iomem *, addr)
 		__field(unsigned int, offset)
 		__field(u16, data)
 	),
@@ -86,21 +90,24 @@ DECLARE_EVENT_CLASS(musb_regw,
 );
 
 DEFINE_EVENT(musb_regw, musb_readw,
-	TP_PROTO(void *caller, const void *addr, unsigned int offset, u16 data),
+	TP_PROTO(void *caller, const void __iomem *addr,
+		 unsigned int offset, u16 data),
 	TP_ARGS(caller, addr, offset, data)
 );
 
 DEFINE_EVENT(musb_regw, musb_writew,
-	TP_PROTO(void *caller, const void *addr, unsigned int offset, u16 data),
+	TP_PROTO(void *caller, const void __iomem *addr,
+		 unsigned int offset, u16 data),
 	TP_ARGS(caller, addr, offset, data)
 );
 
 DECLARE_EVENT_CLASS(musb_regl,
-	TP_PROTO(void *caller, const void *addr, unsigned int offset, u32 data),
+	TP_PROTO(void *caller, const void __iomem *addr,
+		 unsigned int offset, u32 data),
 	TP_ARGS(caller, addr, offset, data),
 	TP_STRUCT__entry(
 		__field(void *, caller)
-		__field(const void *, addr)
+		__field(const void __iomem *, addr)
 		__field(unsigned int, offset)
 		__field(u32, data)
 	),
@@ -115,12 +122,14 @@ DECLARE_EVENT_CLASS(musb_regl,
 );
 
 DEFINE_EVENT(musb_regl, musb_readl,
-	TP_PROTO(void *caller, const void *addr, unsigned int offset, u32 data),
+	TP_PROTO(void *caller, const void __iomem *addr,
+		 unsigned int offset, u32 data),
 	TP_ARGS(caller, addr, offset, data)
 );
 
 DEFINE_EVENT(musb_regl, musb_writel,
-	TP_PROTO(void *caller, const void *addr, unsigned int offset, u32 data),
+	TP_PROTO(void *caller, const void __iomem *addr,
+		 unsigned int offset, u32 data),
 	TP_ARGS(caller, addr, offset, data)
 );
 
-- 
2.17.1

