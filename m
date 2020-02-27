Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 69CDB172940
	for <lists+linux-usb@lfdr.de>; Thu, 27 Feb 2020 21:09:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729749AbgB0UH7 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 27 Feb 2020 15:07:59 -0500
Received: from nat-hk.nvidia.com ([203.18.50.4]:57495 "EHLO nat-hk.nvidia.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729594AbgB0UH7 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 27 Feb 2020 15:07:59 -0500
Received: from hkpgpgate102.nvidia.com (Not Verified[10.18.92.100]) by nat-hk.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5e58219a0000>; Fri, 28 Feb 2020 04:07:54 +0800
Received: from HKMAIL103.nvidia.com ([10.18.16.12])
  by hkpgpgate102.nvidia.com (PGP Universal service);
  Thu, 27 Feb 2020 12:07:54 -0800
X-PGP-Universal: processed;
        by hkpgpgate102.nvidia.com on Thu, 27 Feb 2020 12:07:54 -0800
Received: from HKMAIL101.nvidia.com (10.18.16.10) by HKMAIL103.nvidia.com
 (10.18.16.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 27 Feb
 2020 20:07:54 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.106)
 by HKMAIL101.nvidia.com (10.18.16.10) with Microsoft SMTP Server (TLS) id
 15.0.1473.3 via Frontend Transport; Thu, 27 Feb 2020 20:07:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BpzOo8V+sq4vYKCN4jFZRaLlXHfJcavPTMEAPnRPk4X0cGdaC+Bt7nl76bxz8gFqU3A4+39aRrivgnCq6zib6sxwVyYDGKv5eDMX1i6jwHHRjav3wk50Zg0l64XFTLKtEZjCn0XHFpxl6uvaXZqqyhHRXzZkrPwW67vZMsPaVgjrYBQ5ZJ06PpCzCJvDgdMOiqedoHns4L877N14RuR9lfv/rdkbIfK5alu699SwNqvC7FMXSMraE4Fek3Re0Ico8ANDW1ohLlVr+LGQVZKklxKPfe9TqccLY+SP5Subbumx29A+AhIpHkPRkYkqh6KuBoUqf4o54Fj2MU4zqX/PJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tnIaY2arrk8yDeTfPRcD1I59bRU1aJrHAX75EBiWzLA=;
 b=NHUds/tT2eCkv6sei8HwDjVjBY/wkuhx9K15+g28uAjk/rgOlfrZ91WD+oFVInaYcWyXGY3YKKs2r17yG47wzFgU1wL/bJVeiR8brobsqqrPmPQy2psVJ7Py3/FoYWhp/56j+pB2HRqSu50dAg/9uLGUW2BMLAph1bpaZ0RqPcetdrjbSwtgssdX5Z51kNUc84ADEYkKOe5pHwO5be9sHjzUtehTtfRNXRih748H9l81+HQQJGLyaTAvf0+FVgi4kF9r5zPUz5IrwgNKedbNBSTipQfSlUKryAbWADXK85pROK8P5mIwIbP8msvR6Jie5yvqFCRJd2tcT95d8zWqQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
Received: from BYAPR12MB2727.namprd12.prod.outlook.com (2603:10b6:a03:71::22)
 by BYAPR12MB2790.namprd12.prod.outlook.com (2603:10b6:a03:69::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2750.21; Thu, 27 Feb
 2020 20:07:52 +0000
Received: from BYAPR12MB2727.namprd12.prod.outlook.com
 ([fe80::b874:508d:247f:e4f6]) by BYAPR12MB2727.namprd12.prod.outlook.com
 ([fe80::b874:508d:247f:e4f6%4]) with mapi id 15.20.2772.012; Thu, 27 Feb 2020
 20:07:52 +0000
From:   Ajay Gupta <ajayg@nvidia.com>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Ajay Gupta <ajaykuee@gmail.com>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: RE: [PATCH] usb: typec: ucsi_ccg: workaround for NVIDIA test device
Thread-Topic: [PATCH] usb: typec: ucsi_ccg: workaround for NVIDIA test device
Thread-Index: AQHV5rFR8QjVzCS8AEK2CDaHDsQr6KgvH5cAgAADyACAAGIigA==
Date:   Thu, 27 Feb 2020 20:07:51 +0000
Message-ID: <BYAPR12MB2727E6CBD165F9E5B4B4AC34DCEB0@BYAPR12MB2727.namprd12.prod.outlook.com>
References: <20200218231520.12208-1-ajayg@nvidia.com>
 <20200227140204.GD10532@kuha.fi.intel.com>
 <20200227141536.GE10532@kuha.fi.intel.com>
In-Reply-To: <20200227141536.GE10532@kuha.fi.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Enabled=True;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_SiteId=43083d15-7273-40c1-b7db-39efd9ccc17a;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Owner=ajayg@nvidia.com;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_SetDate=2020-02-27T20:07:50.6615319Z;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Name=Unrestricted;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Application=Microsoft Azure
 Information Protection;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_ActionId=39f4d7e9-caa6-40ad-b2e4-36cf49e639e3;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Extended_MSFT_Method=Automatic
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=ajayg@nvidia.com; 
x-originating-ip: [216.228.112.22]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ae1c7dd3-a161-41d2-5b44-08d7bbc0b9e0
x-ms-traffictypediagnostic: BYAPR12MB2790:
x-microsoft-antispam-prvs: <BYAPR12MB2790A41237359CAAAB2C67B9DCEB0@BYAPR12MB2790.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 03264AEA72
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(346002)(366004)(376002)(136003)(396003)(39860400002)(189003)(199004)(186003)(64756008)(4326008)(66556008)(55016002)(9686003)(8936002)(76116006)(5660300002)(66476007)(66946007)(66446008)(86362001)(6506007)(53546011)(52536014)(8676002)(71200400001)(26005)(110136005)(81156014)(7696005)(478600001)(2906002)(316002)(33656002)(81166006);DIR:OUT;SFP:1101;SCL:1;SRVR:BYAPR12MB2790;H:BYAPR12MB2727.namprd12.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nvidia.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: aDJ9muvbHTnu30ldx78pQU9UBDLxIRgixSMrysAuJPIhU1+wIAeqlVKr/RJwIXjeSsBIc8AKwkFfngK3z8FnkLkmk800MTj7XT7lSvcpz1CU1RYoQWZ/kAu/X/y5vVJtU3ZDTnpe1yLUE/UymbaoBgYh1hd7nTfyPFo6yLu55D1mDqw3uG+eJP5yFm5sBSJ36wHNfXsFTfzVp0RhV90LsXv0+ioIczYui/X5XktrsoU2t7TYCkkVsktxVD0WkU9tiTo8I1m/ijfIV79+g0D4nPXnaAMTKXWJWHRcd2ll+ThW0sJx+R4m8fL+TuXm+Yrxi3xSVLNJ/GsuixP/HIFyVZlme6+IriRkfdTlVOgAsXO8iP45pVNhsisS63Wd6n3qDETKVuaXuiIQ7m3ZGLdDcGOw7P+MjOpgfgKZDBuTpeLovy0BuhfAHKqHTJHPCoFw
x-ms-exchange-antispam-messagedata: 3PSyR8e09w0HW9V5rd6rOuEzIcQdd1QYZglfkfW2R6qCK6m+LqeqWW1Ua/kyuPbkKgCeGDkWRNSeTPgnZ1FkgWrrcsoLFciKpv4HEJWbtkNWjoAH9NQyuo5oJnOUfv97K5lrZAhmSMdTzO0OuG387g==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: ae1c7dd3-a161-41d2-5b44-08d7bbc0b9e0
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Feb 2020 20:07:51.9949
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1PNkhCLJOw3JkhHafrQOAMGE64xsEmkWoHv4puZIrBMv1YtQ6j69G/nkSm9/iFIkF+nYlJ3+QDauA+gc7yGjPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2790
X-OriginatorOrg: Nvidia.com
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1582834074; bh=tnIaY2arrk8yDeTfPRcD1I59bRU1aJrHAX75EBiWzLA=;
        h=X-PGP-Universal:ARC-Seal:ARC-Message-Signature:
         ARC-Authentication-Results:From:To:CC:Subject:Thread-Topic:
         Thread-Index:Date:Message-ID:References:In-Reply-To:
         Accept-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:msip_labels:
         authentication-results:x-originating-ip:x-ms-publictraffictype:
         x-ms-office365-filtering-correlation-id:x-ms-traffictypediagnostic:
         x-microsoft-antispam-prvs:x-ms-oob-tlc-oobclassifiers:
         x-forefront-prvs:x-forefront-antispam-report:received-spf:
         x-ms-exchange-senderadcheck:x-microsoft-antispam:
         x-microsoft-antispam-message-info:
         x-ms-exchange-antispam-messagedata:x-ms-exchange-transport-forked:
         MIME-Version:X-MS-Exchange-CrossTenant-Network-Message-Id:
         X-MS-Exchange-CrossTenant-originalarrivaltime:
         X-MS-Exchange-CrossTenant-fromentityheader:
         X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
         X-MS-Exchange-CrossTenant-userprincipalname:
         X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-OriginatorOrg:
         Content-Language:Content-Type:Content-Transfer-Encoding;
        b=iw8+oHrfDov8Z/il7x5Wf8i8t5EoqUY9oz95wyotn0rm9eOK137Jho7HliqVyN06O
         ixEmDwXaSE1x/2BJqU+KPzGgBJMaP8+VZFWitzFp+CTO8UUqisjK/nbcRaIpFp4BlM
         dPO/RgyGTvtXnHP/e06kIeHvfw0beg+2JpuknYeZM0v7sXav/x14DoL0ygDtd4XDMc
         87icUmZzw6kGUOzdqyEG1MSf5VlOPQm5kNbgJb8eDn0UuDtdio7f8/omuLUpL6frGy
         8av53ovUrnfdNa5HWXxUBURPD+Uo+PrdC4NLsbkneyPlxhLd2uvYr6R2/nOLTR1h2W
         3FXTln8JjWX+Q==
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

SGkgSGVpa2tpDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSGVpa2tp
IEtyb2dlcnVzIDxoZWlra2kua3JvZ2VydXNAbGludXguaW50ZWwuY29tPg0KPiBTZW50OiBUaHVy
c2RheSwgRmVicnVhcnkgMjcsIDIwMjAgNjoxNiBBTQ0KPiBUbzogQWpheSBHdXB0YSA8YWpheWt1
ZWVAZ21haWwuY29tPg0KPiBDYzogbGludXgtdXNiQHZnZXIua2VybmVsLm9yZzsgQWpheSBHdXB0
YSA8YWpheWdAbnZpZGlhLmNvbT4NCj4gU3ViamVjdDogUmU6IFtQQVRDSF0gdXNiOiB0eXBlYzog
dWNzaV9jY2c6IHdvcmthcm91bmQgZm9yIE5WSURJQSB0ZXN0IGRldmljZQ0KPiANCj4gDQo+IE9u
IFRodSwgRmViIDI3LCAyMDIwIGF0IDA0OjAyOjA3UE0gKzAyMDAsIEhlaWtraSBLcm9nZXJ1cyB3
cm90ZToNCj4gPiBUaGlzIGRpZCBub3QgY29tcGlsZToNCj4gPg0KPiA+IGRyaXZlcnMvdXNiL3R5
cGVjL3Vjc2kvdWNzaV9jY2cuYzogSW4gZnVuY3Rpb24g4oCYdWNzaV9jY2dfcmVhZOKAmToNCj4g
PiBkcml2ZXJzL3VzYi90eXBlYy91Y3NpL3Vjc2lfY2NnLmM6NTA1OjIyOiBlcnJvcjoNCj4g4oCY
VVNCX1RZUEVDX05WSURJQV9WTElOS19EQkdfVkRP4oCZIHVuZGVjbGFyZWQgKGZpcnN0IHVzZSBp
biB0aGlzIGZ1bmN0aW9uKTsNCj4gZGlkIHlvdSBtZWFuIOKAmFVTQl9UWVBFQ19OVklESUFfVkxJ
TktfU0lE4oCZPw0KPiA+ICAgNTA1IHwgICAgICAgIGFsdFswXS5taWQgPT0gVVNCX1RZUEVDX05W
SURJQV9WTElOS19EQkdfVkRPKSB7DQo+ID4gICAgICAgfCAgICAgICAgICAgICAgICAgICAgICBe
fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn4NCj4gPiAgICAgICB8ICAgICAgICAgICAgICAg
ICAgICAgIFVTQl9UWVBFQ19OVklESUFfVkxJTktfU0lEDQo+ID4gZHJpdmVycy91c2IvdHlwZWMv
dWNzaS91Y3NpX2NjZy5jOjUwNToyMjogbm90ZTogZWFjaCB1bmRlY2xhcmVkDQo+ID4gaWRlbnRp
ZmllciBpcyByZXBvcnRlZCBvbmx5IG9uY2UgZm9yIGVhY2ggZnVuY3Rpb24gaXQgYXBwZWFycyBp
bg0KPiA+IGRyaXZlcnMvdXNiL3R5cGVjL3Vjc2kvdWNzaV9jY2cuYzo1MDY6MTg6IGVycm9yOg0K
PiDigJhVU0JfVFlQRUNfTlZJRElBX1ZMSU5LX0RQX1ZET+KAmSB1bmRlY2xhcmVkIChmaXJzdCB1
c2UgaW4gdGhpcyBmdW5jdGlvbik7DQo+IGRpZCB5b3UgbWVhbiDigJhVU0JfVFlQRUNfTlZJRElB
X1ZMSU5LX1NJROKAmT8NCj4gPiAgIDUwNiB8ICAgICBhbHRbMF0ubWlkID0gVVNCX1RZUEVDX05W
SURJQV9WTElOS19EUF9WRE8gfA0KPiA+ICAgICAgIHwgICAgICAgICAgICAgICAgICBefn5+fn5+
fn5+fn5+fn5+fn5+fn5+fn5+fn5+fg0KPiA+ICAgICAgIHwgICAgICAgICAgICAgICAgICBVU0Jf
VFlQRUNfTlZJRElBX1ZMSU5LX1NJRA0KPiANCj4gU29ycnksIEkgd2FzIHdvcmtpbmcgb24gdG9w
IG9mIHRoZSB3cm9uZyBicmFuY2guIFRoZSBwYXRjaCBkb2VzIGNvbXBpbGUNCj4gZmluZS4uLg0K
PiANCj4gPiBBbGwgdGhvc2UgbmVzdGVkIGNvbmRpdGlvbnMgbWFrZSB0aGUgY29kZSBhIGJpdCBk
aWZmaWN1bHQgdG8gcmVhZCBmb3INCj4gPiBtZS4gWW91IGNvdWxkIGhhbmRsZSB0aGUgTlZJRElB
IGFsdCBtb2RlIGluIGl0cyBvd24gZnVuY3Rpb24uIEknbQ0KPiA+IGF0dGFjaGluZyBhIGRpZmYg
dGhhdCB5b3Ugc2hvdWxkIGJlIGFibGUgdG8gYXBwbHkgb24gdG9wIG9mIHlvdXIgcGF0Y2gNCj4g
PiB0aGF0IHNob3VsZCBtYWtlIHRoZSBjb2RlIGEgYml0IGVhc2llciB0byByZWFkLg0KPiANCj4g
SSBhdHRhY2hlZCBhIGZpeGVkIHZlcnNpb24gb2YgdGhlIGRpZmYuDQpUaGFua3MgZm9yIHJldmll
dy4gSSBoYXZlIHVwZGF0ZWQgdGhlIGNoYW5nZSBhbmQgcG9zdGVkIHYyLg0KDQp0aGFua3MNCj4g
bnZwdWJsaWMNCj4gDQo+IHRoYW5rcywNCj4gDQo+IC0tDQo+IGhlaWtraQ0K
