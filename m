Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5ED652E1F63
	for <lists+linux-usb@lfdr.de>; Wed, 23 Dec 2020 17:21:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726626AbgLWQT4 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 23 Dec 2020 11:19:56 -0500
Received: from mx0b-0016f401.pphosted.com ([67.231.156.173]:33372 "EHLO
        mx0b-0016f401.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726221AbgLWQTz (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 23 Dec 2020 11:19:55 -0500
Received: from pps.filterd (m0045851.ppops.net [127.0.0.1])
        by mx0b-0016f401.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 0BNGAl6k004342;
        Wed, 23 Dec 2020 08:19:10 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com; h=from : to : cc :
 subject : date : message-id : content-type : content-transfer-encoding :
 mime-version; s=pfpt0220; bh=UtFK54nPYXtyoXR4vNK1nrrx4WRiz1oTUA2N8EN0JyI=;
 b=EQzftBu0xQWzJFPGr3s2R0BJa8nkSgOLK54nQXqUA4cAKKZy6I9EASjIqKngqW2dInNf
 AEZ/tG5jRXZAMCap1uBqe9FC0zHP6/1zPbEukd2gvsxD5vAQwsBHekjfMHtOIt9rmwhp
 5YHC3ibMSxoDCopUwGtIyej4HiyLVQE4bt6FaG6PM6Ps7j+XHumGXS7Hl8giUmagcuGG
 sHHfqdhtJNVxTAi55ki9/rlFD+YlSqwaBDo+pQD811nhlph2wJaw2gTKXdL6IoUD277b
 3g8B6FgMTCWniUPOFJut2qjAAeauSmecYonF26pbgJhrc/qML1o1NtGxbo1EYN0Dc8xS KA== 
Received: from sc-exch03.marvell.com ([199.233.58.183])
        by mx0b-0016f401.pphosted.com with ESMTP id 35k0hx6cxq-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
        Wed, 23 Dec 2020 08:19:10 -0800
Received: from DC5-EXCH01.marvell.com (10.69.176.38) by SC-EXCH03.marvell.com
 (10.93.176.83) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 23 Dec
 2020 08:19:08 -0800
Received: from SC-EXCH01.marvell.com (10.93.176.81) by DC5-EXCH01.marvell.com
 (10.69.176.38) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 23 Dec
 2020 08:19:08 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.173)
 by SC-EXCH01.marvell.com (10.93.176.81) with Microsoft SMTP Server (TLS) id
 15.0.1497.2 via Frontend Transport; Wed, 23 Dec 2020 08:19:07 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ifc9sIkC5o0AMgiWnQnEy3X2gVS13g2jWNQBwgrSiZtVjKUZs9rmKnfR1z7/k96lqzPjU193Ns4VxOCpzn1uR5jftGqq6jlib2PEhFzqcRJoBQazmZnJOyPXXKgrl1sd9XXGP7h/YGNcXvf8ifN18VtkSvsy1/LtLwDoZVz7eLb2nzpohmvI8NQNEtRlsYCewoffztWPEIeWTjfQLOgYkpuCA6nNKjx88guoAhCQP2qFvfV594N4FfrpkJcbbbIiYGyIr/97jSp4rrE9e42DtecwlecaSvWVDNpwJSgd0X/KyKMuppM0i+9qDggy9BGtagz8cWpom1PpOu4fMQyuCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UtFK54nPYXtyoXR4vNK1nrrx4WRiz1oTUA2N8EN0JyI=;
 b=QlEfHqyg6cfZixOuHDKc9R+MmF5Sog6IzAOet7AiLEwYKug/zztBMHLOh/LGfeGKadd8UrV4bhqBa/fnycS0JRPzS+JmWcpMmV3kWvRI9qySZ/GV5AkEsvrohfShdjBd+vR/Hw2+Oj4EX0az2qjgc9C4SU/nK3ztPeJuwokospmONm0i1L5aJrTfNWKN/AuKpmer3wyo+yBjrO9bGnL7OoED5HwUN7Qmw7YAwONdlU6orEd2nvonUr0O7Fah3YYuF+s5HOxC+NMiczI4iKowNKQcs76LrrOCrJ2dbOXLdwm7hYXaFwSH2SribudCs6AJTbq8NMIokUJhx1Sx383Kgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=marvell.com; dmarc=pass action=none header.from=marvell.com;
 dkim=pass header.d=marvell.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=marvell.onmicrosoft.com; s=selector1-marvell-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UtFK54nPYXtyoXR4vNK1nrrx4WRiz1oTUA2N8EN0JyI=;
 b=ARHIVwVuu+pO2eW5oDhj39T0doNbw62WKlVI99+VU9nuzqUgTad+YTSkit+N953SN9gKwXdqHm9RtEPpmmGH2wBa1TlkNffJ+Car0Tz3VFhnf05vIPopb5nBtF9ohTrahonO8QH1RmelbBU2ORHPFrlGYiwGmdN/1EPcJ5ed14c=
Received: from MN2PR18MB2911.namprd18.prod.outlook.com (2603:10b6:208:a6::18)
 by MN2PR18MB2735.namprd18.prod.outlook.com (2603:10b6:208:a6::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3676.25; Wed, 23 Dec
 2020 16:19:06 +0000
Received: from MN2PR18MB2911.namprd18.prod.outlook.com
 ([fe80::807:b565:ca1c:2a55]) by MN2PR18MB2911.namprd18.prod.outlook.com
 ([fe80::807:b565:ca1c:2a55%6]) with mapi id 15.20.3676.033; Wed, 23 Dec 2020
 16:19:06 +0000
From:   Yuval Shaia <yshaia@marvell.com>
To:     "Peter.Chen@nxp.com" <Peter.Chen@nxp.com>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Yuval Shaia <yshaia@marvell.com>
Subject: [RESEND] usb: gadget: Question on chipidea UDC driver
Thread-Topic: [RESEND] usb: gadget: Question on chipidea UDC driver
Thread-Index: AdbZRz3fRrbW/iqrTKKScjzjEHKrBw==
Date:   Wed, 23 Dec 2020 16:19:06 +0000
Message-ID: <MN2PR18MB2911B7D74FD3A16F8AF9BFD8D3DE0@MN2PR18MB2911.namprd18.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: nxp.com; dkim=none (message not signed)
 header.d=none;nxp.com; dmarc=none action=none header.from=marvell.com;
x-originating-ip: [77.137.119.191]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7c27e3bf-510b-4381-61c9-08d8a75e7883
x-ms-traffictypediagnostic: MN2PR18MB2735:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR18MB2735A1476D3A518D7A6190C7D3DE0@MN2PR18MB2735.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 7HtxBHqG0PMuDqP/VZDsJi7+JnY+5SdC1bDxf+zajDNMvqT/mOlMiBLj6H+AULkh4fWqEMiRYeyo9oWrROhcVBGIrfi8Tj++o86r3DBHfWCcFdoo0E4ub0ZssMd6+DJg9CJy2O/sk0fTof74Haaqpz35wlZ8W2NBXxSavm5syEBqapAVF2/frIF2lqnh64eVGa2ReycpNHJvvUFjeqeEBREI/wyB0AH2hCXLOTVYxMUVOCNqWYTuYTwX9900478IX1dzMZe6MxfVF4XxSpOwFYg4yXd112GbQWIjPpHgnh8RYTol0jVf1YcNKknvzcIitvRDXQTwtPgZiQYSojTOlK4fIAmwvKjqXUuwfuhM+0s96knwb8ipCzPebNXs/UYtlFZaC8fbvSp7AW9nkm79RA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR18MB2911.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(376002)(136003)(366004)(346002)(39860400002)(2906002)(66476007)(52536014)(66446008)(71200400001)(33656002)(86362001)(9686003)(5660300002)(6506007)(4326008)(6916009)(7696005)(55016002)(478600001)(186003)(107886003)(8936002)(64756008)(316002)(26005)(8676002)(76116006)(66556008)(54906003)(66946007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?MsVVXIeHoMG7fV+9YqNOUh7Xs2MDlCaAjwFMrAYuaEpO7Kibp7DRrxOD6Cms?=
 =?us-ascii?Q?w+sEXjiaA/TAuukT8aAfYk8ZJrLZ6xeOf62TnDPra+r9iT8La0wZstCRiNRE?=
 =?us-ascii?Q?nI8GbD/hlHqlfb1HmcI0qEJ3OEwDrtkhPUtFu7gMvhIRQZKNSB5Za565qocV?=
 =?us-ascii?Q?QbP0lb7LLU3SeQib+nGt/W6LGG+SPvUnx2V2++5UqzTyHk/QwceqW+xayBP5?=
 =?us-ascii?Q?K1vRg9eoOPo3sh5WA/cbJWuYWWGYGa9hpoJhadFji+JmXhOt9x7gSIDFeSI+?=
 =?us-ascii?Q?gYyuHkJGsLRSH+eHMSeRxFdzCUoz2ZoDz9XZiuVEqIZpNRpEp7STm2HlJULJ?=
 =?us-ascii?Q?TjdhtaXOcGTCHeC30RSHU8+by5PIWm4ac9M/Oq398DqGkypWo92w8GgNSYFh?=
 =?us-ascii?Q?lOUb7AhN35Vxquo1PHGkrVbI3JYkfVrhxl8Ut9qrr5RsilPU2skwRcin9A3q?=
 =?us-ascii?Q?s3N+Il2GUTS1T3v6m57/50r1B0JP4H3l7qgN2nl76cyBtQDy7RxgijczNXNx?=
 =?us-ascii?Q?vLCZUVuektIodxiiiM+XAlbIuso1MqEaQbfLB8CtAtVQ0ezuBrRonKtW8kcH?=
 =?us-ascii?Q?AfQU7ULOkp0UlpPpVYt+c1VqCgX2pAdahe9rxnbgl7M1Bc1l816Qf7bkXgPP?=
 =?us-ascii?Q?nt5FiHjJwQffECH2NCN3bKVRU5F4n6LehM+Qs4ZtSQzjVOc+cdb3/DZg99X0?=
 =?us-ascii?Q?LgcB4ntwa6zNefp+pEQYIP411wn0+UWOTp8tPsa8YfosJ4PNcg2/V4C2CFgl?=
 =?us-ascii?Q?ZTfPDPhLZZRIvv83lEekfU/L9Nlhg87K8UkvyUkaTt7q9ymoyb5uW1RwWPAb?=
 =?us-ascii?Q?l6Z4hXF7ltYeLWxxTnCY1Afc527PvW9jPLXIreKWZ2SDRPt1O0U+1ANpvej2?=
 =?us-ascii?Q?9FeZazzK1KuHqCs+Dyg0N3nbe2tGfeWMiCROuCRpb4Q1hNdLNnJywyNR787Z?=
 =?us-ascii?Q?FKnEYfpWKfWy2YFYTP+H6+C/iBcVMDJ6bYwbX+jHMzk=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR18MB2911.namprd18.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c27e3bf-510b-4381-61c9-08d8a75e7883
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Dec 2020 16:19:06.2456
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 70e1fb47-1155-421d-87fc-2e58f638b6e0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /iU712BsMBYpJ4LacKA2DXQrSsxa4dwqPED44qpTzQhsAmfIeqFncioxSJhcWKeLiBv+uW86i18ShgIHKky6xw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR18MB2735
X-OriginatorOrg: marvell.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343,18.0.737
 definitions=2020-12-23_07:2020-12-23,2020-12-23 signatures=0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello,
I'm using a board equipped with ChipIdea UDC and trying to expose storage d=
evice (for example) out of it.

I load the following modules/drivers:
	udc-core
	libcomposite
	ci_hdrc
	ci_hdrc_usb
	usb_f_mass_storage.

Next, I used the basic setup via configfs:
                idVendor =3D 0x1d6b
                idProduct =3D 0x0001

Created an empty config, function and linked the function to configuration:
                mkdir configs/c.1
                mkdir functions/mass_storage.1=20
                (also created lun0 with dd)=20
                ln -s functions/mass_storage.1 configs/c.1

Then started the device:
                echo ci_hdrc.0 > UDC

On device side I can see that the setup from Linux perspective is looking g=
ood:
	[    8.360082] Mass Storage Function, version: 2009/09/11=20
	[    8.360094] LUN: removable file: (no medium)

However on the  host side I see some errors:
	[   10.087328] usb 1-1: device descriptor read/64, error -32=20
	[   10.455328] usb 1-1: device descriptor read/64, error -32=20
	[   10.695328] usb 1-1: device descriptor read/64, error -32=20
	[   11.875327] usb 1-1: device not accepting address 4, error -32=20
	[   12.423327] usb 1-1: device not accepting address 5, error -32=20
	[   12.429178] usb usb1-port1: unable to enumerate USB device=20

I added some debug printks to both coreidea/udc.c and coreidea/core.c and c=
an see that the interatom between the platform driver and the device contro=
ller is ok (i.e interrupts etc).

git tag 4.14.76.

Any idea?

Thanks a lot in advance for any help.

Yuval
