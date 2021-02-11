Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F84F318672
	for <lists+linux-usb@lfdr.de>; Thu, 11 Feb 2021 09:49:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229668AbhBKIr3 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 11 Feb 2021 03:47:29 -0500
Received: from mx0b-0016f401.pphosted.com ([67.231.156.173]:32766 "EHLO
        mx0b-0016f401.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229655AbhBKIkq (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 11 Feb 2021 03:40:46 -0500
Received: from pps.filterd (m0045851.ppops.net [127.0.0.1])
        by mx0b-0016f401.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 11B8aSua031272;
        Thu, 11 Feb 2021 00:38:43 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pfpt0220;
 bh=L8Cj/3kxUGsULRe97/4ACZ0jhhJY8lJ9Ar/j8mO0b00=;
 b=bg7tZ35SLLipP5ITR8YS1ZjhGZwf8ktZ62rYRxwuDC+Yo0oPnNxAtpeyRran39JQAa4t
 gbLgRiQSqM+v/mEd53eKXHGX5k3c6VxcUOmR24YZhLVuWooHU11/SCrIguRjQrBCTXNV
 TfwdDc35RnLebRZOQCqY0DZ6Y+thf58VB/bl0KDtpJfkUkC+N6+3qbuTSLyi4k1qNnmD
 7cK5SnJJhPXqyFmisnHIeQByjZOBnHp0FZEf+Z1El2pUpQFAS2lIpQkUNqA1KzeLzGwv
 otNPDld0Jv45/H0VusS1UUI48VJeGsX6dqfZwgTKOnHKKRWPTAQw8lSz7XBjOaqc4dSS ug== 
Received: from dc5-exch02.marvell.com ([199.233.59.182])
        by mx0b-0016f401.pphosted.com with ESMTP id 36hugqe7f3-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
        Thu, 11 Feb 2021 00:38:43 -0800
Received: from SC-EXCH02.marvell.com (10.93.176.82) by DC5-EXCH02.marvell.com
 (10.69.176.39) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 11 Feb
 2021 00:38:41 -0800
Received: from DC5-EXCH01.marvell.com (10.69.176.38) by SC-EXCH02.marvell.com
 (10.93.176.82) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 11 Feb
 2021 00:38:41 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 DC5-EXCH01.marvell.com (10.69.176.38) with Microsoft SMTP Server (TLS) id
 15.0.1497.2 via Frontend Transport; Thu, 11 Feb 2021 00:38:41 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=izjgRf5ZwE4NjRIpknCITLU7P4ZMeOJhlEQiJrOqXBnsW1e92c/LX3v/QrI7sTk4BF1/CpUtD4DNKwTiSgXlZIAYYRlxTjCgserchyfCG4OeLHGbkCXq0UwYAuNYCIgOno5xQLoxUBP7tazPElVU8RhdmH1AmfOxQTFcV0wEkwkysF5CcNpnM4Fk1x+dXQqpxA9virAcY/JneW7UuG4AQ7+XBDmjddZm4ZUR3KUkiWxEkqJUAbZ97gDZ1hnnI7T5JdWR7u+o3NBgOzDAx90mxmGJkNLqS7lW5erDANUn7PfmBP1RMyUUQ6z34TrXRSsHjv2LLcT6IVWXfUdIW5baXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L8Cj/3kxUGsULRe97/4ACZ0jhhJY8lJ9Ar/j8mO0b00=;
 b=GDwZR3YlVn8TLXdqL43Rbd4GEA+q62eC5A5YDTa+1wCIFkmM+3mHCQYZQyot7aP1jIfEtJIX5GoODQpanrJNxoMQiQCTREphpTP602GDa5/4rGF1c1PkG1lakVIHkbuSqMg6jbn4HiApH3dU3hJK76peigoGqA6CY4hGAIGv/ip/BF7BhswvMpc0iY6XAXZ7be3xJXx+OlePWzJYhEgtSyDS+CvXIhN8neJGOHaDB4hn0rI29IZagUivyAQt1BL6BCpCZ5jbiL5Miv+SK5fOY9P35EO6bTlXDIoGVppNHVxDYlZdNk7EzfdGm7592YP6JT9bvOK20wiNlcXN4EDlQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=marvell.com; dmarc=pass action=none header.from=marvell.com;
 dkim=pass header.d=marvell.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=marvell.onmicrosoft.com; s=selector1-marvell-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L8Cj/3kxUGsULRe97/4ACZ0jhhJY8lJ9Ar/j8mO0b00=;
 b=cFBe/EKMxNKIvaoKZYz6/cc7pvk6IuSUYAXsF0Qalo6pQsaA/E8hmJC4FN1fTJ2DsUBxObRXmYfCuJjeYETjbsULuSGj9rcYeqi+P4RXK3jbySdAzs6BPgOvoqyQEdz16mjTGG+llc/mkxLlu3teGhYQQIogvJRq/dWO66i3NM8=
Received: from BYAPR18MB2741.namprd18.prod.outlook.com (2603:10b6:a03:104::31)
 by SJ0PR18MB3994.namprd18.prod.outlook.com (2603:10b6:a03:2ec::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.29; Thu, 11 Feb
 2021 08:38:40 +0000
Received: from BYAPR18MB2741.namprd18.prod.outlook.com
 ([fe80::fd33:5fd8:dce1:d322]) by BYAPR18MB2741.namprd18.prod.outlook.com
 ([fe80::fd33:5fd8:dce1:d322%7]) with mapi id 15.20.3825.031; Thu, 11 Feb 2021
 08:38:40 +0000
From:   Noam Liron <lnoam@marvell.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Yuval Shaia <yshaia@marvell.com>
Subject: RE: [EXT] Re: Enforce USB DMA allocations to specific range
Thread-Topic: [EXT] Re: Enforce USB DMA allocations to specific range
Thread-Index: AdbdHEmZFdbher7ITx64r7D0fwV3SgACA3eACMszbVA=
Date:   Thu, 11 Feb 2021 08:38:40 +0000
Message-ID: <BYAPR18MB2741B58F5907F65C71ACF966B98C9@BYAPR18MB2741.namprd18.prod.outlook.com>
References: <BYAPR18MB274197EFE1391905899D2F07B9D91@BYAPR18MB2741.namprd18.prod.outlook.com>
 <X+npQe45AXcsFGu1@kroah.com>
In-Reply-To: <X+npQe45AXcsFGu1@kroah.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linuxfoundation.org; dkim=none (message not signed)
 header.d=none;linuxfoundation.org; dmarc=none action=none
 header.from=marvell.com;
x-originating-ip: [93.172.57.254]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 74b7c189-0697-4552-52da-08d8ce686ecf
x-ms-traffictypediagnostic: SJ0PR18MB3994:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SJ0PR18MB399469CF33F1A287B8267E2DB98C9@SJ0PR18MB3994.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: AHVQAiuw7R70hFBQ3pASTHPkDCr0YTohBdFB8mW0K6MxBIe3pqCc8JINKzhGTR94V+7aZmCyizgJK7mJhBgBz+3bPbDa/dvOUzuU3QO+qWXVBk4SvJn8NxIMTgTPAzeGG4uLTQ6U7zM8R5Gd/7N5nDhjjZXml+pd87/paldH4RtC+K+m3Oi0eLINY4o4KQbCUDRA/kIhVwJ/rupSMxxU1nvC1RRcPY93XtFhan3hynE7e/a5FHNJD7rrYcCEFE81L/+nUDbkvTNFiI+TzB2jAISBl2e6Yp51p7tYQ0IkWt6fpCvcEilsHNpP8jb24pJJv5meW+2vR59ORy4SBKS3NgdeoJpVsJXwPUB5yJia3/2D65sYiL1K3P9NuRP2q6r3DWYkje/wzHndLwQg5mYsJLN3JrMkR9V4gVE5M3BlRA5nB8pRkHeU8hTuBVy974a0RCPiFPfCFz7y+t+qnTP7e7Xo32IdfN1Mw+kQn6TqcC54tWVnJRp3G/kdQDtPv0If0nqUrABu5uyGpWaSIcE7uw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR18MB2741.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(346002)(366004)(396003)(136003)(39860400002)(33656002)(6916009)(55016002)(71200400001)(8676002)(9686003)(2906002)(4326008)(8936002)(53546011)(316002)(54906003)(6506007)(26005)(186003)(478600001)(5660300002)(7696005)(107886003)(64756008)(66556008)(66476007)(83380400001)(76116006)(52536014)(66946007)(66446008)(86362001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?osar0R0cqILFaUnGnjIGBGhDxt+35ItwCvDJqnmlXdlcbf/CJP3I+6eruNkq?=
 =?us-ascii?Q?wGNeewBVmHOCnZn0tXKy4kggdLX+sIV+JKApOn8UEgkmkTlpYug6EZRqilI2?=
 =?us-ascii?Q?Ls+Ai9FrAJwT2RVhZLA1XnUjo54p67P3toZDNKXttwT5DlNByyyjolBlPiKj?=
 =?us-ascii?Q?dv+EhR92nxNfP2wbTDRp7ha+2nD6KQTwMcSD8jpS5PgXixudPDZAyN6Q6gIa?=
 =?us-ascii?Q?fkAsogYBu5FFqDPtdghzaaIqaRubZuFy9kPx/ut5Zd9raLIumuzWGQxRK0EX?=
 =?us-ascii?Q?KVhTg63bB9vnS+JahnSFgFOunxLHNBpRoayeBnAxCClUPuImcx4AJnffvbcG?=
 =?us-ascii?Q?3JCPH42b07mBi9mXuVycXRABGxVg5ZSuHLT0pgT6sq1aUIKFoGtPkgSf34z5?=
 =?us-ascii?Q?n7VUzrd4AEdfYzGkKgtWA2+pOpubUnHYnjjx62lB7apCyM5MXhuQ8NdlVH5Z?=
 =?us-ascii?Q?642HHN63HCEnXXmqIBx3X7XtMFb6zdtJUDRKzaAqnDxymzUIq92R6XKM/bHS?=
 =?us-ascii?Q?tguR/0EVARN3vMBV6wY6NBanvX8kwlrqtJS0qOdFj65qdoH7Z5XAx652tBjR?=
 =?us-ascii?Q?VZ53CEd/Bm9xnhpK57J1M9g0tirMwh7/OIlLDbR4ct7veCJtlXkqmmDIIvRd?=
 =?us-ascii?Q?afbg1v7lCdSwbFsIiFP77X9KdKWCFr4vy+MZ7EFEaSdUzyd4AqPIrjOUtj11?=
 =?us-ascii?Q?bxB9O1NH8h1VZZw1nKqAH25RGe288GxUQfYmWSBhbCxjTF9xLIZkqCUWl8su?=
 =?us-ascii?Q?O4J3+kuhGkXbwzM1o+0bpb4kEVI+yTg2GpjLQDEaNpdm5CTlw8qEW0Vf0qDo?=
 =?us-ascii?Q?nKiTprDAVRio5/Huo0rCLQLPdLASP/DmgiXjGDw0aIPDJXhXZDISv1qmU1Zt?=
 =?us-ascii?Q?hSksjfzxQhSTcHYz+05ahd/diwP9NFlZiN07weSF3ViwkJwh3pIG8J+Jz1bI?=
 =?us-ascii?Q?SHrmlIYuy1mdBzTJ68ukhGyk6zgUCsAp5Zd6ETcO6pbvFgANfSiviHg3SNJo?=
 =?us-ascii?Q?3V0Ev6o3w6QKJyDqp1DDAApDY7pMWxTcwjSlU4IVNaKgNVYLz6DUZt6IfaxM?=
 =?us-ascii?Q?iidvbKQjQE9RYM+F6xvPNRKkonnHSNU/bL80mJSH21SJm9+mqe05ubh0mmM2?=
 =?us-ascii?Q?DuLdurnbIXPlm0fNo/DpgoVAA0EYTNW/Q9kuE6yj5jsuQxvTxlZj5J2W/awe?=
 =?us-ascii?Q?nihBBPv98XuMUnOyJxQP/+2yeBgGSri/J377tr/Humbm75Odm47zqmS1UJsP?=
 =?us-ascii?Q?gNc2HQhgrTK2mZM7hNoh2B7FwLY4iAq/s+pifiKZL1cQBJG/JAMIw4OMx11Q?=
 =?us-ascii?Q?u0EEHRzAEtxQHp7XPCzRL8Fs?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR18MB2741.namprd18.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 74b7c189-0697-4552-52da-08d8ce686ecf
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Feb 2021 08:38:40.2487
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 70e1fb47-1155-421d-87fc-2e58f638b6e0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MFezhx89XYY3i9V81jXlK0QqEvaLaxlMgd0Y72R77tFkXONkMDPWp9j6+/yIejeqIsjppc2WFa0cvxFSu8Uw6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR18MB3994
X-OriginatorOrg: marvell.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369,18.0.737
 definitions=2021-02-11_05:2021-02-10,2021-02-11 signatures=0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Greg,

I am writing you again on the below subject, as I would like to get a "high=
 level" opinion, and you are probably the most experienced ...

As I wrote below, I cannot rely on the DMA mask, as some USB allocation are=
 not affected by it.
I thought of using private DMA pool that will be allocated where I need it =
(at the start of physical memory). However, this means adding specific ASIC=
 code, which is less elegant.
Do you think that's the right way?

Thanks,
Noam


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

> I plan to do the following:
> Alloc coherent memory for the HCD using 'dma_declare_coherent_memory', an=
d use the HCD_LOCAL_MEM so the usb core is told that it must copy data into=
 local memory if the buffers happen to be placed in regular memory.
>=20
> Is that the right way to deal with this case?

Have you looked at how all of the existing host controller drivers do this?=
  Why will they not "just work" properly for you as well?
What host controller driver are you using?

thanks,

greg k-h
