Return-Path: <linux-usb+bounces-5150-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A876282FFFA
	for <lists+linux-usb@lfdr.de>; Wed, 17 Jan 2024 06:57:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 184C71F2244C
	for <lists+linux-usb@lfdr.de>; Wed, 17 Jan 2024 05:57:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9CD379DF;
	Wed, 17 Jan 2024 05:57:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="L7EQTt7i"
X-Original-To: linux-usb@vger.kernel.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2047.outbound.protection.outlook.com [40.107.20.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09E577465
	for <linux-usb@vger.kernel.org>; Wed, 17 Jan 2024 05:57:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705471028; cv=fail; b=D/nJX2PUrs02tEfypm6IUrZyDftNO4m8PsucIU6TyDU2sTTggA+cfn0XY9u0sZCgF9eZl10wlHkkGJxo+6Lfj0+WPPUHRIzIl9xPl9AttAZ4WjAMvDOeEf5IlOSWoiUqWWZCE9/iGXv8rAlGkiqSarb84eiaoIWJDC4Goo3ka64=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705471028; c=relaxed/simple;
	bh=gdO4WzJiHgKYQiwFDVhS+mWTGYiHSFDzQfHLSVzMIMQ=;
	h=ARC-Message-Signature:ARC-Authentication-Results:DKIM-Signature:
	 Received:Received:From:To:CC:Subject:Thread-Topic:Thread-Index:
	 Date:Message-ID:References:In-Reply-To:Accept-Language:
	 Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
	 x-ms-publictraffictype:x-ms-traffictypediagnostic:
	 x-ms-office365-filtering-correlation-id:
	 x-ms-exchange-senderadcheck:x-ms-exchange-antispam-relay:
	 x-microsoft-antispam:x-microsoft-antispam-message-info:
	 x-forefront-antispam-report:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
	 X-MS-Exchange-CrossTenant-userprincipalname:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped; b=gV7wc+RyYQbc2Ofxnokkib9whYB/WCog8Lhq3nfB96hm0yg3PrIE8eRQPdxMSTUzipi8hmRT10mWA0HS9YoYJAQSntp2VwISPTG5X7P71BDgI/yjZqQFwDXn0Yblj0m0SQp4Nk4JL59gTrpSkT1SlhRY2uRfO+QIPWRE2pfMKYE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b=L7EQTt7i; arc=fail smtp.client-ip=40.107.20.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CHJJ95T9nhdUusEQlRglx8m5zqHvlqvDWgv5gA7G0Z/sFmCfnj3QY55UwoWti2gHSHB03V8DSfOsJom4byTChpZMVfW1KPanijlncKaDZAgyIDQWQB+5FGG8zK1OmRNXoRoNqneP2A+motfj4X1PmGlrM9NH3TYXod0cFuQooeUX90gNwiuyVuiehRNbZsDOCaxTpr+OoCefsUaUFFWFZV2P318Sq/wpGCA38tMedA1ge1JUbUUDUvMv44SgNTWWY9P/uf1FD+C/0bl1RgNqs/KKEnIZTOR76uOG6DdGk6s9J20E92XSyFFCw9RRll3Hczb0/3PlTCilJQ1e1b53SA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D4FygHKzIpjZBZXAKt5zllTPdxnnKkm0tRRF+1cMINs=;
 b=IbKe+hWYf1l8zkM3YbvWezM/hXGWi/L96CXH32Qqz6yRvVvFUtgGXIiXnAQpIZ7o3ZuJnMIAH9jbqeOBDMceL/nJS3VayIXicMGIXL9NR+iFAPel2VpB5Y830szgVveiBvr6o0V+olCi9doiVlUgYwgVQbB/Ps8q4Z6g16/7ilRQgvsS+Hi4R95lJIpLf56N/wv3JkgAxtHmzse4pK74WdynoOjLHxOA80fuh4bgQmQnMmDVR9xdqdR0pkgZivPrV8CLmIy266fM7rViq4mc4TODK5ncm4Zlsi7fwUTMOHG/5p0xYD7wuq3JhFGGifoFON16oWmi+nZEuQSgY5VKTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D4FygHKzIpjZBZXAKt5zllTPdxnnKkm0tRRF+1cMINs=;
 b=L7EQTt7igXICKYfM/Z7V4oW0yShGdFhFH6Q1Tj0PW6ZY2isju6IVTQuZtzelxISeYaQgzps9PXSxGMTD3bsiAPUvfI+swVj1duR5ltDM9WuSoc8V+xdctlMxrxmRIjUeyNabUeHDqvr4Huy0ZKL2CQV6u9C9jrm8egz0X8v33UU=
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by AS4PR04MB9505.eurprd04.prod.outlook.com (2603:10a6:20b:4e4::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.23; Wed, 17 Jan
 2024 05:57:03 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::efd8:23d4:18bf:630a]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::efd8:23d4:18bf:630a%4]) with mapi id 15.20.7181.029; Wed, 17 Jan 2024
 05:57:03 +0000
