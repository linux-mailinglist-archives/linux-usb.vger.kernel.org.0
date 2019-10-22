Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B1368E085C
	for <lists+linux-usb@lfdr.de>; Tue, 22 Oct 2019 18:11:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389223AbfJVQLY (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 22 Oct 2019 12:11:24 -0400
Received: from nat-hk.nvidia.com ([203.18.50.4]:12265 "EHLO nat-hk.nvidia.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727152AbfJVQLY (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 22 Oct 2019 12:11:24 -0400
Received: from hkpgpgate101.nvidia.com (Not Verified[10.18.92.100]) by nat-hk.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5daf2a280000>; Wed, 23 Oct 2019 00:11:20 +0800
Received: from HKMAIL103.nvidia.com ([10.18.16.12])
  by hkpgpgate101.nvidia.com (PGP Universal service);
  Tue, 22 Oct 2019 09:11:20 -0700
X-PGP-Universal: processed;
        by hkpgpgate101.nvidia.com on Tue, 22 Oct 2019 09:11:20 -0700
Received: from HKMAIL104.nvidia.com (10.18.16.13) by HKMAIL103.nvidia.com
 (10.18.16.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 22 Oct
 2019 16:11:19 +0000
Received: from NAM04-BN3-obe.outbound.protection.outlook.com (104.47.46.53) by
 HKMAIL104.nvidia.com (10.18.16.13) with Microsoft SMTP Server (TLS) id
 15.0.1473.3 via Frontend Transport; Tue, 22 Oct 2019 16:11:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kPha24NYHMkAW4LvPHTOUO08sjkQ+70j7iYYHtKNq2vHrUSEA7OQbe+E1iHSdVl6LtTp8s5iCtOqoUoZG/PN7N+bajhO6aWt6np+0pfEMs2DJ4zUjtIZTI2K+innp8SrN+ZX6pB+FPzMHfBt3nrW3rGP8xN6RNUcQT5eWvsi7xTKVUoa8mtup24d7/9nuWNp3vndm8gr4CVDjg9FecFnQddpHk2M61wMTOwJy0Yz7FS62YnMmxGn7mCY+kWW5LxF0R+7ZMqqtkh05MNO9kejoJt2rcleQ41ix/YahAwWDOBWebSZIK0Tmq2/HRsS/iLkL50T5uJ6gNBwWUpAZW2rfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=18odCt4VMbWG9WnCVZKZLihXN+xyrGTcL1O+pwvFROw=;
 b=FY6a5m4Pd6HB43+nAfgGzrww6AGQxu54qCDY7BErdtB6w+qZDASvpKeLdp2ngyvQslsk4aqD+vpRZ+MAubTwXQSH6R70Frjh+ylaU8ztfrILzfnu/wwwHJpxsVfWHzquC+7BUEj52Xqyzvd6AiFnLIrdq2oZjGbWM4bmdS+IfDE4MIS6UqOVa9QWWO4MPajzMoLt8PTmeqR9aj3OqZ8iVgOLF2jJKxANKiL3qrzMjtCxfZ2aX58QkdZdF+tmPNR150UWtRggcLXLWn2VV++LVpqH3XhZoQHi6mggHziZDFSqjdjBeOghMMwyH8iOJ7z3MvBmB0TxFl5vXGqfT8MqVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
Received: from BYAPR12MB2727.namprd12.prod.outlook.com (20.176.253.214) by
 BYAPR12MB3093.namprd12.prod.outlook.com (20.178.54.146) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2367.20; Tue, 22 Oct 2019 16:11:16 +0000
Received: from BYAPR12MB2727.namprd12.prod.outlook.com
 ([fe80::68ad:82d2:4830:abab]) by BYAPR12MB2727.namprd12.prod.outlook.com
 ([fe80::68ad:82d2:4830:abab%5]) with mapi id 15.20.2367.022; Tue, 22 Oct 2019
 16:11:16 +0000
From:   Ajay Gupta <ajayg@nvidia.com>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>
CC:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Guenter Roeck <linux@roeck-us.net>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH 14/18] usb: typec: ucsi: Remove the old API
Thread-Topic: [PATCH 14/18] usb: typec: ucsi: Remove the old API
Thread-Index: AQHViAJhjGCrhedNt0O8BftQxWjPMqdles5ggADDFoCAAHOaAA==
Date:   Tue, 22 Oct 2019 16:11:16 +0000
Message-ID: <BYAPR12MB2727C3684AD6EE51B799E5F7DC680@BYAPR12MB2727.namprd12.prod.outlook.com>
References: <20191021112524.79550-1-heikki.krogerus@linux.intel.com>
 <20191021112524.79550-15-heikki.krogerus@linux.intel.com>
 <BYAPR12MB272730A5205C8F97AE3C37D2DC690@BYAPR12MB2727.namprd12.prod.outlook.com>
 <20191022070433.GC28049@kuha.fi.intel.com>
In-Reply-To: <20191022070433.GC28049@kuha.fi.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Enabled=True;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_SiteId=43083d15-7273-40c1-b7db-39efd9ccc17a;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Owner=ajayg@nvidia.com;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_SetDate=2019-10-22T16:11:14.7374732Z;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Name=Unrestricted;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Application=Microsoft Azure
 Information Protection;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_ActionId=79f2406e-b55c-4db9-81dc-b8271d261eef;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Extended_MSFT_Method=Automatic
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=ajayg@nvidia.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [216.228.112.22]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ac62c152-5710-4243-5d73-08d7570a77a6
x-ms-traffictypediagnostic: BYAPR12MB3093:
x-microsoft-antispam-prvs: <BYAPR12MB309363392FC2B75513A5BDC2DC680@BYAPR12MB3093.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4941;
x-forefront-prvs: 01986AE76B
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(396003)(346002)(376002)(136003)(366004)(39860400002)(199004)(189003)(13464003)(64756008)(476003)(8936002)(86362001)(486006)(55016002)(446003)(6436002)(6246003)(102836004)(66446008)(66556008)(14454004)(186003)(229853002)(54906003)(76176011)(66476007)(66946007)(3846002)(99286004)(52536014)(9686003)(6116002)(8676002)(316002)(66066001)(76116006)(305945005)(478600001)(74316002)(2906002)(81156014)(11346002)(7736002)(33656002)(6506007)(71200400001)(256004)(5660300002)(71190400001)(7696005)(14444005)(53546011)(26005)(4326008)(25786009)(81166006)(6916009);DIR:OUT;SFP:1101;SCL:1;SRVR:BYAPR12MB3093;H:BYAPR12MB2727.namprd12.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nvidia.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: vGOT+D4VaxN1WYL1L3EslIuBclyAdSWaB5Mk+0MWJ7JTFuAxff97+Df4kCTohiijMHRlk0T6M6891MMJd9UFGB8qT7tUiZrklzZrdLeT9DjOokNF+nQWuKc1C93jyajNM8qij5EEiFQYYrbtyzVe/337ysCUhW8+9qDrh0dfY34zn8UTPPeBe70HbBK03trVQVHPos5SLgUcFYBW6rWaDFcq3hT167YSGq6YRc6iijR0VSbbLOsV8PTJeWQcVi5/9PAgS2C3buIJJB8rVTiMeBZsX2Lf40kkV/+PqfbjYpPKGz5ARAXgK6zkxJFxAOzEUoyQ/BTJW/ywleToMilip9opBL7xgM9A9e2kiOspdFV6VyRBJ2FADmKFOZxU2uipX9ugsThiLTtolLUeWXMeS2smqfmLzXtm4grE1QkSKV1ZPlsAOlGhn3TICREN4qEp
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: ac62c152-5710-4243-5d73-08d7570a77a6
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Oct 2019 16:11:16.3386
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7Z7xlaHn+tbUA0o+1eD7q+ojNWzscfHq6IRIDVaHjuFsrZxfpVjHuRDjzhmZI4Si/v/RWryTkf0i1AJy9ntKPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3093
X-OriginatorOrg: Nvidia.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <E7003CF6D2651040ABE3CA2A98E8E7AE@NVIDIA.onmicrosoft.com>
Content-Transfer-Encoding: quoted-printable
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1571760680; bh=18odCt4VMbWG9WnCVZKZLihXN+xyrGTcL1O+pwvFROw=;
        h=X-PGP-Universal:ARC-Seal:ARC-Message-Signature:
         ARC-Authentication-Results:From:To:CC:Subject:Thread-Topic:
         Thread-Index:Date:Message-ID:References:In-Reply-To:
         Accept-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:msip_labels:
         authentication-results:x-ms-exchange-messagesentrepresentingtype:
         x-originating-ip:x-ms-publictraffictype:
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
         Content-Language:Content-Type:Content-ID:
         Content-Transfer-Encoding;
        b=KE2bND1IxwX4iSivO2cRoAvGq0mV9iMq80KXfrFIx3tZXG4hI40tQXq3okpNWbo9v
         rd4gPD8zuNjQgpQyaxkkRnUq0YuVUlFfJvZyRufccf1Xcx705xrctoX01B38KSnq6N
         DiBsY7Phu0+X0BH1HwMfX08D1Nod7pp2osMkDlmaQXsd3WbFuJr1VNB7s6TTwC0yHp
         6NdCY33BQumMLrOjT6vAjzoTG1tX8uhfVeLcqQqhZiDFfWQ1ID1NMuzfgLrxltSaTe
         /JLWzbMuU9UlofIo+l/XqLXvjsu1YjVXhc55rh+af40F2VYOpchX8vBmNq/rqC0jAi
         KUTgxeYq8RR7w==
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Heikki,

> On Oct 22, 2019, at 12:04 AM, Heikki Krogerus <heikki.krogerus@linux.inte=
l.com> wrote:
>=20
> Hi Ajay,
>=20
>> On Mon, Oct 21, 2019 at 07:28:36PM +0000, Ajay Gupta wrote:
>> Hi Heikki,
>>=20
>>> -----Original Message-----
>>> From: linux-usb-owner@vger.kernel.org <linux-usb-owner@vger.kernel.org>
>>> On Behalf Of Heikki Krogerus
>>> Sent: Monday, October 21, 2019 4:25 AM
>>> To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>>> Cc: Guenter Roeck <linux@roeck-us.net>; Ajay Gupta <ajayg@nvidia.com>;
>>> linux-usb@vger.kernel.org
>>> Subject: [PATCH 14/18] usb: typec: ucsi: Remove the old API
>>>=20
>>> The drivers now only use the new API, so removing the old one.
>>>=20
>>> Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
>>> ---
>>> drivers/usb/typec/ucsi/displayport.c |  24 +-
>>> drivers/usb/typec/ucsi/trace.h       |  17 --
>>> drivers/usb/typec/ucsi/ucsi.c        | 345 +++------------------------
>>> drivers/usb/typec/ucsi/ucsi.h        |  41 ----
>>> 4 files changed, 43 insertions(+), 384 deletions(-)
>>>=20
>>> diff --git a/drivers/usb/typec/ucsi/displayport.c
>>> b/drivers/usb/typec/ucsi/displayport.c
>>> index d99700cb4dca..47424935bc81 100644
>>> --- a/drivers/usb/typec/ucsi/displayport.c
>>> +++ b/drivers/usb/typec/ucsi/displayport.c
>>> @@ -48,6 +48,7 @@ struct ucsi_dp {
>>> static int ucsi_displayport_enter(struct typec_altmode *alt)  {
>>>    struct ucsi_dp *dp =3D typec_altmode_get_drvdata(alt);
>>> +    struct ucsi *ucsi =3D dp->con->ucsi;
>>>    struct ucsi_control ctrl;
>>>    u8 cur =3D 0;
>>>    int ret;
>> Need to initialize "ret" otherwise we will return uninitialized value if=
 first
>> "if" condition in this function is true.
>=20
> "ret" does get a value in the first "if" condition. See below.
Sorry, That's my mistake.=20
The patch didn't cleanly apply and then that line got dropped in my branch.

Thanks
> nvpublic
>=20
>>> @@ -59,25 +60,21 @@ static int ucsi_displayport_enter(struct typec_altm=
ode
>>> *alt)
>>>=20
>>>        dev_warn(&p->dev,
>>>             "firmware doesn't support alternate mode
>>> overriding\n");
>>> -        mutex_unlock(&dp->con->lock);
>>> -        return -EOPNOTSUPP;
>>> +        ret =3D -EOPNOTSUPP;
>                ^^^^^^^^^^^^^^^^^^
> Note.
>=20
>>> +        goto err_unlock;
>>>    }
>=20
> thanks,
>=20
> --=20
> heikki
