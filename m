Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 45B3A61602D
	for <lists+linux-usb@lfdr.de>; Wed,  2 Nov 2022 10:45:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230075AbiKBJpX (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 2 Nov 2022 05:45:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230178AbiKBJpV (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 2 Nov 2022 05:45:21 -0400
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03on2085.outbound.protection.outlook.com [40.107.105.85])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E268233B8
        for <linux-usb@vger.kernel.org>; Wed,  2 Nov 2022 02:45:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EGo7bmPUoooFxEY7lGn2E2QmtTPUZ8hi7hUHSfCPQV3v//62zVIIszjP30sBIHrc0NjlZHDuXwyNYSGVK7FuzKSCjKGmdYQhsw6yk7qm+bBsu3sI5DUWDWvGhBm0rdx7c9l28+BueNEsWmqZ7OK2DZpucdeuod7ehcDMUS5cQv3hSHLzXqNmmZ9Uu0GYWK4nj3pmSukeN9Kbs6eKrPKUQSzJX4ILCGnieFQ8BCdVP1sWeeRHy+XfUuZp+pDn+deXsMroSvLDSV6i/iKzZSxpP8m/9JAP2KiV5t9IUIEfgSer8zVanP+jfmBj8/uO0K5iLWifiEAdy2OfBVabSNq4JA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+Oz3QGJBAwFXYySAa0m6HQSWdn79B1UektNbzZNiQxc=;
 b=ena+TxxtlkouhU7ThlskdVqRjmY+GOYd+awMDFUw5bodEhTtf5oycunxJQQU+1Gy2xreFHJy86r18EBnFcAYysVkxzUzMMt6KgOVtxHri6YSh+0Q6+KVWfePaDsaLC7DuOcSDtIIduDKno9sxTMj40VwXYkjmKzeQKHCy8vccKqt/W7AmAqFxGTTvKvZkQ8e9IebQaeLbaWNIgwNGAInhdPBqJBwVdn+RqpUb8WuRgGg79Co68uUe6ZzQaP3JRC8mr8ZfXgCaQfn0QCPPJPLDgOV5Qrn7tLqhVsH3wviJK3izDsoifqT5GagKeKXOXPtW/1jS7tGN7Dqy4HvKumpXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+Oz3QGJBAwFXYySAa0m6HQSWdn79B1UektNbzZNiQxc=;
 b=DVIXcey1jJLfh89KJnqcjmcxx0fUbHe8d1np5A0hULBCS+ROP+98F8eGNu0wRX+OG4RLk1yp82RJVU/utPzoJsCp2YxkYNd5sMotBr1ld178ZtM+a9WhCDGd2mimGc9/hc8OrdpQFSpnUUo7Z4F0adEe7DcedjlMu8wJXGYlsPk=
Received: from PA4PR04MB9640.eurprd04.prod.outlook.com (2603:10a6:102:261::21)
 by DU2PR04MB8760.eurprd04.prod.outlook.com (2603:10a6:10:2e3::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.16; Wed, 2 Nov
 2022 09:45:17 +0000
Received: from PA4PR04MB9640.eurprd04.prod.outlook.com
 ([fe80::cc4:c5c2:db97:1313]) by PA4PR04MB9640.eurprd04.prod.outlook.com
 ([fe80::cc4:c5c2:db97:1313%9]) with mapi id 15.20.5769.016; Wed, 2 Nov 2022
 09:45:17 +0000
From:   Jun Li <jun.li@nxp.com>
To:     Francesco Dolcini <francesco@dolcini.it>
CC:     "Jun Li (OSS)" <jun.li@oss.nxp.com>,
        Peter Chen <peter.chen@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        Felipe Balbi <balbi@kernel.org>,
        "philippe.schenker@toradex.com" <philippe.schenker@toradex.com>,
        Francesco Dolcini <francesco.dolcini@toradex.com>
Subject: RE: USB runtime PM issues on i.MX6ULL
Thread-Topic: USB runtime PM issues on i.MX6ULL
Thread-Index: AQHY6slI0uttgXhTUkWibWMoTeyBrq4ohyNwgAADqQCAANZ5gIABH8MAgADk9+A=
Date:   Wed, 2 Nov 2022 09:45:17 +0000
Message-ID: <PA4PR04MB9640FA4674C8B80A9FEA44DC89399@PA4PR04MB9640.eurprd04.prod.outlook.com>
References: <Y1vLpaxpc5WBCuGD@francesco-nb.int.toradex.com>
 <PA4PR04MB9640E8D3E851800492D8FCAD89379@PA4PR04MB9640.eurprd04.prod.outlook.com>
 <Y1/TZqsqy/ZRVNqJ@francesco-nb.int.toradex.com>
 <PA4PR04MB9640863D2A1F38A10C8BDFDC89369@PA4PR04MB9640.eurprd04.prod.outlook.com>
 <Y2F4tCMaB4x2fZck@francesco-nb.int.toradex.com>
In-Reply-To: <Y2F4tCMaB4x2fZck@francesco-nb.int.toradex.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PA4PR04MB9640:EE_|DU2PR04MB8760:EE_
x-ms-office365-filtering-correlation-id: a6877f14-e977-4411-81d6-08dabcb6f321
x-ld-processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: tIdN/e2fQXgfMRFX4nS6iCQzqVIhq1feQHWiilNctrjHwiOo1w5jrxUmH/I9Ys4aH2uKo20ZncaAHX0p4qAeKkDE6QqJ8t1nlhHgeBkj/DZ7G/EU4XCuhEKbcWH/EuVUvG/MbTBFCa0VJAmm/t5eWBR8VxezIj7Yfm1iNhPLTtbG4rfc7J9m3/4rBFBmMjRhqeYpTmvYTB9/ys7ZGJmV2L/o1/xKuKF7F39ta/YlNR/GEHM2DlaCFO0sQfsMXOup04YhVo5E9DVKnwEf34sMrcIv1oWrAm/7czs75Aw03n+j8n5QOPI81PqegYopNYp6+hbYnKCRuHV6q0FSvAfUjOAnFbi7ETSJxIFmXN6H/Ph15BEM605gi6/6tsehe+vgR4SdEbtAC73zT/vDECLkUR0G9kf2iUYy5qFFaEvVqFLPeMyE7fUHZ6ypMlVP8+FWeWuue6HoMp18tcDgRYkHGozPHKioidGbQsk5TPPBUBdqVZrSu/QVRSHHvusMOSiJPdB8VZ6YZFqqzaMvZ+FAphaiG11QB5KyziPooqeE4DhJysqOqpuJRRTVIm1qvV8qx2r9Ea090NosbaJ9CJqcUOpys3i9SMAOLdUrwHaWa0mjU5c7ojCbj+EyyKNTRl7Re2E0egj6HaLvBjrwiO8MFnbEfqEBy3PzK03kCmhjLTTrWPuHHsGuGAD5gIzyFY21RmJ1Ibv3sC/X0/wZ8pIfqIBlaeUIkgqC0ww867MMJQj14QdO2V72ETqOF+mNatfdSoWDB3bpSBdc+U/4CFnowg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9640.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(136003)(39860400002)(346002)(366004)(396003)(451199015)(66946007)(316002)(44832011)(26005)(64756008)(6916009)(66476007)(4326008)(66556008)(55016003)(66446008)(76116006)(38070700005)(8676002)(53546011)(9686003)(7416002)(8936002)(33656002)(54906003)(52536014)(6506007)(5660300002)(86362001)(7696005)(41300700001)(186003)(71200400001)(38100700002)(83380400001)(2906002)(122000001)(478600001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?6MVbgEHSsz9tZ12PsqXHBV6ULHzjISU0163wmgCLmhx6eiKlPcjrSygL/HWD?=
 =?us-ascii?Q?TojopWRdydLh6uX9T09wywKnhWlbeSPvBr8DMsYCYRW5g+F1kl3JStJNBNOk?=
 =?us-ascii?Q?fHQVqwEecVRxgitJ/h4ZXTT8S9x068wVxxfryqXbbLz6nKbgoc48XT1OVA4g?=
 =?us-ascii?Q?E0zuff0xQu6Z43VlTN6M7PI41d2RxnU2u0MbFHfVe4DAVnuep2Tg+xCg0hg5?=
 =?us-ascii?Q?XWu4Y4Vk6GEntgkVLwJd+dA82Y9NmM1vYy5y5MDr545kMFuODlJ65aQZT1Ff?=
 =?us-ascii?Q?gSGyWms+QRbhTn29NTzaZ1gqBjygh0TPoepW1FoWWUsscQxq6OoB2iTlbNx5?=
 =?us-ascii?Q?KR/PZIiQK5xneONAenkr2w5d3cKEXY7r7lMujZZc5W130rJs7N+OxKDFiIBQ?=
 =?us-ascii?Q?F2iSDTmL4MI0TalXd3EwALJTZPJx+yXL2kCMkT6pJrCMkqgl+tjI9emWwPGh?=
 =?us-ascii?Q?AukO9N8eD/H3cRid/ztb0bd2zjgs0W/QTOP4vyaEs8Tx2Re0Qwl3WLUVSL5f?=
 =?us-ascii?Q?655IKGAK8Q+fqeUpJrFGHWlDT0eFgsq8xse5/p/KyzBn5zrSrBg/Jiwvz7c1?=
 =?us-ascii?Q?V4sC7BAOXZ+0TMKfVp8PGJcONcGW3VEFTh5mcuvNGCdotaU3SNP1O5ElRdYt?=
 =?us-ascii?Q?60+PvD81eyJX5iWODHUPuToHxgO7EP2hmZ4c8yAZ/MBI26Yz0kMyh889KX7K?=
 =?us-ascii?Q?PMXigImwX3Lj9Z/cPqqB/yExMx4Y6LNs4QW4ZVbOh4FRZ1n+Gh9GwpufK2yC?=
 =?us-ascii?Q?+fuLs4HcIbn4uNfUb1ytYgRT4Vhc20RUiEDGCaxsO/M4i6Ky7LMMojAN3keY?=
 =?us-ascii?Q?2KUEnKcMS8pq3mZJ060X+II6GbND8VYyLWVdF+l2wZ9x7x73Somc3RBhA41P?=
 =?us-ascii?Q?9Q/D98QHxE2rewGZvL/HmZ3XPxY4bgLv8cbLBzKWGI9bTN7nFbT8i7FROTGN?=
 =?us-ascii?Q?FYxb5CLqeljPnm31WNJFalPuxPWH04eXk05yomjMgYdBwNNUiQB4dkjcYLTs?=
 =?us-ascii?Q?oAXk1LWWdBB+eAttsq6XFMb0jmmWBLPaXr3o1ZDOZVlBugA+bNtB9C5FIOLx?=
 =?us-ascii?Q?8G+rR0Fi+7Ca5JMet2tAVL7/tdgZF17rPTCMsA4NRgsVxwFRdXXhPsqJLyQQ?=
 =?us-ascii?Q?74OQUmZ4K/ZyinaG5BvI1waltm2lmIdxO5wpRLe+Gw29guiVxLmhV9tTZzpz?=
 =?us-ascii?Q?KPTtfn8ABF6JKAFUp4Y1o9DC3tQmqfLTVniFH8t5vDCpVhhxOSmiG5p5RTRS?=
 =?us-ascii?Q?b8lT43VpMxLrOfEtYHSjTLN6/0pBrd89PoqAqtjFWQzQosJT63hUq3OyNLOB?=
 =?us-ascii?Q?CMabCeHq5LEcl1dmCUkxnloeO059ok7vl31Jv8gsBleiWD7hsvwoF6ujcKwm?=
 =?us-ascii?Q?ip+korJYjO7jm4dA/SlTN7OQDwGR+OcXblgu2L+logxd4cTBWg8q4wDjUBVs?=
 =?us-ascii?Q?TwRBKb2MhyBvbccNkiPH59POsNOPQC4jfxGgqypidTFrguTM5LkgSU+1Rq+5?=
 =?us-ascii?Q?A4GaYIgM6D8IsSMSH2cXjgHCTLHX/cvbEci5MsqFtVUwBL6BdLZfVEnfvnu7?=
 =?us-ascii?Q?5fvflMTg4Btm/n5wkM8=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9640.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a6877f14-e977-4411-81d6-08dabcb6f321
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Nov 2022 09:45:17.4850
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yu8vl9/dK/lIWLZksKDvZYH8BUJUnRzWda+njhdXuNvaX2DhUZ5dzCyj1JrlIPi8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8760
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



> -----Original Message-----
> From: Francesco Dolcini <francesco@dolcini.it>
> Sent: Wednesday, November 2, 2022 3:51 AM
> To: Jun Li <jun.li@nxp.com>
> Cc: Francesco Dolcini <francesco@dolcini.it>; Jun Li (OSS)
> <jun.li@oss.nxp.com>; Peter Chen <peter.chen@kernel.org>;
> linux-usb@vger.kernel.org; Greg Kroah-Hartman
> <gregkh@linuxfoundation.org>; Shawn Guo <shawnguo@kernel.org>; Sascha
> Hauer <s.hauer@pengutronix.de>; Pengutronix Kernel Team
> <kernel@pengutronix.de>; Fabio Estevam <festevam@gmail.com>; dl-linux-imx
> <linux-imx@nxp.com>; Felipe Balbi <balbi@kernel.org>;
> philippe.schenker@toradex.com; Francesco Dolcini
> <francesco.dolcini@toradex.com>
> Subject: Re: USB runtime PM issues on i.MX6ULL
>=20
> Hello Jun Li,
>=20
> On Tue, Nov 01, 2022 at 03:10:46AM +0000, Jun Li wrote:
> > > On Mon, Oct 31, 2022 at 01:40:39PM +0000, Jun Li (OSS) wrote:
> > > > > I am debugging some unexpected USB behavior on a i.MX6ULL SOC,
> > > > > chipidea controller ("fsl,imx6ul-usb") and a fsl mxs usbphy
> > > > > ("fsl,imx6ul-usbphy").
> > > > >
> > > > > The HW design has 2 USB interface, the first one is dual-role,
> > > > > while the second one is a host port with NO way to re-read the
> > > > > VBUS (USB_OTG2_VBUS is not really connected, there is just a
> > > > > capacitor to GND).
> > > >
> > > > How is your USB_OTG1_VBUS status? Can you try to make your
> > > > USB_OTG1_VBUS pad has a valid VBUS voltage, then run your Host
> > > > only port test with runtime PM enabled?
> > >
> > > USB_OTG1_VBUS is tied to GND the same way as USB_OTG2_VBUS, not
> > > really straightforward to do such a test.
> >
> > iMX6ULL need at least one valid VBUS(either from OTG1 or OTG2) as
> > input to power the internal USB LDO if I understand correctly.
> This surprise me a little bit, since
>  - the i.MX6ULL datasheet prescribe to keep the VBUS disconnected if
>    unused

I think "unused" here means you do not need/enable the port at all.
=20
>  - downstream NXP kernel seems to work fine ("seems" since we do have
>    some patches there, so I could be wrong)

What do you mean by " downstream NXP kernel seems to work fine"?
The downstream kernel can work on your HW? But upstream kernel
driver does not?

>  - disabling runtime pm on upstream Linux kernel make it works
>    perfectly, so there is a way in SW to have this HW configuration
>    working.

Again I want to make sure the both VBUS pads(OTG1 and OTG2) voltage
are always at 0v on your HW, can you double check and confirm?
I ask this again because such situation should cause the USB port
Cannot work at any cases, but your current status is: only low
power wakeup cannot work.

>=20
> > your HW to meet this: for Host only port, you have to connect
> > USB_OTG2_VBUS to a valid VBUS and make it always present for simple.
> > You can do some quick HW change to prove this.
> We have no way to change the HW in reality, therefore doing a one off tes=
t
> would be pretty much irrelevant.

My intention of doing this HW rework is just for debug.

>=20
> Said all of that, given what you wrote, I feel like having a specific dts
> property in the chipidea driver to disable runtime pm might be the way to
> go.
>=20
> Something like `ci,disable-runtime-pm`? I know the DTS is supposed to
> describe the HW, so maybe a different property name would be required.
>=20
> What do you think about this?

This is the last step to consider, we cannot go this way before root cause
identified.

Thanks
Li Jun
=20
>=20
> Francesco
