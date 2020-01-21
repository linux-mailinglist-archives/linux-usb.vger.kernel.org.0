Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 23980143C0C
	for <lists+linux-usb@lfdr.de>; Tue, 21 Jan 2020 12:29:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728760AbgAUL3S (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 21 Jan 2020 06:29:18 -0500
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:4538 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726052AbgAUL3R (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 21 Jan 2020 06:29:17 -0500
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5e26e07d0000>; Tue, 21 Jan 2020 03:29:01 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Tue, 21 Jan 2020 03:29:16 -0800
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Tue, 21 Jan 2020 03:29:16 -0800
Received: from HQMAIL109.nvidia.com (172.20.187.15) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 21 Jan
 2020 11:29:15 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.171)
 by HQMAIL109.nvidia.com (172.20.187.15) with Microsoft SMTP Server (TLS) id
 15.0.1473.3 via Frontend Transport; Tue, 21 Jan 2020 11:29:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SmBhZLvT3uDlAMmzZMl0cF9qRduTCM1FG8zsqZO10vMv5LCou8CzlhfUoP+7S+cWHz8eJi7DN5M/g1JPncw8HYAGpkFcbpdu8Mi1K3vgFKxWMBVsnwycGun4UUhoB2+qMgkmxANv7dm5UD7LsrSFjaYETseo8B/+ZSmOOzY5C7h1V2U+BnpHJ9RbIyC9jqTXjl0oLHFSMC25LnSlOEpRS+QtbH2f8IEu7zO+zNQflCyy2y0/T7aCW69QuD4cYFImsmL1o5wA4mvpqnpp426Yw1m3qXnnZgtxm8aW8RTFE7OO2oNRRBXvM6yrhjxMEK4vtxX47Z29hmErqVuvtlRNTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yaqXQXKbEOOmOZSaoe/oR1m7uZ91mPnRdQ3/B6gAcIA=;
 b=OdhNIjHD2mKEzFzVeMRkjQZ0u/FqS9tr1PCFRRX67rdvpg3+TTKWW6cR/2QJgarmPi8WlSj/r1JGYK/ooFa3COFbpArrKteYsaQ9XixaFJyOWXFdPgCSSw9klXnVDpQZKgPbkpixqYW0XSkHNKbNlPW/3T8VVaG0qI4HUv0UqMr5TcGLzcu7Z/835dT+hcmXkvbWsN4BZRloKVb62om9Y6ebKHa8Deui9eNkVwCw2lU9swuwUQaD9J+ijPzKXavmNG+AjnLBfSpbvgjR1quozUMw1et6wbIIu220yZwS+hduCxuQikHeiMpRKki63Uqvz8VWjq0qiqDLy1WKTMDe1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
Received: from MN2PR12MB4126.namprd12.prod.outlook.com (10.255.125.12) by
 MN2PR12MB3661.namprd12.prod.outlook.com (10.255.238.31) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2644.20; Tue, 21 Jan 2020 11:29:12 +0000
Received: from MN2PR12MB4126.namprd12.prod.outlook.com
 ([fe80::cd37:66e9:2ab1:b349]) by MN2PR12MB4126.namprd12.prod.outlook.com
 ([fe80::cd37:66e9:2ab1:b349%5]) with mapi id 15.20.2644.027; Tue, 21 Jan 2020
 11:29:12 +0000
From:   EJ Hsu <ejh@nvidia.com>
To:     Oliver Neukum <oneukum@suse.com>,
        Alan Stern <stern@rowland.harvard.edu>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: RE: [PATCH] usb: uas: fix a plug & unplug racing
Thread-Topic: [PATCH] usb: uas: fix a plug & unplug racing
Thread-Index: AQHVycHw0Tn7jTscuEWM2br6Fy2U56foWKIAgAEXieCAAM3GgIAABnmAgAE1LICAAGJiAIAHe0gAgAGm5wA=
Date:   Tue, 21 Jan 2020 11:29:12 +0000
Message-ID: <MN2PR12MB4126317E9BA1D269BE83E4EDCF0D0@MN2PR12MB4126.namprd12.prod.outlook.com>
References: <Pine.LNX.4.44L0.2001140956040.1593-100000@iolanthe.rowland.org>
         <1579080683.15925.24.camel@suse.com>
         <MN2PR12MB41262435500D3FC463DBFC32CF370@MN2PR12MB4126.namprd12.prod.outlook.com>
 <1579513114.17973.13.camel@suse.com>
In-Reply-To: <1579513114.17973.13.camel@suse.com>
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
x-ms-office365-filtering-correlation-id: 58c817fe-5b5a-4784-7ba8-08d79e6523e9
x-ms-traffictypediagnostic: MN2PR12MB3661:
x-microsoft-antispam-prvs: <MN2PR12MB366172805734744E3E19E38BCF0D0@MN2PR12MB3661.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0289B6431E
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(39860400002)(376002)(396003)(136003)(346002)(366004)(199004)(189003)(7696005)(71200400001)(9686003)(26005)(478600001)(6506007)(186003)(2906002)(316002)(86362001)(110136005)(4326008)(33656002)(5660300002)(52536014)(66556008)(66476007)(66446008)(55016002)(64756008)(66946007)(81156014)(76116006)(8676002)(81166006)(8936002);DIR:OUT;SFP:1101;SCL:1;SRVR:MN2PR12MB3661;H:MN2PR12MB4126.namprd12.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nvidia.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: xZNUY/ASL2VL6Jm9e0H7fQyCgxp6Vgx4Jd4C3U3w1ou7VV281Pf3XQnyMMrvzR+OJnX1hcfAD5CuU6I2KW1okBoQsiDlYeklOU7+eCQLsUyddRVoZ4dTGKWkjbhABP3gpVKoUTEL723CkzG2/zuQndrOUxXKZ4SNnTEesgwynqSp2a6h6kJqyZUPCt6/c4RMCzM6WmD9RoOJGE7iFX/IlaHh8NtQ4AMCGD2ICryRaUeuHZoltX0toXh/cEGNXyKDmwXsnw4fw+4TzZvr9wjEyj5T4eMgBdGezQBmrQmbdTONrL5ZJ4RhMybExOQmEdiypCmJx6Ah6vnXdxuR8gipu740Xpz5X2N72hRvPT4fnu30i7jecWWta95OmCfdWH7gBjAhY0Z5g8WkuaM2Ckbx79++VmfJ7SQSTuJiJGSkpw55HqkEK63usdL8X9TDM+89
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 58c817fe-5b5a-4784-7ba8-08d79e6523e9
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jan 2020 11:29:12.6170
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fmQ19z367dUo3heU9MScKgpRZ0bnirvjQiNxrDNsmg9jRel+qVBl5G8lNLltstNv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3661
X-OriginatorOrg: Nvidia.com
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1579606141; bh=yaqXQXKbEOOmOZSaoe/oR1m7uZ91mPnRdQ3/B6gAcIA=;
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
        b=Zz0EPfz/a2eW2n/vcxfsMmcYQO4wj2fn2Dh+DjrhsmmWjH7JfbZRzjlLB4bbDKtyR
         4uwu0T7Eqz5QFoVicj9V+YgZTnQrqcgpPT7CVZgH1a3gAClcv2YHeLgIZL9tRGpnch
         RsJkj3xf66MkqGGziSTjYnnsddkKRVe71GyZZ5fOgzio1oyvtUYp6XSVPUVJZPZ/38
         CJDaj6gguDFO/yaZnTyDk2p/PTKwAQliF7IWwq696GD9OPfL9WuYAg66IHiGnh2gqV
         7bby9eM4OgktAZHqg8hEW/9nZizk/f3y0lnjRApeln5fao0D5+BQaWf45O/IESl7G3
         7iTYGdNNNUJ4A==
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

T2xpdmVyIE5ldWt1bSB3cm90ZToNCg0KPiA+IEkganVzdCBjaGVja2VkIHRoZSBjb2RlLCBhbmQg
dGhlIHJlZmVyZW5jZSBjb3VudCB3aWxsIGJlIGluY3JlbWVudGVkDQo+ID4gaW4gc2NzaV9zY2Fu
X2hvc3QoKSwgcHJlY2lzZWx5IHNwZWFraW5nLCBpbiBzY3NpX2F1dG9wbV9nZXRfaG9zdCgpLg0K
PiA+IFNvLCBJIHN0aWxsIHRoaW5rIHdlIG5lZWQgdG8gbWFudWFsbHkgYWRkIHJlZmVyZW5jZSBj
b3VudCBvZiBpbnRlcmZhY2UgaGVyZS4NCj4gPiBQbGVhc2UgY29ycmVjdCBtZSBpZiB0aGVyZSBp
cyBhbnl0aGluZyB3cm9uZy4NCj4gDQo+IEFGQUlDVCB0aGUgZ2VuZXJpYyBwb3dlciBtb2RlbCB3
aWxsIG5vdCBzdXNwZW5kIGEgcGFyZW50IHdoaWxlIGEgY2hpbGQgaXMNCj4gYWN0aXZlLiBUaGUg
aW5jbHVkZXMgU0NTSSBjaGlsZHJlbiBvZiBVU0IgcGFyZW50cy4gU28gSSB0aGluayB3ZSBhcmUg
c2FmZS4gQ291bGQNCj4geW91IHJlc3VibWl0IHlvdXIgcGF0Y2ggd2l0aG91dCB0aGUgUE0gY291
bnRlciBtYW5pcHVsYXRpb24gYW5kIHdlIGNhbiBmaXgNCj4gYW55IGlzc3VlIHRoYXQgbWF5IGV4
aXN0IGluIHRoZW9yeSBsYXRlcj8NCj4gDQoNClRoZSBjaGlsZF9jb3VudCBvZiB1c2IgZGV2aWNl
IHNob3VsZCBiZSBpbmNyZW1lbnRlZCBpbiB0aGUgc2NzaV9zY2FuX2hvc3QoKS4NCkkgY2FuIHNp
bXVsYXRlIHRoaXMgc2l0dWF0aW9uIGJ5IGZvcmNpYmx5IGVuYWJsZSB0aGUgYXV0b3N1c3BlbmQg
b2YgdWFzIGRyaXZlcg0KYW5kIGFkZCBhIGRlbGF5IGJlZm9yZSBzY3NpX3NjYW5faG9zdCgpIGlz
IGNhbGxlZCBpbiBhc3luY2hyb25vdXMgd2F5Lg0KDQpCdXQgZm9yIG5vdywgYXMgdWFzIGRyaXZl
ciBkb2VzIG5vdCBzdXBwb3J0IGF1dG9zdXNwZW5kLCBpdCBpcyBpbmRlZWQgc2FmZSB0bw0KcmVt
b3ZlIHRoZSBQTSBjb3VudGVyIG1hbmlwdWxhdGlvbi4gSWYgeW91IGhhdmUgY29uY2VybiBhYm91
dCBpdCwgaXQncyBPSyANCnRvIG1lIHRvIHJlLXN1Ym1pdCBpdC4NCg0KVGhhbmtzLA0KRUoNCi0t
bnZwdWJsaWMNCg0K
