Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5FEEC50DB0E
	for <lists+linux-usb@lfdr.de>; Mon, 25 Apr 2022 10:25:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237090AbiDYI1V (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 25 Apr 2022 04:27:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240068AbiDYI1K (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 25 Apr 2022 04:27:10 -0400
Received: from esa.hc3962-90.iphmx.com (esa.hc3962-90.iphmx.com [216.71.140.77])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34A321DA49
        for <linux-usb@vger.kernel.org>; Mon, 25 Apr 2022 01:23:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qccesdkim1;
  t=1650875043; x=1651479843;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=R5qZRM9CuV1j92lo9WPHutz9AyB/SJ2tmFPd/aJKHVY=;
  b=q7QivCZbKa21Y4pYFFA2qfzJ2aY8lJxQALS4pL8CBBpN4sMYObx7f5yW
   8oVk0diZ8f5F6DFBzKPlAP+Sus2k1qC4COCU7EBRu1LrO8JJj/9Tw76dv
   h7Fe7P+PaQhsGzKHPrgI/wQsvHUpwMgB2FllCSVEG9ofAHhi9Z1+83vw5
   A=;
Received: from mail-bn8nam08lp2044.outbound.protection.outlook.com (HELO NAM04-BN8-obe.outbound.protection.outlook.com) ([104.47.74.44])
  by ob1.hc3962-90.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2022 08:23:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BvWutwTZuS3uS+XKwUnVtyLyJBeDlisNnKNlMs84qLvRH6hS1WzyM0fg1kg+stkO9YEBE51VoL8DRJhiBqKQ0Jr+b/PqARZ7hbvr5YdwLj8VGkXIVf2VpfkvP5t3i0tKyXYoXz4DLfh2tlPw8Huh5mK7gBxuBJ0oStQoRRQQJ86t5uSqGRcKOJtRaZUokhYtCUKMejrgFSNQ9chxdqcMeCCCsGnkzvGKNlyP0D72M2Ffrs3FLIMwsJlTIE92d2w6QrB7N5noOXsxW0AhsBMePLiRo/HPjoQE/jDknFjidXWmU27nvwkbbj040F572KwOw3QQbMrepq11XjxjPe9OPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R5qZRM9CuV1j92lo9WPHutz9AyB/SJ2tmFPd/aJKHVY=;
 b=G6ENACRhR6l0poNScCLaku8Hz0PprL4JX71gU0fA8elZ+XM3KUklJb/6vKRSXJJ/1R925N9pMFq7A/4xwJm/qabdRzk5pkjhKSSgtWfWIdXgQwpM///Wp/w2LARqXhNNVhKV7j7oiIZH6YIZMi/vnbH+Oqo/IcubUJ+qiGz0IqiaHEE59YAPXQgVP9yZkw77vdnQzBrnlAx8Rg5TgLm/uLdhBH2x14pnpCntbsRdEr9X6gjebNglzhyBzxWCJREnVQ2rD/ZyC/n1jDhaoi0LdnxveSqtAK0RR6g2cPtTGfVZmIH8aXagdMOfewbJ9Iihdm7x6O3/Z5HhBcIRuF5UIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from DM8PR02MB8198.namprd02.prod.outlook.com (2603:10b6:8:4::7) by
 BL0PR02MB4356.namprd02.prod.outlook.com (2603:10b6:208:41::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5186.14; Mon, 25 Apr 2022 08:23:55 +0000
Received: from DM8PR02MB8198.namprd02.prod.outlook.com
 ([fe80::15d6:317e:e736:e9ad]) by DM8PR02MB8198.namprd02.prod.outlook.com
 ([fe80::15d6:317e:e736:e9ad%5]) with mapi id 15.20.5186.021; Mon, 25 Apr 2022
 08:23:55 +0000
From:   "Linyu Yuan (QUIC)" <quic_linyyuan@quicinc.com>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        "Linyu Yuan (QUIC)" <quic_linyyuan@quicinc.com>
CC:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "Jack Pham (QUIC)" <quic_jackp@quicinc.com>
Subject: RE: [PATCH v5 2/3] usb: typec: ucsi: do not allocate one extra unused
 connector
Thread-Topic: [PATCH v5 2/3] usb: typec: ucsi: do not allocate one extra
 unused connector
Thread-Index: AQHYVfaGbzqgVrkTVk6KghisfL1e7a0AwiqA//+NXTA=
Date:   Mon, 25 Apr 2022 08:23:55 +0000
Message-ID: <DM8PR02MB81981793F2E9A2BB672E0983E3F89@DM8PR02MB8198.namprd02.prod.outlook.com>
References: <1650597022-19793-1-git-send-email-quic_linyyuan@quicinc.com>
 <1650597022-19793-3-git-send-email-quic_linyyuan@quicinc.com>
 <YmZYNWewOiHNu+9D@kuha.fi.intel.com>
In-Reply-To: <YmZYNWewOiHNu+9D@kuha.fi.intel.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=quicinc.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 03d4e738-d21e-41f3-58b3-08da2694f01a
x-ms-traffictypediagnostic: BL0PR02MB4356:EE_
x-ld-processed: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d,ExtAddr
x-microsoft-antispam-prvs: <BL0PR02MB4356B60B13EEBB4BE0922CD79FF89@BL0PR02MB4356.namprd02.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: tBmcuYIOhn+Of768ZbpT6FBt2UeyVCBkiPpMsrEfIByKhgCz1xBrlPX46f7nxxDwTQDaSOUMVduHZg02CtsKEsQF2eSOpF670JcPRwz3PZMYer3TLG0T99deawYwS29lGIy7IxmPLUce1Rlk6HCYvjNX8GayQtZaaSpqhIRd6bv/+LfpWHXH/tliegqMYWaFUli7f43s4fxG2/Pu5xY3iyFMLddLz5xaIydeffdTq+0bYID+ImVvB0KSUNGE4EJpTIMMD/BIEQXS08x0X+OK7eOAnh+Y2kJB5yT5Up/kLmx3vAPkjsdLdm7BbOPnti2os4uTZDpG2/pYh4fZkGahmER9v18IIFyADelzFlIStHU4b65W/QcmUZPUaSjGiff+nJkf1Z3fqevtgIIutqoWsp/RzcFw5pselmG0PgzIriFyGXXqq0BXKwRm6XaRkCJXN4XYd/ZkR9Vaui/M8lZ5xQc8iuMhnKdi1Qjj9uhtiA+db45OrphFooh/7xOFs6W45zkzy+MllQjF2lm5X8eBLHcyq1VkjqZ+T4qOtfFs48GRXu75yJbBx2RDSyOiu5HYSkQAJOAlkavwM6NstABBad3WK/IMJehV5UI9oZsT1OlvOJ6KWF0C6UWm8gZ6nIBOHZ2OZgfVmFcRpWQcVeI1RjmMOVPzGex7yElP2pMcZ76gzyAZR2kupHkwkRgz4o6u/mPGdWCuhs8TaRSzBe4Hhw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR02MB8198.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(6506007)(2906002)(7696005)(5660300002)(53546011)(107886003)(186003)(8936002)(9686003)(83380400001)(26005)(508600001)(55016003)(110136005)(4326008)(316002)(33656002)(54906003)(122000001)(52536014)(38070700005)(66946007)(38100700002)(71200400001)(66476007)(8676002)(66556008)(66446008)(76116006)(64756008)(86362001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?dRZoMt9C5favXrKHO+BNFn1wt3Q1Gn9o+p8sVeoqmVf/Hiph1T1Q5JVBwMhd?=
 =?us-ascii?Q?CONI+sKi5Fq2TpUoUY/12wuf6Yj2xhqFbf3AI37P8VpP1YL09OK08Vl+wSWc?=
 =?us-ascii?Q?iwGOgs6fHkXX6YjaxSGknF7tXIqiYRGz6w+B9swP0IAkv609ppiWISS8i1ww?=
 =?us-ascii?Q?2gtkMn3ECR62aE9URTXnVeryuY9lBInTW2/rCqekSoztx7WmD95lkFPTHx93?=
 =?us-ascii?Q?kDflqtuFhdZ755w28SWl2eBfYxoOt0SX0ieNVk7gdFvRIHIxODxOGBYZZZoi?=
 =?us-ascii?Q?6n+GopeSjjc21Ytf+gSX9mlO3RrlZleD7BNZTqZ2wiMwJfICU5vlpLOAF/pN?=
 =?us-ascii?Q?CGgrrxkThFPHdZq0wegLBkuolwN2wNZ7jghXPndKYk7OxTVnLNPhJSQgtdjq?=
 =?us-ascii?Q?wOBdk07wIMAspnkuYqIQXrK4EvkVOOFzeAOmPDoCjj1kLzhIsAFJR5uG0SEV?=
 =?us-ascii?Q?fa4b2p/8pqZFGxUGlzxlkunsC02fFlFK5qQap3mTWHb6ra9iB82s8bA3taEf?=
 =?us-ascii?Q?CSihQgMjCbdm1HKhPdpLNu2oKkxY9DMp0kzEbVxnBgn5tld6ZOJNbGb1RJNb?=
 =?us-ascii?Q?OIV2ZHOjHEz+/vEr5IwHqcCgmVtGu3VM+pN6iFAxTjkGHT69HruCzstmHKAu?=
 =?us-ascii?Q?H1IIeE86Jad1vne1mXGMFhTNuPU2FHrM/aI3qkcmkv0RO5KK45mi8E13qZ9L?=
 =?us-ascii?Q?9/T2M9Xr/E97fd247E0N8lHSgUhu+n/py/Fpqaxb0vgoj5OyIZUsDaA+OU2D?=
 =?us-ascii?Q?t22qtEycQvx9VXZg61SkhV5Z9xZWoODZXlPt02Cmg0WJFRA4wABIKhkgYSNo?=
 =?us-ascii?Q?jAc4VfORJe7DphcLTth4xFiWXmWOTmdxBW8MFMACRUf+z5Q5W7GbCr7AvyuU?=
 =?us-ascii?Q?rEI2DazvQl77Uge0u4KC5LOpWsxFkqis7eOJHucHOl7ug9+L0Mb+F1WKJzn6?=
 =?us-ascii?Q?mV4y+SanQ8EohLEAbNSCeOIa4X8edP5/orDSk8GhHRIjPT7pCpZfrfRLG48Y?=
 =?us-ascii?Q?oX72/Z7k1PJuxbZZfUwm1qXHpmxgGKiiNLVojNFl3bHx0oMT3TvNyIT7lZLb?=
 =?us-ascii?Q?qYguPsMzGA86ZXXG0lEQgCIq9CEu0KzqoY2OiB+kKpkeUhjw36JyCwy0x+ah?=
 =?us-ascii?Q?jGOhpoivUP5X7h9ZJDy0osioMCXu5y6tY1XMXN/PnvAXNYr7rqojyVV+yJ8F?=
 =?us-ascii?Q?4ni8nC9Zy2CT/GCgQArZxU3TU05x2Lxg/ZNAuq92HSkavMmF98qyuNdvwdfD?=
 =?us-ascii?Q?vyPIChNjDBa4h/rgCrqXl/Eh3BFfmrd3CsJczmC1DvfTdW0TUVvoYrklDUY2?=
 =?us-ascii?Q?Njne4DOBBkVCcZlrRHqlROdPTl9XAMyr6O19qicph+s5m4u4BalMzr/E6dY9?=
 =?us-ascii?Q?F9JsLHmSqKPp0b1a1TsoKqLo8Wj3FxK0I0rL/9Z2z75coajgE3YlNz1UGtnK?=
 =?us-ascii?Q?wFACqeOltt86wmwA62v8jGzec96ims4WXOdpW/dDDVhGPdmxyFGvLcb0wdbC?=
 =?us-ascii?Q?SdedL/ZLKq+vmE6buo5B3qiRfAhP/fm6k+A5rpGIlq6H2jPDTRdYc2JhVxei?=
 =?us-ascii?Q?naPHAJaP65/8ycMJcmZl9fXUZDmzBoGHnYW9S+xAMaJua77Zb2GfX19WSYh/?=
 =?us-ascii?Q?kCloL1O5t29dHOqhoCJwrYyGBp3Di3bJ5G3gwdWKAiEr6+MiNkocJt+41Yt8?=
 =?us-ascii?Q?8JH4gVvAMJGXETLPHPiqqjiwuVnEKAd6n1snOKowkPewCY7cvQo7Bx6dE2xC?=
 =?us-ascii?Q?yxeyGIh/yg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR02MB8198.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 03d4e738-d21e-41f3-58b3-08da2694f01a
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Apr 2022 08:23:55.1151
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jjxMkH8yG/nwAhWmGq7Ev7dHLFPHRncgEkHnezUdxUCaOn3f9u/4xw1oSSGwEkOz4VZj5k4YL7vYd0DFU+KE10CL4ZsbzKceykL6s4iO09Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR02MB4356
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

> From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> Sent: Monday, April 25, 2022 4:14 PM
> To: Linyu Yuan (QUIC) <quic_linyyuan@quicinc.com>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>; linux-
> usb@vger.kernel.org; Jack Pham (QUIC) <quic_jackp@quicinc.com>
> Subject: Re: [PATCH v5 2/3] usb: typec: ucsi: do not allocate one extra
> unused connector
>=20
> On Fri, Apr 22, 2022 at 11:10:21AM +0800, Linyu Yuan wrote:
> > In ucsi_init(), it allocate number of (ucsi->cap.num_connectors + 1)
> > connectors, there is one extra as the ending.
> > ucsi_unregister_connectors() is safe to unregister all ucsi connectors
> > according ucsi->cap.num_connectors.
> >
> > Let's remove the extra one connector to save memory.
>=20
> Maybe you could just merge this one into the first patch.

Sure, thanks, will merge next version.

>=20
> > Signed-off-by: Linyu Yuan <quic_linyyuan@quicinc.com>
> > ---
> > v2: new change
> > v3: no change
> > v4: fix a typo extral -> extra in commit description
> > v5: update commit description
> >
> >  drivers/usb/typec/ucsi/ucsi.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucs=
i.c
> > index af9a2a1..ce9192e 100644
> > --- a/drivers/usb/typec/ucsi/ucsi.c
> > +++ b/drivers/usb/typec/ucsi/ucsi.c
> > @@ -1251,7 +1251,7 @@ static int ucsi_init(struct ucsi *ucsi)
> >  	}
> >
> >  	/* Allocate the connectors. Released in ucsi_unregister() */
> > -	ucsi->connector =3D kcalloc(ucsi->cap.num_connectors + 1,
> > +	ucsi->connector =3D kcalloc(ucsi->cap.num_connectors,
> >  				  sizeof(*ucsi->connector), GFP_KERNEL);
> >  	if (!ucsi->connector) {
> >  		ret =3D -ENOMEM;
> > --
> > 2.7.4
>=20
> thanks,
>=20
> --
> heikki
