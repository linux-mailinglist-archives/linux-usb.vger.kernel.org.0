Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A7B6BC0998
	for <lists+linux-usb@lfdr.de>; Fri, 27 Sep 2019 18:30:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727334AbfI0QaU (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 27 Sep 2019 12:30:20 -0400
Received: from nat-hk.nvidia.com ([203.18.50.4]:64077 "EHLO nat-hk.nvidia.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727079AbfI0QaU (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 27 Sep 2019 12:30:20 -0400
Received: from hkpgpgate101.nvidia.com (Not Verified[10.18.92.100]) by nat-hk.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5d8e391a0000>; Sat, 28 Sep 2019 00:30:18 +0800
Received: from HKMAIL103.nvidia.com ([10.18.16.12])
  by hkpgpgate101.nvidia.com (PGP Universal service);
  Fri, 27 Sep 2019 09:30:15 -0700
X-PGP-Universal: processed;
        by hkpgpgate101.nvidia.com on Fri, 27 Sep 2019 09:30:15 -0700
Received: from HKMAIL104.nvidia.com (10.18.16.13) by HKMAIL103.nvidia.com
 (10.18.16.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 27 Sep
 2019 16:30:15 +0000
Received: from NAM03-DM3-obe.outbound.protection.outlook.com (104.47.41.59) by
 HKMAIL104.nvidia.com (10.18.16.13) with Microsoft SMTP Server (TLS) id
 15.0.1473.3 via Frontend Transport; Fri, 27 Sep 2019 16:30:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ve2K6oHApLn3hgwHGMN4EwNYW1vl3Qz9N6vVqwSiqc70c4nZ5UhKPJi5RU31fWQX3FqdQjJkSLof1FXHX7BbNMQR8yWOpelwSUp+cWlhMPOLDxMkhzl+P+O8MQ969Q3O651VljXpluqKjsYJGqkdRFUSMJhhCVDR5mJBX0SIvXRJi8VvawUz74Q0h6Op5KcdOO/JzhkX633odjoSx0Tkn2JE9GTLS/8W7IM1aF+Epbaz9sR94lkdxlIcpP13X01M73r9CPIy6XP+NMQ4pG0OGFCrmO7qEvSzoLPZZOcyZklx4cCJ1iVG0XrVQZ91op7l4vvIDd9YkGuhWswu5SD1Pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4wh9TKFg/rsAuMerHrDPVnU34ZOzTg0ICyTmgb1htq4=;
 b=bfYZbf8MvaohJwJjgYVLe4wUHVAA/CWokJzgXY+Ae6SrUwxZhRxVDq/fxOVtCqqfzzUPgsOxFXsXN6qleSE21LVfR50QAUFSpjQLxJ6svFNU827+oTl+W4BAJ49l0ib9y8awYv9rHx86cciXJMVtO3lE+iNVPZfl/V+YguETru0hInPD8eGad8guR8W+kyHgkZRSj5dUvK8NbVIVk2QT1TlAXGuinh9kbAU0LuTtHA4pRIB8aq42LKVKIAguwvw9hk5qdWBrwPiaVHexRXm36cnwUXDetHiW0ipomSvkttq7fL06DR8uxZHeAxEufDHErQw8Cgxqazhc3Xr8Yo5wjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
Received: from BYAPR12MB2727.namprd12.prod.outlook.com (20.176.253.214) by
 BYAPR12MB2775.namprd12.prod.outlook.com (20.176.255.84) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.18; Fri, 27 Sep 2019 16:30:12 +0000
Received: from BYAPR12MB2727.namprd12.prod.outlook.com
 ([fe80::19f9:64ec:5139:dfca]) by BYAPR12MB2727.namprd12.prod.outlook.com
 ([fe80::19f9:64ec:5139:dfca%3]) with mapi id 15.20.2284.023; Fri, 27 Sep 2019
 16:30:12 +0000
From:   Ajay Gupta <ajayg@nvidia.com>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: RE: [PATCH 00/14] usb: typec: UCSI driver overhaul
Thread-Topic: [PATCH 00/14] usb: typec: UCSI driver overhaul
Thread-Index: AQHVdFI7VovQttbK0kyVtx5zpzGGF6c+oOCwgADbeICAADxS0A==
Date:   Fri, 27 Sep 2019 16:30:12 +0000
Message-ID: <BYAPR12MB272706DB197F44C1FBAAAB08DC810@BYAPR12MB2727.namprd12.prod.outlook.com>
References: <20190926100727.71117-1-heikki.krogerus@linux.intel.com>
 <BYAPR12MB272724AF8ED1C4850FB04230DC810@BYAPR12MB2727.namprd12.prod.outlook.com>
 <20190927125301.GB23773@kuha.fi.intel.com>
In-Reply-To: <20190927125301.GB23773@kuha.fi.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Enabled=True;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_SiteId=43083d15-7273-40c1-b7db-39efd9ccc17a;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Owner=ajayg@nvidia.com;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_SetDate=2019-09-27T16:30:11.0165727Z;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Name=Unrestricted;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Application=Microsoft Azure
 Information Protection;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_ActionId=8566a306-275c-4569-9aac-2ba885234d07;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Extended_MSFT_Method=Automatic
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=ajayg@nvidia.com; 
x-originating-ip: [216.228.112.22]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7c754127-c6b2-48b2-88c3-08d74367f88a
x-ms-traffictypediagnostic: BYAPR12MB2775:
x-microsoft-antispam-prvs: <BYAPR12MB27751CAD05874EFF12F566E2DC810@BYAPR12MB2775.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 0173C6D4D5
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(39860400002)(346002)(376002)(136003)(396003)(366004)(199004)(189003)(13464003)(64756008)(66946007)(9686003)(5660300002)(52536014)(478600001)(14454004)(25786009)(76176011)(186003)(53546011)(3846002)(6116002)(81156014)(8676002)(81166006)(14444005)(256004)(66066001)(6916009)(8936002)(2906002)(76116006)(305945005)(4326008)(55016002)(71200400001)(86362001)(71190400001)(74316002)(33656002)(6436002)(229853002)(7696005)(476003)(99286004)(486006)(11346002)(316002)(7736002)(6506007)(26005)(102836004)(446003)(66556008)(66446008)(6246003)(66476007);DIR:OUT;SFP:1101;SCL:1;SRVR:BYAPR12MB2775;H:BYAPR12MB2727.namprd12.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nvidia.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +yksYZZh6XK40FBgs0wr+APcWRewh+v8hlVM6RvrvqvQ86LIM+Zd/acwYzYwJoIQbVx9MDxwp2mzqKZpCxKdn2HqifM144yFDf/Fv3FU8w4cupf5TkgG1blJMDpP1640vHJXicthkcWnVr2SWSl4uUsAIEtEE+Frk4XWo0/ilaCcyob84GE14faWMQt8xHryizxtc7Io+KXnU44cjCIWZbGe/ClFevyxwuAaMViXcpwH6rKGomKMLD/u55bzdD+DZ2nou5JiplNI2NKblL3hiu3Fp8evRd0LTGQWC2nzMY66HefAdjQXIhL1e8XjgXuTxqgoL/vJ0DdIJ9R0l3z1hNz/xNwbrwDpHECV3+N6m5ym8rQpgXtty64h7vO+UMR/np3KilbjcuuD54uTdASgoVeQVgd7XZvefYI/s3Ai5C0=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c754127-c6b2-48b2-88c3-08d74367f88a
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Sep 2019 16:30:12.4636
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WjTVzhD0VslKJp/9m+X5djQ5lkaMC1Ct1rMp7QU6vcQodtzJFHCSgouVRzS2ffOsP6p9WFlugTtS7Y5C7tg5DQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2775
X-OriginatorOrg: Nvidia.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1569601818; bh=4wh9TKFg/rsAuMerHrDPVnU34ZOzTg0ICyTmgb1htq4=;
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
        b=hQecQdIl/ri3K+nRMF30wydVjx86MSDxU+uEXCXUFhySN+lPv5Hhzp2oebj3BU8ED
         O9cuBueaicIDKKL4xdIlYm9WnX02mp2X1QiB9fVdKzUlqTnqH9R7lA6sdliXjUlgg/
         jaS2sDXGeSvMMUcgaMUyXOEnUsAAi7amgY48kWRbmDmIAeunt8eewhxjG6GHx1F6ed
         HOlwIcaqSSjl2UwiPWlYYHMMVmHcg40ofeDBTgAQ6WVEGngLu9fWWpep93l8fiok33
         PU5yDiWAe///o6EK+iwjNIgkyUTi2VNYIpBxD31xS5/aQQ40fAXbyqEIWum7fnN6gL
         1O3/c7AgYXdSg==
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Heikki,

> -----Original Message-----
> From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> Sent: Friday, September 27, 2019 5:53 AM
> To: Ajay Gupta <ajayg@nvidia.com>
> Cc: linux-usb@vger.kernel.org
> Subject: Re: [PATCH 00/14] usb: typec: UCSI driver overhaul
>=20
> On Fri, Sep 27, 2019 at 12:13:57AM +0000, Ajay Gupta wrote:
> > Hi Heikki,
> > > -----Original Message-----
> > > From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> > > Sent: Thursday, September 26, 2019 3:07 AM
> > > To: Ajay Gupta <ajayg@nvidia.com>
> > > Cc: linux-usb@vger.kernel.org
> > > Subject: [PATCH 00/14] usb: typec: UCSI driver overhaul
> > >
> > > Hi Ajay,
> > >
> > > Here's the pretty much complete rewrite of the I/O handling that I
> > > was talking about. The first seven patches are not actually related
> > > to this stuff, but I'm including them here because the rest of the
> > > series is made on top of them. I'm including also that fix patch I
> > > send you earlier.
> > >
> > > After this it should be easier to handle quirks. My idea how to
> > > handle the multi-instance connector alt modes is that we "emulate"
> > > the PPM in ucsi_ccg.c in order to handle them, so ucsi.c is not touch=
ed at
> all.
> > >
> > > We can now get the connector alternate modes that the actual
> > > controller supplies during probe - before registering the ucsi
> > > interface - and squash all alt modes with the same SVID into one
> > > that we supply to the ucsi.c when ever it sends GET_ALTERNATE_MODES
> > > command. Also other alt mode commands like SET_NEW_CAM can have
> > > special processing in ucsi_ccg.c and ucsi_ccg.c alone. There should
> > > not be any problem with that anymore.
> > I took the changes and loaded on my GPU system and do not see altmode
> > devices under /sys/bus/typec/devices/*. Its empty.
> >
> > Below error is seen
> > "ucsi_ccg 4-0008: con1: failed to register alternate modes"
> >
> > ucsi_run_command() is returning -16.
> >
> > I will review the ccg changes and try to debug above issue.
>=20
> I tested this series with the NVIDIA GPU PCI card that we have. The contr=
oller
> is reporting BUSY as responce to the GET_ALTERNATE_MODES command. I
> added a loop to ucsi_exec_command() where I read the CCI until the there =
is
> no UCSI_CCI_BUSY bit set, and it seems to work.
>=20
> Here are both changes:
>=20
> diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.=
c index
> accf54d987ad..d70ee8006c34 100644
> --- a/drivers/usb/typec/ucsi/ucsi.c
> +++ b/drivers/usb/typec/ucsi/ucsi.c
> @@ -102,6 +102,7 @@ static int ucsi_read_error(struct ucsi *ucsi)
>=20
>  static int ucsi_exec_command(struct ucsi *ucsi, u64 cmd)  {
> +       unsigned long timeout;
>         u32 cci;
>         int ret;
>=20
> @@ -109,12 +110,15 @@ static int ucsi_exec_command(struct ucsi *ucsi, u64
> cmd)
>         if (ret)
>                 return ret;
>=20
> -       ret =3D ucsi->ops->read(ucsi, UCSI_CCI, &cci, sizeof(cci));
> -       if (ret)
> -               return ret;
> +       timeout =3D jiffies + msecs_to_jiffies(UCSI_TIMEOUT_MS);
> +       do {
> +               if (time_is_before_jiffies(timeout))
> +                       return -ETIMEDOUT;
>=20
> -       if (cci & UCSI_CCI_BUSY)
> -               return -EBUSY;
> +               ret =3D ucsi->ops->read(ucsi, UCSI_CCI, &cci, sizeof(cci)=
);
> +               if (ret)
> +                       return ret;
> +       } while (cci & UCSI_CCI_BUSY);
>=20
>         if (!(cci & UCSI_CCI_COMMAND_COMPLETE))
>                 return -EIO;
> @@ -330,7 +334,7 @@ static int ucsi_register_altmodes(struct
> ucsi_connector *con, u8 recipient)
>                 command |=3D UCSI_GET_ALTMODE_RECIPIENT(recipient);
>                 command |=3D UCSI_GET_ALTMODE_CONNECTOR_NUMBER(con-
> >num);
>                 command |=3D UCSI_GET_ALTMODE_OFFSET(i);
> -               command |=3D UCSI_GET_ALTMODE_NUM_ALTMODES(1); /* One at =
a
> time */
> +
>                 len =3D ucsi_run_command(con->ucsi, command, alt, sizeof(=
alt));
>                 if (len <=3D 0)
>                         return len;
>=20
> Let me know if that works.
It works now for me too. I will review rest of changes anyways and also nee=
d
to update my change on altmode squashing.

Thanks
>nvpublic
>=20
> thanks,
>=20
> --
> heikki
