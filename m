Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8136C185B8
	for <lists+linux-usb@lfdr.de>; Thu,  9 May 2019 09:04:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726568AbfEIHEt (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 9 May 2019 03:04:49 -0400
Received: from hqemgate15.nvidia.com ([216.228.121.64]:11268 "EHLO
        hqemgate15.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726561AbfEIHEt (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 9 May 2019 03:04:49 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate15.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5cd3d0ea0000>; Thu, 09 May 2019 00:04:10 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Thu, 09 May 2019 00:04:46 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Thu, 09 May 2019 00:04:46 -0700
Received: from HQMAIL112.nvidia.com (172.18.146.18) by HQMAIL104.nvidia.com
 (172.18.146.11) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 9 May
 2019 07:04:46 +0000
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL112.nvidia.com
 (172.18.146.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 9 May
 2019 07:04:46 +0000
Received: from NAM05-DM3-obe.outbound.protection.outlook.com (104.47.49.53) by
 HQMAIL107.nvidia.com (172.20.187.13) with Microsoft SMTP Server (TLS) id
 15.0.1473.3 via Frontend Transport; Thu, 9 May 2019 07:04:45 +0000
Received: from BN7PR12MB2644.namprd12.prod.outlook.com (20.176.176.86) by
 BN7PR12MB2836.namprd12.prod.outlook.com (20.176.178.161) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1856.12; Thu, 9 May 2019 07:04:44 +0000
Received: from BN7PR12MB2644.namprd12.prod.outlook.com
 ([fe80::d8eb:619:1ce7:4b68]) by BN7PR12MB2644.namprd12.prod.outlook.com
 ([fe80::d8eb:619:1ce7:4b68%6]) with mapi id 15.20.1878.022; Thu, 9 May 2019
 07:04:44 +0000
From:   EJ Hsu <ejh@nvidia.com>
To:     Alan Stern <stern@rowland.harvard.edu>
CC:     "balbi@kernel.org" <balbi@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: RE: [V2] usb: gadget: storage: Remove warning message
Thread-Topic: [V2] usb: gadget: storage: Remove warning message
Thread-Index: AQHVBXZkPpUAk14nw0qMJJLApZVvs6ZhaXuAgADqj6A=
Date:   Thu, 9 May 2019 07:04:44 +0000
Message-ID: <BN7PR12MB264462BFFBDDACE928D2DCB9CF330@BN7PR12MB2644.namprd12.prod.outlook.com>
References: <1557303384-69873-1-git-send-email-ejh@nvidia.com>
 <Pine.LNX.4.44L0.1905081203410.1699-100000@iolanthe.rowland.org>
In-Reply-To: <Pine.LNX.4.44L0.1905081203410.1699-100000@iolanthe.rowland.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Enabled=True;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_SiteId=43083d15-7273-40c1-b7db-39efd9ccc17a;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Owner=ejh@nvidia.com;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_SetDate=2019-05-09T07:04:41.7729132Z;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Name=Unrestricted;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Application=Microsoft Azure
 Information Protection;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Extended_MSFT_Method=Automatic;
 Sensitivity=Unrestricted
authentication-results: spf=none (sender IP is ) smtp.mailfrom=ejh@nvidia.com; 
x-originating-ip: [59.124.78.18]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c390ffab-5985-4058-02df-08d6d44c9d8a
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328)(7193020);SRVR:BN7PR12MB2836;
x-ms-traffictypediagnostic: BN7PR12MB2836:
x-microsoft-antispam-prvs: <BN7PR12MB2836F4738058DE947F7D7341CF330@BN7PR12MB2836.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 003245E729
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(136003)(396003)(346002)(376002)(39860400002)(366004)(199004)(189003)(486006)(6436002)(476003)(446003)(11346002)(305945005)(7736002)(186003)(53936002)(71190400001)(2171002)(66946007)(66446008)(64756008)(66556008)(66476007)(74316002)(6246003)(71200400001)(76176011)(52536014)(26005)(102836004)(68736007)(6506007)(66066001)(8676002)(2906002)(55016002)(9686003)(81166006)(6916009)(81156014)(316002)(86362001)(8936002)(478600001)(99286004)(5660300002)(7696005)(14444005)(256004)(14454004)(25786009)(4326008)(54906003)(73956011)(76116006)(229853002)(3846002)(6116002)(33656002);DIR:OUT;SFP:1101;SCL:1;SRVR:BN7PR12MB2836;H:BN7PR12MB2644.namprd12.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nvidia.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: JlsyqLfieUszgUheeowNbWA/eDDBjUvwal2adhil9B1xIdOzpOvYLVLtydrVKFWxjJp/L7xJKMCzZWVra4gqn+SQUOkH3ZMMBEc09lxUxEo7ke6SEN54vtH5PZzrSRkpGqm22t/QC647oGjxpdxP1Uf6Zz1PrHO5dQq41LDn45dZV8stVRQCyyBOOimzv6tjrB6dZsO7XPFRjKo4Na7fu9bEJLz4ABiFZQCezK84Gd1KCabJgxtrRdM+fJLDi7KufosRfP1AVqM42UoeYXRJ3t38Ckg3uLovBSVsWIALJvHSdC2jnRfpG7Q9SKNlmIt5NoQtze9N1UlT3GrmDlSU0/dFIW+JH2ZMW6Y3Gul8uHrbYebq7L9LzdUagUbcJgz2r5tbOBVKFMJmpKEUHoJioCxkQMmywuqNO+YkKSP/27U=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: c390ffab-5985-4058-02df-08d6d44c9d8a
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 May 2019 07:04:44.4035
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR12MB2836
X-OriginatorOrg: Nvidia.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1557385450; bh=uJLZC5xMVT5cDgCcuNDNCe4oZsVDQXaEpZSm6tVRXoI=;
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
        b=r3Q2Ma8/tY5UUxP6HuXAxieZKNXV4ihGxT/PMm8Nr7VL/V8uxKadcsrepYV1D3L+B
         uFQ3X+UyBwjriM5Y+PnpUwsgsY1V9r0K3ib6FMNaGt76TundDsR0+P9HwFt0DZ6jPY
         U+8UjTiMCQocDCZqxSUSuuMUySiPhSlSA48uT42qtSzl5a2oz9pX9WcEynkOc0OXoF
         X2HdwCD/+LRBqbBUpZwl0mpNKh18cFfo5i1iykzprC138m24xiaZerD+9IrUDJA/Y+
         O3UyGQLb5iKkWMMlwi1XjD7SW0JkSE6gJcwiU1jOJIRSPFbciKXUKHSQxsdYA9uC9f
         O5boRDpd3AWTg==
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

>=20
> You forgot to change fsg_unbind() to use FSG_STATE_DISCONNECT.  And when
> that's done, it will no longer need to set common->new_fsg to NULL either=
.
>=20

Yes, we should change fsg_unbind() as well.

> This is sort of a band-aid approach.  The real problem is that the origin=
al design
> of the driver never intended for there to be more than one outstanding
> CONFIG_CHANGE event, so naturally there are scenarios where it doesn't wo=
rk
> right when that assumption is violated.  This patch addresses one of thos=
e
> scenarios, but there may be others remaining.
>=20
> Ultimately the problem boils down to synchronization with the composite c=
ore.

Thanks for your reviewing, I agree with your point.

> Some of the callbacks made by the core take time to fully process, so wha=
t
> should happen if the core makes a second callback before the first one is
> completely processed?
>=20
> On the other hand, I can't think of anything better at the moment.
>=20
> Alan Stern

Actually, composite core have tried to deal with this case by using a spinl=
ock.=20
(please refer to the cdev->lock)
The problem here is that the callback of fsg will delegate the request to=20
fsg_main_thread. That is, the handling of fsg request will run in parallel =
with=20
composite core.
In my opinion, this issue can be avoided if we handle these request directl=
y=20
in the callback of fsg instead of handing it over to fsg_main_thread. But t=
his=20
might take too much time in the interrupt context, which is not good for=20
system performance.

Please correct me if there is anything wrong. Thanks

EJ

--nvpublic
