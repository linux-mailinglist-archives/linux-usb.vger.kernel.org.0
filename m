Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 014305D5DF
	for <lists+linux-usb@lfdr.de>; Tue,  2 Jul 2019 20:06:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726825AbfGBSGW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 2 Jul 2019 14:06:22 -0400
Received: from dc2-smtprelay2.synopsys.com ([198.182.61.142]:36434 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726329AbfGBSGV (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 2 Jul 2019 14:06:21 -0400
Received: from mailhost.synopsys.com (badc-mailhost2.synopsys.com [10.192.0.18])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 5231EC1CF0;
        Tue,  2 Jul 2019 18:06:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1562090781; bh=TIjqkCPKvAu4ld3RzZZOwJnuM2mEcPDleSGOsWWZits=;
        h=From:To:CC:Subject:Date:References:From;
        b=I0aEpCp+WpfPxFxmMNpT+wm7Aqv2L3BqX3pxpF3lfDyNgZW86b7Wn/bdUxNJLWS7s
         X5J2IDcWRpQr/oopmNfFFIgS6BuYU9Z5ZWDTaRLds3xBY5ooIz+nbgeiUlExupbuCV
         UY4Edxvy0/fVG+TZXEt5Seddlk/6Y4gpNbncCIkP9svoAtGWCUGU9wIAl+t1nHf8ki
         m3MWrTFkL6V7SJSp1vlQAW0IwHa6cnCyS7g4GsQGFTDei6yKNDxKyo7A478MMxLhaq
         clkxzHZsluNTf/+V8PoZMPyhdLv7HTbnTeDQRum3ZrpTs4S1GwsothlKOh7hJbam+u
         bHg/hbyXZC3cw==
Received: from US01WEHTC3.internal.synopsys.com (us01wehtc3.internal.synopsys.com [10.15.84.232])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id 1F962A0073;
        Tue,  2 Jul 2019 18:06:20 +0000 (UTC)
Received: from US01HYBRID2.internal.synopsys.com (10.15.246.24) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Tue, 2 Jul 2019 11:06:20 -0700
Received: from NAM04-SN1-obe.outbound.protection.outlook.com (10.13.134.195)
 by mrs.synopsys.com (10.15.246.24) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Tue, 2 Jul 2019 11:06:20 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.onmicrosoft.com; s=selector1-synopsys-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l9D1qdPnJneZDuSXkI5m+OVRLQsmyIc61qgiefDF88M=;
 b=ldYItFz6n8Igz7wyE/nTrwXhn5VvmPcigPuBFMNc9AufwBjsVG8zuv3zzqZntVlJF2yVq2FuP/D/goYD0Z87bPBWlcH8gm7SsA0lrOmHuTcqVwcuFnQL4EhzArqfWsCFiLHY8SLvOeHvGddQ0l7oE/+bHIruEkLXdOMq70Uwlb8=
Received: from CY4PR1201MB0037.namprd12.prod.outlook.com (10.172.78.22) by
 CY4PR1201MB2519.namprd12.prod.outlook.com (10.172.119.151) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2032.20; Tue, 2 Jul 2019 18:06:19 +0000
Received: from CY4PR1201MB0037.namprd12.prod.outlook.com
 ([fe80::f520:c8d1:43e6:5fc3]) by CY4PR1201MB0037.namprd12.prod.outlook.com
 ([fe80::f520:c8d1:43e6:5fc3%6]) with mapi id 15.20.2032.019; Tue, 2 Jul 2019
 18:06:18 +0000
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Alan Stern <stern@rowland.harvard.edu>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>
CC:     EJ Hsu <ejh@nvidia.com>, "balbi@kernel.org" <balbi@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH V3] usb: gadget: storage: Remove warning message
Thread-Topic: [PATCH V3] usb: gadget: storage: Remove warning message
Thread-Index: AQHVBx/hjwLl90oF1Ui1cduuEUYtTw==
Date:   Tue, 2 Jul 2019 18:06:18 +0000
Message-ID: <CY4PR1201MB003707DAF71D18538DB48230AAF80@CY4PR1201MB0037.namprd12.prod.outlook.com>
References: <Pine.LNX.4.44L0.1907021007380.1647-100000@iolanthe.rowland.org>
 <CY4PR1201MB0037C93EC7F81A394008C4CCAAF80@CY4PR1201MB0037.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=thinhn@synopsys.com; 
x-originating-ip: [198.182.56.5]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1096c908-3f97-4ca7-b457-08d6ff17fb99
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:CY4PR1201MB2519;
x-ms-traffictypediagnostic: CY4PR1201MB2519:
x-microsoft-antispam-prvs: <CY4PR1201MB25194959D5FF3B9C06ED056CAAF80@CY4PR1201MB2519.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-forefront-prvs: 008663486A
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(366004)(346002)(396003)(136003)(376002)(39860400002)(199004)(60444003)(189003)(229853002)(66066001)(33656002)(3846002)(6116002)(71200400001)(15650500001)(53936002)(2906002)(7736002)(8936002)(305945005)(74316002)(478600001)(71190400001)(8676002)(86362001)(81156014)(6636002)(186003)(66556008)(476003)(9686003)(73956011)(52536014)(14454004)(76176011)(316002)(91956017)(110136005)(6506007)(486006)(55016002)(5660300002)(26005)(7696005)(446003)(102836004)(68736007)(6436002)(4326008)(66446008)(2171002)(64756008)(6246003)(14444005)(25786009)(5024004)(66946007)(99286004)(54906003)(81166006)(256004)(76116006)(66476007)(460985005);DIR:OUT;SFP:1102;SCL:1;SRVR:CY4PR1201MB2519;H:CY4PR1201MB0037.namprd12.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: fMf9jBGHgwQN0pX+ufiIEwMdjlVr/dM9+BWU09jj0PKOuWsT8FkWymX4CRIpVtiZz446m+AzJHeb+E2ehoO50S8Oaw6VzctZ0LY4ca21lAvJ80gnLuOjTxyJbOyoI9Hs5deVACfJNwnPlwhVKItXNWEZ16InMi4DzzMY/KhfafbvsRScfKNp3tl3qMsEeeCq8bRF0iNy/UhjBamRlIKcGebkE62J7TtQ2SOmANXwOMsN3DA417ri4U7ETiOb5fjOXjreEpUeohOKoWnK1JMIFUHTVIOZ/NSSTOhYFv/rfOpOEEuHk7Oi3n542aQgIYMbr1pymuo7pDvYAO2STe3g75ejwlqQeIyEZAQCEWB+AcoJvd+ssxp5J4l6hGPNO+SG3pFuKN/vo3/OH0bIW3ow6qJ2HkmlNfBb2eyJ+4+MQLI=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 1096c908-3f97-4ca7-b457-08d6ff17fb99
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jul 2019 18:06:18.8617
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: thinhn@synopsys.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB2519
X-OriginatorOrg: synopsys.com
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Thinh Nguyen wrote:=0A=
> Alan Stern wrote:=0A=
>> On Tue, 2 Jul 2019, Thinh Nguyen wrote:=0A=
>>=0A=
>>> Hi,=0A=
>>>=0A=
>>> Alan Stern wrote:=0A=
>>>> On Fri, 10 May 2019, EJ Hsu wrote:=0A=
>>>>=0A=
>>>>> This change is to fix below warning message in following scenario:=0A=
>>>>> usb_composite_setup_continue: Unexpected call=0A=
>>>>>=0A=
>>>>> When system tried to enter suspend, the fsg_disable() will be called =
to=0A=
>>>>> disable fsg driver and send a signal to fsg_main_thread. However, at=
=0A=
>>>>> this point, the fsg_main_thread has already been frozen and can not=
=0A=
>>>>> respond to this signal. So, this signal will be pended until=0A=
>>>>> fsg_main_thread wakes up.=0A=
>>>>>=0A=
>>>>> Once system resumes from suspend, fsg_main_thread will detect a signa=
l=0A=
>>>>> pended and do some corresponding action (in handle_exception()). Then=
,=0A=
>>>>> host will send some setup requests (get descriptor, set configuration=
...)=0A=
>>>>> to UDC driver trying to enumerate this device. During the handling of=
 "set=0A=
>>>>> configuration" request, it will try to sync up with fsg_main_thread b=
y=0A=
>>>>> sending a signal (which is the same as the signal sent by fsg_disable=
)=0A=
>>>>> to it. In a similar manner, once the fsg_main_thread receives this=0A=
>>>>> signal, it will call handle_exception() to handle the request.=0A=
>>>>>=0A=
>>>>> However, if the fsg_main_thread wakes up from suspend a little late a=
nd=0A=
>>>>> "set configuration" request from Host arrives a little earlier,=0A=
>>>>> fsg_main_thread might come across the request from "set configuration=
"=0A=
>>>>> when it handles the signal from fsg_disable(). In this case, it will=
=0A=
>>>>> handle this request as well. So, when fsg_main_thread tries to handle=
=0A=
>>>>> the signal sent from "set configuration" later, there will nothing le=
ft=0A=
>>>>> to do and warning message "Unexpected call" is printed.=0A=
>>>>>=0A=
>>>>> Signed-off-by: EJ Hsu <ejh@nvidia.com>=0A=
>>>>> ---=0A=
>>>>> v2: remove the copyright info=0A=
>>>>> v3: change fsg_unbind() to use FSG_STATE_DISCONNECT=0A=
>>>>> ---=0A=
>>> This patch causes a failure in USB CV TD 9.13 Set Configuration Test.=
=0A=
>>> Please review and help resolve it.=0A=
>>> Apologize for the short report description. I'll try to capture more=0A=
>>> info if you cannot reproduce it.=0A=
>> Yes, please provide the complete log and information from the failing =
=0A=
>> USB CV test.=0A=
>>=0A=
> I attached the CV test log. I hope that's sufficient.=0A=
>=0A=
=0A=
We may have issue sending attched HTML file. Here's a text format of it:=0A=
=0A=
=0A=
    TEST SUITE:  Chapter 9 Tests [USB 3 Gen X devices].cvtests=0A=
    REVISION:  10866=0A=
    REVISION DATE:  2018-02-28 16:30:43 -0800 (Wed, 28 Feb 2018)=0A=
    OPERATING SYSTEM:  Windows 10 Home (Build=0A=
18894.1000.amd64fre.rs_prerelease.190503-1728)=0A=
    WORKSTATION:  USB-AUTOMATION=0A=
    DATE:  Tuesday, July 02, 2019=0A=
    TIME:  01:52:01 AM=0A=
    OPERATOR:  Lab_auto=0A=
    NUMBER OF TESTS:  1=0A=
    LOG NAME:  Chapter 9 Tests - USB 3 Gen X - 2019-07-02 01-51-36=0A=
    RESULT:  failed=0A=
=0A=
InitializeTestSuite=0A=
=0A=
INFOTest log initialized.=0A=
INFOLog Level: Normal=0A=
INFOUser Input module initialized=0A=
INFOWindows 10 Home (Build 18894.1000.amd64fre.rs_prerelease.190503-1728)=
=0A=
INFOCVExe.exe ver 3.0.0.0=0A=
INFOBaseUtilities.dll ver 3.0.0.0=0A=
INFOCommandVerifierLog.dll ver 3.0.0.0=0A=
INFOTSMFCGuiDialogHelperDLL.dll ver 3.0.0.0=0A=
INFOTestUtilities.dll ver 3.0.0.0=0A=
INFOTestSuiteEngine.dll ver 3.0.0.0=0A=
INFOVIFReader.dll ver 3.0.0.0=0A=
INFOxhci_DevIOCTL.dll ver 2.1.10.3=0A=
INFOxhci_TestServices.dll ver 2.1.10.3=0A=
INFOUSBUtilities.dll ver 1.4.5.1=0A=
INFOStackSwitcher.dll ver 1.4.5.1=0A=
INFOxhci_USBCommandVerifier.dll ver 2.1.10.3=0A=
INFOHost selected: xHCI Host:  VID=3D0x8086, PID=3D0xa36d (PCI bus 0, devic=
e=0A=
20, function 0)=0A=
INFODUT selected: SSP  Device (MSC/BOT) addr=3D1:   VID=3D053f, PID=3D8bd8=
=0A=
INFOTopology: XHCI HC -- DUT=0A=
INFOSuperSpeedPlus Device.=0A=
=0A=
GetNumberOfConfigurations=0A=
=0A=
INFOUSB Version number of device:  3.20=0A=
INFONumber of configurations: 1=0A=
=0A=
TD 9.13 Set Configuration Test - Device State AddressedFailed (Aborted)=0A=
=0A=
INFOStart time: Tue Jul  2 01:51:39 2019=0A=
=0A=
INFO   In Address state:=0A=
INFONow doing a Set Configuration with Configuration Value 0=0A=
INFOSet Configuration with Configuration Value 0 succeeded=0A=
INFONow doing a Get Configuration=0A=
INFOGet Configuration for the device returned the correct Configuration=0A=
Value of 0=0A=
INFONow doing a Get Descriptor with Configuration Index 0=0A=
INFOGet Descriptor succeeded and returned Configuration Value : 1=0A=
INFONow doing a Set Configuration with Configuration Value 1=0A=
INFOSet Configuration succeeded with Configuration Value : 1=0A=
INFO   In Configured state:=0A=
INFONow doing a Get Descriptor with Configuration Index 0=0A=
INFOGet Descriptor succeeded and returned Configuration Value : 1=0A=
INFONow doing a Set Configuration with Configuration Value 1=0A=
ERRORSet Configuration failed for Configuration Value : 1=0A=
ERRORSet Configuration failed with Configuration Value : 1=0A=
FAIL(9.4.7.1) Devices must support a valid SetConfiguration() request=0A=
INFONow doing a Set Configuration with Configuration Value 0=0A=
ERRORSet Configuration failed for Configuration Value : 0=0A=
ERRORCould not unconfigure the device=0A=
FAIL(9.4.7.4) In the Configured state in response to the=0A=
SetConfiguration() request, the device must enter the Address state, if=0A=
the specified configuration is zero.=0A=
INFONow doing a Get Configuration=0A=
ERRORGet configuration failed=0A=
ERRORCould not Get Configuration for the device=0A=
ERRORGet device descriptor failed=0A=
ERRORCouldn't get USB Version of Device Under Test=0A=
ERRORGet number of configurations failed=0A=
ABORTCould not find an invalid Configuration Value,=0A=
FindInvalidConfigValue() returned 0 - Internal error=0A=
INFOPutting device back in Configured state=0A=
ERRORSet Configuration failed for Configuration Value : 1=0A=
ERRORSet Configuration failed with Configuration Value : 1=0A=
FAIL(9.4.7.1) Devices must support a valid SetConfiguration() request=0A=
INFONow doing a Get Configuration=0A=
ERRORGet configuration failed=0A=
ERRORCould not Get Configuration for the device=0A=
FAIL(9.4.2.2) Devices should return the non-zero bConfigurationValue of=0A=
the current configuration for the GetConfiguration() request in the=0A=
Configured state.=0A=
INFONow doing a Get Configuration=0A=
ERRORGet configuration failed=0A=
ERRORCould not Get Configuration for the device=0A=
FAIL(9.4.2.2) Devices should return the non-zero bConfigurationValue of=0A=
the current configuration for the GetConfiguration() request in the=0A=
Configured state.=0A=
INFONow doing a Set Configuration with Configuration Value 0=0A=
ERRORSet Configuration failed for Configuration Value : 0=0A=
ERRORCould not unconfigure the device=0A=
FAIL(9.4.7.4) In the Configured state in response to the=0A=
SetConfiguration() request, the device must enter the Address state, if=0A=
the specified configuration is zero.=0A=
FAILTest did not execute all required steps.=0A=
INFO=0A=
Stop time: Tue Jul  2 01:52:01 2019=0A=
INFODuration:  22 seconds.=0A=
INFOStopping Test [ TD 9.13 Set Configuration Test - Device State Addressed=
:=0A=
     Number of: Fails (7); Aborts (1); Warnings (0) ]=0A=
=0A=
Summary=0A=
=0A=
INFOTEST SUITE SUMMARY:=0A=
    [ Fails (7); Aborts (1); Warnings (0) ]=0A=
INFOTEST RESULTS:=0A=
    [ Passed (0); Failed (1) ]=0A=
=0A=
=0A=
=0A=
=0A=
BR,=0A=
Thinh=0A=
