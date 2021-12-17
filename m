Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 94C9B478566
	for <lists+linux-usb@lfdr.de>; Fri, 17 Dec 2021 08:08:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233552AbhLQHIm (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 17 Dec 2021 02:08:42 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:4492 "EHLO
        mx0b-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229503AbhLQHIl (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 17 Dec 2021 02:08:41 -0500
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BH2NZqZ031685;
        Fri, 17 Dec 2021 07:08:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=s48VS4EhBCH5ceKQirgM7yz4aUmKGSkXniX3U61gxcU=;
 b=J4aNviNnNZ8HwF/v1Qv7eklxSvCBcuzDCUbxkrhVPefco2hG/9W1j1OQIb9M8gKdutQL
 T5SfDtfLMZHbmltVojwgYPdJDT++RUlWs+HG0hyUnwu4qVGXPm3dD0VqMlcjOd//guab
 neqzgn57y06IOZptWme4gspLV1eqh2E7B3Vp2EgNjHpkrBjd5sDD+/4rq4SlREm/3R5j
 KkQyIQdoSVhRMe5rpXsCaWWlfvkO4cmCi28gp9aHyHBgBAiTEZUoAm3o9mcsUGJlukos
 LKNb412KJgY8NgKEDgfK9SMBfaPc0Nj4fGpDJ8jXPSYKyrSpr8qRt2U9gkYTRuAYpXeP SQ== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by mx0b-00069f02.pphosted.com with ESMTP id 3cykmbmyy0-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 17 Dec 2021 07:08:38 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1BH76FEM080007;
        Fri, 17 Dec 2021 07:08:37 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2175.outbound.protection.outlook.com [104.47.58.175])
        by aserp3030.oracle.com with ESMTP id 3cyjub34tw-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 17 Dec 2021 07:08:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GeIG7m46Iv2YIO2a0T/Qaxi4xD34XYT/DIEzoSqLLwzz/6hs87rjZkVtE2uJ7SS4vUZ3gfqzC0qs6tjFGjldOnzRMajs7YYCB0+nje7/XNHlJtiTjA55QBu+jWBAwRsNeJf8596WPf0BtmBV2rmRe+53ZIfMX92YF/7mo8GzSTFYIG0ZJwmZi2/HIWJylGqjvH2lck355ty1ox9VtFrLyenwxEjluhv/zDGBoXTyVx+dEzib5JhvWZWkZfzVADSRFzMbU6GlFVYnP+/VEzPbpJ0D5xxaDsxs0nqZ5G2heLnHQ6oiv0zpNfpZQ0Y+tIbvQDphWpgS9GofdF/VPeD7qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s48VS4EhBCH5ceKQirgM7yz4aUmKGSkXniX3U61gxcU=;
 b=Wni7aPyBqtBJiANS2M5+bGD4DVv4XNtpWrz6dTKUzjWCXR2T0cEiAzBTESvJ1M+R8EtiEozOedlXOBDbw8xoi+Sx0YkV40kDxXNosZrAVyaW5aWJ8hmStz5vMseYUHZivKCLpQL2cDsxmMPaYWZTBhkhYXCYNZerxCnYFXd6PiIROqKlctnZDYagtigKUtfeB5x6aaWEVOdFUyWdoXlTc0flA874Joe0D1bLbdZVPeC1zcS/8H2Ipiv03ASGs69d5Z5GIwE9jFLZMNUsLWP96+HaPZfTF6oYbWcf/pkQEjUvQo90MMhEHgwx3xPqJZITN4byUeu1R3MtjGxKwWBUag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s48VS4EhBCH5ceKQirgM7yz4aUmKGSkXniX3U61gxcU=;
 b=uAmxAsChVEw0WOssDBZ7yE/3m2eYAiP4mpmegXigCjoh70DyQBJqoAhyvjs3YIE7hDWcrtcT7KgrFB0vDBjnxy0jfmIhH+mTHiSVLCZIZB5uAZA3jmJAaxkKRFB1QiZzuDqS2hM1GpJbwVYAFiy+71+bp8STRruGcuLNhVfd41I=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by MWHPR1001MB2367.namprd10.prod.outlook.com
 (2603:10b6:301:30::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.14; Fri, 17 Dec
 2021 07:08:35 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::7194:c377:36cc:d9f0]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::7194:c377:36cc:d9f0%6]) with mapi id 15.20.4801.016; Fri, 17 Dec 2021
 07:08:35 +0000
