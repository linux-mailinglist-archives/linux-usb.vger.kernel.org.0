Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 721281E38CE
	for <lists+linux-usb@lfdr.de>; Wed, 27 May 2020 08:07:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727922AbgE0GHQ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 27 May 2020 02:07:16 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.87.133]:51948 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725267AbgE0GHN (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 27 May 2020 02:07:13 -0400
Received: from mailhost.synopsys.com (badc-mailhost2.synopsys.com [10.192.0.18])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 96160C04D9;
        Wed, 27 May 2020 06:07:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1590559632; bh=tRl/BbhJEgVR3mXoVfV1KXSubarSyuISdpPUCZhrLuE=;
        h=From:To:Subject:Date:References:In-Reply-To:From;
        b=YrZ74l7duYzgE5laPI0gikmjtlabZFPwDWMrvQfRDMnA1m6TexK6ebAEDY1nqa7sh
         Y/7mTX1+8H9vOUS5EuE3Eex2dpXVp9QH8DLB/VOYRoPWaY5vFtyO3gYyjO74QhYgJ9
         g6cDdUdi2tPBRL4VCOBbtCXqP0yAofLgII+F0I6GbY3qpEg+LRjgr5j+r3kP/HS2/a
         n+ne2WkVyPlRXmQGsoRzhIKduN3/xvNTEKSvEO7Y0Ijql5lVt85uG+7nI4sWYGQowZ
         Yn6EeAPBVCF948SdG8CE77SVmTPydlDHw2agK4DlTfZzMsidG8B45XnmhSKelkTjUv
         B2ipc7w2rJh6w==
Received: from US01WEHTC3.internal.synopsys.com (us01wehtc3.internal.synopsys.com [10.15.84.232])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id 33FDDA0069;
        Wed, 27 May 2020 06:07:12 +0000 (UTC)
Received: from US01HYBRID2.internal.synopsys.com (10.15.246.24) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Tue, 26 May 2020 23:06:08 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.15.246.24) with Microsoft SMTP Server (TLS) id
 14.3.487.0; Tue, 26 May 2020 23:06:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HHeaX+RNFCg6ItLxOJG0/W/XZIns07lVtFM5jK+HLThhGPQUxvSk2l1tAsYYb0mMwpoZoT9mPs19pCWyF19z8Cs8/tQmRtCtzU4WCfKUY/dEjnk8l5SSw/ffBJTwQju30YgCORU+kjYh7+6x229E18PdT3JQFUi7bG/9STLhSd4AcTbd7/X0MW/M/UlWyz+HUTomTC1uCgCeOjRk4HQQ5Bul+UwQbC52YBbK1bEhHOn2tmeLDk3euyu/BgPIWhp8xYe72ozTKxIPLoYFw0M4ii6WuDHmUu6oVu2jqxCEFXhHLTzGQVWBmc0SoCnRVBx17H3J+7ufCy77xdpxtxUaNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tRl/BbhJEgVR3mXoVfV1KXSubarSyuISdpPUCZhrLuE=;
 b=aqPQEK8IKmxQYkh1veBHUEeajSlGVGN3OSztjf733DusAYaPsVgamjUUxS31nHt4eOAcbl5ek65NBPm0p1yxZyljP74vGKIAAl6hU9xmGuS/ytAbSXQieAJZ7S8cXZi6eo7TcMqQp4PaTKCZpd29ZUaVZSlHIXmv/TcWIRkk5i1dTqOHNAXUSFczn8uZ2d2oo+/d3xqAhh7TiB5VwxbCcW8tNMc495z4hYBMhXSVAmNhQxKf1WjDW6+nO670/3E8y02HjRUq9vL7lF0FVcckyt+kbKrGzyP0F8YKXrBEtML57F2yXqAly7OLhz/toRTs2vysaTQa85CWx7YWLhKykA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tRl/BbhJEgVR3mXoVfV1KXSubarSyuISdpPUCZhrLuE=;
 b=jALM7/SsTpKtd/i3X913x08heK0KTRIWBFNKEdH57CZQ2383KhPSqhhokn/oOefGWmOEk5xlz6/6LCGFQtCwSI7ro18bwHq4KBUcw8pWNhn8bZ2zfIBzjq7ybCKuwZY6SqlylkxM8IL2DktgcJwOn26h/i8NF0lITLCjXfrH38k=
