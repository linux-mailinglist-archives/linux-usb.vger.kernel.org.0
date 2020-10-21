Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB08929531D
	for <lists+linux-usb@lfdr.de>; Wed, 21 Oct 2020 21:50:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2438836AbgJUTuK (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 21 Oct 2020 15:50:10 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.87.133]:50846 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2393042AbgJUTuJ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 21 Oct 2020 15:50:09 -0400
Received: from mailhost.synopsys.com (badc-mailhost4.synopsys.com [10.192.0.82])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id BC3DFC0092;
        Wed, 21 Oct 2020 19:50:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1603309809; bh=r0qZP4ULRU5LqUMxQW7D+m4pXseolQt8qNZ1uujcXC4=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=d7Jjfat3eCOet57BQn90daa//g4IiPYZk4Q8TsvGeyZ5NfUbGRj3iBp7POX+UnWCl
         OVe9jxppVdTbPhzKjJd12J7k0tTHX2N4yySmv4rSxvmXpWqah97mE5s9RzRbyDVTjT
         Z3aki2+EnERJoGze+FLenBeAt3P73iJNV2KNZ1/KUXzTwYVUH1wo/QkRkbiXgKW29V
         IIK8lswnojZqjHPRvdRGBfxN0BRJzL0Rx29bwFhFT7M/BF0vLrYNPy084F+H+TzMui
         4JK8xxT0Cxrzra4eRAcOpuwNNOySspZbZ0eOzQlGgSrLOiXFT8fDY7irW4gbDPhWZw
         KTgH3FV156DgQ==
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com [10.4.161.137])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id 377D8A0060;
        Wed, 21 Oct 2020 19:50:08 +0000 (UTC)
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2103.outbound.protection.outlook.com [104.47.58.103])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "GlobalSign Organization Validation CA - SHA256 - G3" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id 470FF800C9;
        Wed, 21 Oct 2020 19:50:07 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=thinhn@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="CerPz4vA";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=No2m21hlkmyUqi6yjeg2/y8Wj0WmYFsZYiIBO3BmvE5x/Yx8rS4XR6i1EEewykrtXZ5cq99OXdo7EfN85Wbya7uPAb5eDipd+mCHs19jVQUZtCdjRxR25i+puI7oj07aMzBhknJOv+5pUHiNCvWuts2bXJ4gbAz9W81EvZSOvlKVQnjtbWjuMRoATP2y2Y36Vr0wCkqPDSUkfunSQ3AvHoSH94Es+3G+SzQnTgY5mIM1Md3Thy36HZbbJCUAjlqECVoRwfReH0G8z70YaIsZbO1zXRZj3SUSoJDd2Yp4h2+TyQXeAEU0/9i4idNMx5FvzHBJXcJYk+LqSnVl3I8k1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r0qZP4ULRU5LqUMxQW7D+m4pXseolQt8qNZ1uujcXC4=;
 b=Zg+ukM6Y7i2Wub0nrz6mPsriqPdnG4orqLJDpTvPvtW84yrUS879Xtxw8Ez8+QKKZqPVFIJay/WK3ogNZOeaU3BuP4zPeepByusn//lxy8YDV3YsbLsGRxq6BwhXGdfjhvUYzFTvTeeivXw1DtuKIzvY1xRcMsyGbf+EK5Ga92HwSrE62K8T906zTIP5STKFVyM5O6jPe1ONsOGnr5ELCfXZxvyMawi8FEtJ8N6yPXH60NrNQ8Aaa4g5bRZ6IW0L57uGTrRwd4kfzoy7gzHR596YwUXcvsGjy/ipYtIjBGXvFdFiMgQpuVVuKgk3qp9uackvZ/DY4QL46DVWLA8MQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r0qZP4ULRU5LqUMxQW7D+m4pXseolQt8qNZ1uujcXC4=;
 b=CerPz4vAbHnMjbWHUX0Ia932zdih7UfedQN4xCU3oAK200NMLC57fjjGnXvtmAwtANwIzi4V6Db/JtumsQMsx50zSn5/rXffwzrfjrXf2COpCRdALiRQjcduiMM9TaA2eMsYf9TCMTADsrF/WjTgiTf1+tdvh5vQ2Ef0FFdy2JM=
