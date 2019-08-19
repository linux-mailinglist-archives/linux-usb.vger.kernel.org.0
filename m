Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6162D950C6
	for <lists+linux-usb@lfdr.de>; Tue, 20 Aug 2019 00:29:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728602AbfHSW2v (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 19 Aug 2019 18:28:51 -0400
Received: from nat-hk.nvidia.com ([203.18.50.4]:10301 "EHLO nat-hk.nvidia.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728438AbfHSW2v (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 19 Aug 2019 18:28:51 -0400
X-Greylist: delayed 303 seconds by postgrey-1.27 at vger.kernel.org; Mon, 19 Aug 2019 18:28:42 EDT
Received: from hkpgpgate102.nvidia.com (Not Verified[10.18.92.100]) by nat-hk.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5d5b216b0000>; Tue, 20 Aug 2019 06:23:39 +0800
Received: from HKMAIL104.nvidia.com ([10.18.16.13])
  by hkpgpgate102.nvidia.com (PGP Universal service);
  Mon, 19 Aug 2019 15:23:38 -0700
X-PGP-Universal: processed;
        by hkpgpgate102.nvidia.com on Mon, 19 Aug 2019 15:23:38 -0700
Received: from HKMAIL102.nvidia.com (10.18.16.11) by HKMAIL104.nvidia.com
 (10.18.16.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 19 Aug
 2019 22:23:37 +0000
Received: from NAM01-SN1-obe.outbound.protection.outlook.com (104.47.32.58) by
 HKMAIL102.nvidia.com (10.18.16.11) with Microsoft SMTP Server (TLS) id
 15.0.1473.3 via Frontend Transport; Mon, 19 Aug 2019 22:23:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FOtspqNazT/aSJqUBuqi/kK7svcynkU21WKkvnn7lIDCGRbElvlJStpM21QcnqQnDz6/hyxPIoF2sejct2Z0HXp5WqFQy43KYxLFaFF0kBBbOz0KMSykmgvaDLZkNmEOVZcaMGXf2v2N3tweTJeaWyGb/ZiSDoSluh90wIyetxFdrmNRbqOyg4iugJbzzkhhfrqI2S8eV3j7jK+sY+K6LR0K2ad+CtU+Q6j5AmSyC0f5+yVTTRBsOUzfY6Mp9KT/ehDRsnqXX/krV7+RBc3MIOIPlCEE6cPt3p7qCa8M7mRJQxJp9EK0sb9vIQDG6IyTMhTP2tSRfPtITa9al2D41g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JWOEQh0/UdHdMBZ0r7YhKimgrmrCc6Vta6N+8IZghHk=;
 b=BhNcLEVYlLQRLkguJriW31CPpJAVUU+kpARnswBG/wIY27aU6uw+7aY13rPPp3/AT/IvAtTRPnQ4ThT0jeEyHtKCRTeQ233GmH8AnYhZP/JD3FDWiF7FpS8xkwYxSMvwlcqVr+3nsGt3QPumCWKUAZ+Fh467jNefQKhf96SWNvuViOkAzH3knqjonSkpQeMVYHPOpo9+sWl3VefsMNIksRcgpc8qNk7r035T25mqDECqdh1jQXCGgGlrJhY9ydAtaajeAe8yuZfhctwAb9ZKwarS/eT4HF/2h0MQ5rZmW/WhE4jkhyLq9KuhpCpbTeLQXFU98RKNFwxQQZN8+yg69Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
Received: from BYAPR12MB2727.namprd12.prod.outlook.com (20.177.125.216) by
 BYAPR12MB2821.namprd12.prod.outlook.com (20.177.229.31) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.18; Mon, 19 Aug 2019 22:23:29 +0000
Received: from BYAPR12MB2727.namprd12.prod.outlook.com
 ([fe80::c9f:7678:41:35ed]) by BYAPR12MB2727.namprd12.prod.outlook.com
 ([fe80::c9f:7678:41:35ed%6]) with mapi id 15.20.2178.018; Mon, 19 Aug 2019
 22:23:29 +0000
From:   Ajay Gupta <ajayg@nvidia.com>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Ajay Gupta <ajaykuee@gmail.com>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: RE: [PATCH v2] usb: typec: ucsi: add support for separate DP altmode
 devices
Thread-Topic: [PATCH v2] usb: typec: ucsi: add support for separate DP altmode
 devices
Thread-Index: AQHVS7wb8poibmIz8Ei/FLJd6Gk+Sab8ZwSAgAaogWA=
Date:   Mon, 19 Aug 2019 22:23:29 +0000
Message-ID: <BYAPR12MB27270969F256DBF62017AFACDCA80@BYAPR12MB2727.namprd12.prod.outlook.com>
References: <20190805182413.29362-1-ajayg@nvidia.com>
 <20190815153645.GD24772@kuha.fi.intel.com>
In-Reply-To: <20190815153645.GD24772@kuha.fi.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Enabled=True;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_SiteId=43083d15-7273-40c1-b7db-39efd9ccc17a;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Owner=ajayg@nvidia.com;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_SetDate=2019-08-19T22:23:28.0397836Z;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Name=Unrestricted;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Application=Microsoft Azure
 Information Protection;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_ActionId=36d2907e-dee5-4abb-871d-d706fcd9dd06;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Extended_MSFT_Method=Automatic
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=ajayg@nvidia.com; 
x-originating-ip: [216.228.112.22]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4b84d2d7-eab9-4eb3-a4c7-08d724f3dcc4
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);SRVR:BYAPR12MB2821;
x-ms-traffictypediagnostic: BYAPR12MB2821:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <BYAPR12MB2821DA02146B3BF453315124DCA80@BYAPR12MB2821.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-forefront-prvs: 0134AD334F
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(39860400002)(136003)(366004)(376002)(346002)(396003)(199004)(189003)(316002)(74316002)(53936002)(9686003)(4326008)(6246003)(110136005)(6506007)(186003)(6436002)(305945005)(53946003)(102836004)(6116002)(3846002)(26005)(446003)(11346002)(7736002)(486006)(6306002)(86362001)(55016002)(5660300002)(966005)(14454004)(76176011)(66066001)(30864003)(71190400001)(476003)(71200400001)(478600001)(52536014)(66476007)(81156014)(66556008)(8676002)(64756008)(66446008)(81166006)(66946007)(256004)(76116006)(7696005)(14444005)(2906002)(25786009)(99286004)(229853002)(33656002)(8936002)(6606295002);DIR:OUT;SFP:1101;SCL:1;SRVR:BYAPR12MB2821;H:BYAPR12MB2727.namprd12.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nvidia.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: QmPKr2I+K3qLy2saSQmNtkv/vcO1eBOq0TVtGv3MvvN7tMqNoJfKTTpuv0ymkc2PqJ2JTQAEnA6Yrmts3wrLXQne0I7Oy2QBBcpDwa/AS+Hphv9wPtaRgJy98g0a8pUHA5V3d3MTPVGo0hyN8AKo86btTshu5IdsGEmNhN/GdFz1cpEZ2LavwN1OhNiTEn9s+Y5FnsA0DHWFmiWbXSq/maqpTt7W1IZCJRrYW9kA9i9zBEibrBt8EVgC6qJ0AmC3BxkxZ7oJ9Rze0q9sPWKWcUQkr+qHnykPrwOhir0Ip7yo5QfZPy8L2EE5lJ2h8a/4chnywlwdmcX/q/VcUNenqI5aZ0RH5jnd+gPsz6EJXs88MKqxBXWb2BX0YywWUzdKa6zQp37xNqL9abyy64xgBMmJpRZZCfHdUmDsi4SQ/yw=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b84d2d7-eab9-4eb3-a4c7-08d724f3dcc4
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Aug 2019 22:23:29.4362
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pBB0yZSAP5+UMJ+syMeoxxft70UgcCrAjnxoO9NbC4gJ4Ru2JHeKltgH0rsUcj3EnKG4Er5P9K/QjiloHuc7Gg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2821
X-OriginatorOrg: Nvidia.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1566253419; bh=JWOEQh0/UdHdMBZ0r7YhKimgrmrCc6Vta6N+8IZghHk=;
        h=X-PGP-Universal:ARC-Seal:ARC-Message-Signature:
         ARC-Authentication-Results:From:To:CC:Subject:Thread-Topic:
         Thread-Index:Date:Message-ID:References:In-Reply-To:
         Accept-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:msip_labels:
         authentication-results:x-originating-ip:x-ms-publictraffictype:
         x-ms-office365-filtering-correlation-id:x-microsoft-antispam:
         x-ms-traffictypediagnostic:x-ms-exchange-purlcount:
         x-microsoft-antispam-prvs:x-ms-oob-tlc-oobclassifiers:
         x-forefront-prvs:x-forefront-antispam-report:received-spf:
         x-ms-exchange-senderadcheck:x-microsoft-antispam-message-info:
         x-ms-exchange-transport-forked:MIME-Version:
         X-MS-Exchange-CrossTenant-Network-Message-Id:
         X-MS-Exchange-CrossTenant-originalarrivaltime:
         X-MS-Exchange-CrossTenant-fromentityheader:
         X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
         X-MS-Exchange-CrossTenant-userprincipalname:
         X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-OriginatorOrg:
         Content-Language:Content-Type:Content-Transfer-Encoding;
        b=fco0cnWOhvVvM6CRxEQbgryifQGFdp5ymomZNETiHRT03SjAn8HRLPqkkRdICM4BT
         t0lS9UKfEAcmqaeh3LECaaeZuuY6mG9ouRaY2eEz1umwNJBLBTZPWtHxaBDQBXkPP9
         +QM5QAvmRY3x61avYGSYw4hQjWH+EieZO8lu6B9+NiH2d+mYHH4fqNlGe2emfbK8zE
         ui8qlSpBRV9fwek2bsHGwyusTXK/K3IDQ7A/NSnZRCBcoiHs0I8SV0QY8CZD6qIa/C
         xyR4IdtUUYK3R/2xjKDyF3nkzgom+TYq12wCm8RwPqMft/EbUuXzctrfxwAuN6tye0
         CBYz5O3KbWyLw==
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Heikki

> On Mon, Aug 05, 2019 at 11:24:13AM -0700, Ajay Gupta wrote:
> > From: Ajay Gupta <ajayg@nvidia.com>
> >
> > CCGx controller used on NVIDIA GPU card has two separate display
> > altmode for two DP pin assignments. UCSI specification doesn't
> > prohibits using separate display altmode.
> >
> > Current UCSI Type-C framework expects only one display altmode for all
> > DP pin assignment. This patch squashes two separate display altmode
> > into single altmode to support controllers with separate display
> > altmode. We first read all the alternate modes of connector and then
> > run through it to know if there are separate display altmodes. If so,
> > it prepares a new port altmode set after squashing two or more
> > separate altmodes into one.
> >
> > Signed-off-by: Ajay Gupta <ajayg@nvidia.com>
> > ---
> > Original discussion on this issue is at [1]
> >
> > Change from v1->v2
> > 	- Fix ucsi->ppm NULL check in ucsi_sync based on
> > 	comment from an automated email from someone (I lost the email).
> >
> > 1. https://marc.info/?l=3Dlinux-usb&m=3D154905866830998&w=3D2
> >
> >  drivers/usb/typec/ucsi/ucsi.c | 212
> > ++++++++++++++++++++++++++++++++--
> >  drivers/usb/typec/ucsi/ucsi.h |  12 ++
> >  2 files changed, 217 insertions(+), 7 deletions(-)
> >
> > diff --git a/drivers/usb/typec/ucsi/ucsi.c
> > b/drivers/usb/typec/ucsi/ucsi.c index ba288b964dc8..68ea66fcaa0e
> > 100644
> > --- a/drivers/usb/typec/ucsi/ucsi.c
> > +++ b/drivers/usb/typec/ucsi/ucsi.c
> > @@ -39,11 +39,37 @@
> >   */
> >  #define UCSI_SWAP_TIMEOUT_MS	5000
> >
> > +static void ucsi_update_get_current_cam_cmd(struct ucsi_connector *con=
,
> > +					    struct ucsi_data *data)
> > +{
> > +	u8 cam, new_cam;
> > +
> > +	if (data->cci.data_length =3D=3D 0x1) {
> > +		cam =3D data->message_in[0];
> > +		new_cam =3D con->port_alt[cam].linked_idx;
> > +		data->message_in[0] =3D new_cam;
> > +		con->new_port_alt[new_cam].active_idx =3D cam;
> > +	}
> > +}
> > +
> >  static inline int ucsi_sync(struct ucsi *ucsi)  {
> > -	if (ucsi->ppm && ucsi->ppm->sync)
> > -		return ucsi->ppm->sync(ucsi->ppm);
> > -	return 0;
> > +	struct ucsi_connector *con =3D ucsi->connector;
> > +	struct ucsi_data *data;
> > +	int ret =3D 0;
> > +
> > +	if (ucsi->ppm && ucsi->ppm->sync) {
> > +		ret =3D ucsi->ppm->sync(ucsi->ppm);
> > +		if (ret)
> > +			return ret;
> > +
> > +		data =3D ucsi->ppm->data;
> > +		if (data->ctrl.alt.cmd =3D=3D UCSI_GET_CURRENT_CAM &&
> > +		    con->has_multiple_dp)
> > +			ucsi_update_get_current_cam_cmd(con, data);
>=20
> Since you are capturing commands, then couldn't this be initially handled=
 in
> ucsi_ccg.c?
We can do in ucsi_ccg.c but the idea is to do it for all ucsi controllers.

> > +	}
> > +
> > +	return ret;
> >  }
> >
> >  static int ucsi_command(struct ucsi *ucsi, struct ucsi_control *ctrl)
> > @@ -101,14 +127,65 @@ static int ucsi_ack(struct ucsi *ucsi, u8 ack)
> >  	return ret;
> >  }
> >
> > +static void ucsi_update_set_new_cam_cmd(struct ucsi_connector *con,
> > +					struct ucsi_control *ctrl)
> > +{
> > +	struct new_ucsi_altmode *new_port, *port;
> > +	struct typec_altmode *alt =3D NULL;
> > +	u64 cmd;
> > +	u8 new_cam, cam, pin;
> > +	bool enter_new_mode;
> > +	int i, j, k =3D 0xff;
> > +
> > +	cmd =3D ctrl->raw_cmd;
> > +	new_cam =3D (cmd >> 24) & 0xff;
> > +	new_port =3D &con->new_port_alt[new_cam];
> > +	cam =3D new_port->linked_idx;
> > +	enter_new_mode =3D (cmd >> 23) & 1;
> > +
> > +	if (cam =3D=3D UCSI_MULTI_LINKED_INDEX) {
> > +		if (enter_new_mode) {
> > +			port =3D con->port_alt;
>=20
> You could have set that earlier, no?
Yes, we can do that.
=20
> > +			for (i =3D 0; con->partner_altmode[i]; i++) {
> > +				alt =3D con->partner_altmode[i];
> > +				if (alt->svid =3D=3D new_port->svid)
> > +					break;
> > +			}
>=20
> Why do you enter the next loop even if !alt?
Since this is for UCSI_SET_NEW_CAM command so there will be atleast one
con->partner_altmode[i] with svid matching with new_port->svid and therefor=
e
alt will always be non-NULL. I can still add a check after above loop if ne=
eded.

>=20
> > +			for (j =3D 0; port[j].svid; j++) {
> > +				pin =3D DP_CONF_GET_PIN_ASSIGN(port[j].mid);
> > +				if (alt && port[j].svid =3D=3D alt->svid &&
> > +				    (pin & DP_CONF_GET_PIN_ASSIGN(alt-
> >vdo))) {
> > +					/* prioritize pin E->D->C */
> > +					if (k =3D=3D 0xff || (k !=3D 0xff && pin >
> > +
> DP_CONF_GET_PIN_ASSIGN(port[k].mid))
> > +					    ) {
> > +						k =3D j;
> > +					}
> > +				}
> > +			}
>=20
> That is really difficult to read, let alone understand. You are making
> assumption here that the alt mode is always DP alt?
There is no assumption for always DP but it will be always DP due to below =
check at top.
+	if (cam =3D=3D UCSI_MULTI_LINKED_INDEX) {

UCSI_MULTI_LINKED_INDEX is set only after getting a duplicate DP altmode. I=
 can rename
the macro to reflect DP only (if needed).

The code is trying to find best connector alt mode (CAM) index to set from =
among the
multiple DP alt mode. It priorities pin E to D to C.=20

For example, NVIDIA port reports below altmodes:
svid        	vdo                                      cam                  =
   linked_idx
-----        	-----			------		-----------------
0x955		0x1			0		0
0xff01		0x405 (pin C)		1		1
0xff01		0x805 (pin D)		2		1
0x955		0x3			3		2

Then ucsi_altmode_update_active() will squash  duplicate altmode 0xff01 int=
o one=20
and create altmode table as listed below.
svid        	vdo			cam		linked_idx
-----        	-----			------		------------
0x955		0x1			0		0
0xff01		0xC05 (pin C, D)		1		UCSI_MULTI_LINKED_INDEX
0x955		0x3			2		3

Now when UCSI_SET_NEW_CAM is initiated for 0xff01 and 0xC05 then we need to
talk to controller in terms of original altmode table where we have option =
to
either select pin C or pin D. The logic will select pin D here.

I will add some comments to this code to make it clear.
=20
> > +			cam =3D k;
> > +			new_port->active_idx =3D cam;
> > +		} else {
> > +			cam =3D new_port->active_idx;
> > +		}
> > +	}
>=20
> You have a lot of nested stuff here. Please see if you can improve the ab=
ove
> code.
Ok, will do.
=20
> > +	cmd &=3D ~(0xff << 24);
>=20
> I'm not sure I understand why couldn't the cmd be 0 before this point?
We are trying to fill in the updated CAM based on original altmode table in=
 the command
without touching any other bits.

> Actually, do you even need that variable for anything?
We don't really need cmd variable. I added it to make it simpler.
=20
> > +	cmd |=3D (cam << 24);
> > +	ctrl->raw_cmd =3D cmd;
>=20
> Couldn't you just update ctrl->raw_cmd directly?
Yes, will do.
>=20
> > +}
> > +
> >  static int ucsi_run_command(struct ucsi *ucsi, struct ucsi_control *ct=
rl,
> >  			    void *data, size_t size)
> >  {
> >  	struct ucsi_control _ctrl;
> > +	struct ucsi_connector *con =3D ucsi->connector;
> >  	u8 data_length;
> >  	u16 error;
> >  	int ret;
> >
> > +	if (ctrl->alt.cmd =3D=3D UCSI_SET_NEW_CAM && con->has_multiple_dp)
> > +		ucsi_update_set_new_cam_cmd(con, ctrl);
> > +
> >  	ret =3D ucsi_command(ucsi, ctrl);
> >  	if (ret)
> >  		goto err;
> > @@ -364,10 +441,24 @@ static int ucsi_register_altmodes(struct
> > ucsi_connector *con, u8 recipient)
> >
> >  	for (i =3D 0; i < max_altmodes;) {
> >  		memset(alt, 0, sizeof(alt));
> > -		UCSI_CMD_GET_ALTERNATE_MODES(ctrl, recipient, con-
> >num, i, 1);
> > -		len =3D ucsi_run_command(con->ucsi, &ctrl, alt, sizeof(alt));
> > -		if (len <=3D 0)
> > -			return len;
> > +
> > +		if (recipient =3D=3D UCSI_RECIPIENT_CON) {
> > +			if (con->has_multiple_dp) {
> > +				alt[0].svid =3D con->new_port_alt[i].svid;
> > +				alt[0].mid =3D con->new_port_alt[i].mid;
> > +			} else {
> > +				alt[0].svid =3D con->port_alt[i].svid;
> > +				alt[0].mid =3D con->port_alt[i].mid;
> > +			}
> > +			len =3D sizeof(alt[0]);
> > +		} else {
> > +			UCSI_CMD_GET_ALTERNATE_MODES(ctrl, recipient,
> > +						     con->num, i, 1);
> > +			len =3D ucsi_run_command(con->ucsi, &ctrl, alt,
> > +					       sizeof(alt));
> > +			if (len <=3D 0)
> > +				return len;
> > +		}
> >
> >  		/*
> >  		 * This code is requesting one alt mode at a time, but some
> PPMs @@
> > -521,6 +612,103 @@ static void ucsi_partner_change(struct ucsi_connecto=
r
> *con)
> >  		ucsi_altmode_update_active(con);
> >  }
> >
> > +static void ucsi_update_con_altmodes(struct ucsi_connector *con) {
> > +	int max_altmodes =3D con->ucsi->cap.num_alt_modes;
> > +	struct new_ucsi_altmode *alt, *new_alt;
> > +	int i, j, k =3D 0;
> > +	bool found =3D false;
> > +
> > +	alt =3D con->port_alt;
> > +	new_alt =3D con->new_port_alt;
> > +	memset(con->new_port_alt, 0, sizeof(con->new_port_alt));
> > +
> > +	for (i =3D 0; i < max_altmodes; i++) {
> > +		if (!alt[i].svid)
> > +			break;
> > +
> > +		/* already checked and considered */
> > +		if (alt[i].checked)
> > +			continue;
> > +
> > +		if (!DP_CONF_GET_PIN_ASSIGN(alt[i].mid)) {
> > +			/* Found Non DP altmode */
> > +			new_alt[k].svid =3D alt[i].svid;
> > +			new_alt[k].mid |=3D alt[i].mid;
> > +			new_alt[k].linked_idx =3D i;
> > +			alt[i].linked_idx =3D k;
> > +			k++;
> > +			continue;
> > +		}
> > +
> > +		for (j =3D i + 1; j < max_altmodes; j++) {
> > +			if (alt[i].svid !=3D alt[j].svid ||
> > +			    !DP_CONF_GET_PIN_ASSIGN(alt[j].mid)) {
> > +				continue;
> > +			} else {
> > +				/* Found duplicate DP mode */
> > +				new_alt[k].svid =3D alt[i].svid;
> > +				new_alt[k].mid |=3D alt[i].mid | alt[j].mid;
> > +				new_alt[k].linked_idx =3D
> UCSI_MULTI_LINKED_INDEX;
> > +				alt[i].linked_idx =3D k;
> > +				alt[j].linked_idx =3D k;
> > +				alt[j].checked =3D true;
> > +				found =3D true;
> > +			}
> > +		}
> > +		if (found) {
> > +			con->has_multiple_dp =3D true;
> > +		} else {
> > +			/* Didn't find any duplicate DP altmode */
> > +			new_alt[k].svid =3D alt[i].svid;
> > +			new_alt[k].mid |=3D alt[i].mid;
> > +			new_alt[k].linked_idx =3D i;
> > +			alt[i].linked_idx =3D k;
> > +		}
> > +		k++;
> > +	}
> > +}
> > +
> > +static int ucsi_get_altmodes(struct ucsi_connector *con) {
> > +	int max_altmodes =3D con->ucsi->cap.num_alt_modes;
> > +	struct ucsi_altmode alt[2];
> > +	struct ucsi_control ctrl;
> > +	int num =3D 1;
> > +	int len;
> > +	int j;
> > +	int i;
> > +	int k =3D 0;
> > +
> > +	memset(con->port_alt, 0, sizeof(con->port_alt));
> > +
> > +	for (i =3D 0; i < max_altmodes;) {
> > +		memset(alt, 0, sizeof(alt));
> > +		UCSI_CMD_GET_ALTERNATE_MODES(ctrl,
> UCSI_RECIPIENT_CON,
> > +					     con->num, i, 1);
> > +		len =3D ucsi_run_command(con->ucsi, &ctrl, alt, sizeof(alt));
> > +		if (len <=3D 0)
> > +			return len;
> > +
> > +		/*
> > +		 * This code is requesting one alt mode at a time, but some
> PPMs
> > +		 * may still return two.
> > +		 */
> > +		num =3D len / sizeof(alt[0]);
> > +		i +=3D num;
> > +
> > +		for (j =3D 0; j < num; j++) {
> > +			if (!alt[j].svid)
> > +				return 0;
> > +
> > +			con->port_alt[k].mid =3D alt[j].mid;
> > +			con->port_alt[k].svid =3D alt[j].svid;
> > +			k++;
> > +		}
> > +	}
> > +	return 0;
> > +}
> > +
> >  static void ucsi_connector_change(struct work_struct *work)  {
> >  	struct ucsi_connector *con =3D container_of(work, struct
> > ucsi_connector, @@ -851,6 +1039,16 @@ static int ucsi_register_port(str=
uct
> ucsi *ucsi, int index)
> >  	if (IS_ERR(con->port))
> >  		return PTR_ERR(con->port);
> >
> > +	/* Get Alternate modes */
> > +	ret =3D ucsi_get_altmodes(con);
> > +	if (ret) {
> > +		dev_err(ucsi->dev,
> > +			"%s: con%d failed (%d)to get port alternate modes\n",
> > +			__func__, con->num, ret);
> > +		return 0;
> > +	}
> > +	ucsi_update_con_altmodes(con);
>=20
> Instead of first collecting all the connector alt modes, and then process=
ing
> them, why not just process every connector alt mode right after getting i=
t?
Yes, we can do that way too. I didn't want to add too much logic into
ucsi_register_altmodes() for readability.
=20
> >  	/* Alternate modes */
> >  	ret =3D ucsi_register_altmodes(con, UCSI_RECIPIENT_CON);
> >  	if (ret)
> > diff --git a/drivers/usb/typec/ucsi/ucsi.h
> > b/drivers/usb/typec/ucsi/ucsi.h index de87d0b8319d..7bbdf83c8d4a
> > 100644
> > --- a/drivers/usb/typec/ucsi/ucsi.h
> > +++ b/drivers/usb/typec/ucsi/ucsi.h
> > @@ -274,6 +274,15 @@ struct ucsi_connector_capability {
> >  	u8:6; /* reserved */
> >  } __packed;
> >
> > +struct new_ucsi_altmode {
> > +	u16 svid;
> > +	u32 mid;
> > +	u8 linked_idx;
> > +	u8 active_idx;
> > +#define UCSI_MULTI_LINKED_INDEX	(0xff)
> > +	bool checked;
> > +} __packed;
>=20
> The name "new_ucsi_altmode" is a not clear to me.
We need new structure for below reasons:
a) linked_idx: To find CAM index from new squashed table to original altmod=
e table
   and vice versa for non-duplicate altmodes
b) active_idx: To store currently active CAM index in original altmode tabl=
e for
   duplicate altmodes.
   For example, whether pin C or pin D is active with DP altmode svid of 0x=
ff01
  =20
c) checked: This is helpful during squash logic. Once we find the duplicate=
 DP altmode then
we mark that as checked and considered and move on to next altmode in origi=
nal table in
for loop.

>=20
> Why don't you just have a pointer to struct ucsi_altmode in that structur=
e?
We can do that.

> I'm not sure you really need those linked_idx, active_idx and checked mem=
bers.
We need them to handle UCSI_SET_NEW_CAM and UCSI_GET_CURRENT_CAM=20
commands. We need a way to find right indexes from original table to new sq=
uashed table
and vice versa.
=20
> > +
> >  struct ucsi_altmode {
> >  	u16 svid;
> >  	u32 mid;
> > @@ -408,6 +417,7 @@ struct ucsi {
> >
> >  struct ucsi_connector {
> >  	int num;
> > +	bool has_multiple_dp;
> >
> >  	struct ucsi *ucsi;
> >  	struct mutex lock; /* port lock */
> > @@ -424,6 +434,8 @@ struct ucsi_connector {
> >
> >  	struct ucsi_connector_status status;
> >  	struct ucsi_connector_capability cap;
> > +	struct new_ucsi_altmode port_alt[UCSI_MAX_ALTMODES];
> > +	struct new_ucsi_altmode new_port_alt[UCSI_MAX_ALTMODES];
>=20
> I'm pretty sure you don't need two of those. You should be able to handle=
 this
> with a pointer to the correct port_altmode member inside your structure. =
You
> can also add a member to your structure that is pointer to another struct=
ure of
> the same type:
>         struct my_ucsi_altmode {
>                 u16 svid;
>                 u32 mid;
>                 struct ucsi_altmode *port_altmode;
>                 struct my_ucsi_altmode *companion[UCSI_MAX_ALTMODES];
>         };
>=20
> But I pretty sure pointer to the correct port_altmode is enough:
>=20
>         struct my_ucsi_altmode {
>                 u16 svid;
>                 u32 mid;
>                 struct ucsi_altmode *port_altmode;
>         };
>=20
> >  };
We want to use data structure which is easy to track and store CAM indexes =
from
from original table to new squashed table and vice versa. Having two arrays=
 of=20
structures was easy to map between original and new tables with indexes. I =
will think
more on this to further simplify it.
=20
> I don't think there is anything preventing all this from being done in uc=
si_ccg.c
> initially. I don't think we need to touch ucsi.h nor ucsi.c at all at thi=
s point.
We need to get all the connector altmodes and then go through it to squash
duplicate DP altmodes. This can be done only in ucsi.c where it sends
UCSI_CMD_GET_ALTERNATE_MODES command.

Currently ucsi.c sends UCSI_CMD_GET_ALTERNATE_MODES command requesting
one altmode at a time and then calls ucsi_register_altmode() to register th=
at single
altmode. Some PPM may send two altmode and we register both.

Even if we change ucsi.c to first collect all altmodes and then register, t=
hen also ucsi_ccg.c
will not be able to send squashed altmodes since it doesn't know if the con=
nector has a=20
duplicate altmode until it receives all of them.
=20
> So just collect the connector alternate modes for example into struct ucs=
i_ccg
> instead of struct ucsi_connector, and then process the commands that need=
 to
> be handled separately in ucsi_ccg_cmd().=20
See above. We will need to collect all altmodes inside ucsi.c and update it=
 there.
Separate handling of commands can be done inside ucsi_ccg.c but I thought i=
t is better
to enable this feature for all ucsi controllers and not only ccg.

Thanks
>nvpublic
>=20
>=20
> thanks,
>=20
> --
> heikki
