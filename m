Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C026F51D1FD
	for <lists+linux-usb@lfdr.de>; Fri,  6 May 2022 09:09:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345266AbiEFHNK (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 6 May 2022 03:13:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231811AbiEFHNJ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 6 May 2022 03:13:09 -0400
Received: from EUR03-VE1-obe.outbound.protection.outlook.com (mail-eopbgr50047.outbound.protection.outlook.com [40.107.5.47])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 231C866F8D
        for <linux-usb@vger.kernel.org>; Fri,  6 May 2022 00:09:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SgV575sajZ4CRCGaOGfXFbw0MSKLu4/3EHXjwrRkNoFeEV65ANto+G4DoSwEcku1OXGxSAa53KqymnsBAszHw0CccoJYUkBt4HY87a6WgyB4kG8RNGkPaw7ugOSJAmikpmuFIY5OHM1qelzViKo7T1wtwl0DBs4CD3fpSuq1GH1gyM1iAuP9Cnl5iRgrMjn4ylu2QO2Ojbep8fzMkUaSoBjKNiN9QkpbADpqdvf/BxFepG/cmynAHDs0kIJKlHrU3Ek5rDfB/8CMjVXNYpiHxq7ipjlHchQZqO0lRo84zyViE6h4AcYT0HcyjdUr5qVmawmIm/ql82kAJzleFvd2FQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W7/GTyJ05Oxqk1MueE1KmXfDNCMEwsOhofWnyHePzTo=;
 b=IFKsVUv3F5vOS2jgkyxMkT2sNuxC1g4+s2K+cLPlWVVP2K8JfPWI6hHSseqOEGcR7ZILCvbTLj3lsQOVcjsd8fE/SwXPtLHjflKnmE5uQIpAT2VdSg5SHfC08Pxy4c11go66Q35RK1nPF2J68b3XMMz3svt5Mi3zHv5YA8kUiPIDfhZWSVoHcjtu8cqCkXEj6+it7IxxH5QGoywx5uMnUW6Xm5wKTjCEgsgWsdcij8BzVoKcVO8IzU3015y8hEh8hrdchUNcm2hnMBVrTHI0HTb48QPYNrPF0yGQ40lXKxGE3Gz9/m8fMYHjk0Jh9DpwAHb1VyiW9sctwexqqieIDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W7/GTyJ05Oxqk1MueE1KmXfDNCMEwsOhofWnyHePzTo=;
 b=ggcyrsezZtVOlXVJA0xgdhejXHjFugaI3xRicZqqW+5Ntd/dj0f+64q0iEdRuBY03iohJP7odnCanvf3k3VW1GppghWFyl8g5/QJo9KnqkawwN/fxJaEn+Kl9I81MVMzB65SvDfgnl6Ub3cfc6BVe6jBEiMGwSwPqaD1FRjXOvQ=
Received: from PA4PR04MB9640.eurprd04.prod.outlook.com (2603:10a6:102:261::21)
 by VI1PR0402MB2944.eurprd04.prod.outlook.com (2603:10a6:800:ad::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.18; Fri, 6 May
 2022 07:09:22 +0000
Received: from PA4PR04MB9640.eurprd04.prod.outlook.com
 ([fe80::597b:6d36:1222:b37a]) by PA4PR04MB9640.eurprd04.prod.outlook.com
 ([fe80::597b:6d36:1222:b37a%7]) with mapi id 15.20.5186.021; Fri, 6 May 2022
 07:09:22 +0000
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
Thread-Index: AQHYLhnmUXUN/WmNiEuWfaw84cAuH6y/ulKAgBZziACAEOaEAIAAJ91wgAO+U4CAAWosAIAiSgGAgAMjR6A=
Date:   Fri, 6 May 2022 07:09:22 +0000
Message-ID: <PA4PR04MB9640971E2CFB506FF5ED221A89C59@PA4PR04MB9640.eurprd04.prod.outlook.com>
References: <20220302094239.3075014-1-alexander.stein@ew.tq-group.com>
 <1911252.usQuhbGJ8B@steina-w>
 <VI1PR04MB4333D96588BDAB546B61EADF89ED9@VI1PR04MB4333.eurprd04.prod.outlook.com>
 <5566202.DvuYhMxLoT@steina-w>
In-Reply-To: <5566202.DvuYhMxLoT@steina-w>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2eddb475-ce4f-48cb-0e9a-08da2f2f58a5
x-ms-traffictypediagnostic: VI1PR0402MB2944:EE_
x-microsoft-antispam-prvs: <VI1PR0402MB29441920BD032B2E1355794B89C59@VI1PR0402MB2944.eurprd04.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: YtZ3BEMZdapKt6E+4FvZCqQc/dMJYeBlx5qXD0Mb0inxTpdwTLDYpRBFXVZZw7N6hyLfcV/W32IVFVzqAUMQ54kw4H6v9GrJ1kvRQwvbHu/qSSpqUEiHMw2sV5bHDZu0lm/sL+jh+HDfHG+lhBX6loDxqYi7YMN8KaeYDINdSObw/wLRnwuGHDsL3ZCKhFJoDR90ANPrOgqTZJKoF183QvPIKQ+PNvjXnUyCjhYn3/rl1KaodvUq83HkdzrtAAzLj+zxYyh6Fw8i7cFHUOXvPeIWn4jFPRdpbZrn1ODqn4Bc+nEUHaF0Z4psXr8VsvP8IzUS1AM/qMT+zNbzSh0MpNCfWzQS39PfcaynTLqSUF6/4XikjM5+8bJVwQu9tgRnlMdCQ/7kqVb4576pkM7cnDaTi8a9hj8Bi0U2SSpVwkKwep/hJM8zIAdpzksA1TVJM0aUEb2PTtYi7ttmX1UYjb9m817eUSHZEMrIFEKNPogJWU2NlJJK0EvZBUPBrMfY8Lcpm//Mm6KaC8q5/qex4yBJ1fpr3mUVjf5LGS1OS5LS18dt1nqY/REqiypVX4EztrTSFhdMHsQrzTyqRohKF7IOmxOQQJ4um5wh9apYIX7RK3Wwv4G75b2e+ZDOljWMnk/5dWEOAJMsVVDGsPpFty+mYQGTG+0KtXLQVDSljU32TqEAwJ3yJqw9QDYmZ3M29X75O31+e48P3LG8faodI4YPCkL5kesfAeaf+FqCxdx+mNr90rc3y3BDyVV7wH4N1aBxRsBOieRwYxF9qb/lf/DbOnDEy4LZhfVa3nU3yP0=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9640.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(110136005)(4326008)(38070700005)(44832011)(7696005)(66574015)(2906002)(64756008)(66476007)(76116006)(8676002)(66946007)(122000001)(55016003)(316002)(54906003)(66556008)(66446008)(84970400001)(71200400001)(52536014)(33656002)(508600001)(8936002)(5660300002)(83380400001)(7416002)(38100700002)(9686003)(26005)(86362001)(53546011)(6506007)(186003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?hHqz2jxCT0W2BrfqtzJltD8CpiH1h5/SPfs7aLzE55GA3JSZZpS8JuQwmU?=
 =?iso-8859-1?Q?v3RLlymhHIhHOihQouCFN2dHeJYWH/EiL7L0SRBWCpFIZcuutMzQ9yl5L6?=
 =?iso-8859-1?Q?+sfCK9/yxCq2llgfyMfUvUtEOpsspsHXDdnwg/oDXIPrdehvDtPQl2K77k?=
 =?iso-8859-1?Q?hJVZH6+R7PSIRGBUA4aUicVbXP5xz5NZLG8poEKRV8YA9XvT/M9qIWEIGM?=
 =?iso-8859-1?Q?vml2jaCCZLC8UcL3MhiJt2hFOpTJXu+EFnExLz0dQjEvaW8r4ZQXOLrjs/?=
 =?iso-8859-1?Q?qDBZcK/ehg/ejkd9Z1zcp5Yj1hPYyZjp0fWagvqo1+mWgmvp85OWRF12nE?=
 =?iso-8859-1?Q?qQ+1nnohJLq1yR5CFF3Rr4QrhW4Rq3oW9Ac35MAqKsWQT9Xs/uPvCaakt2?=
 =?iso-8859-1?Q?4Y9Y7dfSH0UDp0cspzuHoNahY7calay25TPy2wrRRlJuOpNHYEMBq9B3nf?=
 =?iso-8859-1?Q?tXdpRa3F/uL3XHLUA+J02ZnrxACPWLNvN/jThw1+Ytq+t1Jgx+MbuyHyPj?=
 =?iso-8859-1?Q?y0WBQArndQSgIfYrDa3d66fDikdJ41iiPOUe3pBtnGoWg9Df3Fg7fJZRFr?=
 =?iso-8859-1?Q?6aJqj2MAef5MpXeLmCEO9osaU8/wuRQV/lUi/xk0DFd0pRIyXUu65lMDjA?=
 =?iso-8859-1?Q?6MM8CqQbZaRBzWrzzD45nuoQ0INy26fayaNDaOCoMJ1cJPkSqky/69nSHk?=
 =?iso-8859-1?Q?Tx/2jP0Zg96y8n2ATtSBLUs0KbCsnpIP12KCrvcKMtaS8XCXTH0CGiqaKY?=
 =?iso-8859-1?Q?YBsfgCDSDmmy86GNnqajjVNPfj2jyW5weLHSl+rG1lJAfHDTyzhbX6P+xO?=
 =?iso-8859-1?Q?I54wyj/YEOfkKZVgpm1BVQLWILiQXPhmy4wq0tEYhhpD/pv+Yfw7oM4WlS?=
 =?iso-8859-1?Q?iQmrXWlNtd+M1LGT9erdzchlllBO5RVFXW9gqUOWgaqUBBxYMt7JhlPcg0?=
 =?iso-8859-1?Q?dtENywIUQMQ0OC8IQgdLtieFQrWBOpc+pNMkqvSrb16Wxz4mSj94F4B5MV?=
 =?iso-8859-1?Q?kFSun30Zo7Zt95cI7hPWQo7qy3e99gBB0GEhIFmYZaIQnJlAuOoYqNTD+i?=
 =?iso-8859-1?Q?2Z/6EifoPAU1qURUs3EsTeUzm1o00UsWMrRuCZYkH3re6mnIhyi6qtGmwB?=
 =?iso-8859-1?Q?igIqgTwiXIKiAF/Gs1OyJV3GqRf53W3EgoJRAoweeUvIJJTmHHW+QKZ6nX?=
 =?iso-8859-1?Q?RZWmpqxZlYw/yWrEmsVT5fmH9kDP3nIJZ989wqJKOZC/fAL7AHizhQ+J0f?=
 =?iso-8859-1?Q?+VjKutUGe3d4VEXajN5LMB5vkaMrcPQJU2yybLJHu111+D11MvQ/t7Z3MA?=
 =?iso-8859-1?Q?PDkhYjJQEUln5/TAUkDAE6y7oUc8OnVHF4G0ooY/tGg7zIsCdEpK/xw8VO?=
 =?iso-8859-1?Q?qhtZKahy1OoBAgqA+25H2Rc3/3/YoZfA/z5NM/2NmPOXqGe7srjD0b6459?=
 =?iso-8859-1?Q?i4zAP+UdsAS6mjno/8tUdkBgLGuXwCdye0mq2X1B88LxYAOW8In5qavuTw?=
 =?iso-8859-1?Q?KbnbXD4haDfE3QkV5nTZzYDWgMN605Ji9+Lsv2FcT+IAYJ7dLnRdL1Gr4U?=
 =?iso-8859-1?Q?SUyu+cm45FGHpUqyoPvsyrNsH0GsqFNXS4e+r6TPuXslwBGAr41rgFXzrN?=
 =?iso-8859-1?Q?b6kGtzqzdVBrhuKw+jYw1VYSNo1OTEoTfJGsHAvgR91DUCsB32/PQpmnvL?=
 =?iso-8859-1?Q?qebMlFzJGbLLYyWCunGC3KlCxSaTbUdqni7rDdbkOeDOsXrDrpcGyVQoxk?=
 =?iso-8859-1?Q?Gy8Bvq7XbNjfodOHOC/RsPvtuncXYumsMs8sOG6TN+xnWL?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9640.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2eddb475-ce4f-48cb-0e9a-08da2f2f58a5
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 May 2022 07:09:22.2902
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2JeMnahWERWY3r97lLSmy6yJD1MLU7oCUH5UU7ih3DDQYidJxPPrOmXAnxtBV2OF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB2944
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
> Sent: Wednesday, May 4, 2022 3:06 PM
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
> Helllo,
>=20
> Am Dienstag, 12. April 2022, 13:36:55 CEST schrieb Jun Li:
> > > -----Original Message-----
> > > From: Alexander Stein <alexander.stein@ew.tq-group.com>
> > > Sent: Monday, April 11, 2022 9:52 PM
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
> > > Hi,
> > >
> > > Am Samstag, 9. April 2022, 06:49:54 CEST schrieb Jun Li:
> > > > > -----Original Message-----
> > > > > From: Peter Chen <peter.chen@kernel.org>
> > > > > Sent: Saturday, April 9, 2022 10:20 AM
> > > > > To: Alexander Stein <alexander.stein@ew.tq-group.com>
> > > > > Cc: Peter Chen <hzpeterchen@gmail.com>; Greg Kroah-Hartman
> > > > > <gregkh@linuxfoundation.org>; Shawn Guo <shawnguo@kernel.org>;
> > > > > Sascha Hauer <s.hauer@pengutronix.de>; Fabio Estevam
> > > > > <festevam@gmail.com>; Pengutronix Kernel Team
> > > > > <kernel@pengutronix.de>; dl-linux-imx <linux-imx@nxp.com>; USB
> > > > > list <linux-usb@vger.kernel.org>;
> > > > > linux-arm-kernel@lists.infradead.org
> > > > > Subject: Re: (EXT) Re: [RFC 1/1] usb: chipidea: ci_hdrc_imx:
> > > > > disable runtime pm for HSIC interface
> > > > >
> > > > > On 22-03-29 10:14:36, Alexander Stein wrote:
> > > > > > Hello Peter,
> > > > > >
> > > > > > Am Dienstag, 15. M=E4rz 2022, 02:23:23 CEST schrieb Peter Chen:
> > > > > > > On Wed, Mar 2, 2022 at 5:42 PM Alexander Stein
> > > > > > >
> > > > > > > <alexander.stein@ew.tq-group.com> wrote:
> > > > > > > > With the add of power-domain support in commit
> > > > > > > > 02f8eb40ef7b
> ("ARM:
> > > > > dts:
> > > > > > > > imx7s: Add power domain for imx7d HSIC") runtime suspend
> > > > > > > > will disable the power-domain. This prevents IRQs to occur
> > > > > > > > when a new device is attached on a downstream hub.
> > > > > > > >
> > > > > > > > Signed-off-by: Alexander Stein
> > > > > > > > <alexander.stein@ew.tq-group.com>
> > > > > > > > ---
> > > > > > > > Our board TQMa7x + MBa7x (i.MX7 based) uses a HSIC link to
> > > > > > > > mounted
> > > > >
> > > > > USB HUB
> > > > >
> > > > > > > > on usbh device. Cold plugging an USB mass storage device
> > > > > > > > is working
> > > > >
> > > > > fine.
> > > > >
> > > > > > > > But once the last non-HUB device is disconnected the
> > > > > > > > ci_hdrc device
> > > > >
> > > > > goes
> > > > >
> > > > > > > > into runtime suspend.
> > > > > > >
> > > > > > > Would you please show the difference between cold boot and
> > > > > > > runtime suspend after disconnecting the last USB device?
> > > > > > >
> > > > > > > - Power domain on/off status for HUB device
> > > > > > > - Runtime suspend status at /sys entry for HUB device
> > > > > > > - "/sys/..power/wakeup" /sys entry  for HUB device
> > > > > >
> > > > > > I hope I got all entries you requested.
> > > > > >
> > > > > > For reference this is the bus topology:
> > > > > > lsusb -t
> > > > > > /:  Bus 02.Port 1: Dev 1, Class=3Droot_hub, Driver=3Dci_hdrc/1p=
,
> > > > > > 480M
> > > > > > /:  Bus 01.Port 1: Dev 1, Class=3Droot_hub, Driver=3Dci_hdrc/1p=
,
> > > > > > 480M
> > > > > >
> > > > > >     |__ Port 1: Dev 2, If 0, Class=3DHub, Driver=3Dhub/4p, 480M
> > > > > >     |
> > > > > >         |__ Port 2: Dev 3, If 0, Class=3DMass Storage,
> > > > > >
> > > > > > Driver=3Dusb-storage,
> > > > >
> > > > > 480M
> > > > >
> > > > > > Bus 2 is a different connector and doesn't matter here. I'm
> > > > > > disconnecting
> > > > >
> > > > > 'Dev
> > > > >
> > > > > > 3' in this scenario.
> > > > > >
> > > > > > After boot up with the bus as shown above:
> > > > > > $ cat /sys/bus/usb/devices/1-1/power/wakeup
> > > > > > disabled
> > > > > > $ cat /sys/bus/usb/devices/1-1/power/runtime_status
> > > > > > active
> > > > > > $ cat /sys/kernel/debug/pm_genpd/usb-hsic-phy/current_state
> > > > > > on
> > > > > >
> > > > > > After disconnecting Dev 3 from the bus ('usb 1-1.2: USB
> > > > > > disconnect, device number 3' in dmesg) the status changes as
> > > > > > follows (without the patch):
> > > > > > $ cat /sys/bus/usb/devices/1-1/power/wakeup
> > > > > > disabled
> > > > > > $ cat /sys/bus/usb/devices/1-1/power/runtime_status
> > > > > > suspended
> > > > > > $ cat /sys/kernel/debug/pm_genpd/usb-hsic-phy/current_state
> > > > > > off-0
> > > > > >
> > > > > > For the record, when applying the posted patch this changes int=
o:
> > > > > > $ cat /sys/bus/usb/devices/1-1/power/wakeup
> > > > > > disabled
> > > > > > $ cat /sys/bus/usb/devices/1-1/power/runtime_status
> > > > > > suspended
> > > > > > $ cat /sys/kernel/debug/pm_genpd/usb-hsic-phy/current_state
> > > > > > on
> > > > >
> > > > > Okay, I think the problem here is the power domain for USB
> > > > > controller is off at runtime, but USB controller/PHY needs to
> > > > > detect the USB wakeup signal at runtime, so the USB
> > > > > controller/PHY's power domain should be not off. The proper
> > > > > change may keep power domain on at runtime, and the power domain
> could be off at system suspend.
> > > >
> > > > Can this "hsic phy power domain off breaks wakeup" be confirmed?
> > > > Like with some hack to move hsic phy power domain on some other
> > > > device
> > > > node:
> > > >
> > > > non-usb-node {
> > > >
> > > >         ...
> > > >         power-domains =3D <&pgc_hsic_phy>;
> > > >         status =3D "okay";
> > > >
> > > > };
> > > >
> > > > Just make sure this non-usb-node to be runtime active when do hsic
> > > > hub test.
> > >
> > > Thanks for that suggestion. I apparently does work. Using the this
> > > small patch
> > >
> > > --->8---
> > > diff --git a/arch/arm/boot/dts/imx7-mba7.dtsi
> > > b/arch/arm/boot/dts/imx7- mba7.dtsi index b05f662aa87b..cba2f9efa17e
> > > 100644
> > > --- a/arch/arm/boot/dts/imx7-mba7.dtsi
> > > +++ b/arch/arm/boot/dts/imx7-mba7.dtsi
> > > @@ -580,6 +580,7 @@ &uart3 {
> > >
> > >         assigned-clocks =3D <&clks IMX7D_UART3_ROOT_SRC>;
> > >         assigned-clock-parents =3D <&clks IMX7D_OSC_24M_CLK>;
> > >         status =3D "okay";
> > >
> > > +       power-domains =3D <&pgc_hsic_phy>;
> > >
> > >  };
> > >
> > >  &uart4 {
> > >
> > > --->8---
> > >
> > > The HSIC power domain is also attached to to uart3.
> > >
> > > $ cat /sys/kernel/debug/pm_genpd/usb-hsic-phy/devices
> > > /devices/platform/soc/30800000.bus/30800000.spba-bus/30880000.serial
> > > /devices/platform/soc/30800000.bus/30b30000.usb
> > > /devices/platform/soc/30800000.bus/30b30000.usb/ci_hdrc.1
> > > $ cat /sys/kernel/debug/pm_genpd/usb-hsic-phy/current_state
> > > on
> > > $ echo on >
> > > /sys/devices/platform/soc/30800000.bus/30800000.spba-bus/
> > > 30880000.serial/power/control
> > > $ lsusb -t
> > > /:  Bus 02.Port 1: Dev 1, Class=3Droot_hub, Driver=3Dci_hdrc/1p, 480M
> > > /:  Bus 01.Port 1: Dev 1, Class=3Droot_hub, Driver=3Dci_hdrc/1p, 480M
> > >
> > >     |__ Port 1: Dev 2, If 0, Class=3DHub, Driver=3Dhub/4p, 480M
> > >     |
> > >         |__ Port 2: Dev 3, If 0, Class=3DMass Storage, Driver=3D, 480=
M
> > > [USB
> > >
> > > disconnect] $ cat
> > > /sys/kernel/debug/pm_genpd/usb-hsic-phy/current_state
> > > on
> >
> > Just want to be sure this was done with hdrc imx runtime PM enabled.
> >
> > > [USB reconnect]
> > > $ lsusb -t
> > > /:  Bus 02.Port 1: Dev 1, Class=3Droot_hub, Driver=3Dci_hdrc/1p, 480M
> > > /:  Bus 01.Port 1: Dev 1, Class=3Droot_hub, Driver=3Dci_hdrc/1p, 480M
> > >
> > >     |__ Port 1: Dev 2, If 0, Class=3DHub, Driver=3Dhub/4p, 480M
> > >     |
> > >         |__ Port 2: Dev 4, If 0, Class=3DMass Storage, Driver=3D, 480=
M
> > >
> > > Hot plug detecting still works as you can see the USB device number
> > > increased.
> > >
> > > For the records, there is no difference to this patch in removing
> > > the power domain from USB HSIC device. I just wanted to keep the
> > > diff small.
> >
> > This is good enough to confirm this, thanks.
> >
> > I don't have a HW with HSIC enabled for test, and I am not sure the
> > initial state of power domain is on, can something like below deserve a
> try?
> >
> > diff --git a/drivers/soc/imx/gpcv2.c b/drivers/soc/imx/gpcv2.c index
> > 3cb123016b3e..f5467ef18e33 100644
> > --- a/drivers/soc/imx/gpcv2.c
> > +++ b/drivers/soc/imx/gpcv2.c
> > @@ -416,6 +416,7 @@ static const struct imx_pgc_domain
> > imx7_pgc_domains[] =3D { [IMX7_POWER_DOMAIN_USB_HSIC_PHY] =3D {
> >                 .genpd =3D {
> >                         .name      =3D "usb-hsic-phy",
> > +                       .flags     =3D GENPD_FLAG_RPM_ALWAYS_ON,
> >                 },
> >                 .bits  =3D {
> >                         .pxx =3D IMX7_USB_HSIC_PHY_SW_Pxx_REQ, @@ -930,=
7
> > +931,7 @@ static int imx_pgc_domain_probe(struct platform_device
> > *pdev) regmap_update_bits(domain->regmap, GPC_PGC_CPU_MAPPING,
> > domain->bits.map, domain->bits.map);
> >
> > -       ret =3D pm_genpd_init(&domain->genpd, NULL, true);
> > +       ret =3D pm_genpd_init(&domain->genpd, NULL,
> > + !(domain->genpd.flags &
> > GENPD_FLAG_RPM_ALWAYS_ON)); if (ret) {
> >                 dev_err(domain->dev, "Failed to init power domain\n");
> >                 goto out_domain_unmap;
>=20
> This does indeed the trick. But AFAICS the downside is that the powerdoma=
in
> is enabled, even if USB is not used. Not sure if this is acceptable thoug=
h.

I think GENPD_FLAG_RPM_ALWAYS_ON is the right thing to do if the HSIC port
need the power domain on to detect remote wakeup, what's the exact meaning
of "USB is not used"?

Li Jun
>=20
> Alexander
>=20
>=20

