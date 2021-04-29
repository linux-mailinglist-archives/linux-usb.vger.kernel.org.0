Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 53BB836E2C0
	for <lists+linux-usb@lfdr.de>; Thu, 29 Apr 2021 02:54:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229888AbhD2Azk (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 28 Apr 2021 20:55:40 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.87.133]:53354 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229479AbhD2Azj (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 28 Apr 2021 20:55:39 -0400
Received: from mailhost.synopsys.com (sv1-mailhost1.synopsys.com [10.205.2.131])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 6F7ADC043E;
        Thu, 29 Apr 2021 00:54:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1619657693; bh=VfKBgtzp65zGNt91XueW933w7Hk6PVy7KzpchuBIIEs=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=ZDa5l8gXFnOBxAn+VF0b5vSnbGXdxszcDvLipkakR4UF0poVkO9NooNu9/Cs3KhHs
         ljCdg9YdsTkNMdjhQqk1KPFhv9C/hNLAuIhBmO2CwE+txtH/f9Cy9+g6N/eh4b8mxA
         eEjnOnwzExrazP+v9sOHP8fwRvjaJroEe5mpWSOiGSDgsvuO80JGtE0yTmnTXULh7F
         dlmHDRBYRA435MbKX+trD0KrSzF1pyyWz7HAXJ6VOmo7+OOJriX0mfDxxG1pVrp4hO
         QdY40n4Cu7juUx9+EIrLRpiWVerMrItv/HCaYIIgwEGCvDW5lyMB3XMuL1UMhCeW4Q
         7UUuSeRGaPEBw==
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com [10.4.161.137])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id 3D650A006A;
        Thu, 29 Apr 2021 00:54:52 +0000 (UTC)
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2044.outbound.protection.outlook.com [104.47.66.44])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id 5E813800C5;
        Thu, 29 Apr 2021 00:54:50 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=thinhn@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="CrwYnYiF";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E1ThD6V2ZlMOVivjUAgXEhGF/Y1LRz6MULseS41sGidVyT8mTLgezCTpNsux7hWewy0glhD/yyH1827+jd9GuERdvekxLJOSRmmfNA47dr6/0VtJrL23rFoG+3R+kwi9cfyzQTwuia8VnSZoOWfyOk5JsEkOKtZRaRgWxSuHZzkI5pFagBQYyD0GaPHpcg3dOSfIKMJRcHIXQIoeKFqxLWlvPa7gpxfaI/H0s9DK0ZbEzc822yQCbuClbO+RZeOb4iGGMnUKAYxSPPlUi5+HjeL6I1cYvcIYxV9gccJyQZVwm6GKNwb8S+S2i+OHGYu9rmZAg8oP4/y5hZoW0Tjk4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VfKBgtzp65zGNt91XueW933w7Hk6PVy7KzpchuBIIEs=;
 b=iSP14vcHTVtFO+3u7wyjP28mUVwGbvrfWKmf1nAo3dwHhZS/0mg0zTz2fARsCLiHFwX1sxo5DVKwAA58a/rE+GVClgwyJxdXdUtUou0v5ax4C4nvWwIJC/EJBSUc75VNfKduV+W2ns0GepTMhJJ8Hgmef7GHZCMyitZXm+u7dszVi9Z7iyZE7Bs6byv0jGKCF9Fn2dZf0Q6tcfWKEn8eemru7kvIfqYcCg6tSnvFTZa8RgC7GeSr91BIjLnXj2wnFfd8nIrJPICA/eCEgXDzkMobdxq09aktSPwfL8vgiHz1duBgTT/uEWgY0ZJv09PqCXE5uW3fIW81cJhk+Nk+0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VfKBgtzp65zGNt91XueW933w7Hk6PVy7KzpchuBIIEs=;
 b=CrwYnYiFNkTFT+EGBMOUtXmREeAI5758fOL/4045t/5FFJXW+qlNtd0vgo5UcSnQ18TnGTb+NIWQkygPBhYrdEBuTUKW07kinxrr0Dnk+E11yIw/wyvuzRHCIbsUqesnSw84mPK6KnwiIPbx25zBbYO1XJPnKOysuuvIMGNJIRY=
