Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D684451F725
	for <lists+linux-usb@lfdr.de>; Mon,  9 May 2022 10:45:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229763AbiEIIsV (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 9 May 2022 04:48:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237361AbiEIIWj (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 9 May 2022 04:22:39 -0400
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (mail-eopbgr60063.outbound.protection.outlook.com [40.107.6.63])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F1351ECBA3
        for <linux-usb@vger.kernel.org>; Mon,  9 May 2022 01:18:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KgVLimD2ttuai6ZfrebearkUpoKkD32ZzLfVYT95gbYGkL3E6YAwsKbTAO1nBgUmnEI10sWy0JnJcGmEayNq1MxJURq0vwbr15oDFTQXOWYGRHhqs/luiokomdjdaBv0QQ3dwYJRLi0FKz2VTp2gws8gvCnTuQIZsQGN96so3+gxB/iC1Ll6Le46zDUNAWwvSiRSsqgWnfC6QtFYjoxVwT1dIws80NMwpVipkSjsMkgdK2ttRB2evFyFEAFT4ntKGZz27uNS8iIw1H464v+1KywDJMGnGFRc3NNPrXn2s3yO2tvpjm+stXmuRQOKIK2Q2RYl2//5Q9ixG/oSYSVsVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TAAtDoeupqmi0EPLvEeIyHevG+4ydYFZUVXRJuNnkuE=;
 b=Vdc5pkqX/s41r0F1I/GJEOdjWjxWPmP5mJ1vTdUmbUQHa0T41HzzEbZ18TYyTdIA8hn595FQ8OiuxM5h+S6g7NYK/lGLrnuULbDK9mjsCuvYu5WyxH4RgT0YVIjKKl3kjBmSBV2REooZZ8MnEb2pL/a2EEbs8nPTaNei9+9v+61wBUdxCQVblwp/acfI33iscRZ9ZEVh6482ykV0/6QWqhvjYHAdkdU4kSWcP0b3ukDKVWnutdQktEMtHGLs3vOnogM8zcji3cYMJXEEDo7tn3SxQmDKCIJA+LeRpNNjuLa2FW8YOEgOHIyWZksNqW100U3CmIh/PtK7ghGsYw5R8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TAAtDoeupqmi0EPLvEeIyHevG+4ydYFZUVXRJuNnkuE=;
 b=CdehJOWbEk8PO0Tqx9979cPrpfBqLwn78VC7+hAwnqho2RPt9zfMjccsbur2dU7yBr8Uaok/U+Al3r0dNgIagcaaGhTeVfCHVERZehVr365K0X6GBbPaFF4nB5VS3lwN3wGmu2s/69rYkETZvT3BFmjfNM9F6pfQik66dlmL4ok=
Received: from PA4PR04MB9640.eurprd04.prod.outlook.com (2603:10a6:102:261::21)
 by HE1PR04MB2970.eurprd04.prod.outlook.com (2603:10a6:7:1f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.22; Mon, 9 May
 2022 08:16:44 +0000
Received: from PA4PR04MB9640.eurprd04.prod.outlook.com
 ([fe80::597b:6d36:1222:b37a]) by PA4PR04MB9640.eurprd04.prod.outlook.com
 ([fe80::597b:6d36:1222:b37a%7]) with mapi id 15.20.5186.021; Mon, 9 May 2022
 08:16:44 +0000
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
Subject: RE: (EXT) RE: (EXT) RE: (EXT) Re: [RFC 1/1] usb: chipidea:
 ci_hdrc_imx: disable runtime pm for HSIC interface
Thread-Topic: (EXT) RE: (EXT) RE: (EXT) Re: [RFC 1/1] usb: chipidea:
 ci_hdrc_imx: disable runtime pm for HSIC interface
Thread-Index: AQHYLhnmUXUN/WmNiEuWfaw84cAuH6y/ulKAgBZziACAEOaEAIAAJ91wgAO+U4CAAWosAIAiSgGAgAMjR6CAAAo/AIAEum/w
Date:   Mon, 9 May 2022 08:16:44 +0000
Message-ID: <PA4PR04MB96402FC5407EE75EE77D27BF89C69@PA4PR04MB9640.eurprd04.prod.outlook.com>
References: <20220302094239.3075014-1-alexander.stein@ew.tq-group.com>
 <5566202.DvuYhMxLoT@steina-w>
 <PA4PR04MB9640971E2CFB506FF5ED221A89C59@PA4PR04MB9640.eurprd04.prod.outlook.com>
 <1792784.atdPhlSkOF@steina-w>
In-Reply-To: <1792784.atdPhlSkOF@steina-w>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 122417bf-0527-4e05-6820-08da31944132
x-ms-traffictypediagnostic: HE1PR04MB2970:EE_
x-microsoft-antispam-prvs: <HE1PR04MB29706DEF429D4B8BF6D7CA1289C69@HE1PR04MB2970.eurprd04.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: tdSF/suzDjXmOSbQmU073W79pPItCdQnVThzlFBws2sTiHah6oXYY32sqvD/xmKI8GPmI8YcNY2MJmHFF+u9LInlG62IaNpGlWxh2xtI9vnOAFrO+9hIWYYm7G3RWOdmZVzR19tzAZeGbQyB1f9Gg7F1cDSSpYI88CrSJinQ8zswp0umbuAMQoYIJvu8k+go8ifI//JuylPwHnywJ8Z1ZYQeYAWnXsmDSZZuqOCgAZQAcv5VxEOUCMJ0whPlPlpvu3RomCJao41hp12cX+0dpU1vQT+r65PkY3NCUfdqnsspIwQv4Xm75EFATSdHLm32lETISB6QsE2Ii/FsbgRURSRNoiQEuOJn6LcARysYIqY8ZAOxi2j3lMFsakPV64kSwrwH/liB/ikSty6SiH5F5gd+hGLW1kdbVjyBs2FNHDWypsMERMWNS0SDHP50ztPYrG2fO0PnOcQu+3hP0jyPsC/agaMDpzzBufoYN+zS9dWlavBWQFANDU38ctqF4aMVsLzP5HiFPJvEFXQmNzQ3YnjerPTWs7RTAL5ETg4JiPdywEaXDnWnnZjGtRQIq+KV6qyYIrbT3DeRNXhlhEKWPtS3oCiWWCWly3TSIvuj/srCa+or7eYZNFao/9nRffB8OwrFWaRmliHXJx9RL4aZZofBEF48SGcpZOOwnn6xEUGOyJaIgV8m8Kig1tqmfH5lLRdIFEtb1zlYgOF1XcNLJavCb55Jgxc0041oWaOwbO4haNwTYSjLREtNMaI9Y4Kcl2ciUagf/LMlLG6rx9zjm9rlCG58b9zJzR3LoAyi8Dw=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9640.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(26005)(54906003)(66556008)(66946007)(110136005)(30864003)(8936002)(7416002)(44832011)(5660300002)(186003)(52536014)(71200400001)(76116006)(86362001)(66446008)(66476007)(64756008)(316002)(4326008)(8676002)(84970400001)(83380400001)(55016003)(6506007)(53546011)(7696005)(38070700005)(38100700002)(2906002)(9686003)(508600001)(66574015)(33656002)(122000001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?i73tEa0sVosMMrIdQWg/zHeApbF6dylbO1TkVv9VVnSWCbgDQFZ3FNVKIp?=
 =?iso-8859-1?Q?z8OjLWu8XwbdepZu6mcpPKQGUBf5ymw2QHFTO1ldlJbKe4Dk5TxDgJDN+j?=
 =?iso-8859-1?Q?e6zihBZ8F8lSeVWb+1pYCXDI2GykrbNnOqKj+jbCp1GZSTIrJUiyVFLgo2?=
 =?iso-8859-1?Q?nyazKdrA9pSYnVEqAKPtK/tTFYYr8NkRfSCrP/FPV+gSzeH1SAH1H9lobc?=
 =?iso-8859-1?Q?IZnldaQfr0CHNHjeMb/JYrw7ATkXAheagPGdwfVW+XWlE7p7JdvJ2jAtU4?=
 =?iso-8859-1?Q?gtVIBmw2DcPQ6vYRe+l+sCEavhrxYopT0Kj433VEL7/RexSQi+d6/+KqPn?=
 =?iso-8859-1?Q?nWxh8tpRyTuMjfmxxkvQw3+WlgULHId3zKrB0rnTfYDF7r20KeTjQs9Hf4?=
 =?iso-8859-1?Q?nA35C0LwKlyL2iWNsm5kJyIfX+ApYnOuIoJM0LvuG8znmT19beDSDEcFM8?=
 =?iso-8859-1?Q?9ngCkWRP7XCQPfj7ovHR0bgGkDQ3a/FDPjfpgbqwgEa41b0MUSi4RbMPVh?=
 =?iso-8859-1?Q?XN4suMz5j89wUpNYYDHNCgaPZh+ga4pj+anmyZf5fWoAFzepcTSPUmxeiu?=
 =?iso-8859-1?Q?psuiMoxSS3ddmYfhXZZwXplCBC7rJYXsNDBoFXUoH3uw7KPQPDZW1NGxfV?=
 =?iso-8859-1?Q?aQQln/zkVhPtb8Q6pWYKyEmfdcwQ/2uIAXMKg6f+PfECFvnlkvrOlvJOxP?=
 =?iso-8859-1?Q?ujZxb485tnFVGDnxlmgFLeV43we6p9WxCJA0fkAx/i6ZWZZ/sAzLA0wr4V?=
 =?iso-8859-1?Q?IqKeCCaChxGy0mQZxyHaqSkm1WweC/yr4TWQCc3Skw/PhilpossHnEf2mh?=
 =?iso-8859-1?Q?6J1hMI+M1h/Tgsw8/Ogio95Iyj4dWTuZSQLyYRuDLqQzbb0gyvLkHMlbYN?=
 =?iso-8859-1?Q?Dfkxef+ZI/fEN/uo4Ls30n9jhJ4+jBm0GPZDTvqHwEb2J8NcSdUaJoJf8a?=
 =?iso-8859-1?Q?5dr4StOa0SCfUihNk/SCnZZ7hGhzKJ1gJy5VgWDBboBQLS4ha/+zAhjGHd?=
 =?iso-8859-1?Q?UYRxJcsiRG9i8CcwLAGzhHOMEvqBmF69RbRCxIsn0IgTBOzhc/SmgL781L?=
 =?iso-8859-1?Q?b/vBT5SRUnbFcLR6pEJ3G39L9wJa5gkmgGSUkEGzaq7eC6gxBeqkqhsZ5K?=
 =?iso-8859-1?Q?W9ZDlYpQTtNxjqNCd4USOjWPJXDHQxWWJgyipO7cJReOFS5gWE4sVE7+1L?=
 =?iso-8859-1?Q?DNuvWeOxqQf/0Ugd7tXuoyI3zqshSPdiaK+I3MQR/9sKeM5Irw+H+CPynt?=
 =?iso-8859-1?Q?A3aPe5zI2CI2dtmWfCWFMJBS8SB/qVdGc4LZ+7V+HFZgNYgiffJeskaX/H?=
 =?iso-8859-1?Q?jC5f+5velUBX0P6uQ9g5S/0cpl7Fj6q6CtKIGNJWO04WKANAwjQYyOhA1P?=
 =?iso-8859-1?Q?WfiUI2F/cYvgYF9tIGB3+81rvdDottSZwCi7gpnwOptNugf5oNFHeeeKfy?=
 =?iso-8859-1?Q?tN6bA8f9Lfd/3278qhImVdO6J/vkLDutLJY8P8EbTkCjdkwspymFbjB2FU?=
 =?iso-8859-1?Q?Th9X2dHCkLsHCqRsee82Vvs+e1l9+phhnvzUyEf/3gGC1TWXseyx08olrx?=
 =?iso-8859-1?Q?Fp4hgVuEC+zT+4zXVbR+nN7jAEAsuC6bHeVI3tiQuog+1IYSCusIQ2smmV?=
 =?iso-8859-1?Q?9LUjwmaDM6QYU9rErr3ForMlsNlJRGpWG3yoUITSAa6uU8USdeuMTCITh7?=
 =?iso-8859-1?Q?qjUgPxJhaa8g5yJiCYrwMtidtc2qG/OdhNO9qwEKjB3t6nTgs0GKt/6lEQ?=
 =?iso-8859-1?Q?cmghszmpoXtioes0tjEIWL2FvieJz5/ubCt1YaP9MveY37?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9640.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 122417bf-0527-4e05-6820-08da31944132
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 May 2022 08:16:44.4621
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tEqHETuLKRiFxtoWK7/Hc049pjtSr9ZSRFRCa/Bejd5GnY3jSi9zrSme8ZU5c9q4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR04MB2970
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
> From: Alexander Stein <alexander.stein@ew.tq-group.com>
> Sent: Friday, May 6, 2022 3:38 PM
> To: Peter Chen <peter.chen@kernel.org>; Jun Li <jun.li@nxp.com>
> Cc: Peter Chen <hzpeterchen@gmail.com>; Greg Kroah-Hartman
> <gregkh@linuxfoundation.org>; Shawn Guo <shawnguo@kernel.org>; Sascha
> Hauer <s.hauer@pengutronix.de>; Fabio Estevam <festevam@gmail.com>;
> Pengutronix Kernel Team <kernel@pengutronix.de>; dl-linux-imx
> <linux-imx@nxp.com>; USB list <linux-usb@vger.kernel.org>;
> linux-arm-kernel@lists.infradead.org
> Subject: Re: (EXT) RE: (EXT) RE: (EXT) Re: [RFC 1/1] usb: chipidea:
> ci_hdrc_imx: disable runtime pm for HSIC interface
>=20
> Am Freitag, 6. Mai 2022, 09:09:22 CEST schrieb Jun Li:
> > > -----Original Message-----
> > > From: Alexander Stein <alexander.stein@ew.tq-group.com>
> > > Sent: Wednesday, May 4, 2022 3:06 PM
> > > To: Peter Chen <peter.chen@kernel.org>; Jun Li <jun.li@nxp.com>
> > > Cc: Peter Chen <hzpeterchen@gmail.com>; Greg Kroah-Hartman
> > > <gregkh@linuxfoundation.org>; Shawn Guo <shawnguo@kernel.org>;
> > > Sascha Hauer <s.hauer@pengutronix.de>; Fabio Estevam
> > > <festevam@gmail.com>; Pengutronix Kernel Team
> > > <kernel@pengutronix.de>; dl-linux-imx <linux-imx@nxp.com>; USB list
> > > <linux-usb@vger.kernel.org>; linux-arm-kernel@lists.infradead.org
> > > Subject: Re: (EXT) RE: (EXT) Re: [RFC 1/1] usb: chipidea: ci_hdrc_imx=
:
> > > disable runtime pm for HSIC interface
> > >
> > > Helllo,
> > >
> > > Am Dienstag, 12. April 2022, 13:36:55 CEST schrieb Jun Li:
> > > > > -----Original Message-----
> > > > > From: Alexander Stein <alexander.stein@ew.tq-group.com>
> > > > > Sent: Monday, April 11, 2022 9:52 PM
> > > > > To: Peter Chen <peter.chen@kernel.org>; Jun Li <jun.li@nxp.com>
> > > > > Cc: Peter Chen <hzpeterchen@gmail.com>; Greg Kroah-Hartman
> > > > > <gregkh@linuxfoundation.org>; Shawn Guo <shawnguo@kernel.org>;
> > > > > Sascha Hauer <s.hauer@pengutronix.de>; Fabio Estevam
> > > > > <festevam@gmail.com>; Pengutronix Kernel Team
> > > > > <kernel@pengutronix.de>; dl-linux-imx <linux-imx@nxp.com>; USB
> > > > > list <linux-usb@vger.kernel.org>;
> > > > > linux-arm-kernel@lists.infradead.org
> > > > > Subject: Re: (EXT) RE: (EXT) Re: [RFC 1/1] usb: chipidea: ci_hdrc=
_imx:
> > > > > disable runtime pm for HSIC interface
> > > > >
> > > > > Hi,
> > > > >
> > > > > Am Samstag, 9. April 2022, 06:49:54 CEST schrieb Jun Li:
> > > > > > > -----Original Message-----
> > > > > > > From: Peter Chen <peter.chen@kernel.org>
> > > > > > > Sent: Saturday, April 9, 2022 10:20 AM
> > > > > > > To: Alexander Stein <alexander.stein@ew.tq-group.com>
> > > > > > > Cc: Peter Chen <hzpeterchen@gmail.com>; Greg Kroah-Hartman
> > > > > > > <gregkh@linuxfoundation.org>; Shawn Guo
> > > > > > > <shawnguo@kernel.org>; Sascha Hauer
> > > > > > > <s.hauer@pengutronix.de>; Fabio Estevam
> > > > > > > <festevam@gmail.com>; Pengutronix Kernel Team
> > > > > > > <kernel@pengutronix.de>; dl-linux-imx <linux-imx@nxp.com>;
> > > > > > > USB list <linux-usb@vger.kernel.org>;
> > > > > > > linux-arm-kernel@lists.infradead.org
> > > > > > > Subject: Re: (EXT) Re: [RFC 1/1] usb: chipidea: ci_hdrc_imx:
> > > > > > > disable runtime pm for HSIC interface
> > > > > > >
> > > > > > > On 22-03-29 10:14:36, Alexander Stein wrote:
> > > > > > > > Hello Peter,
> > > > > > > >
> > > > > > > > Am Dienstag, 15. M=E4rz 2022, 02:23:23 CEST schrieb Peter C=
hen:
> > > > > > > > > On Wed, Mar 2, 2022 at 5:42 PM Alexander Stein
> > > > > > > > >
> > > > > > > > > <alexander.stein@ew.tq-group.com> wrote:
> > > > > > > > > > With the add of power-domain support in commit
> > > > > > > > > > 02f8eb40ef7b
> > >
> > > ("ARM:
> > > > > > > dts:
> > > > > > > > > > imx7s: Add power domain for imx7d HSIC") runtime
> > > > > > > > > > suspend will disable the power-domain. This prevents
> > > > > > > > > > IRQs to occur when a new device is attached on a downst=
ream
> hub.
> > > > > > > > > >
> > > > > > > > > > Signed-off-by: Alexander Stein
> > > > > > > > > > <alexander.stein@ew.tq-group.com>
> > > > > > > > > > ---
> > > > > > > > > > Our board TQMa7x + MBa7x (i.MX7 based) uses a HSIC
> > > > > > > > > > link to mounted
> > > > > > >
> > > > > > > USB HUB
> > > > > > >
> > > > > > > > > > on usbh device. Cold plugging an USB mass storage
> > > > > > > > > > device is working
> > > > > > >
> > > > > > > fine.
> > > > > > >
> > > > > > > > > > But once the last non-HUB device is disconnected the
> > > > > > > > > > ci_hdrc device
> > > > > > >
> > > > > > > goes
> > > > > > >
> > > > > > > > > > into runtime suspend.
> > > > > > > > >
> > > > > > > > > Would you please show the difference between cold boot
> > > > > > > > > and runtime suspend after disconnecting the last USB devi=
ce?
> > > > > > > > >
> > > > > > > > > - Power domain on/off status for HUB device
> > > > > > > > > - Runtime suspend status at /sys entry for HUB device
> > > > > > > > > - "/sys/..power/wakeup" /sys entry  for HUB device
> > > > > > > >
> > > > > > > > I hope I got all entries you requested.
> > > > > > > >
> > > > > > > > For reference this is the bus topology:
> > > > > > > > lsusb -t
> > > > > > > > /:  Bus 02.Port 1: Dev 1, Class=3Droot_hub,
> > > > > > > > Driver=3Dci_hdrc/1p, 480M
> > > > > > > > /:  Bus 01.Port 1: Dev 1, Class=3Droot_hub,
> > > > > > > > Driver=3Dci_hdrc/1p, 480M
> > > > > > > >
> > > > > > > >     |__ Port 1: Dev 2, If 0, Class=3DHub, Driver=3Dhub/4p, =
480M
> > > > > > > >     |
> > > > > > > >         |__ Port 2: Dev 3, If 0, Class=3DMass Storage,
> > > > > > > >
> > > > > > > > Driver=3Dusb-storage,
> > > > > > >
> > > > > > > 480M
> > > > > > >
> > > > > > > > Bus 2 is a different connector and doesn't matter here.
> > > > > > > > I'm disconnecting
> > > > > > >
> > > > > > > 'Dev
> > > > > > >
> > > > > > > > 3' in this scenario.
> > > > > > > >
> > > > > > > > After boot up with the bus as shown above:
> > > > > > > > $ cat /sys/bus/usb/devices/1-1/power/wakeup
> > > > > > > > disabled
> > > > > > > > $ cat /sys/bus/usb/devices/1-1/power/runtime_status
> > > > > > > > active
> > > > > > > > $ cat
> > > > > > > > /sys/kernel/debug/pm_genpd/usb-hsic-phy/current_state
> > > > > > > > on
> > > > > > > >
> > > > > > > > After disconnecting Dev 3 from the bus ('usb 1-1.2: USB
> > > > > > > > disconnect, device number 3' in dmesg) the status changes
> > > > > > > > as follows (without the patch):
> > > > > > > > $ cat /sys/bus/usb/devices/1-1/power/wakeup
> > > > > > > > disabled
> > > > > > > > $ cat /sys/bus/usb/devices/1-1/power/runtime_status
> > > > > > > > suspended
> > > > > > > > $ cat
> > > > > > > > /sys/kernel/debug/pm_genpd/usb-hsic-phy/current_state
> > > > > > > > off-0
> > > > > > > >
> > > > > > > > For the record, when applying the posted patch this
> > > > > > > > changes
> > > > > > > > into:
> > > > > > > > $ cat /sys/bus/usb/devices/1-1/power/wakeup
> > > > > > > > disabled
> > > > > > > > $ cat /sys/bus/usb/devices/1-1/power/runtime_status
> > > > > > > > suspended
> > > > > > > > $ cat
> > > > > > > > /sys/kernel/debug/pm_genpd/usb-hsic-phy/current_state
> > > > > > > > on
> > > > > > >
> > > > > > > Okay, I think the problem here is the power domain for USB
> > > > > > > controller is off at runtime, but USB controller/PHY needs
> > > > > > > to detect the USB wakeup signal at runtime, so the USB
> > > > > > > controller/PHY's power domain should be not off. The proper
> > > > > > > change may keep power domain on at runtime, and the power
> > > > > > > domain
> > >
> > > could be off at system suspend.
> > >
> > > > > > Can this "hsic phy power domain off breaks wakeup" be confirmed=
?
> > > > > > Like with some hack to move hsic phy power domain on some
> > > > > > other device
> > > > > > node:
> > > > > >
> > > > > > non-usb-node {
> > > > > >
> > > > > >         ...
> > > > > >         power-domains =3D <&pgc_hsic_phy>;
> > > > > >         status =3D "okay";
> > > > > >
> > > > > > };
> > > > > >
> > > > > > Just make sure this non-usb-node to be runtime active when do
> > > > > > hsic hub test.
> > > > >
> > > > > Thanks for that suggestion. I apparently does work. Using the
> > > > > this small patch
> > > > >
> > > > > --->8---
> > > > > diff --git a/arch/arm/boot/dts/imx7-mba7.dtsi
> > > > > b/arch/arm/boot/dts/imx7- mba7.dtsi index
> > > > > b05f662aa87b..cba2f9efa17e
> > > > > 100644
> > > > > --- a/arch/arm/boot/dts/imx7-mba7.dtsi
> > > > > +++ b/arch/arm/boot/dts/imx7-mba7.dtsi
> > > > > @@ -580,6 +580,7 @@ &uart3 {
> > > > >
> > > > >         assigned-clocks =3D <&clks IMX7D_UART3_ROOT_SRC>;
> > > > >         assigned-clock-parents =3D <&clks IMX7D_OSC_24M_CLK>;
> > > > >         status =3D "okay";
> > > > >
> > > > > +       power-domains =3D <&pgc_hsic_phy>;
> > > > >
> > > > >  };
> > > > >
> > > > >  &uart4 {
> > > > >
> > > > > --->8---
> > > > >
> > > > > The HSIC power domain is also attached to to uart3.
> > > > >
> > > > > $ cat /sys/kernel/debug/pm_genpd/usb-hsic-phy/devices
> > > > > /devices/platform/soc/30800000.bus/30800000.spba-bus/30880000.se
> > > > > rial /devices/platform/soc/30800000.bus/30b30000.usb
> > > > > /devices/platform/soc/30800000.bus/30b30000.usb/ci_hdrc.1
> > > > > $ cat /sys/kernel/debug/pm_genpd/usb-hsic-phy/current_state
> > > > > on
> > > > > $ echo on >
> > > > > /sys/devices/platform/soc/30800000.bus/30800000.spba-bus/
> > > > > 30880000.serial/power/control
> > > > > $ lsusb -t
> > > > > /:  Bus 02.Port 1: Dev 1, Class=3Droot_hub, Driver=3Dci_hdrc/1p,
> > > > > 480M
> > > > > /:  Bus 01.Port 1: Dev 1, Class=3Droot_hub, Driver=3Dci_hdrc/1p,
> > > > > 480M
> > > > >
> > > > >     |__ Port 1: Dev 2, If 0, Class=3DHub, Driver=3Dhub/4p, 480M
> > > > >     |
> > > > >         |__ Port 2: Dev 3, If 0, Class=3DMass Storage, Driver=3D,
> > > > > 480M
> > > > >
> > > > > [USB
> > > > >
> > > > > disconnect] $ cat
> > > > > /sys/kernel/debug/pm_genpd/usb-hsic-phy/current_state
> > > > > on
> > > >
> > > > Just want to be sure this was done with hdrc imx runtime PM enabled=
.
> > > >
> > > > > [USB reconnect]
> > > > > $ lsusb -t
> > > > > /:  Bus 02.Port 1: Dev 1, Class=3Droot_hub, Driver=3Dci_hdrc/1p,
> > > > > 480M
> > > > > /:  Bus 01.Port 1: Dev 1, Class=3Droot_hub, Driver=3Dci_hdrc/1p,
> > > > > 480M
> > > > >
> > > > >     |__ Port 1: Dev 2, If 0, Class=3DHub, Driver=3Dhub/4p, 480M
> > > > >     |
> > > > >         |__ Port 2: Dev 4, If 0, Class=3DMass Storage, Driver=3D,
> > > > > 480M
> > > > >
> > > > > Hot plug detecting still works as you can see the USB device
> > > > > number increased.
> > > > >
> > > > > For the records, there is no difference to this patch in
> > > > > removing the power domain from USB HSIC device. I just wanted to
> > > > > keep the diff small.
> > > >
> > > > This is good enough to confirm this, thanks.
> > > >
> > > > I don't have a HW with HSIC enabled for test, and I am not sure
> > > > the initial state of power domain is on, can something like below
> > > > deserve a
> > >
> > > try?
> > >
> > > > diff --git a/drivers/soc/imx/gpcv2.c b/drivers/soc/imx/gpcv2.c
> > > > index
> > > > 3cb123016b3e..f5467ef18e33 100644
> > > > --- a/drivers/soc/imx/gpcv2.c
> > > > +++ b/drivers/soc/imx/gpcv2.c
> > > > @@ -416,6 +416,7 @@ static const struct imx_pgc_domain
> > > > imx7_pgc_domains[] =3D { [IMX7_POWER_DOMAIN_USB_HSIC_PHY] =3D {
> > > >
> > > >                 .genpd =3D {
> > > >
> > > >                         .name      =3D "usb-hsic-phy",
> > > >
> > > > +                       .flags     =3D GENPD_FLAG_RPM_ALWAYS_ON,
> > > >
> > > >                 },
> > > >                 .bits  =3D {
> > > >
> > > >                         .pxx =3D IMX7_USB_HSIC_PHY_SW_Pxx_REQ, @@
> > > > -930,7
> > > >
> > > > +931,7 @@ static int imx_pgc_domain_probe(struct platform_device
> > > > *pdev) regmap_update_bits(domain->regmap, GPC_PGC_CPU_MAPPING,
> > > > domain->bits.map, domain->bits.map);
> > > >
> > > > -       ret =3D pm_genpd_init(&domain->genpd, NULL, true);
> > > > +       ret =3D pm_genpd_init(&domain->genpd, NULL,
> > > > + !(domain->genpd.flags &
> > > > GENPD_FLAG_RPM_ALWAYS_ON)); if (ret) {
> > > >
> > > >                 dev_err(domain->dev, "Failed to init power domain\n=
");
> > > >                 goto out_domain_unmap;
> > >
> > > This does indeed the trick. But AFAICS the downside is that the
> > > powerdomain is enabled, even if USB is not used. Not sure if this is
> > > acceptable though.
> >
> > I think GENPD_FLAG_RPM_ALWAYS_ON is the right thing to do if the HSIC
> > port need the power domain on to detect remote wakeup, what's the
> > exact meaning of "USB is not used"?
>=20
> Exactly, GENPD_FLAG_RPM_ALWAYS_ON is the right thing to to iff the HSIC p=
ort
> needs the powerdomain. But what about the case when HSIC is not enabled a=
t
> all? That's what I meant by "USB is not used".
> AFAICS setting GENPD_FLAG_RPM_ALWAYS_ON enables the powerdomain
> unconditionally from any user.

If HSIC is not enabled at all, seems the power domain of it will not be tou=
ched
by kernel, so there maybe mismatch between the actual HW state and the SW s=
tate,
but this is another topic.

For this HSIC case, a second thought I think the better solution maybe
correct the power domain to its right user, since this power domain
is for phy, so:

diff --git a/arch/arm/boot/dts/imx7s.dtsi b/arch/arm/boot/dts/imx7s.dtsi
index 008e3da460f1..039eed79d2e7 100644
--- a/arch/arm/boot/dts/imx7s.dtsi
+++ b/arch/arm/boot/dts/imx7s.dtsi
@@ -120,6 +120,7 @@ usbphynop3: usbphynop3 {
                compatible =3D "usb-nop-xceiv";
                clocks =3D <&clks IMX7D_USB_HSIC_ROOT_CLK>;
                clock-names =3D "main_clk";
+               power-domains =3D <&pgc_hsic_phy>;
                #phy-cells =3D <0>;
        };
=20
@@ -1153,7 +1154,6 @@ usbh: usb@30b30000 {
                                compatible =3D "fsl,imx7d-usb", "fsl,imx27-=
usb";
                                reg =3D <0x30b30000 0x200>;
                                interrupts =3D <GIC_SPI 40 IRQ_TYPE_LEVEL_H=
IGH>;
-                               power-domains =3D <&pgc_hsic_phy>;
                                clocks =3D <&clks IMX7D_USB_CTRL_CLK>;
                                fsl,usbphy =3D <&usbphynop3>;
                                fsl,usbmisc =3D <&usbmisc3 0>;

Could you please try if this can work for you as well?

Li Jun =20
=20
>=20
> Alexander
>=20
>=20

