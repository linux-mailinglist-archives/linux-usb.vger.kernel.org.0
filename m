Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DACA678BD18
	for <lists+linux-usb@lfdr.de>; Tue, 29 Aug 2023 04:58:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231348AbjH2C6R (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 28 Aug 2023 22:58:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232544AbjH2C5s (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 28 Aug 2023 22:57:48 -0400
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (mail-vi1eur02on2083.outbound.protection.outlook.com [40.107.241.83])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62DA7B9
        for <linux-usb@vger.kernel.org>; Mon, 28 Aug 2023 19:57:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S4CHVtYVu9ZRxpJZjfzT0zKha88efd4Q0hp6XmJ5rbwhB2fDXPYPggD+e0oRUfCIS7rmI6SQhEafm1dVxDg6PPiY70iydf4sB6MxaBEvoQ3/rn9a3yG7ABN0KTtlhYYO39Y6ybkPN9WlXSE/yJeEJo2jxtRpULbCDZlrAhVlh31AgFOpq7l6/obaiqGKl1qF+cAKMd1TlxurZD/nKTlF4ar2fn5UY/H733sxdtvgWIBOzW0+Cxl7VEI2Sb6ZuTO9/zKDUHEpuFM6wTm9Hy3cWhJ46nvAD3CcVHB2z9137YviYhWBID4E1lI4JVoGlsquRV2HlCs9FK0olbxJMJQ/+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z6XbeVFQlK9BJdNS8J/TGQ7oKwB3vNBKWzRCmpt5MIg=;
 b=j9i3r18OKofBmA5SXZboKq0ZExsmLDVEwdwqR80Ml6f0f5rW1s9PgIk8r4uMWTqYfuOgwv5rEwmMbFk+I++hEG0dd0HprCNYS32aqo5F8yzO04PwSfeDmv85ZwUXr0R3vs3wfrXPu709Xn+i+L2HRGMKTRyyE3QDhFYpZyeStBSSa8wFpNycY9AiVpk3DUoZY8AjFD6FNcAOC/QT/DpmO4q2Y5w0JLf1b1hrqxrXwc/VKAYmgV4UPHBuO1tEe7hj8lYlH+WlfyweEdyypnU3LpdrccRw9jLchFEGTy+Ld+dHGLzVYD/CbgZjsM0Ef7KAhdOGJnnoOkEIE0i0DUgcVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z6XbeVFQlK9BJdNS8J/TGQ7oKwB3vNBKWzRCmpt5MIg=;
 b=GbyrNBQ87il36TAswMh26e+djyIXtf+dRckVg6VUOGIVSn1ANFG8cd+sJS5u0t4G5ZqZPv8d8OwYbz9RjJL1Os8UiR+Mt8xpswDmCEO217CkIqPRnav48Ox/J6FKWbFDAq9oM10533V18RTzS2v+VYZy0UhFLvik3cnzEZFSdx0=
Received: from DB7PR04MB4505.eurprd04.prod.outlook.com (2603:10a6:5:39::26) by
 DB9PR04MB8252.eurprd04.prod.outlook.com (2603:10a6:10:24d::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6699.34; Tue, 29 Aug 2023 02:57:42 +0000
Received: from DB7PR04MB4505.eurprd04.prod.outlook.com
 ([fe80::6444:e07a:e7f7:3923]) by DB7PR04MB4505.eurprd04.prod.outlook.com
 ([fe80::6444:e07a:e7f7:3923%6]) with mapi id 15.20.6699.034; Tue, 29 Aug 2023
 02:57:42 +0000
From:   Xu Yang <xu.yang_2@nxp.com>
To:     Greg KH <gregkh@linuxfoundation.org>
CC:     "linux@roeck-us.net" <linux@roeck-us.net>,
        "heikki.krogerus@linux.intel.com" <heikki.krogerus@linux.intel.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Jun Li <jun.li@nxp.com>
Subject: RE: [EXT] Re: [PATCH 1/2] usb: typec: tcpci: add check code for
 tcpci/regmap_read/write()
Thread-Topic: [EXT] Re: [PATCH 1/2] usb: typec: tcpci: add check code for
 tcpci/regmap_read/write()
Thread-Index: AQHZ2ZGv60ICpuPSMEmFJRf7Z7m5vq//dsOAgAAAgiA=
Date:   Tue, 29 Aug 2023 02:57:42 +0000
Message-ID: <DB7PR04MB4505E1848308E5A14131CEDE8CE7A@DB7PR04MB4505.eurprd04.prod.outlook.com>
References: <20230828093035.1556639-1-xu.yang_2@nxp.com>
 <2023082803-stylus-turbine-cb47@gregkh>
In-Reply-To: <2023082803-stylus-turbine-cb47@gregkh>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB7PR04MB4505:EE_|DB9PR04MB8252:EE_
x-ms-office365-filtering-correlation-id: 716290db-efaf-4a41-4b43-08dba83bb6a7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: DrcmT4QGhwcnugZB/5JPfuKCSZMqRJg57JWM6/nOn8rRDovYiTKyfStKC20FOo4KH8SjuuszeCn+PHYjvoIps2dU1tqCn0IgZYfHrJ+Ivd0UNPvNJPMuzYRRq/9i3jYvihkBZq9v7uUtg0kMymjo6KgVtKzxBryt2w8kB+R4zB88Cm4uZg2Mv0mX5RUaSR8TY8Rf1h8FpFGHUXvseGy+B/QOCvFI0CTdAvB7ZbMrLzNVi5wBj/c4WSITE8ot5zsCQ50HSyBbNpnzCy6ea12dUaISTESfTKwo2tpj0HZQaxmNzkHZlHkmoN9xMVynvMrk2GBInxLvjUnwMuKxwoRBpWe39yeESuIuVVM6W5S0rzOxm83n1PX6bjvW3ZCIMoXZRHzSglOdBLbRlUkluOLDCl0ruYtia1tE77Q0sK+8MjrS1bgD2ZtIFyyV2B9rky7r3Y+gZYZHazmWxGB77Keh3zk1ZOMf3QPof2XWMxAavd6zQE7rMBvg/q4bGNg6m2lZvWqesuhWoFd2vsFStXFFHzOJa0QZFMx9Iwyf24QX+WhAysBU7kp6KBaH2Mx5IJozeodAxHtpFyDKfnOXZPh3W+vI51NB5bxG+QTtfUeRuS1LNrYgrAjMhQki4EqjabsM
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR04MB4505.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(396003)(346002)(376002)(39860400002)(366004)(1800799009)(186009)(451199024)(478600001)(83380400001)(122000001)(26005)(9686003)(7696005)(6506007)(71200400001)(55016003)(86362001)(33656002)(2906002)(52536014)(316002)(66476007)(38100700002)(38070700005)(6916009)(8676002)(4326008)(5660300002)(64756008)(76116006)(66446008)(41300700001)(66946007)(8936002)(54906003)(66556008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Vmf2m6Z3kCD0JHPIApoJsA4zaScV4oHsO3d7V3tFgNBojuJVDS1enY3iAAi8?=
 =?us-ascii?Q?Zcp8ywWesXCv1jZpcmPGnpQzIty1NMf6/wc99kvLoQA7TgkM4V8l1l9Nlv1j?=
 =?us-ascii?Q?GXhjF5MJsQxyCCBu6gSsDHkewdIkZotdQ3yJb+sqNGVcnWN0lvnxevd1NFeU?=
 =?us-ascii?Q?oDbmPDuF7sKCiG9dHCGGVZuu9Uc7/HR4oZToEyXgS8h9++mYiUmO7HGuGO+J?=
 =?us-ascii?Q?nMeMAa8X8P07Sj326IU3tYmZVbG4PDPIQlIueONSXbbLSEid2UhmJsrrVWpH?=
 =?us-ascii?Q?yU5Hn+fgyvzm+ngADR1p5iU2Zf8BXH01DajsxMA9p4FCiHXpajX1lLywL8TO?=
 =?us-ascii?Q?14uZq0DhrchXoTfNf4FRMn4HFHENKbb/bV5BuHGk528g7Tcz7TxzFQDeevrR?=
 =?us-ascii?Q?Vc9Ar4XiHoQtPQ6Tq62dhOeRplVf7MMzUMX6+H7yHBEz6QoHpxYedkZ6v/eQ?=
 =?us-ascii?Q?We3iZFQD53o9+0XIkbGVxSvgfn26ZEIBTBoxntI/2PXNiD2lUbdp/fbJTrhJ?=
 =?us-ascii?Q?IdXzrHn4ataqvU5cWqF3WSaqLol/CPz+moMnvDlo7GsB9vkNss8S1xMGsvyf?=
 =?us-ascii?Q?2V6tBiVmrbcld3ge3d+jtjkID1JeNB0ir1UUn1tcX7Cn184/xEBRlVsVZCfQ?=
 =?us-ascii?Q?FkAEpz/Rtm3KQuCKQKbP+ZSmyXrlxKLdxS/8eGFlAhXrMdxpaobrObmFmrjQ?=
 =?us-ascii?Q?TlLdoye6fYjNo+PonG0r+of+orHs9L0wvWmTkevsSz7gnL7Wpxyi4JHaXOBt?=
 =?us-ascii?Q?QwQnafD9iVMU/apIBqW79IPVFP9n5xhw4PHqzDFzYE3q6mEEQR1P0hkCkuHF?=
 =?us-ascii?Q?XQEjgT25/DUVZYFHqGvq8y0K514Fhh6sugRbHzld9YNrt+EqXZKdEg+iPqEH?=
 =?us-ascii?Q?t9FL20GBZdVqBwWrwj3YZJ8zbThePA3koULH41UuGB0pFaLlQ131f7KoJE4e?=
 =?us-ascii?Q?moEjOUXbXTQTJTd240E2Sebyi7XcpQK4GLo6pLeuUKM5XM1p1gBT7fCL45Uo?=
 =?us-ascii?Q?uiKRxsDKdpeAJGwDuR94mWzHtPZ0lYBo15DOpGZTdj3NhhbYN94gcrNI2oro?=
 =?us-ascii?Q?odkD8AsIAOADMoj3I8+N0I4TGeDevNTekmLNZr8TOKPy7Masd8ML+YkkuR83?=
 =?us-ascii?Q?4FuhjS9GD03EaUY11cfnZgUmnjS3KWTMnpN9IRWKkAaCFxpho2YTWYx8vaL8?=
 =?us-ascii?Q?rAKQ2nwVVbfMZAz37WdaQwYO6WZyMq3AXOWI5Ll6yT5a3p2uSepH/IcY2nOR?=
 =?us-ascii?Q?gW7XjGWNSm/VspgrquFNmztbS2ZGugChG+kEU2C26dbOtX9KyXmPMGaqraRd?=
 =?us-ascii?Q?qeGTUvCNiINtRDGIBTtpGI5mpR4gXHZA8lVPdRMdAEooXhXMYsPqWavJDpVA?=
 =?us-ascii?Q?+CHRDNgqqyI6DnvUm7IFr1x7rjwhU9IGk+reGmiY7yqd5TJx/LF0TbledBHT?=
 =?us-ascii?Q?67FvSJjzXxBlvdu8WTsYrIyndINYKLRqrIRnetO5f/FB3tN9xVKp2ZC+lEgI?=
 =?us-ascii?Q?y2iwXG7+nUefyGJQslR06tMvQBizlQv1oTx1YoF73ynV35X8z7VJCTYmiCRj?=
 =?us-ascii?Q?MaYlNB4iT2TgS5rxsQo=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB4505.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 716290db-efaf-4a41-4b43-08dba83bb6a7
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Aug 2023 02:57:42.3709
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MsLC2NRnDuYlHQBFHdhf0/1p0KVaqePpsoWJBxNVNYiWk7HHAv9LtD93F1o5c5Pr64I84o+IdiD+cJ3f1HdIVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8252
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Greg,

> On Mon, Aug 28, 2023 at 05:30:34PM +0800, Xu Yang wrote:
> > The return value from tcpci/regmap_read/write() must be checked to get
> > rid of the bad influence of other modules.
>=20
> What do you mean by "other modules" here?

The PTN5110 chip communicates with SoC via i2c bus. If i2c controller
behaves abnormally, regmap_read/write() will fail and return a negative
value. So the "other modules" mainly mean i2c controller.

>=20
> > This will add check code for
> > all of the rest read/write() callbacks and will show error when failed
> > to get ALERT register.
> >
> > Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> > ---
> >  drivers/usb/typec/tcpm/tcpci.c | 36 +++++++++++++++++++++++++---------
> >  1 file changed, 27 insertions(+), 9 deletions(-)
> >
> > diff --git a/drivers/usb/typec/tcpm/tcpci.c b/drivers/usb/typec/tcpm/tc=
pci.c
> > index 0ee3e6e29bb1..698d00b7fce9 100644
> > --- a/drivers/usb/typec/tcpm/tcpci.c
> > +++ b/drivers/usb/typec/tcpm/tcpci.c
> > @@ -657,21 +657,30 @@ irqreturn_t tcpci_irq(struct tcpci *tcpci)
> >       int ret;
> >       unsigned int raw;
> >
> > -     tcpci_read16(tcpci, TCPC_ALERT, &status);
> > +     ret =3D tcpci_read16(tcpci, TCPC_ALERT, &status);
> > +     if (ret < 0) {
> > +             dev_err(tcpci->dev, "ALERT read failed\n");
>=20
> You are printing something in an irq handler, are you sure you want to
> do that?  What happens if this is very noisy?

This dev_err() may need to be removed. A log may be helpful to locate
issue. I just notice max_tcpci_irq() is doing the same thing:

359         ret =3D max_tcpci_read16(chip, TCPC_ALERT, &status);
360         if (ret < 0) {
361                 dev_err(chip->dev, "ALERT read failed\n");
362                 return ret;
363         }

>=20
> > +             return ret;
> > +     }
> >
> >       /*
> >        * Clear alert status for everything except RX_STATUS, which shou=
ldn't
> >        * be cleared until we have successfully retrieved message.
> >        */
> > -     if (status & ~TCPC_ALERT_RX_STATUS)
> > -             tcpci_write16(tcpci, TCPC_ALERT,
> > +     if (status & ~TCPC_ALERT_RX_STATUS) {
> > +             ret =3D tcpci_write16(tcpci, TCPC_ALERT,
> >                             status & ~TCPC_ALERT_RX_STATUS);
> > +             if (ret < 0)
> > +                     return ret;
> > +     }
> >
> >       if (status & TCPC_ALERT_CC_STATUS)
> >               tcpm_cc_change(tcpci->port);
> >
> >       if (status & TCPC_ALERT_POWER_STATUS) {
> > -             regmap_read(tcpci->regmap, TCPC_POWER_STATUS_MASK, &raw);
> > +             ret =3D regmap_read(tcpci->regmap, TCPC_POWER_STATUS_MASK=
, &raw);
> > +             if (ret < 0)
> > +                     return ret;
> >               /*
> >                * If power status mask has been reset, then the TCPC
> >                * has reset.
> > @@ -687,7 +696,9 @@ irqreturn_t tcpci_irq(struct tcpci *tcpci)
> >               unsigned int cnt, payload_cnt;
> >               u16 header;
> >
> > -             regmap_read(tcpci->regmap, TCPC_RX_BYTE_CNT, &cnt);
> > +             ret =3D regmap_read(tcpci->regmap, TCPC_RX_BYTE_CNT, &cnt=
);
> > +             if (ret < 0)
> > +                     return ret;
> >               /*
> >                * 'cnt' corresponds to READABLE_BYTE_COUNT in section 4.=
4.14
> >                * of the TCPCI spec [Rev 2.0 Ver 1.0 October 2017] and i=
s
> > @@ -699,18 +710,25 @@ irqreturn_t tcpci_irq(struct tcpci *tcpci)
> >               else
> >                       payload_cnt =3D 0;
> >
> > -             tcpci_read16(tcpci, TCPC_RX_HDR, &header);
> > +             ret =3D tcpci_read16(tcpci, TCPC_RX_HDR, &header);
> > +             if (ret < 0)
> > +                     return ret;
> >               msg.header =3D cpu_to_le16(header);
> >
> >               if (WARN_ON(payload_cnt > sizeof(msg.payload)))
> >                       payload_cnt =3D sizeof(msg.payload);
> >
> > -             if (payload_cnt > 0)
> > -                     regmap_raw_read(tcpci->regmap, TCPC_RX_DATA,
> > +             if (payload_cnt > 0) {
> > +                     ret =3D regmap_raw_read(tcpci->regmap, TCPC_RX_DA=
TA,
> >                                       &msg.payload, payload_cnt);
> > +                     if (ret < 0)
> > +                             return ret;
> > +             }
> >
> >               /* Read complete, clear RX status alert bit */
> > -             tcpci_write16(tcpci, TCPC_ALERT, TCPC_ALERT_RX_STATUS);
> > +             ret =3D tcpci_write16(tcpci, TCPC_ALERT, TCPC_ALERT_RX_ST=
ATUS);
> > +             if (ret < 0)
> > +                     return ret;
>=20
> For all of these, if an error happens, you are not able to unwind from
> the previous actions that the irq handler took.

The previous actions are necessary since they are real states. If an
error happens, the tcpm will also take over it. Normally, if the first
place to read ALERT register succeed, the following read/write() will
also success.

>=20
> Are you sure this is ok?  How was this tested?

I just tested tcpci_read16(tcpci, TCPC_ALERT, &status). I have enabled
tcpci wake interrupt. When system had waked up from tcpci interrupt,
tcpci_read16() sometimes failed to get ALERT register (i2c controller is
abnormal in this period), then I got below log:

# cat /sys/kernel/debug/usb/tcpm-2-0050/log
[   80.696202] PD TX complete, status: 1
[   80.696226] PD TX complete, status: 1
[   80.696256] PD TX complete, status: 1
[   80.696280] PD TX complete, status: 1
[   80.696310] PD TX complete, status: 1
...
[   80.699982] PD RX, header: 0x8000 [1]
[   80.699987] Unchunked extended messages unsupported
[   80.699991] PD TX, header: 0x1b0
[   80.700034] PD TX complete, status: 1
[   80.700063] PD TX complete, status: 1
[   80.700089] PD TX complete, status: 1
[   80.700112] PD TX complete, status: 1
...
[   80.705056] PD TX complete, status: 1
[   80.705075] PD TX complete, status: 1
[   80.706364] CC1: 2 -> 0, CC2: 0 -> 0 [state SRC_READY, polarity 0, disco=
nnected]
[   80.706373] state change SRC_READY -> SNK_UNATTACHED [rev3 NONE_AMS]
[   80.708250] Start toggling
[   80.709560] VBUS off
[   80.709564] VBUS VSAFE0V
[   80.709900] VBUS off
[   80.709902] VBUS VSAFE0V

Although i2c bus was recovered at the end, tcpci had still transferred wron=
g state
to tcpm. After I add check code for read/write(), the behavior is normal.

Thanks,
Xu Yang

>=20
> thanks,
>=20
> greg k-h
