Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 21719762BAC
	for <lists+linux-usb@lfdr.de>; Wed, 26 Jul 2023 08:40:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231877AbjGZGk5 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 26 Jul 2023 02:40:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56326 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231878AbjGZGkt (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 26 Jul 2023 02:40:49 -0400
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2074.outbound.protection.outlook.com [40.107.21.74])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A109D2D48
        for <linux-usb@vger.kernel.org>; Tue, 25 Jul 2023 23:40:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kKWaDvX2Vnq6+S8kNSHOoYVDFCJontVB/U8oxc8c/l0IsOov/9qgA3B0u4l5ldwVoJkFLRMBhJILFDrYn0uNNR0FwZ4kkv17DiNl8fFB8VIJX7psNcMnkIMPmqP0aFEYuNR1maNLEL7+DU1oI1rWeBcQZTWUPdNqXnL98sAmHg/2DME03MIuy0unQsA//O0ZpQk/tS20SymTokpdJK2moqXg++5eW/19KRlhj1RR6FyrzDWksJ8YgNYp5qkzSn0YJcCyxfin9D4Xtya2Ui8DpBwPIaBpte1Ld1CIofGIGBd8MC0bAWj/lM6YLYNY7wLV+BfZc+oWSa7Za6XLb7uSnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uN4/Y3bivtHLq478mCLyFpAQfiiwxz+V9LV0SvSmc/U=;
 b=SFNa1baV7WE6vDNYoJYf11/eGON7DybepUXL0zETYP/c3vM6Ul8bTGPvqi8Z5YGVPcEC4YjcwbvELDM5ajjng+NUcXBQsuMJ1QUd9UytgLPzXrSDCHngxhU6ZCjH3rmEhe1j/6DPkDjHC32Y2kDCUbgUBSAnHx6zdtHjBOQt3WDjvV67a9VzNyTXo0uP8CR8lkd+MQTrhQtPMvmUNcMvoNNXSW6D5vyj2Z1dUvbhxeXm6Wqke0SJEI/qrf1KhR4/4rmokmW7BV4LnuQPEHALn1MuYUOqVPALJrEhwixzjrj63kuKKe1aH/6nD569vqQHwEC+Y/Bs5wWMxhLSO/2V1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uN4/Y3bivtHLq478mCLyFpAQfiiwxz+V9LV0SvSmc/U=;
 b=X3ws5WPT34qLFi7W7nsHxUTwOEmg5b5P1OTrj1xw9XUlft0iZF3JGijqqNwmwuVmm6KBOdFzL7Uz67paP0k2bTnAVS+zwpQU/gYXKH6UffHmDF00bdJjEX3ept9oWQ7t9s5Z+zop5i5MpZ2ALQ4SXVL9KnGgNgEkWN7bdFNV35o=