Received: from BYAPR12MB4791.namprd12.prod.outlook.com (2603:10b6:a03:10a::12)
 by BYAPR12MB2662.namprd12.prod.outlook.com (2603:10b6:a03:61::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.25; Thu, 29 Apr
 2021 00:54:49 +0000
Received: from BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::7c97:6a33:14c4:dd8c]) by BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::7c97:6a33:14c4:dd8c%6]) with mapi id 15.20.4087.025; Thu, 29 Apr 2021
 00:54:48 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Mathias Nyman <mathias.nyman@linux.intel.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Mathias Nyman <mathias.nyman@intel.com>
CC:     John Youn <John.Youn@synopsys.com>
Subject: Re: [PATCH v2 3/7] usb: xhci: Check for blocked disconnection
Thread-Topic: [PATCH v2 3/7] usb: xhci: Check for blocked disconnection
Thread-Index: AQHXLaMGEnyCiS/nrkqrVSUQ+6GpwqrIcYeAgACdG4CAAPvlgIAAvrQA
Date:   Thu, 29 Apr 2021 00:54:48 +0000
Message-ID: <53b8e273-8e11-6703-4895-2ed717a350ed@synopsys.com>
References: <cover.1618014279.git.Thinh.Nguyen@synopsys.com>
 <07196754c6de290bb46cc235ce6e96c5df304150.1618014279.git.Thinh.Nguyen@synopsys.com>
 <845ec8a0-43f2-a28e-5edc-d7a47ccabdf5@linux.intel.com>
 <b5c8bfc8-20cf-fad1-f053-971cb98348ad@synopsys.com>
 <aa64a81c-8e60-f933-5d17-f511e47507f7@linux.intel.com>
In-Reply-To: <aa64a81c-8e60-f933-5d17-f511e47507f7@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
authentication-results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none
 header.from=synopsys.com;
