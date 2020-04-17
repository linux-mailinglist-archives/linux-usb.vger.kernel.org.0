Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC4AA1AD955
	for <lists+linux-usb@lfdr.de>; Fri, 17 Apr 2020 11:01:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729988AbgDQJAx (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 17 Apr 2020 05:00:53 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.73.133]:54584 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729974AbgDQJAw (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 17 Apr 2020 05:00:52 -0400
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com [10.192.0.17])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id E18984019C;
        Fri, 17 Apr 2020 09:00:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1587114052; bh=bmon4fshusTeTNlKsEFwBtZSTJ8QTlYYruW5pSqhxv8=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=T1XQt/aWMtXRgS7w/Zk0WKKnkifocHTM5bgHmX87jLD3ryZ4icItcKncNW+0C8kDQ
         N4wpOhSJarUJEJ28JLu82Ul4869ti+1ldT7TCM0w6cd+t2Oam8Hn1EEkl1LDgD/wfw
         BDVqUy9sHpjrem65zRiRkirpSQrQK5dQ9j7pccfF2zYm2PSnL9wws4DfAZqOKxWbzF
         78mfVaMKmtIYEn5uBhlKGYknx3/qr9jJUbE5b26QmZdJq94RNL/acdwxVpjK9K4ABP
         FG0y6vbadm4aa0Ah/wt2RvRtWbSp0K4oFW/OLf+lAYXYfquFpQcWwpEGB3eIcDJDtS
         Z4H4NQ44MBIKQ==
Received: from US01WEHTC3.internal.synopsys.com (us01wehtc3.internal.synopsys.com [10.15.84.232])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id 9FC41A0083;
        Fri, 17 Apr 2020 09:00:50 +0000 (UTC)
Received: from us01hybrid1.internal.synopsys.com (10.200.27.51) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Fri, 17 Apr 2020 02:00:46 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.200.27.51) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Fri, 17 Apr 2020 02:00:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fbw6ZPZP1AXkaozqcMrV6eSSl2UpmwGLTTLjVjbpCoiRw9+X4oLAhmHLB+3JlA6k5BzpC/TivBP6Y7XmlPe6wvCHmU4qB8LkiARFJjMoFtbaQtsa8VehwdYoRaCGLOHJbrOLPOv7GVEQoCuLxUc2Bh93kHzuI6ibAVN4bgGMoEFILCGbzrwIvOAko3vXCpa3zbEQp7RuTZJNdFKwqu0X1WS8jnnBqsTs7QFscjbazwkOb90iFs6uzDjYfGmA/cLyJgkJd5cEzMoHslz4/dDFwuRm6BwtxiFB12Dxfq5bwJXAJ8XQTKkz8bHJV2ra8rNcCbiGzzXf4Sk/vffWQ0qbKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bmon4fshusTeTNlKsEFwBtZSTJ8QTlYYruW5pSqhxv8=;
 b=D6SIawPRb8RutfHVpnpAkXnA5D0naEedhWVBPZH7GqPWlm9MId7kdBtj0BYPdjLU7M1VeuipV61PmRqny5j7a2noxXHtGBkk1zUabY7dNQ0fX7g9BAOnSIGOZNlydv5ozob2RilGY3Cj7sm9RhJJ554F/QufJS9E/KPGyE/FuMduuHey1oU0qoKmoBuPg8oOuabgUQxvwrMeBafZruu8GaVRSjtqucRbbg3ltWmuTr5WvbBJRq29eWqdZpYXSDcmlAIDws4We3fXmbFMy8K30bFqsRrMDk6WrvFFchNNAgqug+fZzEzkxDMPC6csRJ9vrTTFPXxk/JCCKD66noUpdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bmon4fshusTeTNlKsEFwBtZSTJ8QTlYYruW5pSqhxv8=;
 b=FnzyDwKfcRzCkKJpNrd+K0thyMQRY+RSTqBuItopYNfRybM3lcLGsbn3R9acL6eWWlmbDPEHn/6seDw/PkmPPxUhA18tnVHM06AvsV4I3hRRgF19yFtODnBZSxIr2SYh/NFd2RYDM9wBEYtrnplO022g8sOzvgp3x4wDp8QuAXw=
