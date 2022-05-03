Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7DEE85180E1
	for <lists+linux-usb@lfdr.de>; Tue,  3 May 2022 11:21:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233369AbiECJYr (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 3 May 2022 05:24:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58320 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232938AbiECJYp (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 3 May 2022 05:24:45 -0400
Received: from CHE01-ZR0-obe.outbound.protection.outlook.com (mail-zr0che01on2124.outbound.protection.outlook.com [40.107.24.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E24651EAFE;
        Tue,  3 May 2022 02:21:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YAWXFTdAuzVMVSgRXxjvPYeyV0cTpNsTwAR0uh/f5nM3dlNNZxo0R/6PqBahdlR1RD3H0wFnCivpLFRLpza6fRTb6PF8A3p/yQCxaHAordSwkyr2g89qq87q9QRY+qKUwFdScScm5zDD6W3xlm6ypfaSEfQ15oEqDqmGzUjz0CUivC7dRnQoUMv6LYwX8gQHdkEXea0V0t0Cs6+a34HhSMcYKy2MjUtVYx3FvMkem4hX81TW7mprwxtE8RePwcyB7TIrRe21mgA2/9MRg4bh2a/nqIoI3rhYdIvpVzGbh+1PAoOGECT0S+as1G6NmJ7SoCwZgx+kSSq37BPnPGnGnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fYqLkmyXyH3C6czUzC7cBiG4m7prPDQA99ra23mZ5VA=;
 b=PGHlY0HejYEJG37qbMN2FyLkNWfnHmZRG2RbWtJQApM0DCk4J4d16DlQRwrcA+pOHisAtAQ4VayL7eCRcL0iQZ8+5ogsLp48CcrsvDtvZFwKxJW5UWp+3Vyp3+P3muSEuelhuKj5xBYQGq07OImQYjvMLvIWEjeGppOKxtib0pF84GnHKCE5o4ePXl8s2WbzNtWBn/7hWO1FZa7n+tCb9wzWG2K5CnWGbDI//txg56AN4azgJC6y/XTQC3WPH2oWxUFOOHbinIF3YpFIeYrwGUh2LhSpteO1urYH2OuwJKgdKbQxTIBJZuA5SqrGeygk5GEJK/bpzxC220KSsOqtZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=skidata.com; dmarc=pass action=none header.from=skidata.com;
 dkim=pass header.d=skidata.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=skidata.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fYqLkmyXyH3C6czUzC7cBiG4m7prPDQA99ra23mZ5VA=;
 b=nPo2dbbJnacqcBE1Di4zDhIzyIGuouRTGkxJm1DkM+YlricWuM/YcTyDpY4wsU/Doyo/8WIvzdHM3HQgiMTTIBWLS4ET5gGfosGHqtfn/pgEyD+TCLbTp2rzdEPHB8YoearDm8Qg371Xnwu+YCRTDr42D+nhcR5OuCkmNgMAED3bL2wC1k33HigVu1Km5HOmNZALsJtiL1WRE7PG354ZmvQxZsRHx7aHW3HByQcQqO68NSkjly7y0Oap5X8FydsvUeEGqHJ5mORCPzbYM5GC0/iwzUMq3Lu5gj8FFVB011qbGT4G0NUrwHDLEqIT1vZB07M2kTja9TONkN193s850w==
Received: from ZR0P278MB0798.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:43::8) by
 ZRAP278MB0224.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:2e::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5206.13; Tue, 3 May 2022 09:21:10 +0000
Received: from ZR0P278MB0798.CHEP278.PROD.OUTLOOK.COM
 ([fe80::e973:80d8:54f3:5be]) by ZR0P278MB0798.CHEP278.PROD.OUTLOOK.COM
 ([fe80::e973:80d8:54f3:5be%7]) with mapi id 15.20.5206.024; Tue, 3 May 2022
 09:21:10 +0000
From:   Richard Leitner - SKIDATA <Richard.Leitner@skidata.com>
To:     Daniels Umanovskis <du@axentia.se>
CC:     Rob Herring <robh@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: usb: usb251xb: add documentation for
 reset-delay-us
Thread-Topic: [PATCH 1/2] dt-bindings: usb: usb251xb: add documentation for
 reset-delay-us
Thread-Index: AQHYWgoZbQkjr3Sgw0GtZfkqb4z6IK0MUziAgAB9XgCAABmRAA==
Date:   Tue, 3 May 2022 09:21:10 +0000
Message-ID: <YnDz/q7hqlTbRqYR@ltleri2>
References: <20220426123329.775-1-du@axentia.se>
 <20220426123329.775-2-du@axentia.se> <YnB1ZQwpOBcT4zct@robh.at.kernel.org>
 <75ed6e33-0d67-c50f-4d3a-7345d5f058b4@axentia.se>
In-Reply-To: <75ed6e33-0d67-c50f-4d3a-7345d5f058b4@axentia.se>
Accept-Language: en-AT, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=skidata.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d7b2f106-1bd5-44c3-db3a-08da2ce64322
x-ms-traffictypediagnostic: ZRAP278MB0224:EE_
x-microsoft-antispam-prvs: <ZRAP278MB0224441D98C29DF1823606C1F0C09@ZRAP278MB0224.CHEP278.PROD.OUTLOOK.COM>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: C+m2bnmpPQ/vyrehKLfRXai+v1vHEGMkXvO9kNeEzqlsaiP214wLIhRPm9Q9mfPETn1saFRgfp7tme7YcssLX+bsyFkiuQOcIvCQSxQGtKS7TV1glh3Gi+s5CHVzwMl5U4Huvyp0wbOa0YBFcDsKp6oaNEi3nAPKw6BtrLqWCvAvkB5cQRSH0FRKUubLddZAchuGUF7Qr/dBBpvwZECbQsQU1Kw5ekHiobOoHMR7RO+zITyG9AzU0//dzizZeyA994j7UvA33vPDHLgDoNzQs8dMn6PUGO5LW8fuzSFyeT/wHamMw8Pi4NxDLGUQlFO69v7/fU/krriLp5axk8m7aoyU90dkxPo0Xd9l21rDruTgKXlziuu8BW9jWTUzI8WDsRur7eR8cczMLBj2UQXCcVdH/otZmw/+L8PSMcCwEwzFsr58L01+1uBnbFZEoHlrpltmzKggDeVELoBGHmmO/5xlDS219COUFGgC6sWVOOJQQpFwN5t1dIN+qDB96oOn1LSsoURFFLLcaLfWA7Rti2tQ9RgtTxkvgE2RSQP6evpCjS7E9pT5Ip5OBVr/sWvlbyNVrS4BudGPoElZrq3AKk2hCxm7cpnyyhvjambhk/cRaA+s0d/jXv0UG8Wig91fqy9Fhv+FfVtVrYLXuwvXtrzNT3cx+x93LlcXbmOt38881CRBj4IJ9USrxnZ0Ktbn72ZQk9Jhq//apQ8FJGnGJw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZR0P278MB0798.CHEP278.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(5660300002)(316002)(54906003)(38070700005)(38100700002)(6916009)(6512007)(83380400001)(26005)(66446008)(64756008)(66476007)(66946007)(66556008)(76116006)(91956017)(186003)(9686003)(4326008)(8676002)(86362001)(71200400001)(33716001)(2906002)(508600001)(8936002)(53546011)(122000001)(6486002)(6506007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?emRkR2FwZzVKV25ia2NsRmRoeVZ1UVdtQU9ENWZFRG1KRUN4S0JvMnpIVXZ1?=
 =?utf-8?B?MjJmNlIvRzJITUJEeDNqWGRNMXJuUzA4RXhiR3FxdnU2Q1o1QW5FOS9RVTRr?=
 =?utf-8?B?K3UzcDB4T3pXRlpBaVlvbk93UDZrUkZUNWpjaFYvdUltOHZhbWxRMjErOU9v?=
 =?utf-8?B?SmpkZG04dEFJNWI2aTlPWHZmSmxtN0E3QTdCVDFMKzlFTC9IU3ZBc1ZLVE0y?=
 =?utf-8?B?K0dFZ2U0aDRVcmdpN0I1MDdtWllVTTNESGRYSTNzTjJJMUU0dmlxcVplUWJ5?=
 =?utf-8?B?dDRscDRxbGhxc0dMRjU0VTRVMGIyclBSOXhWS0MrTDZKTm1tcHZsUkEwRDJa?=
 =?utf-8?B?QkN6VUpLVmg4dUlSUVB0cTIrMGlySEV2UVVZT3VrL29rUUNwRHZ4MlpIU3dh?=
 =?utf-8?B?bUNVMmlkempaSjRreHFDc29KT1FaVEJCancxSS95Ym54RkZ0cnBFQ2NERWJL?=
 =?utf-8?B?a1NUTEwwVDhWY3dNKzcxdlg4T3JTK3E0Nzhsek4zWkpkOVhheGRLbTFYVG54?=
 =?utf-8?B?M3V0c1M4Z3lmS2kxN0ZMTmVzd3d6TStiZUZVVVl6OWN5bTBWcTd0MkMzaU1m?=
 =?utf-8?B?TDJ1amxTMkpBamJYMzduSDlhV2F3T2puRWNuTHJvdUFoTURyd0llcFhobXI4?=
 =?utf-8?B?RFVqbjlVYmp0SzBvalAzNGFZbDduNmRXK2J3V05tZnZYMlMxVlJRcS9jd2Ni?=
 =?utf-8?B?ZVBCL3dBOXUyc2JVS2h4NXc1cjgwK0tQcGhDQ0FnL3BxdGhHWk5TTjdoUmE0?=
 =?utf-8?B?MStmY2FTTjVPbjNFb3hwWWpNK0c5MzloTStDcVpnQ3JKU1RPR1RaR0kvNU5O?=
 =?utf-8?B?V3RqdXV2Y0hQTjBGVjAvb04zeFI2NDBESmc5TWtUZmYxQ1lKclF6VnhEZ01S?=
 =?utf-8?B?aUE1dEpGa1d4TStoUXN5MnpldndWaHUzUVdLOHRJMk40VDRPSkVWOUliVUcr?=
 =?utf-8?B?MUFhNmxyZi9BM2JEb0p5eFAyTzJCOGtkc2UyVTdtRUwwMERkeURPN0VJSDNQ?=
 =?utf-8?B?YjRmckJ1cFJYNVNFRjlNQ1VIWXJPb2wySXh6a3JVUnpCK0U2UVltYVFTRXEz?=
 =?utf-8?B?eDgwOW5HcFd4YkVmWXVDTUxrTUhkeGd2Q3RJVkRrODVZQ3U1NFRkV0pOdU5Y?=
 =?utf-8?B?bFFRN295L0hiRVl1WCs1MXBBcEh5Vmw3c2kyUXV0ZWRTL0t4Q0Z0MVdNMkpX?=
 =?utf-8?B?Z0dVK2NKTUhxOVYrQXJ3Zm1BengraTdOSGpsMlBZdW5DMjRaeGQvVTd5bFZB?=
 =?utf-8?B?dmExSEo2ZElvU2hmaXkvNjFBQmZQWTZwazJPaXQ0enlkM2MxL0VYUzZWd1BX?=
 =?utf-8?B?LzBZU1BCM1pEOW5mak56RDFlNGVNYU9EOXQvSm9iVUdTTmEzQ09tdmRDWkZU?=
 =?utf-8?B?QlNieHNIYmNZVEFjQjdoWWYwUWFDZXVPK3NmMWxXZEVpa0ZMbVlFNkQxZWlE?=
 =?utf-8?B?SmdXMTJjbFNzaUFXSmU5VDkxeWpKMmlYY25oRXFIWTRueHRsVkN3QStJa0xR?=
 =?utf-8?B?WTFPanZDZXZ2RnhQQWQ2ODJBVmltaStpTFlLZFJ1WmtYaFducjJMOVBjZVlD?=
 =?utf-8?B?Wm9raHFTV0gvSXlNNVIyZjRhNXd4TWJ2THQ3dmgvcjJhSjZZblFUTytuWDRr?=
 =?utf-8?B?NkFqTmZ2VUxKZFJ2andHL2Vka2J1M2NVTE9Rb3V2bHRNUXZmQ3lCTGNoZ2lR?=
 =?utf-8?B?L3Vkc1p0VGlKQXJ5MC9hSWwwaW1qRkZscUR2bmZGaHdUVVJ6dzNjV0lXZGNM?=
 =?utf-8?B?WUhlcUZiNFJTc0JRdVVCdDJnbGlBMTZxWkVzdkM0TW9qZ0VXVURCS3hYTGtN?=
 =?utf-8?B?U2srZ0Rzc0JNdENESWluVW5EZCtrM0NBVmM3Nk5EczNudnV0UTJPVXVqcnNB?=
 =?utf-8?B?Z1E5R0JMM0kzVGFBOThFdGZNUlNXN1lReW5JWVJQc0dGNGFnYmMzMVJPQVRw?=
 =?utf-8?B?V0w5V1Bwc3F3U05tc3lOLzFSVzJITWJtU3RaejlLbWIwQmFFSnROOFlnMTRX?=
 =?utf-8?B?VGhnS3JSU29paFNtdkdSVm50M0szZHRmeCtjdS9hMnI0cDl3QWNFSHdURFBH?=
 =?utf-8?B?czVJaGZQeEtvNkt6MU5Uc05EZk9hUHFBRkRKUWhRS2xoRy9NemU1OTFWbDlL?=
 =?utf-8?B?bHRua0JraW1MN0hpSC91S0xPL0VxR1d6OVJaaUhzMDIvc0lNUTlNM1dQdHUv?=
 =?utf-8?B?U3A1TXhwb1JLSisrN0k5S1VyU21DRS9jeUlIdDJ3QktBdFRHWUp1aXU3OFds?=
 =?utf-8?B?dkw4bVB0T1JyeExkV25RRzAvN0g5WHphTlBpK1pDZHpUekt4bGxKeElFWnFT?=
 =?utf-8?B?YWJJd2pYMjBWRnRqQnlDRjlNU0MyclliMldENUxVWWJlK0d4NmJSOHJDTXVl?=
 =?utf-8?Q?TTbuAbM/i5yQFpQjfYkMxYHRndOHQpoEi98rG?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0D846770EF5B2442B21EFAC91549D78A@CHEP278.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: skidata.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: ZR0P278MB0798.CHEP278.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: d7b2f106-1bd5-44c3-db3a-08da2ce64322
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 May 2022 09:21:10.6492
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: e5733095-4425-4f08-b6ba-487b9a46a425
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /vCdp5csbLn1NQuCTEsdXjwtesKkdnDRKRqFmeJMq/jSMRjcHAmcll9QVlIUDqSPmXxVkQ+P9UzkbJrzfJqNW3HiDlbnrB/ISAsOv1t/nEc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZRAP278MB0224
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

T24gVHVlLCBNYXkgMDMsIDIwMjIgYXQgMDk6NDk6MzZBTSArMDIwMCwgRGFuaWVscyBVbWFub3Zz
a2lzIHdyb3RlOg0KPiBPbiA1LzMvMjIgMjoyMCBBTSwgUm9iIEhlcnJpbmcgd3JvdGU6DQo+ID4g
TXkgZmlyc3QgcXVlc3Rpb24gaXMgd2hldGhlciB0aGlzIGlzIGJvYXJkIHNwZWNpZmljPyBJZiB0
aGUgZGVmYXVsdCBvcg0KPiA+IHdoYXQgdGhlIHJlZmVyZW5jZSBtYW51YWwgc2F5cyBpcyA1MDB1
cywgYnV0IHlvdSBoYXZlIGEgY2FzZSBuZWVkaW5nDQo+ID4gNjAwdXMsIHdoeSBub3QganVzdCBj
aGFuZ2UgdGhlIGRyaXZlci4gSSBkb24ndCB0aGluayB0aGlzIHJlYWxseSBuZWVkcw0KPiA+IHR1
bmluZyB0byBlYWNoIGJvYXJkIHVubGVzcyB0aGUgZGVsYXkgYmVjb21lcyBub3RpY2VhYmxlLg0K
PiANCj4gVGhpcyBpc24ndCBhIGJvYXJkIHNwZWNpZmljIGlzc3VlLiBJIGRldGVjdGVkIHRoZSBp
c3N1ZSBvbiBhIGJvYXJkIHdlJ3ZlDQo+IGJlZW4gdXNpbmcgZm9yIGEgbG9uZyB0aW1lLCBpdCdz
IGR1ZSB0byBhIHNwZWNpZmljIGJhdGNoIG9mIFVTQjI1MTIgaHVicy4NCj4gV2UndmUgaGFkIHNl
dmVyYWwgYmF0Y2hlcyBvZiB0aGVzZSBodWJzIHRoYXQgd2VyZSBmaW5lLCBidXQgbW9yZSByZWNl
bnRseQ0KPiByZWNlaXZlZCBhIGJhdGNoIHByb2R1Y2VkIGluIGxhdGUgMjAyMSBhbmQgdGhlIGh1
YnMgaW4gdGhpcyBiYXRjaCBkbyBub3QNCj4gYmVjb21lIHJlc3BvbnNpdmUgdG8gSTJDIHdpdGhp
biB0aGUgZXhwZWN0ZWQgNTAwdXMuDQoNCldoYXQncyB0aGUgbWF4aW11bSB0aW1lb3V0IHlvdSd2
ZSBvYnNlcnZlZD8NCg0KSSBndWVzcyBpdCB3b3VsZCBiZSB0aGUgc2ltcGxlciBhbmQgImJldHRl
ciIgYXBwcm9hY2ggdG8ganVzdCBpbmNyZWFzZQ0KdGhlIHRpbWVvdXQgaW4gdGhlIGRyaXZlciAo
aWYgaXQncyBub3QgdG9vIG11Y2ggYWJvdmUgdGhlIDUwMMK1cykuDQoNCj4gDQo+IEkgYXJyaXZl
ZCBhdCB0aGF0IGJ5IHVzaW5nIGFuIG9zY2lsbG9zY29wZSB0byBvYnNlcnZlIGhvdyBzb29uIGFm
dGVyDQo+IGRlYXNzZXJ0aW5nIHRoZSByZXNldCBzaWduYWwgdGhlIFVTQiBodWIgaXMgYWJsZSB0
byByZXNwb25kIHRvIEkyQy4gTW9zdCBvZg0KPiB0aGUgMjUxMnMgd2UgaGF2ZSBkbyB0aGF0IHdp
dGhpbiA1MDB1cywgdGhlIGxhdGVzdCBiYXRjaCBkb2Vzbid0Lg0KPiANCg0KcmVnYXJkcztybA==
