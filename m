Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C4A3255038E
	for <lists+linux-usb@lfdr.de>; Sat, 18 Jun 2022 10:54:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229799AbiFRIy4 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 18 Jun 2022 04:54:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229437AbiFRIyy (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 18 Jun 2022 04:54:54 -0400
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90C182637;
        Sat, 18 Jun 2022 01:54:53 -0700 (PDT)
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25I3w6CX006064;
        Sat, 18 Jun 2022 08:54:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=1X6R43rmZVDoN6zkovGc7j+6EI5kqS//8Qa+SHWG10w=;
 b=zXLQA2MOKULhQydcIXTItk9eZInEWqxWlq6T1OuZBNS2TzkeBdq7z/4u78J/qFO+92xT
 M6NaaIzq1xowFs7CCsYjQcXRiJMZ/iWnxSK54ulEJNcAZhm5cyS4lEcvUwztzm7y5487
 x6Ah+J5J5hBodlzTND0xrqQqv0TSLz4Yho6+Pob4cBypKL0Lx+bWfVqawHHzsMk4m+CS
 iDtjgKy39zGO+/1D4Hw3NMMJucCe+NEFWoaJb+4IxSI4/tQAhxjCT/2s/GXtTfZtoN67
 44vOy7pogSDy8Crtw+xZanY/6i5LVR3MqCikkbzkqZbhdVXayVbqZoF+gCl+O6vlV/l6 Tg== 
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
        by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3gs78tr7xw-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Sat, 18 Jun 2022 08:54:36 +0000
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
        by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2) with SMTP id 25I8odVm028428;
        Sat, 18 Jun 2022 08:54:35 GMT
Received: from nam04-mw2-obe.outbound.protection.outlook.com (mail-mw2nam04lp2169.outbound.protection.outlook.com [104.47.73.169])
        by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id 3gs550sye7-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Sat, 18 Jun 2022 08:54:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T7vUIuSnj83knU6aS1/M1+9gZi+Sgyfhz+GFuql1XtMQMakFIigEqC1HM0uaqqm84PEcHZzpeBmDfJbypCVqdUPy1WnlXxg5SPJ7T3ssbaDFd1uJ5lKAyfRGuB/g1t4xzyrjKM+gKpOrv+SCC6nSZROnozPHvXaijHZueJKjl+q/0F3f0cc+ibdsrEOq1sHYlqPtguRZw8fOoH7dY1tdrlN5Xcv0qTYO/0J7gmgorvzTMg3kIP/RqcqBA710AzWtgI16Wjv1Rdji0lziUxzamD8dlNiuJKX2HPn8FkqKk7k/L3TslDEtPuCnSOF/i4eulGGIsR0G28L+2YWeikvMnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1X6R43rmZVDoN6zkovGc7j+6EI5kqS//8Qa+SHWG10w=;
 b=KlRhv4YgrVCStjl8lTQ5ieR5qMyiQqhcA+KTHWOcvbJddLC2c+AHjHuy6ONL7oZUU0+jWJTmNPhz2v7m1+dk8lt09YfTznMGkW1EeQ1y4QseYhsVup3riHswK2/rKX6QAT2bW3Lq2PzRpsuFVL5KI7aLVYNarFv8IOTqoiyy05ANE1Vz3bsKJLgTMTzRfMRsS36BZL2YO/N/ie0/OMh7UKT4PoOYbzu+Xzft+mvlx6ZBPjd0cfl7BkYo0ehcB8M0XElLCgKtlmt9FoM5hqRcSruuJPfPfISlLDX43V6cRkupccWmsQ9ZZ8R7KcSkL4RUIWDf5E/vyMfsIwM0mz3EZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1X6R43rmZVDoN6zkovGc7j+6EI5kqS//8Qa+SHWG10w=;
 b=jJV2Jetahi/tmUXFF5GSDpDTe1pWV79Ex4jp1Mj5i5ZzMiYBgxwLeapxj0die5Hy1/vvjKBcbX1/qXPchkTcq/UwOu/pbKcU92d2XCS/Mx5KXP0Fe72lEVNReWQAAB8LdE2hLxtQm000My+eeOqUS5eiktNHuXqVnri3eFAtpJ4=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by BYAPR10MB3589.namprd10.prod.outlook.com
 (2603:10b6:a03:129::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.17; Sat, 18 Jun
 2022 08:54:32 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5020:9b82:5917:40b]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5020:9b82:5917:40b%6]) with mapi id 15.20.5332.024; Sat, 18 Jun 2022
 08:54:32 +0000
