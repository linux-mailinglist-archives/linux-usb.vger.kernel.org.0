Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EBA63AF2C0
	for <lists+linux-usb@lfdr.de>; Wed, 11 Sep 2019 00:02:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726171AbfIJWC3 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 10 Sep 2019 18:02:29 -0400
Received: from mail-eopbgr780135.outbound.protection.outlook.com ([40.107.78.135]:44265
        "EHLO NAM03-BY2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725856AbfIJWC3 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 10 Sep 2019 18:02:29 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hvNAsdzmZWJlS5JENWxn1ZauVfUDt/Trq7Yx0TG902MoPeULW8aEbBuQjkQVdvLDVH0DYaZo5dBX+oyCmXbC/xDmq7nZUaonNXd93/bejw1/7l3lhhnw7I0SoJ27qIDiaERH6kw9lSr8l0xcdWqmKAdOrS07If3mo/6bu2IKR7uG3QfQwPAo3o6ysE0n9E2zGbRdOculeM0VBz2V26MMSmFLmlJBwYhE+lDqABD5rPA35vH3lO6bwzUVYG8lUUxYtc6+86Ex7D/YVTCheS1F1sgO4nOKf4FIoVoOcEsIJHUBoO0edUutbyYze7wxu8Ol2LdoazezXwALk4JYM3QUsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oIkDi6iJoL+uVRNLISQSZ3lgLFLS6lkDUDq4/rR4OCo=;
 b=QP4tNJNJKW7rnUOjD0Wh7CyG1M8GaCWvCznFHHJf0IA3v7v7VrbVJexY61aBowm3oCqiWAuUpQMB17vL5u8RgxQ4LON2tJxMms51umhqtQkmvCVvctRkCCiOt4WEoEfzJaN8lgKyfbdQClKarB2HRvxQ+vhgEHtb92TUs9v8JML0P/dI3Yz4AMrZ8O5PJ+1NRHUwi6mM4UjVFl7ObCdTrG6WemLbo/OJRii8G7CbWk7sMiKsSTfB5eK4UEDRDoWXC2aTHRHkwiZ64PAIhhsIP+yJqdD/pFnSeMKzNGrnXqvyuLh4Sih15V4KyIFb1CgOOgPXlnNXDiChE9X4jKR5/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epiloglaser.com; dmarc=pass action=none
 header.from=epiloglaser.com; dkim=pass header.d=epiloglaser.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epiloglaser.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oIkDi6iJoL+uVRNLISQSZ3lgLFLS6lkDUDq4/rR4OCo=;
 b=BiY/qw3iChqrDFMwlciEpg0gph2O8WmJOv/wSFffGxDNzKQvV0N+fPg4b3IUiWL4lW/5N1JesvPyoH+C56vy69l42DTJsLFacyJUNuAxe6zKwrvoDXjeRtVM/0WjKpH1Ki7Q1Y+zw3A1KxitOpOwtJlFwWBwxH8nCiaJn4pK5p8=
Received: from BYAPR20MB2501.namprd20.prod.outlook.com (20.179.158.74) by
 BYAPR20MB2646.namprd20.prod.outlook.com (20.178.236.209) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2241.18; Tue, 10 Sep 2019 22:02:25 +0000
Received: from BYAPR20MB2501.namprd20.prod.outlook.com
 ([fe80::6550:204e:b15f:6a61]) by BYAPR20MB2501.namprd20.prod.outlook.com
 ([fe80::6550:204e:b15f:6a61%5]) with mapi id 15.20.2241.018; Tue, 10 Sep 2019
 22:02:25 +0000
From:   Allen Blaylock <AllenB@epiloglaser.com>
To:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: EHSET with hub and PCIe root hub
Thread-Topic: EHSET with hub and PCIe root hub
Thread-Index: AdVoIxLeoShF0bVgSnKKwHrYOWnWwg==
Date:   Tue, 10 Sep 2019 22:01:58 +0000
Deferred-Delivery: Tue, 10 Sep 2019 22:01:09 +0000
Message-ID: <BYAPR20MB25012D076C3D44E07BA32C89CCB60@BYAPR20MB2501.namprd20.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=AllenB@epiloglaser.com; 
x-originating-ip: [65.154.97.33]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 68b412c9-ebab-42fc-9188-08d7363a90ae
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:BYAPR20MB2646;
x-ms-traffictypediagnostic: BYAPR20MB2646:
x-ms-exchange-purlcount: 2
x-microsoft-antispam-prvs: <BYAPR20MB264624A6E5B2E02FAD907132CCB60@BYAPR20MB2646.namprd20.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 01565FED4C
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(396003)(366004)(136003)(39850400004)(376002)(346002)(199004)(189003)(5660300002)(7736002)(305945005)(81156014)(81166006)(25786009)(486006)(966005)(2351001)(6506007)(102836004)(8676002)(80792005)(478600001)(8936002)(64756008)(476003)(14454004)(99286004)(316002)(74316002)(19625735003)(66446008)(66476007)(66946007)(2906002)(6916009)(76116006)(7696005)(86362001)(2501003)(66556008)(6436002)(186003)(52536014)(71190400001)(71200400001)(6116002)(9686003)(5640700003)(3846002)(6306002)(55016002)(6666004)(53936002)(256004)(33656002)(66066001)(14444005)(26005);DIR:OUT;SFP:1102;SCL:1;SRVR:BYAPR20MB2646;H:BYAPR20MB2501.namprd20.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: epiloglaser.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: tht1pu/LKFyHj2D7Af2gb6zH3FpeFyEbSH+WY5X4+befWdcCI4ANXbCXL3mRb3JjKWeQYAsvfxcsj6OcNXzU/ZAMH09MKLxHR2ht7sDLr9VspRvn8z4hQTRJ5gx5LaoTAmKRRLNnT013ANjqD1tD3pf/jvb0poyD4OPzDPE/Bn1h/26VpUpSOyRlMo++2TpUWHWUzDQdjAL+WO7SRa22NWEF8I7TPI/B2qzkVE8KvztG+EdeKH8Yl3hs/Tln4g23fMwgAl5R134obj5kgnDk4z3WYcnTGRZA8BZYy8m7jYDUstrDlUgzTwerZRu8yD3qaGu0jvJNMQmFMHFvvxpn1gcrnjrf6nH19oyO9GLE5GYPFbRAg/GeoF0fv5js3ebexPGwjty8DSFcSUyrJw5DuEyuekx5bKU1IDgGEP6ZmJw=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epiloglaser.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68b412c9-ebab-42fc-9188-08d7363a90ae
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Sep 2019 22:02:25.8597
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d7e01375-2074-44c0-b145-645c57a61059
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UpGvOnyF+iN16YG2bd8DzxEDFCTvxR+wAQww1qc3dVxK94e+2JiCKLj0NhAc7lHkZ8ewfO5jMC3XtrxLLTF/nw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR20MB2646
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

I am trying to validate the USB on an embedded platform based on the NXP i.=
MX7.=20
So far I have only been able to validate root ports on the board but also h=
ave a
PCIe xhci controller and a microchip USB3503 hub off of the HSIC port on th=
e=20
SoC which I would like to run the tests on.=20

I have reviewed the mailing list archives and found another discussion of u=
sing
the EHSET driver to validate a driver and they reference the same issue I a=
m=20
seeing. When I plug in the device I see=20
usb_ehset_test: probe of <port path> failed with error -32
for either the PCIe root hub or the USB3503 HSIC hub.

Further down in the mailing list chain Peter Chen states=20
> Besides, do not connect HUB between your host board and emulation board=20
> (for sending VID/PID).
but there is no additional information regarding this statement. Looking ar=
ound
it looks like the hubs have some mechanism for being tested[0] and the HSET=
T=20
application for Windows supports testing of hubs according to the=20
documentation.[1]

Is this something there exists a module for or are either of these cases
unexpected behavior for the EHSET kernel module?

Allen

[0] http://www.testusb.com/Hub_test.html
[1] https://usb.org/sites/default/files/HSETT_Instruction_0_4_1.pdf

