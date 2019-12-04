Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DDB671121AA
	for <lists+linux-usb@lfdr.de>; Wed,  4 Dec 2019 03:59:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726678AbfLDC7E (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 3 Dec 2019 21:59:04 -0500
Received: from nat-hk.nvidia.com ([203.18.50.4]:26540 "EHLO nat-hk.nvidia.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726482AbfLDC7D (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 3 Dec 2019 21:59:03 -0500
Received: from hkpgpgate101.nvidia.com (Not Verified[10.18.92.9]) by nat-hk.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5de720c90001>; Wed, 04 Dec 2019 10:58:17 +0800
Received: from HKMAIL104.nvidia.com ([10.18.16.13])
  by hkpgpgate101.nvidia.com (PGP Universal service);
  Tue, 03 Dec 2019 18:58:17 -0800
X-PGP-Universal: processed;
        by hkpgpgate101.nvidia.com on Tue, 03 Dec 2019 18:58:17 -0800
Received: from HKMAIL101.nvidia.com (10.18.16.10) by HKMAIL104.nvidia.com
 (10.18.16.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 4 Dec
 2019 02:58:17 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.108)
 by HKMAIL101.nvidia.com (10.18.16.10) with Microsoft SMTP Server (TLS) id
 15.0.1473.3 via Frontend Transport; Wed, 4 Dec 2019 02:58:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EWhFzkyLesj2PoljU8foImBctSGxjCtrKvlY/Sa/4TXLMReBaNB7cO4Fl1dkFskVZiJ7fEl98cYmsW+4xBa6Rg3y1N0rA5FRveXP7wEl//HnXMNe+E+bwRYnmqEKRfA3fn2PNdJG+Abf61fdLzzCtp4ErLhZLCbTQHR9edb6nDLrdm2QH51CXgwMq8Dh12rOY8dLxFE/93HFhjB49JlhtcQBVn07s5iEymfjaXol4s9xiF4Rh83tDd5nIRY+5gUGrVWsrwHArgB3Gt3acVshdxAe9JyopKS16Io3jQp6rAhS6mAw0XN6wi/n1uJftDRcdfhBFhFnfiBLe5mptJ5E/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8KiibEQs40ijFWS7XPsDZQPhf7FJWZULNpBa6pz3swY=;
 b=nyx+N8fm4tcSCNRy4qokWmR8qSBYD3PkmQvrHWlo9Bguw3K4WFeOZq+WDA7Ndyfw9+kgZWWyAWw4rfhiLKb5dqnKkesMHSDc8MXxZVQpGgI2FDr7aL0f0mdDBEaKq+x0EHdd+ORnzzM3lwX3KQyD6Wf5ts849NkZ7y35Oy+sURUJ/NKXFl2EmeIeMlLIsSa34WUnQzWVaiggRuCOlAR2SiBh9cwAs/vf6j3YRlN/KzoG+JLBxCzeCfpR2W1p/nuumAUwEZ3kxidTKDTaPPnZ1JBM42nTfqFj99u7UhN4rEVqJ0p05nRigan4MwheO0LlEQ7zUkSM1Q5UlM+/LzpEwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
Received: from MN2PR12MB4126.namprd12.prod.outlook.com (10.255.125.12) by
 MN2PR12MB3520.namprd12.prod.outlook.com (20.179.82.28) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2495.19; Wed, 4 Dec 2019 02:58:14 +0000
Received: from MN2PR12MB4126.namprd12.prod.outlook.com
 ([fe80::144e:80cf:6f57:f33c]) by MN2PR12MB4126.namprd12.prod.outlook.com
 ([fe80::144e:80cf:6f57:f33c%5]) with mapi id 15.20.2495.014; Wed, 4 Dec 2019
 02:58:14 +0000
From:   EJ Hsu <ejh@nvidia.com>
To:     Felipe Balbi <balbi@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: RE: [PATCH] usb: gadget: fix wrong endpoint desc
Thread-Topic: [PATCH] usb: gadget: fix wrong endpoint desc
Thread-Index: AQHVqccRYYZAKVFwb0S5Jxip3turV6eoV60AgADraIA=
Date:   Wed, 4 Dec 2019 02:58:14 +0000
Message-ID: <MN2PR12MB4126C72DAA5292DA99477FAACF5D0@MN2PR12MB4126.namprd12.prod.outlook.com>
References: <20191203104648.29291-1-ejh@nvidia.com> <87y2vt8ua9.fsf@gmail.com>
In-Reply-To: <87y2vt8ua9.fsf@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Enabled=True;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_SiteId=43083d15-7273-40c1-b7db-39efd9ccc17a;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Owner=ejh@nvidia.com;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_SetDate=2019-12-04T02:58:11.5341605Z;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Name=Unrestricted;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Application=Microsoft Azure
 Information Protection;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_ActionId=b83bd44c-721b-46c9-9c85-c931c9277bcd;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Extended_MSFT_Method=Automatic
authentication-results: spf=none (sender IP is ) smtp.mailfrom=ejh@nvidia.com; 
x-originating-ip: [59.124.78.18]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 63d7589c-fc48-4515-c5c8-08d77865ce24
x-ms-traffictypediagnostic: MN2PR12MB3520:
x-microsoft-antispam-prvs: <MN2PR12MB3520E076722EDA941D2CA9F1CF5D0@MN2PR12MB3520.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1247;
x-forefront-prvs: 0241D5F98C
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(346002)(39860400002)(396003)(136003)(376002)(366004)(189003)(199004)(74316002)(33656002)(81156014)(6506007)(186003)(26005)(446003)(478600001)(102836004)(11346002)(229853002)(7696005)(66946007)(5660300002)(86362001)(2501003)(6436002)(14454004)(25786009)(316002)(6246003)(99286004)(64756008)(110136005)(305945005)(76176011)(7736002)(55016002)(66476007)(66446008)(6116002)(3846002)(71200400001)(2906002)(71190400001)(81166006)(8936002)(9686003)(76116006)(52536014)(256004)(66556008)(8676002);DIR:OUT;SFP:1101;SCL:1;SRVR:MN2PR12MB3520;H:MN2PR12MB4126.namprd12.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nvidia.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 2liDCtXxrtP9b5pwpNR4sG6QQMufgW/tvKTkuam/5JkSNNffFTftatjTx1EXMkvgRwZoHw6SvIAdzKHDpID0YP7LJsaJYXxMr5sUF/8mRpsbpZY0DKwKZGojnlScmvCRL7X627Y5hABwnKzazC8X7npt9EIIqSIBFcPyOPG7r4Cl0RZr3aKeggXtnk3excmysEEhlm5ZKolvni/ZU7YMlRAXKQpQqeoYwuNXKgGcwp0IhGop3uiVyBM8oGNnFSWMTRQoqvHDxnoTAkLhXr0jB98fgyvvkQYyV/BwNx4xQxU7JsjiQcni7HHDgYt9blGUB7mrd/DVNcrxhNoWKRPQ2ph0xRLxneDIG4PwIzj1mTS1C2stKMXcmJN3DcwxYgbwiyE6VVzBln2ugIzOrfh6WyehnXdENOQmDj67glsB+QxS/Ofdn3lSiKN0L1z+mTTN
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 63d7589c-fc48-4515-c5c8-08d77865ce24
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Dec 2019 02:58:14.0635
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Y1QFJkDlNPVXhiK7eFadAYoRxkvu+22tyQLB2hPEtEm3v+HWUL5mg+tHZfHXYFXZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3520
X-OriginatorOrg: Nvidia.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1575428297; bh=8KiibEQs40ijFWS7XPsDZQPhf7FJWZULNpBa6pz3swY=;
        h=X-PGP-Universal:ARC-Seal:ARC-Message-Signature:
         ARC-Authentication-Results:From:To:Subject:Thread-Topic:
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
        b=jIQ1CiaAi3XdF1p1dk95CnaXUdsXFAQU7l8hhBklA5YHZmzUFmMsZoAUveVUPtIdY
         Hck50MwBuDVfpdV1i7Lq6oZOapzMd9BYpGVcQWdd0p3r2Ucu9ZfNLqwFr/Y7TeSq3G
         3owy2OW3lx7xl1+lSWhF3OJKvehOjdQlqS5z/bOII538622akoAy6cOVvsqfhtFRdq
         4SjQ7WyQ3emQM0OX+nXwxMEVviGLstw+79YpSS2nUXAtdkYzhnvvdS4AdB3V2jidKA
         I2lH45I/V2R8tPFzock9NLWVpHogVXsenFV3vXN7rRD6ivj/kwyU3MH4DEwYa9AEMy
         d8H80ofpWqv2Q==
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

Felipe Balb writes:
>EJ Hsu <ejh@nvidia.com> writes:
>> Gadget driver should always use config_ep_by_speed() to initialize=20
>> usb_ep struct according to usb device's operating speed. Otherwise,=20
>> usb_ep struct may be wrong if usb devcie's operating speed is changed.
>
>your commit log doesn't match the patch body. What gives?

The key point in this patch is that we want to make sure the desc pointer i=
n
usb_ep struct will be set to NULL when gadget is disconnected. This will fo=
rce
it to call config_ep_by_speed() to correctly initialize usb_ep struct based=
 on=20
the new operating speed when gadget is re-connected later.

>> Signed-off-by: EJ Hsu <ejh@nvidia.com>
>> ---
>>  drivers/usb/gadget/function/f_ecm.c   | 4 ++++
>>  drivers/usb/gadget/function/f_rndis.c | 1 +
>>  2 files changed, 5 insertions(+)
>>
>> diff --git a/drivers/usb/gadget/function/f_ecm.c=20
>> b/drivers/usb/gadget/function/f_ecm.c
>> index 6ce044008cf6..494fe4e38a65 100644
>> --- a/drivers/usb/gadget/function/f_ecm.c
>> +++ b/drivers/usb/gadget/function/f_ecm.c
>> @@ -623,6 +623,10 @@ static void ecm_disable(struct usb_function *f)
>> =20
>>  	if (ecm->port.in_ep->enabled)
>>  		gether_disconnect(&ecm->port);
>> +	else {
>
>coding style. If one branch has {}, both branches should have {} ;-)

Thanks. Will correct it.

EJ
--nvpublic
