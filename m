Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3AB691F9CCD
	for <lists+linux-usb@lfdr.de>; Mon, 15 Jun 2020 18:16:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730855AbgFOQQS (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 15 Jun 2020 12:16:18 -0400
Received: from mx07-00178001.pphosted.com ([62.209.51.94]:1632 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729949AbgFOQQS (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 15 Jun 2020 12:16:18 -0400
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 05FGF0sD011191;
        Mon, 15 Jun 2020 18:15:54 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=Xkqzh+C6FWWTmU37LOuSdIhSb7PIonm3PgO/z5FgNvI=;
 b=dx9RMEyVylmWbL5lXa3SYNQDq5f+d6Y9WE9r8Bt2mowHekYmFYSA8uDz97hu5nEjDJiR
 xNot7L6wZ5Ri7nZHMz+6OhDs+KO4PoVouTv2UizzKPmHjKgLFAKC9JjIfkFadVf7hc3q
 Kve2XkRskN3RCva7qEr7MhVVKpJP3ktxOJCRTTcqJ7WAQsDrJY1ZoZH1XfKb+uVEUD+/
 FMfOwNkwUAoj2R06SqIEU4E7BPCkmW/p/yYOdTDBmmIAX3Sx+7ZNWnTA8QGCLUS1aZBm
 ihdUgylbm28bGNvCrer0rFzpjhAPAoG04XkQJtHYSpKWu3mAW4poQGVToOJMG/FSYMRO jw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 31mmjvthje-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 15 Jun 2020 18:15:54 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 2178C10002A;
        Mon, 15 Jun 2020 18:15:54 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1374B2C5ADA;
        Mon, 15 Jun 2020 18:15:54 +0200 (CEST)
Received: from localhost (10.75.127.46) by SFHDAG3NODE2.st.com (10.75.127.8)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2; Mon, 15 Jun 2020 18:15:53
 +0200
From:   Amelie Delaunay <amelie.delaunay@st.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@st.com>,
        Russell King <linux@armlinux.org.uk>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>
CC:     <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-usb@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        Amelie Delaunay <amelie.delaunay@st.com>,
        Fabrice Gasnier <fabrice.gasnier@st.com>
Subject: [PATCH 6/6] ARM: multi_v7_defconfig: enable STUSB160X Type-C port controller support
Date:   Mon, 15 Jun 2020 18:15:12 +0200
Message-ID: <20200615161512.19150-7-amelie.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200615161512.19150-1-amelie.delaunay@st.com>
References: <20200615161512.19150-1-amelie.delaunay@st.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG7NODE3.st.com (10.75.127.21) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216,18.0.687
 definitions=2020-06-15_06:2020-06-15,2020-06-15 signatures=0
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Enable support for the STMicroelectronics STUSB160X USB Type-C port
controller driver by turning on CONFIG_TYPEC and CONFIG_TYPEC_STUSB160X as
modules.

Signed-off-by: Amelie Delaunay <amelie.delaunay@st.com>
---
 arch/arm/configs/multi_v7_defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index 95543914d3c7..f85ee102c9a3 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -821,6 +821,8 @@ CONFIG_USB_CONFIGFS_F_HID=y
 CONFIG_USB_CONFIGFS_F_UVC=y
 CONFIG_USB_CONFIGFS_F_PRINTER=y
 CONFIG_USB_ETH=m
+CONFIG_TYPEC=m
+CONFIG_TYPEC_STUSB160X=m
 CONFIG_MMC=y
 CONFIG_MMC_BLOCK_MINORS=16
 CONFIG_MMC_ARMMMCI=y
-- 
2.17.1

