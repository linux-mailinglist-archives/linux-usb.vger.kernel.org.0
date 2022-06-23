Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9B04A5573D5
	for <lists+linux-usb@lfdr.de>; Thu, 23 Jun 2022 09:22:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230146AbiFWHW5 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 23 Jun 2022 03:22:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229476AbiFWHW4 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 23 Jun 2022 03:22:56 -0400
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34F9EE7B;
        Thu, 23 Jun 2022 00:22:55 -0700 (PDT)
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25N6fvcJ009498;
        Thu, 23 Jun 2022 07:22:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2021-07-09;
 bh=uLE4SEmvVnCI9NpwFv2JIULw0NVO5i3oDjVK4hOf9D4=;
 b=aInaTu5vu0uMwoWGQOA9c9REHfkJq/1ToSj9d20evMyfTZ3D7khIbRyPZER8kUCIBuhY
 VjFTfOQfSa0+ubIv7eJS7PK3Yx23HhBfdgUogSPQm5PMDlUCCQt6e7oOgIJ4Nlo6FiSR
 rj7ue41jut+KszDXq+sf29TLv8ldUfYxMeGRt+P4s9XLE3qA6h80yMiiMgKFaQ1VxnfP
 bff4yaCmW8Dr92fH9YzUWNocjfU0nE9O6v4vxBAmk9o9jNl4Sd46bUVtVeuqhhWABgoJ
 ugybzRhRaVKBmblfPPRcldYHI8Y97lIcGpVt0NRdHkMhmkvKDaa3DnzD1Q58CjRJiB37 9Q== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
        by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3gs5g22efu-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 23 Jun 2022 07:22:38 +0000
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
        by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2) with SMTP id 25N7G2jv017371;
        Thu, 23 Jun 2022 07:22:38 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2173.outbound.protection.outlook.com [104.47.55.173])
        by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id 3gtkfwcmhr-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 23 Jun 2022 07:22:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XsghGjFfnfrrcIDQHpDtPapmpINzHTT1UxhR5wjSrlPgNNSQAMt2Gt4OT7KZCMUJftQpsVDCx6EpCxa8Nhfdvgn/UiAMkh86DwRsWLzxoD3GaSaE76N9/WZn62ZILou9NgeWm9uMlKTyIuBBEHc7Tm/CQ1a/hoPiyNNJTIgFmr3cvU38VLSbnaSJc1TNjlrG4J1IgdIX3Tc6oOGj+6+6K8fCmPidua9jXMsbx3mFXhv/URtJOzK/D+2Z4Yug7B7nCWLwZBjsfL1ViYAJlL+GbKnVAxRU+V4IevuN1k6y64F8RDB7wzlYRTNHCpqz0QDYSSXrhiAUREHHvT2hO/h5Aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uLE4SEmvVnCI9NpwFv2JIULw0NVO5i3oDjVK4hOf9D4=;
 b=U7zXc0hydGXYmnBnHOywMv6VVizu9IY6PTsR++wayI34b8XtC2G3sjfyJNeEouIyRQYZK1i0Jt/s6wcmQQjoiwmduH1V+3a8dyLzUh+n2i26mNUtG5ENNwHNyHrt/8a1he0Rpv1v3ffVole2ADnfUQcbAq3MqCxhosSIWzLj0WlI+3zZz9MDLNvdGB8xMYGFwQ8UoR3gioWvVXyLwioIYOc25oHyrsG0/7yP9mwGdUVOqsVJPuIoSAPerf3HnTaycVUET9skYupNd0h7KIZ5a6gDPPd4A/F28Ac8rWbNN1TD7BBhr5Gl3k20A+Sk8f0smhSo/YyENW9tqKOqOPQ/oA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uLE4SEmvVnCI9NpwFv2JIULw0NVO5i3oDjVK4hOf9D4=;
 b=OcK8jHcECeWc2fJCp2MCBoN1wEEfDQWv7kYQ5OPBpnv4T/Eb7v8+QYoINLBrqQf1XkuxMVT5GRjxGIa71XmR/jvlJKVTaMQFu5bmSjEJBQj8IAdYgn1126IXDHlZyl39gpqzJvEfBXTxvRy21lat+KrCsVlD3KWmvha/FXRT+C0=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by CH2PR10MB3911.namprd10.prod.outlook.com
 (2603:10b6:610:10::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.15; Thu, 23 Jun
 2022 07:22:36 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5020:9b82:5917:40b]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5020:9b82:5917:40b%6]) with mapi id 15.20.5373.015; Thu, 23 Jun 2022
 07:22:36 +0000
Date:   Thu, 23 Jun 2022 10:22:16 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Neal Liu <neal_liu@aspeedtech.com>
Cc:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>,
        "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>
