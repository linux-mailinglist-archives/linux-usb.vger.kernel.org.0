Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4FA12BFC2E
	for <lists+linux-usb@lfdr.de>; Fri, 27 Sep 2019 02:14:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726552AbfI0AOG (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 26 Sep 2019 20:14:06 -0400
Received: from nat-hk.nvidia.com ([203.18.50.4]:30692 "EHLO nat-hk.nvidia.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725819AbfI0AOG (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 26 Sep 2019 20:14:06 -0400
Received: from hkpgpgate101.nvidia.com (Not Verified[10.18.92.77]) by nat-hk.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5d8d544b0000>; Fri, 27 Sep 2019 08:14:03 +0800
Received: from HKMAIL102.nvidia.com ([10.18.16.11])
  by hkpgpgate101.nvidia.com (PGP Universal service);
  Thu, 26 Sep 2019 17:14:00 -0700
X-PGP-Universal: processed;
        by hkpgpgate101.nvidia.com on Thu, 26 Sep 2019 17:14:00 -0700
Received: from HKMAIL102.nvidia.com (10.18.16.11) by HKMAIL102.nvidia.com
 (10.18.16.11) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 27 Sep
 2019 00:14:00 +0000
Received: from NAM04-BN3-obe.outbound.protection.outlook.com (104.47.46.56) by
 HKMAIL102.nvidia.com (10.18.16.11) with Microsoft SMTP Server (TLS) id
 15.0.1473.3 via Frontend Transport; Fri, 27 Sep 2019 00:13:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j/UkWtwPoKNTp8PUtJ8tdArihsz/DwcxGMlR/yAgd3C6MpY7pOOl0Lcf5FFu9O3CcfbY9/cgpCPgqmtAYoTqAY+GTP8j/YQB4b7GJ0qnxts7jo+EQOoeF21/NBFbgRKdyKeJCtM0gJ9hblv5ZdBJz42Ub9eeCq/C2IwVbl2osu9CHe3UM9jkr80T1vDMu0niU32gHgyik9DRj3dKfIE6Uaj8Im3p4LZ6J0LCz1mMC7cCAY4ThT7am+3xXaLyZ4rbhOapJOIldSuMyRqW6vAyqZp2whYFUopuyt36BDHYJtTq6Rdkq02Eyo/1FG7lCg4/y+Xg+D19tlX+M8waT7F2mA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UZeWbfzNh+8axdgIYgSyOpu/avcDiXCmNumetQGOfuE=;
 b=nqPVUzcJ5aqYYahKmfcMb3k3NJNjKc1oPvPfyO+OkcE9k7fkujsHf/tZ0zkl+CYzsdaTxriPlP2ajicqJiX+P8Fd5/evY2DruXgLxvNgGVZaOdIxG2Hz/ODxKCWPLRT4ZbQxTWc/CTgZ9sAJZZE2QDiFpbu/oqFzjFBrhZ59oAAJEAb6Ltr+hqk8ILZbeJtwliowF1OOPHoVtx2pQnWOR/isD8OKF/fLlhNM88vIGdjvmckSyplwnRYYQ5LJOG/eYXW3g/nDUiX9LAHG2jn07jdxQSIQEOczFqJAqohr/dHh1Rzi3PExW3Pvw7hVgNNLo5qCjE+36/Y4IYY/3cF9pQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
Received: from BYAPR12MB2727.namprd12.prod.outlook.com (20.176.253.214) by
 BYAPR12MB3094.namprd12.prod.outlook.com (20.178.54.147) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.25; Fri, 27 Sep 2019 00:13:57 +0000
Received: from BYAPR12MB2727.namprd12.prod.outlook.com
 ([fe80::19f9:64ec:5139:dfca]) by BYAPR12MB2727.namprd12.prod.outlook.com
 ([fe80::19f9:64ec:5139:dfca%3]) with mapi id 15.20.2284.023; Fri, 27 Sep 2019
 00:13:57 +0000
From:   Ajay Gupta <ajayg@nvidia.com>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: RE: [PATCH 00/14] usb: typec: UCSI driver overhaul
Thread-Topic: [PATCH 00/14] usb: typec: UCSI driver overhaul
Thread-Index: AQHVdFI7VovQttbK0kyVtx5zpzGGF6c+oOCw
Date:   Fri, 27 Sep 2019 00:13:57 +0000
Message-ID: <BYAPR12MB272724AF8ED1C4850FB04230DC810@BYAPR12MB2727.namprd12.prod.outlook.com>
References: <20190926100727.71117-1-heikki.krogerus@linux.intel.com>
In-Reply-To: <20190926100727.71117-1-heikki.krogerus@linux.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Enabled=True;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_SiteId=43083d15-7273-40c1-b7db-39efd9ccc17a;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Owner=ajayg@nvidia.com;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_SetDate=2019-09-27T00:13:55.8574859Z;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Name=Unrestricted;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Application=Microsoft Azure
 Information Protection;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_ActionId=4655ec0a-29eb-4c79-9f18-8070276ce7dd;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Extended_MSFT_Method=Automatic
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=ajayg@nvidia.com; 
x-originating-ip: [216.228.112.22]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 70ba5fc1-8858-4e9c-ef37-08d742df96eb
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);SRVR:BYAPR12MB3094;
x-ms-traffictypediagnostic: BYAPR12MB3094:
x-microsoft-antispam-prvs: <BYAPR12MB3094D0E729000F0E832795DDDC810@BYAPR12MB3094.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 0173C6D4D5
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(136003)(346002)(396003)(366004)(39860400002)(376002)(13464003)(189003)(199004)(66476007)(26005)(8936002)(66446008)(81156014)(486006)(6116002)(3846002)(9686003)(76116006)(6246003)(52536014)(6916009)(5660300002)(86362001)(64756008)(6436002)(14444005)(66556008)(53546011)(6506007)(256004)(446003)(33656002)(66066001)(71200400001)(66946007)(55016002)(11346002)(4326008)(102836004)(76176011)(14454004)(25786009)(71190400001)(186003)(99286004)(476003)(2906002)(305945005)(316002)(8676002)(7736002)(478600001)(74316002)(229853002)(81166006)(7696005);DIR:OUT;SFP:1101;SCL:1;SRVR:BYAPR12MB3094;H:BYAPR12MB2727.namprd12.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nvidia.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: /L20oETqgQy3dg0oR6NVgmjeG9mnQwXLS0PD3Ol9gNS5G0a4lHcxgzRBlMKadoFt4g1M6ffRQmqyMkYp+BDAGjJL9ffVaSalnSmfaLAp3Wf8WIR23r9ffPnI9AaZzWtdEGevJY5yp69t/aGgrQZNCfFbTxPtluLpo1qRol4KJi0BIH1zwq782kmENFMgC1SFUPar3nwlvKE2Iyqlfmd8xhnUJ8m9d4yvqq4VOifjqpLTQSkxu7gxmVlO+c/EwENtmCX6zBKG9mO76edwStVxtbsgqNUfSMeNSqD54j0yJ7NlirgctO+NSs7nG4b6UUhYwXZzp/aDCEHIV4fMJnCefj9CIH4O6iMy+CL1NzTOYkF1lzuL5WMTfCVd1EpAvvRFFOo8gz8UkbZ90u50Jc/p5hwz+p/h0NsGrWgGSRMSIEw=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 70ba5fc1-8858-4e9c-ef37-08d742df96eb
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Sep 2019 00:13:57.1690
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uNPbHpUSlT12X3EJrg6f6KKnuXf7CyjiI25SXn1vVS0zVojf5rBVy+jOeBVxre5uidDdzgbH7ALBKvfuI86nDQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3094
X-OriginatorOrg: Nvidia.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1569543243; bh=UZeWbfzNh+8axdgIYgSyOpu/avcDiXCmNumetQGOfuE=;
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
        b=ccAFgdB5OgsKcOKt1qy63z5JUnpm6yfI7S6LCJTRW7WN0Hj61w5FppZAW1SjCdvEr
         +MgHgRuJ3egkFoAWKdMED1A4L+UXS4vuCpKaXIqjWC/feq0J5xv+yQJC+G2AtDxlk/
         vAl17rvsbZ7qSG5JlkZFW34QD0NL1CS95o+5991DUDAwfNUtx2q+KyU2Lcv1AtCAe3
         cG/OiRjyJZah4cNhMOMEhmBVJGtINFhwJhOWFvebPNem2irlIqNHtGoj3piWA1ZCjG
         QQgX52zfEHslupIZ9FBK8yKjNsVw3oCRJwzXZ2iqfPQUAU+oR21qlv4renqJghNT8n
         7dawORHOIQWmw==
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Heikki,
> -----Original Message-----
> From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> Sent: Thursday, September 26, 2019 3:07 AM
> To: Ajay Gupta <ajayg@nvidia.com>
> Cc: linux-usb@vger.kernel.org
> Subject: [PATCH 00/14] usb: typec: UCSI driver overhaul
>=20
> Hi Ajay,
>=20
> Here's the pretty much complete rewrite of the I/O handling that I was
> talking about. The first seven patches are not actually related to
> this stuff, but I'm including them here because the rest of the series
> is made on top of them. I'm including also that fix patch I send you
> earlier.
>=20
> After this it should be easier to handle quirks. My idea how to handle
> the multi-instance connector alt modes is that we "emulate" the PPM in
> ucsi_ccg.c in order to handle them, so ucsi.c is not touched at all.
>=20
> We can now get the connector alternate modes that the actual
> controller supplies during probe - before registering the ucsi
> interface - and squash all alt modes with the same SVID into one that
> we supply to the ucsi.c when ever it sends GET_ALTERNATE_MODES
> command. Also other alt mode commands like SET_NEW_CAM can have
> special processing in ucsi_ccg.c and ucsi_ccg.c alone. There should
> not be any problem with that anymore.
I took the changes and loaded on my GPU system and do not see
altmode devices under /sys/bus/typec/devices/*. Its empty.

Below error is seen
"ucsi_ccg 4-0008: con1: failed to register alternate modes"

ucsi_run_command() is returning -16.

I will review the ccg changes and try to debug above issue.

Thanks
> nvpublic
>=20
> thanks,
>=20
> Heikki Krogerus (14):
>   usb: typec: Copy everything from struct typec_capability during
>     registration
>   usb: typec: Introduce typec_get_drvdata()
>   usb: typec: Separate the operations vector
>   usb: typec: tcpm: Start using struct typec_operations
>   usb: typec: tps6598x: Start using struct typec_operations
>   usb: typec: ucsi: Start using struct typec_operations
>   usb: typec: Remove the callback members from struct typec_capability
>   usb: typec: ucsi: ccg: Remove run_isr flag
>   usb: typec: ucsi: Simplified interface registration and I/O API
>   usb: typec: ucsi: acpi: Move to the new API
>   usb: typec: ucsi: ccg: Move to the new API
>   usb: typec: ucsi: Remove the old API
>   usb: typec: ucsi: Remove struct ucsi_control
>   usb: typec: ucsi: Remove all bit-fields
>=20
>  drivers/usb/typec/class.c            | 125 +++---
>  drivers/usb/typec/tcpm/tcpm.c        |  47 +--
>  drivers/usb/typec/tps6598x.c         |  49 +--
>  drivers/usb/typec/ucsi/displayport.c |  26 +-
>  drivers/usb/typec/ucsi/trace.c       |  11 -
>  drivers/usb/typec/ucsi/trace.h       |  79 +---
>  drivers/usb/typec/ucsi/ucsi.c        | 592 ++++++++++++++-------------
>  drivers/usb/typec/ucsi/ucsi.h        | 410 +++++++------------
>  drivers/usb/typec/ucsi/ucsi_acpi.c   |  96 ++++-
>  drivers/usb/typec/ucsi/ucsi_ccg.c    | 214 ++++------
>  include/linux/usb/typec.h            |  38 +-
>  11 files changed, 785 insertions(+), 902 deletions(-)
>=20
> --
> 2.23.0

