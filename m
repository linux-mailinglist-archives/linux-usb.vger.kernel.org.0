Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 49EEB3F1029
	for <lists+linux-usb@lfdr.de>; Thu, 19 Aug 2021 04:01:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235556AbhHSCCG (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 18 Aug 2021 22:02:06 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.73.133]:33238 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235541AbhHSCCF (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 18 Aug 2021 22:02:05 -0400
Received: from mailhost.synopsys.com (us03-mailhost2.synopsys.com [10.4.17.18])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 4D4FC40C1E;
        Thu, 19 Aug 2021 02:01:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1629338490; bh=sqSzC4bGyMgoWMVxRbP1G2D3uiZfUIlj/YTFfy7PL34=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=elY0H4vFSh8GxH+WFp86W+aaRP1wL/AqJ45Av5r3fP7bv2O+0hrgZHSsp+pzwCFNk
         nhVyiuEu3+Kqd9TNHOWlLDiB1igzNJ7/wx0nU+B5G05dZtVZdImYQWmA9VB1Ymr2z9
         L6+2B7Z/BU59fmE0ot/RfonhI24lRcF/F8cMdVNYvuACmzct1cXOnnuxJRp+67miET
         XL0gjLR8hf4pDyHRW4OBcGd6Q+FdO859pOdq9OimlmCwjMdQlyrzSig1aziIbtM8Mm
         polJnLtnsCj5MfPsYrLgakd9m95Wb/je9XGQf3MiVcFRUK82i+DJqo5YjjlZEaVxeT
         4nUnJAcy8Z0kw==
Received: from o365relay-in.synopsys.com (sv2-o365relay3.synopsys.com [10.202.1.139])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
        by mailhost.synopsys.com (Postfix) with ESMTPS id CC54BA00A0;
        Thu, 19 Aug 2021 02:01:26 +0000 (UTC)
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam07lp2044.outbound.protection.outlook.com [104.47.51.44])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id 74DD3400CD;
        Thu, 19 Aug 2021 02:01:24 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=thinhn@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="ehCPWKB0";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ISPd1eIiY2jMDgR9bzQkvKUSoHf2Y8L9fcH/vT+mrngNQEHIvCA/VGCt90+PwClB5+uAj+5Wo/YqrJMAhbPdPb5xVg2NYxbgx1rgSIXJhtnDXAAcWVRgnoVti0ERObLEwrmw0//hsnmKBuKFYQYG2pSsbE9zC9pGMkL6s5cTSExxOC4n6soaApadH8S0nmb4n8JCkoZN24Fx8YuOSQ3Czdyd0srYpTahhVzkhMchn8t6LAv9M+s4y9vlD7AG+1uV2444f+ar9Up6nURkzgCJg3cN6+az2lnPNKFsSGii63arE6HT3CetH7RQf+TDDq8BADDaYDgnWZLIkNZvDXjv4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sqSzC4bGyMgoWMVxRbP1G2D3uiZfUIlj/YTFfy7PL34=;
 b=jZ91cTAC5KMaPyH5kWjMqk+Z5opR+/QadKEySL0hLYol4bi+FgPxipkMkcx5KUtG8xNfBVOq8NK0x80/5adHc/VlmpKOgPK5l0aqXiDtjbjNaIJ8zwBLDcB5cg07avturdNTLlByCSFUvwpXgmrrVU2hlBsHr+eo/VZKKB5z+EvGQGjPhk2nEdUdWjcM8YhYvLXUAObbWKnB8zhOx8Huzbj1D3ozdKIv1vsENgQui3PI3DeOnAwo8+iXXJw1dDNPfcxw9FCVmPEdAzhAwrYPhOuon+bmMti9MOAIqLpVvc4EwLCNaBZ4Cu07UierCFEXT35mTHqhL2x6T2tsxpYEsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sqSzC4bGyMgoWMVxRbP1G2D3uiZfUIlj/YTFfy7PL34=;
 b=ehCPWKB0ecqvG+5ZVzuCs7eg8QJbdOaP0qbi/cCxLc5sv5Y3y8pqa5o+6ZH/JgcYo61lUFZo0ix18vIHJOJce//h28eIJQvpd70Ds/J6yWkhoLl9KrHnAN2HZO8HLJ7NVhnZKW7crHTEkVKlHK7+QWx4vuLl09yk6AuE+lQZ3jg=
