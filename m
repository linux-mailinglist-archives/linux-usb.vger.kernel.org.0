Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 04761DF5FC
	for <lists+linux-usb@lfdr.de>; Mon, 21 Oct 2019 21:28:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728353AbfJUT2s (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 21 Oct 2019 15:28:48 -0400
Received: from hqemgate16.nvidia.com ([216.228.121.65]:3218 "EHLO
        hqemgate16.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726672AbfJUT2s (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 21 Oct 2019 15:28:48 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5dae06f00000>; Mon, 21 Oct 2019 12:28:48 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Mon, 21 Oct 2019 12:28:44 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Mon, 21 Oct 2019 12:28:44 -0700
Received: from HQMAIL109.nvidia.com (172.20.187.15) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 21 Oct
 2019 19:28:38 +0000
Received: from NAM03-DM3-obe.outbound.protection.outlook.com (104.47.41.54) by
 HQMAIL109.nvidia.com (172.20.187.15) with Microsoft SMTP Server (TLS) id
 15.0.1473.3 via Frontend Transport; Mon, 21 Oct 2019 19:28:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iGkiM5Y0EPKuaxDk9s3JNpnreR71CO/SUnqJy1GBZT6be/UdD7ZhgZm8ZhkTAb5bl5Kdsxv/yQv2dZhfQ9fnecAfzKhcC8adZAJ5ujPlysElDIzIURA0VvYQ+hG7FMHc9NWUuqYNrvcvlp7AGe8eyCdwuKaZEhhlZOQSIuU7hWexJveHxaJ+mp7Odl7E5BXs98vOFMbfvoiE1IPilyPSzttAc8/v3pkPql5CmxxUR+ySSZL6fmOeLNvcWgtSoRDJXxtzHi2yarzduxBhlRsP/XzPvXRbND8C9a0Uj9ejZLYaZRSp7L60Ggj9PSPGhrh8TsWQGVybIRtnYRqXnhdKeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GfyuVimVhtXi7+oHGXSCke6frT+byojMe+3Nuqg/xyo=;
 b=HrQ3xjulCaRxQ9SaFSbzRb2rs/iRcLzTnwoK8lYvBUVTzWM9V5zmXmoAV1i/ivg4Fbg3ZbZkEDFNb3n2Qz2phjyhwqcJKvQrSFgxB9Rccx6sffBe+IsO0axpXFglTh0S2AQkRkQD9Lj9BNe04wb9iZNdymFCLP/WdVF3ctMd3T0fEvBbb4TF91eKwHM7dpjDuoCPJz4t96gVPpblEnAFhyua9SU+6DJnM0NG4/e17/zLY6Nh7BdMCDIs21fsg5UBYygjN1kcq2k6NgtVuGyJrPQT5PxZHN4YZNKQBj5UA/Wm78LPpq+auXhJ72b4ufZbv8ODW1isqhLJmysE/8QxDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
Received: from BYAPR12MB2727.namprd12.prod.outlook.com (20.176.253.214) by
 BYAPR12MB3111.namprd12.prod.outlook.com (20.178.54.204) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2367.20; Mon, 21 Oct 2019 19:28:36 +0000
Received: from BYAPR12MB2727.namprd12.prod.outlook.com
 ([fe80::19f9:64ec:5139:dfca]) by BYAPR12MB2727.namprd12.prod.outlook.com
 ([fe80::19f9:64ec:5139:dfca%3]) with mapi id 15.20.2347.029; Mon, 21 Oct 2019
 19:28:36 +0000
From:   Ajay Gupta <ajayg@nvidia.com>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     Guenter Roeck <linux@roeck-us.net>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: RE: [PATCH 14/18] usb: typec: ucsi: Remove the old API
Thread-Topic: [PATCH 14/18] usb: typec: ucsi: Remove the old API
Thread-Index: AQHViAJhjGCrhedNt0O8BftQxWjPMqdles5g
Date:   Mon, 21 Oct 2019 19:28:36 +0000
Message-ID: <BYAPR12MB272730A5205C8F97AE3C37D2DC690@BYAPR12MB2727.namprd12.prod.outlook.com>
References: <20191021112524.79550-1-heikki.krogerus@linux.intel.com>
 <20191021112524.79550-15-heikki.krogerus@linux.intel.com>
In-Reply-To: <20191021112524.79550-15-heikki.krogerus@linux.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Enabled=True;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_SiteId=43083d15-7273-40c1-b7db-39efd9ccc17a;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Owner=ajayg@nvidia.com;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_SetDate=2019-10-21T19:28:35.2525504Z;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Name=Unrestricted;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Application=Microsoft Azure
 Information Protection;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_ActionId=6339681e-5eb9-4a2f-8503-8b31a7be2f6d;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Extended_MSFT_Method=Automatic
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=ajayg@nvidia.com; 
x-originating-ip: [216.228.112.22]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 95e0c02f-086b-4cf0-ef14-08d7565cdea4
x-ms-traffictypediagnostic: BYAPR12MB3111:
x-microsoft-antispam-prvs: <BYAPR12MB31119D0499947308E7B72E64DC690@BYAPR12MB3111.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:546;
x-forefront-prvs: 0197AFBD92
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(346002)(39860400002)(136003)(376002)(366004)(396003)(199004)(189003)(13464003)(476003)(66446008)(86362001)(6436002)(102836004)(52536014)(486006)(55016002)(446003)(8936002)(6246003)(64756008)(14454004)(186003)(229853002)(110136005)(54906003)(30864003)(66476007)(66946007)(76176011)(3846002)(99286004)(9686003)(6116002)(8676002)(66556008)(66066001)(74316002)(7736002)(2906002)(305945005)(316002)(76116006)(478600001)(33656002)(256004)(71190400001)(6506007)(71200400001)(5660300002)(7696005)(81156014)(14444005)(25786009)(53546011)(26005)(4326008)(81166006)(11346002);DIR:OUT;SFP:1101;SCL:1;SRVR:BYAPR12MB3111;H:BYAPR12MB2727.namprd12.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nvidia.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: TajX+0Yg01J7GTE0wU2XIqKNCmitkEdbsZecg6n1zSp3TAntFVW/bd9bbxLxFfzK03XOiq/bQifcOqcj88QYNmtH72dynKHO8XboqnX3E7/owln1BSCR/SHH+AoptHEa4t99yeSoWW6nu7sBHHwCRsjiS+2G1xKN33ajACU3FzUuDoIiQqDxGXwBeS4XKdsIe+aMfBTxIKzVN5kd0a7P+EtpyWtzuw9+N+RM1wZbqqbY8Wlb6l175c9d5UCR5IilP5ALRrJpXeqhIKR1AsaIquxWUOK+9febo2oFNJhGPRMzgmQn5f93MsijPA6wVRd8umrah/pDDVllkTNDzuIbzLibyYhG32+Igh/QlFQEJF7wC984OYd+EOQ38/mLXvUlnDYU+Vy4O5yxctOze7TMgiI2vizYpBU2VHWtBP5DiXFA9ZzhX+33pHkgPoSV6ahQ
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 95e0c02f-086b-4cf0-ef14-08d7565cdea4
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Oct 2019 19:28:36.6536
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jqNNkHiRFhGAAWmZEbEsSzy/TCY9fSbcVgICEkcknQn+G+TIDVZ6t7xtgwKWnqFe1GsxAQf1DpOou6vGdzxVYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3111
X-OriginatorOrg: Nvidia.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1571686128; bh=GfyuVimVhtXi7+oHGXSCke6frT+byojMe+3Nuqg/xyo=;
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
        b=RIYp3X6qrTzsDZCxGUc2d+ODoA5HXIa4EVZhkraplPnWLtKQorqIdhr5C9g+CZZnu
         690dKNB3Xxk2QCq5CgkLAtc9hnshhTX7ARlWXNCdUr2sW/r4qA07yO6j7c/Cz/bhFo
         RZqBPIiYv2zf/w2YIvZhFdjuOSzJad+tItogu5rsxFy7zQ5AsqGBmnjwnoKFxCaRN6
         lXZSXopzzrgATvSlHMjWqIVcM2fMN3K8HMmBvcVGPkSCWp19ze1ho/G+NSXPlnBCQE
         kOIR1wnGSIU4Shx05zOw7+zMr51AXgpRFL19xSGM9gcuS1/dWH/VsJj5dua7GQ1Mrr
         iD24BSLwOro0w==
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Heikki,

> -----Original Message-----
> From: linux-usb-owner@vger.kernel.org <linux-usb-owner@vger.kernel.org>
> On Behalf Of Heikki Krogerus
> Sent: Monday, October 21, 2019 4:25 AM
> To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Guenter Roeck <linux@roeck-us.net>; Ajay Gupta <ajayg@nvidia.com>;
> linux-usb@vger.kernel.org
> Subject: [PATCH 14/18] usb: typec: ucsi: Remove the old API
>=20
> The drivers now only use the new API, so removing the old one.
>=20
> Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> ---
>  drivers/usb/typec/ucsi/displayport.c |  24 +-
>  drivers/usb/typec/ucsi/trace.h       |  17 --
>  drivers/usb/typec/ucsi/ucsi.c        | 345 +++------------------------
>  drivers/usb/typec/ucsi/ucsi.h        |  41 ----
>  4 files changed, 43 insertions(+), 384 deletions(-)
>=20
> diff --git a/drivers/usb/typec/ucsi/displayport.c
> b/drivers/usb/typec/ucsi/displayport.c
> index d99700cb4dca..47424935bc81 100644
> --- a/drivers/usb/typec/ucsi/displayport.c
> +++ b/drivers/usb/typec/ucsi/displayport.c
> @@ -48,6 +48,7 @@ struct ucsi_dp {
>  static int ucsi_displayport_enter(struct typec_altmode *alt)  {
>  	struct ucsi_dp *dp =3D typec_altmode_get_drvdata(alt);
> +	struct ucsi *ucsi =3D dp->con->ucsi;
>  	struct ucsi_control ctrl;
>  	u8 cur =3D 0;
>  	int ret;
Need to initialize "ret" otherwise we will return uninitialized value if fi=
rst
"if" condition in this function is true.

Thanks
> nvpublic
> @@ -59,25 +60,21 @@ static int ucsi_displayport_enter(struct typec_altmod=
e
> *alt)
>=20
>  		dev_warn(&p->dev,
>  			 "firmware doesn't support alternate mode
> overriding\n");
> -		mutex_unlock(&dp->con->lock);
> -		return -EOPNOTSUPP;
> +		ret =3D -EOPNOTSUPP;
> +		goto err_unlock;
>  	}
>=20
>  	UCSI_CMD_GET_CURRENT_CAM(ctrl, dp->con->num);
> -	ret =3D ucsi_send_command(dp->con->ucsi, &ctrl, &cur, sizeof(cur));
> +	ret =3D ucsi_send_command(ucsi, command, &cur, sizeof(cur));
>  	if (ret < 0) {
> -		if (dp->con->ucsi->ppm->data->version > 0x0100) {
> -			mutex_unlock(&dp->con->lock);
> -			return ret;
> -		}
> +		if (ucsi->version > 0x0100)
> +			goto err_unlock;
>  		cur =3D 0xff;
>  	}
>=20
>  	if (cur !=3D 0xff) {
> -		mutex_unlock(&dp->con->lock);
> -		if (dp->con->port_altmode[cur] =3D=3D alt)
> -			return 0;
> -		return -EBUSY;
> +		ret =3D dp->con->port_altmode[cur] =3D=3D alt ? 0 : -EBUSY;
> +		goto err_unlock;
>  	}
>=20
>  	/*
> @@ -94,10 +91,11 @@ static int ucsi_displayport_enter(struct typec_altmod=
e
> *alt)
>  	dp->vdo_size =3D 1;
>=20
>  	schedule_work(&dp->work);
> -
> +	ret =3D 0;
> +err_unlock:
>  	mutex_unlock(&dp->con->lock);
>=20
> -	return 0;
> +	return ret;
>  }
>=20
>  static int ucsi_displayport_exit(struct typec_altmode *alt) diff --git
> a/drivers/usb/typec/ucsi/trace.h b/drivers/usb/typec/ucsi/trace.h index
> 783ec9c72055..6e3d510b236e 100644
> --- a/drivers/usb/typec/ucsi/trace.h
> +++ b/drivers/usb/typec/ucsi/trace.h
> @@ -75,23 +75,6 @@ DEFINE_EVENT(ucsi_log_command, ucsi_reset_ppm,
>  	TP_ARGS(ctrl, ret)
>  );
>=20
> -DECLARE_EVENT_CLASS(ucsi_log_cci,
> -	TP_PROTO(u32 cci),
> -	TP_ARGS(cci),
> -	TP_STRUCT__entry(
> -		__field(u32, cci)
> -	),
> -	TP_fast_assign(
> -		__entry->cci =3D cci;
> -	),
> -	TP_printk("CCI=3D%08x %s", __entry->cci, ucsi_cci_str(__entry->cci))
> -);
> -
> -DEFINE_EVENT(ucsi_log_cci, ucsi_notify,
> -	TP_PROTO(u32 cci),
> -	TP_ARGS(cci)
> -);
> -
>  DECLARE_EVENT_CLASS(ucsi_log_connector_status,
>  	TP_PROTO(int port, struct ucsi_connector_status *status),
>  	TP_ARGS(port, status),
> diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.=
c index
> 75f0a5df6a7f..b8173b5c1624 100644
> --- a/drivers/usb/typec/ucsi/ucsi.c
> +++ b/drivers/usb/typec/ucsi/ucsi.c
> @@ -36,68 +36,6 @@
>   */
>  #define UCSI_SWAP_TIMEOUT_MS	5000
>=20
> -static inline int ucsi_sync(struct ucsi *ucsi) -{
> -	if (ucsi->ppm && ucsi->ppm->sync)
> -		return ucsi->ppm->sync(ucsi->ppm);
> -	return 0;
> -}
> -
> -static int ucsi_command(struct ucsi *ucsi, struct ucsi_control *ctrl) -{
> -	int ret;
> -
> -	trace_ucsi_command(ctrl);
> -
> -	set_bit(COMMAND_PENDING, &ucsi->flags);
> -
> -	ret =3D ucsi->ppm->cmd(ucsi->ppm, ctrl);
> -	if (ret)
> -		goto err_clear_flag;
> -
> -	if (!wait_for_completion_timeout(&ucsi->complete,
> -
> msecs_to_jiffies(UCSI_TIMEOUT_MS))) {
> -		dev_warn(ucsi->dev, "PPM NOT RESPONDING\n");
> -		ret =3D -ETIMEDOUT;
> -	}
> -
> -err_clear_flag:
> -	clear_bit(COMMAND_PENDING, &ucsi->flags);
> -
> -	return ret;
> -}
> -
> -static int ucsi_ack(struct ucsi *ucsi, u8 ack) -{
> -	struct ucsi_control ctrl;
> -	int ret;
> -
> -	trace_ucsi_ack(ack);
> -
> -	set_bit(ACK_PENDING, &ucsi->flags);
> -
> -	UCSI_CMD_ACK(ctrl, ack);
> -	ret =3D ucsi->ppm->cmd(ucsi->ppm, &ctrl);
> -	if (ret)
> -		goto out_clear_bit;
> -
> -	/* Waiting for ACK with ACK CMD, but not with EVENT for now */
> -	if (ack =3D=3D UCSI_ACK_EVENT)
> -		goto out_clear_bit;
> -
> -	if (!wait_for_completion_timeout(&ucsi->complete,
> -
> msecs_to_jiffies(UCSI_TIMEOUT_MS)))
> -		ret =3D -ETIMEDOUT;
> -
> -out_clear_bit:
> -	clear_bit(ACK_PENDING, &ucsi->flags);
> -
> -	if (ret)
> -		dev_err(ucsi->dev, "%s: failed\n", __func__);
> -
> -	return ret;
> -}
> -
>  static int ucsi_acknowledge_command(struct ucsi *ucsi)  {
>  	u64 ctrl;
> @@ -193,115 +131,26 @@ static int ucsi_exec_command(struct ucsi *ucsi,
> u64 cmd)  static int ucsi_run_command(struct ucsi *ucsi, struct ucsi_cont=
rol
> *ctrl,
>  			    void *data, size_t size)
>  {
> -	struct ucsi_control _ctrl;
> -	u8 data_length;
> -	u16 error;
> +	u8 length;
>  	int ret;
>=20
> -	if (ucsi->ops) {
> -		ret =3D ucsi_exec_command(ucsi, ctrl->raw_cmd);
> -		if (ret < 0)
> -			return ret;
> -
> -		data_length =3D ret;
> +	ret =3D ucsi_exec_command(ucsi, ctrl->raw_cmd);
> +	if (ret < 0)
> +		return ret;
>=20
> -		if (data) {
> -			ret =3D ucsi->ops->read(ucsi, UCSI_MESSAGE_IN, data,
> size);
> -			if (ret)
> -				return ret;
> -		}
> +	length =3D ret;
>=20
> -		ret =3D ucsi_acknowledge_command(ucsi);
> +	if (data) {
> +		ret =3D ucsi->ops->read(ucsi, UCSI_MESSAGE_IN, data, size);
>  		if (ret)
>  			return ret;
> -
> -		return data_length;
>  	}
>=20
> -	ret =3D ucsi_command(ucsi, ctrl);
> +	ret =3D ucsi_acknowledge_command(ucsi);
>  	if (ret)
> -		goto err;
> -
> -	switch (ucsi->status) {
> -	case UCSI_IDLE:
> -		ret =3D ucsi_sync(ucsi);
> -		if (ret)
> -			dev_warn(ucsi->dev, "%s: sync failed\n", __func__);
> -
> -		if (data)
> -			memcpy(data, ucsi->ppm->data->message_in, size);
> -
> -		data_length =3D ucsi->ppm->data->cci.data_length;
> -
> -		ret =3D ucsi_ack(ucsi, UCSI_ACK_CMD);
> -		if (!ret)
> -			ret =3D data_length;
> -		break;
> -	case UCSI_BUSY:
> -		/* The caller decides whether to cancel or not */
> -		ret =3D -EBUSY;
> -		break;
> -	case UCSI_ERROR:
> -		ret =3D ucsi_ack(ucsi, UCSI_ACK_CMD);
> -		if (ret)
> -			break;
> -
> -		_ctrl.raw_cmd =3D 0;
> -		_ctrl.cmd.cmd =3D UCSI_GET_ERROR_STATUS;
> -		ret =3D ucsi_command(ucsi, &_ctrl);
> -		if (ret) {
> -			dev_err(ucsi->dev, "reading error failed!\n");
> -			break;
> -		}
> -
> -		memcpy(&error, ucsi->ppm->data->message_in, sizeof(error));
> -
> -		/* Something has really gone wrong */
> -		if (WARN_ON(ucsi->status =3D=3D UCSI_ERROR)) {
> -			ret =3D -ENODEV;
> -			break;
> -		}
> -
> -		ret =3D ucsi_ack(ucsi, UCSI_ACK_CMD);
> -		if (ret)
> -			break;
> -
> -		switch (error) {
> -		case UCSI_ERROR_INCOMPATIBLE_PARTNER:
> -			ret =3D -EOPNOTSUPP;
> -			break;
> -		case UCSI_ERROR_CC_COMMUNICATION_ERR:
> -			ret =3D -ECOMM;
> -			break;
> -		case UCSI_ERROR_CONTRACT_NEGOTIATION_FAIL:
> -			ret =3D -EPROTO;
> -			break;
> -		case UCSI_ERROR_DEAD_BATTERY:
> -			dev_warn(ucsi->dev, "Dead battery condition!\n");
> -			ret =3D -EPERM;
> -			break;
> -		/* The following mean a bug in this driver */
> -		case UCSI_ERROR_INVALID_CON_NUM:
> -		case UCSI_ERROR_UNREGONIZED_CMD:
> -		case UCSI_ERROR_INVALID_CMD_ARGUMENT:
> -			dev_warn(ucsi->dev,
> -				 "%s: possible UCSI driver bug - error 0x%x\n",
> -				 __func__, error);
> -			ret =3D -EINVAL;
> -			break;
> -		default:
> -			dev_warn(ucsi->dev,
> -				 "%s: error without status\n", __func__);
> -			ret =3D -EIO;
> -			break;
> -		}
> -		break;
> -	}
> -
> -err:
> -	trace_ucsi_run_command(ctrl, ret);
> +		return ret;
>=20
> -	return ret;
> +	return length;
>  }
>=20
>  int ucsi_send_command(struct ucsi *ucsi, struct ucsi_control *ctrl, @@ -=
331,7
> +180,7 @@ EXPORT_SYMBOL_GPL(ucsi_resume);  void
> ucsi_altmode_update_active(struct ucsi_connector *con)  {
>  	const struct typec_altmode *altmode =3D NULL;
> -	struct ucsi_control ctrl;
> +	u64 command;
>  	int ret;
>  	u8 cur;
>  	int i;
> @@ -339,7 +188,7 @@ void ucsi_altmode_update_active(struct
> ucsi_connector *con)
>  	UCSI_CMD_GET_CURRENT_CAM(ctrl, con->num);
>  	ret =3D ucsi_run_command(con->ucsi, &ctrl, &cur, sizeof(cur));
>  	if (ret < 0) {
> -		if (con->ucsi->ppm->data->version > 0x0100) {
> +		if (con->ucsi->version > 0x0100) {
>  			dev_err(con->ucsi->dev,
>  				"GET_CURRENT_CAM command failed\n");
>  			return;
> @@ -692,10 +541,7 @@ static void ucsi_handle_connector_change(struct
> work_struct *work)
>  	if (con->status.change & UCSI_CONSTAT_PARTNER_CHANGE)
>  		ucsi_partner_change(con);
>=20
> -	if (ucsi->ops)
> -		ret =3D ucsi_acknowledge_connector_change(ucsi);
> -	else
> -		ret =3D ucsi_ack(ucsi, UCSI_ACK_EVENT);
> +	ret =3D ucsi_acknowledge_connector_change(ucsi);
>  	if (ret)
>  		dev_err(ucsi->dev, "%s: ACK failed (%d)", __func__, ret);
>=20
> @@ -720,45 +566,6 @@ void ucsi_connector_change(struct ucsi *ucsi, u8
> num)  }  EXPORT_SYMBOL_GPL(ucsi_connector_change);
>=20
> -/**
> - * ucsi_notify - PPM notification handler
> - * @ucsi: Source UCSI Interface for the notifications
> - *
> - * Handle notifications from PPM of @ucsi.
> - */
> -void ucsi_notify(struct ucsi *ucsi)
> -{
> -	struct ucsi_cci *cci;
> -
> -	/* There is no requirement to sync here, but no harm either. */
> -	ucsi_sync(ucsi);
> -
> -	cci =3D &ucsi->ppm->data->cci;
> -
> -	if (cci->error)
> -		ucsi->status =3D UCSI_ERROR;
> -	else if (cci->busy)
> -		ucsi->status =3D UCSI_BUSY;
> -	else
> -		ucsi->status =3D UCSI_IDLE;
> -
> -	if (cci->cmd_complete && test_bit(COMMAND_PENDING, &ucsi-
> >flags)) {
> -		complete(&ucsi->complete);
> -	} else if (cci->ack_complete && test_bit(ACK_PENDING, &ucsi->flags))
> {
> -		complete(&ucsi->complete);
> -	} else if (cci->connector_change) {
> -		struct ucsi_connector *con;
> -
> -		con =3D &ucsi->connector[cci->connector_change - 1];
> -
> -		if (!test_and_set_bit(EVENT_PENDING, &ucsi->flags))
> -			schedule_work(&con->work);
> -	}
> -
> -	trace_ucsi_notify(ucsi->ppm->data->raw_cci);
> -}
> -EXPORT_SYMBOL_GPL(ucsi_notify);
> -
>  /* ---------------------------------------------------------------------=
----- */
>=20
>  static int ucsi_reset_connector(struct ucsi_connector *con, bool hard) @=
@ -
> 772,82 +579,39 @@ static int ucsi_reset_connector(struct ucsi_connector
> *con, bool hard)
>=20
>  static int ucsi_reset_ppm(struct ucsi *ucsi)  {
> -	struct ucsi_control ctrl;
> +	u64 command =3D UCSI_PPM_RESET;
>  	unsigned long tmo;
> +	u32 cci;
>  	int ret;
>=20
> -	if (ucsi->ops) {
> -		u64 command =3D UCSI_PPM_RESET;
> -		u32 cci;
> -
> -		ret =3D ucsi->ops->async_write(ucsi, UCSI_CONTROL,
> &command,
> -					     sizeof(command));
> -		if (ret < 0)
> -			return ret;
> -
> -		tmo =3D jiffies + msecs_to_jiffies(UCSI_TIMEOUT_MS);
> -
> -		do {
> -			if (time_is_before_jiffies(tmo))
> -				return -ETIMEDOUT;
> -
> -			ret =3D ucsi->ops->read(ucsi, UCSI_CCI, &cci, sizeof(cci));
> -			if (ret)
> -				return ret;
> -
> -			if (cci & ~UCSI_CCI_RESET_COMPLETE) {
> -				ret =3D ucsi->ops->async_write(ucsi,
> UCSI_CONTROL,
> -							     &command,
> -							     sizeof(command));
> -				if (ret < 0)
> -					return ret;
> -			}
> -
> -			msleep(20);
> -		} while (!(cci & UCSI_CCI_RESET_COMPLETE));
> -
> -		return 0;
> -	}
> -
> -	ctrl.raw_cmd =3D 0;
> -	ctrl.cmd.cmd =3D UCSI_PPM_RESET;
> -	trace_ucsi_command(&ctrl);
> -	ret =3D ucsi->ppm->cmd(ucsi->ppm, &ctrl);
> -	if (ret)
> -		goto err;
> +	ret =3D ucsi->ops->async_write(ucsi, UCSI_CONTROL, &command,
> +				     sizeof(command));
> +	if (ret < 0)
> +		return ret;
>=20
>  	tmo =3D jiffies + msecs_to_jiffies(UCSI_TIMEOUT_MS);
>=20
>  	do {
> -		/* Here sync is critical. */
> -		ret =3D ucsi_sync(ucsi);
> -		if (ret)
> -			goto err;
> +		if (time_is_before_jiffies(tmo))
> +			return -ETIMEDOUT;
>=20
> -		if (ucsi->ppm->data->cci.reset_complete)
> -			break;
> +		ret =3D ucsi->ops->read(ucsi, UCSI_CCI, &cci, sizeof(cci));
> +		if (ret)
> +			return ret;
>=20
>  		/* If the PPM is still doing something else, reset it again. */
> -		if (ucsi->ppm->data->raw_cci) {
> -			dev_warn_ratelimited(ucsi->dev,
> -				"Failed to reset PPM! Trying again..\n");
> -
> -			trace_ucsi_command(&ctrl);
> -			ret =3D ucsi->ppm->cmd(ucsi->ppm, &ctrl);
> -			if (ret)
> -				goto err;
> +		if (cci & ~UCSI_CCI_RESET_COMPLETE) {
> +			ret =3D ucsi->ops->async_write(ucsi, UCSI_CONTROL,
> +						     &command,
> +						     sizeof(command));
> +			if (ret < 0)
> +				return ret;
>  		}
>=20
> -		/* Letting the PPM settle down. */
>  		msleep(20);
> +	} while (!(cci & UCSI_CCI_RESET_COMPLETE));
>=20
> -		ret =3D -ETIMEDOUT;
> -	} while (time_is_after_jiffies(tmo));
> -
> -err:
> -	trace_ucsi_reset_ppm(&ctrl, ret);
> -
> -	return ret;
> +	return 0;
>  }
>=20
>  static int ucsi_role_cmd(struct ucsi_connector *con, struct ucsi_control=
 *ctrl)
> @@ -1262,51 +1026,6 @@ void ucsi_unregister(struct ucsi *ucsi)  }
> EXPORT_SYMBOL_GPL(ucsi_unregister);
>=20
> -/**
> - * ucsi_register_ppm - Register UCSI PPM Interface
> - * @dev: Device interface to the PPM
> - * @ppm: The PPM interface
> - *
> - * Allocates UCSI instance, associates it with @ppm and returns it to th=
e
> - * caller, and schedules initialization of the interface.
> - */
> -struct ucsi *ucsi_register_ppm(struct device *dev, struct ucsi_ppm *ppm)=
 -{
> -	struct ucsi *ucsi;
> -
> -	ucsi =3D kzalloc(sizeof(*ucsi), GFP_KERNEL);
> -	if (!ucsi)
> -		return ERR_PTR(-ENOMEM);
> -
> -	INIT_WORK(&ucsi->work, ucsi_init_work);
> -	init_completion(&ucsi->complete);
> -	mutex_init(&ucsi->ppm_lock);
> -
> -	ucsi->dev =3D dev;
> -	ucsi->ppm =3D ppm;
> -
> -	/*
> -	 * Communication with the PPM takes a lot of time. It is not
> reasonable
> -	 * to initialize the driver here. Using a work for now.
> -	 */
> -	queue_work(system_long_wq, &ucsi->work);
> -
> -	return ucsi;
> -}
> -EXPORT_SYMBOL_GPL(ucsi_register_ppm);
> -
> -/**
> - * ucsi_unregister_ppm - Unregister UCSI PPM Interface
> - * @ucsi: struct ucsi associated with the PPM
> - *
> - * Unregister UCSI PPM that was created with ucsi_register().
> - */
> -void ucsi_unregister_ppm(struct ucsi *ucsi) -{
> -	ucsi_unregister(ucsi);
> -}
> -EXPORT_SYMBOL_GPL(ucsi_unregister_ppm);
> -
>  MODULE_AUTHOR("Heikki Krogerus <heikki.krogerus@linux.intel.com>");
>  MODULE_LICENSE("GPL v2");
>  MODULE_DESCRIPTION("USB Type-C Connector System Software Interface
> driver"); diff --git a/drivers/usb/typec/ucsi/ucsi.h
> b/drivers/usb/typec/ucsi/ucsi.h index d8a8e8f2f912..29f9e7f0d212 100644
> --- a/drivers/usb/typec/ucsi/ucsi.h
> +++ b/drivers/usb/typec/ucsi/ucsi.h
> @@ -398,54 +398,13 @@ struct ucsi_connector_status {
>=20
>  /* ---------------------------------------------------------------------=
----- */
>=20
> -struct ucsi;
> -
> -struct ucsi_data {
> -	u16 version;
> -	u16 reserved;
> -	union {
> -		u32 raw_cci;
> -		struct ucsi_cci cci;
> -	};
> -	struct ucsi_control ctrl;
> -	u32 message_in[4];
> -	u32 message_out[4];
> -} __packed;
> -
> -/*
> - * struct ucsi_ppm - Interface to UCSI Platform Policy Manager
> - * @data: memory location to the UCSI data structures
> - * @cmd: UCSI command execution routine
> - * @sync: Refresh UCSI mailbox (the data structures)
> - */
> -struct ucsi_ppm {
> -	struct ucsi_data *data;
> -	int (*cmd)(struct ucsi_ppm *, struct ucsi_control *);
> -	int (*sync)(struct ucsi_ppm *);
> -};
> -
> -struct ucsi *ucsi_register_ppm(struct device *dev, struct ucsi_ppm *ppm)=
; -
> void ucsi_unregister_ppm(struct ucsi *ucsi); -void ucsi_notify(struct ucs=
i
> *ucsi);
> -
> -/* ---------------------------------------------------------------------=
----- */
> -
> -enum ucsi_status {
> -	UCSI_IDLE =3D 0,
> -	UCSI_BUSY,
> -	UCSI_ERROR,
> -};
> -
>  struct ucsi {
>  	u16 version;
>  	struct device *dev;
> -	struct ucsi_ppm *ppm;
>  	struct driver_data *driver_data;
>=20
>  	const struct ucsi_operations *ops;
>=20
> -	enum ucsi_status status;
> -	struct completion complete;
>  	struct ucsi_capability cap;
>  	struct ucsi_connector *connector;
>=20
> --
> 2.23.0

