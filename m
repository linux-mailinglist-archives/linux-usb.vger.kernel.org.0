Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6263F30D424
	for <lists+linux-usb@lfdr.de>; Wed,  3 Feb 2021 08:43:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231956AbhBCHlR (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 3 Feb 2021 02:41:17 -0500
Received: from mail-dm6nam12on2059.outbound.protection.outlook.com ([40.107.243.59]:49760
        "EHLO NAM12-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231560AbhBCHlO (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 3 Feb 2021 02:41:14 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kioCTVURbNcx1BdFO0QD2HfDy7GF8rozixLpj9v6ZivDxyHGzllsUaRWrQgZMDZ0V/8WX4wZRO9SdKOUOdpP0qIJJdmBgwcyazkXNbG64vE9mbw97QxkMH5KMJ5EoYcrl2R9wgzPWxDNqKCkOawOeFF/J7jRwV0Qab9OdqEXQBSPfnj0EWd44mzPYOFFo8CMcifY8yT1BX1QkhseXTuOsb8Yxz1qGNkaGvHJLUKzvMM1AWbQgEXO/Knv/hhGLfAbf9JeORqgm6+6lvktzlaPjOW0os/U5KQ8ckFCt16Dz0kKFAsXWV7O+/yqSNbfC2DYRDGLQ/RF5rrhPgvxAuVohg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9ZqpnDCVKsq86hXS3hTeOMsNDxPDRuToe8DHzodjAxQ=;
 b=mWCVNE+qepJKxDspUhVIqDJ+oT0GKUst9rfUl6UPmWnHG+/jWq1k4o5Bx1nGxxFTPsBdb7ewe4tS9Tf8BjgQyWuc89PYHcl+ZpsZbqqw2hDXbapxljUkf8r8XXsNEPWyq0k4Zx/yu2gVSYKA0XNmKQ+Y1DmfanIsL5f8wOfUaW+DORA83253MI/2c/wog/UNJev0X0wcMvbC1Al0qU8H08jzHNrd41r6HK8DJhUhYrI3bH9OM2HG+AsIuuFaxqRXbwVFfun8MaweHmsMyexgLjNxm/MpkdSmI5e3Z/aSV9TiXSf2WbAHON97vjQG4mvfuGOH6xElEdbwIpXX3mqMRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9ZqpnDCVKsq86hXS3hTeOMsNDxPDRuToe8DHzodjAxQ=;
 b=dq+mEKCfd3e0UC8sAJp/xfrFuKrWzkA/IGx5RUJzZkEsBVxR0OHTQ9sSA9YSeEiIWKF1rHYWhy9ymSdKcuAwe7L922qwbkaXkooqduK+wpGO9XTgvjZcBfSPqX5dX27kA+nbvl0zepVFjx5tBWTdITECwAZ+pmUM+B5gUFj6/LE=
Received: from BYAPR12MB3238.namprd12.prod.outlook.com (2603:10b6:a03:13b::20)
 by BY5PR12MB4997.namprd12.prod.outlook.com (2603:10b6:a03:1d6::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.17; Wed, 3 Feb
 2021 07:40:20 +0000
Received: from BYAPR12MB3238.namprd12.prod.outlook.com
 ([fe80::6daf:7d00:b03b:8a16]) by BYAPR12MB3238.namprd12.prod.outlook.com
 ([fe80::6daf:7d00:b03b:8a16%4]) with mapi id 15.20.3805.024; Wed, 3 Feb 2021
 07:40:20 +0000
From:   "Liang, Prike" <Prike.Liang@amd.com>
To:     Mathias Nyman <mathias.nyman@linux.intel.com>,
        Greg KH <greg@kroah.com>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "mathias.nyman@intel.com" <mathias.nyman@intel.com>,
        "Akkenepalli, Ramakanth" <Ramakanth.Akkenepalli@amd.com>,
        "S-k, Shyam-sundar" <Shyam-sundar.S-k@amd.com>
Subject: RE: [PATCH] usb: pci-quirks: add XHCI_COMP_MODE_QUIRK for disabling
 amd xhci D3cold
Thread-Topic: [PATCH] usb: pci-quirks: add XHCI_COMP_MODE_QUIRK for disabling
 amd xhci D3cold
Thread-Index: AQHW7gVV3ApciWvP60+Oe5Ez24fdsao7ZFWAgAADIgCAB/w5gIABlG+AgADZ+YA=
Date:   Wed, 3 Feb 2021 07:40:20 +0000
Message-ID: <BYAPR12MB3238310D22EFAC4D831E19D2FBB49@BYAPR12MB3238.namprd12.prod.outlook.com>
References: <1611020924-17178-1-git-send-email-Prike.Liang@amd.com>
 <YBFPdf6Mc0ZgPsuy@kroah.com> <YBFSFhgk+O40GYhO@kroah.com>
 <BYAPR12MB3238626A32C6E62DA008B72CFBB69@BYAPR12MB3238.namprd12.prod.outlook.com>
 <39a54be4-dc68-8385-bb65-9c7619e16cf6@linux.intel.com>
In-Reply-To: <39a54be4-dc68-8385-bb65-9c7619e16cf6@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_ActionId=1a2e9ade-d823-4363-93fb-30db115d4f9c;MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_ContentBits=0;MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_Enabled=true;MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_Method=Privileged;MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_Name=Public_0;MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_SetDate=2021-02-03T02:49:31Z;MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none header.from=amd.com;
x-originating-ip: [139.227.235.92]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: cf4f3171-c408-440f-0d24-08d8c816f53f
x-ms-traffictypediagnostic: BY5PR12MB4997:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR12MB49970A8DF48901816BF20497FBB49@BY5PR12MB4997.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: X8jpy1HC72KcGpgzqRcyjoGRKGgRwF1VMQipwG7jr3cXR4c7BlrygI13bOCw9qUoZ1DVK9WvQYPPxgLW/IB5mWVoGBtolA906TEkGbn38pNPKl+PJAQwloG8tb7Mt+mPH1uBbOu8BjN2Dcs2bVz1ZJqfzexE5FlZzzhLUtLaZHBkUhDIa+XetkS/Nacgu8tpME4lnqfiRU5J5kLUEhMPM2E82eKVHoKq9sMd6NH3p9xoAOR5cH+zGXhTSPqsWRTEoZhwzZPGIo5KJT5aupJsmsKdiuq1seQiWU8PkknH5T2mi1avpv4oEe4lJz/Ak3CfRkKofl61+1aO8vfkexpITGPJAZz4hBS2vxp73mJVYjB4UQMflmY12pe0WVB863lbXHvdwfd40bJgfXxTp1ajgtlXe1srlS0052LYNGaCiggmeoNg7QOopQWxXv6wX/4jO+i1DbImOwbHQLCJ++AVOT/dhLtz71biqF5po9d98k5neyWq4VOAg4qffGH95E5BGZb3GWjxgA1V00WH1Qm9/bO49jxFXfXkim+zOJ+73hOGN7KznngGje5xpMQca3Uk
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB3238.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(366004)(39860400002)(396003)(136003)(346002)(8936002)(110136005)(4326008)(478600001)(7696005)(6506007)(26005)(186003)(316002)(66446008)(8676002)(83380400001)(5660300002)(55016002)(9686003)(33656002)(64756008)(66476007)(66556008)(2906002)(76116006)(66946007)(54906003)(52536014)(71200400001)(86362001)(32563001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?utf-8?B?aU5YK0toNDhRMnd5T3JkSkxDOVAramVLdTRkZm9LeVh0SSsrd2xSQi9ielFr?=
 =?utf-8?B?dThsRlNMcWJFOVpacDVjWVdPdmZTVjhseHRsdEZWQWtFMUJwQ3lLVUM3VGJV?=
 =?utf-8?B?NlRWL1pIT29xSGlrajQxQnFXTVZvL0ROdmc4alQ2eHdyYm13a2U1WG4yVmxn?=
 =?utf-8?B?NnNEWXNvejIyS0IzeXNHbm1nYmhrTlJabWNDU1VTSGtkdVB3QkZ2Q1lsQlV5?=
 =?utf-8?B?aUJPVENOSis2Yk5haUQ1ZHU3S0N3TmlqSDdyOGYyOG42bTg1a3VOdHJ4aTRw?=
 =?utf-8?B?bzJTZFB6SmZOaFRmaE9jNWNPZ1VxYlYvY2NMekxqaVpNWGNwak9PZVBFaThw?=
 =?utf-8?B?a3IvTlZnd2xOVU5UUVFSM3JUNTVRaDVWcVJXcmIrdGFCcUpkS0t6OU1sei9M?=
 =?utf-8?B?NDV5ck5KZ3ZnUUhKQ3VXZ2QzTVh4L01Rc0NuUDh2N210VUdJa1lQdTV0aHJC?=
 =?utf-8?B?bEx5TStRb05CdEtlL1Izam1JMkFQeHh6M3ZsUXRlMWNaUGpEbVRnSXF4YXRO?=
 =?utf-8?B?QTBGcUZUdWUybDdFRURmbElQTDh5VUd1QXc3R3RtcWdkQlkxZ3ZlQ25wajgr?=
 =?utf-8?B?SjdyNDZxZm93Mm9BVm5WRkVLaE9oVUlvZFBNc3BjeThzbE9QTjRicGs2MkFv?=
 =?utf-8?B?MFNQNUt5UG1oRFkwTTYveS9TNXhYOEQ2SzhkSWNjZzRpWG9Ya1JLSjkrSUFZ?=
 =?utf-8?B?YzhJWGVZSUNCaEVwd2swUXo2VkNnQzROalZtQXZGMkpWazFDQjJwZlExd3cz?=
 =?utf-8?B?TXBjRVRWNzlUR21kVkNPRnFCNUNUcStEaTZmajhncnFMTVF2RzRNOFZnaXh2?=
 =?utf-8?B?OHord2VPRkZtdEtCU29iZ1U5Qk1rMjFqTzU1NzgvckQ2MStzSkRkR0s0Y3lZ?=
 =?utf-8?B?THZXRmRFNm8wTlhabHkvMW5kUGpaMEhNbGRrNElpcWY1UENNbjM5aXR1ODBP?=
 =?utf-8?B?NTU2c3BkQ2JReHNHTFBPRXZlUllhU1lQLzZ2V0ZCaFlrbnI4emNoQzdOWEVn?=
 =?utf-8?B?eGR6SlFERUxGa0pSeDBhUWJWSXoza1N5SmQzazVjVFp3TGZuY2tiams0M1JD?=
 =?utf-8?B?MzR4cTVINzk2aDBGcTFFeGN0K1JsU1k0bXBuRUtPZnExdmYvUzM4YXpRSXJY?=
 =?utf-8?B?Y2lnbzhKaVYrTHBSU2hhUjZaTVJ6MHlsQVYwVWxPd29OOU5PUFVJTHNIS2cx?=
 =?utf-8?B?YVpkbStKdTV4a1ZRdVAreExXZmN2aTA2MDF0bXhqTThrQ2Zwb0g0eVpzOTUz?=
 =?utf-8?B?dFhKbk93RTJUNnFXSm5kaWpEZzhEY0lyRllBb0ppTyttZDRmYnpHSC9lS3lJ?=
 =?utf-8?B?eFFjTmkzWmV5dG93bWlIdU5jQ0JFZGppeE1aanpmQ1pFZENEdG9vbEpwbXhO?=
 =?utf-8?B?OTVaY1hlSkxEWU1wTWdpQnRwanlqSXhjNm1xSC95cEVEbFlERTRHSm1oL1ZK?=
 =?utf-8?Q?mmCYtlHy?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3238.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf4f3171-c408-440f-0d24-08d8c816f53f
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Feb 2021 07:40:20.0751
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aHrXrPkLbw8KQiay+CPe6gnQGPHKfKf6O/rEcydX2qzJ4eJjLJc7AtqrBvjdJ2LA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4997
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

W0FNRCBQdWJsaWMgVXNlXQ0KDQo+DQo+IE9uIDEuMi4yMDIxIDE2LjA4LCBMaWFuZywgUHJpa2Ug
d3JvdGU6DQo+ID4gW0FNRCBPZmZpY2lhbCBVc2UgT25seSAtIEludGVybmFsIERpc3RyaWJ1dGlv
biBPbmx5XQ0KPiA+DQo+ID4+DQo+ID4+IE9uIFdlZCwgSmFuIDI3LCAyMDIxIGF0IDEyOjMzOjA5
UE0gKzAxMDAsIEdyZWcgS0ggd3JvdGU6DQo+ID4+PiBPbiBUdWUsIEphbiAxOSwgMjAyMSBhdCAw
OTo0ODo0NEFNICswODAwLCBQcmlrZSBMaWFuZyB3cm90ZToNCj4gPj4+PiBEdXJpbmcgeGhjaSBz
dXNwZW5kIHNvbWUgQU1EIFVTQiBob3N0IHdpbGwgbG9zZSBwb3J0IHN0YXR1cyBjaGFuZ2UNCj4g
Pj4+PiBldmVudHMgYW5kIG5lZWQgdG8gaGF2ZSB0aGUgcmVnaXN0ZXJzIHBvbGxlZCBkdXJpbmcg
RDMsIHNvIG5vdyBqdXN0DQo+ID4+Pj4gYXZvaWQNCj4gPj4gRDNjb2xkLg0KPiA+Pj4+DQo+ID4+
Pj4gU2lnbmVkLW9mZi1ieTogUHJpa2UgTGlhbmcgPFByaWtlLkxpYW5nQGFtZC5jb20+DQo+ID4+
Pj4gLS0tDQo+ID4+Pj4gIGRyaXZlcnMvdXNiL2hvc3QveGhjaS1wY2kuYyB8IDUgKysrKysNCj4g
Pj4+PiAgMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKQ0KPiA+Pj4+DQo+ID4+Pj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvdXNiL2hvc3QveGhjaS1wY2kuYw0KPiA+Pj4+IGIvZHJpdmVycy91
c2IvaG9zdC94aGNpLXBjaS5jIGluZGV4IDNmZWFhZmUuLmJmZjgxN2EgMTAwNjQ0DQo+ID4+Pj4g
LS0tIGEvZHJpdmVycy91c2IvaG9zdC94aGNpLXBjaS5jDQo+ID4+Pj4gKysrIGIvZHJpdmVycy91
c2IvaG9zdC94aGNpLXBjaS5jDQo+ID4+Pj4gQEAgLTE3MCw2ICsxNzAsMTEgQEAgc3RhdGljIHZv
aWQgeGhjaV9wY2lfcXVpcmtzKHN0cnVjdCBkZXZpY2UNCj4gPj4+PiAqZGV2LA0KPiA+PiBzdHJ1
Y3QgeGhjaV9oY2QgKnhoY2kpDQo+ID4+Pj4gIChwZGV2LT5kZXZpY2UgPT0gUENJX0RFVklDRV9J
RF9BTURfUFJPTU9OVE9SWUFfMSkpKQ0KPiA+Pj4+ICB4aGNpLT5xdWlya3MgfD0gWEhDSV9VMl9E
SVNBQkxFX1dBS0U7DQo+ID4+Pj4NCj4gPj4+PiAraWYgKHBkZXYtPnZlbmRvciA9PSBQQ0lfVkVO
RE9SX0lEX0FNRCAmJg0KPiA+Pj4+ICtwZGV2LT5kZXZpY2UgPT0gMHgxNjM5KSB7DQo+ID4+Pj4g
K3hoY2ktPnF1aXJrcyB8PSBYSENJX0NPTVBfTU9ERV9RVUlSSzsNCj4gPj4+PiArfQ0KPiA+Pj4N
Cj4gPj4+IFdoeSBub3QgYWRkIHRoaXMgY2hlY2sgdG8gdGhlDQo+ID4+PiB4aGNpX2NvbXBsaWFu
Y2VfbW9kZV9yZWNvdmVyeV90aW1lcl9xdWlya19jaGVjaygpIGZ1bmN0aW9uIGluc3RlYWQsDQo+
ID4+PiB3aGVyZSBhbGwgb3RoZXIgc3lzdGVtcyB0aGF0IG5lZWQgdGhpcyBxdWlyayBhcmUgdGVz
dGVkIGZvcj8NCj4gPj4NCj4gPj4gQWgsIHlvdSBkb24ndCBoYXZlIGEgcGNpIGRldmljZSBhdCB0
aGF0IHBvaW50IGluIHRpbWUuICBCdXQsIHdoeQ0KPiA+PiBhcmVuJ3QgeW91IG1ha2luZyB0aGUg
c2FtZSBjYWxscyB0aGF0IHRoZSBjYWxsZXIgb2YgdGhhdCBmdW5jdGlvbg0KPiA+PiBkb2VzIHdo
ZW4gc2V0dGluZyB0aGlzIHF1aXJrIGhlcmU/ICBJc24ndCB0aGF0IGFsc28gcmVxdWlyZWQ/DQo+
ID4+DQo+ID4gW1ByaWtlXSAgVGhhbmtzIGNvbW1lbnQuIFRoaXMgWEhDSSBob3N0IHBvcnQgc3Rh
dHVzIGxvc3QgaXNzdWUgd2FzIHNlZW4gb24NCj4gdGhlIHMyaWRsZSB3YWtlIHVwIHBlcmlvZCBh
bmQgcG9sbCB0aGUgQ05SIGJpdCBmYWlsZWQgaW4geGhjaV9yZXN1bWUoKSB0aGF0DQo+IGV2ZW50
dWFsbHkgcmVzdWx0IGluIHRoZSBYSENJIGRldmljZSByZXN1bWUgZmFpbGVkLiBIb3dldmVyLCB0
aGlzIGlzc3VlIG1heQ0KPiBub3QgdG90YWxseSBjYXVzZWQgYnkgdGhlIGVudHJ5IG9mIFhIQ0kg
Y29tcGxpYW5jZSBtb2RlIGFuZCBzZWVtcyBvbmx5DQo+IHBhcnRpYWxseSBlbmFibGUgdGhlIENP
TVAgZmxhZyB3aXRoIGRpc2FibGUgWEhDSSBEM2NvbGQgY2FuIHdvcmsgYXJvdW5kIHRoaXMNCj4g
ZmFpbGVkIGNhc2UuIFJlZ2FyZHMgdG8gdGhpcyBpc3N1ZSBtYXliZSB3ZSBuZWVkbid0IHRoZSBD
T01QIHF1aXJrIGFuZCBvbmx5DQo+IG5lZWQgZGlzYWJsZSB0aGUgRDNjb2xkIGZvciBzb21lIHNw
ZWNpZmljIFhIQ0kgZGV2aWNlIGR1cmluZyBwcm9jZXNzaW5nDQo+IHhoY2lfcGNpX3N1c3BlbmQo
KS4NCj4NCj4gVGhlIFhIQ0lfQ09NUF9NT0RFX1FVSVJLIGlzIGZvciBjYXNlcyB3aGVyZSBwb3J0
cyBzdWRkZW5seSBnbyB0bw0KPiBjb21wbGlhbmNlIG1vZGUuDQo+IEZvciB0aG9zZSB3ZSBzdGFy
dCBhIHRpbWVyIHRoYXQgcG9sbHMgZWFjaCBwb3J0IGV2ZXJ5IDIgc2Vjb25kcyBhbmQgY2hlY2tz
IGZvcg0KPiBjb21wbGlhbmNlIG1vZGUsIGFuZCByZWNvdmVycyBmcm9tIGl0LiBUaW1lciBpcyBu
b3QgcnVubmluZyB3aGlsZSB4aGNpIGlzDQo+IHN1c3BlbmRlZC4NCj4gQ2FuIHlvdSBzZWUgYW55
IHBvcnQgZW5kaW5nIHVwIGluIGNvbXBsaWFuY2UgbW9kZT8NCj4NCj4gVGhlICdDb250cm9sbGVy
IE5vdCBSZWFkeScgKENOUikgYml0IG5vdCBiZWluZyBjbGVhcmVkIGJ5IGhvc3QgaW4gcmVzdW1l
DQo+IHNvdW5kcyBsaWtlIHRoZSBhY3R1YWwgcHJvYmxlbS4NCj4NCj4gLU1hdGhpYXMNCltQcmlr
ZV0gVGhhbmtzIGhlbHAgY2xhcmlmeSB0aGUgY29tcGxpYW5jZSBxdWlyay4gRG91YmxlIGNvbmZp
cm0gdGhhdCB0aGUgWEhDSSBkZXZpY2Ugbm90IGVudGVyIHRoZSBjb21wbGlhbmNlIG1vZGUgYW5k
IHRoZSBQTFMgZmllbGQgdmFsdWUgd2FzIDUuIFNvIHRoaXMgaXNzdWUgc2VlbXMgbm90IGNhdXNl
ZCBieSB0aGUgQ29tcGxpYW5jZSBNb2RlIGVudGVyaW5nLCBidXQgYnkgRDNjb2xkIGVudGVyaW5n
IHdoaWxlIGluIHMyaWRsZSBsb29wLiAgTWVhbndoaWxlLCBQTUZXL1hIQ0kgSFcgZ3V5cyBjb25m
aXJtIHRoYXQgaW4gdGhlIHMwaXgoczJpZGxlKSBBTUQgc29sdXRpb24gcmVxdWlyZXMgdGhlIFhI
Q0kgVVNCIGVudGVyIEQzaG90LiBUaGVyZWZvcmUsIGFzIHRvIHRoaXMgaXNzdWUgaG93IGFib3V0
IGFkZCBhIG5ldyBxdWlyayBmbGFnIGZvciBoYW5kbGluZyB0aGlzPw0KDQpUaGFua3MsDQpQcmlr
ZQ0K