Received: from DB7PR04MB4505.eurprd04.prod.outlook.com (2603:10a6:5:39::26) by
 AS1PR04MB9583.eurprd04.prod.outlook.com (2603:10a6:20b:472::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Wed, 26 Jul
 2023 06:40:31 +0000
Received: from DB7PR04MB4505.eurprd04.prod.outlook.com
 ([fe80::473a:28:1d98:10ab]) by DB7PR04MB4505.eurprd04.prod.outlook.com
 ([fe80::473a:28:1d98:10ab%5]) with mapi id 15.20.6631.026; Wed, 26 Jul 2023
 06:40:31 +0000
From:   Xu Yang <xu.yang_2@nxp.com>
To:     Francesco Dolcini <francesco@dolcini.it>
CC:     "peter.chen@kernel.org" <peter.chen@kernel.org>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "festevam@gmail.com" <festevam@gmail.com>,
        dl-linux-imx <linux-imx@nxp.com>, "balbi@ti.com" <balbi@ti.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Jun Li <jun.li@nxp.com>
Subject: RE: [EXT] Re: [PATCH 2/3] usb: phy: mxs: fix getting wrong state with
 mxs_phy_is_otg_host()
Thread-Topic: [EXT] Re: [PATCH 2/3] usb: phy: mxs: fix getting wrong state
 with mxs_phy_is_otg_host()
Thread-Index: AQHZqOaUxAfPOQkSRkOl4mCnwtmwYK/LvVcAgAAGZwA=
Date:   Wed, 26 Jul 2023 06:40:31 +0000
Message-ID: <DB7PR04MB45057C08423D14479BAEA40A8C00A@DB7PR04MB4505.eurprd04.prod.outlook.com>
References: <20230627110353.1879477-1-xu.yang_2@nxp.com>
 <20230627110353.1879477-2-xu.yang_2@nxp.com>
 <ZMC4UgtuGvWnpc8i@francesco-nb.int.toradex.com>
In-Reply-To: <ZMC4UgtuGvWnpc8i@francesco-nb.int.toradex.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB7PR04MB4505:EE_|AS1PR04MB9583:EE_
x-ms-office365-filtering-correlation-id: a0e38930-a509-43f4-c4f0-08db8da334fe
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: lUTnVI3qk9zwT2eohmlk0CJdHd3qVqosvcQ+XxyqzU3e+USXLEcnVCW8pDU0DgI2YX6rk8RW2XD6hKrearT34VN+jniY7HXKgue0EcK3vLhhA1Q7JDWSJXtBQy7rEhO/acW4y97GqFzJSmEazs2or/Zh7ZtYVs8/qnbE+2yCFblbdtwDmzhgx9/VdpXwx6kd4JO50kTqcmJWe/aFyAXKGv/nZnRdk3/v3fkYcXOGDoRPWjF/0WSRo9TJcCuSfclskAdhfudokccW1gWvgUYYCmWx7jzpGMX2fr1DyKKgh/9JDpZW4wiK0r3MHrCKgsyaI7rdymUogFS1yc74cV4sK5cHThmKWWQEiEHKrx9iK1gYqsGhZGVsRZO2urK7rEkG4G2zgR3cyD5j3jmOrCh1xWDqQM/IlPxn1tCe70ePy2zAjfSSrvfk2PIimStIoQLNuUpaueek9IqhTO1bnG05Wa3O6oRDaNT5dBZVyLbcDFxyyw9yDgl211Gf8XMYG8J5qtRqilcP9joOz65Lde1UEkFIgvTdZr+EpnPDvmvKZcOLw5b5GMGroRthSWlvBS/rR0wdyRPY2mOZVg+MBEn7o3mIZPobT+nK9xZS7048npQ+oMCpAmm8dwtP6HTjxRRj
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR04MB4505.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(396003)(346002)(376002)(136003)(366004)(451199021)(55016003)(54906003)(122000001)(38100700002)(478600001)(7696005)(9686003)(71200400001)(41300700001)(5660300002)(52536014)(316002)(8936002)(8676002)(66946007)(66556008)(66476007)(66446008)(64756008)(6916009)(4326008)(76116006)(186003)(83380400001)(6506007)(26005)(86362001)(33656002)(38070700005)(2906002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ZpXEwRtgESBxobsCDW6b2ucp8SBF+ncDwULFa86ogwTUHiT6F9oDV85Gb5oa?=
 =?us-ascii?Q?vcicp/b656yI2BZZ4NxVpD6OCSBYeGs7C/+f4JvnTyF1K1V/0yyn5svZsbkA?=
 =?us-ascii?Q?LjrqGcDt9aGOPxc9aNye8BIAAS/y82slIgeh76vgH6R2dO/9V5n/iAgnErbL?=
 =?us-ascii?Q?1OddbN7BxAc/Cdo9Zvn/mevJTOcjFuI7f9Twxo5F5h0D+zuM/ysxoP+h6VfT?=
 =?us-ascii?Q?UMNPAHpBorONW7ehT9jHBcdMr4hWyuABjtJUv13Tk93zuZn2mSxIhO4xvS4i?=
 =?us-ascii?Q?3+Q+m1uTFF5z5G6RKtmzGkuLN1uaMGjU6qBBDQXZfzbxEy3TOpDjU8P9tP5j?=
 =?us-ascii?Q?CTu932VkM5rNMYd/9i6Xw7WEqG/vAXLaN97ACTrZIuaZiL9dKijpogVSSKw3?=
 =?us-ascii?Q?El99B03ipolbQq1v1pjKLHNZT5SpXfh7zw5CMxAv2+uN4p0z87ztZ1By6vjH?=
 =?us-ascii?Q?0WijLQNfk9rpO2LX3TecC4KI5V/WYj6OpH+VpLxnhWd/hcuslGYZwTGO1QXc?=
 =?us-ascii?Q?elYh/1ya8soLfJTBrmT1UITnYL/FTzfFvCh/p/4mkqHHObLCB0FhnGBjLANG?=
 =?us-ascii?Q?Y8c76QAyDSJnsiDBrN/3lD/bG9qwazWKh/4GuyplzqjRrupb829ND4rtzYn1?=
 =?us-ascii?Q?cZSU4N0/2jPYf2VWZeaw7fgD+zaYiathJfnPn3w5XvJyESqlpPPFAIWB0+Ax?=
 =?us-ascii?Q?xuCIGjxdsrjtCCdBz+JonedLtqxPLYmA10VhdKKVsc64cslid0Xn9lW8ID0o?=
 =?us-ascii?Q?FRFPYwpH1QkiZyEZN8Hj6R2X73+8dhvm8k0kpRKTFJGRxnJuNCORdCeU9QcI?=
 =?us-ascii?Q?V8+ZU9Q1IxlGWUB8XJq/EKSwwfsh4DvtwBznTU0MwxMML3rZpMZe4bbshhFm?=
 =?us-ascii?Q?OYldmSN4fyLGaZb5PbHCIEfD+3iF3ukCNtzbK1W+Ra3/yzKtEyYVRV0QhNkz?=
 =?us-ascii?Q?qKfS0iVKE5Z/ezjCHxO/FeKwqhE03hhVti1SaUP8aAhBrpDjK/lxnA0Rx6Xb?=
 =?us-ascii?Q?Jy3MxDpVRf+T84ljWd5ty9LK8N7kNV5TxHy4DaIt3LJMRc2B/fGb23LOjW1E?=
 =?us-ascii?Q?2zmOtmkU5QPBFkASXgmCmVeacpACUuNbBHeGIH/2HNZclqJr4n61KUfk1xiJ?=
 =?us-ascii?Q?sA4fsf/ac7+l4W87zwY5jmxfU2R3JXrh6esdl0PzHdtereb/u4DCuZpp7Lyo?=
 =?us-ascii?Q?cX6V9hw4Xs/Fh/Sb7ZQfkKOBNEwS8OVn/IIod7BEwUqkLfcTpRrjV+DJNMvt?=
 =?us-ascii?Q?aVd9YbcKllXV5FgBm6SE7B8DEpM4DEHHkL32nQcv7OQYi0s4j3fMkY7gpctD?=
 =?us-ascii?Q?NAwKR8eaFMY0GF/brYPVFtTyFt+vWQGuKoQiJpEfnJ/W5Mg5X2Egb4iqmV1q?=
 =?us-ascii?Q?NqgUoflsUs8qAWge7JUsebLAvIbggcBYlWE0q9uOi2y1sffSzUASzjn5RhV4?=
 =?us-ascii?Q?kfBt3UhG9LiJhEwbePBSmEq8ETlaf6oc/+vl1mMpp49bjiJlKaydjKXBN0/m?=
 =?us-ascii?Q?gsriaji/nbqyMCjYbXfMusL8K38sBBErQsbLoFPvFNFRUtJihQzoZQvx4JIE?=
 =?us-ascii?Q?UGBuJ0Uqodky5wzoplg=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB4505.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a0e38930-a509-43f4-c4f0-08db8da334fe
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jul 2023 06:40:31.1353
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: h90Q+S89zpFfQW+taxfcUqz6nWnzWZ1w9caDL+94QBlYkLR9c+8R1yB7L01r32XnrfqO1dXVM4KrWz3cb0B6mg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9583
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

> On Tue, Jun 27, 2023 at 07:03:52PM +0800, Xu Yang wrote:
> > The function mxs_phy_is_otg_host() will return true if OTG_ID_VALUE is
> > 0 at USBPHY_CTRL register. However, OTG_ID_VALUE will not reflect the r=
eal
> > state if the ID pin is float, such as Host-only or Type-C cases. The va=
lue
> > of OTG_ID_VALUE is always 1 which means device mode.
> > This patch will fix the issue by judging the current mode based on
> > last_event. The controller will update last_event in time.
> >
> > Fixes: 7b09e67639d6 ("usb: phy: mxs: refine mxs_phy_disconnect_line")
> > Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> > ---
> >  drivers/usb/phy/phy-mxs-usb.c | 10 ++--------
> >  1 file changed, 2 insertions(+), 8 deletions(-)
> >
> > diff --git a/drivers/usb/phy/phy-mxs-usb.c b/drivers/usb/phy/phy-mxs-us=
b.c
> > index 036bb58a3a71..f484c79efa6c 100644
> > --- a/drivers/usb/phy/phy-mxs-usb.c
> > +++ b/drivers/usb/phy/phy-mxs-usb.c
> > @@ -388,14 +388,8 @@ static void __mxs_phy_disconnect_line(struct mxs_p=
hy *mxs_phy, bool disconnect)
> >
> >  static bool mxs_phy_is_otg_host(struct mxs_phy *mxs_phy)
> >  {
> > -     void __iomem *base =3D mxs_phy->phy.io_priv;
> > -     u32 phyctrl =3D readl(base + HW_USBPHY_CTRL);
> > -
> > -     if (IS_ENABLED(CONFIG_USB_OTG) &&
> > -                     !(phyctrl & BM_USBPHY_CTRL_OTG_ID_VALUE))
> > -             return true;
> > -
> > -     return false;
> > +     return IS_ENABLED(CONFIG_USB_OTG) &&
> > +             mxs_phy->phy.last_event =3D=3D USB_EVENT_ID;
>=20
> The logic here is not working when CONFIG_USB_OTG, should we always
> return true when !IS_ENABLED(CONFIG_USB_OTG) ?

No.=20

>=20
> so something like
>=20
> if (!IS_ENABLED(CONFIG_USB_OTG))
>         return true;
>=20

Below code should be enough. We don't need to judge=20
CONFIG_USB_OTG here since last_event always be updated
when starting new role.

> return mxs_phy->phy.last_event =3D=3D USB_EVENT_ID;
>=20
>=20
> ?
