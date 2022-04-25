Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3924250DB13
	for <lists+linux-usb@lfdr.de>; Mon, 25 Apr 2022 10:25:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235172AbiDYI1G (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 25 Apr 2022 04:27:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235750AbiDYI0f (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 25 Apr 2022 04:26:35 -0400
Received: from esa.hc3962-90.iphmx.com (esa.hc3962-90.iphmx.com [216.71.142.165])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A9251CFE1
        for <linux-usb@vger.kernel.org>; Mon, 25 Apr 2022 01:23:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qccesdkim1;
  t=1650874998; x=1651479798;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=CYmUj7b8qN+U0pKVVx/D5Ze9GHL1HwR7htHlL524qEI=;
  b=TARL/iV/MinLyClAIYlUaz1IXzRhq4hk2OPTCveRCAemn+YlDrE3D7uQ
   QSg4uK48Ue8zbCCGTdrR2v0GbzzB8SjXx3bT5JgnZLwRhP6UPVbiCsf7Y
   jetMsRRrFxHHP3D9cVstApkXNpMpon82PfyG4NNMD5oIJ/z+9DQa5d8w/
   A=;
Received: from mail-dm6nam11lp2168.outbound.protection.outlook.com (HELO NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.168])
  by ob1.hc3962-90.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2022 08:23:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Pmgbv31tV1Sh5C7QNedZhn4rJGDrP56yY317MZl2EAGuOCsJUctVkoMGM8uhPkwQR/4jqsV+wMImw7MV9BH9AdYnfQdU8CS93IHCHJWxRZ4cAv0XrN1j/8AgRRbRZ1FVZLp/Qc3ksAJwt7B+YIE+kPF/3Z8a2ZNrNRThD+OnWqvYe9L7MmucvcdTAC+2NcZhDMYGn+yIdwHYmOpd/PmcrqEZNf5crms9B+6vBVutwOlEWFGQ4hsSXfMbfbm6U/S1fcsuMfBlyNJqSNbvnuVJWluJaadDVh8xQWRxkfZ0WYTcc5XmpT9aVHmlcTPs9qRO7pzunKgiy4f5ctxZ2I3QUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CYmUj7b8qN+U0pKVVx/D5Ze9GHL1HwR7htHlL524qEI=;
 b=V6iJgl6U7A2l7Ar7jI6G3CLVkW1cePO7bcLHII4SjmuV0c2+0Ouur/4e+ym4oW6biL1taGvTILM21ubaCddyIobaJfObCivKPQ8Aya3mt5rbRZRsAW6NzMjOMDG7Fpgb0DgN0OCdfQ6SFCU4rsL8ox4sCB6caZQW5tPG32VT2jPQxlN2Fk+HzqD+r14pjXeXhbJ7FXfGGMU9I4RgGeC83aI3iYCpxCRUsBL+pb4Cj8qKY+GWIMn5Uvn4Ki5a+KHADuIYAfTeY1fENGUNxg0CYY8aq1FNvofRhCEJMZqCfJJQbu6xfVFTmxzg9fmtco1qkgiSsjg+Qg/Is3w/JQ/zUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from DM8PR02MB8198.namprd02.prod.outlook.com (2603:10b6:8:4::7) by
 DM6PR02MB5900.namprd02.prod.outlook.com (2603:10b6:5:152::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5186.15; Mon, 25 Apr 2022 08:23:15 +0000
Received: from DM8PR02MB8198.namprd02.prod.outlook.com
 ([fe80::15d6:317e:e736:e9ad]) by DM8PR02MB8198.namprd02.prod.outlook.com
 ([fe80::15d6:317e:e736:e9ad%5]) with mapi id 15.20.5186.021; Mon, 25 Apr 2022
 08:23:15 +0000
From:   "Linyu Yuan (QUIC)" <quic_linyyuan@quicinc.com>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        "Linyu Yuan (QUIC)" <quic_linyyuan@quicinc.com>
CC:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "Jack Pham (QUIC)" <quic_jackp@quicinc.com>
Subject: RE: [PATCH v5 1/3] usb: typec: ucsi: add a common function
 ucsi_unregister_connectors()
Thread-Topic: [PATCH v5 1/3] usb: typec: ucsi: add a common function
 ucsi_unregister_connectors()
Thread-Index: AQHYVfaFa/bwomqnK0SxGxRa8O0ot60AwQyA//+N/2A=
Date:   Mon, 25 Apr 2022 08:23:15 +0000
Message-ID: <DM8PR02MB81987FC690B8A65D8C6CDCC0E3F89@DM8PR02MB8198.namprd02.prod.outlook.com>
References: <1650597022-19793-1-git-send-email-quic_linyyuan@quicinc.com>
 <1650597022-19793-2-git-send-email-quic_linyyuan@quicinc.com>
 <YmZXRQYPQe6KQf0m@kuha.fi.intel.com>
In-Reply-To: <YmZXRQYPQe6KQf0m@kuha.fi.intel.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=quicinc.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 88346fc5-d056-4612-4645-08da2694d83a
x-ms-traffictypediagnostic: DM6PR02MB5900:EE_
x-ld-processed: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d,ExtAddr
x-microsoft-antispam-prvs: <DM6PR02MB5900182E4A771D9C0FD82BA79FF89@DM6PR02MB5900.namprd02.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: p9B9RU9kNeLawmDx2YAHpHM4LIdq5KeOzzAB6HLmZMLia8oljEoSsQvviZrr1fOcR+n/yd2P3T2KQi4gzEEDYfdklTP/p9bN5UzzT2CnkSjOzsTDpuciABh99jFXAJnpzrblQDwOyJntWRB5iB17B15mKA6BvyGbBtlsph/dcJCmtzu7kpDk17FsnetdDWTJUi1Sx1nIqrky6rHph8Hjf9Ut2BLQLJoTbk5hU5cVuS4Em+QwpdtCafAUv0qJ6btOVPSy21AOEcsFfFsF/ZH95FhAhevi/9sjRAn4ZADognS+oVsoVU+0NpYnLNbnJTICqVqG9pAsmK7vEpozuEUuzHve++yGDuNndPZT325Loj86Lmi4dF03KImUyix10O/Ex2fERgBUu/JtjM3wTLGL8bx1CYQdUplRwcAGl8iJkQGCA+g4bxSNvot7vrXPY6O8cht1myYG06+TuPAyD7V9/HcznrTuDHqZzO03blDSDO4DRlPr7NKf+odTU+tOH1tGiIZPTAA0+CR/d35gR7163DJR0Y94suJzZ8ViL07AdYuXhxHdbklkdwVdJr3jd2RS3b6BVVP+iQLtkkkgJOihpcyspGujSh1PYv4ZIP7yjvLODu+MFXAx0xwMC0VmyygkDnJNnua3bBMXxlorhJqw8bT9iZSwsO3CJnjBmH0h4Cw3y12cXHUkIY8xQh2ChJ9DatqnYwFY9N6YhvIxsBYBHA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR02MB8198.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(83380400001)(38100700002)(38070700005)(122000001)(6506007)(7696005)(9686003)(53546011)(71200400001)(316002)(26005)(186003)(508600001)(55016003)(110136005)(54906003)(52536014)(2906002)(8936002)(5660300002)(107886003)(66556008)(8676002)(4326008)(66446008)(64756008)(33656002)(66946007)(66476007)(76116006)(86362001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?rR6tzk1fJW7SC66s7zSGhrVYjq7NVOv950yTUyJp2OxXRFtI0QkEtY3q9Xgf?=
 =?us-ascii?Q?MM6RY+bzQ76RXBQiDq6LAPuKkwmDAq/zFpnq0hhgf5buCWdtS5MGjrF/fiuT?=
 =?us-ascii?Q?qhGtNOngboKmS8ia3HTDTpwkvDQKMFozf6D5oE/uxqF4au/E62hI0j+VwmBE?=
 =?us-ascii?Q?eLfBZjwRrUrTOYZ7uySI8G+1NM4AUemAZ1Gl+Ntl0aZkXRwMEmfVL4Zd/d/s?=
 =?us-ascii?Q?FBmc7D4VWJkrYQz3BZgtIbc5O2GudMrEi4XOt4MrOFNYVfeGh+Jgp3NVxW1/?=
 =?us-ascii?Q?B7qCvLwPsnni22223xVS+2T6DNr8RGe/eihTyGnN6QueehIXyRtS/UFDQaEy?=
 =?us-ascii?Q?G0YYLws7YjmJ/ENtJG6g0VqyW7HcEEO6w2dA6y6S8cY4LWeZQYS0yrDqEtC0?=
 =?us-ascii?Q?SC7Sf1DeLXNhBgh5yQseRhjXL6OGchBraFEyQIHnIIs5nShNtpgofZRkyBGd?=
 =?us-ascii?Q?i7cAB4yfZEw4jrKF2vumXwYweIKB1MFMj+aeU0C5O3gRrHg5Nnmz2eUYrIug?=
 =?us-ascii?Q?J0EkiJHLA7CozHRWC8dmcP80EK49Yi7KiEN5iR7+kARWf6JuBfd9aKkpptxf?=
 =?us-ascii?Q?9NhLyYFDuyAttfUPXdK1OY3Dy+dKtvJpzO2OfTAifq52Cbm/KxUMDiX+cXdM?=
 =?us-ascii?Q?Y05ywSb9cx+jB3Pn8EaG1r1jXI+qoOkWFTSPNbgWHm0Z3jSxJz0ZYXKwkvHB?=
 =?us-ascii?Q?mLjlfbmKJZF+NXfzt1+2ptuQfVAJRA+Y6gS53UFNV3Qx+90kKcRy6HUi1EA8?=
 =?us-ascii?Q?DW8XmGjc58lNvWV9u8BB1Vz+PYKHYi29chmg/h7QnVSmTe1I8C6YHCqqXXvh?=
 =?us-ascii?Q?/xs+UKppqAljLnzgYyPg8QQbQjQ+AWt3LWtLmRtjb3SzHhzSVUyt5AtEO1v7?=
 =?us-ascii?Q?52gVmqD0SxevLLYPvYY7h4IRRQKGwa3X+Lxs8vO8MhKq329cYRWncYvFSB3y?=
 =?us-ascii?Q?Hc/MAZxJ/RMnh/TLy6PtutTP1RRrR2CKLnSCrVf1WdGzVoL/ySUjt7r29FWO?=
 =?us-ascii?Q?DPuiOpb4F6DHPuxTkNQLo3wZxs0JBU4TQc0zPg/0V51LNarfV1R2KNg2QPDh?=
 =?us-ascii?Q?Kvj8VjIt1/SzbGTtGThrDKOtREC5ECXtSwbPz4JhV5F932W3Jvh7NqRMRMdQ?=
 =?us-ascii?Q?A5lGTJH29M4Gb5T+h3zQBn2cTm8kdZgfL8zZ41dALqkqfbeUUJH4NmxCgsTR?=
 =?us-ascii?Q?b2damR0cRI7Hb793W7MRdP8EICAXy4ZS1WU+GtWcXb3sw2F5J+qzDW8ryxQH?=
 =?us-ascii?Q?Aq9SisF1w01yNyGS5h47XRlwsEnDjmeXIvffiDhSNTM2hwYd8WPRQa0KyK5W?=
 =?us-ascii?Q?belVLnIRs2pnQgSdjp5yqr7unMmiGiAKTC9lGGpw1pvaOPSkaSJNon8DRJmM?=
 =?us-ascii?Q?sYu7DIlCyj/+85LqRwIIGZ2LbK1d26ripkh/6GsPVPeKhLGhs8YusAHhnyuE?=
 =?us-ascii?Q?4094y+5NmZgS101RimrCMBVEyCakffpdAXw8pxpbmiPXVcGKnsHSQBu2xVbP?=
 =?us-ascii?Q?mf0zIyqE2RzYqUYCKaYqhvzGXP3Bn01211tZZSUCHZwDYhcQNUJM6k7hJDTT?=
 =?us-ascii?Q?g9t6hokksF80x98oCy9iDf69mr/LUNLHqTbCRQ0y8/jjNe6XNKUsQ+7iqih8?=
 =?us-ascii?Q?hocp8868lCGrRWBS/oqsf5eZr2DLAXvCsebguGxizU4tbYdpLIHa82DtB4vc?=
 =?us-ascii?Q?XcCXlajMg9vN4w0aCaIAvGDRADmfRK+3bF9AUvfPKvoIdms7KTGa0w9MvRzu?=
 =?us-ascii?Q?DR+60P4rUQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR02MB8198.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 88346fc5-d056-4612-4645-08da2694d83a
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Apr 2022 08:23:15.0747
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pk0p/4ltnSye7GCFhxj+8WzsR7Zbdkknnk/mlqjqD5LNNIN/FcFIF4gwWysrPbJY+GJueU/9fr2XpfY95Xn+IVIa+Ly9JlkwHiirlgk7Z7U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB5900
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

> From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> Sent: Monday, April 25, 2022 4:10 PM
> To: Linyu Yuan (QUIC) <quic_linyyuan@quicinc.com>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>; linux-
> usb@vger.kernel.org; Jack Pham (QUIC) <quic_jackp@quicinc.com>
> Subject: Re: [PATCH v5 1/3] usb: typec: ucsi: add a common function
> ucsi_unregister_connectors()
>=20
> On Fri, Apr 22, 2022 at 11:10:20AM +0800, Linyu Yuan wrote:
> > As con->port will be used in error path of ucsi_init(),
> > it should be NULL or valid.
> >
> > In error path of ucsi_init(), it will unregister all valid ucsi connect=
ors,
> > and similar operation also happen in ucsi_unregister(),
> > add a common function for two places.
> >
> > Signed-off-by: Linyu Yuan <quic_linyyuan@quicinc.com>
> > ---
> > v2: improve ucsi_connector_clean(), check total number of connector.
> > v3: rename to ucsi_unregister_connectors(), suggest by maintainer
> > v4: merge patch#1 in V3, fix a typo samiliar -> similar in commit descr=
iption
> > v5: no change
> >
> >  drivers/usb/typec/ucsi/ucsi.c | 52 ++++++++++++++++++++++++-----------
> --------
> >  1 file changed, 29 insertions(+), 23 deletions(-)
> >
> > diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucs=
i.c
> > index f0c2fa1..af9a2a1 100644
> > --- a/drivers/usb/typec/ucsi/ucsi.c
> > +++ b/drivers/usb/typec/ucsi/ucsi.c
> > @@ -1100,6 +1100,7 @@ static int ucsi_register_port(struct ucsi *ucsi, =
int
> index)
> >  	con->port =3D typec_register_port(ucsi->dev, cap);
> >  	if (IS_ERR(con->port)) {
> >  		ret =3D PTR_ERR(con->port);
> > +		con->port =3D NULL;
>=20
> I'm not sure you need to add that line. See below.
>=20
> >  		goto out;
> >  	}
> >
> > @@ -1186,6 +1187,32 @@ static int ucsi_register_port(struct ucsi *ucsi,=
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
> > +
> > +	for (i =3D 0; i < ucsi->cap.num_connectors; i++) {
> > +		con =3D &ucsi->connector[i];
> > +		if (!con->port)
> > +			break;
>=20
>                 if (IS_ERR_OR_NULL(con->port))
>                         break;

Good suggestion, will change it next version.

>=20
> thanks,
>=20
> --
> heikki
