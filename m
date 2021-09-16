Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D9B240DBF2
	for <lists+linux-usb@lfdr.de>; Thu, 16 Sep 2021 15:57:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236150AbhIPN7P (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 16 Sep 2021 09:59:15 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:14734 "EHLO
        mx0b-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235593AbhIPN7O (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 16 Sep 2021 09:59:14 -0400
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18GDhxxX001975;
        Thu, 16 Sep 2021 13:57:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=THXwlkA3RH5jlev5py+Sq2/e7qT7Ne4LMrTn4feIUPM=;
 b=vql/t7Aliksxmt0PGglA2Qgh0eu/HPNFcIVPbdOFntHeuca5OSuFBYS5SzDIM0ntV7Dq
 fpMYb1ZK9EIsl114ks+1QrdagB2Ymy1IBTP108TXSFR3vc4e85H84ofk95C6k5fYqbwl
 as7NubJV5R5+FoILJymK6hh37ZCliwUgeeAqP3fHKhupZjT0RNpbejQQLbYQswhaZyEy
 3nDy3SJBB9g0pK46EdwqGkSbAvdFxyx4Oi2ekV6JN7oEkIVbT74wWz/RYiyXrrYjUD5F
 rdvBu4+oXNLZqWPJqGBUsERWGpqHUenQ76WqC+QeSHE5HI/12o5O0HiWJe02Lr0ZXtYl KA== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2020-01-29;
 bh=THXwlkA3RH5jlev5py+Sq2/e7qT7Ne4LMrTn4feIUPM=;
 b=jRv9sUH9NF8fEGbL/ln6RbvWfVNNMxvRoxme7qjKph99h+LVmmvo9ei8Ma09NlnKTD4d
 y4gyNf4Qrfz50ALb69XfL2rvewlvsxydVxyFmUh75WaDq4T5UHIL8DY35ciEcqr07QJv
 j8F5iUGY1nC3U5j9dkCsaWQlKuqRi2rcZw9JcDnSKHLMBPIilfFxFFQu40g4wYzzhSdZ
 QLjYXoSAtvoDnAInQ0deZwtfdUKjnF/qmXlvQfE3dluJi9kyT/picFJr8mM9H+ypUdgF
 oPwXS902+CQzFCBtc1XkEdxSP87uuaxKYEhfCxfjupAfgGvMkQq4K6O2m579KQas/AeT fQ== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
        by mx0b-00069f02.pphosted.com with ESMTP id 3b3s74jcye-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 16 Sep 2021 13:57:50 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
        by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 18GDthg9126049;
        Thu, 16 Sep 2021 13:57:49 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2174.outbound.protection.outlook.com [104.47.57.174])
        by userp3020.oracle.com with ESMTP id 3b167v8nsy-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 16 Sep 2021 13:57:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fmRMsJ17O3enuhVM8/2kyvtkEILwTgHbl8N5DGDPFPeXGhAOJAEAjUBp2EKVIj48pFdP46szdfDKqoEzLjxPwsKmsOULKhUvGpF2gVlgR7lopFMxqYHnodVsw+hLOszi6pGEpo3Wpkq5IPdsAZ0bkVzPjxH0ryx8muOlEWJjac5SV6+FAmYWer6DRPWhR9WfML2ky/ceE3vaqrBcltcB42IzWgLw4ogi00oLvytCCNNKGhlWCuARS2YGyHJ9fmCIrjUkwphu/tKsAzG5G6j1C6dkdr8AKu8wjQduN0PMv7JPY9t7fMGs7VD5L2f7v57FiqOx9VIWEavAfFOJu+fdvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=THXwlkA3RH5jlev5py+Sq2/e7qT7Ne4LMrTn4feIUPM=;
 b=OTD3qnpNrI7BLtY0YPIH1s23UfdT8J5SNOPFnZ5+6oPGdqkoJyDCDnwTjfoVTKBJtLjBeRAbib+lb45FMnU2uEEDwzqd22SLNfx+sXLj7aV6UJAizwP1rP8xBmPXdrcEDbq5DuXdNqkVYpn06JPKEQNstduvG/NxvnSz953mbIa0SF0snRPfmpW6BfqndBF9f/wpzAYhFeKNEVT3x5KNZ0sI2trdldb45t0EN5AVFJP1indz67puQbRiAtXK7Auitj1SWx9hcvvrzi5tjo5vYI9aH23oKZuNExhyFVKjs1bQbnHtGzk4VVce5FbSBiXI23RY5r5atYGfPgRM8RJdZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=THXwlkA3RH5jlev5py+Sq2/e7qT7Ne4LMrTn4feIUPM=;
 b=H3/2xum8pp0SKMrmbflxer/rHDbTV8iff9gyBt43S7rHkf7IY9dtP7v2Fy26KkHeAt0SOL+1xBGor/PNribjE3j+nv+h1E0jaDPv8dDc9rZy5F35A2HvXT05cECajIhEawiFVipLJEoRV3jd+QJZAQYE25PChusI7wpKhlvIu38=
Authentication-Results: ti.com; dkim=none (message not signed)
 header.d=none;ti.com; dmarc=none action=none header.from=oracle.com;
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by MWHPR10MB1950.namprd10.prod.outlook.com
 (2603:10b6:300:10d::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.17; Thu, 16 Sep
 2021 13:57:47 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::d409:11b5:5eb2:6be9]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::d409:11b5:5eb2:6be9%5]) with mapi id 15.20.4523.016; Thu, 16 Sep 2021
 13:57:47 +0000
