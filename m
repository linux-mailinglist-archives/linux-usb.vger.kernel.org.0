Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8FC2740C3B5
	for <lists+linux-usb@lfdr.de>; Wed, 15 Sep 2021 12:37:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233034AbhIOKig (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 15 Sep 2021 06:38:36 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:26954 "EHLO
        mx0a-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232054AbhIOKif (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 15 Sep 2021 06:38:35 -0400
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18FAFNNT018637;
        Wed, 15 Sep 2021 10:37:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=dbDZSigb138iHc0USSMWnu+ThtsY9WrYao5LweGJy6I=;
 b=XnNMq/Cr+tg8ajvWdB50eP5vE+uf4kNML6kYJl6CU9Cuaft6mrKdq1dzUJyCjrKSeZva
 80AsWSvOKf9C1FM5YFhwszP6sx/IUOPafG7YhhXzHfRvsxiuzyDEpilk5d4TGzBElLy4
 guSTE7vInZ2RJADst2ZuFUsNi+BVQhMvlJFIWc81kIaPT/JDnDmZzV42ZWtP8JK+j9UK
 Zn1MfbLh49gUzwEpA1YTdaysi+I2STIQlGSepFXRPpMn/hJ3ZNtnnBaupq91mSuSlktu
 kNUhQh2MhtVdCq27wDgSfED4uvr85mQTqTF8cK81n0e418JtFsODbjHDlEzjJTsZFBaK iw== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2020-01-29;
 bh=dbDZSigb138iHc0USSMWnu+ThtsY9WrYao5LweGJy6I=;
 b=HRHwYU3zZTdqczMBDuiE/WfpiqaffAFrfw92DRWNY3uLxAJ8vcgIUa18J9aWto/kRmWp
 GOZZ+YxIG6oZqlqyICSkgCnYIDU1xmrQZ1C748OLBn6gSCt4066nIGlCgLD2POQ9WUqq
 dvmcp74tOEcRDwf501Ub/qG1eu/YL6QvMbARUdRWnZDZF8fef5HyExwn5KH+TgAKzfIx
 nzgTxtYZnLg2yx/XOMIfoM9fc15oIP1nuhIbLa8qu8+3aZlCcAYlZz6HEBXAn5Qiz9KN
 jZdfQz1XPUZmYIErZr/NkGwjuHHmpunEIP5jYgAFG9gDpO3k5Nzi+Y8d1A4ZyajPHeYS sw== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
        by mx0b-00069f02.pphosted.com with ESMTP id 3b2kj5vsxc-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 15 Sep 2021 10:37:12 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
        by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 18FAZaYR150637;
        Wed, 15 Sep 2021 10:37:11 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2169.outbound.protection.outlook.com [104.47.55.169])
        by userp3020.oracle.com with ESMTP id 3b167teq2p-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 15 Sep 2021 10:37:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WFWw6mpVXWX1cm+lFyvTPhyfnD5b2x/xNok/Dh6F0z4N9AV3y1pQwLxDZDll76cNXap47EydPLxYTaQ4o4CkQNbodksBwTfLe2nqrasQ/eL+rVNrOE1m8F4dbGA7Lu17LF80XaRCtd38Tqr0n7V/jBEuFLaxgElUXfL3uJzCya+0wrUrqDMWb8XFz0YNrjwQMaob4XY1XWEbvZoluTqD4WaGdvULJgSnT3kKATkeGd2HdvFiE3PTxid3EPwePK2II6xqBixLI7zZzATuemeQ4Wp1f7fwYG0HpY15/dKWdvXEuxU1/EdnvmwDCI5lRM7v42Z3hFVkolX9lf0OnAPqoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=dbDZSigb138iHc0USSMWnu+ThtsY9WrYao5LweGJy6I=;
 b=LABL3pgcieOBZADjjE1Vh+jHflvJ1Rar+7OSHKOBkUCnKGFNn/b0EGb2OarCq8PBfsnbQzqjLJ4IQDM/jKxIPpvYrJWPhwNFcdf1mr7PDe9AwuKvDzJjEyrIcWQBQuLoc9EpCnzxl9Y7y2QrO0BvuNvUFTH/ngtRcqNyBAyKZAmYzzKMYEZFq4V1dUW10yxgJZMf+V0nzAWOix+ZX6T0ccuKgyUBh+c2//s1exaylQNHYuWZxKcB/fCduiRyKYcgudvC2mgsv1rHBgOnLadpKrrbYTJN+NIaMyyolIpQ8wyNA90+mIYlP0n1do9s9sFvyfp4c4t3bY6mjqqbrSG5Og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dbDZSigb138iHc0USSMWnu+ThtsY9WrYao5LweGJy6I=;
 b=VTJaausy4A2NzK1OYkvo7XhKAcSEF8r6GJS3oWU3UQv7FA1yTNkJLjmp70DUZUW5ka+PlottRJisHLQXM0ZYNRCO8a0h9I99jkElmbYhLxsaSJp4apZIguwigcIij4I7G+OapLw/9d0Jmqb1R4OsDk0CwX1s0+Q+xDK1Y9OVk7s=
Authentication-Results: ti.com; dkim=none (message not signed)
 header.d=none;ti.com; dmarc=none action=none header.from=oracle.com;
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by MWHPR10MB1488.namprd10.prod.outlook.com
 (2603:10b6:300:23::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.17; Wed, 15 Sep
 2021 10:37:09 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5820:e42b:73d7:4268]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5820:e42b:73d7:4268%7]) with mapi id 15.20.4500.019; Wed, 15 Sep 2021
 10:37:09 +0000
