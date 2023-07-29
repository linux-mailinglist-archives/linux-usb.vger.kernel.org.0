Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 88BF2767CAA
	for <lists+linux-usb@lfdr.de>; Sat, 29 Jul 2023 08:55:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236393AbjG2GzM (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 29 Jul 2023 02:55:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233000AbjG2GzL (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 29 Jul 2023 02:55:11 -0400
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (mail-db3eur04on2081.outbound.protection.outlook.com [40.107.6.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA3FE10CB
        for <linux-usb@vger.kernel.org>; Fri, 28 Jul 2023 23:55:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kFOnglUxpRCnF2Pa/ECntfubS6DBROKo58jppaRJEJXKkIYCTtt+IuMti+0HETyrea+03+5Lt/t4u9EMNgMCJlo/qO7bAHut5wrk839Xywq83e76Qa/lG6/+D6A454hPZzR+KFJOZuKZ/UcCwHaA1m7xXrBBf+/u6SUNREO0Ef82RfRKGmJUE3a/WDo0nBcKFv3yZ80S6iNusA371FHszVxCveyD1gkjNYNYSNQrBtU7aIYDRPvgcAXVYCBSHCZ0HZVR0/tRNXCdone/6GQro5UKHYOs0Cqore9JvN/87nStiRUapuQtfLTRDxvGzX4+LEB4glNwNxi/qpXh7sHbvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s9t6a9UNM0E0Op0pV8h5OBKh6joMo/q0tZE+kRP/VBc=;
 b=DKU7hKQ92UGXJJbQbqWQ2Y5HxXanY6mZpuTayOSRJjdkOhfuZU+RGWogTnf0QCx+bTy0gjczdhnUpTc2in53oHG2XOQRHk12wpG3vr/8KTVl8JifSLjUmISo9HMXpxh/2kM2oMUxK0j1Lubres6aV9UslYJw4pyPsErwn2Ld08CCXZj199CTadkysschZm1LGgvOYqp2/BJ1XQexIf1HZoje3P151xm80Jb+qySEEACPiYNgfEraWruDffwnVAL/Vi/sXpTfW6OUyx7zlLLNI7xKwdxTHs4RHyaEJxnNN131NBHA8WEv4pLlGDzVgLY505ZUub+JhOuwvdhoHR22pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s9t6a9UNM0E0Op0pV8h5OBKh6joMo/q0tZE+kRP/VBc=;
 b=ikXaP5lDKrcjZ8XKD3UiopBi5U4YxylYoYMIL+9oiuBFCDOObNtmO1WWe5FJ3u0j8uO7sKzUg7Ltg46HlcmP8bPV91iCjVvspYXJN7CN7veyZpl4tyWpQMZCsoM3IlTN86dgGE7xVvkJ2fPJ+qNB8ybPqK1ARE2FPQtV6CXbVVk=
Received: from DB7PR04MB4505.eurprd04.prod.outlook.com (2603:10a6:5:39::26) by
 DBBPR04MB7754.eurprd04.prod.outlook.com (2603:10a6:10:1ee::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6631.29; Sat, 29 Jul 2023 06:55:07 +0000
Received: from DB7PR04MB4505.eurprd04.prod.outlook.com
 ([fe80::473a:28:1d98:10ab]) by DB7PR04MB4505.eurprd04.prod.outlook.com
 ([fe80::473a:28:1d98:10ab%5]) with mapi id 15.20.6631.026; Sat, 29 Jul 2023
 06:55:07 +0000
From:   Xu Yang <xu.yang_2@nxp.com>
To:     Alan Stern <stern@rowland.harvard.edu>
CC:     "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Jun Li <jun.li@nxp.com>
Subject: RE: [EXT] Re: [PATCH 2/2] usb: ehci: unlink itd/sitds from hardware
 list if the controller has stopped periodic schedule
Thread-Topic: [EXT] Re: [PATCH 2/2] usb: ehci: unlink itd/sitds from hardware
 list if the controller has stopped periodic schedule
Thread-Index: AQHZuWobPyY9hy475kOcvOyONwwurK+/nFYAgBC7uaA=
Date:   Sat, 29 Jul 2023 06:55:07 +0000
Message-ID: <DB7PR04MB4505A7CDE9FC53EFEFD3D9F58C07A@DB7PR04MB4505.eurprd04.prod.outlook.com>
References: <20230718112600.3969141-1-xu.yang_2@nxp.com>
 <20230718112600.3969141-2-xu.yang_2@nxp.com>
 <52e62d2e-a82a-4c9f-86ce-3ddad3efffb5@rowland.harvard.edu>
In-Reply-To: <52e62d2e-a82a-4c9f-86ce-3ddad3efffb5@rowland.harvard.edu>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB7PR04MB4505:EE_|DBBPR04MB7754:EE_
x-ms-office365-filtering-correlation-id: a8252492-f371-48c1-987c-08db9000be58
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: FnsLbiSdU1xi6E8CQYR7e1Iobu8a89W/IJLGPz5uNx1Jps9Xa6SWzxARElNRw9FXr8KgDQx101H3FWfkMOztw7SRDDb9S5YVFQL6AYa2gsXP6+cdaiV75ItVINy6AZ1xceY3OqK6iYakZqvYDb2CKrO1QUhNfAk+TerNEnuO9fUeTO+uF6aV4IuhV9LlgavhNcXdE7KkeovD5Kxpx7WHerf08bydJno4uB/W23BqFy6tG2cfNHKjxTxzcbVOjRPqyp0Qch5q/Rk3MDyBUqDyiY/xpu8nmXw70reSHkieyU+sEGknnYoltxxVop2B3egtHVjEbKFmyt/pWbIJojJscBFVuFGtjHacDzwNXt4eOKuJUfW7GSdd5Zv4lmWQ1PxWL5xXFaEShqm5DCprougJaWGSnwFb0f9ehrcCwDAsKBEj76Gkm4J3YD3+CHtXwoGM7HL8FF2wqxAaX9Mvuw70RbZbs4vl7xFHUEpxxuWHFzdjfzfvz6ti91m32hsLRowScPCow0B83y2euubxYlwussZqdwfqKGhN08H0LNsJwJMFuk0R8U1LzzR9TWsebM6eyE3bt9e6YKw2xFJ8kY/PXmqg+RvKTUmrQlwx0Cm+6KIz7MNHFQ/y77RDvez5io0l
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR04MB4505.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(136003)(376002)(39860400002)(396003)(366004)(451199021)(186003)(54906003)(7696005)(9686003)(478600001)(6916009)(83380400001)(38070700005)(86362001)(33656002)(55016003)(4326008)(66446008)(2906002)(71200400001)(6506007)(66476007)(26005)(316002)(64756008)(66946007)(38100700002)(66556008)(122000001)(76116006)(52536014)(41300700001)(8936002)(8676002)(5660300002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?fMbKRSjpecZVPpQ0TNZT7lmukqeudZM/qgjS4BDvN3mwZWbQjce2m4LzVH/H?=
 =?us-ascii?Q?F9jKX/lxG6r8ZSYB+KkqwISWqKpHZWnzrPuPDz1JigK4vMhn/bMBR/GibHXX?=
 =?us-ascii?Q?Z73q20dwmV1tUrScAll3pgP/dyhOcIB6abxCU6nsPWo9e4xA8ReG9SKA9fNj?=
 =?us-ascii?Q?q3F3N+7aJ2nEBUl+p1g3YMMK+iinORvY44PnLHskHRuDmxWC0zQDKY0nDyxo?=
 =?us-ascii?Q?AgkuRUBMMWdeu9jncVIH0Or7xRe60xBYuMkO+KwxLvW89kOdpJ+0JhdIMaKi?=
 =?us-ascii?Q?BSDkkPqmgD+tZAMhwfggyiRNT0brz4muyIaymiPJR3IKs7w21imdALk+dUFG?=
 =?us-ascii?Q?kXOLgPYm1PFKXWbQpw6vrCzQCjumlR/eaj7yfob9/6h86ntjIixToAA9GmOM?=
 =?us-ascii?Q?aCT7m8eoTnygKy3HJoII40GjbED6YSYehTm3M4/wa/GqdkJkZ28ZkH+64Ruu?=
 =?us-ascii?Q?TGUma9Za0vmNA24XdGf6DDXpY9JN49rtR6j4YmRLsWIpPxrfTCb4tiDLwYZJ?=
 =?us-ascii?Q?RXtiMSNTcv+DbGorll4JHYmlkg8uJClYUrnXfnB3cvQIJ3sgUG37mZoDBkW/?=
 =?us-ascii?Q?TyUYf6E5/kMqtr0osXb5awmViDZ+u1FIy3XzpHcP0osWlAv1eUF753ATuV1A?=
 =?us-ascii?Q?32Nh/+l+GMoUG0wUabYNFcTA1Xo0trEOEd7i1rAOi4ck2jj68vFQtfcGE2eT?=
 =?us-ascii?Q?nABoupDz4uEZLBWAEndj8aLQGOZQVBzwLLRyEeoKqkrixlNgD3JTotZ4CDH5?=
 =?us-ascii?Q?CZ6cMLLxjDeSAZ5yd8DzNr3Uph1fo2gtON8AshRszIuyXFzQJSY0twArp7FH?=
 =?us-ascii?Q?3Na1EQgKuD3CTGR3QMbde87QnIisHBghTdzm6p12e53NNj3dG3aR8851mUaS?=
 =?us-ascii?Q?yTEITPAZVjUj1n0uPcQUf4toZ64SVgIgB5029004wC5o5Z2ESPEfNrjWoTDX?=
 =?us-ascii?Q?EHCH8ZyjUDu4O7VH7Uk/MY6juxfbFZr0C6Ax1j++XLBYzKGncqM9rVbVeMWU?=
 =?us-ascii?Q?yRhexoxuTpPsjF6O3BpRU2I1PSFVOIvseIDV7L4uQX6sZo087kw94uVR3OJW?=
 =?us-ascii?Q?YVNMWIWnOoGuCv679LPP4MINONREZ5ibleNMlZZmNfLFkiufmMyGajP7c0d2?=
 =?us-ascii?Q?Zhq2u1P3p8gsdIcEscrow459oMvtUXQQ9FZPJ5G4wRfGKooSNj5XYPjUbN1y?=
 =?us-ascii?Q?yxKOE1l/bnT31+dfGdh8uTwy6b3LkjAB/mwqaAfUa/oXIzoYI8tNUQS7SOAs?=
 =?us-ascii?Q?GCoHBD40yvUNhRr/a0mDbVabyHIlMw3U3mIsdhfOfeyefEJPWJ900R2d+1n4?=
 =?us-ascii?Q?Gqz/iZ2bI3AG7YmM/e5Ra6qqf0EgQ42zbSAaCyYLTR11FEpv/DmdMaY7uPMW?=
 =?us-ascii?Q?viUXl2qlsqOFC7d/y/6i1LZluWL63xT8gJXctu5Z/+xJQNAus0Vsp9taVmpJ?=
 =?us-ascii?Q?tzGo/4Jk7hANSsroJnwaR4uZtHbrpp9ZXSjHJ0QGX98Ej/RMfMpJUJjZdyiK?=
 =?us-ascii?Q?SwOech9oiJRoCZq1kleowtCqhNHNO31mUR20Z84NlhuievqbIQbk6yumHLfK?=
 =?us-ascii?Q?MAxOXMtqmrANmGnVeDk=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB4505.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a8252492-f371-48c1-987c-08db9000be58
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jul 2023 06:55:07.0622
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3D8mamWl45NNjlE1En608idDpec64yR1RDMPocdph9wYmVzyj8x437RakqnTZj2eAsm4zU40DvvnjGa9ZtR9iQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7754
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Alan,

> On Tue, Jul 18, 2023 at 07:26:00PM +0800, Xu Yang wrote:
> > In current design, the ehci driver will not unlink itd/sitds from the
> > hardware list when dequeue isochronous urbs. Rather just wait until the=
y
> > complete normally or their time slot expires. However, this will cause
> > issues if the controller has stopped periodic schedule before finished
> > all periodic schedule. The urb will not be done forever in this case an=
d
> > then usb_kill/poison_urb() will always wait there.
> >
> > The ChipIdea IP exactly has a bug: if frame babble occurs during period=
ic
> > transfer, PE (PORTSC.bit2) will be cleared and the controller will stop
> > periodic schedule immediately. So if the user tries to kill or poison
> > related urb, it will wait there since the urb can't be done forever.
> >
> > This patch will check if this issue occurs, then it will unlink itd/sit=
ds
> > from the hardware list depends on the result.
>=20
> This is not the right approach.  There already is code in the driver for
> unlinking itds/sitds when the periodic schedule isn't running: See how
> the "live" variable is used in scan_isoc().  You don't need to add new
> code to do the same thing, you simply have to make sure that live is set
> to false if the controller has stopped the periodic schedule
> unexpectedly.
>=20
> (Be very careful about handling the case where CMD_PSE is set and
> STS_PSS is clear.  This can happen when the controller has been told to
> start the periodic schedule but it hasn't done so yet.)

Many thanks for your comments and suggestions.

Yes, there is a "live" variable in scan_isoc() to handle the case where
root hub has stopped periodic schedule. I have rechecked the root cause
of the issue , that is the USB controller has disabled the port (PE cleared=
)
and asserted USBERRINT when frame babble is detected, but PEC is not
asserted. Therefore, the SW didn't aware that port has been disabled.=20
The periodic schedule keeps running at this moment. Then the SW keeps
sending packets to this port, but all of the transfers will fail. But perio=
dic
schedule will also be disabled after a period of time. Finally, all of the =
linked
itds are penging there. The code can't enter into scan_isoc() if only USBER=
RINT
is asserted.

For this issue, I think the SW needs to aware that the port has been disabl=
ed
although PEC not asserted by HW. I will send another patch to fix this issu=
e
later.

Thanks,
Xu Yang=20

>=20
> Alan Stern
