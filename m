Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 45D8061382D
	for <lists+linux-usb@lfdr.de>; Mon, 31 Oct 2022 14:40:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230454AbiJaNkq (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 31 Oct 2022 09:40:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229628AbiJaNkp (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 31 Oct 2022 09:40:45 -0400
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2052.outbound.protection.outlook.com [40.107.20.52])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67ED6101CA
        for <linux-usb@vger.kernel.org>; Mon, 31 Oct 2022 06:40:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fN/oCjpChRI8rVBMOK3A6YUO6mKF5qdnZGmfyuG1Up1xm3qtey0LkiQjtoOkfT6Dv5H3d+iakyG5v0Xk5daIBqcY3M1B3SP+GswM1qkvxn1W9FDsPBfCQ/e7kpkv9uFzjPfum1Ocr5jwxC8KQW0vXTl7oaAw+5INn7F5Pf1I5yyKx/vNLXnrYSQ1muGN77FXo2Ao+kWRwnkg/Sgs8keeJqT+Z0DPnxJtc2W7m5okizQxUdap32TxJrcHb+4ZhAdOSRFsXyIIjVcm9vC+J9goqT22QrF99whdtf5QKafijyuauVv8objrI8M8ugM0MIt6T6dKAFsD/ghDL2MaKEybNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cAjxy7jxU2rh+F4nuGEe8lc03q2kwOH70d9bTn61yds=;
 b=M9mHHPr+6j9vBxPWv4lyKcW+8f6qkuaXH9n1cLX7kvA6bNQWdNZwo7AHO+IsA2xBjjVqSzfatfMLfucoapaL5GKIHICt+/TdDcRn+fOEUXEuZ6ek2IWxWYJ77g0KGITd7yDEDVK1m0Oj6nAl0n6GQBUHLE2pbt4UzNNOuu+kLPNNSsyQfVS2s5OZbrSuScVO+X6wSR0SHVdEXAa3lIy/HdXsBzuT3J8yjya50+ZjVVRyQmhIhId9/noX95aMDGUyJDCIqd4ZjvTns/ncV1nyncBvgDzrrs3s/euJPu45L5sg14RlVtoHZLma0+A8g8Cv0HGturdZdRvoBu37bJVzxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cAjxy7jxU2rh+F4nuGEe8lc03q2kwOH70d9bTn61yds=;
 b=Zaf24V/ecVOqJNEZ4aLQaASMVRIm2Wi95XKvpVVwV/WY+tu36oM2m43AwYwyRjunuXgJxcty/KZBsIidf/yZl3Eowd/0XW2OjfkA7kLhlDHYK8pMng5bDL7u649Ns6s9n4zUxJFhQThcnLL2NcVek8U3Zp8QzFG/7taMXNe+u34=
Received: from PA4PR04MB9640.eurprd04.prod.outlook.com (2603:10a6:102:261::21)
 by AS4PR04MB9290.eurprd04.prod.outlook.com (2603:10a6:20b:4e5::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.15; Mon, 31 Oct
 2022 13:40:40 +0000
Received: from PA4PR04MB9640.eurprd04.prod.outlook.com
 ([fe80::cc4:c5c2:db97:1313]) by PA4PR04MB9640.eurprd04.prod.outlook.com
 ([fe80::cc4:c5c2:db97:1313%9]) with mapi id 15.20.5769.016; Mon, 31 Oct 2022
 13:40:39 +0000
From:   "Jun Li (OSS)" <jun.li@oss.nxp.com>
To:     Francesco Dolcini <francesco@dolcini.it>,
        Peter Chen <peter.chen@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
CC:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
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
Thread-Index: AQHY6slI0uttgXhTUkWibWMoTeyBrq4ohyNw
Date:   Mon, 31 Oct 2022 13:40:39 +0000
Message-ID: <PA4PR04MB9640E8D3E851800492D8FCAD89379@PA4PR04MB9640.eurprd04.prod.outlook.com>
References: <Y1vLpaxpc5WBCuGD@francesco-nb.int.toradex.com>
In-Reply-To: <Y1vLpaxpc5WBCuGD@francesco-nb.int.toradex.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PA4PR04MB9640:EE_|AS4PR04MB9290:EE_
x-ms-office365-filtering-correlation-id: 1b7ded85-659e-489a-0287-08dabb457fcf
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ld-processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: krsO2vjBVck7tslXnn7BOjaSC9WBDCfd8RqZqm6qp9s1REIM+/owwlRix7YZADfOo4LM+jFNxl8S2siP3OX+gkAxCCZWNi6uYX0EAcqoKrygGmTdWugdWlb84ZnN5TB1OFUV+m+YDe/dSqLgCqnlEZKsIDooJ6ByhW0H1GGMGfVw3WIAkeH9xc4AcUtUMBCDRJFqHxOw08BR7hWqNlXwPIveaQDwhu5uWNXzzIky4AevBjRx3jBreaae0FmbWn5VFcgDmakfqIi0JgN5gcyyxgUqSqPtHBWrUrMe54M0wohjqqjfN84buSLmIZ1DnPQHYifoDhWlCHtpFx5W7GgY3m31oqZwcFE0vubrp2bK9ZD9NTguKgM+Uvx51VnqVGYB5bD/IWdV8yKUp0f7R0kHZbqSYtWzz/nxkAc0sB+92onPRkCmwGVJ6LF2c69+NzNhQGMGFagYihNwFO0TgRIfvwZr+DJN29sv0lt0hoyO/v5j9Rb38kAIwGbY4aiskQ+b1tXQjh3kox/ePshGZlNl1S81uj9Bf+X5Nf23SPw76gnl3oLKRTN8nRhx7t5JDfuR3K6AtkksUKOjK2dbEAnVmbO22lu0YagmK8dactVsPgZ2+ewV2yCmLx3GtooJ/S4G0ul217NwKl9BrbIamD2ktQ1re/Ed+SyzZNJHf46qJ/NpelCULm5u5tTS7NuNre9IeHxr9rPBlatDLRYYR5t9bK6b/mDp0Ke19C9cfP0R3XjyLfeYTIS2XroUNg8PZKJ5i3v9y741x3ECqn8KCSUIK7pqJMMHq1aq1GfydiqiKxo=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9640.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(396003)(39860400002)(376002)(366004)(346002)(451199015)(53546011)(26005)(478600001)(7696005)(9686003)(66946007)(186003)(83380400001)(6506007)(55016003)(7416002)(316002)(110136005)(2906002)(8936002)(966005)(76116006)(71200400001)(52536014)(64756008)(66556008)(41300700001)(66446008)(66476007)(4326008)(54906003)(5660300002)(8676002)(86362001)(33656002)(38100700002)(38070700005)(122000001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?8UQAUedVblI0lvTJ2HsuDl2j/fnphjQySOrZdJAM89IIiBkZUJIqnggCqARF?=
 =?us-ascii?Q?Mj5ID4zZWexoEhbPUjJOyFI7dea8Yz8aJdUorqsZk6vvuNIHrGU3WVMIEUfW?=
 =?us-ascii?Q?QYZBHYweHOpXvdhj+EJhh0BUdCk1OBXGzoWvgKiiU7TfV17D65A1q3h9UO0C?=
 =?us-ascii?Q?xk1k4fnnsvRS7bvuezhr+6JApa3U3+PhOlPmejk1TdYrhqgeTAUSghwXyLf7?=
 =?us-ascii?Q?2Qzu8tQyvkSdy+3MNPoHt9IfPVX4Zu93M2GPZW2CN2sNCeF/HyB+e8PQJWww?=
 =?us-ascii?Q?RT2fT/DBdj39ioTRo28fZTZbyeLAuNJM1beHO83x7S0UvXUigSx2PbqXIAap?=
 =?us-ascii?Q?uuZ7omBpISvg4m97K3gh1Zda3m0+UUo1DSWkjJMe+xgJjW8D+1m4eDRkYp+A?=
 =?us-ascii?Q?On9IxJiB/GntP/9J9swFYYNUP+UJj98Gu05WzEW1gkxfFGwnqgHdiWe0WwvG?=
 =?us-ascii?Q?uLUrdLkoqyQX9pxKBVh+TFPzAIuYmy++qc98G4osZNV0FG4z38bv+8KlJs14?=
 =?us-ascii?Q?2HkHvVAV1rS9TZ6uuhBdr0jthaRCtGaLyYi1F+kJiROnsBzjvuyzP17zjwKZ?=
 =?us-ascii?Q?as7WzWrgfmQk75fHXxsZEpOG1iL+I2osrb/xFqRg0gDjDZACogzySjldAVL7?=
 =?us-ascii?Q?Sdr2oumG6PZtO1UBTXLXVeTNTiV7myVrBABnD+tQHjoLr4kcza9VVDDpQs8M?=
 =?us-ascii?Q?Wa49HOKzb/x/8MjTCa0ro+LI/7VfT9xpE4NyO/pjpUAswBX/y4BaWuBeeFiU?=
 =?us-ascii?Q?sZFsxVbmmZnqfcFSNndv5vQgEymKfFVqkpBzIym92m+wt1XwbFoMhD1h4w+Z?=
 =?us-ascii?Q?EZxVVgWYc8bmsC9gEdHGqyz6Mge4cIDRe2dHbA4CDcXoAx5R/2+l39H2pVUF?=
 =?us-ascii?Q?nnQPGRjUARouO/QiFdyEwrsHbpI+wkTAtZh+kHk6xf6gRNAenMIJdUtTq7I3?=
 =?us-ascii?Q?md24aYOjGU1MAdZvmhR7rLXeS49Vpr2AcIXky+PtChdxxroB0CPvmX4Vd4I5?=
 =?us-ascii?Q?IhQfJl8trDIgKRq31LTY+ZEQJvVTLt1MioM1zYtJt0kK7s0QTHf9hIpELdwP?=
 =?us-ascii?Q?zhLyGjgbrXnx09lGxvAGwDgMvMEa4D7yWJ96Jvu50PWm++OPGP16k5Pk5LbP?=
 =?us-ascii?Q?R/+NXCfWoILmv3dn9sOhpw1FudtnbFXJVYn7q7Cu37uWYmEEsOBASicuAUBD?=
 =?us-ascii?Q?Orud2VoBq1bRkmOI7LvlkntsNvrEf/ue4Gm0TM0GQQvozxqyjAJ5whrNd/TI?=
 =?us-ascii?Q?zSApdEkEJ5XBiwk8eYfNaIAQ3/z5l7x64mwBe+sQ+D16cjY4L2G0gFsy5Cvi?=
 =?us-ascii?Q?kA9dBq+e+BjVtuI8tWRO+qx+7EWlU1wvW0mpw8S7FDC4XvTUPNOuLZf3ZRRb?=
 =?us-ascii?Q?sBpqG9bxx5Tl6MmpbKcU3okjzHDR9QLB/IRhM6j+aSSpgGU/sN6Xm5+nc3nX?=
 =?us-ascii?Q?wTUdxruroE1g+QJBIa1CZ2asw3gs84huIxllgnPKu6Gz3K16UoNStglsQlXA?=
 =?us-ascii?Q?5Z7qD1PL9qjaeIl2s/iz3WKSTAoaf4UtTdlU5kfTMWM4miJjD37PLgEKcnxC?=
 =?us-ascii?Q?5sAiIDTE7gY5/2zdqM8=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9640.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b7ded85-659e-489a-0287-08dabb457fcf
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Oct 2022 13:40:39.7600
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RdbqDhUiRbsM2EWUYiX7Ddb3mrZmVKYlLxcyb/OOhWGfzcWt+Wela32LTXkBO8Rr
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9290
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Francesco,

> -----Original Message-----
> From: Francesco Dolcini <francesco@dolcini.it>
> Sent: Friday, October 28, 2022 8:32 PM
> To: Peter Chen <peter.chen@kernel.org>; linux-usb@vger.kernel.org; Jun Li
> <jun.li@nxp.com>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>; Shawn Guo
> <shawnguo@kernel.org>; Sascha Hauer <s.hauer@pengutronix.de>; Pengutronix
> Kernel Team <kernel@pengutronix.de>; Fabio Estevam <festevam@gmail.com>;
> dl-linux-imx <linux-imx@nxp.com>; Felipe Balbi <balbi@kernel.org>;
> philippe.schenker@toradex.com; Francesco Dolcini
> <francesco.dolcini@toradex.com>
> Subject: USB runtime PM issues on i.MX6ULL
>=20
> Hello all,
>=20
> I am debugging some unexpected USB behavior on a i.MX6ULL SOC,
> chipidea controller ("fsl,imx6ul-usb") and a fsl mxs usbphy
> ("fsl,imx6ul-usbphy").
>=20
> The HW design has 2 USB interface, the first one is dual-role, while the
> second
> one is a host port with NO way to re-read the VBUS (USB_OTG2_VBUS is not
> really connected, there is just a capacitor to GND).

How is your USB_OTG1_VBUS status? Can you try to make your USB_OTG1_VBUS pa=
d
has a valid VBUS voltage, then run your Host only port test with runtime PM
enabled?

Li Jun

>=20
> Focusing on the second interface, USB Host only, what I do experience is
> the
> following:
>=20
>  - if there is no USB HUB connected and no device connected at boot, any
> USB
>    device hotplugged is not working, ci_runtime_suspend is called and it
> never
>    resume.
>  - if there is a HUB in between it somehow works, however I have a contin=
uos
>    runtime powermanagement reset loop every 2 seconds
>        [ 1026.146360] ci_hdrc ci_hdrc.1: at ci_runtime_suspend
>        [ 1026.164725] ci_hdrc ci_hdrc.1: at ci_controller_resume
>        [ 1026.487844] usb 1-1: reset high-speed USB device number 2 using
> ci_hdrc
>        [ 1028.326789] ci_hdrc ci_hdrc.1: at ci_runtime_suspend
>        [ 1028.335378] ci_hdrc ci_hdrc.1: at ci_controller_resume
>        [ 1028.657853] usb 1-1: reset high-speed USB device number 2 using
> ci_hdrc
>=20
>=20
> I was able to have it fully working disabling the runtime power managemen=
t
> in
> the chipidea driver or using sysfs (`echo on > /sys/.../power/control`).
>=20
> --- a/drivers/usb/chipidea/ci_hdrc_imx.c
> +++ b/drivers/usb/chipidea/ci_hdrc_imx.c
> @@ -56,7 +56,7 @@ static const struct ci_hdrc_imx_platform_flag
> imx6sx_usb_data =3D {
>  };
>=20
>  static const struct ci_hdrc_imx_platform_flag imx6ul_usb_data =3D {
> -       .flags =3D CI_HDRC_SUPPORTS_RUNTIME_PM |
> +       .flags =3D
>=20
> I was digging even more into the topic and I found out that what is happe=
ning
> is that mxs_phy_disconnect_line() is called. I than tried to remove the
> MXS_PHY_DISCONNECT_LINE_WITHOUT_VBUS flag.
>=20
> --- a/drivers/usb/phy/phy-mxs-usb.c
> +++ b/drivers/usb/phy/phy-mxs-usb.c
> @@ -178,7 +178,7 @@ static const struct mxs_phy_data imx6sx_phy_data =3D =
{
>  };
>=20
>  static const struct mxs_phy_data imx6ul_phy_data =3D {
> -       .flags =3D MXS_PHY_DISCONNECT_LINE_WITHOUT_VBUS,
> +       /*.flags =3D MXS_PHY_DISCONNECT_LINE_WITHOUT_VBUS,*/
>  };
>=20
> This commit from NXP downstream kernel seems somehow related
> https://github.com/nxp-imx/linux-imx/commit/89ec73836a9b1347743e406d62d
> d446dc4365db3
> however it builds on other commits that allow to communicate the actual m=
ode
> to
> the USB PHY driver and prevent mxs_phy_disconnect_line() to be called for
> the
> USB host case.
>=20
> With that the situation is way better, but while without
> `CI_HDRC_SUPPORTS_RUNTIME_PM` it works perfectly, without
> `MXS_PHY_DISCONNECT_LINE_WITHOUT_VBUS` it does not really work smootly
> in case there is a hub in between (~20% of the time the device is not
> enumerated after plugging it in).
>=20
> When it does not work I see that after plugging in a device runtime resum=
e
> function is called, but after that the device is not enumerated on the US=
B
> bus.
> It looks like something else is missing.
>=20
> It seems like having a pure USB Host interface without having a way to re=
-read
> the VBUS is not really supported in SW at the moment, am I wrong?
> Any idea?
>=20
> One last comment, even the USB dual role port is not working smoothly, ho=
wever
> I have not investigated this specific case that much because disabling ru=
ntime
> pm
> solves everything also in that case.
>=20
> Francesco

