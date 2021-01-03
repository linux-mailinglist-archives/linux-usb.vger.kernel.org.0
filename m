Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9714D2E8C1C
	for <lists+linux-usb@lfdr.de>; Sun,  3 Jan 2021 13:23:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726536AbhACMWo (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 3 Jan 2021 07:22:44 -0500
Received: from mail-mw2nam12on2052.outbound.protection.outlook.com ([40.107.244.52]:29344
        "EHLO NAM12-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726173AbhACMWn (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sun, 3 Jan 2021 07:22:43 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VlvVGd12NZISdlXZapzEazX//xGAYk8yIjcjmWEoEr7aawPVttKfg/sOaYIMAeCPeEtTtRwNsqRRRYLJAv+t7f35O1Sb87VJPBH/Y9a9kxytKHfmWenVAokxgiwN5BevwmuwgeCcE0mFoNB56hPhKByegGCb0dOg7Drdp41dnCaGD7A4hB22CE79kGhSzFTru5UZVzc2YFtSjl42oh5LBDn6EmXrPUxuyuivn6lPAblV7s5b6WVyaOJmtoxK0AysjAtZV4vnyLAHbOjw1KWepOuc9uIps00AmEATxvMaN/cKCijyx5HOUiAdEF7WWgDWeAqYapxi9KFdMppwMITRxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1tpMkjqY1lyzTBOhk1SIdAR5XrmJQrgHwpGb1RyWrtg=;
 b=SN5W5BBCpalwdjcEOzPrZJDLUO2AT5kVJ04S2H5QL6nHaemHVjhZjgrt9oYcMC8Y7VTeu8It18VrakljwIuYBOPGxYJNYL8vbPF4uQzCYeFKdd7FZkgnwzP7RFwUOvcUPeD4HdjSz4uRPPeAL0JUX+qwt04jJMQ6aHAToB/+6oYUlNXaPwDvlo/Im+QmUjHQ5IT0A/vwj6Yv7lSvyXDlr5vb+hcKPu0dw1l7oR0ZgiwIQOGkycSWsD3HwvWdBw4GB4YqWiFFS4Evl42qT1pDjS958u2id/qDsaxx5sccN3o0qoDsywsZoAHVMcdquOLrFDskC7gg0TFnD10Kukm0AA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1tpMkjqY1lyzTBOhk1SIdAR5XrmJQrgHwpGb1RyWrtg=;
 b=ixrYLwlCHYHbRNM21SeQAUkB0To3Y78Hk2XsepWOsUx2GsL4RM46xHyJeMWyB+L8JxfhuWCFtVg2mzHlMomRGvV0RjS0ebieY3oc1/03QqShhBkXnQELQ+k5PKtce/IoPWF3NsmYmZ0syHRNKOMqX+j7GTtGy+Hkc/Ubm+oynig=
Received: from BYAPR11MB2632.namprd11.prod.outlook.com (2603:10b6:a02:c4::17)
 by BYAPR11MB3110.namprd11.prod.outlook.com (2603:10b6:a03:8a::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3721.24; Sun, 3 Jan
 2021 12:21:53 +0000
Received: from BYAPR11MB2632.namprd11.prod.outlook.com
 ([fe80::94a4:4e15:ab64:5006]) by BYAPR11MB2632.namprd11.prod.outlook.com
 ([fe80::94a4:4e15:ab64:5006%5]) with mapi id 15.20.3700.031; Sun, 3 Jan 2021
 12:21:53 +0000
From:   "Zhang, Qiang" <Qiang.Zhang@windriver.com>
To:     Greg KH <gregkh@linuxfoundation.org>
CC:     "stern@rowland.harvard.edu" <stern@rowland.harvard.edu>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: =?gb2312?B?u9i4tDogW1BBVENIXSBVU0I6IGFkZCBfX2dldF9mcmVlX3BhZ2VzKCkgaW4g?=
 =?gb2312?B?aGNkX2J1ZmZlcl9hbGxvYyBmdW5jdGlvbg==?=
Thread-Topic: [PATCH] USB: add __get_free_pages() in hcd_buffer_alloc function
Thread-Index: AQHW4akfbnK3X1KQ9EuYE6dNpL4Rj6oVvMcAgAAPHqs=
Date:   Sun, 3 Jan 2021 12:21:53 +0000
Message-ID: <BYAPR11MB26328E6321A1AB80392F8333FFD30@BYAPR11MB2632.namprd11.prod.outlook.com>
References: <20210103081902.2381-1-qiang.zhang@windriver.com>,<X/GkeoCnnsA0tJOU@kroah.com>
In-Reply-To: <X/GkeoCnnsA0tJOU@kroah.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linuxfoundation.org; dkim=none (message not signed)
 header.d=none;linuxfoundation.org; dmarc=none action=none
 header.from=windriver.com;
x-originating-ip: [106.39.151.37]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 34b452f8-e84f-49ea-a781-08d8afe227a4
x-ms-traffictypediagnostic: BYAPR11MB3110:
x-microsoft-antispam-prvs: <BYAPR11MB31106AB2C1421803673348EDFFD30@BYAPR11MB3110.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: bpGYDmGcvry4oVYf6u56MspPL6BuDku/pTaCRBA6/JhNZdEpebE/5fWslV11pQmVgJlhIqiTs2UB3DZJe/9Je2wbqgsROqTHdJqDCnk3AmvFdcCPUIaZ+D2+BOk6IxoVuxdX+rY9qN9vXhU7tTKHidjaNLAmb0YMWe5VQw2bOytG+TX//lPfIJYvyoVO48MA2bYrdtpyZUjF05nK2I7Lfll5NLEyNFaf7C3HoQlOA0+8Xo/HlK0d7CkRt+JXm6H6WsqIVBwE9O/o/jLDcyTFu6X7tNPROSEYmTd0ERRfd7uYAV0Z7UvPdUjWCtTVou27QS6JBdodJwtgZLet9IzH2+7dWmZeIoCfQF27nFb0BRuWWNKoy9wLu6gZ2Yrb+AyJT5oWG8ONdso+jF0Mpsi7/Q==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB2632.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(366004)(39830400003)(346002)(376002)(396003)(9686003)(55016002)(186003)(83380400001)(8936002)(6916009)(478600001)(2906002)(5660300002)(52536014)(7696005)(76116006)(4326008)(66446008)(54906003)(91956017)(66946007)(66476007)(316002)(66556008)(64756008)(71200400001)(86362001)(33656002)(224303003)(6506007)(26005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?gb2312?B?V2FhY0RlUjNIUXkxK0ZJRC9TUndyeFBiOTkvSHZWMlN6V3JBWk13dS9SczJE?=
 =?gb2312?B?bk1SSDJCWkdIb2FTWXk5MU1ma0lBV2tLaklud0p0MVJBVUJMaUxDMk80VmNJ?=
 =?gb2312?B?RitVd0hpOXIwL3JsYUgrZXBqdW14MTI5MndoNVhBb09hQUFoN1p6TTNTV3RR?=
 =?gb2312?B?K1pOVkpVSzZsbDBCNkdjeWl3L2luRzFkVk9ibUtQNkNlM3dIUjQ3bW55ZXIz?=
 =?gb2312?B?S2RyM2lPN2lJdFpWbHNWOU5wSTZmQlB1WUpUSU1xemgySkxpM3VJTUxRQmhp?=
 =?gb2312?B?ZE1JSDBTN0tqN0JzaytlcXV6RXA3S1pwaVVaQlB6eWNpL0NCaUJiS2UvcCtz?=
 =?gb2312?B?ZkFHdjBqVll4bzcxck1DL0RYQXBSSU55MnpKd1plZTVIR2phZHBna3ViNm8y?=
 =?gb2312?B?VE11U3FIUVBCdEl1SVRBcjlXTzV1d2N3eDZBRm5tUk1WdGpuNGIxUkxKakZz?=
 =?gb2312?B?VDF5Rk93eGlqdlpSRkxUeWZadUZwSDJreVRCVEZCUVZMVkJpc3JhdExrZDVp?=
 =?gb2312?B?YUFFd0UyNkVVRDZoV3JRVFRwVkFrcTB6MlJxYnducXExQ2pmYTYzVndkWHlv?=
 =?gb2312?B?QTFuL2Y0aHo3Q09iSmQ3YlJtdkhmdmljRFRvdFNDL0xJUWsvSElLc2VDM2Ux?=
 =?gb2312?B?V1ZRcmpzZDFuTXhhMThOVG9vWkRYM2NWZDgzeGVIYS9hakt6c25lbVJCOGNM?=
 =?gb2312?B?MVFRMno2R1R3Vm0wd1d5VFhjYlNXNHFxbGw0Sk9yaW1jaHpTYzRsNFRKZXVR?=
 =?gb2312?B?Y3FaVUpDRUhONFh5c1p4QTB3ZkRvVnIvR0lXeTh2VC9lUUpnTWw1TkVZWlpU?=
 =?gb2312?B?akpKL1VOTytwU2ZwWGVJdEdnVGFzaCtiZDNlN2hnWUpSZ3pyZnR2enlaWDgw?=
 =?gb2312?B?aUFuamZZNWg5Y0Vhb0xIWG5SRHozV1l0dThKcHppWlA2ekFleWZUanlkZ2lv?=
 =?gb2312?B?NFppM0FYcTFBS08zRjFXblJzOVBkMzdYZnBjNDF3ZFN2bFJneVpENkJxVmpN?=
 =?gb2312?B?MzhXV3M5eUhUZS9YRndlYkdpbGZFakZKN2dXNERDQThBeVFDbjJlSkluVk9r?=
 =?gb2312?B?TnlPN1ZQTFdOY0lrU09FUGk5VEU2LzYvT1VQN2pXd2tyOTFFMlpvb2ZRaDAw?=
 =?gb2312?B?STV2UnhoTWx1M2U3UHpQbHhqUDV3NlJJdTByS3NKSm1yWUU3SmpZTXc3cFls?=
 =?gb2312?B?WVp4b1Y3c0JpNGJoQkZWZnRGMzlDTGhMd3d3U29zL1FoamIyTVJPM29kM0lq?=
 =?gb2312?B?a1Aza0htUlE2QnNMcThHMGZEcVFrL1AwSkIvNkpQaE9NQnlWSXgvb2FMNFhL?=
 =?gb2312?Q?fdVvlNY0tQTsA=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2632.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 34b452f8-e84f-49ea-a781-08d8afe227a4
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jan 2021 12:21:53.4457
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GV9UYPuri8k5a0zWB4ZXheTk4OoMVXzDbu8MrGphKLspbOhvfNR/nzS/CK/f6sKNLX6Zgv0a+7ZPBIu4+iAuYHZynHsGYenOjng+Z1xfHf4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3110
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCreivP7IyzogR3JlZyBL
SCA8Z3JlZ2toQGxpbnV4Zm91bmRhdGlvbi5vcmc+Creiy83KsbzkOiAyMDIxxOox1MIzyNUgMTk6
MDMKytW8/sjLOiBaaGFuZywgUWlhbmcKs63LzTogc3Rlcm5Acm93bGFuZC5oYXJ2YXJkLmVkdTsg
bGludXgtdXNiQHZnZXIua2VybmVsLm9yZwrW98ziOiBSZTogW1BBVENIXSBVU0I6IGFkZCBfX2dl
dF9mcmVlX3BhZ2VzKCkgaW4gaGNkX2J1ZmZlcl9hbGxvYyBmdW5jdGlvbgoKT24gU3VuLCBKYW4g
MDMsIDIwMjEgYXQgMDQ6MTk6MDJQTSArMDgwMCwgcWlhbmcuemhhbmdAd2luZHJpdmVyLmNvbSB3
cm90ZToKPiBGcm9tOiBacWlhbmcgPHFpYW5nLnpoYW5nQHdpbmRyaXZlci5jb20+Cj4KPiBXaGVu
IFVTQiBob3N0cyBqdXN0IHVzZSBQSU8sIGFsbG9jYXRlIG1lbW9yeSBieSBzbGFiL3NsdWIKPiBt
ZW1vcnkgbWFuYWdlciwgaWYgdGhlIHJlcXVpcmVkIG1lbW9yeSBzaXplIGlzIGxhcmdlciB0aGFu
Cj4gb25lIG9yIG1vcmUgcGFnZSBzaXplcywgbmVlZCBhbGxvY2F0ZSBtZW1vcnkgZGlyZWN0bHkg
ZnJvbQo+IGJ1ZGR5IHN5c3RlbXMuCgo+VGhhdCBzYXlzIF93aGF0XyB5b3UgYXJlIGRvaW5nLCBi
dXQgbm90IF93aHlfIHlvdSBuZWVkIHRvIGRvIHRoaXMuCgo+V2hhdCBpbi10cmVlIGhvc3QgY29u
dHJvbGxlciBoYXMgdGhpcyBwcm9ibGVtIGFuZCBvbiB3aGF0IHBsYXRmb3JtPwoKPgo+IFNpZ25l
ZC1vZmYtYnk6IFpxaWFuZyA8cWlhbmcuemhhbmdAd2luZHJpdmVyLmNvbT4KPiAtLS0KPiAgZHJp
dmVycy91c2IvY29yZS9idWZmZXIuYyB8IDcgKysrKy0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgNCBp
bnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNi
L2NvcmUvYnVmZmVyLmMgYi9kcml2ZXJzL3VzYi9jb3JlL2J1ZmZlci5jCj4gaW5kZXggZmJiMDg3
YjcyOGRjLi4yOGU3ZGI5ZjkzZDUgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy91c2IvY29yZS9idWZm
ZXIuYwo+ICsrKyBiL2RyaXZlcnMvdXNiL2NvcmUvYnVmZmVyLmMKPiBAQCAtMTMxLDcgKzEzMSw4
IEBAIHZvaWQgKmhjZF9idWZmZXJfYWxsb2MoCj4gICAgICAgLyogc29tZSBVU0IgaG9zdHMganVz
dCB1c2UgUElPICovCj4gICAgICAgaWYgKCFoY2RfdXNlc19kbWEoaGNkKSkgewo+ICAgICAgICAg
ICAgICAgKmRtYSA9IH4oZG1hX2FkZHJfdCkgMDsKPiAtICAgICAgICAgICAgIHJldHVybiBrbWFs
bG9jKHNpemUsIG1lbV9mbGFncyk7Cj4gKyAgICAgICAgICAgICByZXR1cm4gc2l6ZSA8IFBBR0Vf
U0laRSA/IGttYWxsb2Moc2l6ZSwgbWVtX2ZsYWdzKQo+ICsgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgOiBfX2dldF9mcmVlX3BhZ2VzKG1lbV9mbGFncywgZ2V0X29yZGVyKHNp
emUpKTsKCj5QbGVhc2UgbmV2ZXIgdXNlID8gOiBzdGF0ZW1lbnRzIGlmIGF0IGFsbCBwb3NzaWJs
ZS4gIFVzZSBhIHJlYWwgaWYgKCkKPmluc3RlYWQuCgo+T2gsIGFuZCBtYWtlIHN1cmUgeW91ciBj
b2RlIGFjdHVhbGx5IGJ1aWxkcyBwcm9wZXJseSA6KAoKIEknbSB2ZXJ5IHNvcnJ5LiBJdCB3YXMg
bXkgbWlzdGFrZSwgSSB3aWxsIG1vZGlmeSBhbmQgcmVzZW5kLiAgCiBpZiBzb21lIGhjZCBob3N0
cyBub3Qgc3VwcG9ydCBETUEgIGFuZCBsb2NhbG1lbV9wb29so6wKIHdoZW4gd2UgY2FsbCB1c2Jf
YWxsb2NfY29oZXJlbnQgZnVuY3Rpb24go6xJdCdzICBhY3R1YWxseSAKIGp1c3QgYSBjYWxsIGtt
YWxsb2MgZnVuY3Rpb24sIGl0IGlzIG9ubHkgc3VpdGFibGUgZm9yIGFsbG9jYXRpbmcgCiBtZW1v
cnkgc21hbGxlciB0aGFuIG9uZSBwYWdlc2l6ZSwgIGlmIHNpemUgaXMgbGFyZ2VyIHRoYW4gdGhl
IAogc2l6ZSBvZiBhIHBhZ2VzaXplLCBuZWVkIGFsbG9jYXRlIG1lbW9yeSBkaXJlY3RseSBmcm9t
IGJ1ZGR5IAogc3lzdGVtLgoKIAo+V2hhdCBwbGF0Zm9ybXMgZGlkIHlvdSB0ZXN0IHRoaXMgb24/
Cgo+dGhhbmtzLAoKPmdyZWcgay1oCg==
