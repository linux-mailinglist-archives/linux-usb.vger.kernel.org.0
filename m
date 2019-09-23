Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F07F4BBB11
	for <lists+linux-usb@lfdr.de>; Mon, 23 Sep 2019 20:16:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2440381AbfIWSQL (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 23 Sep 2019 14:16:11 -0400
Received: from nat-hk.nvidia.com ([203.18.50.4]:1140 "EHLO nat-hk.nvidia.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2394280AbfIWSQL (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 23 Sep 2019 14:16:11 -0400
Received: from hkpgpgate102.nvidia.com (Not Verified[10.18.92.100]) by nat-hk.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5d890be30000>; Tue, 24 Sep 2019 02:16:04 +0800
Received: from HKMAIL103.nvidia.com ([10.18.16.12])
  by hkpgpgate102.nvidia.com (PGP Universal service);
  Mon, 23 Sep 2019 11:16:03 -0700
X-PGP-Universal: processed;
        by hkpgpgate102.nvidia.com on Mon, 23 Sep 2019 11:16:03 -0700
Received: from HKMAIL103.nvidia.com (10.18.16.12) by HKMAIL103.nvidia.com
 (10.18.16.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 23 Sep
 2019 18:16:02 +0000
Received: from NAM04-BN3-obe.outbound.protection.outlook.com (104.47.46.58) by
 HKMAIL103.nvidia.com (10.18.16.12) with Microsoft SMTP Server (TLS) id
 15.0.1473.3 via Frontend Transport; Mon, 23 Sep 2019 18:16:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aVQDjhuIDhsETOMJD3Orz4fMz/99ps6s82WQoBWYrTjJf4YnxatO8i3x+2aR2ed1DrZEnwCs5dRQqvVQpkrJHDZSVSduHdME/MO8oS6aZmemXCc5lGIZY/X0NWCmbaJxxI+WF9DxbnVAxBDS4ElTlnGBY5V9+CZUhMlcLm2UZkyBzQLIwlGqqQsbymlRIs0M9yDmM6vXFNKrsYBcJZH1JUG+hf/UahUgOAYNzKdD8YLukTiXzf4C5NTrTwNkBL8k1yeH5AvlaDJ7paaqnq1r/van8NvH3Hh4QqJIqxefb4jIXY4VE4l58fseR2mElEqTdZp+GK+LDEFOnyPSXkD2Hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wTeQEfZYXMifmwzBjZ4NOvtKgarxPUckokDNLdw9zWM=;
 b=e3TSgJMNAn9Xp6j9geSXdKIaGHJZfJ/fnPgO5JiafOyLiJeSlwRvo5YFinVZ7YY6tPUUQVxp+eaxOgUJP5ghy7ud8EEqpfqGn/qI9X5CSSinZF0aFYu4pbo4Cqz+TAtXITmm6Zb8JJcke9AOybKzlNhS9NeW6SltVu/E7DrILa3t5orS0yt8h7tpFLUQgST25revjSZ4OhHecErKEsZ8HAT8PP4z/wowV3A1FpUQKLtjUweve6KIfuCZGIlJYRH8bdRH577AfOPCVoc5bcbMy4JnCCQ9rHzH70dQtHqCRIyjiY6poFjgqWlgq9/lniJfqSrsgu+avDELDTgxx1xxgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
Received: from BYAPR12MB2727.namprd12.prod.outlook.com (20.176.253.214) by
 BYAPR12MB3207.namprd12.prod.outlook.com (20.179.92.202) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.18; Mon, 23 Sep 2019 18:15:59 +0000
Received: from BYAPR12MB2727.namprd12.prod.outlook.com
 ([fe80::19f9:64ec:5139:dfca]) by BYAPR12MB2727.namprd12.prod.outlook.com
 ([fe80::19f9:64ec:5139:dfca%3]) with mapi id 15.20.2284.023; Mon, 23 Sep 2019
 18:15:59 +0000
From:   Ajay Gupta <ajayg@nvidia.com>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: RE: [RFC PATCH] usb: typec: ucsi: ccg: Remove run_isr flag
Thread-Topic: [RFC PATCH] usb: typec: ucsi: ccg: Remove run_isr flag
Thread-Index: AQHVchMpp6KrvihpkE21mkAsxfA8y6c5jGtw
Date:   Mon, 23 Sep 2019 18:15:59 +0000
Message-ID: <BYAPR12MB27276DD002AB589162CC7709DC850@BYAPR12MB2727.namprd12.prod.outlook.com>
References: <20190923133101.30774-1-heikki.krogerus@linux.intel.com>
In-Reply-To: <20190923133101.30774-1-heikki.krogerus@linux.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Enabled=True;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_SiteId=43083d15-7273-40c1-b7db-39efd9ccc17a;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Owner=ajayg@nvidia.com;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_SetDate=2019-09-23T18:15:58.1715818Z;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Name=Unrestricted;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Application=Microsoft Azure
 Information Protection;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_ActionId=86f026c0-19d3-491d-b2cb-b3b6396ff728;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Extended_MSFT_Method=Automatic
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=ajayg@nvidia.com; 
x-originating-ip: [216.228.112.22]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 776c053f-3cdc-4a53-119c-08d74052161d
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);SRVR:BYAPR12MB3207;
x-ms-traffictypediagnostic: BYAPR12MB3207:
x-microsoft-antispam-prvs: <BYAPR12MB3207778BA28EA6BB4CF8BBCBDC850@BYAPR12MB3207.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0169092318
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(39860400002)(366004)(376002)(396003)(346002)(136003)(13464003)(199004)(189003)(74316002)(256004)(76176011)(53546011)(6506007)(305945005)(102836004)(7736002)(7696005)(6916009)(4326008)(229853002)(476003)(9686003)(81166006)(81156014)(55016002)(25786009)(446003)(316002)(11346002)(66476007)(64756008)(86362001)(66946007)(66446008)(76116006)(66556008)(6436002)(6246003)(8936002)(486006)(14444005)(8676002)(186003)(478600001)(3846002)(6116002)(26005)(33656002)(14454004)(66066001)(99286004)(5660300002)(2906002)(52536014)(71190400001)(71200400001);DIR:OUT;SFP:1101;SCL:1;SRVR:BYAPR12MB3207;H:BYAPR12MB2727.namprd12.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nvidia.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: hPrSWjcwBFfmLAS/8EG/zcHSV8D2m5CBe000u44leI59m/hTu6TALUPlPdPjyZfPoacSmh7rW+CwpY5/pPTKv6g4Tbjw3GAcym4JG2l/HzSqovw+cUQWhnh4O7i2A+05PonfI+YrmoGANCOgrqzgmPDyhGUydFGsT0Xd7iR1Z8MvZDzLIDtlx8JNkvmgt/tee+gwEisAdZ4Q4XX98XDFG/45tiB4kSF98t7rYifZth0Sx3kpRAbtP9OBA6yGMaS/jV6CaCkTu7zxw7HtijpIb01+p4OcaGW10IKbS+YEjiCGuQfg5GYaVW1OVrwRPvafTk7ZCF7+t5Akb+eW7FBtptRlgAQMdP9UgW6s4iqWw/bw4JUFs8WxaImac5gAFOcTg1A3PZF9sdmpyf3cxxj1ZX3xDMvAsh5WNbpOlPCmq6Y=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 776c053f-3cdc-4a53-119c-08d74052161d
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Sep 2019 18:15:59.6355
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: H+qvkcQBi4gu6rADDfovHWhgVQiS2zr2y1rmQ1X92ITr/JRYVBuSHlHvdeg5VTYLy8alGKSMWU5VDnFLArBO+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3207
X-OriginatorOrg: Nvidia.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1569262564; bh=wTeQEfZYXMifmwzBjZ4NOvtKgarxPUckokDNLdw9zWM=;
        h=X-PGP-Universal:ARC-Seal:ARC-Message-Signature:
         ARC-Authentication-Results:From:To:CC:Subject:Thread-Topic:
         Thread-Index:Date:Message-ID:References:In-Reply-To:
         Accept-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:msip_labels:
         authentication-results:x-originating-ip:x-ms-publictraffictype:
         x-ms-office365-filtering-correlation-id:x-microsoft-antispam:
         x-ms-traffictypediagnostic:x-microsoft-antispam-prvs:
         x-ms-oob-tlc-oobclassifiers:x-forefront-prvs:
         x-forefront-antispam-report:received-spf:
         x-ms-exchange-senderadcheck:x-microsoft-antispam-message-info:
         x-ms-exchange-transport-forked:MIME-Version:
         X-MS-Exchange-CrossTenant-Network-Message-Id:
         X-MS-Exchange-CrossTenant-originalarrivaltime:
         X-MS-Exchange-CrossTenant-fromentityheader:
         X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
         X-MS-Exchange-CrossTenant-userprincipalname:
         X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-OriginatorOrg:
         Content-Language:Content-Type:Content-Transfer-Encoding;
        b=gtlUV0JX+3/Od1Usm2k1ZVerjD4enmpJsnwUdvT+Si4n656NWtLIXr8469Lll1NU8
         mKhPiPiuSZO33Fk18tDBmapNCPOpy9Ysfqmkh84eB1xL3xaJ0V8jbXx9AKvXjW/0U4
         cHsogcSs4svZYJ0Gn6IsooTzuEgcO/yKHuANLD+1hGIzSBFdbmceF7X3uGGIN8VYd1
         Gm3p6+n8ORD09x0bHeWsJP4YnlaoRWUjArYbXE2glwEMl4cWwtPfSRBZmnyV36SD/S
         1aFja6uwFOe9Y1kpTxlUQz2A0a4+kRB7KmssqRqTlhilkqIUVPMMYeU7CTTWi2DC0B
         qkyE7oeuicwXA==
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Heikki,

> -----Original Message-----
> From: linux-usb-owner@vger.kernel.org <linux-usb-owner@vger.kernel.org>
> On Behalf Of Heikki Krogerus
> Sent: Monday, September 23, 2019 6:31 AM
> To: Ajay Gupta <ajayg@nvidia.com>
> Cc: linux-usb@vger.kernel.org
> Subject: [RFC PATCH] usb: typec: ucsi: ccg: Remove run_isr flag
>=20
> There is no need to try to prevent the extra ucsi_notify() that runtime
> resuming the device will cause.
>=20
> This fixes potential deadlock. Both ccg_read() and
> ccg_write() are called with the mutex already taken at least from
> ccg_send_command(). In ccg_read() and ccg_write, the mutex is only acquir=
ed
> so that run_isr flag can be set.
>=20
> Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> ---
> Hi Ajay,
>=20
> Before going forward with this I would like to get confirmation from you =
that it
> is OK, and that I'm not missing anything.=20
Thanks for this. I mixed up firmware flashing and IO path by using same loc=
k.

>I did not see any real purpose for that run_isr flag.=20
> The only thing that I can see it preventing is an extra ucsi_notify()
> call caused by the waking of the controller, but that should not be a pro=
blem.
> Is there any other reason why the flag is there?
ucsi_ccg_runtime_resume() will get called after pm_runtime_get_sync(uc->dev=
);
in ccg_read() and ccg_write(). If we allow extra ucsi_notify() then ccg_rea=
d() and
ccg_write() will get called again from ucsi_notfiy() through ucsi_sync(). T=
his will
keep on happening in a loop and the controller will remain in D0 always and=
=20
runtime pm will never be done.

>=20
> If the driver works fine without the flag, then let's just drop it.
> The deadlock will need to be fixed in any case.

We need to protect read/write of run_isr flag from ccg_read()/ccg_write() a=
nd
ucsi_ccg_runtime_resume() since they can get called from interrupt and runt=
ime
pm threads.

I propose to add new "uc->pm_lock" for this purpose and not use "uc->lock".
Please see the change below for this. I tested both FW flashing and runtime=
 PM
and they both work with new pm_lock.

diff --git a/drivers/usb/typec/ucsi/ucsi_ccg.c b/drivers/usb/typec/ucsi/ucs=
i_ccg.c
index ed727b2..a79a475 100644
--- a/drivers/usb/typec/ucsi/ucsi_ccg.c
+++ b/drivers/usb/typec/ucsi/ucsi_ccg.c
@@ -206,6 +206,7 @@ struct ucsi_ccg {
        /* fw build with vendor information */
        u16 fw_build;
        bool run_isr; /* flag to call ISR routine during resume */
+       struct mutex pm_lock; /* to sync between io and system pm thread */
        struct work_struct pm_work;

        bool has_multiple_dp;
@@ -240,14 +241,14 @@ static int ccg_read(struct ucsi_ccg *uc, u16 rab, u8 =
*data, u32 len)

        if (uc->fw_build =3D=3D CCG_FW_BUILD_NVIDIA &&
            uc->fw_version <=3D CCG_OLD_FW_VERSION) {
-               mutex_lock(&uc->lock);
+               mutex_lock(&uc->pm_lock);
                /*
                 * Do not schedule pm_work to run ISR in
                 * ucsi_ccg_runtime_resume() after pm_runtime_get_sync()
                 * since we are already in ISR path.
                 */
                uc->run_isr =3D false;
-               mutex_unlock(&uc->lock);
+               mutex_unlock(&uc->pm_lock);
        }

        pm_runtime_get_sync(uc->dev);
@@ -294,14 +295,14 @@ static int ccg_write(struct ucsi_ccg *uc, u16 rab, u8=
 *data, u32 len)

        if (uc->fw_build =3D=3D CCG_FW_BUILD_NVIDIA &&
            uc->fw_version <=3D CCG_OLD_FW_VERSION) {
-               mutex_lock(&uc->lock);
+               mutex_lock(&uc->pm_lock);
                /*
                 * Do not schedule pm_work to run ISR in
                 * ucsi_ccg_runtime_resume() after pm_runtime_get_sync()
                 * since we are already in ISR path.
                 */
                uc->run_isr =3D false;
-               mutex_unlock(&uc->lock);
+               mutex_unlock(&uc->pm_lock);
        }

        pm_runtime_get_sync(uc->dev);
@@ -1323,6 +1324,7 @@ static int ucsi_ccg_probe(struct i2c_client *client,
        uc->client =3D client;
        uc->run_isr =3D true;
        mutex_init(&uc->lock);
+       mutex_init(&uc->pm_lock);
        INIT_WORK(&uc->work, ccg_update_firmware);
        INIT_WORK(&uc->pm_work, ccg_pm_workaround_work);
@@ -1434,12 +1436,12 @@ static int ucsi_ccg_runtime_resume(struct device *d=
ev)
         */
        if (uc->fw_build =3D=3D CCG_FW_BUILD_NVIDIA &&
            uc->fw_version <=3D CCG_OLD_FW_VERSION) {
-               mutex_lock(&uc->lock);
+               mutex_lock(&uc->pm_lock);
                if (!uc->run_isr) {
                        uc->run_isr =3D true;
                        schedule =3D false;
                }
-               mutex_unlock(&uc->lock);
+               mutex_unlock(&uc->pm_lock);

                if (schedule)
                        schedule_work(&uc->pm_work);


Thanks
> nvpublic
> thanks,
>=20
> ---
>  drivers/usb/typec/ucsi/ucsi_ccg.c | 40 ++-----------------------------
>  1 file changed, 2 insertions(+), 38 deletions(-)
>=20
> diff --git a/drivers/usb/typec/ucsi/ucsi_ccg.c
> b/drivers/usb/typec/ucsi/ucsi_ccg.c
> index 907e20e1a71e..167cb6367198 100644
> --- a/drivers/usb/typec/ucsi/ucsi_ccg.c
> +++ b/drivers/usb/typec/ucsi/ucsi_ccg.c
> @@ -195,7 +195,6 @@ struct ucsi_ccg {
>=20
>  	/* fw build with vendor information */
>  	u16 fw_build;
> -	bool run_isr; /* flag to call ISR routine during resume */
>  	struct work_struct pm_work;
>  };
>=20
> @@ -224,18 +223,6 @@ static int ccg_read(struct ucsi_ccg *uc, u16 rab, u8
> *data, u32 len)
>  	if (quirks && quirks->max_read_len)
>  		max_read_len =3D quirks->max_read_len;
>=20
> -	if (uc->fw_build =3D=3D CCG_FW_BUILD_NVIDIA &&
> -	    uc->fw_version <=3D CCG_OLD_FW_VERSION) {
> -		mutex_lock(&uc->lock);
> -		/*
> -		 * Do not schedule pm_work to run ISR in
> -		 * ucsi_ccg_runtime_resume() after pm_runtime_get_sync()
> -		 * since we are already in ISR path.
> -		 */
> -		uc->run_isr =3D false;
> -		mutex_unlock(&uc->lock);
> -	}
> -
>  	pm_runtime_get_sync(uc->dev);
>  	while (rem_len > 0) {
>  		msgs[1].buf =3D &data[len - rem_len];
> @@ -278,18 +265,6 @@ static int ccg_write(struct ucsi_ccg *uc, u16 rab, u=
8
> *data, u32 len)
>  	msgs[0].len =3D len + sizeof(rab);
>  	msgs[0].buf =3D buf;
>=20
> -	if (uc->fw_build =3D=3D CCG_FW_BUILD_NVIDIA &&
> -	    uc->fw_version <=3D CCG_OLD_FW_VERSION) {
> -		mutex_lock(&uc->lock);
> -		/*
> -		 * Do not schedule pm_work to run ISR in
> -		 * ucsi_ccg_runtime_resume() after pm_runtime_get_sync()
> -		 * since we are already in ISR path.
> -		 */
> -		uc->run_isr =3D false;
> -		mutex_unlock(&uc->lock);
> -	}
> -
>  	pm_runtime_get_sync(uc->dev);
>  	status =3D i2c_transfer(client->adapter, msgs, ARRAY_SIZE(msgs));
>  	if (status < 0) {
> @@ -1130,7 +1105,6 @@ static int ucsi_ccg_probe(struct i2c_client *client=
,
>  	uc->ppm.sync =3D ucsi_ccg_sync;
>  	uc->dev =3D dev;
>  	uc->client =3D client;
> -	uc->run_isr =3D true;
>  	mutex_init(&uc->lock);
>  	INIT_WORK(&uc->work, ccg_update_firmware);
>  	INIT_WORK(&uc->pm_work, ccg_pm_workaround_work); @@ -1229,7
> +1203,6 @@ static int ucsi_ccg_runtime_resume(struct device *dev)  {
>  	struct i2c_client *client =3D to_i2c_client(dev);
>  	struct ucsi_ccg *uc =3D i2c_get_clientdata(client);
> -	bool schedule =3D true;
>=20
>  	/*
>  	 * Firmware version 3.1.10 or earlier, built for NVIDIA has known issue
> @@ -1237,17 +1210,8 @@ static int ucsi_ccg_runtime_resume(struct device
> *dev)
>  	 * Schedule a work to call ISR as a workaround.
>  	 */
>  	if (uc->fw_build =3D=3D CCG_FW_BUILD_NVIDIA &&
> -	    uc->fw_version <=3D CCG_OLD_FW_VERSION) {
> -		mutex_lock(&uc->lock);
> -		if (!uc->run_isr) {
> -			uc->run_isr =3D true;
> -			schedule =3D false;
> -		}
> -		mutex_unlock(&uc->lock);
> -
> -		if (schedule)
> -			schedule_work(&uc->pm_work);
> -	}
> +	    uc->fw_version <=3D CCG_OLD_FW_VERSION)
> +		schedule_work(&uc->pm_work);
>=20
>  	return 0;
>  }
> --
> 2.23.0