x-originating-ip: [98.248.94.126]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 01b96b5c-bb92-4ca0-3aec-08d90aa963cb
x-ms-traffictypediagnostic: BYAPR12MB2662:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR12MB266207CB92DE7FA595C2FBF1AA5F9@BYAPR12MB2662.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: UdI/pWkcjXyINzQAvAuG12kYAAzpZvFFHACFXXQMeKlMRlnoJm5Ee7+tMRz31MnARZ3lxrjY7Bzv3GPIJ7Ya6brwZZVMKI5H4DtZ2+LwWbM/HFgRKEJFSQjk8i0WtOzkEEvFScylUclArkiw0uOOlwnzh5K/Bap9KF8PwQVBAt6jFHUoq+/c72zaU/AdgnscCjX6/e6yXD1STdXJf3pg1lRZenOPlG1Kpym52NXXmOMEeyVep7bZQ3CCjc2yAx+2+Oha1NFDrquDUIOrcn0ZALed8C8HS7SrRZOik+R6LG3ma5rFjcW/IM23LMk5/SRu4qbSLkpDS7DZoX8NdVOa7KwhPOgrXzd+6IqPUe4BzhDLirZXMegaVRf9fImavrGQ2/i9VdwB0ELFPM/ZszNO6Nys1iPcCVPFD12zhYCmTBMXl8H8zFzjU4y8hiVBG26nq/pPCCaczV3qxIhbfwTmP9qO/WITj+B563/RdM9RH4sgpEmpT+7vTkyfesGUIK0A+Rs0oN7dVL5jI/va1sQGz5yRk9QKPOyxSCs4rKMCL5VIlS1ciDb8EDZI6hnGdLsuOn/d52AsfO8ythEY2FLVaX2Y+rk28CLTKfsGbRdrGPAhOZFyuPfr1yKu33ZG5DsYUc3X7K7RnNi5uhJrN5FUxf29wZ7mdfsz2GRa/iytynSG+f3yKgfBRpGYuxsWVf3E
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB4791.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(366004)(39850400004)(136003)(376002)(346002)(76116006)(66556008)(86362001)(66446008)(26005)(64756008)(6506007)(66946007)(15650500001)(66476007)(2906002)(186003)(4326008)(6512007)(38100700002)(122000001)(478600001)(5660300002)(2616005)(8936002)(316002)(8676002)(71200400001)(6486002)(31696002)(83380400001)(110136005)(31686004)(36756003)(107886003)(45980500001)(43740500002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?utf-8?B?ZW1qUURkL0ppSDgwSEt6MFE4MzVqdzY5WHBKUS9hbFlFVnhHMktOL1lQR0d5?=
 =?utf-8?B?NXlUTEVoSGpGSS9lRVhwUVYyZXpSalcxVC93anRyNVRocEdqVW14Z1J1MFpr?=
 =?utf-8?B?aWlPdzJpc1hLRnY1ZXBvSVF2aUxlNENJNVJoSVBKS1duUU1JWHlrNVpqZkZQ?=
 =?utf-8?B?dTVNcUhNY2NOQ2NuVDlMemRuN2hUamJjNzRpeXZVekJRamJ5R21NcWtuSkJP?=
 =?utf-8?B?WHk0WE8wRUlmYXBUNkIxYWpmZllQUnpRQjRHUWw3c1lwWm53OUFnVDE4ZWc0?=
 =?utf-8?B?S1Y2RDl2MWwzbXVHWDZIMHdua3JMMSsycWJmNVdlL3pObUJSb2RFZG5Gcy9O?=
 =?utf-8?B?WDllSFBIS210MUVvZ2EvVFd0eWR0WGFUVjY2MkFSczM2cVUrYmg5RXA0NVdB?=
 =?utf-8?B?QmtBYkZtaFFIQTBTRmZJTXVGekIwMzk2V0ZXcG1vaE9zWWtYK0ZacC9PNjdw?=
 =?utf-8?B?YjVDWW1SZVNBM2VzT0xSR0NqVVFDc1pFQlh4YU5JemhLdldzempyUHhPK25t?=
 =?utf-8?B?M2czYnNKZHFMdTRVMXZTeDNBV3BlUWszMzU2aWZxMkVFTCtpM3NEb0dqR0hh?=
 =?utf-8?B?OEFvUmRmTjJlRlo3Q2VzcWZZLzRSekdJVFJLRGh0QlcyTFEzZmxFT0svdVhL?=
 =?utf-8?B?M01vbksvNTV6ZXRBcGFoUDIyZzRuUFByT0lkWWFjbjhjMXk1eUVvVE1Cb0gx?=
 =?utf-8?B?K1k1TENvdlJINXlMTWFxbi9jc2UxZ05lWUI2bEMrcmFCMHd6d1lmeFE1ODB5?=
 =?utf-8?B?SEFZTzUwUWlQSEVYNU4xZlRBY1JMTG5LWVJRT3QzUW52V1pxWHdVelNWb1JR?=
 =?utf-8?B?ZUNPWmlkNEJsVDRId0FybVpBUy91Qnk4aFJnM3BYVDBIaHFob0grVzBzU1I5?=
 =?utf-8?B?a3RoZDhkY0RWZHl2YWpQNW5sZ0FoUGVXeEVhbWZYK2lkZmhvU1k2d0lWY0g0?=
 =?utf-8?B?dzZuSEd0SitCd3ZWQU5mYXRKVFFEa2NlNEZ2Tys3RjU0RXZpVmNJVUxLbndn?=
 =?utf-8?B?WlpEUWVIb1JoQjd3WTF1YktnZW9WR2JiWDNsc2o2aFVTMmxhYlUxcUhZRVdL?=
 =?utf-8?B?R1kxUWtGb1VSRE5DZ25xTDcwcWtrVkI2cmY4ZTN0TW5QSm1GTG5VaVEyY0E5?=
 =?utf-8?B?ZFlpRGM5Vk1tK1lwUStORnNYS2luY3FpMUx2akR4RGpmY0xPQ3BmNHBsVm4z?=
 =?utf-8?B?QVBsSm1FTzNUdEVYWUc3Mk80UHlZdmNMOGNmWERyTnVBbk5vYno4R0VQRWE3?=
 =?utf-8?B?aFZOTDlBeWdnY055VUZaNEcrelEvcDZ0eGtudkZseVp4NUNoM21OekpiVzdo?=
 =?utf-8?B?bDBmUGdUTHlYLzEwV2FXYXJqN1Z6S1B6cmVJQXNLZ2NMTDRMTE5LU0pUb1FD?=
 =?utf-8?B?SlhqZTlCTGlkSUx5ekFjK0dsUDlGeVYwNXdMTTFxc1NMVGhDKy9HcGdYa0Vp?=
 =?utf-8?B?ZnUrUEFMWFV4SVBKU1Fyc3hOalB5bE9JYVF4ajVmMUE4cVJCc25FUXZUTDZW?=
 =?utf-8?B?a0VrUVZ3WjhXdkNUQnVZR3BSVit6RkZtRk1uUjBoalFKbzUvMG1HMDNnS1dG?=
 =?utf-8?B?ZmFKemVMRlU0VG9nS2pwa3pIZjUxQjdqZGRnZ3ZIMWk0S2I0N3ZsazV4ZS9v?=
 =?utf-8?B?VmVZUk1mSy9CaHg5eTBLaldxY0s5Umg4Q2V1Nys5MG0rdWt3WHVqaExZSlZT?=
 =?utf-8?B?SW1wZmtmRHF0blhCSVN2TFBsdjFMUzB4dnZVYTB4QlVpMjNMZjJzcEtuTDIr?=
 =?utf-8?Q?nCmbQuBABRqocy0s8j5TU80jOMQj2uSpSczky1z?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <95DD1A501207A24CA7DAA2624494B2CD@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4791.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 01b96b5c-bb92-4ca0-3aec-08d90aa963cb
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Apr 2021 00:54:48.7511
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DkpkAwS5TzswD0jO4uAElWy4KQ1JC5hKYWXB3z5csRGGUuvDGQKnq3fOSlIfo9NmlNODkK5lPyD6AAG4UiYZAw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2662
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

TWF0aGlhcyBOeW1hbiB3cm90ZToNCj4gT24gMjguNC4yMDIxIDEuMzAsIFRoaW5oIE5ndXllbiB3
cm90ZToNCj4+PiBPbiAxMC40LjIwMjEgMy40NywgVGhpbmggTmd1eWVuIHdyb3RlOg0KPj4+PiBJ
ZiB0aGVyZSBpcyBhIGRldmljZSB3aXRoIGFjdGl2ZSBlbmhhbmNlZCBzdXBlci1zcGVlZCAoZVNT
KSBpc29jIElODQo+Pj4+IGVuZHBvaW50KHMpIGJlaGluZCBvbmUgb3IgbW9yZSBlU1MgaHVicywg
RFdDX3VzYjMxICh2MS45MGEgYW5kIHByaW9yKQ0KPj4+PiBob3N0IGNvbnRyb2xsZXIgd2lsbCBu
b3QgZGV0ZWN0IHRoZSBkZXZpY2UgZGlzY29ubmVjdGlvbiB1bnRpbCBubyBtb3JlDQo+Pj4+IGlz
b2MgVVJCIGlzIHN1Ym1pdHRlZC4gSWYgdGhlcmUncyBhIGRldmljZSBkaXNjb25uZWN0aW9uLCBp
bnRlcm5hbGx5DQo+Pj4+IHRoZSB3YWl0IGZvciB0SG9zdFRyYW5zYWN0aW9uVGltZW91dCAoVVNC
IDMuMiBzcGVjIDguMTMpIGJsb2NrcyB0aGUNCj4+Pj4gb3RoZXIgZW5kcG9pbnRzIGZyb20gYmVp
bmcgc2NoZWR1bGVkLiBTbywgaXQgYmxvY2tzIHRoZSBpbnRlcnJ1cHQNCj4+Pj4gZW5kcG9pbnQg
b2YgdGhlIGVTUyBodWIgaW5kaWNhdGluZyB0aGUgcG9ydCBjaGFuZ2Ugc3RhdHVzLg0KPj4+Pg0K
Pj4+PiBUaGlzIGNhbiBiZSBhbiBpc3N1ZSBmb3IgYXBwbGljYXRpb25zIHRoYXQgY29udGludW91
c2x5IHN1Ym1pdHRpbmcgaXNvYw0KPj4+PiBVUkJzIHRvIHRoZSB4SENJLiBUbyB3b3JrIGFyb3Vu
ZCB0aGlzLCBzdG9wIHByb2Nlc3NpbmcgbmV3IFVSQnMgYWZ0ZXIgMw0KPj4+PiBjb25zZWN1dGl2
ZSBpc29jIHRyYW5zYWN0aW9uIGVycm9ycy4gSWYgbmV3IGlzb2MgdHJhbnNmZXJzIGFyZSBxdWV1
ZWQNCj4+Pj4gYWZ0ZXIgdGhlIGRldmljZSBpcyBkaXNjb25uZWN0ZWQsIHRoZSBob3N0IHdpbGwg
cmVzcG9uZCB3aXRoIFVTQg0KPj4+PiB0cmFuc2FjdGlvbiBlcnJvci4gQWZ0ZXIgMyBjb25zZWN1
dGl2ZSBVU0IgdHJhbnNhY3Rpb24gZXJyb3JzLCB0aGUNCj4+Pj4gZHJpdmVyIGNhbiB3YWl0IGEg
cGVyaW9kIG9mIHRpbWUgKGF0IGxlYXN0IDIgKiBsYXJnZXN0IHBlcmlvZGljIGludGVydmFsDQo+
Pj4+IG9mIHRoZSB0b3BvbG9neSkgd2l0aG91dCByaW5naW5nIGlzb2MgZW5kcG9pbnQgZG9vcmJl
bGwgdG8gZGV0ZWN0IHRoZQ0KPj4+PiBwb3J0IGNoYW5nZSBzdGF0dXMuIElmIHRoZXJlIGlzIG5v
IGRpc2Nvbm5lY3Rpb24gZGV0ZWN0ZWQsIHJpbmcgdGhlDQo+Pj4+IGVuZHBvaW50IGRvb3JiZWxs
IHRvIHJlc3VtZSBpc29jIHRyYW5zZmVycy4NCj4+Pg0KPj4+IElzIHRoYXQgZW5vdWdoPyBtYW55
IElzb2MgVVJCcyBxdWV1ZSAxNiAtIDMyIElzb2MgVFJCcyBwZXIgVVJCLg0KPj4+IEFuZCBkcml2
ZXJzIGxpa2UgVVZDIHF1ZXVlIHNldmVyYWwgVVJCcyBpbiBhZHZhbmNlLg0KPj4NCj4+IFRoYXQn
cyBmaW5lIGFzIGxvbmcgYXMgdGhlIGRyaXZlciBzdG9wcyByaW5naW5nIG1vcmUgZG9vcmJlbGwg
Zm9yIGENCj4+IGNlcnRhaW4gcGVyaW9kIG9mIHRpbWUgY3JlYXRpbmcgYSBnYXAgdGhhdCdzIGVu
b3VnaCB0byBnZXQgdGhlDQo+PiBub3RpZmljYXRpb24gZnJvbSB0aGUgaW50ZXJydXB0IGVuZHBv
aW50LiBXZSB0ZXN0ZWQgd2l0aCAxMjggaXNvYyBVUkJzDQo+PiBhbmQgd2FzIGFibGUgdG8gZGV0
ZWN0IGEgZGlzY29ubmVjdCBhZnRlciB0aGlzIGRlbGF5Lg0KPiANCj4gT2ssIGlmIG5vdCByaW5n
aW5nIHRoZSBlbmRwb2ludCBpcyBlbm91Z2ggdGhlbiB0aGF0IGlzIGJldHRlciB0aGFuDQo+IHN0
b3BwaW5nIHRoZSB3aG9sZSBlbmRwb2ludC4gDQo+IA0KPj4+PiBUaGlzIHdvcmthcm91bmQgdHJh
Y2tzIHRoZSBtYXggZVNTIHBlcmlvZGljIGludGVydmFsIGV2ZXJ5IHRpbWUgdGhlcmUncw0KPj4+
PiBhbiBlbmRwb2ludCBhZGRlZCBvciBkcm9wcGVkLCB3aGljaCBoYXBwZW5zIHdoZW4gdGhlcmUn
cyBiYW5kd2lkdGgNCj4+Pj4gY2hlY2suIFNvLCBzY2FuIHRoZSB0b3BvbG9neSBhbmQgdXBkYXRl
IHRoZSB4aGNpLT5tYXhfZXNzX2ludGVydmFsDQo+Pj4+IHdoZW5ldmVyIHRoZXJlJ3MgYSBiYW5k
d2lkdGggY2hlY2suIEludHJvZHVjZWQgYSBuZXcgZmxhZw0KPj4+PiBWREVWX0RJU0NPTk5fQ0hF
Q0tfUEVORElORyB0byBwcmV2ZW50IHJpbmdpbmcgdGhlIGRvb3JiZWxsIHdoaWxlIHdhaXRpbmcN
Cj4+Pj4gZm9yIGEgZGlzY29ubmVjdGlvbiBzdGF0dXMuIEFmdGVyIDIgKiBtYXhfZXNzX2ludGVy
dmFsIHRpbWUgYW5kIG5vDQo+Pj4+IGRpc2Nvbm5lY3Rpb24gZGV0ZWN0ZWQsIGEgZGVsYXllZCB3
b3JrIHdpbGwgcmluZyB0aGUgZG9vcmJlbGwgdG8gcmVzdW1lDQo+Pj4+IHRoZSBhY3RpdmUgaXNv
YyB0cmFuc2ZlcnMuDQo+Pj4NCj4+PiBTb3VuZHMgdmVyeSBlbGFib3JhdGUgZm9yIGEgdmVuZG9y
IHNwZWNpZmljIGRpc2Nvbm5lY3Qgd29ya2Fyb3VuZC4NCj4+PiBJc24ndCB0aGVyZSBhIHNpbXBs
ZXIgd2F5Pw0KPj4+DQo+Pj4gTWF5YmUgc3RvcCBhbGwgaXNvYyBpbiBlbmRwb2ludHMgaWYgb25l
IHRoZW0gaGFzIDMgY29uc2VjdXRpdmUgdHJhbnNhY3Rpb24gZXJyb3IsDQo+Pj4gd2FpdCBmb3Ig
MnggaHViIGludGVycnVwdCBpbnRlcnZhbCB0aW1lLCBhbmQgdGhlbiByZXN0YXJ0IHRoZSBlbmRw
b2ludHMgaWYgdGhlcmUgaXMNCj4+PiBubyBkaXNjb25uZWN0Pw0KPj4NCj4+IFdlIGNhbiBhbHNv
IGRvIHRoaXMgKGJ1dCB3aXRob3V0IHN0b3AgKyByZXN0YXJ0IHRoZSBlbmRwb2ludHMpLiBJdCBq
dXN0DQo+PiBjcmVhdGVzIGEgc2xpZ2h0bHkgbGFyZ2VyIGdhcCB0aGF0IG1heSBiZSBtb3JlIG5v
dGljZWFibGUgdG8gdGhlIHVzZXIgaWYNCj4+IHRoZXJlJ3Mgbm8gYWN0dWFsIGRpc2Nvbm5lY3Rp
b24uDQo+IA0KPiBPaywgaWYgYmxvY2tpbmcgdGhlIGRvb3JiZWxsIGlzIGVub3VnaCB0aGVuIGl0
IHNvdW5kcyBiZXR0ZXIuDQo+IA0KPiBIb3cgYWJvdXQgdGhhdCBtYXggaW50ZXJ2YWwgdHJhY2tp
bmcsIGlzIGl0IG5lY2Vzc2FyeT8NCj4gSXQgd2lsbCBibG9jayB0aGUgZG9vcmJlbGwgZnJvbSAy
NTB1cyB1cCB0byBzZXZlcmFsIHNlY29uZHMuDQo+IElzIHRoZXJlIHNvbWUgcmVhc29uYWJsZSBz
aW5nbGUgdmFsdWUgdGhhdCBjYW4gYmUgdXNlZCBpbnN0ZWFkPw0KDQpZZWFoLCBJIGFncmVlIHdp
dGggeW91LiBJIHRoaW5rIHdlIGNhbiBmaW5kIGEgbnVtYmVyIHRoYXQgc2F0aXNmaWVzIHdpdGgN
Cm1vc3QgYXBwbGljYXRpb25zIHdoaWxlIGtlZXBpbmcgdGhpcyBjaGFuZ2Ugc21hbGwgYW5kIGxl
c3MgaW50cnVzaXZlLg0KDQo+IA0KPj4+DQo+Pj4gVGhlcmUgaXMgYmlnZ2VyIGNvbmNlcm4gd2l0
aCB0aGlzIHNlcmllcywgaXQgc2NhdHRlcnMgYSBsb3Qgb2YgdmVuZG9yIHNwZWNpZmljIGNvZGUg
DQo+Pj4gYXJvdW5kIHRoZSBnZW5lcmljIHhoY2kgZHJpdmVyLiBJdCdzIG5vdCB2ZXJ5IGNsZWFy
IGFmdGVyd2FyZHMgd2hhdCBjb2RlIGlzIHBhcnQgb2YgdGhlDQo+Pj4gd29ya2Fyb3VuZCBhbmQg
d2hhdCBpcyBnZW5lcmljIGNvZGUuDQo+Pj4NCj4+PiBXZSBqdXN0IGdvdCBhIGxvdCBvZiB0aGUg
TWVkaWF0ZWsgY29kZSBtb3ZlZCB0byB4aGNpLW10ayosIG1heWJlIGl0cyB0aW1lIHRvIGFkZCB4
aGNpLXNucHMuYw0KPj4+IGluc3RlYWQgb2YgdXNpbmcgdGhlIGdlbmVyaWMgcGxhdGZvcm0gZHJp
dmVyIHdpdGggdG9ucyBvZiB3b3JrYXJvdW5kcyBhbmQgcXVpcmtzLg0KPj4+DQo+Pg0KPj4gVGhh
bmtzIGZvciB0aGUgcmV2aWV3cy4gSSBuZWVkIHRvIGxvb2sgaW50byBob3cgdGhpcyBjYW4gYmUg
ZG9uZS4gTWF5DQo+PiBuZWVkIHlvdXIgc3VnZ2VzdGlvbiBhcyBub3QgZXZlcnkgc2NlbmFyaW9z
IGNhbiBiZSBvdmVycmlkZGVuDQo+PiBlYXNpbHkvY2xlYW5seS4NCj4gDQo+IHRydWUsIG5vIGVh
c3kgb3ZlcnJpZGVzIGZvciB0aGlzIHRyYW5zZmVyIGVycm9yIC8gZG9vcmJlbGwgYmxvY2tpbmcg
d29ya2Fyb3VuZC4NCj4gTmVlZHMgYSBiaXQgb2Ygd29yaw0KPiANCg0KVGhhbmtzLA0KVGhpbmgN
Cg==
