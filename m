Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B078BAF48F
	for <lists+linux-usb@lfdr.de>; Wed, 11 Sep 2019 04:57:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726555AbfIKC5K (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 10 Sep 2019 22:57:10 -0400
Received: from mail-eopbgr00059.outbound.protection.outlook.com ([40.107.0.59]:59349
        "EHLO EUR02-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726510AbfIKC5K (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 10 Sep 2019 22:57:10 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eCIakD3wxCqWLzClC71QbtI/DXBGSY3Kf3puFiJFAX2IchL5PlpajqbEyPQTSW0DDtdvZ9+zOzdMkbp1ANRuFkLXdQBAj4drd9huzHn48vHiRIoLqzD/MYAH/29YowkeIswpNCkbfvmd/LsDpFUnRQoP+7QIOz9Ww7KVEf1z/lq3+KpiVkywkPJkMBfNDlE18drSY8fxLorLYASqiSWytpyqs9PyXzwYqTEY/o+U9dvvV+RtSCgSk412rQUTMRh5t5tv2ijq+2BHlPaQvMPmYBTLSBECNqj66lbrzw3/lMkqBQgw5N2OO2QhRt80IXT8Dix6PJGO7LnWHHzpB90emQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sCvFfONdE1WTcKv7Fvt0HUW2zFnWGtoYjYvRtQkcavk=;
 b=JntKDE//qNS7VxhVI746sMTfKB5VbUi8kTcsJIkZirQjRS2AISJy7liJC91xxtuxyaOEaY/0qolt3D91RbiKQ3iHBXIhhotpi/Gv9Q31muKPdieX8JO70VyyfQH3csMODFkYSz6M41PmNBmZ7C1Sa7m6Fxp0RQ8lkJhMiClG6UggqaPLhN2AI36jg2AUwmORKFXbubmmJCx9ALH2ZNE42XYSDPvSQXboZxmMYevByfWf1cbgqzlJ4FNzBbv3tIjeAIHcOlXbUG+nkGAK7Xl4QWi53wIVTCsisgVuIPCtu2RxIj9qmYAUKEnghKTRfvvESPXxfwLdK2HGnH1inyLBBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sCvFfONdE1WTcKv7Fvt0HUW2zFnWGtoYjYvRtQkcavk=;
 b=Ej68uJIt2cXG1fKG2DoPrUkSKJ7RZ5bMcHoOlrxoWlwzVEltA5CdKMnNx1FTFa9VVLYUi/IUPPwlIHk6tr37aVwS3Sw1sFZiEKmUP5HSKEE7uc9HcliyngQ2nR8bipQoaj5g6XPTa6EpMkbGm35A4uoT4laXYDVkCxtSacK/wb0=
Received: from VI1PR04MB5327.eurprd04.prod.outlook.com (20.177.52.16) by
 VI1PR04MB5711.eurprd04.prod.outlook.com (20.178.126.219) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2241.15; Wed, 11 Sep 2019 02:57:05 +0000
Received: from VI1PR04MB5327.eurprd04.prod.outlook.com
 ([fe80::744a:c78e:b8:633a]) by VI1PR04MB5327.eurprd04.prod.outlook.com
 ([fe80::744a:c78e:b8:633a%7]) with mapi id 15.20.2241.018; Wed, 11 Sep 2019
 02:57:05 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     Allen Blaylock <AllenB@epiloglaser.com>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: EHSET with hub and PCIe root hub
Thread-Topic: EHSET with hub and PCIe root hub
Thread-Index: AdVoIxLeoShF0bVgSnKKwHrYOWnWwgAKZ+wA
Date:   Wed, 11 Sep 2019 02:57:05 +0000
Message-ID: <20190911025750.GB22414@b29397-desktop>
References: <BYAPR20MB25012D076C3D44E07BA32C89CCB60@BYAPR20MB2501.namprd20.prod.outlook.com>
In-Reply-To: <BYAPR20MB25012D076C3D44E07BA32C89CCB60@BYAPR20MB2501.namprd20.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=peter.chen@nxp.com; 
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b406acc7-5c43-4898-a051-08d73663ba5f
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:VI1PR04MB5711;
x-ms-traffictypediagnostic: VI1PR04MB5711:
x-ms-exchange-purlcount: 2
x-microsoft-antispam-prvs: <VI1PR04MB5711145F268B20B908FD5D5A8BB10@VI1PR04MB5711.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0157DEB61B
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(7916004)(4636009)(396003)(366004)(39860400002)(376002)(136003)(346002)(189003)(199004)(11346002)(256004)(316002)(6246003)(6916009)(486006)(9686003)(2906002)(66476007)(76116006)(91956017)(6512007)(6486002)(66946007)(44832011)(8936002)(33716001)(99286004)(476003)(81166006)(81156014)(186003)(53936002)(25786009)(66446008)(4326008)(102836004)(53546011)(6506007)(86362001)(6436002)(8676002)(76176011)(26005)(7736002)(478600001)(305945005)(45080400002)(64756008)(6306002)(229853002)(66556008)(71200400001)(71190400001)(14444005)(33656002)(5660300002)(66066001)(6116002)(3846002)(14454004)(1076003)(966005)(446003);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR04MB5711;H:VI1PR04MB5327.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: XfFoeblFnI+wdNo9r+s5JFlacZrErvxZKR3jweQpVw6dtKStIYMZcd9j1N0kNiyH5bgmV/Hm5yszHaNnEDXOp4NOoHaZ9PHRurO8J9Tq19cJNyg9GSXYsVOHxx85Lz/c9Mo5xc62QDtX4+7tkG5NdLrc1w/Kug+qbn569c+JHNyq5wsr2lJuH7vhNNrj/zNee7jnkpIlN+X5dtzH9p6Hqub1IssjsqrykN7hsuuRtyk9QIRYSe5tvn2Blhs98TEtwbRNFCm2FGkqmiDtxwXqHG8AF8LV99XdGCjPB2Y66+KyoldsPAqKNzH95PYpt7dUfZWVGHXK6iFB1n3efgm95J3tpgBQEWpUakf/3SQjJczEd/kFdyMOcLkknkqAi937SpXe7wHDXQa2IpZIfww9NDyWplkeQEozCzb9hS7zyqM=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <17EE85C909960C4FA29C07CC62D0C624@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b406acc7-5c43-4898-a051-08d73663ba5f
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Sep 2019 02:57:05.1146
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SFvTwN6Y5vPikezipIvljGIiEQyf2lcygiYKPyBMKFKIYcLXJmvlhgq8rXpO+XMRzrlYIsKQVdRpETnwn3g4Cw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5711
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 19-09-10 22:01:58, Allen Blaylock wrote:
> I am trying to validate the USB on an embedded platform based on the NXP =
i.MX7.=20
> So far I have only been able to validate root ports on the board but also=
 have a
> PCIe xhci controller and a microchip USB3503 hub off of the HSIC port on =
the=20
> SoC which I would like to run the tests on.=20
>=20
> I have reviewed the mailing list archives and found another discussion of=
 using
> the EHSET driver to validate a driver and they reference the same issue I=
 am=20
> seeing. When I plug in the device I see=20
> usb_ehset_test: probe of <port path> failed with error -32
> for either the PCIe root hub or the USB3503 HSIC hub.
>=20
> Further down in the mailing list chain Peter Chen states=20
> > Besides, do not connect HUB between your host board and emulation board=
=20
> > (for sending VID/PID).
> but there is no additional information regarding this statement.

EHSET is used to test embedded host electrical signal required by
USB IF Compliance Test, not test the signal for USB HUB, since the
EHSET module could only let embedded host controller enter test mode
by writing TEST MODE registers follows EHCI or xHCI spec. Maybe the
USB HUB could let its port enter test mode, but it needs to use other
ways, maybe vendor specific commands.

For your PCIe xHCI controller, if it follows xHCI spec, it should work
with EHSET, would you please debug it by code and see why return error?

Peter
> Looking around
> it looks like the hubs have some mechanism for being tested[0] and the HS=
ETT=20
> application for Windows supports testing of hubs according to the=20
> documentation.[1]
>=20
> Is this something there exists a module for or are either of these cases
> unexpected behavior for the EHSET kernel module?
>=20
> Allen
>=20
> [0] https://eur01.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fww=
w.testusb.com%2FHub_test.html&amp;data=3D02%7C01%7Cpeter.chen%40nxp.com%7C3=
70e9acddb11494ec68008d7363a93fa%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C1%=
7C637037497528612416&amp;sdata=3DdjXerGrLCkeITKRqg4KteuzNn5TMxeOhqif58DWJYU=
E%3D&amp;reserved=3D0
> [1] https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fu=
sb.org%2Fsites%2Fdefault%2Ffiles%2FHSETT_Instruction_0_4_1.pdf&amp;data=3D0=
2%7C01%7Cpeter.chen%40nxp.com%7C370e9acddb11494ec68008d7363a93fa%7C686ea1d3=
bc2b4c6fa92cd99c5c301635%7C0%7C1%7C637037497528612416&amp;sdata=3Dgem9tyxRA=
WIppDFW%2Fpw08dPKqQQ9NMX%2BhH19V2SloiQ%3D&amp;reserved=3D0
>=20

--=20

Thanks,
Peter Chen=
