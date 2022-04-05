Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0896D4F2131
	for <lists+linux-usb@lfdr.de>; Tue,  5 Apr 2022 06:09:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230057AbiDECsL (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 4 Apr 2022 22:48:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230201AbiDECsG (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 4 Apr 2022 22:48:06 -0400
Received: from esa.hc3962-90.iphmx.com (esa.hc3962-90.iphmx.com [216.71.142.165])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2BBE13703A
        for <linux-usb@vger.kernel.org>; Mon,  4 Apr 2022 18:54:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qccesdkim1;
  t=1649123658; x=1649728458;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=sVkltXgC9v52yMzcSxTavfaB2B5ScGaRTDHzkPFCVc8=;
  b=Aq0kxcZrqHMkaJPt3KaQiJndBJEBnrkfj7ATpNzLLFOI9iny11w51x2o
   s5spkLDc73ASUfeQ55KbTmJWtiLiaODqd9pMewwOnaMYiZHHrKXGf+ya/
   qoE0Qe343nuoLhFWe8QB+jSxn64OJUeYYxyIxtAY8QE2QDGs8dlrJUnDN
   o=;
Received: from mail-dm6nam10lp2109.outbound.protection.outlook.com (HELO NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.109])
  by ob1.hc3962-90.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Apr 2022 01:54:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SMpIXhhCH3awro8MNd90xd809QdiJG5GocmHRdSUlJg5Au2gIqkubf0U0Pi7erUGyfz4x7M79uywviRDZxFb8R6g64VUfcfgkK9NDJE90kqD25l8YQ+Cmoo0bIYeThqAowXb8xoWsrtIQwCKLE/NmSFeiu88Wy7UflunehZilAP33BpgulfNQazInO4V7QmYKlBNn1oY7MNPvbpTOgo6br3Tl91zBrTBfXVJIBVwn7iFeZAtOmLSwMm0nknBG+sQQeR49emYEbywD5ZNUV6UzuQMtVgvtTnlYab5mYou4cHh1dWtr8q7Pgg7dgSIFEqxV/VVpvjqTZHsUGDRPJOT2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sVkltXgC9v52yMzcSxTavfaB2B5ScGaRTDHzkPFCVc8=;
 b=WLqoe1gkY2hjqeWAU1HzkSslzkgIgdhyzIjggjMG9W4C22/5QYdla1NOk64vvziVW7C4iFYAF7e2zCVsoln1dXOxRwHOrlotVkRcbDOkY8Ulg129Nd/q0OEW2lG4T8qJZuHE6d5xAQlyyQi9+CfJH5G+E9TRP5xAnbYUVb9bNdjTr+r7Apbp9tEavGcqyMH3R4Vcfpjrnv1EwRlTj1eXxVJBmIImAM3+a7wACkSjoaHlNytvr4Avll3Iyt9jL1kPsQjAOyXA95+EqpEp1ttZ92J02AoQVhtgiUkp833mFpfLv8wtT/Im4odIWllVYIVpAKnR+Z17BofHT/2iEIoMPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from DM8PR02MB8198.namprd02.prod.outlook.com (2603:10b6:8:4::7) by
 BYAPR02MB5223.namprd02.prod.outlook.com (2603:10b6:a03:67::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5123.31; Tue, 5 Apr 2022 01:54:09 +0000
Received: from DM8PR02MB8198.namprd02.prod.outlook.com
 ([fe80::3cf7:297a:3c0:b49f]) by DM8PR02MB8198.namprd02.prod.outlook.com
 ([fe80::3cf7:297a:3c0:b49f%7]) with mapi id 15.20.5123.031; Tue, 5 Apr 2022
 01:54:09 +0000
From:   "Linyu Yuan (QUIC)" <quic_linyyuan@quicinc.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>,
        "kbuild@lists.01.org" <kbuild@lists.01.org>,
        "Linyu Yuan (QUIC)" <quic_linyyuan@quicinc.com>,
        Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     "lkp@intel.com" <lkp@intel.com>,
        "kbuild-all@lists.01.org" <kbuild-all@lists.01.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "Jack Pham (QUIC)" <quic_jackp@quicinc.com>,
        "Linyu Yuan (QUIC)" <quic_linyyuan@quicinc.com>
Subject: RE: [kbuild] Re: [PATCH v4 3/5] usb: gadget: add trace event of
 configfs group operation
Thread-Topic: [kbuild] Re: [PATCH v4 3/5] usb: gadget: add trace event of
 configfs group operation
Thread-Index: AQHYQ/37sY/dq07FTE6/km5YbDlT7qzfyceAgADNyGA=
Date:   Tue, 5 Apr 2022 01:54:09 +0000
Message-ID: <DM8PR02MB819863DE601523292E58CD50E3E49@DM8PR02MB8198.namprd02.prod.outlook.com>
References: <1648621087-14948-4-git-send-email-quic_linyyuan@quicinc.com>
 <202203311137.r3Nm4dyZ-lkp@intel.com>
In-Reply-To: <202203311137.r3Nm4dyZ-lkp@intel.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=quicinc.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d235727c-c986-4a0a-179a-08da16a72d10
x-ms-traffictypediagnostic: BYAPR02MB5223:EE_
x-ld-processed: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d,ExtAddr
x-microsoft-antispam-prvs: <BYAPR02MB52235160EA55E350EE6DDF299FE49@BYAPR02MB5223.namprd02.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: X8VITAZZuMmyJl3F/AY2tqB7gjS5Rr7WyYMz7VuCmvENUJcDZ3SZnqY1lUG7ieEb5iRmDfY4oYZ2H5mrZch6Zj0Qg3YWGfDcinb5g5N8GZNKKFrsyEHd+hdwp0roaSdj7hUONstSI3GI9EDaovaQcj0MdDXOzoccKTnGyS0s5YQGoWD9cxGf5h8SCjai4OHCFjjRfDABbK0CdZ0qQOx4zoWANJO6ZzOB28pgA8c9OahnACY9u4BsT/lk6mGse5L1QRL5DQWjG+xAPlvni551vk3bfs5fb32sTH/tfej2cwTx2JOWfZ6PS9G37bkT7b+Jfm4MzYthjCjcYCDWVBbrYYi7qD+WKhazdaVsXHqlMtuzz5qb5Jp4L57bhPtLOt9EL9n/991fditKvjt1JUJM2LChyQIOIefYx2zACepyVLVyHAdH7qwzZG5mXnelx6fdPUqMiZyIXfqmpmKTvMVGfj6IyPbdZl+HbYRcB4+gbdmhewDmmRrBADIS1rXyXTDPO0cUNnrGGT95OJ5tanv1/bHZ+3OSvVYt5rr8yU5RDDfKilh/euxczEedbf6qP2MvdCfUDnOvkWI+zzJABbj0dRj4mNF5K9WZe1GdhO2Ddrb0vBEQQN4DO/hdcIsZXzfEXhZlfsva9s0/kKQd2pOn5T/Mh9RAp+MI0krdr6YKnS/3fhaxJ4uYfxpdQhbr3ynjU+RcPQPxv75i//AP6znzNaEvU8yOam8Q83yjK/qmv9pjRIfDMdsZZlI602HcxKDwSTv6OW6pFdwbmyDcPc4W27NqNFoTYzjcb/UjpGZA/jTMFVZnqZywO2RAsJPxzLTb2U6rD22ZQxUhJw5ec3njEA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR02MB8198.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(107886003)(66446008)(508600001)(9686003)(122000001)(66556008)(66476007)(55016003)(71200400001)(8676002)(4326008)(66946007)(76116006)(64756008)(5660300002)(7696005)(6506007)(8936002)(2906002)(316002)(26005)(186003)(86362001)(52536014)(53546011)(38070700005)(83380400001)(38100700002)(966005)(54906003)(33656002)(110136005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?g/u0YIal/F/5bJ7Y5/Dd6L6UMs/Z9VuQfIwp8t/Wx6nGRrWRMigKlXyAogQZ?=
 =?us-ascii?Q?SV6xCfgcmW2S0IKgycpTN3ZD9NK+MqAAxlI8fqoR7P2uLqYxL4QibVR4LMg6?=
 =?us-ascii?Q?slZXeKTD6icR6Ck2+DhzDXCgsdwPtvaQySm9/yJQVbCz5iMkjSnezGZJT377?=
 =?us-ascii?Q?Z7V9kzRPrLsvaCQuj5JJE9hlqW7hgKTA6UYKWQEqSy9dVNY+zMsBuh7pmtIn?=
 =?us-ascii?Q?rUiNbLV6texbmYiSippeahi+yeSSL+YJ1WjvkozkTGxruLbiSWYSNFE9dRdi?=
 =?us-ascii?Q?jM9TBI98yLMXV43H/T6hQY96qf1uSMkduEF2kdvchmQc+zmbADU+Grd7nNfV?=
 =?us-ascii?Q?16N3u/6WbnXyJ7/vVa7t/pAqr7PMQca16Ccq+LnUI3B1YrAz403P84WVno6/?=
 =?us-ascii?Q?oav7CG4sHDF3xXrcq44d9PEtrTchgsd1/3z06Nf7Egz3KmGYPtsVNukyWMcq?=
 =?us-ascii?Q?fcDJTgbEfrqdewwaHHkVC0ooNV8GwNLknGKer3aMWP2jjNcURtYlg2/DnP9Q?=
 =?us-ascii?Q?hpYyHEf3z2xf53nqpdnNReDnYzeYl9V46HP35r5fmjEQKintFeO4ZzxhOZXe?=
 =?us-ascii?Q?SnG9EcPe64vYq3QH+aWrm3a8HWHMyLbfcMeetSOfHI0BCch2Vj7FjkNJecEs?=
 =?us-ascii?Q?q1JPs4yWLrmNY3GumMgm4AKND00VzBaVyuqd+S8vDCVHUNd1dU4Ixi9+HJ9a?=
 =?us-ascii?Q?k4Dvv0IsKcCVWeNIxwMmfekqr2Z3z6m/5m0fMBvboKfTA2P7FA0GOchFVqbf?=
 =?us-ascii?Q?WSwnt3zNs/HXzuNDGHeIoRZ5Fr6qRgaNBILrgOiar1bNXW9hChBuoCMJhGOD?=
 =?us-ascii?Q?KotY+/fAUkn2uWZp+GXpQsySJ55A9rmvFYuc1TqpDwfwIGORSbrYLzW7zs5y?=
 =?us-ascii?Q?vPKvWomwAIax3X91xT/4qjfaUGqVPZahFwRY6dOynOqsExZmwo2IJtIcNc+k?=
 =?us-ascii?Q?Oy1c8BX7HOQoOTN+vreYFMnOY9nEm8759SqhAqMMAs+zXrk+S0ML+E2ySprM?=
 =?us-ascii?Q?gHDeqXDCkoqStmAkx3chUheYNvxZf7jbeqkp8dKaGpMYEaEycNijZLjZyhAV?=
 =?us-ascii?Q?e4Qp77rKlYJWGIrkfNVo+cCg7+hQassG0WEiVsYj9JdKvcvlH0C/LCkIJO5/?=
 =?us-ascii?Q?1m6njk+HrVBQwBbjfC9Y+Hbf02YZRcaEnyY8DA2EmCjvlvyyYQJJrU5ij6uV?=
 =?us-ascii?Q?t0CHrDftVVRYH310UPHFuWXFT69L8yoCIhItdkCP2zqjxsU9oiDdlJSnC5BD?=
 =?us-ascii?Q?m3b6O0mUftD9vo5OGeo1D+UTXzXkucNTQf3RM5oiqu5uEUTV6Y0pcuiTZ4TJ?=
 =?us-ascii?Q?iOay2aYMXI+bklQoIDiT6nNMDT6kbeOoSXtA370HzjKi/4qFw4nrD2aUlwbr?=
 =?us-ascii?Q?dkat7nb55uUoA4U/VJQLdNuYK/Bn8OrAgkObEdTWQto7CUhMQR2PqdyPVQni?=
 =?us-ascii?Q?W7ZBEfUv1WQFyWEcPK/0ZhhSl1wACL89FzUDUfkHngHz4assGT0m0cDA1XAf?=
 =?us-ascii?Q?VozMDqISgnL9KhJqG4QUzKDDFcEPyXOggZZRm7fvyzb/ug7D7MMCL8NB8OuU?=
 =?us-ascii?Q?L2ed+AF+o27Lx8VjNSofOOd6dzoogX70kdx05aGdi25BxTxNjorSLnk+XFtA?=
 =?us-ascii?Q?eQZtnAtrW9j39uNOm+8LWYnRyigYdk/y0BMA8tOqx7pm2Nb9aQ/fzCB49pSh?=
 =?us-ascii?Q?LhS+Mx/RCSHzeZonfvbEAg+/nmPxX7TmBjcuj6vfm24xIk8UWCHKPgjz2oN/?=
 =?us-ascii?Q?uto6iwXBrg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR02MB8198.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d235727c-c986-4a0a-179a-08da16a72d10
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Apr 2022 01:54:09.6788
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AxWOz5Jfkb5/d24kXKIwMQzBSCDcDFgMYiylN3NVP0L30c7Dh72xfVteVAnsHEuX7jl8XITQ4rLIeWjjGyLm84GYam7gUXx3QPJkF5Zh13E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB5223
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SCC_BODY_URI_ONLY,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

> From: Dan Carpenter <dan.carpenter@oracle.com>
> Sent: Monday, April 4, 2022 2:36 PM
> To: kbuild@lists.01.org; Linyu Yuan (QUIC) <quic_linyyuan@quicinc.com>;
> Felipe Balbi <balbi@kernel.org>; Greg Kroah-Hartman
> <gregkh@linuxfoundation.org>
> Cc: lkp@intel.com; kbuild-all@lists.01.org; linux-usb@vger.kernel.org; Ja=
ck
> Pham (QUIC) <quic_jackp@quicinc.com>; Linyu Yuan (QUIC)
> <quic_linyyuan@quicinc.com>
> Subject: [kbuild] Re: [PATCH v4 3/5] usb: gadget: add trace event of conf=
igfs
> group operation
>=20
> Hi Linyu,
>=20
> url:    https://github.com/intel-lab-lkp/linux/commits/Linyu-Yuan/usb-
> gadget-configfs-new-trace-events/20220330-141926
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git  u=
sb-
> testing
> config: x86_64-randconfig-m001 (https://download.01.org/0day-
> ci/archive/20220331/202203311137.r3Nm4dyZ-lkp@intel.com/config )
> compiler: gcc-9 (Ubuntu 9.4.0-1ubuntu1~20.04.1) 9.4.0
>=20
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Thanks for report this issue, I will fix it,
As this series are new files and still not approve,
I don't know is it possible to add Reported-by tag ?
>=20
> smatch warnings:
> drivers/usb/gadget/trace.c:26 gadget_configfs_group() warn: returning -1
> instead of -ENOMEM is sloppy
>=20