Date:   Fri, 17 Dec 2021 10:08:23 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Juergen Gross <jgross@suse.com>
Cc:     linux-usb@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] usb: xen-hcd: unlock on error paths
Message-ID: <20211217070823.GD26548@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: ZR0P278CA0117.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:20::14) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 19ad266e-f9d3-419c-5ff2-08d9c12c0ae9
X-MS-TrafficTypeDiagnostic: MWHPR1001MB2367:EE_
X-Microsoft-Antispam-PRVS: <MWHPR1001MB23672A5378FE26840D6CAE858E789@MWHPR1001MB2367.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:820;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Xw5VUcdvCwGEQBaitlr/4U1OFDLvnqDBHQtUPyWXPdH9hB1LEirAEbNiYccfLrc61LSGltKQ+UzJzfKYD0XtWD5fUE+Cz1WKdvxRsXOWrOUM26asVmtzmwTVK9QllzxN55B8iyQbnRS3Qpd5CbsXqll7LkZZ4QVaA6SpMcXWXrkKBfx9pARNHPTlrjafyF2q1Rnj32hvYwWRExw7CoWfrWPgoE6h01RJXDD8yQbATho4MdsVwOeyxFNP4cw+XHoMFyHgw+nsjEnlvw+dJZrotDFz92aroAm/Jh3prObv7MJ6svsWOIYWYEyVHrtpOKri501ugaK2l8PSN0veZhezcleXj9U3DHW9D76qS+3hwvofNTC6SJF3ci0J8yV1jT8NNtR6Ami/A1Geg1yNbViPqabX47vOhvlNw9BG87E8zxzyDYNn85oEGKSOd8BAYwrMu9Wt2krK4/8eQyEO2ls9ogv3ist+o0t4t9fYgRarwGt0GJfsFlTeyTQNTDjw5GsBcR8q8WuZx4RNckOrmLOJ4kuWIGQksoxk5yFmrZN0YCUlDKznfclzhG8MQGhXJ4NFDWz7ouToNXCGQUZmAYB70NyjakayO2CRVd8Kan1FuZ1cNjpDo57tzBXIjWX77YYn5PVpLJxrxI2SY0yL7wnGy2RU2qq7nGxKPv3FZmdHfbOrci6VuevsxQ67DGfhWk/vvpMIV3iwcpM8vlJGdefcOg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(366004)(33716001)(508600001)(6666004)(83380400001)(8936002)(66556008)(44832011)(2906002)(33656002)(66476007)(8676002)(66946007)(186003)(38350700002)(6506007)(316002)(38100700002)(26005)(6486002)(1076003)(52116002)(9686003)(6512007)(86362001)(5660300002)(4326008)(110136005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?QoE3zxIrhSrhGGCe+XcD9mgUZY/9HCJAGyGiFzqeSS2ifYSM+/PiMRE0RsBp?=
 =?us-ascii?Q?I3NMSoTs+rQraBb3nFgSg1zusvKJf6cM+F+6qTWGKSw9QjklmKrEkO7O0olH?=
 =?us-ascii?Q?vDToOIwLfTDoc/IL45e2MTzz1EP+MGWjunq/KnVDi9EcgnfrtL46a2Yudprq?=
 =?us-ascii?Q?MWZS9jYeB3SjdKF0d1JMHlXaUbWv1gYx5PDge0n88tX2mQIOxmfLAVG2NiSd?=
 =?us-ascii?Q?9PBuVQE8AlyXmMjLHis5C7ozezGjC/h9liWbXV5HzQNrccZtFbdOBuRRl6ml?=
 =?us-ascii?Q?z6HBrrja45Gf7nr7b9h3vjc24oSgb559niBIFyOtdNp3KBdjcCO8AecDlS7P?=
 =?us-ascii?Q?xQPMhAu5UFPe1UYmTVUxok85PvaZlpl9PLsz2zrLjsuCkJCyc2s7O1OS15Kt?=
 =?us-ascii?Q?0Ku/2XZUb8FzQOq8E7cb7ag0Oh9K7ST250hZw4nQsQssKckxozWnICKbiTg6?=
 =?us-ascii?Q?MH52/5vqbb61RgnTqDYoPUbAIfPrheoHb9IHpPSICuhqq5Cm5qwITzDGsn0r?=
 =?us-ascii?Q?Ye8uuV6+oeGe9Mwpg4WhdCB9drQ+S/HMrmHxrpHiwLnZS0kF7f2AI1uqyAv2?=
 =?us-ascii?Q?X21bkjkz+a5SKu4YReMuLcv9hS3aM0zwrCaLwaGZKpyxKNspyrd0BhrYhUEm?=
 =?us-ascii?Q?e3obCuTo1QMYCvVmNSlke213ZCqZXG2hj26sNyTCeew8M9LmAnKfmIrlOcsr?=
 =?us-ascii?Q?2PIoQDPh3F7b8sQzyoqabxUOFKwocUp2mi11ti3Lhr6/pMG235Gffr4T1spX?=
 =?us-ascii?Q?8VAS4Zx4xHPnJZTmrWWWgiSAzaPvKzRNzT1vXUl5/jMpbJ00LBJdzd+7+T/j?=
 =?us-ascii?Q?6y5Rv5tEldHzQrWMoapD3LClpZRIiAnTq7fO8tVjW7/LfER0+L26QNY/4l3r?=
 =?us-ascii?Q?3xeZxeYSI6Ogc5iCvw5b1N9q0vvpDIxpcbOxVAEuVcb1drT/3iNvIzmiPDNn?=
 =?us-ascii?Q?WxqHoNzoJUhkyji3HabCxPjqE+kIA+Z1jqwFOM1LeOvAQaDKXt+gUniICZeD?=
 =?us-ascii?Q?VYK0Uiuy2ffH3ZAysBNKslZp9SlkdRY3ku9R84joWVeZgAUNBajjyWNU3Cru?=
 =?us-ascii?Q?KCbz6Clks5rv47qhrsRhjv2wF0B8Q1DgpFYtSeROR0FWHWYMzBhn7oY9fnGQ?=
 =?us-ascii?Q?s14pRTGn9jAsxNsPKd/LM+Lowstr8wVNhcyjYsie22r56vcubrVjXofRnEwx?=
 =?us-ascii?Q?hBcsjdz1n33ivNYAbAEl8Igqd3Hr8tS/QpXa+eVLtKgCV6XxjQoFVf4LTmyA?=
 =?us-ascii?Q?+8u6GorwQZKNkJ1Ygug6byWpxfup5SUboVfZhEPfjzLwWoyvHkmCt8/1KXMN?=
 =?us-ascii?Q?xHki7+LQdpKLNzvKDaBWrpEgH/LYVEZ49Ry11Y/JsWKR9uV93Q8xuUV2PCnY?=
 =?us-ascii?Q?S7aXFXFUGCP8DHh79pK4l9c6hdzIvNNMaXsEBbsQ2CH/FcZTHp0eaiKMyENM?=
 =?us-ascii?Q?F+Ksytf2PQBT3fhRs2UxqgRA0s2vKFwxgbxOFeh/H9CtLsXlkPW0+UmcISiP?=
 =?us-ascii?Q?AIMkO8hu6XDfJ+uEo/3gQLYTqPfOa1a87k3GatoybFQgQecyrCOwHNgDDFpS?=
 =?us-ascii?Q?FfR3FPDurdvuzHAHDuHnXnRh2tsPGjgjySl2Vpjijx7yRIgKRay4KmaVS+4Q?=
 =?us-ascii?Q?Cl9vAXRN2XpcFR802sBo4dboEwANmeETmRaAmJrWXeOlfCUWoBtPKy+qAq97?=
 =?us-ascii?Q?Q0TexKn//5SNeNCrFuAofO5Q64I=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 19ad266e-f9d3-419c-5ff2-08d9c12c0ae9
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2021 07:08:35.6943
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2+6lIakAP7MXCtbn9qMN4jjs6K3XE5rZdtAXgXUvuA5PKT755lLNUHzEywKXfAPrvzfsD2c/YFLwsBtzI+5iY9sO2Cja1c8AztDX/4xQJTY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1001MB2367
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10200 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=983 phishscore=0
 spamscore=0 mlxscore=0 adultscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112170039
X-Proofpoint-ORIG-GUID: Lv9NcMDfIyQVGX-wo2Y7nP7t7meROmAk
X-Proofpoint-GUID: Lv9NcMDfIyQVGX-wo2Y7nP7t7meROmAk
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

These error paths are missing unlocks so it will lead to a system
hang.

Fixes: 494ed3997d75 ("usb: Introduce Xen pvUSB frontend (xen hcd)")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/usb/host/xen-hcd.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/usb/host/xen-hcd.c b/drivers/usb/host/xen-hcd.c
index 7801dde6f5ee..81adb6be8ee9 100644
--- a/drivers/usb/host/xen-hcd.c
+++ b/drivers/usb/host/xen-hcd.c
@@ -941,6 +941,7 @@ static int xenhcd_urb_request_done(struct xenhcd_info *info)
 
 	rp = info->urb_ring.sring->rsp_prod;
 	if (RING_RESPONSE_PROD_OVERFLOW(&info->urb_ring, rp)) {
+		spin_unlock_irqrestore(&info->lock, flags);
 		xenhcd_set_error(info, "Illegal index on urb-ring");
 		return 0;
 	}
@@ -997,6 +998,7 @@ static int xenhcd_conn_notify(struct xenhcd_info *info)
 	rp = info->conn_ring.sring->rsp_prod;
 	if (RING_RESPONSE_PROD_OVERFLOW(&info->conn_ring, rp)) {
 		xenhcd_set_error(info, "Illegal index on conn-ring");
+		spin_unlock_irqrestore(&info->lock, flags);
 		return 0;
 	}
 	rmb(); /* ensure we see queued responses up to "rp" */
@@ -1010,6 +1012,7 @@ static int xenhcd_conn_notify(struct xenhcd_info *info)
 
 		if (xenhcd_rhport_connect(info, portnum, speed)) {
 			xenhcd_set_error(info, "Illegal data on conn-ring");
+			spin_unlock_irqrestore(&info->lock, flags);
 			return 0;
 		}
 
-- 
2.20.1