From: Xu Yang <xu.yang_2@nxp.com>
To: Alan Stern <stern@rowland.harvard.edu>
CC: "heikki.krogerus@linux.intel.com" <heikki.krogerus@linux.intel.com>, Greg
 KH <gregkh@linuxfoundation.org>, "benjamin.tissoires@redhat.com"
	<benjamin.tissoires@redhat.com>, "hdegoede@redhat.com" <hdegoede@redhat.com>,
	"ivan.orlov0322@gmail.com" <ivan.orlov0322@gmail.com>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, dl-linux-imx
	<linux-imx@nxp.com>, Jun Li <jun.li@nxp.com>
Subject: RE: [EXT] Re: [PATCH] usb: roles: try to get/put all relevant modules
Thread-Topic: [EXT] Re: [PATCH] usb: roles: try to get/put all relevant
 modules
Thread-Index:
 AQHaRSyichehZ/oUbUS9eAYp9PNYSrDV1xaAgAAAwwCAAAvTQIAATzkAgAPzOkCAAPAvgIAAx6/QgADCqYCAAOYvsA==
Date: Wed, 17 Jan 2024 05:57:02 +0000
Message-ID:
 <DU2PR04MB8822149F7BBDDD0B59ECDE918C722@DU2PR04MB8822.eurprd04.prod.outlook.com>
References: <20240112080108.1147450-1-xu.yang_2@nxp.com>
 <2024011213-situated-augmented-64a4@gregkh>
 <2024011220-asleep-dragster-1e39@gregkh>
 <DU2PR04MB8822D9964496E39002D131D98C6F2@DU2PR04MB8822.eurprd04.prod.outlook.com>
 <2024011214-disbelief-sincere-805e@gregkh>
 <DU2PR04MB8822B8AD6A6DE873F2F160588C6C2@DU2PR04MB8822.eurprd04.prod.outlook.com>
 <b1edb397-c06d-4112-b2ed-713e213ac751@rowland.harvard.edu>
 <DU2PR04MB8822E96E3AFF2EBB587B73BA8C732@DU2PR04MB8822.eurprd04.prod.outlook.com>
 <d8f379d2-82ee-4567-8323-961cea5fd095@rowland.harvard.edu>
