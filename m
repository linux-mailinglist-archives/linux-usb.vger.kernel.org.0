Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D658B14279F
	for <lists+linux-usb@lfdr.de>; Mon, 20 Jan 2020 10:48:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726451AbgATJs1 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 20 Jan 2020 04:48:27 -0500
Received: from mail-eopbgr60065.outbound.protection.outlook.com ([40.107.6.65]:23937
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726075AbgATJs1 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 20 Jan 2020 04:48:27 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DKnneqfwlBTetl9O45LJ9QGTfx+mHpKbHgtjWiT617EBGwjuBzcXd4Iv3k7VmLKjii+unY4X5EGWPeB+74dQDMruuLg5IucRkXyImpCiVfz8x1thXxqjRTScfkKd3yVhWxaVAeoIwto96EGRxDlq48OEnzfxocQ6ZNN5eev56soE3BkwN+uydXGsyXX8CcklIDHMDorzrqA1JDrIvNiSV8USmqvxxSVcS+ok4WZqQuWYQgyAbuW2OZnBX7S8C6ekzaDEl2KhRUhSudnsgP36Jj6t5DGwlAx7ha6e9BDfPne7dRpciQIuDJ9HQgLBoCcVXI5bJjeF1KRQzKIEQnwaZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4qDro2/sEw3NuzuCn+FcnL0HaD3nL8WU4kyil5KfQDc=;
 b=VZ6Xbd1KYtk5GD7li0nP1PEKSZ6Na/RrVtxQwsq+7YqyTSxbsYaGRIh2AKSt8jneTxcoHpcFH2CjI0H91kEgNMWbKzjoMlWtOLQLaixxdLUltHM2gYgR2ISRTk56/fA2p2PERkQDLGKfUMAyrdfMAG9Zs6ftZlBHmUiMNsSKiU1eVH7OyuWIqjOjcP0/nxM4pSoKuVPog8cWzIqhdVv9TEo1r9NW9Tzt09PYxv8vrOFYdCJY7vhy/xYoENBe/ROLkpQXnm52N0383FxVsGftpC2Y4PxkAyUNaUTBT0lko/UAM9q/9teeN1TqpHsZnYRFzpcnhdpK9piiYK4ipz1hnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4qDro2/sEw3NuzuCn+FcnL0HaD3nL8WU4kyil5KfQDc=;
 b=chluR1jsS/6/gtLubTFrH3T5Rsl2RwpaD1eqAsFIiy+49HK02n6GJx9USvPQ7C44cfg7Df7BlbD5AEtXyD+kivJjKwiIsUkqUdJFb+P24qH6AiyB2f6NZcV4Fk49J1JgGonR1mz/JRgG3Fmmv6bWoBlppeNiL0VjgabojzOC74Y=
Received: from VI1PR04MB5327.eurprd04.prod.outlook.com (20.177.51.23) by
 VI1PR04MB6093.eurprd04.prod.outlook.com (20.179.26.204) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2644.22; Mon, 20 Jan 2020 09:48:24 +0000
Received: from VI1PR04MB5327.eurprd04.prod.outlook.com
 ([fe80::c7d:58a2:7265:407e]) by VI1PR04MB5327.eurprd04.prod.outlook.com
 ([fe80::c7d:58a2:7265:407e%6]) with mapi id 15.20.2644.024; Mon, 20 Jan 2020
 09:48:24 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Felipe Balbi <balbi@kernel.org>
Subject: RE: No message is showed after USB gadget has configured
Thread-Topic: No message is showed after USB gadget has configured
Thread-Index: AQHVz3CN7pnWzUHGy0mcC5tRnuvKLqfzSV8AgAABQeA=
Date:   Mon, 20 Jan 2020 09:48:24 +0000
Message-ID: <VI1PR04MB53272657D56EE193CEB29CC68B320@VI1PR04MB5327.eurprd04.prod.outlook.com>
References: <20200120090357.GB19938@b29397-desktop>
 <20200120092934.GA382520@kroah.com>
In-Reply-To: <20200120092934.GA382520@kroah.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=peter.chen@nxp.com; 
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 0bf020d4-d1f0-452a-fb46-08d79d8de47b
x-ms-traffictypediagnostic: VI1PR04MB6093:
x-microsoft-antispam-prvs: <VI1PR04MB60931694A7E21D96F8D793CF8B320@VI1PR04MB6093.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1417;
x-forefront-prvs: 0288CD37D9
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(396003)(39860400002)(346002)(366004)(136003)(376002)(189003)(199004)(5660300002)(15650500001)(33656002)(186003)(6506007)(4326008)(26005)(76116006)(66946007)(52536014)(66446008)(64756008)(2906002)(44832011)(7696005)(66476007)(66556008)(81166006)(71200400001)(55016002)(81156014)(478600001)(8936002)(9686003)(316002)(6916009)(86362001)(54906003)(8676002);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR04MB6093;H:VI1PR04MB5327.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 9cmQGK8yu97nZSFw2ZLexmg9cwyWOTKpQ3kYnyGlfyp5zlaodLLjANx8z0dmwqw+GhyHSTso2E26C2ZGEWbJ0LrEhJ/TysldZmrEPE0FLuUbtGXMruN94yEkDK68PjCqplBdjRkzntW+rSvOwrs608wxIPGaocd6QNiV8zb3BSkWrN8nQ7Prc+Ah7houLIsh+gWvoJxWiLvOAlIH2uM5D49aW+yRHJyImR6ite8TiWXQUVkGYNP+9LmGCgJZ1yDfdrzPSJrlBirI4R4ulQwHwMf5SPyBdZInjEk0s0dQ2gQuLBYP8NXxfVF0+Exv9z9BW3z8MIdFTqHbtmaYbgm8FOGRTcH6qg81Q2KvE2G6bqlkiqGswqtJxEX2X6qpO2DVKsUJbNaFY4JZFY12k/SC/SDIwgV5wwbfKFNw1SJf9D4sry25cj02SmjTOwnJ/FpN
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0bf020d4-d1f0-452a-fb46-08d79d8de47b
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jan 2020 09:48:24.3925
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2JXyuX1HPDdp2BuNYlPFgToFig6EhNWp3UtBGCuevh45yxN2zQaWdZTB21UbaW+opRTp62k3ByLsTaH9tKuasw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6093
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

=20
> On Mon, Jan 20, 2020 at 09:03:59AM +0000, Peter Chen wrote:
> > Hi all,
> >
> > >From commit 1cbfb8c4f62d ("usb: gadget: Quieten gadget config
> > >message"),
> > there is no any message from gadget side after it connects to host and
> > works correctly. Although we could cat "state" under
> > /sys/class/udc/$CONTROLLER/ to know its state, we can't easily know if
> > the gadget works or not from console, USB host could have many
> > messages after one device has connected, why we can't keep one for USB
> > gadget?
>=20
> Why not make "normal" USB devices quieter too? :)
>=20
> Surely you do not have tools that watch syslog to determine if a device i=
s working
> properly or not, right?  That's what sysfs is for, not syslog entries.
>=20

Yes, we use our eyes during the hot plug test for device or count the numbe=
r of
messages for it, with this change, it may cause difficult for hot plug test=
. For
other tests, we could judge sysfs before later tests.

Since this message in there many years, we (and tester) may need time to ad=
apt for
this change.

Peter=20
