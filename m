Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A5BE61AD39F
	for <lists+linux-usb@lfdr.de>; Fri, 17 Apr 2020 02:26:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727847AbgDQA0D (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 16 Apr 2020 20:26:03 -0400
Received: from nat-hk.nvidia.com ([203.18.50.4]:32655 "EHLO nat-hk.nvidia.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725858AbgDQA0C (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 16 Apr 2020 20:26:02 -0400
Received: from hkpgpgate102.nvidia.com (Not Verified[10.18.92.77]) by nat-hk.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5e98f7960000>; Fri, 17 Apr 2020 08:25:58 +0800
Received: from HKMAIL103.nvidia.com ([10.18.16.12])
  by hkpgpgate102.nvidia.com (PGP Universal service);
  Thu, 16 Apr 2020 17:25:58 -0700
X-PGP-Universal: processed;
        by hkpgpgate102.nvidia.com on Thu, 16 Apr 2020 17:25:58 -0700
Received: from HKMAIL104.nvidia.com (10.18.16.13) by HKMAIL103.nvidia.com
 (10.18.16.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 17 Apr
 2020 00:25:58 +0000
Received: from NAM04-SN1-obe.outbound.protection.outlook.com (104.47.44.57) by
 HKMAIL104.nvidia.com (10.18.16.13) with Microsoft SMTP Server (TLS) id
 15.0.1473.3 via Frontend Transport; Fri, 17 Apr 2020 00:25:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZXCUSwpZ24JRBt2ohreI5Uh6twRPbcGjOBd7BNd4cax3ATpNFnx4Q9Mx0unKlQsgnbrRGTkxjNZV9H8FA2ViFRTud5IqU0JJOtf1RGRHmjKre1R/pv3864btHLmSFY7qN5k3KHmp9A1f8A96lC07BdWE1THGs7//H/6Gi2NJbc8ox8sqOq0XxOhCNlkWurgUngdSItQ0ZHMy9N51Of2l5oWErGSsHnEqGd9uvMmx+nct5i85ln/Ezq49DP5e1lXr4jsML3FAMtMkKT9jh9K/8JL49AuIA2jxgmj0kSD3U/HUWKhaNmy9mURJ3UinxB4nPMZiaUCyVua0UQ7Waghefg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UKT4Qv6QhmawwOdfL7Fn/Pkg8/VqsrZU3P07l0zROTY=;
 b=awXPLuhDfCyqoYPE2b7Hhc5K6eiyf+pJ8c4Qv+y7jF1roMUShLvBGHJZ5m8tOfhA1tpKh4X4WPgVjyp87H1ROgaazYMPyoyLguBbfkBjfhHTPLilgQ1mNJSUP1/O3E3DM4818Gati2LWwUujMtu2UmKbN5dyFybAPTLcZWhAD9bBOza1eU+2slD3z/LkXuFnRL6JCsZkV4LUXanwphuo9tWnCigtqkQ8BSrArOV1UjFDa6qQWpL3pKdErpExEhaaHAB3ySXvIXU2KhT8/I3z1Nz6LH1gIIEDdmfUdsk7MtSsVjxRuga0Hy9GxX5HjL/d0tvkeVvHaPKSuTyGR6FfDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
Received: from DM6PR12MB3690.namprd12.prod.outlook.com (2603:10b6:5:149::20)
 by DM6PR12MB3724.namprd12.prod.outlook.com (2603:10b6:5:1c9::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2900.26; Fri, 17 Apr
 2020 00:25:55 +0000
Received: from DM6PR12MB3690.namprd12.prod.outlook.com
 ([fe80::b15a:cdcb:f868:4638]) by DM6PR12MB3690.namprd12.prod.outlook.com
 ([fe80::b15a:cdcb:f868:4638%6]) with mapi id 15.20.2900.028; Fri, 17 Apr 2020
 00:25:55 +0000
From:   Jim Lin <jilin@nvidia.com>
To:     Mathias Nyman <mathias.nyman@linux.intel.com>
CC:     USB <linux-usb@vger.kernel.org>,
        "florianmey@gmx.de" <florianmey@gmx.de>,
        "hawk.it@tiscali.it" <hawk.it@tiscali.it>
Subject: RE: [RFT PATCH] xhci: Don't clear hub TT buffer on ep0 protocol stall
Thread-Topic: [RFT PATCH] xhci: Don't clear hub TT buffer on ep0 protocol
 stall
Thread-Index: AQHWE95Sil6ssQ78ckW/b9KnGZ0q4Kh8dQfQ
Date:   Fri, 17 Apr 2020 00:25:55 +0000
Message-ID: <DM6PR12MB3690A49DC486293BF6237CAEC0D90@DM6PR12MB3690.namprd12.prod.outlook.com>
References: <c27a32e9-1299-60d0-1612-3657b7841056@linux.intel.com>
In-Reply-To: <c27a32e9-1299-60d0-1612-3657b7841056@linux.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=jilin@nvidia.com; 
x-originating-ip: [59.124.78.18]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 31690594-61cf-4b13-30aa-08d7e265e4eb
x-ms-traffictypediagnostic: DM6PR12MB3724:
x-microsoft-antispam-prvs: <DM6PR12MB37248F545CF53F2B84EEA535C0D90@DM6PR12MB3724.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-forefront-prvs: 0376ECF4DD
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB3690.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(10009020)(366004)(39860400002)(136003)(396003)(376002)(346002)(54906003)(66556008)(81156014)(55016002)(8936002)(66476007)(66946007)(316002)(86362001)(76116006)(71200400001)(9686003)(66446008)(64756008)(4326008)(966005)(52536014)(478600001)(186003)(26005)(5660300002)(6506007)(8676002)(33656002)(6916009)(53546011)(7696005)(2906002);DIR:OUT;SFP:1101;
received-spf: None (protection.outlook.com: nvidia.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ZRlypqxNZhSxBUfdyU7Nbaif6KXkiZeQG9RdI/PvnV9TZNiTX+9FHS4ciE/TMuRFugY3o1FgFikHJihv9iPDpoFzlNH6XQ5eqzlU3adte9iDzGTAZ1Lvsa1ZYGo0NwZv+RJnqVFcgT/KcerABNGD87ai0JFdedV3S0PuY7zMcwaxpg/sdX1+CEcH8xfnELN9oe6zWvchKMMnunsUED83TuNmuX/g8j2ggQiOQwuaRcI8fM92XQRrPXKNaCnrlhTpeIwJfDL4+ELA1zCvO/PGVrZjtWyjqbH2NdDlM7x3yOXTjK89LZf3PfHuVRGevU6+PnEU+QfU7RiDnGD7ErAJafnByHhTpCuDWzq3ojmuzCOzIDpk8HQNEjxkBpjOXa+Zsny/HAthw4e8JbwaFsnTEpvfniAKyk6VuNJwwvenpRhCWAS3IOldKbIJPJ7LkH/BEhL0HfCtfR/l86uZNrN4hg1dM5XnoQq7/dHZd0LRbl4UJArcM9CznC2jEhbHvBg+uvufcHgdPW620/fVY4t1qQ==
x-ms-exchange-antispam-messagedata: d/kWuZLsGksKHTglvyM5jSYaiD7Sd5WHftdeEgjfZXWx5ePH6pwUk/3NwC1bidigMfxQqoaQju1XlFpcjSCCLvzLjBir4kJY9adzfU/ZpR4/SShmMD1umAil9iQs13SjagpLWhwaKrCboPs11p19pg==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 31690594-61cf-4b13-30aa-08d7e265e4eb
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Apr 2020 00:25:55.3918
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TrfK7nDB+7aFf5QJONgxadI+9s9IUk3j7isOa49hpzEb7bQjozqioAvJLedY/C4h3vg1EZg2p2KmsAfvrrzXEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3724
X-OriginatorOrg: Nvidia.com
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1587083159; bh=EqCS9nX7j3D19a4f3wSWO9us64G8bemBsY8jrOjP85w=;
        h=X-PGP-Universal:ARC-Seal:ARC-Message-Signature:
         ARC-Authentication-Results:From:To:CC:Subject:Thread-Topic:
         Thread-Index:Date:Message-ID:References:In-Reply-To:
         Accept-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
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
        b=F9tdg73OV2v6r8kJWcYd91LVg2fLhVeSq6G0pWhMFtgkRAn8ccs23qvmPjBDISfXT
         vKW6Vi4QI+fEhtN5sd9eB+/UIXV9pEcFhuU/PpWWVbRuocWWIJel+GjZeYs/bOD8EH
         ICzX2cKX/j7TYlP4YJQ8DRCyKBtSJrQJmR6kZJjNHJDxatZBJTaBfSQ1XZwCTJq1+s
         trwNkwiO9vpFPjmcMXSaA7uX0sCwSD0fJVLP2yEbADtTHjVEDbAMIRLqV/STLE7W2E
         brYyWvrdZ7okIvIwzEL11nBfbS7nXjtwqABNrmCILvfn6BKyA7PqBtidTkf37OOlx0
         NMI6+6SwNnaMw==
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

SSBoYWQgcmV0dXJuZWQgdGhhdCBkZXZpY2UgdG8gY3VzdG9tZXIuDQpBbmQgd29uJ3QgYmUgYWJs
ZSB0byB2ZXJpZnkgdGhpcyBwYXRjaC4NCg0KSmltDQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0t
LS0tDQpGcm9tOiBNYXRoaWFzIE55bWFuIDxtYXRoaWFzLm55bWFuQGxpbnV4LmludGVsLmNvbT4g
DQpTZW50OiBUaHVyc2RheSwgQXByaWwgMTYsIDIwMjAgNzowMiBQTQ0KVG86IEppbSBMaW4gPGpp
bGluQG52aWRpYS5jb20+DQpDYzogVVNCIDxsaW51eC11c2JAdmdlci5rZXJuZWwub3JnPjsgZmxv
cmlhbm1leUBnbXguZGU7IGhhd2suaXRAdGlzY2FsaS5pdA0KU3ViamVjdDogW1JGVCBQQVRDSF0g
eGhjaTogRG9uJ3QgY2xlYXIgaHViIFRUIGJ1ZmZlciBvbiBlcDAgcHJvdG9jb2wgc3RhbGwNCg0K
RXh0ZXJuYWwgZW1haWw6IFVzZSBjYXV0aW9uIG9wZW5pbmcgbGlua3Mgb3IgYXR0YWNobWVudHMN
Cg0KDQpIaSBKaW0gTGluDQoNClRoZSBjb21taXQ6IGVmNTEzYmUwYTkwNSAoInVzYjogeGhjaTog
QWRkIENsZWFyX1RUX0J1ZmZlciIpIGNhdXNlcyBzb21lIHJlZ3Jlc3Npb24gZm9yIG90aGVyIGRl
dmljZXMuDQoNCmh0dHBzOi8vYnVnemlsbGEua2VybmVsLm9yZy9zaG93X2J1Zy5jZ2k/aWQ9MjAz
NDE5DQpodHRwczovL2J1Z3ppbGxhLmtlcm5lbC5vcmcvc2hvd19idWcuY2dpP2lkPTIwNjg5Nw0K
aHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0yMDcwNjUNCg0KSXNz
dWUgaXMgcG9pbnBvaW50ZWQgdG8gY2xlYXJpbmcgVFQgYnVmZmVyIGZvciBlbmRwb2ludCAwIHBy
b3RvY29sIHN0YWxscyB3aGljaCBzaG91bGQgbm90IGJlIG5lZWRlZC4NCg0KSSBoYXZlIGEgcGF0
Y2ggdG8gcmVzb2x2ZSB0aGlzIGJ1dCBJJ20gY29uY2VybmVkIGl0IG1heSBjYXVzZSByZWdyZXNz
aW9uIGZvciB0aGUgb3JpZ2luYWwgY2FzZSB5b3VyIHBhdGNoIHNvbHZlZC4NCg0KSWYgcG9zc2li
bGUsIGNhbiB5b3UgdHJ5IHRoZSBwYXRjaCBiZWxvdyBhbmQgY2hlY2sgaWYgdGhlIENvbmZlcmVu
Y2VDYW0gZGV2aWNlIHN0aWxsIHdvcmtzIHdpdGggaXQsIGFuZCBsZXQgbWUga25vdw0KDQpUaGFu
a3MNCk1hdGhpYXMNCg0KLS0tLSA+OCAtLS0tDQoNCnhoY2k6IERvbid0IGNsZWFyIGh1YiBUVCBi
dWZmZXIgb24gZXAwIHByb3RvY29sIHN0YWxsDQoNClRoZSBkZWZhdWx0IGNvbnRyb2wgZW5kcG9p
bnQgZXAwIGNhbiByZXR1cm4gYSBTVEFMTCBpbmRpY2F0aW5nIHRoZSBkZXZpY2UgZG9lcyBub3Qg
c3VwcG9ydCB0aGUgY29udHJvbCB0cmFuc2ZlciByZXF1ZXN0cy4gVGhpcyBpcyBjYWxsZWQgYSBw
cm90b2NvbCBzdGFsbCBhbmQgZG9lcyBub3QgaGFsdCB0aGUgZW5kcG9pbnQuDQoNCnhIQyBiZWhh
dmVzIGEgYml0IGRpZmZlcmVudC4gSXRzIGludGVybmFsIGVuZHBvaW50IHN0YXRlIHdpbGwgYWx3
YXlzIGJlIGhhbHRlZCBvbiBhbnkgc3RhbGwsIGV2ZW4gaWYgdGhlIGRldmljZSBzaWRlIG9mIHRo
ZSBlbmRwaW9udCBpcyBub3QgaGFsdGVkLiBTbyB3ZSBkbyBuZWVkIHRvIGlzc3VlIHRoZSByZXNl
dCBlbmRwb2ludCBjb21tYW5kIHRvIGNsZWFyIHRoZSB4SEMgaG9zdCBpbnRlbmFsIGVuZHBvaW50
IGhhbHQgc3RhdGUsIGJ1dCBzaG91bGQgbm90IHJlcXVlc3QgdGhlIEhTIGh1YiB0byBjbGVhciB0
aGUgVFQgYnVmZmVyIHVubGVzcyBkZXZpY2Ugc2lkZSBvZiBlbmRwb2ludCBpcyBoYWx0ZWQuDQoN
CkNsZWFyaW5nIHRoZSBodWIgVFQgYnVmZmVyIGF0IHByb3RvY29sIHN0YWxsIGNhdXNlZCBlcDAg
dG8gYmVjb21lIHVucmVzcG9uc2l2ZSBmb3Igc29tZSBGUy9MUyBkZXZpY2VzIGJlaGluZCBIUyBo
dWJzLCBhbmQgY2xhc3MgZHJpdmVycyBmYWlsZWQgdG8gc2V0IHRoZSBpbnRlcmZhY2UgZHVlIHRv
IHRpbWVvdXQ6DQoNCnVzYiAxLTIuMTogMToxOiB1c2Jfc2V0X2ludGVyZmFjZSBmYWlsZWQgKC0x
MTApDQoNClNpZ25lZC1vZmYtYnk6IE1hdGhpYXMgTnltYW4gPG1hdGhpYXMubnltYW5AbGludXgu
aW50ZWwuY29tPg0KLS0tDQogZHJpdmVycy91c2IvaG9zdC94aGNpLXJpbmcuYyB8IDE2ICsrKysr
KysrKysrLS0tLS0NCiAxIGZpbGUgY2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlv
bnMoLSkNCg0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNiL2hvc3QveGhjaS1yaW5nLmMgYi9kcml2
ZXJzL3VzYi9ob3N0L3hoY2ktcmluZy5jIGluZGV4IGE3ZjRjZDM1ZGE1NS4uMGZkYTBjMGY0ZDMx
IDEwMDY0NA0KLS0tIGEvZHJpdmVycy91c2IvaG9zdC94aGNpLXJpbmcuYw0KKysrIGIvZHJpdmVy
cy91c2IvaG9zdC94aGNpLXJpbmcuYw0KQEAgLTE4NzYsNyArMTg3Niw2IEBAIHN0YXRpYyB2b2lk
IHhoY2lfY2xlYW51cF9oYWx0ZWRfZW5kcG9pbnQoc3RydWN0IHhoY2lfaGNkICp4aGNpLA0KICAg
ICAgICAgICAgICAgIGVwLT5lcF9zdGF0ZSB8PSBFUF9IQVJEX0NMRUFSX1RPR0dMRTsNCiAgICAg
ICAgICAgICAgICB4aGNpX2NsZWFudXBfc3RhbGxlZF9yaW5nKHhoY2ksIHNsb3RfaWQsIGVwX2lu
ZGV4LCBzdHJlYW1faWQsDQogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICB0ZCk7DQotICAgICAgICAgICAgICAgeGhjaV9jbGVhcl9odWJfdHRfYnVmZmVyKHhoY2ksIHRk
LCBlcCk7DQogICAgICAgIH0NCiAgICAgICAgeGhjaV9yaW5nX2NtZF9kYih4aGNpKTsNCiB9DQpA
QCAtMTk5NywxMSArMTk5NiwxOCBAQCBzdGF0aWMgaW50IGZpbmlzaF90ZChzdHJ1Y3QgeGhjaV9o
Y2QgKnhoY2ksIHN0cnVjdCB4aGNpX3RkICp0ZCwNCiAgICAgICAgaWYgKHRyYl9jb21wX2NvZGUg
PT0gQ09NUF9TVEFMTF9FUlJPUiB8fA0KICAgICAgICAgICAgICAgIHhoY2lfcmVxdWlyZXNfbWFu
dWFsX2hhbHRfY2xlYW51cCh4aGNpLCBlcF9jdHgsDQogICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICB0cmJfY29tcF9jb2RlKSkgew0KLSAgICAgICAgICAgICAg
IC8qIElzc3VlIGEgcmVzZXQgZW5kcG9pbnQgY29tbWFuZCB0byBjbGVhciB0aGUgaG9zdCBzaWRl
DQotICAgICAgICAgICAgICAgICogaGFsdCwgZm9sbG93ZWQgYnkgYSBzZXQgZGVxdWV1ZSBjb21t
YW5kIHRvIG1vdmUgdGhlDQotICAgICAgICAgICAgICAgICogZGVxdWV1ZSBwb2ludGVyIHBhc3Qg
dGhlIFRELg0KLSAgICAgICAgICAgICAgICAqIFRoZSBjbGFzcyBkcml2ZXIgY2xlYXJzIHRoZSBk
ZXZpY2Ugc2lkZSBoYWx0IGxhdGVyLg0KKyAgICAgICAgICAgICAgIC8qDQorICAgICAgICAgICAg
ICAgICogeGhjaSBpbnRlcm5hbCBlbmRwb2ludCBzdGF0ZSB3aWxsIGdvIHRvIGEgImhhbHQiIHN0
YXRlIGZvcg0KKyAgICAgICAgICAgICAgICAqIGFueSBzdGFsbCwgaW5jbHVkaW5nIGRlZmF1bHQg
Y29udHJvbCBwaXBlIHByb3RvY29sIHN0YWxsLg0KKyAgICAgICAgICAgICAgICAqIFRvIGNsZWFy
IHRoZSBob3N0IHNpZGUgaGFsdCB3ZSBuZWVkIHRvIGlzc3VlIGEgcmVzZXQgZW5kcG9pbnQNCisg
ICAgICAgICAgICAgICAgKiBjb21tYW5kLCBmb2xsb3dlZCBieSBhIHNldCBkZXF1ZXVlIGNvbW1h
bmQgdG8gbW92ZSBwYXN0IHRoZQ0KKyAgICAgICAgICAgICAgICAqIFRELg0KKyAgICAgICAgICAg
ICAgICAqIENsYXNzIGRyaXZlcnMgY2xlYXIgdGhlIGRldmljZSBzaWRlIGhhbHQgZnJvbSBhIGZ1
bmN0aW9uYWwNCisgICAgICAgICAgICAgICAgKiBzdGFsbCBsYXRlci4gSHViIFRUIGJ1ZmZlciBz
aG91bGQgb25seSBiZSBjbGVhcmVkIGZvciBGUy9MUw0KKyAgICAgICAgICAgICAgICAqIGRldmlj
ZXMgYmVoaW5kIEhTIGh1YnMgZm9yIGZ1bmN0aW9uYWwgc3RhbGxzLg0KICAgICAgICAgICAgICAg
ICAqLw0KKyAgICAgICAgICAgICAgIGlmICgoZXBfaW5kZXggIT0gMCkgfHwgKHRyYl9jb21wX2Nv
ZGUgIT0gQ09NUF9TVEFMTF9FUlJPUikpDQorICAgICAgICAgICAgICAgICAgICAgICB4aGNpX2Ns
ZWFyX2h1Yl90dF9idWZmZXIoeGhjaSwgdGQsIGVwKTsNCiAgICAgICAgICAgICAgICB4aGNpX2Ns
ZWFudXBfaGFsdGVkX2VuZHBvaW50KHhoY2ksIHNsb3RfaWQsIGVwX2luZGV4LA0KICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGVwX3JpbmctPnN0cmVhbV9pZCwgdGQsIEVQ
X0hBUkRfUkVTRVQpOw0KICAgICAgICB9IGVsc2Ugew0KLS0NCjIuMTcuMQ0KDQoNCi0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tDQpUaGlzIGVtYWlsIG1lc3NhZ2UgaXMgZm9yIHRoZSBzb2xlIHVz
ZSBvZiB0aGUgaW50ZW5kZWQgcmVjaXBpZW50KHMpIGFuZCBtYXkgY29udGFpbg0KY29uZmlkZW50
aWFsIGluZm9ybWF0aW9uLiAgQW55IHVuYXV0aG9yaXplZCByZXZpZXcsIHVzZSwgZGlzY2xvc3Vy
ZSBvciBkaXN0cmlidXRpb24NCmlzIHByb2hpYml0ZWQuICBJZiB5b3UgYXJlIG5vdCB0aGUgaW50
ZW5kZWQgcmVjaXBpZW50LCBwbGVhc2UgY29udGFjdCB0aGUgc2VuZGVyIGJ5DQpyZXBseSBlbWFp
bCBhbmQgZGVzdHJveSBhbGwgY29waWVzIG9mIHRoZSBvcmlnaW5hbCBtZXNzYWdlLg0KLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0NCg==
