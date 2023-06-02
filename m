Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C8AEB7200F7
	for <lists+linux-usb@lfdr.de>; Fri,  2 Jun 2023 13:55:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235145AbjFBLz0 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 2 Jun 2023 07:55:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234500AbjFBLzY (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 2 Jun 2023 07:55:24 -0400
Received: from mx0a-0014ca01.pphosted.com (mx0b-0014ca01.pphosted.com [208.86.201.193])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B1E4E64;
        Fri,  2 Jun 2023 04:54:54 -0700 (PDT)
Received: from pps.filterd (m0042333.ppops.net [127.0.0.1])
        by mx0b-0014ca01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3520N3nB010238;
        Fri, 2 Jun 2023 03:27:21 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=proofpoint;
 bh=cN71LnHGETUpI0EfurcvqHV2BPwFtcm67LLiLgHqs5k=;
 b=REsIZFINLKOGdNOudcXzlyZjY3vft2FuYLRkJ5jJGdphuhzfX1hq1qfBszF+qoTiYkma
 xolicvixOTcmfBWD1lidjV2MU8PFZcf3AxpqfW0j9g9fn+UmqgOS6sKZTuAndwQ/FzBL
 kcaqXGAbZWqfQHPB578vOOO3U4iHF2EO11cITGm8fVtbtd/L8QbG41hvAmKV4DwCkD8m
 pFxXcMD3eu4pmVGjj2e45Ypsp9gY/RXNq/O5XeV0XXr9P7Nmq6ynCFfPIDaM9GhE9boP
 BeFXd9KXNbEAnycMlpbwNypJ+gW7yZ3Uf6BrZIND6Rrq+90rCCxUzOLZorYNF0dKiGCW 1w== 
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2177.outbound.protection.outlook.com [104.47.55.177])
        by mx0b-0014ca01.pphosted.com (PPS) with ESMTPS id 3qxx5n3e82-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 02 Jun 2023 03:27:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VKgkdRIgWiu1w5MBoX1Re7tZ8BA/q1mnYQHRLVRY7r/vQrZjWlVzoT1zlMnJVISfJ6WWBUvGqbxhwu++4hJZ5hbyz+xmQzJDRsuodtIr961SvhZ9Yo7uiTif8U43rkzj007u0lWnkp8SGa5f5YWudwrmw1OVb0FHsixTFSdYOwXVaKzOMV5wGRIksFknXJiSraHEOLxF6P9EicTBYtt5W5r/Cj9sGALG66R89X9ItDV2Ry1sadMyQb0eBJdyXg8ERC8nsj+qUpEm3em4FtSHtNAlxRZZPJ58l2sookfghkNZmnFscAwZ7zMiVjabSbjxFZyqw630KQDE/PLPqx2t1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cN71LnHGETUpI0EfurcvqHV2BPwFtcm67LLiLgHqs5k=;
 b=mBjw3hnrN/AWDe2r74KytPNXLfz7GWgZA+ycrH/67AggUo3rkV3LXv1BQcPDBMdRPtDC+wkYcu/ahY2ILNejzIUZrUEEd9JA75Y+ZdK33eWv1T0XWZ3zlU8tYn1lk6VVcubCKRJqEdMPDucTuyWy3IHtLnDsN50rE0NScmAEByz1AiTTQHLFnSDMwTPQvBG6Ev7YAW2vqpF1idXgPMYMSfpSJFmR6f7q9uDqEDxoP7YbWK9e8kJYPMI4NXBedR4RfxNkLdO+Jo7rOBFpoVUch5M5mHvkWqg/3I6vmVhYNHI4YnVOZOxyInpPIZ+xQxlfkvbFPQWfyfvjUmIUxrullw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 158.140.1.148) smtp.rcpttodomain=bootlin.com smtp.mailfrom=cadence.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=cadence.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cN71LnHGETUpI0EfurcvqHV2BPwFtcm67LLiLgHqs5k=;
 b=F37Im2EcxnmPe+4UAa1uLeGQIQlhVLaWr51Lg9bQyIMfFGR1z1p9KkLe7337ATjEkILUyvM1D6vbEKwkQdgZB8So8MbgI72jDpDKlxOPhPblvC43TPJ/HjcQCrKup0fleuOJ7GK/7MEuD76v/3urOn6kzg7OjbS90qWOrmLAzFg=
