Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B64522CB569
	for <lists+linux-usb@lfdr.de>; Wed,  2 Dec 2020 07:59:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728741AbgLBG6z (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 2 Dec 2020 01:58:55 -0500
Received: from mail-eopbgr70079.outbound.protection.outlook.com ([40.107.7.79]:62055
        "EHLO EUR04-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726202AbgLBG6z (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 2 Dec 2020 01:58:55 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hbXasXtkim2qXmwQzIPegISJPSnyWJsHy3/vS5a2wFxujRJkIWNwCmfuERNibm4jYHkl/F9BQeSdoCtcwFaUf4j60yfg5ZC7AttT/rbxHK213UJgknbVDuiunIZz5LfhgiTSPCY3jlhgiwrc/xY7nHRwishSK3WtB9n/H1ODd+zQWouQypibcCXi9WWdGme1nVf9rKpKsZaMHKND1Z6FqdHJk7wrplXrk5BvZGtr3GMQ7zsJtSNWmSuD3dflLNsiJW2uhcov9yv0325cO9ySrY00tj1nUdpf+4JFhGQk2guaH/zr1P7wh01BCsG2w12zWufCS4P5I6eI3hSGcwq4sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ACvv8oQsKNkQqfs+kIxJLdY++C06m+FNf9XmV4oxlXE=;
 b=nPi/HPMkjyfnHJn3yotZRInT8LFNVjeRuETQxUDRb5hmd5l4M9WlMfi5HhJ0Hzg1MzZ2vQSKmn0qV/B0VgL0+DceIyifDY0EROGUhZsuEYl9hc0p2N62pu8TcT9IwSBqcCzOVKO6Jp0MyAe/YPUuEgrKhA6o3Uny8IZwHcAx9e4Q2E5FTFF3DYSL91jzRjqLiXJvmfVh4r76aByr0QjzZjqH9+bLg9557IAQZjAzWi4zspY6YUNXo8eFEaOLVtOOXBrwLXpUElafy+jKvPAzxi3uidZBaAuI5nS67K6JqxygXdkC8OobtS0gtOXEH8RMNDDn+qi+Ni5KTwNKKdxiUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ACvv8oQsKNkQqfs+kIxJLdY++C06m+FNf9XmV4oxlXE=;
 b=YGksQJxt7viPbjW81bUd735NeZ+DiNCqsyJOyjHqartURe86cJqOjjM1fu9bzg3QOwZBDMvZSiQOBs9ZwBDOPIiL7UNIKSyRHVjQqgHfboDlpFhq9KVYLHdGGeNEDsur6SsYe2pPumFf00CjDNYLceNiGJJIrAWdkP+VDwBF9ME=
Received: from VE1PR04MB6528.eurprd04.prod.outlook.com (2603:10a6:803:127::18)
 by VI1PR0402MB2911.eurprd04.prod.outlook.com (2603:10a6:800:b8::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.25; Wed, 2 Dec
 2020 06:58:04 +0000
Received: from VE1PR04MB6528.eurprd04.prod.outlook.com
 ([fe80::b035:d158:c99c:57c6]) by VE1PR04MB6528.eurprd04.prod.outlook.com
 ([fe80::b035:d158:c99c:57c6%7]) with mapi id 15.20.3611.032; Wed, 2 Dec 2020
 06:58:04 +0000
From:   Jun Li <jun.li@nxp.com>
To:     Mathias Nyman <mathias.nyman@linux.intel.com>,
        "mathias.nyman@intel.com" <mathias.nyman@intel.com>
CC:     "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Peter Chen <peter.chen@nxp.com>
Subject: RE: [PATCH] usb: host: xhci: wait USB2 port enter suspend for bus
 suspend
Thread-Topic: [PATCH] usb: host: xhci: wait USB2 port enter suspend for bus
 suspend
Thread-Index: AQHWsdO/dqhU2/rHA0iX6fFqD5cydKnh7hWwgAEpFgCAAC0PYA==
Date:   Wed, 2 Dec 2020 06:58:04 +0000
Message-ID: <VE1PR04MB65282E8B0E8D2C0100FCE18D89F30@VE1PR04MB6528.eurprd04.prod.outlook.com>
References: <1604402250-16434-1-git-send-email-jun.li@nxp.com>
 <VE1PR04MB6528A9C9B77B4F2A9CFF9C0D89F40@VE1PR04MB6528.eurprd04.prod.outlook.com>
 <9b8d9be1-a6e4-e861-1d91-a62a97ac3add@linux.intel.com>
In-Reply-To: <9b8d9be1-a6e4-e861-1d91-a62a97ac3add@linux.intel.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.71]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 30fbb543-4469-4b92-5645-08d8968f9e03
x-ms-traffictypediagnostic: VI1PR0402MB2911:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1PR0402MB29115A4DA869391D2F3E2A4089F30@VI1PR0402MB2911.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: FNmbHc/C+mfoAeJquv/70fxPCmnhKRszYqh6LnkCRuPNE0PHzFle38ZtFtYW8stfyinOiKKd8H7XtM4s/bREyho0DQpeQY/EZv+rutGzCLMGEfJaGru08N/HAL9SAPjiQIQQP5h6iT+dzNT20P++REGMwSuv8MP6kYpmb6QnCpSROurD+xL+8cAfA+nrRZoZlUSaUTl/IsDObUHL2l4etQ4VMhfw8RCRFKpwo4O+AqwmAZ8OAh1/PxpKdD8U9MZ1PTxlizQH78ngVItWqElBuvc3B7MDJL54bMo/auxx1+XaMC8Lse9yvZKzJn/C11YscjfvTOHSxneTRlIdHYzing==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6528.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(39860400002)(346002)(136003)(366004)(376002)(7696005)(15650500001)(66946007)(71200400001)(8676002)(44832011)(52536014)(2906002)(53546011)(6506007)(110136005)(8936002)(26005)(66476007)(64756008)(66446008)(186003)(478600001)(55016002)(83380400001)(86362001)(4326008)(33656002)(316002)(9686003)(66556008)(5660300002)(76116006)(54906003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?utf-8?B?WW11cGNzV0pSMEZCd25Wc1Y0Q0NnTlJqVWNPanpKbG40anBzY2tyalFoVUlj?=
 =?utf-8?B?NjQrd2ZDQWV3ek9vVUt1SXJIRis2M1JTZkgva0VpNmVrT01rMXRXaVgrZXJv?=
 =?utf-8?B?T0JyREdaN1FlOXY1YUswaHJwbjRqMksrK0hSMUo0NXlXdUFQT2RtaXBQclFE?=
 =?utf-8?B?Slc0Y0xkYmdScGwvVmJVMmdRS2RHMXFjRXErMkRpREtCNTRwbWxrSzhHZFhT?=
 =?utf-8?B?NHZxRHYvUUJXZUxTZ0dVM3pIT2ZROTY4OXh4UnNORHVNbGFlMG1NOStsakZX?=
 =?utf-8?B?dXAyUldLUXJ4M1ZMU3k5VGRGemdnUWhYVUNHci82NW1WSnkvVG16bm5hcHM1?=
 =?utf-8?B?MktaZnhFSDBtNXNmT3g5bWdEdmRYNTJ2NmV3QmR2Z3lEbnpDdTVwaFo0STRh?=
 =?utf-8?B?dE1XVEl6QjJ1QVFYWlEraENlcjJVRERXeWZQNHJqRG9xWVN0bE1DQ0Yxay9E?=
 =?utf-8?B?a3FObVlBcGt2UURWdVJxZzh4dUUrQUpBQTVOOFp6UFRBM2VydmMxOEhzU3dh?=
 =?utf-8?B?Z1M2a1ZlZDgyK2JRSkk4dWJoWmdKbnNONWx3bm5YNzk0ZTlmQTQrcGNDOFE0?=
 =?utf-8?B?NFNJRHY5RlpQQzZwdDRqS0s0N1NaN053bm5KK21WbHA1aUlTTitsWWs3cTV1?=
 =?utf-8?B?azhhZ29yd1pZYStJM3Y5WTlpZ0o1dVViaElwVVFGdk8vVzRmWDVXcTJsUmpm?=
 =?utf-8?B?VDhhMklDbVdEbUo3TlB3TlJZTFlxY1BZdVN5WVdqL29UenBqckdMOWFJaTJS?=
 =?utf-8?B?V2ozZFBvQnJjY1lyN0Uzd3pBbCtXYWh4N0tZZ3p4T1VOTlVNdGx6UjhrSnow?=
 =?utf-8?B?L05iWXQvSHF6THZXbWh2SS9kRzlPZm9idlZ4SmZLZjFDeDZRb1hJL09HMkpp?=
 =?utf-8?B?c1VRUXZ2RXREa2hQRDBmRWdxRFNYMjFLUzltL3kwYXRrdTB4aFpnNTE1dzds?=
 =?utf-8?B?d3pCU1lRbi81bThuVTkyaEhUN2hGcDNkcDlmWERsSngxT3NRSW9YMFRkZ3NP?=
 =?utf-8?B?eitzaENJWmlyYVlFWDNaN25LYXFyMVZwVHZwcEpoWDNqNjJSRG1MdjBxNTlv?=
 =?utf-8?B?MFo5aEU4ck5VT3VYOEl3enQxRFVENXRzalBkaXkvWGQvWldGNDBYVFdxenVJ?=
 =?utf-8?B?N3EvN1RYMnNNcWxQUmF0ZGhiejgzNzdNR1JDWGNkeDFWMlRFdnYzYmVkZHVq?=
 =?utf-8?B?NnBxTElSWWpMQkJHL0lOZ2w0bXRLMVIzMG9OYXcybXpmejhPSzg3SnVvT1VT?=
 =?utf-8?B?NTVWVTdZWm9hYWdWL2VwekJLeWpUWUJZVW9ScWlQYzcwT01YTk5tZXJGL3h4?=
 =?utf-8?Q?Ag+xz2+HMzOwg=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6528.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 30fbb543-4469-4b92-5645-08d8968f9e03
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Dec 2020 06:58:04.7604
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: u0SVqpfTeM8yJFNxv7JAzZmbWVsB2P4XzANLS/P1VRxY4zbCL/jMjT22sS/BE0zM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB2911
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogTWF0aGlhcyBOeW1hbiA8
bWF0aGlhcy5ueW1hbkBsaW51eC5pbnRlbC5jb20+DQo+IFNlbnQ6IFdlZG5lc2RheSwgRGVjZW1i
ZXIgMiwgMjAyMCA3OjU1IEFNDQo+IFRvOiBKdW4gTGkgPGp1bi5saUBueHAuY29tPjsgbWF0aGlh
cy5ueW1hbkBpbnRlbC5jb20NCj4gQ2M6IGdyZWdraEBsaW51eGZvdW5kYXRpb24ub3JnOyBsaW51
eC11c2JAdmdlci5rZXJuZWwub3JnOyBQZXRlciBDaGVuDQo+IDxwZXRlci5jaGVuQG54cC5jb20+
DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0hdIHVzYjogaG9zdDogeGhjaTogd2FpdCBVU0IyIHBvcnQg
ZW50ZXIgc3VzcGVuZCBmb3IgYnVzDQo+IHN1c3BlbmQNCj4gDQo+IEhpDQo+IA0KPiBPbiAxLjEy
LjIwMjAgOC4xMiwgSnVuIExpIHdyb3RlOg0KPiA+IEhpLA0KPiA+DQo+ID4+IC0tLS0tT3JpZ2lu
YWwgTWVzc2FnZS0tLS0tDQo+ID4+IEZyb206IEp1biBMaSA8anVuLmxpQG54cC5jb20+DQo+ID4+
IFNlbnQ6IFR1ZXNkYXksIE5vdmVtYmVyIDMsIDIwMjAgNzoyMyBQTQ0KPiA+PiBUbzogbWF0aGlh
cy5ueW1hbkBpbnRlbC5jb20NCj4gPj4gQ2M6IGdyZWdraEBsaW51eGZvdW5kYXRpb24ub3JnOyBs
aW51eC11c2JAdmdlci5rZXJuZWwub3JnOyBQZXRlciBDaGVuDQo+ID4+IDxwZXRlci5jaGVuQG54
cC5jb20+DQo+ID4+IFN1YmplY3Q6IFtQQVRDSF0gdXNiOiBob3N0OiB4aGNpOiB3YWl0IFVTQjIg
cG9ydCBlbnRlciBzdXNwZW5kIGZvcg0KPiA+PiBidXMgc3VzcGVuZA0KPiA+Pg0KPiA+PiBJZiB0
aGUgY29ubmVjdGVkIFVTQjIgZGV2aWNlIHdha2V1cCBpcyBub3QgZW5hYmxlZC9zdXBwb3J0ZWQs
IHRoZQ0KPiA+PiBsaW5rIHN0YXRlIG1heSBzdGlsbCBiZSBVMCB3aGVuIGRvIHhoY2kgYnVzIHN1
c3BlbmQsIGFmdGVyIHdlIHN1c3BlbmQNCj4gPj4gcG9ydHMgaW4gVTAsIHdlIG5lZWQgZ2l2ZSB0
aW1lIHRvIGRldmljZSB0byBlbnRlciBzdXNwZW5kIGJlZm9yZSBkbw0KPiA+PiBmdXJ0aGVyIHN1
c3BlbmQgb3BlcmF0aW9ucyAoZS5nLiBzeXN0ZW0gc3VzcGVuZCksIG90aGVyd2lzZSB3ZSBtYXkN
Cj4gPj4gZW50ZXIgc3lzdGVtIHN1c3BlbmQgd2l0aCBsaW5rIHN0YXRlIGF0IFUwLg0KPiANCj4g
DQo+IFdoYXQgc2lkZS1lZmZlY3RzIGhhdmUgeW91IG9ic2VydmVkIGlmIGJ1cyBzdXNwZW5kIHJl
dHVybnMgd2hpbGUgYSBwb3J0IGlzDQo+IHN0aWxsIHRyYW5zaXRpb25pbmcgdG8gVTM/DQoNCkkg
Zm91bmQgYSByZWFsIHByb2JsZW0gb24gcmVtb3RlIHdha2V1cCBieSBVU0IyIGRldmljZSBkaXNj
b25uZWN0DQpvbiByb290IHBvcnQsIHRoYXQgZGV2aWNlKGUuZy4gVWRpc2spIGl0c2VsZiBkb2Vz
IG5vdCBzdXBwb3J0IHJlbW90ZQ0Kd2FrZXVwLCB0aGUgcmVtb3RlIHdha2V1cCBoYXMgcHJvYmxl
bSBpZiBJIGVuYWJsZSBVU0IyIERQRE0gd2FrZXVwDQp3aGVuIFVTQjIgYnVzIGF0IFUwLg0KDQo+
IA0KPiBJIGNhbid0IHJlY2FsbCB3aHkgd2UgZW5kIHVwIHdpdGggcG9ydHMgaW4gVTAgaW4gYnVz
IHN1c3BlbmQgYW55bW9yZS4NCj4gSSB0aGluayB0aGF0IGluIHN5c3RlbSBzdXNwZW5kIHRoZSBs
aW5rIHNob3VsZCBiZSBwdXQgdG8gVTMgYWxyZWFkeSB3aGVuDQo+IHRoZSB1c2IgZGV2aWNlIGlz
IHN1c3BlbmRlZCwgYmVmb3JlIHRoZSBidXMgc3VzcGVuZHMsIGV2ZW4gaWYgaXQgZG9lc24ndA0K
PiBzdXBwb3J0IHJlbW90ZSB3YWtldXAuDQoNCkkgYWxzbyB0aG91Z2h0IHNvIGJ1dCBhY3R1YWxs
eSBub3QsIHNlZSBiZWxvdyBpbiB1c2JfcG9ydF9zdXNwZW5kKCk6DQoNCiAgMTIgICAgICAgICBp
ZiAoaHViX2lzX3N1cGVyc3BlZWQoaHViLT5oZGV2KSkNCiAgMTMgICAgICAgICAgICAgICAgIHN0
YXR1cyA9IGh1Yl9zZXRfcG9ydF9saW5rX3N0YXRlKGh1YiwgcG9ydDEsIFVTQl9TU19QT1JUX0xT
X1UzKTsgDQogIDE0IA0KICAxNSAgICAgICAgIC8qDQogIDE2ICAgICAgICAgICogRm9yIHN5c3Rl
bSBzdXNwZW5kLCB3ZSBkbyBub3QgbmVlZCB0byBlbmFibGUgdGhlIHN1c3BlbmQgZmVhdHVyZQ0K
ICAxNyAgICAgICAgICAqIG9uIGluZGl2aWR1YWwgVVNCLTIgcG9ydHMuICBUaGUgZGV2aWNlcyB3
aWxsIGF1dG9tYXRpY2FsbHkgZ28NCiAgMTggICAgICAgICAgKiBpbnRvIHN1c3BlbmQgYSBmZXcg
bXMgYWZ0ZXIgdGhlIHJvb3QgaHViIHN0b3BzIHNlbmRpbmcgcGFja2V0cy4NCiAgMTkgICAgICAg
ICAgKiBUaGUgVVNCIDIuMCBzcGVjIGNhbGxzIHRoaXMgImdsb2JhbCBzdXNwZW5kIi4NCiAgMjAg
ICAgICAgICAgKg0KICAyMSAgICAgICAgICAqIEhvd2V2ZXIsIG1hbnkgVVNCIGh1YnMgaGF2ZSBh
IGJ1ZzogVGhleSBkb24ndCByZWxheSB3YWtldXAgcmVxdWVzdHMNCiAgMjIgICAgICAgICAgKiBm
cm9tIGEgZG93bnN0cmVhbSBwb3J0IGlmIHRoZSBwb3J0J3Mgc3VzcGVuZCBmZWF0dXJlIGlzbid0
IG9uLg0KICAyMyAgICAgICAgICAqIFRoZXJlZm9yZSB3ZSB3aWxsIHR1cm4gb24gdGhlIHN1c3Bl
bmQgZmVhdHVyZSBpZiB1ZGV2IG9yIGFueSBvZiBpdHMNCiAgMjQgICAgICAgICAgKiBkZXNjZW5k
YW50cyBpcyBlbmFibGVkIGZvciByZW1vdGUgd2FrZXVwLg0KICAyNSAgICAgICAgICAqLw0KICAy
NiAgICAgICAgIGVsc2UgaWYgKFBNU0dfSVNfQVVUTyhtc2cpIHx8IHVzYl93YWtldXBfZW5hYmxl
ZF9kZXNjZW5kYW50cyh1ZGV2KSA+IDApDQogIDI3ICAgICAgICAgICAgICAgICBzdGF0dXMgPSBz
ZXRfcG9ydF9mZWF0dXJlKGh1Yi0+aGRldiwgcG9ydDEsDQogIDI4ICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgVVNCX1BPUlRfRkVBVF9TVVNQRU5EKTsNCiAgMjkgICAgICAgICBlbHNl
IHsNCiAgMzAgICAgICAgICAgICAgICAgIHJlYWxseV9zdXNwZW5kID0gZmFsc2U7DQogIDMxICAg
ICAgICAgICAgICAgICBzdGF0dXMgPSAwOw0KICAzMiAgICAgICAgIH0NCg0KdXNiX3dha2V1cF9l
bmFibGVkX2Rlc2NlbmRhbnRzKHVkZXYpID4gMCBpcyBub3QgdHJ1ZSwgaWYgdGhlIGRldmljZSBp
dHNlbGYNCmRvZXMgbm90IHN1cHBvcnQgcmVtb3RlIHdha2V1cC4NCg0KPiANCj4gRG8geW91IGtu
b3cgdGhlIHJlYXNvbiB3aHkgdGhlIGRldmljZSBpcyBpbiBVMCBpbiBidXMgc3VzcGVuZCBpbiB5
b3VyIGNhc2U/DQo+IENvdWxkIHRoYXQgYmUgdGhlIHJlYWwgcHJvYmxlbSB0aGF0IG5lZWRzIHRv
IGJlIGZpeGVkPw0KDQpTZWUgYWJvdmUuDQoNCj4gDQo+ID4+DQo+ID4+IFNpZ25lZC1vZmYtYnk6
IExpIEp1biA8anVuLmxpQG54cC5jb20+DQo+ID4+IC0tLQ0KPiA+PiAgZHJpdmVycy91c2IvaG9z
dC94aGNpLWh1Yi5jIHwgNiArKysrKysNCj4gPj4gIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlv
bnMoKykNCj4gPj4NCj4gPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNiL2hvc3QveGhjaS1odWIu
Yw0KPiA+PiBiL2RyaXZlcnMvdXNiL2hvc3QveGhjaS1odWIuYyBpbmRleCBjNzk5Y2E1Li4xZTA1
NGQwIDEwMDY0NA0KPiA+PiAtLS0gYS9kcml2ZXJzL3VzYi9ob3N0L3hoY2ktaHViLmMNCj4gPj4g
KysrIGIvZHJpdmVycy91c2IvaG9zdC94aGNpLWh1Yi5jDQo+ID4+IEBAIC0xNTk4LDYgKzE1OTgs
NyBAQCBpbnQgeGhjaV9idXNfc3VzcGVuZChzdHJ1Y3QgdXNiX2hjZCAqaGNkKQ0KPiA+PiAgCXN0
cnVjdCB4aGNpX2h1YiAqcmh1YjsNCj4gPj4gIAlzdHJ1Y3QgeGhjaV9wb3J0ICoqcG9ydHM7DQo+
ID4+ICAJdTMyIHBvcnRzY19idWZbVVNCX01BWENISUxEUkVOXTsNCj4gPj4gKwlib29sIHdhaXRf
cG9ydF9lbnRlcl91MyA9IGZhbHNlOw0KPiA+PiAgCWJvb2wgd2FrZV9lbmFibGVkOw0KPiA+Pg0K
PiA+PiAgCXJodWIgPSB4aGNpX2dldF9yaHViKGhjZCk7DQo+ID4+IEBAIC0xNzA2LDEyICsxNzA3
LDE3IEBAIGludCB4aGNpX2J1c19zdXNwZW5kKHN0cnVjdCB1c2JfaGNkICpoY2QpDQo+ID4+ICAJ
CQkJeGhjaV9zdG9wX2RldmljZSh4aGNpLCBzbG90X2lkLCAxKTsNCj4gPj4gIAkJCQlzcGluX2xv
Y2tfaXJxc2F2ZSgmeGhjaS0+bG9jaywgZmxhZ3MpOw0KPiA+PiAgCQkJfQ0KPiA+PiArCQkJd2Fp
dF9wb3J0X2VudGVyX3UzID0gdHJ1ZTsNCj4gDQo+IEkgZG9uJ3QgdGhpbmsgIndhaXRfcG9ydF9l
bnRlcl91MyIgaXMgbmVlZGVkLiBJZiB4aGNpX2J1c19zdXNwZW5kKCkgbmVlZHMNCj4gdG8gc2V0
IGEgcG9ydCBsaW5rIHRvIFUzIGl0IHdpbGwgYWxzbyBzZXQgYSBiaXQgaW4gYnVzX3N0YXRlLT5i
dXNfc3VzcGVuZGVkDQo+IA0KDQpBZ3JlZSBhZnRlciBjaGVjay4NCg0KPiA+PiAgCQl9DQo+ID4+
ICAJCXdyaXRlbChwb3J0c2NfYnVmW3BvcnRfaW5kZXhdLCBwb3J0c1twb3J0X2luZGV4XS0+YWRk
cik7DQo+ID4+ICAJfQ0KPiA+PiAgCWhjZC0+c3RhdGUgPSBIQ19TVEFURV9TVVNQRU5ERUQ7DQo+
ID4+ICAJYnVzX3N0YXRlLT5uZXh0X3N0YXRlY2hhbmdlID0gamlmZmllcyArIG1zZWNzX3RvX2pp
ZmZpZXMoMTApOw0KPiA+PiAgCXNwaW5fdW5sb2NrX2lycXJlc3RvcmUoJnhoY2ktPmxvY2ssIGZs
YWdzKTsNCj4gPj4gKw0KPiA+PiArCWlmICh3YWl0X3BvcnRfZW50ZXJfdTMpDQo+ID4+ICsJCXVz
bGVlcF9yYW5nZSg1MDAwLCAxMDAwMCk7DQo+IA0KPiBGaXJzdCB0aG91Z2h0IHdlIHNob3VsZCBw
b2xsIHRoZSByZWdpc3RlcihzKSBhbmQgd2FpdCBmb3IgcG9ydHMgdG8gZW50ZXINCj4gVTMsIGJ1
dCB0aGUgbW9yZSBjb21tb24gY2FzZSB3aGVyZSBhIGRldmljZSBpcyBzdXNwZW5kZWQgYW5kIGxp
bmsgcHV0IHRvDQo+IFUzIHdpdGggYQ0KPiBVU0IyIFNldFBvcnRGZWF0dXJlKFBPUlRfU1VTUEVO
RCkgYWxzbyBqdXN0IHNsZWVwcyBmb3IgMTBtcywgc28gZG9pbmcgaXQNCj4gZm9yIHRoaXMgc3Bl
Y2lhbCBjYXNlIHNob3VsZCBiZSBvayBhcyB3ZWxsLg0KPiANCj4gaWYgKGJ1c19zdGF0ZS0+YnVz
X3N1c3BlbmRlZCkNCj4gCXVzbGVlcF9yYW5nZSg1MDAwLCAxMDAwMCkNCg0KSSB3aWxsIHNlbmQg
eW91ciBwcm9wb3NhbCBpZiBubyBtb3JlIGNvbW1lbnRzLg0KDQpUaGFua3MNCkxpIEp1bg0KPiAN
Cj4gLU1hdGhpYXMNCg0K
