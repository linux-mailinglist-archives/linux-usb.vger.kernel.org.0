Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B0DC85E2BD
	for <lists+linux-usb@lfdr.de>; Wed,  3 Jul 2019 13:21:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726473AbfGCLVA (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 3 Jul 2019 07:21:00 -0400
Received: from nat-hk.nvidia.com ([203.18.50.4]:31843 "EHLO nat-hk.nvidia.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726255AbfGCLVA (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 3 Jul 2019 07:21:00 -0400
Received: from hkpgpgate102.nvidia.com (Not Verified[10.18.92.9]) by nat-hk.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5d1c8f940000>; Wed, 03 Jul 2019 19:20:52 +0800
Received: from HKMAIL103.nvidia.com ([10.18.16.12])
  by hkpgpgate102.nvidia.com (PGP Universal service);
  Wed, 03 Jul 2019 04:20:52 -0700
X-PGP-Universal: processed;
        by hkpgpgate102.nvidia.com on Wed, 03 Jul 2019 04:20:52 -0700
Received: from HKMAIL104.nvidia.com (10.18.16.13) by HKMAIL103.nvidia.com
 (10.18.16.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 3 Jul
 2019 11:20:52 +0000
Received: from NAM03-CO1-obe.outbound.protection.outlook.com (104.47.40.56) by
 HKMAIL104.nvidia.com (10.18.16.13) with Microsoft SMTP Server (TLS) id
 15.0.1473.3 via Frontend Transport; Wed, 3 Jul 2019 11:20:52 +0000
Received: from DM6PR12MB2651.namprd12.prod.outlook.com (20.176.116.24) by
 DM6PR12MB3945.namprd12.prod.outlook.com (10.255.174.154) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2032.18; Wed, 3 Jul 2019 11:20:50 +0000
Received: from DM6PR12MB2651.namprd12.prod.outlook.com
 ([fe80::901a:926:2809:5193]) by DM6PR12MB2651.namprd12.prod.outlook.com
 ([fe80::901a:926:2809:5193%7]) with mapi id 15.20.2032.019; Wed, 3 Jul 2019
 11:20:50 +0000
From:   EJ Hsu <ejh@nvidia.com>
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Alan Stern <stern@rowland.harvard.edu>
CC:     "balbi@kernel.org" <balbi@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: RE: [PATCH V3] usb: gadget: storage: Remove warning message
Thread-Topic: [PATCH V3] usb: gadget: storage: Remove warning message
Thread-Index: AQHVBx/hkpXR88AjBUqeS/qWG6pvZqa5E+Qw
Date:   Wed, 3 Jul 2019 11:20:49 +0000
Message-ID: <DM6PR12MB2651638C25685F2B95BAFA5ECFFB0@DM6PR12MB2651.namprd12.prod.outlook.com>
References: <Pine.LNX.4.44L0.1907021007380.1647-100000@iolanthe.rowland.org>
 <CY4PR1201MB0037C93EC7F81A394008C4CCAAF80@CY4PR1201MB0037.namprd12.prod.outlook.com>
 <CY4PR1201MB003707DAF71D18538DB48230AAF80@CY4PR1201MB0037.namprd12.prod.outlook.com>
In-Reply-To: <CY4PR1201MB003707DAF71D18538DB48230AAF80@CY4PR1201MB0037.namprd12.prod.outlook.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Enabled=True;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_SiteId=43083d15-7273-40c1-b7db-39efd9ccc17a;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Owner=ejh@nvidia.com;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_SetDate=2019-07-03T11:20:45.7533964Z;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Name=Unrestricted;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Application=Microsoft Azure
 Information Protection;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_ActionId=67b72881-bb1a-4282-9c25-7c632192d9b5;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Extended_MSFT_Method=Automatic
authentication-results: spf=none (sender IP is ) smtp.mailfrom=ejh@nvidia.com; 
x-originating-ip: [59.124.78.18]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3f384847-783b-4644-aae0-08d6ffa880d2
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:DM6PR12MB3945;
x-ms-traffictypediagnostic: DM6PR12MB3945:
x-microsoft-antispam-prvs: <DM6PR12MB3945F40225BF0E00EB39D89BCFFB0@DM6PR12MB3945.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-forefront-prvs: 00872B689F
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(346002)(376002)(39860400002)(366004)(396003)(136003)(60444003)(189003)(199004)(66476007)(110136005)(54906003)(64756008)(5660300002)(66556008)(6246003)(52536014)(2171002)(316002)(66946007)(66446008)(3846002)(6116002)(81166006)(76116006)(86362001)(446003)(8676002)(71200400001)(4326008)(68736007)(74316002)(71190400001)(476003)(486006)(25786009)(73956011)(81156014)(8936002)(2906002)(15650500001)(11346002)(14454004)(53936002)(7736002)(305945005)(66066001)(33656002)(99286004)(186003)(102836004)(26005)(7696005)(76176011)(229853002)(6436002)(55016002)(256004)(9686003)(478600001)(5024004)(14444005)(6506007)(460985005);DIR:OUT;SFP:1101;SCL:1;SRVR:DM6PR12MB3945;H:DM6PR12MB2651.namprd12.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nvidia.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: WRCRX4DkgHVMn5XjTNa8dJqDMcTjKMf2FfuRUqRLEPk6f6NGwmomFYSfb3LuK8P6WJlfvvwIDzz0ywLCwEKehtWTI/7DFo76GUftMAJE3cw+rpvvFLDsD10nw+GPNaw1HhhWwuqnYiTIl2S9Bze6cf8bl3Tv4Glal8B1xpX7dreKFooBzXm2hTpIS+bzIwqTCT2UdJliFz2rj5HlMMIJK8uclqPrLOZm5/XjGwTZeKJBdWkF35+faloqhSHptKIvBumPln7O/Ngg0k8f1tYcuP2HabvANRRBmUPkh7mYoDNhlC8rY66/J5XmsLxQDH13wJQBw8fy2JR0CjrudEVHS9Gsxb8psAmlelt2XERoCnky3QZeCAzRszQAFkTwH9kWEs1T82Lg1PcICWoHeK/2szVFc0b8jzcpnlQF/LkBfMY=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f384847-783b-4644-aae0-08d6ffa880d2
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jul 2019 11:20:49.8773
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ejh@nvidia.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3945
X-OriginatorOrg: Nvidia.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1562152852; bh=3+NDO7Gb+HEkyu5/l8yYSQ43JJok6GGu28ODqora4IM=;
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
         X-MS-Exchange-CrossTenant-userprincipalname:
         X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-OriginatorOrg:
         Content-Language:Content-Type:Content-Transfer-Encoding;
        b=Dp8VzQh9hlN2f00HEg3+PbFOxwffABprrciuu9LTYzvcLZmZZ2047KwTaqkkZ2Apz
         85ZcB6UmECfHzqqlU6ZV7w0Bi5nqd7pUx1qPFBcAyaqB5C57TruW3UM4Oes312iT3l
         U6KST77/fBMkiql7LovQbreeryqdOaOjbGLZBW45AOEHciQCUJAJ8xqU3eKWY03COc
         p4weNU+fK9viDIN0a4eHI2nddfdmp0V11MlgnzwGxDOuVx6T8F5Yx7LodCwn8F5SIE
         4H/e2UOadyGkd7Im/L03nmuONPd7H7WYtv4bVCiVna4mAd1OD7jIwgohwjNsLeVWNH
         q+DGRv/glU+RQ==
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

EJ Hsu wrote:
> Thinh Nguyen wrote:
> > Alan Stern wrote:
> >> On Tue, 2 Jul 2019, Thinh Nguyen wrote:
> >>
> >>> Hi,
> >>>
> >>> Alan Stern wrote:
> >>>> On Fri, 10 May 2019, EJ Hsu wrote:
> >>>>
> >>>>> This change is to fix below warning message in following scenario=
:
> >>>>> usb_composite_setup_continue: Unexpected call
> >>>>>
> >>>>> When system tried to enter suspend, the fsg_disable() will be
> >>>>> called to disable fsg driver and send a signal to fsg_main_thread=
.
> >>>>> However, at this point, the fsg_main_thread has already been
> >>>>> frozen and can not respond to this signal. So, this signal will b=
e
> >>>>> pended until fsg_main_thread wakes up.
> >>>>>
> >>>>> Once system resumes from suspend, fsg_main_thread will detect a
> >>>>> signal pended and do some corresponding action (in
> >>>>> handle_exception()). Then, host will send some setup requests (ge=
t
> >>>>> descriptor, set configuration...) to UDC driver trying to
> >>>>> enumerate this device. During the handling of "set configuration"=

> >>>>> request, it will try to sync up with fsg_main_thread by sending a=

> >>>>> signal (which is the same as the signal sent by fsg_disable) to
> >>>>> it. In a similar manner, once the fsg_main_thread receives this s=
ignal, it
> will call handle_exception() to handle the request.
> >>>>>
> >>>>> However, if the fsg_main_thread wakes up from suspend a little
> >>>>> late and "set configuration" request from Host arrives a little
> >>>>> earlier, fsg_main_thread might come across the request from "set
> configuration"
> >>>>> when it handles the signal from fsg_disable(). In this case, it
> >>>>> will handle this request as well. So, when fsg_main_thread tries
> >>>>> to handle the signal sent from "set configuration" later, there
> >>>>> will nothing left to do and warning message "Unexpected call" is =
printed.
> >>>>>
> >>>>> Signed-off-by: EJ Hsu <ejh@nvidia.com>
> >>>>> ---
> >>>>> v2: remove the copyright info
> >>>>> v3: change fsg_unbind() to use FSG_STATE_DISCONNECT
> >>>>> ---
> >>> This patch causes a failure in USB CV TD 9.13 Set Configuration Tes=
t.
> >>> Please review and help resolve it.
> >>> Apologize for the short report description. I'll try to capture mor=
e
> >>> info if you cannot reproduce it.
> >> Yes, please provide the complete log and information from the failin=
g
> >> USB CV test.
> >>
> > I attached the CV test log. I hope that's sufficient.
> >
>=20
> We may have issue sending attched HTML file. Here's a text format of it=
:
>=20
>=20
>     TEST SUITE:  Chapter 9 Tests [USB 3 Gen X devices].cvtests
>     REVISION:  10866
>     REVISION DATE:  2018-02-28 16:30:43 -0800 (Wed, 28 Feb 2018)
>     OPERATING SYSTEM:  Windows 10 Home (Build
> 18894.1000.amd64fre.rs_prerelease.190503-1728)
>     WORKSTATION:  USB-AUTOMATION
>     DATE:  Tuesday, July 02, 2019
>     TIME:  01:52:01 AM
>     OPERATOR:  Lab_auto
>     NUMBER OF TESTS:  1
>     LOG NAME:  Chapter 9 Tests - USB 3 Gen X - 2019-07-02 01-51-36
>     RESULT:  failed
>=20
> InitializeTestSuite
>=20
> INFOTest log initialized.
> INFOLog Level: Normal
> INFOUser Input module initialized
> INFOWindows 10 Home (Build 18894.1000.amd64fre.rs_prerelease.190503-
> 1728)
> INFOCVExe.exe ver 3.0.0.0
> INFOBaseUtilities.dll ver 3.0.0.0
> INFOCommandVerifierLog.dll ver 3.0.0.0
> INFOTSMFCGuiDialogHelperDLL.dll ver 3.0.0.0 INFOTestUtilities.dll ver 3=
.0.0.0
> INFOTestSuiteEngine.dll ver 3.0.0.0 INFOVIFReader.dll ver 3.0.0.0
> INFOxhci_DevIOCTL.dll ver 2.1.10.3 INFOxhci_TestServices.dll ver 2.1.10=
.3
> INFOUSBUtilities.dll ver 1.4.5.1 INFOStackSwitcher.dll ver 1.4.5.1
> INFOxhci_USBCommandVerifier.dll ver 2.1.10.3 INFOHost selected: xHCI Ho=
st:
> VID=3D0x8086, PID=3D0xa36d (PCI bus 0, device 20, function 0)
> INFODUT selected: SSP  Device (MSC/BOT) addr=3D1:   VID=3D053f, PID=3D8=
bd8
> INFOTopology: XHCI HC -- DUT
> INFOSuperSpeedPlus Device.
>=20
> GetNumberOfConfigurations
>=20
> INFOUSB Version number of device:  3.20
> INFONumber of configurations: 1
>=20
> TD 9.13 Set Configuration Test - Device State AddressedFailed (Aborted)=

>=20
> INFOStart time: Tue Jul  2 01:51:39 2019
>=20
> INFO   In Address state:
> INFONow doing a Set Configuration with Configuration Value 0 INFOSet
> Configuration with Configuration Value 0 succeeded INFONow doing a Get
> Configuration INFOGet Configuration for the device returned the correct=

> Configuration Value of 0 INFONow doing a Get Descriptor with Configurat=
ion
> Index 0 INFOGet Descriptor succeeded and returned Configuration Value :=
=201
> INFONow doing a Set Configuration with Configuration Value 1 INFOSet
> Configuration succeeded with Configuration Value : 1
> INFO   In Configured state:
> INFONow doing a Get Descriptor with Configuration Index 0 INFOGet
> Descriptor succeeded and returned Configuration Value : 1 INFONow doing=
=20a
> Set Configuration with Configuration Value 1 ERRORSet Configuration fai=
led for
> Configuration Value : 1 ERRORSet Configuration failed with Configuratio=
n
> Value : 1
> FAIL(9.4.7.1) Devices must support a valid SetConfiguration() request I=
NFONow
> doing a Set Configuration with Configuration Value 0 ERRORSet Configura=
tion
> failed for Configuration Value : 0 ERRORCould not unconfigure the devic=
e
> FAIL(9.4.7.4) In the Configured state in response to the
> SetConfiguration() request, the device must enter the Address state, if=
=20the
> specified configuration is zero.
> INFONow doing a Get Configuration
> ERRORGet configuration failed
> ERRORCould not Get Configuration for the device ERRORGet device descrip=
tor
> failed ERRORCouldn't get USB Version of Device Under Test ERRORGet numb=
er
> of configurations failed ABORTCould not find an invalid Configuration V=
alue,
> FindInvalidConfigValue() returned 0 - Internal error INFOPutting device=
=20back in
> Configured state ERRORSet Configuration failed for Configuration Value =
: 1
> ERRORSet Configuration failed with Configuration Value : 1
> FAIL(9.4.7.1) Devices must support a valid SetConfiguration() request I=
NFONow
> doing a Get Configuration ERRORGet configuration failed ERRORCould not =
Get
> Configuration for the device
> FAIL(9.4.2.2) Devices should return the non-zero bConfigurationValue of=
=20the
> current configuration for the GetConfiguration() request in the Configu=
red
> state.
> INFONow doing a Get Configuration
> ERRORGet configuration failed
> ERRORCould not Get Configuration for the device
> FAIL(9.4.2.2) Devices should return the non-zero bConfigurationValue of=
=20the
> current configuration for the GetConfiguration() request in the Configu=
red
> state.
> INFONow doing a Set Configuration with Configuration Value 0 ERRORSet
> Configuration failed for Configuration Value : 0 ERRORCould not unconfi=
gure
> the device
> FAIL(9.4.7.4) In the Configured state in response to the
> SetConfiguration() request, the device must enter the Address state, if=
=20the
> specified configuration is zero.
> FAILTest did not execute all required steps.
> INFO
> Stop time: Tue Jul  2 01:52:01 2019
> INFODuration:  22 seconds.
> INFOStopping Test [ TD 9.13 Set Configuration Test - Device State Addre=
ssed:
>      Number of: Fails (7); Aborts (1); Warnings (0) ]
>=20
> Summary
>=20
> INFOTEST SUITE SUMMARY:
>     [ Fails (7); Aborts (1); Warnings (0) ] INFOTEST RESULTS:
>     [ Passed (0); Failed (1) ]
>=20
>=20
>=20
>=20
> BR,
> Thinh

I can reproduce this issue locally. The reproducing rate is about 1 out o=
f 10.
Will look into this issue. Thanks
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
