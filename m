Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D7491604B7
	for <lists+linux-usb@lfdr.de>; Fri,  5 Jul 2019 12:49:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727972AbfGEKto (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 5 Jul 2019 06:49:44 -0400
Received: from hqemgate14.nvidia.com ([216.228.121.143]:19992 "EHLO
        hqemgate14.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727638AbfGEKtn (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 5 Jul 2019 06:49:43 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5d1f2b410000>; Fri, 05 Jul 2019 03:49:37 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Fri, 05 Jul 2019 03:49:41 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Fri, 05 Jul 2019 03:49:41 -0700
Received: from HQMAIL110.nvidia.com (172.18.146.15) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 5 Jul
 2019 10:49:40 +0000
Received: from HQMAIL107.nvidia.com (172.20.187.13) by hqmail110.nvidia.com
 (172.18.146.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 5 Jul
 2019 10:49:40 +0000
Received: from NAM01-SN1-obe.outbound.protection.outlook.com (104.47.32.52) by
 HQMAIL107.nvidia.com (172.20.187.13) with Microsoft SMTP Server (TLS) id
 15.0.1473.3 via Frontend Transport; Fri, 5 Jul 2019 10:49:40 +0000
Received: from BN7PR12MB2644.namprd12.prod.outlook.com (20.176.176.86) by
 BN7PR12MB2673.namprd12.prod.outlook.com (20.176.176.91) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2052.18; Fri, 5 Jul 2019 10:49:39 +0000
Received: from BN7PR12MB2644.namprd12.prod.outlook.com
 ([fe80::64f8:8368:5ac7:61ca]) by BN7PR12MB2644.namprd12.prod.outlook.com
 ([fe80::64f8:8368:5ac7:61ca%7]) with mapi id 15.20.2052.019; Fri, 5 Jul 2019
 10:49:39 +0000
From:   EJ Hsu <ejh@nvidia.com>
To:     Alan Stern <stern@rowland.harvard.edu>
CC:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        "balbi@kernel.org" <balbi@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        WK Tsai <wtsai@nvidia.com>,
        "benh@kernel.crashing.org" <benh@kernel.crashing.org>
Subject: RE: [PATCH V3] usb: gadget: storage: Remove warning message
Thread-Topic: [PATCH V3] usb: gadget: storage: Remove warning message
Thread-Index: AQHVBx/hkpXR88AjBUqeS/qWG6pvZqa5E+QwgAFa/SCAAIfIAIABMKhw
Date:   Fri, 5 Jul 2019 10:49:38 +0000
Message-ID: <BN7PR12MB2644CE5F029CD6A5DE353D88CFF50@BN7PR12MB2644.namprd12.prod.outlook.com>
References: <BN7PR12MB26449A2DC32EC2767CBF6687CFFA0@BN7PR12MB2644.namprd12.prod.outlook.com>
 <Pine.LNX.4.44L0.1907041204570.18767-100000@netrider.rowland.org>
In-Reply-To: <Pine.LNX.4.44L0.1907041204570.18767-100000@netrider.rowland.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Enabled=True;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_SiteId=43083d15-7273-40c1-b7db-39efd9ccc17a;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Owner=ejh@nvidia.com;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_SetDate=2019-07-05T10:49:36.1278686Z;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Name=Unrestricted;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Application=Microsoft Azure
 Information Protection;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_ActionId=898a0e24-1a2f-443f-b80a-d052fb20de07;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Extended_MSFT_Method=Automatic
authentication-results: spf=none (sender IP is ) smtp.mailfrom=ejh@nvidia.com; 
x-originating-ip: [59.124.78.18]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b7922a7b-5b36-4541-6525-08d701367a90
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:BN7PR12MB2673;
x-ms-traffictypediagnostic: BN7PR12MB2673:
x-ms-exchange-purlcount: 2
x-microsoft-antispam-prvs: <BN7PR12MB2673C48EC8E77296D28F35F5CFF50@BN7PR12MB2673.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 008960E8EC
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(346002)(396003)(39860400002)(376002)(366004)(136003)(189003)(199004)(43544003)(25786009)(2171002)(6246003)(52536014)(8936002)(476003)(76176011)(71190400001)(7696005)(55016002)(6436002)(71200400001)(966005)(6116002)(2906002)(3846002)(66066001)(11346002)(74316002)(66476007)(446003)(64756008)(4326008)(66946007)(66446008)(15650500001)(8676002)(81156014)(76116006)(478600001)(14444005)(66556008)(7736002)(6916009)(81166006)(73956011)(256004)(305945005)(14454004)(86362001)(102836004)(68736007)(53936002)(54906003)(316002)(5660300002)(229853002)(33656002)(6306002)(9686003)(99286004)(186003)(26005)(6506007)(486006)(6606295002);DIR:OUT;SFP:1101;SCL:1;SRVR:BN7PR12MB2673;H:BN7PR12MB2644.namprd12.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nvidia.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 4GCzgWuxB9BxOba2YRmb27x+Ad2m7MKkzASWSKjc6S1RNOZ7WSrtNqggHH/4UB0449iGalxYeR1z5bjLRYLIQoDwhkNct+t4PqQnS5F+tMCdpF6Pj4bxRQA3p/LrQ9L34H476B55/DWSQUntiXMvXoYfQV+3FJGadfXS9N/3gBpdexUbQeCbIxKV0QqCTTTft9TAqN/zh2q6Hqrj5e/GMEmWyizjI7PifLqswPOCxKkUryMTuo1thLWIPvkuQWbddGZYlwlYrImd54gwf2OiaNuvFYw5CX04UXMcXN29FZllfMSFc4zrXJsMr52bGuPoegCQ3CsfLEUZIn+1jXz0OiZOKbvx2XCa51/RW+AN74yNhHSUkNFeemddPv/qNceeaXaGOSB6x71Mbp/86SeAma79uGhLo7psXD7RZW0I7YU=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: b7922a7b-5b36-4541-6525-08d701367a90
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jul 2019 10:49:39.0121
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ejh@nvidia.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR12MB2673
X-OriginatorOrg: Nvidia.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1562323777; bh=rtZAFJO6zkRIbjaoCRPOjtV4McXzTAPXy2zs0ugfxpI=;
        h=X-PGP-Universal:From:To:CC:Subject:Thread-Topic:Thread-Index:Date:
         Message-ID:References:In-Reply-To:Accept-Language:X-MS-Has-Attach:
         X-MS-TNEF-Correlator:msip_labels:authentication-results:
         x-originating-ip:x-ms-publictraffictype:
         x-ms-office365-filtering-correlation-id:x-microsoft-antispam:
         x-ms-traffictypediagnostic:x-ms-exchange-purlcount:
         x-microsoft-antispam-prvs:x-ms-oob-tlc-oobclassifiers:
         x-forefront-prvs:x-forefront-antispam-report:received-spf:
         x-ms-exchange-senderadcheck:x-microsoft-antispam-message-info:
         MIME-Version:X-MS-Exchange-CrossTenant-Network-Message-Id:
         X-MS-Exchange-CrossTenant-originalarrivaltime:
         X-MS-Exchange-CrossTenant-fromentityheader:
         X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
         X-MS-Exchange-CrossTenant-userprincipalname:
         X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-OriginatorOrg:
         Content-Language:Content-Type:Content-Transfer-Encoding;
        b=hzrAEhuYrXDp3DcX+ks+YhD7AoXp58t6PbL6M9DSYMD5wdhImSD4rjeIGDOQfY4OZ
         dxkMam780Ots+mb4eFK8fhWBv9yCls6UGsFDJ+YX1Ua+2PCZFqS0aEInCZUW06+Mny
         QzqFIxxQyMikpegQqtpabFbUQAP6qPG3Xttp2DOCTVwGUNrMgmJF6q7dnhUTgVi/pk
         A0Xpi3xKgaare7XhadKUP2gydqKCMjJXblp8a+icWX+0oI2CIHKPJQx1LPMU4Ebho4
         PuOAc32tjUDWh5H+J5DTV1GV8XKihVLwj2lFk3XbMXG92RL2UFyBxYOgM/2EPuuw/D
         2RWz3hY3b3svA==
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Alan Stern wrote:
> On Thu, 4 Jul 2019, EJ Hsu wrote:
>=20
> > Based on my initial debugging, USB CV TD 9.13 will consecutively set =
device
> to configuration #1 by sending "Set Configuration" transfer.
> > So, in set_config() function, it will try to disable each interface f=
irst and then
> set up each interface. That is, the fsg_disable() will be called first =
and then
> fsg_set_alt().
> > There might be a chance that the request (FSG_STATE_DISCONNECT) from
> fsg_disabled() has not been handled by fsg_main_thread before fsg_set_a=
lt() is
> called.
> > In this case, fsg_set_alt() will try to queue its request
> (FSG_STATE_CONFIG_CHANGE) to fsg_main_thread, but find that
> FSG_STATE_DISCONNECT has not been handled.
> > Because the priority of FSG_STATE_DISCONNECT is higher than
> FSG_STATE_CONFIG_CHANGE, FSG_STATE_CONFIG_CHANGE will be discarded
> accordingly.
> > This might lead to the missing of usb_composite_setup_continue() whic=
h
> result in the failure of "Set Configuration" transfer.
> >
> > Will push a new patch to fix this issue.
>=20
> Have you seen these emails?
>=20
> 	https://marc.info/?l=3Dlinux-usb&m=3D156222739324546&w=3D2
> 	https://marc.info/?l=3Dlinux-usb&m=3D156222747024558&w=3D2
>=20
> They are probably related to this same issue.
>=20
> Alan Stern

Yes, looks like we are facing the same issue.

The change of Ben is similar to mine, but the priority of FSG_STATE_CONFI=
G_CHANGE in his patch is higher than FSG_STATE_CONFIG_CLEAR.
So, it will not hit the USB CV TD 9.13 failure as above.

However, in my opinion, I think we should keep the handling of FSG_STATE_=
CONFIG_CHANGE as it was. FSG_STATE_CONFIG_CHANGE should take care of hand=
ling FSG_STATE_CONFIG_CLEAR because of its higher priority.
Think about below case:
When fsg_main_thread tries to handle the FSG_STATE_CONFIG_CHANGE, a disco=
nnect event arise at the same time and fsg_disable() is called accordingl=
y.=20
In this case, FSG_STATE_CONFIG_CLEAR might not be queued. (depending on i=
f FSG_STATE_CONFIG_CHANGE is cleared in handle_exception() )
If we still call usb_composite_setup_continue() without checking common->=
new_fsg, the " Unexpected call" message might still be printed (if delaye=
d_status has been cleared in reset_config() ).
Please correct me if I have any misunderstanding.

The change for my previous patch is as follows, and it works well on my l=
ocal test.

Thanks,
EJ

diff --git a/drivers/usb/gadget/function/f_mass_storage.c b/drivers/usb/g=
adget/function/f_mass_storage.c
index 982c3e8..b5f1e1e 100644
--- a/drivers/usb/gadget/function/f_mass_storage.c
+++ b/drivers/usb/gadget/function/f_mass_storage.c
@@ -2306,7 +2306,6 @@ static void handle_exception(struct fsg_common *com=
mon)
=20       enum fsg_state          old_state;
=20       struct fsg_lun          *curlun;
=20       unsigned int            exception_req_tag;
-       struct fsg_dev          *fsg;

=20       /*
=20        * Clear the existing signals.  Anything but SIGUSR1 is convert=
ed
@@ -2413,15 +2412,9 @@ static void handle_exception(struct fsg_common *co=
mmon)
=20               break;

=20       case FSG_STATE_CONFIG_CHANGE:
-               fsg =3D common->new_fsg;
-               /*
-                * Add a check here to double confirm if a disconnect eve=
nt
-                * occurs and common->new_fsg has been cleared.
-                */
-               if (fsg) {
-                       do_set_interface(common, fsg);
+               do_set_interface(common, common->new_fsg);
+               if (common->new_fsg)
=20                       usb_composite_setup_continue(common->cdev);
-               }
=20               break;

=20       case FSG_STATE_DISCONNECT:
diff --git a/drivers/usb/gadget/function/storage_common.h b/drivers/usb/g=
adget/function/storage_common.h
index 12687f7..fc13921 100644
--- a/drivers/usb/gadget/function/storage_common.h
+++ b/drivers/usb/gadget/function/storage_common.h
@@ -160,8 +160,8 @@ enum fsg_state {
=20       FSG_STATE_NORMAL,
=20       FSG_STATE_ABORT_BULK_OUT,
=20       FSG_STATE_PROTOCOL_RESET,
-       FSG_STATE_CONFIG_CHANGE,
=20       FSG_STATE_DISCONNECT,
+       FSG_STATE_CONFIG_CHANGE,
=20       FSG_STATE_EXIT,
=20       FSG_STATE_TERMINATED
=20};
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