Received: from SN1PR12MB2557.namprd12.prod.outlook.com (2603:10b6:802:22::15)
 by SN1PR12MB2383.namprd12.prod.outlook.com (2603:10b6:802:26::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2900.26; Fri, 17 Apr
 2020 09:00:43 +0000
Received: from SN1PR12MB2557.namprd12.prod.outlook.com
 ([fe80::20d2:fe98:5580:932d]) by SN1PR12MB2557.namprd12.prod.outlook.com
 ([fe80::20d2:fe98:5580:932d%7]) with mapi id 15.20.2900.028; Fri, 17 Apr 2020
 09:00:43 +0000
From:   Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
To:     Marek Vasut <marex@denx.de>,
        Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
CC:     Amelie Delaunay <amelie.delaunay@st.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: Re: [PATCH] [RFC] usb: dwc2: Run the core connect in dwc2_hcd_init()
Thread-Topic: [PATCH] [RFC] usb: dwc2: Run the core connect in dwc2_hcd_init()
Thread-Index: AQHWEaBFUZHLydAVY0yALpZJ1gABx6h3ITiAgAACTgCAAAlrgIAAGd8AgADukoCAAFTigIABVJ4AgABprwCAAAQ1gIABN86AgABAc4CAAA8qAIABNeYA
Date:   Fri, 17 Apr 2020 09:00:43 +0000
Message-ID: <ebb175be-edc1-892f-4537-a7402fd4460e@synopsys.com>
References: <20200413143107.181669-1-marex@denx.de>
 <31b679d3-d3e4-0220-ec4b-58eada4d21d4@synopsys.com>
 <b20fb33d-7fdd-5785-8f72-74900eb4d328@denx.de>
 <9906c2da-8a20-eae7-d69e-6947085edf84@synopsys.com>
 <b64f41ac-2d70-55a3-ab6a-77383cd463eb@denx.de>
 <d1b36da4-b506-2f86-f5ad-95bf3aac4485@synopsys.com>
 <c35e95cf-7f72-4a49-a0e1-efc0701d613d@denx.de>
 <867a776d-1e2c-2207-4387-072d2a8423fb@synopsys.com>
 <a6d681c5-d5fa-51d8-a320-6f6e9844c93a@denx.de>
 <4b4478aa-85bd-c05c-b5d0-e11dc35eb623@synopsys.com>
 <6ea2270d-19a4-7e8b-42fb-37a4a9d81e1f@denx.de>
 <8fb53f3a-a02b-3c53-0d9d-22b707bda786@synopsys.com>
 <671f36e3-367e-bcdf-0da7-f7ad82cf6284@denx.de>
In-Reply-To: <671f36e3-367e-bcdf-0da7-f7ad82cf6284@denx.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=hminas@synopsys.com; 
x-originating-ip: [37.252.80.117]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0201914e-5038-4826-8d7b-08d7e2adcf95
x-ms-traffictypediagnostic: SN1PR12MB2383:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SN1PR12MB2383F99739A499D09F9CEC04A7D90@SN1PR12MB2383.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0376ECF4DD
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN1PR12MB2557.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(10019020)(39860400002)(366004)(136003)(376002)(346002)(396003)(2906002)(8676002)(8936002)(31696002)(36756003)(478600001)(71200400001)(6512007)(86362001)(186003)(66556008)(6486002)(53546011)(81156014)(966005)(66446008)(31686004)(26005)(66476007)(2616005)(64756008)(91956017)(4326008)(5660300002)(110136005)(54906003)(76116006)(316002)(66946007)(6506007);DIR:OUT;SFP:1102;
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 7NIHaHYTTZPaGPbNCrFJWnY0fCez5pgm0tFbEb91Lv4bQYIWXURFz76b2nQowfDbIB+yHpeEtJvIodneEqEFQZAw1ULXkCtA/AbiS9xLJ7t0q8ed3nLeYhciIqy1xg2CFT5BySqqrxDzizOesKRHchohT8HfeiGW1nWA3Rmxpdook1Agslmon6tc3fJeBRlBvbnCamk+w1quZMYi8NpBKmqXER+y9ySPwF1kZQNJ1eSwK8yGYv4sfVN/bX6QYowjoctKlSxBR5gfAzzNeUxADAwsnmsVAjNFNwsfHdLZk6wFXuQ1ixORgt71rh1F7aW4pWBbXJWdXjSFu9HLtHNuP1J+ff60nITtVGr2RlPhMVjFxp0APYvM+grkL3FtT/6rUGfmY/bD5soBKy/rkehcYD7ZCrazI2AlolAYS9cN3llxZFOTasIeBUWWuixtReHRLIDEh2x5HKXyapQ48HDs5guBrz54KnOGmpv+Hlc1hDD0chntDYxIphgUBUA9kzZka8gL6BdsBgAPKd6XaDp6tA==
x-ms-exchange-antispam-messagedata: em0zXTMJ20tAU33+mfbcZHhcbbB28np8jTUi3nZoDfiL+pC1E2ZE6k9FnvkN3tXv3GGTHf64MtI3i1YvZaXIOwxY3fZyARFKbnQ0QCk7Qk06HYy/xzofdIW+5QaaDY10iKO8UAsiWUFjFghUENUR5w==
Content-Type: text/plain; charset="utf-8"
Content-ID: <3FC9104F72DC804094F57F0AF054FD07@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 0201914e-5038-4826-8d7b-08d7e2adcf95
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Apr 2020 09:00:43.5589
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: E2ztYr/Yp4ngJHv4KKdBDtyPApsvN6D6QuV5UHqZ6dCeWcOKuC+b4hvo7fFyANi4lzMzvjTYm/F7UuLjUeMcjA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR12MB2383
X-OriginatorOrg: synopsys.com
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

SGksDQoNCg0KT24gNC8xNi8yMDIwIDY6MzEgUE0sIE1hcmVrIFZhc3V0IHdyb3RlOg0KPiBPbiA0
LzE2LzIwIDM6MzcgUE0sIE1pbmFzIEhhcnV0eXVueWFuIHdyb3RlOg0KDQo+PiBPciBpbnN0ZWFk
IG9mIHBhdGNoLCBpZiB5b3UgaGF2ZSBhbnkgdXRpbGl0eSBpbiBzeXN0ZW0gd2hpY2ggd2lsbCBh
bGxvdw0KPj4gZnJvbSBjb21tYW5kIGxpbmUgY2xlYXIgc29mdCBkaXNjb25uZWN0IGJpdCBmcm9t
IERDVEwgcmVnaXN0ZXI/IE9mZnNldA0KPj4gb2YgRENUTCByZWdpc3RlciBpcyAweDgwNC4gU29m
dERpc2NvbiBiaXQgbnVtYmVyIGlzIDEuIENsZWFyIHRoaXMgYml0DQo+PiBhbmQgdGhlbiBwbHVn
IGNhYmxlLg0KPiANCj4gQ2xlYXJpbmcgdGhhdCBiaXQgd2l0aCBkZXZtZW0gYWxsb3dzIHRoZSBo
b3N0IFBDIHRvIGRldGVjdCBzb21lDQo+IGhpZ2gtc3BlZWQgZGV2aWNlIGdvdCBjb25uZWN0ZWQs
IGJ1dCB0aGF0J3MgaXQsIGl0IGRvZXMgbm90IGRldGVjdCBpdCBhcw0KPiBhIGdhZGdldCBhbmQg
bm8gY29tbXVuaWNhdGlvbiByZWFsbHkgaGFwcGVucy4NCj4gDQoNClBsZWFzZSBwcm92aWRlIHBh
cnQgb2YgZGVidWcgbG9nIG9uIGFib3ZlIG1lbnRpb25lZCBzY2VuYXJpby4NCg0KPj4gVW5mb3J0
dW5hdGVseSwgY3VycmVudGx5IEknbSB3b3JraW5nIGZyb20gaG9tZSBhbmQgY2FuJ3QgcmVtb3Rl
bHkNCj4+IGNvbm5lY3QvZGlzY29ubmVjdCBjYWJsZSBpbiBsYWIgdG8gdHJ5IHRvIHJlcHJvZHVj
ZSBvYnNlcnZlZCBieSB5b3UgaXNzdWUuDQo+IA0KPiBNYXliZSB5b3Ugc2hvdWxkIGNvbnNpZGVy
IHVzaW5nIHNvbWV0aGluZyBsaWtlIHRoaXMgaW4gdGhlIGxhYjoNCj4gaHR0cHM6Ly91cmxkZWZl
bnNlLmNvbS92My9fX2h0dHBzOi8vd3d3LnRpLmNvbS9wcm9kdWN0L1RTM1VTQjMwX187ISFBNEYy
UjlHX3BnIU85c0JWUzNxYWg5clc1N2NjdzBjVF84dno1ZncwS3UzS19adE5MdUwyTE5lejRfQUdG
NndQMlpvS1kyTkY3eVoydkVmam1kZyQNCj4gDQpUaGFua3MgZm9yIGFkdmlzZS4gSSdsbCBidXkg
YW5kIHNldHVwIG11bHRpcGxleGVyIGxhdGVyLCBiZWNhdXNlIA0KY3VycmVudGx5IEknbSBvbiBx
dWFyYW50aW5lIGFuZCBjYW4ndCB2aXNpdCBvZmZpY2UuDQo+IFsuLi5dDQo+IA0KPiAgIGR3YzIg
NDkwMDAwMDAudXNiLW90ZzogbWFwcGVkIFBBIDQ5MDAwMDAwIHRvIFZBIDQ3MzM1MmYxDQo+ICAg
ZHdjMiA0OTAwMDAwMC51c2Itb3RnOiBtYXBwZWQgUEEgNDkwMDAwMDAgdG8gVkEgOTIzNzYxY2IN
Cj4gICBkd2MyIDQ5MDAwMDAwLnVzYi1vdGc6IHN1cHBseSB2dXNiX2Qgbm90IGZvdW5kLCB1c2lu
ZyBkdW1teSByZWd1bGF0b3INCj4gICBkd2MyIDQ5MDAwMDAwLnVzYi1vdGc6IHN1cHBseSB2dXNi
X2Egbm90IGZvdW5kLCB1c2luZyBkdW1teSByZWd1bGF0b3INCj4gICBkd2MyIDQ5MDAwMDAwLnVz
Yi1vdGc6IHJlZ2lzdGVyaW5nIGNvbW1vbiBoYW5kbGVyIGZvciBpcnE0OA0KPiAgIGR3YzIgNDkw
MDAwMDAudXNiLW90ZzogZHdjMl9jb3JlX3Jlc2V0KCkNCj4gICBkd2MyIDQ5MDAwMDAwLnVzYi1v
dGc6IENvcmUgUmVsZWFzZTogMy4zMGEgKHNucHNpZD00ZjU0MzMwYSkNCj4gICBkd2MyIDQ5MDAw
MDAwLnVzYi1vdGc6IEZvcmNpbmcgbW9kZSB0byBob3N0DQo+ICAgZHdjMiA0OTAwMDAwMC51c2It
b3RnOiBXYWl0aW5nIGZvciBob3N0IG1vZGUNCj4gICBkd2MyIDQ5MDAwMDAwLnVzYi1vdGc6IEhv
c3QgbW9kZSBzZXQNCj4gICBkd2MyIDQ5MDAwMDAwLnVzYi1vdGc6IEZvcmNpbmcgbW9kZSB0byBk
ZXZpY2UNCj4gICBkd2MyIDQ5MDAwMDAwLnVzYi1vdGc6IFdhaXRpbmcgZm9yIGRldmljZSBtb2Rl
DQo+ICAgZHdjMiA0OTAwMDAwMC51c2Itb3RnOiBEZXZpY2UgbW9kZSBzZXQNCj4gICBkd2MyIDQ5
MDAwMDAwLnVzYi1vdGc6IENsZWFyaW5nIGZvcmNlIG1vZGUgYml0cw0KPiAgIGR3YzIgNDkwMDAw
MDAudXNiLW90ZzogTm9uUGVyaW9kaWMgVFhGSUZPIHNpemU6IDMyDQo+ICAgZHdjMiA0OTAwMDAw
MC51c2Itb3RnOiBSWEZJRk8gc2l6ZTogMjU2DQo+ICAgZHdjMiA0OTAwMDAwMC51c2Itb3RnOiBF
UHM6IDksIGRlZGljYXRlZCBmaWZvcywgOTUyIGVudHJpZXMgaW4gU1BSQU0NCg0KPiAgIGR3YzIg
NDkwMDAwMDAudXNiLW90ZzogYm91bmQgZHJpdmVyIHplcm8NCj4gICBkd2MyIDQ5MDAwMDAwLnVz
Yi1vdGc6IGR3YzJfaHNvdGdfcHVsbHVwOiBpc19vbjogMSBvcF9zdGF0ZTogMA0KDQo+ICAgZHdj
MiA0OTAwMDAwMC51c2Itb3RnOiBEQ0ZHPTB4MDgxMDAwMDAsIERDVEw9MHgwMDAwMDAwMiwgRElF
UE1TSz0wMDAwMDAwMA0KPiAgIGR3YzIgNDkwMDAwMDAudXNiLW90ZzogR0FIQkNGRz0weDAwMDAw
MDAwLCBHSFdDRkcxPTB4MDAwMDAwMDANCj4gICBkd2MyIDQ5MDAwMDAwLnVzYi1vdGc6IEdSWEZT
SVo9MHgwMDAwMDQwMCwgR05QVFhGU0laPTB4MDQwMDA0MDANCj4gICBkd2MyIDQ5MDAwMDAwLnVz
Yi1vdGc6IERQVHhbMV0gRlNpemU9MTAyNCwgU3RBZGRyPTB4MDAwMDA4MDANCj4gICBkd2MyIDQ5
MDAwMDAwLnVzYi1vdGc6IERQVHhbMl0gRlNpemU9MTAyNCwgU3RBZGRyPTB4MDAwMDBjMDANCg0K
RG8geW91IHVzZSB6ZXJvIGdhZGdldD8gUGF5IGF0dGVudGlvbiB0aGF0IGJvdW5kaW5nIGZ1bmN0
aW9uIGRyaXZlciBhbmQgDQpwdWxsdXAgc2V0IHRvIDEgbXVjaCBlYXJsaWVyIHRoYW4gY29yZS9k
d2MyIGZpbmlzaGVkIGluaXRpYWxpemF0aW9uLg0KQ2FuIHlvdSBtb2Rwcm9iZSB6ZXJvIGdhZGdl
dCBhZnRlciBkd2MyIGZ1bGx5IGluaXRpYWxpemVkPw0KDQpUaGFua3MsDQpNaW5hcw0K
