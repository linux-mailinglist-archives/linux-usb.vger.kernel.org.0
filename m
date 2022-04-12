Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 48E714FDFF3
	for <lists+linux-usb@lfdr.de>; Tue, 12 Apr 2022 14:30:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349750AbiDLMaP (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 12 Apr 2022 08:30:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45376 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353218AbiDLM1x (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 12 Apr 2022 08:27:53 -0400
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (mail-eopbgr60054.outbound.protection.outlook.com [40.107.6.54])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D769F7
        for <linux-usb@vger.kernel.org>; Tue, 12 Apr 2022 04:36:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OpLVU/O+gBbk/k+ev4dXjqtpmWt4kIl2OJ/+gD2m4GENMMw4of9obcGiQ2ToqdWUDoyucGApF3sVDzb80b2bij9b1mz7yhuBcHOSeTzNUP38S3k5aE657RrqanwlNBB+go6gl4/fitILEHw3STIeYHYcBkO+dP2tUjqbEQCYdpQAAcZzH3+QdlW2sbsx372Z3OnQ2jUBs21/FN3SQwjeU5OTYGxTnOWK5o2+XDN9iBF/OCL0g+CvXrz/Wtk6+/WbdA+EGGoxclZGTRPYH2Fz3d1RmC8rIMXuXzbPMuNQFlpOqLa17xaVjAcNC4yRUmhfUefzLJYWPplEsrLDfvZ70w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1xJ8iSlQKMe58/6OdV4uDacfs/iR2IB9HDOgKMBOXMo=;
 b=LIiM9NLxF0zn2pd+9yJvPo7mBBOQ2wYSEZ54tgf5W9myuV1fx/CDyb/opW4VipnbqebghclTsXX91ovBywpsPS6EJAL3aeIZPgJGOD95NxaKhoCZDcD6oaOa5mL3U8T6D4aicOfPeNg0VrkRSoX+ujdBi4oYKhBrCxutM+fUi6yjBG1EXJvD8m8fxm6x4SkUYvtosw48TQpEQbZBHb1PKjnRVF/jXyPlDxFR1Tl27nUJU29q//eJw/3DplUSrY8CiqkECLQQb4V+y8q7SLdiR8ScQLSCzqVkXUu7/ZCrZjS1JtPHSwt1vhxF2z0CFn9+Db/1CAOdRTVFVr8GUY4C0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1xJ8iSlQKMe58/6OdV4uDacfs/iR2IB9HDOgKMBOXMo=;
 b=cvhopUT8QSuNM47hyAW7AxdG890fxY613DjZNX2Wrsdia0J2O1Qq7niKldaEykdkNWog3KZbt3jl43lQqjH/eOBHzEhvelJoSjMvlRtU04pHthIafbBXmqOUxKvQyA0CZGV0S7z6xIjToWAoP0BS3QAEpiJkvP4V3Z5P8QLGzTw=
Received: from VI1PR04MB4333.eurprd04.prod.outlook.com (2603:10a6:803:49::27)
 by DB7PR04MB4282.eurprd04.prod.outlook.com (2603:10a6:5:19::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29; Tue, 12 Apr
 2022 11:36:55 +0000
Received: from VI1PR04MB4333.eurprd04.prod.outlook.com
 ([fe80::d1b0:5a64:86d7:8a42]) by VI1PR04MB4333.eurprd04.prod.outlook.com
 ([fe80::d1b0:5a64:86d7:8a42%4]) with mapi id 15.20.5144.030; Tue, 12 Apr 2022
 11:36:55 +0000
From:   Jun Li <jun.li@nxp.com>
To:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        Peter Chen <peter.chen@kernel.org>
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
Subject: RE: (EXT) RE: (EXT) Re: [RFC 1/1] usb: chipidea: ci_hdrc_imx: disable
 runtime pm for HSIC interface
Thread-Topic: (EXT) RE: (EXT) Re: [RFC 1/1] usb: chipidea: ci_hdrc_imx:
 disable runtime pm for HSIC interface
Thread-Index: AQHYLhnmUXUN/WmNiEuWfaw84cAuH6y/ulKAgBZziACAEOaEAIAAJ91wgAO+U4CAAWosAA==
Date:   Tue, 12 Apr 2022 11:36:55 +0000
Message-ID: <VI1PR04MB4333D96588BDAB546B61EADF89ED9@VI1PR04MB4333.eurprd04.prod.outlook.com>
References: <20220302094239.3075014-1-alexander.stein@ew.tq-group.com>
 <20220409021948.GA3618@Peter>
 <AM6PR04MB43268743D6321FBCF6A5169F89E89@AM6PR04MB4326.eurprd04.prod.outlook.com>
 <1911252.usQuhbGJ8B@steina-w>
In-Reply-To: <1911252.usQuhbGJ8B@steina-w>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a9f265f2-1a6c-459e-8ef8-08da1c78bf38
x-ms-traffictypediagnostic: DB7PR04MB4282:EE_
x-microsoft-antispam-prvs: <DB7PR04MB4282D15672F9DE13D44B239E89ED9@DB7PR04MB4282.eurprd04.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 2Sx5XgGUuNH2nYr3mdoj4j0M+WIb4TaLA/wlB2qRZb626+kdZHiU9iZWnZUlIpikWgIZm/ecLaEKCBFK4WfsZS8zZk81WRO3pLQE6RNzZZmNg4Q3k6tZqEFjiozLa1S3P/7wtd/gGY/QlJoZa3M/vrR9GSZG/IpFHflq4qrmj8iugptwwoOKedhEKvbe8FF+8muywA1Qs0S85hYcocRNAMMo/d74u8n5VlYryzVt/c97LUakrMz6G13RnrXuvPCTSvd8pmuKrdDcMaF7BsgqTwMNi00VdomVC6qzzTbbfLNtXFe6gXG3BKMIzphrkAvO3zF6RD8HOZ4+LTppbO0D5nVLXMMfrN76ZSvFLns9OBZ8WqqJraUJbHNdYBfnCwiD7igKYAYzNQTqRnzxphe/hG2LlnT8aZAFGqe3ReJsetwZS9ERwJk3eNkHfobYHdvmeh5TmZovMm+pB+T3VOQ3IfkhnUG5zP2Flo1byf3ILaPi1w8D13yAJIrn3USsy2nmsfsAz7lMH3JO0u8sA+R7T7u3g46Aqkwbce/rndfdSh5jiwRdyJeHqONd6oD5Uwfn5fM7QQwCwPPt2bneRyFlpqsmTfTnecDBbRpMnpk2JqNq0+aTk62RzEh133605NZgcuNgbluQ2VhZq2JDqnyKW7hfHTvBNaToqHZB6tnu4k+P+2P8OTMi0qllVO006lph896iTO9ktWYNQYVaBJbDxA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB4333.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(186003)(83380400001)(76116006)(33656002)(26005)(71200400001)(44832011)(8936002)(7416002)(52536014)(2906002)(66476007)(66946007)(4326008)(5660300002)(8676002)(64756008)(122000001)(66574015)(84970400001)(110136005)(66556008)(54906003)(66446008)(53546011)(316002)(6506007)(86362001)(9686003)(7696005)(55016003)(38100700002)(38070700005)(508600001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?Z5Vt+YBoYT32Q2ykBwH1cQGZ7C72onph8jLxnHMDGZCqMEqc7+tmCe4aeP?=
 =?iso-8859-1?Q?rc7LtA3kllihktu7aWnHK2GkCZAdo15To5aN2A2ap/mrgH3hOW1HlTLuQa?=
 =?iso-8859-1?Q?p3W0UlDtLEHxEOb+2N6V2/wPMGAfiH0VadP3AGAYt5QH0h3n03EN6yNRs4?=
 =?iso-8859-1?Q?m/MTOESveC2XcK3f5+v4rVJH5ARNRi9R2qCxGMGLRZTHpFhNrczMwsaZrc?=
 =?iso-8859-1?Q?BQkWfYsHE7mRO21hF5v6BVmUA5uw/4PiLGzBpUHLIwSWXkkIuu9/2ZIp+R?=
 =?iso-8859-1?Q?CtZHWXbDKnSvEofQRdwyvn0TJ24tOpePt5+vW7umiqlBcCyHKPC+JK0UsW?=
 =?iso-8859-1?Q?n3fhwGG909ccGCusq9S9xL+G8lerLRCq9kFUYxSCA2cPSWt6noohz2DIF8?=
 =?iso-8859-1?Q?IemQhaQJ3rcxzR8nm4/Q0BoWZHdCfr5eWmH9t1Nwgi6264g2NMtNy9VWCj?=
 =?iso-8859-1?Q?iKpGmYXj8KJLzxTy7cg5EBYzNt54uW3ULkgOFHFggPxqom3NdiTNbDryoT?=
 =?iso-8859-1?Q?P2CP2E8swC7K3dtguQv7L3Cx2yhDyC+tKnpTZA2ENP7bBiFwgljECXbvW2?=
 =?iso-8859-1?Q?+VTcO/FfgBRNC6SC2EfQ/fFFkk80gnb4Iv9MhpA6jcuC6W7ywXv8ViBzCA?=
 =?iso-8859-1?Q?qRSsCYAMd6AgsBnGhVf87feNhxqmLvV3TNMo3kjUT6PLN4p/P9P7FgrNj9?=
 =?iso-8859-1?Q?gS2rnbJXOSRpJRYgAWuHIhs6qm1GQ3rfaxvcaCWFQvnjDVWYaqSNThdJ/i?=
 =?iso-8859-1?Q?RCAOAAiqrgd3x0GEuOEGM5W2/V6fiaJhq/83Om82gTkXPgZP5uqNUfAbbb?=
 =?iso-8859-1?Q?1ETl5SqWTyZ7lcZVpEo1T53myUvlnQuCccY9IlYbJh8585ca3/zfyx2xOe?=
 =?iso-8859-1?Q?Duyuj6XBGe1DF/2RPgp9qrPuLnlPccbNoqJEWrM0BS604GWeDTT/eZUxCU?=
 =?iso-8859-1?Q?3HrYk63/PvmrMzUHLbnBYw3FbxZjVU9Cph1bEge32HSekrlrn/ELxl4BmE?=
 =?iso-8859-1?Q?NH4fzYBZLeFualNQmRU4P0GzemHopMcbwl8gdDp54FcQnTwrT+/7/aDsHD?=
 =?iso-8859-1?Q?gaTw6AYSGDx38IRCfIfveDmuAm/Ij5XBe6ppBXMUDVx0v8il0TdrtCCHg2?=
 =?iso-8859-1?Q?w5ja8jjZkOWExFwpR8CZsdHtulMkENzEL+VreFTPINjD02EdObu2YpeWb+?=
 =?iso-8859-1?Q?uI8QxMbCSEQYGue5SXJ0JD1gcFOCFJ7Ea/Vyl9I3C7bgEQPYO0Oe0mUwU+?=
 =?iso-8859-1?Q?tBP2xHtL9VLeYjOmJ2W0YVl1X27DAwWTTLlLbi3C1J2uPgSRr7GIl8ZpNU?=
 =?iso-8859-1?Q?lu+9QLvJjfr7ObF+9L4UfRwjTBi6Vy7S2QQsLPYi0It5tsphzhz6QCZo/W?=
 =?iso-8859-1?Q?QPDAqUnj7ugskx0q6Mj0wI0lk1ac+F5tHRDzLwS4Zqtj+pzrGKejPtdXL+?=
 =?iso-8859-1?Q?rVVAM+AvYU4EYmhVZSI1JF460NtcXwmJz7UfSlYJmoZ09ZjQF9Duibzzve?=
 =?iso-8859-1?Q?m3mm/xH9uQGlpb+Qu8CBz5bosgkSyThPXO9lNVwIzacIFii3hvoSPWzZhw?=
 =?iso-8859-1?Q?MyAKpCJESncbSnMjqr2cce9Ihi5S2ivYNnLk9gj1etTI967Opykqs/llMM?=
 =?iso-8859-1?Q?xEpncNkoBuZA48uMrBC51+JsVfYq4LylGNMrQF/XATDvj6uJb/ZxXbsrYB?=
 =?iso-8859-1?Q?tbgdwdd/yvbFtY4OyScRDhFie5p++JVxT91HzazGynpq1NBNVvVwZqPTTp?=
 =?iso-8859-1?Q?W+bRw1H/YNblYoLKMFsfO7gaDgAsnNrzSzNs7UyjXY51er?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB4333.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9f265f2-1a6c-459e-8ef8-08da1c78bf38
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Apr 2022 11:36:55.4904
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: t7xrSP6uyoepLMw06dAAjStrOtRNExIwX4ExwrIhxuBanM4nxGhqxFHxFgwUY2UG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4282
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
> From: Alexander Stein <alexander.stein@ew.tq-group.com>
> Sent: Monday, April 11, 2022 9:52 PM
> To: Peter Chen <peter.chen@kernel.org>; Jun Li <jun.li@nxp.com>
> Cc: Peter Chen <hzpeterchen@gmail.com>; Greg Kroah-Hartman
> <gregkh@linuxfoundation.org>; Shawn Guo <shawnguo@kernel.org>; Sascha
> Hauer <s.hauer@pengutronix.de>; Fabio Estevam <festevam@gmail.com>;
> Pengutronix Kernel Team <kernel@pengutronix.de>; dl-linux-imx
> <linux-imx@nxp.com>; USB list <linux-usb@vger.kernel.org>;
> linux-arm-kernel@lists.infradead.org
> Subject: Re: (EXT) RE: (EXT) Re: [RFC 1/1] usb: chipidea: ci_hdrc_imx: di=
sable
> runtime pm for HSIC interface
>=20
> Hi,
>=20
> Am Samstag, 9. April 2022, 06:49:54 CEST schrieb Jun Li:
> > > -----Original Message-----
> > > From: Peter Chen <peter.chen@kernel.org>
> > > Sent: Saturday, April 9, 2022 10:20 AM
> > > To: Alexander Stein <alexander.stein@ew.tq-group.com>
> > > Cc: Peter Chen <hzpeterchen@gmail.com>; Greg Kroah-Hartman
> > > <gregkh@linuxfoundation.org>; Shawn Guo <shawnguo@kernel.org>;
> > > Sascha Hauer <s.hauer@pengutronix.de>; Fabio Estevam
> > > <festevam@gmail.com>; Pengutronix Kernel Team
> > > <kernel@pengutronix.de>; dl-linux-imx <linux-imx@nxp.com>; USB list
> > > <linux-usb@vger.kernel.org>; linux-arm-kernel@lists.infradead.org
> > > Subject: Re: (EXT) Re: [RFC 1/1] usb: chipidea: ci_hdrc_imx: disable
> > > runtime pm for HSIC interface
> > >
> > > On 22-03-29 10:14:36, Alexander Stein wrote:
> > > > Hello Peter,
> > > >
> > > > Am Dienstag, 15. M=E4rz 2022, 02:23:23 CEST schrieb Peter Chen:
> > > > > On Wed, Mar 2, 2022 at 5:42 PM Alexander Stein
> > > > >
> > > > > <alexander.stein@ew.tq-group.com> wrote:
> > > > > > With the add of power-domain support in commit 02f8eb40ef7b ("A=
RM:
> > > dts:
> > > > > > imx7s: Add power domain for imx7d HSIC") runtime suspend will
> > > > > > disable the power-domain. This prevents IRQs to occur when a
> > > > > > new device is attached on a downstream hub.
> > > > > >
> > > > > > Signed-off-by: Alexander Stein
> > > > > > <alexander.stein@ew.tq-group.com>
> > > > > > ---
> > > > > > Our board TQMa7x + MBa7x (i.MX7 based) uses a HSIC link to
> > > > > > mounted
> > >
> > > USB HUB
> > >
> > > > > > on usbh device. Cold plugging an USB mass storage device is
> > > > > > working
> > >
> > > fine.
> > >
> > > > > > But once the last non-HUB device is disconnected the ci_hdrc
> > > > > > device
> > >
> > > goes
> > >
> > > > > > into runtime suspend.
> > > > >
> > > > > Would you please show the difference between cold boot and
> > > > > runtime suspend after disconnecting the last USB device?
> > > > >
> > > > > - Power domain on/off status for HUB device
> > > > > - Runtime suspend status at /sys entry for HUB device
> > > > > - "/sys/..power/wakeup" /sys entry  for HUB device
> > > >
> > > > I hope I got all entries you requested.
> > > >
> > > > For reference this is the bus topology:
> > > > lsusb -t
> > > > /:  Bus 02.Port 1: Dev 1, Class=3Droot_hub, Driver=3Dci_hdrc/1p, 48=
0M
> > > > /:  Bus 01.Port 1: Dev 1, Class=3Droot_hub, Driver=3Dci_hdrc/1p, 48=
0M
> > > >
> > > >     |__ Port 1: Dev 2, If 0, Class=3DHub, Driver=3Dhub/4p, 480M
> > > >     |
> > > >         |__ Port 2: Dev 3, If 0, Class=3DMass Storage,
> > > > Driver=3Dusb-storage,
> > >
> > > 480M
> > >
> > > > Bus 2 is a different connector and doesn't matter here. I'm
> > > > disconnecting
> > >
> > > 'Dev
> > >
> > > > 3' in this scenario.
> > > >
> > > > After boot up with the bus as shown above:
> > > > $ cat /sys/bus/usb/devices/1-1/power/wakeup
> > > > disabled
> > > > $ cat /sys/bus/usb/devices/1-1/power/runtime_status
> > > > active
> > > > $ cat /sys/kernel/debug/pm_genpd/usb-hsic-phy/current_state
> > > > on
> > > >
> > > > After disconnecting Dev 3 from the bus ('usb 1-1.2: USB
> > > > disconnect, device number 3' in dmesg) the status changes as
> > > > follows (without the patch):
> > > > $ cat /sys/bus/usb/devices/1-1/power/wakeup
> > > > disabled
> > > > $ cat /sys/bus/usb/devices/1-1/power/runtime_status
> > > > suspended
> > > > $ cat /sys/kernel/debug/pm_genpd/usb-hsic-phy/current_state
> > > > off-0
> > > >
> > > > For the record, when applying the posted patch this changes into:
> > > > $ cat /sys/bus/usb/devices/1-1/power/wakeup
> > > > disabled
> > > > $ cat /sys/bus/usb/devices/1-1/power/runtime_status
> > > > suspended
> > > > $ cat /sys/kernel/debug/pm_genpd/usb-hsic-phy/current_state
> > > > on
> > >
> > > Okay, I think the problem here is the power domain for USB
> > > controller is off at runtime, but USB controller/PHY needs to detect
> > > the USB wakeup signal at runtime, so the USB controller/PHY's power
> > > domain should be not off. The proper change may keep power domain on
> > > at runtime, and the power domain could be off at system suspend.
> >
> > Can this "hsic phy power domain off breaks wakeup" be confirmed?
> > Like with some hack to move hsic phy power domain on some other device
> > node:
> >
> > non-usb-node {
> >         ...
> >         power-domains =3D <&pgc_hsic_phy>;
> >         status =3D "okay";
> > };
> >
> > Just make sure this non-usb-node to be runtime active when do hsic hub
> > test.
>=20
> Thanks for that suggestion. I apparently does work. Using the this small
> patch
>=20
> --->8---
> diff --git a/arch/arm/boot/dts/imx7-mba7.dtsi b/arch/arm/boot/dts/imx7-
> mba7.dtsi index b05f662aa87b..cba2f9efa17e 100644
> --- a/arch/arm/boot/dts/imx7-mba7.dtsi
> +++ b/arch/arm/boot/dts/imx7-mba7.dtsi
> @@ -580,6 +580,7 @@ &uart3 {
>         assigned-clocks =3D <&clks IMX7D_UART3_ROOT_SRC>;
>         assigned-clock-parents =3D <&clks IMX7D_OSC_24M_CLK>;
>         status =3D "okay";
> +       power-domains =3D <&pgc_hsic_phy>;
>  };
>=20
>  &uart4 {
> --->8---
>=20
> The HSIC power domain is also attached to to uart3.
>=20
> $ cat /sys/kernel/debug/pm_genpd/usb-hsic-phy/devices
> /devices/platform/soc/30800000.bus/30800000.spba-bus/30880000.serial
> /devices/platform/soc/30800000.bus/30b30000.usb
> /devices/platform/soc/30800000.bus/30b30000.usb/ci_hdrc.1
> $ cat /sys/kernel/debug/pm_genpd/usb-hsic-phy/current_state
> on
> $ echo on > /sys/devices/platform/soc/30800000.bus/30800000.spba-bus/
> 30880000.serial/power/control
> $ lsusb -t
> /:  Bus 02.Port 1: Dev 1, Class=3Droot_hub, Driver=3Dci_hdrc/1p, 480M
> /:  Bus 01.Port 1: Dev 1, Class=3Droot_hub, Driver=3Dci_hdrc/1p, 480M
>     |__ Port 1: Dev 2, If 0, Class=3DHub, Driver=3Dhub/4p, 480M
>         |__ Port 2: Dev 3, If 0, Class=3DMass Storage, Driver=3D, 480M [U=
SB
> disconnect] $ cat /sys/kernel/debug/pm_genpd/usb-hsic-phy/current_state
> on

Just want to be sure this was done with hdrc imx runtime PM enabled.
=20
> [USB reconnect]
> $ lsusb -t
> /:  Bus 02.Port 1: Dev 1, Class=3Droot_hub, Driver=3Dci_hdrc/1p, 480M
> /:  Bus 01.Port 1: Dev 1, Class=3Droot_hub, Driver=3Dci_hdrc/1p, 480M
>     |__ Port 1: Dev 2, If 0, Class=3DHub, Driver=3Dhub/4p, 480M
>         |__ Port 2: Dev 4, If 0, Class=3DMass Storage, Driver=3D, 480M
>=20
> Hot plug detecting still works as you can see the USB device number incre=
ased.
>=20
> For the records, there is no difference to this patch in removing the pow=
er
> domain from USB HSIC device. I just wanted to keep the diff small.

This is good enough to confirm this, thanks.

I don't have a HW with HSIC enabled for test, and I am not sure the initial
state of power domain is on, can something like below deserve a try?

diff --git a/drivers/soc/imx/gpcv2.c b/drivers/soc/imx/gpcv2.c
index 3cb123016b3e..f5467ef18e33 100644
--- a/drivers/soc/imx/gpcv2.c
+++ b/drivers/soc/imx/gpcv2.c
@@ -416,6 +416,7 @@ static const struct imx_pgc_domain imx7_pgc_domains[] =
=3D {
        [IMX7_POWER_DOMAIN_USB_HSIC_PHY] =3D {
                .genpd =3D {
                        .name      =3D "usb-hsic-phy",
+                       .flags     =3D GENPD_FLAG_RPM_ALWAYS_ON,
                },
                .bits  =3D {
                        .pxx =3D IMX7_USB_HSIC_PHY_SW_Pxx_REQ,
@@ -930,7 +931,7 @@ static int imx_pgc_domain_probe(struct platform_device =
*pdev)
                regmap_update_bits(domain->regmap, GPC_PGC_CPU_MAPPING,
                                   domain->bits.map, domain->bits.map);
=20
-       ret =3D pm_genpd_init(&domain->genpd, NULL, true);
+       ret =3D pm_genpd_init(&domain->genpd, NULL, !(domain->genpd.flags &=
 GENPD_FLAG_RPM_ALWAYS_ON));
        if (ret) {
                dev_err(domain->dev, "Failed to init power domain\n");
                goto out_domain_unmap;

Li Jun
>=20
> Best regards,
> Alexander
>=20
>=20

