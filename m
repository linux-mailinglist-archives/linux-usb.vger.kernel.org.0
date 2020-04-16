Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AFDF31ACAD4
	for <lists+linux-usb@lfdr.de>; Thu, 16 Apr 2020 17:40:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2897550AbgDPNhv (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 16 Apr 2020 09:37:51 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.73.133]:45484 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2896376AbgDPNhW (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 16 Apr 2020 09:37:22 -0400
Received: from mailhost.synopsys.com (badc-mailhost2.synopsys.com [10.192.0.18])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id B31AE404B8;
        Thu, 16 Apr 2020 13:37:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1587044241; bh=qDcMmPD4vi+ORIS+MXDVvfJP5rkM0e+9B4bRaZJL908=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=H0TdvJ4Uxb8Qsd6YdZwZExtcK7a7F8xUf4UgWe639exY62mk+vBVs8Vep18f4xVt5
         KXh7isX2QnH1Zqb00wL/vvvVjK4QwBiSIz9NhgcT8G2fhYFiq502XsB80ulztYXN4u
         4st/He5BuITjjPSr2rXG7ppEpvhQUCqJRzaqpVFZcWCpfo1iEnrmoiTNsYHeXcimxS
         lLXvLazDlIH8JuI1Mqy5UIt/NB4ZNTL8X5Hju0sHkVkrp6rVo3CLvKdqMY7icV1HJc
         cpiMTnXwOI8VWL0oxtqPfSQaJwZpYiJzg3BB7ebuFE9sa5qyo23uaigiUETN64tcXH
         ODMvkbEm33EqQ==
Received: from US01WEHTC3.internal.synopsys.com (us01wehtc3.internal.synopsys.com [10.15.84.232])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id 39054A0067;
        Thu, 16 Apr 2020 13:37:18 +0000 (UTC)
Received: from us01hybrid1.internal.synopsys.com (10.200.27.51) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Thu, 16 Apr 2020 06:37:18 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.200.27.51) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Thu, 16 Apr 2020 06:37:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H6D8z2JeULV7D4VLswlqei0l+vOzVXAm4XSv0AiepOYAFLlN+bjoXM4ta7KAFKZhrr0i0P98jwbwIW+e4raa+dQ1ezUbVPGpeK4tr3AvdTvy1fmybbJh4A1coKpVebTttsuOYzUIuKbMOA5e2nwjeSAP/YQxWEm/JNetHvphn4tI9jUSrKIh3qjsPAA2dDvXLii33YJVwtdiN1J8uF4OlvvQ0OHQitADUN0Jz8Xg1ORBXeb1lGL3iGlH92scl20gBfVGUmBcpGYeZpBPfgnwuMy5qFynawQr/LgcfOhF1yDCC2XyxPEDjov6yMhiNWKF6Wsg8hVtW1JDevYuLytwNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qDcMmPD4vi+ORIS+MXDVvfJP5rkM0e+9B4bRaZJL908=;
 b=SeCK4qNKhlP5JFDkjvubRMYujildvP2e/HX4WmUgXMN85KijibB8uixxZtftb4kCDGKHbYzO+bm8AF43QqYV9UrBVTfa5vrQ3H34c9yPXJmQM/vfzDW9kRky+8OFFya0WQKOnnFeFnkmyUzQE0GVeKnTn07XavScoFT/iydRuKglggpyKDIWzUDvgsH4U8vAFIRKAANTiuCTm1h+14sjoh0dgHJjz0aXiT9Y88Uyyrj2BKJ0TEFoMJftpDeaVT+eGeXHJk0wrDASd7t5aPWhbEJKUh9L5QfGm2tEYOXxWTxgfXlva0ynTEpOeuaiPepG1tCs9yib0seoPLJqlKoIzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qDcMmPD4vi+ORIS+MXDVvfJP5rkM0e+9B4bRaZJL908=;
 b=ZguEM4X/p42GBq4fUEN66ZL6NSd/tznXWdsW4PNFXTk4Ov5t8SYXgXuDCKM579o3xZlLuZId5+ttW6W5cXwBMLjUPG3tupr9PDYsRqxGvaGqEc+F3mM3u42W90d7WgHJz5stG7qvxa+4pD4s+EgU6kfYuhn2of2oOHzIM4Wg1zI=
