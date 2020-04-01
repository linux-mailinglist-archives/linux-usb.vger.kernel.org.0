Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3471419A987
	for <lists+linux-usb@lfdr.de>; Wed,  1 Apr 2020 12:26:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731839AbgDAK03 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 1 Apr 2020 06:26:29 -0400
Received: from mail-vi1eur05on2077.outbound.protection.outlook.com ([40.107.21.77]:56160
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726785AbgDAK02 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 1 Apr 2020 06:26:28 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZCJy89JgjIRU6xZKUiPr1Nnh8PTjdD8EETWmWCbqFzm1MFaQ4NlNKVX/3TeSPxGRDi2MspADotlGzXIpcxz2udcP3n123/mZpO96u7/qboFYVmhE0sLG4sXNA15jE5iJnK+o0f5HqenFw6mmOjsF2vaIV3nkIHOctmmbISXZMccE42jagfy9zGS5vMLImUt2CYaPQZxkKCLehUdwSmEb6+GGu+QPqU9Mk49yFIMzI1s/ozYvky7bleEYAajDBd4QOgldW7rmARqE4NBZ3hpaehqBS0NJc8sySH4n15/dgnESzU12Tx1Aon+xIn1H94cIJqN1eFHp45cD1Yo0n4ro8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BkSR6sGVLM4X/hojPflaDvix11c/NFDKrZyCqBvvuGw=;
 b=FkHr5KC8QuJv+jmQxMmnSDVdLTPpJ4ZM6OTpu2qDEcF7UqV7z1eeJExKtVcDfgEEQwha3lriQC41NreYEzRmpiNrfY/IpZrqzrLt2UUI/bUys1+5rrk9xLaAigFjeUC0LDozMOwc53zjGz7eYTPCGwG0ajNkPaRgxqHD2NJDv1JQi2h3otWbRoiu0FFnM2rNCJTPl+aSYhJ4L8FRCzWElTxhYK4a7yyZfg9qdkZnUcL2SoGrOf5G7qzkL4v58ZFORMHPcfw4xJlGnWoPu6yvi22Zub9+JuWWOUDLXEMFy/0/zAl+HLHN3MOX49M/iPjZ4BmUfX1pP7lA98rqqzkYAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BkSR6sGVLM4X/hojPflaDvix11c/NFDKrZyCqBvvuGw=;
 b=Xf+uevZh5m2Ln9aENUH9JpQ8C5XD5iFrH6Q3kvnfqC3x4cljnNdRfQwPdE59OyJdpU66dgJl2hU6tMglq7gjZZ9FckWJFRN3KkKYUIjZFRnuSIWxA/9iblUqZsm+sZKNPb+PEIm7LzsPkLiD7DFi9P0+37jIBfC5yEstOJlZJUQ=
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com (52.135.57.84) by
 AM7PR04MB6853.eurprd04.prod.outlook.com (10.141.172.210) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2878.15; Wed, 1 Apr 2020 10:26:25 +0000
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::902c:71:6377:4273]) by AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::902c:71:6377:4273%5]) with mapi id 15.20.2856.019; Wed, 1 Apr 2020
 10:26:25 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     Mathias Nyman <mathias.nyman@linux.intel.com>,
        Alan Stern <stern@rowland.harvard.edu>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: RE: [PATCH 0/7] Universal Serial Bus: Removing Acronyms
Thread-Topic: [PATCH 0/7] Universal Serial Bus: Removing Acronyms
Thread-Index: AQHWB/gCzPIPkxE2DkSHP5eqylwmQ6hj4QcAgAAB1QCAACn78A==
Date:   Wed, 1 Apr 2020 10:26:25 +0000
Message-ID: <AM7PR04MB7157968F8BC12AC42CD397B38BC90@AM7PR04MB7157.eurprd04.prod.outlook.com>
References: <20200401073249.340400-1-balbi@kernel.org>
 <20200401073806.GA2019004@kroah.com> <87pncr1wgn.fsf@kernel.org>
In-Reply-To: <87pncr1wgn.fsf@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=peter.chen@nxp.com; 
x-originating-ip: [180.171.74.255]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 1dffb855-7cf6-4ad9-98f7-08d7d627220a
x-ms-traffictypediagnostic: AM7PR04MB6853:
x-microsoft-antispam-prvs: <AM7PR04MB6853B30E9AF6EE6D7C8B90158BC90@AM7PR04MB6853.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 03607C04F0
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7157.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(10009020)(4636009)(396003)(39860400002)(346002)(366004)(376002)(136003)(81156014)(8676002)(81166006)(8936002)(186003)(86362001)(66446008)(64756008)(66556008)(76116006)(66946007)(66476007)(55016002)(71200400001)(9686003)(54906003)(478600001)(5660300002)(110136005)(316002)(52536014)(26005)(2906002)(4744005)(6506007)(44832011)(7696005)(33656002)(4326008);DIR:OUT;SFP:1101;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: d4u7kG1oYwKNa0RyB0TlEYvpkeOpjMMRNT3yzuubRxQ+ILkrVfFqI1JXtHgq19lfeujcrOkseFIR8NezNhQDjiHeF29V4iWSbg5caAv1fadqmlW5YlZnfhGFrt8PaVHr1e+aQOmVEfEVEJv6d2hvfbiF1J03wPwUCuGMgjJETCb9uJW1ktDdT2aPy7YTP+TjfIaPGzm2Zqt/kT2e+n6YxgSpNoWO3gXIX/c8YYiEHGuNqDNfxmVBisOXEo9J8SqsVEfH/iKpV5jqM2krzcLrY6cIA+qoRm+jci0K57CUn3gPjqTJLS8+uoL0qr5ySwDY1bCzVsJ1B+stKMglUvMadDRnShBhmZ1belc2kRDNdzVDcf1VNHu84pRul3jNDdXzLWCofG1Go5gUeR/yttupQe8PqOl3GK6Z7fGgYv5SKzCmT+8UX8aiLal/K40xF6EN
x-ms-exchange-antispam-messagedata: JYnqtHIhrPXFV54W27Bc3hswKzZCKpkhkQPnIUlZVhy4EQPZCQpSJoMDtvHyR/BMIkyhUVHqedALNRYnI81DZP+qjYan68rHjiR2P6VKwR5S2uKzRg61AHcgIWsRvBOctaWVXZ4oLSm75bXqUvFaUA==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1dffb855-7cf6-4ad9-98f7-08d7d627220a
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Apr 2020 10:26:25.8745
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ViFzETBBS+XwcoPpZ3mp7kEyJk1oztJCHiA47d0BgSaaWKZ9rcehVJX8VxOcJ9+X5w0VMeLgJpL6Rkck6rVoSA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6853
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

=20
> Greg Kroah-Hartman <gregkh@linuxfoundation.org> writes:
> > On Wed, Apr 01, 2020 at 10:32:42AM +0300, Felipe Balbi wrote:
> >>  764 files changed, 86304 insertions(+), 86304 deletions(-)
> >
> > Ah, a nice tiny patchset, I'll try to sneak this in during the merge
> > window now :)
>=20
> That's great, Greg. It'll help hundreds of people, I'm sure.
>=20
> > nice job...
>=20
> Thank you
>=20
> > greg "I know what day this is..." k-h
>=20
> felipe "I've been mostly confined" balbi
>=20
> --

Just one small comment, it may let the code line exceed 80 characters often=
,
is it OK? Or the 80 characters per line is not mandatory?

Peter=20
