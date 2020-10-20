Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DEC85293CD5
	for <lists+linux-usb@lfdr.de>; Tue, 20 Oct 2020 15:02:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407304AbgJTNCi (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 20 Oct 2020 09:02:38 -0400
Received: from mail-eopbgr30054.outbound.protection.outlook.com ([40.107.3.54]:60742
        "EHLO EUR03-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2407300AbgJTNCf (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 20 Oct 2020 09:02:35 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n4NzlVdq3cBj5gM7gWQSwKCQneoVhk3DEPQdBuimg5TTSmNba3P3YVFPsVjIrceHiq0DFtTEYCdx4sOJxAUvMRLGlAh8k3RN74Du7q36yayYQ2xa7oVehOUG3zMQUWSEjq1hjK8AHNmIvpEdNMLiCyMhVOrcGwVZK6mV1fjgKd0g8LIsX2VOMtCbcaMv/aOpaJS6sAP94hHoNGsYgGTYiq4Rgm7WYMQskDPjEShO2XY2tBJqLkLjtpNiGfPz9GYLToFDmU47YHdQoYvcPaDorJ4gk7FcsOfNbRPsifja+Vu1CaULV1y+W6HUmTQA+os5FdHAXhgM/yqNmwU3BbXLhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OtW/emAla1ZdJ8G0FAOxdrJjg0gbIbFlTWEHNiNcIAs=;
 b=P3B96xNFpnZRxz6jZS3ZuwXBCvUptx+SH6kvB4hbTmWmymUGH7pQ2nkYZJEV+nGuA19alZrg0PQT97h56tdCb1SWQojLHcaE/QaWCqPYs6Lq4O6cWTjZZFKTcYXLbBDQqDB9U1P9tpj899sXa5QjXdkOMMy5R37HMMKjvNQ/c1/7sqecdoS5tIRoBDKs2YVH9uEoyRKP1SpDxb8Up4TXnMW35HO6/OFnO11gaoFGCAbpt3CI8A64xLfqnVX652zl2pimq8uYmoIFrXj1NVin1ItPfHKxrWoGsbiiCoX+ZCFrfZCWobODL1dG6kBcDfsJem17yveLfv4ZzW7L5U25tA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OtW/emAla1ZdJ8G0FAOxdrJjg0gbIbFlTWEHNiNcIAs=;
 b=n6lHSl2Ln1XjgsCTaowgZzYP9B5uKa8bHC0bxWrGU/ddbKSd2LL0Vl0bIRib3tnH1+UJBtmSQFHiP4snu5Tn8R+kM9Xmek5v+FQDWXw1qfOe5v5aa3T4g/HWcrnEx/057ymAfomsI23OYYrxn8AUxeJyfPU9LH8EYwMov+HhVDI=
Received: from VE1PR04MB6528.eurprd04.prod.outlook.com (2603:10a6:803:127::18)
 by VE1PR04MB7421.eurprd04.prod.outlook.com (2603:10a6:800:1b3::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18; Tue, 20 Oct
 2020 13:02:30 +0000
Received: from VE1PR04MB6528.eurprd04.prod.outlook.com
 ([fe80::d9da:5c3:c978:43f8]) by VE1PR04MB6528.eurprd04.prod.outlook.com
 ([fe80::d9da:5c3:c978:43f8%7]) with mapi id 15.20.3477.028; Tue, 20 Oct 2020
 13:02:30 +0000
From:   Jun Li <jun.li@nxp.com>
To:     Peter Chen <peter.chen@nxp.com>
CC:     "heikki.krogerus@linux.intel.com" <heikki.krogerus@linux.intel.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "rafael@kernel.org" <rafael@kernel.org>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "andriy.shevchenko@linux.intel.com" 
        <andriy.shevchenko@linux.intel.com>,
        "hdegoede@redhat.com" <hdegoede@redhat.com>,
        "lee.jones@linaro.org" <lee.jones@linaro.org>,
        "mika.westerberg@linux.intel.com" <mika.westerberg@linux.intel.com>,
        "dmitry.torokhov@gmail.com" <dmitry.torokhov@gmail.com>,
        "prabhakar.mahadev-lad.rj@bp.renesas.com" 
        <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "laurent.pinchart+renesas@ideasonboard.com" 
        <laurent.pinchart+renesas@ideasonboard.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>
Subject: RE: [PATCH v4 3/4] usb: typec: mux: add "compatible" property for
 switch match
Thread-Topic: [PATCH v4 3/4] usb: typec: mux: add "compatible" property for
 switch match
Thread-Index: AQHWpfeqLoWTCCsls0ukMiojFHP2O6mgAgQAgABxq4A=
Date:   Tue, 20 Oct 2020 13:02:30 +0000
Message-ID: <VE1PR04MB65285BE4972D3C7EB36E27D4891F0@VE1PR04MB6528.eurprd04.prod.outlook.com>
References: <1603098195-9923-1-git-send-email-jun.li@nxp.com>
 <1603098195-9923-3-git-send-email-jun.li@nxp.com>
 <20201020060448.GA29717@b29397-desktop>
In-Reply-To: <20201020060448.GA29717@b29397-desktop>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: nxp.com; dkim=none (message not signed)
 header.d=none;nxp.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.71]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: be4779bc-a227-4759-75b9-08d874f866ff
x-ms-traffictypediagnostic: VE1PR04MB7421:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VE1PR04MB7421B809577DA42BD4E7E89D891F0@VE1PR04MB7421.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2150;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: mY2w3W1v7ppg2kCgjR6Ixl3kiTw96MBY3QL/MBrU8/Ww7WFqD5cMJmA4OYQEkPjPLusH7gG+BKSMye4XyMGri0yky/HZB0J0nBlETv4wXqMK5UImodtsPVFnpwubCNko4+2kDfL0slKVzU66Nmr+EWP38M2ozE6ItH9cmiFIXhzHU4B1Z9/IUx2Hh3P31K/xVpZWYpo/qy0dICOvqwDC2sQVFi/KgIMxX9R+yeCS/HkqhcAiYqwewnzwgb4bJFe/uVxPPq47V4hbVYRNkBcHlbTWm6Z+PyW/3oOIa9T61hriLL9vQGkdBNUysP94XP+PZ7LSHPVgky55LGN5wwz0fQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6528.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(376002)(396003)(39850400004)(366004)(346002)(71200400001)(76116006)(52536014)(9686003)(2906002)(6636002)(83380400001)(5660300002)(66446008)(64756008)(66476007)(66946007)(66556008)(26005)(186003)(54906003)(478600001)(316002)(8676002)(6506007)(55016002)(86362001)(33656002)(6862004)(4326008)(8936002)(7416002)(53546011)(44832011)(7696005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: N/6kR5lR5eI63AiMw/BLXlH6fSSSDrjcrCZcE6N+ZIjMZ540XU+Hy43iawGbAmsgWrkfXY+FAHEK6A8lgnhGZmBTxwF4Qu9URtUdDokqw+R+YZ6+1TXqqwDn1J+h19XUUtMgGKPDgtFJ+TK72ukuLYEgrVbXVhcks613jkzLN4jzVUpSzlZpf8WJtNYqQcL8BYIVA6C9Xp2pPTG27DZD/2Zdgk/tDPKgRUd+lDsJO4SNv9Njf0QI+Jp3KVLXaRdBguBMqS255YEhE16WywYn1frFrIqYXQUyTzuhMdv8ZPt7c1F19il0kzjXdlbE/hLTskS+83HkJKDnKi7I9kxQ6oFusJuBsZmgg1te1gTmQ7tAWhyuGcTDgRt2kthA+v9odK9IbkT44jva+W6607IwlRfsJvOeH6rdyaVVN5P+woHQ3rJTojA0Brp0XJ3Ekk2caOyL5FG2b/Iqpp0Dn+h6j2qqnZPiH40KoUn3i/pV4xlsX5xVwGJVIFCLO79rMhonAkTpxziv2XpX9McizoBpBlhKnZW8hwXtLsNq8ChnlE18WEc+0umjs7cXoZaWfJdGcgOPz5wmZa4B7+Ffd6nTYKCKpctwe5hceF5Nss1Jvz6JYBMX13FY1olcju0g9qqMfD4ffBICCUlXNxAcjiQgtA==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6528.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be4779bc-a227-4759-75b9-08d874f866ff
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Oct 2020 13:02:30.0834
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /a1YqPLY+b94pVy0eIRSeXx7EA4bh0EAKfhc2mSElyedUolh01BUo36bvi3nPSgB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7421
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



> -----Original Message-----
> From: Peter Chen <peter.chen@nxp.com>
> Sent: Tuesday, October 20, 2020 2:05 PM
> To: Jun Li <jun.li@nxp.com>
> Cc: heikki.krogerus@linux.intel.com; robh+dt@kernel.org;
> rafael@kernel.org; gregkh@linuxfoundation.org;
> andriy.shevchenko@linux.intel.com; hdegoede@redhat.com;
> lee.jones@linaro.org; mika.westerberg@linux.intel.com;
> dmitry.torokhov@gmail.com; prabhakar.mahadev-lad.rj@bp.renesas.com;
> laurent.pinchart+renesas@ideasonboard.com; linux-usb@vger.kernel.org;
> devicetree@vger.kernel.org; dl-linux-imx <linux-imx@nxp.com>
> Subject: Re: [PATCH v4 3/4] usb: typec: mux: add "compatible" property fo=
r
> switch match
>=20
> On 20-10-19 17:03:14, Li Jun wrote:
> > For those need a dedicated typec switch simple solution driver, use
> > compatible property for matching.
> >
> > Signed-off-by: Li Jun <jun.li@nxp.com>
> > ---
> > New patch for v4.
> >
> >  drivers/usb/typec/mux.c | 7 ++++---
> >  1 file changed, 4 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/usb/typec/mux.c b/drivers/usb/typec/mux.c index
> > 52ad277..3da17d1 100644
> > --- a/drivers/usb/typec/mux.c
> > +++ b/drivers/usb/typec/mux.c
> > @@ -39,7 +39,8 @@ static void *typec_switch_match(struct
> > device_connection *con, int ep,  {
> >  	struct device *dev;
> >
> > -	if (con->id && !fwnode_property_present(con->fwnode, con->id))
> > +	if (con->id && !fwnode_is_compatible(con->fwnode, con->id) &&
> > +		       !fwnode_property_present(con->fwnode, con->id))
> >  		return NULL;
>=20
> If property is not present, should not fwnode_is_compatible return NULL?

Do you want to say:

If property is not present, should not *typec_switch_match* return NULL?

Li Jun
>=20
> Peter
>=20
> >
> >  	dev =3D class_find_device(&typec_mux_class, NULL, con->fwnode, @@
> > -61,8 +62,8 @@ struct typec_switch *fwnode_typec_switch_get(struct
> > fwnode_handle *fwnode)  {
> >  	struct typec_switch *sw;
> >
> > -	sw =3D fwnode_connection_find_match(fwnode, "orientation-switch", NUL=
L,
> > -					  typec_switch_match);
> > +	sw =3D fwnode_connection_find_match(fwnode, "typec-orientation-switch=
",
> > +					  NULL, typec_switch_match);
> >  	if (!IS_ERR_OR_NULL(sw))
> >  		WARN_ON(!try_module_get(sw->dev.parent->driver->owner));
> >
> > --
> > 2.7.4
> >
>=20
> --
>=20
> Thanks,
> Peter Chen
