Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5607C172F5
	for <lists+linux-usb@lfdr.de>; Wed,  8 May 2019 09:55:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726543AbfEHHyS (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 8 May 2019 03:54:18 -0400
Received: from nat-hk.nvidia.com ([203.18.50.4]:43663 "EHLO nat-hk.nvidia.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726470AbfEHHyS (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 8 May 2019 03:54:18 -0400
Received: from hkpgpgate101.nvidia.com (Not Verified[10.18.92.77]) by nat-hk.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5cd28b270000>; Wed, 08 May 2019 15:54:15 +0800
Received: from HKMAIL102.nvidia.com ([10.18.16.11])
  by hkpgpgate101.nvidia.com (PGP Universal service);
  Wed, 08 May 2019 00:54:15 -0700
X-PGP-Universal: processed;
        by hkpgpgate101.nvidia.com on Wed, 08 May 2019 00:54:15 -0700
Received: from HKMAIL102.nvidia.com (10.18.16.11) by HKMAIL102.nvidia.com
 (10.18.16.11) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 8 May
 2019 07:54:14 +0000
Received: from NAM01-BN3-obe.outbound.protection.outlook.com (104.47.33.51) by
 HKMAIL102.nvidia.com (10.18.16.11) with Microsoft SMTP Server (TLS) id
 15.0.1473.3 via Frontend Transport; Wed, 8 May 2019 07:54:14 +0000
Received: from DM6PR12MB2651.namprd12.prod.outlook.com (20.176.116.24) by
 DM6PR12MB3641.namprd12.prod.outlook.com (20.178.199.91) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1856.11; Wed, 8 May 2019 07:54:11 +0000
Received: from DM6PR12MB2651.namprd12.prod.outlook.com
 ([fe80::69b0:2225:280c:c54c]) by DM6PR12MB2651.namprd12.prod.outlook.com
 ([fe80::69b0:2225:280c:c54c%2]) with mapi id 15.20.1856.012; Wed, 8 May 2019
 07:54:11 +0000
From:   EJ Hsu <ejh@nvidia.com>
To:     Greg KH <gregkh@linuxfoundation.org>
CC:     "balbi@kernel.org" <balbi@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: RE: [PATCH] usb: gadget: storage: Remove warning message
Thread-Topic: [PATCH] usb: gadget: storage: Remove warning message
Thread-Index: AQHVBU2vm9wb5tWfZU+lvdWeNBHLi6ZgxzsAgAAUBkA=
Date:   Wed, 8 May 2019 07:54:11 +0000
Message-ID: <DM6PR12MB26513FAC2C39FA72CE019775CF320@DM6PR12MB2651.namprd12.prod.outlook.com>
References: <1557285840-16958-1-git-send-email-ejh@nvidia.com>
 <20190508064026.GC14085@kroah.com>
In-Reply-To: <20190508064026.GC14085@kroah.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Enabled=True;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_SiteId=43083d15-7273-40c1-b7db-39efd9ccc17a;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Owner=ejh@nvidia.com;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_SetDate=2019-05-08T07:54:09.1314960Z;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Name=Unrestricted;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Application=Microsoft Azure
 Information Protection;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Extended_MSFT_Method=Automatic;
 Sensitivity=Unrestricted
authentication-results: spf=none (sender IP is ) smtp.mailfrom=ejh@nvidia.com; 
x-originating-ip: [59.124.78.18]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 48c120b0-b3b2-44a2-c089-08d6d38a5bc7
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328)(7193020);SRVR:DM6PR12MB3641;
x-ms-traffictypediagnostic: DM6PR12MB3641:
x-microsoft-antispam-prvs: <DM6PR12MB3641552D99EE70302121707ECF320@DM6PR12MB3641.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4502;
x-forefront-prvs: 0031A0FFAF
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(39860400002)(396003)(376002)(366004)(346002)(136003)(13464003)(189003)(199004)(51914003)(54906003)(53936002)(8676002)(66946007)(446003)(256004)(3846002)(7736002)(74316002)(6116002)(4744005)(6436002)(9686003)(66066001)(26005)(476003)(478600001)(99286004)(52536014)(71190400001)(68736007)(71200400001)(186003)(55016002)(33656002)(316002)(6506007)(53546011)(6916009)(6246003)(5660300002)(14444005)(486006)(102836004)(11346002)(76116006)(14454004)(305945005)(2906002)(76176011)(73956011)(15650500001)(7696005)(66556008)(229853002)(86362001)(81166006)(25786009)(8936002)(81156014)(66446008)(64756008)(66476007)(4326008);DIR:OUT;SFP:1101;SCL:1;SRVR:DM6PR12MB3641;H:DM6PR12MB2651.namprd12.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nvidia.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: wawiMUJQZb0RIrNxa4wm6pxie2B3mWSEiyubo3lgv+tLXCgPy/ty0lXeZM9kBJWp9nnTPfr/QhCaOLvPmo/lURYEfz/SX9ofmEdb3DKhMRiBzBziUXREY6YKwlyJwywSew0NpeFTgg4QUkNz97/+adm5vYdG46ygg3DADhK2VsrZRARHLt6PcjI4g1As7pvcwmWSxd9uGtlXOpjYejOPPR3Ss958Scpa6Y1EJc+lTktx7Zx6O0BipGDEGFjj07M0pjHZaQaCtiDawQOwswGgC9MuzFy4345PLswoLwKXZEjMWTs1z4HFzP2s6OFoRme0ADcRdlxGkHdiEhQHrZPYmJkOotpPDB6rtA+/i/nIIwz+3qgX/AYr5eQLiusUn4LnVLkkD/542ZGgVu8oevgXHRwuavXHj1jv6pUx44DYR6g=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 48c120b0-b3b2-44a2-c089-08d6d38a5bc7
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 May 2019 07:54:11.6798
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3641
X-OriginatorOrg: Nvidia.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1557302055; bh=kDRKDedPAYwWzMia4HbCYPQp7xkWbvIDa+rYlmUyUUU=;
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
        b=TBTQ00OSPxL32HNNrC+NBf9tIbNjmd6SJ/ux+uPe1whadIf/mCXnk3V8uoYWdrdoD
         0njsRYL5zmE8axcBB3BXh58HHEfm/rN4S4+fS1Wid4wBqv251xQpHYXBMczXHTsTPz
         3XIrJ6VDSoLunkB8hUaVXADMnA2PnA+AAbUUeugPr8H95BHsVtGTqCN6hkljluvvU5
         ztN7bBeJ2fpMt6HGhlA8VbG8cJHoPVjt+IfgCX8OZtfxWYmf41clrxF60P06HQkfpo
         7qF2fR24gYgxe1cttpGqKDUq3x2TP9wsnHEhiNhV3sx1ySZmBiQdaokM8hbcUvYbCk
         FJFcNk1QzQw9g==
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Thanks for the info. Will remove it in the V2.

Regards,
EJ

-----Original Message-----
From: Greg KH <gregkh@linuxfoundation.org>=20
Sent: Wednesday, May 8, 2019 2:40 PM
To: EJ Hsu <ejh@nvidia.com>
Cc: balbi@kernel.org; linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: gadget: storage: Remove warning message

On Wed, May 08, 2019 at 11:24:00AM +0800, EJ Hsu wrote:
> --- a/drivers/usb/gadget/function/storage_common.h
> +++ b/drivers/usb/gadget/function/storage_common.h
> @@ -1,4 +1,7 @@
>  /* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (c) 2019, NVIDIA CORPORATION.  All rights reserved.
> + */

Same here, why are you claiming copyright for this whole file?

That is just flat out not acceptable at all, again, go talk to your lawye=
rs.  If you insist on this, I will insist on having one of your lawyers o=
n the signed-off-by: line as well so that they know what they are agreein=
g with.

not ok.

greg k-h
-------------------------------------------------------------------------=
----------
This email message is for the sole use of the intended recipient(s) and m=
ay contain
confidential information.  Any unauthorized review, use, disclosure or di=
stribution
is prohibited.  If you are not the intended recipient, please contact the=
=20sender by
reply email and destroy all copies of the original message.
-------------------------------------------------------------------------=
----------
