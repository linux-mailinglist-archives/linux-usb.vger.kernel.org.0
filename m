Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8921B1103CA
	for <lists+linux-usb@lfdr.de>; Tue,  3 Dec 2019 18:45:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726224AbfLCRpL (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 3 Dec 2019 12:45:11 -0500
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:16312 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726074AbfLCRpL (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 3 Dec 2019 12:45:11 -0500
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5de69f150000>; Tue, 03 Dec 2019 09:44:53 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Tue, 03 Dec 2019 09:45:07 -0800
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Tue, 03 Dec 2019 09:45:07 -0800
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 3 Dec
 2019 17:45:07 +0000
Received: from NAM03-CO1-obe.outbound.protection.outlook.com (104.47.40.52) by
 HQMAIL107.nvidia.com (172.20.187.13) with Microsoft SMTP Server (TLS) id
 15.0.1473.3 via Frontend Transport; Tue, 3 Dec 2019 17:45:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EgUB/rNJfhWfCp/Leuh2p35HNgHf/oM8d1IKp8wENmiWUQS7yVen701Z1KN258rmfSOVgcp9ZssxcU9PNOhNdU5Q2khkWOOtZS5NKDLVVZw86OdfbV8Bvc2uwPlgd36lfNdWiU/GLJnA8zoZxagQW+5R4NgjFWSQNsUn/XrljNgdsDveOMCRzDLAHLWTtbXr8MMbblmbatDUPdja+hBoPnQuy2rB35JdbjH52OLeb406aZIJUGKiceiD9sS7rUibEsUlNbjqGLLTlV0BsxPiDvTtF1Wuu8OC/kNvvLptr7ToJj5AdoI1Fhz7/NdPZrbnibIAJX/Pb5lqlk96i3RGsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FpSiOUgg28nAQ4lXe6Utg2omnpTdhLvAZHcK08/Y/04=;
 b=Ngx+E1wkPpvwJX2vWl4yQDYpg9P8/3G0ckgn7IbjL4CvYqRC/088oFNFjjbz/ZHfdi2mtDnA9O51tllPjxUK1L1pWNkVfl67uAw8D9ySz3LJUH3VwXmXPBv2vud0cMU11td6Z+pblc2ufLsSCh0k1hrNzotP+xQyEe3I6jovWg7RQOIUV6U0iqxvwc6AzaiQDXksOVObUDpEocx7H5Joy3xvKdxSrqAlsMUdQqwA3TQLK83dYo+IkXlKC7sGTK1RzmnknW83IYqYpxXxIqboxSTceeZAf+EAliH3M8zA65GL8LI0BSYAHAZfK4Ug5z4q+Nx6BP2gjQB93CzGC0dsVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
Received: from BYAPR12MB2727.namprd12.prod.outlook.com (20.176.253.214) by
 BYAPR12MB3382.namprd12.prod.outlook.com (20.178.55.223) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2495.20; Tue, 3 Dec 2019 17:45:06 +0000
Received: from BYAPR12MB2727.namprd12.prod.outlook.com
 ([fe80::8d3d:d3ba:cb91:c060]) by BYAPR12MB2727.namprd12.prod.outlook.com
 ([fe80::8d3d:d3ba:cb91:c060%5]) with mapi id 15.20.2495.014; Tue, 3 Dec 2019
 17:45:06 +0000
From:   Ajay Gupta <ajayg@nvidia.com>
To:     "heikki.krogerus@linux.intel.com" <heikki.krogerus@linux.intel.com>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: RE: [PATCH v6] usb: typec: ucsi: add support for separate DP altmode
 devices
Thread-Topic: [PATCH v6] usb: typec: ucsi: add support for separate DP altmode
 devices
Thread-Index: AQHVoZfAZYEU1Q0sLk61ZBRXTLc1s6eovyIQ
Date:   Tue, 3 Dec 2019 17:45:05 +0000
Message-ID: <BYAPR12MB2727502B347FA72BCB9C7B60DC420@BYAPR12MB2727.namprd12.prod.outlook.com>
References: <20191123004347.5127-1-ajayg@nvidia.com>
In-Reply-To: <20191123004347.5127-1-ajayg@nvidia.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Enabled=True;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_SiteId=43083d15-7273-40c1-b7db-39efd9ccc17a;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Owner=ajayg@nvidia.com;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_SetDate=2019-12-03T17:45:04.5106059Z;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Name=Unrestricted;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Application=Microsoft Azure
 Information Protection;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_ActionId=02caa467-3fe2-4a2b-b7d6-28f1068db08f;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Extended_MSFT_Method=Automatic
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=ajayg@nvidia.com; 
x-originating-ip: [216.228.112.22]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ed3c1179-0afd-4844-77b3-08d778188895
x-ms-traffictypediagnostic: BYAPR12MB3382:
x-microsoft-antispam-prvs: <BYAPR12MB33823FC7D854BDD43592E15DDC420@BYAPR12MB3382.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 02408926C4
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(396003)(136003)(366004)(376002)(39860400002)(346002)(13464003)(199004)(189003)(6436002)(66446008)(71200400001)(81166006)(229853002)(64756008)(11346002)(446003)(2906002)(26005)(8676002)(71190400001)(55016002)(102836004)(14454004)(6246003)(9686003)(186003)(4326008)(6506007)(25786009)(74316002)(5640700003)(966005)(2501003)(478600001)(6306002)(6116002)(3846002)(316002)(53546011)(52536014)(33656002)(6916009)(305945005)(14444005)(2351001)(7736002)(86362001)(7696005)(256004)(66476007)(66946007)(8936002)(76116006)(81156014)(76176011)(30864003)(5660300002)(66556008)(99286004)(6606295002);DIR:OUT;SFP:1101;SCL:1;SRVR:BYAPR12MB3382;H:BYAPR12MB2727.namprd12.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nvidia.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: jJzaVrhFFKOvRjZdmEtZzY80qkiI/o/G3LVXmp+uecrbqseTbjCVemdMOv4SniZ340c48xGDBPY4QMD4zVg8FshydcmFadWy2lIMKaausN0QRV+nNiQoQNqjgnVVSFVR7jEBQ2ZO5FOa4nNOmu00Q8Pg6uk7nPPcYumQ9vRDjqDKoFKiWQaUTLRpyOZs29yuxXyrVSC0br9XjVPitrpeJ66+WtXhf6oQorm/obq94wlq0/O3SOpwg1+frTmoxHffjOCvB4TRnhZsQsZza/B3rS/EnrOwEF1xsVFS3tcuVSwOhzob6Z7RTmgSKKAlI5E4BZMGGWaP4V5oxIEFq+Tosf3gRa8PnbjQ7F1xGdy7lAu1+ZaxNnfCnMQkW57HzgCHssbDTo8lUSf2EX4wnHuiKAYEN1alQPULP+jrXyIS9+s3Td6WbtCY8l065Ux9QZ+AEco5/luA69w+Qz0pVpMjnJSO0EWAIsWGqKIfdZVN5VA=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: ed3c1179-0afd-4844-77b3-08d778188895
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Dec 2019 17:45:06.0020
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6QEbDHpYqjjaahmgqBNzjpAHrDZw/AswcqSoneiYY/mStkHzNW+zPYIb9yAUys+v0td5YpmPKy5WiO58AWp0kw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3382
X-OriginatorOrg: Nvidia.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1575395093; bh=FpSiOUgg28nAQ4lXe6Utg2omnpTdhLvAZHcK08/Y/04=;
        h=X-PGP-Universal:ARC-Seal:ARC-Message-Signature:
         ARC-Authentication-Results:From:To:CC:Subject:Thread-Topic:
         Thread-Index:Date:Message-ID:References:In-Reply-To:
         Accept-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:msip_labels:
         authentication-results:x-originating-ip:x-ms-publictraffictype:
         x-ms-office365-filtering-correlation-id:x-ms-traffictypediagnostic:
         x-microsoft-antispam-prvs:x-ms-oob-tlc-oobclassifiers:
         x-forefront-prvs:x-forefront-antispam-report:received-spf:
         x-ms-exchange-senderadcheck:x-microsoft-antispam:
         x-microsoft-antispam-message-info:x-ms-exchange-transport-forked:
         MIME-Version:X-MS-Exchange-CrossTenant-Network-Message-Id:
         X-MS-Exchange-CrossTenant-originalarrivaltime:
         X-MS-Exchange-CrossTenant-fromentityheader:
         X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
         X-MS-Exchange-CrossTenant-userprincipalname:
         X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-OriginatorOrg:
         Content-Language:Content-Type:Content-Transfer-Encoding;
        b=bOMafs7Goy/8ozveGEDUuFS+bEgRZ6KBK28Sd/Ni33TXzis9XdRbf8CicCXYpqTXa
         shqFAK1Gm5jWR7qRaOn0bR7hOtTQ2AQwvzEz1XoC6brYBHHxxVgVfJKcaKW/sDowNY
         OPeldN7bGxbdQO3dXIn/fo0HbANyNxSIvUKqR8AO0QJDdg6mZYPndpIwGlpoRBc5lA
         uktkHQuHrUUK88Cw/hoDwS2vZa8Q1hTmuFB+rjfrangEJ/6fEXw2O4yA/ZeFpGqilD
         jjMtTcNEDQc3c8/IZ2e+rRHImyVfxh5EkKW7nUkTJLI32PQkCVnuhKG3IecPXjj3cg
         1fDEqPriGGptQ==
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Heikki

Please help review this change. It has been pending for some time.
This is based on your suggestion at
https://marc.info/?l=3Dlinux-usb&m=3D157355683226308&w=3D2=20

Thanks
>nvpublic

> -----Original Message-----
> From: Ajay Gupta <ajaykuee@gmail.com>
> Sent: Friday, November 22, 2019 4:44 PM
> To: heikki.krogerus@linux.intel.com
> Cc: linux-usb@vger.kernel.org; Ajay Gupta <ajayg@nvidia.com>
> Subject: [PATCH v6] usb: typec: ucsi: add support for separate DP altmode
> devices
>=20
> From: Ajay Gupta <ajayg@nvidia.com>
>=20
> CCGx controller used on NVIDIA GPU card has two separate display
> altmode for two DP pin assignments. UCSI specification doesn't
> prohibits using separate display altmode.
>=20
> Current UCSI Type-C framework expects only one display altmode for
> all DP pin assignment. This patch squashes two separate display
> altmode into single altmode to support controllers with separate
> display altmode. We first read all the alternate modes of connector
> and then run through it to know if there are separate display
> altmodes. If so, it prepares a new port altmode set after squashing
> two or more separate altmodes into one.
>=20
> Signed-off-by: Ajay Gupta <ajayg@nvidia.com>
> ---
> Original discussion on this issue is at [1]
>=20
> Changes frpm v5->v6
> 	- Rebased to Greg's latest usb-testing branch
>=20
> 1. https://marc.info/?l=3Dlinux-usb&m=3D154905866830998&w=3D2
>=20
>  drivers/usb/typec/ucsi/ucsi.c     |  65 ++++++++--
>  drivers/usb/typec/ucsi/ucsi.h     |  10 ++
>  drivers/usb/typec/ucsi/ucsi_ccg.c | 191 +++++++++++++++++++++++++++++-
>  3 files changed, 253 insertions(+), 13 deletions(-)
>=20
> diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.=
c
> index 4459bc68aa33..f028658d1b1a 100644
> --- a/drivers/usb/typec/ucsi/ucsi.c
> +++ b/drivers/usb/typec/ucsi/ucsi.c
> @@ -323,12 +323,17 @@ static int ucsi_register_altmodes(struct
> ucsi_connector *con, u8 recipient)
>  	int max_altmodes =3D UCSI_MAX_ALTMODES;
>  	struct typec_altmode_desc desc;
>  	struct ucsi_altmode alt[2];
> +	struct ucsi_altmode orig[UCSI_MAX_ALTMODES];
> +	struct ucsi_altmode updated[UCSI_MAX_ALTMODES];
> +	struct ucsi *ucsi =3D con->ucsi;
> +	bool multi_dp =3D false;
>  	u64 command;
>  	int num =3D 1;
>  	int ret;
>  	int len;
>  	int j;
>  	int i;
> +	int k =3D 0;
>=20
>  	if (!(con->ucsi->cap.features & UCSI_CAP_ALT_MODE_DETAILS))
>  		return 0;
> @@ -339,6 +344,10 @@ static int ucsi_register_altmodes(struct
> ucsi_connector *con, u8 recipient)
>  	if (recipient =3D=3D UCSI_RECIPIENT_CON)
>  		max_altmodes =3D con->ucsi->cap.num_alt_modes;
>=20
> +	memset(orig, 0, sizeof(orig));
> +	memset(updated, 0, sizeof(updated));
> +
> +	/* First get all the alternate modes */
>  	for (i =3D 0; i < max_altmodes;) {
>  		memset(alt, 0, sizeof(alt));
>  		command =3D UCSI_GET_ALTERNATE_MODES;
> @@ -346,32 +355,66 @@ static int ucsi_register_altmodes(struct
> ucsi_connector *con, u8 recipient)
>  		command |=3D
> UCSI_GET_ALTMODE_CONNECTOR_NUMBER(con->num);
>  		command |=3D UCSI_GET_ALTMODE_OFFSET(i);
>  		len =3D ucsi_run_command(con->ucsi, command, alt, sizeof(alt));
> -		if (len <=3D 0)
> +		/*
> +		 * We are collecting all altmodes first and then registering.
> +		 * Some type-C device will return zero length data beyond last
> +		 * alternate modes. We should not return if length is zero.
> +		 */
> +		if (len < 0)
>  			return len;
>=20
> +		/* We got all altmodes, now break out and register them */
> +		if (!len)
> +			break;
> +
>  		/*
>  		 * This code is requesting one alt mode at a time, but some
> PPMs
>  		 * may still return two. If that happens both alt modes need be
> -		 * registered and the offset for the next alt mode has to be
> +		 * saved and the offset for the next alt mode has to be
>  		 * incremented.
>  		 */
>  		num =3D len / sizeof(alt[0]);
>  		i +=3D num;
>=20
>  		for (j =3D 0; j < num; j++) {
> -			if (!alt[j].svid)
> -				return 0;
>=20
> -			memset(&desc, 0, sizeof(desc));
> -			desc.vdo =3D alt[j].mid;
> -			desc.svid =3D alt[j].svid;
> -			desc.roles =3D TYPEC_PORT_DRD;
> +			if (!alt[j].svid) {
> +				/* break out of outer loop and register */
> +				i =3D max_altmodes;
> +				break;
> +			}
>=20
> -			ret =3D ucsi_register_altmode(con, &desc, recipient);
> -			if (ret)
> -				return ret;
> +			orig[k].mid =3D alt[j].mid;
> +			orig[k].svid =3D alt[j].svid;
> +			k++;
>  		}
>  	}
> +	/*
> +	 * Update the original altmode table as some ppms may report
> +	 * multiple DP altmodes.
> +	 */
> +	if (recipient =3D=3D UCSI_RECIPIENT_CON && ucsi->ops-
> >update_altmodes)
> +		multi_dp =3D ucsi->ops->update_altmodes(ucsi, orig, updated);
> +
> +	/* now register altmodes */
> +	for (i =3D 0; i < max_altmodes; i++) {
> +		memset(&desc, 0, sizeof(desc));
> +		if (multi_dp && recipient =3D=3D UCSI_RECIPIENT_CON) {
> +			desc.svid =3D updated[i].svid;
> +			desc.vdo =3D updated[i].mid;
> +		} else {
> +			desc.svid =3D orig[i].svid;
> +			desc.vdo =3D orig[i].mid;
> +		}
> +		desc.roles =3D TYPEC_PORT_DRD;
> +
> +		if (!desc.svid)
> +			return 0;
> +
> +		ret =3D ucsi_register_altmode(con, &desc, recipient);
> +		if (ret)
> +			return ret;
> +	}
>=20
>  	return 0;
>  }
> diff --git a/drivers/usb/typec/ucsi/ucsi.h b/drivers/usb/typec/ucsi/ucsi.=
h
> index 8569bbd3762f..08ecdf0dcbcc 100644
> --- a/drivers/usb/typec/ucsi/ucsi.h
> +++ b/drivers/usb/typec/ucsi/ucsi.h
> @@ -11,6 +11,7 @@
>  /* ---------------------------------------------------------------------=
----- */
>=20
>  struct ucsi;
> +struct ucsi_altmode;
>=20
>  /* UCSI offsets (Bytes) */
>  #define UCSI_VERSION			0
> @@ -35,6 +36,7 @@ struct ucsi;
>   * @read: Read operation
>   * @sync_write: Blocking write operation
>   * @async_write: Non-blocking write operation
> + * @update_altmodes: Squashes duplicate DP altmodes
>   *
>   * Read and write routines for UCSI interface. @sync_write must wait for=
 the
>   * Command Completion Event from the PPM before returning, and
> @async_write must
> @@ -47,6 +49,8 @@ struct ucsi_operations {
>  			  const void *val, size_t val_len);
>  	int (*async_write)(struct ucsi *ucsi, unsigned int offset,
>  			   const void *val, size_t val_len);
> +	bool (*update_altmodes)(struct ucsi *ucsi, struct ucsi_altmode *orig,
> +				struct ucsi_altmode *updated);
>  };
>=20
>  struct ucsi *ucsi_create(struct device *dev, const struct ucsi_operation=
s
> *ops);
> @@ -82,6 +86,7 @@ void ucsi_connector_change(struct ucsi *ucsi, u8 num);
>  #define UCSI_GET_ERROR_STATUS		0x13
>=20
>  #define UCSI_CONNECTOR_NUMBER(_num_)		((u64)(_num_) << 16)
> +#define UCSI_COMMAND(_cmd_)			((_cmd_) & 0xff)
>=20
>  /* CONNECTOR_RESET command bits */
>  #define UCSI_CONNECTOR_RESET_HARD		BIT(23) /* Deprecated
> in v1.1 */
> @@ -140,6 +145,11 @@ void ucsi_connector_change(struct ucsi *ucsi, u8
> num);
>  #define UCSI_ERROR_PPM_POLICY_CONFLICT		BIT(11)
>  #define UCSI_ERROR_SWAP_REJECTED		BIT(12)
>=20
> +#define UCSI_SET_NEW_CAM_ENTER(x)		(((x) >> 23) & 0x1)
> +#define UCSI_SET_NEW_CAM_GET_AM(x)		(((x) >> 24) & 0xff)
> +#define UCSI_SET_NEW_CAM_AM_MASK		(0xff << 24)
> +#define UCSI_SET_NEW_CAM_SET_AM(x)		(((x) & 0xff) << 24)
> +#define UCSI_CMD_CONNECTOR_MASK			(0x7)
>  /* Data structure filled by PPM in response to GET_CAPABILITY command. *=
/
>  struct ucsi_capability {
>  	u32 attributes;
> diff --git a/drivers/usb/typec/ucsi/ucsi_ccg.c
> b/drivers/usb/typec/ucsi/ucsi_ccg.c
> index 3370b3fc37b1..22c498688512 100644
> --- a/drivers/usb/typec/ucsi/ucsi_ccg.c
> +++ b/drivers/usb/typec/ucsi/ucsi_ccg.c
> @@ -16,6 +16,7 @@
>  #include <linux/platform_device.h>
>  #include <linux/pm.h>
>  #include <linux/pm_runtime.h>
> +#include <linux/usb/typec_dp.h>
>=20
>  #include <asm/unaligned.h>
>  #include "ucsi.h"
> @@ -173,6 +174,15 @@ struct ccg_resp {
>  	u8 length;
>  };
>=20
> +struct ucsi_ccg_altmode {
> +	u16 svid;
> +	u32 mid;
> +	u8 linked_idx;
> +	u8 active_idx;
> +#define UCSI_MULTI_DP_INDEX	(0xff)
> +	bool checked;
> +} __packed;
> +
>  struct ucsi_ccg {
>  	struct device *dev;
>  	struct ucsi *ucsi;
> @@ -198,6 +208,11 @@ struct ucsi_ccg {
>  	struct work_struct pm_work;
>=20
>  	struct completion complete;
> +
> +	u64 last_cmd_sent;
> +	bool has_multiple_dp;
> +	struct ucsi_ccg_altmode orig[UCSI_MAX_ALTMODES];
> +	struct ucsi_ccg_altmode updated[UCSI_MAX_ALTMODES];
>  };
>=20
>  static int ccg_read(struct ucsi_ccg *uc, u16 rab, u8 *data, u32 len)
> @@ -319,12 +334,169 @@ static int ucsi_ccg_init(struct ucsi_ccg *uc)
>  	return -ETIMEDOUT;
>  }
>=20
> +static void ucsi_ccg_update_get_current_cam_cmd(struct ucsi_ccg *uc, u8
> *data)
> +{
> +	u8 cam, new_cam;
> +
> +	cam =3D data[0];
> +	new_cam =3D uc->orig[cam].linked_idx;
> +	uc->updated[new_cam].active_idx =3D cam;
> +	data[0] =3D new_cam;
> +}
> +
> +static bool ucsi_ccg_update_altmodes(struct ucsi *ucsi,
> +				     struct ucsi_altmode *orig,
> +				     struct ucsi_altmode *updated)
> +{
> +	struct ucsi_ccg *uc =3D ucsi_get_drvdata(ucsi);
> +	struct ucsi_ccg_altmode *alt, *new_alt;
> +	int i, j, k =3D 0;
> +	bool found =3D false;
> +
> +	alt =3D uc->orig;
> +	new_alt =3D uc->updated;
> +	memset(uc->updated, 0, sizeof(uc->updated));
> +
> +	/*
> +	 * Copy original connector altmodes to new structure.
> +	 * We need this before second loop since second loop
> +	 * checks for duplicate altmodes.
> +	 */
> +	for (i =3D 0; i < UCSI_MAX_ALTMODES; i++) {
> +		alt[i].svid =3D orig[i].svid;
> +		alt[i].mid =3D orig[i].mid;
> +		if (!alt[i].svid)
> +			break;
> +	}
> +
> +	for (i =3D 0; i < UCSI_MAX_ALTMODES; i++) {
> +		if (!alt[i].svid)
> +			break;
> +
> +		/* already checked and considered */
> +		if (alt[i].checked)
> +			continue;
> +
> +		if (!DP_CONF_GET_PIN_ASSIGN(alt[i].mid)) {
> +			/* Found Non DP altmode */
> +			new_alt[k].svid =3D alt[i].svid;
> +			new_alt[k].mid |=3D alt[i].mid;
> +			new_alt[k].linked_idx =3D i;
> +			alt[i].linked_idx =3D k;
> +			updated[k].svid =3D new_alt[k].svid;
> +			updated[k].mid =3D new_alt[k].mid;
> +			k++;
> +			continue;
> +		}
> +
> +		for (j =3D i + 1; j < UCSI_MAX_ALTMODES; j++) {
> +			if (alt[i].svid !=3D alt[j].svid ||
> +			    !DP_CONF_GET_PIN_ASSIGN(alt[j].mid)) {
> +				continue;
> +			} else {
> +				/* Found duplicate DP mode */
> +				new_alt[k].svid =3D alt[i].svid;
> +				new_alt[k].mid |=3D alt[i].mid | alt[j].mid;
> +				new_alt[k].linked_idx =3D
> UCSI_MULTI_DP_INDEX;
> +				alt[i].linked_idx =3D k;
> +				alt[j].linked_idx =3D k;
> +				alt[j].checked =3D true;
> +				found =3D true;
> +			}
> +		}
> +		if (found) {
> +			uc->has_multiple_dp =3D true;
> +		} else {
> +			/* Didn't find any duplicate DP altmode */
> +			new_alt[k].svid =3D alt[i].svid;
> +			new_alt[k].mid |=3D alt[i].mid;
> +			new_alt[k].linked_idx =3D i;
> +			alt[i].linked_idx =3D k;
> +		}
> +		updated[k].svid =3D new_alt[k].svid;
> +		updated[k].mid =3D new_alt[k].mid;
> +		k++;
> +	}
> +	return found;
> +}
> +
> +static void ucsi_ccg_update_set_new_cam_cmd(struct ucsi_ccg *uc,
> +					    struct ucsi_connector *con,
> +					    u64 *cmd)
> +{
> +	struct ucsi_ccg_altmode *new_port, *port;
> +	struct typec_altmode *alt =3D NULL;
> +	u8 new_cam, cam, pin;
> +	bool enter_new_mode;
> +	int i, j, k =3D 0xff;
> +
> +	port =3D uc->orig;
> +	new_cam =3D UCSI_SET_NEW_CAM_GET_AM(*cmd);
> +	new_port =3D &uc->updated[new_cam];
> +	cam =3D new_port->linked_idx;
> +	enter_new_mode =3D UCSI_SET_NEW_CAM_ENTER(*cmd);
> +
> +	/*
> +	 * If CAM is UCSI_MULTI_DP_INDEX then this is DP altmode
> +	 * with multiple DP mode. Find out CAM for best pin assignement
> +	 * among all DP mode. Priorite pin E->D->C after making sure
> +	 * the partner supports that pin.
> +	 */
> +	if (cam =3D=3D UCSI_MULTI_DP_INDEX) {
> +		if (enter_new_mode) {
> +			for (i =3D 0; con->partner_altmode[i]; i++) {
> +				alt =3D con->partner_altmode[i];
> +				if (alt->svid =3D=3D new_port->svid)
> +					break;
> +			}
> +			/*
> +			 * alt will always be non NULL since this is
> +			 * UCSI_SET_NEW_CAM command and so there will
> be
> +			 * atleast one con->partner_altmode[i] with svid
> +			 * matching with new_port->svid.
> +			 */
> +			for (j =3D 0; port[j].svid; j++) {
> +				pin =3D DP_CONF_GET_PIN_ASSIGN(port[j].mid);
> +				if (alt && port[j].svid =3D=3D alt->svid &&
> +				    (pin & DP_CONF_GET_PIN_ASSIGN(alt-
> >vdo))) {
> +					/* prioritize pin E->D->C */
> +					if (k =3D=3D 0xff || (k !=3D 0xff && pin >
> +
> DP_CONF_GET_PIN_ASSIGN(port[k].mid))
> +					    ) {
> +						k =3D j;
> +					}
> +				}
> +			}
> +			cam =3D k;
> +			new_port->active_idx =3D cam;
> +		} else {
> +			cam =3D new_port->active_idx;
> +		}
> +	}
> +	*cmd &=3D ~UCSI_SET_NEW_CAM_AM_MASK;
> +	*cmd |=3D UCSI_SET_NEW_CAM_SET_AM(cam);
> +}
> +
>  static int ucsi_ccg_read(struct ucsi *ucsi, unsigned int offset,
>  			 void *val, size_t val_len)
>  {
> +	struct ucsi_ccg *uc =3D ucsi_get_drvdata(ucsi);
> +	int ret;
>  	u16 reg =3D CCGX_RAB_UCSI_DATA_BLOCK(offset);
>=20
> -	return ccg_read(ucsi_get_drvdata(ucsi), reg, val, val_len);
> +	ret =3D ccg_read(uc, reg, val, val_len);
> +	if (ret)
> +		return ret;
> +
> +	if (offset =3D=3D UCSI_MESSAGE_IN) {
> +		if (UCSI_COMMAND(uc->last_cmd_sent) =3D=3D
> UCSI_GET_CURRENT_CAM &&
> +		    uc->has_multiple_dp) {
> +			ucsi_ccg_update_get_current_cam_cmd(uc, (u8
> *)val);
> +		}
> +		uc->last_cmd_sent =3D 0;
> +	}
> +
> +	return ret;
>  }
>=20
>  static int ucsi_ccg_async_write(struct ucsi *ucsi, unsigned int offset,
> @@ -339,12 +511,26 @@ static int ucsi_ccg_sync_write(struct ucsi *ucsi,
> unsigned int offset,
>  			       const void *val, size_t val_len)
>  {
>  	struct ucsi_ccg *uc =3D ucsi_get_drvdata(ucsi);
> +	struct ucsi_connector *con;
> +	int con_index;
>  	int ret;
>=20
>  	mutex_lock(&uc->lock);
>  	pm_runtime_get_sync(uc->dev);
>  	set_bit(DEV_CMD_PENDING, &uc->flags);
>=20
> +	if (offset =3D=3D UCSI_CONTROL && val_len =3D=3D sizeof(uc->last_cmd_se=
nt))
> {
> +		uc->last_cmd_sent =3D *(u64 *)val;
> +
> +		if (UCSI_COMMAND(uc->last_cmd_sent) =3D=3D
> UCSI_SET_NEW_CAM &&
> +		    uc->has_multiple_dp) {
> +			con_index =3D  (uc->last_cmd_sent >> 16) &
> +					UCSI_CMD_CONNECTOR_MASK;
> +			con =3D &uc->ucsi->connector[con_index - 1];
> +			ucsi_ccg_update_set_new_cam_cmd(uc, con, (u64
> *)val);
> +		}
> +	}
> +
>  	ret =3D ucsi_ccg_async_write(ucsi, offset, val, val_len);
>  	if (ret)
>  		goto err_clear_bit;
> @@ -363,7 +549,8 @@ static int ucsi_ccg_sync_write(struct ucsi *ucsi,
> unsigned int offset,
>  static const struct ucsi_operations ucsi_ccg_ops =3D {
>  	.read =3D ucsi_ccg_read,
>  	.sync_write =3D ucsi_ccg_sync_write,
> -	.async_write =3D ucsi_ccg_async_write
> +	.async_write =3D ucsi_ccg_async_write,
> +	.update_altmodes =3D ucsi_ccg_update_altmodes
>  };
>=20
>  static irqreturn_t ccg_irq_handler(int irq, void *data)
> --
> 2.17.1

