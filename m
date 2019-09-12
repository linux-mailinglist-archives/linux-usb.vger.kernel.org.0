Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CF278B1121
	for <lists+linux-usb@lfdr.de>; Thu, 12 Sep 2019 16:29:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732607AbfILO3z (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 12 Sep 2019 10:29:55 -0400
Received: from mail-eopbgr710135.outbound.protection.outlook.com ([40.107.71.135]:27136
        "EHLO NAM05-BY2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1732598AbfILO3y (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 12 Sep 2019 10:29:54 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KKGc8j6VPqtAG0o/cKEgQ0DVzQjwpQN0eAesug9jGE+JNyEnylJ9bIjpRV/dZI+3msDbOQyBcj4pVE8akdIMwlRMu4wI9qwRnAbeloTr4xvDCYqnl2r/RoOXDfCoxQtq40XQEcT+Yejz2ACmE+c/uPA5nWLYC8tbAEjpgCmSOtkr9jRbJOTsnldq406Fkl+2Q+hfY+IdTgeZI8HoLHo+fOg88AEE3ciztfmeXoWMFoNT+ZM2Q9N9RxoAiLB6LKksJAyfgpn7EfAFW9GKIXQvC9hZcaih7IDd3fw7LrwKmScyKZrr4/zo5W4cFdtIMi8fcvDZ6napAdXqtCdAHArUCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aow6xUSZwGuoPvWxm9PtnFRF9x/1Sa+xZfC9Vyr7vPI=;
 b=a8WzqhDOcXOHlgZk1TFgXvQpGXurSnIPIllcJ/tQuIIexOBtWJaEGyWhK/Qv/V7E73Eqm7EMmAp1e8DPnVeeOF38uhQJmhqx84ru4i5Qr836KRCSiAZKdTLM7vWTayBfPaa4W17kNXBDAyvvixKy8f7Xk6C78SFulgVWINQmER3/4YXkG6W8WpabrkMhZTbk/bzasO/fOa4sg2nj1ThTo49qeq0mzcZwEyjNW0+9wbMlIMuMQTWPLe+0lYWYVwcjX8kwaiwJ4c5rdkeaM412t4sClMuWLlnhP0/pBl/afodsR4xM8k7+DS6y5Wb56giLAd6RDOh8G0ZVe0rU3hwAlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epiloglaser.com; dmarc=pass action=none
 header.from=epiloglaser.com; dkim=pass header.d=epiloglaser.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epiloglaser.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aow6xUSZwGuoPvWxm9PtnFRF9x/1Sa+xZfC9Vyr7vPI=;
 b=mh8AWz5kB6JXByB3oZhvzRXe77UTtrMGlJagdKFV8Rht9Ply3dPyd6JhUcbMIkUukt2rTtBfC3OAMYJcAs1ZMJiBw7rS67fs2sVm3yasqr6aBZjQ/LXPIPjjQAXz9Dpuce1JZdy4d/LdCxFB3r5JJqY6PynIk3sCHq1OHz1LDs0=
Received: from BYAPR20MB2501.namprd20.prod.outlook.com (20.179.158.74) by
 BYAPR20MB2391.namprd20.prod.outlook.com (20.179.156.208) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2263.15; Thu, 12 Sep 2019 14:29:51 +0000
Received: from BYAPR20MB2501.namprd20.prod.outlook.com
 ([fe80::6550:204e:b15f:6a61]) by BYAPR20MB2501.namprd20.prod.outlook.com
 ([fe80::6550:204e:b15f:6a61%5]) with mapi id 15.20.2241.022; Thu, 12 Sep 2019
 14:29:51 +0000
From:   Allen Blaylock <AllenB@epiloglaser.com>
To:     Alan Stern <stern@rowland.harvard.edu>
CC:     Manu Gautam <mgautam@codeaurora.org>,
        Peter Chen <peter.chen@nxp.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: RE: EHSET with hub and PCIe root hub
Thread-Topic: EHSET with hub and PCIe root hub
Thread-Index: AdVoIxLeoShF0bVgSnKKwHrYOWnWwgAKZ+wAAAH42gAAIn25MAAlq/6AAAAnJtA=
Date:   Thu, 12 Sep 2019 14:29:41 +0000
Deferred-Delivery: Thu, 12 Sep 2019 14:29:15 +0000
Message-ID: <BYAPR20MB250145E476D5A086285FB8B8CCB00@BYAPR20MB2501.namprd20.prod.outlook.com>
References: <BYAPR20MB2501098ADC3493845D7D2E9DCCB10@BYAPR20MB2501.namprd20.prod.outlook.com>
 <Pine.LNX.4.44L0.1909121008160.1440-100000@iolanthe.rowland.org>
In-Reply-To: <Pine.LNX.4.44L0.1909121008160.1440-100000@iolanthe.rowland.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=AllenB@epiloglaser.com; 
x-originating-ip: [65.154.97.33]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e6a40825-bcd9-4c89-7e06-08d7378dac26
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:BYAPR20MB2391;
x-ms-traffictypediagnostic: BYAPR20MB2391:
x-microsoft-antispam-prvs: <BYAPR20MB23913FFE4786D566D62415D2CCB00@BYAPR20MB2391.namprd20.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 01583E185C
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(136003)(376002)(346002)(39850400004)(366004)(396003)(199004)(189003)(316002)(80792005)(33656002)(66476007)(25786009)(2906002)(6246003)(6506007)(478600001)(66946007)(26005)(55016002)(4326008)(66556008)(6916009)(9686003)(305945005)(64756008)(14444005)(53936002)(5024004)(102836004)(256004)(2171002)(11346002)(8676002)(52536014)(7736002)(99286004)(8936002)(5660300002)(81166006)(81156014)(54906003)(486006)(76176011)(446003)(7696005)(14454004)(66446008)(76116006)(86362001)(186003)(6666004)(71190400001)(71200400001)(4744005)(6116002)(6436002)(74316002)(66066001)(3846002)(476003)(229853002);DIR:OUT;SFP:1102;SCL:1;SRVR:BYAPR20MB2391;H:BYAPR20MB2501.namprd20.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: epiloglaser.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: cDDCUjbXQDQxQKxRLUet7upLC5K/YSgxx2AT3OwxiEthYAVyzVA6fgz6HVGe9ybdhRfvxvAepv8L1c6/XTESjz1HB8BdFhQIjC4sZzy0rOdGDJu4o2EycPOqxY5FRvr/n+HfKiIMzbA2Bs5vZpCsnXN2saotwPTJoZ3R+T+kiSz4hTa91AA+AbHpuyqtxE9nNkrpj2HBMDQLuBWt+BKVBR8YYmUNxlvjewtapoUE2HhyH8L7iMu4rnEmL/3CyrtLHHpSsht3EP5e1/1lTr7iXO4W/sChDwghpe31Ezd18TI52xHr4qbkTjvgG+N/7aIof66uxfrIOttecPdNONCAsoHgYIpv5OxxGPrqpHG63x2XAJOEiPaQBwE9O8OKir8Y0VQRUAnDnONkU/zablz2RyVzz4gMpqv/sANL4VyvGZA=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epiloglaser.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e6a40825-bcd9-4c89-7e06-08d7378dac26
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Sep 2019 14:29:51.3325
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d7e01375-2074-44c0-b145-645c57a61059
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: s2zQBg+GJYEyWKyGojXbeSU0nGv3Diir7G0+AdPoWlxEZQqe24nX4+kCvUgQMqYM8CAwt0It8bAjnwMjyAetYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR20MB2391
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Thank you Alan,

I am still working through understanding the usbmon and this is a helpful h=
int. I will contact the device manufacturer and see if there is some altern=
ative method they recommend for testing.

>Most of the usbmon output shows that a device was attached to port 3 of hu=
b 2 and enumerated as usual over the course of about half a second.
>
>The very last two lines show the computer sending the hub a Set-Port-Test =
request on port 3 for test mode 4, which is Test Packet.
>The hub's response is a STALL, indicating that the hub doesn't understand =
or doesn't implement this request.
>
>Alan Stern
>
