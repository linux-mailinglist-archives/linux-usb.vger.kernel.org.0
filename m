Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 75E7B51F935
	for <lists+linux-usb@lfdr.de>; Mon,  9 May 2022 12:00:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231659AbiEIKD1 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 9 May 2022 06:03:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237932AbiEIJ7c (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 9 May 2022 05:59:32 -0400
Received: from EUR02-HE1-obe.outbound.protection.outlook.com (mail-eopbgr10070.outbound.protection.outlook.com [40.107.1.70])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 362612250E
        for <linux-usb@vger.kernel.org>; Mon,  9 May 2022 02:54:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gXzG99pPBh/GsOPYqA7W+HS06pSlCZeLVrH2L5qUEYjiHsSf1CKY8qoJiwwHK9pe07Znx1cQq9c3gh/uyo0mZUFDzlXQxBi7phckI+C3JwfaIJboGIkxE4pOhZglIULhTNGjFyCvBeHoGFq+HzjX8PJ9YRSL19KgbI8yucsju9dfqhu6Nxq7hjCSxrL7q/eHLMq/pb3EXhSn9YTESQlqTvx4qCjSaKlkZgy2+Rh56XpzZDDzhcDEcK3b4lR9qcrubmllp51mtvlHGKNd61wPq7fhBM0TwwJaqcGDdzNA+dWOyqLK5AlTx44/wL3BCSRuKYGKK/it/jurYP7tuzN52Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FrM03cZGLOz5VSL8eYSdJpETRWP//3suYzHiApF1j/c=;
 b=BOeOMG8tQOS5VoNsqITdwaSERigOLiKCIBD4GMw9hpL06hHgYgjY4xMzHdvC76oZSDS8G//Xs2cRIAJVlo+1KKz3Ss3hkm575FRUj3uS4wfp+/7SzxVs7R4OvOcsoidb/9Uzs03LG8DVeALeD4GVRSjd+IK3ySkWoNymdWMlvaufg36mh1WBwmUiHaYvYH6MHXlynT5V3UaN0tUiSQ/nENwnUOkqbNPAzdcJJAsZwxk20SxnEd5WJC4zrKDrA1Gv17tGh/tXqyehSkQS1qhDMIosO0k0XumBbg+Zlf4SJNfEzywTyiOF9WzuTRMgKggqY085Hc1DNrfIGze/K4dUbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FrM03cZGLOz5VSL8eYSdJpETRWP//3suYzHiApF1j/c=;
 b=Cxq8TsYBp3/HogH2+mHNFh6Z9WO5usK1GSC4w4iNkAqOxNCGtBgyrzPo94w3ir2ovve2vOHpP5G1ut5yZuA0a8m3C3Hp4I4w/JlWe9Z8Ddv4FFwFFVtuSE4e/jK6Z1ibA06PhugKrSGewCIiIIaNq9q9cJ0+49KNDiEdXsDYme4=
Received: from PA4PR04MB9640.eurprd04.prod.outlook.com (2603:10a6:102:261::21)
 by DB7PR04MB5145.eurprd04.prod.outlook.com (2603:10a6:10:15::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.21; Mon, 9 May
 2022 09:53:45 +0000
Received: from PA4PR04MB9640.eurprd04.prod.outlook.com
 ([fe80::597b:6d36:1222:b37a]) by PA4PR04MB9640.eurprd04.prod.outlook.com
 ([fe80::597b:6d36:1222:b37a%7]) with mapi id 15.20.5186.021; Mon, 9 May 2022
 09:53:45 +0000
From:   Jun Li <jun.li@nxp.com>
To:     Frieder Schrempf <frieder.schrempf@kontron.de>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
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
Subject: RE: (EXT) RE: (EXT) RE: (EXT) Re: [RFC 1/1] usb: chipidea:
 ci_hdrc_imx: disable runtime pm for HSIC interface
Thread-Topic: (EXT) RE: (EXT) RE: (EXT) Re: [RFC 1/1] usb: chipidea:
 ci_hdrc_imx: disable runtime pm for HSIC interface
Thread-Index: AQHYLhnmUXUN/WmNiEuWfaw84cAuH6y/ulKAgBZziACAEOaEAIAAJ91wgAO+U4CAAWosAIAiSgGAgAMjR6CAAAo/AIAEum/wgAAbIwCAAAGLkA==
Date:   Mon, 9 May 2022 09:53:45 +0000
Message-ID: <PA4PR04MB964096E45FA8D2BF7115591489C69@PA4PR04MB9640.eurprd04.prod.outlook.com>
References: <20220302094239.3075014-1-alexander.stein@ew.tq-group.com>
 <5566202.DvuYhMxLoT@steina-w>
 <PA4PR04MB9640971E2CFB506FF5ED221A89C59@PA4PR04MB9640.eurprd04.prod.outlook.com>
 <1792784.atdPhlSkOF@steina-w>
 <PA4PR04MB96402FC5407EE75EE77D27BF89C69@PA4PR04MB9640.eurprd04.prod.outlook.com>
 <760c5924-1eeb-2ffa-99e5-b24105fc118f@kontron.de>
In-Reply-To: <760c5924-1eeb-2ffa-99e5-b24105fc118f@kontron.de>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1ea045e0-2f66-4a54-ea9a-08da31a1ce88
x-ms-traffictypediagnostic: DB7PR04MB5145:EE_
x-microsoft-antispam-prvs: <DB7PR04MB514514C9BE9DE07FBD111F6289C69@DB7PR04MB5145.eurprd04.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: r7iUMx9jRYosXZeTfrbakaM1uo3uqD82wFG3ONPdYfTOB4WSN45o6WLlIgg/4f1XiMZJkg/vtlcDkqOIYeYrz08nmhWz8jHvVqtmhgGXo8+bXkfpA+uHWsSK8ak0itrPUKPJeXo4XKhaur/RtoNy5m1gXMR55hMg2g0uj+N0EfUGcswooXt+HRAL4/ZvY5UgWu2f/+9iX9AMNI2BPC94XktDJoo0C4DWYVINKwrDsrsgcWHgZ7kuXBIjt8l/NFLih53Oj1edlEK5Z1HCsm20Lhq2QMyIDP8xVpACa//1KiTHsQBEdDBbj+fxx3LPJXpJExPebb7FpLlVkWSOsvO3l4MHybyWa+Mf1Ti4+h+hNJDAEdRKmNbhdWcUZPcvaCwH9+PnuQYiimcsuQ27jSC2zpf4041/YmaStlRvPjg/WygUX5wIdRbkCV2sleET0UDxTkLkWhto+BF71KVxccY3E+DMFA5XiNA5Ufc8II5nbLugNv8o4j/sd/X3drac39/Lwso3OSHvWwjDx0Espomkm9BoXRh0A4nkt+2ynXGzwsX8JYr6KQEU7mLa3rG2Oc1BKFY8XIfriejAe0/+XyCjP/agM7vZ6vCSlSe9Vuc6XtX200baXYqEJ1GlS5ZnYCnJOskxINQyheiXr9uRbVgcqwNHZ/WDMLrwhPnzAhe5ER/+esFXu6QFl/0I5IDO7kLDy0R69yRVO5uoVLO2L8LVf1ZwQpeHt3ZcD5FJVSsNYYapX2SXGaLnzxk/+Kcny0fwPta9VtiO67kGgcKBN/9Nz3EQRrpxUNYZXldzYheQmGM=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9640.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(66946007)(66476007)(66446008)(4326008)(76116006)(8676002)(64756008)(6506007)(86362001)(26005)(84970400001)(7696005)(9686003)(38100700002)(38070700005)(53546011)(55016003)(122000001)(83380400001)(66556008)(52536014)(71200400001)(30864003)(2906002)(66574015)(8936002)(316002)(508600001)(45080400002)(966005)(186003)(33656002)(5660300002)(7416002)(44832011)(54906003)(110136005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?UqLUKOp2AYrHw+YRO9K/VI+G4DFEbvD+efOOruODvns+W5UVg1qMML1D1K?=
 =?iso-8859-1?Q?+FwoExdC6CHDApasggivJPfzg0tKnVkKoWXkcWs3nZEoXJWO7QJexqCqbU?=
 =?iso-8859-1?Q?G9ysdRxDSt6c1Tf4dund6WF/Ov5Wy8vi+vb5ZZfNgHZKQjmhcPbWf0wfy9?=
 =?iso-8859-1?Q?RZtf3WVbN6uerj94K30B/GR5CCNmNwBuT73xqO32AZRusCUuRmFz6qzYIb?=
 =?iso-8859-1?Q?uBoWlqOB7hQpzKmS0g10JDZTSQfxj5QaKMsOqypWSa/zKbEOafPuiRkzbJ?=
 =?iso-8859-1?Q?7MOK1UhsHqS7nbqEy+4zlYq5j+Q9aTJO7eTDI9oGext2ek5XbmpHnKvVCx?=
 =?iso-8859-1?Q?Iirb5PaWRLLfcO9HvSL9/AneyCrh48ziqYaTxbut2El5JmT/87KiVM4I6D?=
 =?iso-8859-1?Q?MqGZbPa2tdt/wFpyx1AQ1d782LQXMi5kgy7ebRGA/pQ+hK6LSFYm0F8/oO?=
 =?iso-8859-1?Q?evokH9LO9lqQ+70Z9pSD9+XxSanoOud0GpIU8Se4jUCs8q8KK8cbGmyQzO?=
 =?iso-8859-1?Q?pf2w/auQ6K08K7bhqBe4jbyDsg9JE87Q+tMDpeS6FqEJGDJ65NXA4HQjAi?=
 =?iso-8859-1?Q?cBHFAPd5pQp09Cn+79caYJhsPkCvuOaw8EGjU3AxB9EeZRrG+rS2guDluq?=
 =?iso-8859-1?Q?78A0ePIy/t2b0+dyBBc4o1Tzkc1PRAP9hU+Qsvt0ruHyzWFWUCZtFYznga?=
 =?iso-8859-1?Q?M0DY+Thi9EWRESrP84GVz2fp4xd/r7b/Z+CiYLKHDpSp7EydFYXcVzieT/?=
 =?iso-8859-1?Q?iueUHyD3g+PAz2lT5vT2nDOBI7TmUukRb+E5uQTWrsFfRMJTz6/8pUTwjh?=
 =?iso-8859-1?Q?CnUDDFfDnbRFgkXi1ZsxbDEMWxazoO+iIWSNp/ENnuH7WUVb6KXwa7M4if?=
 =?iso-8859-1?Q?quSvc/ES7NIvQBrC6IrzUMpyrBE8xGxxT/arL8XqSg/PZdVOTQlcwSFse7?=
 =?iso-8859-1?Q?mni1WhWxM//VaNPOqKrGX+d7YoZrR6swgu1lj2mCkTINBjmUWMJM5DixHa?=
 =?iso-8859-1?Q?1mgOkSPjbXVenFUUUvtZFIRG2YpVEvwd1GnswFwI7AcmBs8UTjV7qTJqCB?=
 =?iso-8859-1?Q?G12+jr7eZjHZF6/ndQOETYyJMWia7zo/ePCDZmWlRsX0omwPl61X5vEzCl?=
 =?iso-8859-1?Q?l0lpKVW4+XSfCS2DVGEmXKtMpq7hzuE5qeFIjuZG4XCuY9DGiSH747G7o0?=
 =?iso-8859-1?Q?WM8tuMjLweeH8UOmJC0HhdP2eZKk+qWWj1q29+VxTondQVgQ/t0XYPv04C?=
 =?iso-8859-1?Q?u/Dbb9yRh7PCmxgBRszRpSyUfbx9szL1iJBcdXX44sXQsJvkFvnLdXLkJd?=
 =?iso-8859-1?Q?Hf6/wX6XsXxR+Lxg+2/dXicxO5PeXWp5TTDOu9rnH0uu/Y2vfnykzP5Fj/?=
 =?iso-8859-1?Q?zBssPMMy9KddiH+7wADPRVeuFqPsBsJBa0z9NMcaMPZSDiwCZGi8jbzYI8?=
 =?iso-8859-1?Q?E3nUE2tBGBa+GiO8a4KsFVCu5jUEdE+sDBhb7SWLKGF7yipOLuBtx+bv4f?=
 =?iso-8859-1?Q?5C4cZJWuVAyMPbph2E1HmUgjoV1TM5k7g60E9+e4Cp6g4yFOVeFV2Wwf/s?=
 =?iso-8859-1?Q?xGcj61sYCvs+TQPNVF1DDntqmE9EFgnNRk2pOchfFzpiYK9UPccnwvWMIa?=
 =?iso-8859-1?Q?dBTFe66u3qCpjuWMpJJia/7eBRpzBSPiccQtsfbjfLJnKpOUSoNufcA6ca?=
 =?iso-8859-1?Q?lg65CGIQwX8LHDJE8TLSGjyF1mv8vfDdNyCoonqqwSNKKP5R13ASstZEpb?=
 =?iso-8859-1?Q?2/8a+HLlO2Ij6OwL7EgHAPzZlBnbiQnB+l9XPBRrjzPOu1?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9640.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ea045e0-2f66-4a54-ea9a-08da31a1ce88
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 May 2022 09:53:45.0609
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DZIE8aNf6EXWEn5mJJ/0edhRytBNWqrT52Wms3SunBviiP73WNF9Brgqeftcr0PJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB5145
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,URI_HEX
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



> -----Original Message-----
> From: Frieder Schrempf <frieder.schrempf@kontron.de>
> Sent: Monday, May 9, 2022 5:28 PM
> To: Jun Li <jun.li@nxp.com>; Alexander Stein
> <alexander.stein@ew.tq-group.com>; Peter Chen <peter.chen@kernel.org>
> Cc: Peter Chen <hzpeterchen@gmail.com>; Greg Kroah-Hartman
> <gregkh@linuxfoundation.org>; Shawn Guo <shawnguo@kernel.org>; Sascha
> Hauer <s.hauer@pengutronix.de>; Fabio Estevam <festevam@gmail.com>;
> Pengutronix Kernel Team <kernel@pengutronix.de>; dl-linux-imx
> <linux-imx@nxp.com>; USB list <linux-usb@vger.kernel.org>;
> linux-arm-kernel@lists.infradead.org
> Subject: Re: (EXT) RE: (EXT) RE: (EXT) Re: [RFC 1/1] usb: chipidea:
> ci_hdrc_imx: disable runtime pm for HSIC interface
>=20
> Am 09.05.22 um 10:16 schrieb Jun Li:
> >
> >
> >> -----Original Message-----
> >> From: Alexander Stein <alexander.stein@ew.tq-group.com>
> >> Sent: Friday, May 6, 2022 3:38 PM
> >> To: Peter Chen <peter.chen@kernel.org>; Jun Li <jun.li@nxp.com>
> >> Cc: Peter Chen <hzpeterchen@gmail.com>; Greg Kroah-Hartman
> >> <gregkh@linuxfoundation.org>; Shawn Guo <shawnguo@kernel.org>; Sascha
> >> Hauer <s.hauer@pengutronix.de>; Fabio Estevam <festevam@gmail.com>;
> >> Pengutronix Kernel Team <kernel@pengutronix.de>; dl-linux-imx
> >> <linux-imx@nxp.com>; USB list <linux-usb@vger.kernel.org>;
> >> linux-arm-kernel@lists.infradead.org
> >> Subject: Re: (EXT) RE: (EXT) RE: (EXT) Re: [RFC 1/1] usb: chipidea:
> >> ci_hdrc_imx: disable runtime pm for HSIC interface
> >>
> >> Am Freitag, 6. Mai 2022, 09:09:22 CEST schrieb Jun Li:
> >>>> -----Original Message-----
> >>>> From: Alexander Stein <alexander.stein@ew.tq-group.com>
> >>>> Sent: Wednesday, May 4, 2022 3:06 PM
> >>>> To: Peter Chen <peter.chen@kernel.org>; Jun Li <jun.li@nxp.com>
> >>>> Cc: Peter Chen <hzpeterchen@gmail.com>; Greg Kroah-Hartman
> >>>> <gregkh@linuxfoundation.org>; Shawn Guo <shawnguo@kernel.org>;
> >>>> Sascha Hauer <s.hauer@pengutronix.de>; Fabio Estevam
> >>>> <festevam@gmail.com>; Pengutronix Kernel Team
> >>>> <kernel@pengutronix.de>; dl-linux-imx <linux-imx@nxp.com>; USB list
> >>>> <linux-usb@vger.kernel.org>; linux-arm-kernel@lists.infradead.org
> >>>> Subject: Re: (EXT) RE: (EXT) Re: [RFC 1/1] usb: chipidea: ci_hdrc_im=
x:
> >>>> disable runtime pm for HSIC interface
> >>>>
> >>>> Helllo,
> >>>>
> >>>> Am Dienstag, 12. April 2022, 13:36:55 CEST schrieb Jun Li:
> >>>>>> -----Original Message-----
> >>>>>> From: Alexander Stein <alexander.stein@ew.tq-group.com>
> >>>>>> Sent: Monday, April 11, 2022 9:52 PM
> >>>>>> To: Peter Chen <peter.chen@kernel.org>; Jun Li <jun.li@nxp.com>
> >>>>>> Cc: Peter Chen <hzpeterchen@gmail.com>; Greg Kroah-Hartman
> >>>>>> <gregkh@linuxfoundation.org>; Shawn Guo <shawnguo@kernel.org>;
> >>>>>> Sascha Hauer <s.hauer@pengutronix.de>; Fabio Estevam
> >>>>>> <festevam@gmail.com>; Pengutronix Kernel Team
> >>>>>> <kernel@pengutronix.de>; dl-linux-imx <linux-imx@nxp.com>; USB
> >>>>>> list <linux-usb@vger.kernel.org>;
> >>>>>> linux-arm-kernel@lists.infradead.org
> >>>>>> Subject: Re: (EXT) RE: (EXT) Re: [RFC 1/1] usb: chipidea: ci_hdrc_=
imx:
> >>>>>> disable runtime pm for HSIC interface
> >>>>>>
> >>>>>> Hi,
> >>>>>>
> >>>>>> Am Samstag, 9. April 2022, 06:49:54 CEST schrieb Jun Li:
> >>>>>>>> -----Original Message-----
> >>>>>>>> From: Peter Chen <peter.chen@kernel.org>
> >>>>>>>> Sent: Saturday, April 9, 2022 10:20 AM
> >>>>>>>> To: Alexander Stein <alexander.stein@ew.tq-group.com>
> >>>>>>>> Cc: Peter Chen <hzpeterchen@gmail.com>; Greg Kroah-Hartman
> >>>>>>>> <gregkh@linuxfoundation.org>; Shawn Guo
> >>>>>>>> <shawnguo@kernel.org>; Sascha Hauer
> >>>>>>>> <s.hauer@pengutronix.de>; Fabio Estevam
> >>>>>>>> <festevam@gmail.com>; Pengutronix Kernel Team
> >>>>>>>> <kernel@pengutronix.de>; dl-linux-imx <linux-imx@nxp.com>;
> >>>>>>>> USB list <linux-usb@vger.kernel.org>;
> >>>>>>>> linux-arm-kernel@lists.infradead.org
> >>>>>>>> Subject: Re: (EXT) Re: [RFC 1/1] usb: chipidea: ci_hdrc_imx:
> >>>>>>>> disable runtime pm for HSIC interface
> >>>>>>>>
> >>>>>>>> On 22-03-29 10:14:36, Alexander Stein wrote:
> >>>>>>>>> Hello Peter,
> >>>>>>>>>
> >>>>>>>>> Am Dienstag, 15. M=E4rz 2022, 02:23:23 CEST schrieb Peter Chen:
> >>>>>>>>>> On Wed, Mar 2, 2022 at 5:42 PM Alexander Stein
> >>>>>>>>>>
> >>>>>>>>>> <alexander.stein@ew.tq-group.com> wrote:
> >>>>>>>>>>> With the add of power-domain support in commit
> >>>>>>>>>>> 02f8eb40ef7b
> >>>>
> >>>> ("ARM:
> >>>>>>>> dts:
> >>>>>>>>>>> imx7s: Add power domain for imx7d HSIC") runtime
> >>>>>>>>>>> suspend will disable the power-domain. This prevents
> >>>>>>>>>>> IRQs to occur when a new device is attached on a downstream
> >> hub.
> >>>>>>>>>>>
> >>>>>>>>>>> Signed-off-by: Alexander Stein
> >>>>>>>>>>> <alexander.stein@ew.tq-group.com>
> >>>>>>>>>>> ---
> >>>>>>>>>>> Our board TQMa7x + MBa7x (i.MX7 based) uses a HSIC
> >>>>>>>>>>> link to mounted
> >>>>>>>>
> >>>>>>>> USB HUB
> >>>>>>>>
> >>>>>>>>>>> on usbh device. Cold plugging an USB mass storage
> >>>>>>>>>>> device is working
> >>>>>>>>
> >>>>>>>> fine.
> >>>>>>>>
> >>>>>>>>>>> But once the last non-HUB device is disconnected the
> >>>>>>>>>>> ci_hdrc device
> >>>>>>>>
> >>>>>>>> goes
> >>>>>>>>
> >>>>>>>>>>> into runtime suspend.
> >>>>>>>>>>
> >>>>>>>>>> Would you please show the difference between cold boot
> >>>>>>>>>> and runtime suspend after disconnecting the last USB device?
> >>>>>>>>>>
> >>>>>>>>>> - Power domain on/off status for HUB device
> >>>>>>>>>> - Runtime suspend status at /sys entry for HUB device
> >>>>>>>>>> - "/sys/..power/wakeup" /sys entry  for HUB device
> >>>>>>>>>
> >>>>>>>>> I hope I got all entries you requested.
> >>>>>>>>>
> >>>>>>>>> For reference this is the bus topology:
> >>>>>>>>> lsusb -t
> >>>>>>>>> /:  Bus 02.Port 1: Dev 1, Class=3Droot_hub,
> >>>>>>>>> Driver=3Dci_hdrc/1p, 480M
> >>>>>>>>> /:  Bus 01.Port 1: Dev 1, Class=3Droot_hub,
> >>>>>>>>> Driver=3Dci_hdrc/1p, 480M
> >>>>>>>>>
> >>>>>>>>>     |__ Port 1: Dev 2, If 0, Class=3DHub, Driver=3Dhub/4p, 480M
> >>>>>>>>>     |
> >>>>>>>>>         |__ Port 2: Dev 3, If 0, Class=3DMass Storage,
> >>>>>>>>>
> >>>>>>>>> Driver=3Dusb-storage,
> >>>>>>>>
> >>>>>>>> 480M
> >>>>>>>>
> >>>>>>>>> Bus 2 is a different connector and doesn't matter here.
> >>>>>>>>> I'm disconnecting
> >>>>>>>>
> >>>>>>>> 'Dev
> >>>>>>>>
> >>>>>>>>> 3' in this scenario.
> >>>>>>>>>
> >>>>>>>>> After boot up with the bus as shown above:
> >>>>>>>>> $ cat /sys/bus/usb/devices/1-1/power/wakeup
> >>>>>>>>> disabled
> >>>>>>>>> $ cat /sys/bus/usb/devices/1-1/power/runtime_status
> >>>>>>>>> active
> >>>>>>>>> $ cat
> >>>>>>>>> /sys/kernel/debug/pm_genpd/usb-hsic-phy/current_state
> >>>>>>>>> on
> >>>>>>>>>
> >>>>>>>>> After disconnecting Dev 3 from the bus ('usb 1-1.2: USB
> >>>>>>>>> disconnect, device number 3' in dmesg) the status changes
> >>>>>>>>> as follows (without the patch):
> >>>>>>>>> $ cat /sys/bus/usb/devices/1-1/power/wakeup
> >>>>>>>>> disabled
> >>>>>>>>> $ cat /sys/bus/usb/devices/1-1/power/runtime_status
> >>>>>>>>> suspended
> >>>>>>>>> $ cat
> >>>>>>>>> /sys/kernel/debug/pm_genpd/usb-hsic-phy/current_state
> >>>>>>>>> off-0
> >>>>>>>>>
> >>>>>>>>> For the record, when applying the posted patch this
> >>>>>>>>> changes
> >>>>>>>>> into:
> >>>>>>>>> $ cat /sys/bus/usb/devices/1-1/power/wakeup
> >>>>>>>>> disabled
> >>>>>>>>> $ cat /sys/bus/usb/devices/1-1/power/runtime_status
> >>>>>>>>> suspended
> >>>>>>>>> $ cat
> >>>>>>>>> /sys/kernel/debug/pm_genpd/usb-hsic-phy/current_state
> >>>>>>>>> on
> >>>>>>>>
> >>>>>>>> Okay, I think the problem here is the power domain for USB
> >>>>>>>> controller is off at runtime, but USB controller/PHY needs
> >>>>>>>> to detect the USB wakeup signal at runtime, so the USB
> >>>>>>>> controller/PHY's power domain should be not off. The proper
> >>>>>>>> change may keep power domain on at runtime, and the power
> >>>>>>>> domain
> >>>>
> >>>> could be off at system suspend.
> >>>>
> >>>>>>> Can this "hsic phy power domain off breaks wakeup" be confirmed?
> >>>>>>> Like with some hack to move hsic phy power domain on some
> >>>>>>> other device
> >>>>>>> node:
> >>>>>>>
> >>>>>>> non-usb-node {
> >>>>>>>
> >>>>>>>         ...
> >>>>>>>         power-domains =3D <&pgc_hsic_phy>;
> >>>>>>>         status =3D "okay";
> >>>>>>>
> >>>>>>> };
> >>>>>>>
> >>>>>>> Just make sure this non-usb-node to be runtime active when do
> >>>>>>> hsic hub test.
> >>>>>>
> >>>>>> Thanks for that suggestion. I apparently does work. Using the
> >>>>>> this small patch
> >>>>>>
> >>>>>> --->8---
> >>>>>> diff --git a/arch/arm/boot/dts/imx7-mba7.dtsi
> >>>>>> b/arch/arm/boot/dts/imx7- mba7.dtsi index
> >>>>>> b05f662aa87b..cba2f9efa17e
> >>>>>> 100644
> >>>>>> --- a/arch/arm/boot/dts/imx7-mba7.dtsi
> >>>>>> +++ b/arch/arm/boot/dts/imx7-mba7.dtsi
> >>>>>> @@ -580,6 +580,7 @@ &uart3 {
> >>>>>>
> >>>>>>         assigned-clocks =3D <&clks IMX7D_UART3_ROOT_SRC>;
> >>>>>>         assigned-clock-parents =3D <&clks IMX7D_OSC_24M_CLK>;
> >>>>>>         status =3D "okay";
> >>>>>>
> >>>>>> +       power-domains =3D <&pgc_hsic_phy>;
> >>>>>>
> >>>>>>  };
> >>>>>>
> >>>>>>  &uart4 {
> >>>>>>
> >>>>>> --->8---
> >>>>>>
> >>>>>> The HSIC power domain is also attached to to uart3.
> >>>>>>
> >>>>>> $ cat /sys/kernel/debug/pm_genpd/usb-hsic-phy/devices
> >>>>>> /devices/platform/soc/30800000.bus/30800000.spba-bus/30880000.se
> >>>>>> rial /devices/platform/soc/30800000.bus/30b30000.usb
> >>>>>> /devices/platform/soc/30800000.bus/30b30000.usb/ci_hdrc.1
> >>>>>> $ cat /sys/kernel/debug/pm_genpd/usb-hsic-phy/current_state
> >>>>>> on
> >>>>>> $ echo on >
> >>>>>> /sys/devices/platform/soc/30800000.bus/30800000.spba-bus/
> >>>>>> 30880000.serial/power/control
> >>>>>> $ lsusb -t
> >>>>>> /:  Bus 02.Port 1: Dev 1, Class=3Droot_hub, Driver=3Dci_hdrc/1p,
> >>>>>> 480M
> >>>>>> /:  Bus 01.Port 1: Dev 1, Class=3Droot_hub, Driver=3Dci_hdrc/1p,
> >>>>>> 480M
> >>>>>>
> >>>>>>     |__ Port 1: Dev 2, If 0, Class=3DHub, Driver=3Dhub/4p, 480M
> >>>>>>     |
> >>>>>>         |__ Port 2: Dev 3, If 0, Class=3DMass Storage, Driver=3D,
> >>>>>> 480M
> >>>>>>
> >>>>>> [USB
> >>>>>>
> >>>>>> disconnect] $ cat
> >>>>>> /sys/kernel/debug/pm_genpd/usb-hsic-phy/current_state
> >>>>>> on
> >>>>>
> >>>>> Just want to be sure this was done with hdrc imx runtime PM enabled=
.
> >>>>>
> >>>>>> [USB reconnect]
> >>>>>> $ lsusb -t
> >>>>>> /:  Bus 02.Port 1: Dev 1, Class=3Droot_hub, Driver=3Dci_hdrc/1p,
> >>>>>> 480M
> >>>>>> /:  Bus 01.Port 1: Dev 1, Class=3Droot_hub, Driver=3Dci_hdrc/1p,
> >>>>>> 480M
> >>>>>>
> >>>>>>     |__ Port 1: Dev 2, If 0, Class=3DHub, Driver=3Dhub/4p, 480M
> >>>>>>     |
> >>>>>>         |__ Port 2: Dev 4, If 0, Class=3DMass Storage, Driver=3D,
> >>>>>> 480M
> >>>>>>
> >>>>>> Hot plug detecting still works as you can see the USB device
> >>>>>> number increased.
> >>>>>>
> >>>>>> For the records, there is no difference to this patch in
> >>>>>> removing the power domain from USB HSIC device. I just wanted to
> >>>>>> keep the diff small.
> >>>>>
> >>>>> This is good enough to confirm this, thanks.
> >>>>>
> >>>>> I don't have a HW with HSIC enabled for test, and I am not sure
> >>>>> the initial state of power domain is on, can something like below
> >>>>> deserve a
> >>>>
> >>>> try?
> >>>>
> >>>>> diff --git a/drivers/soc/imx/gpcv2.c b/drivers/soc/imx/gpcv2.c
> >>>>> index
> >>>>> 3cb123016b3e..f5467ef18e33 100644
> >>>>> --- a/drivers/soc/imx/gpcv2.c
> >>>>> +++ b/drivers/soc/imx/gpcv2.c
> >>>>> @@ -416,6 +416,7 @@ static const struct imx_pgc_domain
> >>>>> imx7_pgc_domains[] =3D { [IMX7_POWER_DOMAIN_USB_HSIC_PHY] =3D {
> >>>>>
> >>>>>                 .genpd =3D {
> >>>>>
> >>>>>                         .name      =3D "usb-hsic-phy",
> >>>>>
> >>>>> +                       .flags     =3D GENPD_FLAG_RPM_ALWAYS_ON,
> >>>>>
> >>>>>                 },
> >>>>>                 .bits  =3D {
> >>>>>
> >>>>>                         .pxx =3D IMX7_USB_HSIC_PHY_SW_Pxx_REQ, @@
> >>>>> -930,7
> >>>>>
> >>>>> +931,7 @@ static int imx_pgc_domain_probe(struct platform_device
> >>>>> *pdev) regmap_update_bits(domain->regmap, GPC_PGC_CPU_MAPPING,
> >>>>> domain->bits.map, domain->bits.map);
> >>>>>
> >>>>> -       ret =3D pm_genpd_init(&domain->genpd, NULL, true);
> >>>>> +       ret =3D pm_genpd_init(&domain->genpd, NULL,
> >>>>> + !(domain->genpd.flags &
> >>>>> GENPD_FLAG_RPM_ALWAYS_ON)); if (ret) {
> >>>>>
> >>>>>                 dev_err(domain->dev, "Failed to init power domain\n=
");
> >>>>>                 goto out_domain_unmap;
> >>>>
> >>>> This does indeed the trick. But AFAICS the downside is that the
> >>>> powerdomain is enabled, even if USB is not used. Not sure if this is
> >>>> acceptable though.
> >>>
> >>> I think GENPD_FLAG_RPM_ALWAYS_ON is the right thing to do if the HSIC
> >>> port need the power domain on to detect remote wakeup, what's the
> >>> exact meaning of "USB is not used"?
> >>
> >> Exactly, GENPD_FLAG_RPM_ALWAYS_ON is the right thing to to iff the HSI=
C
> port
> >> needs the powerdomain. But what about the case when HSIC is not enable=
d
> at
> >> all? That's what I meant by "USB is not used".
> >> AFAICS setting GENPD_FLAG_RPM_ALWAYS_ON enables the powerdomain
> >> unconditionally from any user.
> >
> > If HSIC is not enabled at all, seems the power domain of it will not be
> touched
> > by kernel, so there maybe mismatch between the actual HW state and the
> SW state,
> > but this is another topic.
> >
> > For this HSIC case, a second thought I think the better solution maybe
> > correct the power domain to its right user, since this power domain
> > is for phy, so:
> >
> > diff --git a/arch/arm/boot/dts/imx7s.dtsi
> b/arch/arm/boot/dts/imx7s.dtsi
> > index 008e3da460f1..039eed79d2e7 100644
> > --- a/arch/arm/boot/dts/imx7s.dtsi
> > +++ b/arch/arm/boot/dts/imx7s.dtsi
> > @@ -120,6 +120,7 @@ usbphynop3: usbphynop3 {
> >                 compatible =3D "usb-nop-xceiv";
> >                 clocks =3D <&clks IMX7D_USB_HSIC_ROOT_CLK>;
> >                 clock-names =3D "main_clk";
> > +               power-domains =3D <&pgc_hsic_phy>;
> >                 #phy-cells =3D <0>;
> >         };
> >
> > @@ -1153,7 +1154,6 @@ usbh: usb@30b30000 {
> >                                 compatible =3D "fsl,imx7d-usb",
> "fsl,imx27-usb";
> >                                 reg =3D <0x30b30000 0x200>;
> >                                 interrupts =3D <GIC_SPI 40
> IRQ_TYPE_LEVEL_HIGH>;
> > -                               power-domains =3D <&pgc_hsic_phy>;
> >                                 clocks =3D <&clks IMX7D_USB_CTRL_CLK>;
> >                                 fsl,usbphy =3D <&usbphynop3>;
> >                                 fsl,usbmisc =3D <&usbmisc3 0>;
> >
> > Could you please try if this can work for you as well?
> >
> > Li Jun
>=20
> I just want to point out, that on i.MX8MM I'm seeing a similar or even
> the same issue for non-HSIC ports. See this thread for more information:
> https://eur01.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Flists.
> infradead.org%2Fpipermail%2Flinux-arm-kernel%2F2022-April%2F733370.html
> &amp;data=3D05%7C01%7Cjun.li%40nxp.com%7C7c3395a1a7dc4faf1a6108da319e2894
> %7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C637876852607377524%7CUnkn
> own%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiL
> CJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=3Dv693uldsFnm4a0wLyt5%2Bq5thp2jKV
> V%2FIGvk2u458vGY%3D&amp;reserved=3D0.

I am involving that issue discussion too, in both issues, we
need keep the PHY power domain on, I think we have a clear
result the phy power domain should be attached to phy node
to match the actual HW component, apart from this, I cannot
image how that weird test result of "one USB port impact another
port on his board" links to your case.

Li Jun =20

