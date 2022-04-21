Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ABB56509A70
	for <lists+linux-usb@lfdr.de>; Thu, 21 Apr 2022 10:17:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1357512AbiDUIQJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 21 Apr 2022 04:16:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238792AbiDUIQH (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 21 Apr 2022 04:16:07 -0400
Received: from esa.hc3962-90.iphmx.com (esa.hc3962-90.iphmx.com [216.71.142.165])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D57AD1EEEA
        for <linux-usb@vger.kernel.org>; Thu, 21 Apr 2022 01:13:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qccesdkim1;
  t=1650528798; x=1651133598;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=y2ra+/h9g392I0aO1v3owT815lQGHK80YTh/SXmKMYU=;
  b=NwjzOlTElsrSGxJvP3eGWDWqiuS4/Hw1ccCar48tWjY0u8V3x1w+gT51
   47h4923hJm8/R+cgCRRty//yJO0ysfkfA7G3ZxZqkd5nC2ya+lv6BDq85
   kCchNfIpMdzHk1rVWLdCIqc9REdawmzYUhfSZsOtACr0jlIvyHoDeSwIn
   c=;
Received: from mail-bn7nam10lp2101.outbound.protection.outlook.com (HELO NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.101])
  by ob1.hc3962-90.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2022 08:13:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C+sS7mjlp+BNb8pAtEGEtvceBcqj66F97mHWxlDWA7GEb3LqL1/MgIkNZdky+zONqhXd6h4yYnlx5vCLqfOmIDE68CBx2jnUqIN/08yf16hkMyTfAiDYkhkTI99CjxVmRmez5vSJCWBAOXQI11SqMI6ZgDh6qQpn5BiPntDZILfk6RAtSO/NwFVcLFjaQ8tXcU0tILBw5JU3g6mBWXR2PNRt8hEc95VtdpQEDgfoTzRr+AeYGVorCwPKOBXrJ0Bpa6sHRDC5Lu/8s9uRggUVNclN67svnUrEZHl5u5nt8eI5Z+IpIye4T5uvgG2vorbmNCus3uxks0VjI9tkvQrhEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y2ra+/h9g392I0aO1v3owT815lQGHK80YTh/SXmKMYU=;
 b=A/Zz6fdfupC7G/nCf1gA/F+kb1Qxkb7sPp4vHq5twEOxqIfq2pOnMxY61QGOUMtVG3KHLXuHFVyU09ybnAHePeZoScYsg9ywdgbI+PhDnRKmdpKzaD3zXuHltOdl29KWrmQiPfewRZ12N5Yen8WKQUO1lP9PdFaHlWY/Io2FmXuh95IM710fxl2XNzZhNARdEb0NaV2+4ojuFjH9ffXDNLeNCksQ4GF069wHsU25MDm9PjD3xCMpl5uBO12zcXKAHuZphp7BOsB8YiTsA1nh5F2QctU+oC2opxFvPlHv6ZOBnFeBj2mxkLsuz+OPlFIfAzAagQ0kUeRjObqvPXrUOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from DM8PR02MB8198.namprd02.prod.outlook.com (2603:10b6:8:4::7) by
 DM6PR02MB6586.namprd02.prod.outlook.com (2603:10b6:5:21b::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5186.14; Thu, 21 Apr 2022 08:13:15 +0000
Received: from DM8PR02MB8198.namprd02.prod.outlook.com
 ([fe80::15d6:317e:e736:e9ad]) by DM8PR02MB8198.namprd02.prod.outlook.com
 ([fe80::15d6:317e:e736:e9ad%5]) with mapi id 15.20.5186.013; Thu, 21 Apr 2022
 08:13:15 +0000
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
Thread-Index: AQHYTx0Dc3wvnkQxNEm3ijXhHJLFz6zuNZkA//+dchCADK/BgP//i2uA
Date:   Thu, 21 Apr 2022 08:13:15 +0000
Message-ID: <DM8PR02MB8198307D92F1516711E4308DE3F49@DM8PR02MB8198.namprd02.prod.outlook.com>
References: <1649843891-15554-1-git-send-email-quic_linyyuan@quicinc.com>
 <1649843891-15554-3-git-send-email-quic_linyyuan@quicinc.com>
 <Yla9VGMpcDcpJR0f@kuha.fi.intel.com>
 <DM8PR02MB81985719835CC9DC2AAF1E6EE3EC9@DM8PR02MB8198.namprd02.prod.outlook.com>
 <YmEPEUwb9GYJqzJD@kuha.fi.intel.com>
In-Reply-To: <YmEPEUwb9GYJqzJD@kuha.fi.intel.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=quicinc.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 45ffe245-8d44-4958-41d0-08da236ec93e
x-ms-traffictypediagnostic: DM6PR02MB6586:EE_
x-ld-processed: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d,ExtAddr
x-microsoft-antispam-prvs: <DM6PR02MB65860A8BAD8BB1F89E25F3E99FF49@DM6PR02MB6586.namprd02.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 78PNpawVjCFz8bEonWt4jAWZlJKwRRYg9oEnnhFaybPCOOfITj4JSsm5ZvJdF+7Fed2vQSaDychUtIwR8GjlUpcw9RF51ehwhPrbJ8qXGM2wuid50Jq8lDFYh+Yan/Inp6Sfc5apLYLALoG54Sd05IdCsnVigcf/m2qkQ7fXBqXS7DAvzxzPXewzainwezdqx6TULEsJTrLEOKWvSi3iqjaXYVV4jTy5t+pR5JJj2sIEs1eytcOuKgsS6dLdquTJZ1hhRAz8jI0XOH51vK7ISSkWhgpeAKgrwPbhbl9wJF8B+nSGXkyfex5nf+Yiodr5lwX5DO/kignTAq4Q9yu7dduQu5/EhWy7mu+IfwVRHjk6zy9Tpsr7XDgLJl8ohVupJc9fOgVSpL2p7uuNRABHgEvxzok4CXEyfnngecrtEvUkBbbqThyibZBmPGx63FVEsgVCXvnFubh6AlIB6WA1n7wHCnUqPfZfIAeLA1aE/pU68oOMngeopMmCb3brHOdqdWhirkmi0DSPKuhaSUyHCiHR6Q2FZ13SlwZXp39rEsUwolhhabLw5JR9FClSwoET5iAm5zIXcePC7pJB7xVBtNrslNFbR7wjoxzFoPVcdSBwka/slFBdbvHTDWmH1/aFuk5qpqxmUZGRniykAqcrLPGnbkOCFnq0vqR4D5+r2+E9jIEDT/mINTQLM1x5iNdKagl1yVTHkEu1djTVVtpckw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR02MB8198.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(316002)(38070700005)(38100700002)(54906003)(66556008)(66446008)(33656002)(64756008)(66476007)(66946007)(52536014)(110136005)(5660300002)(76116006)(122000001)(71200400001)(55016003)(86362001)(8936002)(8676002)(7696005)(6506007)(9686003)(2906002)(53546011)(26005)(186003)(508600001)(4326008)(83380400001)(107886003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?y8CBMK/WmDkwkWzYeOY0Ray6IlrnzCOfUE/vCfZVW4B7WtxdEFozY6iWqUN0?=
 =?us-ascii?Q?qABYTyiNCWIhrIyM9HiRDYOoL3Fnq8maFXr+j6VpCM6HyvUQDlJWuDSViHTh?=
 =?us-ascii?Q?gimdooyiJsdtW+ABkWfpMGzYaayTx5yRlCRaMqPMhrDeDQVKIz7Zeq/9S+lZ?=
 =?us-ascii?Q?sL+iMY5iFZT//h2pPBW5e+4QtWPZJvUvCH2tC0oTHDf6cCaXdc8u4Sn/T7pO?=
 =?us-ascii?Q?Z2uYJo9NWbXHsS1YGJV8/aFGdgQiff3GYDSOsIvMLu91HFnFVs5Gpp8ApKqm?=
 =?us-ascii?Q?OeJgwLwN9RisLDvadl7rUaaWXiIkahlK7qLuwN2ETeLrKAFATgzCPwnatFab?=
 =?us-ascii?Q?n/FtVKAoPbBsN6W+qn/66/9OUJPAaZJB/2DU547alz/GTuzEtsMgqhUS4B0u?=
 =?us-ascii?Q?wIcTTSnaTsNENyvUEIo5nGmRFigqLs9rfCFlh7YO6MQbv7613l1uckJJJtjH?=
 =?us-ascii?Q?4xv5lbT/jpumYcrQAp+5QSqrD8UedfT8909afEWDrTPnUf/HbDhpO5OQZNRD?=
 =?us-ascii?Q?L3qNZ+JA2XQcxgxEMBHlQtvbipVGE+UKhB6wIu0x1FRw0RQ2zONH/A+XgdfW?=
 =?us-ascii?Q?A0mZ8bXSkUu93vhNBIxwjd9bzNO48ex6LTy5nflVC5YgnlyCOf+u/W2uC/nh?=
 =?us-ascii?Q?bcMMH0eCfJ2iZurmmVYaEYSlWgk26apjI4d1ucNd5rmlKPVBD7/QgGPEWQuO?=
 =?us-ascii?Q?MYEqgkhV1/Pa6sOCWeFN5xQwFHhlozzwDLmvKYSG1w31d8JqH7Gw80H+xEk/?=
 =?us-ascii?Q?deiGSBO4to2PvNVplVPdgQ2Z4/v+K9175lWQaF7G45QNWNR0B5cgAofkOm7F?=
 =?us-ascii?Q?ss0xrJMyZ3siL6v6NErQJDktlN8i7SMOcdYdu05+eaR99sIJg6vJVJmHhnJ1?=
 =?us-ascii?Q?5cdu6aWAFNF1argOVTp4bRd4CB0HGDsV7N0qWTz4zNajDO07hTQp5YZdFuxC?=
 =?us-ascii?Q?eFAILKIjuBVSpSRJZvznAOTzDwYtFCL1ylrjQksnvb615dcW/JTHJbihzz9l?=
 =?us-ascii?Q?WFEKyGuaUJiCjJVcJlm0AXvu1ePkLvcJFALWhxfZSvizq3oi/L5zghPTyCI2?=
 =?us-ascii?Q?Fv5PBJYboEdwp44NQ4qhsaPGzm1vjF4S1JVWetM7cBA4FUTGNTAmYyN7th4z?=
 =?us-ascii?Q?T8QY+CUq+C/YRnsfigXt9oeX4+QGPbCVRPAN0RZoDLegtDV054S2XvIls+HE?=
 =?us-ascii?Q?FkJcncgaQgZUZdLURykPI+MHr5dgDqQDfMTI78HzIlt6TNUco1wXdI50Iozb?=
 =?us-ascii?Q?ryrK/D1m5S3FMMvwU0ab8APQSbyRYZu57Cqnir526mXfF7uo9e7KSmjarPy0?=
 =?us-ascii?Q?xx4NRIyLgtwjY9ern3Uqw8htkyQwpR84ce61vatWW2de+ytt7ZRXCTGHR9pC?=
 =?us-ascii?Q?oxl4dqJiXqVW8fXYRqvbWJIdIs1Dr6Zvy/a5ecSsmhxmQzqZG4Ehi86MlPxr?=
 =?us-ascii?Q?2XRimPCyUGR6i77uxfIxv78yjVQ8F7w5wY3qhnG4y2etdvD6FlJ6Se2BJjRZ?=
 =?us-ascii?Q?qGdaVEve6r7VAXzXAopO/SGl8DPxkae8BgTJeEuNOAJ6X9SRov5dUmdGeMxZ?=
 =?us-ascii?Q?+50VDKzIg8AjE8IvXrxjo2KRdqaZxJcy3CbwzNIh7tlD1EDOzGJg1bqtjSfA?=
 =?us-ascii?Q?i0owOM+7sjJckPrhjAiMZNTViORdkwCgETYupdnPYnCLzF2wzAxtj3IwUlP8?=
 =?us-ascii?Q?YjY2IE5l55xd4qQLsRBduBlx+w5JdIB2JoqPf/7taPibWu3WxRJVJLS2oc7O?=
 =?us-ascii?Q?Tw3psiI3JQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR02MB8198.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 45ffe245-8d44-4958-41d0-08da236ec93e
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Apr 2022 08:13:15.5865
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: azrRYA16PvKroFf2E0AbfSDVP5hmrYxJuanC51S8iEV++V1g8/lSA3oNk+zFMTUkEVkjKm1TnXi5LT88IpAN7yjR2KI4iI+LGWC5XDuOB4A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB6586
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

> From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> Sent: Thursday, April 21, 2022 4:00 PM
> To: Linyu Yuan (QUIC) <quic_linyyuan@quicinc.com>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>; linux-
> usb@vger.kernel.org; Jack Pham (QUIC) <quic_jackp@quicinc.com>
> Subject: Re: [PATCH v3 2/4] usb: typec: ucsi: add a common function
> ucsi_unregister_connectors()
>=20
> On Wed, Apr 13, 2022 at 01:27:52PM +0000, Linyu Yuan (QUIC) wrote:
> > > From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> > > Sent: Wednesday, April 13, 2022 8:09 PM
> > > To: Linyu Yuan (QUIC) <quic_linyyuan@quicinc.com>
> > > Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>; linux-
> > > usb@vger.kernel.org; Jack Pham (QUIC) <quic_jackp@quicinc.com>
> > > Subject: Re: [PATCH v3 2/4] usb: typec: ucsi: add a common function
> > > ucsi_unregister_connectors()
> > >
> > > On Wed, Apr 13, 2022 at 05:58:09PM +0800, Linyu Yuan wrote:
> > > > In error path of ucsi_init(), it will unregister all valid ucsi con=
nector,
> > > > and samiliar operation also happen in ucsi_unregister(),
> > >
> > > Sorry but I have to confirm this: with "samiliar" you mean "the same"=
,
> > > right?
> >
> > Only one small difference for original code which is no cancel_work_syn=
c()
> of each connector in ucsi _init(),
> > But in ucsi_register_port(), we get role switch after connector work
> initialized,
> > So I think it is safe to call cancel_work_sync() to connector work if r=
ole
> switch return -EPROBE_DEFER.
> >
> > >
> > > > add a common function for two places.
> > > >
> > > > Signed-off-by: Linyu Yuan <quic_linyyuan@quicinc.com>
> > > > ---
> > > > v2: improve ucsi_connector_clean(), check total number of connector=
.
> > > > v3: rename to ucsi_unregister_connectors(), suggest by maintainer
> > > >
> > > >  drivers/usb/typec/ucsi/ucsi.c | 51 ++++++++++++++++++++++++------
> -----
> > > --------
> > > >  1 file changed, 28 insertions(+), 23 deletions(-)
> > > >
> > > > diff --git a/drivers/usb/typec/ucsi/ucsi.c
> b/drivers/usb/typec/ucsi/ucsi.c
> > > > index 77ac0b7..af9a2a1 100644
> > > > --- a/drivers/usb/typec/ucsi/ucsi.c
> > > > +++ b/drivers/usb/typec/ucsi/ucsi.c
> > > > @@ -1187,6 +1187,32 @@ static int ucsi_register_port(struct ucsi *u=
csi,
> int
> > > index)
> > > >  	return ret;
> > > >  }
> > > >
> > > > +static void ucsi_unregister_connectors(struct ucsi *ucsi)
> > > > +{
> > > > +	struct ucsi_connector *con;
> > > > +	int i;
> > > > +
> > > > +	if (!ucsi->connector)
> > > > +		return;
> > >
> > > Can that actually ever happen?
> >
> > Consider a case, ucsi_init() failed, we will call ucsi_unregister_conne=
ctors()
> to free all connectors,
> > After that the UCSI implementation like ucsi_acpi call ucsi_unregister(=
)
> again,
> > It should not unregister connectors again.
>=20
> I'm sorry but I don't understand your answer. I'm trying to ask what
> are you trying to say with the word "samiliar"?
No, here I answer your question  "Can that actually ever happen"
Of check
if(!ucsi->connector)
     return


>=20
> I do not believe there is a word "samiliar" in English language.


Sorry, it is similar.
I will fix the wrong word samiliar  of commit description,

But what I want to say is the original two place is indeed similar as below=
.
ucsi_init()
err_unregister:
	for (con =3D ucsi->connector; con->port; con++) {
		ucsi_unregister_partner(con);
		ucsi_unregister_altmodes(con, UCSI_RECIPIENT_CON);
		ucsi_unregister_port_psy(con);
		if (con->wq)
			destroy_workqueue(con->wq);
		typec_unregister_port(con->port);
		con->port =3D NULL;
	}

One difference is cancel_work_sync().

ucsi_unregister():
	for (i =3D 0; i < ucsi->cap.num_connectors; i++) {
		cancel_work_sync(&ucsi->connector[i].work);
		ucsi_unregister_partner(&ucsi->connector[i]);
		ucsi_unregister_altmodes(&ucsi->connector[i],
					 UCSI_RECIPIENT_CON);
		ucsi_unregister_port_psy(&ucsi->connector[i]);
		if (ucsi->connector[i].wq)
			destroy_workqueue(ucsi->connector[i].wq);
		typec_unregister_port(ucsi->connector[i].port);
	}

>=20
> thanks,
>=20
> --
> heikki
