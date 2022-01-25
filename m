Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2B7A049ABD1
	for <lists+linux-usb@lfdr.de>; Tue, 25 Jan 2022 06:39:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235111AbiAYFjF (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 25 Jan 2022 00:39:05 -0500
Received: from mail-dm6nam11on2080.outbound.protection.outlook.com ([40.107.223.80]:51712
        "EHLO NAM11-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S234809AbiAYFg6 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 25 Jan 2022 00:36:58 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b6P2fpnjfIfsMH0S1nh5Qw8GVBcmYWML3vWbJKM/yh/YI0UQQ+VSFszOxUCKC1WvYJIHaDz1Iqv94f5PSCSvZW46/L6OpYAJ0RJ3dD0oDB+jlujH1qWTs35Nv7VAeEm0jaoYoVLPo2RgzGdDg/PvOF8VGuvtfXCwJh4ZFWYWJQ1kgncSkO4Uod5LNtFjuiashwylJ6rSNootoKVtTWuwk9c44LK2ak9GEab5Ud572lnM2jXYXvutopn7+337JyqYB3kG09ITUxPJJL+0fma1nck1d7jQrwokcWBik3Wh8DteFe6g56UMitNDJwdJVpUkMT7JZNvjyhc5Q62QtiNo/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RagKTdzH8+vnsnIH3peRbwEB5M0qGedYObJbRkmpP+M=;
 b=LIweKutX4nnC5WqvyfLx+EQJ9FQKGPRk2ecG/Usitfq78CDMdhI4oDq17W1FVTzxfLI95lsyCt/0Yxjnw9texVJyeb18MYIyAkVP2t+FqhXSt0qQC4XJaLIyrbTnA5IoRYGIFSfd7hcsdA6YQDgQQveLNy0NH2TvRnxbt+Q+v0FtuDZdXk99wuwyyrnHfuVzXSF0+07NplAPFBZzc4HDhUvGJQbVwigEcweqvtYewhJ0ZgxbpC+UCcFc1aDWlqeC1aqHgjf6/UwaXeliQ86VjACF8TY4iIBqJolOpWfBFUMKqYLAKq+9MTL+Eo9N22SGd2a0pqsp+aSbV8E5iT8mZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RagKTdzH8+vnsnIH3peRbwEB5M0qGedYObJbRkmpP+M=;
 b=HdbgSeEExeA1/E5d3uj2oHZsG9CRdHG3wzWF2JmegBXb5fxxSYMP+VLhNvhkN3u98VsnlX/AMDpaCCxeJnPPA+yxQw6DkdslAo+uAfbKBocjQSABvEkAP4h4GwtvOdoQmXP6NF2ZkrAKO0JwqClY3fNlfbcwjnIvLo3XGZRCLFw=
Received: from DM6PR02MB4235.namprd02.prod.outlook.com (2603:10b6:5:a0::24) by
 BN6PR02MB3300.namprd02.prod.outlook.com (2603:10b6:405:63::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4909.10; Tue, 25 Jan 2022 05:36:47 +0000
Received: from DM6PR02MB4235.namprd02.prod.outlook.com
 ([fe80::c9d1:b3bb:8a64:899d]) by DM6PR02MB4235.namprd02.prod.outlook.com
 ([fe80::c9d1:b3bb:8a64:899d%4]) with mapi id 15.20.4909.017; Tue, 25 Jan 2022
 05:36:47 +0000
From:   Manish Narani <MNARANI@xilinx.com>
To:     Robert Hancock <robert.hancock@calian.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
CC:     Michal Simek <michals@xilinx.com>,
        "sean.anderson@seco.com" <sean.anderson@seco.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "balbi@kernel.org" <balbi@kernel.org>
Subject: RE: [PATCH v6 1/2] usb: dwc3: xilinx: Fix PIPE clock selection for
 USB2.0 mode
Thread-Topic: [PATCH v6 1/2] usb: dwc3: xilinx: Fix PIPE clock selection for
 USB2.0 mode
Thread-Index: AQHYDvNjAmjuHbEM50maPkpIkWficqxxs3mggADX/ACAAK3hwA==
Date:   Tue, 25 Jan 2022 05:36:47 +0000
Message-ID: <DM6PR02MB4235FCE338017DB774213BF3C15F9@DM6PR02MB4235.namprd02.prod.outlook.com>
References: <20220121181841.2331225-1-robert.hancock@calian.com>
         <20220121181841.2331225-2-robert.hancock@calian.com>
         <DM6PR02MB42352135D31E17ED63A95D64C15E9@DM6PR02MB4235.namprd02.prod.outlook.com>
 <cb7fc7b898f9468a416fb4e23104bb21006ef1cf.camel@calian.com>
In-Reply-To: <cb7fc7b898f9468a416fb4e23104bb21006ef1cf.camel@calian.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=xilinx.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 22996ad3-c84d-465d-2eca-08d9dfc4addb
x-ms-traffictypediagnostic: BN6PR02MB3300:EE_
x-microsoft-antispam-prvs: <BN6PR02MB33001517F4E2BF6209855BC4C15F9@BN6PR02MB3300.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: xR7VuzDMuV4KHBlwxmv+5efNH+IzsW/Oh5WTDyLbpI/uT2pCFwhcu/ffZgbCTJIyGAP2EG5HWbdF+qggRQSddMf2aeKUr+e3zOhUPujRDgEEBUgctx96J3h6Okcc1kXiHYQ6HvAf6bUuf4vHyINVBE7yFTd0+1uJ+tl+x5ZZZrrmlyDgJKQoU4kbIypl0UUBKIyO6gjRfOgRwmTatu1rFlm7mG9jsR92w7XXBQo3r5rjlt0EhYLrbu2CT468wu4zG22SrWRVtlFoQL1iscM0YHx7KXLdA0RPewpk6No1lO9Rk4GPGtqMaZjr+9Rcpkf/IYqlLYJ3d5CErQZtEZ90i7IrxKlsHUA7xw6moQvtg3sSD1J1row+WpxHirarx9FAgvl45UfuuVPS93hSPMPMkLZg9jBRYPjlVkPfZO3DlgrXjQNNJkZncxLdppr4YzA2Ku6KEIOb3BNjvNGdU7cVokAXlbsTudwA+8Lo93tFN6mGj+lystLaT8cNE0mLYbdzHw9HzWZom8tUM8AHtnavCB6A3hyvWE1IP4MZF8zEl8v7OPyF2CrJr6WQY7eQPeX29B1jm50kFJTg1z2QC9ngS1ow6cvRwZIkDHuiZExBoPh/kG16dH3vhtr+o1e68J+iBcKdbd4y+k1DNp42pl/eUN1aoe0w9alU3UCq/IJX2FpKFXQ7W/3VK+Dn8jXS2ba7IImB9lKc3fpTSxFN0u6lnA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR02MB4235.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(71200400001)(508600001)(66476007)(66556008)(83380400001)(52536014)(186003)(66946007)(55016003)(4326008)(38070700005)(26005)(76116006)(6506007)(5660300002)(53546011)(44832011)(316002)(33656002)(8936002)(110136005)(38100700002)(2906002)(64756008)(122000001)(66446008)(9686003)(54906003)(8676002)(7696005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aDJkRFExZDBhWjJiU3JIbnRpemgzTXZZNS9CeFlsYlMwMEtVSVZQYjVsQnhL?=
 =?utf-8?B?OURMR2FuUUd6Q0VUVm5wQ010YXBzK1IyQmcrdVg2VE16MElpb1VGcUh0RExV?=
 =?utf-8?B?UlpMckdiam9vQjFKbjVuVldCdHllMlBGRCs4bWlWcVgzUGxpL05ETlpkVnhm?=
 =?utf-8?B?MkJ5Z2dQL25ORlVJRnRIcU5Bc1ZTNmYvUGlPSmhxY2tneitDK0VCSFp5VVBw?=
 =?utf-8?B?REJZS0JNZTQxd2ZyaTNuM1RhR2lPdTZHbWdQRk0xdCtINkllVGYyOFVsUElq?=
 =?utf-8?B?dXFmZlJ1WmlMNjBsdE9wUkl0M09NL2pZUm5ES2dxVmgyYU9GNXcxblBlNEVU?=
 =?utf-8?B?UFZRWm9JZkw3T2VNMm9lTXByRytpWDdFdW90VmxnbW84ZnFRZngxREZXSWJh?=
 =?utf-8?B?R2ppMTFBeUZuUmhsdnp6cklFM0NSWDZveDBIclZERS9PZk5raUxrZUVVZTNC?=
 =?utf-8?B?bEdFSXUxU1FNNTRpS3Q4dHJKdEIxY1AwbjlqVGowMHppOTY0WXQyZ3V4WFAv?=
 =?utf-8?B?dkhwbUV2YTF2QkgxYXZPQTRMWmFnd1Z0WnBGdlZyMm0vTXI1ZGkrYVhJVXhu?=
 =?utf-8?B?Qm5ybWVHTUk2N2JlUDNqbWZpazVJeHpVVnZ3dkt0eUI0a0VGMXJtRG4zZVll?=
 =?utf-8?B?VFZ5SzJlanBtTy9lTllMK2d5empnY3BOSEJFeDRoWDFpdTJXMTVPaFFLRXdR?=
 =?utf-8?B?Rk41U2Z3NjM5aTVZemFFY3l2bHN5S1lTQXA0QW1xcjZCSTZjY2tBZmRzRnB5?=
 =?utf-8?B?ektJS2lkUUVIdWFlZXVwYmFQd2Z3VmREQ2hTM0pRa3FBQlRYVnlqcjZNcm0v?=
 =?utf-8?B?eHZpM0pqelVDTkViaE0yVkFGL1dibnViYjdxY2lHTURDMkh1NmhTdG0xb0Rx?=
 =?utf-8?B?R0YrMytJbFFNL3lENWp6enkyWE1vcGQ3eXA0R0lpWlF3NHFNalh5aFVIb3lh?=
 =?utf-8?B?RjhyNjRHNUdqUnRzR2E0VnJOblhUaHBUQmpZSjdpMFdRM2YxYkI1RFZNMDlD?=
 =?utf-8?B?Q0VTUHR2dzdpNmhWWEg5aStvSVU5cjJVY09MRm9la1pCcTFvN0FNWnpRSWpB?=
 =?utf-8?B?UndWRXVzSU5mZzUvdS9rczdVRWdGUDJjMENqQnhuaWNUVHdMYVM0Zmk1cGhi?=
 =?utf-8?B?alRzK3pXVnovV1VGTGV4eENQbm0yQThkdXkza2FaVTdSTFhMa2JJSlQ4ZXUz?=
 =?utf-8?B?NjZEWWM2OGN3Mlg5YkpIWWF6cFJmLzZVOEgvbDkxcUFjUi9OeVVtd290SmN2?=
 =?utf-8?B?eDVQeFVGSVNDNk9oUGhJQ2t2NTF4NVdhcDREbzhrUU1iZHZPcHYwRGJQMkpa?=
 =?utf-8?B?MjdVZ0VHUHczY1FIcWszN0k5elBOVHkzV1VHd1RvQ292UkFIMm1OaXdMMFRr?=
 =?utf-8?B?MG5FL0dKQTQ3ajN0M1A2SCtycU9kWVp3R09KazY2WEdOSFNvc0FiQmRTaVM1?=
 =?utf-8?B?alIydmk3SzhaOHlySFJNN2lkMTJuZ3pmblVXQmJQd0hQWUFSRmFXdmE2RE5B?=
 =?utf-8?B?cmhVV2tGNTdsSzVwLzdYUHV1V0JmR2Q5eEg5RmY5YVp3WVdGSTg3VUNkWEIr?=
 =?utf-8?B?TmxxcTlCckkvZzdCclJtS0szY0UwTldiaS9rR0Q3NG9tVVVvandxZFBsMEpx?=
 =?utf-8?B?SDFDN1BUTldaZkFKek8yTHN1M0FYa3IySTNreWRYbHdPRHoxUzZiazB2NWQ0?=
 =?utf-8?B?N0c5blNtREdhOG9iQ2gvR2c4Wlo1WTgwemNVL0J1UEYrZTRTTTNpWm5UcXRu?=
 =?utf-8?B?RmhtQkt3cFNpazdhV2dSY1ExTGlBaUx5NWxJUE93WkZrZEJIYStKbGZXOUJZ?=
 =?utf-8?B?TENZQU95MGc5OWp4ZURuaEFxWThyQThWM3ZKcERzRVhVYThhbmFoaGUxUzNH?=
 =?utf-8?B?WVozNmthSXBrU25aUVpocklBR3dpQ1V3aFVtcXFPaTdhbWQ4d0kvRC91bm5x?=
 =?utf-8?B?RG5jLzl3SzZuSzFlMmRvY20vVkl1anRMdWQwNUdFMXRvOHRrdFRSUlJDblZB?=
 =?utf-8?B?SHNrRHF5QXNnVlM4SFdVMEt1b0QrUi9leVNYdklyc2tjVmk3dWQzdjcweDlh?=
 =?utf-8?B?aWtKUXRQTVA2eHZlRFVZS0Zva0VsaXJ5MWN0WENzUCtEWnh1MkthTWY0K1NN?=
 =?utf-8?B?RlhlQ2tPZ1RyN2txSXYwc1VjbUR3THNLTWNLRFpoaUVQRFpSZXdvZEFORHVk?=
 =?utf-8?Q?Kj3cQcvv7/3Jy0IVN1L+IgI=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR02MB4235.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 22996ad3-c84d-465d-2eca-08d9dfc4addb
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jan 2022 05:36:47.2261
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Zf8X+Bisv0wW7o+SjaIM48uK6nZUiOIP0jA9q0dQvk1JX/6y2ATC6A/L+biEh/5CyPHiEbg3E/8b73paA1iFLw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR02MB3300
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

SGkgUm9iZXJ0LA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IFJvYmVy
dCBIYW5jb2NrIDxyb2JlcnQuaGFuY29ja0BjYWxpYW4uY29tPg0KPiBTZW50OiBUdWVzZGF5LCBK
YW51YXJ5IDI1LCAyMDIyIDEyOjMxIEFNDQo+IFRvOiBNYW5pc2ggTmFyYW5pIDxNTkFSQU5JQHhp
bGlueC5jb20+OyBsaW51eC11c2JAdmdlci5rZXJuZWwub3JnDQo+IENjOiBNaWNoYWwgU2ltZWsg
PG1pY2hhbHNAeGlsaW54LmNvbT47IHNlYW4uYW5kZXJzb25Ac2Vjby5jb207DQo+IGdyZWdraEBs
aW51eGZvdW5kYXRpb24ub3JnOyBiYWxiaUBrZXJuZWwub3JnDQo+IFN1YmplY3Q6IFJlOiBbUEFU
Q0ggdjYgMS8yXSB1c2I6IGR3YzM6IHhpbGlueDogRml4IFBJUEUgY2xvY2sgc2VsZWN0aW9uIGZv
cg0KPiBVU0IyLjAgbW9kZQ0KPiANCj4gT24gTW9uLCAyMDIyLTAxLTI0IGF0IDA2OjU1ICswMDAw
LCBNYW5pc2ggTmFyYW5pIHdyb3RlOg0KPiA+IEhpIFJvYmVydCwNCj4gPg0KPiA+IFRoYW5rcyBm
b3IgdGhlIHBhdGNoISBQbGVhc2Ugc2VlIG15IGNvbW1lbnRzIGJlbG93IGlubGluZSENCj4gPg0K
PiA+ID4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPiA+IEZyb206IFJvYmVydCBIYW5j
b2NrIDxyb2JlcnQuaGFuY29ja0BjYWxpYW4uY29tPg0KPiA+ID4gU2VudDogRnJpZGF5LCBKYW51
YXJ5IDIxLCAyMDIyIDExOjQ5IFBNDQo+ID4gPiBUbzogbGludXgtdXNiQHZnZXIua2VybmVsLm9y
Zw0KPiA+ID4gQ2M6IGJhbGJpQGtlcm5lbC5vcmc7IGdyZWdraEBsaW51eGZvdW5kYXRpb24ub3Jn
OyBNaWNoYWwgU2ltZWsNCj4gPiA+IDxtaWNoYWxzQHhpbGlueC5jb20+OyBNYW5pc2ggTmFyYW5p
IDxNTkFSQU5JQHhpbGlueC5jb20+Ow0KPiA+ID4gc2Vhbi5hbmRlcnNvbkBzZWNvLmNvbTsgUm9i
ZXJ0IEhhbmNvY2sNCj4gPHJvYmVydC5oYW5jb2NrQGNhbGlhbi5jb20+DQo+ID4gPiBTdWJqZWN0
OiBbUEFUQ0ggdjYgMS8yXSB1c2I6IGR3YzM6IHhpbGlueDogRml4IFBJUEUgY2xvY2sgc2VsZWN0
aW9uIGZvcg0KPiA+ID4gVVNCMi4wDQo+ID4gPiBtb2RlDQo+ID4gPg0KPiA+ID4gSXQgYXBwZWFy
cyB0aGF0IHRoZSBQSVBFIGNsb2NrIHNob3VsZCBub3QgYmUgc2VsZWN0ZWQgd2hlbiBvbmx5IFVT
QiAyLjANCj4gPiA+IGlzIGJlaW5nIHVzZWQgaW4gdGhlIGRlc2lnbiBhbmQgbm8gVVNCIDMuMCBy
ZWZlcmVuY2UgY2xvY2sgaXMgdXNlZC4gRml4DQo+ID4gPiB0byBzZXQgdGhlIGNvcnJlY3QgdmFs
dWUgZGVwZW5kaW5nIG9uIHdoZXRoZXIgYSBVU0IzIFBIWSBpcyBwcmVzZW50Lg0KPiA+ID4NCj4g
PiA+IEZpeGVzOiA4NDc3MGYwMjhmYWIgKCJ1c2I6IGR3YzM6IEFkZCBkcml2ZXIgZm9yIFhpbGlu
eCBwbGF0Zm9ybXMiKQ0KPiA+ID4gU2lnbmVkLW9mZi1ieTogUm9iZXJ0IEhhbmNvY2sgPHJvYmVy
dC5oYW5jb2NrQGNhbGlhbi5jb20+DQo+ID4gPiAtLS0NCj4gPiA+ICBkcml2ZXJzL3VzYi9kd2Mz
L2R3YzMteGlsaW54LmMgfCA4ICsrKysrKy0tDQo+ID4gPiAgMSBmaWxlIGNoYW5nZWQsIDYgaW5z
ZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkNCj4gPiA+DQo+ID4gPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy91c2IvZHdjMy9kd2MzLXhpbGlueC5jIGIvZHJpdmVycy91c2IvZHdjMy9kd2MzLQ0KPiA+
ID4geGlsaW54LmMNCj4gPiA+IGluZGV4IDljYzNhZDcwMWEyOS4uZGQ2MjE4ZDA1MTU5IDEwMDY0
NA0KPiA+ID4gLS0tIGEvZHJpdmVycy91c2IvZHdjMy9kd2MzLXhpbGlueC5jDQo+ID4gPiArKysg
Yi9kcml2ZXJzL3VzYi9kd2MzL2R3YzMteGlsaW54LmMNCj4gPiA+IEBAIC0xNjcsOCArMTY3LDEy
IEBAIHN0YXRpYyBpbnQgZHdjM194bG54X2luaXRfenlucW1wKHN0cnVjdA0KPiBkd2MzX3hsbngN
Cj4gPiA+ICpwcml2X2RhdGEpDQo+ID4gPiAgCS8qIFNldCBQSVBFIFBvd2VyIFByZXNlbnQgc2ln
bmFsIGluIEZQRCBQb3dlciBQcmVzZW50IFJlZ2lzdGVyKi8NCj4gPiA+ICAJd3JpdGVsKEZQRF9Q
T1dFUl9QUlNOVF9PUFRJT04sIHByaXZfZGF0YS0+cmVncyArDQo+ID4gPiBYTE5YX1VTQl9GUERf
UE9XRVJfUFJTTlQpOw0KPiA+ID4NCj4gPiA+IC0JLyogU2V0IHRoZSBQSVBFIENsb2NrIFNlbGVj
dCBiaXQgaW4gRlBEIFBJUEUgQ2xvY2sgcmVnaXN0ZXIgKi8NCj4gPiA+IC0Jd3JpdGVsKFBJUEVf
Q0xLX1NFTEVDVCwgcHJpdl9kYXRhLT5yZWdzICsNCj4gPiA+IFhMTlhfVVNCX0ZQRF9QSVBFX0NM
Syk7DQo+ID4gPiArCS8qDQo+ID4gPiArCSAqIFNldCB0aGUgUElQRSBDbG9jayBTZWxlY3QgYml0
IGluIEZQRCBQSVBFIENsb2NrIHJlZ2lzdGVyIGlmIGEgVVNCMw0KPiA+ID4gKwkgKiBQSFkgaXMg
aW4gdXNlLCBkZXNlbGVjdCBvdGhlcndpc2UNCj4gPiA+ICsJICovDQo+ID4gPiArCXdyaXRlbCh1
c2IzX3BoeSA/IFBJUEVfQ0xLX1NFTEVDVCA6IFBJUEVfQ0xLX0RFU0VMRUNULA0KPiA+ID4gKwkg
ICAgICAgcHJpdl9kYXRhLT5yZWdzICsgWExOWF9VU0JfRlBEX1BJUEVfQ0xLKTsNCj4gPg0KPiA+
IFdoZW4gVVNCMy4wIGlzIGVuYWJsZWQgaW4gdGhlIGRlc2lnbiwgRlNCTCB3aWxsIHNldCB0aGlz
IGJpdCB0bw0KPiA+IFBJUEVfQ0xLX1NFTEVDVA0KPiA+IEFuZCBpdCdzIHN0YXRlIHdpbGwgYmUg
cGVyc2lzdGVudCB0aWxsIExpbnV4IHN0YWdlLiBXaGVuIHRoaXMgZHJpdmVyIGZpbmRzDQo+ID4g
dGhlIHVzYjMtcGh5IHByb3BlcnR5DQo+ID4gSW4gdGhlIGRldmljZSB0cmVlLCBpdCB3aWxsIGFn
YWluIHNldCB0aGlzIGJpdC4NCj4gPiBCdXQgaW4gY2FzZSBpZiB0aGUgdXNiMy1waHkgaXMgbm90
IHByZXNlbnQgaW4gdGhlIGRldmljZSB0cmVlIGFuZCBkZXNpZ24gaGFzDQo+ID4gVVNCMy4wIGVu
YWJsZWQsIHRoZW4gdGhpcyB3aWxsIGNsZWFyIHRoaXMgYml0IGFuZCB1bHRpbWF0ZWx5IGl0IHdp
bGwgZmFpbC4NCj4gPg0KPiA+IEl0IHdpbGwgYmUgYmV0dGVyIHRvIHNraXAgdG91Y2hpbmcgdGhh
dCBiaXQgaW4gY2FzZSB0aGUgZGV2aWNlIHRyZWUgZG9lcyBub3QNCj4gPiBoYXZlIHRoZSB1c2Iz
LXBoeSBwcm9wZXJ0eS4NCj4gPiBUaGlzIHdpbGwgc2tpcCB0aGUgd2hvbGUgc2VxdWVuY2Ugb2Yg
UEhZIGluaXRpYWxpemF0aW9uIChyZXNldA0KPiA+IGFzc2VydC9kZWFzc2VydCBhcmUgZG9uZSBp
biBvcmRlciB0byBoZWxwIGluaXRpYWxpemUgUEhZKS4NCj4gPiBTb21ldGhpbmcgbGlrZSBiZWxv
dyBzaG91bGQgd29yay4NCj4gDQo+IFNvIHRoZSBvcmlnaW5hbCBwYXRjaCB3YXMgdGVzdGVkIGFn
YWluc3QgaGFyZHdhcmUgdGhhdCBvbmx5IGhhZCBVU0IgMi4wDQo+IHN1cHBvcnQNCj4gYW5kIHNl
ZW1lZCB0byB3b3JrIGZpbmUuIEhvd2V2ZXIsIHdlJ3ZlIHNpbmNlIGZvdW5kIGFuIGlzc3VlIHdp
dGggc29tZQ0KPiBvdGhlcg0KPiBoYXJkd2FyZSBzdXBwb3J0aW5nIFVTQiAzLjAgd2hlcmUgZWl0
aGVyIGl0IGRvZXNuJ3QgZGV0ZWN0IGRldmljZXMgYXQgYWxsLCBvcg0KPiB0aGV5IGdldCBkZXRl
Y3RlZCBidXQgdGhlbiBzZWVtIHRvIGRyb3Agb2ZmIHRoZSBidXMgdmVyeSBxdWlja2x5LCBhbmQg
d2UgZ2V0DQo+IHRoaXMgcmVwZWF0ZWRseToNCj4gDQo+IFsgICA5OS44NTg2MDddIHVzYiB1c2Iy
LXBvcnQxOiBDYW5ub3QgZW5hYmxlLiBNYXliZSB0aGUgVVNCIGNhYmxlIGlzIGJhZD8NCj4gDQo+
IFRoZSBzYW1lIHByb2JsZW0gaXMgcmVwcm9kdWNpYmxlIG9uIHRoZSBYaWxpbnggWkNVMTAyIGJv
YXJkIHdpdGggdGhlIHNhbWUNCj4ga2VybmVsIGJ1aWxkLCB3aGVyZSB0aGUgVVNCIHdvcmtzIGZp
bmUgd2l0aCB0aGUgWGlsaW54IGtlcm5lbCBhbmQgYSBQZXRhbGludXgNCj4gMjAyMS4yIHByZS1i
dWlsdCBaQ1UxMDIgaW1hZ2UsIHNvIGl0J3Mgbm8gaGFyZHdhcmUgaXNzdWUuDQo+IA0KPiBJJ3Zl
IGJlZW4gdHJ5aW5nIHRvIGlzb2xhdGUgYW55IHJlbGV2YW50IGRpZmZlcmVuY2VzIGJldHdlZW4g
dGhlIFhpbGlueCBrZXJuZWwNCj4gYW5kIG1haW5saW5lIGluIHRoaXMgcmVzcGVjdCBidXQgaGF2
ZW4ndCBoYWQgbXVjaCBzdWNjZXNzLiBPbmUgZGlmZmVyZW5jZSBpbg0KPiB0aGlzIHBhcnRpY3Vs
YXIgZHdjMy14aWxpbnggY29kZSBpcyB0aGF0IHRoZSBYaWxpbngga2VybmVsIGhhcyBjb2RlIHRv
IHJlc2V0DQo+IHRoZSBVTFBJIFBIWSB3aGljaCBpcyBub3QgaW4gdGhlIG1haW5saW5lIHZlcnNp
b24geWV0LiBIb3dldmVyLCBhZGRpbmcgdGhhdA0KPiBpbg0KPiBkb2Vzbid0IHNlZW0gdG8gZml4
IHRoZSBwcm9ibGVtLg0KPiANCj4gSGF2ZSB5b3UgKG9yIGFueW9uZSBlbHNlIG9uIHRoZSBDQyBs
aXN0KSBkb25lIGFueSB0ZXN0aW5nIG9mIFVTQiAzLjAgZGV2aWNlcw0KPiBhbmQgVVNCIDMuMCBj
YXBhYmxlIGhhcmR3YXJlIG9uIG1haW5saW5lIHdpdGggWnlucU1QIHRvIGtub3cgaWYgdGhpcyBp
cyBhDQo+IG1vcmUNCj4gZ2VuZXJhbCBpc3N1ZT8NCg0KWWVzLCBUaGUgVVNCIGZpeGVzIGFyZSB3
b3JrIGluIHByb2dyZXNzIGFuZCB3aWxsIGJlIHNlbnQgdG8gbWFpbmxpbmUgaW4gbmVhciBmdXR1
cmUuDQpUaGlzIGZpeCBpcyBvbmUgb2YgdGhlbS4gWW91ciBwYXRjaCBpcyBzb2x2aW5nIHRoZSBw
cm9ibGVtIGluIGNhc2Ugb2YgVVNCIDIuMCANCkJ1dCBub3QgdGhlIFVTQiAzLjAgZW50aXJlbHku
IFRoZXJlIGlzIHRoaXMgY29ybmVyIGNhc2Ugd2hpY2ggSSBtZW50aW9uZWQsIGJyZWFrcw0KVVNC
IDMuMCBmdW5jdGlvbmFsaXR5IHdpdGggeW91ciBwYXRjaC4NCg0KVGhhbmtzLA0KTWFuaXNoDQoN
Cj4gDQo+ID4gLS0tDQo+ID4gICAgICAgICBpbnQgICAgICAgICAgICAgICAgICAgICByZXQ7DQo+
ID4gICAgICAgICB1MzIgICAgICAgICAgICAgICAgICAgICByZWc7DQo+ID4NCj4gPiAtICAgICAg
IHVzYjNfcGh5ID0gZGV2bV9waHlfZ2V0KGRldiwgInVzYjMtcGh5Iik7DQo+ID4gLSAgICAgICBp
ZiAoUFRSX0VSUih1c2IzX3BoeSkgPT0gLUVQUk9CRV9ERUZFUikgew0KPiA+IC0gICAgICAgICAg
ICAgICByZXQgPSAtRVBST0JFX0RFRkVSOw0KPiA+ICsgICAgICAgdXNiM19waHkgPSBkZXZtX3Bo
eV9vcHRpb25hbF9nZXQoZGV2LCAidXNiMy1waHkiKTsNCj4gPiArICAgICAgIGlmIChJU19FUlIo
dXNiM19waHkpKSB7DQo+ID4gKyAgICAgICAgICAgICAgIHJldCA9IFBUUl9FUlIodXNiM19waHkp
Ow0KPiA+ICsgICAgICAgICAgICAgICBkZXZfZXJyX3Byb2JlKGRldiwgcmV0LCAiZmFpbGVkIHRv
IGdldCBVU0IzIFBIWVxuIik7DQo+ID4gICAgICAgICAgICAgICAgIGdvdG8gZXJyOw0KPiA+IC0g
ICAgICAgfSBlbHNlIGlmIChJU19FUlIodXNiM19waHkpKSB7DQo+ID4gLSAgICAgICAgICAgICAg
IHVzYjNfcGh5ID0gTlVMTDsNCj4gPiAgICAgICAgIH0NCj4gPg0KPiA+ICsgICAgICAgaWYgKCF1
c2IzX3BoeSkNCj4gPiArICAgICAgICAgICAgICAgZ290byBza2lwX3VzYjNfcGh5Ow0KPiA+ICsN
Cj4gPiAgICAgICAgIGNyc3QgPSBkZXZtX3Jlc2V0X2NvbnRyb2xfZ2V0X2V4Y2x1c2l2ZShkZXYs
ICJ1c2JfY3JzdCIpOw0KPiA+ICAgICAgICAgaWYgKElTX0VSUihjcnN0KSkgew0KPiA+ICAgICAg
ICAgICAgICAgICByZXQgPSBQVFJfRVJSKGNyc3QpOw0KPiA+IEBAIC0xODgsNiArMTkwLDcgQEAg
c3RhdGljIGludCBkd2MzX3hsbnhfaW5pdF96eW5xbXAoc3RydWN0IGR3YzNfeGxueA0KPiA+ICpw
cml2X2RhdGEpDQo+ID4gICAgICAgICAgICAgICAgIGdvdG8gZXJyOw0KPiA+ICAgICAgICAgfQ0K
PiA+DQo+ID4gK3NraXBfdXNiM19waHk6DQo+ID4gICAgICAgICAvKg0KPiA+ICAgICAgICAgICog
VGhpcyByb3V0ZXMgdGhlIFVTQiBETUEgdHJhZmZpYyB0byBnbyB0aHJvdWdoIEZQRCBwYXRoIGlu
c3RlYWQNCj4gPiAgICAgICAgICAqIG9mIHJlYWNoaW5nIEREUiBkaXJlY3RseS4gVGhpcyB0cmFm
ZmljIHJvdXRpbmcgaXMgbmVlZGVkIHRvDQo+ID4gLS0tDQo+ID4NCj4gPiBUaGFua3MsDQo+ID4g
TWFuaXNoDQo=
