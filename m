Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C8C1486EE5
	for <lists+linux-usb@lfdr.de>; Fri,  7 Jan 2022 01:33:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344140AbiAGAdq (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 6 Jan 2022 19:33:46 -0500
Received: from mx0c-0054df01.pphosted.com ([67.231.159.91]:35291 "EHLO
        mx0c-0054df01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1343832AbiAGAdp (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 6 Jan 2022 19:33:45 -0500
X-Greylist: delayed 1178 seconds by postgrey-1.27 at vger.kernel.org; Thu, 06 Jan 2022 19:33:45 EST
Received: from pps.filterd (m0208999.ppops.net [127.0.0.1])
        by mx0c-0054df01.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 206HUK1r013146;
        Thu, 6 Jan 2022 19:14:03 -0500
Received: from can01-qb1-obe.outbound.protection.outlook.com (mail-qb1can01lp2052.outbound.protection.outlook.com [104.47.60.52])
        by mx0c-0054df01.pphosted.com (PPS) with ESMTPS id 3de4vpr88d-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 06 Jan 2022 19:14:02 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QgajJXOSNSORqQlC7Eu+JTSa6olDP3oIWmlgi0bS7DznFHnZgR9gZ+siJiin1AvpEYwux5xGo4+iaGW4nkQnLC5ofvNa1NNm20Pm70e32PuwbkE4DauIGfFhaHyT8A7ueG1E8UvOI8vyEpxKqmrXK8VDrqV39Wq+5HmgRXEmkuyTjnAqc00jh3S5LzGcxiNpegLx2/yokLKXyIjy0e+MjjMRaM0/M0oSpXjYS+cXLhcd09aPC+sFcsFj+IVMLw0gr67hNgOuud1n0VItaILmYSZp1Qhu0MdQpQ5k25qc8gdfF9GXiQDRMK10RkzT6/Bq+7BNMYFbh9FXvq3bqY72OA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=izF9EutxX4k1MjhTMZOvYIgAWynKlxPP4s9nAlU/wt4=;
 b=TLc9DZIC5aYkhbSQglEE8Vf2n1k0Us5Mo3m+Rv/rOypIR58lPgDz9iHWIWeSjim4OYvhHfAFS1i2GihOJspqvR7ieSNU/PKPQwzmUTJK75fqLHxr3GNUceymcFEtmV/fQgdrvDGoFv4I3rDaMH0krQaZo1bv5z6aNGtgXYFv0QZn8Qs58R4Ld57L+xngdqyDW9YzFXgByi+ySCNALpZzuFDzmt3KBAj9n676SWW8EPtgOnkLFKiId++l+0Jx2RlHj7h+dyYt6HszwYNMBfH84A6Xdidc9Xu4xXGoCfL3vmbz44IT+ThgG1eQatlSNPdgIRkBpMP3saj2cxMJgJgdgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=calian.com; dmarc=pass action=none header.from=calian.com;
 dkim=pass header.d=calian.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=calian.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=izF9EutxX4k1MjhTMZOvYIgAWynKlxPP4s9nAlU/wt4=;
 b=q+OArI3gZDJfUx2bY9GpmV1+qBRFjoAhOzDC1aBD3a/3RITOi8H7LvWs59Gt37ZHw4jaD2+8g+lGZLn6mj+gpWFhruHQ2OX9sv86yoSVdeKPDGowVRdb+Z1zCgGNy/xBuG4BrHnbb7m0u3jheVOMnxpruOK0t3/UA83wqtJfeNY=
Received: from YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:6a::19)
 by YTOPR0101MB1402.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:24::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.7; Fri, 7 Jan
 2022 00:14:00 +0000
Received: from YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::d1f6:d9e4:7cc7:af76]) by YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::d1f6:d9e4:7cc7:af76%5]) with mapi id 15.20.4844.016; Fri, 7 Jan 2022
 00:14:00 +0000
From:   Robert Hancock <robert.hancock@calian.com>
To:     linux-usb@vger.kernel.org
Cc:     michal.simek@xilinx.com, balbi@kernel.org,
        gregkh@linuxfoundation.org, mounika.grace.akula@xilinx.com,
        manish.narani@xilinx.com,
        Robert Hancock <robert.hancock@calian.com>
Subject: [PATCH 0/4] Xilinx ZynqMP USB fixes
Date:   Thu,  6 Jan 2022 18:13:30 -0600
Message-Id: <20220107001334.991614-1-robert.hancock@calian.com>
X-Mailer: git-send-email 2.31.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CO2PR06CA0066.namprd06.prod.outlook.com
 (2603:10b6:104:3::24) To YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:6a::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 899ddfa8-8582-4a9a-56cf-08d9d1729aa0
