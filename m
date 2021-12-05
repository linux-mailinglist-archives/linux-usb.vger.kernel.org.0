Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7883E468D05
	for <lists+linux-usb@lfdr.de>; Sun,  5 Dec 2021 20:37:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238081AbhLETkv (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 5 Dec 2021 14:40:51 -0500
Received: from mail-sh0chn02hn2200.outbound.protection.partner.outlook.cn ([139.219.146.200]:44192
        "EHLO CHN02-SH0-obe.outbound.protection.partner.outlook.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S237264AbhLETku (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sun, 5 Dec 2021 14:40:50 -0500
X-Greylist: delayed 1092 seconds by postgrey-1.27 at vger.kernel.org; Sun, 05 Dec 2021 14:40:50 EST
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TlSeFVS4LfAXSlPHES3C36jJkvcDgIlHQZpmUwAaX/bV2Vhq9ScB+lt6s2DbDs47/ZvbVn2dJkcgCthVtwBhFPPnbHN+8eMOJP5N88sTtAbsQ4Tn/iQb7udGxvd4oF8s5u4BjwV3E4K38vgz2K4nnz4MfdofRiL/LrTBMmv1G/1bjZbc/3rMZv/yjmcbGV+s8qXfCZlNCmDV8W0eQL0/ua8IYOScGi0VR9RdvX6cqX2ufSIXVQ0CgKYzUCFc2m2vzLhywsXW+gIezXKwx1itqKQ8DckRIF+8ehMkzZKiuVIhvEyfY++HgmW7Fx8sKNLwYCuP811A/ScNunDwO23ApA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DSonkB2zS8sj9xkWdxaeCB2HxuNTgj8h275vVu9a+0U=;
 b=b2Sbu82jQPEF+JZ/AMYxcWYthYwDE4H5g21DpmfDGW9ThtJoCbU2ld67W1a/rgH5NwdIxzdrldgUA58OYRwWzpnSYClX7oMdI0Intr29IhGXyVlPDRtcKg4Ui/MjoNjfEWCrYjr2ucAhviRnliXtMt2bpYWIv78mgFt8qPOtVJxaWUVCBrSmGEggdxxZrwlyRAGqVdXDoh/nhMxllJBPqSL85cACF3x0/xx0wl1u/IjV8Joq643GpTn2e28c9lId5Mj0CiYQLEpbYfEMS6zYF+85XkIc3kkZjyW92cAf7SJ3/8scaZFMoJ73WIdwiInl/VnUJg7XQdkBIZS9d3fGpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=gientech.com; dmarc=pass action=none header.from=gientech.com;
 dkim=pass header.d=gientech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=pactors.partner.onmschina.cn; s=selector1-pactors-partner-onmschina-cn;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DSonkB2zS8sj9xkWdxaeCB2HxuNTgj8h275vVu9a+0U=;
 b=IEIsmP4MvwA8vY2FPwS2UAterxylpRIUAOddP9seKvqotvejSZK9ziHhFO8Kp/Fddho6WTv+Vt/0XEq9jKpRvJf9iZrI63yaMRV/mJ+PI16WJipol93BwIBQTQ8qB9PuBY3wf30iX7toFamJE5C0BXMV7IbwZk4g+oBzBtntpjMp3V/DWBOJ5RIh7KhfYLwxN6kReigtwHJWV7xBv0kiGN1pjMP0eiDnXhs9IcJjkeV8NcR/vF+MFUSqiokq4E8SINUFQ2UA9xi1SPrVzLZQKqd+BzXIPbJl52mo+L53XwXrdogX9O3q03vn/b3kWWt65DDF2/rSB6+4IKMnNnKjeg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=gientech.com;
Received: from SHAPR01MB063.CHNPR01.prod.partner.outlook.cn (10.41.245.141) by
 SHAPR01MB175.CHNPR01.prod.partner.outlook.cn (10.41.246.149) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4755.20; Sun, 5 Dec 2021 19:03:49 +0000
Received: from SHAPR01MB063.CHNPR01.prod.partner.outlook.cn ([10.41.245.141])
 by SHAPR01MB063.CHNPR01.prod.partner.outlook.cn ([10.41.245.141]) with mapi
 id 15.20.4755.021; Sun, 5 Dec 2021 19:03:49 +0000
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Description: Mail message body
Subject: 50% for you
To:     Recipients <liwei.jia4@gientech.com>
From:   "Xinxin Wang" <liwei.jia4@gientech.com>
Date:   Sun, 05 Dec 2021 17:55:21 +0000
Reply-To: xinxwang800@gmail.com
X-ClientProxiedBy: SHAPR01CA038.CHNPR01.prod.partner.outlook.cn (10.41.244.45)
 To SHAPR01MB063.CHNPR01.prod.partner.outlook.cn (10.41.245.141)
Message-ID: <SHAPR01MB0636CF704B6F02FFDB66D8DAC6C9@SHAPR01MB063.CHNPR01.prod.partner.outlook.cn>
MIME-Version: 1.0
Received: from EC2AMAZ-2RHRJQG.eu-west-2.compute.internal (18.130.166.200) by SHAPR01CA038.CHNPR01.prod.partner.outlook.cn (10.41.244.45) with Microsoft SMTP Server (version=TLS1_0, cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.4755.20 via Frontend Transport; Sun, 5 Dec 2021 17:55:35 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0afcc043-6402-4d61-113b-08d9b81879c5
X-MS-TrafficTypeDiagnostic: SHAPR01MB175:
X-Microsoft-Antispam-PRVS: <SHAPR01MB1754ABAAA4D8160516514E7AC6C9@SHAPR01MB175.CHNPR01.prod.partner.outlook.cn>
X-MS-Oob-TLC-OOBClassifiers: OLM:1013;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?vpC48Q7YsmgXNuIVwRcvpcxpwLRDO/Yg5ylXPVmb+KCXPHn+cNb09iPa2g?=
 =?iso-8859-1?Q?YN8x8Coi4AkfJaaG8zv0NCrVKQzvuKR8QFT+i/mI8dVzsFZbhv/UIYx8S7?=
 =?iso-8859-1?Q?NGzQPJGbwViz8dwEioZ61K4ThlOFeHgxHRFkjYSo7elakXSffPJnLa6CsZ?=
 =?iso-8859-1?Q?hNCc3QK+B8t+Y9RdLgjmXB631heg+BA0yjWbTv2lP5wh43VsUi5nx4VLfn?=
 =?iso-8859-1?Q?OthYu5HognjTiMaiRPzH8gio93jXhTD6VCNtn3K2Ib5PO2DabxPSrwu/8F?=
 =?iso-8859-1?Q?0qe0hEzMPkEQAA0tV+lSAGhoeN3Oa/ZgSX80egAyUe7IxImLKxh7tIJGYI?=
 =?iso-8859-1?Q?jaDZIexhFUUAQIK7uu9tIY8XS49KAlagTO2OOj8XkVC0MGF/3MZJN+Oh7z?=
 =?iso-8859-1?Q?mOPEut4ibl1YuZuoawAHi1XdHmroin364mTN7hUzcQiKeJsXx9QqbYzkXh?=
 =?iso-8859-1?Q?B5pNAyfNFSulW+z2vwWIMrQ78BGNaHoKVxTW0KoeV6kGq6EAzNanihz538?=
 =?iso-8859-1?Q?PiyoQy8B3PAhnYvP0OwnZlPwV9ozTD8cb0Lz9BwGfJdxken3YvU52VjeG/?=
 =?iso-8859-1?Q?aUh3C8xXEAZ4KVrLY/+EM9px5nHWpGGBJjJYkzycXpw/L3sglavZCAsSta?=
 =?iso-8859-1?Q?pVrzPeMmOrTOE0ABJ+ThIHBkLq2kTVagNKmN0ZsBFYDY4n83FtRqfcr6ZF?=
 =?iso-8859-1?Q?aARHyX9c3KD4uuTrxCjb0LHqeKIa5185Iv4VXBsmN10WOC/3xdX3lapyRr?=
 =?iso-8859-1?Q?ljHIyO5HZ1pO6qhM4GWtqQs3VRB9aZ1WetH7J9UcWJo+NFTgPWrL3gZXLJ?=
 =?iso-8859-1?Q?dfuhTgEU7o0yqiXowIlFncRubrOdIYsaA1qR9LUGyoc5sXblgdAyCnhedP?=
 =?iso-8859-1?Q?6jaFOdtPZsx6y3flHrMPR53UqYTGs/shpezGK8sZoAPLz9s+DNQ7omhdMd?=
 =?iso-8859-1?Q?5JpOi4HMcWEPAHiNiIXC0MHZs5e9ChxgdBl5TNVo5gTh1JYByaWzCwEQrJ?=
 =?iso-8859-1?Q?ulNB0XD7hguOou02l2qFTLRxnLSJa8IczF7yLD4ZG1vdGdHQaUwjKvtsUC?=
 =?iso-8859-1?Q?+A=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:5;SRV:;IPV:NLI;SFV:SPM;H:SHAPR01MB063.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:OSPM;SFS:(13230001)(366004)(84040400005)(33656002)(508600001)(186003)(26005)(7406005)(2906002)(7416002)(956004)(38100700002)(6862004)(66556008)(66476007)(8676002)(7366002)(38350700002)(40180700001)(8936002)(7116003)(86362001)(558084003)(5660300002)(2860700004)(40160700002)(6666004)(6200100001)(52116002)(9686003)(66946007)(62346012);DIR:OUT;SFP:1501;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?YPDls3PyBaTLdR6H9V3X+21ME0OzvKhoK9ew5gbnAxjcxUZg14whQZzEQJ?=
 =?iso-8859-1?Q?mcMhoGyMAyNYSHmEM0+4E7/vI+9jmCLSJ1AlE8tSxP5APuxCFZfuXuJ9DH?=
 =?iso-8859-1?Q?IN2zhupzI/LN+cOIXQMefy/MV07q6vjQ+/0OXG8XgkrR3WnqfhqLiv8rIa?=
 =?iso-8859-1?Q?4jkgT5lg5Za9P5x7Zsa/so3Jspva0utZHkyNAgx7rTVkzoVB4K5UjStEAP?=
 =?iso-8859-1?Q?LNWz50ju6GVwtn2vFsZYLwfzxIoZP8mLYBpfgFxnsah2Dj8X6c+9PVcBOU?=
 =?iso-8859-1?Q?UpcCMcUP1knvabCLaSpUs31EqqM8e6Z9wUT2Fc9WrrTl6V+gY7S8JIRejf?=
 =?iso-8859-1?Q?8GBQ31Rgs0GMOStkyeAavkLgQMiPEpsCg8uDceH8O0B4lYC6hq4Nt8Wb6r?=
 =?iso-8859-1?Q?su6hyzULB8w+dwrYZZFx3KgWgPOvRUb5P6fvCQzj9LhOpHE6P0SOPNSGdu?=
 =?iso-8859-1?Q?wm5eyIXUhxsdvNVwrQZEyq+ox2G9nTweBdomC3/cW1HiCmmr9X+lZzQNZ3?=
 =?iso-8859-1?Q?OzzCaQglWbzYqvEKFqLA4vH0fmDfFoWJT5rt4GcIkS3sJByrL4epKwohqa?=
 =?iso-8859-1?Q?uEi7vPhawVJ86KD0OU3ZqIOdEpKVJCWC09oEJsrCfRYng9p9LbSJ8MrcZG?=
 =?iso-8859-1?Q?OQBgDOKPnq+4EOLTWfolrK0gpExH9Bzxr3uHlsHk6rmsHlgKSCPOV6tko2?=
 =?iso-8859-1?Q?Ov03dg30XFZ7aU8eikeskEgBkRzhpBcoLLY+xcjVIPYHyqirP4qKHUbE02?=
 =?iso-8859-1?Q?0mNbAofub6JTaXtKOqOI6XiVdj72mr95rwpJCL2Q/jH4SZcG98O0nPQbsj?=
 =?iso-8859-1?Q?v94yRvQjZqkzwyltKuljDX+BusCYN5x5Xf89V5n0FalTT2JBKTOxFDHSuN?=
 =?iso-8859-1?Q?wSz+mERaG6dpDkA6RXseXgcQUUtwCS4yLJCUutCiYevHYhOVkl1Cl/mUfO?=
 =?iso-8859-1?Q?nL+PIySBVj7r0TgpWXN5K+KQtjKnng7NiDqNXXDlrwutxVj9Nk6uO8tGHV?=
 =?iso-8859-1?Q?3YmdpE6OLc4oIesMUtFHI7vXnb2jTaG5GtE+e0IzEjRjTKXHFR5hx0Tvty?=
 =?iso-8859-1?Q?BxlXsUaGhXUfGJxqYgDISVLU+WsWGgz9JmqNtkgsm+HpsRr51c2bd3uV21?=
 =?iso-8859-1?Q?sai0PiKXY/2kZcLY/0OiKjtEpsfoO2mrOxMgGqTATW/jaMPtHCeRNuitEz?=
 =?iso-8859-1?Q?Tww1iT3b6TVbeLT4L+0pGcEO9TvCZvUkiBNFqDIKWrlbaSXI+rmLgByq3d?=
 =?iso-8859-1?Q?UXjlWXw9cWoqdYWNuGALCCbOHqKM39kfPNL0E8CMupyEOu0oRXQrj4kBam?=
 =?iso-8859-1?Q?7+Wruc4Q+yqCllpz0Kk5iZx7Ka24Bzv87i+uKbFQk13V6D7oLVtVA3Y0Pl?=
 =?iso-8859-1?Q?WepOJS6AeSTqecSN1kxrdvmKBp/aqx1WMZ4U9NQeV4fZqtoxtktv1K5x6g?=
 =?iso-8859-1?Q?cIH1cvp0/WWEPbH1tF8Qg0YpF8w1WITyPErnIssaFouR9M4lcvA+O/shcZ?=
 =?iso-8859-1?Q?MYZZVi7YOKMJMi2NeAK1/p/qV3aeU0s/9gwxpu2J1SKXaqP/DekcM8Q7Mp?=
 =?iso-8859-1?Q?ltrY6fkJno3mnWu571vTcCL/qthz7xeF/mKy7dzdnUpmOcgPnOcZqVLbUa?=
 =?iso-8859-1?Q?9yCzJA3G7zGkY=3D?=
X-OriginatorOrg: gientech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0afcc043-6402-4d61-113b-08d9b81879c5
X-MS-Exchange-CrossTenant-AuthSource: SHAPR01MB063.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2021 17:55:51.2769
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 89592e53-6f9d-4b93-82b1-9f8da689f1b4
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fdnKF+r99useZq6Cs1JIbzLbZG1MejE2CDPxWrDnGQRhplGVWQ8GJZTmowKi7SZNo9JHK2tXoSAEIN9vNA0rXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SHAPR01MB175
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello, I need your help. you will get 50% if you can help me.

Thanks,
Xinxin Wang
