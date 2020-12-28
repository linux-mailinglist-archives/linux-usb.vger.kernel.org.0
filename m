Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B55A72E423D
	for <lists+linux-usb@lfdr.de>; Mon, 28 Dec 2020 16:20:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2440758AbgL1PTE (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 28 Dec 2020 10:19:04 -0500
Received: from mx0a-0016f401.pphosted.com ([67.231.148.174]:56116 "EHLO
        mx0b-0016f401.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S2439340AbgL1PS7 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 28 Dec 2020 10:18:59 -0500
Received: from pps.filterd (m0045849.ppops.net [127.0.0.1])
        by mx0a-0016f401.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 0BSF5FNP022097;
        Mon, 28 Dec 2020 07:18:15 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pfpt0220;
 bh=yg9OiHHVJBXeodU8NUFOliSJ4HBzjRH4klBWLMJu4DQ=;
 b=GeLIXYOcCfyapxTjX3mdOddidKyoFx16u8PGBf6HOPhuvVSkQs2HfIgSnK0dLbnsA+t8
 YdwHWBMAzy0vzxJZTsSQcpMm0JgEI/vWpW82iO9Te0mCw+MVNEqGBFe6lLbNPTuPMS+M
 rkVdzEPZpKy1VsuEcgT+3xaL91txXxAteDd/h6FHfaDDaNpvPlSH0+KOtxzcaL77+yA0
 IFvQZYGFhzs1Yhk8fQV+u+vglKnGmVict8gk0KPQ5sG2qVzVqDKOwSVm3plN/XjyaOJf
 TgZr0fvXfFdKiuYH67nD4LVs7AjEKRllApP7oEiqDoOPzPBhNEboBFocH8Jn/96JmEO+ IA== 
Received: from dc5-exch02.marvell.com ([199.233.59.182])
        by mx0a-0016f401.pphosted.com with ESMTP id 35p3dskg9u-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
        Mon, 28 Dec 2020 07:18:15 -0800
Received: from SC-EXCH03.marvell.com (10.93.176.83) by DC5-EXCH02.marvell.com
 (10.69.176.39) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 28 Dec
 2020 07:18:14 -0800
Received: from DC5-EXCH02.marvell.com (10.69.176.39) by SC-EXCH03.marvell.com
 (10.93.176.83) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 28 Dec
 2020 07:18:13 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.176)
 by DC5-EXCH02.marvell.com (10.69.176.39) with Microsoft SMTP Server (TLS) id
 15.0.1497.2 via Frontend Transport; Mon, 28 Dec 2020 07:18:14 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UTbLHTLu3W40C5gAMzv7lidea3dtypy9c7A20YjJDo3341wK9g5ZHjGN0Uwkk23ZuoFtrmIo28Z1m/E4XyneOYtPrITP7s2jqu/xA1neIi9yKuwKD5Ykysc0PGxIkkRRtfVj7ozGfk+g/3N0UI+2MVvOfwYntdont2VDbQne75tGeqffAtRu8SSs3gVCDj2RXnMsdCcCeEUepOX7LhWhn7VP1fNMgpjlWK8CF7q8ot7I3eVI/hXy96k6ZuNGXRqKFghJJ+a7lLHLvzHBQYc5pZZZ6X7D+Yghjk4PDFVePnhHehAyZtbKCxLnSs4r2sxOzHDgwiPU6hg+5MdJys+z9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yg9OiHHVJBXeodU8NUFOliSJ4HBzjRH4klBWLMJu4DQ=;
 b=fEVD5Bs4yZ6LTAL7GU2DCJxIRSaDVdb0JMcJKQ3RMfWGOUboFw+F2Zn5KZ+wkUcvV4WgjKVDSXKeLqJpJA+rBRBuqeq5INIKvr1YRGv9WJL/2Qca5bVMegcUqMqt2+zbSFl9fzs/Qv3QYa5+GLLwxjDqaYXjVQtqXMRwa+0WiQN9u9BCZGovy2k6wVUTJtW45Vc3CsLqlCbDXnj+rXLpOmyDLDsEU4kmygW+lZ4ymvGlrJKCu60EPVFY4bWuAKu/T5kzMLcCXjMPbiZrscuj8FexJw8d8yHlJCJblc+X4I3p4s5Z/0C98za5HFfESZX6eX7c+oAWjPH52TMqaBhQsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=marvell.com; dmarc=pass action=none header.from=marvell.com;
 dkim=pass header.d=marvell.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=marvell.onmicrosoft.com; s=selector1-marvell-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yg9OiHHVJBXeodU8NUFOliSJ4HBzjRH4klBWLMJu4DQ=;
 b=JbNa88CvldfA+gm7iAS4pQNu2BDmipyZcEUfKx6nQI5sBVycKdm3ihuE7ZcLjtcUpfj/9vHlUaGrgXSompMbSIohihdt+11dIisXYmHQoOqR045+0lYehe0UF5rdbqzCea0sP0vPaQdALahbL5V6EENtyf8iDPTYGCgg0Du734k=
Received: from BYAPR18MB2741.namprd18.prod.outlook.com (2603:10b6:a03:104::31)
 by SJ0PR18MB4028.namprd18.prod.outlook.com (2603:10b6:a03:2cb::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3700.28; Mon, 28 Dec
 2020 15:18:11 +0000
Received: from BYAPR18MB2741.namprd18.prod.outlook.com
 ([fe80::41aa:4af:817c:759f]) by BYAPR18MB2741.namprd18.prod.outlook.com
 ([fe80::41aa:4af:817c:759f%5]) with mapi id 15.20.3700.031; Mon, 28 Dec 2020
 15:18:10 +0000
From:   Noam Liron <lnoam@marvell.com>
To:     Greg KH <greg@kroah.com>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Yuval Shaia <yshaia@marvell.com>
Subject: RE: [EXT] Re: Enforce USB DMA allocations to specific range
Thread-Topic: [EXT] Re: Enforce USB DMA allocations to specific range
Thread-Index: AdbdHEmZFdbher7ITx64r7D0fwV3SgACA3eAAAHJNaA=
Date:   Mon, 28 Dec 2020 15:18:09 +0000
Message-ID: <BYAPR18MB27414FDCAE84F0739D7D2542B9D91@BYAPR18MB2741.namprd18.prod.outlook.com>
References: <BYAPR18MB274197EFE1391905899D2F07B9D91@BYAPR18MB2741.namprd18.prod.outlook.com>
 <X+npQe45AXcsFGu1@kroah.com>
In-Reply-To: <X+npQe45AXcsFGu1@kroah.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kroah.com; dkim=none (message not signed)
 header.d=none;kroah.com; dmarc=none action=none header.from=marvell.com;
x-originating-ip: [46.117.46.20]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e58c0a77-bff8-46ad-ee45-08d8ab43c9b1
x-ms-traffictypediagnostic: SJ0PR18MB4028:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SJ0PR18MB40286DE8305C20F0FE438969B9D91@SJ0PR18MB4028.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: bVtL06hqHdeFQFZwP+ku9sGSqfR88dZWUSIqzEH42HVQQ5zTNiwbNqWe0otedpguttAmNGKQKZ11Rr4C9WXp3ajKE9VJJ5DpdlS9kAepbnldCRg4n2gTIwaENDoMPBfkbt4OMUgcgkShUIc/CCgRMo3xRXLtW5he+DL7dcdQiTmpbftES48aVk6A3YwMnATPFbFWcfYNznCqihH8LHWcbFFg43HnxvL7vwn3dwaWQRXu6pKQRpnNM3Wef931TVIhG7P5zDZV2IPA1XzD794RMkG1yp0Gk49lVgUYdF+z+IglZ7KjuxS0yPLfL0VoKSe71uVr4CMrWDKZrX+fHFVXCz317CdAaOkTl7a3jy+ucAIBP/4K12iBb3LkcmgH/d3cANTEYs2SYnoph2OFETSNCQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR18MB2741.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(39850400004)(136003)(366004)(346002)(396003)(52536014)(66476007)(316002)(86362001)(54906003)(53546011)(8936002)(6506007)(2906002)(6916009)(83380400001)(7696005)(4326008)(478600001)(71200400001)(9686003)(186003)(26005)(8676002)(5660300002)(66946007)(66446008)(107886003)(76116006)(33656002)(66556008)(55016002)(64756008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?47Osjr9ZdAyRRmON84YcyXFHt0g/Hw7xS0wKc7qjcdg9ZTgYnv3Y33pAFi2G?=
 =?us-ascii?Q?z9FOwp747ri54P6HA83Ag+zbkPHd0icAb324Dw9pcv+K57oeAofuMz+6W/yF?=
 =?us-ascii?Q?/YuK6ELru3XMlwQ6fkxuEVvffmlLJ299bDqIrRc7vXyp7HEZDVanv2OV9sVr?=
 =?us-ascii?Q?Wm0zSNsy9W1vgr37vgxAL8x0flYliUIGRCAt3lu0vwjL9uGVKk+VtgKh0STp?=
 =?us-ascii?Q?RaWm8rO+aSonIMwgX6YVjaMwFiAnT9KYGExnkLk83S110l+5rBlZoNwolBSC?=
 =?us-ascii?Q?AShJ9JE5biDFNRuk7LYTXFrhErNzFYVk5rLt89bjeiYk/b8OqeXa4kVmGOcI?=
 =?us-ascii?Q?E2fcM+ZM9ErOd/qWnJ1By/A1yhU9zw7DnxQ4ZYyLLt875KUkkfVRUrhEtOVi?=
 =?us-ascii?Q?rukgJAYSHWZw9Si64y0b0vlPL5Bz8IlYjkOttDyqnGTbuanoToUADrF1I5GJ?=
 =?us-ascii?Q?SOyQ0dhZIU8oe7BWZiw/uQGfxB5QLeaB14YOI9VzzhJGr8PvCjqXvRDykIH5?=
 =?us-ascii?Q?RJNKG5tbp804f+OZWizncOLe7YspW5K+KnLZDpSeQGtBKLu1Fkqi6v0MVd34?=
 =?us-ascii?Q?84Ww/YdQODNcmQFZPxqcAODmgMC48qiK8z3EwCqzv4/5b4mNzJP+vejEcQrt?=
 =?us-ascii?Q?ePb4/PknWnAQCgsDK2X/ySvzx5gqSP29QLCq06zsqtemcOYhiKqChzcaPb3K?=
 =?us-ascii?Q?Yi0srh31RDRgwCY4zOsMi+p6y24ymEQXWrVKyNmhEEbtpgn1Aoe1iIoVpGm+?=
 =?us-ascii?Q?KXUHii2Pc3wFMD24LqnbXUgvVrA6O2N1hYnHmPbN4jLNzzpg2KIN5iZqgi6n?=
 =?us-ascii?Q?5CryKSwh40mg4Plcd9TddH0aNlpIlbRppMmAtcsNJKv3piIdOJOvq/wxteYp?=
 =?us-ascii?Q?ZIZr+DGU1QpNF5VqlD+oYNFg3wPcW6YPlmPlj9jBmMEW1NoL7hUv3Bxyh1bn?=
 =?us-ascii?Q?oKlmuPJhB77y68j1M3Ik9FIbXlVuPuIn982rDALCNgI=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR18MB2741.namprd18.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e58c0a77-bff8-46ad-ee45-08d8ab43c9b1
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Dec 2020 15:18:10.6086
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 70e1fb47-1155-421d-87fc-2e58f638b6e0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: N1v9Mfxk++aFv0xQLHTmNEee55BGoZRbJhVyHQptWCwl8SmcMqOYWCR2eqRBiPRV3TRSbJGeCNPpqKbe4fmfuw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR18MB4028
X-OriginatorOrg: marvell.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343,18.0.737
 definitions=2020-12-28_14:2020-12-28,2020-12-28 signatures=0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


-----Original Message-----
From: Greg KH <greg@kroah.com>=20
Sent: Monday, December 28, 2020 4:19 PM
To: Noam Liron <lnoam@marvell.com>
Cc: linux-usb@vger.kernel.org; Yuval Shaia <yshaia@marvell.com>
Subject: [EXT] Re: Enforce USB DMA allocations to specific range

External Email

----------------------------------------------------------------------
On Mon, Dec 28, 2020 at 01:54:41PM +0000, Noam Liron wrote:
> Hi Greg and thanks for your reply for my previous q. (Proper way to set a=
 DMA_MASK on a USB device).
>=20
> I am rephrasing my questions:
>=20
> I am working on LK 4.14.76, on a SOC in which RAM starts at 0x200000000, =
and need to limit DMA buffer allocations to be at the range 0x200000000 -  =
0x220000000.
> This is a SoC constraint.
> Setting the controller dma_mask to 0x21FFFFFFF, didn't solve the problem,=
 as I noticed that URB streaming DMA are first allocated by kmalloc and ali=
ke, which are not affected by the dma_mask.

Why not get support from who ever is forcing you to use that old kernel ver=
sion?  You are paying them for this, right?  :)

[NL] As of now, this is the newest kernel version for this soc, and I am th=
e developer of this soc.
The soc enforces that specific constraint, and AFAIK, USB infrastructure is=
 already built to deal with it, and a newer kernel won't supply with better=
 solution.

> I plan to do the following:
> Alloc coherent memory for the HCD using 'dma_declare_coherent_memory', an=
d use the HCD_LOCAL_MEM so the usb core is told that it must copy data into=
 local memory if the buffers happen to be placed in regular memory.
>=20
> Is that the right way to deal with this case?

Have you looked at how all of the existing host controller drivers do this?=
  Why will they not "just work" properly for you as well?[NL]  I have looke=
d at ohci-sm501.c as it seems to solve similar problem to the one I deal wi=
th.
What host controller driver are you using?[NL]  ehci-orion.c

thanks,

greg k-h