X-MS-TrafficTypeDiagnostic: YTOPR0101MB1402:EE_
X-Microsoft-Antispam-PRVS: <YTOPR0101MB1402F15D9B9FDAABB1BF7102EC4D9@YTOPR0101MB1402.CANPRD01.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DDjfiawq6kcJV9DyrINp85dhjGIsOAy5VfoXmNL6qN1iMQwAWiZ3E83Ur4zgjBzCgq9kX+7epRZA/izPJT2DmrQsiWakYu4VXjFjTrwA5Lifn6+F34iDxmd48dC4FHTJm8zvYOzPXDo4/sLfIyxXUQnBJqDkJAqkko0xLDaIBrvO1ZstBlDN65iwNCTrLZnOyBuKxiAOhXiEqkdnK9Qm/1uH07zSB7DK1feSqz3FALiKEl6m1i0bFB94UDqLBUz4LZZyyX8Ggsf104MJIVFEbMeONG7wqyOcG5pgbebRpaQuyLyEskWnDKg7JYFR/5J3FZNcGC8LRlo+vGXvW2AIx15hZQu/3RDBYZltHOgzJhD5RVx5Fw9hfw35cEGmVwnwaCQcEgd4FdKUKDAjUi2tzWtNBKfDz2VOmCWq7ZAzcFOa0yr2zz3/jywmang0hN2Ppf9kYtW9pOVrzlaZyYgrujdx2U/08w9lt91we3K2G/wRXC5bgxIID9ouFj9tEBBU1q3GiqLFTqiol/LU/fYyo9iIYLERcxgfUprv9siXznniilzGGktQH+an87PWCKUJxDnqRLR80gTXqmGgbzGPJWFg9vDTmYU/wdIjpHazA6VSCrrePVH38MO7szHSnhdE5t6Z4FZhZTxyCWr/W3m8bE2RiymKvI0WKkwmCA+XAGlP3yNN7Ukjt1nVV0bawiu/mVPbrBVHJxTXSGcdkoBcLg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(366004)(6486002)(316002)(38100700002)(86362001)(107886003)(186003)(44832011)(38350700002)(2616005)(26005)(6512007)(6506007)(83380400001)(52116002)(1076003)(66476007)(6666004)(2906002)(66556008)(8936002)(508600001)(4744005)(4326008)(6916009)(8676002)(36756003)(66946007)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?BszLsCRYdEBrT7xDiUNt4N13PB6LWmQs3+OLM7ZOKFX6U6jcgrVGqZQFEnhp?=
 =?us-ascii?Q?tyvmwvG3naEZr/fFFpQ4gsS16DU+cQ8F4xTmXiyJySlG2WMAH6xgl21wHvne?=
 =?us-ascii?Q?YklEU+vG6QKjJ7M54lFZ/+uDxj1OqTulxy5Y64hQno5VUlSHqQJrkv9/ICSj?=
 =?us-ascii?Q?4NsVeBPJqaLocyhBsNzYZs146aovNxRJP/v9pGnbs8DZ3cxYET5qh4+jnybX?=
 =?us-ascii?Q?kXxcf0ju3UJIyIb1rjrVwCDm6gHfGKO94ZX4Q6inNQ3+qa8YthbVS6XKnuqC?=
 =?us-ascii?Q?JvvntjsvGKxIFDMsZdIKgUpWRbikMRCsSiqc4km+illvzsSwKzWiW/hOtw7I?=
 =?us-ascii?Q?e5tp+kxYOCisztYmUdav2PnVFWoAI7JfpRb5aLrCiRJN21DqvxUIsoKasVhC?=
 =?us-ascii?Q?XaU3Zw6gnkjnpNiuBNFr356Nyn2lxf9xlTcE4q5LmA0oMGC0xv6y4cgdkiVI?=
 =?us-ascii?Q?OG9Phz3nyJIaqbFwr0vAGG+WhhkxdKWol5whHzYvHnIZOt+kYDW65EgFgOA4?=
 =?us-ascii?Q?VqGL5wj9jQH+yq4Q4rqz5u/BMvWbNAyUcdRJokXvnFMzdaRaIhnGq0ZUE+qS?=
 =?us-ascii?Q?yunkU+V/AkkHEpUJdFgA+20QKtJ5/HFwbRVJPRJjlLiHIVTbuD3ipk4EenZu?=
 =?us-ascii?Q?goujkTE4OaYEahh3HffPLtTg9rmFOgBdO8Ej9eNCBPAJyDZsMbWZLVKucg4O?=
 =?us-ascii?Q?5UvxFjib/oZJRqzfGIwEe2dAIynyFKIxe/J0yNVsAjTruFm+miDkWaQkyGEx?=
 =?us-ascii?Q?SJRRd4a1BjGiCYZLiRJA0OBLnYNG/bBo7mNHJyTGN2zeX5pb/8gucrL/ECRs?=
 =?us-ascii?Q?kCaCAhS00qCaz+7w+ew5308QMlssMd+/ESgyJd8JQM6ZDd+S4AjC7LoSvQHy?=
 =?us-ascii?Q?9M+AHUxSV5OJjYQ7LnWxTARMY7dL6rmuCsvNHd7HzpbkKgQHxotOFqBElkV2?=
 =?us-ascii?Q?OPJPMgYcc/YJf6Pw0njO09VLWFYis3rvATdLPKDHQouuxTi9Jo/19xuAM6Gu?=
 =?us-ascii?Q?jcDX7ls5rzExCF/FwEmti5bLsNo44a3vCMJvpFwDrIsufPlbdIk2gMlT4mk2?=
 =?us-ascii?Q?yS8JugjpRzesjsz8ZDregDPH8LXcbOoxRAgMxZD72JrTlLZn5xWzpwsaZ1Bz?=
 =?us-ascii?Q?mEgDkuRMKnBo1/t5m/eg12FUjvf9tDmg17EMp7SzdtgmtRszf3T1yTd4Xl+k?=
 =?us-ascii?Q?qQfMnASgBYAYQlp8cARdaDM5TWGCt8lQbxx4LJV5wJeOyoUEz/h2YZvs17oq?=
 =?us-ascii?Q?ysgANzHfwQTzqTzYxFugwrIk0ach05jrxtini3Ax1XDtLop2OWDOFlvxLhFH?=
 =?us-ascii?Q?AoPKxQQN+yHGY68tjl4izQxUPuqTK5wNj98oLsKho6aaNDXbkL2zC4CPHZ44?=
 =?us-ascii?Q?Ev9PPzFCVageR+yuHRXkshc++Qbe/hGtBsLMGbnuOBTNQddMFjVl6eiXlZcb?=
 =?us-ascii?Q?2LYKGa5pOv5gQbBcU6QpCEnLwEpWVW9iQ3DGqSJsg4M1HOCIAw7M6ePM1A4u?=
 =?us-ascii?Q?tYEeAX+ThdFdN2724Ru8Sx8E1IzluIfKkDWbV35AQzbHsateJHbE6cc2yfKr?=
 =?us-ascii?Q?PuQUIOb/1tdY6GKEi9Xt4h4suh3QtjeDpE6XhpIWhyWhpJd05SNXxp9Q6/Mo?=
 =?us-ascii?Q?a2EdrRVxI9JPQoUhcs775E16MEcwUVcp/isKqu4ix6VJsZEJcy39sEJ2cqEj?=
 =?us-ascii?Q?k9iHew=3D=3D?=