Subject: Re: [PATCH] usb: gadget: aspeed_udc: fix handling of tx_len == 0
Message-ID: <20220623072216.GQ16517@kadam>
References: <YrMsU9HvdBm5YrRH@kili>
 <HK0PR06MB32023259EBD6B4C649C62E8280B59@HK0PR06MB3202.apcprd06.prod.outlook.com>
 <20220623064320.GN16517@kadam>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220623064320.GN16517@kadam>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: JNAP275CA0066.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:4f::10)
 To MWHPR1001MB2365.namprd10.prod.outlook.com (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6e8176e3-30f3-4fc0-70a7-08da54e925ac
X-MS-TrafficTypeDiagnostic: CH2PR10MB3911:EE_
X-Microsoft-Antispam-PRVS: <CH2PR10MB3911C30F2AC4942EC119FB098EB59@CH2PR10MB3911.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CAKxCfILnTgSG9lb3Tr7cYMXMPYEkJCaLsSaNq7Q1Wj6MuMO8NhamzHExnhDg3oZ+AR2/Vy+UR2bi3NuTpl3Gm5F0HMNzCiQenLZAynbOLtR/9dWh7e81GWY5UJI5Uq8OtptqDr88NwTNgTTB7tb27CnQiDnK0nuRRi6+9AOLIpTs91ODURp2j0Dh6S/a0VfmME3deuu9w13+CVYYVJtU9sLVe/OrYSlc8c5kPIfx7DEIsIhTBM2XHRCg82XG3nbN6TNY1fHCLmLrUn+TdMtbGDdkbqd38zDQ5vOeEUKMQgkDRZLIcGQ2dwX5+usH92AqFZ1fO06oc845BYVll4dbj6oniCSToHpa04wtxT+tDdUbWRix0gsWHXJ3ry8OG2LCXS9Mu52XcHoBHxDkhWhPgUdox6p9TP8wgYCYEv3C2gMgf60vzBUIVvPk3UbLEBsalhUiAVmYO9yeUjMQXd93X+HSinr86fOdsBV4Ysx/y0sPfwgSTHDp/bQf2Z6/tyVQmLt+860I0RCmre/3mIbK+LskNxXsB7CiI6pXzqWumzoP4LETlSzo6M/CdDSxZUeUONIn5CvYoyQmh/kc+0bxYaNto1ApBmaqsTqOAcRddiabNKB9BX9am/y4AGSXr1h5fXBU+g5V8/0d45HVBlvsk3dtWDS5QkipRHPaGxNh5sdF1P5v6rl51K+XZh6T9MbqwdG9NB2CgIUvx296a6Jv3aXWEhFzOL/5Kp/D6+qTgeGm16mBX4bevNipJh5s+4R
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(7916004)(396003)(376002)(39860400002)(366004)(136003)(346002)(6486002)(9686003)(6512007)(6666004)(26005)(5660300002)(33656002)(6506007)(8936002)(2906002)(4744005)(478600001)(44832011)(83380400001)(52116002)(41300700001)(33716001)(38100700002)(1076003)(316002)(186003)(4326008)(8676002)(54906003)(38350700002)(66476007)(66556008)(6916009)(66946007)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?XN/he0lmKHJI5Tak9sxQ3zxdafuomOhrYcG7CvSflX6nH0b0AR7szhMhuEnL?=
 =?us-ascii?Q?Dj5aKGnNw1V7qw7ztGWpPUc1dPa74zxt+j0bDWTGDuF7COPBSiIsmRNp6014?=
 =?us-ascii?Q?Gz57gT4V5vyv/uOxegeklvxKldy4N7D9jE3X5tOmJBSFz37TM/y7QtppAJg9?=
 =?us-ascii?Q?o52cHI4z9oIcdVq54mxpexNv0z7Wx2Jf6hNz+rYRw4GQJJz8gtAEsOe+zB6R?=
 =?us-ascii?Q?xdTqbkx1Xtbxw71bSD4KZ2GCvpLZWpTSjGgsgQxiiJYyWeUu2dIrrowO4bRq?=
 =?us-ascii?Q?Egvij/8bos+noHhv1EgVgMh9qRVvY+mTTCGI9Q3OyjXv0V5XikSrCYo6QJrr?=
 =?us-ascii?Q?efmHTIl8c4Fc6p0UFySppZP4b9K8y8LH4SKGeBYm2aZsfGJWxNPSmauB2lUP?=
 =?us-ascii?Q?wEgQZMNPu2719qVmwLSUwQKsJouGYM5exbB2qiqL3fkPNCQXAtTF+9xAC48E?=
 =?us-ascii?Q?x73AGjXIwWErAh3NRRI0nkACsWBLnfUMBSO8lE0wGkrw+z+DDnH9GAn4ziQe?=
 =?us-ascii?Q?57K32fiMk6eUfclwS2cWO4v0rLiNndDCu9ctIFeUadX/mPjJdtZa6oA7zp8C?=
 =?us-ascii?Q?ATS2gH2gwcZJLHbzMByL5dWzDNmGZJN59D+vFPUd+AnDEFOxOSYPtMRTjsQt?=
 =?us-ascii?Q?0AiRh+foveexgf3BY5dCsM4c0iwHUnsHNTeBmhO89zXRfuN050FQpNcE1qMD?=
 =?us-ascii?Q?G+wagFXyQHdal4QNFj0A0wNcGMnUKElvX45aVUr9GR5XXeRzc/lrot6KbycE?=
 =?us-ascii?Q?/hd/pGs5OtQhRfVcniEPCimnj2RjBm246Sf3jj74zOe4tJmCVGERjIuhiWq4?=
 =?us-ascii?Q?FY5qaOk/PbmXMOR0UixB0rFvs4bgbTdDjxvboIgtPy528Fm94VvfLvjsdTYb?=
 =?us-ascii?Q?QVekbvtHwIYZ8oDxqyIYr2+nLpRBOdY0qmQjL8OCvVJsXeUcF1mlYljyUeAh?=
 =?us-ascii?Q?Y97ZCGWFcYI+2sejiGn6a1O9PDpvCPRV/X8g1a+EYWmwP0jk/82sWqTy6eza?=
 =?us-ascii?Q?kj8dyruFNq4NblDnElPM0h4IsJtUFP//3++8CnyWLi/+d9DLgnUC2fNZ4ze9?=
 =?us-ascii?Q?e1CNlGvE3JZi2MNCwFnGaxvknsQTGrmwkfX3vH76eR0OZs/9Az2UQwQ7kuiR?=
 =?us-ascii?Q?VSjZtpAguBxiXsCcdNVroxTkL0ycgAAGZrJK5jDwsniBHXOX40dFAeWNjOoY?=
 =?us-ascii?Q?gby51J9ApZhy2WnIAEs1KqjRAGy6p8XDk481tYhPrEdN/QPhKtFFyd84SDH0?=
 =?us-ascii?Q?awockiUPTcYrovxyLJ2j7Y2JmOnzjrU9QdGygAYD21uhnPAgJZXOzxzCzWgH?=
 =?us-ascii?Q?sx7uYC+kL7pMhMItH2mY5//pr+BwBW+vxzskKinqiH6JP6UWI4fNVydIvqcY?=
 =?us-ascii?Q?QNDK7ytoZ34zQHfNIc3pDyGJrejnwCa+AOgjqAORsZiYZYRu5gj9LbFtySrc?=
 =?us-ascii?Q?vhT8K4wEJYyX5nX/S8+mC38JPuX1KssWw2qE+gIIknyAscT7ZVFzYOGfU1hY?=
 =?us-ascii?Q?qC6GadaQzuF/csBCXCljylxExaF9xnXWrRlfLxI//lVSAeKw3+/UY2b+E3w3?=
 =?us-ascii?Q?VaNoHIDntJPQpa4wCuxo1HqxA2vIcyrfnggrtVfNCdF14qLRNIDXZNkKzvXe?=
 =?us-ascii?Q?CQ=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e8176e3-30f3-4fc0-70a7-08da54e925ac
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2022 07:22:36.4548
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kueVZSt7HCEwIICEzOUiemkqkAZ6FgwdZSKhUABJMQ+08hnOP+hxVExlsUQNJ5oFMOUnurw920Z7mkvULnHpvH0zeT68DDf1+LGwgk4KYDU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR10MB3911
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.517,18.0.883
 definitions=2022-06-23_03:2022-06-22,2022-06-23 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 malwarescore=0
 mlxlogscore=652 suspectscore=0 adultscore=0 phishscore=0 bulkscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206230028
X-Proofpoint-GUID: ShAFBx_4wIreuP03jYIZLEJlc1777xS4
X-Proofpoint-ORIG-GUID: ShAFBx_4wIreuP03jYIZLEJlc1777xS4
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Jun 23, 2022 at 09:43:20AM +0300, Dan Carpenter wrote:
> On Thu, Jun 23, 2022 at 01:41:49AM +0000, Neal Liu wrote:
> > > The bug is that we should still enter this loop if "tx_len" is zero.
> > > 
> > > After adding the "last" variable, then the "chunk >= 0" condition is no longer
> > > required but I left it for readability.
> > > 
> > 
> > Use either "chunk >=0" or "last".
> > I think the former is more simpler.
> 
> chunk >= 0 doesn't work.  last works but I think this way is more
> readable.

Fine, I can remove the chunk >= 0.  But you can see why your idea of
removing the "last" doesn't work, right?  I mean maybe it does work and
there was a bug in the original code?  Could you please look at that so
we're for sure writing correct code?

regards,
dan carpenter