Received: from MW4PR04CA0347.namprd04.prod.outlook.com (2603:10b6:303:8a::22)
 by PH0PR07MB8591.namprd07.prod.outlook.com (2603:10b6:510:81::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.23; Fri, 2 Jun
 2023 10:27:15 +0000
Received: from MW2NAM12FT112.eop-nam12.prod.protection.outlook.com
 (2603:10b6:303:8a:cafe::a) by MW4PR04CA0347.outlook.office365.com
 (2603:10b6:303:8a::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.24 via Frontend
 Transport; Fri, 2 Jun 2023 10:27:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 158.140.1.148)
 smtp.mailfrom=cadence.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=cadence.com;
Received-SPF: Pass (protection.outlook.com: domain of cadence.com designates
 158.140.1.148 as permitted sender) receiver=protection.outlook.com;
 client-ip=158.140.1.148; helo=sjmaillnx2.cadence.com; pr=C
Received: from sjmaillnx2.cadence.com (158.140.1.148) by
 MW2NAM12FT112.mail.protection.outlook.com (10.13.181.165) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6477.10 via Frontend Transport; Fri, 2 Jun 2023 10:27:15 +0000
Received: from maileu5.global.cadence.com (eudvw-maileu5.cadence.com [10.160.110.202])
        by sjmaillnx2.cadence.com (8.14.4/8.14.4) with ESMTP id 352AR60h007697
        (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 2 Jun 2023 03:27:12 -0700
Received: from maileu5.global.cadence.com (10.160.110.202) by
 maileu5.global.cadence.com (10.160.110.202) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Fri, 2 Jun 2023 12:27:06 +0200
Received: from eu-cn02.cadence.com (10.160.89.185) by
 maileu5.global.cadence.com (10.160.110.202) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24 via Frontend Transport; Fri, 2 Jun 2023 12:27:06 +0200
Received: from eu-cn02.cadence.com (localhost.localdomain [127.0.0.1])
        by eu-cn02.cadence.com (8.14.7/8.14.7) with ESMTP id 352AR6AQ077925;
        Fri, 2 Jun 2023 06:27:06 -0400
Received: (from pawell@localhost)
        by eu-cn02.cadence.com (8.14.7/8.14.7/Submit) id 352AR6sE077924;
        Fri, 2 Jun 2023 06:27:06 -0400
From:   Pawel Laszczak <pawell@cadence.com>
To:     <gregkh@linuxfoundation.org>
CC:     <linux-kernel@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <Daisy.Barrera@siriusxm.com>, <Cliff.Holden@siriusxm.com>,
        <tony@atomide.com>, <jdelvare@suse.de>, <neal_liu@aspeedtech.com>,
        <linus.walleij@linaro.org>, <egtvedt@samfundet.no>,
        <biju.das.jz@bp.renesas.com>, <herve.codina@bootlin.com>,
        Pawel Laszczak <pawell@cadence.com>
Subject: [PATCH v4 3/4] usb: cdns2: Add tracepoints for CDNS2 driver
Date:   Fri, 2 Jun 2023 06:26:43 -0400
Message-ID: <20230602102644.77470-4-pawell@cadence.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20230602102644.77470-1-pawell@cadence.com>
References: <20230602102644.77470-1-pawell@cadence.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CrossPremisesHeadersFilteredBySendConnector: maileu5.global.cadence.com
X-OrganizationHeadersPreserved: maileu5.global.cadence.com
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW2NAM12FT112:EE_|PH0PR07MB8591:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d82657d-efc7-48a5-16cd-08db6353ef47
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lpifht4i6GFECDZOi7PcLRQJi9e2bTSI+FMNVQ1BlQ6OuDDVguQRDolHqcjjAv1p3yIIT0u57SV6VOS6EQ5tvAzIe9dNwns9gyLOG3v7SfRtXHuiGspwPkBI7UP47IyKJPolCr943WLCP3NzEYWrzaljN9bK+YzTirJlgyOMZ9gIBzC/gJ05OATIsSVbqwLhqQ0Oi2lqs1CnZPlV1OfuiWmh6x6TkChykcCqQDOtckcvVl0jjI80G9xsqYsKbxAbbODbwyNTMcYQMQspSye2gXfmLavCeUt7I1Zf6pf2dq5lex3NkdriZ0Bj+ZuDuZa0XklKtG4VHFOry91P/SHhZyFJHZuvC23Majzw5JhFrl7nE8Sg6Pad2HyJaJyfkbtQcxsFik1tfqtAqIlsEfe1hQk2RUe5Dor+ISxWckJQL1il6UY/4v9UQocLa1DxCxW7CdCaKzgmbqxM88Yrw97sX6mjZ8hn/CLN2ENBNknrrDyaLX7X6GEAvEptctZIk/3+CAxWkFqHaUok2betbtaMEaME0Q9RRJdjcdhiG5uWp4C86BldrlR5lNqVFCi+m0Wylwe0LlPp18TDTqo6tMBnB0qsioKAxFfV33MnKZGuzJSZm39iJZjz87Grt1WxdbeEX4+9PX/EwDa7ZMbJzz4Bh5pDRRXLkRu0F9xGOysQSFfvySz7+Bkoi0TPieI3wKI96ZloTX/lKkBaJU7FRavEKF4H50F1B8HwmpJBztQ58W5op0SohksQ1niJMq1c7Nin
X-Forefront-Antispam-Report: CIP:158.140.1.148;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:sjmaillnx2.cadence.com;PTR:unknown.Cadence.COM;CAT:NONE;SFS:(13230028)(4636009)(376002)(136003)(396003)(346002)(39860400002)(36092001)(451199021)(46966006)(40470700004)(36840700001)(70206006)(70586007)(30864003)(7416002)(316002)(4326008)(6916009)(41300700001)(5660300002)(2906002)(8936002)(8676002)(42186006)(54906003)(36860700001)(40460700003)(6666004)(478600001)(7636003)(356005)(40480700001)(107886003)(186003)(36756003)(336012)(83380400001)(426003)(1076003)(26005)(47076005)(82740400003)(82310400005)(2616005)(86362001);DIR:OUT;SFP:1101;
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2023 10:27:15.0281
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d82657d-efc7-48a5-16cd-08db6353ef47
X-MS-Exchange-CrossTenant-Id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=d36035c5-6ce6-4662-a3dc-e762e61ae4c9;Ip=[158.140.1.148];Helo=[sjmaillnx2.cadence.com]
X-MS-Exchange-CrossTenant-AuthSource: MW2NAM12FT112.eop-nam12.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR07MB8591
X-Proofpoint-ORIG-GUID: FjKCuKMnZtiYdBbUmFz9aBii6xP5kv7d
X-Proofpoint-GUID: FjKCuKMnZtiYdBbUmFz9aBii6xP5kv7d
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-02_07,2023-05-31_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_check_notspam policy=outbound_check score=0
 priorityscore=1501 adultscore=0 mlxlogscore=453 impostorscore=0
 bulkscore=0 malwarescore=0 mlxscore=0 phishscore=0 clxscore=1015
 spamscore=0 lowpriorityscore=0 suspectscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2304280000
 definitions=main-2306020079
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Patch adds the series of tracepoints that can be used for
debugging issues detected in driver.

Signed-off-by: Pawel Laszczak <pawell@cadence.com>
---
 drivers/usb/gadget/udc/cdns2/Makefile       |   2 +
 drivers/usb/gadget/udc/cdns2/cdns2-debug.h  | 203 +++++++
 drivers/usb/gadget/udc/cdns2/cdns2-ep0.c    |  26 +-
 drivers/usb/gadget/udc/cdns2/cdns2-gadget.c |  52 +-
 drivers/usb/gadget/udc/cdns2/cdns2-trace.c  |  11 +
 drivers/usb/gadget/udc/cdns2/cdns2-trace.h  | 605 ++++++++++++++++++++
 6 files changed, 896 insertions(+), 3 deletions(-)
 create mode 100644 drivers/usb/gadget/udc/cdns2/cdns2-debug.h
 create mode 100644 drivers/usb/gadget/udc/cdns2/cdns2-trace.c
 create mode 100644 drivers/usb/gadget/udc/cdns2/cdns2-trace.h

diff --git a/drivers/usb/gadget/udc/cdns2/Makefile b/drivers/usb/gadget/udc/cdns2/Makefile
index 7c746e6d53c2..a1ffbbe2e768 100644
--- a/drivers/usb/gadget/udc/cdns2/Makefile
+++ b/drivers/usb/gadget/udc/cdns2/Makefile
@@ -1,5 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 # define_trace.h needs to know how to find our header
+CFLAGS_cdns2-trace.o		:= -I$(src)
 
 obj-$(CONFIG_USB_CDNS2_UDC)		+= cdns2-udc-pci.o
 cdns2-udc-pci-$(CONFIG_USB_CDNS2_UDC)	+= cdns2-pci.o cdns2-gadget.o cdns2-ep0.o
+cdns2-udc-pci-$(CONFIG_TRACING)	+= cdns2-trace.o
diff --git a/drivers/usb/gadget/udc/cdns2/cdns2-debug.h b/drivers/usb/gadget/udc/cdns2/cdns2-debug.h
new file mode 100644
index 000000000000..fd22ae949008
--- /dev/null
+++ b/drivers/usb/gadget/udc/cdns2/cdns2-debug.h
@@ -0,0 +1,203 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Cadence USBHS-DEV Driver.
+ * Debug header file.
+ *
+ * Copyright (C) 2023 Cadence.
+ *
+ * Author: Pawel Laszczak <pawell@cadence.com>
+ */
+
+#ifndef __LINUX_CDNS2_DEBUG
+#define __LINUX_CDNS2_DEBUG
+
+static inline const char *cdns2_decode_usb_irq(char *str, size_t size,
+					       u8 usb_irq, u8 ext_irq)
+{
+	int ret;
+
+	ret = snprintf(str, size, "usbirq: 0x%02x - ", usb_irq);
+
+	if (usb_irq & USBIRQ_SOF)
+		ret += snprintf(str + ret, size - ret, "SOF ");
+	if (usb_irq & USBIRQ_SUTOK)
+		ret += snprintf(str + ret, size - ret, "SUTOK ");
+	if (usb_irq & USBIRQ_SUDAV)
+		ret += snprintf(str + ret, size - ret, "SETUP ");
+	if (usb_irq & USBIRQ_SUSPEND)
+		ret += snprintf(str + ret, size - ret, "Suspend ");
+	if (usb_irq & USBIRQ_URESET)
+		ret += snprintf(str + ret, size - ret, "Reset ");
+	if (usb_irq & USBIRQ_HSPEED)
+		ret += snprintf(str + ret, size - ret, "HS ");
+	if (usb_irq & USBIRQ_LPM)
+		ret += snprintf(str + ret, size - ret, "LPM ");
+
+	ret += snprintf(str + ret, size - ret, ", EXT: 0x%02x - ", ext_irq);
+
+	if (ext_irq & EXTIRQ_WAKEUP)
+		ret += snprintf(str + ret, size - ret, "Wakupe ");
+	if (ext_irq & EXTIRQ_VBUSFAULT_FALL)
+		ret += snprintf(str + ret, size - ret, "VBUS_FALL ");
+	if (ext_irq & EXTIRQ_VBUSFAULT_RISE)
+		ret += snprintf(str + ret, size - ret, "VBUS_RISE ");
+
+	if (ret >= size)
+		pr_info("CDNS2: buffer overflowed.\n");
+
+	return str;
+}
+
+static inline const char *cdns2_decode_dma_irq(char *str, size_t size,
+					       u32 ep_ists, u32 ep_sts,
+					       const char *ep_name)
+{
+	int ret;
+
+	ret = snprintf(str, size, "ISTS: %08x, %s: %08x ",
+		       ep_ists, ep_name, ep_sts);
+
+	if (ep_sts & DMA_EP_STS_IOC)
+		ret += snprintf(str + ret, size - ret, "IOC ");
+	if (ep_sts & DMA_EP_STS_ISP)
+		ret += snprintf(str + ret, size - ret, "ISP ");
+	if (ep_sts & DMA_EP_STS_DESCMIS)
+		ret += snprintf(str + ret, size - ret, "DESCMIS ");
+	if (ep_sts & DMA_EP_STS_TRBERR)
+		ret += snprintf(str + ret, size - ret, "TRBERR ");
+	if (ep_sts & DMA_EP_STS_OUTSMM)
+		ret += snprintf(str + ret, size - ret, "OUTSMM ");
+	if (ep_sts & DMA_EP_STS_ISOERR)
+		ret += snprintf(str + ret, size - ret, "ISOERR ");
+	if (ep_sts & DMA_EP_STS_DBUSY)
+		ret += snprintf(str + ret, size - ret, "DBUSY ");
+	if (DMA_EP_STS_CCS(ep_sts))
+		ret += snprintf(str + ret, size - ret, "CCS ");
+
+	if (ret >= size)
+		pr_info("CDNS2: buffer overflowed.\n");
+
+	return str;
+}
+
+static inline const char *cdns2_decode_epx_irq(char *str, size_t size,
+					       char *ep_name, u32 ep_ists,
+					       u32 ep_sts)
+{
+	return cdns2_decode_dma_irq(str, size, ep_ists, ep_sts, ep_name);
+}
+
+static inline const char *cdns2_decode_ep0_irq(char *str, size_t size,
+					       u32 ep_ists, u32 ep_sts,
+					       int dir)
+{
+	return cdns2_decode_dma_irq(str, size, ep_ists, ep_sts,
+				    dir ? "ep0IN" : "ep0OUT");
+}
+
+static inline const char *cdns2_raw_ring(struct cdns2_endpoint *pep,
+					 struct cdns2_trb *trbs,
+					 char *str, size_t size)
+{
+	struct cdns2_ring *ring = &pep->ring;
+	struct cdns2_trb *trb;
+	dma_addr_t dma;
+	int ret;
+	int i;
+
+	ret = snprintf(str, size, "\n\t\tTR for %s:", pep->name);
+
+	trb = &trbs[ring->dequeue];
+	dma = cdns2_trb_virt_to_dma(pep, trb);
+	ret += snprintf(str + ret, size - ret,
+			"\n\t\tRing deq index: %d, trb: V=%p, P=0x%pad\n",
+			ring->dequeue, trb, &dma);
+
+	trb = &trbs[ring->enqueue];
+	dma = cdns2_trb_virt_to_dma(pep, trb);
+	ret += snprintf(str + ret, size - ret,
+			"\t\tRing enq index: %d, trb: V=%p, P=0x%pad\n",
+			ring->enqueue, trb, &dma);
+
+	ret += snprintf(str + ret, size - ret,
+			"\t\tfree trbs: %d, CCS=%d, PCS=%d\n",
+			ring->free_trbs, ring->ccs, ring->pcs);
+
+	if (TRBS_PER_SEGMENT > 40) {
+		ret += snprintf(str + ret, size - ret,
+				"\t\tTransfer ring %d too big\n", TRBS_PER_SEGMENT);
+		return str;
+	}
+
+	dma = ring->dma;
+	for (i = 0; i < TRBS_PER_SEGMENT; ++i) {
+		trb = &trbs[i];
+		ret += snprintf(str + ret, size - ret,
+				"\t\t@%pad %08x %08x %08x\n", &dma,
+				le32_to_cpu(trb->buffer),
+				le32_to_cpu(trb->length),
+				le32_to_cpu(trb->control));
+		dma += sizeof(*trb);
+	}
+
+	if (ret >= size)
+		pr_info("CDNS2: buffer overflowed.\n");
+
+	return str;
+}
+
+static inline const char *cdns2_trb_type_string(u8 type)
+{
+	switch (type) {
+	case TRB_NORMAL:
+		return "Normal";
+	case TRB_LINK:
+		return "Link";
+	default:
+		return "UNKNOWN";
+	}
+}
+
+static inline const char *cdns2_decode_trb(char *str, size_t size, u32 flags,
+					   u32 length, u32 buffer)
+{
+	int type = TRB_FIELD_TO_TYPE(flags);
+	int ret;
+
+	switch (type) {
+	case TRB_LINK:
+		ret = snprintf(str, size,
+			       "LINK %08x type '%s' flags %c:%c:%c%c:%c",
+			       buffer, cdns2_trb_type_string(type),
+			       flags & TRB_CYCLE ? 'C' : 'c',
+			       flags & TRB_TOGGLE ? 'T' : 't',
+			       flags & TRB_CHAIN ? 'C' : 'c',
+			       flags & TRB_CHAIN ? 'H' : 'h',
+			       flags & TRB_IOC ? 'I' : 'i');
+		break;
+	case TRB_NORMAL:
+		ret = snprintf(str, size,
+			       "type: '%s', Buffer: %08x, length: %ld, burst len: %ld, "
+			       "flags %c:%c:%c%c:%c",
+			       cdns2_trb_type_string(type),
+			       buffer, TRB_LEN(length),
+			       TRB_FIELD_TO_BURST(length),
+			       flags & TRB_CYCLE ? 'C' : 'c',
+			       flags & TRB_ISP ? 'I' : 'i',
+			       flags & TRB_CHAIN ? 'C' : 'c',
+			       flags & TRB_CHAIN ? 'H' : 'h',
+			       flags & TRB_IOC ? 'I' : 'i');
+		break;
+	default:
+		ret = snprintf(str, size, "type '%s' -> raw %08x %08x %08x",
+			       cdns2_trb_type_string(type),
+			       buffer, length, flags);
+	}
+
+	if (ret >= size)
+		pr_info("CDNS2: buffer overflowed.\n");
+
+	return str;
+}
+
+#endif /*__LINUX_CDNS2_DEBUG*/
diff --git a/drivers/usb/gadget/udc/cdns2/cdns2-ep0.c b/drivers/usb/gadget/udc/cdns2/cdns2-ep0.c
index 133d5acaf502..fa12a5d46f2e 100644
--- a/drivers/usb/gadget/udc/cdns2/cdns2-ep0.c
+++ b/drivers/usb/gadget/udc/cdns2/cdns2-ep0.c
@@ -11,6 +11,7 @@
 #include <asm/unaligned.h>
 
 #include "cdns2-gadget.h"
+#include "cdns2-trace.h"
 
 static struct usb_endpoint_descriptor cdns2_gadget_ep0_desc = {
 	.bLength = USB_DT_ENDPOINT_SIZE,
@@ -60,6 +61,8 @@ static void cdns2_ep0_enqueue(struct cdns2_device *pdev, dma_addr_t dma_addr,
 		ring->trbs[1].control = 0;
 	}
 
+	trace_cdns2_queue_trb(pep, ring->trbs);
+
 	if (!pep->dir)
 		writel(0, &pdev->ep0_regs->rxbc);
 
@@ -68,6 +71,8 @@ static void cdns2_ep0_enqueue(struct cdns2_device *pdev, dma_addr_t dma_addr,
 	writel(DMA_EP_STS_TRBERR, &regs->ep_sts);
 	writel(pep->ring.dma, &regs->ep_traddr);
 
+	trace_cdns2_doorbell_ep0(pep, readl(&regs->ep_traddr));
+
 	writel(DMA_EP_CMD_DRDY, &regs->ep_cmd);
 }
 
@@ -128,6 +133,8 @@ static int cdns2_req_ep0_set_configuration(struct cdns2_device *pdev,
 	if (ret)
 		return ret;
 
+	trace_cdns2_device_state(config ? "configured" : "addressed");
+
 	if (!config)
 		usb_gadget_set_state(&pdev->gadget, USB_STATE_ADDRESS);
 
@@ -158,6 +165,8 @@ static int cdns2_req_ep0_set_address(struct cdns2_device *pdev, u32 addr)
 	usb_gadget_set_state(&pdev->gadget,
 			     (addr ? USB_STATE_ADDRESS : USB_STATE_DEFAULT));
 
+	trace_cdns2_device_state(addr ? "addressed" : "default");
+
 	return 0;
 }
 
@@ -385,8 +394,12 @@ void cdns2_handle_setup_packet(struct cdns2_device *pdev)
 	 * If SETUP packet was modified while reading just simple ignore it.
 	 * The new one will be handled latter.
 	 */
-	if (cdns2_check_new_setup(pdev))
+	if (cdns2_check_new_setup(pdev)) {
+		trace_cdns2_ep0_setup("overridden");
 		return;
+	}
+
+	trace_cdns2_ctrl_req(ctrl);
 
 	if (!pdev->gadget_driver)
 		goto out;
@@ -431,8 +444,10 @@ void cdns2_handle_setup_packet(struct cdns2_device *pdev)
 	else
 		ret = cdns2_ep0_delegate_req(pdev);
 
-	if (ret == USB_GADGET_DELAYED_STATUS)
+	if (ret == USB_GADGET_DELAYED_STATUS) {
+		trace_cdns2_ep0_status_stage("delayed");
 		return;
+	}
 
 out:
 	if (ret < 0)
@@ -448,6 +463,7 @@ static void cdns2_transfer_completed(struct cdns2_device *pdev)
 	if (!list_empty(&pep->pending_list)) {
 		struct cdns2_request *preq;
 
+		trace_cdns2_complete_trb(pep, pep->ring.trbs);
 		preq = cdns2_next_preq(&pep->pending_list);
 
 		preq->request.actual =
@@ -464,6 +480,8 @@ void cdns2_handle_ep0_interrupt(struct cdns2_device *pdev, int dir)
 
 	cdns2_select_ep(pdev, dir);
 
+	trace_cdns2_ep0_irq(pdev);
+
 	ep_sts_reg = readl(&pdev->adma_regs->ep_sts);
 	writel(ep_sts_reg, &pdev->adma_regs->ep_sts);
 
@@ -530,8 +548,11 @@ static int cdns2_gadget_ep0_queue(struct usb_ep *ep,
 
 	preq = to_cdns2_request(request);
 
+	trace_cdns2_request_enqueue(preq);
+
 	/* Cancel the request if controller receive new SETUP packet. */
 	if (cdns2_check_new_setup(pdev)) {
+		trace_cdns2_ep0_setup("overridden");
 		spin_unlock_irqrestore(&pdev->lock, flags);
 		return -ECONNRESET;
 	}
@@ -556,6 +577,7 @@ static int cdns2_gadget_ep0_queue(struct usb_ep *ep,
 	}
 
 	if (!list_empty(&pep->pending_list)) {
+		trace_cdns2_ep0_setup("pending");
 		dev_err(pdev->dev,
 			"can't handle multiple requests for ep0\n");
 		spin_unlock_irqrestore(&pdev->lock, flags);
diff --git a/drivers/usb/gadget/udc/cdns2/cdns2-gadget.c b/drivers/usb/gadget/udc/cdns2/cdns2-gadget.c
index 66680e189d97..0eed0e03842c 100644
--- a/drivers/usb/gadget/udc/cdns2/cdns2-gadget.c
+++ b/drivers/usb/gadget/udc/cdns2/cdns2-gadget.c
@@ -33,6 +33,7 @@
 #include <linux/iopoll.h>
 
 #include "cdns2-gadget.h"
+#include "cdns2-trace.h"
 
 /**
  * set_reg_bit_32 - set bit in given 32 bits register.
@@ -154,6 +155,8 @@ static void cdns2_ep_stall_flush(struct cdns2_endpoint *pep)
 	struct cdns2_device *pdev = pep->pdev;
 	int val;
 
+	trace_cdns2_ep_halt(pep, 1, 1);
+
 	writel(DMA_EP_CMD_DFLUSH, &pdev->adma_regs->ep_cmd);
 
 	/* Wait for DFLUSH cleared. */
@@ -247,6 +250,8 @@ void cdns2_gadget_giveback(struct cdns2_endpoint *pep,
 	/* All TRBs have finished, clear the counter. */
 	preq->finished_trb = 0;
 
+	trace_cdns2_request_giveback(preq);
+
 	if (request->complete) {
 		spin_unlock(&pdev->lock);
 		usb_gadget_giveback_request(&pep->endpoint, request);
@@ -261,6 +266,8 @@ static void cdns2_wa1_restore_cycle_bit(struct cdns2_endpoint *pep)
 {
 	/* Work around for stale data address in TRB. */
 	if (pep->wa1_set) {
+		trace_cdns2_wa1(pep, "restore cycle bit");
+
 		pep->wa1_set = 0;
 		pep->wa1_trb_index = 0xFFFF;
 		if (pep->wa1_cycle_bit)
@@ -285,6 +292,7 @@ static int cdns2_wa1_update_guard(struct cdns2_endpoint *pep,
 			pep->wa1_set = 1;
 			pep->wa1_trb = trb;
 			pep->wa1_trb_index = pep->ring.enqueue;
+			trace_cdns2_wa1(pep, "set guard");
 			return 0;
 		}
 	}
@@ -317,6 +325,7 @@ static int cdns2_prepare_ring(struct cdns2_device *pdev,
 
 	if (num_trbs > ring->free_trbs) {
 		pep->ep_state |= EP_RING_FULL;
+		trace_cdns2_no_room_on_ring("Ring full\n");
 		return -ENOBUFS;
 	}
 
@@ -360,6 +369,7 @@ static void cdns2_dbg_request_trbs(struct cdns2_endpoint *pep,
 	int i = 0;
 
 	while (i < num_trbs) {
+		trace_cdns2_queue_trb(pep, trb + i);
 		if (trb + i == link_trb) {
 			trb = pep->ring.trbs;
 			num_trbs = num_trbs - i;
@@ -678,6 +688,8 @@ static void cdns2_ep_tx_bulk(struct cdns2_endpoint *pep,
 static void cdns2_set_drdy(struct cdns2_device *pdev,
 			   struct cdns2_endpoint *pep)
 {
+	trace_cdns2_ring(pep);
+
 	/*
 	 * Memory barrier - Cycle Bit must be set before doorbell.
 	 */
@@ -692,6 +704,8 @@ static void cdns2_set_drdy(struct cdns2_device *pdev,
 		writel(DMA_EP_STS_TRBERR, &pdev->adma_regs->ep_sts);
 		writel(DMA_EP_CMD_DRDY, &pdev->adma_regs->ep_cmd);
 	}
+
+	trace_cdns2_doorbell_epx(pep, readl(&pdev->adma_regs->ep_traddr));
 }
 
 static int cdns2_prepare_first_isoc_transfer(struct cdns2_device *pdev,
@@ -927,6 +941,7 @@ static bool cdns2_trb_handled(struct cdns2_endpoint *pep,
 	}
 
 finish:
+	trace_cdns2_request_handled(preq, current_index, handled);
 
 	return handled;
 }
@@ -942,6 +957,7 @@ static void cdns2_skip_isoc_td(struct cdns2_device *pdev,
 
 	for (i = preq->finished_trb ; i < preq->num_of_trb; i++) {
 		preq->finished_trb++;
+		trace_cdns2_complete_trb(pep, trb);
 		cdns2_ep_inc_deq(&pep->ring);
 		trb = cdns2_next_trb(pep, trb);
 	}
@@ -969,6 +985,7 @@ static void cdns2_transfer_completed(struct cdns2_device *pdev,
 		 */
 		while (TRB_FIELD_TO_TYPE(le32_to_cpu(trb->control)) == TRB_LINK &&
 		       le32_to_cpu(trb->length)) {
+			trace_cdns2_complete_trb(pep, trb);
 			cdns2_ep_inc_deq(&pep->ring);
 			trb = pep->ring.trbs + pep->ring.dequeue;
 		}
@@ -986,6 +1003,7 @@ static void cdns2_transfer_completed(struct cdns2_device *pdev,
 				request_handled = true;
 
 			trb = pep->ring.trbs + pep->ring.dequeue;
+			trace_cdns2_complete_trb(pep, trb);
 
 			if (pep->dir && pep->type == USB_ENDPOINT_XFER_ISOC)
 				/*
@@ -1037,12 +1055,17 @@ static void cdns2_rearm_transfer(struct cdns2_endpoint *pep, u8 rearm)
 	cdns2_wa1_restore_cycle_bit(pep);
 
 	if (rearm) {
+		trace_cdns2_ring(pep);
+
 		/* Cycle Bit must be updated before arming DMA. */
 		dma_wmb();
 
 		writel(DMA_EP_CMD_DRDY, &pdev->adma_regs->ep_cmd);
 
 		cdns2_wakeup(pdev);
+
+		trace_cdns2_doorbell_epx(pep,
+					 readl(&pdev->adma_regs->ep_traddr));
 	}
 }
 
@@ -1055,6 +1078,8 @@ static void cdns2_handle_epx_interrupt(struct cdns2_endpoint *pep)
 
 	cdns2_select_ep(pdev, pep->endpoint.address);
 
+	trace_cdns2_epx_irq(pdev, pep);
+
 	ep_sts_reg = readl(&pdev->adma_regs->ep_sts);
 	writel(ep_sts_reg, &pdev->adma_regs->ep_sts);
 
@@ -1196,6 +1221,8 @@ static irqreturn_t cdns2_thread_usb_irq_handler(struct cdns2_device *pdev)
 	if (!ext_irq && !usb_irq)
 		return IRQ_NONE;
 
+	trace_cdns2_usb_irq(usb_irq, ext_irq);
+
 	if (ext_irq & EXTIRQ_WAKEUP) {
 		if (pdev->gadget_driver && pdev->gadget_driver->resume) {
 			spin_unlock(&pdev->lock);
@@ -1274,6 +1301,8 @@ static irqreturn_t cdns2_thread_irq_handler(int irq, void *data)
 	if (!dma_ep_ists)
 		goto unlock;
 
+	trace_cdns2_dma_ep_ists(dma_ep_ists);
+
 	/* Handle default endpoint OUT. */
 	if (dma_ep_ists & DMA_EP_ISTS_EP_OUT0)
 		cdns2_handle_ep0_interrupt(pdev, USB_DIR_OUT);
@@ -1461,6 +1490,8 @@ static int cdns2_ep_config(struct cdns2_endpoint *pep, bool enable)
 	if (enable)
 		writel(DMA_EP_CFG_ENABLE, &pdev->adma_regs->ep_cfg);
 
+	trace_cdns2_epx_hw_cfg(pdev, pep);
+
 	dev_dbg(pdev->dev, "Configure %s: with MPS: %08x, ep con: %02x\n",
 		pep->name, max_packet_size, ep_cfg);
 
@@ -1479,6 +1510,8 @@ struct usb_request *cdns2_gadget_ep_alloc_request(struct usb_ep *ep,
 
 	preq->pep = pep;
 
+	trace_cdns2_alloc_request(preq);
+
 	return &preq->request;
 }
 
@@ -1487,6 +1520,7 @@ void cdns2_gadget_ep_free_request(struct usb_ep *ep,
 {
 	struct cdns2_request *preq = to_cdns2_request(request);
 
+	trace_cdns2_free_request(preq);
 	kfree(preq);
 }
 
@@ -1552,6 +1586,8 @@ static int cdns2_gadget_ep_enable(struct usb_ep *ep,
 		goto exit;
 	}
 
+	trace_cdns2_gadget_ep_enable(pep);
+
 	pep->ep_state &= ~(EP_STALLED | EP_STALL_PENDING);
 	pep->ep_state |= EP_ENABLED;
 	pep->wa1_set = 0;
@@ -1592,6 +1628,8 @@ static int cdns2_gadget_ep_disable(struct usb_ep *ep)
 
 	spin_lock_irqsave(&pdev->lock, flags);
 
+	trace_cdns2_gadget_ep_disable(pep);
+
 	cdns2_select_ep(pdev, ep->desc->bEndpointAddress);
 
 	clear_reg_bit_32(&pdev->adma_regs->ep_cfg, DMA_EP_CFG_ENABLE);
@@ -1640,10 +1678,13 @@ static int cdns2_ep_enqueue(struct cdns2_endpoint *pep,
 	request->status = -EINPROGRESS;
 
 	ret = usb_gadget_map_request_by_dev(pdev->dev, request, pep->dir);
-	if (ret)
+	if (ret) {
+		trace_cdns2_request_enqueue_error(preq);
 		return ret;
+	}
 
 	list_add_tail(&preq->list, &pep->deferred_list);
+	trace_cdns2_request_enqueue(preq);
 
 	if (!(pep->ep_state & EP_STALLED) && !(pep->ep_state & EP_STALL_PENDING))
 		cdns2_start_all_request(pdev, pep);
@@ -1722,6 +1763,7 @@ int cdns2_gadget_ep_dequeue(struct usb_ep *ep,
 	spin_lock_irqsave(&pep->pdev->lock, flags);
 
 	cur_preq = to_cdns2_request(request);
+	trace_cdns2_request_dequeue(cur_preq);
 
 	list_for_each_entry_safe(preq, preq_temp, &pep->pending_list, list) {
 		if (cur_preq == preq) {
@@ -1758,6 +1800,7 @@ int cdns2_gadget_ep_dequeue(struct usb_ep *ep,
 					    & TRB_CYCLE) | TRB_CHAIN |
 					    TRB_TYPE(TRB_LINK));
 
+			trace_cdns2_queue_trb(pep, link_trb);
 			link_trb = cdns2_next_trb(pep, link_trb);
 		}
 
@@ -1807,6 +1850,8 @@ int cdns2_halt_endpoint(struct cdns2_device *pdev,
 			}
 		}
 
+		trace_cdns2_ep_halt(pep, 0, 0);
+
 		/* Resets Sequence Number */
 		writeb(dir | pep->num, &pdev->epx_regs->endprst);
 		writeb(dir | ENDPRST_TOGRST | pep->num,
@@ -1825,6 +1870,7 @@ int cdns2_halt_endpoint(struct cdns2_device *pdev,
 
 		cdns2_start_all_request(pdev, pep);
 	} else {
+		trace_cdns2_ep_halt(pep, 1, 0);
 		set_reg_bit_8(conf, EPX_CON_STALL);
 		writeb(dir | pep->num, &pdev->epx_regs->endprst);
 		writeb(dir | ENDPRST_FIFORST | pep->num,
@@ -1848,6 +1894,7 @@ static int cdns2_gadget_ep_set_halt(struct usb_ep *ep, int value)
 
 	preq = cdns2_next_preq(&pep->pending_list);
 	if (value && preq) {
+		trace_cdns2_ep_busy_try_halt_again(pep);
 		ret = -EAGAIN;
 		goto done;
 	}
@@ -2011,6 +2058,8 @@ static int cdns2_gadget_pullup(struct usb_gadget *gadget, int is_on)
 	struct cdns2_device *pdev = gadget_to_cdns2_device(gadget);
 	unsigned long flags;
 
+	trace_cdns2_pullup(is_on);
+
 	/*
 	 * Disable events handling while controller is being
 	 * enabled/disabled.
@@ -2336,6 +2385,7 @@ int cdns2_gadget_suspend(struct cdns2_device *pdev)
 	spin_lock_irqsave(&pdev->lock, flags);
 	pdev->gadget.speed = USB_SPEED_UNKNOWN;
 
+	trace_cdns2_device_state("notattached");
 	usb_gadget_set_state(&pdev->gadget, USB_STATE_NOTATTACHED);
 	cdns2_enable_l1(pdev, 0);
 
diff --git a/drivers/usb/gadget/udc/cdns2/cdns2-trace.c b/drivers/usb/gadget/udc/cdns2/cdns2-trace.c
new file mode 100644
index 000000000000..de6b8cc3d071
--- /dev/null
+++ b/drivers/usb/gadget/udc/cdns2/cdns2-trace.c
@@ -0,0 +1,11 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * USBHS device controller driver Trace Support
+ *
+ * Copyright (C) 2023 Cadence.
+ *
+ * Author: Pawel Laszczak <pawell@cadence.com>
+ */
+
+#define CREATE_TRACE_POINTS
+#include "cdns2-trace.h"
diff --git a/drivers/usb/gadget/udc/cdns2/cdns2-trace.h b/drivers/usb/gadget/udc/cdns2/cdns2-trace.h
new file mode 100644
index 000000000000..61f241634ea5
--- /dev/null
+++ b/drivers/usb/gadget/udc/cdns2/cdns2-trace.h
@@ -0,0 +1,605 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * USBHS-DEV device controller driver.
+ * Trace support header file.
+ *
+ * Copyright (C) 2023 Cadence.
+ *
+ * Author: Pawel Laszczak <pawell@cadence.com>
+ */
+
+#undef TRACE_SYSTEM
+#define TRACE_SYSTEM cdns2-dev
+
+/*
+ * The TRACE_SYSTEM_VAR defaults to TRACE_SYSTEM, but must be a
+ * legitimate C variable. It is not exported to user space.
+ */
+#undef TRACE_SYSTEM_VAR
+#define TRACE_SYSTEM_VAR cdns2_dev
+
+#if !defined(__LINUX_CDNS2_TRACE) || defined(TRACE_HEADER_MULTI_READ)
+#define __LINUX_CDNS2_TRACE
+
+#include <linux/types.h>
+#include <linux/tracepoint.h>
+#include <asm/byteorder.h>
+#include <linux/usb/ch9.h>
+#include "cdns2-gadget.h"
+#include "cdns2-debug.h"
+
+#define CDNS2_MSG_MAX	500
+
+DECLARE_EVENT_CLASS(cdns2_log_enable_disable,
+	TP_PROTO(int set),
+	TP_ARGS(set),
+	TP_STRUCT__entry(
+		__field(int, set)
+	),
+	TP_fast_assign(
+		__entry->set = set;
+	),
+	TP_printk("%s", __entry->set ? "enabled" : "disabled")
+);
+
+DEFINE_EVENT(cdns2_log_enable_disable, cdns2_pullup,
+	TP_PROTO(int set),
+	TP_ARGS(set)
+);
+
+DEFINE_EVENT(cdns2_log_enable_disable, cdns2_lpm,
+	TP_PROTO(int set),
+	TP_ARGS(set)
+);
+
+DEFINE_EVENT(cdns2_log_enable_disable, cdns2_may_wakeup,
+	TP_PROTO(int set),
+	TP_ARGS(set)
+);
+
+DECLARE_EVENT_CLASS(cdns2_log_simple,
+	TP_PROTO(char *msg),
+	TP_ARGS(msg),
+	TP_STRUCT__entry(
+		__string(text, msg)
+	),
+	TP_fast_assign(
+		__assign_str(text, msg);
+	),
+	TP_printk("%s", __get_str(text))
+);
+
+DEFINE_EVENT(cdns2_log_simple, cdns2_no_room_on_ring,
+	TP_PROTO(char *msg),
+	TP_ARGS(msg)
+);
+
+DEFINE_EVENT(cdns2_log_simple, cdns2_ep0_status_stage,
+	TP_PROTO(char *msg),
+	TP_ARGS(msg)
+);
+
+DEFINE_EVENT(cdns2_log_simple, cdns2_ep0_set_config,
+	TP_PROTO(char *msg),
+	TP_ARGS(msg)
+);
+
+DEFINE_EVENT(cdns2_log_simple, cdns2_ep0_setup,
+	TP_PROTO(char *msg),
+	TP_ARGS(msg)
+);
+
+DEFINE_EVENT(cdns2_log_simple, cdns2_device_state,
+	TP_PROTO(char *msg),
+	TP_ARGS(msg)
+);
+
+TRACE_EVENT(cdns2_ep_halt,
+	TP_PROTO(struct cdns2_endpoint *ep_priv, u8 halt, u8 flush),
+	TP_ARGS(ep_priv, halt, flush),
+	TP_STRUCT__entry(
+		__string(name, ep_priv->name)
+		__field(u8, halt)
+		__field(u8, flush)
+	),
+	TP_fast_assign(
+		__assign_str(name, ep_priv->name);
+		__entry->halt = halt;
+		__entry->flush = flush;
+	),
+	TP_printk("Halt %s for %s: %s", __entry->flush ? " and flush" : "",
+		  __get_str(name), __entry->halt ? "set" : "cleared")
+);
+
+TRACE_EVENT(cdns2_wa1,
+	TP_PROTO(struct cdns2_endpoint *ep_priv, char *msg),
+	TP_ARGS(ep_priv, msg),
+	TP_STRUCT__entry(
+		__string(ep_name, ep_priv->name)
+		__string(msg, msg)
+	),
+	TP_fast_assign(
+		__assign_str(ep_name, ep_priv->name);
+		__assign_str(msg, msg);
+	),
+	TP_printk("WA1: %s %s", __get_str(ep_name), __get_str(msg))
+);
+
+DECLARE_EVENT_CLASS(cdns2_log_doorbell,
+	TP_PROTO(struct cdns2_endpoint *pep, u32 ep_trbaddr),
+	TP_ARGS(pep, ep_trbaddr),
+	TP_STRUCT__entry(
+		__string(name, pep->num ? pep->name :
+				(pep->dir ? "ep0in" : "ep0out"))
+		__field(u32, ep_trbaddr)
+	),
+	TP_fast_assign(
+		__assign_str(name, pep->name);
+		__entry->ep_trbaddr = ep_trbaddr;
+	),
+	TP_printk("%s, ep_trbaddr %08x", __get_str(name),
+		  __entry->ep_trbaddr)
+);
+
+DEFINE_EVENT(cdns2_log_doorbell, cdns2_doorbell_ep0,
+	TP_PROTO(struct cdns2_endpoint *pep, u32 ep_trbaddr),
+	TP_ARGS(pep, ep_trbaddr)
+);
+
+DEFINE_EVENT(cdns2_log_doorbell, cdns2_doorbell_epx,
+	TP_PROTO(struct cdns2_endpoint *pep, u32 ep_trbaddr),
+	TP_ARGS(pep, ep_trbaddr)
+);
+
+DECLARE_EVENT_CLASS(cdns2_log_usb_irq,
+	TP_PROTO(u32 usb_irq, u32 ext_irq),
+	TP_ARGS(usb_irq, ext_irq),
+	TP_STRUCT__entry(
+		__field(u32, usb_irq)
+		__field(u32, ext_irq)
+	),
+	TP_fast_assign(
+		__entry->usb_irq = usb_irq;
+		__entry->ext_irq = ext_irq;
+	),
+	TP_printk("%s", cdns2_decode_usb_irq(__get_buf(CDNS2_MSG_MAX),
+					     CDNS2_MSG_MAX,
+					     __entry->usb_irq,
+					     __entry->ext_irq))
+);
+
+DEFINE_EVENT(cdns2_log_usb_irq, cdns2_usb_irq,
+	TP_PROTO(u32 usb_irq, u32 ext_irq),
+	TP_ARGS(usb_irq, ext_irq)
+);
+
+TRACE_EVENT(cdns2_dma_ep_ists,
+	TP_PROTO(u32 dma_ep_ists),
+	TP_ARGS(dma_ep_ists),
+	TP_STRUCT__entry(
+		__field(u32, dma_ep_ists)
+	),
+	TP_fast_assign(
+		__entry->dma_ep_ists = dma_ep_ists;
+	),
+	TP_printk("OUT: 0x%04x, IN: 0x%04x", (u16)__entry->dma_ep_ists,
+		  __entry->dma_ep_ists >> 16)
+);
+
+DECLARE_EVENT_CLASS(cdns2_log_epx_irq,
+	TP_PROTO(struct cdns2_device *pdev, struct cdns2_endpoint *pep),
+	TP_ARGS(pdev, pep),
+	TP_STRUCT__entry(
+		__string(ep_name, pep->name)
+		__field(u32, ep_sts)
+		__field(u32, ep_ists)
+		__field(u32, ep_traddr)
+	),
+	TP_fast_assign(
+		__assign_str(ep_name, pep->name);
+		__entry->ep_sts = readl(&pdev->adma_regs->ep_sts);
+		__entry->ep_ists = readl(&pdev->adma_regs->ep_ists);
+		__entry->ep_traddr = readl(&pdev->adma_regs->ep_traddr);
+	),
+	TP_printk("%s, ep_traddr: %08x",
+		  cdns2_decode_epx_irq(__get_buf(CDNS2_MSG_MAX), CDNS2_MSG_MAX,
+				       __get_str(ep_name),
+				       __entry->ep_ists, __entry->ep_sts),
+		  __entry->ep_traddr)
+);
+
+DEFINE_EVENT(cdns2_log_epx_irq, cdns2_epx_irq,
+	TP_PROTO(struct cdns2_device *pdev, struct cdns2_endpoint *pep),
+	TP_ARGS(pdev, pep)
+);
+
+DECLARE_EVENT_CLASS(cdns2_log_ep0_irq,
+	TP_PROTO(struct cdns2_device *pdev),
+	TP_ARGS(pdev),
+	TP_STRUCT__entry(
+		__field(int, ep_dir)
+		__field(u32, ep_ists)
+		__field(u32, ep_sts)
+	),
+	TP_fast_assign(
+		__entry->ep_dir = pdev->selected_ep;
+		__entry->ep_ists = readl(&pdev->adma_regs->ep_ists);
+		__entry->ep_sts = readl(&pdev->adma_regs->ep_sts);
+	),
+	TP_printk("%s", cdns2_decode_ep0_irq(__get_buf(CDNS2_MSG_MAX),
+					     CDNS2_MSG_MAX,
+					     __entry->ep_ists, __entry->ep_sts,
+					     __entry->ep_dir))
+);
+
+DEFINE_EVENT(cdns2_log_ep0_irq, cdns2_ep0_irq,
+	TP_PROTO(struct cdns2_device *pdev),
+	TP_ARGS(pdev)
+);
+
+DECLARE_EVENT_CLASS(cdns2_log_ctrl,
+	TP_PROTO(struct usb_ctrlrequest *ctrl),
+	TP_ARGS(ctrl),
+	TP_STRUCT__entry(
+		__field(u8, bRequestType)
+		__field(u8, bRequest)
+		__field(u16, wValue)
+		__field(u16, wIndex)
+		__field(u16, wLength)
+	),
+	TP_fast_assign(
+		__entry->bRequestType = ctrl->bRequestType;
+		__entry->bRequest = ctrl->bRequest;
+		__entry->wValue = le16_to_cpu(ctrl->wValue);
+		__entry->wIndex = le16_to_cpu(ctrl->wIndex);
+		__entry->wLength = le16_to_cpu(ctrl->wLength);
+	),
+	TP_printk("%s", usb_decode_ctrl(__get_buf(CDNS2_MSG_MAX), CDNS2_MSG_MAX,
+					__entry->bRequestType,
+					__entry->bRequest, __entry->wValue,
+					__entry->wIndex, __entry->wLength)
+	)
+);
+
+DEFINE_EVENT(cdns2_log_ctrl, cdns2_ctrl_req,
+	TP_PROTO(struct usb_ctrlrequest *ctrl),
+	TP_ARGS(ctrl)
+);
+
+DECLARE_EVENT_CLASS(cdns2_log_request,
+	TP_PROTO(struct cdns2_request *preq),
+	TP_ARGS(preq),
+	TP_STRUCT__entry(
+		__string(name, preq->pep->name)
+		__field(struct usb_request *, request)
+		__field(struct cdns2_request *, preq)
+		__field(void *, buf)
+		__field(unsigned int, actual)
+		__field(unsigned int, length)
+		__field(int, status)
+		__field(dma_addr_t, dma)
+		__field(int, zero)
+		__field(int, short_not_ok)
+		__field(int, no_interrupt)
+		__field(struct scatterlist*, sg)
+		__field(unsigned int, num_sgs)
+		__field(unsigned int, num_mapped_sgs)
+		__field(int, start_trb)
+		__field(int, end_trb)
+	),
+	TP_fast_assign(
+		__assign_str(name, preq->pep->name);
+		__entry->request = &preq->request;
+		__entry->preq = preq;
+		__entry->buf = preq->request.buf;
+		__entry->actual = preq->request.actual;
+		__entry->length = preq->request.length;
+		__entry->status = preq->request.status;
+		__entry->dma = preq->request.dma;
+		__entry->zero = preq->request.zero;
+		__entry->short_not_ok = preq->request.short_not_ok;
+		__entry->no_interrupt = preq->request.no_interrupt;
+		__entry->sg = preq->request.sg;
+		__entry->num_sgs = preq->request.num_sgs;
+		__entry->num_mapped_sgs = preq->request.num_mapped_sgs;
+		__entry->start_trb = preq->start_trb;
+		__entry->end_trb = preq->end_trb;
+	),
+	TP_printk("%s: req: %p, preq: %p, req buf: %p, length: %u/%u, status: %d,"
+		  "buf dma: (%pad), %s%s%s, sg: %p, num_sgs: %d, num_m_sgs: %d,"
+		  "trb: [start: %d, end: %d]",
+		  __get_str(name), __entry->request, __entry->preq,
+		  __entry->buf, __entry->actual, __entry->length,
+		  __entry->status, &__entry->dma,
+		  __entry->zero ? "Z" : "z",
+		  __entry->short_not_ok ? "S" : "s",
+		  __entry->no_interrupt ? "I" : "i",
+		  __entry->sg, __entry->num_sgs, __entry->num_mapped_sgs,
+		  __entry->start_trb,
+		  __entry->end_trb
+	)
+);
+
+DEFINE_EVENT(cdns2_log_request, cdns2_request_enqueue,
+	TP_PROTO(struct cdns2_request *preq),
+	TP_ARGS(preq)
+);
+
+DEFINE_EVENT(cdns2_log_request, cdns2_request_enqueue_error,
+	TP_PROTO(struct cdns2_request *preq),
+	TP_ARGS(preq)
+);
+
+DEFINE_EVENT(cdns2_log_request, cdns2_alloc_request,
+	TP_PROTO(struct cdns2_request *preq),
+	TP_ARGS(preq)
+);
+
+DEFINE_EVENT(cdns2_log_request, cdns2_free_request,
+	TP_PROTO(struct cdns2_request *preq),
+	TP_ARGS(preq)
+);
+
+DEFINE_EVENT(cdns2_log_request, cdns2_ep_queue,
+	TP_PROTO(struct cdns2_request *preq),
+	TP_ARGS(preq)
+);
+
+DEFINE_EVENT(cdns2_log_request, cdns2_request_dequeue,
+	TP_PROTO(struct cdns2_request *preq),
+	TP_ARGS(preq)
+);
+
+DEFINE_EVENT(cdns2_log_request, cdns2_request_giveback,
+	TP_PROTO(struct cdns2_request *preq),
+	TP_ARGS(preq)
+);
+
+TRACE_EVENT(cdns2_ep0_enqueue,
+	TP_PROTO(struct cdns2_device *dev_priv, struct usb_request *request),
+	TP_ARGS(dev_priv, request),
+	TP_STRUCT__entry(
+		__field(int, dir)
+		__field(int, length)
+	),
+	TP_fast_assign(
+		__entry->dir = dev_priv->eps[0].dir;
+		__entry->length = request->length;
+	),
+	TP_printk("Queue to ep0%s length: %u", __entry->dir ? "in" : "out",
+		  __entry->length)
+);
+
+DECLARE_EVENT_CLASS(cdns2_log_map_request,
+	TP_PROTO(struct cdns2_request *priv_req),
+	TP_ARGS(priv_req),
+	TP_STRUCT__entry(
+		__string(name, priv_req->pep->name)
+		__field(struct usb_request *, req)
+		__field(void *, buf)
+		__field(dma_addr_t, dma)
+	),
+	TP_fast_assign(
+		__assign_str(name, priv_req->pep->name);
+		__entry->req = &priv_req->request;
+		__entry->buf = priv_req->request.buf;
+		__entry->dma = priv_req->request.dma;
+	),
+	TP_printk("%s: req: %p, req buf %p, dma %p",
+		  __get_str(name), __entry->req, __entry->buf, &__entry->dma
+	)
+);
+
+DEFINE_EVENT(cdns2_log_map_request, cdns2_map_request,
+	     TP_PROTO(struct cdns2_request *req),
+	     TP_ARGS(req)
+);
+DEFINE_EVENT(cdns2_log_map_request, cdns2_mapped_request,
+	     TP_PROTO(struct cdns2_request *req),
+	     TP_ARGS(req)
+);
+
+DECLARE_EVENT_CLASS(cdns2_log_trb,
+	TP_PROTO(struct cdns2_endpoint *pep, struct cdns2_trb *trb),
+	TP_ARGS(pep, trb),
+	TP_STRUCT__entry(
+		__string(name, pep->name)
+		__field(struct cdns2_trb *, trb)
+		__field(u32, buffer)
+		__field(u32, length)
+		__field(u32, control)
+		__field(u32, type)
+	),
+	TP_fast_assign(
+		__assign_str(name, pep->name);
+		__entry->trb = trb;
+		__entry->buffer = le32_to_cpu(trb->buffer);
+		__entry->length = le32_to_cpu(trb->length);
+		__entry->control = le32_to_cpu(trb->control);
+		__entry->type = usb_endpoint_type(pep->endpoint.desc);
+	),
+	TP_printk("%s: trb V: %p, dma buf: P: 0x%08x, %s",
+		 __get_str(name), __entry->trb, __entry->buffer,
+		 cdns2_decode_trb(__get_buf(CDNS2_MSG_MAX), CDNS2_MSG_MAX,
+				  __entry->control, __entry->length,
+				  __entry->buffer))
+);
+
+DEFINE_EVENT(cdns2_log_trb, cdns2_queue_trb,
+	TP_PROTO(struct cdns2_endpoint *pep, struct cdns2_trb *trb),
+	TP_ARGS(pep, trb)
+);
+
+DEFINE_EVENT(cdns2_log_trb, cdns2_complete_trb,
+	TP_PROTO(struct cdns2_endpoint *pep, struct cdns2_trb *trb),
+	TP_ARGS(pep, trb)
+);
+
+DECLARE_EVENT_CLASS(cdns2_log_ring,
+	TP_PROTO(struct cdns2_endpoint *pep),
+	TP_ARGS(pep),
+	TP_STRUCT__entry(
+		__dynamic_array(u8, tr_seg, TR_SEG_SIZE)
+		__dynamic_array(u8, pep, sizeof(struct cdns2_endpoint))
+		__dynamic_array(char, buffer,
+				(TRBS_PER_SEGMENT * 65) + CDNS2_MSG_MAX)
+	),
+	TP_fast_assign(
+		memcpy(__get_dynamic_array(pep), pep,
+		       sizeof(struct cdns2_endpoint));
+		memcpy(__get_dynamic_array(tr_seg), pep->ring.trbs,
+		       TR_SEG_SIZE);
+	),
+
+	TP_printk("%s",
+		  cdns2_raw_ring((struct cdns2_endpoint *)__get_str(pep),
+				    (struct cdns2_trb *)__get_str(tr_seg),
+				    __get_str(buffer),
+				    (TRBS_PER_SEGMENT * 65) + CDNS2_MSG_MAX))
+);
+
+DEFINE_EVENT(cdns2_log_ring, cdns2_ring,
+	TP_PROTO(struct cdns2_endpoint *pep),
+	TP_ARGS(pep)
+);
+
+DECLARE_EVENT_CLASS(cdns2_log_ep,
+	TP_PROTO(struct cdns2_endpoint *pep),
+	TP_ARGS(pep),
+	TP_STRUCT__entry(
+		__string(name, pep->name)
+		__field(unsigned int, maxpacket)
+		__field(unsigned int, maxpacket_limit)
+		__field(unsigned int, flags)
+		__field(unsigned int, dir)
+		__field(u8, enqueue)
+		__field(u8, dequeue)
+	),
+	TP_fast_assign(
+		__assign_str(name, pep->name);
+		__entry->maxpacket = pep->endpoint.maxpacket;
+		__entry->maxpacket_limit = pep->endpoint.maxpacket_limit;
+		__entry->flags = pep->ep_state;
+		__entry->dir = pep->dir;
+		__entry->enqueue = pep->ring.enqueue;
+		__entry->dequeue = pep->ring.dequeue;
+	),
+	TP_printk("%s: mps: %d/%d, enq idx: %d, deq idx: %d, "
+		  "flags: %s%s%s%s, dir: %s",
+		__get_str(name), __entry->maxpacket,
+		__entry->maxpacket_limit, __entry->enqueue,
+		__entry->dequeue,
+		__entry->flags & EP_ENABLED ? "EN | " : "",
+		__entry->flags & EP_STALLED ? "STALLED | " : "",
+		__entry->flags & EP_WEDGE ? "WEDGE | " : "",
+		__entry->flags & EP_RING_FULL ? "RING FULL |" : "",
+		__entry->dir ? "IN" : "OUT"
+	)
+);
+
+DEFINE_EVENT(cdns2_log_ep, cdns2_gadget_ep_enable,
+	TP_PROTO(struct cdns2_endpoint *pep),
+	TP_ARGS(pep)
+);
+
+DEFINE_EVENT(cdns2_log_ep, cdns2_gadget_ep_disable,
+	TP_PROTO(struct cdns2_endpoint *pep),
+	TP_ARGS(pep)
+);
+
+DEFINE_EVENT(cdns2_log_ep, cdns2_iso_out_ep_disable,
+	TP_PROTO(struct cdns2_endpoint *pep),
+	TP_ARGS(pep)
+);
+
+DEFINE_EVENT(cdns2_log_ep, cdns2_ep_busy_try_halt_again,
+	TP_PROTO(struct cdns2_endpoint *pep),
+	TP_ARGS(pep)
+);
+
+DECLARE_EVENT_CLASS(cdns2_log_request_handled,
+	TP_PROTO(struct cdns2_request *priv_req, int current_index,
+		 int handled),
+	TP_ARGS(priv_req, current_index, handled),
+	TP_STRUCT__entry(
+		__field(struct cdns2_request *, priv_req)
+		__field(unsigned int, dma_position)
+		__field(unsigned int, handled)
+		__field(unsigned int, dequeue_idx)
+		__field(unsigned int, enqueue_idx)
+		__field(unsigned int, start_trb)
+		__field(unsigned int, end_trb)
+	),
+	TP_fast_assign(
+		__entry->priv_req = priv_req;
+		__entry->dma_position = current_index;
+		__entry->handled = handled;
+		__entry->dequeue_idx = priv_req->pep->ring.dequeue;
+		__entry->enqueue_idx = priv_req->pep->ring.enqueue;
+		__entry->start_trb = priv_req->start_trb;
+		__entry->end_trb = priv_req->end_trb;
+	),
+	TP_printk("Req: %p %s, DMA pos: %d, ep deq: %d, ep enq: %d,"
+		  " start trb: %d, end trb: %d",
+		__entry->priv_req,
+		__entry->handled ? "handled" : "not handled",
+		__entry->dma_position, __entry->dequeue_idx,
+		__entry->enqueue_idx, __entry->start_trb,
+		__entry->end_trb
+	)
+);
+
+DEFINE_EVENT(cdns2_log_request_handled, cdns2_request_handled,
+	TP_PROTO(struct cdns2_request *priv_req, int current_index,
+		 int handled),
+	TP_ARGS(priv_req, current_index, handled)
+);
+
+DECLARE_EVENT_CLASS(cdns2_log_epx_reg_config,
+	TP_PROTO(struct cdns2_device *pdev, struct cdns2_endpoint *pep),
+	TP_ARGS(pdev, pep),
+	TP_STRUCT__entry(
+		__string(ep_name, pep->name)
+		__field(u8, burst_size)
+		__field(__le16, maxpack_reg)
+		__field(__u8, con_reg)
+		__field(u32, ep_sel_reg)
+		__field(u32, ep_sts_en_reg)
+		__field(u32, ep_cfg_reg)
+	),
+	TP_fast_assign(
+		__assign_str(ep_name, pep->name);
+		__entry->burst_size = pep->trb_burst_size;
+		__entry->maxpack_reg = pep->dir ? readw(&pdev->epx_regs->txmaxpack[pep->num - 1]) :
+						  readw(&pdev->epx_regs->rxmaxpack[pep->num - 1]);
+		__entry->con_reg = pep->dir ? readb(&pdev->epx_regs->ep[pep->num - 1].txcon) :
+					      readb(&pdev->epx_regs->ep[pep->num - 1].rxcon);
+		__entry->ep_sel_reg = readl(&pdev->adma_regs->ep_sel);
+		__entry->ep_sts_en_reg = readl(&pdev->adma_regs->ep_sts_en);
+		__entry->ep_cfg_reg = readl(&pdev->adma_regs->ep_cfg);
+	),
+
+	TP_printk("%s, maxpack: %d, con: %02x, dma_ep_sel: %08x, dma_ep_sts_en: %08x"
+		  " dma_ep_cfg %08x",
+		  __get_str(ep_name), __entry->maxpack_reg, __entry->con_reg,
+		  __entry->ep_sel_reg, __entry->ep_sts_en_reg,
+		  __entry->ep_cfg_reg
+	)
+);
+
+DEFINE_EVENT(cdns2_log_epx_reg_config, cdns2_epx_hw_cfg,
+	TP_PROTO(struct cdns2_device *pdev, struct cdns2_endpoint *pep),
+	TP_ARGS(pdev, pep)
+);
+
+#endif /* __LINUX_CDNS2_TRACE */
+
+/* This part must be outside header guard. */
+
+#undef TRACE_INCLUDE_PATH
+#define TRACE_INCLUDE_PATH .
+
+#undef TRACE_INCLUDE_FILE
+#define TRACE_INCLUDE_FILE cdns2-trace
+
+#include <trace/define_trace.h>
-- 
2.37.2

