Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2D6E44BB2BF
	for <lists+linux-usb@lfdr.de>; Fri, 18 Feb 2022 07:58:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231197AbiBRG7F (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 18 Feb 2022 01:59:05 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:37644 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229862AbiBRG7D (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 18 Feb 2022 01:59:03 -0500
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (mail-eopbgr60060.outbound.protection.outlook.com [40.107.6.60])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 289C0B86B;
        Thu, 17 Feb 2022 22:58:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Sz6899pePSpQCSJMscCL2v2wMhD9Z5CCpqbvYpVq0WpNZ2CCJWDGa4lPd7tHdSjyrt9Bx5/47p50jtN/G8aQDKeIY6YH6C/VwWnH8fFHgqXgVEAfBG+m9rF4iwRWIXTWiAFUPqe8Mv+jrC+AsG7kyg1oFRUoWFjW7tSvlxqT495j9SslJvZ8/r4HUKy7C/cuFIJDf9k9xKi08Z+rdJpaM9z/2AqrP7VmmiEnITiMmHDh63oJM4zZke/gNvKp0B0D+vEU1vxwF+dGnO5eD8C2RUbY5FYKTmH/VRl6+kpAg8G9IeYNuSW4xhEkKhJSiucsHOM9sJZLn3TEGTMMtz1YuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+BRSDk9pJXddZQybC2sL7vQGfJpZKZ2M6eoqtznlH7A=;
 b=E7n4Ve7P7dNibdiBzbnwk/cucvzRUigHgZDdxH+jCBJdz5atH65Um7aN/NZ1IPZqMz9N2zBgroXntjMA0aQfnkfm5oOuR79dr0musxI0L9VC82+0R2TuRhytmSVbDlJhmDLH1RyPqwZWZR00nt6oqheemArmRUqtLvLy1kAlvf7riWHDvVlFeGWRaJh4kio8Tu7tvShmDXKDF7p2KNhAjRfc+yf+D2e2C+K5lwJfMmr9yGihbgZoBaJSN39BeM/zOzfO8dOWv/1md8UgpiOJ2gu+TyFQaJ8R7jlCVwP9VivFCnT9bNR4SLQA6Xog7BYdxroPkGJZityQoe1lft/BzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+BRSDk9pJXddZQybC2sL7vQGfJpZKZ2M6eoqtznlH7A=;
 b=W0ABe5zBeO+p2vxegN/mXzhmk7XNyAOs8yx1ErkKF3wxkLO+PC3p6J8OHXnTKZcSFk4p9ED96oa8Hd2IBzIA4x5gXdaLDIEdT+JL5GEdu2D3Rs/iIt4XfZ3mQ6vj0LFGMbEwjTMiLnzBwV8L311iaPt/ehQLRehzLw/IFiD19Ro=
Received: from VI1PR04MB4333.eurprd04.prod.outlook.com (2603:10a6:803:49::27)
 by AM5PR04MB3074.eurprd04.prod.outlook.com (2603:10a6:206:4::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.19; Fri, 18 Feb
 2022 06:58:45 +0000
Received: from VI1PR04MB4333.eurprd04.prod.outlook.com
 ([fe80::f54b:2953:6266:2f0b]) by VI1PR04MB4333.eurprd04.prod.outlook.com
 ([fe80::f54b:2953:6266:2f0b%2]) with mapi id 15.20.4995.016; Fri, 18 Feb 2022
 06:58:44 +0000
From:   Jun Li <jun.li@nxp.com>
To:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>
CC:     dl-linux-imx <linux-imx@nxp.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
Subject: RE: [PATCH v4 4/4] arm64: dts: imx8mp: Add memory for USB3 glue layer
 to usb3 nodes
Thread-Topic: [PATCH v4 4/4] arm64: dts: imx8mp: Add memory for USB3 glue
 layer to usb3 nodes
Thread-Index: AQHYEr71mpge0IWmXESgBKC5yjC7bqyZBD3g
Date:   Fri, 18 Feb 2022 06:58:44 +0000
Message-ID: <VI1PR04MB4333761CE7919F6CC0CBB47E89379@VI1PR04MB4333.eurprd04.prod.outlook.com>
References: <20220126141340.234125-1-alexander.stein@ew.tq-group.com>
 <20220126141340.234125-5-alexander.stein@ew.tq-group.com>
In-Reply-To: <20220126141340.234125-5-alexander.stein@ew.tq-group.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2f5ab228-aef0-4b42-300f-08d9f2ac1ae4
x-ms-traffictypediagnostic: AM5PR04MB3074:EE_
x-microsoft-antispam-prvs: <AM5PR04MB3074B8EA02C48538F6A0F1DA89379@AM5PR04MB3074.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: xBj42kWFk/YHtAi50qc3JQwz2HYodnRTfsr+haVsnJQhRRdh/lWVVaH5UHoT0FbK+VprnN4kWaW6I1b5fnsuJ9j6IN6s7e5AE0Hlogi2bOFULT4gtt+8CXqBSTVW4ENcAdLbslph/fv4jY5XUzkTSRQLkYsYXrWQj+xXPXSPGWaXSy6o2yBS9t6vLYif19p+4wwAoQW8LADgIUs5GoLYeNdwXgxsM76WLsWeE+87SVXvxBsuQx5WBzvp82prUUvv9piV87Rsf4RdeFpsowLQKotOe0VDJyvjddE7H14Wc+tKmm4JHXmp0h8gnBvBHghDDBY0DlIl5c+Pf7ppj9vT4uC2ElU+Q56zG9gtAxzzuO9fhBgkl77FYcscvaRq634FXaOe1SrogTA9N+yzux8yUT1Cf2AU2XVXZWxkoRglII83X7w9y3bEsLkZ9UNOFk19vcVffj5i1OP3XtCp04iZB81bFlR+rdJicxGK7+hJIPmAPBN896m+rmginLT/T/cWs+071BdQNFwh03VKopB7BhJqLM8us2Zi2sJIyGJlYwHqCmv7lgk5JsirdFx+vUgGorRPvgx3xzVfG6PbyeGDaN5gsv2TpKHMdgkDAtIOHKLITR0tQm4FVlQfToBL6lC4E8JylPIAmCScGG0NMKygvLTNuN6vKqeg1s4Yp7SdyWqbny5wJ4N25cerA/6a7HPJCsNNiYq7DnaKUxosJR8ccD/l5EmC+iCYBbQqYimP8PY=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB4333.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(316002)(38100700002)(54906003)(110136005)(86362001)(9686003)(508600001)(2906002)(33656002)(8676002)(38070700005)(76116006)(66446008)(64756008)(66476007)(66946007)(66556008)(5660300002)(71200400001)(4326008)(53546011)(8936002)(83380400001)(44832011)(26005)(186003)(52536014)(55016003)(122000001)(6506007)(7696005)(32563001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?b6J8GNkE5cRqJ5LCBY0gp3wUb1/Bnou7iKT5GAtMfzmM76qns94VKaL8hC2G?=
 =?us-ascii?Q?OC55XodGj4ucM2h+NCClPsSHG6XhLSozs1whJA7sbWgXBYLeaeX2x3Kcv/A6?=
 =?us-ascii?Q?RVyzHVXXvfZYu4kAOzOEgCmIIt++QtZTX6gS7hlFJ13OoczZwgMSyvWEblb7?=
 =?us-ascii?Q?ZoHY7/oD+lh/VssEoTyHHqmhITnnZWVmOYcFG36kbfuBHiQDo1U7Uw1DNa82?=
 =?us-ascii?Q?ow1BY6Ms4tPdYsVlWN1T4lMt1Y8MECXJmmv5gv1/iqmqV5P6gDBh2E49111W?=
 =?us-ascii?Q?t2h4Drfo2v2fEgpqbYWgN7CjsPlG+JFDk9+LZo/bHTkiPgrdqDZHRzMJTgE9?=
 =?us-ascii?Q?vYf0GKchmqfqY7F9V0NFiOOJFzGKKDieGnD4uAQ1nARDgjcPBWcur95gwmJb?=
 =?us-ascii?Q?icfuYoQfOHUwwgaZZwb83fZvq1dXEvo6+ZvIdaGt1Im0kumYxDhR/kYk80DV?=
 =?us-ascii?Q?l6i2rg6aNVvOh8Am+ijvYkqS9q22vjdILfalkDdX9bzyQQdR5Urn8pBAG2Yj?=
 =?us-ascii?Q?kUvBSNkpWWoJENBHU9UgOih4NkZI6C4xmDnrpPWzMN3NsNBUIQpVbqf0dEyf?=
 =?us-ascii?Q?tWC+IgPw+xZiOwdyRGOzZ3UZDeOP1c24axYYRnpLVJzycg3t8bQ2BYZ+6pPE?=
 =?us-ascii?Q?U2/l4vdw+r00RgN2+4beAsQ1365BMGPjLlAMSiSl1I0NY9WYWRPFWY9Tesfw?=
 =?us-ascii?Q?5qbNx79Wwz0+zVV1V3X0sxqdtOAKXHs8GCk5JMcVuA8MpaMVWMcu5fEqnDUr?=
 =?us-ascii?Q?yUbxdUz1zVR9VKQL4KBGI6uCi7bNiq90NgDKgniE0Q4EFUYpP0IiEDBvzjhX?=
 =?us-ascii?Q?80SHRVRzNQWKI4QDbIzirpG73kL4/1oNuKeKxqfeRO1ko1PMd8f+6/k30b9X?=
 =?us-ascii?Q?/O6ApFr4PC2bgjzcksuP/0J5lNQmbyeXWM3RcKqA2D+EinzCexMXI57R9QtQ?=
 =?us-ascii?Q?7tk3cbvcASiQ3CDz6ZuGXxcpln1FkWrnvtAKhd+ewoYIY6v8ArMX33cGboeK?=
 =?us-ascii?Q?/FO2DZgpBN5tEFDHG5PiQ7oAHJjeQA93I9qaGgXquPKGKhmQ7GRhJhE9xb8B?=
 =?us-ascii?Q?6SGzWRqzkJT0og5EsAk/I3nXXR7IT1ic4CMci4zMo+c5YeA+QNCWP1Z1zrJi?=
 =?us-ascii?Q?NQldmxb40I3mZaAWznwlP7Nq+s45Qo+d/8j1NhI/q2f/1+BBMfeaJrL3WaiH?=
 =?us-ascii?Q?k2Q9LWgA8t3t4JlJR7gR6i9yGx4EX2YFx9dlPPz3bG0kNIriNzSJ7a8Ahqp1?=
 =?us-ascii?Q?nU+Hv8zOPkJiVurQIk3E0eIsILfjIBXUtMr4ACfPxOrfqRZc/YD2u8Yr7ABc?=
 =?us-ascii?Q?r+TuesTZBn6uODApToRTvW7CBKdlrnUW3bRhf6ziecEP+gwbCw3mEwK5oK6G?=
 =?us-ascii?Q?D7k2/U0OXrzUvu+poke0szSLrcVYQySSdIYT/xjPAhk56A7+OuiZI77KmkiM?=
 =?us-ascii?Q?UB5ksQquyCmpLqTXcx/9dkXyu5wUt/42JbdzqIB0LvOPuC4z3wJL/h0JPLn0?=
 =?us-ascii?Q?sMXgNybEJdpzB9qlgYR0D2MmFGnzjh7DG6fkGjP2Zyq/qNvv7he9WnmJUmIT?=
 =?us-ascii?Q?8FtN01qPLESQcx5eAcE=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB4333.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f5ab228-aef0-4b42-300f-08d9f2ac1ae4
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Feb 2022 06:58:44.7688
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: P2ZZ9WOmaHAPrmHv6FhvHLjuy3B/cPzVQOz4sOt35GoSRBl4Kgf6weH6Bu8hJ7LN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR04MB3074
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
> Sent: Wednesday, January 26, 2022 10:14 PM
> To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>; Rob Herring
> <robh+dt@kernel.org>; Shawn Guo <shawnguo@kernel.org>; Sascha Hauer
> <s.hauer@pengutronix.de>; Fabio Estevam <festevam@gmail.com>
> Cc: Alexander Stein <alexander.stein@ew.tq-group.com>; dl-linux-imx
> <linux-imx@nxp.com>; linux-usb@vger.kernel.org;
> devicetree@vger.kernel.org; linux-arm-kernel@lists.infradead.org; Jun Li
> <jun.li@nxp.com>
> Subject: [PATCH v4 4/4] arm64: dts: imx8mp: Add memory for USB3 glue laye=
r
> to usb3 nodes
>=20
> The USB3 glue layer has 2 areas in the register set, see RM Rev.1 section
> 11.2.5.2.1 GLUE_usb3 memory map:
> * USB3 control/status
> * PHY control/status
>=20
> Provide the memory area to the usb3 nodes for accessing the features in t=
he
> USB3 control area.
>=20
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>

Reviewed-by: Li Jun <jun.li@nxp.com>

> ---
>  arch/arm64/boot/dts/freescale/imx8mp.dtsi | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>=20
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> index e61ac5f136ad..d4aadb434d36 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> @@ -1030,7 +1030,8 @@ usb3_phy0: usb-phy@381f0040 {
>=20
>  		usb3_0: usb@32f10100 {
>  			compatible =3D "fsl,imx8mp-dwc3";
> -			reg =3D <0x32f10100 0x8>;
> +			reg =3D <0x32f10100 0x8>,
> +			      <0x381f0000 0x20>;
>  			clocks =3D <&clk IMX8MP_CLK_HSIO_ROOT>,
>  				 <&clk IMX8MP_CLK_USB_ROOT>;
>  			clock-names =3D "hsio", "suspend";
> @@ -1070,7 +1071,8 @@ usb3_phy1: usb-phy@382f0040 {
>=20
>  		usb3_1: usb@32f10108 {
>  			compatible =3D "fsl,imx8mp-dwc3";
> -			reg =3D <0x32f10108 0x8>;
> +			reg =3D <0x32f10108 0x8>,
> +			      <0x382f0000 0x20>;
>  			clocks =3D <&clk IMX8MP_CLK_HSIO_ROOT>,
>  				 <&clk IMX8MP_CLK_USB_ROOT>;
>  			clock-names =3D "hsio", "suspend";
> --
> 2.25.1

