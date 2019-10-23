Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 495B3E2042
	for <lists+linux-usb@lfdr.de>; Wed, 23 Oct 2019 18:12:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407103AbfJWQMi (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 23 Oct 2019 12:12:38 -0400
Received: from nat-hk.nvidia.com ([203.18.50.4]:35001 "EHLO nat-hk.nvidia.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2407041AbfJWQMh (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 23 Oct 2019 12:12:37 -0400
Received: from hkpgpgate101.nvidia.com (Not Verified[10.18.92.77]) by nat-hk.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5db07bf20000>; Thu, 24 Oct 2019 00:12:34 +0800
Received: from HKMAIL103.nvidia.com ([10.18.16.12])
  by hkpgpgate101.nvidia.com (PGP Universal service);
  Wed, 23 Oct 2019 09:12:34 -0700
X-PGP-Universal: processed;
        by hkpgpgate101.nvidia.com on Wed, 23 Oct 2019 09:12:34 -0700
Received: from HKMAIL104.nvidia.com (10.18.16.13) by HKMAIL103.nvidia.com
 (10.18.16.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 23 Oct
 2019 16:12:34 +0000
Received: from NAM02-BL2-obe.outbound.protection.outlook.com (104.47.38.53) by
 HKMAIL104.nvidia.com (10.18.16.13) with Microsoft SMTP Server (TLS) id
 15.0.1473.3 via Frontend Transport; Wed, 23 Oct 2019 16:12:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mBfp1CkWLd/dO0AI2f+2BK7yeTGXNQ2b5f2nC+acG+iFQKUKfNAfMbd3gO7NUhFBdtSSU9nbflZVvTisEjWQ8yloL8lMseXeTyny1GnRZ1dlKftYSFzSpnIwS227yBl7IOlCDQu2gZo0I/QAKK0qudPHyuvXlK7rO1Pcz7ocFlt4YWCoGM6QfJ1f1lJSz2Oi52I6mrNJpbCEdC1Q2oatU1vuevvcdQ6ruKHOivmttS2lJEIY0hqX7v6A1Vrrx3Dd9704R5J0SDlQmtogTwu+6LirtjJ0fA4hVrdZHpnVLaLmXIGvnWxqHm2PbqSQkv+APHWxaxt5fodlA9xvKDmJ/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y56v80xVQT3mxbDL6WJXNABZVPQq0Btdj0u70GuE/dQ=;
 b=EQMa6zg6Yod6Ju0m+rFFp+obKkXzMB9UNEcxDOJXsboZFjucaLjHnJLO2ETkC6rkvtDIRv1bcvZLckXpfCCqgBqViIWGgJ+CuiE5o17gYc4xY0X0cJQjTfdEHQGnHUeIR/fG2iJDOZZ+QpxHhwqTLvpJuBCZ2XsixQgscCAUvzSRIEZDc0nqT8edvJHCJ5VUc5KGX414B12bLf7WQGhLOUXORBPSqSsDh+2HqP4bvC168X1E4lMe/JpfKuikL+vG1MLMTX6I2mXLWa3xPgoceCXCMV2zb9+rJTCzDhyV2u077v+KrZ7DW/Fi9+bwtF+LyxkAZ10UwOm/XkTBLeQaKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
Received: from BYAPR12MB2727.namprd12.prod.outlook.com (20.176.253.214) by
 BYAPR12MB2725.namprd12.prod.outlook.com (20.176.255.79) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.21; Wed, 23 Oct 2019 16:12:31 +0000
Received: from BYAPR12MB2727.namprd12.prod.outlook.com
 ([fe80::68ad:82d2:4830:abab]) by BYAPR12MB2727.namprd12.prod.outlook.com
 ([fe80::68ad:82d2:4830:abab%5]) with mapi id 15.20.2367.022; Wed, 23 Oct 2019
 16:12:31 +0000
From:   Ajay Gupta <ajayg@nvidia.com>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     Guenter Roeck <linux@roeck-us.net>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: RE: [PATCH v2 13/18] usb: typec: ucsi: ccg: Move to the new API
Thread-Topic: [PATCH v2 13/18] usb: typec: ucsi: ccg: Move to the new API
Thread-Index: AQHVia/JsuX7SlMOK0mhPQGuRiEYhqdoZdcA
Date:   Wed, 23 Oct 2019 16:12:31 +0000
Message-ID: <BYAPR12MB2727F129358456DBD5D087DEDC6B0@BYAPR12MB2727.namprd12.prod.outlook.com>
References: <20191023143939.39668-1-heikki.krogerus@linux.intel.com>
 <20191023143939.39668-14-heikki.krogerus@linux.intel.com>
In-Reply-To: <20191023143939.39668-14-heikki.krogerus@linux.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Enabled=True;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_SiteId=43083d15-7273-40c1-b7db-39efd9ccc17a;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Owner=ajayg@nvidia.com;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_SetDate=2019-10-23T16:12:29.9748496Z;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Name=Unrestricted;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Application=Microsoft Azure
 Information Protection;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_ActionId=7b7521c2-fcb3-4421-86f1-698aa2e093aa;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Extended_MSFT_Method=Automatic
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=ajayg@nvidia.com; 
x-originating-ip: [216.228.112.22]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a50699e4-173e-4cd1-bf64-08d757d3cecc
x-ms-traffictypediagnostic: BYAPR12MB2725:
x-microsoft-antispam-prvs: <BYAPR12MB2725C1980B9D8B4357DCBAAEDC6B0@BYAPR12MB2725.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3968;
x-forefront-prvs: 019919A9E4
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(979002)(4636009)(396003)(366004)(376002)(39860400002)(346002)(136003)(13464003)(199004)(189003)(52536014)(66066001)(6506007)(5660300002)(76116006)(102836004)(11346002)(99286004)(478600001)(3846002)(6436002)(86362001)(6116002)(229853002)(7736002)(305945005)(66946007)(74316002)(186003)(14444005)(256004)(26005)(446003)(7696005)(55016002)(2906002)(110136005)(76176011)(6246003)(54906003)(53546011)(66476007)(476003)(316002)(486006)(33656002)(9686003)(64756008)(66446008)(66556008)(71190400001)(71200400001)(8676002)(14454004)(4326008)(8936002)(81156014)(81166006)(25786009)(969003)(989001)(999001)(1009001)(1019001);DIR:OUT;SFP:1101;SCL:1;SRVR:BYAPR12MB2725;H:BYAPR12MB2727.namprd12.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nvidia.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: O345OnwFxHhdvYfWP7+OWQvStxGJEIv/0ce5konvi48t3yjgP2OGmWTjsugZU4XwbV4oeRJN8EehTZd2fBCfruqjgedmv0An1vDQOWx6axDCUvjl0SqzITjtDz/s4VLly0zJan4KREH6IidE939OVMV4uxUgxasIk5AQQrJDZPrMRKkUbfxqmwphcqjr1gifk06WttgwzXKYCXq5igLiLZdviAGHZqa74kWItFji0mtFR4lJVPwehEmfAsSDwBn3JEcOTNwjpwFFO/4AHpWnbMLRXZnpVuwXrVzd/BDN0scycoABTGI4C+mkvSsAKcNcvjwk6VjnFnfxz5LmE3f3xSRC3RV78H98jtZwCahNN7ZJmCwhM/gSR2Sks659hKJQGF1kIWYDymITJ4SSk9GJ3SzhShqcyFAHZnMHnO/iKy0gSK+Eb59Oyx2pYeIbNpfv
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: a50699e4-173e-4cd1-bf64-08d757d3cecc
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Oct 2019 16:12:31.3156
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zqg3e4N4i5T5vw/0FXl6B5wtya1Oa2Y6bkUQZNDtu2t2mWiNKKnTnahNpH576p74Itm95mWdsYCoRW9E+WPurg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2725
X-OriginatorOrg: Nvidia.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1571847154; bh=Y56v80xVQT3mxbDL6WJXNABZVPQq0Btdj0u70GuE/dQ=;
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
        b=YgiZdkfcXqS/YRnlLiKRLaVErAFoRt1kDoBJhxbuCQNh0sZYBN6FQnsEHauOE+zIP
         U6YJ/LI3MVADfWL0UGa+NQ9FSW4n4DX+eFtM17NgQOez/k+yeNfJdEDXqqtFJ7FpN9
         TPz3t4zK7JAhSvbxAUjyBTEBwR4cpmuHRU4dY8YyMFqBSxlnQ54u/UxVyD5lMcuJc4
         c2TL/nDgOk92u3yNRX8gFFvL05CWWf6gk/p7yTXNik7zd7W+F8/gsmWjhz7lachEEP
         aYPfG2eYHkIXJgi6c2l3f7cZmIC8z7l1ik9JbApnn7u3//6/DMa/ilewWA5M4WKrZE
         roQ9H+iL+0dpg==
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Heikki

> -----Original Message-----
> From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> Sent: Wednesday, October 23, 2019 7:40 AM
> To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Guenter Roeck <linux@roeck-us.net>; Ajay Gupta <ajayg@nvidia.com>;
> linux-usb@vger.kernel.org
> Subject: [PATCH v2 13/18] usb: typec: ucsi: ccg: Move to the new API
>=20
> Replacing the old "cmd" and "sync" callbacks with an implementation of st=
ruct
> ucsi_operations. The interrupt handler will from now on read the CCI
> (Command Status and Connector Change Indication) register, and call
> ucsi_connector_change() function and/or complete pending command
> completions based on it.

I have tested the entire set for ucsi_ccg controller on NVIDIA GPU.

Tested-by: Ajay Gupta <ajayg@nvidia.com>

thanks
>  nvpublic
>=20
> Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> ---
>  drivers/usb/typec/ucsi/ucsi_ccg.c | 170 +++++++++++++++---------------
>  1 file changed, 85 insertions(+), 85 deletions(-)
>=20
> diff --git a/drivers/usb/typec/ucsi/ucsi_ccg.c
> b/drivers/usb/typec/ucsi/ucsi_ccg.c
> index d772fce51905..43442580a13c 100644
> --- a/drivers/usb/typec/ucsi/ucsi_ccg.c
> +++ b/drivers/usb/typec/ucsi/ucsi_ccg.c
> @@ -176,8 +176,8 @@ struct ccg_resp {
>  struct ucsi_ccg {
>  	struct device *dev;
>  	struct ucsi *ucsi;
> -	struct ucsi_ppm ppm;
>  	struct i2c_client *client;
> +
>  	struct ccg_dev_info info;
>  	/* version info for boot, primary and secondary */
>  	struct version_info version[FW2 + 1];
> @@ -196,6 +196,8 @@ struct ucsi_ccg {
>  	/* fw build with vendor information */
>  	u16 fw_build;
>  	struct work_struct pm_work;
> +
> +	struct completion complete;
>  };
>=20
>  static int ccg_read(struct ucsi_ccg *uc, u16 rab, u8 *data, u32 len) @@ =
-243,7
> +245,7 @@ static int ccg_read(struct ucsi_ccg *uc, u16 rab, u8 *data, u32=
 len)
>  	return 0;
>  }
>=20
> -static int ccg_write(struct ucsi_ccg *uc, u16 rab, u8 *data, u32 len)
> +static int ccg_write(struct ucsi_ccg *uc, u16 rab, const u8 *data, u32
> +len)
>  {
>  	struct i2c_client *client =3D uc->client;
>  	unsigned char *buf;
> @@ -317,88 +319,89 @@ static int ucsi_ccg_init(struct ucsi_ccg *uc)
>  	return -ETIMEDOUT;
>  }
>=20
> -static int ucsi_ccg_send_data(struct ucsi_ccg *uc)
> +static int ucsi_ccg_read(struct ucsi *ucsi, unsigned int offset,
> +			 void *val, size_t val_len)
>  {
> -	u8 *ppm =3D (u8 *)uc->ppm.data;
> -	int status;
> -	u16 rab;
> +	u16 reg =3D CCGX_RAB_UCSI_DATA_BLOCK(offset);
>=20
> -	rab =3D CCGX_RAB_UCSI_DATA_BLOCK(offsetof(struct ucsi_data,
> message_out));
> -	status =3D ccg_write(uc, rab, ppm +
> -			   offsetof(struct ucsi_data, message_out),
> -			   sizeof(uc->ppm.data->message_out));
> -	if (status < 0)
> -		return status;
> -
> -	rab =3D CCGX_RAB_UCSI_DATA_BLOCK(offsetof(struct ucsi_data, ctrl));
> -	return ccg_write(uc, rab, ppm + offsetof(struct ucsi_data, ctrl),
> -			 sizeof(uc->ppm.data->ctrl));
> +	return ccg_read(ucsi_get_drvdata(ucsi), reg, val, val_len);
>  }
>=20
> -static int ucsi_ccg_recv_data(struct ucsi_ccg *uc)
> +static int ucsi_ccg_async_write(struct ucsi *ucsi, unsigned int offset,
> +				const void *val, size_t val_len)
>  {
> -	u8 *ppm =3D (u8 *)uc->ppm.data;
> -	int status;
> -	u16 rab;
> +	u16 reg =3D CCGX_RAB_UCSI_DATA_BLOCK(offset);
>=20
> -	rab =3D CCGX_RAB_UCSI_DATA_BLOCK(offsetof(struct ucsi_data, cci));
> -	status =3D ccg_read(uc, rab, ppm + offsetof(struct ucsi_data, cci),
> -			  sizeof(uc->ppm.data->cci));
> -	if (status < 0)
> -		return status;
> -
> -	rab =3D CCGX_RAB_UCSI_DATA_BLOCK(offsetof(struct ucsi_data,
> message_in));
> -	return ccg_read(uc, rab, ppm + offsetof(struct ucsi_data, message_in),
> -			sizeof(uc->ppm.data->message_in));
> +	return ccg_write(ucsi_get_drvdata(ucsi), reg, val, val_len);
>  }
>=20
> -static int ucsi_ccg_ack_interrupt(struct ucsi_ccg *uc)
> +static int ucsi_ccg_sync_write(struct ucsi *ucsi, unsigned int offset,
> +			       const void *val, size_t val_len)
>  {
> -	int status;
> -	unsigned char data;
> +	struct ucsi_ccg *uc =3D ucsi_get_drvdata(ucsi);
> +	int ret;
>=20
> -	status =3D ccg_read(uc, CCGX_RAB_INTR_REG, &data, sizeof(data));
> -	if (status < 0)
> -		return status;
> +	mutex_lock(&uc->lock);
> +	pm_runtime_get_sync(uc->dev);
> +	set_bit(DEV_CMD_PENDING, &uc->flags);
>=20
> -	return ccg_write(uc, CCGX_RAB_INTR_REG, &data, sizeof(data));
> -}
> +	ret =3D ucsi_ccg_async_write(ucsi, offset, val, val_len);
> +	if (ret)
> +		goto err_clear_bit;
>=20
> -static int ucsi_ccg_sync(struct ucsi_ppm *ppm) -{
> -	struct ucsi_ccg *uc =3D container_of(ppm, struct ucsi_ccg, ppm);
> -	int status;
> +	if (!wait_for_completion_timeout(&uc->complete,
> msecs_to_jiffies(5000)))
> +		ret =3D -ETIMEDOUT;
>=20
> -	status =3D ucsi_ccg_recv_data(uc);
> -	if (status < 0)
> -		return status;
> +err_clear_bit:
> +	clear_bit(DEV_CMD_PENDING, &uc->flags);
> +	pm_runtime_put_sync(uc->dev);
> +	mutex_unlock(&uc->lock);
>=20
> -	/* ack interrupt to allow next command to run */
> -	return ucsi_ccg_ack_interrupt(uc);
> +	return ret;
>  }
>=20
> -static int ucsi_ccg_cmd(struct ucsi_ppm *ppm, struct ucsi_control *ctrl)=
 -{
> -	struct ucsi_ccg *uc =3D container_of(ppm, struct ucsi_ccg, ppm);
> -
> -	ppm->data->ctrl.raw_cmd =3D ctrl->raw_cmd;
> -	return ucsi_ccg_send_data(uc);
> -}
> +static const struct ucsi_operations ucsi_ccg_ops =3D {
> +	.read =3D ucsi_ccg_read,
> +	.sync_write =3D ucsi_ccg_sync_write,
> +	.async_write =3D ucsi_ccg_async_write
> +};
>=20
>  static irqreturn_t ccg_irq_handler(int irq, void *data)  {
> +	u16 reg =3D CCGX_RAB_UCSI_DATA_BLOCK(UCSI_CCI);
>  	struct ucsi_ccg *uc =3D data;
> +	u8 intr_reg;
> +	u32 cci;
> +	int ret;
> +
> +	ret =3D ccg_read(uc, CCGX_RAB_INTR_REG, &intr_reg, sizeof(intr_reg));
> +	if (ret)
> +		return ret;
> +
> +	ret =3D ccg_read(uc, reg, (void *)&cci, sizeof(cci));
> +	if (ret) {
> +		dev_err(uc->dev, "failed to read CCI\n");
> +		goto err_clear_irq;
> +	}
> +
> +	if (UCSI_CCI_CONNECTOR(cci))
> +		ucsi_connector_change(uc->ucsi, UCSI_CCI_CONNECTOR(cci));
>=20
> -	ucsi_notify(uc->ucsi);
> +	if (test_bit(DEV_CMD_PENDING, &uc->flags) &&
> +	    cci & (UCSI_CCI_ACK_COMPLETE |
> UCSI_CCI_COMMAND_COMPLETE))
> +		complete(&uc->complete);
> +
> +err_clear_irq:
> +	ret =3D  ccg_write(uc, CCGX_RAB_INTR_REG, &intr_reg, sizeof(intr_reg));
> +	if (ret)
> +		dev_err(uc->dev, "failed to clear interrupt\n");
>=20
>  	return IRQ_HANDLED;
>  }
>=20
>  static void ccg_pm_workaround_work(struct work_struct *pm_work)  {
> -	struct ucsi_ccg *uc =3D container_of(pm_work, struct ucsi_ccg,
> pm_work);
> -
> -	ucsi_notify(uc->ucsi);
> +	ccg_irq_handler(0, container_of(pm_work, struct ucsi_ccg,
> pm_work));
>  }
>=20
>  static int get_fw_info(struct ucsi_ccg *uc) @@ -1027,10 +1030,10 @@ stat=
ic
> int ccg_restart(struct ucsi_ccg *uc)
>  		return status;
>  	}
>=20
> -	uc->ucsi =3D ucsi_register_ppm(dev, &uc->ppm);
> -	if (IS_ERR(uc->ucsi)) {
> -		dev_err(uc->dev, "ucsi_register_ppm failed\n");
> -		return PTR_ERR(uc->ucsi);
> +	status =3D ucsi_register(uc->ucsi);
> +	if (status) {
> +		dev_err(uc->dev, "failed to register the interface\n");
> +		return status;
>  	}
>=20
>  	return 0;
> @@ -1047,7 +1050,7 @@ static void ccg_update_firmware(struct work_struct
> *work)
>  		return;
>=20
>  	if (flash_mode !=3D FLASH_NOT_NEEDED) {
> -		ucsi_unregister_ppm(uc->ucsi);
> +		ucsi_unregister(uc->ucsi);
>  		free_irq(uc->irq, uc);
>=20
>  		ccg_fw_update(uc, flash_mode);
> @@ -1091,21 +1094,15 @@ static int ucsi_ccg_probe(struct i2c_client *clie=
nt,
>  	struct device *dev =3D &client->dev;
>  	struct ucsi_ccg *uc;
>  	int status;
> -	u16 rab;
>=20
>  	uc =3D devm_kzalloc(dev, sizeof(*uc), GFP_KERNEL);
>  	if (!uc)
>  		return -ENOMEM;
>=20
> -	uc->ppm.data =3D devm_kzalloc(dev, sizeof(struct ucsi_data),
> GFP_KERNEL);
> -	if (!uc->ppm.data)
> -		return -ENOMEM;
> -
> -	uc->ppm.cmd =3D ucsi_ccg_cmd;
> -	uc->ppm.sync =3D ucsi_ccg_sync;
>  	uc->dev =3D dev;
>  	uc->client =3D client;
>  	mutex_init(&uc->lock);
> +	init_completion(&uc->complete);
>  	INIT_WORK(&uc->work, ccg_update_firmware);
>  	INIT_WORK(&uc->pm_work, ccg_pm_workaround_work);
>=20
> @@ -1133,30 +1130,25 @@ static int ucsi_ccg_probe(struct i2c_client *clie=
nt,
>  	if (uc->info.mode & CCG_DEVINFO_PDPORTS_MASK)
>  		uc->port_num++;
>=20
> +	uc->ucsi =3D ucsi_create(dev, &ucsi_ccg_ops);
> +	if (IS_ERR(uc->ucsi))
> +		return PTR_ERR(uc->ucsi);
> +
> +	ucsi_set_drvdata(uc->ucsi, uc);
> +
>  	status =3D request_threaded_irq(client->irq, NULL, ccg_irq_handler,
>  				      IRQF_ONESHOT | IRQF_TRIGGER_HIGH,
>  				      dev_name(dev), uc);
>  	if (status < 0) {
>  		dev_err(uc->dev, "request_threaded_irq failed - %d\n",
> status);
> -		return status;
> +		goto out_ucsi_destroy;
>  	}
>=20
>  	uc->irq =3D client->irq;
>=20
> -	uc->ucsi =3D ucsi_register_ppm(dev, &uc->ppm);
> -	if (IS_ERR(uc->ucsi)) {
> -		dev_err(uc->dev, "ucsi_register_ppm failed\n");
> -		return PTR_ERR(uc->ucsi);
> -	}
> -
> -	rab =3D CCGX_RAB_UCSI_DATA_BLOCK(offsetof(struct ucsi_data,
> version));
> -	status =3D ccg_read(uc, rab, (u8 *)(uc->ppm.data) +
> -			  offsetof(struct ucsi_data, version),
> -			  sizeof(uc->ppm.data->version));
> -	if (status < 0) {
> -		ucsi_unregister_ppm(uc->ucsi);
> -		return status;
> -	}
> +	status =3D ucsi_register(uc->ucsi);
> +	if (status)
> +		goto out_free_irq;
>=20
>  	i2c_set_clientdata(client, uc);
>=20
> @@ -1167,6 +1159,13 @@ static int ucsi_ccg_probe(struct i2c_client *clien=
t,
>  	pm_runtime_idle(uc->dev);
>=20
>  	return 0;
> +
> +out_free_irq:
> +	free_irq(uc->irq, uc);
> +out_ucsi_destroy:
> +	ucsi_destroy(uc->ucsi);
> +
> +	return status;
>  }
>=20
>  static int ucsi_ccg_remove(struct i2c_client *client) @@ -1175,8 +1174,9=
 @@
> static int ucsi_ccg_remove(struct i2c_client *client)
>=20
>  	cancel_work_sync(&uc->pm_work);
>  	cancel_work_sync(&uc->work);
> -	ucsi_unregister_ppm(uc->ucsi);
>  	pm_runtime_disable(uc->dev);
> +	ucsi_unregister(uc->ucsi);
> +	ucsi_destroy(uc->ucsi);
>  	free_irq(uc->irq, uc);
>=20
>  	return 0;
> --
> 2.23.0

