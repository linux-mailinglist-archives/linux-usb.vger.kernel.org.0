Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 65F2968039A
	for <lists+linux-usb@lfdr.de>; Mon, 30 Jan 2023 02:55:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230365AbjA3Bz5 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 29 Jan 2023 20:55:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60010 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229977AbjA3Bz4 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 29 Jan 2023 20:55:56 -0500
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2089.outbound.protection.outlook.com [40.107.22.89])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2538A1C30C
        for <linux-usb@vger.kernel.org>; Sun, 29 Jan 2023 17:55:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g3sEHqL04k5sEPPBbcFZIOEV/j3d0laaItuLIs1JkSuiNu94ZKETdeKndCOlDaPID6jLIzmlOIGeEbfIoQOLIEPb5TOk/JRhKJkFct+PUjBAtJ9ie3ry8IIQAizgjEGHeporJ8sFrielq3R2LZfJ5Y7Ljj+eutr6ihw2koKo8qea4QwoRLZtxZ1ceOpLugJHF1sY2k6QL8QAZxT+cpoPFw/E5xam9rdTdq3+cBvvWBLZnoHzsy0plweS8hiDyNrPf8hLGZLc2lE2upCea4ieap3MeQXDGrPfIzqqujVmUe+g8aaUYMvAI0oWI82GRU1/N6ohyqe3h2yzOWXejZJKRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jr4ypMc1aflFdiLLsdqFM5oHuZ+huYXPMHGR3E24jxE=;
 b=RFRCPvzbTwdXCQ82H8nXdnV4/ekqcKRVfFQVoThOtsgn6tt3sgOogbrjpLcx9/eo/HPX/Fzj/HBR7/qVg5/liM43fcXAwlDWCQVzBL8mOhY2+aPrGh9D7zkbuefOtnV+fpSXG5+6gQp7i350RLk9dt1xcQ/g6zTB5yQjTkQHhK6fHRMKtG/lbky8EGh7IAK2d4EP1Hz9tDX399Rp9+tEqYHCJM/lcBunnZRqqMuUZ4edodjFSD1MF79thi2P9aQWjTtn8LZ2EEo/O6ll5nQe78POCCeWxZRGje7+2gP4T0qSm1Fx0zqRXn4FO2fheG0ItlKCUDPJgmpAKbhuT96tog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jr4ypMc1aflFdiLLsdqFM5oHuZ+huYXPMHGR3E24jxE=;
 b=Nlx65NHD0YhQUNbg0Cd0JhDKW1nh46hI/hAh/B94CHb29zhoVe6z2BO8xqlq2D48UjOWHV69G3oP1I/60B70Qy124ColIzjjIn/9rKWf2G1S+iPlaEGLduMLYbcIjoAREzqxKgvnRv8a48j9gKKQVFZOm9tEkcNN600PcebFP/4=
