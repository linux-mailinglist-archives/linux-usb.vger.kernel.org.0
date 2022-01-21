Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 84C504963A5
	for <lists+linux-usb@lfdr.de>; Fri, 21 Jan 2022 18:16:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351535AbiAURQv (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 21 Jan 2022 12:16:51 -0500
Received: from mx0c-0054df01.pphosted.com ([67.231.159.91]:14923 "EHLO
        mx0c-0054df01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S236390AbiAURQp (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 21 Jan 2022 12:16:45 -0500
Received: from pps.filterd (m0208999.ppops.net [127.0.0.1])
        by mx0c-0054df01.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 20LBjces029931;
        Fri, 21 Jan 2022 12:16:30 -0500
Received: from can01-to1-obe.outbound.protection.outlook.com (mail-to1can01lp2050.outbound.protection.outlook.com [104.47.61.50])
        by mx0c-0054df01.pphosted.com (PPS) with ESMTPS id 3dqjeurexc-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 21 Jan 2022 12:16:30 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ONasgf6wqVqXLLCVmpbefAccAUOQDHFI3R8IrHwAMRxCtDwWUm85S/lkKs6x6lMcCFhGWGgzH39R5arhsWYTXARJkNUecVoOU45691O1R2QrIXMTTF5JgC3Uzq8CdIwgnEaO4sz7+664xLzIqifVUx3b9TYztr2ZWWH2ZJREH3fKMyv4cO+B3MEqmC7GvVXohSeAb2NDUq4glDa/1eu1jArYVloSeIIpGEna7SOGyJNqrxXe9sYT/OMQPEa6RFakiRecjS39rMBlHGEyul43BvsiyCB4eccXRHtJD3FljmCH68QE6uV/m1FoZmndiugo7Nx0qRxbWdwK9260XiBuYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JbAJvJlWbje6DlEp6T0r5OT/QgtMysYH4yNEOWopxhI=;
 b=EsCeMYuJcUj2K9KP8oi8Cc6+JshR5z+5srfkqjI52wue2CmNNI9tnk/pDPL70c64lz2fYpZIqipWBJ4eR9mY9S+57AZOUdhF2CTqcQlAiGRpwYM4A+0kWYgqgESt5ZX0tyrpt9roOSAg/9EiuVSE+1Q/W0JmQH8n7QsXuS9R/Hc5kXVJaSte92gfLAZ41ogGm1hl/wJd5kG9F+8klCyB7GmQ9XZRvc9g88/UNH2rbD3Sn9CPcAC3M2NQ/3BjWojZndOrWnC97Bjt4fyZRstabbdNam858OIPPfPWTRM35InD59mxrOi23YskNsfNsGc2t5BKbq0Sbx2FuBFmpaYyZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=calian.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JbAJvJlWbje6DlEp6T0r5OT/QgtMysYH4yNEOWopxhI=;
 b=c7/UnqxEdLNbGLrTQqbU9TJqDTylu0IkBTfZPe5zsJw9z1Qe0oMOsgbWfCLF5sqDot+i5vMOoZENKuB7Z6VIpKORHWP0+5a93mWwq4NlCgUAdkxd+If8E6a17ByXYRCTmXP9Kh8IReD4SWfbEVM+x2UwqxFaR7E5RRXhfZeRJ+A=
Received: from YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:6a::19)
 by YT1PR01MB3948.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:10::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.8; Fri, 21 Jan
 2022 17:16:28 +0000
Received: from YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::6929:c39f:d893:b6c8]) by YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::6929:c39f:d893:b6c8%2]) with mapi id 15.20.4888.014; Fri, 21 Jan 2022
 17:16:28 +0000
From:   Robert Hancock <robert.hancock@calian.com>
To:     "michal.simek@xilinx.com" <michal.simek@xilinx.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
CC:     "manish.narani@xilinx.com" <manish.narani@xilinx.com>,
        "sean.anderson@seco.com" <sean.anderson@seco.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "balbi@kernel.org" <balbi@kernel.org>
Subject: Re: [PATCH v5 2/2] usb: dwc3: xilinx: Fix error handling when getting
 USB3 PHY
