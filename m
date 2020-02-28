Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 596E617344C
	for <lists+linux-usb@lfdr.de>; Fri, 28 Feb 2020 10:40:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726838AbgB1Jkl (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 28 Feb 2020 04:40:41 -0500
Received: from mail-eopbgr40072.outbound.protection.outlook.com ([40.107.4.72]:22171
        "EHLO EUR03-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726005AbgB1Jkk (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 28 Feb 2020 04:40:40 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F+QkqHHDirZUqu3oytz/QF0SK/MMhchHOwSdGwVGUY6xTE41sDbATGf6jLhVzIN7RG3ZJD+Yf7oQI1Zl7tdzZo5BlNy8OXBZ2HAk35cyr+GELCYApkUlNo8oBGqqasdVhAN/QPThZnx53u0bOuAXyK9D/1r7vLv+tbMhA85RSYNWMPF1uPrWK6+K+dmsS9jog2ZocsSGKi4k5W35P0J4/wkvvwi8dTk/PL52J/NgjvNs+lvwVCZfUKDs5a1CV2cv4hbz5QyCIkg9xUgMSUNEtdz3n/yXb6QI4ObF5TExtv4ITobl5nF67/PzeYmmoNLhS8WfOKDEgt3U1lJgAglO9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qu4U3Qfap0aPW6N0ypHrUYNcGu4IbNPsjaseEPd8k1Q=;
 b=CfvxYgpQWSWqGqRh8rgMWGT8mi9aLjTdhyBDWoKaMrM9GVKUQRyvefE2/W1WUevEgDHG0s57Bc2DveYNj4mQolLaBMMpWcamRcfTXOEr4HK7DMR7HCP5f5Ri1wfGaBxzDsDtOcqT1FX4WwrNqaw6sXroIgpwuNro8ODKSvYDEr0AKs9N2OW39BR3bxveim1gYghlAXBONQUvBiRTXzrdTy54aD5nmXu/q/cGoWhlI/Kta240hfyvBOY9LV5GEJ2vTL/E9F+eq7tumqJm02WE9o6zy0vPM5/mzIr0hxoV7grynySh4TCNELV0+Q76swcZ6d/kuf47IYrBrvvTLviwfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qu4U3Qfap0aPW6N0ypHrUYNcGu4IbNPsjaseEPd8k1Q=;
 b=VjOK+508HeFt8pcNOjY28G3QZYfEIdCajFYABpD4sbRFnUT3hk5P4csB8G4pO0QjwfLj2FpA+QJWKsAK7peTxt/jq76w3nnjdcTem5+hrMASW+y/OrhkdXRpXSAOkNHJwDgWPANwZajshgwneR88cBLjXXCV0CHDHoMuCFoh/tc=
Received: from VI1PR04MB5327.eurprd04.prod.outlook.com (20.177.51.23) by
 VI1PR04MB7149.eurprd04.prod.outlook.com (10.186.159.86) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2772.16; Fri, 28 Feb 2020 09:40:37 +0000
Received: from VI1PR04MB5327.eurprd04.prod.outlook.com
 ([fe80::9547:9dfa:76b8:71b1]) by VI1PR04MB5327.eurprd04.prod.outlook.com
 ([fe80::9547:9dfa:76b8:71b1%7]) with mapi id 15.20.2750.021; Fri, 28 Feb 2020
 09:40:37 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     Marco Felsch <m.felsch@pengutronix.de>
CC:     "jun.li@freescale.com" <jun.li@freescale.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "stern@rowland.harvard.edu" <stern@rowland.harvard.edu>,
        dl-linux-imx <linux-imx@nxp.com>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 0/3] USB IMX Chipidea fix gpio vbus control
Thread-Topic: [PATCH 0/3] USB IMX Chipidea fix gpio vbus control
Thread-Index: AQHV7VqVZ4BeDr6e5UuTM5ZPfBO9kqgu5JsAgAAEwYCAAAyagIAABoeAgAAFTBCAABreAIAAzJeAgABTGwCAAB83gA==
Date:   Fri, 28 Feb 2020 09:40:37 +0000
Message-ID: <20200228094039.GB31815@b29397-desktop>
References: <20200227104212.12562-1-m.felsch@pengutronix.de>
 <20200227111838.GA24071@b29397-desktop>
 <20200227113539.gcx3nfwm2fbm3ukv@pengutronix.de>
 <20200227122045.GB24071@b29397-desktop>
 <20200227124406.6kbgu3dbru4qmews@pengutronix.de>
 <VI1PR04MB53270541BB66CAB1EB8F00008BEB0@VI1PR04MB5327.eurprd04.prod.outlook.com>
 <20200227143914.mi3vsltrtyo5sqed@pengutronix.de>
 <20200228025129.GA31815@b29397-desktop>
 <20200228074856.gomzgtoxwzj4eele@pengutronix.de>
In-Reply-To: <20200228074856.gomzgtoxwzj4eele@pengutronix.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=peter.chen@nxp.com; 
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: da0a788a-53b7-489c-cf17-08d7bc32442b
x-ms-traffictypediagnostic: VI1PR04MB7149:|VI1PR04MB7149:|VI1PR04MB7149:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1PR04MB7149A2DDCC1A987F503F31E58BE80@VI1PR04MB7149.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 0327618309
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(7916004)(136003)(396003)(366004)(39860400002)(376002)(346002)(189003)(199004)(33716001)(71200400001)(64756008)(66446008)(1076003)(9686003)(81156014)(53546011)(8936002)(6512007)(478600001)(8676002)(81166006)(186003)(86362001)(6916009)(26005)(316002)(6506007)(44832011)(54906003)(5660300002)(76116006)(66556008)(66476007)(66946007)(33656002)(4326008)(91956017)(6486002)(2906002);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR04MB7149;H:VI1PR04MB5327.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: emx1T+ne95kVaIFn1MbLbJ1T29W6a9yyOv1KyXNTeHTnW0AJcKVj4ZGnbzi9U0nN2nP581B7gfcghn7mZePCqri+2c2TH/3UZdLSQnhJx/gNKvGYpUZWyKLnbBt4VsYT7dP+PlHj4UcsvlQ5cOVX+Ak7x5A+614FWnQLt3VHN971qejA99AUplWowviu5r8aRncd8BWsadFbsPSv4Z5P2lMZX7oSbFYbxHyw36gWkrdi0irECd3ZNo2ldP8MANE/3/tmmqhS1FV+2HYACeTqD6NVYsD0J2uuoh47zhfYcHQSbcHp25tVIZSHXtyLjDYb+uPB8qw9aIB/lsM6prvvwj8w30qEVgnTcIC6g5uFIw4vkaGgl6GxPZwvw0HkFvN2W8cMpeccCj1zMEAjtiwHtsbRhnikzOGeMq8QlfknK+002ExM5kOxR5ch6s9y8CMv
x-ms-exchange-antispam-messagedata: iOYUDz06QOm4Tdg2u0PtLN7GEGF7jtFavfY+NGXffHbeSXm1N73QigmJGszOEr/DDC/Tq289UJ8bgb8nmQkx8rbusGW0QE2xzU2D/m5G7RQ3u1qIv0wZEV/fxLSlbURuOoKVpr3BVxzvV2Gdev0+8A==
Content-Type: text/plain; charset="us-ascii"
Content-ID: <5F7E1E671A104B4BAF9D6B45978DA6CD@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da0a788a-53b7-489c-cf17-08d7bc32442b
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Feb 2020 09:40:37.3553
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mQqEFOBEoJ8lL1CBlli/cfBgNZv/8+eoeSSNmvYK7Oua4QEuhHuRIWwpoe+7/MX6EZybWb1g2c2PjEBFP+nTpQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7149
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 20-02-28 08:48:56, Marco Felsch wrote:
> Hi Peter,
>=20
> On 20-02-28 02:51, Peter Chen wrote:
>=20
> ...
>=20
> > > > CI_HDRC_TURN_VBUS_EARLY_ON is introduced by fixing a bug that some =
i.mx USB
> > > > controllers PHY's power is sourced from VBUS, the PHY's power need =
to be on before
> > > > touch some ehci registers, otherwise, the USB signal will be wrong =
at some low speed
> > > > devices use case. So, this flag can't be deleted, it may cause regr=
ession.
> > >=20
> > > Pls check my archeological findings and again pls check my patches. I
> > > deleted the flag because isn't required anymore afterwards.
> >=20
> > I have already checked your patch, your patch deletes CI_HDRC_TURN_VBUS=
_EARLY_ON
> > quirk, and it may cause regression.
>=20
> Arg, sorry now I see what you mean. Thanks for your explanation :)
> Since the 'struct ehci_ci_priv' contains now an enabled state we can
> git rid of the flag. To get it right, the writing the ehci PORT_POWER
> must be done before or after we enabled the VBUS? I'm asking because
> we can drop the 1st patch of this series.

Both are OK.

--=20

Thanks,
Peter Chen=
