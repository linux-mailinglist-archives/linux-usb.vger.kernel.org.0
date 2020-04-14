Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 181061A7472
	for <lists+linux-usb@lfdr.de>; Tue, 14 Apr 2020 09:14:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406467AbgDNHO3 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 14 Apr 2020 03:14:29 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.73.133]:49172 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728832AbgDNHO1 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 14 Apr 2020 03:14:27 -0400
Received: from mailhost.synopsys.com (badc-mailhost2.synopsys.com [10.192.0.18])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 4AE26401E3;
        Tue, 14 Apr 2020 07:14:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1586848466; bh=6aqkqkyhndMQEgflwkkPv8M/yiwtlypA6ejvIUAlz9I=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=C8XpyCkxJbyezIpK0N7PkEA3XhUR4q4iUu7Ped0WRkThaEOZYXN5IzR0skqhafL4f
         eEnKAgnzy6Kt6quY2oXGoKgbzyaJnty0T4EA/fZ2Z9FLUAq6Q4Tk4/WhWd5wY/nUdy
         0B/aZe5+l/S3wJaN2OlCeb2vSaFVVwQ56yRFcbNjsurvLI9ZsrheUfxG2lwPwCEAwv
         5sy9IX9G6mCqJuJVJ5gq2sIWmZUME+4rGPn3OhWUYd2XrsZlHMCMascPxZ68gvx9WU
         lWAull1Q1wfPpNQQIh0HXcqdyTBVfxxqQ9URAnF0DabH0p4PJxCoQ+iJl0Ob3GMdnP
         cRNBWB81LZauQ==
Received: from US01WEHTC3.internal.synopsys.com (us01wehtc3.internal.synopsys.com [10.15.84.232])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id 7F85BA0069;
        Tue, 14 Apr 2020 07:14:25 +0000 (UTC)
Received: from us01hybrid1.internal.synopsys.com (10.200.27.51) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Tue, 14 Apr 2020 00:14:24 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.200.27.51) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Tue, 14 Apr 2020 00:14:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RynIZMEoc1fLThlfBgjcFEr1D/orXMLvRtuFcYS51MjiN++LzcXW9ETUCuMCMXMr2jPqMR6fnswWPNF4GjSW6RbpHtcgqOZTrDIYT2Qga/nwnWn0pynkmhwtxusQw25ozKYZd8XUmVTHb6JehnwL6ayGYGkJ7NG3u3/4DjU2geiu52ssNLBUQ320WWfegN6wWVwq5u8TuTuL6x+GIeo2LruGUVCoOfYh8nvQ/IBHy9FhaWncTvPgksxn/rYtcz+CgL/Glsn1AE1VB7urBaijgb0sTPpUCv3+VDraHxyWzv0TsjRB+VShFYOlJ8Do5PbnA4dd/UZa2wDgKPLZ3Z2M/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6aqkqkyhndMQEgflwkkPv8M/yiwtlypA6ejvIUAlz9I=;
 b=WuQpldwWmEnFSCoPDzbUUVv7YB1GIFmVnGKmQhSgtlZGb6Ad6+8g+3n8k5pomiP8O6oyCTRFvlewWSTLYlUgfRoud7M6pMLiP+DDsBu/BgmviBXCaw68YwyhiAfjlkO314rCAOgPyG0YZFSYmQXmio0J42eau7nsI/kXgU2MjOmYy8e6g8oiSAUiGq+ubYbjwDYRfOYbCoup1RFJet5jdrmxGOIJH4EvgBakl1CC0xBy/VsHEX+9XBgnuG0fKztiecv3KwZ6pV7U7ljTnSX6WB5c9U4H8ViFhx60uWXsRVlD/lMK4qMueTSV0VZy8BTRXu5XraV77v4ga32cgJjXEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6aqkqkyhndMQEgflwkkPv8M/yiwtlypA6ejvIUAlz9I=;
 b=dtT4S2SRdL/I5D8mOW8GvI8c2zwX/otxJMh/KxH9dsFXDsKw5NZattCzxUFjqcowMnf7uTGDZRWVHr0xeCyd6PgFPrFqkrGVrBmv3U/Z1Uy0sq7HrqSBqBMxlmbRbQzvElIm7q3TZBF3dIzofIAHJ7fbp2daZnesI8MOVidfBPc=
