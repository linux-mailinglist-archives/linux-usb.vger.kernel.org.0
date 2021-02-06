Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D71C8311A08
	for <lists+linux-usb@lfdr.de>; Sat,  6 Feb 2021 04:29:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229703AbhBFD2s (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 5 Feb 2021 22:28:48 -0500
Received: from smtprelay-out1.synopsys.com ([149.117.87.133]:36504 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231858AbhBFDPj (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 5 Feb 2021 22:15:39 -0500
Received: from mailhost.synopsys.com (badc-mailhost4.synopsys.com [10.192.0.82])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id A89EEC00E1;
        Sat,  6 Feb 2021 03:14:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1612581274; bh=pAvIFqNSmkvNPJPpoaw/YZdbAkzibZUnHrtQ+9Ij8/w=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=RaMl+GzKmkqmM3TmvUcb0SRZxGEWukdYpzFsCu7VAEQY6u+TAeuPDQHlroiow+RwI
         wODmx6e5U3S6sc+wfiXS38p+QbwizZyX+z4jM33RRiee+33Wpgfr+JFIr7dPJqfANw
         kmyIVABjbeOYc4xWkxq9gkIIo0+tJp/1BxDd57h2itgaEJlSgoUNU13ucclUHmf22F
         HDAkhcpigxCd+pzHtzHKjvhg1NOtB6IeSAj4/fKj6oMNAGuPhtiHug5nLEIvWx/IuN
         iX1u5Z6u/jE4GGtUoJSls+gNrdXo+d7VlGS6YN+FNRFOMbPXb3V8FWmnonindvlpPi
         O+fspZoU3ii+g==
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com [10.4.161.137])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id 0BF33A00AF;
        Sat,  6 Feb 2021 03:14:33 +0000 (UTC)
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2175.outbound.protection.outlook.com [104.47.55.175])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "GlobalSign Organization Validation CA - SHA256 - G3" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id A6D9280214;
        Sat,  6 Feb 2021 03:14:32 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=thinhn@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="WeqiwlBV";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mHImMwcxKBx1Vvz+R7wproFotzM+isGK/EGBrElyqRhWCHbxEWUPe9SEddYyIFzqywIieOrMtarOC4+0kIJojfASbGiqB4H+w4LpThCbbyzb8QW2sDAl+FFIg/NIpQa3pGo49pKIgACom8gLh25rJelALJmvSuDobxgzLtvN0loNRd0JMa+z2Ml8ZA9TPpB27ZkxVGUngbIoZAOpywtmf9EtewggZVMcgb81wNrWUNBIy5pv4Z7GJNrHzaavES8aqNh+u903fxbWrHdC1tk/rJugaDB/iBiWYm/iQmIrmnGP77NFJ8KstQIyyUn1y0/SWPQsYYultxrA0RYW3zaL7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pAvIFqNSmkvNPJPpoaw/YZdbAkzibZUnHrtQ+9Ij8/w=;
 b=ZFfFXqQLfxLVOnn8Ea/OdThtKLRxLjSU3+e7EG4g1QtKy+Co7EMQqzZ2XEcpSiWp/xHX/ffIHzwXSy4lve8zJXRVIf02LBYMsomADB90Run21LzziLJn5EZK3QhencD75Gn5u0Wd6oGbXb+YPoOyvtMrdL4nNiLAxrDYMjf8hNcn2Dpdl2KiCELYDS9l9/W5OQ9uoRpb2q98FUoedb2rm5FuNIbGNHd/AlAsEvurcaLJ9Y/r5Cw1j773Xwm59KT6hXMEQS7McyaLxfO0ea47UyW9J11wF3mwrBq9rrdNKE54F5aDniCudvHFT2k/1t7nbUNin3wCygCgm9ycOjMXAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pAvIFqNSmkvNPJPpoaw/YZdbAkzibZUnHrtQ+9Ij8/w=;
 b=WeqiwlBVVXNQ4Q573z2HlpldlpZGdF7vTd7C3Diqfu3Bnm9R2RpXxTyam/ePK2TzpkTrRqI4rohROSkzEN0S4wI+0MRYNrWcGhAtzdLyQoBTuu6zdq8K3Bd6DQUSRElmSsBJGT+fUm4SXA78S5UccdXvBu9CihG74YvVV6LSt+A=
Received: from BYAPR12MB4791.namprd12.prod.outlook.com (2603:10b6:a03:10a::12)
 by BY5PR12MB4017.namprd12.prod.outlook.com (2603:10b6:a03:1ac::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.23; Sat, 6 Feb
 2021 03:14:30 +0000
Received: from BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::895b:620d:8f20:c4d6]) by BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::895b:620d:8f20:c4d6%6]) with mapi id 15.20.3825.025; Sat, 6 Feb 2021
 03:14:30 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Rob Herring <robh@kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>
