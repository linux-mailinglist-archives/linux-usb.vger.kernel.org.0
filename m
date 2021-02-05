Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B511310AEF
	for <lists+linux-usb@lfdr.de>; Fri,  5 Feb 2021 13:13:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231518AbhBEMLy (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 5 Feb 2021 07:11:54 -0500
Received: from mail-dm6nam10on2087.outbound.protection.outlook.com ([40.107.93.87]:40033
        "EHLO NAM10-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231351AbhBEMFq (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 5 Feb 2021 07:05:46 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AjOW5+a0rhPCuFOzz4dBMbb7y8x9yQMeM/ZvHHJCQlYUqsd2sU+FGU9wbMmam6Nerqziy7i8AhjHUFEyXwwJtWJfeSk89k/y9lnEkwWaS+iICanl+wTmBH/UH1CCN2WTV61CfpfpyoPWDr/8/F+Y9o+YWX/erp5ERPGLg8op+m/DVMX23Y/x+K4otHGt+HQGmwSLY7HnSCnHX7dam8Mr5O5n3Y0HQIub/gli+1pXDv4hdZK3i+yqjr1V9TDIpFzIZtD4F2ggKBZz6n4AKhakmT5ISZdbypnT5rJfrMkm2hxPHaJxafr8slcJkk0x2ywoEwnYMBzICtKWy8VWnsHpAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6s0OaLNg9xE6BwUeax9aS7eh+mV/GsLTcpFF8fUbLTo=;
 b=Mt7INTWqrW5iTXfpKXCVxcUVrZIUYJx7XaCOeR6dG6kPMNpFOaPsMux8Lhru/rt9MDcGQ01bhhDh8ixBb2vHMUmHLF1ZltGTwAq0bOdoXUiplLxMUOjY42tPx6e8gRObOulrfOxR0u4XgqRwrIvin4BMsYn+s1rTx+oVWtVX0/zhvtOjaQhTmNVSLHSk/nJ432oBRXe6dtp7apakT5JFUExxpVtntXpfq3IIml6fTvYctOBnflXWZufoZNq1qM40k7B9qQY1mS0QZJbE1dypUDhrhpqWBsdhD3ygGwGUMHb03K2FeLB5Z6YyKeM3i+6nSt2ZDPbb6iorDwF2OvES9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6s0OaLNg9xE6BwUeax9aS7eh+mV/GsLTcpFF8fUbLTo=;
 b=RAOhTpM8WsCl2sAFJuevyb/N9IMLWsy/LgT6eCJi8732D5revwHsjbk0LtD0cbbbOFpBgas5hw/m1pBf3fZFHxwm22/ENBvMctbwnhebulmWM6T5L47bFQ5AWiN00xjngvEyI2ovf1kUWYFu1gRpND6WvBejtQIEM2DJKzjDQ8A=
Received: from BYAPR12MB3238.namprd12.prod.outlook.com (2603:10b6:a03:13b::20)
 by BY5PR12MB4276.namprd12.prod.outlook.com (2603:10b6:a03:20f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.17; Fri, 5 Feb
 2021 12:04:52 +0000
Received: from BYAPR12MB3238.namprd12.prod.outlook.com
 ([fe80::6daf:7d00:b03b:8a16]) by BYAPR12MB3238.namprd12.prod.outlook.com
 ([fe80::6daf:7d00:b03b:8a16%4]) with mapi id 15.20.3805.024; Fri, 5 Feb 2021
 12:04:52 +0000
From:   "Liang, Prike" <Prike.Liang@amd.com>
To:     "S-k, Shyam-sundar" <Shyam-sundar.S-k@amd.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
CC:     "greg@kroah.com" <greg@kroah.com>,
        "mathias.nyman@intel.com" <mathias.nyman@intel.com>,
        "Deucher, Alexander" <Alexander.Deucher@amd.com>,
        "Akkenepalli, Ramakanth" <Ramakanth.Akkenepalli@amd.com>,
        "Xie, Jack" <Jack.Xie@amd.com>
Subject: RE: [PATCH] usb: pci-quirks: disable D3cold on xhci suspend for
 s2idle
Thread-Topic: [PATCH] usb: pci-quirks: disable D3cold on xhci suspend for
 s2idle
Thread-Index: AQHW+7LHc209nWDfXU6UPIy8tBz1hKpJcuCAgAABVbA=
Date:   Fri, 5 Feb 2021 12:04:52 +0000
Message-ID: <BYAPR12MB323885F1F008A0865FD27435FBB29@BYAPR12MB3238.namprd12.prod.outlook.com>
References: <1612524764-6496-1-git-send-email-Prike.Liang@amd.com>
 <5ae0f2ab-3723-7066-015c-42824388f9b9@amd.com>
In-Reply-To: <5ae0f2ab-3723-7066-015c-42824388f9b9@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f2ed062d-8486-4f50-a4f1-3cce0dd00d64_ActionId=c9d6670d-0621-4e83-9691-b4057a44a32b;MSIP_Label_f2ed062d-8486-4f50-a4f1-3cce0dd00d64_ContentBits=0;MSIP_Label_f2ed062d-8486-4f50-a4f1-3cce0dd00d64_Enabled=true;MSIP_Label_f2ed062d-8486-4f50-a4f1-3cce0dd00d64_Method=Privileged;MSIP_Label_f2ed062d-8486-4f50-a4f1-3cce0dd00d64_Name=Non-Business;MSIP_Label_f2ed062d-8486-4f50-a4f1-3cce0dd00d64_SetDate=2021-02-05T11:56:19Z;MSIP_Label_f2ed062d-8486-4f50-a4f1-3cce0dd00d64_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
x-originating-ip: [139.227.235.92]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 095d6986-5bbb-48b8-104f-08d8c9ce3e95
x-ms-traffictypediagnostic: BY5PR12MB4276:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR12MB42761CB487C0D9138A3F6668FBB29@BY5PR12MB4276.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3513;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: s5xIrCMubGLyn+RL67P6vQYbz4USsQOEbPslRfDkQNbX/Po5LLBjeCQiLy1NiwIXoFoL7wAepeQS3NDsPWn+/h/Bxe6T3+9ylFoB87ogTOXGRN1b2OZvMJpL80h9Q2vwHBgH5kLnk5RNiuET+ZrErb7UCkKiVrYv11JMseGh+8OJ4vXEzO5d2UTRf0+SziMem9rImRwSN2DYk/f7UMGgbAZcxbS0SEUG45Qt/OKmNQrmodqOjWu3pXX/QPfClqGYBaD3EsEJQLX8lxbc8DYIpQ4Q9Hpbr681DizcvLTXCA35EaZfyKPUZwuE5oSgjhzoPjC9Ga9a86E6hEkM/8XmKEI79hD/03B57hEvDonwFb5dVx+oODOT7Uw6LTwJFDzIVZaXePvULHQMuSyq73w1TJQDdAFic9VGl7uHTbuZ6fp9OBvek38441CNA3QiItVuz4nIaLgVogxpEYgpt/Qf7ndWAgCKbYebx04PwkFS332ZAe8yCc1v9SDJsoj1dZhl42mAIVuWGXPDIa6H987PAPUywt9orUWn95wCWb+TXu//z2LNhjtgswJsKQtgK/Pn6/Y8s1fOrOBwL9uE6JiDjUC+0aSv0dzwIyuRM7ae/Y8=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB3238.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(396003)(366004)(136003)(346002)(376002)(186003)(53546011)(4326008)(66946007)(86362001)(66556008)(52536014)(9686003)(478600001)(83380400001)(7696005)(64756008)(110136005)(66476007)(26005)(66446008)(2906002)(316002)(33656002)(6506007)(55016002)(54906003)(5660300002)(76116006)(71200400001)(8936002)(8676002)(403724002)(32563001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?utf-8?B?Sk1zNE54OXVYaXQwdit3UlR5NEM3Tm02Zjl6QVFCS3Njc2R2SDVIMFQzaGYv?=
 =?utf-8?B?Z1FaOXJLTDZlN0poK1ZjTVhveFpWL2lnd1FzeGZnUU9DMjJLQjNTVUhGVXVu?=
 =?utf-8?B?R0RhY1Qvb2FPMW1VNzBvMmtiaDNRM0tBT3NFQVFJb1NFNkgvbGhXM0dHWGJH?=
 =?utf-8?B?VHlaWjZmcG1oSUVjM3k3SDZMOTFmZE45K2F5UkcxLzMrZTlEYXZuRHFSN0xt?=
 =?utf-8?B?UWZkWGRlMXE2THNIaEc5ZFZMZWpMc2hFK2xiWEphcC9sZUlQU3FTWlhtQ0NJ?=
 =?utf-8?B?NTlmbFZSTFJYcUtTZ1FhbGFORWk1ZHZQOGsrSlJhNUZ1QjZNVmlzU2R0ZTZj?=
 =?utf-8?B?SDVuekNGYmE1U3JqVXdnSVc0MkdHcXU5YUptZVZlRldNT21jOXNJaW4zb3lo?=
 =?utf-8?B?TEo4UzVEUWpGa3pkUFdCNTVYeEJzMll0SkI4VlN2TDd4c1JrNFVwb1RRRDZQ?=
 =?utf-8?B?ajd3WjV3b3RTby9zWFVqZGcvTi9ZYWRPanlWSEU4Zm9HeElSc3JWWmIwV29m?=
 =?utf-8?B?VzJORGVxbFI1QVpMblM5M21sdkRmd2JyNFNrMzlOQ3I0YUJlMFZOVzE1aW5t?=
 =?utf-8?B?S2dFTHY1T1V2SEUxTkdSV0tZUkVucFJwdEUyNk1DSFRDMDhGdllrTjZUb3py?=
 =?utf-8?B?TzVmczFCZEdTTlhiSEJ4c0V0MDhqUEZ6ZlkrZ1c0WlRqWGhVTjkzZEU2bHps?=
 =?utf-8?B?QzU2T2cvbUlTUDFqMlBwd1pWNjhieStXUFNVY0M2YUFIU1BMV1FVa3BkTm9h?=
 =?utf-8?B?SWdWcktIckxZTXRRSkFRcTQwajVKUzcvTXR1TkhFVkVlSmNYbWxFOW1JNmZD?=
 =?utf-8?B?eStCaUMrQ1RTcHZUUkNSeWhqMFg2NU1lYlB5d2NJYmptL2J5cG1aNVhaNGR6?=
 =?utf-8?B?dXZCdmNyWHJMQzZMVGNqbXVrZncyVmFEWTFoZ3ZRaGkyU2szcEtSa1J3bGFT?=
 =?utf-8?B?aDk0TjJuZjFvWTlwRm9oc0p5bkk3bFcwT2MyVldLOUxtM2FBMHV6K1NqeVcx?=
 =?utf-8?B?RmM3YVJOdFhjRmpvV2ZDbG9hdVllZE5nWkI1bEtaSmhIS2VQUFdnVFpkMFNZ?=
 =?utf-8?B?OHhHeWlyMmRIQzlZNERSeFlWZDRlNGpHOXc0enZteWdZVWdKaEs0SVJpM2g0?=
 =?utf-8?B?YmQ4R2w0ME91dDlranJFblhiZnZZenQ4WDBvQjhNMzBlUW8xbTJEOFBIT0Zl?=
 =?utf-8?B?WEFvcy95Rmg3YVFUN3M0ZmxQa0hWSG41QnVteFJBQ0hXa3pYckRTbmtXWFVP?=
 =?utf-8?B?VUZsYlF4d0MyOTBqYSt4R0tRbDBCaEZNWVpWN09vTXg1aVdkWHFGbGJBLzE3?=
 =?utf-8?B?MXFHNi8xbGhsUmVkSkJyaU9IMThtY2QwNnI0aEZ6UHoya21Lc09oVXBmUXVF?=
 =?utf-8?B?RWNnaGxvc0JqOFhVZVZGN2RWd0NIemlNL3g1U3MzSi9TVUpwU2N2MFUvSzZl?=
 =?utf-8?B?dUZEMlRYU0tleE44bjNqbVRtZEtXRnhtMkZPaGozU08yMHRVQVhNb0tZMm9n?=
 =?utf-8?B?SFZSbzc3VVBmdTVzRXl2citNZEFjbFdUUEsxaFVJOHQ5c3JzcUpCRE5HMDJ3?=
 =?utf-8?B?RTR1bVZCbG0yMXhBaTRnTTZHL0NNQ2tVU29tdU9vTngvczh4WVZwclVDanEv?=
 =?utf-8?B?ZGdiN1RIYjhwU3M4R1NOdG0wTjhKSklsRXlzUTJZVFpHZTlFait1NXFHL1ZI?=
 =?utf-8?B?UFNCRlZlUkFUUkVzVVlzbmZjaEhva09mVzJ4ajd1Wnl6MExNd0xvczFtZ1o5?=
 =?utf-8?Q?0lhydXy1QGMdbsTsrIK1ewEGuE6t0JfkW4lSDg9?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3238.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 095d6986-5bbb-48b8-104f-08d8c9ce3e95
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Feb 2021 12:04:52.1338
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nRERFjnm7HDzQTcU9R/DS28QH/1vc0hdZx6IG4Y72kWyPDa208c6qYlWPadRu8Co
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4276
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

DQoNCj4gDQo+IFRoaXMgaGFzIHRvIGJlIHdpdGggdGhlIHBhdGNoIHJldmlzaW9uIG51bWJlciwg
aS5lLiBbUEFUQ0ggdjJdICwgW1BBVENIIHYzXQ0KPiBldGMuDQo+IA0KPiBPbiAyLzUvMjAyMSA1
OjAyIFBNLCBQcmlrZSBMaWFuZyB3cm90ZToNCj4gPiBUaGUgWEhDSSBpcyByZXF1aXJlZCBlbnRl
ciBEM2hvdCByYXRoZXIgdGhhbiBEM2NvbGQgZm9yIEFNRCBzMmlkbGUNCj4gc29sdXRpb24uDQo+
ID4gT3RoZXJ3aXNlLCB0aGUgJ0NvbnRyb2xsZXIgTm90IFJlYWR5JyAoQ05SKSBiaXQgbm90IGJl
aW5nIGNsZWFyZWQgYnkNCj4gPiBob3N0IGluIHJlc3VtZSBhbmQgZXZlbnR1YWxseSByZXN1bHQg
aW4geGhjaSByZXN1bWUgZmFpbGVkIGluIHMyaWRsZSB3YWtldXANCj4gcGVyaW9kLg0KPiA+DQo+
ID4gU2lnbmVkLW9mZi1ieTogUHJpa2UgTGlhbmcgPFByaWtlLkxpYW5nQGFtZC5jb20+DQo+ID4g
LS0tDQo+ID4gIGRyaXZlcnMvdXNiL2hvc3QveGhjaS1wY2kuYyB8IDYgKysrKystDQo+ID4gIGRy
aXZlcnMvdXNiL2hvc3QveGhjaS5oICAgICB8IDEgKw0KPiA+ICAyIGZpbGVzIGNoYW5nZWQsIDYg
aW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvdXNiL2hvc3QveGhjaS1wY2kuYyBiL2RyaXZlcnMvdXNiL2hvc3QveGhjaS1wY2kuYw0KPiA+
IGluZGV4IDNmZWFhZmUuLjhlY2RlNjYgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy91c2IvaG9z
dC94aGNpLXBjaS5jDQo+ID4gKysrIGIvZHJpdmVycy91c2IvaG9zdC94aGNpLXBjaS5jDQo+ID4g
QEAgLTE3MCw2ICsxNzAsMTAgQEAgc3RhdGljIHZvaWQgeGhjaV9wY2lfcXVpcmtzKHN0cnVjdCBk
ZXZpY2UgKmRldiwNCj4gc3RydWN0IHhoY2lfaGNkICp4aGNpKQ0KPiA+ICAJCShwZGV2LT5kZXZp
Y2UgPT0gUENJX0RFVklDRV9JRF9BTURfUFJPTU9OVE9SWUFfMSkpKQ0KPiA+ICAJCXhoY2ktPnF1
aXJrcyB8PSBYSENJX1UyX0RJU0FCTEVfV0FLRTsNCj4gPg0KPiA+ICsJaWYgKHBkZXYtPnZlbmRv
ciA9PSBQQ0lfVkVORE9SX0lEX0FNRCAmJg0KPiA+ICsJCXBkZXYtPmRldmljZSA9PSAweDE2Mzkp
DQo+ID4gKwkJeGhjaS0+cXVpcmtzIHw9IFhIQ0lfQU1EX1MySURMX1NVUFBPUlRfUVVJUks7DQo+
ID4gKw0KPiA+ICAJaWYgKHBkZXYtPnZlbmRvciA9PSBQQ0lfVkVORE9SX0lEX0lOVEVMKSB7DQo+
ID4gIAkJeGhjaS0+cXVpcmtzIHw9IFhIQ0lfTFBNX1NVUFBPUlQ7DQo+ID4gIAkJeGhjaS0+cXVp
cmtzIHw9IFhIQ0lfSU5URUxfSE9TVDsNCj4gPiBAQCAtNTAwLDcgKzUwNCw3IEBAIHN0YXRpYyBp
bnQgeGhjaV9wY2lfc3VzcGVuZChzdHJ1Y3QgdXNiX2hjZCAqaGNkLA0KPiBib29sIGRvX3dha2V1
cCkNCj4gPiAgCSAqIFN5c3RlbXMgd2l0aCB0aGUgVEkgcmVkcml2ZXIgdGhhdCBsb3NlcyBwb3J0
IHN0YXR1cyBjaGFuZ2UgZXZlbnRzDQo+ID4gIAkgKiBuZWVkIHRvIGhhdmUgdGhlIHJlZ2lzdGVy
cyBwb2xsZWQgZHVyaW5nIEQzLCBzbyBhdm9pZCBEM2NvbGQuDQo+ID4gIAkgKi8NCj4gPiAtCWlm
ICh4aGNpLT5xdWlya3MgJiBYSENJX0NPTVBfTU9ERV9RVUlSSykNCj4gPiArCWlmICh4aGNpLT5x
dWlya3MgJiAoWEhDSV9DT01QX01PREVfUVVJUksgfA0KPiA+ICtYSENJX0FNRF9TMklETF9TVVBQ
T1JUX1FVSVJLKSkNCj4gPiAgCQlwY2lfZDNjb2xkX2Rpc2FibGUocGRldik7DQo+ID4NCj4gPiAg
CWlmICh4aGNpLT5xdWlya3MgJiBYSENJX1BNRV9TVFVDS19RVUlSSykgZGlmZiAtLWdpdA0KPiA+
IGEvZHJpdmVycy91c2IvaG9zdC94aGNpLmggYi9kcml2ZXJzL3VzYi9ob3N0L3hoY2kuaCBpbmRl
eA0KPiA+IGVhMTc1NGYuLmZhZmEwNDQgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy91c2IvaG9z
dC94aGNpLmgNCj4gPiArKysgYi9kcml2ZXJzL3VzYi9ob3N0L3hoY2kuaA0KPiA+IEBAIC0xODc0
LDYgKzE4NzQsNyBAQCBzdHJ1Y3QgeGhjaV9oY2Qgew0KPiA+ICAjZGVmaW5lIFhIQ0lfUkVTRVRf
UExMX09OX0RJU0NPTk5FQ1QJQklUX1VMTCgzNCkNCj4gPiAgI2RlZmluZSBYSENJX1NOUFNfQlJP
S0VOX1NVU1BFTkQgICAgQklUX1VMTCgzNSkNCj4gPiAgI2RlZmluZSBYSENJX1JFTkVTQVNfRldf
UVVJUksJQklUX1VMTCgzNikNCj4gPiArI2RlZmluZSBYSENJX0FNRF9TMklETF9TVVBQT1JUX1FV
SVJLICAgQklUX1VMTCgzNykNCj4gDQo+IFdoeSBkb24ndCB3ZSBrZWVwIGl0IHRoZSBmdWxsbmFt
ZSBpLmUuIFhIQ0lfQU1EX1MySURMRV9TVVBQT1JUX1FVSVJLDQo+IGluc3RlYWQgb2YgWEhDSV9B
TURfUzJJRExfU1VQUE9SVF9RVUlSSywgbGlrZXdpc2UgYXQgYWxsIHBsYWNlcz8NCj4gDQo+IC1T
aHlhbQ0KW1ByaWtlXSAgVGhhbmtzIGZvciB5b3VyIGNvbW1lbnQgYW5kIHRoZSBwcmltYXJ5IHBh
dGNoIHdpdGggY29tcGxpYW5jZSBtb2RlIHF1aXJrIGhhcyBiZWVuIGRyb3BwZWQgYW5kIHRoaXMg
cGF0Y2ggDQpzZWVtcyB0b3RhbGx5IGRpZmZlcmVudCB3aXRoIGNvbXBsaWFuY2UgbW9kZSBwYXJ0
aWFsIGVuYWJsZW1lbnQgZml4LiBBbnl3YXkgSSB3aWxsIGdpdmUgdGhlIHBhdGNoIG1vZGlmaWVk
IGRldGFpbCBpbiB0aGUgY29tbWl0LiBUaGUgWEhDSV9BTURfUzJJRExfU1VQUE9SVF9RVUlSSyBp
cyBhIHR5cG8gYW5kIEkgd2lsbCBjb3JyZWN0IGl0Lg0KDQpUaGFua3MsIA0KUHJpa2UNCg==