Date:   Sat, 18 Jun 2022 11:54:20 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Neal Liu <neal_liu@aspeedtech.com>
Cc:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>,
        linux-aspeed@lists.ozlabs.org, linux-usb@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH 1/2] usb: gadget: aspeed_udc: cleanup loop in
 ast_dma_descriptor_setup()
Message-ID: <Yq2SvM2bbrtSd1H9@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-ClientProxiedBy: ZR0P278CA0141.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:40::20) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ecdf8c97-814e-4701-eed1-08da5108294f
X-MS-TrafficTypeDiagnostic: BYAPR10MB3589:EE_
X-Microsoft-Antispam-PRVS: <BYAPR10MB3589533839A5E0D9107A393D8EAE9@BYAPR10MB3589.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dBES0cXhb6FM/f3w+sS67h5ZT0p+Opfxlix98P+C8MAai+z2WPecXCDZoLakyVwetEhgLp1qAzWJQuZJ45BxlS3EAO+sp4G57LB2zjilCZirdGKD2YbOJzpRK/hIQKd1Qa/u7d8cvXZGwcLzwRfcZnnoutdgEvzPJouztR7NcIpfzayef9YUTyUlxuVB2EgKHre8YUAg/nLD1j5gE5tsQyujzUlHuO2Lw/WdYWrnV+jwjP54LUaW7Qjd1L44b7ws+YoRINbpxIh7QVmGXDQtsM0ihtTWWJQmO0UguUZReTxzAcceoWTSQPKZaAT4jewi17wM2d6XIz6xhC6ZQ6vPHtqRvkJ3E5nTww0T1nBc1poRCQRkyEdpkAzPuQ3apEarfLP1xSaFwfmGZsPH7WFd74ar7nWlEQ4TnYeOrcZSqft1oDzKHrJZO+ldF+flygSlVvRWPDHl6GaAxwgg72RRAWkUoOC1uYkIIBntKxcm4FTMDGSdqM8/C26wgRR+mn2ZMefWApVJQ0O9pH9jjhDtldMpFIFpzljzAaX083LcdSUtVOjuF6BBslM99MUlU3uRaMZ0ZWU9islyb/UcR/cLhgvGuiiBjilcnGh0hZ0ynmrTUQTmMpIqfleDXRZE+tBTMkBvhMttKG2jJAIVsl9nZyX2wR6xuMLdqK+7W0j7RKwNzOGcXeVKNIhBZvdTKRd43FwbnOUik5uxk9PQeDb/Iw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(7916004)(366004)(5660300002)(186003)(44832011)(2906002)(66476007)(83380400001)(38100700002)(8676002)(6666004)(6512007)(33716001)(38350700002)(86362001)(6916009)(6486002)(54906003)(498600001)(9686003)(316002)(8936002)(26005)(66946007)(52116002)(66556008)(4326008)(6506007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?IOARjE/JsbifBNMFphcGkSDzdW8VGoN/Ef0DFcJGivEdc8AqcaVVh4Y0eqUa?=
 =?us-ascii?Q?aSd5LQY7U3jybMN+pPO4y6i5toPPw4HYNz9z7jmI18/h33/+L5W1EunDZ7ln?=
 =?us-ascii?Q?VL3cKMFIxeKnvxa69eZ+l5P9pNIxMfpxcbCeE2C5TtkS7+3CvdE6qtGPPH/5?=
 =?us-ascii?Q?tVL9O2FiOTZ/iy3xFhK/HJRV7TpIwB9PAiEVKGoVr+yuE+Y/pCvvlUXatz0t?=
 =?us-ascii?Q?7S6BeLtHNWxqYpC+05PFlmbXofH6afm2INh1VWoiwZNomEP+ECcRX0g40zPQ?=
 =?us-ascii?Q?bYkt/btD0u4kenoQlaiJssAeTFmdeHRHPaB79cisqb6F5LTsD/hme8ovqart?=
 =?us-ascii?Q?MyIHz7io+FOxwAlcJQ9NJnYoWHmUjUDm9vPgnh/RK0hIeal1KJidUynCJxhv?=
 =?us-ascii?Q?GERd4AcBXBIs7BnRefojr5SaZfletN5rNUJ7ChjZzwYiQqc+/cf2apOv7ovX?=
 =?us-ascii?Q?pYIpnrxmof3Du6eyaZIzxwZNUzQ6roG5ClZRg3slPvF86Ut64RYV+RqGxUkK?=
 =?us-ascii?Q?5zmmOY73H01MK/t4+gbRWFkTikj+HIgO+FXkcL5w5gtBsa22RNBSUtjdXegd?=
 =?us-ascii?Q?+IMaGJ036sV3LAgABNafC4O7u8hrhlaoJ/JAe37Rv1E1hb8iRJdkFC3I3+8L?=
 =?us-ascii?Q?gzT8fGipDEzRC0YmDfBumOWRlh95V5Jk511N29xVYUvPlrQlkVMvvHa7GcZx?=
 =?us-ascii?Q?6VDx6EmfezyM6w8kmD2nmU/AWZHQcl8KY7+3AykRDsg+Ip5xxgaKmwUUOwiC?=
 =?us-ascii?Q?xIzzEyU+S0ZLRmwTYgYrCf7V5n1uB3JOUyVTOtTNrNUVuT9fy8TVjYDxlmeS?=
 =?us-ascii?Q?fDDXjC0b89yOAW45dofuDsbLkBFpUxO2/c6V/y1grpLQc2F/pJVBP/sEfdHR?=
 =?us-ascii?Q?RNdu0QPfYV4noBY7dTdzgoWWPRTKG5g+kodJDwnb1+ZGtJgHwe/B4Q+lqaiY?=
 =?us-ascii?Q?Uocp51j1dukl/n2JfPWLLBtqjPHaOdb9wJ70VzeHt/O8LG1OZe5aVBbRdqzS?=
 =?us-ascii?Q?7FzhbvnSpqRes59wr8KAJVnnObDNr3bqWaVNXcpD14JMWBBTkuOHs2c2+wX2?=
 =?us-ascii?Q?Yz1kF3Wvtuh+WR3JAwgqg8+S96leWXK+tfpv3wKwsPGMVdLkq/r2iGRRlWes?=
 =?us-ascii?Q?DxfbPHd0oPH/Q8h2MjMuoaANJOzW/SxADe7odlHdx9uILGO/CMXkJdfTpP8p?=
 =?us-ascii?Q?yHyDBmWay2TG+DmxjO0FAWMUYvTzyUPuSqbxLU4BSNik7GVJhxKPsMMtzBnM?=
 =?us-ascii?Q?+0RQgF76SGEJr4D80jIc+VfDAYmEIpmwWKT/HEf7BqO8WmR/VYOfX6R6MuLi?=
 =?us-ascii?Q?BUiI70JBcHluMtfWlmC/xI4VGNjqzKMYN+2qQPwJ6kbMp55vxh00qzszdQaf?=
 =?us-ascii?Q?F7N0YCB8MZHqdCZ4K+ou4f57Fudo40l/d4BzFowE7OmlZIH+JLahjonyKk3H?=
 =?us-ascii?Q?/e1ClsuzsnEPNcBVDgVlZoTY1DvXqthGmxj6ScggH5sOG1D4xhQyTFHnPPPf?=
 =?us-ascii?Q?ZqF10KZSq0hZVpiJdxe2qfM1aAbInIoIgRxL3q0vqUl0AVWrwHGuheTOLrZ6?=
 =?us-ascii?Q?z6A9ruv42KtHulDQpuygQ/UOfpsNCTm5OhkGv7IbrXFDtshvn6BC8GbzRLiJ?=
 =?us-ascii?Q?AldJXePrLe9W0B7QdxoMUrGFZRkdcSM7CLUAF56YNNWDyE/bf5APqRJo9RwM?=
 =?us-ascii?Q?b4P8yiUZovWLDOunsHzyB40zGcfK1Zwawjw711mC8Q/NuFJYJYn0t4wRjC2V?=
 =?us-ascii?Q?AgLOo5T+U8Y6F86ZnB7c+usR7GP3ZJM=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ecdf8c97-814e-4701-eed1-08da5108294f
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2022 08:54:32.4320
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D1gXNHqnQ+leCo/BLPtdmUp2ss6bVpijkEySYFTlR0CxkX6BpGsgjCCJZGnxKER1MI5Jn55QzVdszcu7o8xhRM1bU+y1LyomT3/vvRW0OZ8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR10MB3589
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.517,18.0.883
 definitions=2022-06-18_07:2022-06-17,2022-06-18 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 spamscore=0 adultscore=0
 phishscore=0 malwarescore=0 mlxlogscore=999 mlxscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2204290000
 definitions=main-2206180043
X-Proofpoint-GUID: Ucm8oa5JbqWA54_H-Eej39qA29VSy0j9
X-Proofpoint-ORIG-GUID: Ucm8oa5JbqWA54_H-Eej39qA29VSy0j9
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The "chunk >= 0" condition does not work because count is a u32.
Also, really we shouldn't enter the loop when "chunk" is zero.

Once that condition is fixed then there is no need for the "last"
variable.  I reversed the "if (chunk <= ep->chunk_max)" as well.
The new loop is much simpler.

Fixes: 055276c13205 ("usb: gadget: add Aspeed ast2600 udc driver")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/usb/gadget/udc/aspeed_udc.c | 24 +++++++++++-------------
 1 file changed, 11 insertions(+), 13 deletions(-)

diff --git a/drivers/usb/gadget/udc/aspeed_udc.c b/drivers/usb/gadget/udc/aspeed_udc.c
index 1fc15228ff15..77376ae04224 100644
--- a/drivers/usb/gadget/udc/aspeed_udc.c
+++ b/drivers/usb/gadget/udc/aspeed_udc.c
@@ -476,8 +476,8 @@ static int ast_dma_descriptor_setup(struct ast_udc_ep *ep, u32 dma_buf,
 {
 	struct ast_udc_dev *udc = ep->udc;
 	struct device *dev = &udc->pdev->dev;
-	u32 offset, chunk;
-	int count, last;
+	int chunk, count;
+	u32 offset;
 
 	if (!ep->descs) {
 		dev_warn(dev, "%s: Empty DMA descs list failure\n",
@@ -486,30 +486,28 @@ static int ast_dma_descriptor_setup(struct ast_udc_ep *ep, u32 dma_buf,
 	}
 
 	chunk = tx_len;
-	offset = count = last = 0;
+	offset = count = 0;
 
 	EP_DBG(ep, "req @%p, %s:%d, %s:0x%x, %s:0x%x\n", req,
 	       "wptr", ep->descs_wptr, "dma_buf", dma_buf,
 	       "tx_len", tx_len);
 
 	/* Create Descriptor Lists */
-	while (chunk >= 0 && !last && count < AST_UDC_DESCS_COUNT) {
+	while (chunk > 0 && count < AST_UDC_DESCS_COUNT) {
 
 		ep->descs[ep->descs_wptr].des_0 = dma_buf + offset;
 
-		if (chunk <= ep->chunk_max) {
-			ep->descs[ep->descs_wptr].des_1 = chunk;
-			last = 1;
-		} else {
+		if (chunk > ep->chunk_max)
 			ep->descs[ep->descs_wptr].des_1 = ep->chunk_max;
-			chunk -= ep->chunk_max;
-		}
+		else
+			ep->descs[ep->descs_wptr].des_1 = chunk;
+
+		chunk -= ep->chunk_max;
 
-		EP_DBG(ep, "descs[%d]: 0x%x 0x%x, last:%d\n",
+		EP_DBG(ep, "descs[%d]: 0x%x 0x%x\n",
 		       ep->descs_wptr,
 		       ep->descs[ep->descs_wptr].des_0,
-		       ep->descs[ep->descs_wptr].des_1,
-		       last);
+		       ep->descs[ep->descs_wptr].des_1);
 
 		if (count == 0)
 			req->saved_dma_wptr = ep->descs_wptr;
-- 
2.35.1

