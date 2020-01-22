Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1BDF1145128
	for <lists+linux-usb@lfdr.de>; Wed, 22 Jan 2020 10:52:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730878AbgAVJwN (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 22 Jan 2020 04:52:13 -0500
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:14233 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729537AbgAVJwM (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 22 Jan 2020 04:52:12 -0500
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5e281b3c0001>; Wed, 22 Jan 2020 01:51:56 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Wed, 22 Jan 2020 01:52:10 -0800
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Wed, 22 Jan 2020 01:52:10 -0800
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 22 Jan
 2020 09:52:10 +0000
Received: from NAM04-CO1-obe.outbound.protection.outlook.com (104.47.45.54) by
 HQMAIL111.nvidia.com (172.20.187.18) with Microsoft SMTP Server (TLS) id
 15.0.1473.3 via Frontend Transport; Wed, 22 Jan 2020 09:52:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lGwCHzpH9oFrq5X8xf5XkP0a6IA3i2g0bcVtEsBlOvLSMa6+6FOyl2TRZM9ArLY+ar2UpXPxeRF/4KM+bh8Wa4J7dw0nNnfC0s5rd2KJWTR2BbjPMPPVIGFqVgjBbu+sW4m5oZTD0Oum+TzJ4MfS5FqUYNE2HeQ8zisancWDsCsVCl2X4FOWCDvPaP+bZ9B6Wmx4gcpR9NYBNR+Pe5A2KABefaBBmp32DnfQ8vfB5X4lcqaesPVXut1pBe6L/XRf8il2mcTDwM1U/HZi/OuFCCjmeThXfmUlRBRh3vU9sSQq7juiuJDeTcOhP+ihnZ/c8Juxjqbekww9zccMdoQ7jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oGpz8SmHZ5o0un2cqTswzrfEG7MGkkOBeijFklCGjt0=;
 b=KYnyHwgcSW8DLGWAhd7WX1OB8AJvPNjMolZhDeIkima38t+YqTzRJlJwdpWyUhe10LL9nO7fJsCTmBCf3LXBd3nf82z0GdFAKzgR4TAVIluJdsa873rsJmvda2lyxNsmq6BrvnV5jDzF3f2xhrnMzgt8den9mO5V3tcHhi2/sk+qvd3//ikIXFAkyAXVrA9fwEo0uam2VoT3cAUMkI6yE3NtOeekqIERxL9HZfphCKNmk23qCUo1pE0wSijLqu3H8eIPQamtvI//lNMN6Dvo9eARtH7AKIhV5AaUMJIxK0bWn06bgOKtjaE5idoX4J3RGZgGHAEpXuSZeyJeTCf3gQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
Received: from MN2PR12MB4126.namprd12.prod.outlook.com (10.255.125.12) by
 MN2PR12MB3613.namprd12.prod.outlook.com (20.178.240.81) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2644.23; Wed, 22 Jan 2020 09:52:09 +0000
Received: from MN2PR12MB4126.namprd12.prod.outlook.com
 ([fe80::cd37:66e9:2ab1:b349]) by MN2PR12MB4126.namprd12.prod.outlook.com
 ([fe80::cd37:66e9:2ab1:b349%5]) with mapi id 15.20.2644.027; Wed, 22 Jan 2020
 09:52:09 +0000
From:   EJ Hsu <ejh@nvidia.com>
To:     Oliver Neukum <oneukum@suse.com>,
        Alan Stern <stern@rowland.harvard.edu>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: RE: [PATCH] usb: uas: fix a plug & unplug racing
Thread-Topic: [PATCH] usb: uas: fix a plug & unplug racing
Thread-Index: AQHVycHw0Tn7jTscuEWM2br6Fy2U56foWKIAgAEXieCAAM3GgIAABnmAgAE1LICAAGJiAIAHe0gAgAGm5wCAAXvZ4A==
Date:   Wed, 22 Jan 2020 09:52:09 +0000
Message-ID: <MN2PR12MB4126A6A761F168E03E751E5ACF0C0@MN2PR12MB4126.namprd12.prod.outlook.com>
References: <Pine.LNX.4.44L0.2001140956040.1593-100000@iolanthe.rowland.org>
         <1579080683.15925.24.camel@suse.com>
         <MN2PR12MB41262435500D3FC463DBFC32CF370@MN2PR12MB4126.namprd12.prod.outlook.com>
 <1579513114.17973.13.camel@suse.com>
 <MN2PR12MB4126317E9BA1D269BE83E4EDCF0D0@MN2PR12MB4126.namprd12.prod.outlook.com>
In-Reply-To: <MN2PR12MB4126317E9BA1D269BE83E4EDCF0D0@MN2PR12MB4126.namprd12.prod.outlook.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Enabled=True;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_SiteId=43083d15-7273-40c1-b7db-39efd9ccc17a;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Owner=ejh@nvidia.com;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_SetDate=2020-01-21T11:29:08.8625895Z;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Name=Unrestricted;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Application=Microsoft Azure
 Information Protection;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_ActionId=bed02c3e-6b5c-40a0-8609-c924db6b29ae;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Extended_MSFT_Method=Automatic
authentication-results: spf=none (sender IP is ) smtp.mailfrom=ejh@nvidia.com; 
x-originating-ip: [59.124.78.18]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d2bc1903-0865-462c-20b6-08d79f20bf4c
x-ms-traffictypediagnostic: MN2PR12MB3613:
x-microsoft-antispam-prvs: <MN2PR12MB361382D0863E3B9B2ACF691ECF0C0@MN2PR12MB3613.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 029097202E
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(346002)(396003)(376002)(136003)(39860400002)(366004)(199004)(189003)(7696005)(71200400001)(5660300002)(76116006)(66946007)(66446008)(33656002)(66476007)(478600001)(66556008)(64756008)(8676002)(52536014)(26005)(6506007)(110136005)(316002)(186003)(2906002)(8936002)(4326008)(55016002)(9686003)(86362001)(81156014)(81166006);DIR:OUT;SFP:1101;SCL:1;SRVR:MN2PR12MB3613;H:MN2PR12MB4126.namprd12.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nvidia.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: DGklO1ITMIGE4EN3FBUKVEaUzRKzCXydlpfplmozip5SjXROM5zgiU6Awb+Niau5C0EneQWkY9QdetDWWFN+cmc7PqvrZYZM5HwXMUqpKVCW1u3l8Wi/q/HkwCNbQExdGrg/HVyoC4Q/onFtsbm2gDMYrpnilX8D7dtpPEQNMkqRKI7Wmo4YaO1vAuS5AyLROum6jCFTwA97q0ApOdfGDBtLyUeHs92iarZRIfx0Vw8a7DaMBNkmv7999pMD4v/eyW4lHVfrHVzuvy9734RyTe/d2qP1JBPLQzt0dOLqPjCkjOO9oVMeVPtU9wtfWrPzbrEgswJSb/8lwYNpoMxBnauVb1YDaSZykYHeqChvz2gtN1C7op9bGZWIDjEVFt6XB3DHOp19qbfgofrChhb3Oz3G8Kw8catepByXSakkB+apExjb+PATUXXMMtbvbRXs
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: d2bc1903-0865-462c-20b6-08d79f20bf4c
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jan 2020 09:52:09.1500
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ePLEK7B+DjNJ77drqdRHsxcBFJaid67JvYUTCiOL/7IyMiM8HmNh0MrFugSLtVlA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3613
X-OriginatorOrg: Nvidia.com
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1579686716; bh=oGpz8SmHZ5o0un2cqTswzrfEG7MGkkOBeijFklCGjt0=;
        h=X-PGP-Universal:ARC-Seal:ARC-Message-Signature:
         ARC-Authentication-Results:From:To:CC:Subject:Thread-Topic:
         Thread-Index:Date:Message-ID:References:In-Reply-To:
         Accept-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:msip_labels:
         authentication-results:x-originating-ip:x-ms-publictraffictype:
         x-ms-office365-filtering-correlation-id:x-ms-traffictypediagnostic:
         x-microsoft-antispam-prvs:x-ms-oob-tlc-oobclassifiers:
         x-forefront-prvs:x-forefront-antispam-report:received-spf:
         x-ms-exchange-senderadcheck:x-microsoft-antispam:
         x-microsoft-antispam-message-info:x-ms-exchange-transport-forked:
         MIME-Version:X-MS-Exchange-CrossTenant-Network-Message-Id:
         X-MS-Exchange-CrossTenant-originalarrivaltime:
         X-MS-Exchange-CrossTenant-fromentityheader:
         X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
         X-MS-Exchange-CrossTenant-userprincipalname:
         X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-OriginatorOrg:
         Content-Language:Content-Type:Content-Transfer-Encoding;
        b=ctxka0QBAfo1ZFsXS5b3nlxJ3b4FI+ld+kcCM06BGPlEBlAlsy9fhur9vOebGPlzC
         KlZkSK6idtV5PJMVJ9Ady9iz2yQdcUKiDDQy/5euIL/COOaZOi7zBzX8PDyjgmj6AO
         idiEaXjTSQ9K9f5poNtJ/kydAvMhF5XSYE6S5ZT54wU8NPYqVpQYbQBrrYbR0KoCKV
         GgujrhU46Lw+K3l6O7dz3YM6OE8YW4vkuUOgIdy3MIEfzIyIX4rrUvFxnh5PxHz/VE
         8EOs2JWEkqAfubmYybG+ppehmuoHGD3aKL9ZEMuhjcO14IpLJpf540vjM3QKxfslRV
         hScKVFURqv1xA==
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

RUogSHN1IHdyb3RlOg0KDQo+IE9saXZlciBOZXVrdW0gd3JvdGU6DQo+IA0KPiA+ID4gSSBqdXN0
IGNoZWNrZWQgdGhlIGNvZGUsIGFuZCB0aGUgcmVmZXJlbmNlIGNvdW50IHdpbGwgYmUgaW5jcmVt
ZW50ZWQNCj4gPiA+IGluIHNjc2lfc2Nhbl9ob3N0KCksIHByZWNpc2VseSBzcGVha2luZywgaW4g
c2NzaV9hdXRvcG1fZ2V0X2hvc3QoKS4NCj4gPiA+IFNvLCBJIHN0aWxsIHRoaW5rIHdlIG5lZWQg
dG8gbWFudWFsbHkgYWRkIHJlZmVyZW5jZSBjb3VudCBvZiBpbnRlcmZhY2UgaGVyZS4NCj4gPiA+
IFBsZWFzZSBjb3JyZWN0IG1lIGlmIHRoZXJlIGlzIGFueXRoaW5nIHdyb25nLg0KPiA+DQo+ID4g
QUZBSUNUIHRoZSBnZW5lcmljIHBvd2VyIG1vZGVsIHdpbGwgbm90IHN1c3BlbmQgYSBwYXJlbnQg
d2hpbGUgYSBjaGlsZA0KPiA+IGlzIGFjdGl2ZS4gVGhlIGluY2x1ZGVzIFNDU0kgY2hpbGRyZW4g
b2YgVVNCIHBhcmVudHMuIFNvIEkgdGhpbmsgd2UNCj4gPiBhcmUgc2FmZS4gQ291bGQgeW91IHJl
c3VibWl0IHlvdXIgcGF0Y2ggd2l0aG91dCB0aGUgUE0gY291bnRlcg0KPiA+IG1hbmlwdWxhdGlv
biBhbmQgd2UgY2FuIGZpeCBhbnkgaXNzdWUgdGhhdCBtYXkgZXhpc3QgaW4gdGhlb3J5IGxhdGVy
Pw0KPiA+DQo+IA0KPiBUaGUgY2hpbGRfY291bnQgb2YgdXNiIGRldmljZSBzaG91bGQgYmUgaW5j
cmVtZW50ZWQgaW4gdGhlIHNjc2lfc2Nhbl9ob3N0KCkuDQo+IEkgY2FuIHNpbXVsYXRlIHRoaXMg
c2l0dWF0aW9uIGJ5IGZvcmNpYmx5IGVuYWJsZSB0aGUgYXV0b3N1c3BlbmQgb2YgdWFzIGRyaXZl
cg0KPiBhbmQgYWRkIGEgZGVsYXkgYmVmb3JlIHNjc2lfc2Nhbl9ob3N0KCkgaXMgY2FsbGVkIGlu
IGFzeW5jaHJvbm91cyB3YXkuDQo+IA0KPiBCdXQgZm9yIG5vdywgYXMgdWFzIGRyaXZlciBkb2Vz
IG5vdCBzdXBwb3J0IGF1dG9zdXNwZW5kLCBpdCBpcyBpbmRlZWQgc2FmZSB0bw0KPiByZW1vdmUg
dGhlIFBNIGNvdW50ZXIgbWFuaXB1bGF0aW9uLiBJZiB5b3UgaGF2ZSBjb25jZXJuIGFib3V0IGl0
LCBpdCdzIE9LIHRvDQo+IG1lIHRvIHJlLXN1Ym1pdCBpdC4NCj4gDQoNCkJ5IHRoZSB3YXksIGlm
IGF1dG9zdXNwZW5kIHdpbGwgYmUgZW5hYmxlZCBpbiB1YXMgZHJpdmVyIGluIHRoZSBmdXR1cmUs
IA0KdGhlIFBNIGNvdW50ZXIgbWFuaXB1bGF0aW9uIHNob3VsZCBiZSBhZGRlZCBiZWZvcmUgc2Nz
aV9hZGRfaG9zdCgpLCANCmp1c3QgYXMgTVNDIGRyaXZlciBkaWQuIE90aGVyd2lzZSwgdGhlIGNo
aWxkX2NvdW50IG9mIHVzYiBkZXZpY2UgbWlnaHQgYmUNCmFjY2lkZW50YWxseSBkZWNyZW1lbnRl
ZC4gKHRoZSBycG0gImlkbGUiIG1lc3NhZ2Ugd2lsbCBiZSBwcm9wYWdhdGVkDQpmcm9tIHNjc2kg
aG9zdCB0byB1c2IgaW50ZXJmYWNlIGFuZCB1c2IgZGV2aWNlKQ0KDQpUaGFua3MsDQpFSg0KLS1u
dnB1YmxpYw0K