Received: from BYAPR12MB4791.namprd12.prod.outlook.com (2603:10b6:a03:10a::12)
 by BY5PR12MB3923.namprd12.prod.outlook.com (2603:10b6:a03:194::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.19; Thu, 19 Aug
 2021 02:01:22 +0000
Received: from BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::163:f142:621e:3db9]) by BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::163:f142:621e:3db9%7]) with mapi id 15.20.4436.019; Thu, 19 Aug 2021
 02:01:22 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Jack Pham <jackp@codeaurora.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        John Stultz <john.stultz@linaro.org>,
        Amit Pundir <amit.pundir@linaro.org>,
        Ray Chi <raychi@google.com>, Ferry Toth <ftoth@exalondelft.nl>,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Li Jun <jun.li@nxp.com>
CC:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Wesley Cheng <wcheng@codeaurora.org>
Subject: Re: [RFT][PATCH] usb: dwc3: Decouple USB 2.0 L1 & L2 events
Thread-Topic: [RFT][PATCH] usb: dwc3: Decouple USB 2.0 L1 & L2 events
Thread-Index: AQHXj1PTynbNieaTs0SqQhL75IpjHat4gi6AgAGbYIA=
Date:   Thu, 19 Aug 2021 02:01:21 +0000
Message-ID: <7c39566b-08be-28bf-55c4-70c01d41b4d0@synopsys.com>
References: <20210812082635.12924-1-jackp@codeaurora.org>
 <20210818012859.GB30805@jackp-linux.qualcomm.com>
In-Reply-To: <20210818012859.GB30805@jackp-linux.qualcomm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
authentication-results: codeaurora.org; dkim=none (message not signed)
 header.d=none;codeaurora.org; dmarc=none action=none
 header.from=synopsys.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 64cb0554-782b-4a7d-3d50-08d962b53e21
