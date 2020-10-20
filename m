Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E5A09294549
	for <lists+linux-usb@lfdr.de>; Wed, 21 Oct 2020 00:58:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2439215AbgJTW6f (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 20 Oct 2020 18:58:35 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.87.133]:57614 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2439203AbgJTW6f (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 20 Oct 2020 18:58:35 -0400
Received: from mailhost.synopsys.com (sv1-mailhost2.synopsys.com [10.205.2.132])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 67FD0C00C3;
        Tue, 20 Oct 2020 22:58:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1603234714; bh=ErTGWOCBgOaSIbc8J1peX94NfWkr9SweOYwgcD7SxeU=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=QerJHwJ1+M0zS/wkD4QyPyPt26usb+w4qNthHPIH3DpAMaOQSoftuhkGW/pIiq2u8
         H3jbDMSLsiDuU18oYqKTMct6g7OIG1h91XsF2qdqzhqWZLPdr/5FZVQ7OovPtw/Jg0
         LLdQEQmYthZS2dqTybJkDY11oYSJn31+XASgqrgTQ5/Fxg1TXpi4p/WadL/vYAZoIh
         +g9jr+qagNhXI19on35zNJs1raJTYFkYLAfwDJbJa8id0H2EZDevY/NWcv1PTAAzwQ
         lDo6Rn/fxj7bJqE9wyfimJHnpoMLlkT7o37yR4xXYeLnl/hWMKUz4HsLB+1MzvCX1T
         rQYy8cffg0g3g==
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com [10.4.161.137])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id 1A1D1A0072;
        Tue, 20 Oct 2020 22:58:34 +0000 (UTC)
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2109.outbound.protection.outlook.com [104.47.55.109])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "GlobalSign Organization Validation CA - SHA256 - G3" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id 48441800C9;
        Tue, 20 Oct 2020 22:58:33 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=thinhn@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="c/psh772";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VNLEPN7SdbUvy5Oba9bpiE/rHMYJgEV0OX5qucMAyIwmp0SJ4LXmngb9ACY0ccV54rQDz3/xoeMhc3b3IXkfWeOmYJayz6czIHYMmzhpPdTPNGLDSEGPILHiKYg+/exvBHWWLKWCDYCnWAuPk+gk5Nnd3LgD3Wq/hLG+jwDlF8hDFw++ROCm6DPkzEKQI9gf8wE5xcZ5ZQ147fMU9oSO0dAoGWVMR9z195WXf5sXzlJQG9SoWuPm/mBFcB989X+iSg45byJ+XLmvu23C2WcnAxqTxNp7OhSNtu/0cL2L5O5OAYiWaI/IRQkLRrHOSh6nYydRUq+KXA4DflQMlNILGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ErTGWOCBgOaSIbc8J1peX94NfWkr9SweOYwgcD7SxeU=;
 b=dmJBkvhVx5G/wb2ew9QA5yZdDGg/3HLcwIkZKHsyYfmPeUbJ31RBN9URtexnaGAIdiNfLJbQSiMs8GYS3/Hy4KLFl18zl6Q7NT6rTsX+QpQouCjs9IbzzTaBdrIGDjIrU9ZVL7pFcXaJG5k+3GHvHsv0MkuMjQNU0kyO+Fclqn0FgtC/Yd0VEE/MFTr2giEXGfeb2TVcfb7f6NH4Qrr496aDA09k6nH+aTLrRQ978hEp2yuFT3Fg2NwZ7r6iNjaXKPLpmGaTLFivbCKZR+K3o4NXSxEEXszsplOob3GfTqj06OFgqoAvbK2XsfokJgV8dSGO6HzAezGBsvgofrzGOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ErTGWOCBgOaSIbc8J1peX94NfWkr9SweOYwgcD7SxeU=;
 b=c/psh772VbkN8UMjPLR2Avhp09NuWMzPnGI2DYroTGX6WZDXMajdfAF8EjCWuaBUlzJqRfxf5phUSi6ovX0ZwSrG3UtOPcxwYqM+VA7Ci6tKjVnPDBRlYhcBOKY6XZ5OH/mFSrxemzdTHSb0siPDfQqZOAyHVWgTnACj+RddPqg=
