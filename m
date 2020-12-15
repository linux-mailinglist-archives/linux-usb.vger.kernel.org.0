Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9482F2DAA7E
	for <lists+linux-usb@lfdr.de>; Tue, 15 Dec 2020 10:59:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728201AbgLOJ65 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 15 Dec 2020 04:58:57 -0500
Received: from mail-eopbgr40049.outbound.protection.outlook.com ([40.107.4.49]:58343
        "EHLO EUR03-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727850AbgLOJ6o (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 15 Dec 2020 04:58:44 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m59yWu8Wc6BvFeqntmDrJqxrZxLEZ09rT4bGYUGyYIZWP2J72W/M7llvlNMEXrmJSezmFbwPLO2hN9um9hpVtx5jhqGimiHojrP+ZfVJhm/IZwXTe1MQ50dOnY5ENzVm9TBQmi1RJIADVUCwjBVKTmfS6kYGoPNYn9ThW8NK1yncjkVw81qTBU35iv0ab2YQYzkLzGCUNkVx4V57+Khfz+OI34jIOuerTeDYCz9pbDLmn2W6pUThMTWnmQlVp5Dasr9PxNArO5HqxUT6W6hGYWfsnAO+VKMYYE/WqeJG/yXzn1KznMI/ogESg+dsQoFHJxLkpr1NLgLsHcVeyL6Q/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wPPJGJVKJsj5Gktromrwk/axBGDVcKDrX+aEuHVtAYU=;
 b=Uh45snwq3OKwEjPOXSw3r2w1fLW5fvei5CiXqZj/JL6v4FTFcPsJeN2x5vg1qswhV41C6gXgfLwq6HuCIhItQbzNrkFcBFkLD3jfWpfLV4+ShkJjlQIMG46fLycEr3GoK3FYUzrJYyqN7pJr5B9e6c07rOd90siXcHHr9oBXfexZceprvdu0J2TNUluE3amYjZUYqduCAws9bniahMSEnBJRsVtuiDlagXMbxyw/cK/t8snT1pYmwKxlsjt1XxOe1N+TSmkyt1M6eiD1GMBgy7TMAcNAtgUh1EjqgW869n1qoBjgRW9zKj/lbeCxIlkC/NRMND65N1AIccnUnBHF5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wPPJGJVKJsj5Gktromrwk/axBGDVcKDrX+aEuHVtAYU=;
 b=Mm69QCg1IP6gPra/Zk4BOcaGSh3aULHaCA9uqFNEzcFaLf+rRwiNRMVaN9NJNjbhfcrSFuod6lGjuj2qCT0EEVg6jy+WNEnIU1WukqI97cf/Xti0vco1IZskD8MKQZTLJyRRsD79+QFYNCjOFGhWJHf+n1rillP5ZJ3X68645J8=
Received: from DBBPR04MB7979.eurprd04.prod.outlook.com (2603:10a6:10:1ec::9)
 by DB7PR04MB5084.eurprd04.prod.outlook.com (2603:10a6:10:1c::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12; Tue, 15 Dec
 2020 09:57:53 +0000
Received: from DBBPR04MB7979.eurprd04.prod.outlook.com
 ([fe80::c8c:888f:3e0c:8d5c]) by DBBPR04MB7979.eurprd04.prod.outlook.com
 ([fe80::c8c:888f:3e0c:8d5c%5]) with mapi id 15.20.3654.026; Tue, 15 Dec 2020
 09:57:53 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     Jun Li <lijun.kernel@gmail.com>,
        Alan Stern <stern@rowland.harvard.edu>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: RE: port power is on again after turning off by user space
Thread-Topic: port power is on again after turning off by user space
Thread-Index: AdbSkrHAwwTe1v1pTzSTgGOOVcOG/gADLuWAAABrJAAACaqS0A==
Date:   Tue, 15 Dec 2020 09:57:53 +0000
Message-ID: <DBBPR04MB79790C8D243173467AE94D4E8BC60@DBBPR04MB7979.eurprd04.prod.outlook.com>
References: <DBBPR04MB79793525394F70DE397E24038BC60@DBBPR04MB7979.eurprd04.prod.outlook.com>
 <CAKgpwJXMFSHxi7vE5cOxkYPTnY74oB-SKf3FikerCzFDLYqcbw@mail.gmail.com>
 <20201215051402.GC2142@b29397-desktop>
In-Reply-To: <20201215051402.GC2142@b29397-desktop>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [180.164.155.184]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 3388c650-88ee-41c2-545b-08d8a0dfe3e2
x-ms-traffictypediagnostic: DB7PR04MB5084:
x-microsoft-antispam-prvs: <DB7PR04MB5084FD94010F965F548D37818BC60@DB7PR04MB5084.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: wqNTP52QHH63ZWEz9y7lZWZUkcWPhaH5jFRntTj/cfcv+u00naTuPilQcQQ2DF9naO6CXu0fbsZUxMUDfRUax2RUKzC405E2c5kM2Icg/mSp+Kkb3Uonu8TVqrsQkUDtr/lbPymLSiAnuAgqvOp7MDbHvo1Alcie7OddQVvceuv/cG8jQbijcsPFHTsqQ/UE/UsKMRx/O0YC+3GrlcZoVpoYnwIZdKz42y6Bl5+c6VB6rJygYb0OJu7nt/551DLwiEhpq1EpaYyBWqrX+HtOGJ22peXimBZKOEpzzyJdgDIQ+PClLyJOD/RYNC2Bn7dV1dyKYtqZoHWLPE7TD0DvtrRdJYrGGSCi6vL0J30AVgdyP9c/k75R7W+3OyXe+gGuSAbdhd6xsUXWOXS5l7VPMIBCLHdkZaFyS4uZM1rrr+j+LASTbeuAEPV+zWy2snwG811peVCvpwOkFHjhcQl2j67P7mZNHN7T1IxnaGA4tcE=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR04MB7979.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(346002)(136003)(366004)(396003)(376002)(83380400001)(45080400002)(9686003)(4326008)(2906002)(66946007)(44832011)(64756008)(7696005)(66446008)(66556008)(966005)(478600001)(8936002)(71200400001)(66476007)(83080400002)(26005)(316002)(76116006)(52536014)(8676002)(6506007)(55016002)(86362001)(186003)(110136005)(5660300002)(33656002)(493534005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?utf-8?B?YStGd3kzUFUzcXY1YTMzN3RXTUR3ckdXL2xyU1Y5Vkd4NW1CQmRvcCthTWEx?=
 =?utf-8?B?TmxGQUFpK0dNcWxhbHdHbkQyTUdkQ01Oc1dZTHFSTnJ6bVhxa0R4Yy8vRmt1?=
 =?utf-8?B?Y29hMHhuV1V6UnNiYVphNU1ISUZhVVlUdStFUFlGN1pCMmJJWVV4ejdqTFMz?=
 =?utf-8?B?RGk3dkl4WURob1lhQWEvK1pzY2tGZmJXWm42YWo5Y3BHUjE5TTIySk1CV0tM?=
 =?utf-8?B?K2ZEVGk5Y29ha1FrWnE0ZkpTMlREVWhUWUwxc1IzNWZsNklKb1FYWVYwLy9U?=
 =?utf-8?B?ZXhrV0ovbEkvbjMvREkxWFRCNndDeExRV21sQzcrb3IrZENXRldESFhCWjVt?=
 =?utf-8?B?aXE3QkVxYzZnbUgxQmROSFNPNFBISW1OUytzL1NVWXR6Si9JV2FMMnNNVkpH?=
 =?utf-8?B?cG1kU0hmVGcrbWFDWWhFUDdnQzgyY3pNTDdMRkovdWI5TGRRR084N3oxKzd3?=
 =?utf-8?B?SVAzSVJYWG5ieDJaUUwrN1VzN0ZzOHQzdWxmRytSVklGK1RxcEdUdHFHS1dp?=
 =?utf-8?B?eG9WeUE4RFdXb05WTEVsNngxUWhSZDJVWXM4VTRuV3BVc0FUcmpMODQxL3hs?=
 =?utf-8?B?MzRBNjV2M01lQmtLQWdpMGhFaTVuMmVZOHJCaVZBUDZ4bkpaMDZYUVMvVWo3?=
 =?utf-8?B?czh1NUttTU5DbjdPYjlYMkNjeFpqK0lSV1NNR2JlTk1LbXE4ZVlDc2dTYWJ1?=
 =?utf-8?B?TlppbDNvVnlLUVpic0R1UlJScmhCL0RTMnZlSUFuQUVza3BiOGFFMVdqWEF5?=
 =?utf-8?B?WFFqbmhPdXBQWEtPdlpyYWJzNG91endBN2tpQkk4U2pzU3ZuS0MwSXQ5S2dt?=
 =?utf-8?B?eGduUnBsbEdDWWJ2NkJzYWtwc1BiK3ZvTUVCRkJEaHJpbTFZcUwwRVVxQkov?=
 =?utf-8?B?WndEd1ZHSG9KYjRRNC9sOUtDWnNmR25kRHJVd2pWMXBzYmlIeHROK3NzN1BB?=
 =?utf-8?B?VUdZWmw3ZXR2dGdLNnQ3MmY5S3BUV0RsNEpadThiR2dzV1dnMVhFMDlsY3BB?=
 =?utf-8?B?TW1HcWlXb3YrQldKQllCME0vTThsQ1JFVmhJbUUxeUlyR05PWG5yWEtEZEVk?=
 =?utf-8?B?RmtnKzJScmlWNGNNNTFTWG5yOHZVeFlQK0lqTjhGeXZ5bTJqTFdNeFhKZTVB?=
 =?utf-8?B?RzdBVTBIRnB5T0VhMk5kQ01ONnNPSDBTM3l6bnE0L2Q1VlpZUkhOZGpBTkN0?=
 =?utf-8?B?MnRVcjBHK242eTlZbXo2eURicENsQmFmelo3Uk1jOVV0UEJmUzdiRFJMOFJj?=
 =?utf-8?B?OWJwSTVHUmRIWTJicklwaWJXYmp5SUJzdkNtMXF5ajJCS0VEYTc4djFXdmxB?=
 =?utf-8?Q?XTVEoEUHyJI/4qeKw1NPgm46LZcHGRqi/q?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DBBPR04MB7979.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3388c650-88ee-41c2-545b-08d8a0dfe3e2
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Dec 2020 09:57:53.3500
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: n22xz5r4+uDPGs08Q3kx5sv/AgFyos9wRkaDH1HHqrcg2K2koJaNMUUVmchYjtGIt1GRxiCZ0xkOh3+JnJERnw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB5084
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

IA0KPiA+ID4gSGkgQWxhbiwNCj4gPiA+DQo+ID4gPiBJIHVzZSBvbmUgSFVCIHBvd2VyIGNvbnRy
b2wgYXBwbGljYXRpb24NCj4gPiA+DQo+IChodHRwczovL2V1cjAxLnNhZmVsaW5rcy5wcm90ZWN0
aW9uLm91dGxvb2suY29tLz91cmw9aHR0cHMlM0ElMkYlMkZnaXRodWIuDQo+IGNvbSUyRm12cCUy
RnVodWJjdGwmYW1wO2RhdGE9MDQlN0MwMSU3Q3BldGVyLmNoZW4lNDBueHAuY29tJTdDDQo+IDcz
NmVjZTE5YmM3YTQzMGM5OGI4MDhkOGEwYjY5NzVjJTdDNjg2ZWExZDNiYzJiNGM2ZmE5MmNkOTlj
NWMzMDE2DQo+IDM1JTdDMCU3QzAlN0M2Mzc0MzYwNTMzNjIxNTEwMjIlN0NVbmtub3duJTdDVFdG
cGJHWnNiM2Q4ZXlKDQo+IFdJam9pTUM0d0xqQXdNREFpTENKUUlqb2lWMmx1TXpJaUxDSkJUaUk2
SWsxaGFXd2lMQ0pYVkNJNk1uMCUzRCU3DQo+IEMxMDAwJmFtcDtzZGF0YT1scHRmMVhPNXllYjZs
UWJBRmxLVXJaJTJCRVg1QVRYUVJmdEd3bTI2V293RkElDQo+IDNEJmFtcDtyZXNlcnZlZD0wKSB0
byBpbnZlc3RpZ2F0ZSBwb3dlciBzd2l0Y2hhYmxlIEhVQiwgYW5kIGZpbmQgdGhlIGtlcm5lbA0K
PiB0dXJucyBwb3J0IHBvd2VyIG9uIGFnYWluIGF0IGRyaXZlcnMvdXNiL2NvcmUvaHViLmMsIGFm
dGVyIHBvcnQgcG93ZXIgaXMgdHVybmVkDQo+IG9mZiBieSB1c2VyIHNwYWNlLg0KPiA+ID4NCj4g
PiA+IDUxMjIgICAgICAgICAgICAgICAgIGlmIChodWJfaXNfcG9ydF9wb3dlcl9zd2l0Y2hhYmxl
KGh1YikNCj4gPiA+IDUxMjMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAmJiAhcG9y
dF9pc19wb3dlcl9vbihodWIsDQo+IHBvcnRzdGF0dXMpDQo+ID4gPiA1MTI0ICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgJiYgIXBvcnRfZGV2LT5wb3J0X293bmVyKQ0KPiA+ID4gNTEy
NSAgICAgICAgICAgICAgICAgICAgICAgICBzZXRfcG9ydF9mZWF0dXJlKGhkZXYsIHBvcnQxLA0K
PiBVU0JfUE9SVF9GRUFUX1BPV0VSKTsNCj4gPiA+DQo+ID4gPiBUaGUgbWFpbiBzZXF1ZW5jZSBm
b3IgdGVzdGluZyB0dXJuIHBvcnQgcG93ZXIgb2ZmIGxpa2UgYmVsb3c6DQo+ID4gPg0KPiA+ID4g
LSB1aHViY3RsIHNlbmRzIGNvbW1hbmQgdG8gdHVybiBzcGVjaWZjIHBvcnQgKGVnLCAyLTEuNCkg
cG93ZXIgb2ZmLg0KPiA+ID4gLSBkZXZpbyBhdCBrZXJuZWwgZ2V0cyB0aGF0IGNvbW1hbmQsIGFu
ZCBzZW5kIHRvIGh1Yi4NCj4gPiA+IC0gcG9ydCBwb3dlciBpcyBvZmYsIHRoZSBodWJfZXZlbnQg
aXMgdHJpZ2dlcmVkIGR1ZSB0byBwb3J0IHN0YXR1cyBpcyBjaGFuZ2VkLg0KPiA+ID4gLSB1c2Jf
ZGlzY29ubmVjdCBpcyBjYWxsZWQsIGJ1dCBwb3J0IHBvd2VyIGlzIG9uIGFnYWluIGJ5IGtlcm5l
bCBhdCBmdW5jdGlvbg0KPiBodWJfcG9ydF9jb25uZWN0Lg0KPiA+ID4NCj4gPiA+IEkgY2FuJ3Qg
ZmluZCB0aGUgY29kZSBoaXN0b3J5IHdoeSB0aGUgcG9ydCBwb3dlciBuZWVkcyB0byB0dXJuIG9u
IGFmdGVyDQo+IGRldmljZSBpcyBkaXNjb25uZWN0ZWQsIGRvIHlvdSBrbm93IHdoeT8NCj4gPiA+
IEFueSBzdWdndWVzdGlvbnMgdG8gZml4IGl0PyBUaGFua3MuDQo+ID4NCj4gPiBTZWVtcyBpbiB0
aGlzIGNhc2UgdGhlIHBvcnQgbmVlZCBjbGFpbWVkIGJ5IHVzZXIgYXBwLCBJIGFtIHNlZWluZyB0
aGlzDQo+ID4gY29tbWl0DQo+ID4NCj4gPiBjb21taXQgZmJhZWNmZjA2YTdkYjRkZWZhODk5YTY2
NGZlMjc1OGU1MTYxYjM5ZA0KPiA+IEF1dGhvcjogRGVlcGFrIERhcyA8ZGVlcGFrZGFzLmxpbnV4
QGdtYWlsLmNvbT4NCj4gPiBEYXRlOiAgIFdlZCBKYW4gMjEgMjM6Mzk6NTggMjAxNSArMDUzMA0K
PiA+DQo+ID4gICAgIHVzYjogY29yZTogaHViOiBtb2RpZnkgaHViIHJlc2V0IGxvZ2ljIGluIGh1
YiBkcml2ZXINCj4gPg0KPiA+ICAgICBDdXJyZW50bHkgaWYgcG9ydCBwb3dlciBpcyB0dXJuZWQg
b2ZmIGJ5IHVzZXIgb24gaHViIHBvcnQNCj4gPiAgICAgdXNpbmcgVVNCREVWRlMgdGhlbiBwb3J0
IHBvd2VyIGlzIHR1cm5lZCBiYWNrIE9ODQo+ID4gICAgIGJ5IGh1YiBkcml2ZXIuDQo+ID4gICAg
IFRoaXMgY29tbWl0IG1vZGlmaWVzIGh1YiByZXNldCBsb2dpYyBpbiBodWJfcG9ydF9jb25uZWN0
KCkgdG8gcHJldmVudA0KPiA+ICAgICBodWIgZHJpdmVyIGZyb20gdHVybmluZyBiYWNrIHRoZSBw
b3J0IHBvd2VyIE9OIGlmIHBvcnQgaXMgbm90IG93bmVkDQo+ID4gICAgIGJ5IGtlcm5lbC4NCj4g
Pg0KPiA+ICAgICBTaWduZWQtb2ZmLWJ5OiBEZWVwYWsgRGFzIDxkZWVwYWtkYXMubGludXhAZ21h
aWwuY29tPg0KPiA+ICAgICBBY2tlZC1ieTogQWxhbiBTdGVybiA8c3Rlcm5Acm93bGFuZC5oYXJ2
YXJkLmVkdT4NCj4gPiAgICAgU2lnbmVkLW9mZi1ieTogR3JlZyBLcm9haC1IYXJ0bWFuIDxncmVn
a2hAbGludXhmb3VuZGF0aW9uLm9yZz4NCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3Vz
Yi9jb3JlL2h1Yi5jIGIvZHJpdmVycy91c2IvY29yZS9odWIuYyBpbmRleA0KPiA+IGI0YmZhM2Eu
LjNlOWM0ZDQgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy91c2IvY29yZS9odWIuYw0KPiA+ICsr
KyBiL2RyaXZlcnMvdXNiL2NvcmUvaHViLmMNCj4gPiBAQCAtNDY1NSw5ICs0NjU1LDEzIEBAIHN0
YXRpYyB2b2lkIGh1Yl9wb3J0X2Nvbm5lY3Qoc3RydWN0IHVzYl9odWINCj4gPiAqaHViLCBpbnQg
cG9ydDEsIHUxNiBwb3J0c3RhdHVzLA0KPiA+ICAgICAgICAgaWYgKCEocG9ydHN0YXR1cyAmIFVT
Ql9QT1JUX1NUQVRfQ09OTkVDVElPTikgfHwNCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICB0
ZXN0X2JpdChwb3J0MSwgaHViLT5yZW1vdmVkX2JpdHMpKSB7DQo+ID4NCj4gPiAtICAgICAgICAg
ICAgICAgLyogbWF5YmUgc3dpdGNoIHBvd2VyIGJhY2sgb24gKGUuZy4gcm9vdCBodWIgd2FzIHJl
c2V0KQ0KPiAqLw0KPiA+ICsgICAgICAgICAgICAgICAvKg0KPiA+ICsgICAgICAgICAgICAgICAg
KiBtYXliZSBzd2l0Y2ggcG93ZXIgYmFjayBvbiAoZS5nLiByb290IGh1YiB3YXMgcmVzZXQpDQo+
ID4gKyAgICAgICAgICAgICAgICAqIGJ1dCBvbmx5IGlmIHRoZSBwb3J0IGlzbid0IG93bmVkIGJ5
IHNvbWVvbmUgZWxzZS4NCj4gPiArICAgICAgICAgICAgICAgICovDQo+ID4gICAgICAgICAgICAg
ICAgIGlmIChodWJfaXNfcG9ydF9wb3dlcl9zd2l0Y2hhYmxlKGh1YikNCj4gPiAtICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICYmICFwb3J0X2lzX3Bvd2VyX29uKGh1YiwNCj4gcG9ydHN0
YXR1cykpDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAmJiAhcG9ydF9pc19w
b3dlcl9vbihodWIsDQo+IHBvcnRzdGF0dXMpDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAmJiAhcG9ydF9kZXYtPnBvcnRfb3duZXIpDQo+ID4gICAgICAgICAgICAgICAgICAg
ICAgICAgc2V0X3BvcnRfZmVhdHVyZShoZGV2LCBwb3J0MSwNCj4gPiBVU0JfUE9SVF9GRUFUX1BP
V0VSKTsNCj4gPg0KPiA+ICAgICAgICAgICAgICAgICBpZiAocG9ydHN0YXR1cyAmIFVTQl9QT1JU
X1NUQVRfRU5BQkxFKQ0KPiA+DQo+IA0KPiBZZXMsIEkgc2F3IHRoaXMgY29tbWl0LiBCdXQgdGhl
IHBvcnQgaXMgb3duZWQgYnkga2VybmVsLCB0aGUgZGV2aWNlIG9uIHRoZSBwb3J0DQo+IGNvdWxk
IGJlIGVudW1lcmF0ZWQgYnkga2VybmVsLCBqdXN0IHRoZSBwb3dlciBvbiB0aGUgcG9ydCBjb3Vs
ZCBiZSBjaGFuZ2VkIGJ5DQo+IHVzZXIgc3BhY2UuDQo+IA0KDQpJIGZpbmQgdGhpcyBpc3N1ZSBo
YXMgZGlzY3Vzc2VkIHRoZXJlLCBidXQgSSBjYW4ndCBvcGVuIHRoZSBVUkw6IGh0dHBzOi8vYml0
Lmx5LzJKemN6aloNCkJlbG93IHRoZSBkZXNjcmlwdGlvbiBmcm9tOiBodHRwczovL2dpdGh1Yi5j
b20vbXZwL3VodWJjdGwuDQpUaGVpciB3b3JrYXJvdW5kcyBhcmUgbm90IGdvb2QuDQoNClBvd2Vy
IGNvbWVzIGJhY2sgb24gYWZ0ZXIgZmV3IHNlY29uZHMgb24gTGludXgNCg0KU29tZSBkZXZpY2Ug
ZHJpdmVycyBpbiBrZXJuZWwgYXJlIHN1cnByaXNlZCBieSBVU0IgZGV2aWNlDQpiZWluZyB0dXJu
ZWQgb2ZmIGFuZCBhdXRvbWF0aWNhbGx5IHRyeSB0byBwb3dlciBpdCBiYWNrIG9uLg0KDQpZb3Ug
Y2FuIHVzZSBvcHRpb24gLXIgTiB3aGVyZSBOIGlzIHNvbWUgbnVtYmVyIGZyb20gMTAgdG8gMTAw
MA0KdG8gZml4IHRoaXMgLSB1aHViY3RsIHdpbGwgdHJ5IHRvIHR1cm4gcG93ZXIgb2ZmIG1hbnkg
dGltZXMgaW4gcXVpY2sNCnN1Y2Nlc3Npb24sIGFuZCBpdCBzaG91bGQgc3VwcHJlc3MgdGhhdC4g
VGhpcyBtYXkgYmUgZXZlbnR1YWxseSBmaXhlZA0KaW4ga2VybmVsLCBzZWUgbW9yZSBkaXNjdXNz
aW9uIGhlcmUuDQoNCkRpc2FibGluZyBVU0IgYXV0aG9yaXphdGlvbiBmb3IgZGV2aWNlIGluIHF1
ZXN0aW9uIGJlZm9yZQ0KdHVybmluZyBwb3dlciBvZmYgd2l0aCB1aHViY3RsIHNob3VsZCBoZWxw
Og0KDQplY2hvIDAgPiBzdWRvIHRlZSAvc3lzL2J1cy91c2IvZGV2aWNlcy8ke2xvY2F0aW9ufS4k
e3BvcnR9L2F1dGhvcml6ZWQNCklmIHlvdXIgZGV2aWNlIGlzIFVTQiBtYXNzIHN0b3JhZ2UsIGlu
dm9raW5nIHVkaXNrc2N0bCBiZWZvcmUgY2FsbGluZyB1aHViY3RsDQpzaG91bGQgaGVscCB0b286
DQoNCnN1ZG8gdWRpc2tzY3RsIHBvd2VyLW9mZiAtLWJsb2NrLWRldmljZSAvZGV2L2Rpc2svLi4u
YA0Kc3VkbyB1aHViY3RsIC1hIG9mZiAuLi4NCiANClBldGVyDQo=