Received: from DB7PR04MB4505.eurprd04.prod.outlook.com (2603:10a6:5:39::26) by
 AS8PR04MB7765.eurprd04.prod.outlook.com (2603:10a6:20b:2ae::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.36; Mon, 30 Jan
 2023 01:55:52 +0000
Received: from DB7PR04MB4505.eurprd04.prod.outlook.com
 ([fe80::f874:ee07:56fb:cbe0]) by DB7PR04MB4505.eurprd04.prod.outlook.com
 ([fe80::f874:ee07:56fb:cbe0%6]) with mapi id 15.20.6043.036; Mon, 30 Jan 2023
 01:55:52 +0000
From:   Xu Yang <xu.yang_2@nxp.com>
To:     "peter.chen@kernel.org" <peter.chen@kernel.org>
CC:     "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>, Jun Li <jun.li@nxp.com>
Subject: RE: [PATCH v2 2/3] usb: chipidea: core: fix possible concurrent when
 switch role
Thread-Topic: [PATCH v2 2/3] usb: chipidea: core: fix possible concurrent when
 switch role
Thread-Index: AQHZBJNz1KFKIC93QUegnf8CP6e2aK62kjnw
Date:   Mon, 30 Jan 2023 01:55:52 +0000
Message-ID: <DB7PR04MB450586635FF647C54339A7758CD39@DB7PR04MB4505.eurprd04.prod.outlook.com>
References: <20221130081231.3127369-1-xu.yang_2@nxp.com>
 <20221130081231.3127369-2-xu.yang_2@nxp.com>
In-Reply-To: <20221130081231.3127369-2-xu.yang_2@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB7PR04MB4505:EE_|AS8PR04MB7765:EE_
x-ms-office365-filtering-correlation-id: 0fa7af20-66fb-47e3-68dd-08db02651e3d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: g9TJLBUxx4erjMV4P+hWqPHl5XPTYV9tRYgbqTNPMDB+S3+R6AtIDQyPg/l9AyRDQlKlEjj8h979/17cuBzkxuV1n02TDtlahJV2vXtWLa04UIO8+/bXLJrcuDWty5oo+8B6Ao0ffITmRTANn7CBCkQyLCeAu4f9Ns3l7RuvU0C1nApR1q44nVtADos0+EXtWIpfYZ5A4X66GtI6/vUI6TEL7+iYlt9ICvr7nP5VysYVfUEU94f7aJanYTuUr1p87A67G+DdFsqweya+Jyb1obfQ1EHArQa0gamW+yFt4tXdlnfTMOlB0f86MEiYl1eVxGHzPk4YLu4xij/KZiKfacNZZcfaD3EYCHRct5cB3xqmxFEyLhJfvn06MMI3aQJa0QT2Os2IQyPB3UlMwtlxzA8sUfpNgvF/NHgFzxzaZY5t0K15zGoGrCy/mqgRJ0Ez7lhjUdjJui6Nn5Z0ISXvk6DvhL1tVQ9AZZ4k28ahRfJX2GeNY7S8B1/eJmkfPpNXJek54Wer/YGMzimek0rDiJsxxiwMNmVf1FxLtrchSZeAoi3YMiLF3tix+Lcc1IeCgMlBjlxmA5tp1AI1vdhJWzZ8LudoCA27Dy4XNcoPmVrCVvKMTEqAbzRar0d1TUcfex62c3YrjiaN/Ujw87EW3ptflJafkXPn6TqgRx6BBQliZT6W1/6dqp0ECWQuhO1HAJq0GRjHHr1moQHDM/32MA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR04MB4505.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(396003)(346002)(376002)(39860400002)(136003)(366004)(451199018)(71200400001)(7696005)(41300700001)(9686003)(6506007)(53546011)(478600001)(26005)(186003)(54906003)(316002)(66556008)(76116006)(38100700002)(122000001)(8676002)(64756008)(66476007)(4326008)(83380400001)(66446008)(6916009)(66946007)(55016003)(5660300002)(2906002)(38070700005)(33656002)(86362001)(8936002)(52536014);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?/tZK1Oqak2yFGc/ZzctQNvrEoY66vZN7I6D9/pUSXA/5MDQPM3cAmHsijL3t?=
 =?us-ascii?Q?JYkGG5MoHTzBoRwJJJLlPFUy2a6pegJrOsKOeD4BygnN5G7H1Hr9ypKLLINs?=
 =?us-ascii?Q?SUTSmsanu4YefWP5iz3evWQiRub961V6R1We5980tNkKC53PBgcN3GJ+s2VV?=
 =?us-ascii?Q?/0zHH1Obui6v43s1KPx13mtAVVdgKB1oiPbAvkPPZJxZoK4LwRwsaGVJr8UT?=
 =?us-ascii?Q?X6pewKjI65bpIbAtpHs/9A8n/xs4dFfaR0GsC42b/bvvxIKxz/JY7LLmorRn?=
 =?us-ascii?Q?DJpyJZ2C3sp+1tdSLQtdRuuk9wZ3dN3royTIAbi5Djprf4GzIMjNDcz6FBSV?=
 =?us-ascii?Q?CkbclAzXJQBAbEeZsubdNxoGwdQTJrwRxoHj9mSheUtY8OZgLzq9Vvi5xZCJ?=
 =?us-ascii?Q?YD9H3jGGDUZFClpyXtviqNtnsHVS+N/Dm1HGi6fHILpfPaSdbz8JBTgiUx83?=
 =?us-ascii?Q?eDrxXCC7+4chjo+iZBqggcMr9SWKWW+Ld+vrPYq5h9oC0JS1RRhvcKQeoKuz?=
 =?us-ascii?Q?D4k/DJHO/sp+5pNDokYFHicIVevEdif2wiOyL+2VlsGf4j1yqTag9uF/g3bj?=
 =?us-ascii?Q?tRNB2UsX7FGNfEzDNVGnezW+uLaiLtGVJgofrPS1yK45S2InTVCwmRnH9hyp?=
 =?us-ascii?Q?wGc+4F1w0v/hbaXRXw00HDf/gnapd4VvchmHWgfimuC2oKTq6b7Wra0sXU3y?=
 =?us-ascii?Q?wcc05caM9jiM9q7CUk4QJJnxRFjreJMsw2vTGHj5gYEwKcM3PYdRXUGs30DI?=
 =?us-ascii?Q?FWlwYOgKGWTDTBeza4j9G9eaq6GMyEAwt5D17ZleW/eON78IHWOx7ffR23rz?=
 =?us-ascii?Q?ec3n56oNJSzkEE2hsWcSUZT5VTLgIZq+gYEQyg12/DP/Eqec6PBArzZihSi3?=
 =?us-ascii?Q?Tzm8E2HBzndh3LHC7MF6T0eIJBqGKzqWieBWWobPy7ms0BxVoUeDmx6z6tyQ?=
 =?us-ascii?Q?ZT9fvyUl8DTDXcafMa97YEFTc0TDcvHmtvVN/I+zfE7tZ3KgvCrWJ+cySPlc?=
 =?us-ascii?Q?2/atnQWQSn4lYfJaiELhLPhLcJjdKb0rpGgufvbRxFXe79WwNu8XmklmSFtU?=
 =?us-ascii?Q?RGInxeNivxjtD4ZqU2wy+wXYWnnvtdDFGYtOSXhCEH2Rrkuch6vRah4tHTw1?=
 =?us-ascii?Q?C1S/nT9GXByZRCBkv/jFBgQMn9RsRqJqGHJh39J8X7WfgoQtcDInYoBMD1/M?=
 =?us-ascii?Q?cMR4Ff0qT9UQfP8atg2IjZcBAlZ95xmmQmEYw0ApWTpio2xFcv7NMWlp5/vN?=
 =?us-ascii?Q?43Y8+dnh/zycsrs99t2LGwUnvRNsi6MFFHbDfAEP5UYuP/8ZWkIsHJW3YWzZ?=
 =?us-ascii?Q?9KT7dHTomV6dufqLpl6rP+pklUHzR7pwUym9XSNAwY+F5R4M3OjtJLBPejKf?=
 =?us-ascii?Q?89jggwpIQHHfvrZndeDUvYMWPDORL2IZJGBBWiCL7ZhGmazelOuj6iXbqg7U?=
 =?us-ascii?Q?al8+X83Gkg209kIN9CnhDnBQWnTj2nUCCY6kH3JLDUKOQFG1J0YNi8uckYDq?=
 =?us-ascii?Q?yU6Ai5yrNlLGmfOHxyuIttFY7yZSZwmaBMbcyI7JGc9fMZrpPyr3Cgja1jMI?=
 =?us-ascii?Q?D6Wa28pkl2246AiH/r0=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB4505.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0fa7af20-66fb-47e3-68dd-08db02651e3d
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jan 2023 01:55:52.5038
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MWH7qD4OHnlOwejX5IRNxY48yn51Vyl9WPkaVUff43cuMWDteoLgTDT/VIGKpZSHUgN/EBtURST7SXKcpbuoeQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7765
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
> From: Xu Yang
> Sent: Wednesday, November 30, 2022 4:12 PM
> To: peter.chen@kernel.org
> Cc: gregkh@linuxfoundation.org; linux-usb@vger.kernel.org; dl-linux-imx <=
linux-imx@nxp.com>; Jun Li <jun.li@nxp.com>;
> Xu Yang <xu.yang_2@nxp.com>
> Subject: [PATCH v2 2/3] usb: chipidea: core: fix possible concurrent when=
 switch role
>=20
> The user may call role_store() when driver is handling
> ci_handle_id_switch() which is triggerred by otg event or power lost
> event. Unfortunately, the controller may go into chaos in this case.
> Fix this by protecting it with mutex lock.
>=20
> Fixes: a932a8041ff9 ("usb: chipidea: core: add sysfs group")
> cc: <stable@vger.kernel.org>
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
>=20
> ---
> changes since v1:
> - modify description for mutex member
> - wrap role variable in ci_handle_id_switch() too
> ---
>  drivers/usb/chipidea/ci.h   | 2 ++
>  drivers/usb/chipidea/core.c | 8 +++++++-
>  drivers/usb/chipidea/otg.c  | 5 ++++-
>  3 files changed, 13 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/usb/chipidea/ci.h b/drivers/usb/chipidea/ci.h
> index 005c67cb3afb..f210b7489fd5 100644
> --- a/drivers/usb/chipidea/ci.h
> +++ b/drivers/usb/chipidea/ci.h
> @@ -208,6 +208,7 @@ struct hw_bank {
>   * @in_lpm: if the core in low power mode
>   * @wakeup_int: if wakeup interrupt occur
>   * @rev: The revision number for controller
> + * @mutex: protect code from concorrent running when doing role switch
>   */
>  struct ci_hdrc {
>  	struct device			*dev;
> @@ -260,6 +261,7 @@ struct ci_hdrc {
>  	bool				in_lpm;
>  	bool				wakeup_int;
>  	enum ci_revision		rev;
> +	struct mutex                    mutex;
>  };
>=20
>  static inline struct ci_role_driver *ci_role(struct ci_hdrc *ci)
> diff --git a/drivers/usb/chipidea/core.c b/drivers/usb/chipidea/core.c
> index fcb175b22188..d7efde30d59f 100644
> --- a/drivers/usb/chipidea/core.c
> +++ b/drivers/usb/chipidea/core.c
> @@ -987,8 +987,12 @@ static ssize_t role_store(struct device *dev,
>  	if (role =3D=3D CI_ROLE_END)
>  		return -EINVAL;
>=20
> -	if (role =3D=3D ci->role)
> +	mutex_lock(&ci->mutex);
> +
> +	if (role =3D=3D ci->role) {
> +		mutex_unlock(&ci->mutex);
>  		return n;
> +	}
>=20
>  	pm_runtime_get_sync(dev);
>  	disable_irq(ci->irq);
> @@ -998,6 +1002,7 @@ static ssize_t role_store(struct device *dev,
>  		ci_handle_vbus_change(ci);
>  	enable_irq(ci->irq);
>  	pm_runtime_put_sync(dev);
> +	mutex_unlock(&ci->mutex);
>=20
>  	return (ret =3D=3D 0) ? n : ret;
>  }
> @@ -1033,6 +1038,7 @@ static int ci_hdrc_probe(struct platform_device *pd=
ev)
>  		return -ENOMEM;
>=20
>  	spin_lock_init(&ci->lock);
> +	mutex_init(&ci->mutex);
>  	ci->dev =3D dev;
>  	ci->platdata =3D dev_get_platdata(dev);
>  	ci->imx28_write_fix =3D !!(ci->platdata->flags &
> diff --git a/drivers/usb/chipidea/otg.c b/drivers/usb/chipidea/otg.c
> index 622c3b68aa1e..f5490f2a5b6b 100644
> --- a/drivers/usb/chipidea/otg.c
> +++ b/drivers/usb/chipidea/otg.c
> @@ -167,8 +167,10 @@ static int hw_wait_vbus_lower_bsv(struct ci_hdrc *ci=
)
>=20
>  void ci_handle_id_switch(struct ci_hdrc *ci)
>  {
> -	enum ci_role role =3D ci_otg_role(ci);
> +	enum ci_role role;
>=20
> +	mutex_lock(&ci->mutex);
> +	role =3D ci_otg_role(ci);
>  	if (role !=3D ci->role) {
>  		dev_dbg(ci->dev, "switching from %s to %s\n",
>  			ci_role(ci)->name, ci->roles[role]->name);
> @@ -198,6 +200,7 @@ void ci_handle_id_switch(struct ci_hdrc *ci)
>  		if (role =3D=3D CI_ROLE_GADGET)
>  			ci_handle_vbus_change(ci);
>  	}
> +	mutex_unlock(&ci->mutex);
>  }
>  /**
>   * ci_otg_work - perform otg (vbus/id) event handle
> --
> 2.34.1

A gentle ping.

