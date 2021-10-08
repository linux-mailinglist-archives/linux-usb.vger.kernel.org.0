Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0096C426581
	for <lists+linux-usb@lfdr.de>; Fri,  8 Oct 2021 09:57:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233251AbhJHH7F (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 8 Oct 2021 03:59:05 -0400
Received: from mx07-00178001.pphosted.com ([185.132.182.106]:39694 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229941AbhJHH7D (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 8 Oct 2021 03:59:03 -0400
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1984abmV020364;
        Fri, 8 Oct 2021 09:57:04 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=c6EaOVGfb8Sa8HSlE1ms6Xot8j3nZXJs3bVkNF7A+D8=;
 b=P9RS1+4eRbSDQhkaKAaGifIzcOlHW5vPJLPNx2blBuLiEa+/h+V1Gmi/FKUDt4SoQPtX
 8CnHd6bGEw5qmB0z94ZlGYgAwuzgQvWrCtLf7fRKUgQr5V6eVaObajTknxMoCQ2lYMHB
 e5NWg3zD6Gky/CYLFJTeKfxB1PwwP8/9oNQAWWojcPGfwU4KQGO5k/6ZpMUR/GRwTGe0
 4P7ml7uBNk595PrSMRpIMpQMJnSZHn2YioDT9GkNbErnzS0+cnf4SbU0AAn71G0/VlCV
 8LngPsIlJnrkIbN8TG9er7a1oAyvE0BaWEi9LEFSN4zBfOEV9D0pbjCB+4w56t7gz0q9 rQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 3bjdun9fxj-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 08 Oct 2021 09:57:04 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 6E42B100034;
        Fri,  8 Oct 2021 09:57:04 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 63696218110;
        Fri,  8 Oct 2021 09:57:04 +0200 (CEST)
Received: from localhost (10.75.127.49) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.18; Fri, 8 Oct 2021 09:57:03
 +0200
From:   Fabrice Gasnier <fabrice.gasnier@foss.st.com>
To:     <hminas@synopsys.com>, <gregkh@linuxfoundation.org>
CC:     <linux-usb@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <amelie.delaunay@foss.st.com>, <alexandre.torgue@foss.st.com>,
        <fabrice.gasnier@foss.st.com>
Subject: [PATCH v2 2/2] usb: dwc2: stm32mp15: set otg_rev
Date:   Fri, 8 Oct 2021 09:53:09 +0200
Message-ID: <1633679589-16021-3-git-send-email-fabrice.gasnier@foss.st.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1633679589-16021-1-git-send-email-fabrice.gasnier@foss.st.com>
References: <1633679589-16021-1-git-send-email-fabrice.gasnier@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-10-08_02,2021-10-07_02,2020-04-07_01
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

STM32MP15 complies with the OTG 2.0. Set OTG revision accordingly. It is
useful for the of_usb_update_otg_caps() routine to check and update
otg_rev to the lower value between DT and provided params.

Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
---
Changes in v2:
- set otg_rev in otg_caps structure directly
---
 drivers/usb/dwc2/params.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/dwc2/params.c b/drivers/usb/dwc2/params.c
index 99d3b62..d300ae3 100644
--- a/drivers/usb/dwc2/params.c
+++ b/drivers/usb/dwc2/params.c
@@ -176,6 +176,7 @@ static void dwc2_set_stm32mp15_fsotg_params(struct dwc2_hsotg *hsotg)
 
 	p->otg_caps.hnp_support = false;
 	p->otg_caps.srp_support = false;
+	p->otg_caps.otg_rev = 0x200;
 	p->speed = DWC2_SPEED_PARAM_FULL;
 	p->host_rx_fifo_size = 128;
 	p->host_nperio_tx_fifo_size = 96;
@@ -197,6 +198,7 @@ static void dwc2_set_stm32mp15_hsotg_params(struct dwc2_hsotg *hsotg)
 
 	p->otg_caps.hnp_support = false;
 	p->otg_caps.srp_support = false;
+	p->otg_caps.otg_rev = 0x200;
 	p->activate_stm_id_vb_detection = !device_property_read_bool(hsotg->dev, "usb-role-switch");
 	p->host_rx_fifo_size = 440;
 	p->host_nperio_tx_fifo_size = 256;
-- 
2.7.4

