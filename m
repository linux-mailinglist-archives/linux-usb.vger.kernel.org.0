Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5BB6D2E6CE5
	for <lists+linux-usb@lfdr.de>; Tue, 29 Dec 2020 01:54:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730402AbgL2Aya (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 28 Dec 2020 19:54:30 -0500
Received: from mail-eopbgr60069.outbound.protection.outlook.com ([40.107.6.69]:42991
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1730359AbgL2Ay3 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 28 Dec 2020 19:54:29 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TN4Xoem/F1aR+KTfvV4VRNBkPpH2xUVP3i0twNSaq5TZ/wd/Z07tlB1VqK9I/lA7mN3pGSsG5qW5Wjl7C/yMQbgv4p/zxHi/7ng2p0BXwqcoKzDRQ4V5dCuE5UxcJ0oE49DFa9r8SkArCzeIMtaU+5NUYMrJVa+aoAmbsSzdFMolgAF1QyWFOvPuJBXSz8Hjc1Dq57RCo+6rWMIfvIdZrMMEgrva/4KT+yr9uoz3DcC9fBxHB54SzSndWU/9BdW6xxhBc4M/KpgMPsMAyilUnlmmkED3tcv2eEGEV0SMjhUU+gdCSaw1PnWo5dcK6m8KeTGw0gbOoL4+hPecuFQJ+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jQzCfrjvPCg/QJSngtKJcDM8kVINjY+kSUkxWd6hPME=;
 b=EuTvcbOAmdUqhMsAapooSCrznY4ri/JdpyZWJOFL8OW4llursJXM55hQnufOrV0G9CgywyvRte5wl8unrpORaqpqYDN/xORSMeTv6Rx1nBWMg+SjRALSbDJG88Nq9kjMQjs1m0lS5EX2+Mfv6uRCCTlI6csfVcy7syuuM0I0rMWEb8hwkLXdru9j6p5W8iYLCnBER52ZT7l3NGD96T2EOiTaYu2HCmmo3CVkhs3yr+Up/2AbQYm9uub8I1l3uf7/CAkI/jdMUiw0awbdnnbZm+WVMJ7Jjd2w/zF70qkEv9PremGhk6HOAO9IE0X0qCL6fLYOL/bzr3xjhaA7AV4Heg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jQzCfrjvPCg/QJSngtKJcDM8kVINjY+kSUkxWd6hPME=;
 b=n3ccoRsn8xPiRqTb7qB+Bf9QgD9mHrnem04kbDXCQF8oBZEf5Lu1/n95R7kwSebAGgYkApKZVq2CkWwbZ8rSBybj1W6ItVU1sT9yUbGGAOnBieTNqjpqXXYEff/OIo2kH58NGdHwJPY3QBdxrGdpa9h2wEJTEGYw5Qv1vwXxpUk=
Received: from AS8PR04MB7973.eurprd04.prod.outlook.com (2603:10a6:20b:28b::16)
 by AM7PR04MB7143.eurprd04.prod.outlook.com (2603:10a6:20b:112::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3700.27; Tue, 29 Dec
 2020 00:53:40 +0000
Received: from AS8PR04MB7973.eurprd04.prod.outlook.com
 ([fe80::a46e:b91d:fdbe:ffd6]) by AS8PR04MB7973.eurprd04.prod.outlook.com
 ([fe80::a46e:b91d:fdbe:ffd6%4]) with mapi id 15.20.3700.031; Tue, 29 Dec 2020
 00:53:40 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     Greg KH <gregkh@linuxfoundation.org>,
        Pawel Laszczak <pawell@cadence.com>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "dan.carpenter@oracle.com" <dan.carpenter@oracle.com>,
        "kurahul@cadence.com" <kurahul@cadence.com>,
        "rdunlap@infradead.org" <rdunlap@infradead.org>
Subject: RE: [PATCH] usb: cdnsp: Fix for undefined reference to
 `usb_hcd_is_primary_hcd'
Thread-Topic: [PATCH] usb: cdnsp: Fix for undefined reference to
 `usb_hcd_is_primary_hcd'
Thread-Index: AQHWzxDW8gwYfcxtfEiKgR2Vt2ev/aoMsVEAgACp3bA=
Date:   Tue, 29 Dec 2020 00:53:40 +0000
Message-ID: <AS8PR04MB7973C849A446952E02A18E6E8BD80@AS8PR04MB7973.eurprd04.prod.outlook.com>
References: <20201210162258.10289-1-pawell@cadence.com>
 <X+nu7pD9tVw5iMJB@kroah.com>
In-Reply-To: <X+nu7pD9tVw5iMJB@kroah.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linuxfoundation.org; dkim=none (message not signed)
 header.d=none;linuxfoundation.org; dmarc=none action=none
 header.from=nxp.com;
x-originating-ip: [92.121.68.129]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 990c11b8-afc7-43ae-6fe2-08d8ab942eec
x-ms-traffictypediagnostic: AM7PR04MB7143:
x-microsoft-antispam-prvs: <AM7PR04MB7143230D9FDB9CCF22303C7C8BD80@AM7PR04MB7143.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5236;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: BVwwSrYLNKZ11TLZ4XrKJXQftnor3HAHvEcrRBTzJW2WmGAt6pzmanyWJlWsJvciptpqb9HXoH2TxZo5SrXYRQ7sw17MVJLlKXjUhVyPB1iDQlzFsmJnoHAfgqC1RbkACj2wBSbuvemtenPFX89bZpZ1HoJe4zUbYuI0UFyIr01Xj1euA0dBSNb4MrFWt+L4OFO5W/TwZkD5e49RPIUzGDpbIzzNcWZwOIkKeND0ra+vEcomqoBMumtV6frteZyCqwzrg28L11HMc3lijMbvEoAa4I67jJPNjX0w16CXOQ8FY3Owd3n1eTtAQ2fd3PTspSh+w08X9fatLI+2A5im/9FVnfYsp9b5iZB0byDiZYRmqeNeQiVd57Od/5MoZlEEc+nmkr4Gy0DTZ8i5boQvSYwBg8apORlutX54WB2Kxy7v5EliozTCaKC73ric/K3J
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB7973.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(366004)(136003)(396003)(39860400002)(346002)(52536014)(55016002)(8676002)(9686003)(66476007)(66556008)(64756008)(44832011)(26005)(7696005)(110136005)(83380400001)(66446008)(4744005)(4326008)(316002)(66946007)(54906003)(186003)(76116006)(8936002)(33656002)(86362001)(2906002)(5660300002)(6506007)(478600001)(71200400001)(81973001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?+/ctrl7xvWCgTcxGFNUrLt0ZF0MTBHUjzpMorbNM5edKu+0r9sd4RJMhHDar?=
 =?us-ascii?Q?zs/z1L49RSyatnMd0BYlF9xX2LIlabnBJ7au0xiA5jvHtlK5e/g9EKoqpNY/?=
 =?us-ascii?Q?sxBwkqQc0v/f77kG6zFLZxy2s+WExwHIll368YwNXVzxl0h6CgNyPR2BWDq5?=
 =?us-ascii?Q?MnwgOj6svu9y0RuhWonK2rtoSPBYoTpSErVlYsda6A0cb8vTuZyJZ+7DVYoP?=
 =?us-ascii?Q?ok7+iagGPLyu2GZBPy1/AHhKmag4WAnZ4Plmgg7Sb+tRPoDpMSYTBJ+w109g?=
 =?us-ascii?Q?LpAxicvOE9vxB/CHRCOhIrJxI0126xU98eADV+MuDsmA2zSVc25gwm7QJDwH?=
 =?us-ascii?Q?W7+OGFQk74O4GOb83RtVEet2lHKaumzOYJYXKcFJ2WPrARecH5/hklRNn9fb?=
 =?us-ascii?Q?mSOUPOX2OhwMEynY45ppziTWYX4OLpQ3eZ+3hLB5risrwapr6qYQgvuDA0lk?=
 =?us-ascii?Q?hn4TdMQE47nMrIQguxYAh1tl2O8tFG+J1YbavD+HwXCfrgiNeDOelQQV4r7z?=
 =?us-ascii?Q?ddMmL/LNxatF8Bwj/BnPXdnhyahBvkQmSekrV/9OegwE4gC/ujpgydQ1zji0?=
 =?us-ascii?Q?prDus8bYIkw16AAg1LYIk0PGH6c/66bA8ceRtZG+lEvrxnchp3vSH190i+Io?=
 =?us-ascii?Q?pe9R+mvoBzShMww6GfgPYE4Spcwphlp4gbQxRxWdZifuPW4UlHQNThFARnAQ?=
 =?us-ascii?Q?w6TAvOBCcgOgmsdV+miCGdKQa8169pkcpBc+2ErH96qyBuq4Esgh6Q8ZUhg4?=
 =?us-ascii?Q?jLFcJduBQfilW5Xnrw4SsoRbqOCG35DkvG2qUx0MuYRH0mLUMi6ckR2sogZ/?=
 =?us-ascii?Q?rPSeCattTxn7aEyfAumo6yZSrITzhSdwOTAV1cwG4RW41jePgcayS3NrDld1?=
 =?us-ascii?Q?ntI4s+PZGOunKAcvVrdzyNdxTcnIbUN9IAUMMkHzmNEy6+nzlEHnCftZJ9zp?=
 =?us-ascii?Q?V9GFAt2TYct5/7JbcfQGZYd7Y73+bu5c/+zkLRoRwJU=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB7973.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 990c11b8-afc7-43ae-6fe2-08d8ab942eec
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Dec 2020 00:53:40.2536
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Gnm04TDBx5tzchN0MeXGIxK3sKA5+oUYkVPr0c549wbvmWH/0OgZES/xTgG/zWfMqg8qMdvlqjUM7KC7PY2kSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7143
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

=20
> >
> > Issue occurrd for following kernel configuration:
> > CONFIG_USB_GADGET=3Dy
> > CONFIG_USB_SUPPORT=3Dy
> > CONFIG_USB_COMMON=3Dy
> > CONFIG_USB_ARCH_HAS_HCD=3Dy
> > CONFIG_USB=3Dm
> >
> > CONFIG_USB_CDNS_SUPPORT=3Dy
> > CONFIG_USB_CDNS_HOST=3Dy
> > CONFIG_USB_CDNS3=3Dm
> > CONFIG_USB_CDNS3_GADGET=3Dy
> > CONFIG_USB_CDNS3_HOST=3Dy
> >
> > Signed-off-by: Pawel Laszczak <pawell@cadence.com>
> > Reported-by: Randy Dunlap <rdunlap@infradead.org>
> > ---
> >  drivers/usb/cdns3/Makefile | 7 ++++++-
> >  1 file changed, 6 insertions(+), 1 deletion(-)
>=20
> Doesn't apply to 5.11-rc1 :(

Hi Greg,

Cadence USB3 goes to my tree, and the related patches were already at my tr=
ee.

Peter