Received: from BYAPR12MB2917.namprd12.prod.outlook.com (2603:10b6:a03:130::14)
 by BY5PR12MB4818.namprd12.prod.outlook.com (2603:10b6:a03:1b4::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.25; Tue, 20 Oct
 2020 22:58:32 +0000
Received: from BYAPR12MB2917.namprd12.prod.outlook.com
 ([fe80::c17e:c3dd:7cda:e2dc]) by BYAPR12MB2917.namprd12.prod.outlook.com
 ([fe80::c17e:c3dd:7cda:e2dc%4]) with mapi id 15.20.3477.028; Tue, 20 Oct 2020
 22:58:32 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Ferry Toth <fntoth@gmail.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
CC:     "felipe.balbi-VuQAYsv1563Yd54FQh9/CA@public.gmane.org" 
        <felipe.balbi-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Subject: Re: BUG with linux 5.9.0 with dwc3 in gadget mode
Thread-Topic: BUG with linux 5.9.0 with dwc3 in gadget mode
Thread-Index: AQHWo/slg1BGy5aFnEWs2vXEMG8U96mebg0AgAAaCYCAAeoFAIAAh4qAgAAZ9ACAAA2AgA==
Date:   Tue, 20 Oct 2020 22:58:31 +0000
Message-ID: <645b6ddc-d4f5-3f5b-b85f-b3d27fc365f5@synopsys.com>
References: <913dccca-500d-1938-b199-6eb67cfb60cc@gmail.com>
 <87a6wig461.fsf@kernel.org> <a565dc52-27ab-f5be-4fee-5a8f96d66456@gmail.com>
 <874kmpf583.fsf@kernel.org> <d0aca346-353c-d74e-6f00-ccd2a4ed26ef@gmail.com>
 <976cea12-e54e-fbca-6c53-e6ef5c554094@synopsys.com>
In-Reply-To: <976cea12-e54e-fbca-6c53-e6ef5c554094@synopsys.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=synopsys.com;
x-originating-ip: [98.248.94.126]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 10ae399f-1a41-438a-ce0d-08d8754baabc
x-ms-traffictypediagnostic: BY5PR12MB4818:
x-microsoft-antispam-prvs: <BY5PR12MB4818C92B8DDBB756450AAB95AA1F0@BY5PR12MB4818.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ef+IS7fT7tjJi0KbTJYZGrAsNbPCl9EmVdkwl8y8KqryBLuwxxoTC1g4QVT9QeoRCmzQ7iho3EiRM7mdgxOqI282ZEgKHVT1GkyBorheJJmWLRqsfbiLovECSUSzBw4I/kd97mHZSifoWGZI8JfMBVgOwf/trm/gfDFn/BfrveLQxqdTHq1bJF+LcMobxYTQHgzPaqrXUydnZVIMig/2MRZZw+2mxfIic5aHqdVh+ciqp4/V+V1EcVfvf9PudCtF9EJUQLqUL559LPUOCCZUCrJjxzGog0S3VKZmHYPZ4UyJuBC2jCagdDVVVMZgXtRF5yXpchME5syr0jJM5qOBz0w6/E3ZLGT13zANHthuxMR84kEJ9jpaZGBgemsUm7Bx
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB2917.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(396003)(136003)(366004)(39850400004)(316002)(478600001)(36756003)(4326008)(76116006)(66476007)(66556008)(64756008)(91956017)(110136005)(66946007)(86362001)(5660300002)(6506007)(6512007)(83380400001)(31696002)(26005)(66446008)(186003)(2906002)(6486002)(31686004)(8936002)(8676002)(2616005)(71200400001)(43740500002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: MFyyqtwREXOjTvpGfZq1FvK/ISFmkd7AjtaPQfQoABdCihw0DMQ7WVA4MPCEertq4Z0+5qSXx8Fx36VaJkW1SVSeWV37f4irtxP5ZaDe28p8Sqm/o1wrTtOwhsQWlOpaUcZ99LtvMI1ZkVsFYSuXQGDt60bITPzC8vePe9EnaK6AZbL/+hfuXvqXXjSow/ZEDxZE0cKrq1pU12rVBdBcDaR/nskkYsMj9hlJzePJvqs0IqKIITJqZxdARnOVPNFT+vFunPVobQQOehw1jpYnJ9kM+qEUG2qpy5AH4aLfM8K0TOha2AZ2B90il8+L8CHeFrWKXcJyerMMPs7bRzTUp74K9c6eWXWBTZTBOidg68PtBOszeUm40D8BmZx+fbcazj9SEkxWJx1zIT5TiBBmppD5O39eZptKaErETe7xhBgsdU4Ub5SUyhGcFqt5Zl/jhm4ADVpISVqGcGsZBpls6wzHR31B9jFkhZV9jCvYF2wm5YFf6wwwuJ+dOZnED2aZTIrkm0Q7DaJAPlg/v2ST/2CVF3nsX7YZIHr2LIkD3idtRxtLEQpm4p5btyjNCM6hd8mW1ImpwK1qcdaKnGQirXsseL9NnBAvBUOj/RD6qaCzefFl3yy3B8sluLEp2FmK+3ZwvCVtZsd4If2mBZ62Qw==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <840E2D9E0294F94D831BB0996CD34D13@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB2917.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 10ae399f-1a41-438a-ce0d-08d8754baabc
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Oct 2020 22:58:31.9353
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lLN5hc0w6u392Jufa7o1R6QjHWcU50ZxuGb1rTgO4A3DnhU6HhFal5gk/se3bp7kWLSqcZqCETUIfTnao5mdUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4818
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

VGhpbmggTmd1eWVuIHdyb3RlOg0KPiBIaSwNCj4NCj4gRmVycnkgVG90aCB3cm90ZToNCj4+IE9w
IDIwLTEwLTIwMjAgb20gMTQ6MzIgc2NocmVlZiBGZWxpcGUgQmFsYmk6DQo+Pj4gSGksDQo+Pj4N
Cj4+PiBGZXJyeSBUb3RoIDxmbnRvdGhAZ21haWwuY29tPiB3cml0ZXM6DQo+Pj4NCj4+PiA4PCBz
bmlwDQo+Pj4NCj4+Pj4+PiBbwqDCoCAxMi42NTc0MTZdIENSMjogMDAwMDAwMDEwMDAwMDAwMA0K
Pj4+Pj4+IFvCoMKgIDEyLjY2MDcyOV0gLS0tWyBlbmQgdHJhY2UgOWI5MmRlYTZkYTMzYzcxZSBd
LS0tDQo+Pj4+PiBJdCB0aGlzIHNvbWV0aGluZyB5b3UgY2FuIHJlcHJvZHVjZSBvbiB5b3VyIGVu
ZD8gRmVycnksIGNhbiB5b3UgZ2V0DQo+Pj4+PiBkd2MzDQo+Pj4+PiB0cmFjZSBsb2dzIHdoZW4g
dGhpcyBoYXBwZW5zPyBmdHJhY2VfZHVtcF9vbl9vb3BzIG1heSBoZWxwIGhlcmUuDQo+Pj4+IEkg
d2lsbCBkbyB0aGF0IHRvbmlnaHQuIElzIGZsaXBwaW5nIG9uIGZ0cmFjZV9kdW1wX29uX29vcHMN
Cj4+Pj4gc3VmZmljaWVudCBvcg0KPj4+PiBkbyBJIG5lZWQgdG8gZG8gbW9yZT8NCj4+PiB5b3Un
ZCBoYXZlIHRvIGVuYWJsZSBkd2MzIHRyYWNlIGV2ZW50cyBmaXJzdCA7LSkNCj4+Pg0KPj4+PiBC
VFcgYWZ0ZXIgcG9zdGluZyB0aGlzIEkgZm91bmQgaW4gaG9zdCBtb2RlIGR3YzMgaXMgbm90IHdv
cmtpbmcNCj4+Pj4gcHJvcGVybHkNCj4+Pj4gZWl0aGVyLiBObyBvb3BzLCBidXQgbm8gZHJpdmVy
IGdldCBsb2FkZWQgb24gZGV2aWNlIHBsdWcgaW4uDQo+Pj4gb2theQ0KPj4+DQo+PiBFaGVtLCB5
b3UgbWF5YmUgb25seSBtZSB0byBlbmFibGUgL2R3YzMvZHdjM19lcF9kZXF1ZXVlL2VuYWJsZToN
Cj4+DQo+PiByb290QGVkaXNvbjovYm9vdCMgdW5hbWUgLWENCj4+IExpbnV4IGVkaXNvbiA1Ljku
MC1lZGlzb24tYWNwaS1zdGFuZGFyZCAjMSBTTVAgTW9uIE9jdCAxOSAyMDoxNzowNCBVVEMNCj4+
IDIwMjAgeDg2XzY0IHg4Nl82NCB4ODZfNjQgR05VL0xpbnV4DQo+PiByb290QGVkaXNvbjovYm9v
dCMgZWNobyAxID4NCj4+IC9zeXMva2VybmVsL2RlYnVnL3RyYWNpbmcvZXZlbnRzL2R3YzMvZHdj
M19lcF9kZXF1ZXVlL2VuYWJsZQ0KPj4gcm9vdEBlZGlzb246L2Jvb3QjIGVjaG8gMSA+IC9wcm9j
L3N5cy9rZXJuZWwvZnRyYWNlX2R1bXBfb25fb29wcw0KPj4gcm9vdEBlZGlzb246L2Jvb3QjDQo+
PiByb290QGVkaXNvbjovYm9vdCMgWyAyNjA4LjU4NTMyM10gQlVHOiBrZXJuZWwgTlVMTCBwb2lu
dGVyDQo+PiBkZXJlZmVyZW5jZSwgYWRkcmVzczogMDAwMDAwMDAwMDAwMDAwMA0KPj4gWyAyNjA4
LjU5MjI4OF0gI1BGOiBzdXBlcnZpc29yIHJlYWQgYWNjZXNzIGluIGtlcm5lbCBtb2RlDQo+PiBb
IDI2MDguNTk3NDE5XSAjUEY6IGVycm9yX2NvZGUoMHgwMDAwKSAtIG5vdC1wcmVzZW50IHBhZ2UN
Cj4+IFsgMjYwOC42MDI1NDldIFBHRCAwIFA0RCAwDQo+PiBbIDI2MDguNjA1MDkwXSBPb3BzOiAw
MDAwIFsjMV0gU01QIFBUSQ0KPj4gWyAyNjA4LjYwODU4MF0gQ1BVOiAxIFBJRDogNzMzIENvbW06
IGlycS8xNS1kd2MzIE5vdCB0YWludGVkDQo+PiA1LjkuMC1lZGlzb24tYWNwaS1zdGFuZGFyZCAj
MQ0KPj4gWyAyNjA4LjYxNjU3MV0gSGFyZHdhcmUgbmFtZTogSW50ZWwgQ29ycG9yYXRpb24gTWVy
cmlmaWVsZC9CT0RFR0EgQkFZLA0KPj4gQklPUyA1NDIgMjAxNS4wMS4yMToxOC4xOS40OA0KPj4g
WyAyNjA4LjYyNTM1Nl0gUklQOiAwMDEwOmR3YzNfZ2FkZ2V0X2VwX2RlcXVldWUrMHg0MS8weDFj
MA0KPj4gWyAyNjA4LjYzMDU4MF0gQ29kZTogZTkgNTEgMDEgMDAgMDAgNGMgOGQgYTMgMzAgMDEg
MDAgMDAgNGMgODkgZTcgZTgNCj4+IDE1IGU2IDQyIDAwIDQ5IDhiIDRlIDQ4IDQ5IDg5IGM1IDQ5
IDhkIDQ2IDQ4IDQ4IDhkIDUxIGEwIDQ4IDM5IGM4IDc1DQo+PiAwZiBlYiAyZSA8NDg+IDhiIDRh
IDYwIDQ4IDhkIDUxIGEwIDQ4IDM5IGM4IDc0IDIxIDQ4IDM5IGQ1IDc1IGVlIDQ1IDMxDQo+PiBm
NiA0Yw0KPj4gWyAyNjA4LjY0OTMyMF0gUlNQOiAwMDE4OmZmZmZhODM4MDAyYTdjNDAgRUZMQUdT
OiAwMDAxMDA4Nw0KPj4gWyAyNjA4LjY1NDU0M10gUkFYOiBmZmZmOWE1ZjQ2MDljMDQ4IFJCWDog
ZmZmZjlhNWY0NmY0ODAyOCBSQ1g6DQo+PiAwMDAwMDAwMDAwMDAwMDAwDQo+PiBbIDI2MDguNjYx
NjY2XSBSRFg6IGZmZmZmZmZmZmZmZmZmYTAgUlNJOiAwMDAwMDAwMDAwMDAwMDA4IFJESToNCj4+
IGZmZmY5YTVmNDZmNDgxNTgNCj4+IFsgMjYwOC42Njg3OTBdIFJCUDogZmZmZjlhNWY3YmQwOWI0
MCBSMDg6IDAwMDAwMDAwMDAwMDAyZDggUjA5Og0KPj4gZmZmZjlhNWY3ZGQ2YTAwMA0KPj4gWyAy
NjA4LjY3NTkxM10gUjEwOiBmZmZmYTgzODAwMmE3ZDkwIFIxMTogZmZmZjlhNWY0NmY0ODMwMCBS
MTI6DQo+PiBmZmZmOWE1ZjQ2ZjQ4MTU4DQo+PiBbIDI2MDguNjgzMDM5XSBSMTM6IDAwMDAwMDAw
MDAwMDAwNDYgUjE0OiBmZmZmOWE1ZjQ2MDljMDAwIFIxNToNCj4+IGZmZmY5YTVmN2FkNzdlMDAN
Cj4+IFsgMjYwOC42OTAxNjVdIEZTOsKgIDAwMDAwMDAwMDAwMDAwMDAoMDAwMCkgR1M6ZmZmZjlh
NWY3ZTMwMDAwMCgwMDAwKQ0KPj4ga25sR1M6MDAwMDAwMDAwMDAwMDAwMA0KPj4gWyAyNjA4LjY5
ODI0NF0gQ1M6wqAgMDAxMCBEUzogMDAwMCBFUzogMDAwMCBDUjA6IDAwMDAwMDAwODAwNTAwMzMN
Cj4+IFsgMjYwOC43MDM5ODBdIENSMjogMDAwMDAwMDAwMDAwMDAwMCBDUjM6IDAwMDAwMDAwMzc4
MGEwMDAgQ1I0Og0KPj4gMDAwMDAwMDAwMDEwMDZlMA0KPj4gWyAyNjA4LjcxMTEwMl0gQ2FsbCBU
cmFjZToNCj4+IFsgMjYwOC43MTM1NjFdwqAgdXNiX2VwX2RlcXVldWUrMHgxOS8weDgwDQo+PiBb
IDI2MDguNzE3MjM0XcKgIHVfYXVkaW9fc3RvcF9jYXB0dXJlKzB4NTQvMHg5YSBbdV9hdWRpb10N
Cj4+IFsgMjYwOC43MjIyODldwqAgYWZ1bmNfc2V0X2FsdCsweDczLzB4ODAgW3VzYl9mX3VhYzJd
DQo+IEkgdG9vayBhIGxvb2sgYXQgaG93IHRoZSBhdWRpbyBmdW5jdGlvbiBpcyBoYW5kbGluZyBz
d2l0Y2hpbmcgYWx0ZXJuYXRlDQo+IHNldHRpbmcgYW5kIGRlcXVldWluZyBlbmRwb2ludHMsIGFu
ZCBJIHRoaW5rIEkgZm91bmQgdGhlIGlzc3VlLg0KPg0KPiBIZXJlJ3MgYSBzbmlwcGV0IG9mIHRo
ZSBmcmVlX2VwKCkgY29kZSBpbiB1X2F1ZGlvLmM6DQo+DQo+IHN0YXRpYyBpbmxpbmUgdm9pZCBm
cmVlX2VwKHN0cnVjdCB1YWNfcnRkX3BhcmFtcyAqcHJtLCBzdHJ1Y3QgdXNiX2VwICplcCkNCj4g
ew0KPiDCoMKgwqAgLi4uLi4NCj4gwqDCoMKgwqDCoMKgwqAgZm9yIChpID0gMDsgaSA8IHBhcmFt
cy0+cmVxX251bWJlcjsgaSsrKSB7DQo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBp
ZiAocHJtLT51cmVxW2ldLnJlcSkgew0KPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIHVzYl9lcF9kZXF1ZXVlKGVwLCBwcm0tPnVyZXFbaV0ucmVxKTsNCj4g
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB1c2JfZXBfZnJl
ZV9yZXF1ZXN0KGVwLCBwcm0tPnVyZXFbaV0ucmVxKTsNCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBwcm0tPnVyZXFbaV0ucmVxID0gTlVMTDsNCj4gwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIH0NCj4gwqDCoMKgwqDCoMKgwqAgfQ0KPiDCoCAu
Li4uDQo+DQo+DQo+IHVzYl9lcF9kZXF1ZXVlKCkgY2FuIGJlIGFzeW5jaHJvbm91cy4gVGhlIGR3
YzMgc3RpbGwgaGFzIG93bmVyc2hpcCBvZg0KPiB0aGUgcmVxdWVzdCB1bnRpbCBpdCBnaXZlcyBi
YWNrIHRoZSByZXF1ZXN0LiBGcmVlaW5nIHRoZSByZXF1ZXN0DQo+IGltbWVkaWF0ZWx5IGhlcmUg
d2lsbCBjYXVzZSBhIHByb2JsZW0uDQoNClRvIGNvbmZpcm0gbXkgc3VzcGljaW9uLCBjYW4geW91
IHRyeSB0aGlzIGFuZCBzZWUgaWYgeW91IHN0aWxsIGdldCBvb3BzPw0KDQpkaWZmIC0tZ2l0IGEv
ZHJpdmVycy91c2IvZHdjMy9nYWRnZXQuYyBiL2RyaXZlcnMvdXNiL2R3YzMvZ2FkZ2V0LmMNCmlu
ZGV4IGVlYzhlOWE5ZTNlZC4uYjY2ZWIyNGVjMDcwIDEwMDY0NA0KLS0tIGEvZHJpdmVycy91c2Iv
ZHdjMy9nYWRnZXQuYw0KKysrIGIvZHJpdmVycy91c2IvZHdjMy9nYWRnZXQuYw0KQEAgLTIwMzEs
NiArMjAzMSw3IEBAIHN0YXRpYyBpbnQgZHdjM19nYWRnZXRfZXBfZGVxdWV1ZShzdHJ1Y3QgdXNi
X2VwICplcCwNCsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
bGlzdF9mb3JfZWFjaF9lbnRyeV9zYWZlKHIsIHQsDQomZGVwLT5zdGFydGVkX2xpc3QsIGxpc3Qp
DQrCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCBkd2MzX2dhZGdldF9tb3ZlX2NhbmNlbGxlZF9yZXF1ZXN0KHIpOw0KwqANCivCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBkd2MzX2dhZGdldF9lcF9j
bGVhbnVwX2NhbmNlbGxlZF9yZXF1ZXN0cyhkZXApOw0KwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBnb3RvIG91dDsNCsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCB9DQrCoMKgwqDCoMKgwqDCoCB9DQoNCg0KVGhpcyB3aWxsIG1ha2UgdXNiX2VwX2Rl
cXVldWUoKSBzeW5jaHJvbm91cy4gKE5vdGUgdGhhdCB0aGlzIGlzIG5vdCB0ZXN0ZWQpLg0KDQpC
UiwNClRoaW5oDQo=