Received: from SN1PR12MB2557.namprd12.prod.outlook.com (2603:10b6:802:22::15)
 by SN1PR12MB2448.namprd12.prod.outlook.com (2603:10b6:802:28::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2900.17; Tue, 14 Apr
 2020 07:14:22 +0000
Received: from SN1PR12MB2557.namprd12.prod.outlook.com
 ([fe80::20d2:fe98:5580:932d]) by SN1PR12MB2557.namprd12.prod.outlook.com
 ([fe80::20d2:fe98:5580:932d%7]) with mapi id 15.20.2900.028; Tue, 14 Apr 2020
 07:14:22 +0000
From:   Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
To:     Marek Vasut <marex@denx.de>,
        Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
CC:     Amelie Delaunay <amelie.delaunay@st.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: Re: [PATCH] [RFC] usb: dwc2: Run the core connect in dwc2_hcd_init()
Thread-Topic: [PATCH] [RFC] usb: dwc2: Run the core connect in dwc2_hcd_init()
Thread-Index: AQHWEaBFUZHLydAVY0yALpZJ1gABx6h3ITiAgAACTgCAAAlrgIAAGd8AgADukoA=
Date:   Tue, 14 Apr 2020 07:14:22 +0000
Message-ID: <d1b36da4-b506-2f86-f5ad-95bf3aac4485@synopsys.com>
References: <20200413143107.181669-1-marex@denx.de>
 <31b679d3-d3e4-0220-ec4b-58eada4d21d4@synopsys.com>
 <b20fb33d-7fdd-5785-8f72-74900eb4d328@denx.de>
 <9906c2da-8a20-eae7-d69e-6947085edf84@synopsys.com>
 <b64f41ac-2d70-55a3-ab6a-77383cd463eb@denx.de>
In-Reply-To: <b64f41ac-2d70-55a3-ab6a-77383cd463eb@denx.de>
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
x-ms-office365-filtering-correlation-id: 43bab416-6e53-4357-d729-08d7e043751b
x-ms-traffictypediagnostic: SN1PR12MB2448:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SN1PR12MB24486434024851159DC452F1A7DA0@SN1PR12MB2448.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0373D94D15
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN1PR12MB2557.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(10019020)(39860400002)(376002)(136003)(346002)(396003)(366004)(26005)(36756003)(6512007)(2616005)(54906003)(8676002)(110136005)(2906002)(6486002)(86362001)(31696002)(4326008)(76116006)(91956017)(8936002)(81156014)(31686004)(316002)(53546011)(6506007)(71200400001)(66946007)(186003)(64756008)(5660300002)(66446008)(66556008)(66476007)(478600001);DIR:OUT;SFP:1102;
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: p4k/k7jbQgyBXRHCaXUWoPs41Sc9ap54Zu7vk4HRkxa5Ms5SBnbJSphOHYp5ja9nXp67Wme3jsj35S+onOKgI8MQGEuNd38NSAGOCeb7ZrzUZk5/zYhmvwHDM8E3lAboNBJcawwJq4lTX1SCKXj2Lf4YNzD3uqPYEjsNP2mlV5cjs+ZDMFpedAVrv6DmhuDT4q8xXbO6uw5Rao9s/wJ7kIvDk8zBPacRgw9RE8borr/sTlGMDa4hvG94EQYvIo9LM69bQ75bYXpjOe3O2cHvuCWJBzyZh1Di18MeIHNM/deN4jqCIb255mIXLaaUcvbI+KObGCfRY5BJayVMEG+veIu0yGZRdTarlUmwJBysUDAODDvMHFv5A3groW0+BQdPVkdgh/YOj0Z/mIuB/9AmsdeVcXWBisFHDtKysBgTTT7dUhlS4pbzMzLpnKOf8xJS
x-ms-exchange-antispam-messagedata: 3708fzr0EWLAfWP+luERqvNP80DpNeQ/mCacMTGLg1XgEC3oO2uyiahfYhO4A42iX6iB1xfhXlAxstfoVBnz0UVzeqqY8ppTK4BdJwdmZPklH46+35uYrEc8A+QkgYcZ9WDMIMqMT+z049mVIPVx8A==
Content-Type: text/plain; charset="utf-8"
Content-ID: <0B60CF04603BA54B85E9B3063632CB6D@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 43bab416-6e53-4357-d729-08d7e043751b
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Apr 2020 07:14:22.7454
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7HDHPg5PjJ1tiE7/tWVA7pTG9ulHxnbQDS+mm0jlfBx1iLAjW8knb4xfh/rwMyPwAf0ra/NaEuF7ilsdqDdfxw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR12MB2448
X-OriginatorOrg: synopsys.com
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

SGksDQoNCk9uIDQvMTMvMjAyMCA5OjAwIFBNLCBNYXJlayBWYXN1dCB3cm90ZToNCj4gT24gNC8x
My8yMCA1OjI3IFBNLCBNaW5hcyBIYXJ1dHl1bnlhbiB3cm90ZToNCj4+IEhpLA0KPiANCj4gSGks
DQo+IA0KPj4gT24gNC8xMy8yMDIwIDY6NTQgUE0sIE1hcmVrIFZhc3V0IHdyb3RlOg0KPj4+IE9u
IDQvMTMvMjAgNDo0NSBQTSwgTWluYXMgSGFydXR5dW55YW4gd3JvdGU6DQo+Pj4+IEhpLA0KPj4+
DQo+Pj4gSGksDQo+Pj4NCj4+Pj4gT24gNC8xMy8yMDIwIDY6MzEgUE0sIE1hcmVrIFZhc3V0IHdy
b3RlOg0KPj4+Pj4gT24gU1RNMzJNUDEgd2l0aG91dCB0aGUgU1RVU0IxNjAwIFVTQi1DIGNoaXAg
KGkuZS4gd2l0aCBwbGFpbiBVU0ItT1RHDQo+Pj4+DQo+Pj4+IENvdWxkIHlvdSBwbGVhc2UgcHJv
dmlkZSBHU05QU0lELCBHSFdDRkcxLTQgcmVnaXN0ZXIgdmFsdWVzIGZvciBTVE0zMk1QMS4NCj4+
Pg0KPj4+IEdTTlBTSUQgPSAweDRmNTQzMzBhDQo+Pj4gR0hXQ0ZHMSA9IDB4MDAwMDAwMDANCj4+
PiBHSFdDRkcyID0gMHgyMjhmZTE1MA0KPj4+IEdIV0NGRzMgPSAweDAzYjg5MmU4DQo+Pj4gR0hX
Q0ZHNCA9IDB4ZTNmMDAwMzANCj4+Pg0KPj4gU1RNMzJNUDEgY29yZSBkb2Vzbid0IHN1cHBvcnQg
QUNHIGZlYXR1cmU6IEdIV0NGRzRfQUNHX1NVUFBPUlRFRCA9IDAuDQo+PiBTbywgaW4geW91ciBw
YXRjaCBmb3IgU1RNMzJNUDEgYXQgbGVhc3QgdGhlc2UgbGluZXMgYXJlIG5vIG1lYW5pbmc6DQo+
Pg0KPj4gKwkvKiBFbmFibGUgQUNHIGZlYXR1cmUgaW4gZGV2aWNlIG1vZGUsaWYgc3VwcG9ydGVk
ICovDQo+PiArCWR3YzJfZW5hYmxlX2FjZyhoc290Zyk7DQo+IA0KPiBUaGUgY29tbWVudCBzYXlz
IGl0IGVuYWJsZXMgdGhlIEFDRyBvbmx5IGlmIGl0J3Mgc3VwcG9ydGVkLg0KPiANCj4+IExvb2tz
IGxpa2UgeW91IGp1c3QgY29waWVkIHRoaXMgY2hpcnAgZnJvbSBkd2MyX2Nvbm5faWRfc3RhdHVz
X2NoYW5nZSgpDQo+PiBmdW5jdGlvbi4NCj4gDQo+IFllcywgdGhhdCdzIGNvcnJlY3QsIHZlcmJh
dGltLg0KPiANCj4+IGR3YzJfaHNvdGdfY29yZV9pbml0X2Rpc2Nvbm5lY3RlZCgpIGZ1bmN0aW9u
IGlzIGRldmljZSBtb2RlIGZ1bmN0aW9uLA0KPj4gbm90IHN1cmUgdGhhdCBpdCdzIHNhZmUgdG8g
Y2FsbCBpdCBmb3IgaG9zdCBtb2RlIGluIGR3YzJfaGNkX2luaXQoKS4NCj4gDQo+IE9LIHdlbGws
IGlmIEkgZG9uJ3QgdXNlIHRoaXMgcGF0Y2ggYW5kIEkgcGx1ZyBpbiBhIFVTQiBjYWJsZSBmcm9t
IHRoZQ0KPiBob3N0IFBDLCB0aGVuIHRoZSBTVE0zMk1QMSBpc24ndCBkZXRlY3RlZCBieSB0aGUg
aG9zdCBQQy4gRG8geW91IGhhdmUNCj4gYW55IGlkZWEgd2hhdCB0aGUgY29ycmVjdCBmaXggd291
bGQgYmUgdGhlbiA/DQo+IA0KDQpQbGVhc2UgcHJvdmlkZSB3aXRob3V0IHlvdXIgcGF0Y2g6DQox
LiBkZWJ1Z2ZzOiBwYXJhbXMgYW5kIGh3X3BhcmFtcw0KMi4gZGVidWcgbG9nDQozLiByZWdkdW1w
IGJlZm9yZSBhbmQgYWZ0ZXIgY29ubmVjdGluZyBkZXZpY2UgdG8gaG9zdCB3aGVyZSBpc3N1ZSBz
ZWVuLg0KDQpUaGFua3MsDQpNaW5hcw0K
