Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 89A74B57B5
	for <lists+linux-usb@lfdr.de>; Tue, 17 Sep 2019 23:41:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727175AbfIQVly (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 17 Sep 2019 17:41:54 -0400
Received: from hqemgate16.nvidia.com ([216.228.121.65]:3610 "EHLO
        hqemgate16.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727434AbfIQVly (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 17 Sep 2019 17:41:54 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5d8153240000>; Tue, 17 Sep 2019 14:41:56 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Tue, 17 Sep 2019 14:41:51 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Tue, 17 Sep 2019 14:41:51 -0700
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 17 Sep
 2019 21:41:51 +0000
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.36.53) by
 HQMAIL111.nvidia.com (172.20.187.18) with Microsoft SMTP Server (TLS) id
 15.0.1473.3 via Frontend Transport; Tue, 17 Sep 2019 21:41:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mkho0N9ZiSkxBUbOuQXtSbiXCZMmh3gvknbECs8QEMnL1biGJbOBcWgDUT93Ks0CzUnWrr8bZWDbkrz2cpKQk/P2wbND50/9bsH/MdDXVFWe7gubrKAW1SLfjHBCAIhG30WsFlmMkuCqPxSF0UAnwrfb2IiQ3Lui8WExi/nRf7AgzqVqzmJGNu+5jeEy8mjwontPjWPhNfAsHlaurM4WSpAbiF+CywHLjfQdqD4Aec8zZAIXYyRAZ+WOhY8chDHwH8o2xbX1kdmJ2m0HII4S84Bmm96mu64j8sNGAaDUyWH0E1OviBsKaZOXjuZdDGXWOeSmq63HvzrOokcZmrsG1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ytK7h7THdOGFQixp5xgeb+xpR7ukE7xEwU/ruAlUlQI=;
 b=ZtQph3waYGykzBgzqknM50dmBL6OwoCo2IkFj0J03dEplqA6B2Q13aWOvaaJ5OU6gITts6F8W48TS3dOqIEnCkWCLnHDk/rB2ep3R6heclNva1yIksgnu+esilc0LT+gyZLcTJJe/f6jjceWdkJn/6meVodwRPpNl8xLfk486BH8Tvqj2FqRtchMHAfP9QBVvmNPMgkXuwV4bXizKfXifSRsW/BC3HnxtBHiV3pbnYW5QBv9TAc7AB1ZCSTa5OX9YeSNJZs9G+3C15ySbSntmeKtx60gyC17u+gcs9TMhqIjUG/4WxaoZlzcdDhkR83TZCiNNZuqhNXX0iTdXacVUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
Received: from BYAPR12MB2727.namprd12.prod.outlook.com (20.176.253.214) by
 BYAPR12MB2774.namprd12.prod.outlook.com (20.176.253.203) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.18; Tue, 17 Sep 2019 21:41:50 +0000
Received: from BYAPR12MB2727.namprd12.prod.outlook.com
 ([fe80::19f9:64ec:5139:dfca]) by BYAPR12MB2727.namprd12.prod.outlook.com
 ([fe80::19f9:64ec:5139:dfca%3]) with mapi id 15.20.2263.023; Tue, 17 Sep 2019
 21:41:50 +0000
From:   Ajay Gupta <ajayg@nvidia.com>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Ajay Gupta <ajaykuee@gmail.com>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: RE: [PATCH v5] usb: typec: ucsi: add support for separate DP altmode
 devices
Thread-Topic: [PATCH v5] usb: typec: ucsi: add support for separate DP altmode
 devices
Thread-Index: AQHVZNQ8AsCQcyBZj0i8dVukHObth6cpw8yAgAaw/tA=
Date:   Tue, 17 Sep 2019 21:41:49 +0000
Message-ID: <BYAPR12MB27272A58997E4D9BC030C9C3DC8F0@BYAPR12MB2727.namprd12.prod.outlook.com>
References: <20190906165516.24006-1-ajayg@nvidia.com>
 <20190913152009.GA26700@kuha.fi.intel.com>
In-Reply-To: <20190913152009.GA26700@kuha.fi.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Enabled=True;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_SiteId=43083d15-7273-40c1-b7db-39efd9ccc17a;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Owner=ajayg@nvidia.com;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_SetDate=2019-09-17T21:41:48.6556714Z;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Name=Unrestricted;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Application=Microsoft Azure
 Information Protection;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_ActionId=b102ecc4-d3da-4498-925f-28ce88fed74e;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Extended_MSFT_Method=Automatic
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=ajayg@nvidia.com; 
x-originating-ip: [216.228.112.22]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5ce7e852-dc80-459c-3a9e-08d73bb7d908
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600167)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:BYAPR12MB2774;
x-ms-traffictypediagnostic: BYAPR12MB2774:
x-microsoft-antispam-prvs: <BYAPR12MB27746A64AE166C56B235FF03DC8F0@BYAPR12MB2774.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4941;
x-forefront-prvs: 01630974C0
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(346002)(396003)(136003)(366004)(376002)(39860400002)(13464003)(199004)(189003)(64756008)(486006)(4326008)(66446008)(52536014)(86362001)(8936002)(229853002)(66556008)(33656002)(476003)(66066001)(316002)(66476007)(25786009)(110136005)(478600001)(8676002)(14454004)(6116002)(3846002)(81166006)(81156014)(76176011)(305945005)(7736002)(6436002)(6506007)(55016002)(6246003)(53546011)(9686003)(74316002)(66946007)(2906002)(76116006)(256004)(7696005)(26005)(71190400001)(99286004)(446003)(5660300002)(102836004)(71200400001)(11346002)(14444005)(186003);DIR:OUT;SFP:1101;SCL:1;SRVR:BYAPR12MB2774;H:BYAPR12MB2727.namprd12.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nvidia.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: DRsxa3mH4gWCj6Uqeq70tK8T3V9bDIE1rONUPlRXTYnhCVui/fJSlSzmLUDiEFvUvrMIza/2K/8huEPNCgQ5WHjpRj0ncvzyRA5GIEOv9DzI7AUp4K1dQG2re1QNypQc6AyTZ0fSLW+vc7eqAyYnpl3FD0LEBiNCpoNwZhOpIvwBKJ+5Ktp7irGQP2jBT2/T46MCjhHRcu0YmzbP7cAlUP/dKWYXllfyCjGjhIEC7aklXZSC3zyWkm1LhVf/oL2utjdZyNEfWEW25uN9kYQ9jPu+vf7acQq4z9gt35jEVZWvQZxZntfkckC8gYcz84/jjk7p+FtfUrAWqWFmvGDDWOBKsV15kQ99MUj0+SSXCLdK2dE5e/XZch3VvNe06c6UhvJpnONyMKptJ3mKUurRmQUR/SvzfRfQSKhFiDC2XYc=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ce7e852-dc80-459c-3a9e-08d73bb7d908
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Sep 2019 21:41:50.0284
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ho16RfR76qB98h0wne+AYAdVAGsEsHQvsAsSGQqtUFr830GMyB34xPZ+nMKYan/9fnJfc2AcdGtT++mvwHc+sw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2774
X-OriginatorOrg: Nvidia.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1568756516; bh=ytK7h7THdOGFQixp5xgeb+xpR7ukE7xEwU/ruAlUlQI=;
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
        b=C8Knv1b5afHo1nlriWhuATd1fX2VkdyK9r5UztXAQttzJtYxWwFF3V7LoZVSxh7tp
         j+QFN+zbt9i54hEuvuiebreGCrp49MToy4Psi0MPBIEjCqUpvwvxph7W7L3fRB2sDr
         P1U9uVqaRnTzdR19HM7HarjZGfCd06fFnU2yMR9HL3oPq//ympQpoZF/6en1mnAEYI
         7bYhNTm35t19ac+d5nI3IidoPVRdXC+Xovh3vumUubu8LAfNGG3qlMFkOJ+GFUcjiR
         1W19Mb/V/M6idDs+1PJljYcgJi3eO6qb4uPOhI1UnNUfDtQcM6w5mfp22upTVa4OeI
         ChF3jnZc3otog==
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Heikki,

> -----Original Message-----
> From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> Sent: Friday, September 13, 2019 8:20 AM
> To: Ajay Gupta <ajaykuee@gmail.com>
> Cc: linux-usb@vger.kernel.org; Ajay Gupta <ajayg@nvidia.com>
> Subject: Re: [PATCH v5] usb: typec: ucsi: add support for separate DP alt=
mode
> devices
>=20
> Hi Ajay,
>=20
> On Fri, Sep 06, 2019 at 09:55:16AM -0700, Ajay Gupta wrote:
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
>=20
> I'm going to go over this one more time during the merge window. I have a=
n
> idea how to improve this. Please bear with me. I have to make sure all op=
tions
> were considered.
>=20
> I'm really sorry to block this for so long, but I'm just really really af=
raid of
> mixing special case solutions like this into otherwise generic code.

I can update the patch to make sure generic code flow remains as-is and spe=
cial
case is executed only for UCSI controllers which needs squashing of duplica=
te
DP altmodes.
We can use the new function pointer update_altmode() added in "struct ucsi_=
ppm" in v5
of my patch for this purpose.

if (recipient =3D=3D UCSI_RECIPIENT_CON && ucsi->ppm && ucsi->ppm->update_a=
ltmodes)
	Get all the altmodes first, pass it to update_altmodes() for squashing if =
needed,
	and then register each altmodes.
else
	Use the current method where we get and register one altmode at a time.

Please let me know if this looks fine to you.

Thanks
> nvpublic
> They always
> make it difficult to modify the code later, and unfortunately we have the=
m all
> over the kernel. Look at the serial driver 8250_core/port/*.cas an exampl=
e.
> Ideally we should be able to "modularize" the whole alternate mode handli=
ng
> in the ucsi driver since there are now two different ways the PPMs can ha=
ndle
> them instead of simply mixing the support for the new method straight int=
o
> the existing structures.
>=20
> thanks,
>=20
> --
> heikki