Received: from SN1PR12MB2557.namprd12.prod.outlook.com (2603:10b6:802:22::15)
 by SN1PR12MB2526.namprd12.prod.outlook.com (2603:10b6:802:2a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2900.19; Thu, 16 Apr
 2020 13:37:17 +0000
Received: from SN1PR12MB2557.namprd12.prod.outlook.com
 ([fe80::20d2:fe98:5580:932d]) by SN1PR12MB2557.namprd12.prod.outlook.com
 ([fe80::20d2:fe98:5580:932d%7]) with mapi id 15.20.2900.028; Thu, 16 Apr 2020
 13:37:17 +0000
From:   Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
To:     Marek Vasut <marex@denx.de>,
        Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
CC:     Amelie Delaunay <amelie.delaunay@st.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: Re: [PATCH] [RFC] usb: dwc2: Run the core connect in dwc2_hcd_init()
Thread-Topic: [PATCH] [RFC] usb: dwc2: Run the core connect in dwc2_hcd_init()
Thread-Index: AQHWEaBFUZHLydAVY0yALpZJ1gABx6h3ITiAgAACTgCAAAlrgIAAGd8AgADukoCAAFTigIABVJ4AgABprwCAAAQ1gIABN86AgABAc4A=
Date:   Thu, 16 Apr 2020 13:37:17 +0000
Message-ID: <8fb53f3a-a02b-3c53-0d9d-22b707bda786@synopsys.com>
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
In-Reply-To: <6ea2270d-19a4-7e8b-42fb-37a4a9d81e1f@denx.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=hminas@synopsys.com; 
x-originating-ip: [198.182.37.200]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e3f2fdf9-0b95-43a6-cb09-08d7e20b47dd
x-ms-traffictypediagnostic: SN1PR12MB2526:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SN1PR12MB25264A423B880F1783EED16FA7D80@SN1PR12MB2526.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0375972289
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN1PR12MB2557.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(10019020)(376002)(39860400002)(136003)(396003)(346002)(366004)(54906003)(31686004)(53546011)(6486002)(5660300002)(2906002)(8676002)(36756003)(81156014)(6506007)(478600001)(186003)(8936002)(2616005)(26005)(66556008)(316002)(64756008)(91956017)(6512007)(110136005)(66946007)(86362001)(4326008)(71200400001)(66446008)(31696002)(76116006)(66476007);DIR:OUT;SFP:1102;
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: fYaDIUOUy0hugVZ7yhKqXFzHlNrpYQcW7d0pdCFk19INJq39/IOESBxktMtw+zqEz8Dz8CSMyKSrvBGiULPkW55+rpz1iEXIrHzB3Sg01ngG4vwq2Zg3MPsAQbi0iPbmr22K4HEI8HfukyhJkTXW5oILq2ddFCUkyGG2URYrb8Mq3VQaEsduojWSSpSzxbR17v9A3k7UCOtdq96YqCVbSAeAjgPEuDaE1Ztv5XlznhX8CW5qgH1xj0lJKOdLJ+AArpKz74YPsozgn3+1n6mMVBAekFHWPCAFyPTscYN8JjRjj6lzKNdrJG5tXKlVPtdYi40BGpgex0UI9sqmBYXj4jNbGHxH14u6QawbbBh8O4FGGVXRm69Pf+sv/A3Xla+H+SRBP2E6OTM3/01/un1Pd/9nrlveAOq4kW9AfX3s8v8AlDRPt9sQ+XLIl48HZAnq
x-ms-exchange-antispam-messagedata: NvukgAcOURdTcvkV/hWwlDCdAPSqEfnlhYdhpt3Spxkw7XaWqAv3pRZmqeTak7m12XdGaBohKEvOjw21LdHGlFziKxFCjL/znAtfu4MZ7eRgtcB+9VeOAwTrFx0QeG5gsXUKYv2daIBg1+Xo/wfSAg==
Content-Type: text/plain; charset="utf-8"
Content-ID: <9367D8BE1A66CB4BA051B26DDE2A186E@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: e3f2fdf9-0b95-43a6-cb09-08d7e20b47dd
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Apr 2020 13:37:17.3760
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EZ2utHwa4GbEYEWMswklwh5YbZkh8Oy5UFFOBe9nVgW2HDsytlE2MsN3knoc1iTnpVNjwxSt3IGU7Ya+FXPKmA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR12MB2526
X-OriginatorOrg: synopsys.com
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

SGksDQoNCk9uIDQvMTYvMjAyMCAxOjQ2IFBNLCBNYXJlayBWYXN1dCB3cm90ZToNCj4gT24gNC8x
NS8yMCA1OjEwIFBNLCBNaW5hcyBIYXJ1dHl1bnlhbiB3cm90ZToNCj4+IEhpLA0KPiANCj4gSGks
DQo+IA0KPj4gT24gNC8xNS8yMDIwIDY6NTUgUE0sIE1hcmVrIFZhc3V0IHdyb3RlOg0KPj4+IE9u
IDQvMTUvMjAgMTA6MzcgQU0sIE1pbmFzIEhhcnV0eXVueWFuIHdyb3RlOg0KPj4+PiBIaSwNCj4+
Pj4NCj4+Pj4gT24gNC8xNC8yMDIwIDQ6MTggUE0sIE1hcmVrIFZhc3V0IHdyb3RlOg0KPj4+Pj4g
T24gNC8xNC8yMCA5OjE0IEFNLCBNaW5hcyBIYXJ1dHl1bnlhbiB3cm90ZToNCj4+Pj4NCj4+Pj4+
DQo+Pj4+Pj4gMi4gZGVidWcgbG9nDQo+Pj4+Pg0KPj4+Pj4gV2hhdCBraW5kIG9mIGRlYnVnIGxv
ZyA/DQo+Pj4+Pg0KPj4+PiBEcml2ZXJzIGRlYnVnIGxvZyBzdGFydGluZyBmcm9tIGR3YzIgbG9h
ZGluZyBhbmQgY29ubmVjdG9yIGNvbm5lY3RpbmcgdG8NCj4+Pj4gZGV2aWNlLCB3aGVyZSBpc3N1
ZSBzZWVuLg0KPj4+DQo+Pj4gSG93IGRvIEkgZW5hYmxlIHRoZSBvbmUgeW91IG5lZWQgPw0KPj4+
DQo+PiBUbyBlbmFibGUgZGVidWcgcHJpbnRzIGZyb20gZHdjMiB1c2UgJ21ha2UgbWVudWNvbmZp
Zyc6DQo+Pg0KPj4gICAgU3ltYm9sOiBVU0JfRFdDMl9ERUJVRyBbPXldDQo+IA0KPiBPaCwgdGhp
cyBvbmUsIE9LLiBUaGVyZSB5b3UgZ28uDQo+IA0KPiBOb3RlIHRoYXQgdGhlcmUgaXMgbm8gZnVy
dGhlciBvdXRwdXQgd2hlbiBJIHBsdWcgaW4gdGhlIFVTQiBtaWNyb0IgY2FibGUNCj4gZnJvbSBh
IFBDLg0KPiANCjEuIEFyZSB5b3Ugc3VyZSB0aGF0IHlvdSBwcm92aWRlZCBmdWxsIGRlYnVnIGxv
ZyBmb3IgZHdjMj8gQWN0dWFsbHkgDQpmaXJzdCBkZWJ1ZyBwcmludHMgb2YgZHdjMiBzaG91bGQg
YmU6DQoNCls3Mjg5MS4wODg5MTddIGR3YzIgZHdjMi4xLmF1dG86IG1hcHBlZCBQQSBlZjEwMDAw
MCB0byBWQSAwMDAwMDAwMGNhNDVmMDAwDQpbNzI4OTEuMDg4OTI0XSBkd2MyIGR3YzIuMS5hdXRv
OiByZWdpc3RlcmluZyBjb21tb24gaGFuZGxlciBmb3IgaXJxMTYNCls3Mjg5MS4wODg5NjNdIGR3
YzIgZHdjMi4xLmF1dG86IENvcmUgUmVsZWFzZTogNC4wMGEgKHNucHNpZD00ZjU0NDAwYSkNCls3
Mjg5MS4wODg5NzRdIGR3YzIgZHdjMi4xLmF1dG86IEZvcmNpbmcgbW9kZSB0byBob3N0DQpbNzI4
OTEuMTAwMjg1XSBkd2MyIGR3YzIuMS5hdXRvOiBGb3JjaW5nIG1vZGUgdG8gZGV2aWNlDQpbNzI4
OTEuMTEyMzA3XSBkd2MyIGR3YzIuMS5hdXRvOiBDbGVhcmluZyBmb3JjZSBtb2RlIGJpdHMNCls3
Mjg5MS4yMTUyNzVdIGR3YzIgZHdjMi4xLmF1dG86IE5vblBlcmlvZGljIFRYRklGTyBzaXplOiAx
MDI0DQpbNzI4OTEuMjE1Mjc4XSBkd2MyIGR3YzIuMS5hdXRvOiBSWEZJRk8gc2l6ZTogMjA0OA0K
Li4uDQoNCjIuIERvZXMgeW91ciBkcml2ZXIgYnVpbHQgZm9yICdkdWFsIHJvbGUgZGV2aWNlJyBv
ciAnZGV2aWNlIG9ubHknPw0KDQozLiBGaXJzdCBvYnNlcnZhdGlvbiBmcm9tIHJlZ2lzdGVyIGR1
bXBzOiBjb3JlIGluIFNPRlQgZGlzY29ubmVjdCBzdGF0ZSwgDQp3aGljaCBjYW4gYmUgcmVhc29u
IG9mIG9ic2VydmVkIGlzc3VlLiBDb3VsZCB5b3UgcGxlYXNlIHVwZGF0ZSB5b3VyIA0KcGF0Y2gg
YW5kIGFkZCBvbmx5IGNvcmVfY29ubmVjdCBmdW5jdGlvbiBjYWxsOg0KDQorCWR3YzJfaHNvdGdf
Y29yZV9jb25uZWN0KGhzb3RnKTsNCisNCiAgCXJldHVybiAwOw0KDQogIGVycm9yNDoNCg0KT3Ig
aW5zdGVhZCBvZiBwYXRjaCwgaWYgeW91IGhhdmUgYW55IHV0aWxpdHkgaW4gc3lzdGVtIHdoaWNo
IHdpbGwgYWxsb3cgDQpmcm9tIGNvbW1hbmQgbGluZSBjbGVhciBzb2Z0IGRpc2Nvbm5lY3QgYml0
IGZyb20gRENUTCByZWdpc3Rlcj8gT2Zmc2V0IA0Kb2YgRENUTCByZWdpc3RlciBpcyAweDgwNC4g
U29mdERpc2NvbiBiaXQgbnVtYmVyIGlzIDEuIENsZWFyIHRoaXMgYml0IA0KYW5kIHRoZW4gcGx1
ZyBjYWJsZS4NCg0KVW5mb3J0dW5hdGVseSwgY3VycmVudGx5IEknbSB3b3JraW5nIGZyb20gaG9t
ZSBhbmQgY2FuJ3QgcmVtb3RlbHkgDQpjb25uZWN0L2Rpc2Nvbm5lY3QgY2FibGUgaW4gbGFiIHRv
IHRyeSB0byByZXByb2R1Y2Ugb2JzZXJ2ZWQgYnkgeW91IGlzc3VlLg0KDQpUaGFua3MsDQpNaW5h
cw0KDQoNCg0K
