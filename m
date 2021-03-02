Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9010032A484
	for <lists+linux-usb@lfdr.de>; Tue,  2 Mar 2021 16:41:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1383196AbhCBKuQ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 2 Mar 2021 05:50:16 -0500
Received: from mail-mw2nam12on2077.outbound.protection.outlook.com ([40.107.244.77]:53684
        "EHLO NAM12-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1376671AbhCBHmY (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 2 Mar 2021 02:42:24 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lECx9vpwIGCRycQSlkuPSnpdQarnLTVQ2hbX7tKDV5CU0FweEPt1BbBnGX80pY7lCD7iiHyD95ObY/W0GsF1hYcE4CpteRsI2vAy2G+X+LDS1FHdYCV8nz+/33l2AK5JK24Ub2SlQZ5abrj9/vhWFJoHMhuwJRP/cUEj19WtHZQLFXhUd5GzuKsORYbqwbc6p/JnHzlN6DARHiYeF3YsOkvrcdDS+KwG42ssKDiVf2+w1NOvXXjhSNKxZxiN11c3MC2z328sK9OXy/7ETgG7NXd+Z0rOxqxFaSBTyYiz9JAHpKpdUPNchRpniwcTS7xRSXw1wZz3Knc79Z/qfrzznA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wb1e1HPjcd8wET5Ux3IEwUd0kMDCzn9RIL63c430gvg=;
 b=NmP+AGjdTyYXCZnKeSHMfezFB7TrZebsO+5j38SbwNZj24luoY5XfXi5t2PlqAEoURQw1ckimXpsa3GddZjXF6gPdE5P8ZIXO5+9rarKyTcx7QiBXUcoNbcfxLJWdeOGjTP5bagTUnNmGmD5/olqleJB8lKTj3UWLcQShUB6drfOzb6+9A4j0QHI7LiCnEBTPhX4PTp3a8gKkZ7f1bsGJ/Mbc9m3C/+/feKqiHZVUAI7vHlW5jOmMVamURxzgVneEsdRSOrzghYL7pgR7I28UTA5HgXUZeoFjO7PddfSWrYNQnTdGGak+1jkQLcJoBresb5R4schzyXi8rRF1obN5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wb1e1HPjcd8wET5Ux3IEwUd0kMDCzn9RIL63c430gvg=;
 b=F00LybCYx4JZSjPZiRqthegunWNZbL3ol+B30BRFZm1HP+5M0PwH1oPur7e4i3lP9TVWSpuhjgVUN/9nBtSH7eLlfXEn7g8Mdk02YN4eBdE32W720MS/svlSUDtUC2tByvEtrMbz5yv7ifVX96JNVcfyYRqwGgKFakj+b995w/w=
Received: from BYAPR11MB2632.namprd11.prod.outlook.com (2603:10b6:a02:c4::17)
 by BYAPR11MB2631.namprd11.prod.outlook.com (2603:10b6:a02:be::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.28; Tue, 2 Mar
 2021 07:41:08 +0000
Received: from BYAPR11MB2632.namprd11.prod.outlook.com
 ([fe80::89a3:42c3:6509:4acd]) by BYAPR11MB2632.namprd11.prod.outlook.com
 ([fe80::89a3:42c3:6509:4acd%4]) with mapi id 15.20.3890.029; Tue, 2 Mar 2021
 07:41:08 +0000
From:   "Zhang, Qiang" <Qiang.Zhang@windriver.com>
To:     Greg KH <gregkh@linuxfoundation.org>
CC:     "zaitcev@redhat.com" <zaitcev@redhat.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: =?gb2312?B?u9i4tDogu9i4tDogu9i4tDogW1BBVENIXSBVU0I6IHVzYmxwOiBBZGQgZGV2?=
 =?gb2312?Q?ice_status_detection_in_usblp=5Fpoll()?=
Thread-Topic: =?gb2312?B?u9i4tDogu9i4tDogW1BBVENIXSBVU0I6IHVzYmxwOiBBZGQgZGV2aWNlIHN0?=
 =?gb2312?Q?atus_detection_in_usblp=5Fpoll()?=
Thread-Index: AQHXDk20+BdPbRjrkkqRIs2SLfiV1apuxV6AgAADMfyAAAXOgIAAAZ3lgAF4GQCAAAUlng==
Date:   Tue, 2 Mar 2021 07:41:07 +0000
Message-ID: <BYAPR11MB263258B4BD102A08BF454D82FF999@BYAPR11MB2632.namprd11.prod.outlook.com>
References: <20210301040300.20834-1-qiang.zhang@windriver.com>
 <YDyfL/yg9QNM4nku@kroah.com>
 <BYAPR11MB263268B5FD6EB3C3B80B63FBFF9A9@BYAPR11MB2632.namprd11.prod.outlook.com>
 <YDymu1AlS+8UjdXG@kroah.com>
 <BYAPR11MB2632AE1A6D78903112F86062FF9A9@BYAPR11MB2632.namprd11.prod.outlook.com>,<YD3jlIR7UJjXT6Se@kroah.com>
In-Reply-To: <YD3jlIR7UJjXT6Se@kroah.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linuxfoundation.org; dkim=none (message not signed)
 header.d=none;linuxfoundation.org; dmarc=none action=none
 header.from=windriver.com;
x-originating-ip: [60.247.85.82]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 43376dd5-1008-49fa-c6e3-08d8dd4e8af2
x-ms-traffictypediagnostic: BYAPR11MB2631:
x-microsoft-antispam-prvs: <BYAPR11MB26311E5CBD57EB594B36769FFF999@BYAPR11MB2631.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2276;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: u0axJTw+V5rx9rtz5Om1Aq/1xCQ5O+SqLPWvYTfgvHUAc/tKOCBoTBEWhtVIeM/9aJBwal/3mi5JYwHWj5pb39HlQlmm7wbIABKCtVOAHnA4M60jv0ZVLAPMgjucPTzJpxIgv+xa5pg9zmoRhsZC1xyn+xTHUquSlUT8dYdSVFvYaV5T8BStaGY2bzUGiwm+gpyX7gcMUygQy4RvxWJujxctBuoCVSNpRA0apiqnsLe9vrOBfngRqyGIsetnVGPGEvsmY/DNWFlXChDKjJTkrG2BFNxGXXCSMKbKRiioNkW5iNpsseYSPUfxPndz5K7ObKRuTpzg7NLvQ54bvaxzg8t2xNbC08zI+0TgaVXvJEU3xGae0nrcsvFjAqBWBYto6dZqZ4OqtynTGQ14TMG0wJl5ijtxEOMebNZ9qeuzDFDaleX2AAOXymHeyfo6G5jtxL4W1cBZQ69EKy1I6/AKhcmk4CXAL7tq0B/tYl/RFR3pNUDNpwcsUSUF2kruR2u6HTwANrQoDmSXKzTO9Rqhwg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB2632.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(376002)(136003)(396003)(346002)(39850400004)(478600001)(6506007)(71200400001)(66476007)(66946007)(7696005)(5660300002)(26005)(4326008)(66446008)(91956017)(186003)(55016002)(9686003)(76116006)(64756008)(66556008)(6916009)(83380400001)(8936002)(33656002)(54906003)(86362001)(224303003)(316002)(2906002)(52536014);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?gb2312?B?a2t5TzNsQ3VjWm8zWVN3Z0o4Rmk3NlNac0pBVWpJMFVENUtlQndid2loZlZT?=
 =?gb2312?B?ME5xM01IbDFxaFFLRFhFWUhrUUZIS2RaS0NnWmNwbjcyRGd4MjNBSmdEYzg0?=
 =?gb2312?B?bnVkc2pLUmp0Z1FSZ0FabXk4bExtS0lFeVFVNmhyRzhDSkYxbVBCUUlVMFpQ?=
 =?gb2312?B?MWkyQzVWZGRiMC91Z1pwQ1hQajk3d2V2QmhRcU9nOWQ3dFN3K21zR2hmZ3pE?=
 =?gb2312?B?NVlmVmpqekxSdS9ZM3luU05sWWV3VDRWa1o1cWlTc0cvcCs2MUMvZkE0NDdX?=
 =?gb2312?B?ZTNrOVBveFEyR09mMkFKK3ZUR3ovT3RQeHJBNjVUWVFNcWxzQng1Smc3M1VV?=
 =?gb2312?B?dmtGMzh5UVFjdFFhOGF0dVFlZUFPN2g0Y1Z1ZFh0V1ZTYmFvSGxYWWYxc2V2?=
 =?gb2312?B?WnZpR2FGNlVwV2pRMzVKNDA4RFVVK2J5ZHNZRmNjbWxhbzd5cVBTZGh2R0Z2?=
 =?gb2312?B?V05nYlpvZlNBeDhtQVRTM0hrTWlnTTN1TEYxbXZhQ0podUhaSjFkK0Erb2Q5?=
 =?gb2312?B?V1l5U0N0WnRydnFwNUhlamVDb2s2Wm1vaXk1ekRBRlZ2YUZDT3pZVHpBR2FG?=
 =?gb2312?B?VWxwQlFVN0JzWmxnenN6R2lUQnlrRGdTRlJxM09neDIzanhnWmhPZUpLb3Rz?=
 =?gb2312?B?RkhPS1JvdWZpa2tvc1YyTHVWbXZka3dTZXBORHV1clNYQ1REU1NiTS9YRzhE?=
 =?gb2312?B?THBsUWlVdlpZUnhmeWJLUW1iZXBHWHlhTEx2aGo2T3dBaG00d052N09BSDh3?=
 =?gb2312?B?UDkxV1dEYkNmYUpyMDdBM3ZWbkk3aUlFQ0RISFBha2ZyY0pMM2FLNlZSVVVu?=
 =?gb2312?B?MkN0Q2c1YUQzNDZyWVRNRkRCcVZJTG4wc3FIZTloc1FRZTdodityYWlCWWlh?=
 =?gb2312?B?VERnREpkNjh6eW5NMkl1UGo1QnJDN2Y0UnRiTTFuaU8zZitZS3ZXTWJkaXhQ?=
 =?gb2312?B?NkdtNW5mVWdWTXNHTlg3Vng1cVN3Zm03d3JLeDJzWGJ5cVZ2ZnJLaWNTSUFT?=
 =?gb2312?B?eGFuZzlqU1JvTHFlMU5SdXRQS0lwc1p2ZEV1dTU5TFl3VE0ra3IyUVVzZU9R?=
 =?gb2312?B?VDA2UHVSMlkwTTRQbkZLRnYxZzN4NE1hMHhLZE40bURHYjFjcVRlY3ZrV1ZG?=
 =?gb2312?B?Rk04TlJxaUlwYXo1bkg0N2J6QUx3Znk5bEd1UDRCMnBXS3FxWHVaVmp6U2tz?=
 =?gb2312?B?R1hLdmV4RVA2ZlE1eG9ON002N1JORS9NZzk4Nmp2eWNyMHBaQ1JZRjF0bFQ2?=
 =?gb2312?B?NGN3Y2Q3VS9qb1d4RVBuSkhKVkFNNVBxa3ZTeWM2ekdIU3E0enVnaXFWWFRx?=
 =?gb2312?B?c1hiVmgzZEdSd1dIY0h5cUU4R2FkeGdZLzVBakg0UXFtekJQTjdhc0pZWmY4?=
 =?gb2312?B?SlA3RUdaQXZZZGhrRjdyN1hXVDhaZ0ZjbWxtN2xma0ZoQTZ1Tm92ek5VK0Ux?=
 =?gb2312?B?U0E2QlVSNGhRK25TZERvZ2xWWkRRM2Zkcy9qMXd5TWIvNnJDU0ROTDNMRUti?=
 =?gb2312?B?bkdhYkhRU0RPTWF1UVVOby8wbUdrQnNaRVE5bnlyZXNLVjF0QlVGb0NRWWVK?=
 =?gb2312?B?S2MvY1hyT1lEWnhlbjZNanBKZGFNYXljUk1JMkVTMWZtMzJiNnYzQkV3c3A2?=
 =?gb2312?B?cnlKNDJhTzNydkZPaDFtRysxdWtvY2pyUlBSd1Y1Y05DdWZDWk9HRVBkNkJk?=
 =?gb2312?B?clVzOGJUMnJPVll2Qm9YSGpPU1RidGlRbjFNd0NaNjd2dWNnUHo3cTBONVZs?=
 =?gb2312?Q?VBq2ZntbvAY2VNHYss=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2632.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43376dd5-1008-49fa-c6e3-08d8dd4e8af2
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Mar 2021 07:41:07.9790
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5ziDel4VGa5T/RJCBBdtG0oPPR//gE8nyBiK15K/QEn2DKFJviACer2rqRkJrHUd4PBROH78+zbQXiy5hJPaxa1U2WLAxtNQtwexFfGbEtI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2631
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Ck9uIE1vbiwgTWFyIDAxLCAyMDIxIGF0IDA4OjUyOjU4QU0gKzAwMDAsIFpoYW5nLCBRaWFuZyB3
cm90ZToKPgo+Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+ILei
vP7IyzogR3JlZyBLSCA8Z3JlZ2toQGxpbnV4Zm91bmRhdGlvbi5vcmc+Cj4gt6LLzcqxvOQ6IDIw
MjHE6jPUwjHI1SAxNjozMgo+IMrVvP7IyzogWmhhbmcsIFFpYW5nCj4gs63LzTogemFpdGNldkBy
ZWRoYXQuY29tOyBsaW51eC11c2JAdmdlci5rZXJuZWwub3JnCj4g1vfM4jogUmU6ILvYuLQ6IFtQ
QVRDSF0gVVNCOiB1c2JscDogQWRkIGRldmljZSBzdGF0dXMgZGV0ZWN0aW9uIGluIHVzYmxwX3Bv
bGwoKQo+Cj4gW1BsZWFzZSBub3RlOiBUaGlzIGUtbWFpbCBpcyBmcm9tIGFuIEVYVEVSTkFMIGUt
bWFpbCBhZGRyZXNzXQo+Cj4gT24gTW9uLCBNYXIgMDEsIDIwMjEgYXQgMDg6MjY6MjJBTSArMDAw
MCwgWmhhbmcsIFFpYW5nIHdyb3RlOgo+ID4KPiA+Cj4gPiBfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCj4gPiC3orz+yMs6IEdyZWcgS0ggPGdyZWdraEBsaW51eGZvdW5k
YXRpb24ub3JnPgo+ID4gt6LLzcqxvOQ6IDIwMjHE6jPUwjHI1SAxNjowMAo+ID4gytW8/sjLOiBa
aGFuZywgUWlhbmcKPiA+ILOty806IHphaXRjZXZAcmVkaGF0LmNvbTsgbGludXgtdXNiQHZnZXIu
a2VybmVsLm9yZwo+ID4g1vfM4jogUmU6IFtQQVRDSF0gVVNCOiB1c2JscDogQWRkIGRldmljZSBz
dGF0dXMgZGV0ZWN0aW9uIGluIHVzYmxwX3BvbGwoKQo+ID4KPiA+IFtQbGVhc2Ugbm90ZTogVGhp
cyBlLW1haWwgaXMgZnJvbSBhbiBFWFRFUk5BTCBlLW1haWwgYWRkcmVzc10KPiA+Cj4gPiBPbiBN
b24sIE1hciAwMSwgMjAyMSBhdCAxMjowMzowMFBNICswODAwLCBxaWFuZy56aGFuZ0B3aW5kcml2
ZXIuY29tIHdyb3RlOgo+ID4gPiBGcm9tOiBacWlhbmcgPHFpYW5nLnpoYW5nQHdpbmRyaXZlci5j
b20+Cj4gPiA+Cj4gPiA+IElmIHVzYmxwIGRldmljZSBoYXMgYmVlbiBkaXNjb25uZWN0ZWQsIGRp
cmVjdCByZXR1cm4KPiA+ID4gJ0VQT0xMSFVQIHwgRVBPTExFUlInIGluIHVzYmxwX3BvbGwoKS4K
PiA+ID4KPiA+ID5XaHk/ICBXaGF0IHByb2JsZW0gYXJlIHlvdSBzb2x2aW5nIGhlcmU/ICBJcyB0
aGlzIGZpeGluZyBhbiA+b2xkZXIKPiA+ID5jb21taXQsIGlmIHNvLCB3aGF0IG9uZT8KPiA+ID4K
PiA+Cj4gPiBUaGVyZSBpcyBub3QgbmVlZCBmaXggb2xkZXIgY29tbWl0Lgo+ID4gQWZ0ZXIgdGhl
IGRldmljZSBpcyBkaXNjb25uZWN0ZWQsIGlmIHRoZSB1c2Vyc3BhY2UgY2FsbCA+cG9sbC9zZWxl
Y3QoKSBmdW5jdGlvbiwgd2lsbCBibG9jayBhbmQgbmV2ZXIgYmUgYXdha2VuZWQgLgo+ID4KPiA+
SWYgdGhlIGRldmljZSBpcyBkaXNjb25uZWN0ZWQsIGhvdyBjYW4gdGhlIGZpbGUgYmUgb3BlbmVk
IGF0ID5hbGw/Cj4gPlNob3VsZG4ndCBpdCBoYXZlIGJlZW4gdG9ybiBkb3duIGFscmVhZHk/Cj4K
PiBJZiB0aGUgZGV2aWNlIGRpc2Nvbm5lY3QgaGFwcGVuIGFmdGVyIHRoZSBmaWxlIGJlIG9wZW5k
LCBhbmQgdGhlbiB3ZSBjYWxsIHBvbGwvc2VsZWN0KCkgd2lsbCBhbHdheXMgYmxvY2tlZC4KPiBB
bHNvICBiZWZvcmUgd2Ugb3BlcmF0ZSB0aGUgZGV2aWNlLCB3ZSBuZWVkIHRvIGp1ZGdlIHRoZSBz
dGF0ZSBvZiB0aGUgPmRldmljZS4gSWYgaXQgaXMgZGlzY29ubmVjdGVkLCB0aGVyZSBpcyBubyBu
ZWVkIGZvciBzdWJzZXF1ZW50ID5vcGVyYXRpb24gLgo+Cj5CdXQgc2hvdWxkbid0IHRoZSBub3Jt
YWwgY2FsbCB0byBwb2xsX3dhaXQoKSBmYWlsIGhlcmU/Cgpwb2xsX3dhaXQoKSBpcyBub3QgZmFp
bCwgIGl0cyBtYWluIG9wZXJhdGlvbiBpcyB0byBjYWxsICBhZGRfd2FpdF9xdWV1ZSgpCgo+Cj4g
PkFuZCBub3cgeW91IGFyZSBob2xkaW5nIGEgbG9jayBhY3Jvc3Mgc29tZSBwb2xsX3dhaXQoKSBj
YWxscywgPmlzID50aGF0Cj4gPmdvaW5nIHRvIGNhdXNlIHByb2JsZW1zPwo+Cj4gVGhlICd1c2Js
cC0+cHJlc2VudCcgaXMgcG9ydGVjdCBieSAndXNibHAtPm11dCcsICB3aGVuIGRldmljZXMgZGlz
Y29ubmVjdCwgd2lsbCBhY3F1aXJlICd1c2JscC0+bXV0JywgYW5kIHNldCAndXNibHAtPnByZXNl
bnQnCj4gemVyby4KPgo+QnV0IHlvdSBhcmUgbm93IGhvbGRpbmcgYSBtdXRleCBhY3Jvc3MgYSB2
ZXJ5IHZlcnkgbG9uZyBwZXJpb2Qgb2YgPnRpbWUsCj53aGF0IHdpbGwgdGhhdCBjaGFuZ2U/Cgpt
YXliZSBhY3F1aXJlIG11dGV4IGxvY2sgd2lsbCB0YWtlIGEgbG9uZyB0aW1lLCAgYnV0IGl0J3Mg
c2FmZS4KCmFuZCBhbHNvIEkgZmluZCAgc2ltaWxhciB1c2FnZSBpbiB1c2IvY2xhc3MvdXNidG1j
LmMKCnRoYW5rcwpRaWFuZwo+Cj50aGFua3MsCj4KPmdyZWcgay1oCg==
