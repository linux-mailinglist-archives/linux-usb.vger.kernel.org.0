Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB82B2E2A66
	for <lists+linux-usb@lfdr.de>; Fri, 25 Dec 2020 09:19:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725866AbgLYITC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 25 Dec 2020 03:19:02 -0500
Received: from mx0b-0016f401.pphosted.com ([67.231.156.173]:47630 "EHLO
        mx0b-0016f401.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725842AbgLYITC (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 25 Dec 2020 03:19:02 -0500
Received: from pps.filterd (m0045851.ppops.net [127.0.0.1])
        by mx0b-0016f401.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 0BP8FmVq003609
        for <linux-usb@vger.kernel.org>; Fri, 25 Dec 2020 00:18:20 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com; h=from : to : subject
 : date : message-id : content-type : content-transfer-encoding :
 mime-version; s=pfpt0220; bh=9bt7r7DUsmgIedFMDXF3jmy47RhVCnffOXhvstApdNU=;
 b=isvhvNGSgCNFNi6BXDOqdtY/90J91EbLbz3b7AGhkir+Wgs4g1n8kL2/PTQU98JNnPnG
 slAII80xlnQ6c8QYjHotGq6l8adYK4ECWws2e+CaNyX7og++kFIakHmmzALO4Xj6qtWo
 qTVVjaXgsJWlQelKlIzaeHsbeWSlyEmGLuw60W67ULYAR7FELzJeOi+AP0fwbinR9rUb
 t+LSAuDr3mVqqnn8og2LFhw0YO3igWwUFweLBC4baJxTwRiZ5s2OlymgZo3FZaz7iFub
 MnNCi4c8da7ldlAEtrKzVY6fGYd+RfX72SlBg8OrtodWsz7TjpiQRSR7cWxzjUZ6X77y ZA== 
Received: from sc-exch03.marvell.com ([199.233.58.183])
        by mx0b-0016f401.pphosted.com with ESMTP id 35k0hxa0my-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT)
        for <linux-usb@vger.kernel.org>; Fri, 25 Dec 2020 00:18:20 -0800
Received: from DC5-EXCH01.marvell.com (10.69.176.38) by SC-EXCH03.marvell.com
 (10.93.176.83) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 25 Dec
 2020 00:18:18 -0800
Received: from SC-EXCH03.marvell.com (10.93.176.83) by DC5-EXCH01.marvell.com
 (10.69.176.38) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 25 Dec
 2020 00:18:18 -0800
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.48) by
 SC-EXCH03.marvell.com (10.93.176.83) with Microsoft SMTP Server (TLS) id
 15.0.1497.2 via Frontend Transport; Fri, 25 Dec 2020 00:18:17 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SgmK0yP0IzJEXg3/UtU6N5vxJB1W+ZwBRW5FpzCZEzcCUNI7SetC18NaT5dAtSUx3CYrXC1WUsXWk74dJBllw4P6ousZb3Hot3/tijDLj1nyBgPPT37S8stZlOtlAyzEGcan1KcyWbNDQuwaxGVAN7FRpLEuglzKYOhvZrBQ2KGb2ALn+k+rYs2MSDtrdWhFJHMGaYsp374kuvgpTUC6mus2aZsf9r8C4r9+yrXJnkSCL3NDvtMIRHLqfHz1XgF5sWfbK7O/4YAnKQ5C18VVAcyTsP2199VSdaNPKCBR+2tKIJcp6eOPqD1/TRAR/HnllSw4bN6B5yxAuCueVo4SCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9bt7r7DUsmgIedFMDXF3jmy47RhVCnffOXhvstApdNU=;
 b=JGWIjWJ2kA4JWBy7W+IJStwV0s2Fw4vFiT+GFM8eJo/2jo/Ysyoz01xjzYUXv3vjJYrQmB8hEaWLKhccp+Kzj+o+MA4Kjl4FEpHmS4d/Wm5hPJ2f03IIieCEbvUSL8oZQTkVsxdlSueu4Obtxc7TVGueqafACrC5HDfMpdemnHgvjBsnsbncBqV1GzDhfurXmopZi6xpX9rAmzrvjTN6KbWOf0Y3E9QT6yIOEXw6dnCJMlPBe0J+jcca8RTQjm82EN9TocZkgl5Icnbf0Js332RXUG4XeCa/M/mzTjQOWRst9XMoTqfHFPFSrc8C1z636u+WFLt/Rm/Wg+n1uU7nzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=marvell.com; dmarc=pass action=none header.from=marvell.com;
 dkim=pass header.d=marvell.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=marvell.onmicrosoft.com; s=selector1-marvell-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9bt7r7DUsmgIedFMDXF3jmy47RhVCnffOXhvstApdNU=;
 b=cMI+9aLcITT7/DT47Qt1V9c8BB6ZNjChvVt/9UF9rotFYNFrlnxHfaEgk9VJwl66FOHTYsEp3q+PZnUtuxPEp6tGlKCHeYW7ZKLKje66Ar1WGNSZhqR6Ys1Pp6fn25q5Ce2EQHuDiOSMgTaiMX96hLb4F3z0GHNny1PNi/7gtoc=