Date:   Wed, 15 Sep 2021 13:36:59 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Bin Liu <b-liu@ti.com>, Felipe Balbi <felipe.balbi@nokia.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] usb: musb: tusb6010: uninitialized data in
 tusb_fifo_write_unaligned()
Message-ID: <20210915103659.GB7060@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: ZR0P278CA0010.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:16::20) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
Received: from kili (62.8.83.99) by ZR0P278CA0010.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:16::20) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14 via Frontend Transport; Wed, 15 Sep 2021 10:37:06 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2d4a0e74-485c-4fbc-4516-08d97834c519
X-MS-TrafficTypeDiagnostic: MWHPR10MB1488:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR10MB1488FC617EA7F8794DC2336B8EDB9@MWHPR10MB1488.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:260;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rtKIO8PXJQd7wxIaHsaoTJ0GyLM+WPo5YCZQgt8Y0PwsvMzYPtvAgb/M+lZ1YhaceJ1Tlv6LzkEoFQojru5YjYqk3cVsjLkx3LzQNxOfPiH26Pma/aU5sND0clUJEc9R5yGxUpKbDnwwBA0LE+APG+pxL+jEo2NRHgfiZYGQMiLm4LYAEOx9AkwXajoFmfRFQdY6314g7l4dvaQ12mYuWdPkNv+lg9Gpx2SgX5zFV12I+SqiGqAph2vAdn1odQjqEkF4P/OstePB7qU8rnJzuSMxT8ncCp7Om+CuovMDu74m1579+jxLDFtFxEFtvFFQFjObxI434Sc8sO2E3tlTuyXGThZX9mY3BCYRfnecyi0sqGkPotU4DLVuL1vgsuqYvY/+1t7cMaDpXfszdTs5uahOKfnVjCUapl5lIVXVvb7JtvFVpZWyu0TMZpT8LTJwjGgI9KVADZsxPbcXO1aiPOSwzw/0RxBEmS/SVzKYd5PCLROPSJ930kB5aD4RZnovml6h5VdcYid/DzteqNASOgJrUDVLkNdmtyjG7gescoCWqFU/HRaUD8xsAMTyt9Jq8wOaEBs4Cky9QEUAGUBWPI31gj63h/ci0Brz016QMiz+Qo5fit9GZiKRo8bWWYdVfUHGCgo53doOkkQb7CM/8qGBDV09Ch9VxQjRaFlah+yALQrIuTgE/999urzPr0iDJt/IvUGb+gkYBW/6QJysSw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(376002)(366004)(346002)(396003)(39860400002)(136003)(26005)(8936002)(956004)(9686003)(5660300002)(33656002)(8676002)(66946007)(2906002)(4326008)(38100700002)(38350700002)(66556008)(55016002)(316002)(66476007)(4744005)(9576002)(6496006)(1076003)(6666004)(186003)(478600001)(110136005)(52116002)(44832011)(86362001)(33716001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?AisIPwHjM6f8AK74zWHoPwoBC06UrkVsyVnG9321UpZ/Bbt05mWyVGhs5J1z?=
 =?us-ascii?Q?nvWREHdrMy99nv+BqmD6P/qLupvD2I/FQVzfjrwz2x4xjciNfH9aX6m8y8qx?=
 =?us-ascii?Q?rePOZuxj/F0N7Th7/sUBFy/Y8jOf9j2Er9HAuzvOed5Ge7c2LM+Ks4wI5hhB?=
 =?us-ascii?Q?uZz9mV8cELUP47pNJvD5gEtUdkK1ILhY4Q0P3GSFds3fgWe/fz4rIaUAoUcK?=
 =?us-ascii?Q?AsyYG+0St/oT3mk2YyAfC0LPJFtHnbCAlDbDntQkpwOrxXNB74cHA/XvSyMj?=
 =?us-ascii?Q?Qv+GMz8MxORlL6Y5Jx6lNijNNmUQeKBEVDVhnNKcD/XA+QfMYf3/MPod6JLo?=
 =?us-ascii?Q?4XA4P6QifpzfEl8aoScIGKB8leSA7v9aNL+yhDAHunmmq/uNCq6jm0fCY6tC?=
 =?us-ascii?Q?ZguwEw3L5YPxq/1kkSgbzIRbwEyaNfUkZJuQvEUsEf8ggdDxsgf9wuzUTtY4?=
 =?us-ascii?Q?MsKioeAD/qbbEHQx5AgAbsa56LYoO/R/5nXKaNutHGUfdOek5MhF3DL+yDUN?=
 =?us-ascii?Q?mowiESv3/m9kQ2DK3zFlipR1CJEDpDbVOE/rPzpgtTGpmIEkc3JknqSloSTI?=
 =?us-ascii?Q?ypKKia7LHRYBamZJavnBoPkg4vmjcTkLWEc8lLU2JxSAOfOAZDpc8VI2HpM/?=
 =?us-ascii?Q?YJ+yH+5A+GJPgdTYLO1LGzaN+yP7bZHeO8NFnX2FPZRB4ggDPpnpeopHFGVU?=
 =?us-ascii?Q?Xc0ktVDmL7HVWWRcmePR/alpaPyzUvKRyBSqHwIcZmAQjk6jzke8aOW0s1xi?=
 =?us-ascii?Q?teIagLwoNkUiJ7HLGbPXP4UiD7Bib6fVkqHlbLMDZyRX5WrLmmTyQvxatjGg?=
 =?us-ascii?Q?Nx2R0T3gjB0VAzCIWEmJ9cxfo2YPmKKSBE2weoyZAXf/wDEvm5a3uxIueXqE?=
 =?us-ascii?Q?EVl63FM8+VD5M0BTZg6KqJi9eOEmM+g3sD5a/BRriCtsvCKKFNoB+Ia2ho53?=
 =?us-ascii?Q?JiPM4edSrBQ9d5xyqd2kGV/HpoIeaHugeIXN9QRROQ1GuURW/S7l2Uzd5yya?=
 =?us-ascii?Q?8y1eNFf2RpVl6EJrI/lhJEHzXJzKUt4ntVo+/XUy8gLE4Q500kKoCNEKuAD8?=
 =?us-ascii?Q?+p7L6TkMgf8FWhgHyKs4IvJx5NDuoo/78QL3E+F5/yxX2aDFtIE9oxZSZpKE?=
 =?us-ascii?Q?3a7YOE5weN6H/iTKF/0KSLQOz+D8yOpTaEoBXu8dPms6d0de/PSDS3f2MwAM?=
 =?us-ascii?Q?FUFFBa6zswAfQWVq0nVW/oXXcJIClcQ/uXbLkHhx9lD7nSxwBqJ5PcASTa1C?=
 =?us-ascii?Q?nG9SuhN9kClfR0ftkfDIvSdGin6lvLe5/yhLGg9jVVF/XzrkSb64gQ0+29En?=
 =?us-ascii?Q?uaoivRJeZjJsbQRlVvR10cpC?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d4a0e74-485c-4fbc-4516-08d97834c519
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2021 10:37:09.1255
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9aN1TFc7eodKTabn6mrkam7ojk3le+uSY+tBJCpvFmzgpdTm6FoFcNj5pbvGH4/Vtm/d1lp0CGoCwr2JWnJ6pkBmxWTPsnLPh3/TZ2t2VbE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB1488
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10107 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 adultscore=0 suspectscore=0
 phishscore=0 mlxlogscore=999 malwarescore=0 mlxscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2109030001
 definitions=main-2109150068
X-Proofpoint-ORIG-GUID: 3q73oVylusW3wmik5BZe524nZDA9KrMb
X-Proofpoint-GUID: 3q73oVylusW3wmik5BZe524nZDA9KrMb
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This is writing to the first 1 - 3 bytes of "len" and then writing all
four bytes to musb_writel().  The last byte is always going to be
garbage.  Zero out the last bytes instead.

Fixes: 550a7375fe72 ("USB: Add MUSB and TUSB support")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/usb/musb/tusb6010.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/musb/tusb6010.c b/drivers/usb/musb/tusb6010.c
index c42937692207..c510fb84faa6 100644
--- a/drivers/usb/musb/tusb6010.c
+++ b/drivers/usb/musb/tusb6010.c
@@ -190,6 +190,7 @@ tusb_fifo_write_unaligned(void __iomem *fifo, const u8 *buf, u16 len)
 	}
 	if (len > 0) {
 		/* Write the rest 1 - 3 bytes to FIFO */
+		len = 0;
 		memcpy(&val, buf, len);
 		musb_writel(fifo, 0, val);
 	}
-- 
2.20.1