Date:   Thu, 16 Sep 2021 16:57:37 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Bin Liu <b-liu@ti.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <felipe.balbi@nokia.com>,
        linux-usb@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH v2] usb: musb: tusb6010: uninitialized data in
 tusb_fifo_write_unaligned()
Message-ID: <20210916135737.GI25094@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: ZR0P278CA0058.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:21::9) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
Received: from kili (62.8.83.99) by ZR0P278CA0058.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:21::9) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.16 via Frontend Transport; Thu, 16 Sep 2021 13:57:44 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 33d6eafd-af36-4559-44ca-08d97919f6f2
X-MS-TrafficTypeDiagnostic: MWHPR10MB1950:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR10MB1950C2A0AEF06AC20324F4AA8EDC9@MWHPR10MB1950.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:983;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ftc40lQQpygSGsaBUyyEtvZOjyFUpZ0HmQGK5Kg7ZM4YralDxdtqDCQptjEmyXAHEmhO+B77VBlWjxFRbodCGrZLul2owEHL3h08P4vu7uso9i4A+6OLU6z+98NW+/RDgDAquKyO2yN4HjOs53QAKhdkK4M/L/9IofYDfHV7284tDbFTlusjpz7s59RTmezOOR+yw4rK959Ojm517g6RUrv2yJcJuW/3pwQNrjPhI4t8EckKJ9ddQv2DaFkQ1BIVvxH7C+a2SOu2m553vDJVgchfhyJMqBYx/u3+XWKugI+v0zyovnaxEwgOsMFBrQ+xJKkOQU4ZY6CsNzLvfcVrX7IGNJ+jm1Eueet5cmKailMNS4CDeXox2IvcKD5rIrfn5tD2m114/6gC8U33AVuK6OTmalMgAEboTevdkSjDPukxqCbiN/nZozItKMcJOYzirLOF2PHactMS1FwuJeFJtHZs8iFrR5ApbQYzA25bJiobwFutlo8aqub0Nti1sip6oT591wFOMLN+go6oPuaX0jnJkVu8Sp9a2vdzSdUDOSSazf2HMp8oN6/TDNSYxWPtFKfCNsneuewx48u4MrQqyoqzOXAD2+Ihqu0JzweACoaBZLYDm26+3VYhN3TDkMXv2vadMTKVWivx+pg3hkzrkDtQWaQO+/NC74iMRSlV+PPuqLYGfEO4egJfk2s2yR/9fMO755c5rQlE4qZ14kXCFA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(39860400002)(376002)(366004)(136003)(396003)(9686003)(66946007)(8676002)(186003)(33716001)(54906003)(55016002)(6916009)(4744005)(1076003)(956004)(478600001)(26005)(66476007)(66556008)(8936002)(6666004)(38100700002)(38350700002)(44832011)(5660300002)(9576002)(52116002)(316002)(4326008)(33656002)(6496006)(2906002)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?defU4ll3FVCnyA8nzOxjZ3WQ5PdwsLvPETdIH0L25+7kLWqBv10qovaeSizV?=
 =?us-ascii?Q?/2UlFfRYnEvBFL3E42HKbwNiCUIonutpY4Tfl4xYv67Yy7EQgzQ6wq4mJLkt?=
 =?us-ascii?Q?K9GKwyPsGs39ekS7KLtE5VtXEcn1nxEIZPuHjwyBWNCIcqZudupAsMU952PO?=
 =?us-ascii?Q?FGt2QS1GUd+iZvMyOLpPl+qi5oX5+1HnWWEj8Ij7cjR93rMwAPlnGq54pYMO?=
 =?us-ascii?Q?HxwJps9hOtfpErp57WG49w9dvClFBE11O42nADbERsfzhdB8kyp7krxSfya+?=
 =?us-ascii?Q?N1ppWND4OAn5yl5VOgPQprCkuktL9N9NkUbGkWEpNipiGQfZlCMZrQNTHmxM?=
 =?us-ascii?Q?CBc1MvNFnsWq5FUiGaV4nhitq9VK0fVnqKU+Pbd4tOm1rp48+jSbKadNqApd?=
 =?us-ascii?Q?Gf5v/b0YVwvCyxQCON3HziuMK1eXLAdLFPY7civ3ylCdU00+ZROPIalfJ/Nq?=
 =?us-ascii?Q?UQCIXbC2Y2wCLUfykBLTB/ExpQk8j5h8yudIOoA8MAvqQechbFbeiFkQTNJa?=
 =?us-ascii?Q?rzMFlK6IYfoWwSQ0fszWL74ncgyb+KFS7woU0fRV2amv9jNLTJiA9x2+/2gI?=
 =?us-ascii?Q?NxPU0/NU+pZBKQJ1jMR7crWc2VLkOFnHmhfhenH+ekSFq1aFLOfhHvS+75if?=
 =?us-ascii?Q?RgPl/K3Qw0BMm7CEld4GyClNtc9LyuxnWz+/aJMDS3PXgxHTbIBfOSoRVJP2?=
 =?us-ascii?Q?WIykIOKhDBmboNI8aqlBlc1O8mrjvr3FormLgpJuXeZXcJVUQ5XtPgg6nd9M?=
 =?us-ascii?Q?Yjz2csbPsDuNjKVM9LpLQocbebDkbYA0dZYEhiT7I1O/1odhiIubcfOlMVma?=
 =?us-ascii?Q?8fbuB/cie5OodyzMXcFyx0dsN1Y07gxajL6YU/Z9NGN4XtEMF34EquPZvjJ8?=
 =?us-ascii?Q?f+1Y2jmrbbhgMOXN+r0OzghdTtUbsYwTnjc9oUgaG8k6u0V5Y3FF3ao9n7OZ?=
 =?us-ascii?Q?QOZb124j1KtmA4GNPjFPbcs5VyjpkE59D3aaVEQhKAlCxEjmceMmIqn7L5Ym?=
 =?us-ascii?Q?n72kGQzLrFbQewDwvpoKK5/+DnGjdjWFvIojUnwNQAWJYbWvCuBvZ8Oj0J5V?=
 =?us-ascii?Q?/2xQhHH54chufbue010JWcR2toM0WICtDL+u/6qgfZfkBfjVshJj3MuK1vGD?=
 =?us-ascii?Q?+5wwL6kXEnKLJhr+MaCje+fuIAtj6bIa+b7PGD870YiOKQa5TiERjngDTvJ5?=
 =?us-ascii?Q?jnbcOOvGFSUoBYGthO6v7HxDj2S+Q2sy0ATKtImBfUJ6lHc/4+7ctwMxWZI4?=
 =?us-ascii?Q?72VmhGnVJ/qW1xBdNXzrREQLJZ1NVmNA0ThP/rfaanaB37fP9xocblLKrL2k?=
 =?us-ascii?Q?D5hVsU5kNxm1LXaXWZALTi7C?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33d6eafd-af36-4559-44ca-08d97919f6f2
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2021 13:57:47.6190
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w3bSxEwWDmKCkofkb66k02rZ+N41hs7DMcSqukffh9cywAeQDVv4bzmL3nvuYZlPE5HYhV+oZj6siT9sLoJtfmA1D2hg1Pxad/IgSGnUWRY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB1950
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10109 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 adultscore=0 suspectscore=0
 phishscore=0 mlxlogscore=999 malwarescore=0 mlxscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2109030001
 definitions=main-2109160090
X-Proofpoint-ORIG-GUID: 3MUyep7QygppKQoTACJrYel_WFKCC3zT
X-Proofpoint-GUID: 3MUyep7QygppKQoTACJrYel_WFKCC3zT
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This is writing to the first 1 - 3 bytes of "val" and then writing all
four bytes to musb_writel().  The last byte is always going to be
garbage.  Zero out the last bytes instead.

Fixes: 550a7375fe72 ("USB: Add MUSB and TUSB support")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
v2: I mixed up "len" and "val".  Thanks for catching that Christophe
JAILLET!

 drivers/usb/musb/tusb6010.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/musb/tusb6010.c b/drivers/usb/musb/tusb6010.c
index c42937692207..c968ecda42aa 100644
--- a/drivers/usb/musb/tusb6010.c
+++ b/drivers/usb/musb/tusb6010.c
@@ -190,6 +190,7 @@ tusb_fifo_write_unaligned(void __iomem *fifo, const u8 *buf, u16 len)
 	}
 	if (len > 0) {
 		/* Write the rest 1 - 3 bytes to FIFO */
+		val = 0;
 		memcpy(&val, buf, len);
 		musb_writel(fifo, 0, val);
 	}
-- 
2.20.1