x-ms-traffictypediagnostic: BY5PR12MB3923:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR12MB392359FDE7C84E60D50D665BAAC09@BY5PR12MB3923.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 7KZUEyHnB/W/lNgR7z6dMI5Pjja4C7PJyeZ2Z75Vdnk5jAKVxDVAw7Nn08dUCv7sCzdWrl2EeeRsA7dyU22+6ICCk0iaLS1DJQxoeJxjV1ZjWs+3CbRmLvFCB0vyUtszpQW4qDnjiPrgeyj7ski6eLM6fn+p1DHdd4C55CW0REGHFFMTsbkkdUHzr7QIc0X54CS5LmFku9jsSnyyzp5CnyMJmB13SR8RBAiJwBzGoxGPpjvWS66fRysySA+yb8fZn/oNKapVVTTOV5W+WXTpuveSjPneRirjOfx6fwwuHfHxx1a49I+3ckEJ3GFCcr7S5M85w5ml7PYzAmS0QNTUUyK0YIHxoK6htd5Q4R2bajh+tT/qeyUTeq9CgSRPUxFTaqbDQ+lactu9vvnbgolJE0SvXHkNcEchR+DYXSa0XgrPqxl9iuqQsmUWAAERF2jqISRzlhwr0mjR2+vD+JnrblQ9qStZ7og2aETTByPUatwrfiBhyNJ1PtBf1tFEiQYakXtPtFyQKc9ZPlDz5tcDwMPo7ZUwCA77GkA4+O+sdfzH0dyDqKsugde6sNmH2/xkm/bsIduAIy3oZh1WCVE2KyaO/Hqi96bqSMzZam3UG25azrwviFjFqHYVt+eSv+sjbu94l8G7polSVb2WmByLXTtJ8yMA8Fy7OgfGiHdMFTOQSAU+nIuQVfkiakFd99WlfIB809vCzN1hSbsngCDqRtMISuF7ffpCr7tcmO08REaF1SAykJTUEvPzjEE4HwS+Q9oMxvvn2VDwJDce/rHs79WM2Nw3YDbs2XcEGM7zP7A=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB4791.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(38070700005)(6486002)(122000001)(31696002)(2906002)(38100700002)(921005)(6506007)(2616005)(8676002)(83380400001)(66476007)(64756008)(66556008)(66446008)(86362001)(76116006)(66946007)(6512007)(71200400001)(5660300002)(8936002)(4326008)(7416002)(508600001)(316002)(36756003)(54906003)(26005)(186003)(110136005)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NXBwaXNnMWEwMWh4OThKais1MCttZ2p3MUpiNnp6ZnFiKzVMWjh0bVI0SVFV?=
 =?utf-8?B?RStnaGtWVjhwczNzNkFNY3grWkpEa1U5aFZoaC8rNHJzZlY5bTFtOXhHRUdz?=
 =?utf-8?B?OHBRbUt2d01QMW44eDJOb3pjRXRNZ0tLL0N3bkNGb25tdDg1K1gzcDlHUDdY?=
 =?utf-8?B?SEU4aVl5eStBTEtXRTRIeG5KbGI1RDhaTVQ4dGhzRnlCcTBvMkJnWXU2bXpK?=
 =?utf-8?B?emZTeDdSY3FSR2lNbU5mTkFLdGExTGxFUmdDUGNBcEZKVjRsYmxZY0dFV1Bo?=
 =?utf-8?B?Y05FMi9BaTlwNlBYTjZJblc5aEUwWlVyRExneFdEWE1iN25OQ05jU1dUSE1u?=
 =?utf-8?B?SFRvNCtJaHVhZ1hZV2ZhQTlqYmtNZUlwekwzdU5IWEZyYTdLSUlLc1piTWpM?=
 =?utf-8?B?MTl1M2xPT25sbHNiYy9Dc2V1YVFybTNHYURmRWoveFhxbEl4b0NkQVZCWXNs?=
 =?utf-8?B?T0daUzBwQ2ZRa3FyUlRlemxZdEtYNnY2ZGMwL0NLbXJSMUdTVk9GRVUvQVJ4?=
 =?utf-8?B?U2FFS3MxRkxHQ29KS091ZlJFL1lJNXNTYU9TSDFFemF1TnJ1MTRMMGs4SW11?=
 =?utf-8?B?MTQvYzc0OWlFd3NLV0swaHhCMkZGUmRTbjJZYUdwWFM2Z0M1YU51QjB0Z1pl?=
 =?utf-8?B?SWxSZ3hZcHcwQUFENWpSL3owdElZWFUvby9CMk9EWWRGZkJkVEE1R1R4NGxG?=
 =?utf-8?B?U0h4eHoxVVdpd2FEUWNBMWpIeDVPRWRwUnFSQ1A4Q3VFbjM2TU1oY1ErMjUv?=
 =?utf-8?B?V0swUkVUZlgwTjNDL083elhQSnJXck9VRCtrcWpDblJVQU5CQ24xSWd4T3li?=
 =?utf-8?B?bVFmTTBEdWErblNjUzZ6MjgwM05TeTdSazZ0b1VtU1JYTm1lcnNiUUdUVy9i?=
 =?utf-8?B?TVRFUmR5SWVPR1hJTVV6RHYzVVNEcTYyazJscld4WmJGaWE1Q2loV3NSVXlP?=
 =?utf-8?B?ZzF4b015ejhqcWE5U2l3M3pSdVFmV2F4ZFVmb0JPTENpVzJmc2pWREt5OTRB?=
 =?utf-8?B?WkI2aXN0dnYvenZ6UmV3bXRFZCtSSUZENHoxTjZQTkNrZzBOT0RjZWF1VU94?=
 =?utf-8?B?YlZlZlRNMVJvc2Q4cDE4T3d5SU9HYmtGZ0VPRktnVTMya1ppdmR1UHpDN2p3?=
 =?utf-8?B?aXNIRmhyS29PeUZyMGw5N3hUNHR4SnRhVFN3Z2srUVZMMDBWSlJhdEFmU3U5?=
 =?utf-8?B?TWZ0NWlzUXpONU9EYmdRSnk2QUR1ODRhbWkveW1SQ0xIemVuMG92V0Z1dXhX?=
 =?utf-8?B?OG1VLzRZVTlmbGpFbmVlTGVqL09iSTh5VEo5Ukp1K1o1UDB6NDh5ejRtTUtv?=
 =?utf-8?B?RW5aSkovVWNMZlZUSWp0dlFHai92dTdHVnFjSko1ZVBOcklFKy9zZ1RDRHpT?=
 =?utf-8?B?SllaNnlUVExHM2NFeXBlWDdRQzVEZnU4V25nTEpMOGoyU3lURjRDUlhmYmJ0?=
 =?utf-8?B?MXBjazhFZitCOUVhSVFQUTA5Y3FuUHY5WTA4eStMYXVpaDROUFRSdnB3RUVO?=
 =?utf-8?B?Q2lMRm5YL0prUjdiOW1zZVQwY0pZVVJVV3MxYkNNbStGRDg5MGZ5QzhBZ1Bj?=
 =?utf-8?B?Y0tKS0ttQnBQZnVwOVdSVWVzbTV1QXlCOFNvZ1pTTytxM1VFUldyYmE2dHh0?=
 =?utf-8?B?RFBlYzV6d1pHKy9nVnVBZ0hPWTBOTURPVVA0SlV0RkVsNnVESVMrcnllS0Z0?=
 =?utf-8?B?cThRY2crQjNJU2ppVERjc1hzTFJFaXNKb1ZWbE4zTExvMk1uUnJFamhsNXVa?=
 =?utf-8?Q?DkLsPctButTjGdE/Sw=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7E7E67E9BB93794588DDAF86987E6A9F@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4791.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 64cb0554-782b-4a7d-3d50-08d962b53e21
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Aug 2021 02:01:21.9115
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Q1i0loTtuvsxznBOGR3gObVL6JVZHUbyWnUeCYTvl8YqFXzZ4s1d03RCSIkOh78Dc31KwV1s4lWAAw/c4Ol/Vw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB3923
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

