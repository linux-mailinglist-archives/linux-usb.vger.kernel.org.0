Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0AEE2BD052
	for <lists+linux-usb@lfdr.de>; Tue, 24 Sep 2019 19:10:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405501AbfIXRKK (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 24 Sep 2019 13:10:10 -0400
Received: from hqemgate15.nvidia.com ([216.228.121.64]:9628 "EHLO
        hqemgate15.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2393715AbfIXRKJ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 24 Sep 2019 13:10:09 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqemgate15.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5d8a4df70001>; Tue, 24 Sep 2019 10:10:15 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Tue, 24 Sep 2019 10:10:08 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Tue, 24 Sep 2019 10:10:08 -0700
Received: from HQMAIL110.nvidia.com (172.18.146.15) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 24 Sep
 2019 17:10:08 +0000
Received: from HQMAIL107.nvidia.com (172.20.187.13) by hqmail110.nvidia.com
 (172.18.146.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 24 Sep
 2019 17:10:08 +0000
Received: from NAM05-DM3-obe.outbound.protection.outlook.com (104.47.49.55) by
 HQMAIL107.nvidia.com (172.20.187.13) with Microsoft SMTP Server (TLS) id
 15.0.1473.3 via Frontend Transport; Tue, 24 Sep 2019 17:10:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R5bsR6TWd6bImvoPjIbvpKEWxWpPoTb2k36mNMvTqKCUUWKwzgu15uoDTQ38Ew0PhkkQ4E+SE91SA/EKMHCJivPV5CMJL/CJA1AbV0T29508497+KSlyjBr/trA06kaqcKDPUw/DorwASwVC6IvK3OuExA2fXRLFd+a7t4kU5pP/r2n92Aif8jCJo465MI1+DrXNmml2ot6K+h2Ty8z02pbaT7IeaX3Ib6WG11Iv//KUtuhnJKNU4tPwa4o+LBCQFw/6kK1UaF2QD1kNuD9z1mX4ejtrdT+cXfrIJJTRnzm+1MATEMYBLHgsP+G8nWotbKdnKGD7IxYJOdZC2QIuBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c5WUp7PVyXx78m8v6noHozZU6nZS0r6JI92v7Gu01Ng=;
 b=UiDrRXyVAri9YceoBGvnT6ohJ19rfdVjGUlfShE9GO2OH/VbmytZXbJKjFemTjitbUpr9QPJv36ukblMXqAzJbb0Qkv0TOBEIoVrdrkleOR5ByWlA9icV2ye5SyB8LMG2fd0pJs4MuPeghhMa5ZYZMj6V+dukzis1F3CLpzr7It7fJYfW20owQNFB903y1e+TFAVz9B2fA4DVHBIWlGzPQRSxu1DvXb+knL6XUSMRdLj1z0hZW6daygWxLqLalF1upGzguWvBORuAAhi5oU8w0+N0nV8XCtwyaAumYoZ8gnq6zR1ysFd32Rzad+5fEmt0BZztVahU9M19i2wNNdzsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
Received: from BYAPR12MB2727.namprd12.prod.outlook.com (20.176.253.214) by
 BYAPR12MB3351.namprd12.prod.outlook.com (20.178.55.152) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.19; Tue, 24 Sep 2019 17:10:06 +0000
Received: from BYAPR12MB2727.namprd12.prod.outlook.com
 ([fe80::19f9:64ec:5139:dfca]) by BYAPR12MB2727.namprd12.prod.outlook.com
 ([fe80::19f9:64ec:5139:dfca%3]) with mapi id 15.20.2284.023; Tue, 24 Sep 2019
 17:10:06 +0000
From:   Ajay Gupta <ajayg@nvidia.com>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: RE: [RFC PATCH] usb: typec: ucsi: ccg: Remove run_isr flag
Thread-Topic: [RFC PATCH] usb: typec: ucsi: ccg: Remove run_isr flag
Thread-Index: AQHVchMpp6KrvihpkE21mkAsxfA8y6c5jGtwgADyegCAAJIU8A==
Date:   Tue, 24 Sep 2019 17:10:06 +0000
Message-ID: <BYAPR12MB2727C3AFA7795B42D4ED01FDDC840@BYAPR12MB2727.namprd12.prod.outlook.com>
References: <20190923133101.30774-1-heikki.krogerus@linux.intel.com>
 <BYAPR12MB27276DD002AB589162CC7709DC850@BYAPR12MB2727.namprd12.prod.outlook.com>
 <20190924082446.GE16243@kuha.fi.intel.com>
In-Reply-To: <20190924082446.GE16243@kuha.fi.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Enabled=True;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_SiteId=43083d15-7273-40c1-b7db-39efd9ccc17a;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Owner=ajayg@nvidia.com;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_SetDate=2019-09-24T17:10:04.9560980Z;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Name=Unrestricted;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Application=Microsoft Azure
 Information Protection;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_ActionId=c1a54e4b-1f54-4442-a6a0-cae58240b51b;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Extended_MSFT_Method=Automatic
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=ajayg@nvidia.com; 
x-originating-ip: [216.228.112.22]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e2169fdb-7451-46fd-b4b1-08d741120c38
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);SRVR:BYAPR12MB3351;
x-ms-traffictypediagnostic: BYAPR12MB3351:
x-microsoft-antispam-prvs: <BYAPR12MB3351E7D4A261790AB30E3E08DC840@BYAPR12MB3351.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0170DAF08C
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(39860400002)(346002)(376002)(396003)(136003)(366004)(13464003)(51914003)(189003)(199004)(11346002)(66946007)(52536014)(81156014)(316002)(4326008)(6506007)(8676002)(55016002)(66446008)(9686003)(66476007)(5024004)(99286004)(53546011)(86362001)(6436002)(81166006)(76116006)(486006)(66556008)(476003)(71190400001)(2906002)(446003)(64756008)(71200400001)(478600001)(33656002)(305945005)(8936002)(186003)(3846002)(74316002)(14454004)(25786009)(14444005)(7736002)(26005)(229853002)(66066001)(5660300002)(7696005)(76176011)(6246003)(6916009)(256004)(102836004)(6116002);DIR:OUT;SFP:1101;SCL:1;SRVR:BYAPR12MB3351;H:BYAPR12MB2727.namprd12.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nvidia.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: e0pNtFJKdgWXxCzpCq48VBWELi1Hp+MK7jekGzDc+SSdyHdB3Fo8Av3vSIPLMq7OAa4s7PHjpFkU0TI8FBnIbJAOD0xi64otjLieB9Xp0ZUyBDFxA9wUISBcz6th5GadTr6AvlN7hipcsYlKfFByshemFi7IgbySGqOr2bCwDRhI2jlhhrLLgmKV0OGaq0/aqwxEoW8pgt8iBXICr8zxH4TPfOEUheb+mTP49X3fdjzaFjmSNho6elc7+Z4+my9SK5RzzAn/JK2PFEIAmo93VoShWYdrpg4i3he+wGUVGCOyUReXKHpSNRR/jOmETYq7K7EC/ATaFwG8kBQE+Z4vlmpCJiMxWfIbv7PzmKyBREtWNSN0nT/imwpFd+WvFfkb3fhwpLmDyvCf7iJD9oUeKztI+90LAS5DGqwvrXC9sUM=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: e2169fdb-7451-46fd-b4b1-08d741120c38
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Sep 2019 17:10:06.5394
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rwF4jl+TN4gd1KvUcQXEfXj6aS8klMab8/jsXMurJeQahiSqHHWJSl7b+iHmhS3cCfdWS9nKYktHN7k/gq+NpA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3351
X-OriginatorOrg: Nvidia.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1569345015; bh=c5WUp7PVyXx78m8v6noHozZU6nZS0r6JI92v7Gu01Ng=;
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
        b=Atq74X1/IPJxyPjOcYpU26lszCQZ3qJ/3fxF+xFc3IX+hjT6ZcAlKK6GctlQ8WF5Q
         yVMGMs8ntZtkgakbTgs7GK3oZ7bskMSr2u2BEPILfGvXFYxNu9PSdXa+Wz3zbpSpdE
         cUVWiISST1o5F0K47diA/liUbyl4orK3HUGY8f2tQrt/WPVvSf9EyEpOZkhZldlVrc
         +OTZPQKOXT5nW8qED/z25/fZnolHiAx1OIoKBbsQ5Ua0iNZ8U6o19WsliZmu+QlzJ7
         8t8ExFIOduJKryJwXJuTYOKfuqSQ3o2EnLozEVgG7GjMWuBibCxDoji8FCNjHuv/fL
         7bye3C1vvY5ZQ==
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Heikki,

> -----Original Message-----
> From: linux-usb-owner@vger.kernel.org <linux-usb-owner@vger.kernel.org>
> On Behalf Of Heikki Krogerus
> Sent: Tuesday, September 24, 2019 1:25 AM
> To: Ajay Gupta <ajayg@nvidia.com>
> Cc: linux-usb@vger.kernel.org
> Subject: Re: [RFC PATCH] usb: typec: ucsi: ccg: Remove run_isr flag
>=20
> Hi Ajay,
>=20
> On Mon, Sep 23, 2019 at 06:15:59PM +0000, Ajay Gupta wrote:
> > Hi Heikki,
> >
> > > -----Original Message-----
> > > From: linux-usb-owner@vger.kernel.org
> > > <linux-usb-owner@vger.kernel.org> On Behalf Of Heikki Krogerus
> > > Sent: Monday, September 23, 2019 6:31 AM
> > > To: Ajay Gupta <ajayg@nvidia.com>
> > > Cc: linux-usb@vger.kernel.org
> > > Subject: [RFC PATCH] usb: typec: ucsi: ccg: Remove run_isr flag
> > >
> > > There is no need to try to prevent the extra ucsi_notify() that
> > > runtime resuming the device will cause.
> > >
> > > This fixes potential deadlock. Both ccg_read() and
> > > ccg_write() are called with the mutex already taken at least from
> > > ccg_send_command(). In ccg_read() and ccg_write, the mutex is only
> > > acquired so that run_isr flag can be set.
> > >
> > > Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> > > ---
> > > Hi Ajay,
> > >
> > > Before going forward with this I would like to get confirmation from
> > > you that it is OK, and that I'm not missing anything.
> > Thanks for this. I mixed up firmware flashing and IO path by using same=
 lock.
> >
> > >I did not see any real purpose for that run_isr flag.
> > > The only thing that I can see it preventing is an extra
> > >ucsi_notify()  call caused by the waking of the controller, but that s=
hould
> not be a problem.
> > > Is there any other reason why the flag is there?
> > ucsi_ccg_runtime_resume() will get called after
> > pm_runtime_get_sync(uc->dev); in ccg_read() and ccg_write(). If we
> > allow extra ucsi_notify() then ccg_read() and
> > ccg_write() will get called again from ucsi_notfiy() through
> > ucsi_sync(). This will keep on happening in a loop and the controller
> > will remain in D0 always and runtime pm will never be done.
>=20
> OK, so the problem is actually that we are allowing the controller to sus=
pend
> while we are still in the middle of waiting for completion to a command, =
right?
> That should not be allowed to happen.
True.
=20
> Instead of hiding the symptom from the problem with that flag, the driver
> needs to initially define autosuspend delay that is as long as
> UCSI_TIMEOUT_MS (or longer). That should be enough to fix the problem,
> though it still leaves a small change of hitting it in some corner cases.=
 After I'm
> done with the I/O rewrite, we can guarantee that the controller stays in =
D0 for
> as long as it takes to process the whole command.
>=20
> But as the initial fix, let's just use the autosuspend delay.
>=20
> Can you test the attached patch?
Thanks for the patch. I tested both runtime PM and firmware flashing
on GPUs with old firmware and latest firmware and it works fine.

Thanks
>nvpublic
>=20
> thanks,
>=20
> --
> heikki