X-OriginatorOrg: calian.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 899ddfa8-8582-4a9a-56cf-08d9d1729aa0
X-MS-Exchange-CrossTenant-AuthSource: YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2022 00:14:00.2967
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 23b57807-562f-49ad-92c4-3bb0f07a1fdf
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vElVMcry95OW7J4bcVkCi113QPBkL9plrn7KXH7FtEuTtf5etWEWaG9eKtBSQ74RQoDO2MGpE0JEy9tlk6fE7KJzKVL6w4NWfMYVfudCpT4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YTOPR0101MB1402
X-Proofpoint-ORIG-GUID: 1oGfHcZmHa4iZEXoQgBxpkH_9cvUTykF
X-Proofpoint-GUID: 1oGfHcZmHa4iZEXoQgBxpkH_9cvUTykF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-06_10,2022-01-06_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 bulkscore=0
 impostorscore=0 phishscore=0 malwarescore=0 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 clxscore=1011 adultscore=0
 mlxlogscore=236 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2110150000 definitions=main-2201070000
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Some fixes related to the DWC3 USB driver and Xilinx ZynqMP DWC3
wrapper driver to allow ZynqMP USB to work properly when the hardware
is configured in USB 2.0-only mode.

Robert Hancock (4):
  usb: dwc3: xilinx: Fix PIPE clock selection for USB2.0 mode
  usb: dwc3: xilinx: Fix error handling when getting USB3 PHY
  usb: dwc3: add reference clock FLADJ configuration
  arm64: dts: zynqmp: Add DWC3 USB reference clock period configuration

 arch/arm64/boot/dts/xilinx/zynqmp.dtsi |  4 ++++
 drivers/usb/dwc3/core.c                | 32 ++++++++++++++++++++++++++
 drivers/usb/dwc3/core.h                |  3 +++
 drivers/usb/dwc3/dwc3-xilinx.c         | 17 ++++++++------
 4 files changed, 49 insertions(+), 7 deletions(-)

-- 
2.31.1

