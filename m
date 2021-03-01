Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1A172327A24
	for <lists+linux-usb@lfdr.de>; Mon,  1 Mar 2021 09:58:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233696AbhCAIzy (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 1 Mar 2021 03:55:54 -0500
Received: from mail-mw2nam10on2041.outbound.protection.outlook.com ([40.107.94.41]:13665
        "EHLO NAM10-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S233434AbhCAIyZ (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 1 Mar 2021 03:54:25 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gPMgQnj2eGFnGAlrQvdxJY5vzdHGhosV5CLDa0qhi7S+pAVCLVUnryYZ8dNVsorheW4lkx9LIYSsn3mkWnCrO/fAmSbQLZGuHuNqAvlCgU9aZUHOETiIICq7fd7lpQnZY5t9Hs9YujxJI9jyhIUltHLlur+rxZZRjlbKA8eQhOY+iG4FtwyNXMKMp/JfElyrZzI8VGxLmJk1qpUcXZXPvzIwQYfaQMDl27Xdb4JjOD1bPLjqqRG1kLpVO5D6mkLIXoi+3okDWj4HwbSeHAXaQjiiQAwuOr2EadjOPfYwjdt11PLFpUshWy1crWdn3VEDPJdF3uhqjmplqetU/nBcBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uXM81gEsy8MpIhRiV9X5Gn0ZjP3nK1yUyMP50FYJyS0=;
 b=Ruse84fWl08iugGI0vrFqYK8dEsIeAE2NhfU7J/Y5eLEp/f3dDxU9iRltls9tmaSK53LCoCzinxLIcqoxMYL4B8gyXGmhZRSXGvHv2WGLnPhTOPJAm6btMkYB9+9KheD+toMRYGY2Q51vGieQR0SrLlIkAbFTLSpTpDZEinABYMqpvsJq7i+cGmmtdXE3M1P1r4m3yxxirf25twbXcMUQAN/4iRU7q4FFDMAigEDVeMkLwPdsFawHUBCYgXDKUoCBnbg18bAq0fhoKPd6tEYTTpMK3v4UG+oWbyvrwkPdc2+URDBdPr4nwhc0Ikl2VhXtLe97hlmUadjDbmhV/5fOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uXM81gEsy8MpIhRiV9X5Gn0ZjP3nK1yUyMP50FYJyS0=;
 b=RuU94f8W7DrRQcsxj++Fa/MMRpW6pWuv2U5t30L2iIvbJwiTrbvtusOc3NXF1pBUS+X5MOQuC8b5dcSbQA7zKIh9/kc9gczNDl75Zjs+OADb/RnrsSULR6C2rEzouRPDQVPyVOx6v3vqfvbsewa7cebZLK5QX5SnZIBCQ+XNQWU=
Received: from BYAPR11MB2632.namprd11.prod.outlook.com (2603:10b6:a02:c4::17)
 by BYAPR11MB3672.namprd11.prod.outlook.com (2603:10b6:a03:fa::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.28; Mon, 1 Mar
 2021 08:52:58 +0000
Received: from BYAPR11MB2632.namprd11.prod.outlook.com
 ([fe80::89a3:42c3:6509:4acd]) by BYAPR11MB2632.namprd11.prod.outlook.com
 ([fe80::89a3:42c3:6509:4acd%4]) with mapi id 15.20.3890.028; Mon, 1 Mar 2021
 08:52:58 +0000
From:   "Zhang, Qiang" <Qiang.Zhang@windriver.com>
To:     Greg KH <gregkh@linuxfoundation.org>
CC:     "zaitcev@redhat.com" <zaitcev@redhat.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: =?gb2312?B?u9i4tDogu9i4tDogW1BBVENIXSBVU0I6IHVzYmxwOiBBZGQgZGV2aWNlIHN0?=
 =?gb2312?Q?atus_detection_in_usblp=5Fpoll()?=
Thread-Topic: =?gb2312?B?u9i4tDogW1BBVENIXSBVU0I6IHVzYmxwOiBBZGQgZGV2aWNlIHN0YXR1cyBk?=
 =?gb2312?Q?etection_in_usblp=5Fpoll()?=
Thread-Index: AQHXDk20+BdPbRjrkkqRIs2SLfiV1apuxV6AgAADMfyAAAXOgIAAAZ3l
Date:   Mon, 1 Mar 2021 08:52:58 +0000
Message-ID: <BYAPR11MB2632AE1A6D78903112F86062FF9A9@BYAPR11MB2632.namprd11.prod.outlook.com>
References: <20210301040300.20834-1-qiang.zhang@windriver.com>
 <YDyfL/yg9QNM4nku@kroah.com>
 <BYAPR11MB263268B5FD6EB3C3B80B63FBFF9A9@BYAPR11MB2632.namprd11.prod.outlook.com>,<YDymu1AlS+8UjdXG@kroah.com>
In-Reply-To: <YDymu1AlS+8UjdXG@kroah.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linuxfoundation.org; dkim=none (message not signed)
 header.d=none;linuxfoundation.org; dmarc=none action=none
 header.from=windriver.com;
x-originating-ip: [106.39.148.172]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ef7fc1ad-6fbc-4eb3-b39a-08d8dc8f69d7
x-ms-traffictypediagnostic: BYAPR11MB3672:
x-microsoft-antispam-prvs: <BYAPR11MB36723DDF8AEEB270ADB5D155FF9A9@BYAPR11MB3672.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2657;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /ySpNU7QETbQCp4iJo5QRH7kKvNeHbg4zXsjGv92rX/z/sjc3GIGL/l9fVwjb0TeoscTIvCAjVgD2SAcPQGQHhFbGTDxBSGCXOYDv6L5tK1tucmYlZQuiaUKeI1ZfdSusgdZTDNAa+hpCXecPIYZUnPn1+lBaiDlBtXXePHCGrT6eUnTvnGwsRdc4oTAg8SIgDwpsvXumsSbPKo+i14Y4w+R6BLMNlYryZKusg5auxEEX2VvZWU0zPAalhSVeei/OvF6LVxZygGV6a+YFOW1gQ2qAS01gc01LGNMV5bb2aS+lPudJ5Wj8QU+gVKO4egD11BU+gYddn3M0YYU+PTsLQYpDCINBq4nrEzzwQF0lrJuwnh7v7QuEAXgKX3FlkfgPhgeJwocg7OW7jPyl/OhCheEdzGch3WdwtUvvwCqwkN1hdoInuFYPsv1S8o+N6nyrNWL7irSIdy0Z7u7XBTSzrABV1rC8IDs4UkJOSqxCSS7ui0dHStSvQHUZtY1IqfcO38VJ3gEjBMgXdlu1mK+lQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB2632.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(39840400004)(366004)(396003)(376002)(346002)(66946007)(66556008)(76116006)(91956017)(8936002)(224303003)(71200400001)(186003)(66446008)(6916009)(52536014)(64756008)(4326008)(26005)(66476007)(5660300002)(7696005)(2906002)(478600001)(86362001)(9686003)(55016002)(33656002)(6506007)(316002)(54906003)(83380400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?gb2312?B?c3BTZlJvS21yLzJNZG90VEZLWGd6NklQZHNLV0Z0MGNtWDRZcmRrelFNWmlR?=
 =?gb2312?B?YktrbnZZdWJGQmszbnRsYWlCY3dOSktPOVN6NC81SzZjNTkwNnN3Q1lIcWpa?=
 =?gb2312?B?ajRyNFY1b0c4clkzenhJQnFud3FHZVZYUmc5SWdNNU5rSlk5ci9kLyt0TVRv?=
 =?gb2312?B?V093UVA4R3B2VytJeldaMFVoQjc2T2tpcFZBc290c0k4eDZOV1gxbGpJWkJ1?=
 =?gb2312?B?bUdxUytiWjFEWTZDNUZjdjlXSS9IeFNGbEtLNVprUzZBY1RrREFScXNncHdK?=
 =?gb2312?B?N1NUT1Izdi9sT083MWFZZUVtbTNCL3BGR1YvYU1hVzdmUE5mVGxaMGNXTWxB?=
 =?gb2312?B?Y2h5K09BWlNzVG05azhjMWVuc0Z3QlR6Q0M4SkdSWWZpRHArMm1HcXdrcFo1?=
 =?gb2312?B?VGtyK09SdCs3dU5qM0NkSU5NNDVYUnBJRWVVRlZZbXdPQTFpQWJUSGJBc00x?=
 =?gb2312?B?UzdnU2JoWHZsMjU1cDgwYUZsQWE5RytxdzFzREwza0VNbElXbmprcWhjWTBp?=
 =?gb2312?B?djJOU2FhNTB4VDJtY09rRjNGNTA5ZTJwYk1MTlFtWXlpRzUrSHpmR3UyQUpj?=
 =?gb2312?B?SmlPNUZBQjYzK3EwS3J5eVV3em0yZGlxZ0ZmQnNTT3hGWFhvdkxmK2NHSG5y?=
 =?gb2312?B?d2VOeVVNU2oxNzhtSk1uOVlDY05scm9YOTBua3VvNGdNUWZmUXVBSGRnQjV4?=
 =?gb2312?B?SVorTmRNZWhITGZFTVlLU25qT04wdEFlUURiNjR5RFpaWWxGTmVuNkJocWdY?=
 =?gb2312?B?NlQ1ZUs4NmtnNm84NStENG1PbTdyejBQMno4RXdlUTdJQ0ErYXhpeEo4WWRt?=
 =?gb2312?B?bzhGL2JDUGJ1UHk0YktqNVEwd2ZRRnM1WnQ3eHlTVFY2QWhuN0c3UGhORklP?=
 =?gb2312?B?SERLZVlQaUtTamYwczB1RHAyajlvelMvbFhwWXZLWWdSL1NBV2FlWCtRRE42?=
 =?gb2312?B?NkRSa2VkdFVwRWU5QUdvNjBxdjE4ek4vN200aU1QaUhjSGNNSHN3Z2hvTkp2?=
 =?gb2312?B?RWU3eWpIc1ZDbjZzbnNiaDFlODI0bit6alVVVGRBN0xPcHRkU1k5b1NCcVdS?=
 =?gb2312?B?bEtUU05wdGdWSWxRcVFpZlFwMW5BU0ZOMU0rRjBrTzdQM2hEeVUrd09zSjVp?=
 =?gb2312?B?RzJXUmdBQkNJRVdvSkRtaFBGdDZHc0krU3g1Y2RFWEc0RHdxdFZmalBaUjBv?=
 =?gb2312?B?ZWM2TWsxcXpERis3ZmlxOVp2NzRjcnliZ2hEYTFhV3Z6Qi94RTJma2tnUzNH?=
 =?gb2312?B?dWdVbk9aWnVEOGlmdmU4ek5US3VxL3hUa2NvZEJEVmdXWmlUcnFOclpsUStQ?=
 =?gb2312?B?MVloME8yU2RoaHBobGlZNmx2NVM5a2c5QytXc1hVQ1FFV3ZDL044SmlVLzI3?=
 =?gb2312?B?TGwrbU50Tk9yY3Vpb3VodFZYYnc2K09DUCs4N2lZTjNmbzhoKzJEamsreEcw?=
 =?gb2312?B?WXB1Vk4zY0lJNVNOS3lLV3R3OHhkR2VoUitORWk5YXZ0bVBPTVBtMDJLVjVX?=
 =?gb2312?B?bjFadFdnb2h2SklhY3l1Slp5OURwN09LTnYyK0ZETW8wckRtek0xY0ZOYUVy?=
 =?gb2312?B?S0hhR2ZWakpCOUpLSzlRVEpIOFZuNmwxaVNWMEV0ZVpCU2ZwNUlkTitUU3hI?=
 =?gb2312?B?RktwSlpiUWszUCswY29JZGY2WFdHd2pWdDkrV2FJNEhtWi9ZZGtKVllGa1dl?=
 =?gb2312?B?RzlpakduazY0Q3BYZ3dCdThoZGF6U2I0Rkg2SmNRTTEydU50ZS9mWnd0S3ZK?=
 =?gb2312?Q?UW8wT6hYkk02o4yTU4=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2632.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef7fc1ad-6fbc-4eb3-b39a-08d8dc8f69d7
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Mar 2021 08:52:58.3675
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uPgdeGBZSbndeEsynqQSsJcM3g4jxiDiAQ9aAmYjan2A2GyxNK63Eh0jQPAQ16AZxH9zu5icFpHqpaq2llLN0tonYXPZovUtJpOVGOobHlE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3672
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCreivP7IyzogR3JlZyBL
SCA8Z3JlZ2toQGxpbnV4Zm91bmRhdGlvbi5vcmc+Creiy83KsbzkOiAyMDIxxOoz1MIxyNUgMTY6
MzIKytW8/sjLOiBaaGFuZywgUWlhbmcKs63LzTogemFpdGNldkByZWRoYXQuY29tOyBsaW51eC11
c2JAdmdlci5rZXJuZWwub3JnCtb3zOI6IFJlOiC72Li0OiBbUEFUQ0hdIFVTQjogdXNibHA6IEFk
ZCBkZXZpY2Ugc3RhdHVzIGRldGVjdGlvbiBpbiB1c2JscF9wb2xsKCkKCltQbGVhc2Ugbm90ZTog
VGhpcyBlLW1haWwgaXMgZnJvbSBhbiBFWFRFUk5BTCBlLW1haWwgYWRkcmVzc10KCk9uIE1vbiwg
TWFyIDAxLCAyMDIxIGF0IDA4OjI2OjIyQU0gKzAwMDAsIFpoYW5nLCBRaWFuZyB3cm90ZToKPgo+
Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+ILeivP7IyzogR3Jl
ZyBLSCA8Z3JlZ2toQGxpbnV4Zm91bmRhdGlvbi5vcmc+Cj4gt6LLzcqxvOQ6IDIwMjHE6jPUwjHI
1SAxNjowMAo+IMrVvP7IyzogWmhhbmcsIFFpYW5nCj4gs63LzTogemFpdGNldkByZWRoYXQuY29t
OyBsaW51eC11c2JAdmdlci5rZXJuZWwub3JnCj4g1vfM4jogUmU6IFtQQVRDSF0gVVNCOiB1c2Js
cDogQWRkIGRldmljZSBzdGF0dXMgZGV0ZWN0aW9uIGluIHVzYmxwX3BvbGwoKQo+Cj4gW1BsZWFz
ZSBub3RlOiBUaGlzIGUtbWFpbCBpcyBmcm9tIGFuIEVYVEVSTkFMIGUtbWFpbCBhZGRyZXNzXQo+
Cj4gT24gTW9uLCBNYXIgMDEsIDIwMjEgYXQgMTI6MDM6MDBQTSArMDgwMCwgcWlhbmcuemhhbmdA
d2luZHJpdmVyLmNvbSB3cm90ZToKPiA+IEZyb206IFpxaWFuZyA8cWlhbmcuemhhbmdAd2luZHJp
dmVyLmNvbT4KPiA+Cj4gPiBJZiB1c2JscCBkZXZpY2UgaGFzIGJlZW4gZGlzY29ubmVjdGVkLCBk
aXJlY3QgcmV0dXJuCj4gPiAnRVBPTExIVVAgfCBFUE9MTEVSUicgaW4gdXNibHBfcG9sbCgpLgo+
ID4KPiA+V2h5PyAgV2hhdCBwcm9ibGVtIGFyZSB5b3Ugc29sdmluZyBoZXJlPyAgSXMgdGhpcyBm
aXhpbmcgYW4gPm9sZGVyCj4gPmNvbW1pdCwgaWYgc28sIHdoYXQgb25lPwo+ID4KPgo+IFRoZXJl
IGlzIG5vdCBuZWVkIGZpeCBvbGRlciBjb21taXQuCj4gQWZ0ZXIgdGhlIGRldmljZSBpcyBkaXNj
b25uZWN0ZWQsIGlmIHRoZSB1c2Vyc3BhY2UgY2FsbCA+cG9sbC9zZWxlY3QoKSBmdW5jdGlvbiwg
d2lsbCBibG9jayBhbmQgbmV2ZXIgYmUgYXdha2VuZWQgLgo+Cj5JZiB0aGUgZGV2aWNlIGlzIGRp
c2Nvbm5lY3RlZCwgaG93IGNhbiB0aGUgZmlsZSBiZSBvcGVuZWQgYXQgPmFsbD8KPlNob3VsZG4n
dCBpdCBoYXZlIGJlZW4gdG9ybiBkb3duIGFscmVhZHk/CgpJZiB0aGUgZGV2aWNlIGRpc2Nvbm5l
Y3QgaGFwcGVuIGFmdGVyIHRoZSBmaWxlIGJlIG9wZW5kLCBhbmQgdGhlbiB3ZSBjYWxsIHBvbGwv
c2VsZWN0KCkgd2lsbCBhbHdheXMgYmxvY2tlZC4KQWxzbyAgYmVmb3JlIHdlIG9wZXJhdGUgdGhl
IGRldmljZSwgd2UgbmVlZCB0byBqdWRnZSB0aGUgc3RhdGUgb2YgdGhlIGRldmljZS4gSWYgaXQg
aXMgZGlzY29ubmVjdGVkLCB0aGVyZSBpcyBubyBuZWVkIGZvciBzdWJzZXF1ZW50IG9wZXJhdGlv
biAuCgo+Cj5BbmQgbm93IHlvdSBhcmUgaG9sZGluZyBhIGxvY2sgYWNyb3NzIHNvbWUgcG9sbF93
YWl0KCkgY2FsbHMsID5pcyB0aGF0Cj5nb2luZyB0byBjYXVzZSBwcm9ibGVtcz8KClRoZSAndXNi
bHAtPnByZXNlbnQnIGlzIHBvcnRlY3QgYnkgJ3VzYmxwLT5tdXQnLCAgd2hlbiBkZXZpY2VzIGRp
c2Nvbm5lY3QsIHdpbGwgYWNxdWlyZSAndXNibHAtPm11dCcsIGFuZCBzZXQgJ3VzYmxwLT5wcmVz
ZW50Jwp6ZXJvLiAKClRoYW5rcwpRaWFuZwoKPgo+dGhhbmtzLAo+Cj5ncmVnIGstaAo=
