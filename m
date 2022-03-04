Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 480454CCF1E
	for <lists+linux-usb@lfdr.de>; Fri,  4 Mar 2022 08:35:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238812AbiCDHgP (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 4 Mar 2022 02:36:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234347AbiCDHgO (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 4 Mar 2022 02:36:14 -0500
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31EE7A2F29;
        Thu,  3 Mar 2022 23:35:25 -0800 (PST)
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 2246kJ0D028284;
        Fri, 4 Mar 2022 07:35:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=jNkRvSQquD7og9k7D/q2DwzlT13nEiGj/4zinlUziWE=;
 b=iUqYe05aukx0nq4khEQEetjOlXzbApNSXvDFkv19JXH1NenYO+cnEMCVxPR7EKG5HKNi
 dAE1deKnz/WoO38Hqh3TAmNFAdZf8ijVS/u7N32EM6y/QzYJeU/OuxSRct00UnDc4553
 S0984o7pReJMAIBikrDjQ9Fs1oBa8PBYjeZwtl5ydv6sOuWAXJZV4/ZW6I6X2mOOKXDj
 yCOE42CRJHmMK63uzBf+1q56qy+/6ggnhFMWIdj5nzD71SsX5SSIh9lI/bwX6tboUrV3
 Xren3u9F0LcjBNFHZGkZh+mXrndG6w4uvqEiFeivtZbTIgQzXoOafhdhKtoy6ejp8llX 6w== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by mx0b-00069f02.pphosted.com with ESMTP id 3ek4hw122x-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 04 Mar 2022 07:35:21 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 2247H8TM091798;
        Fri, 4 Mar 2022 07:35:20 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2170.outbound.protection.outlook.com [104.47.59.170])
        by aserp3020.oracle.com with ESMTP id 3ek4j8jffr-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 04 Mar 2022 07:35:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mrUBiThixmB735PK2INjXJvfPtkQpnswmy4kw4PhpSRgq19ElMHyNWwCg9ls3CNpVymTmW0QN+CRPjC5W9JTTBq3BcYtiq704Q0OpF8CiJn1+VTRq6JuS7lvejykUz0+IO2gVdaZT3BboWk2ywAIITRFfrkkSxhEKqV/qBdEUsbqXYWIsm5Ly98DhFCd4feyDdUr2cxAVSj8AmwlpazQiQPcVlSPmbBSJ3KOf3VWs8w3qu7d2XYU4uuB/AMIybfl3qwXml4fm0T2sfcxICqZ9u8ovNQcqYrTw7GeWy+TxGQZ5gAthZ2Mk/G7Y0KetvQCluna0oMIPKmVnuzcJ0FjFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jNkRvSQquD7og9k7D/q2DwzlT13nEiGj/4zinlUziWE=;
 b=ebmFhn0hY/0VOUIzDDCpugTQeqv0PQxLsa0LC/xvXi0nXV8yWYmITZymFN8wrkcS3SvxgJbKjfU83naNkpQJFSuHp1VSPik5JxYL6tUEAfI/DhF5PJjCKWR+Du9f9q2c1AY4+xh3tiSEahWKXME38hEtayyky/Do0Vs9SiIoY02b22f6fU+4P8G4pGo6+S4KIIPfN9y0VcHXZsXCHefkCvus6aXPToZw3coMBXWAQ/XhJiW6aQIahvJf+X+5puP5ZuctwSRUlmfvQUFhAvHkaB2dD3vS0/rk2x7XdwpLu4R7XN7IWE2Ucbb1p0pq/QPKmYLf1S+TekYI95es4YQUwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jNkRvSQquD7og9k7D/q2DwzlT13nEiGj/4zinlUziWE=;
 b=pwBxrt4uOX5eakTvaJWRmzh8tdjj+JUsJ1QEWJ/IKyjldBK4ZMlJnfpugj5BhDkJUW7ZnT19uFp2slkEIA5wMBw41MRlAx27f0uehJI53bj0XcrGRLcX2vNiCme/T9BPK6QHDlH80n0o4c1JGEXWpXQ20B6HnsGlVTTFiJMSFvk=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by BN6PR10MB1729.namprd10.prod.outlook.com
 (2603:10b6:405:a::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Fri, 4 Mar
 2022 07:35:18 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::2c3d:92b5:42b3:c1c5]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::2c3d:92b5:42b3:c1c5%4]) with mapi id 15.20.5017.027; Fri, 4 Mar 2022
 07:35:18 +0000
Date:   Fri, 4 Mar 2022 10:35:04 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Adam Cozzette <acozzette@cs.hmc.edu>,
        linux-usb@vger.kernel.org, usb-storage@lists.one-eyed-alien.net,
        kernel-janitors@vger.kernel.org
