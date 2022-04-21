Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 48E17509984
	for <lists+linux-usb@lfdr.de>; Thu, 21 Apr 2022 09:56:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1381315AbiDUHny (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 21 Apr 2022 03:43:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1380551AbiDUHnx (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 21 Apr 2022 03:43:53 -0400
Received: from esa.hc3962-90.iphmx.com (esa.hc3962-90.iphmx.com [216.71.142.165])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0377ADF94
        for <linux-usb@vger.kernel.org>; Thu, 21 Apr 2022 00:41:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qccesdkim1;
  t=1650526863; x=1651131663;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=DLVxoQof4H4PjfYmdkw6fqHz7Mw+L9CXdzg3853BTp0=;
  b=Yae9I2CLyqJgsV6kVExdkuTz6Km/mzQcj3FGWSx4ccqyhA6BrQa+2Yrp
   +P9ZfuZ5nqxskGvKox+47NTAhxUKER4uV5FBetDs7iwVmnBJJgS1wQF1d
   HIMu85Rzu7LEBht0yBIhV+cL0SuBJOZWEr6zsfy4iHPygzg+TiH4faFXM
   0=;
Received: from mail-bn8nam08lp2044.outbound.protection.outlook.com (HELO NAM04-BN8-obe.outbound.protection.outlook.com) ([104.47.74.44])
  by ob1.hc3962-90.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2022 07:41:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QcopXe8ttUTB6n8XO6XsjC+IxFdMVFVddM4Ro05pleCQCwJ8Qup9k1G+V0dC4dsOxE5aSMOTT0ymsZGaV5aOXMskAc0Yt1iQEQWr2Dsp1nzccQ2Bco+pRO8IrYipwolJ0+H+u0wm4t0GYW3HiFWaMYqWZMKY7dYeHxpV5QNl87sNNv8DM4mBMmfe/Ibg7T8//EJtLuZFWE45M+JZwUM27+MRj+goFv4Pr7JN/J0rXHJliccSJBOL02MWIu3u2b697SXCksRkxBg7ItIJwHRziEBoqmODCIypbf8wjBDv9sMvrP4bUpYOakW8HBLngrzdnpEX+tEkuMRThlZLFItkfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DLVxoQof4H4PjfYmdkw6fqHz7Mw+L9CXdzg3853BTp0=;
 b=hOQMhBS8s72dl84SDi88FY5K+XHkk4GFgQyXZCiYtuhfWoSMMXKkqzLPa/JfNQuweccyEwtKCPz7SBljem3fOGrP6zVHlhm5B/HgnG4vKkGwoZTz5qCshPkHUxJ88IxSdHqiF5SzJPcs0/tSbPdE7HGrSDcmVpnfVxjYqzHbDk9HOOfPlUo59o+V7RtDWAP0AE/v2FWVJx3Uggovc3JhKjOancP/M72JL7/r38GoLxWMKxp19kTCyar4S/WN4SEL98bnqyeTe+UFg0079PZtB6C0dpGG0Mn/t3tSuBQinaXxmbLx6977aHC1oQaABG56ItaSvwWH2q/JKOYVdDNabA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from DM8PR02MB8198.namprd02.prod.outlook.com (2603:10b6:8:4::7) by
 MW4PR02MB7476.namprd02.prod.outlook.com (2603:10b6:303:67::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5186.13; Thu, 21 Apr 2022 07:40:56 +0000
Received: from DM8PR02MB8198.namprd02.prod.outlook.com
 ([fe80::15d6:317e:e736:e9ad]) by DM8PR02MB8198.namprd02.prod.outlook.com
 ([fe80::15d6:317e:e736:e9ad%5]) with mapi id 15.20.5186.013; Thu, 21 Apr 2022
 07:40:56 +0000
From:   "Linyu Yuan (QUIC)" <quic_linyyuan@quicinc.com>
To:     "Linyu Yuan (QUIC)" <quic_linyyuan@quicinc.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>
CC:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "Jack Pham (QUIC)" <quic_jackp@quicinc.com>
Subject: RE: [PATCH v3 4/4] usb: typec: ucsi: retry find role swithch when
 module load late
Thread-Topic: [PATCH v3 4/4] usb: typec: ucsi: retry find role swithch when
 module load late
Thread-Index: AQHYTx0F90xU2/wxzkix8ByZL1bktazuPkaA//+YNgCADDCmIA==
Date:   Thu, 21 Apr 2022 07:40:56 +0000
Message-ID: <DM8PR02MB81981200B7B2E422CA7248D6E3F49@DM8PR02MB8198.namprd02.prod.outlook.com>
References: <1649843891-15554-1-git-send-email-quic_linyyuan@quicinc.com>
 <1649843891-15554-5-git-send-email-quic_linyyuan@quicinc.com>
 <YlbEm31fOaMsFW6C@kuha.fi.intel.com>
 <DM8PR02MB8198A080766C934496479FE2E3EC9@DM8PR02MB8198.namprd02.prod.outlook.com>
In-Reply-To: <DM8PR02MB8198A080766C934496479FE2E3EC9@DM8PR02MB8198.namprd02.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=quicinc.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ebf244cc-edda-408e-7eb5-08da236a4543
x-ms-traffictypediagnostic: MW4PR02MB7476:EE_
x-ld-processed: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d,ExtAddr
x-microsoft-antispam-prvs: <MW4PR02MB7476393DD83BCE32C68A11149FF49@MW4PR02MB7476.namprd02.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Ov8qNTdrQrAEuZ8iGP4raAtQeIFuaULINvJDPIbD/zoiAevYn0uMcm23PY0CqYceJgACCse025Eml9yW4w1iX4ZGu+NVNwc/xc+UmVgzuALVDe5jZLzGBI6xBOe5YM7WprMFweXyArxKgiTS78BvWIchqD7OW6PxqaaJN9YipblQCK2fo9EODRWZN2lRUBoJRNv5IJ/ksYLkssA4OOFxCaYllkP/DJO4dFFSrY0cc6b4+Q7v6P+BrzWVdza+HtsKPiwWexjp0iwxtyXn6PH0GsmN93uJF6KGQdUs5fF9MndgNQe0k9b+8Ilohm+6pgYtpCxhYI4466YNxJ9qu/PZEQybt+eazF9kZQI6h/D8rANum41ll4CGQ0u0tjMGwJD2cxroqr3xMei4wCkp3jxG0apeexJ5nH43wuehoVXVoWlFYbjIemvoKrl4nFun5mVHv4WxplJ/bTno/BfFmb0ZHol+X8kjyIyQ0VzEaZGl8h4etbK5EeQEjCXQ6QMhXJ3cWsq8eFjgWWRal/yo73FTBYllaQLYOTpOGdpvfnJrJxOoUQnhEIvvcV8oBbpsRAUTWz4V7yZnAmSoJACAEj0/BqTIgIDVqvS06+bjGUm8eZYhmQqZyVGkXys/7vNLBsoQWYgQNgzNdflEChJru/Vci0HUYcPGJjev7COQWNHIHHZZWDeLnWAIqpOYfONWQOJSQjr8kTDY0b503hgnCga/HQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR02MB8198.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(316002)(2906002)(86362001)(66946007)(52536014)(5660300002)(38100700002)(8936002)(76116006)(4326008)(66556008)(8676002)(66476007)(122000001)(38070700005)(64756008)(83380400001)(66446008)(54906003)(107886003)(9686003)(7696005)(6506007)(53546011)(26005)(186003)(110136005)(71200400001)(508600001)(33656002)(55016003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?xlgs7aEEWG9sRKSCn0fKHM1riq+U+ydyfSpWE42vR+Os8HEqdgwWIFqui/Y8?=
 =?us-ascii?Q?bRLi/nx0bt0ZtcJDW7T6HU3H+C6AE3MwLmkuqT9EDkXDbm39cJ0VQUHKAaNX?=
 =?us-ascii?Q?xyiSNo5pO6LpQJu3z82rNH1mPVcMfbLcs76SasOnoHY/pW7APD4NxHKvm9mz?=
 =?us-ascii?Q?H2mz7V1AQmv66H8RDT4Q2rARStZt0Q/zVVVL61Ab3BZ+D7fAwGL2MAZ53kVS?=
 =?us-ascii?Q?Yen73kvRogF9fjkogMZsM5DHzoAdvhQVxRBQHq4orqBmxLZliU1WneB99sT7?=
 =?us-ascii?Q?7faA7Ag1VeDfNTygTRb3Sn7uuiEfg7BBy6nPZrlPWHNuaFbdG8uxQNo768n6?=
 =?us-ascii?Q?dd3xSLw/N7H95lWFQlGh4cmNPNDuG3TCg8QiEQdLOjXqBqDw5879OvbnpqrL?=
 =?us-ascii?Q?ov3xqpl9QiggKwdgXYRTzVW9z6EqA2RbNOY3RNFegdHMA0DQLvmIP2YLRtNh?=
 =?us-ascii?Q?ri1E3pOtxbn1DoyYODkn94i5TtCeZM8nHKpeR6slISbAjq9zblE2FdgYL2CW?=
 =?us-ascii?Q?izTatM2RE+L1ShRUao/hiLk76mTj6OdNfVfucnK/MJkF1c2OB0pyvCK73O1Q?=
 =?us-ascii?Q?0B8l4cacs5tjoMf7SW9indVTkk95sf7TEw8+Q7d+wY+TV4DKPyJI7k3208Vp?=
 =?us-ascii?Q?Aqv+tsWPO7KFaRuR6nv8poVFuSfV6xIX8dOdMXL5NwbWI1gRKqYgAcdHHqEm?=
 =?us-ascii?Q?DpWAhSnjE9bkzi0GBmQe4+fgKQ9xM7LLmgTcAlgbqHi4uocZfKGlhVC+zQ2U?=
 =?us-ascii?Q?o+6dPjrP89Da3Oov8BlDjP+tpFmVYIkXo87RaY+KLXy24TLDEdf22BAQaohm?=
 =?us-ascii?Q?ISlqGwFhrL0titZxaNkAAL32hCO23jBYXj8/+40+LVU2pIbnShP4fWDvkzLB?=
 =?us-ascii?Q?VDWFgSMwtnO39UexQgWaUrGO1AoXRXrn77RbGpxV14M5r7Bw9l/HS8RmMEDj?=
 =?us-ascii?Q?Si6mjRyNJ+wbc2dbhSFwTGKavMUN1u+NCdfp49J9tPtJgPOCYoKGDaUbnj6Z?=
 =?us-ascii?Q?d3Jf89O6WIVEytXAYwrAEBEm3/Se0jauRdcA0cKvrNbBnIftdsohUUCmxRu+?=
 =?us-ascii?Q?GayMc9NDo2zqMNLMXPfRO17oL9eH2wpd9tO/uKfjYC7vgIPn7UNjpfVj0lqw?=
 =?us-ascii?Q?Z2l59k4PIHm1QtYevgxrRMQH5QaA9LmrhkMHjsdcXfGinx/4jf5NeN6NkUfj?=
 =?us-ascii?Q?YdqVYJeTvveuSnfAbwJI2ZVEluRBCebTLWAPQicRdMlPj0zjOfDyw0u2HWTr?=
 =?us-ascii?Q?wCkqrRLDLpRSZCEdQ4gSo8UfJv1ZhqKXXJNmd7hkMpAPcK1oWl57hwqv5Kyj?=
 =?us-ascii?Q?shCeBCFLS4ElbljihzGMyYn6QbS+XLqeleF6Vag/alPszlEYezFbSvh+3v9p?=
 =?us-ascii?Q?uRVr/YL8t1E7bWqQjamIFL5/rPBWOo0AEBi+44z+mVs/jjbCRkPxg95p1VWj?=
 =?us-ascii?Q?+Hvzf7sXRzvY+9sMFejFkU1beMLWEobZeWuoa4nRvJuF3zL79pheuauPyxVs?=
 =?us-ascii?Q?aDoSIVobTh2Lg4rSYYMBfncJi2xpewcj477/ougWQ4SuhC9vW7ULyDcthCyT?=
 =?us-ascii?Q?rHi/AR0s60xjVB9g1k8SHNjdjH3K01gxNNmM4x5eb/0C9rLCvY8WtYlQa2qj?=
 =?us-ascii?Q?O94wjejn9j7D0CFzGbVoXd6soj1AvfUpTLV6ntAdBe9DsLJhN6v+mlp4hQ8r?=
 =?us-ascii?Q?VLMTTXLk4qwhPzSXMrVBGFli1vv/ChvgfyV2lE0bP4mawgt4zqGuRmiZ/f7u?=
 =?us-ascii?Q?ij8HygZetg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR02MB8198.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ebf244cc-edda-408e-7eb5-08da236a4543
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Apr 2022 07:40:56.1278
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mhlFwVa90P8kZb3ds4hy9zCuaq8FK08ZB2L7z12FQ1NOTHmHLFSDAmqieV4eltko/YxfgSTedI9XCT23pgf97hLrmOX+SNJGoXoPUl77JVI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR02MB7476
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

> From: Linyu Yuan (QUIC) <quic_linyyuan@quicinc.com>
> Sent: Wednesday, April 13, 2022 9:43 PM
> To: Heikki Krogerus <heikki.krogerus@linux.intel.com>; Linyu Yuan (QUIC)
> <quic_linyyuan@quicinc.com>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>; linux-
> usb@vger.kernel.org; Jack Pham (QUIC) <quic_jackp@quicinc.com>
> Subject: RE: [PATCH v3 4/4] usb: typec: ucsi: retry find role swithch whe=
n
> module load late
>=20
> > From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> > Sent: Wednesday, April 13, 2022 8:40 PM
> > To: Linyu Yuan (QUIC) <quic_linyyuan@quicinc.com>
> > Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>; linux-
> > usb@vger.kernel.org; Jack Pham (QUIC) <quic_jackp@quicinc.com>
> > Subject: Re: [PATCH v3 4/4] usb: typec: ucsi: retry find role swithch w=
hen
> > module load late
> >
> > Hi,
> >
> > You have to make the subject line a bit more clear. Perhaps you could
> > just say "Wait for the USB role switches".
>=20
> Sound great, will change once all discussion in this thread done.
>=20
> >
> > On Wed, Apr 13, 2022 at 05:58:11PM +0800, Linyu Yuan wrote:
> > > When role switch enabled, return -EAGAIN if fail to find it due to
> > > module load ordering issue, then restart ucsi init work to find
> > > it again every 100ms.
> >
> > It looks like you did not update that.
>=20
> Sorry, will update later.
>=20
> >
> > > It also means change ucsi init work to delayed_work.
> >
> > So from where does that 100ms come from?
>=20
> Yes, no place define it, just an experiment value.
> Any suggestion ?
>=20
> >
> > > Signed-off-by: Linyu Yuan <quic_linyyuan@quicinc.com>
> > > ---
> > > v2: keep original con->num in debug log
> > > v3: change return value from -EAGAIN to PTR_ERR()
> > >
> > >  drivers/usb/typec/ucsi/ucsi.c | 28 ++++++++++++++++------------
> > >  drivers/usb/typec/ucsi/ucsi.h |  2 +-
> > >  2 files changed, 17 insertions(+), 13 deletions(-)
> > >
> > > diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/u=
csi.c
> > > index ce9192e..63c25dd 100644
> > > --- a/drivers/usb/typec/ucsi/ucsi.c
> > > +++ b/drivers/usb/typec/ucsi/ucsi.c
> > > @@ -1053,6 +1053,14 @@ static int ucsi_register_port(struct ucsi *ucs=
i,
> int
> > index)
> > >  	con->num =3D index + 1;
> > >  	con->ucsi =3D ucsi;
> > >
> > > +	cap->fwnode =3D ucsi_find_fwnode(con);
> > > +	con->usb_role_sw =3D fwnode_usb_role_switch_get(cap->fwnode);
> > > +	if (IS_ERR(con->usb_role_sw)) {
> > > +		dev_err(ucsi->dev, "con%d: failed to get usb role switch\n",
> > > +			con->num);
> > > +		return PTR_ERR(con->usb_role_sw);
> > > +	}
> > > +
> > >  	/* Delay other interactions with the con until registration is comp=
lete
> > */
> > >  	mutex_lock(&con->lock);
> > >
> > > @@ -1088,7 +1096,6 @@ static int ucsi_register_port(struct ucsi *ucsi=
, int
> > index)
> > >  	if (con->cap.op_mode &
> > UCSI_CONCAP_OPMODE_DEBUG_ACCESSORY)
> > >  		*accessory =3D TYPEC_ACCESSORY_DEBUG;
> > >
> > > -	cap->fwnode =3D ucsi_find_fwnode(con);
> > >  	cap->driver_data =3D con;
> > >  	cap->ops =3D &ucsi_ops;
> > >
> > > @@ -1147,13 +1154,6 @@ static int ucsi_register_port(struct ucsi *ucs=
i,
> int
> > index)
> > >  		ucsi_port_psy_changed(con);
> > >  	}
> > >
> > > -	con->usb_role_sw =3D fwnode_usb_role_switch_get(cap->fwnode);
> > > -	if (IS_ERR(con->usb_role_sw)) {
> > > -		dev_err(ucsi->dev, "con%d: failed to get usb role switch\n",
> > > -			con->num);
> > > -		con->usb_role_sw =3D NULL;
> > > -	}
> > > -
> > >  	/* Only notify USB controller if partner supports USB data */
> > >  	if (!(UCSI_CONSTAT_PARTNER_FLAGS(con->status.flags) &
> > UCSI_CONSTAT_PARTNER_FLAG_USB))
> > >  		u_role =3D USB_ROLE_NONE;
> > > @@ -1286,12 +1286,16 @@ static int ucsi_init(struct ucsi *ucsi)
> > >
> > >  static void ucsi_init_work(struct work_struct *work)
> > >  {
> > > -	struct ucsi *ucsi =3D container_of(work, struct ucsi, work);
> > > +	struct ucsi *ucsi =3D container_of(work, struct ucsi, work.work);
> > >  	int ret;
> > >
> > >  	ret =3D ucsi_init(ucsi);
> > >  	if (ret)
> > >  		dev_err(ucsi->dev, "PPM init failed (%d)\n", ret);
> > > +
> > > +
> >
> > Extra line.
> >
> > > +	if (ret =3D=3D -EPROBE_DEFER)
> > > +		queue_delayed_work(system_long_wq, &ucsi->work,
> > HZ/10);
> >
> > You have to stop queueing that eventually. You need a counter.
> >
> > I'm still not sure why do you want to queue this same work again and
> > again? Why not just call ucsi_init() in a loop?
>=20
> Will follow your suggestion below.
>=20
> >
> >         int my_counter =3D 1000;
> So you prefer 10 second in total ?
> If so, next version, I will change it to 500, as msleep(20), check next.
> >
> >         while (ucsi_init(ucsi) =3D=3D -EPROBE_DEFER && my_counter--)
> >                 msleep(10);
> In checkpatch.pl, it suggest msleep no less than 20ms each time.
> msleep(20) ?
>=20
> >
> > >  }
>=20
> Great idea, it will be less code change.


Sorry, I think there is one concern of your suggestion is that
As the while loop inside the worker, if we can this worker,
It may spent too much time.

Although my original design is crazy(queue worker again inside it),
but it allow cancel worker wait short time.

please let me know what is your suggestion now.
>=20
> > >
> > >  /**
> > > @@ -1331,7 +1335,7 @@ struct ucsi *ucsi_create(struct device *dev,
> const
> > struct ucsi_operations *ops)
> > >  	if (!ucsi)
> > >  		return ERR_PTR(-ENOMEM);
> > >
> > > -	INIT_WORK(&ucsi->work, ucsi_init_work);
> > > +	INIT_DELAYED_WORK(&ucsi->work, ucsi_init_work);
> > >  	mutex_init(&ucsi->ppm_lock);
> > >  	ucsi->dev =3D dev;
> > >  	ucsi->ops =3D ops;
> > > @@ -1366,7 +1370,7 @@ int ucsi_register(struct ucsi *ucsi)
> > >  	if (!ucsi->version)
> > >  		return -ENODEV;
> > >
> > > -	queue_work(system_long_wq, &ucsi->work);
> > > +	queue_delayed_work(system_long_wq, &ucsi->work, 0);
> > >
> > >  	return 0;
> > >  }
> > > @@ -1383,7 +1387,7 @@ void ucsi_unregister(struct ucsi *ucsi)
> > >  	u64 cmd =3D UCSI_SET_NOTIFICATION_ENABLE;
> > >
> > >  	/* Make sure that we are not in the middle of driver initialization=
 */
> > > -	cancel_work_sync(&ucsi->work);
> > > +	cancel_delayed_work_sync(&ucsi->work);
> > >
> > >  	/* Disable notifications */
> > >  	ucsi->ops->async_write(ucsi, UCSI_CONTROL, &cmd, sizeof(cmd));
> > > diff --git a/drivers/usb/typec/ucsi/ucsi.h b/drivers/usb/typec/ucsi/u=
csi.h
> > > index 280f1e1..3812017 100644
> > > --- a/drivers/usb/typec/ucsi/ucsi.h
> > > +++ b/drivers/usb/typec/ucsi/ucsi.h
> > > @@ -287,7 +287,7 @@ struct ucsi {
> > >  	struct ucsi_capability cap;
> > >  	struct ucsi_connector *connector;
> > >
> > > -	struct work_struct work;
> > > +	struct delayed_work work;
> > >
> > >  	/* PPM Communication lock */
> > >  	struct mutex ppm_lock;
> > > --
> > > 2.7.4
> >
> > thanks,
> >
> > --
> > heikki

