Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8DB15135D6D
	for <lists+linux-usb@lfdr.de>; Thu,  9 Jan 2020 17:03:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732779AbgAIQDT (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 9 Jan 2020 11:03:19 -0500
Received: from mail-eopbgr80041.outbound.protection.outlook.com ([40.107.8.41]:64071
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729905AbgAIQDS (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 9 Jan 2020 11:03:18 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f0gcpVTDgrPOHnEf9Fn7+JZ94K8MaNOLNs1ZuuK8cW59ryF4VV4ZRsP+ZAYhBLX0/Uuc10e82VZvbz6AfuT9MKwAswJNzBfYS9/mV+CaRWpJbhXFjjp/ypHhAppZQxJzXXGRlAjxmQeOFrqcWarLnTmvrTH4rYQ+n6wP8bZE0MEvyu3sxQJUUASWVtR4gJv5inFF8a5L9d+nUySWMEGKrQ4tWme9G9UzsbTChK3My7ZkRngUGTSOx2U9fOF5mkRMJA0Re1XgYdq1q8ib0Qx0WvVkUX7gKYV+8bKxfQm4HA2zkrNyj1smVtI2rS0I/gi9YvDAkOQrZ84C59RGmpXcRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DOSehktaxzE1PH+tCJsRTm3l+op7zYQBv5+9B/bEFQI=;
 b=d8IdUvmhVHndS0Vzh/pcktI63aLFAFZOO5io2Km5IkVHkcIJHmA6omZg34MiXNEoko5gUB2PnumDxtH5zOZv94+0ig4xxXqRpVEeU+lw8rRcLKC2zLJifNCi+2En0T9iZY6aaSNc4+dvIBkdsIZDgOt+XiGHzaw9ed7Fu4Dgy+9qU37BNlX91c/TQ5wzBbx9hCh6UIhp4xRNOeI8aaqUB7QGZGgs3ztyqhkV+VN3oRf9+R7vlhvYL0KSt53/zMkrx128Cj5e70i/FmJ4tkupQnC3PbpgePC7TBPYmvKnNvkIpgGGchtXjA2FYm20wApM12NujwqSj4/akyL1thgiVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quamotion.mobi; dmarc=pass action=none
 header.from=quamotion.mobi; dkim=pass header.d=quamotion.mobi; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quamotion.onmicrosoft.com; s=selector2-quamotion-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DOSehktaxzE1PH+tCJsRTm3l+op7zYQBv5+9B/bEFQI=;
 b=ESaJIrk9eT1cCsSKegBsp0O4yd9g+YJy2sfInqxbJPEp/PEf/Vb3z8YnaYLo1+MPWPts6aF9HWYPDKjX05/ALOQlKgoxFT2hb2nrdkspihROHCE9MGdQ9SyAjw3FwbmpaPz7j8cUR6FpGdGWS0Vj6kMGv3PqVtx721ba0zZIK8Q=
Received: from HE1PR05MB3515.eurprd05.prod.outlook.com (10.170.247.151) by
 HE1PR05MB3356.eurprd05.prod.outlook.com (10.170.242.22) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2623.9; Thu, 9 Jan 2020 16:03:13 +0000
Received: from HE1PR05MB3515.eurprd05.prod.outlook.com
 ([fe80::e5e0:7e32:a799:d4fd]) by HE1PR05MB3515.eurprd05.prod.outlook.com
 ([fe80::e5e0:7e32:a799:d4fd%6]) with mapi id 15.20.2602.018; Thu, 9 Jan 2020
 16:03:13 +0000
From:   Frederik Carlier <frederik.carlier@quamotion.mobi>
To:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
CC:     "marc.zyngier@arm.com" <marc.zyngier@arm.com>
Subject: Renesas uPD720202 controller fails when iommu=on
Thread-Topic: Renesas uPD720202 controller fails when iommu=on
Thread-Index: AdXHBCAKPCqA/ulUT4a/+qj5JvvLnw==
Date:   Thu, 9 Jan 2020 16:03:13 +0000
Message-ID: <HE1PR05MB3515FB3878D80413BFA8240DEA390@HE1PR05MB3515.eurprd05.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=frederik.carlier@quamotion.mobi; 
x-originating-ip: [194.78.96.162]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9465cc32-3653-4525-86e9-08d7951d6e73
x-ms-traffictypediagnostic: HE1PR05MB3356:
x-microsoft-antispam-prvs: <HE1PR05MB3356D34F3029FEA72C53DA79EA390@HE1PR05MB3356.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 02778BF158
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(39830400003)(136003)(376002)(346002)(396003)(366004)(189003)(199004)(9686003)(55016002)(316002)(2906002)(8936002)(4326008)(81166006)(81156014)(64756008)(66556008)(66946007)(6916009)(508600001)(33656002)(186003)(8676002)(66446008)(26005)(76116006)(966005)(66476007)(5660300002)(71200400001)(7696005)(52536014)(44832011)(6506007)(86362001);DIR:OUT;SFP:1101;SCL:1;SRVR:HE1PR05MB3356;H:HE1PR05MB3515.eurprd05.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: quamotion.mobi does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: eaB7kvHQRQ8sPCmkQ4i8D4MosUwAwyFpGln0EIwslWXQy/lh4oR3GwHffdoCuCJ02VznnGGhbI5VjA5SASE4+P9tEL2VZOaggacOxztvswVERpCgZO6+IivBmv9lKP/fHREv5GPtuyoo8RYm/gAwrDR5xa3xdsVT9Qz8uHhNFxIQ2mI/KWy+IoIHfNnQOSaSFstSlYFc7CnVXA2vfJW0xfUAJ8v+7iEOZ8tT8gGWKrxsDb3MOEp/ZrSqkTQzgj7MtW2mc3k7W1zhm//vMp9WCDeCa2DsIFLTUYa6HYve6ElrCQPqK1i8HaS4nTRrK5No8PTc4Y6sMBHC2j0vTvnMmW0Zk3bQhunmuXwBPP1IFsNgNxk7u1mbdhk/IAGtmBo39GgOYg3qDevTGmVTeVdDs1E8GG8Mi9mCoU/Th3NOK2CFTNyhxfNa8fr7VHpeOCrH+6tlhYMvf9MN56GRY548tjWv1hxEZuLEwRF0XNjjO17pqq7MP47C3YjMe5xBSWpFHZ42j319ZjVJ2/ybI4fhWw==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: quamotion.mobi
X-MS-Exchange-CrossTenant-Network-Message-Id: 9465cc32-3653-4525-86e9-08d7951d6e73
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jan 2020 16:03:13.4400
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: dec92e2e-4ae5-40e9-bbcd-fb7fcb864229
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RvshZC+yVWX/08Ic6PVuh0D4YXilYQcjPm6jY5WctWWTjlwbXOGdZ3GAYmWpYCwT7P+N+c1caLQhyIu2tloF98F7eNeHpCPtPLWV3mcZmJ0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR05MB3356
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello,

I have a StarTech PEXUSB3S44V PCI card with 4 Renesas uPD720202 controllers=
 on it.
The card I have comes with a ROM module, which contains a vendor specific c=
onfiguration data block (see section 6.3.2 of the manual) and firmware vers=
ion 2.0.2.6 (the most recent firmware version I know of).

The USB controllers work correctly when IOMMU is disabled and fail to initi=
alize when iommu=3Don, on various kernel versions, including 4.4, 4.11, 4.1=
2, 4.17, 5.0 and 5.3.
This controller is known to have problems when IOMMU is enabled and there h=
ave been two kernel patches [1], [2] to work around this problem.

I have captured dmesg output [3], which seems to indicate the card becomes =
unresponsive.

I have also observed that the procedure to read data from ROM [4]:
- Works when the kernel is running without IOMMU support
- Works whenever I unload the xhci_hcd driver and issue a PCI reset
- Does not work (in particular, the status code is never reset in DATA1) wh=
en the kernel is running with IOMMU support and the xhci_hcd driver is boun=
d to the controller.

I am wondering whether there are any additional steps I could take to troub=
leshoot this issue? The original issue with the uPD720202 controllers with =
IOMMU enabled seem to be that the controller is accessing invalid memory re=
gions.
Is there any way I can verify whether this causes the problem I'm seeing, o=
r whether there's another issue at play here?

I apologize if this is the wrong forum for this question.

Thanks,

Frederik.

[1] https://github.com/torvalds/linux/commit/8466489ef5ba48272ba4fa4ea9f8f4=
03306de4c7
[2] https://github.com/torvalds/linux/commit/12de0a35c996c3a75d050bff748815=
db3432849c=20
[3] https://bugzilla.kernel.org/attachment.cgi?id=3D286707=20
[4] http://billauer.co.il/blog/2015/11/renesas-rom-setpci/=20