In-Reply-To: <d8f379d2-82ee-4567-8323-961cea5fd095@rowland.harvard.edu>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU2PR04MB8822:EE_|AS4PR04MB9505:EE_
x-ms-office365-filtering-correlation-id: 7fdddef6-d452-474d-e9ec-08dc172120b7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 IIu6Vr/R1e1CA1AZHn/Gzd11oUkmgiTXe4NE1fcWuGgu61xknFYZG19r+taDS3EgoVj+kulFz5RZHff1P3lvFqLBvjP09qOj4QPPUYkvqzn+5y6ZIArjsKk5XLdWc2/Tgr/mW4+XcrSm6ucdMhp+A7CRFuE/dFurj5IcA/8rDN3E+RcHhvNu9Q0kAF5LuBy1pECKQ18Lho+3SZezuDlOnMIsWjQGqH7pJNY34N0b0Qz0knOtDN6GJVVrwCyvaiA+T5ZAuqFcwGHLxk10LWf3SpGPgoFxZjo0kHoYhHklFUKiynhU94pc0enlcUZgV5I43Da9RcaHqYtNj0CiL3/pi2S7i1yDmA+/nF4y1Gu0PN8YI11091MAPCCvXmSEtWiGvJ1oSRIzz69Xi0dn/fs/OuxdKgiFbRuWTaVctImImExhajFicyuQVFsF+W8tDfvS7GJIOmZTjrVT0ToiMoXihfHmHpiBWDhk8KUG9LjimqJPYEfvpRdTPsp4ja7W3X7YFa8fbO7/NxNg3xq+rJaB+1f51HP+7Taatn4lnVtEF6yHDAMLP4539YgVtOlj1QvwGYQyvwl4PbFbgfyTBDvfUamT4Hl1tFWPXYRpQl3nWDQYJnhWdiQyPFmV2WXrg5UQ
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(396003)(376002)(366004)(39860400002)(136003)(230922051799003)(451199024)(1800799012)(64100799003)(186009)(2906002)(5660300002)(33656002)(86362001)(38100700002)(122000001)(83380400001)(478600001)(7696005)(6506007)(9686003)(26005)(8676002)(38070700009)(76116006)(4326008)(71200400001)(316002)(66556008)(41300700001)(66946007)(8936002)(52536014)(54906003)(66476007)(6916009)(64756008)(66446008)(55016003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?jVZB6T2iRWxmQVSCt+zNslJP4govpU6afz5DnOm3GNjRYK4OthoJ1R+gMXJp?=
 =?us-ascii?Q?lr3POYRKubOLagh7iUegEIHRcYKEuOEnJin0EsbDOQHNtoGjapof/bGZeiJf?=
 =?us-ascii?Q?7dkbzZ9HC8QPqvBCYQmkgX+f9jnw49Sqn119Z/yK35HX45CB4ev1+Tw3smLq?=
 =?us-ascii?Q?IfMHIDXoId78DDRkrvvzdLdkaz2skAqqijQRwKaXbfUx/DyMihzUM/pAQCYA?=
 =?us-ascii?Q?w+kHgP+m5R6dkGA9XVgdrF9aZAEb1fyjeL6pSMSZYUlcjdFRLbxCoQ+zrXy9?=
 =?us-ascii?Q?XdGS7gDqZuJdcHdmBhx1rtpF/xyFEFvcw84cl+Vg7z2XlCecJ5AN5YZsBRG1?=
 =?us-ascii?Q?4Dfyy7dG3L0hKTPj6a4pV8dpZ3Q4w7sXTogQ4uc+qAI4LW7SYOd13k8bNWFy?=
 =?us-ascii?Q?gb6rWLh0uDT8UL3e2qYrz3b6QgTJ5KwYI7FSp98GcyXkSVQpdNDbRchGkV0r?=
 =?us-ascii?Q?3uH6OZb1anocdSo8jxMDMToZkhnPaUZiwSHMiaVjgZMhHsFgqc7UTpix+3b/?=
 =?us-ascii?Q?lWW6JUe/bi12MBEhHOEtBkKnDDMF3wEV3h3a6c2R9zvsB6v089ctCFr25pX3?=
 =?us-ascii?Q?fUeiYW/gKJiPg9VdywaFb01mrXUJZkonXn+vmX1KilhxffmwlOJir31Q9WxL?=
 =?us-ascii?Q?E5W0Tsi0ECXrrniaa20uDe4ZvkEoonjzzAxzlQDI0/tf/muEMaF8TLNE7Yyp?=
 =?us-ascii?Q?ZC6J0+l4HVSJQ/u1GqwwzKCMI2sZ64VhBEPfi3J32gevUUfkjftH4yD22KHW?=
 =?us-ascii?Q?MWsPEjKAh0oRG0VJVf1xps3jJe0oGSoOhLAmu+TmoIHU1t3/79GT+/wOD8Gz?=
 =?us-ascii?Q?P+nt8D4uWMzmJNScQG68MrLhdQ/pdLJgqWSVxrA07JbjGjo1vd6tY/bW3Wfp?=
 =?us-ascii?Q?Mxrpusu+6kxOpR9aH0NCIsT43qXO9JUc7TT/0iYR6xGUlVGh0dEe++UZHsOp?=
 =?us-ascii?Q?77TcncPFLaLjCO13SZ40B/VFWQB2To8Rp6fSZR7RVyc4Veeepkn92F9menW1?=
 =?us-ascii?Q?KI4u4LVJMKnWhVq+i5CAJqgOx7HcfUd4vdMmCuSbGjXHmQejsdBIFRTFDk1w?=
 =?us-ascii?Q?hUjb6fzHQG1dS6VgJY3maCCEOA29fR16VWo1AF53N6FuwmnkEsXxVSr5T3J9?=
 =?us-ascii?Q?owXK9bEuDDQsB69u3CI2GBKlRxSupxqqJ2j4lBUN4iFABF35dGOg5JqSE31Q?=
 =?us-ascii?Q?uioamFuEOEic/F4/+8GPQDEK1AVO3ojTarM/Z2L8ZT3/bBt1bU3QBZX/ZD2N?=
 =?us-ascii?Q?pRVTVLWAm1/eAnMNw+02myCeXiwEJTVpjZldo7gwcOmiAArOn1di7RuRD26A?=
 =?us-ascii?Q?OwZPyreDb/Hv8+D5kMusRs6tMtHlnWZwxNxx4sXNgkRzXyzy0DBoo0WsuTP/?=
 =?us-ascii?Q?rgGIl9ETKozmH7MLRXAdmuwgJ3CapA3ucaRbeoHhG0a0wjlQGieOVWAC5hep?=
 =?us-ascii?Q?f/lIZssxr3bSDKcHo6eIxioIfzweuG6l9FpMg4aIDkOJbFtAT8WQB8g2ZE0f?=
 =?us-ascii?Q?8yhKnoid/6nnGbrmnD6YAmH6ik97mhcCpDQC9x6X4XE6i9J1HBRSjmrXClum?=
 =?us-ascii?Q?UelkV6QvLY9RCDGDoNI=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fdddef6-d452-474d-e9ec-08dc172120b7
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jan 2024 05:57:02.9485
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MYjzUh14KfXJj2767h7EsnYNYv26+3rSgSgjWdhosGabhSNuZD+sFjgQixDoI33fpeDEHGSEJOKIToglpW0MgQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9505

Hi Alan,

>=20
> On Tue, Jan 16, 2024 at 05:44:47AM +0000, Xu Yang wrote:
> > Hi Alan,
> >
> > >
> > > Those of us unfamiliar with this code need you to explain a lot more
> > > about what's going on.
> > >
> > > On Mon, Jan 15, 2024 at 03:02:06AM +0000, Xu Yang wrote:
> > > > Taking below diagram as example:
> > > >
> > > >      ci_hdrc.0        register   usb    get     tcpm_port
> > > >   (driver: ci_hdrc)  --------->  role  <----  (driver: tcpm)
> > > >          ^  ^                    switch           |   ^
> > > >          |  |                                     |   |
> > > >        +1|  |           +1                        |   |+1
> > > >          |  +-------------------------------------+   |
> > > >          |                                            |
> > > >      4c200000.usb                                   1-0050
> > > > (driver: ci_hdrc_imx)                            (driver: tcpci)
> > > >
> > > > 1. Driver ci_hdrc_imx and tcpci are built as module at least.
> > > > 2. When module ci_hdrc_imx is loaded, it will register ci_hdrc.0 de=
vice
> > > >    and try to get ci_hdrc module's reference.
> > >
> > > This is very confusing.  Normally, a device is registered by the pare=
nt
> > > module and its driver belongs in the child module.  When the child
> > > module is loaded it automatically gets a reference to the parent modu=
le,
> > > because it calls functions that are defined in the parent.  I don't k=
now
> > > of any cases where a parent module takes a reference to one of its
> > > children -- this would make it impossible to unload the child module!
> > >
> > > In your diagram I can't tell whether ci_hdrc is the parent module and
> > > ci_hdrc_imx is the child, or vice versa.  I'll guess that ci_hdrc_imx=
 is
> > > the child, since it the one which gets a reference to the other.  But
> > > now we have the ci_hdrc.0 device being registered by the child module
> > > and its driver belonging to the parent module, which is backward!
> > >
> > > Very difficult to understand.  Please explain more fully.
> >
> > I checked again and let me correct the words.
> >
> > 2. When module ci_hdrc_imx is loaded, it will register ci_hdrc.0 device=
.
> >    At the same time, the reference of module ci_hdrc is added by 1
> >    automatically due to ci_hdrc_imx calls some functions in module ci_h=
drc.
> >    ci_hdrc will register usb-role-switch device.
> >
> > Therefore, module ci_hdrc_imx depends on module ci_hdrc. Device ci_hdrc=
.0
> > is a child of 4c200000.usb.
>=20
> And ci_hdrc_imx is a child module of ci_hdrc.  Got it.
>=20
> > > >  ci_hdrc will register
> > > >    usb-role-switch device.
> > > > 3. When module tcpci is loaded, it will register tcpm port device a=
nd try
> > > >    to get tcpm module's reference. The tcpm module will get usb-rol=
e-switch
> > > >    which is registered by ci_hdrc.
> > >
> > > What do you mean by "will get"?  Do you mean that tcpm will become th=
e
> > > driver for the usb_role_switch device?  Or do you mean that it simply
> > > calls get_device(&usb_role_switch)?
> > >
> > > If the latter is the case, how does the tcpm driver learn the address=
 of
> > > usb_role_switch in the first place?
> >
> > Via
> > port->role_sw =3D usb_role_switch_get(port->dev)
> > or
> > port->role_sw =3D fwnode_usb_role_switch_get(tcpc->fwnode).
> >
> > The usb controller will register usb-role-swtich device to the global l=
ist
> > of usb_role class. The fwnode of usb-role-swtich device is also set to =
usb
> > controller's fwnode. Initially, a fwnode graph between usb controller o=
f
> > node and tcpm connector node had already been established. These two
> > functions will find usb-role-swtich device based on this fwnode graph
> > and fwnode matching.
>=20
> If usb_role_switch_get() gives away references to the usb_role_switch
> device, it should have a way to take those references back.  But I guess
> it doesn't.
>=20
> >  After usb-role-switce device is found, these two
> > functions will call: try_module_get(sw->dev.parent->driver->owner).
>=20
> You mean usb_role_switch_get() and fwnode_usb_role_switch_get() do this?

Yes.

>=20
> > Here sw->dev.parent is device ci_hdrc.0. sw->dev.parent->driver is ci_h=
drc.
> >
> > >
> > > >  In current design, tcpm will also try to
> > > >    get ci_hdrc module's reference after get usb-role-switch.
> > >
> > > This might be a bug.  There should not be any need for the tcpm drive=
r
> > > to take a reference to the ci_hdrc module.  But there should be a way
> > > for the ci_hdrc driver to notify tcpm when the usb_role_switch device=
 is
> > > about to be unregistered.  If tcpm is usb_role_switch's driver then t=
his
> > > notification happens automatically, by means of the .remove() callbac=
k.
> >
> > I'm not the designer of usb_role class driver. Not sure if this is need=
ed to get
> > module reference of its parent device's driver. Maybe need @heikki's in=
put.
> >
> > @heikki.krogerus, can you give some explanations?
>=20
> Yes, please, some additional explanation would help.
>=20
> > > > 4. Due to no modules depend on ci_hdrc_imx, ci_hdrc_imx can be manu=
ally
> > > >    unloaded. Then device ci_hdrc.0 will be removed by ci_hdrc_imx a=
nd
> > > >    device usb-role-switch is also unregistered.
> > >
> > > At this point, tcpm should learn that it has to drop all its referenc=
es
> > > to usb_role_swich.  Since the module which registered usb_role_switch
> > > isn't tcpm's ancestor, tcpm must not keep _any_ references to the dev=
ice
> > > after it is unregistered.
> >
> > Yes, I also think so.
> >
> > >
> > > Well, strictly speaking that's not true.  By misusing the driver mode=
l,
> > > tcpm could keep a reference to the ci_hdrc module until it was finish=
ed
> > > using usb_role_switch.  Is that what you are trying to do?
> >
> > No, I'm trying to get module reference of ci_hdrc_imx too. Then,
> > ci_hdrc_imx can't be unloaded before tcpci module unloaded.
>=20
> You shouldn't do this.  Users should be able to unload ci_hdrc_imx
> whenever they want, even if tcpci is still loaded.

Okay. Understand.

>=20
> > > > 5. Then, if I try to unload module tcpci, "NULL pointer dereference=
"
> > > >    will be shown due to below code:
> > > >
> > > >    module_put(sw->dev.parent->driver->owner);
>=20
> I forgot to ask: What function makes this call?  Is it part of the
> usb_role class driver?

usb_role_switch_put() do this.
Yes, it's a function of usb_role class driver.

>=20
> > > >    parent->driver is NULL at this time.
> > >
> > > What is dev at this point?  And what is dev.parent?  And what did
> > > dev.parent->driver used to be before it was set to NULL?
> >
> > Here sw->dev is usb-role-switch device. sw->dev.parent is ci_hdrc.0 dev=
ice.
> > sw->dev.parent->driver was ci_hdrc.
>=20
> Which is now gone, right.  I understand.
>=20
> Let's see what Heikki has to say.
>=20
> However, assuming he wants to continue misusing the driver model in this
> way, what you should do is add a new field to sw, where you will store
> sw->dev.parent->driver.owner at the time of the try_module_get() call
> (but only if the call succeeds!).  Then when the module_put() call runs,
> have it use the value stored in this new field instead of dereferencing
> sw->dev.parent->driver.owner.

It sounds like a better solution.=20
Thanks for the suggestion!

Best Regards,
Xu Yang