CC:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        John Youn <John.Youn@synopsys.com>,
        Rob Herring <robh+dt@kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: Re: [PATCH v7 1/6] dt-binding: usb: Include USB SSP rates in GenXxY
Thread-Topic: [PATCH v7 1/6] dt-binding: usb: Include USB SSP rates in GenXxY
Thread-Index: AQHW7syiBCtV124o40W9FJfYBFcsoKpKIk4AgABsdYA=
Date:   Sat, 6 Feb 2021 03:14:30 +0000
Message-ID: <22957a1b-c7c3-c029-fb70-a44b4ef85539@synopsys.com>
References: <cover.1611106162.git.Thinh.Nguyen@synopsys.com>
 <cc7cc15f87e209c9963f19129f51398cdc374358.1611106162.git.Thinh.Nguyen@synopsys.com>
 <20210205204618.GA3702715@robh.at.kernel.org>
In-Reply-To: <20210205204618.GA3702715@robh.at.kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=synopsys.com;
x-originating-ip: [98.248.94.126]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: baef288e-daca-4067-c345-08d8ca4d5188
x-ms-traffictypediagnostic: BY5PR12MB4017:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR12MB4017E97DBF693613A52CBC97AAB19@BY5PR12MB4017.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1332;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: rLdJXm++kvWDvkolQ18Wd7fIPF+LfYhul7KNawU8Iuzn+TZqhMQ+XvpWaKPROEsPkY80/mna5ydSKpXiIwa9zIwyPC4uZALFbg/s1KsYT2N0PzTNRHET/EjDzji5pfrwCmhEKAxW4VHDEWtZk7AemmPlXhUNK+eLLXEQrPHNdvSMQpgaXafdhw3QPsIPzGmnMlsejA2u/gQqy5qvo6xSuKImdgL8I1snlM+y9PIHCf2Z/B5fiB6FUN5c8ghUF+9sBDv4xUvDn+qEFi+lqnk6mSMEwX+Ce194SaMfiTK7RF2ts+mDP06VVeoplXZsKCmt2gGym/41JVstZZ25BJWeNDduCw2q6NZlGk1tT2o/inHtuwrYztCjDka771IxqqbbSCfsTxjmJzPttV3j1joP3nb5kHzMZbCV9S2swja1/GAJgYWtuue5BnjyTQ7hlQfPt8jnK6GCRPOdX6Ef4objiLHq0LZfTwepfRpMZD4HOk+LDk+Gj3I/d8d9Kfpxs6WaBWrX4t1R6W2XezOq80QQgDF0WHLkJqEVgieuOqnfyAE0XwqFELxpEZ/hVUryqrc7j1Rf2qa7J4BhEwkFK2bZzsr3afohurW3B6/hqAvIbxQ=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB4791.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(6029001)(346002)(39850400004)(366004)(376002)(396003)(136003)(6512007)(316002)(83380400001)(86362001)(186003)(66946007)(76116006)(66476007)(31696002)(64756008)(66556008)(66446008)(6486002)(26005)(36756003)(71200400001)(478600001)(31686004)(2906002)(6506007)(54906003)(110136005)(5660300002)(8676002)(4326008)(8936002)(2616005)(43740500002)(45980500001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?utf-8?B?eTlCc2RmdXdjeTllam92T0JZK2pvY0ZiMVkzcjlPQUFQNTNCYlJFYjhGTEVS?=
 =?utf-8?B?VUw2T2tTc2pMTnRQcklSK3FhLzZ3c1daZkYzM0RZb2tJWVhwY0J4Z21wVWRy?=
 =?utf-8?B?b2lEVUpIVFV3UjVTVkhwTkpUN2NndE0wWlg2NUw5QWlVY3JZTFJLdTRPY2tK?=
 =?utf-8?B?QW11WDdEOUNIS2xzMDF6MWFuc3dhc3FFYVBKeGs3b3BFblk2RW1CbnJ1M3pD?=
 =?utf-8?B?QUxCQUxOWFdhankyOXFuKzFoeFpHUnNSbERFZ21LNVMxUGFENkFZalVxM093?=
 =?utf-8?B?eFgwbFZ2K0U4SFB2eGtSZmVrYkpzSjl5a2syQlo0Um5DeWU2b2s3ZFZNZElr?=
 =?utf-8?B?c0ZTQ3g1dm56OGpLcVQxRXVXQklXTjBBVzJyYlU5NXFMRHJnbDZrazkxdnBY?=
 =?utf-8?B?V1U4VXBja3BwekZzT0NTMzVzZzZQUHMraEtKL1UrSEJ6SlhKSTA4NkFZQS9N?=
 =?utf-8?B?TUhiVWd0ZGlkZUY3V1pvdVNrSzFvT1JCZEV4RGhMaEttMmZEdUp5a1lhZGtX?=
 =?utf-8?B?cVBWODBhM2tnNHlsWjVqTWRoMkZIRy9kMDdTeDNSZmhqWTc2SWl3dUZjRFgy?=
 =?utf-8?B?clJNNnpLVmdvZHhPQThLZlhOZmtaZ1hjMEZ1YVNiOTZDWjVyV2VmYXVQZ1Fl?=
 =?utf-8?B?NnZsV2d0b29PdXZuZis4RjJXZzFicUhXbk5uaTVHN0pTbWdTbUdZclB3aXRQ?=
 =?utf-8?B?MVZYd3E1Snl2eGUwc1dJTXJieE5MWVFVcW0rSUJNbzNaNVRTd3ptbjZMbXY3?=
 =?utf-8?B?eHlTeVpRbWtNNWZ5U0d4NHY5QmZFVXNGbkhKY1R1UkZ5VXI4bWovblNSSXFL?=
 =?utf-8?B?NitGK3F2eWlPTzQ0SzQ2Tm9GUUhaMVo1TTBhU24vVXhoZlNMOHErcDBLMEdX?=
 =?utf-8?B?SnFGSWdqakpyY3A2a0NGRzlzeUU3azdRT2toVkRJL29hT3JMbVk5RHpLMVFw?=
 =?utf-8?B?YlVoOU5LYWlsazZCYVNoWjU1cUFSdWZHYU9rZkg3am1TbXBFZk5YTlpwV2JK?=
 =?utf-8?B?M2prM3QySUlCN2xPMFdQbWQrd1oxZkhYUEFsWmVhQUVvOWEvZlA0WFpTKzht?=
 =?utf-8?B?RWtEakNMS3lZRWR6MGtueGZJNFVGTVRIeG53ckFNTG1xYUVTRVh1bG5aWVNv?=
 =?utf-8?B?V1I2ZEpyRU51TzhLMEJDNkR6YnlZRlZkallCdzY2b0hHb1JJVDFJcy84Z2JF?=
 =?utf-8?B?M3daUyt5ZFZUa2p6MGcvcEl2UEJSRkJyaHNDZ3ZNblYrNW50T1hDU3N4ckpz?=
 =?utf-8?B?QzBvdERxUjZkbk9lblBaNG92RUNORFg3UlMxSTQ3V0FVV1doMVlMVWREWTRO?=
 =?utf-8?B?b3d3Rm5JSXFLL0dBajdISVhCczFqL1FIRGhmZXZTL3pGNHJyTEQwVGZPQ0Jr?=
 =?utf-8?B?R2p2OVU5OER6SUJINXFWNlpNL3VHeEJLNC9tVlBKc0FnYytKaGFjV2R5aW9J?=
 =?utf-8?B?NTA3SkFUY05XUktwRDNEdmtMd05mdldDUS8zYmZuaHZCdHNUOXZ4MnFrNnVu?=
 =?utf-8?B?V3gwazZGUWRTVjd4TXRNSDVTMlh6RHM3anFuMUtXZzlaTU1XL3ZMc0hZUCtl?=
 =?utf-8?B?TjR5V2oreXFwSno3ZTZKMHU1ZWordlVQRTlsZ3Y1cmcveVlkNWJUamYrS2dU?=
 =?utf-8?B?L1FJd3dMUTBWb0RuczdsdmVtbk1BUFFaa28rczNHMytqd09sTG0vT3QzVXFi?=
 =?utf-8?B?dGFCUStjTTJWY3FqK3dES0xFeU1CbWxTMmNSSkxhaUpyRXM1b3BOdTVubith?=
 =?utf-8?Q?J+BdR3QmJgJ4dYSyxA=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5AB4CA7FDBCF77449EC9C436EA6001B3@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4791.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: baef288e-daca-4067-c345-08d8ca4d5188
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Feb 2021 03:14:30.0416
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4gbtBwQr8g2gQpAlowBR+oemB7/srRWDf6nb4Pxgw6bjvtvJTEkBG40JMWPX2lEfsYeSOAR+FjbHr7G8xvo0Ew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4017
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Um9iIEhlcnJpbmcgd3JvdGU6DQo+IE9uIFR1ZSwgMTkgSmFuIDIwMjEgMTc6MzY6MDggLTA4MDAs
IFRoaW5oIE5ndXllbiB3cm90ZToNCj4+IEFjY29yZGluZyB0byB0aGUgVVNCIDMuMiBzcGVjLCBh
IFN1cGVyU3BlZWQgUGx1cyBkZXZpY2UgY2FuIG9wZXJhdGUgYXQNCj4+IGdlbjJ4MiwgZ2VuMngx
LCBvciBnZW4xeDIuIElmIHRoZSBVU0IgY29udHJvbGxlciBkZXZpY2Ugc3VwcG9ydHMNCj4+IG11
bHRpcGxlIGxhbmVzIGF0IGRpZmZlcmVudCB0cmFuc2ZlciByYXRlcywgdGhlIHVzZXIgY2FuIHNw
ZWNpZnkgdGhlIEhXDQo+PiBjYXBhYmlsaXR5IHZpYSB0aGVzZSBuZXcgc3BlZWQgc3RyaW5nczoN
Cj4+DQo+PiAic3VwZXItc3BlZWQtcGx1cy1nZW4yeDIiDQo+PiAic3VwZXItc3BlZWQtcGx1cy1n
ZW4yeDEiDQo+PiAic3VwZXItc3BlZWQtcGx1cy1nZW4xeDIiDQo+Pg0KPj4gSWYgdGhlIGFyZ3Vt
ZW50IGlzIHNpbXBseSAic3VwZXItc3BlZWQtcGx1cyIsIFVTQiBjb250cm9sbGVycyBzaG91bGQN
Cj4+IGRlZmF1bHQgdG8gdGhlaXIgbWF4aW11bSB0cmFuc2ZlciByYXRlIGFuZCBudW1iZXIgb2Yg
bGFuZXMuDQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTogVGhpbmggTmd1eWVuIDxUaGluaC5OZ3V5ZW5A
c3lub3BzeXMuY29tPg0KPj4gLS0tDQo+PiBDaGFuZ2VzIGluIHY3Og0KPj4gLSBSZWJhc2Ugb24g
R3JlZydzIHVzYi10ZXN0aW5nIGJyYW5jaA0KPj4gQ2hhbmdlcyBpbiB2NjoNCj4+IC0gVXBkYXRl
IHRoZSBkaWZmZXJlbnQgbWF4aW11bV9zcGVlZCBlbnVtcyB0byB0aGUgdXNiLnlhbWwNCj4+IC0g
UmVtb3ZlIFJldmlld2VkLWJ5OiBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3JnPiBiZWNhdXNl
IHRoZSBjb21taXQgaXMgdXBkYXRlZA0KPj4gLSBSZWJhc2Ugb24gR3JlZydzIHVzYi10ZXN0aW5n
IGJyYW5jaA0KPj4gLSBVcGRhdGUgY29tbWl0IG1lc3NhZ2UNCj4+IENoYW5nZXMgaW4gdjU6DQo+
PiAtIEFkZCBSZXZpZXdlZC1ieTogUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9yZz4NCj4+IC0g
UmViYXNlIG9uIEZlbGlwZSdzIHRlc3RpbmcvbmV4dCBicmFuY2gNCj4+IC0gQ2hhbmdlZCBTaWdu
ZWQtb2ZmLWJ5IGVtYWlsIHRvIG1hdGNoIEZyb206IGVtYWlsIGhlYWRlcg0KPj4gQ2hhbmdlcyBp
biB2NDoNCj4+IC0gTm9uZQ0KPj4gQ2hhbmdlcyBpbiB2MzoNCj4+IC0gVXNlICJtYXhpbXVtLXNw
ZWVkIiB0byBpbmNsdWRlIGJvdGggdGhlIG51bS1sYW5lIGFuZCB0cmFuc2ZlciByYXRlIGZvciBT
U1ANCj4+IC0gUmVtb3ZlICJudW0tbGFuZXMiIGFuZCAibGFuZS1zcGVlZC1tYW50aXNzYS1nYnBz
IiBwcm9wZXJ0aWVzDQo+PiBDaGFuZ2VzIGluIHYyOg0KPj4gLSBNYWtlICJudW0tbGFuZXMiIGFu
ZCAibGFuZS1zcGVlZC1tYW50aXNzYS1nYnBzIiBjb21tb24gVVNCIHByb3BlcnRpZXMNCj4+DQo+
PiAgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3VzYi91c2IueWFtbCB8IDMgKysr
DQo+PiAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKQ0KPj4NCj4gUmV2aWV3ZWQtYnk6
IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+DQoNClRoYW5rcyENClRoaW5oDQo=
