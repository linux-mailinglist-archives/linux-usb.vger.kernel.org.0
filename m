Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B112C4FA2C4
	for <lists+linux-usb@lfdr.de>; Sat,  9 Apr 2022 06:50:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235885AbiDIEwI (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 9 Apr 2022 00:52:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229604AbiDIEwD (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 9 Apr 2022 00:52:03 -0400
Received: from EUR03-DB5-obe.outbound.protection.outlook.com (mail-eopbgr40053.outbound.protection.outlook.com [40.107.4.53])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E002186F5
        for <linux-usb@vger.kernel.org>; Fri,  8 Apr 2022 21:49:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oAnGbYXHgjmI8ZXrt0pv+aRk45FskBD4LqxJ2i1gZuwWSaZt/+qT/gjtieMct/r2agNH9ZgHVJSzMcNgSzV25yPBF6iDRG6oY6Y5MpZMJaWKoFl00wepIrOFG9uaHUlSfy3kPk6RQLAh/uwV++qQSXDzN0QFHIigV6AuYPX8Jqb9KDxs9pmk7j7JD59vBBs2s2OwP//5fUnSYYZeHvg1JpuqwcMG3SLu+eF+3AQnNGYQy0DGR3fo3muBDYQ5D5qXmR2A3Z2wmcyVBs6ukueLhAwI1FbZNPW1XlZTyvWGyZpZW+6DDrvp1kGqRu2zK6mYPftb+9+Eo1VUR6ki3ol/7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OUdQ6al0YFqPoP9RDyRFgQ12Hoblr0L3X3C91x2zDpk=;
 b=H0er8/wj1SoiIXDiV1zoj69/Dt7EOhQweLFoL4OZLA1kVbcNJ7VOd91Zf6E5ZNnPWLnl6wKp2AL0Bh3IJAExe2corugzhUiC3Nr+FzUYv5MFgKE8HWwrUzjYIh7AERiCCffaZwdD03fae/cyQKodo4wvoqms50PqLjVzFFRUOkTVj1Ve8v9ezY1jvk1Wf7bV2MqEqcpZ4hhMd6is0wDnXi2/IzCwxHpqhv4MKTY4DjouxRLfDWw8HhQl9VENo5UuPm6ysm97W6J4UQ8u/J9jM26bF4ISHnlnCxH2a+cZt/YC8eHWF7UekGpn+vTLpKNamj+FnAw9Mka/8XqjjcduOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OUdQ6al0YFqPoP9RDyRFgQ12Hoblr0L3X3C91x2zDpk=;
 b=myOcDYesM+dHHKqaMGVNgErt40NUOONyOhkl9eJCEE5Z7V6eNf48fuBhTxQlsciPdIJdFYou6TDzcQJ1yQywbUvy2UWJ9ZNImP8fqOfb9DYvAhHCF6lhcZ6Tz82TV6D/s0b41Sz80tgeUyHwveFW4KEjUiR/yef4iSOS+0N0Vts=
Received: from AM6PR04MB4326.eurprd04.prod.outlook.com (2603:10a6:209:4d::28)
 by AM8PR04MB7938.eurprd04.prod.outlook.com (2603:10a6:20b:24e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.22; Sat, 9 Apr
 2022 04:49:55 +0000
Received: from AM6PR04MB4326.eurprd04.prod.outlook.com
 ([fe80::91be:125e:3856:9268]) by AM6PR04MB4326.eurprd04.prod.outlook.com
 ([fe80::91be:125e:3856:9268%3]) with mapi id 15.20.5144.022; Sat, 9 Apr 2022
 04:49:55 +0000
From:   Jun Li <jun.li@nxp.com>
To:     Peter Chen <peter.chen@kernel.org>,
        Alexander Stein <alexander.stein@ew.tq-group.com>
CC:     Peter Chen <hzpeterchen@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        dl-linux-imx <linux-imx@nxp.com>,
        USB list <linux-usb@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
Subject: RE: (EXT) Re: [RFC 1/1] usb: chipidea: ci_hdrc_imx: disable runtime
 pm for HSIC interface
Thread-Topic: (EXT) Re: [RFC 1/1] usb: chipidea: ci_hdrc_imx: disable runtime
 pm for HSIC interface
Thread-Index: AQHYLhnmUXUN/WmNiEuWfaw84cAuH6y/ulKAgBZziACAEOaEAIAAJ91w
Date:   Sat, 9 Apr 2022 04:49:54 +0000
Message-ID: <AM6PR04MB43268743D6321FBCF6A5169F89E89@AM6PR04MB4326.eurprd04.prod.outlook.com>
References: <20220302094239.3075014-1-alexander.stein@ew.tq-group.com>
 <CAL411-o8TPNv8vAfdPtzTaFkOGc7EmwNJv1Jxc-YUv1wc_vq0g@mail.gmail.com>
 <1891703.PYKUYFuaPT@steina-w> <20220409021948.GA3618@Peter>
In-Reply-To: <20220409021948.GA3618@Peter>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4b49ffda-8c1c-41de-efa8-08da19e46438
x-ms-traffictypediagnostic: AM8PR04MB7938:EE_
x-microsoft-antispam-prvs: <AM8PR04MB793868EDFDFFC83C04B5BB5A89E89@AM8PR04MB7938.eurprd04.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /t3Qt/HO0BiwCWj780sm6qx18UhPd1yC73EojmvkHrwWenHBPwqW+rGtS6YxU1ZJK3xpRvzv9EmOsRVTOOReUY8AJoCSVsNE1RHS8c/Q3GSpA0PyKWHL/RqyP2qi58FAI66zApj2UNM/niFRyUXNkxBzCohErnbkGbRflLaliNzYDS8Le2TBk1ulXEGhgGhXHBzaHz8Uzysr8VJXjYYMqGv7FYb/MXj2FExUjQdFd99IS3EWqxPpiH8nIfVFOhtWBkxrpZWBwc8nM07ThYvZkA7BRuIuVpYmw0ou+e3UVYjJVjuNocP+zWzJgd7LTqKWH2EmOFpIuFBw5ARZV8oj+h9tiMNvdiDJKMVqluE7eMJz1a9003mcm4FiohfqKWyan+SRWqWwdU7uueMwfOB3a4BClHObX076f6HfF6DzHmV0h4yiqBA9Hf/0Xv1XXJnFD+CvFXNGW7X4Zb7AVu8rZ9auyr2I4WiTJjJ6wDFrL5ceQn6E1YGrw2YbNErDms25Cq8OVVLLbFYxpShe9mXiiwIqvg8acNB9hog+QIj9s9YGHt2XGdDwB0fJHlZPebnDMQm5SD/lr8kqZPsbPyzC0cNpaCPUML3ZBY7pu0FkUG8uw9nU4hkxXcc60IEYMeYQ3jjTk3A+qUmeZisQA/hnExzDaQuwlWjS7OI6Wi7l8x+nWGkRAPMhXLAKaFJusYaTdwRBI9KeiVjQmKR0hY5aaw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB4326.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(52536014)(508600001)(5660300002)(76116006)(7416002)(6506007)(26005)(64756008)(2906002)(7696005)(8676002)(186003)(71200400001)(66946007)(55016003)(66446008)(66556008)(66574015)(66476007)(4326008)(53546011)(33656002)(8936002)(44832011)(9686003)(122000001)(38070700005)(83380400001)(86362001)(316002)(110136005)(38100700002)(54906003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?z+Mc+z8CtDJywC1/Pajq4MGq/+wGggvtiD9anHA1rzOf9V1YgOf9dvvW8O?=
 =?iso-8859-1?Q?fi5G2abeauDvXT7zLgyODygSz4K4Wm2lbgIG0bM4ogo/aBELe6A2B76D/d?=
 =?iso-8859-1?Q?FQg6NkLbfT6Krczts78yaWqm3doxGD5r2H1iYioPfofRQeqEtubSmsrAOq?=
 =?iso-8859-1?Q?OXkb3OZQkFvw1OTs6S6zWvLwy+eCGSlOIaiJlGsC/370FFV4BQFbgEHPGn?=
 =?iso-8859-1?Q?ZNod6Nu/wOcV+whjmQxieGUVLJTGUnVVEnQiQXlNG6ZN06MaWUb/rP9v1L?=
 =?iso-8859-1?Q?ONHLuWIbfB85lJPsSQt6omfpJGRWpoC+bTCGOtZASB4BKp+Pi8n2vIHZZk?=
 =?iso-8859-1?Q?NHIzr1lCKS2DNEmK/y9hL/2RhinVfKHtMpbuROgT9UK+ewnZgnUp7jQbMF?=
 =?iso-8859-1?Q?lTwhxb8uQff2JRsp5bfkyo+NhFQNiGxDpvK4CZ4qLHFE+S3X6sIqOIhoSk?=
 =?iso-8859-1?Q?t3PyojBvrNcHgMxOJVX46svGA+HlhA0MDi3iCY6oFarEUAbBSny830ASey?=
 =?iso-8859-1?Q?+QmGqYhXqWdkJfgULXDY4HkTLC46M9jTBQtXTQhNX5PudUvuSuh06icur1?=
 =?iso-8859-1?Q?6Bj9gRLg0DXeNNf7kBoh7EdTSHzYJwTiNMv2BOzevBgRGUoWiKiO/EhtgZ?=
 =?iso-8859-1?Q?qyUb1RkFc8LQbs4he/SKfJBAlZqSANkOo7YQSDKYJsWA1PViydYZIxld7J?=
 =?iso-8859-1?Q?5e/VEBby6Q8ZpqtDPJnVw+CMmoViSpHw4/IOvIDFBALMDAbLdYGRm0d7V3?=
 =?iso-8859-1?Q?nBIuuJw2E5FqBTZdhAHfUb4VXEGKL9Bhikwn149cbhbFnNcO0w8H4yWkJc?=
 =?iso-8859-1?Q?+QDNmDbf/8IVfAEpA+BLu/ODm81DcuRaW7EeKwRAhfgUsnxR1Bq2J47Wsf?=
 =?iso-8859-1?Q?nFmgU4JkCm5N6xkNPXB331IH5P21AW07BJInJJS+D0JZ9wCrqCFrTm3A+L?=
 =?iso-8859-1?Q?zx26RatacP1y+rlSCmuEl88wqI9EmBX5WLCg/Edm4BdNL1BLtPtpVSv28+?=
 =?iso-8859-1?Q?M4EDGropcDDJhJ8QI66LCs+3alUpNIiKn0w1dsrU79pgYYitELwo2/J+HM?=
 =?iso-8859-1?Q?EEu7FNwylCZMGPm/KltOAra+V8YWxa6z8Xf8K5+8GbyPFlquL6Lz3U+UT9?=
 =?iso-8859-1?Q?LBTwjD9iol6FgyADToijzDQcYMQUWDO7rwXY1GFSu9r+d1R46/0SlZIM8i?=
 =?iso-8859-1?Q?0D1hqgNde8Fs8S44jhOImNUCp5eY+0BYovuqTssBAlxRiHoOCiGawsT49o?=
 =?iso-8859-1?Q?UT8zkpK4YTX87ylzzk4FDxTuO9cowAfTv9ZM0HfmvXCLingZeAViWLgOhD?=
 =?iso-8859-1?Q?+Vf3OTi4qDSPU/ZF6PBgMjEWnyXeuI1x6lwhV71ZQYJlpnae/N1XYzp4lz?=
 =?iso-8859-1?Q?nH+8YedJKXQRYadvJEgpAsRUa7JZUS2Ff5/FlFRMhIVbK+RwSNaC7rZeM7?=
 =?iso-8859-1?Q?UtBCL7cyLgtg8vkZCBFLstNt/0mEZ1li7vQOzMvzTypkD6Zd/eJxc+9M/O?=
 =?iso-8859-1?Q?krZBhNvsh6VGHfsp1MeZGLl778/ApxoxYkjp5uxSGaz0Ibq60VVltnd+dj?=
 =?iso-8859-1?Q?wGewbhjr10XD/xMxZYH+5rYwZph8JiDv9rwWXEtvew+7rnpQwFfbY0Mf2Z?=
 =?iso-8859-1?Q?1ShfKrp6UeiNJwCtvpIt4iZzldjgQpH0DQvgBHo7FYLe5HS8I5Z49j8DnC?=
 =?iso-8859-1?Q?ICYhX9vBNTKWWiAZ1rmAUP7I8SJvvtqV7OG+f60r4iszzdsHYYFbluosyg?=
 =?iso-8859-1?Q?bA/EOavtT6meSlwcH+G4DDcTlf7xd86OOE20h6g41OaVrq?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB4326.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b49ffda-8c1c-41de-efa8-08da19e46438
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Apr 2022 04:49:55.0099
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VvLEyRoC9Qxa/atSKxfuciHDR4QzOrbnrP5veeHLfarxSi40g0ceCBVXRBF4XsTA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7938
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



> -----Original Message-----
> From: Peter Chen <peter.chen@kernel.org>
> Sent: Saturday, April 9, 2022 10:20 AM
> To: Alexander Stein <alexander.stein@ew.tq-group.com>
> Cc: Peter Chen <hzpeterchen@gmail.com>; Greg Kroah-Hartman
> <gregkh@linuxfoundation.org>; Shawn Guo <shawnguo@kernel.org>; Sascha
> Hauer <s.hauer@pengutronix.de>; Fabio Estevam <festevam@gmail.com>;
> Pengutronix Kernel Team <kernel@pengutronix.de>; dl-linux-imx
> <linux-imx@nxp.com>; USB list <linux-usb@vger.kernel.org>;
> linux-arm-kernel@lists.infradead.org
> Subject: Re: (EXT) Re: [RFC 1/1] usb: chipidea: ci_hdrc_imx: disable runt=
ime
> pm for HSIC interface
>=20
> On 22-03-29 10:14:36, Alexander Stein wrote:
> > Hello Peter,
> >
> > Am Dienstag, 15. M=E4rz 2022, 02:23:23 CEST schrieb Peter Chen:
> > > On Wed, Mar 2, 2022 at 5:42 PM Alexander Stein
> > >
> > > <alexander.stein@ew.tq-group.com> wrote:
> > > > With the add of power-domain support in commit 02f8eb40ef7b ("ARM:
> dts:
> > > > imx7s: Add power domain for imx7d HSIC") runtime suspend will disab=
le
> > > > the power-domain. This prevents IRQs to occur when a new device is
> > > > attached
> > > > on a downstream hub.
> > > >
> > > > Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> > > > ---
> > > > Our board TQMa7x + MBa7x (i.MX7 based) uses a HSIC link to mounted
> USB HUB
> > > > on usbh device. Cold plugging an USB mass storage device is working
> fine.
> > > > But once the last non-HUB device is disconnected the ci_hdrc device
> goes
> > > > into runtime suspend.
> > >
> > > Would you please show the difference between cold boot and runtime
> > > suspend after disconnecting
> > > the last USB device?
> > >
> > > - Power domain on/off status for HUB device
> > > - Runtime suspend status at /sys entry for HUB device
> > > - "/sys/..power/wakeup" /sys entry  for HUB device
> >
> > I hope I got all entries you requested.
> >
> > For reference this is the bus topology:
> > lsusb -t
> > /:  Bus 02.Port 1: Dev 1, Class=3Droot_hub, Driver=3Dci_hdrc/1p, 480M
> > /:  Bus 01.Port 1: Dev 1, Class=3Droot_hub, Driver=3Dci_hdrc/1p, 480M
> >     |__ Port 1: Dev 2, If 0, Class=3DHub, Driver=3Dhub/4p, 480M
> >         |__ Port 2: Dev 3, If 0, Class=3DMass Storage, Driver=3Dusb-sto=
rage,
> 480M
> >
> > Bus 2 is a different connector and doesn't matter here. I'm disconnecti=
ng
> 'Dev
> > 3' in this scenario.
> >
> > After boot up with the bus as shown above:
> > $ cat /sys/bus/usb/devices/1-1/power/wakeup
> > disabled
> > $ cat /sys/bus/usb/devices/1-1/power/runtime_status
> > active
> > $ cat /sys/kernel/debug/pm_genpd/usb-hsic-phy/current_state
> > on
> >
> > After disconnecting Dev 3 from the bus ('usb 1-1.2: USB disconnect, dev=
ice
> > number 3' in dmesg) the status changes as follows (without the patch):
> > $ cat /sys/bus/usb/devices/1-1/power/wakeup
> > disabled
> > $ cat /sys/bus/usb/devices/1-1/power/runtime_status
> > suspended
> > $ cat /sys/kernel/debug/pm_genpd/usb-hsic-phy/current_state
> > off-0
> >
> > For the record, when applying the posted patch this changes into:
> > $ cat /sys/bus/usb/devices/1-1/power/wakeup
> > disabled
> > $ cat /sys/bus/usb/devices/1-1/power/runtime_status
> > suspended
> > $ cat /sys/kernel/debug/pm_genpd/usb-hsic-phy/current_state
> > on
> >
>=20
> Okay, I think the problem here is the power domain for USB controller is
> off at runtime, but USB controller/PHY needs to detect the USB wakeup
> signal at runtime, so the USB controller/PHY's power domain should be
> not off. The proper change may keep power domain on at runtime, and the
> power domain could be off at system suspend.

Can this "hsic phy power domain off breaks wakeup" be confirmed?
Like with some hack to move hsic phy power domain on some other device
node:

non-usb-node {
        ...
        power-domains =3D <&pgc_hsic_phy>;
        status =3D "okay";
};

Just make sure this non-usb-node to be runtime active when
do hsic hub test.

Li Jun=20

>=20
> The controller/PHY clk could be off at runtime, it does not affect the
> wakeup detecting from controll/PHY side.
>=20
> --
>=20
> Thanks,
> Peter Chen