Thread-Topic: [PATCH v5 2/2] usb: dwc3: xilinx: Fix error handling when
 getting USB3 PHY
Thread-Index: AQHYDiBdbvYYzXIkPUyIoGU7+JW/fKxtHA6AgACc8IA=
Date:   Fri, 21 Jan 2022 17:16:28 +0000
Message-ID: <2b07555795e0109193669adeb97783e3abf7b282.camel@calian.com>
References: <20220120170818.1311306-1-robert.hancock@calian.com>
         <20220120170818.1311306-3-robert.hancock@calian.com>
         <4d2bd8df-3d5f-47e3-0882-b1f566ad3b4e@xilinx.com>
In-Reply-To: <4d2bd8df-3d5f-47e3-0882-b1f566ad3b4e@xilinx.com>
Accept-Language: en-CA, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.28.5 (3.28.5-18.el8) 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7b2ceccb-cc6a-4fd1-33c8-08d9dd01c2e0
x-ms-traffictypediagnostic: YT1PR01MB3948:EE_
x-microsoft-antispam-prvs: <YT1PR01MB39481449F6C2DA84E1CBC0AFEC5B9@YT1PR01MB3948.CANPRD01.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: o1zQrwm32rCL4qG0mfX4aa947LuR+JsfJipi4M3i0zy/APwYDHvaVZ8aYgKikMcZ2muGtvWo4poJIrPUcG9Mq42/JZr89I++WHni9dAX7vkLFyrDEjncsdZ424DeN8V5deys1VJpvpOg1Gt0XMmz5+LJXXTLxh5bNJd95Rcm6oZni/4DVC09E3RB6Bgg7ds3obFb8JfyD0jUZlPx7n+etCA7ZsCS3XzvJDKLIJRz29V+/HFo+ONpRgxNtztyUTnjB8WzqhWmu2I9eoXBWjnkl9OfYvSuWVwDVZC+ySiOL5p2MJ71i/aNws61tUiYNEbTxRymVfPvUgXusIXO1xB++b5DbWnxRy2J/lKJlk+VAylxziSuJrAu4JiDupA5IDHi9cBjBTT55StCqCSIOM27W+PMbWXFwsbRuNbU61k385j2Wicd/UkDw4+Wypwb3oEdsMnSIQ5ykjYjog5sBRje8tvYdb54nkw+dZZ4qtPCcnDIh2X36+2+fr+qLDBpZ2ThwtjcpOOl8kkVe2pExrP6tMJPVLHSpB67tLXv3rP+vxFEPqroIE7cOJ7kgqIUiw+vZWhtU7lpT9fsucgj72b4O0u8+Ig39HktXwkoNxH53GwE0iifzT8JCacMKkCxwBUCZWFHhntDaYKR6DYJCGM34JB0IEHqztrU6KNu1ztk16/4qDh3k3CAbGiJlVHnzpDvnEWp8ZwRiFWWQWrLF8BLa2xeSvlrfcX3sweHexG3/J8SUEN24X4jtlF81giiX26R3BEv4aSeq0ZSSyMT6kfFqH0YFUcQkcTW8EmNAnbjkOs9EIFDKzXkKuZkZn6ALpjcfbPGGPD8QKWUe+3WfdKfOg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(366004)(66446008)(66476007)(64756008)(6506007)(4326008)(38100700002)(316002)(110136005)(5660300002)(53546011)(6486002)(6512007)(54906003)(26005)(186003)(122000001)(8676002)(66946007)(76116006)(66556008)(71200400001)(91956017)(2616005)(44832011)(15974865002)(36756003)(38070700005)(83380400001)(508600001)(8936002)(2906002)(86362001)(99106002)(18886075002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NXhYYTJlQUppcXZEQXhISU81RWtWbXhWeEFydklNR0h5TEFJd25ubjl3N0Ns?=
 =?utf-8?B?N1ZOZ0h0YzRKTXlBR3BmeWgySkY2NmpzQkQ2eUJ1VWljbzBDL0pPYm1JK0V2?=
 =?utf-8?B?ZHZPNE1ZTzZ6SmhPaHZUbGZIb1dNdUpDYlhPZ2NHeDFKOE5ZbDY3MjRKS3Zs?=
 =?utf-8?B?Y0dlcjhKRDBiRW1CelU2NHF0aTI1cnFUS0ZZUVpXdUtUSmpnN0Npa2hCL2Fk?=
 =?utf-8?B?cDAvOVdudzVqTGdHQkx1dDlsQVJGYmlOUmNabHVzYTQyUmRoYlpIS3NkZU54?=
 =?utf-8?B?QzEyb0E1RDdhRGFQZ2NRWjlzV3docVRNTFFVbWExQ1FRYmQzMVNDYkRZSFBX?=
 =?utf-8?B?b2hhanBacXM4b2JTNHBIQWlQUXZRWDJqZzV0czQvSzFZeXVlZUxDNytUY3Vs?=
 =?utf-8?B?THNETlRaN0JTTVlCQVFZRVltb1NIWXdhM3JMbFNCZ2MzMU5XWFcza2dlZldK?=
 =?utf-8?B?OWFlTjM1L05wUE16NzM5UVlta0pLS1BkMTBXa1EzUThZZXBLUExuTWhIVnZs?=
 =?utf-8?B?b3RSbnRicXFSRzRJZXk4N2NxcEQrSnFkRHRhR0FmRlNiZ0xmUVV4V0twcXJi?=
 =?utf-8?B?RU9Wc2xoNVpITVR3SnRuYmNDR2F0V0l4d1hSc3BmNEJiTTQ4dkE4UFBJcE1j?=
 =?utf-8?B?NVZNbmp6ci9nMSswbERnbFRzemUzN0prUVBFNGV6dUFpcFAvYzI3VTFQQ3hF?=
 =?utf-8?B?aTFpNzlZQnR2dVR6TUpDVXFNL05ZZEQ2WUp1OVExVEhXbVFSS0tXTEJlMHVK?=
 =?utf-8?B?bTVFMDZ5aUFUSVZha2F6dlB4QW45QVFmWmhuMmpHSFE0QUwycm8rNFZjbXhr?=
 =?utf-8?B?cVFZdEdpeXFBbjNJdWdGdTZoWFVKL3RJWkNHdk1Cd0duNU5WTDVZQUdjWVZR?=
 =?utf-8?B?OTdDV0o1UG1Nb01YZW51blF6aFdKaER5ejVlYkJjRU1sN1ZsQnhxeXpuT09a?=
 =?utf-8?B?NHp3S2NTaXpvZ1pXN3daY3VmZERnUFNyOVR4WUtPekxtV2ZlM1FxNlBmbTFK?=
 =?utf-8?B?bCs4cnZtYnAyQzJqNElwcmhxcXhsYjR3ZnNYbkpGb0wzaGd4Nms1WGFCbjVQ?=
 =?utf-8?B?bE1yOGNCNjBQMjl4R3RybjdjNkpNR2xTV2t1SHJyNzJ5dFBsOFZQSHY5eXVW?=
 =?utf-8?B?dnAwSGNoRjI2YlZVZVRQNU9ZWm9WUk1UWlpDV1NBRkZvYlhhZTUxVEZ0enBT?=
 =?utf-8?B?U3F3cHR4L0JYanFrMWZ5dHE2US9yYS9QTm13UHVaVm1iMUkzYk9XdDlXcm50?=
 =?utf-8?B?cktnUmNVUUtLeENHN2xFcE9pbGk5U1o3cUpJalp6eWtBVUhEZ0gwZUlCcXd3?=
 =?utf-8?B?MEJuQ1Q3bzVvVE9Vc1JLbDVXYjZSMVpHU0tZL1pSaE8wWnlNbThuaGdVK2lR?=
 =?utf-8?B?QkRwQ2gxWldMbGJSQmE5cXFoU2J5MlVweUZ1aVl1ckRaZWJ5ZDhsTjhLVTRL?=
 =?utf-8?B?Y1VsQTJPdEU1c25rWXhLaFRaSVRESlI0bjRvVEdIdG5ybUlFUHQrRTB5bURW?=
 =?utf-8?B?VXQ5YU1ycThDWFVoY2FpZ1M1dFE5U3hqQnlLcGlhNGZJWlVVVWRTcGdwbTNM?=
 =?utf-8?B?Y3pNdjVjWlRRRGJYczBmMjNsaDNmTTZrS0ZnbVlmakpuampsREVkNU56UjdK?=
 =?utf-8?B?S0lFQWdYUmVkNVdEeTByQWdab0ZZbDJmdjgvcDdmT2pwQWhGY09jbk9Fb1cw?=
 =?utf-8?B?M1RvRkludU82S3hoMTVqTm1USXJuV2l5bThBMllYM2NwM2RpTnltcFlrb2Rl?=
 =?utf-8?B?dVFvQU1hazZHSm5YVmF6Zm1VTWJ4VjF3VXhad21Da0N3dHpZTDNObWRIVmhq?=
 =?utf-8?B?ejdBYTdQTlIxTTgvYlhNZHJ6WlBDWWVIczNTS3lxa2E4VFpYNjZNbDdZZXJ1?=
 =?utf-8?B?dm5xc3d3emlkdStka1pFT2g3TkdVWWtiS2N5Ymkrb2UvQ1d0RFlJK011UExp?=
 =?utf-8?B?TGFSVm45Qnh3OTRaZEhDbjhnQzdQTE5ORytuaXcrNmdseFFERTF5TEtwSGcv?=
 =?utf-8?B?WS9VZ3dnWDBtbFZ1QXNsQVNhak52K2tYbUNWaVFYUWx1Y3JEWTBvYnNhS1I1?=
 =?utf-8?B?NStCcWpDSDdrcnhISExmL1N1dXZweHpmMHNRWTJVYzB6UnBIdlB5RmxmZFND?=
 =?utf-8?B?azJjSFExYUhOYXJOR0l5aWljR1dnQnB3a3MxMThCaEd2MTNlY2RHUlB6Wm1Y?=
 =?utf-8?B?TjV5RnRnbW45bkhXUU9JanRORkNPMllPNThBS250Y0tyWFJqTWZydWlEVkJr?=
 =?utf-8?Q?9/14TjLFeTEBbG0EKzZsgrt6cDAcs4ygEQIY3rxjMs=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9D15511D0CB79740A85BA6D5923D4A38@CANPRD01.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: calian.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b2ceccb-cc6a-4fd1-33c8-08d9dd01c2e0
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jan 2022 17:16:28.3189
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 23b57807-562f-49ad-92c4-3bb0f07a1fdf
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: U7Fqe/KgoN8FcnpyJfk2SgHbnoK1JUNRGddsG+cn4DekhiTOj5+xMyFDZh3SaNPtnzg8isSXoa0XLYYfEOEY5xfKna9Fu6skDWjvqgEWxEI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YT1PR01MB3948
X-Proofpoint-GUID: toRlo8VgGctq-XokAbsgjb2rvoSOLF9c
X-Proofpoint-ORIG-GUID: toRlo8VgGctq-XokAbsgjb2rvoSOLF9c
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-21_09,2022-01-21_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 spamscore=0
 priorityscore=1501 adultscore=0 clxscore=1015 suspectscore=0
 impostorscore=0 mlxlogscore=999 malwarescore=0 phishscore=0 bulkscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2201210113
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

T24gRnJpLCAyMDIyLTAxLTIxIGF0IDA4OjU0ICswMTAwLCBNaWNoYWwgU2ltZWsgd3JvdGU6DQo+
IA0KPiBPbiAxLzIwLzIyIDE4OjA4LCBSb2JlcnQgSGFuY29jayB3cm90ZToNCj4gPiBUaGUgY29k
ZSB0aGF0IGxvb2tlZCB1cCB0aGUgVVNCMyBQSFkgd2FzIGlnbm9yaW5nIGFsbCBlcnJvcnMgb3Ro
ZXIgdGhhbg0KPiA+IEVQUk9CRV9ERUZFUiBpbiBhbiBhdHRlbXB0IHRvIGhhbmRsZSB0aGUgUEhZ
IG5vdCBiZWluZyBwcmVzZW50LiBGaXggYW5kDQo+ID4gc2ltcGxpZnkgdGhlIGNvZGUgYnkgdXNp
bmcgZGV2bV9waHlfb3B0aW9uYWxfZ2V0IGFuZCBkZXZfZXJyX3Byb2JlIHNvDQo+ID4gdGhhdCBh
IG1pc3NpbmcgUEhZIGlzIG5vdCB0cmVhdGVkIGFzIGFuIGVycm9yIGFuZCB1bmV4cGVjdGVkIGVy
cm9ycw0KPiA+IGFyZSBoYW5kbGVkIHByb3Blcmx5Lg0KPiA+IA0KPiA+IEZpeGVzOiA4NDc3MGYw
MjhmYWIgKCJ1c2I6IGR3YzM6IEFkZCBkcml2ZXIgZm9yIFhpbGlueCBwbGF0Zm9ybXMiKQ0KPiA+
IFNpZ25lZC1vZmYtYnk6IFJvYmVydCBIYW5jb2NrIDxyb2JlcnQuaGFuY29ja0BjYWxpYW4uY29t
Pg0KPiA+IC0tLQ0KPiA+ICAgZHJpdmVycy91c2IvZHdjMy9kd2MzLXhpbGlueC5jIHwgMTAgKysr
KystLS0tLQ0KPiA+ICAgMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlv
bnMoLSkNCj4gPiANCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy91c2IvZHdjMy9kd2MzLXhpbGlu
eC5jIGIvZHJpdmVycy91c2IvZHdjMy9kd2MzLQ0KPiA+IHhpbGlueC5jDQo+ID4gaW5kZXggM2Jj
MDM1Mzc2Mzk0Li4zYjE2ZTc2MTAwMDkgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy91c2IvZHdj
My9kd2MzLXhpbGlueC5jDQo+ID4gKysrIGIvZHJpdmVycy91c2IvZHdjMy9kd2MzLXhpbGlueC5j
DQo+ID4gQEAgLTEwMiwxMiArMTAyLDEyIEBAIHN0YXRpYyBpbnQgZHdjM194bG54X2luaXRfenlu
cW1wKHN0cnVjdCBkd2MzX3hsbngNCj4gPiAqcHJpdl9kYXRhKQ0KPiA+ICAgCWludAkJCXJldDsN
Cj4gPiAgIAl1MzIJCQlyZWc7DQo+ID4gICANCj4gPiAtCXVzYjNfcGh5ID0gZGV2bV9waHlfZ2V0
KGRldiwgInVzYjMtcGh5Iik7DQo+ID4gLQlpZiAoUFRSX0VSUih1c2IzX3BoeSkgPT0gLUVQUk9C
RV9ERUZFUikgew0KPiA+IC0JCXJldCA9IC1FUFJPQkVfREVGRVI7DQo+ID4gKwl1c2IzX3BoeSA9
IGRldm1fcGh5X29wdGlvbmFsX2dldChkZXYsICJ1c2IzLXBoeSIpOw0KPiA+ICsJaWYgKElTX0VS
Uih1c2IzX3BoeSkpIHsNCj4gPiArCQlyZXQgPSBQVFJfRVJSKHVzYjNfcGh5KTsNCj4gPiArCQlk
ZXZfZXJyX3Byb2JlKGRldiwgcmV0LA0KPiA+ICsJCQkgICAgICAiZmFpbGVkIHRvIGdldCBVU0Iz
IFBIWVxuIik7DQo+IA0KPiBuaXQ6IERvZXNuJ3QgaXQgZml0IHRvIG9uZSBsaW5lPw0KPiANCj4g
TQ0KDQpZdXAsIG5vdCBzdXJlIHdoeSBJIHdyYXBwZWQgdGhlIGxpbmVzLiBXaWxsIGNoYW5nZS4N
Cg0KLS0gDQpSb2JlcnQgSGFuY29jaw0KU2VuaW9yIEhhcmR3YXJlIERlc2lnbmVyLCBDYWxpYW4g
QWR2YW5jZWQgVGVjaG5vbG9naWVzDQp3d3cuY2FsaWFuLmNvbQ0K