Received: from BYAPR12MB2917.namprd12.prod.outlook.com (2603:10b6:a03:130::14)
 by BY5PR12MB4306.namprd12.prod.outlook.com (2603:10b6:a03:206::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18; Wed, 21 Oct
 2020 19:50:05 +0000
Received: from BYAPR12MB2917.namprd12.prod.outlook.com
 ([fe80::c17e:c3dd:7cda:e2dc]) by BYAPR12MB2917.namprd12.prod.outlook.com
 ([fe80::c17e:c3dd:7cda:e2dc%4]) with mapi id 15.20.3477.028; Wed, 21 Oct 2020
 19:50:05 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Ferry Toth <fntoth@gmail.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
CC:     "felipe.balbi-VuQAYsv1563Yd54FQh9/CA-XMD5yJDbdMReXY1tMh2IBg@public.gmane.org" 
        <felipe.balbi-VuQAYsv1563Yd54FQh9/CA-XMD5yJDbdMReXY1tMh2IBg@public.gmane.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: BUG with linux 5.9.0 with dwc3 in gadget mode
Thread-Topic: BUG with linux 5.9.0 with dwc3 in gadget mode
Thread-Index: AQHWo/slg1BGy5aFnEWs2vXEMG8U96mebg0AgAAaCYCAAeoFAIAAh4qAgAAZ9ACAAA2AgIABXG4AgAABPwA=
Date:   Wed, 21 Oct 2020 19:50:05 +0000
Message-ID: <aad327a8-95bc-40ec-abf7-ad216a02fad0@synopsys.com>
References: <913dccca-500d-1938-b199-6eb67cfb60cc@gmail.com>
 <87a6wig461.fsf@kernel.org> <a565dc52-27ab-f5be-4fee-5a8f96d66456@gmail.com>
 <874kmpf583.fsf@kernel.org> <d0aca346-353c-d74e-6f00-ccd2a4ed26ef@gmail.com>
 <976cea12-e54e-fbca-6c53-e6ef5c554094@synopsys.com>
 <645b6ddc-d4f5-3f5b-b85f-b3d27fc365f5@synopsys.com>
 <2b6586e6-528c-86e8-9d92-0061bc44866d@gmail.com>
In-Reply-To: <2b6586e6-528c-86e8-9d92-0061bc44866d@gmail.com>
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
x-ms-office365-filtering-correlation-id: 92210724-de6e-465f-5cf5-08d875fa81f6
x-ms-traffictypediagnostic: BY5PR12MB4306:
x-microsoft-antispam-prvs: <BY5PR12MB4306371B11F68E1871994F2CAA1C0@BY5PR12MB4306.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 7NI4SMZGkwj/oCUFdkeFDlwlnBIDkyDbn1Ag4VRS/t22yElswDjXPFVvFcyKAF8nJL1xat0P77GHwnR7xZe2RGCCithVY7qG9s4Mca/Ol6hMuF3zu0TFpDWWNVN2THhTe4DQejb/H0IagTcUMKDo8bSPn9V/oqjwMg989mtOh66btH4+/xhVb6SCYtfSWnX7Lg1f+51fsXWKi9PqOy8kjBDuI+ThozvYPZeT+IdsroftjSH5zdLATWSPgKwsbuSyFeM97dnmUpFCzdpobO1L3OcAO0gCnXfxiXiGuFobkHxJQVpMyu7QAr2hD2K0gMa1Us/EUgZQvwor5zRrn0P7nJKjivHU/10sEkggkEtwVsTX6bUsDmc3hWU0aDAtCALe
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB2917.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(396003)(39860400002)(366004)(346002)(376002)(71200400001)(31686004)(2906002)(83380400001)(478600001)(8936002)(2616005)(6486002)(8676002)(26005)(66946007)(86362001)(36756003)(76116006)(4326008)(66446008)(316002)(186003)(54906003)(66556008)(6506007)(110136005)(66476007)(64756008)(31696002)(6512007)(5660300002)(43740500002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: W3unh3Bd9TGw0TRjYzENqvFOLgmEbKtfWBHtatTHz6T2IJcHwsDybJWpQ/f7lai2f4D2/ykwOp8oDX87OP2LvK33AW/EE9TGxzF2eVArYdbZEJMDkVSWqQhIhCZuR+EBCSMDEVSz2dLvGIHocOpqGX4Nkfa4V8t+o7AmmbrfanoPkpmV1Skr3waMdOi3VTmmLdot0zATFp6f/8/GFt8oi7LdrR8NwdbgbSy0ktsw/mTxGC2lthXHdz30SKbkknJj+QMd4+ZpRrF5FpdoYx7MK1u/7WxfcvSx5/MHsxRp6nWDnlZ7Jqyd8oBI8MnjZEpShErJtgPYrc/9NJeAVo553+GIIQUo1avAcDQtRPAUMyTgMBVhZcm7yJgbSgffOvEHJYu6iZe1vus6hSyUoCNIP9GOcKs6I+sZLsC8LIXXUDWC3BbzEat3pl2ZVcdUduWL2nCjPnK71kJ3YXUOiSwZzbqAA2R2fxjL5BJXjORT3uY9gMOX3q4NVu42xuBkvZGRlZGFUznoAN1INY07C4T6Gyd3l7X/arJ4E2xKOoTvU0E7/pR4klAxDj4jqqeBCTx7ZkjPUPIZYkUoIyYh79M6Fe20Rrl3SL30VeEAADAGAF4TibHtm8iMdyBjUjH3i+2ZYRILx4pagcnn30vc5ltFyw==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <24464D4BD41C2C45B1EE2C25F4F847AB@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB2917.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 92210724-de6e-465f-5cf5-08d875fa81f6
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Oct 2020 19:50:05.4136
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CfSnNUselgr6N4fiAI9Xm5KPINt2xcpltQmPGggT8XomWcoeG4LWyCbWD+eubTC7XW5hZ2JXEVexHbNj0d9w7w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4306
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

RmVycnkgVG90aCB3cm90ZToNCj4gT3AgMjEtMTAtMjAyMCBvbSAwMDo1OCBzY2hyZWVmIFRoaW5o
IE5ndXllbjoNCj4+IFRoaW5oIE5ndXllbiB3cm90ZToNCj4+PiBIaSwNCj4+Pg0KPj4+IEZlcnJ5
IFRvdGggd3JvdGU6DQo+Pj4+IE9wIDIwLTEwLTIwMjAgb20gMTQ6MzIgc2NocmVlZiBGZWxpcGUg
QmFsYmk6DQo+Pj4+PiBIaSwNCj4+Pj4+DQo+Pj4+PiBGZXJyeSBUb3RoIDxmbnRvdGhAZ21haWwu
Y29tPiB3cml0ZXM6DQo+Pj4+Pg0KPj4+Pj4gODwgc25pcA0KPj4+Pj4NCj4+Pj4+Pj4+IFvCoMKg
IDEyLjY1NzQxNl0gQ1IyOiAwMDAwMDAwMTAwMDAwMDAwDQo+Pj4+Pj4+PiBbwqDCoCAxMi42NjA3
MjldIC0tLVsgZW5kIHRyYWNlIDliOTJkZWE2ZGEzM2M3MWUgXS0tLQ0KPj4+Pj4+PiBJdCB0aGlz
IHNvbWV0aGluZyB5b3UgY2FuIHJlcHJvZHVjZSBvbiB5b3VyIGVuZD8gRmVycnksIGNhbiB5b3Ug
Z2V0DQo+Pj4+Pj4+IGR3YzMNCj4+Pj4+Pj4gdHJhY2UgbG9ncyB3aGVuIHRoaXMgaGFwcGVucz8g
ZnRyYWNlX2R1bXBfb25fb29wcyBtYXkgaGVscCBoZXJlLg0KPj4+Pj4+IEkgd2lsbCBkbyB0aGF0
IHRvbmlnaHQuIElzIGZsaXBwaW5nIG9uIGZ0cmFjZV9kdW1wX29uX29vcHMNCj4+Pj4+PiBzdWZm
aWNpZW50IG9yDQo+Pj4+Pj4gZG8gSSBuZWVkIHRvIGRvIG1vcmU/DQo+Pj4+PiB5b3UnZCBoYXZl
IHRvIGVuYWJsZSBkd2MzIHRyYWNlIGV2ZW50cyBmaXJzdCA7LSkNCj4+Pj4+DQo+Pj4+Pj4gQlRX
IGFmdGVyIHBvc3RpbmcgdGhpcyBJIGZvdW5kIGluIGhvc3QgbW9kZSBkd2MzIGlzIG5vdCB3b3Jr
aW5nDQo+Pj4+Pj4gcHJvcGVybHkNCj4+Pj4+PiBlaXRoZXIuIE5vIG9vcHMsIGJ1dCBubyBkcml2
ZXIgZ2V0IGxvYWRlZCBvbiBkZXZpY2UgcGx1ZyBpbi4NCj4+Pj4+IG9rYXkNCj4+Pj4+DQo+Pj4+
IEVoZW0sIHlvdSBtYXliZSBvbmx5IG1lIHRvIGVuYWJsZSAvZHdjMy9kd2MzX2VwX2RlcXVldWUv
ZW5hYmxlOg0KPj4+Pg0KPj4+PiByb290QGVkaXNvbjovYm9vdCMgdW5hbWUgLWENCj4+Pj4gTGlu
dXggZWRpc29uIDUuOS4wLWVkaXNvbi1hY3BpLXN0YW5kYXJkICMxIFNNUCBNb24gT2N0IDE5IDIw
OjE3OjA0IFVUQw0KPj4+PiAyMDIwIHg4Nl82NCB4ODZfNjQgeDg2XzY0IEdOVS9MaW51eA0KPj4+
PiByb290QGVkaXNvbjovYm9vdCMgZWNobyAxID4NCj4+Pj4gL3N5cy9rZXJuZWwvZGVidWcvdHJh
Y2luZy9ldmVudHMvZHdjMy9kd2MzX2VwX2RlcXVldWUvZW5hYmxlDQo+Pj4+IHJvb3RAZWRpc29u
Oi9ib290IyBlY2hvIDEgPiAvcHJvYy9zeXMva2VybmVsL2Z0cmFjZV9kdW1wX29uX29vcHMNCj4+
Pj4gcm9vdEBlZGlzb246L2Jvb3QjDQo+Pj4+IHJvb3RAZWRpc29uOi9ib290IyBbIDI2MDguNTg1
MzIzXSBCVUc6IGtlcm5lbCBOVUxMIHBvaW50ZXINCj4+Pj4gZGVyZWZlcmVuY2UsIGFkZHJlc3M6
IDAwMDAwMDAwMDAwMDAwMDANCj4+Pj4gWyAyNjA4LjU5MjI4OF0gI1BGOiBzdXBlcnZpc29yIHJl
YWQgYWNjZXNzIGluIGtlcm5lbCBtb2RlDQo+Pj4+IFsgMjYwOC41OTc0MTldICNQRjogZXJyb3Jf
Y29kZSgweDAwMDApIC0gbm90LXByZXNlbnQgcGFnZQ0KPj4+PiBbIDI2MDguNjAyNTQ5XSBQR0Qg
MCBQNEQgMA0KPj4+PiBbIDI2MDguNjA1MDkwXSBPb3BzOiAwMDAwIFsjMV0gU01QIFBUSQ0KPj4+
PiBbIDI2MDguNjA4NTgwXSBDUFU6IDEgUElEOiA3MzMgQ29tbTogaXJxLzE1LWR3YzMgTm90IHRh
aW50ZWQNCj4+Pj4gNS45LjAtZWRpc29uLWFjcGktc3RhbmRhcmQgIzENCj4+Pj4gWyAyNjA4LjYx
NjU3MV0gSGFyZHdhcmUgbmFtZTogSW50ZWwgQ29ycG9yYXRpb24gTWVycmlmaWVsZC9CT0RFR0Eg
QkFZLA0KPj4+PiBCSU9TIDU0MiAyMDE1LjAxLjIxOjE4LjE5LjQ4DQo+Pj4+IFsgMjYwOC42MjUz
NTZdIFJJUDogMDAxMDpkd2MzX2dhZGdldF9lcF9kZXF1ZXVlKzB4NDEvMHgxYzANCj4+Pj4gWyAy
NjA4LjYzMDU4MF0gQ29kZTogZTkgNTEgMDEgMDAgMDAgNGMgOGQgYTMgMzAgMDEgMDAgMDAgNGMg
ODkgZTcgZTgNCj4+Pj4gMTUgZTYgNDIgMDAgNDkgOGIgNGUgNDggNDkgODkgYzUgNDkgOGQgNDYg
NDggNDggOGQgNTEgYTAgNDggMzkgYzggNzUNCj4+Pj4gMGYgZWIgMmUgPDQ4PiA4YiA0YSA2MCA0
OCA4ZCA1MSBhMCA0OCAzOSBjOCA3NCAyMSA0OCAzOSBkNSA3NSBlZSA0NSAzMQ0KPj4+PiBmNiA0
Yw0KPj4+PiBbIDI2MDguNjQ5MzIwXSBSU1A6IDAwMTg6ZmZmZmE4MzgwMDJhN2M0MCBFRkxBR1M6
IDAwMDEwMDg3DQo+Pj4+IFsgMjYwOC42NTQ1NDNdIFJBWDogZmZmZjlhNWY0NjA5YzA0OCBSQlg6
IGZmZmY5YTVmNDZmNDgwMjggUkNYOg0KPj4+PiAwMDAwMDAwMDAwMDAwMDAwDQo+Pj4+IFsgMjYw
OC42NjE2NjZdIFJEWDogZmZmZmZmZmZmZmZmZmZhMCBSU0k6IDAwMDAwMDAwMDAwMDAwMDggUkRJ
Og0KPj4+PiBmZmZmOWE1ZjQ2ZjQ4MTU4DQo+Pj4+IFsgMjYwOC42Njg3OTBdIFJCUDogZmZmZjlh
NWY3YmQwOWI0MCBSMDg6IDAwMDAwMDAwMDAwMDAyZDggUjA5Og0KPj4+PiBmZmZmOWE1ZjdkZDZh
MDAwDQo+Pj4+IFsgMjYwOC42NzU5MTNdIFIxMDogZmZmZmE4MzgwMDJhN2Q5MCBSMTE6IGZmZmY5
YTVmNDZmNDgzMDAgUjEyOg0KPj4+PiBmZmZmOWE1ZjQ2ZjQ4MTU4DQo+Pj4+IFsgMjYwOC42ODMw
MzldIFIxMzogMDAwMDAwMDAwMDAwMDA0NiBSMTQ6IGZmZmY5YTVmNDYwOWMwMDAgUjE1Og0KPj4+
PiBmZmZmOWE1ZjdhZDc3ZTAwDQo+Pj4+IFsgMjYwOC42OTAxNjVdIEZTOsKgIDAwMDAwMDAwMDAw
MDAwMDAoMDAwMCkgR1M6ZmZmZjlhNWY3ZTMwMDAwMCgwMDAwKQ0KPj4+PiBrbmxHUzowMDAwMDAw
MDAwMDAwMDAwDQo+Pj4+IFsgMjYwOC42OTgyNDRdIENTOsKgIDAwMTAgRFM6IDAwMDAgRVM6IDAw
MDAgQ1IwOiAwMDAwMDAwMDgwMDUwMDMzDQo+Pj4+IFsgMjYwOC43MDM5ODBdIENSMjogMDAwMDAw
MDAwMDAwMDAwMCBDUjM6IDAwMDAwMDAwMzc4MGEwMDAgQ1I0Og0KPj4+PiAwMDAwMDAwMDAwMTAw
NmUwDQo+Pj4+IFsgMjYwOC43MTExMDJdIENhbGwgVHJhY2U6DQo+Pj4+IFsgMjYwOC43MTM1NjFd
wqAgdXNiX2VwX2RlcXVldWUrMHgxOS8weDgwDQo+Pj4+IFsgMjYwOC43MTcyMzRdwqAgdV9hdWRp
b19zdG9wX2NhcHR1cmUrMHg1NC8weDlhIFt1X2F1ZGlvXQ0KPj4+PiBbIDI2MDguNzIyMjg5XcKg
IGFmdW5jX3NldF9hbHQrMHg3My8weDgwIFt1c2JfZl91YWMyXQ0KPj4+IEkgdG9vayBhIGxvb2sg
YXQgaG93IHRoZSBhdWRpbyBmdW5jdGlvbiBpcyBoYW5kbGluZyBzd2l0Y2hpbmcgYWx0ZXJuYXRl
DQo+Pj4gc2V0dGluZyBhbmQgZGVxdWV1aW5nIGVuZHBvaW50cywgYW5kIEkgdGhpbmsgSSBmb3Vu
ZCB0aGUgaXNzdWUuDQo+Pj4NCj4+PiBIZXJlJ3MgYSBzbmlwcGV0IG9mIHRoZSBmcmVlX2VwKCkg
Y29kZSBpbiB1X2F1ZGlvLmM6DQo+Pj4NCj4+PiBzdGF0aWMgaW5saW5lIHZvaWQgZnJlZV9lcChz
dHJ1Y3QgdWFjX3J0ZF9wYXJhbXMgKnBybSwgc3RydWN0IHVzYl9lcA0KPj4+ICplcCkNCj4+PiB7
DQo+Pj4gwqDCoMKgwqAgLi4uLi4NCj4+PiDCoMKgwqDCoMKgwqDCoMKgIGZvciAoaSA9IDA7IGkg
PCBwYXJhbXMtPnJlcV9udW1iZXI7IGkrKykgew0KPj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIGlmIChwcm0tPnVyZXFbaV0ucmVxKSB7DQo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHVzYl9lcF9kZXF1ZXVlKGVwLCBwcm0tPnVy
ZXFbaV0ucmVxKTsNCj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgdXNiX2VwX2ZyZWVfcmVxdWVzdChlcCwgcHJtLT51cmVxW2ldLnJlcSk7DQo+Pj4g
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHBybS0+dXJl
cVtpXS5yZXEgPSBOVUxMOw0KPj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIH0N
Cj4+PiDCoMKgwqDCoMKgwqDCoMKgIH0NCj4+PiDCoMKgIC4uLi4NCj4+Pg0KPj4+DQo+Pj4gdXNi
X2VwX2RlcXVldWUoKSBjYW4gYmUgYXN5bmNocm9ub3VzLiBUaGUgZHdjMyBzdGlsbCBoYXMgb3du
ZXJzaGlwIG9mDQo+Pj4gdGhlIHJlcXVlc3QgdW50aWwgaXQgZ2l2ZXMgYmFjayB0aGUgcmVxdWVz
dC4gRnJlZWluZyB0aGUgcmVxdWVzdA0KPj4+IGltbWVkaWF0ZWx5IGhlcmUgd2lsbCBjYXVzZSBh
IHByb2JsZW0uDQo+Pg0KPj4gVG8gY29uZmlybSBteSBzdXNwaWNpb24sIGNhbiB5b3UgdHJ5IHRo
aXMgYW5kIHNlZSBpZiB5b3Ugc3RpbGwgZ2V0IG9vcHM/DQo+Pg0KPj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvdXNiL2R3YzMvZ2FkZ2V0LmMgYi9kcml2ZXJzL3VzYi9kd2MzL2dhZGdldC5jDQo+PiBp
bmRleCBlZWM4ZTlhOWUzZWQuLmI2NmViMjRlYzA3MCAxMDA2NDQNCj4+IC0tLSBhL2RyaXZlcnMv
dXNiL2R3YzMvZ2FkZ2V0LmMNCj4+ICsrKyBiL2RyaXZlcnMvdXNiL2R3YzMvZ2FkZ2V0LmMNCj4+
IEBAIC0yMDMxLDYgKzIwMzEsNyBAQCBzdGF0aWMgaW50IGR3YzNfZ2FkZ2V0X2VwX2RlcXVldWUo
c3RydWN0IHVzYl9lcA0KPj4gKmVwLA0KPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIGxpc3RfZm9yX2VhY2hfZW50cnlfc2FmZShyLCB0LA0KPj4gJmRl
cC0+c3RhcnRlZF9saXN0LCBsaXN0KQ0KPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBkd2MzX2dhZGdldF9tb3ZlX2NhbmNl
bGxlZF9yZXF1ZXN0KHIpOw0KPj4gwqAgK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgDQo+PiBkd2MzX2dhZGdldF9lcF9jbGVhbnVwX2NhbmNlbGxlZF9yZXF1ZXN0
cyhkZXApOw0KPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIGdvdG8gb3V0Ow0KPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfQ0KPj4g
wqDCoMKgwqDCoMKgwqDCoCB9DQo+Pg0KPj4NCj4+IFRoaXMgd2lsbCBtYWtlIHVzYl9lcF9kZXF1
ZXVlKCkgc3luY2hyb25vdXMuIChOb3RlIHRoYXQgdGhpcyBpcyBub3QNCj4+IHRlc3RlZCkuDQo+
DQo+IFVuZm9ydHVuYXRlbHksIGl0IGRvZXNuJ3Qgd29yay4gVGhlIHRyYWNlIGNoYW5nZXMgdG86
DQo+IHJvb3RAZWRpc29uOn4jIFvCoCAxMDQuNDE4MjY0XSBCVUc6IGtlcm5lbCBOVUxMIHBvaW50
ZXIgZGVyZWZlcmVuY2UsDQo+IGFkZHJlc3M6IDAwMDAwMDAwMDAwMDAwMDANCj4gW8KgIDEwNC40
MjUyMjddICNQRjogc3VwZXJ2aXNvciBpbnN0cnVjdGlvbiBmZXRjaCBpbiBrZXJuZWwgbW9kZQ0K
PiBbwqAgMTA0LjQzMDg3N10gI1BGOiBlcnJvcl9jb2RlKDB4MDAxMCkgLSBub3QtcHJlc2VudCBw
YWdlDQo+IFvCoCAxMDQuNDM2MDA3XSBQR0QgMCBQNEQgMA0KPiBbwqAgMTA0LjQzODU0N10gT29w
czogMDAxMCBbIzFdIFNNUCBQVEkNCj4gW8KgIDEwNC40NDIwMzldIENQVTogMSBQSUQ6IDYwNSBD
b21tOiBpcnEvMTUtZHdjMyBOb3QgdGFpbnRlZA0KPiA1LjkuMC1lZGlzb24tYWNwaS1zdGFuZGFy
ZCAjMQ0KPiBbwqAgMTA0LjQ1MDAyN10gSGFyZHdhcmUgbmFtZTogSW50ZWwgQ29ycG9yYXRpb24g
TWVycmlmaWVsZC9CT0RFR0EgQkFZLA0KPiBCSU9TIDU0MiAyMDE1LjAxLjIxOjE4LjE5LjQ4DQo+
IFvCoCAxMDQuNDU4ODAyXSBSSVA6IDAwMTA6MHgwDQo+IFvCoCAxMDQuNDYxNDI1XSBDb2RlOiBC
YWQgUklQIHZhbHVlLg0KPiBbwqAgMTA0LjQ2NDY0OV0gUlNQOiAwMDE4OmZmZmZhZTU4NDAzNGZi
ZjggRUZMQUdTOiAwMDAxMDA0Ng0KPiBbwqAgMTA0LjQ2OTg3MF0gUkFYOiAwMDAwMDAwMDAwMDAw
MDAwIFJCWDogZmZmZjhjMTk4NjA4YTAyOCBSQ1g6DQo+IGZmZmY4YzE5YmI4N2ZhMDANCj4gW8Kg
IDEwNC40NzY5OTNdIFJEWDogMDAwMDAwMDBmZmZmZmY5NCBSU0k6IGZmZmY4YzE5YmFmYTU0ZTAg
UkRJOg0KPiBmZmZmOGMxOTg2MDllZTAwDQo+IFvCoCAxMDQuNDg0MTE4XSBSQlA6IGZmZmY4YzE5
YmFmYTU0ZTAgUjA4OiAwMDAwMDAwMDAwMDAwMDQ2IFIwOToNCj4gMDAwMDAwMDAwMDAwMDIzOA0K
PiBbwqAgMTA0LjQ5MTI0MV0gUjEwOiAwMDAwMDAwMDAwMDAwMDJjIFIxMTogZmZmZjhjMTliY2Y2
MjQ5MCBSMTI6DQo+IGZmZmY4YzE5ODYwOWVlMDANCj4gW8KgIDEwNC40OTgzNjZdIFIxMzogZmZm
ZjhjMTk4NjA4YTAyOCBSMTQ6IDAwMDAwMDAwMDAwMDAwMDIgUjE1Og0KPiBmZmZmOGMxOWJiOGZm
MDAwDQo+IFvCoCAxMDQuNTA1NDkzXSBGUzrCoCAwMDAwMDAwMDAwMDAwMDAwKDAwMDApIEdTOmZm
ZmY4YzE5YmUzMDAwMDAoMDAwMCkNCj4ga25sR1M6MDAwMDAwMDAwMDAwMDAwMA0KPiBbwqAgMTA0
LjUxMzU3Ml0gQ1M6wqAgMDAxMCBEUzogMDAwMCBFUzogMDAwMCBDUjA6IDAwMDAwMDAwODAwNTAw
MzMNCj4gW8KgIDEwNC41MTkzMDldIENSMjogZmZmZmZmZmZmZmZmZmZkNiBDUjM6IDAwMDAwMDAw
MmU4MGEwMDAgQ1I0Og0KPiAwMDAwMDAwMDAwMTAwNmUwDQo+IFvCoCAxMDQuNTI2NDMyXSBDYWxs
IFRyYWNlOg0KPiBbwqAgMTA0LjUyODg5Ml3CoCBkd2MzX2dhZGdldF9naXZlYmFjaysweGJmLzB4
MTIwDQo+IFvCoCAxMDQuNTMzMTY5XcKgIF9fZHdjM19nYWRnZXRfZXBfZGlzYWJsZSsweGM1LzB4
MjUwDQo+IFvCoCAxMDQuNTM3Nzg5XcKgIGR3YzNfZ2FkZ2V0X2VwX2Rpc2FibGUrMHgzZC8weGQw
DQo+IFvCoCAxMDQuNTQyMTQ5XcKgIHVzYl9lcF9kaXNhYmxlKzB4MWQvMHg4MA0KPiBbwqAgMTA0
LjU0NTgyM13CoCB1X2F1ZGlvX3N0b3BfY2FwdHVyZSsweDg3LzB4OWEgW3VfYXVkaW9dDQo+IFvC
oCAxMDQuNTUwODgwXcKgIGFmdW5jX3NldF9hbHQrMHg3My8weDgwIFt1c2JfZl91YWMyXQ0KPiBb
wqAgMTA0LjU1NTU5NF3CoCBjb21wb3NpdGVfc2V0dXArMHgyMGYvMHgxYjIwIFtsaWJjb21wb3Np
dGVdDQo+IFvCoCAxMDQuNTYwOTEyXcKgID8gY29uZmlnZnNfY29tcG9zaXRlX3NldHVwKzB4NmIv
MHg5MCBbbGliY29tcG9zaXRlXQ0KPiBbwqAgMTA0LjU2NjkyMV3CoCBjb25maWdmc19jb21wb3Np
dGVfc2V0dXArMHg2Yi8weDkwIFtsaWJjb21wb3NpdGVdDQo+IFvCoCAxMDQuNTcyNzUyXcKgIGR3
YzNfZXAwX2RlbGVnYXRlX3JlcSsweDI0LzB4NDANCj4gW8KgIDEwNC41NzcwMjJdwqAgZHdjM19l
cDBfaW50ZXJydXB0KzB4NDBhLzB4OWQ4DQo+IFvCoCAxMDQuNTgxMjA1XcKgIGR3YzNfdGhyZWFk
X2ludGVycnVwdCsweDg4MC8weGY3MA0KPg0KDQpPb3BzLCBsb29rcyBsaWtlIEkgY2FuJ3QgbWFr
ZSBpdCBzeW5jaHJvbm91cyB0aGlzIHdheS4gQ2FuIHlvdSB0cnkNCkphY2sncyBjaGFuZ2UgdG8g
dGhlIHVfYXVkaW8uYyBpbnN0ZWFkPw0KDQpUaGFua3MsDQpUaGluaA0K