SmFjayBQaGFtIHdyb3RlOg0KPiBPbiBUaHUsIEF1ZyAxMiwgMjAyMSBhdCAwMToyNjozNUFNIC0w
NzAwLCBKYWNrIFBoYW0gd3JvdGU6DQo+PiBPbiBEV0NfdXNiMyByZXZpc2lvbnMgMy4wMGEgYW5k
IG5ld2VyIChpbmNsdWRpbmcgRFdDX3VzYjMxIGFuZA0KPj4gRFdDX3VzYjMyKSB0aGUgR1VDVEwx
IHJlZ2lzdGVyIGdhaW5lZCB0aGUgREVWX0RFQ09VUExFX0wxTDJfRVZUDQo+PiBmaWVsZCAoYml0
IDMxKSB3aGljaCB3aGVuIGVuYWJsZWQgYWxsb3dzIHRoZSBjb250cm9sbGVyIGluIGRldmljZQ0K
Pj4gbW9kZSB0byB0cmVhdCBVU0IgMi4wIEwxIExQTSAmIEwyIGV2ZW50cyBzZXBhcmF0ZWx5Lg0K
Pj4NCj4+IEFmdGVyIGNvbW1pdCBkMWQ5MGRkMjcyNTQgKCJ1c2I6IGR3YzM6IGdhZGdldDogRW5h
YmxlIHN1c3BlbmQNCj4+IGV2ZW50cyIpIHRoZSBjb250cm9sbGVyIHdpbGwgbm93IHJlY2VpdmUg
ZXZlbnRzIChhbmQgdGhlcmVmb3JlDQo+PiBpbnRlcnJ1cHRzKSBmb3IgZXZlcnkgc3RhdGUgY2hh
bmdlIHdoZW4gZW50ZXJpbmcvZXhpdGluZyBlaXRoZXINCj4+IEwxIG9yIEwyIHN0YXRlcy4gIFNp
bmNlIEwxIGlzIGhhbmRsZWQgZW50aXJlbHkgYnkgdGhlIGhhcmR3YXJlDQo+PiBhbmQgcmVxdWly
ZXMgbm8gc29mdHdhcmUgaW50ZXJ2ZW50aW9uLCB0aGVyZSBpcyBubyBuZWVkIHRvIGV2ZW4NCj4+
IGVuYWJsZSB0aGVzZSBldmVudHMgYW5kIHVubmVjZXNzYXJpbHkgbm90aWZ5IHRoZSBnYWRnZXQg
ZHJpdmVyLg0KPj4gRW5hYmxlIHRoZSBhZm9yZW1lbnRpb25lZCBiaXQgdG8gaGVscCByZWR1Y2Ug
dGhlIG92ZXJhbGwgaW50ZXJydXB0DQo+PiBjb3VudCBmb3IgdGhlc2UgTDEgZXZlbnRzIHRoYXQg
ZG9uJ3QgbmVlZCB0byBiZSBoYW5kbGVkIHdoaWxlDQo+PiByZXRhaW5pbmcgdGhlIGV2ZW50cyBm
b3IgZnVsbCBMMiBzdXNwZW5kL3dha2V1cC4NCj4gDQoNCkN1cnJlbnRseSBkd2MzIGRvZXNuJ3Qg
aGFuZGxlIG9yIGRvIGFueXRoaW5nIG1vcmUgZm9yIEwxIHN1c3BlbmQvcmVzdW1lLA0Kc28gaXQg
ZG9lc24ndCBjYXJlIGFib3V0IEwxIHN1c3BlbmQvd2FrZSBldmVudHMuIEZvciB5b3VyIGRlc2ln
biwgdGhlcmUNCm1heWJlIG5vIG1vcmUgcG93ZXIgc2F2aW5nIGNhbiBiZSBkb25lIGF0IEwxIGZy
b20gdGhlIGRyaXZlciwgYnV0IGl0IG1heQ0Kbm90IGFwcGx5IHRvIGFsbCBvdGhlcnMuIE90aGVy
IHRoYW4gdGhhdCwgdGhlIGNoYW5nZSBpcyBmaW5lLg0KDQpCUiwNClRoaW5oDQoNCj4gSGkgZm9s
a3MgaW4gVG86DQo+IA0KPiBJJ2QgbGlrZSB0byByZXF1ZXN0IGlmIGFueSBvZiB5b3UgY291bGQg
aGVscCB0ZXN0IHRoaXMgcGF0Y2ggb24geW91cg0KPiBib2FyZHMgdG8gaGVscCBtYWtlIHN1cmUg
aXQgZG9lc24ndCBjYXVzZSBhbnkgcmVncmVzc2lvbnMgc2luY2UgSSBrbm93DQo+IHNvbWUgb2Yg
dGhlIHJlY2VudCBkd2MzIHBhdGNoZXMgZnJvbSBRdWFsY29tbSBoYXZlIGJlZW4gZm91bmQgdG8g
YnJlYWsNCj4gb3RoZXIgZGV2aWNlcyA6KC4gU28gSSdtIGhvcGluZyB0byBhdm9pZCB0aGF0IGV2
ZW4gZm9yIGEgcGF0Y2ggYXMNCj4gc21hbGwgYXMgdGhpcy4NCj4gDQo+IEhvcGluZyB0aGlzIGNv
dWxkIGJlIHRyaWVkIG91dCBvbiBib2FyZHMvU29DcyBzdWNoIGFzIGRiODQ1YywgaGlrZXk5NjAs
DQo+IEV4eW5vcywgdGhlIEludGVsICJsYWtlcyIsIGV0Yy4gIElkZWFsbHkgdGhpcyBuZWVkcyB2
YWxpZGF0aW9uIHdpdGggYQ0KPiBoaWdoLXNwZWVkIGNvbm5lY3Rpb24gdG8gYSBVU0IgMy54IGhv
c3QsIHdoaWNoIGluY3JlYXNlcyB0aGUgY2hhbmNlcw0KPiB0aGF0IFVTQiAyLjAgTGluayBQb3dl
ciBNYW5hZ2VtZW50IGlzIHN1cHBvcnRlZC4NCj4gDQo+IFRoZSBvdmVyYWxsIGdvYWwgb2YgdGhp
cyBwYXRjaCBpcyB0byBlbGltaW5hdGUgZXZlbnRzIGdlbmVyYXRlZCBmb3INCj4gTDEgZW50cnkv
ZXhpdCwgc28gd2Ugc2hvdWxkIHNlZSBhIHNsaWdodCByZWR1Y3Rpb24gaW4gaW50ZXJydXB0IGNv
dW50cw0KPiB3aGVuIGNoZWNraW5nIGBncmVwIGR3YzMgL3Byb2MvaW50ZXJydXB0c2AgZm9yIGNv
bXBhcmFibGUgdHJhZmZpYy4NCj4gDQo+IEFwcHJlY2lhdGUgYW55IGZlZWRiYWNrIGFuZCBoZWxw
IGluIHRlc3RpbmchDQo+IFRoYW5rcywNCj4gSmFjaw0KPiANCj4+IFNpZ25lZC1vZmYtYnk6IEph
Y2sgUGhhbSA8amFja3BAY29kZWF1cm9yYS5vcmc+DQo+PiAtLS0NCj4+ICBkcml2ZXJzL3VzYi9k
d2MzL2NvcmUuYyB8IDkgKysrKysrKysrDQo+PiAgZHJpdmVycy91c2IvZHdjMy9jb3JlLmggfCA1
ICsrKy0tDQo+PiAgMiBmaWxlcyBjaGFuZ2VkLCAxMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9u
cygtKQ0KPj4NCj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3VzYi9kd2MzL2NvcmUuYyBiL2RyaXZl
cnMvdXNiL2R3YzMvY29yZS5jDQo+PiBpbmRleCBiYTc0YWQ3ZjY5OTUuLjcxOWRhYzIyODcwMyAx
MDA2NDQNCj4+IC0tLSBhL2RyaXZlcnMvdXNiL2R3YzMvY29yZS5jDQo+PiArKysgYi9kcml2ZXJz
L3VzYi9kd2MzL2NvcmUuYw0KPj4gQEAgLTEwNTAsNiArMTA1MCwxNSBAQCBzdGF0aWMgaW50IGR3
YzNfY29yZV9pbml0KHN0cnVjdCBkd2MzICpkd2MpDQo+PiAgCQlpZiAoIURXQzNfVkVSX0lTX1BS
SU9SKERXQzMsIDI5MEEpKQ0KPj4gIAkJCXJlZyB8PSBEV0MzX0dVQ1RMMV9ERVZfTDFfRVhJVF9C
WV9IVzsNCj4+ICANCj4+ICsJCS8qDQo+PiArCQkgKiBEZWNvdXBsZSBVU0IgMi4wIEwxICYgTDIg
ZXZlbnRzIHdoaWNoIHdpbGwgYWxsb3cgZm9yDQo+PiArCQkgKiBnYWRnZXQgZHJpdmVyIHRvIG9u
bHkgcmVjZWl2ZSBVMy9MMiBzdXNwZW5kICYgd2FrZXVwDQo+PiArCQkgKiBldmVudHMgYW5kIHBy
ZXZlbnQgdGhlIG1vcmUgZnJlcXVlbnQgTDEgTFBNIHRyYW5zaXRpb25zDQo+PiArCQkgKiBmcm9t
IGludGVycnVwdGluZyB0aGUgZHJpdmVyLg0KPj4gKwkJICovDQo+PiArCQlpZiAoIURXQzNfVkVS
X0lTX1BSSU9SKERXQzMsIDMwMEEpKQ0KPj4gKwkJCXJlZyB8PSBEV0MzX0dVQ1RMMV9ERVZfREVD
T1VQTEVfTDFMMl9FVlQ7DQo+PiArDQo+PiAgCQlpZiAoZHdjLT5kaXNfdHhfaXBnYXBfbGluZWNo
ZWNrX3F1aXJrKQ0KPj4gIAkJCXJlZyB8PSBEV0MzX0dVQ1RMMV9UWF9JUEdBUF9MSU5FQ0hFQ0tf
RElTOw0KPj4gIA0KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNiL2R3YzMvY29yZS5oIGIvZHJp
dmVycy91c2IvZHdjMy9jb3JlLmgNCj4+IGluZGV4IDU5OTE3NjYyMzliYS4uMzU2Yjk0YTdlYzcw
IDEwMDY0NA0KPj4gLS0tIGEvZHJpdmVycy91c2IvZHdjMy9jb3JlLmgNCj4+ICsrKyBiL2RyaXZl
cnMvdXNiL2R3YzMvY29yZS5oDQo+PiBAQCAtMjU2LDkgKzI1NiwxMCBAQA0KPj4gICNkZWZpbmUg
RFdDM19HVUNUTF9IU1RJTkFVVE9SRVRSWQlCSVQoMTQpDQo+PiAgDQo+PiAgLyogR2xvYmFsIFVz
ZXIgQ29udHJvbCAxIFJlZ2lzdGVyICovDQo+PiAtI2RlZmluZSBEV0MzX0dVQ1RMMV9QQVJLTU9E
RV9ESVNBQkxFX1NTCUJJVCgxNykNCj4+ICsjZGVmaW5lIERXQzNfR1VDVEwxX0RFVl9ERUNPVVBM
RV9MMUwyX0VWVAlCSVQoMzEpDQo+PiAgI2RlZmluZSBEV0MzX0dVQ1RMMV9UWF9JUEdBUF9MSU5F
Q0hFQ0tfRElTCUJJVCgyOCkNCj4+IC0jZGVmaW5lIERXQzNfR1VDVEwxX0RFVl9MMV9FWElUX0JZ
X0hXCUJJVCgyNCkNCj4+ICsjZGVmaW5lIERXQzNfR1VDVEwxX0RFVl9MMV9FWElUX0JZX0hXCQlC
SVQoMjQpDQo+PiArI2RlZmluZSBEV0MzX0dVQ1RMMV9QQVJLTU9ERV9ESVNBQkxFX1NTCQlCSVQo
MTcpDQo+PiAgDQo+PiAgLyogR2xvYmFsIFN0YXR1cyBSZWdpc3RlciAqLw0KPj4gICNkZWZpbmUg
RFdDM19HU1RTX09UR19JUAlCSVQoMTApDQo+PiAtLSANCj4+IDIuMjQuMA0KPj4NCj4gDQoNCg==
