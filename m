Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CC3DD4FF79A
	for <lists+linux-usb@lfdr.de>; Wed, 13 Apr 2022 15:28:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233425AbiDMNaS (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 13 Apr 2022 09:30:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34464 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232537AbiDMNaR (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 13 Apr 2022 09:30:17 -0400
Received: from esa.hc3962-90.iphmx.com (esa.hc3962-90.iphmx.com [216.71.140.77])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2EE765D5F1
        for <linux-usb@vger.kernel.org>; Wed, 13 Apr 2022 06:27:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qccesdkim1;
  t=1649856476; x=1650461276;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=pKQuBEXjOaUF7RC3Pm9x1y2NppiZxx2JMWZBED8h4ik=;
  b=dVmOQqX4nxFgMRTEl/bt7UeT04WJgeb/ZJ8VAf+a06Qn50NjM+N1y2Xv
   /Wo95Of7IqTTxLhoHU+yiM+AHlJc/v7a0NTYcp6DcsJZ6fboO+uqDDbhZ
   2tG2YYZw+XZLLgLwz0oq+XOWZh01SmLtnKM51b0cOjbEdkAf9JUOt81BI
   I=;
Received: from mail-co1nam11lp2176.outbound.protection.outlook.com (HELO NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.176])
  by ob1.hc3962-90.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2022 13:27:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i10gDiXPw8NIsefua0DYvBGXGiDP+UdkgVA9XPHIrtTYLMGYMkgP1iaTgbF8sY3He5vT0OlOEYcGhJTegt5P3WctKEd6Ji1HVHeRsNctQnMrXuGOz2uwtXfmNCyO9t/WM7BFnBxeY8NTKoSnFU87leGDV5ZQuP95Ow6mwv/vr43LmRzcNBf+38ncQXTa3bSxK6WUmhk5QpExh+z4TaQR/h3u8SLgD/yxAdo6ocBYZCCBesYlGTKcuPijSEw6jDXmc98c1t1m3HMZi7qOC/hDVJeb19aqVIVQRFTvNbOw6ZaVaGNOyg77RoWN0YAKE5169G5y79CV1Pw+trTyHOTr2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pKQuBEXjOaUF7RC3Pm9x1y2NppiZxx2JMWZBED8h4ik=;
 b=SJKPMQkKOjHNrQjAdYenxGQrI9pplNognWzS4FYp+RI1gCCZmJoP/VcithNv6A3CqyNaxXol9bF0J+eZB+iRoki+DMYxhExhsz4jVqYE1MHWtfFPI40VWOjjFjMQUSNeOvrhRlo0//BuqKDIN81p3DeZ2YWZt3HSw7Q4cjJUE52xFNy9D59HGQIje+bLa/n6pvKtk5WznArwrR2iZaoFwZv2tbkP+2NeAXzg6tkDEx6nw2Zm8gqEY0+cbtA6nRRzL82/ejkq0Fg4cU3qSu5M/k6FLrCr3ON5D5x9Sv9YV+kZJBowpdHsyVUI2N0Z5dZTxMBg76P6O2kgD3uNkTqnVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from DM8PR02MB8198.namprd02.prod.outlook.com (2603:10b6:8:4::7) by
 SN1PR02MB3822.namprd02.prod.outlook.com (2603:10b6:802:31::32) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5164.18; Wed, 13 Apr 2022 13:27:52 +0000
Received: from DM8PR02MB8198.namprd02.prod.outlook.com
 ([fe80::15d6:317e:e736:e9ad]) by DM8PR02MB8198.namprd02.prod.outlook.com
 ([fe80::15d6:317e:e736:e9ad%5]) with mapi id 15.20.5164.018; Wed, 13 Apr 2022
 13:27:52 +0000
From:   "Linyu Yuan (QUIC)" <quic_linyyuan@quicinc.com>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        "Linyu Yuan (QUIC)" <quic_linyyuan@quicinc.com>
CC:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "Jack Pham (QUIC)" <quic_jackp@quicinc.com>
Subject: RE: [PATCH v3 2/4] usb: typec: ucsi: add a common function
 ucsi_unregister_connectors()
Thread-Topic: [PATCH v3 2/4] usb: typec: ucsi: add a common function
 ucsi_unregister_connectors()
Thread-Index: AQHYTx0Dc3wvnkQxNEm3ijXhHJLFz6zuNZkA//+dchA=
Date:   Wed, 13 Apr 2022 13:27:52 +0000
Message-ID: <DM8PR02MB81985719835CC9DC2AAF1E6EE3EC9@DM8PR02MB8198.namprd02.prod.outlook.com>
References: <1649843891-15554-1-git-send-email-quic_linyyuan@quicinc.com>
 <1649843891-15554-3-git-send-email-quic_linyyuan@quicinc.com>
 <Yla9VGMpcDcpJR0f@kuha.fi.intel.com>
In-Reply-To: <Yla9VGMpcDcpJR0f@kuha.fi.intel.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=quicinc.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 34e25f10-7437-42c8-44b4-08da1d51698a
x-ms-traffictypediagnostic: SN1PR02MB3822:EE_
x-ld-processed: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d,ExtAddr
x-microsoft-antispam-prvs: <SN1PR02MB3822C519111850E8B32E0ACF9FEC9@SN1PR02MB3822.namprd02.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0F4tpDRg8uwf5Izpqoa57d+dJmeBGyv53JfViUkXcwxfIvtY4Xu1fxv6j12sNCzdLwXViR/Pb30b4T/AFY2n3zASr0AyyNkqCvpdx/5c4oxTKohgWqotAMQpr8ZMue6YvOKWcAsC82tn5OCPHzbMT3FAQpEgasb8XmjKjQgE6biejVVgEW6TvCB/3+/37mAWwV90Fa8y3k4npSkbH5qNHSc0NI/vKpkb8amhdiANnECgnPu+CP1svuMKmEH7ZMef8qdJ6bfSxY9O6Jr2ZbkJXYAUWwV5oreNAv3d62b0qH1wdUa6LKwunDnSntS0ynDwUpjYTb+qUMnq5K4PsU2M+ygDdgSMfJ2yfFVjwuC1LTcDUjnr+EyDcUimYclYRw96vYOLhrhqe/fKedENrXgUZAp86LiL56cdYVDXGmQHWsURXK76GGXcDtdsSHS8pyTD+KY0jiDNsc8XK11E/ZeNxTIIjq0K7CUc8l+tnMipO6EKCmdQvE6MoeehrO+5o18xyBuUOO+EQGwVq6k/nW2j6tUxG2J/xR+lCdqwIvRzli1zXAQ08GuUwcljY0MRY2eEIr6WV6n55br1ltOxQt038Jtcgbu0LT94E2iGhssiLWtJJ1Hlu2x6wqH+uoXIcmXi/6vAdHmpbRefPb6ZQaF9LLiT61wc2gRJ3obBxHSQV5iY/xlRrc6RI1bSQxBp5O8jc17pSBHOxtjA9CqOm/kwbQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR02MB8198.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(8936002)(5660300002)(66556008)(71200400001)(2906002)(66946007)(186003)(26005)(66446008)(66476007)(64756008)(4326008)(8676002)(83380400001)(52536014)(55016003)(33656002)(76116006)(107886003)(316002)(110136005)(508600001)(86362001)(38100700002)(9686003)(122000001)(7696005)(6506007)(38070700005)(53546011)(54906003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?9aUKavArja1Wb+ChMt9K7qrAm5SZDvbazIlU/bsSZlJpy/Qr+qGHbw3HQV2w?=
 =?us-ascii?Q?zA9OdhNTBF7wRYWueq2wn+38N/2rCZ/watKlkVfDfWQq+lUX50W9ABx9cNuA?=
 =?us-ascii?Q?sz+3PlQ1EPJk/UhpM866euZ+v9HfbiMKtlh+FTL7ViNdQsmIFTsXZnnougVP?=
 =?us-ascii?Q?P034vB9gP97L/u+rqgRn81COWIjS6bAp39ZaX0F1b1qAhwJdzg93jI4N/r3W?=
 =?us-ascii?Q?JsZlGMRMSzGIkHiqpyr7y+C9aRaIHR4xRWvFeRJVS7vKwSlmCrxrmtaKbOlR?=
 =?us-ascii?Q?WVoFrwVCEnfhblklDDh6MDZApOmptt8YY5y9S5k+H3/FJOvXdiZAe+dP//zy?=
 =?us-ascii?Q?7KGif4bh8D/JH27WoSpRNox1EMa12fnJvA1JEOYIIpDIVp/87DRub+CYwaIC?=
 =?us-ascii?Q?mLIaM4nWitYpEiwMu9Glg7VQrl9m/ytmmnU0JW4/juEmOvf8nbxUxNQnNlgF?=
 =?us-ascii?Q?oy47VKlTFdfXnlKTTWtuBAScqOqkijaqoYRjs1mkwLBrGz8ZXAaXgwVvzjVY?=
 =?us-ascii?Q?BLy2d+ifJAx/HIgQFGvmqu1SIc6sTvU2WtCuiI0zgr+xJLwyrAnO60116Dt9?=
 =?us-ascii?Q?283SKqtwxYYpD/U1cZ/v2iiOqfAV9yX8OwF1kZjFhk3NP4KUWjOl6ND3X2qc?=
 =?us-ascii?Q?lHhAYd7S4pebjtbIjf+tLfFUEYofwlLI6c8r6+V9j1zK2X72ZqlPceSO3OWq?=
 =?us-ascii?Q?Fa0UXb8e2bZFMjDbsXEpKQM+rtLsWpVmNPJ6u6fBqYyW/UyVqOYYJW0j0Ry9?=
 =?us-ascii?Q?+RyTTIJ7sYIowuLLRX6CSVybDM6KBSxW/uM4ZLoMZ7pi2a/2hz2m4wK9Q+XQ?=
 =?us-ascii?Q?Xpukho1L+iG2KxzI4iB54Pl+qCjq5e5QFL2WD/0qMtxATvGLDB+1M/RV79f9?=
 =?us-ascii?Q?FdtjKvx7/x+//Xgmz3jFh0m0p1Br4ZlBDhBIMq6O/k+NQd9Y7fQwJ/SQUOlC?=
 =?us-ascii?Q?Yb5vSsgsRiCYUthWpUwrVfHpJMazRROB8K2G7penvIwB8VPh40jd5hJUCOMa?=
 =?us-ascii?Q?41Y6AXVHqRDgbDZrKJ6ioeR3ok9qEfTeznII/n5TO9Vwkuia9r07vIadHer5?=
 =?us-ascii?Q?/7U4ZmbTOP7NK7bdhj9AZn1GdId5u+FKtrNGKMSkfg1UQCvmb54TxHhcwKO0?=
 =?us-ascii?Q?Rq5p4woW53SRzS7E4jvcqcPK6kuMRpI8iy+wb0xEjDAkvXDVdfmCxfx6Dg8m?=
 =?us-ascii?Q?I6jXC8RSUn6o2fIrZxCBYYdV7r2AFRPfb7CLmti19/NBP+zVSUR8Ni0k1g7B?=
 =?us-ascii?Q?HqDuFGJdZCE/j2p978bpSwrbk6zpl5qasdLa4xA34I6dBpD0owYNkpD9y2II?=
 =?us-ascii?Q?9X0AzwdYtVSPvFk3KUIQgSNpinBaXeA+mw8Fg7W7hilaoAQ0ZHYbn4R2gM0k?=
 =?us-ascii?Q?onRZTWNpJPJYp5dbTHUDuR2oI0dTPl7sSq1eZRA9+g+fPCkQQryS8xpMW/6b?=
 =?us-ascii?Q?2OEcnfEOVwE5w6ptJYImFUPKVvgzv6phEp4ud+r+Qcge/zbw5cTcFNKmn3/V?=
 =?us-ascii?Q?N9hHXlb6VtpOOnRIqqRB7HD91dr0IPBk3QPm0HGiSLTsn3gKoyJK8IFE1ys2?=
 =?us-ascii?Q?ixMuCZY5VYxdAdbWsW0zS+XAreeacXgzTf8hTK6jv9hCQ4X7BVobeoXQjW2d?=
 =?us-ascii?Q?vGiXgmgof1qoBvYk5RE2AHvxYpMqWyIRFifqcH8uj3GEo4nA8L7EchJpg7WP?=
 =?us-ascii?Q?8CvfrQndrc1ccuUKVWjJm8sj5T4SIIaFDXtYskO0IGKJjFqvvnjkqXW0OooF?=
 =?us-ascii?Q?cFqjeEb9Vw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR02MB8198.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 34e25f10-7437-42c8-44b4-08da1d51698a
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Apr 2022 13:27:52.5322
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DQ8rfsCUw8BRF9t11+k88JeM0GzUC4knC4lhs1kmKagg8m3FK7h8qPubFEcCHdIcxhgWW7m9X4zO3pRi43iUo+z/siM1zEgBfmdIv2CLNgw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR02MB3822
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

> From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> Sent: Wednesday, April 13, 2022 8:09 PM
> To: Linyu Yuan (QUIC) <quic_linyyuan@quicinc.com>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>; linux-
> usb@vger.kernel.org; Jack Pham (QUIC) <quic_jackp@quicinc.com>
> Subject: Re: [PATCH v3 2/4] usb: typec: ucsi: add a common function
> ucsi_unregister_connectors()
>=20
> On Wed, Apr 13, 2022 at 05:58:09PM +0800, Linyu Yuan wrote:
> > In error path of ucsi_init(), it will unregister all valid ucsi connect=
or,
> > and samiliar operation also happen in ucsi_unregister(),
>=20
> Sorry but I have to confirm this: with "samiliar" you mean "the same",
> right?

Only one small difference for original code which is no cancel_work_sync() =
of each connector in ucsi _init(),
But in ucsi_register_port(), we get role switch after connector work initia=
lized,
So I think it is safe to call cancel_work_sync() to connector work if role =
switch return -EPROBE_DEFER.

>=20
> > add a common function for two places.
> >
> > Signed-off-by: Linyu Yuan <quic_linyyuan@quicinc.com>
> > ---
> > v2: improve ucsi_connector_clean(), check total number of connector.
> > v3: rename to ucsi_unregister_connectors(), suggest by maintainer
> >
> >  drivers/usb/typec/ucsi/ucsi.c | 51 ++++++++++++++++++++++++-----------
> --------
> >  1 file changed, 28 insertions(+), 23 deletions(-)
> >
> > diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucs=
i.c
> > index 77ac0b7..af9a2a1 100644
> > --- a/drivers/usb/typec/ucsi/ucsi.c
> > +++ b/drivers/usb/typec/ucsi/ucsi.c
> > @@ -1187,6 +1187,32 @@ static int ucsi_register_port(struct ucsi *ucsi,=
 int
> index)
> >  	return ret;
> >  }
> >
> > +static void ucsi_unregister_connectors(struct ucsi *ucsi)
> > +{
> > +	struct ucsi_connector *con;
> > +	int i;
> > +
> > +	if (!ucsi->connector)
> > +		return;
>=20
> Can that actually ever happen?

Consider a case, ucsi_init() failed, we will call ucsi_unregister_connector=
s() to free all connectors,
After that the UCSI implementation like ucsi_acpi call ucsi_unregister() ag=
ain,
It should not unregister connectors again.

>=20
> > +	for (i =3D 0; i < ucsi->cap.num_connectors; i++) {
> > +		con =3D &ucsi->connector[i];
> > +		if (!con->port)
> > +			break;
> > +
> > +		cancel_work_sync(&con->work);
> > +		ucsi_unregister_partner(con);
> > +		ucsi_unregister_altmodes(con, UCSI_RECIPIENT_CON);
> > +		ucsi_unregister_port_psy(con);
> > +		if (con->wq)
> > +			destroy_workqueue(con->wq);
> > +		typec_unregister_port(con->port);
> > +	}
> > +
> > +	kfree(ucsi->connector);
> > +	ucsi->connector =3D NULL;
> > +}
>=20
> Another way of doing this would be to just remove a single connector
> in the function, and leave the loops to the callers.
>=20
> static void ucsi_unregister_connector(struct ucsi_connector *con)
> {
>         cancel_work_sync(&con->work);
>         ucsi_unregister_partner(con);
>         ucsi_unregister_altmodes(con, UCSI_RECIPIENT_CON);
>         ucsi_unregister_port_psy(con);
>         if (con->wq)
>                 destroy_workqueue(con->wq);
>         typec_unregister_port(con->port);
> }
>=20
> I wonder would it actually be a bit more clearer to do it like that...
> I'll leave the decision to you.

I will keep it,
There will be no duplicate loop entry in two function, a little lazy.

>=20
> >  /**
> >   * ucsi_init - Initialize UCSI interface
> >   * @ucsi: UCSI to be initialized
> > @@ -1195,7 +1221,6 @@ static int ucsi_register_port(struct ucsi *ucsi, =
int
> index)
> >   */
> >  static int ucsi_init(struct ucsi *ucsi)
> >  {
> > -	struct ucsi_connector *con;
> >  	u64 command;
> >  	int ret;
> >  	int i;
> > @@ -1250,15 +1275,7 @@ static int ucsi_init(struct ucsi *ucsi)
> >  	return 0;
> >
> >  err_unregister:
> > -	for (con =3D ucsi->connector; con->port; con++) {
> > -		ucsi_unregister_partner(con);
> > -		ucsi_unregister_altmodes(con, UCSI_RECIPIENT_CON);
> > -		ucsi_unregister_port_psy(con);
> > -		if (con->wq)
> > -			destroy_workqueue(con->wq);
> > -		typec_unregister_port(con->port);
> > -		con->port =3D NULL;
> > -	}
> > +	ucsi_unregister_connectors(ucsi);
> >
> >  err_reset:
> >  	memset(&ucsi->cap, 0, sizeof(ucsi->cap));
> > @@ -1364,7 +1381,6 @@ EXPORT_SYMBOL_GPL(ucsi_register);
> >  void ucsi_unregister(struct ucsi *ucsi)
> >  {
> >  	u64 cmd =3D UCSI_SET_NOTIFICATION_ENABLE;
> > -	int i;
> >
> >  	/* Make sure that we are not in the middle of driver initialization *=
/
> >  	cancel_work_sync(&ucsi->work);
> > @@ -1372,18 +1388,7 @@ void ucsi_unregister(struct ucsi *ucsi)
> >  	/* Disable notifications */
> >  	ucsi->ops->async_write(ucsi, UCSI_CONTROL, &cmd, sizeof(cmd));
> >
> > -	for (i =3D 0; i < ucsi->cap.num_connectors; i++) {
> > -		cancel_work_sync(&ucsi->connector[i].work);
> > -		ucsi_unregister_partner(&ucsi->connector[i]);
> > -		ucsi_unregister_altmodes(&ucsi->connector[i],
> > -					 UCSI_RECIPIENT_CON);
> > -		ucsi_unregister_port_psy(&ucsi->connector[i]);
> > -		if (ucsi->connector[i].wq)
> > -			destroy_workqueue(ucsi->connector[i].wq);
> > -		typec_unregister_port(ucsi->connector[i].port);
> > -	}
> > -
> > -	kfree(ucsi->connector);
> > +	ucsi_unregister_connectors(ucsi);
> >  }
> >  EXPORT_SYMBOL_GPL(ucsi_unregister);
>=20
> thanks,
>=20
> --
> heikki