Received: from DM5PR12MB2550.namprd12.prod.outlook.com (2603:10b6:4:b8::31) by
 DM5PR12MB1194.namprd12.prod.outlook.com (2603:10b6:3:6e::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3021.27; Wed, 27 May 2020 06:06:06 +0000
Received: from DM5PR12MB2550.namprd12.prod.outlook.com
 ([fe80::c4df:b228:c1b7:75a5]) by DM5PR12MB2550.namprd12.prod.outlook.com
 ([fe80::c4df:b228:c1b7:75a5%7]) with mapi id 15.20.3045.018; Wed, 27 May 2020
 06:06:06 +0000
X-SNPS-Relay: synopsys.com
From:   Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
To:     Frank Mori Hess <fmh6jj@gmail.com>,
        Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: usb: dwc2: screaming interrupt after kexec reboot
Thread-Topic: usb: dwc2: screaming interrupt after kexec reboot
Thread-Index: AQHWMw1n/AqEoilzTEuk20qrHHthAqi7c7WA
Date:   Wed, 27 May 2020 06:06:06 +0000
Message-ID: <dca3b78a-3740-aeb2-5767-76e7f9fd1fb5@synopsys.com>
References: <CAJz5Opc0zDQxnNp2foPEeL0=hOZ0C9-xy3T4nEO2pRy-rQmpWQ@mail.gmail.com>
In-Reply-To: <CAJz5Opc0zDQxnNp2foPEeL0=hOZ0C9-xy3T4nEO2pRy-rQmpWQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=synopsys.com;
x-originating-ip: [198.182.37.200]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4507119c-b463-41ad-dbca-08d802040b50
x-ms-traffictypediagnostic: DM5PR12MB1194:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR12MB119494037D0AA421991A5C76A7B10@DM5PR12MB1194.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-forefront-prvs: 04163EF38A
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Np02VU3FpKAtwvX1KMO1WXory3Ax6GLDggRx5lGFfPKM8Gohd8jfW7bCtnUDZ4E2T8fuESXbIe4KWvUfV61W6M9sBjhA5dW9xJ4789TYySRMhy7O+nLnCDIu21fBBAptycr2nLIQVWQujsbEW/+2Xh2gu6Qf7vCW1ZZPDukYSVBOo7G6NJ9gWlQJZUqv0jcHaeTwFcps2uxptYqSOrCcKGcDFtmDZKlMmxH6qmrXpk/wrf6prmXu2CHGakM2x2RBkt3Hn+qqXLyPx2GxAkWm8xSdh4qZxDGysKOUCeYyphVoZoK08it5QRG4OlTClXrpJCUvbmEHKeB4J48bXlsazenAJOpN+uc4EvjZZD3eeEvCMPKuX0UfPherBgXrnKMV
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR12MB2550.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(366004)(376002)(39850400004)(136003)(396003)(346002)(66946007)(66556008)(478600001)(66446008)(53546011)(76116006)(6512007)(6506007)(5660300002)(91956017)(31686004)(6486002)(31696002)(186003)(2906002)(36756003)(316002)(86362001)(64756008)(66476007)(8936002)(8676002)(26005)(110136005)(71200400001)(2616005)(43740500002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: U0WeMFbduYb+yTUAgKn8u6iQMS83SqJPDmQ0rNYKtvd++GYHxYsrd+6nyMQhE6Qg4pTi1b/2XGe6Qyny1XZcQvzMeAPOTJ0L4dBok+A0eTWNlG4PG8l2qgnzVson+PeFDIVtiGIIN3+qzGpPwncHoxPEZF+V9w1fAFfAVdlnZTitEkLvp34a58Ud5CxS18ZSvfrbYPWrrteB1bxYpbfHhX3q0+2jg9AvC62k3D5ONZIIuMP5IxKl7CDPjS/A70gJS1YHgdgGy4pGgfUKn3NRKGfUUuX2EMYOuL/4oOynDyTD/P1vRkr1dLqzKao3oH2nw7+FIhQcXllNjqhx4rNUBT552LG5KjCbvtzlVl8a8xZKx1AvfJ9JwTAv0hMz5Necjq5Hn111XB/8/KX/SMTv5qxUC4XoDr0jxbHdqIkZrcoBY+KvZCcKWxgLFySm88JduJBvs3p7j0fYebrEV/pCUin2xfXlxbIeW3nxMaF4b5Y=
Content-Type: text/plain; charset="utf-8"
Content-ID: <3CC2BF678761EA499186B5A985AE7293@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 4507119c-b463-41ad-dbca-08d802040b50
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 May 2020 06:06:06.4958
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: B+Eyvej2vMG1oi3D6dOZuvYbwF7PEUTSqdXJNfILgIwt9RCyNK9bI83qb2c9qs8ftb5FWC1iu99oNhm8dgDqGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1194
X-OriginatorOrg: synopsys.com
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

SGkgRnJhbmssDQoNCk9uIDUvMjYvMjAyMCA3OjI1IEFNLCBGcmFuayBNb3JpIEhlc3Mgd3JvdGU6
DQo+IEhpLA0KPiANCj4gSSBnZXQgYSBzY3JlYW1pbmcgZHdjMiBpbnRlcnJ1cHQgYWZ0ZXIgcmVi
b290aW5nIGludG8gYSBuZXcga2VybmVsDQo+IHdpdGgga2V4ZWMuICBJIGZpeGVkIGl0IGJ5IG1v
ZGlmeWluZyB0aGUgZHdjMl9kcml2ZXJfc2h1dGRvd24gZnVuY3Rpb24NCj4gaW4gZHdjMi9wbGF0
Zm9ybS5jIHNvIGl0IGRvZXMNCj4gDQo+IGR3YzJfd3JpdGVsKGhzb3RnLCAwLCBHSU5UTVNLKTsN
Cj4gZHdjMl93cml0ZWwoaHNvdGcsIDAsIEhBSU5UTVNLKTsNCj4gZHdjMl93cml0ZWwoaHNvdGcs
IDAsIERBSU5UTVNLKTsNCj4gDQo+IHJhdGhlciB0aGFuIGNhbGxpbmcgZGlzYWJsZV9pcnEoKS4g
IEFub3RoZXIgcmVhc29uIHRvIG1ha2UgdGhpcyBjaGFuZ2UNCj4gaXMgZGlzYWJsZV9pcnEoKSBh
ZmZlY3RzIG90aGVyIGRldmljZXMgaWYgdGhlIGlycSBpcyBzaGFyZWQuICBJJ2QNCj4gcmVhbGx5
IHJhdGhlciBub3Qgc3VibWl0IGEgZm9ybWFsIHBhdGNoLCBob3BlZnVsbHkgdGhlIG1haW50YWlu
ZXIgd2lsbA0KPiBhZG9wdCB0aGlzIHN1Z2dlc3Rpb24uDQo+IA0KDQpDb3VsZCB5b3UgcGxlYXNl
IHRlc3QgdGhpcyBwYXRjaCBpbnN0ZWFkIG9mIHlvdXIgc3VnZ2VzdGlvbi4gRG9lcyBpdCANCnNv
bHZlIGlzc3VlIGluIHlvdXIgY2FzZT8NCg0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNiL2R3YzIv
cGxhdGZvcm0uYyBiL2RyaXZlcnMvdXNiL2R3YzIvcGxhdGZvcm0uYw0KaW5kZXggZTU3MWM4YWU2
NWVjLi5hZGE1YjY2Yjk0OGUgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL3VzYi9kd2MyL3BsYXRmb3Jt
LmMNCisrKyBiL2RyaXZlcnMvdXNiL2R3YzIvcGxhdGZvcm0uYw0KQEAgLTM0Miw3ICszNDIsNyBA
QCBzdGF0aWMgdm9pZCBkd2MyX2RyaXZlcl9zaHV0ZG93bihzdHJ1Y3QgDQpwbGF0Zm9ybV9kZXZp
Y2UgKmRldikNCiAgew0KICAgICAgICAgc3RydWN0IGR3YzJfaHNvdGcgKmhzb3RnID0gcGxhdGZv
cm1fZ2V0X2RydmRhdGEoZGV2KTsNCg0KLSAgICAgICBkaXNhYmxlX2lycShoc290Zy0+aXJxKTsN
CisgICAgICAgZHdjMl9kaXNhYmxlX2dsb2JhbF9pbnRlcnJ1cHRzKGhzb3RnKTsNCiAgfQ0KDQog
IC8qKg0KDQoNClRoYW5rcywNCk1pbmFzDQo=
