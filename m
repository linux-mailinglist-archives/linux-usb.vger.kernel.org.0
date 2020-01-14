Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 05467139FF6
	for <lists+linux-usb@lfdr.de>; Tue, 14 Jan 2020 04:28:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729164AbgAND2o (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 13 Jan 2020 22:28:44 -0500
Received: from nat-hk.nvidia.com ([203.18.50.4]:60260 "EHLO nat-hk.nvidia.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728802AbgAND2n (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 13 Jan 2020 22:28:43 -0500
Received: from hkpgpgate101.nvidia.com (Not Verified[10.18.92.100]) by nat-hk.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5e1d35680000>; Tue, 14 Jan 2020 11:28:40 +0800
Received: from HKMAIL104.nvidia.com ([10.18.16.13])
  by hkpgpgate101.nvidia.com (PGP Universal service);
  Mon, 13 Jan 2020 19:28:40 -0800
X-PGP-Universal: processed;
        by hkpgpgate101.nvidia.com on Mon, 13 Jan 2020 19:28:40 -0800
Received: from HKMAIL102.nvidia.com (10.18.16.11) by HKMAIL104.nvidia.com
 (10.18.16.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 14 Jan
 2020 03:28:40 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.108)
 by HKMAIL102.nvidia.com (10.18.16.11) with Microsoft SMTP Server (TLS) id
 15.0.1473.3 via Frontend Transport; Tue, 14 Jan 2020 03:28:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gMO6frHBcT1RV0M3V9I00pZDnX4f5FdJbwkRIEv4MIiiPxeDT6brN7ypyeYEw3/GdMvYgFqMVz2P2vhMEFF/Y2L/y689AZYeb2Cujc40MvmviPUZWIQQNcq6QNWkCIyKfHGZtBW87UunjqPDb0HBJ8KbeMXWu9rhbhxpuIbSg4EbZNEoN8TQUHF9D/Fto9ovbbLlIuK3H/SxcKqykuFc6+6iPTfBEcyqeXSP6A+vzjdYVWsFisSA/lEyV0LVgGTKVvk+5mYJyMHpZ30oxp6QWeaKLhJFsd61ei+iji4utY5kPCSeBWmwmq09jq3NT+lfZaW2BhX3xEnxeGWtm25Vug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ggaDCT541CnYdGbaxEvl0YWFnBqfjKq381zV1nTEL/g=;
 b=H1bbuv3Doge2DRDoTBNvloEKcqLx9p2O1mtbii+Y9E15wZeG6CbOxVtp/zkQ9xPQUMpTlUwLMqChc/ZsUCtMvtAn6eVQahsRpdrs+yB9yszup+1XG86L88SkdZmGzjcW2boVZ9m7XrydNcz1StxweRR9MaE87eVrdPk/ewwsPVJrUEJS991pLfxbBkzurqh1nb5mre/aLeM3jMCM2EgV9tZqUCUnBe73/eAluDxgR2wnasyreHvWuRH+rZZLxBKZ/EQkfHcd5XpuR+v2I6PSi2xUYUZCoueKcQkzRbIageXeuUDginugET10nWpa7fPsJ/l7VuO5ia/PHFsL6gclcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
Received: from MN2PR12MB4126.namprd12.prod.outlook.com (10.255.125.12) by
 MN2PR12MB4160.namprd12.prod.outlook.com (10.255.125.83) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2623.9; Tue, 14 Jan 2020 03:28:38 +0000
Received: from MN2PR12MB4126.namprd12.prod.outlook.com
 ([fe80::cd37:66e9:2ab1:b349]) by MN2PR12MB4126.namprd12.prod.outlook.com
 ([fe80::cd37:66e9:2ab1:b349%5]) with mapi id 15.20.2623.015; Tue, 14 Jan 2020
 03:28:37 +0000
From:   EJ Hsu <ejh@nvidia.com>
To:     Oliver Neukum <oneukum@suse.com>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Alan Stern <stern@rowland.harvard.edu>
Subject: RE: [PATCH] usb: uas: fix a plug & unplug racing
Thread-Topic: [PATCH] usb: uas: fix a plug & unplug racing
Thread-Index: AQHVycHw0Tn7jTscuEWM2br6Fy2U56foWKIAgAEXieA=
Date:   Tue, 14 Jan 2020 03:28:37 +0000
Message-ID: <MN2PR12MB4126334FBC97B5AC4CC442AECF340@MN2PR12MB4126.namprd12.prod.outlook.com>
References: <20200113033035.50875-1-ejh@nvidia.com>
 <1578908680.2590.10.camel@suse.com>
In-Reply-To: <1578908680.2590.10.camel@suse.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Enabled=True;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_SiteId=43083d15-7273-40c1-b7db-39efd9ccc17a;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Owner=ejh@nvidia.com;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_SetDate=2020-01-14T03:28:34.7282775Z;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Name=Unrestricted;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Application=Microsoft Azure
 Information Protection;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_ActionId=10961159-4cfb-414d-ad65-5abe43f99a72;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Extended_MSFT_Method=Automatic
authentication-results: spf=none (sender IP is ) smtp.mailfrom=ejh@nvidia.com; 
x-originating-ip: [59.124.78.18]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 366042b5-06a7-4771-a248-08d798a1d813
x-ms-traffictypediagnostic: MN2PR12MB4160:
x-microsoft-antispam-prvs: <MN2PR12MB41602F9AF9C8F688DCFB7498CF340@MN2PR12MB4160.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 028256169F
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(136003)(376002)(39860400002)(366004)(346002)(396003)(189003)(199004)(33656002)(71200400001)(186003)(7696005)(2906002)(52536014)(86362001)(478600001)(6506007)(26005)(55016002)(316002)(66446008)(66476007)(4326008)(66556008)(64756008)(5660300002)(76116006)(6916009)(66946007)(81166006)(81156014)(8936002)(9686003)(8676002)(54906003);DIR:OUT;SFP:1101;SCL:1;SRVR:MN2PR12MB4160;H:MN2PR12MB4126.namprd12.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nvidia.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: qVyL+95ypw5bFYeUb8IRYmKNyrCMMoHeV/LEOcA1RBm+gUKC5v7L45BsxBetXtnp7CFWHKy/Q+juOrn/YyHznxF0dWJcEWVoyV8QwJTglrvmHEsy1J1vYLXgR6/LdNM/FshS+6J3XnXhi43L56tUgYFbVnOzW3+HyGFFcbvG6XwaJ9BILYo5xQQJwhVpnWrOCS067KjYYIKa3fUR67MYIf9gEBDgaQuVNMu4wl2E4xHeIRj8wINgfYWE0Fef0OMFXEr/GMVn96LvPCG8/G6EtjYoz459usqdXwcPXbGdym/44Y95KEBms8HYu7TjQOKFQHipzv2mPWasCRYc6FBpN0QgGRQ5WUrS7UYg3MbhN2/LOQ81zOlDiulKp/OIL8xrpDZUtayLLfffJwEuECrN1q6gYR/5hNQAlPyJMPwMYw8ovjoiUNpJLSvMFF7RQzKC
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 366042b5-06a7-4771-a248-08d798a1d813
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jan 2020 03:28:37.7052
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: u3ej3pUibfyYHv5EQnNLGrySFAzftAcf9i4I1IIHKV8tUsjU5Q4ag14SqtZkOvdF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4160
X-OriginatorOrg: Nvidia.com
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1578972520; bh=ggaDCT541CnYdGbaxEvl0YWFnBqfjKq381zV1nTEL/g=;
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
        b=qEn8/tWdzR3SbAr1sj2ewsTzaNq/ZYbLERwaVO9CudWmHNyyHYVj//HuxWtf9Hypg
         lTqW2z9HuchbTFMPM4T+PyXirAmOpTss6cvmvzBhGtbBP2DcrV73jEwbUggFk+3bCQ
         qKskcgFAqkFmtf1yt5LkcdDmFtCn9BsFy6Sjwooc2HMVdpGCOsqysCku9vfyrtPP0M
         e23dpqzsVDfaFrMqSLDZQNB6kAhAatRPBUNozUu8TGXjcWgBYtJfH0HW8U4ruDEhie
         ZUEbDPW3ClAMNJt7A6NXwaAjMh/CJTJCrtGVMKlSrxAM7LfawMK2uBIqNkVk/4TtvO
         lJX2ArGxs0vqg==
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

T2xpdmVyIE5ldWt1bSB3cm90ZToNCg0KPiBBbSBTb25udGFnLCBkZW4gMTIuMDEuMjAyMCwgMTk6
MzAgLTA4MDAgc2NocmllYiBFSiBIc3U6DQo+IA0KPiBJc24ndCB0aGF0IHRoZSBidWc/IEEgY29t
bWFuZCB0byBhIGRldGFjaGVkIGRldmljZSBzaG91bGQgZmFpbC4NCj4gQ291bGQgeW91IHBsZWFz
ZSBlbGFib3JhdGU/IFRoaXMgaXNzdWUgd291bGQgbm90IGJlIGxpbWl0ZWQgdG8gdWFzLg0KPiAN
CkluIHRoZSBjYXNlIEkgbWVudGlvbmVkLCB0aGUgaHViIHRocmVhZCBvZiBleHRlcm5hbCBodWIg
cnVubmluZyANCnVhc19wcm9iZSgpIHdpbGwgZ2V0IHN0dWNrIHdhaXRpbmcgZm9yIHRoZSBjb21w
bGV0aW9uIG9mIHNjc2kgc2Nhbi4gDQoNClRoZSBzY3NpIHNjYW4gd2lsbCB0cnkgdG8gcHJvYmUg
YSBzaW5nbGUgTFVOIHVzaW5nIGEgU0NTSSBJTlFVSVJZLg0KSWYgdGhlIGV4dGVybmFsIGh1YiBo
YXMgYmVlbiB1bnBsdWdnZWQgYmVmb3JlIExVTiBwcm9iZSwgdGhlIGRldmljZSANCnN0YXRlIG9m
IHVhcyBkZXZpY2Ugd2lsbCBiZSBzZXQgdG8gVVNCX1NUQVRFX05PVEFUVEFDSEVEIGJ5IHRoZSAN
CnJvb3QgaHViIHRocmVhZC4gU28sIGFsbCB0aGUgZm9sbG93aW5nIGNhbGxzIHRvIHVzYl9zdWJt
aXRfdXJiKCkgaW4gDQp1YXMgZHJpdmVyIHdpbGwgcmV0dXJuIC1OT0RFViwgYW5kIGFjY29yZGlu
Z2x5IHVhc19xdWV1ZWNvbW1hbmRfbGNrKCkgDQp3aWxsIHJldHVybiBTQ1NJX01MUVVFVUVfREVW
SUNFX0JVU1kgdG8gc2NzaV9yZXF1ZXN0X2ZuKCkuDQoNCnNjc2lfcmVxdWVzdF9mbigpIHRoZW4g
cHV0cyB0aGlzIHNjc2kgY29tbWFuZCBiYWNrIGludG8gcmVxdWVzdCBxdWV1ZS4NCkJlY2F1c2Ug
dGhpcyBzY3NpIGRldmljZSBpcyBqdXN0IGNyZWF0ZWQgYW5kIGR1cmluZyBMVU4gcHJvYmUgcHJv
Y2VzcywgDQp0aGlzIHNjc2kgY29tbWFuZCBpcyB0aGUgb25seSBvbmUgaW4gdGhlIHJlcXVlc3Qg
cXVldWUuIFNvLCBpdCB3aWxsIGJlIHBpY2tlZA0KdXAgc29vbiBhbmQgZGlzcGF0Y2hlZCB0byB1
YXMgZHJpdmVyIGFnYWluLiBUaGlzIGN5Y2xlIHdpbGwgY29udGludWUgdW50aWwNCnVhc19kaXNj
b25uZWN0KCkgaXMgY2FsbGVkIGFuZCBpdHMgInJlc2V0dGluZyIgZmxhZyBpcyBzZXQuIEhvd2V2
ZXIsIHRoZSANCmh1YiB0aHJlYWQgb2YgZXh0ZXJuYWwgaHViIHN0aWxsIGdvdCBzdHVjayB3YWl0
aW5nIGZvciB0aGUgY29tcGxldGlvbiBvZg0KdGhpcyBzY3NpIGNvbW1hbmQsIGFuZCBtYXkgbm90
IGJlIGFibGUgdG8gcnVuIHVhc19kaXNjb25uZWN0KCkuIA0KQSBkZWFkbG9jayBoYXBwZW5lZC4N
Cg0KPiA+ICtzdGF0aWMgdm9pZCB1YXNfc2Nhbl93b3JrKHN0cnVjdCB3b3JrX3N0cnVjdCAqd29y
aykgew0KPiA+ICsgICAgIHN0cnVjdCB1YXNfZGV2X2luZm8gKmRldmluZm8gPQ0KPiA+ICsgICAg
ICAgICAgICAgY29udGFpbmVyX29mKHdvcmssIHN0cnVjdCB1YXNfZGV2X2luZm8sIHNjYW5fd29y
ayk7DQo+ID4gKyAgICAgc3RydWN0IFNjc2lfSG9zdCAqc2hvc3QgPSB1c2JfZ2V0X2ludGZkYXRh
KGRldmluZm8tPmludGYpOw0KPiA+ICsNCj4gPiArICAgICBkZXZfZGJnKCZkZXZpbmZvLT5pbnRm
LT5kZXYsICJzdGFydGluZyBzY2FuXG4iKTsNCj4gPiArICAgICBzY3NpX3NjYW5faG9zdChzaG9z
dCk7DQo+ID4gKyAgICAgZGV2X2RiZygmZGV2aW5mby0+aW50Zi0+ZGV2LCAic2NhbiBjb21wbGV0
ZVxuIik7DQo+ID4gKw0KPiA+ICsgICAgIHVzYl9hdXRvcG1fcHV0X2ludGVyZmFjZShkZXZpbmZv
LT5pbnRmKTsNCj4gDQo+IHNjc2lfc2Nhbl9ob3N0KCkgZG9lcyBydW50aW1lIFBNIG9uIHRoZSBT
Q1NJIGxldmVsLiBUaGVyZSBpcyBubyBuZWVkIGZvciB1cyB0bw0KPiBkdXBsaWNhdGUgdGhhdC4N
Cj4NCg0KSW4gbXkgb3BpbmlvbiwgaWYgc2NzaV9zY2FuX2hvc3QoKSB3aWxsIGJlIHJ1biBhc3lu
Y2hyb25vdXNseSwgdGhpcyBpbnRlcmZhY2UgDQpuZWVkcyB0byBiZSBndWFyZGVkIGFnYWluc3Qg
cnVudGltZSBQTSBiZXR3ZWVuIHVhc19wcm9iZSgpICYgdWFzX3NjYW5fd29yaygpLg0KIA0KPiAN
Cj4gSXQgaXMgbm90IGVub3VnaCB0byBkbyB0aGlzIGluIGRpc2Nvbm5lY3QoKSBXZSBhcmUgZ3Vh
cmRlZCBhZ2FpbnN0IHJ1bnRpbWUgUE0sDQo+IGJ1dCBub3QgYWdhaW5zdCBzeXN0ZW0gc2xlZXAu
DQo+IFlvdSdkIG5lZWQgdG8gaGFuZGxlIHRoaXMgaW4gc3VzcGVuZCgpIGFuZCByZXN1bWUoKSwg
dG9vLg0KPiBBbmQsIHVuZm9ydHVuYXRlbHksIHRoZSBkZXZpY2UgY291bGQgYmUgcmVzZXQgZnJv
bSBhbm90aGVyIGludGVyZmFjZS4NCj4gDQoNCkFzIEFsbGVuIHNhaWQsIHRoaXMgaXMgYSBjb3B5
IG9mIHRoZSB3YXkgdXNiLXN0b3JhZ2Ugd29ya3MgYW5kIEkgZGlkIG5vdCBzZWUgYW55DQpyZWxh
dGVkIHByb3RlY3Rpb24gaW4gdXNiLXN0b3JhZ2UuIEJ1dCBJIHdpbGwgZG8gbW9yZSBjaGVjayBv
biBpdC4gDQoNClRoYW5rcywNCkVKDQotLW52cHVibGljDQo=
