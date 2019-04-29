Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 90BD1E824
	for <lists+linux-usb@lfdr.de>; Mon, 29 Apr 2019 18:52:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728781AbfD2QwQ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 29 Apr 2019 12:52:16 -0400
Received: from nat-hk.nvidia.com ([203.18.50.4]:25119 "EHLO nat-hk.nvidia.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728520AbfD2QwP (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 29 Apr 2019 12:52:15 -0400
Received: from hkpgpgate101.nvidia.com (Not Verified[10.18.92.100]) by nat-hk.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5cc72bc60000>; Tue, 30 Apr 2019 00:52:23 +0800
Received: from HKMAIL101.nvidia.com ([10.18.16.10])
  by hkpgpgate101.nvidia.com (PGP Universal service);
  Mon, 29 Apr 2019 09:52:10 -0700
X-PGP-Universal: processed;
        by hkpgpgate101.nvidia.com on Mon, 29 Apr 2019 09:52:10 -0700
Received: from HKMAIL104.nvidia.com (10.18.16.13) by HKMAIL101.nvidia.com
 (10.18.16.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 29 Apr
 2019 16:52:10 +0000
Received: from NAM05-BY2-obe.outbound.protection.outlook.com (104.47.50.53) by
 HKMAIL104.nvidia.com (10.18.16.13) with Microsoft SMTP Server (TLS) id
 15.0.1473.3 via Frontend Transport; Mon, 29 Apr 2019 16:52:10 +0000
Received: from BYAPR12MB2727.namprd12.prod.outlook.com (20.177.125.216) by
 BYAPR12MB2982.namprd12.prod.outlook.com (20.178.53.19) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1835.12; Mon, 29 Apr 2019 16:52:07 +0000
Received: from BYAPR12MB2727.namprd12.prod.outlook.com
 ([fe80::4d1a:e522:4592:ce22]) by BYAPR12MB2727.namprd12.prod.outlook.com
 ([fe80::4d1a:e522:4592:ce22%5]) with mapi id 15.20.1835.016; Mon, 29 Apr 2019
 16:52:07 +0000
From:   Ajay Gupta <ajayg@nvidia.com>
To:     Wei Yongjun <weiyongjun1@huawei.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Wolfram Sang <wsa@the-dreams.de>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>
Subject: RE: [PATCH -next] usb: typec: ucsi: ccg: fix missing unlock on error
 in ccg_cmd_write_flash_row()
Thread-Topic: [PATCH -next] usb: typec: ucsi: ccg: fix missing unlock on error
 in ccg_cmd_write_flash_row()
Thread-Index: AQHU/oV5o0CCDtyt+EyUkiwVnQnz76ZTWIGQ
Date:   Mon, 29 Apr 2019 16:52:07 +0000
Message-ID: <BYAPR12MB2727BC9EE576B4FEE9AD3A19DC390@BYAPR12MB2727.namprd12.prod.outlook.com>
References: <20190429122630.59334-1-weiyongjun1@huawei.com>
In-Reply-To: <20190429122630.59334-1-weiyongjun1@huawei.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Enabled=True;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_SiteId=43083d15-7273-40c1-b7db-39efd9ccc17a;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Owner=ajayg@nvidia.com;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_SetDate=2019-04-29T16:52:06.4504134Z;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Name=Unrestricted;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Application=Microsoft Azure
 Information Protection;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Extended_MSFT_Method=Automatic;
 Sensitivity=Unrestricted
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=ajayg@nvidia.com; 
x-originating-ip: [216.228.112.22]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 06fad105-c69d-4c57-97cd-08d6ccc3040e
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328)(7193020);SRVR:BYAPR12MB2982;
x-ms-traffictypediagnostic: BYAPR12MB2982:
x-microsoft-antispam-prvs: <BYAPR12MB2982609C67DFCC77540D3383DC390@BYAPR12MB2982.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3826;
x-forefront-prvs: 0022134A87
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(39860400002)(346002)(366004)(396003)(376002)(136003)(13464003)(199004)(189003)(476003)(25786009)(6506007)(26005)(4326008)(11346002)(256004)(446003)(66446008)(102836004)(68736007)(86362001)(99286004)(52536014)(7696005)(76176011)(186003)(5660300002)(66476007)(66556008)(66946007)(73956011)(64756008)(53546011)(97736004)(486006)(14444005)(76116006)(66066001)(6436002)(6246003)(9686003)(74316002)(8936002)(14454004)(478600001)(8676002)(305945005)(53936002)(7736002)(55016002)(229853002)(33656002)(81156014)(81166006)(71190400001)(3846002)(71200400001)(2906002)(110136005)(54906003)(6116002)(316002);DIR:OUT;SFP:1101;SCL:1;SRVR:BYAPR12MB2982;H:BYAPR12MB2727.namprd12.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nvidia.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: qp9fMNrEL3ZlqH6imS8pWd7qAKyEFkSGtx0zdspscAr3Gagja6YRR6cfYprwhePF8h7j68muVrjsX5NeR400sMF+y17taYKYaYw00HWDbDfRV/f93VeIw/jv/PqnlfvudvNE7RkU9NXthXCvsoPqrYW7YsY4+NBBoJlb/cmt5MHnxi/AT131ZSS5dTAOn52rljfSLCRytrElVcwF7Qc86txroy9en2xaLAcGcQd177ovxa8MMuDQhm5Viqjk/q3aFRWRqf2bRTq0NQC7GgxdSXRUyMGTTKGE4wJM8a/D1a4anvztFDMmC/Y3KNnYXzJa3uxkj7aGALaVcMFSf7Kk2R2a+pRn2fAYwCqBHoN1xKK0cjcHAqDWLfCPUOEwFY9H9jZ2iJ92dBPW7cNwd9/WI0MMLtW1ummQPYL25kH9NQo=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 06fad105-c69d-4c57-97cd-08d6ccc3040e
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Apr 2019 16:52:07.6506
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2982
X-OriginatorOrg: Nvidia.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1556556743; bh=XAj8L7i2Fnbl66s8ySCJahxYB1mMklO8odCsdcH8lKA=;
        h=X-PGP-Universal:From:To:CC:Subject:Thread-Topic:Thread-Index:Date:
         Message-ID:References:In-Reply-To:Accept-Language:X-MS-Has-Attach:
         X-MS-TNEF-Correlator:msip_labels:authentication-results:
         x-originating-ip:x-ms-publictraffictype:
         x-ms-office365-filtering-correlation-id:x-microsoft-antispam:
         x-ms-traffictypediagnostic:x-microsoft-antispam-prvs:
         x-ms-oob-tlc-oobclassifiers:x-forefront-prvs:
         x-forefront-antispam-report:received-spf:
         x-ms-exchange-senderadcheck:x-microsoft-antispam-message-info:
         MIME-Version:X-MS-Exchange-CrossTenant-Network-Message-Id:
         X-MS-Exchange-CrossTenant-originalarrivaltime:
         X-MS-Exchange-CrossTenant-fromentityheader:
         X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
         X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-OriginatorOrg:
         Content-Language:Content-Type:Content-Transfer-Encoding;
        b=BJalll4gNPeDExUmKVoZJ7O4vqoXkfriHQLauDi2a0cz97eapdeCpMZLeNfQGLcMn
         bFvS/otFuB1qJ3jzy08FPE3SO+Jqo6LQ8VEMF3O7lRI1VMY7rxMj1xcX+rRwW+UEwu
         cT7JfHppzUyIVZ64atyXnjV+PHlL/NMrtNYdQCFip+Ct1NyDDLjsfkxWIR77SHbLB8
         YtYqjP574loudglBHIJslWb6wlWtlgIAE4b+TraM9EVkxFKxYfhhNUbNMxIyoXcqDF
         a+iyOqeImJuFmvWdDOL9TRfq8/bcepsngskkODvIfuXJUkk4/Wtovlwa2n1SLrK2dE
         vD6A13hllBFHQ==
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Wei

> -----Original Message-----
> From: Wei Yongjun <weiyongjun1@huawei.com>
> Sent: Monday, April 29, 2019 5:27 AM
> To: Heikki Krogerus <heikki.krogerus@linux.intel.com>; Greg Kroah-Hartman
> <gregkh@linuxfoundation.org>; Ajay Gupta <ajayg@nvidia.com>; Wolfram Sang
> <wsa@the-dreams.de>
> Cc: Wei Yongjun <weiyongjun1@huawei.com>; linux-usb@vger.kernel.org;
> kernel-janitors@vger.kernel.org
> Subject: [PATCH -next] usb: typec: ucsi: ccg: fix missing unlock on error=
 in
> ccg_cmd_write_flash_row()
>=20
> Add the missing unlock before return from function ccg_cmd_write_flash_ro=
w()
> in the error handling case.
Thanks for fixing this. The change looks good.

> nvpublic
>=20
> Fixes: 5c9ae5a87573 ("usb: typec: ucsi: ccg: add firmware flashing suppor=
t")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> ---
>  drivers/usb/typec/ucsi/ucsi_ccg.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/usb/typec/ucsi/ucsi_ccg.c
> b/drivers/usb/typec/ucsi/ucsi_ccg.c
> index 4632b91a04a6..9d46aa9e4e35 100644
> --- a/drivers/usb/typec/ucsi/ucsi_ccg.c
> +++ b/drivers/usb/typec/ucsi/ucsi_ccg.c
> @@ -631,6 +631,7 @@ ccg_cmd_write_flash_row(struct ucsi_ccg *uc, u16 row,
>  	ret =3D i2c_master_send(client, buf, CCG4_ROW_SIZE + 2);
>  	if (ret !=3D CCG4_ROW_SIZE + 2) {
>  		dev_err(uc->dev, "REG_FLASH_RW_MEM write fail %d\n", ret);
> +		mutex_unlock(&uc->lock);
>  		return ret < 0 ? ret : -EIO;
>  	}
>=20
>=20

