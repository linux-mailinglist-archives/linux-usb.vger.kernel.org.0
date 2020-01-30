Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E443A14DC6A
	for <lists+linux-usb@lfdr.de>; Thu, 30 Jan 2020 15:05:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727354AbgA3OFU (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 30 Jan 2020 09:05:20 -0500
Received: from mail-am6eur05on2057.outbound.protection.outlook.com ([40.107.22.57]:6167
        "EHLO EUR05-AM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727161AbgA3OFU (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 30 Jan 2020 09:05:20 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Umn1QMJ8nuqJhulNjTC4W3m9qsKZVcDnnG3yid5MXiR6kB2nZyccl5AaMDabs2T/6pClXma2bmao7ErSHh2N/GzWX6v+U0OowULrOjXl9suLNh36LNgZBEBtUNSECCjXeqBe+H3OsOtu68AFKGMfM4yuxQZVgIdSdXjWhg5DT3+5NHGweWzy+tlmTg5wfBuL8x9/KbIwr95XlQXLEzkYC0CiGZ56DpfgDtSXNHMcHMxETBPGeO3qZbrAnEY5ClQ1VOlK0zUoVKVLO8aPGeml29JCDc6a+RcUqAZ0vXLMbHglFyLGVQ4EW4epltITCbG9eS7BkCeWz5W/1e5GNCgRwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pFHQqZgP5MmXLH1PlEuYy7xmClLE9NcOwzGTjv2nZNY=;
 b=ErWsmwi1bbEK5fY7q97PaaVslr5KG84UxBTCT7j7UQSqyA7/nre92wKSqFxv5QiOnx0AmFRz3HWbHiWFK58+wa+bzDoy/L1W5vaGT8KcIQGxcil7YNipxebtlQ8t7AS6Q6l81eNUgYZrJ+n8+atPJL6iXyny+ld2bsbJ/oMkwPeVQWZjQyI7XTNNG6s4g12mLjm47X88rJGIS8MSu1FTfHV+BTvBkR/E3s4FjRMIZqF6xq31L/ywSg6mCxt6FJ0BDdAXcPuMSq8SPyx08DHc30FAhhhliNVGJbCd0i9BUUz1AzcCguMiOzT6WqoIoCsX+gjwQmFG8ejBTpm1rPkFpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pFHQqZgP5MmXLH1PlEuYy7xmClLE9NcOwzGTjv2nZNY=;
 b=FoJVXlLnzbOJ67Ga0OFsQ+oMeDEcLcuX91E5MOFFGu15vdtWpPoh4NNuK6tfUfEOSOOFI9npWcJDDtMalwP7HrINyT+TBiDNhaHoHG6ZGXwVhiLKI4iB+YWc+BViTtARv1JkY3/REz7hS0U/R0BDUXRH3BamW7jG8EUAGF2gvzg=
Received: from VI1PR04MB5327.eurprd04.prod.outlook.com (20.177.51.23) by
 VI1PR04MB7167.eurprd04.prod.outlook.com (10.186.158.71) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2686.27; Thu, 30 Jan 2020 14:05:17 +0000
Received: from VI1PR04MB5327.eurprd04.prod.outlook.com
 ([fe80::c7d:58a2:7265:407e]) by VI1PR04MB5327.eurprd04.prod.outlook.com
 ([fe80::c7d:58a2:7265:407e%6]) with mapi id 15.20.2686.025; Thu, 30 Jan 2020
 14:05:17 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     Greg KH <gregkh@linuxfoundation.org>
CC:     "balbi@kernel.org" <balbi@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>, Jun Li <jun.li@nxp.com>
Subject: RE: [PATCH v4 1/2] usb: phy: show USB charger type for user
Thread-Topic: [PATCH v4 1/2] usb: phy: show USB charger type for user
Thread-Index: AQHVzB2pVcQEN3ljtEqlpMwLUsf3maf5i62AgAnIO5A=
Date:   Thu, 30 Jan 2020 14:05:17 +0000
Message-ID: <VI1PR04MB5327245DEABD688CC88F88548B040@VI1PR04MB5327.eurprd04.prod.outlook.com>
References: <1579145333-1657-1-git-send-email-peter.chen@nxp.com>
 <20200124084039.GB2923791@kroah.com>
In-Reply-To: <20200124084039.GB2923791@kroah.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=peter.chen@nxp.com; 
x-originating-ip: [119.31.174.68]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: d5fdc521-1553-4d68-459f-08d7a58d6f80
x-ms-traffictypediagnostic: VI1PR04MB7167:|VI1PR04MB7167:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1PR04MB716769715D8807579A75500E8B040@VI1PR04MB7167.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4714;
x-forefront-prvs: 02981BE340
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(39860400002)(136003)(366004)(396003)(346002)(376002)(199004)(189003)(478600001)(8676002)(2906002)(55016002)(33656002)(7696005)(316002)(5660300002)(4744005)(44832011)(81166006)(186003)(6506007)(52536014)(6916009)(81156014)(8936002)(9686003)(76116006)(64756008)(66446008)(71200400001)(66946007)(86362001)(66556008)(66476007)(54906003)(4326008)(26005);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR04MB7167;H:VI1PR04MB5327.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: bDZRKCl62RV/Trs4ELp+sCm4ZnwX1+ZXjbsE+GIoLTrF41ebtqIykp2VAtsXfhkBFgzHjqs9Zun6zFdumbyEnVGuB8nVENTBEZBUoRygBgkHoN2Gip9Nw+QbHDAHNIcivvm+a8adAdFrs6Jym8dEvf8OkdVfbkLi1+YkCS6eTxdKZCEhEUjrVWkRfXVHIiywHTtFkU35arJZXqAkdLHyh+927mPe7nZj0w0rwKhBwMQV2IsBwHe5E7DEXvTZuD+yI0Ii6eNbKGhxGHSPJtYE9/p7DRiKdEMOLMBHcbFICAf75iKBEydVNqg5xvvjp3sUgSb0hroPNC5zYdSPd1V83AeQn8dGQtDwExHbiKN+5fhmIdofBZrnzmgNV60KNLHjVrVF0YEmRQU7ePeh2EhkW/lVx/SwHWKtTm9WIH8sR4/OWUzsFO8I+Db3o/IjMhEa
x-ms-exchange-antispam-messagedata: Xx1/hSlNdh2lFjwrtWKk0gnYw0kHSzwt4zBd/yAgsBepCOzPigNzmq1e0QbIGtK3dNmvDgBOAzOkrS+hm1Cm2SfjbhJUvAVFkldqH6xCnQGseSgwsleOh2OHFZ/DGr4u/d7hqemsTZaCqeMK3deCSA==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d5fdc521-1553-4d68-459f-08d7a58d6f80
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jan 2020 14:05:17.4164
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bP/EEGqCE0F5kjhLuFAE1KZ6YOmDolcNyWzeyHecaNCJ6p1Iv8eSn3FbOk4XVWGH5bJXZz0sF42JFvd3mrel6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7167
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

=20
> > Signed-off-by: Peter Chen <peter.chen@nxp.com>
> > ---
> > Changes for v4:
> > - No changes.
> >
> >  drivers/usb/phy/phy.c | 13 ++++++++++++-
> >  1 file changed, 12 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/usb/phy/phy.c b/drivers/usb/phy/phy.c index
> > 0277f62739a2..ad2554630889 100644
> > --- a/drivers/usb/phy/phy.c
> > +++ b/drivers/usb/phy/phy.c
> > @@ -34,6 +34,14 @@ struct phy_devm {
> >  	struct notifier_block *nb;
> >  };
> >
> > +static const char *const usb_chger_type[] =3D {
> > +	[UNKNOWN_TYPE]			=3D
> "USB_CHARGER_UNKNOWN_TYPE",
> > +	[SDP_TYPE]			=3D "USB_CHARGER_SDP_TYPE",
> > +	[CDP_TYPE]			=3D "USB_CHARGER_CDP_TYPE",
> > +	[DCP_TYPE]			=3D "USB_CHARGER_DCP_TYPE",
> > +	[ACA_TYPE]			=3D "USB_CHARGER_ACA_TYPE",
> > +};
>=20
> As these are exported values (CDP_TYPE and friends), they really need to =
have
> explicit values on the .h file, otherwise it might not work properly on a=
ll systems.
>=20

Sorry, what do you mean? These values are defined at include/uapi/linux/usb=
/charger.h

Peter