Received: from BYAPR18MB2741.namprd18.prod.outlook.com (2603:10b6:a03:104::31)
 by BYAPR18MB2791.namprd18.prod.outlook.com (2603:10b6:a03:111::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3700.27; Fri, 25 Dec
 2020 08:18:14 +0000
Received: from BYAPR18MB2741.namprd18.prod.outlook.com
 ([fe80::41aa:4af:817c:759f]) by BYAPR18MB2741.namprd18.prod.outlook.com
 ([fe80::41aa:4af:817c:759f%5]) with mapi id 15.20.3700.028; Fri, 25 Dec 2020
 08:18:14 +0000
From:   Noam Liron <lnoam@marvell.com>
To:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Proper way to set a DMA_MASK on a USB device
Thread-Topic: Proper way to set a DMA_MASK on a USB device
Thread-Index: Adbakl5xbg7QAS4WT8Cnci3wGuXjgw==
Date:   Fri, 25 Dec 2020 08:18:14 +0000
Message-ID: <BYAPR18MB274144B768FE04DB641ACA90B9DC1@BYAPR18MB2741.namprd18.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none
 header.from=marvell.com;
x-originating-ip: [109.186.129.254]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ca87311b-31c5-4324-d16b-08d8a8ada01f
x-ms-traffictypediagnostic: BYAPR18MB2791:
x-microsoft-antispam-prvs: <BYAPR18MB2791AF7C3A1BF29D0223995DB9DC1@BYAPR18MB2791.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 1SJE1P9WRLj1suxYnAYnUuCBJVxsmuDVy20QVvbDzfSdKiur2i6UJ7IEYIf0N4QrlXSto7PPQgjSoSR1DidZ9EIjGlCqyb/MgiA8/Nri84yVvY4CtbvQPqIatrw4U5FF8R/XPJ5pN/qJcwCg/ydHgbGqSyxECC6WRTmwge3iMyX28IwaAp+a2t6Z7r6AZ9KheBOdxb/W7lL0LPdi1QebVAs4Mpm/gQ9cZl5sXCzDFj5fZjVodA1jeSUyTLxrw/jwxE0oeZUJWezKvPw4g+C57C8VavtwaF4jR8K43jhZIC8rW+abRf9kND5qMupEGzgJ0h1BHsxtX6Y59Xq5AU78IaYzbCbDLYZTUe4fixS75A+WAGLDZsu8DCp/0nsXk0thHNPuxwhlHgR8QTMiuqKasYEftV5w5tZ/V+uQZMoxKMp77Oal6kXnZ8G2zcEKiTD4CJq4eElxKWLqBnhaXQ1TTiSoFXCuTGxA0skxVvydgqfgcQPf3XmICP5dyGruEn+TcTYPQlkTeMd33MWk42Qu4HH4p9QbidOLgAZKPhYFHF0=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR18MB2741.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(396003)(376002)(39850400004)(136003)(346002)(5660300002)(9686003)(8936002)(52536014)(4744005)(71200400001)(55016002)(8676002)(33656002)(26005)(2906002)(6506007)(316002)(86362001)(66946007)(186003)(64756008)(66556008)(66446008)(66476007)(478600001)(83380400001)(7696005)(76116006)(6916009)(966005)(43043002)(6606295002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?TtswTxHYh6e3tAGmd0qDUmegy7rorp1j9DXAy1dwGFULCz2wnWsQGvovP/2Z?=
 =?us-ascii?Q?J5VBQQ9wrf7irLQNGghb+kCGezleiO/vyGD61cVSiAjiunMWYo5tFKJpaeil?=
 =?us-ascii?Q?3fSW5wUwzJyVCGo47qr4nx7A5ZCkFEPfViYyEnTFovpyUnLDdklhM+UQrrR3?=
 =?us-ascii?Q?1xC4bOGgSiJAa90qKPcfB6YWNyvFIaBcM3KwIqZhmZQuIo/DRQox5Yx4iCno?=
 =?us-ascii?Q?Ws1aWcEZoPB8vCljC7ZZGyX3oe5FQppJdJpKPf84elCLBQ5yhQtrHKA6p2E2?=
 =?us-ascii?Q?RIz9UI/EKrMomZv+tpzKH2nPNPqBfOh6CUPbIrP6oPYSlOHvx3N4dRyoRXwo?=
 =?us-ascii?Q?LIchfq8rqrUBBBBWFswsSR0JrEerYIHOom/lLC8U+RvALWiDb6kpME3x5x/w?=
 =?us-ascii?Q?YhvgLo8NvlZQjPm0l39j8eDyLJYGNjDX4ZDuZTPbCuuY6+lrdCS/1P31UlY4?=
 =?us-ascii?Q?VTVK18XDOvF17bz2xHU6w7ghqMxohUSnx7XZcpc9yc4BULxtrs2sPfR/2L+9?=
 =?us-ascii?Q?U+M51gR03ZtXYOWFId3XvS8KtgisaPZP/6PaFWDYNwiHeCrPa9saL8M6VzYq?=
 =?us-ascii?Q?bf4P2KEPaQ8SeVEe13UYGPCa+TqtvXIwz3A/gOJrLmIrkSlo4bdkAMavtNo3?=
 =?us-ascii?Q?pS+gFSYc34Zjs998MCM2VuWgpUEAOq+mnWmfh7E7jWgJBhEHOpvtDrgsh/kd?=
 =?us-ascii?Q?tGUGMz4w8WZa1irZdgPjbEhVtJHA5UZtuVWND1Kg7Cgs44xg/wr7PFLMPLUi?=
 =?us-ascii?Q?Bw4/aKepztLI3R4lqc8tVa/wJwpkf6yhGcJaZJgCzA4s9MkDe+oAT5W53pvW?=
 =?us-ascii?Q?xhvlVl1O+JaF0P2E7OOS2vk616Ia6vKEpaaZQ6asLs59rS3VA7ha4ps7Muo8?=
 =?us-ascii?Q?HOaX410T0D91kzSjQoOsWi5USCUVVDJwFMiGbk4jlaa4aOn8/1tMdXmKoQAV?=
 =?us-ascii?Q?lSjSogw0d9YSuHHucEU6zfArAXOLO0ajOJyq5aM7DaU=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR18MB2741.namprd18.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca87311b-31c5-4324-d16b-08d8a8ada01f
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Dec 2020 08:18:14.1204
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 70e1fb47-1155-421d-87fc-2e58f638b6e0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4F2k/gE/jfiWJZx9WOubVW0PmHlfDJBUsJXvg/4rQCYgmNtLxq+3yQuppGWj82WXbiisaL7lpRJUsZ8rJLRngA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR18MB2791
X-OriginatorOrg: marvell.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343,18.0.737
 definitions=2020-12-25_05:2020-12-24,2020-12-25 signatures=0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi All,

I am working on LK 4.14.76, on a SOC in which RAM starts at 0x200000000, an=
d need to limit DMA buffer allocations to be below 0x220000000.=20
I planned to do it by setting dma_mask to 0x21FFFFFFF.

But in drivers/usb/core/usb.c:590 I see the following:
Note: calling dma_set_mask() on a USB device would set the
           mask for the entire HCD, so don't do that.

I also found  related message:
https://marc.info/?l=3Dlinux-usb&m=3D160023769800697&w=3D2 : "... as the dm=
a_mask is set by default for most busses".

So how can I set properly the dma_mask?


