Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B6E62B156F
	for <lists+linux-usb@lfdr.de>; Thu, 12 Sep 2019 22:32:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727397AbfILUcz (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 12 Sep 2019 16:32:55 -0400
Received: from mail-eopbgr770110.outbound.protection.outlook.com ([40.107.77.110]:55878
        "EHLO NAM02-SN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725995AbfILUcy (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 12 Sep 2019 16:32:54 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Rk8aLxcUbc5ohv7Y8jwie9YBjjm8EMDXPzb29GW+poE4zyniiWVBl3ad58iVHDjnNftYw3+UfzyLC6WPJLKYnsLFZmTlgd05ib4XOOKSFAG5QxEhHW47OKlUb3WtPLaF3r/YXdkKkzAA5+yExjA2Dg7BCIXoxn9u7Q4YDF89KCDYqmgqwUOHKdn6qI0M1FFVGvXBykIExkGt/oeRQVXnSR8w+vbQnH1Kz27OOPn3Chlftqxm8lHMsmnjq1UizZdicyk4JDmUASFOAFk7dmS3Z3j1p4E9IPXpA9QEgD1HjLaW0Vnr1y2YhSyVWmgbcb21VCUb8947EKnBgWvAJHIelg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oaKpT7rhMCo26MwHrfyPHFpPbvoYJ0heWukU+FsHwG8=;
 b=gfDwFW2d5eAuUBvYI2nsb/j1GL/ryU02RoumzCf6+e6WaKeBRr/xWwXiC03RmNZNmHBTl5m9POVkazXVh/Z9NzvczapVljf2fUcow1FX7FHubDD7S1VwfxY5cFWfL47JOaAFIGdIehWgg67O6bCxhsXsnaHt1Un2MvbSKWqcpMOzjV5HUYT5nPMzENWtqEQ/fk7lIAr3hbXNVD0FIrBFZyADoJ8PJgAiQBFSdbSQmcgGhdOS/qKogEKW65Ae1k24uAuOuztZOkCzixvmSRxldJpT2tA0SPANI/rQhi9V308Q/joIM011nECTVxWPUASNr+1N9zTKGo4K1zpv/hvHCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epiloglaser.com; dmarc=pass action=none
 header.from=epiloglaser.com; dkim=pass header.d=epiloglaser.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epiloglaser.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oaKpT7rhMCo26MwHrfyPHFpPbvoYJ0heWukU+FsHwG8=;
 b=o5YuW4nkMqELI6oJU943zkehUNgkKsdIj65cJSxJw+ldVYsZKibZAJZ7qLUF6uGINEfjeOJfnOtVVCMOSxu5ttsxyqsZ14RbQekLxBWyvFiv1XclbxCWDTr/XKfnLkKH8D0c8pBrntPrUHa8C8YvpPN4/d0EoEEUQVGDaMyfJQs=
Received: from BYAPR20MB2501.namprd20.prod.outlook.com (20.179.158.74) by
 BYAPR20MB2853.namprd20.prod.outlook.com (20.178.239.144) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2263.17; Thu, 12 Sep 2019 20:32:51 +0000
Received: from BYAPR20MB2501.namprd20.prod.outlook.com
 ([fe80::6550:204e:b15f:6a61]) by BYAPR20MB2501.namprd20.prod.outlook.com
 ([fe80::6550:204e:b15f:6a61%5]) with mapi id 15.20.2241.022; Thu, 12 Sep 2019
 20:32:51 +0000
From:   Allen Blaylock <AllenB@epiloglaser.com>
To:     Alan Stern <stern@rowland.harvard.edu>
CC:     Manu Gautam <mgautam@codeaurora.org>,
        Peter Chen <peter.chen@nxp.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: RE: EHSET with hub and PCIe root hub
Thread-Topic: EHSET with hub and PCIe root hub
Thread-Index: AdVoIxLeoShF0bVgSnKKwHrYOWnWwgAKZ+wAAAH42gAAIn25MAAlq/6AAABKNoAADCIvYA==
Date:   Thu, 12 Sep 2019 20:32:41 +0000
Deferred-Delivery: Thu, 12 Sep 2019 20:32:08 +0000
Message-ID: <BYAPR20MB2501A4FBEDBBC6353B6EC585CCB00@BYAPR20MB2501.namprd20.prod.outlook.com>
References: <Pine.LNX.4.44L0.1909121008160.1440-100000@iolanthe.rowland.org>
 <Pine.LNX.4.44L0.1909121023190.1440-100000@iolanthe.rowland.org>
In-Reply-To: <Pine.LNX.4.44L0.1909121023190.1440-100000@iolanthe.rowland.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=AllenB@epiloglaser.com; 
x-originating-ip: [65.154.97.33]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 93be54c7-18f4-496c-7e1f-08d737c0623a
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:BYAPR20MB2853;
x-ms-traffictypediagnostic: BYAPR20MB2853:
x-microsoft-antispam-prvs: <BYAPR20MB2853589D678B6E9039DD9C01CCB00@BYAPR20MB2853.namprd20.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 01583E185C
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(346002)(136003)(376002)(39850400004)(396003)(366004)(189003)(199004)(6246003)(64756008)(66556008)(66476007)(66946007)(6506007)(76116006)(66446008)(476003)(26005)(6916009)(99286004)(52536014)(80792005)(66066001)(14444005)(7696005)(76176011)(256004)(54906003)(71200400001)(5024004)(6666004)(446003)(11346002)(316002)(71190400001)(5660300002)(86362001)(305945005)(486006)(74316002)(33656002)(102836004)(186003)(7736002)(8676002)(55016002)(2171002)(3846002)(6116002)(25786009)(81156014)(81166006)(6436002)(14454004)(229853002)(53936002)(2906002)(4326008)(8936002)(9686003)(478600001);DIR:OUT;SFP:1102;SCL:1;SRVR:BYAPR20MB2853;H:BYAPR20MB2501.namprd20.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: epiloglaser.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 9RJpIRXGEiQy/p58iVNFISXsAtHaO/L2liXQEZ/iVaZu2mSV/ieTc5NsA1Yc3FEzri4czVv7ybdqiB7arupr8OZyATWS60tkTe/joyzLI1oBO85UsNKDZouHcNIr/Eb22tpyZeWzReDyTU5KloazQ6z/l7EQn3o5DDk/84yjJLe3BIK87bmbal17Y0x5/v1GlN84eZL9r+fQoQ0dhU48B/oT1BuVyr7coPNAwlx2YN7OCjtNK86R5vM4P+9OHZQCXrywnXXlwOXhXdYovgdA9aF9opCuGtGnlVpKK+bRWfZ71vRDUV410qYw7TPNx79zbuTQw5Am19CGIYwlnulcI8CSl6VRzjWJ63KarU/4RTLQC6gygPbj4mmHPrVpdgvbEeW5fxFpsWKLlyaDopDegRv97CpOLKzO+FjscMhX7tM=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epiloglaser.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 93be54c7-18f4-496c-7e1f-08d737c0623a
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Sep 2019 20:32:51.4265
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d7e01375-2074-44c0-b145-645c57a61059
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uILpqJg5O85jOtWOnlCQ7hwAilE/g/484opEerGoJrKAzHE3ZYHNI3QWi+F5KUoeP5kYZ0/c0T8VHpdYzXM2NA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR20MB2853
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

>I should add that the USB 2.0 spec includes the following text (from secti=
on 11.24.2.13):
>
>        Test mode of a downstream facing port can only be used in
>        a well defined sequence of hub states. This sequence is
>        defined as follows:
>
>        1)  All enabled downstream facing ports of the hub containing
>            the port to be tested must be (selectively) suspended via
>            the SetPortFeature(PORT_SUSPEND) request.  Each downstream
>            facing port of the hub must be in the disabled,
>            disconnected, or suspended state (see Figure 11-9).
>
>So you can see the hub probably failed the request because a non-suspended=
 device was connected to port 3.  (And who knows what was attached to the o=
ther ports -- the usbmon trace doesn't say.)
>
>Alan Stern

This was very helpful.

I was able to get the USB3503 to generate test packets by adding a SetPortF=
eature(PORT_SUSPEND) request to suspend the port before setting the PORT_TE=
ST feature. Is there a way to tell that a device is a hub but not a root hu=
b so ports on root hub ports aren't suspended prior to calling SetPortFeatu=
re(PORT_TEST)?

I tried to use hub_udev->maxchild to determine if something was a hub but t=
his appears misguided since root hubs can have multiple children, nothing e=
lse in the usb_device structure jumped out as being directly related to a h=
ub.

--- a/drivers/usb/misc/ehset.c
+++ b/drivers/usb/misc/ehset.c
@@ -62,6 +62,16 @@ static int ehset_probe(struct usb_interface *intf,
                                        NULL, 0, 1000);
                break;
        case TEST_PACKET_PID:
+               if(hub_udev->maxchild)
+               {
+                       ret =3D usb_control_msg(hub_udev, usb_sndctrlpipe(h=
ub_udev, 0),
+                                               USB_REQ_SET_FEATURE, USB_RT=
_PORT,
+                                               USB_PORT_FEAT_SUSPEND, port=
num,
+                                               NULL, 0, 1000);
+                       if (ret < 0)
+                               break;
+
+               }
                ret =3D usb_control_msg(hub_udev, usb_sndctrlpipe(hub_udev,=
 0),
                                        USB_REQ_SET_FEATURE, USB_RT_PORT,
                                        USB_PORT_FEAT_TEST,