Subject: [PATCH] USB: storage: ums-realtek: fix error code in
 rts51x_read_mem()
Message-ID: <20220304073504.GA26464@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: ZR0P278CA0118.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:20::15) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cda77c8c-6ff4-4ef8-1f2f-08d9fdb1881a
X-MS-TrafficTypeDiagnostic: BN6PR10MB1729:EE_
X-Microsoft-Antispam-PRVS: <BN6PR10MB1729A49E0BE8CF3043FCDD958E059@BN6PR10MB1729.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Wog+7CHff5Dt+YfnzCGp3urEr5Nvd/RO7EKWMfmpjcvbwQAHaLVrJfP09My4Tz7syoo2fV5BxYku/fTeNiZDqonCki9ZpBtVVtMjjbGKiNkwGKOR4pe7JWP6oe2FwpmTC4wsEli1LNmE4RXwLcmWSA7sTLh6IcGnnStf3Jd+aZtfArTpCtry9wUtBiK/9Gao/hv37yNDCh+8V9s2/jzW0UiopaLj44YkVyY1hxFAHbnz/ViBvSFWHyKmde6YdY8Z7fnWksEGhzzrswmW4s4kRK43kJ7/X4woLGzW+3+nnNV3oO7ElKGDjNEtwtyhtmEz0TMVitO/bLlhJwmjj7qukx4Sbhb65IcpKS+fv4MAcLZzhUFiBbJ1G6vGscYmcVVTxVtpvKj8qPALzpcMIOgUUQOKMipItDmplCm31THQ8VUA5QRk1PcVDyIU8Cd8Yu2mEhavgRhEXdEDrt/T3JVb8/VnVxP0ommNYYimlte9knLOGUp9E45lx/LFsH4nTPgBtc7GNpfsXDZSlT8P2qDRipULYk6SU0yCcyQtFPYWcJGkY2STX9ENTuET2cmMrDOd3USAZVrJDNLEfp4Ee3BzKup6MXVzWey+HwjrbRQN9+Eii1N3zybhLMDRCKQYVvrv5XR4a5yP0B527Tq82F9XfOi67xzsIrk+HnSdi2RWfM3D1l/WVN2u32Le4A+nRPSrO+gCLEtxpeljKkxQIJMpIw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(366004)(33716001)(2906002)(38350700002)(38100700002)(86362001)(54906003)(52116002)(6512007)(316002)(6486002)(4326008)(508600001)(9686003)(6916009)(6666004)(186003)(6506007)(1076003)(26005)(66476007)(66946007)(66556008)(8676002)(4744005)(5660300002)(44832011)(8936002)(33656002)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9ObJKeMgGPbi49hBWtGUCgZVRp2OiaTk76HpercjeqKRLuN8jDlAzAgDk/5q?=
 =?us-ascii?Q?lKZVKWkN3YjhzaYKySa8gCt0/HC7/cL6U0PH7vketXXBRN7gA8DPQDxNzQn0?=
 =?us-ascii?Q?g2p8ji49udbnnGuSzR8kB6HOiRiP3pnEomSu7/q/EawVqq6j+h6JASHK+bRG?=
 =?us-ascii?Q?ldkyU4ZVWjLYiIno36fD1arWHs+r7WRyXQEthQBILHjilcecQd9/bLje5NJt?=
 =?us-ascii?Q?NTVT1WJC8HFQSGEmQsnnL6n0Fl8tQzk8B+CDpm878biEEjdNNZvQHeGafpAC?=
 =?us-ascii?Q?5lvAIH4ITl/SiKM/0OgvfCDKOZPaidYlgCyG3gYyfwZWCzSESrJh5L7gwVgj?=
 =?us-ascii?Q?SjXdlFnND2ZuCZvRyPX1w/NdYmKAIuZ7sf39qOSJ7tcyUIYWM2avp/9U7iuS?=
 =?us-ascii?Q?3dgpIeOh+kmQ1cYueagW/JV7Q6MUEj9UpxkQBLkXF8FQpMU9nVcbL9mlJbZ8?=
 =?us-ascii?Q?i9xC0ZYYzBknRElQU+orumS67kJYPPdpf/LtFmRq0d+zdoppsBnTtZGMebMt?=
 =?us-ascii?Q?df2tPm7UM3anplH0UWf8JG2W3UmK7QMVhakIgVyqVW9OYUExs3NMwhxwPiHO?=
 =?us-ascii?Q?kK7BvLT2r7qC/WTEYT9zNHpMcPgWfjVcmLbtHZ00OTbfj2Z2wZ+ZeoRa9utU?=
 =?us-ascii?Q?bPb8VwbzaKSAJnV5iPJ689ooDvWTEH0AyR2OoVLoKfKrlAqoaAkfRIcSmXgZ?=
 =?us-ascii?Q?Swna89ZsXtY87eKdyDQg0wGqA1ntYiiXWItCa0sjsO4I8L4fGZOD2YHtyC/n?=
 =?us-ascii?Q?fEr3pzXA+2B4vDUJ8rqCfqdtFwpZP29RWVRt8fb6LuR7GUp7lMorIfsPO6U0?=
 =?us-ascii?Q?sS06bH++tNGDTmNXvgF+JedHv6VKi+i4bAwbGa1CCctqWKMmf2PGcs0ad1xQ?=
 =?us-ascii?Q?4lmmrweQvOtK3u57KTn//E/pGlKocekUuE7D3ts3VZZISZUGbWYjpK4//IXo?=
 =?us-ascii?Q?vx9QXrBksNR2ZDJrUEMwZSl0rlIGHyQIj+C7HtISQJ0O2sKrGQGfNlNhlmHb?=
 =?us-ascii?Q?JKsraDU+eiOS/Zg2WambY08OSUDehZX0QRtrhBdFIbXvEQKQrISdFHlcGaMe?=
 =?us-ascii?Q?eVOyozFP84CcPr4aplmb+mGadS88K4DpsZlLll2n0/QaEMlNg/bovtB9PsOx?=
 =?us-ascii?Q?eA9opKaW58vsgbvdc83riS7AYdpi6C4G6G0w+h7i32Fni5uVgoX/FR9iiPSt?=
 =?us-ascii?Q?06ACeH1O8ivdE2gENXtNikKBUHXW07v4PCl0hFsW3l6pDP0+BIIIG60MScmG?=
 =?us-ascii?Q?pMa9DOJF2rldZ//u94lSEulAWaLhmX8TnmlnFePJ40iaFg76SwtJj/4RvYtH?=
 =?us-ascii?Q?t4fd4nQdDaOLGEVnEh7I21OVCerssk5PgKItXjeGtIsQCzGM1BGWTu/I32k4?=
 =?us-ascii?Q?zBDWNb5ZP1sM5JJYgyz9psHK71Jbpzse/gdZjLDDNkEFvM0CbFBUI9oDtIqW?=
 =?us-ascii?Q?hWrdjZS7QKsqbNwePXynwYLBfDq6OJDnRvzv0neju5BADN3/scsgsMbdH6Zy?=
 =?us-ascii?Q?gLj74lDCVMfGHoL5zeaIv+eOXTJ03sutmD5R/vycKmtsuvM9KbC6kaRWXqb3?=
 =?us-ascii?Q?RooMy3fQ6YObHINSaMsbYkHDhvXfNWnQNMOVAV4UEbKJVK2xgN+YPl0wBLMk?=
 =?us-ascii?Q?L/vVv5pK5SPfA6ogGxev5y/2PAFMDgfkCAUDnbH88kzxZAgAn8dFAB0+qY/J?=
 =?us-ascii?Q?vO9bvw=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cda77c8c-6ff4-4ef8-1f2f-08d9fdb1881a
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2022 07:35:18.6275
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gj4vR/Xa1WV3AbK7dwGNSNfTJkolGm7Qjo4Lf0JWoYUtulNFKr9Xda8LAEQbGKEyFI6HF35dPa2bvuhqmCS0fwh6ehIiCQYi8+SURRyxFs4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR10MB1729
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10275 signatures=686983
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 phishscore=0 bulkscore=0
 malwarescore=0 mlxscore=0 spamscore=0 suspectscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2203040037
X-Proofpoint-ORIG-GUID: 2XeUPI1qq8oXfSZD-eqnuzZqFtcuj02m
X-Proofpoint-GUID: 2XeUPI1qq8oXfSZD-eqnuzZqFtcuj02m
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The rts51x_read_mem() function should return negative error codes.
Currently if the kmalloc() fails it returns USB_STOR_TRANSPORT_ERROR (3)
which is treated as success by the callers.

Fixes: 065e60964e29 ("ums_realtek: do not use stack memory for DMA")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/usb/storage/realtek_cr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/storage/realtek_cr.c b/drivers/usb/storage/realtek_cr.c
index 3789698d9d3c..0c423916d7bf 100644
--- a/drivers/usb/storage/realtek_cr.c
+++ b/drivers/usb/storage/realtek_cr.c
@@ -365,7 +365,7 @@ static int rts51x_read_mem(struct us_data *us, u16 addr, u8 *data, u16 len)
 
 	buf = kmalloc(len, GFP_NOIO);
 	if (buf == NULL)
-		return USB_STOR_TRANSPORT_ERROR;
+		return -ENOMEM;
 
 	usb_stor_dbg(us, "addr = 0x%x, len = %d\n", addr, len);
 
-- 
2.20.1

