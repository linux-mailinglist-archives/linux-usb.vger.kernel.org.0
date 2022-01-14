Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA19948F06B
	for <lists+linux-usb@lfdr.de>; Fri, 14 Jan 2022 20:23:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232461AbiANTXK (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 14 Jan 2022 14:23:10 -0500
Received: from mx0c-0054df01.pphosted.com ([67.231.159.91]:51570 "EHLO
        mx0c-0054df01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231594AbiANTXJ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 14 Jan 2022 14:23:09 -0500
Received: from pps.filterd (m0208999.ppops.net [127.0.0.1])
        by mx0c-0054df01.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 20EHKIVq008516;
        Fri, 14 Jan 2022 14:22:52 -0500
Received: from can01-to1-obe.outbound.protection.outlook.com (mail-to1can01lp2052.outbound.protection.outlook.com [104.47.61.52])
        by mx0c-0054df01.pphosted.com (PPS) with ESMTPS id 3dkdg20391-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 14 Jan 2022 14:22:52 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IOZjeEylEmLPgnPnbL5vIHppH960VssYvne6wOysI2Eb4aAvCurXvzv/ek8vs07mcKlEx/+uhgfyUrLCbjJ7fdvn9jO1/t47mShfsrHPHYyC1sYBBIB6xqPjRmlhWiekTlrkKyX2JKN/Du3aEwRKz45vmaJahB+cWhde87iMOG98Qojdr5Ih+v2wpm9ZAgZXoVybJ9jdqIrNXpJOX/09QeT3cMRmmHgza5lwV4bZGlhH4hfpi192cSddQ9wukmR3bxO/KwMtwVQt7YzronUF4pgIknvtMsXmsgo6vyqpjX3q0AZMw8AIKHgHAbD7fePWpGHlfEDZ0l+ZYTQf8/lhYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=woXhBnbEKALLxR7F2tm957O/SqWiYiEAilk/p62Cewg=;
 b=AELBdopgN8HO1jRAKLnyOE3KRah7ppaQT/UD9d0zSE1LOzmVaVi1PqaYRyp1D/iuFjll0uPu58wmEzKW8wtrIMxDgZc2nrhVo9kMCMJjs9++O4F1CGnJsBSs9lYML+rwh10CzEwoGUoiLzlH6QjWtFQK6WYtcqQ56Fwnpl2du6f4uMRLfe29UwkI6xIapM3rh7JpA5IRP0jH0Oi3bkA+TF1YH5Fmg+vHaiEyoC3Y+ZZWZ3382VCWit5JeGvv5/5v3Gv4BHjiE0h1DcmjcpOtNja15yAMv8Mz8HLtPUswuXvCQNu10OmOgqmW5KPQL4O1tmg78loBx1qFMB3fmdWIXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=calian.com; dmarc=pass action=none header.from=calian.com;
 dkim=pass header.d=calian.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=calian.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=woXhBnbEKALLxR7F2tm957O/SqWiYiEAilk/p62Cewg=;
 b=0i1C75OGjLICCkXRB3MRlcK8KEDa6UehBFDgNIeM7waWE0fbEfW4QxZbcVGAXC6xDhDTpxliHKu2PI8moxLZUov8sMfGGGsUg6WYe64UpAFvTZe0r0nMourcDnfXN29JvZjrIJnPc59gjd3clBOXYGlM7XOJPy0UWQw+UFIVXx4=
Received: from YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:6a::19)
 by YQBPR0101MB2306.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:c00:a::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.9; Fri, 14 Jan
 2022 19:22:50 +0000
Received: from YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::6929:c39f:d893:b6c8]) by YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::6929:c39f:d893:b6c8%2]) with mapi id 15.20.4888.012; Fri, 14 Jan 2022
 19:22:50 +0000
From:   Robert Hancock <robert.hancock@calian.com>
To:     "sean.anderson@seco.com" <sean.anderson@seco.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
CC:     "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "mounika.grace.akula@xilinx.com" <mounika.grace.akula@xilinx.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "Thinh.Nguyen@synopsys.com" <Thinh.Nguyen@synopsys.com>,
        "michal.simek@xilinx.com" <michal.simek@xilinx.com>,
        "balbi@kernel.org" <balbi@kernel.org>,
        "manish.narani@xilinx.com" <manish.narani@xilinx.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v4 4/5] usb: dwc3: add reference clock FLADJ configuration
Thread-Topic: [PATCH v4 4/5] usb: dwc3: add reference clock FLADJ
 configuration
Thread-Index: AQHYCQFGRKNCU130Okii/99MEs7tVqxi0K0AgAAVjIA=
Date:   Fri, 14 Jan 2022 19:22:50 +0000
Message-ID: <d416c324097a4feab4fa38d64a770d2a099d36c8.camel@calian.com>
References: <20220114044230.2677283-1-robert.hancock@calian.com>
         <20220114044230.2677283-5-robert.hancock@calian.com>
         <cf9ec164-7d9f-8209-5d2a-8e8c26a7be7e@seco.com>
In-Reply-To: <cf9ec164-7d9f-8209-5d2a-8e8c26a7be7e@seco.com>
Accept-Language: en-CA, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.28.5 (3.28.5-18.el8) 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b6986424-09ec-49a3-1400-08d9d793411c
x-ms-traffictypediagnostic: YQBPR0101MB2306:EE_
x-microsoft-antispam-prvs: <YQBPR0101MB23060ADE3D756883E3190C99EC549@YQBPR0101MB2306.CANPRD01.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: cI0lKxUOkngn8amjHPKkHYOjV1OZFHJRWAbvb/nXUmLE27GKNtzH5o91bcfTSKbB4BK0cSmHIURVXLQ5flNieFqEAu2CmO/oJypk/gkvL11WLBPS3UJilt8Y5UhprFTcXjysFLNMcuNQXdRaRHoSIPlTYAlp8gsonhnyWLCheGywbf0zPbeajK8MAuhG9yb2bC6MWGn0ZwhB0qfl+675dN+rKm0HGYkqADvyD7m0cf68dXFGaZZV2ZeN6QpkfrM7NtMdEW/LqXynzOBlRzYdaumxxULYNJd35/IqRQl5a7ARS2jJgP5cH4dKShChphjuYZj0S2Eq1yIfTGZkdhl0OBm487hbGDJska2kxyGx2fnj684JOTDPMCKSLCQXGu++kjlOoItLFIhmq2O6PjKyoJFoCP4/c0zDc4068dQpPU0oLnKTHY9qAbnlmXmRpuXlV0D/0tFuhiZBTqbRvdFzisjFkKyYElqtPMJ9RbgQAB5yu6nBWQSsOJ/NRq5TV7JNZjxqJEvMQ5yiXED1tLOfj+jiBnyZKQ5G6J6PGcq8r8ukSew8LOeNL6NMLmbpTb7mFFMcbk1uKfMYBCPofq8H0cehV6eSrjED90fKSypd2xWHA98kaBUNrSoRlLS+l20Dn1cpxJB0pmqtkhCpMpPQ2t2X9TuQS6VT0t535Yxu8vtzwhljCRlMfWEC00i3xMKLsCTZb+hosIonxiGZ1Mz9QmunOmfVbOkM5cjmzUffieGLbUJMjbUixvJY6ZcDfobmYEoKpw04YtAvtgkGV5Tf+7pjnStTZKTtPprvnv4Pw7Oo+PvAwqrrgwmRKq/310F5
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(366004)(966005)(44832011)(316002)(4326008)(7416002)(6512007)(8676002)(76116006)(2616005)(38070700005)(83380400001)(6486002)(36756003)(66946007)(66476007)(54906003)(5660300002)(110136005)(38100700002)(122000001)(64756008)(2906002)(66556008)(186003)(6506007)(8936002)(26005)(91956017)(66446008)(71200400001)(86362001)(53546011)(508600001)(99106002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YXdsQUIzSk5wMEpYVE4yeCtzV256RDVoVnoyclk1OHBwRDJUK3MzOTFHQkJC?=
 =?utf-8?B?c0JsZ2o0UEEvYlk5N1hYQXg1enJvNUxqc2lGVjhyQWVqYS9BNXlncE13Ujhm?=
 =?utf-8?B?Y05pNEtQTURRdWZlMUxTY1E1aXkxSDd5MVJFOWtrSW1DQlF3bTNSTU9LVHV5?=
 =?utf-8?B?T1RScnorVXhXM0NUNlRNV3dkclB6ak1Pc0kxcjlYbzNzbWpnWXg5TE9qeVRX?=
 =?utf-8?B?YjdrNmFEdDM0UjZPeUhTaEZMNndod1dPYWswWmF6UUljbHFyZUErTFhKREV0?=
 =?utf-8?B?NEhHbVJFMDJuWm11VjZkT29vVE95Z2JHb3ZaMEZmWFpYbWdzSzM4NFJ3U3hI?=
 =?utf-8?B?dEVsUG54bHRYWFlyVkhDZ1VNZVNRckRGY0x2bk5NdFpzMlNxOGpXVHlic3F5?=
 =?utf-8?B?a0k2M3JqRkxUM1lVNDFNQmVHa0xtQlh0M2tQcy9CbVJoUUdPcUF6bUhZR1Vy?=
 =?utf-8?B?WnJiZ0xrTHY0ck1PQ0xBY2cvRGJZZytzNTFyd2ROc2RqVlQ3WXFwaVpWb3R0?=
 =?utf-8?B?c2ZwYjhZWHJUWmIzOHNuNTFPeXJ6dXYxcE41VnJyVERPYkl6NlpwcFprcGwr?=
 =?utf-8?B?UWtoNk1XN0NPZmw3ZHRMR3RHSFB3b1A3anhkTmVyZmJTMnNnRFF1VDhmRGRC?=
 =?utf-8?B?WTNRWnNyNWUrUWJncmtWRDFON0p6V0hISE9ibmszTnBsQnEraXBFa2U1L2VI?=
 =?utf-8?B?ODhCMkRkYXM2TDIyOVA5bHFkakpDZ3VBb1J3UDQ5d1EvTzRGVnV1UDRXL2lr?=
 =?utf-8?B?dmw1WllJdDl6S1ppNjEvaVFiSTE2U0sycmJTTXhnU3ZXRWU5Umd6UVVjRkpM?=
 =?utf-8?B?UllzNkJyVjVRc3pmT3ZwY2ZzT3NpcURselZIeGM4L0ZLYUk2bk1QZVk1MWJL?=
 =?utf-8?B?TUgxbys2VzdPaGJJRFJRS2FNcXpQVlBDR0ZKWU9mdFA3RC9GT1UydkZQRDlM?=
 =?utf-8?B?b0NoSEZ5b290Q2o0U0lERFRmaFpPYzhjTzE0WmkvbTBRMDJLajdEdGpkRmN3?=
 =?utf-8?B?R2tieC9ORWhTU0hQMjlFTXYwTk82aVZscVM3WXkxQnFqcTFHWW9Qa1Mxc3Bi?=
 =?utf-8?B?anM1TGRXdmhkYXlDTlNEdW4yME9COGJOaW9SSjlRMHdNMUtYcVllZ3JSeFJo?=
 =?utf-8?B?SHRVb21BLzFMRTUveHJDcEdXOTdJYm93OGZHNFJqNTU2aDA5eUY2S3dnSjZ5?=
 =?utf-8?B?S1h5Ui9CQTQ0SCtRc2RFTm52akNBQWFDd21PNHl5bHpobEpTR1gzSE1xTXZt?=
 =?utf-8?B?RElSUkpGa3lPWkc0d3ZvQit1MlpnN09FS2pYTXlLdmtpUVRFTFptUnRIck5C?=
 =?utf-8?B?T21jWFY1ZEY2cENlRlV2V3lWY3VjTWJ0NHpEczMweTZyRW5mUVJKZm9tYWtj?=
 =?utf-8?B?OTNiYlpJMVc4RWRrNjI4RUM2ZFVwbzR0N1A4TG5OQUorMS9VeVA2YW1oY0Uz?=
 =?utf-8?B?UFBVSFpqak5ZSzdlSTFVVGJsdktUYmZUWG5hdUlrZDNvV2ZFZGxvdTVOV2kz?=
 =?utf-8?B?aStYc2VCOVhXUXRjZjM1cTlrY3pnb200UnJSZzc2bFFMc1FKdVBVQ3lrK2Fq?=
 =?utf-8?B?cEJXSzR3bVFaNWZoZDI0eXV2OFFwU3dUWEJXN3N6aElCVDBpaVdtUHJTRzE1?=
 =?utf-8?B?V3FlVjJmMVlJb0lsSFVFVVZhdWc0MzArdWljUUhlT0l5ZlVoZVptWjR2TDhG?=
 =?utf-8?B?V1QrWDhhb1JMRTNvUm9CYitHNHFqOWV3Snh5VGQrTzlKSzdKa2NTT3RnaTBC?=
 =?utf-8?B?N3RSczlYL29ueGVVbHJKNlFxQXRyN2hMU0ZqUTNYZGlrZWhSQzZBc1VDUkVF?=
 =?utf-8?B?R0hUUk5JcTJtOE43MVdDZnhPQ1BzNG8xRFJ1TmRWUmJFWGFlTE1EZmloK0l1?=
 =?utf-8?B?M1hYWE1GOWtEQmRsbHJhc0pSby9lYWNjZlAwT3pKY1RTV0g4a0xDdGZpRzJ3?=
 =?utf-8?B?L3JLVWZ1eGd1cVBvZzBBQ1R6eDYydmdWbVJML01ZTmYyQnIzNUEycHp6UWFR?=
 =?utf-8?B?RWNjZEZVRjhQMVJqUHBodnFtUFUzZ0pJbW1NZVpaWTVuamY1SnB2WlVMdlBZ?=
 =?utf-8?B?aTBML1prTkdtRkY2YXRaVXBCdWMzWlEvZlhMZGZQTThWSlIycEd0YkFWRUlI?=
 =?utf-8?B?Q3BmUGMrS0dYNVBjZFVSNk9VODdxYTdZSHIvR2lvSHAxTjJjaHNiREkwd0pn?=
 =?utf-8?B?WG81QTV0WW5xQytoTHRFVk04c0hLc1B1akVvdHp0MmZoWi9nM2dvVkdqL1VD?=
 =?utf-8?Q?f+SONMKHRnSG/BUF4HPBrEPxklODMuZAhFQtb+NuKg=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <AE3638BF0ECC654BB097012BBE6B9958@CANPRD01.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: calian.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: b6986424-09ec-49a3-1400-08d9d793411c
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jan 2022 19:22:50.1690
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 23b57807-562f-49ad-92c4-3bb0f07a1fdf
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QUQaMXSL+9gCwz+W5pDas7bgargscXBRBODrUqusmYFxIf/iZ2XgCzvstl2I7N+/PfLAPezJ4UgQGBITLCyEVLoegQvtzzWigceqMGldC+w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YQBPR0101MB2306
X-Proofpoint-GUID: kbAxxR35LnjV584nGILP6VctOSS7ijbb
X-Proofpoint-ORIG-GUID: kbAxxR35LnjV584nGILP6VctOSS7ijbb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-14_06,2022-01-14_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 mlxscore=0 malwarescore=0 phishscore=0 bulkscore=0
 mlxlogscore=999 clxscore=1011 priorityscore=1501 adultscore=0 spamscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201140116
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

T24gRnJpLCAyMDIyLTAxLTE0IGF0IDEzOjA1IC0wNTAwLCBTZWFuIEFuZGVyc29uIHdyb3RlOg0K
PiBIaSBSb2JlcnQsDQo+IA0KPiBPbiAxLzEzLzIyIDExOjQyIFBNLCBSb2JlcnQgSGFuY29jayB3
cm90ZToNCj4gPiBQcmV2aW91c2x5IGEgZGV2aWNlIHRyZWUgcHJvcGVydHkgd2FzIGFkZGVkIHRv
IGFsbG93IG92ZXJyaWRpbmcgdGhlDQo+ID4gcmVmZXJlbmNlIGNsb2NrIHBlcmlvZCBwYXJhbWV0
ZXIgaWYgdGhlIGRlZmF1bHQgdmFsdWUgdXNlZCB3YXMgaW5jb3JyZWN0Lg0KPiA+IEhvd2V2ZXIs
IHRoZXJlIGlzIGFub3RoZXIgcmVnaXN0ZXIgZmllbGQsIEdGTEFESl9SRUZDTEtfRkxBREosIHdo
aWNoDQo+ID4gcmVmbGVjdHMgdGhlIGZyYWN0aW9uYWwgbmFub3NlY29uZCBwb3J0aW9uIG9mIHRo
ZSByZWZlcmVuY2UgY2xvY2sNCj4gPiBwZXJpb2QuIEFkZCBhIHNucHMscmVmLWNsb2NrLWZsYWRq
IHByb3BlcnR5IHRvIGFsbG93IGNvbmZpZ3VyaW5nIHRoaXMNCj4gPiBhcyB3ZWxsLg0KPiA+IA0K
PiA+IE9uIHRoZSBYaWxpbnggWnlucU1QIHBsYXRmb3JtLCB0aGUgcmVmZXJlbmNlIGNsb2NrIGFw
cGVhcnMgdG8gYWx3YXlzDQo+ID4gYmUgMjAgTUh6LCBnaXZpbmcgYSBjbG9jayBwZXJpb2Qgb2Yg
NTAgbnMuIEhvd2V2ZXIsIHRoZSBkZWZhdWx0IHZhbHVlDQo+ID4gb2YgR0ZMQURKX1JFRkNMS19G
TEFESiB3YXMgMTAwOCByYXRoZXIgdGhhbiAwIGFzIGl0IHNob3VsZCBoYXZlIGJlZW4sDQo+ID4g
d2hpY2ggcHJldmVudGVkIG1hbnkgVVNCIGRldmljZXMgZnJvbSBmdW5jdGlvbmluZyBwcm9wZXJs
eS4gVGhlDQo+ID4gcHN1X2luaXQgY29kZSBydW4gYnkgdGhlIFhpbGlueCBmaXJzdC1zdGFnZSBi
b290IGxvYWRlciBzZXRzIHRoaXMNCj4gPiB2YWx1ZSB0byAwLCBob3dldmVyIHdoZW4gdGhlIGNv
bnRyb2xsZXIgaXMgcmVzZXQgYnkgdGhlIGR3YzMteGlsaW54DQo+ID4gbGF5ZXIsIHRoZSBpbmNv
cnJlY3QgZGVmYXVsdCB2YWx1ZSBpcyByZXN0b3JlZC4gVGhpcyBjb25maWd1cmF0aW9uDQo+ID4g
cHJvcGVydHkgYWxsb3dzIGVuc3VyaW5nIHRoYXQgdGhlIGNvcnJlY3QgdmFsdWUgaXMgYWx3YXlz
IHVzZWQuDQo+ID4gDQo+ID4gUmV2aWV3ZWQtYnk6IFRoaW5oIE5ndXllbiA8VGhpbmguTmd1eWVu
QHN5bm9wc3lzLmNvbT4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBSb2JlcnQgSGFuY29jayA8cm9iZXJ0
LmhhbmNvY2tAY2FsaWFuLmNvbT4NCj4gPiAtLS0NCj4gPiAgIGRyaXZlcnMvdXNiL2R3YzMvY29y
ZS5jIHwgMzUgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysNCj4gPiAgIGRyaXZl
cnMvdXNiL2R3YzMvY29yZS5oIHwgIDUgKysrKysNCj4gPiAgIDIgZmlsZXMgY2hhbmdlZCwgNDAg
aW5zZXJ0aW9ucygrKQ0KPiA+IA0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3VzYi9kd2MzL2Nv
cmUuYyBiL2RyaXZlcnMvdXNiL2R3YzMvY29yZS5jDQo+ID4gaW5kZXggZjRjMDk5NTFiNTE3Li5h
ZDIyNGZiODA4OGUgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy91c2IvZHdjMy9jb3JlLmMNCj4g
PiArKysgYi9kcml2ZXJzL3VzYi9kd2MzL2NvcmUuYw0KPiA+IEBAIC0zNTksNiArMzU5LDM3IEBA
IHN0YXRpYyB2b2lkIGR3YzNfcmVmX2Nsa19wZXJpb2Qoc3RydWN0IGR3YzMgKmR3YykNCj4gPiAg
IH0NCj4gPiANCj4gPiANCj4gPiArLyoqDQo+ID4gKyAqIGR3YzNfcmVmX2Nsa19mbGFkaiAtIFJl
ZmVyZW5jZSBjbG9jayBwZXJpb2QgYWRqdXN0bWVudCBjb25maWd1cmF0aW9uDQo+ID4gKyAqIEBk
d2M6IFBvaW50ZXIgdG8gb3VyIGNvbnRyb2xsZXIgY29udGV4dCBzdHJ1Y3R1cmUNCj4gPiArICoN
Cj4gPiArICogR0ZMQURKX1JFRkNMS19GTEFESiBzaG91bGQgYmUgc2V0IGJhc2VkIG9uIHRoZSBm
cmFjdGlvbmFsIHBvcnRpb24gb2YNCj4gPiB0aGUNCj4gPiArICogcmVmZXJlbmNlIGNsb2NrIHBl
cmlvZCwgd2hlcmUgdGhlIGludGVnZXIgcG9ydGlvbiBpcyBzZXQgaW4NCj4gPiBHVUNUTF9SRUZD
TEtQRVIuDQo+ID4gKyAqIENhbGN1bGF0ZWQgYXM6ICgoMTI1MDAwL3JlZl9jbGtfcGVyaW9kX2lu
dGVnZXIpLQ0KPiA+ICgxMjUwMDAvcmVmX2Nsa19wZXJpb2QpKSAqIHJlZl9jbGtfcGVyaW9kDQo+
ID4gKyAqIHdoZXJlIHJlZl9jbGtfcGVyaW9kX2ludGVnZXIgaXMgdGhlIHBlcmlvZCBzcGVjaWZp
ZWQgaW4gR1VDVExfUkVGQ0xLUEVSDQo+ID4gYW5kDQo+ID4gKyAqIHJlZl9jbGtfcGVyaW9kIGlz
IHRoZSBwZXJpb2QgaW5jbHVkaW5nIGZyYWN0aW9uYWwgdmFsdWUuDQo+ID4gKyAqIFRoaXMgdmFs
dWUgY2FuIGJlIHNwZWNpZmllZCBpbiB0aGUgZGV2aWNlIHRyZWUgaWYgdGhlIGRlZmF1bHQgdmFs
dWUgaXMNCj4gPiBpbmNvcnJlY3QuDQo+ID4gKyAqIE5vdGUgdGhhdCAwIGlzIGEgdmFsaWQgdmFs
dWUuDQo+ID4gKyAqLw0KPiA+ICtzdGF0aWMgdm9pZCBkd2MzX3JlZl9jbGtfZmxhZGooc3RydWN0
IGR3YzMgKmR3YykNCj4gPiArew0KPiA+ICsJdTMyIHJlZzsNCj4gPiArCXUzMiByZWdfbmV3Ow0K
PiA+ICsNCj4gPiArCWlmIChEV0MzX1ZFUl9JU19QUklPUihEV0MzLCAyNTBBKSkNCj4gPiArCQly
ZXR1cm47DQo+ID4gKw0KPiA+ICsJaWYgKCFkd2MtPnJlZl9jbGtfZmxhZGpfc2V0KQ0KPiA+ICsJ
CXJldHVybjsNCj4gPiArDQo+ID4gKwlyZWcgPSBkd2MzX3JlYWRsKGR3Yy0+cmVncywgRFdDM19H
RkxBREopOw0KPiA+ICsJcmVnX25ldyA9IHJlZyAmIH5EV0MzX0dGTEFESl9SRUZDTEtfRkxBREpf
TUFTSzsNCj4gPiArCXJlZ19uZXcgfD0gRklFTERfUFJFUChEV0MzX0dGTEFESl9SRUZDTEtfRkxB
REpfTUFTSywgZHdjLQ0KPiA+ID5yZWZfY2xrX2ZsYWRqKTsNCj4gPiArCWlmIChyZWdfbmV3ICE9
IHJlZykNCj4gPiArCQlkd2MzX3dyaXRlbChkd2MtPnJlZ3MsIERXQzNfR0ZMQURKLCByZWdfbmV3
KTsNCj4gPiArfQ0KPiA+ICsNCj4gPiArDQo+ID4gICAvKioNCj4gPiAgICAqIGR3YzNfZnJlZV9v
bmVfZXZlbnRfYnVmZmVyIC0gRnJlZXMgb25lIGV2ZW50IGJ1ZmZlcg0KPiA+ICAgICogQGR3Yzog
UG9pbnRlciB0byBvdXIgY29udHJvbGxlciBjb250ZXh0IHN0cnVjdHVyZQ0KPiA+IEBAIC0xMDMz
LDYgKzEwNjQsNyBAQCBzdGF0aWMgaW50IGR3YzNfY29yZV9pbml0KHN0cnVjdCBkd2MzICpkd2Mp
DQo+ID4gDQo+ID4gICAJLyogQWRqdXN0IFJlZmVyZW5jZSBDbG9jayBQZXJpb2QgKi8NCj4gPiAg
IAlkd2MzX3JlZl9jbGtfcGVyaW9kKGR3Yyk7DQo+ID4gKwlkd2MzX3JlZl9jbGtfZmxhZGooZHdj
KTsNCj4gPiANCj4gPiAgIAlkd2MzX3NldF9pbmNyX2J1cnN0X3R5cGUoZHdjKTsNCj4gPiANCj4g
PiBAQCAtMTQxOCw2ICsxNDUwLDkgQEAgc3RhdGljIHZvaWQgZHdjM19nZXRfcHJvcGVydGllcyhz
dHJ1Y3QgZHdjMyAqZHdjKQ0KPiA+ICAgCQkJCSAmZHdjLT5mbGFkaik7DQo+ID4gICAJZGV2aWNl
X3Byb3BlcnR5X3JlYWRfdTMyKGRldiwgInNucHMscmVmLWNsb2NrLXBlcmlvZC1ucyIsDQo+ID4g
ICAJCQkJICZkd2MtPnJlZl9jbGtfcGVyKTsNCj4gPiArCWlmICghZGV2aWNlX3Byb3BlcnR5X3Jl
YWRfdTMyKGRldiwgInNucHMscmVmLWNsb2NrLWZsYWRqIiwNCj4gPiArCQkJCSAgICAgICZkd2Mt
PnJlZl9jbGtfZmxhZGopKQ0KPiA+ICsJCWR3Yy0+cmVmX2Nsa19mbGFkal9zZXQgPSB0cnVlOw0K
PiA+IA0KPiA+ICAgCWR3Yy0+ZGlzX21ldGFzdGFiaWxpdHlfcXVpcmsgPSBkZXZpY2VfcHJvcGVy
dHlfcmVhZF9ib29sKGRldiwNCj4gPiAgIAkJCQkic25wcyxkaXNfbWV0YXN0YWJpbGl0eV9xdWly
ayIpOw0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3VzYi9kd2MzL2NvcmUuaCBiL2RyaXZlcnMv
dXNiL2R3YzMvY29yZS5oDQo+ID4gaW5kZXggZTFjYzNmNzM5OGZiLi41MDExMjk2Nzg2ZGUgMTAw
NjQ0DQo+ID4gLS0tIGEvZHJpdmVycy91c2IvZHdjMy9jb3JlLmgNCj4gPiArKysgYi9kcml2ZXJz
L3VzYi9kd2MzL2NvcmUuaA0KPiA+IEBAIC0zODgsNiArMzg4LDcgQEANCj4gPiAgIC8qIEdsb2Jh
bCBGcmFtZSBMZW5ndGggQWRqdXN0bWVudCBSZWdpc3RlciAqLw0KPiA+ICAgI2RlZmluZSBEV0Mz
X0dGTEFESl8zME1IWl9TREJORF9TRUwJCUJJVCg3KQ0KPiA+ICAgI2RlZmluZSBEV0MzX0dGTEFE
Sl8zME1IWl9NQVNLCQkJMHgzZg0KPiA+ICsjZGVmaW5lIERXQzNfR0ZMQURKX1JFRkNMS19GTEFE
Sl9NQVNLCQkweDNmZmYwMA0KPiA+IA0KPiA+ICAgLyogR2xvYmFsIFVzZXIgQ29udHJvbCBSZWdp
c3RlciovDQo+ID4gICAjZGVmaW5lIERXQzNfR1VDVExfUkVGQ0xLUEVSX01BU0sJCTB4ZmZjMDAw
MDANCj4gPiBAQCAtOTg1LDYgKzk4Niw4IEBAIHN0cnVjdCBkd2MzX3NjcmF0Y2hwYWRfYXJyYXkg
ew0KPiA+ICAgICogQHJlZ3Nfc2l6ZTogYWRkcmVzcyBzcGFjZSBzaXplDQo+ID4gICAgKiBAZmxh
ZGo6IGZyYW1lIGxlbmd0aCBhZGp1c3RtZW50DQo+ID4gICAgKiBAcmVmX2Nsa19wZXI6IHJlZmVy
ZW5jZSBjbG9jayBwZXJpb2QgY29uZmlndXJhdGlvbg0KPiA+ICsgKiBAcmVmX2Nsa19mbGFkal9z
ZXQ6IHdoZXRoZXIgcmVmX2Nsa19mbGFkaiB2YWx1ZSBpcyBzZXQvdmFsaWQNCj4gPiArICogQHJl
Zl9jbGtfZmxhZGo6IHJlZmVyZW5jZSBjbG9jayBwZXJpb2QgZnJhY3Rpb25hbCBhZGp1c3RtZW50
DQo+ID4gICAgKiBAaXJxX2dhZGdldDogcGVyaXBoZXJhbCBjb250cm9sbGVyJ3MgSVJRIG51bWJl
cg0KPiA+ICAgICogQG90Z19pcnE6IElSUSBudW1iZXIgZm9yIE9URyBJUlFzDQo+ID4gICAgKiBA
Y3VycmVudF9vdGdfcm9sZTogY3VycmVudCByb2xlIG9mIG9wZXJhdGlvbiB3aGlsZSB1c2luZyB0
aGUgT1RHIGJsb2NrDQo+ID4gQEAgLTExNjYsNiArMTE2OSw4IEBAIHN0cnVjdCBkd2MzIHsNCj4g
PiANCj4gPiAgIAl1MzIJCQlmbGFkajsNCj4gPiAgIAl1MzIJCQlyZWZfY2xrX3BlcjsNCj4gPiAr
CWJvb2wJCQlyZWZfY2xrX2ZsYWRqX3NldDsNCj4gPiArCXUzMgkJCXJlZl9jbGtfZmxhZGo7DQo+
ID4gICAJdTMyCQkJaXJxX2dhZGdldDsNCj4gPiAgIAl1MzIJCQlvdGdfaXJxOw0KPiA+ICAgCXUz
MgkJCWN1cnJlbnRfb3RnX3JvbGU7DQo+ID4gDQo+IA0KPiBEb2Vzbid0IHRoaXMgcHJvcGVydHkg
YWxyZWFkeSBleGlzdCBhcyBzbnBzLHF1aXJrLWZyYW1lLWxlbmd0aC1hZGp1c3RtZW50Pw0KDQpO
bywgaXQncyBhY3R1YWxseSBhIGRpZmZlcmVudCBzZXR0aW5nLCB0aG91Z2ggaXQncyBhIGJpdCBj
b25mdXNpbmcgKGtpbmQgb2YNCnJlZmxlY3RpbmcgdGhhdCB0aGUgYWN0dWFsIHJlZ2lzdGVyIHNl
dHRpbmdzIGFyZSBhIGJpdCBjb25mdXNpbmcpOg0KDQpzbnBzLHJlZi1jbG9jay1wZXJpb2QtbnMg
YW5kIHNucHMscmVmLWNsb2NrLWZsYWRqIHNwZWNpZnkgdGhlIHJlZmVyZW5jZSBjbG9jaw0KcGVy
aW9kICh0aGUgd2hvbGUgbmFub3NlY29uZHMgYW5kIHRoZSBmcmFjdGlvbmFsIHBvcnRpb24gcmVz
cGVjdGl2ZWx5KS4NCg0Kc25wcyxxdWlyay1mcmFtZS1sZW5ndGgtYWRqdXN0bWVudCBpcyBhbm90
aGVyIHNldHRpbmcgd2hpY2ggc2VlbXMgdG8gcmVmbGVjdA0KdGhlIGZyYW1lIGxlbmd0aCBhY2Nv
cmRpbmcgdG8gYSAzMCBNSHogY2xvY2ssIGFuZCB3aGljaCBvdmVycmlkZXMgYW5vdGhlciBpbnB1
dA0KdmFsdWUgdGhhdCdzIHByb3ZpZGVkIHRvIHRoZSBjb3JlIGluIGhhcmR3YXJlLiAoVGhhdCdz
IG15IHVuZGVyc3RhbmRpbmcgYW55d2F5LA0KanVzdCBiYXNlZCBvbiB0aGUgcmVnaXN0ZXIgZGVz
Y3JpcHRpb25zIGluIHRoZSBaeW5xTVAgZG9jdW1lbnRhdGlvbi4gVGhlDQpTeW5vcHN5cyBndXlz
IG1pZ2h0IGhhdmUgYSBiZXR0ZXIgaWRlYSB3aGF0IHRoaXMgYWN0dWFsbHkgZG9lcy4pDQoNCj4g
DQo+IC0tLQ0KPiANCj4gSSByZWFsaXplIHRoZSBjYXQgaXMgYWxyZWFkeSBvdXQgb2YgdGhlIGJh
ZywgYnV0IHRoaXMgc2VlbXMgbGlrZQ0KPiBzb21ldGhpbmcgd2hpY2ggY291bGQgYmUgYmV0dGVy
IG1vZGVsZWQgd2l0aCBhIGZyZXF1ZW5jeSBwcm9wZXJ0eSwgb3IgYnkNCj4gdXNpbmcgYSBjbG9j
ay4gV2l0aCB0aGVzZSBiaW5kaW5ncywgdGhlIGJvYXJkIG1haW50YWluZXIgaGFzIHRvDQo+IGRl
dGVybWluZSB0aGUgcmVmZXJlbmNlIGNsb2NrIGZyZXF1ZW5jeSBhbmQgdGhlbiBtYW51YWxseSBj
YWxjdWxhdGUgdGhlDQo+IGZyYWN0aW9uYWwgYWRqdXN0bWVudC4gIElmIHRoZSByZWZlcmVuY2Ug
Y2xvY2sgaXMgZXZlciBjaGFuZ2VkIChlLmcuIGluDQo+IGEgbmV3IGJvYXJkIHJldmlzaW9uKSwg
dGhlIG1haW50YWluZXIgbXVzdCB0aGVuIHVwZGF0ZSB0d28gcHJvcGVydGllcy4NCj4gSG93ZXZl
ciwgTGludXggY291bGQgY2FsY3VsYXRlIGFsbCB0aGlzIGF1dG9tYXRpY2FsbHkuDQo+IA0KPiBX
ZSBhbHJlYWR5IGhhdmUgYSBjbG9jayBpbnB1dCBmb3IgdGhlIHJlZmVyZW5jZSB3aXRoIHdoaWNo
IHdlIGNhbg0KPiBkZXRlcm1pbmUgdGhlIGZyZXF1ZW5jeSAoYWNjb3JkaW5nIHRvIGJpbmRpbmdz
L3VzYi9zbnBzLGR3YzMueWFtbCwNCj4gdGhvdWdoIEkgY2Fubm90IHNlZSB3aGVyZSBpdCBpcyBp
bXBsZW1lbnRlZCBpbiB0aGUgZHJpdmVyKS4gRXZlbiBvbg0KPiBwbGF0Zm9ybXMgd2l0aG91dCBh
IHJlZmVyZW5jZSBjbG9jayAoc3VjaCBhcyBVU0Igb3ZlciBQQ0llIFsxXSksIG9uZSBjYW4NCj4g
anVzdCBhZGQgYSBmaXhlZC1yYXRlIGNsb2NrIHRvIGFjdCBhcyB0aGUgcmVmZXJlbmNlLg0KDQpU
aGF0IHByb2JhYmx5IHdvdWxkIG1ha2Ugc29tZSBzZW5zZS4uIHRoZSBjb21wbGljYXRpb24gaXMg
dGhhdCBhdCBsZWFzdCBsb29raW5nDQphdCB0aGUgWnlucU1QIHNldHVwIGZvciB0aGlzIFVTQiBj
b3JlLCBpbiB0aGUgZGV2aWNlIHRyZWUgdGhlIHRvcC1sZXZlbCB6eW5xbXAtDQpkd2MzICJ3cmFw
cGVyIiBkcml2ZXIgKGRyaXZlcnMvdXNiL2R3YzMvZHdjMy14aWxpbnguYykgaXMgdGhlIG9uZSB0
aGF0IGhhcyB0aGUNCmNsb2NrcyBtYXBwZWQgdG8gaXQgcmlnaHQgbm93LCBub3QgdGhlIGFjdHVh
bCBzbnBzLGR3YzMgZGV2aWNlIHRoYXQgdGhpcyBkcml2ZXINCmlzIG9wZXJhdGluZyB3aXRoLiBP
dGhlciBkd2MzIHZhcmlhbnRzIGxpa2UgZXh5bm9zLCBpbXg4bXAsIHFjb20gZXRjLiBzZWVtIHRv
DQpiZSBzZXQgdXAgc2ltaWxhcmx5Lg0KDQpJJ20gbm90IGFjdHVhbGx5IHN1cmUgd2h5IGl0IHdh
cyBzZXR1cCB0aGlzIHdheSB3aXRoIGEgcGFyZW50IGFuZCBjaGlsZCBkZXZpY2UNCm5vZGUgd2l0
aCBzZXBhcmF0ZSBkcml2ZXJzLCByYXRoZXIgdGhhbiBqdXN0IGhhdmluZyBkZXZpY2Utc3BlY2lm
aWMgZXh0ZW5zaW9ucw0KaW4gdGhlIGR3YzMgZHJpdmVyIGZvciBpbXBsZW1lbnRhdGlvbnMgdGhh
dCBuZWVkIGl0LiBCdXQgSSdtIGd1ZXNzaW5nIHRoZXJlJ3MNCnByb2JhYmx5IGVub3VnaCBkZXZp
Y2UgdHJlZSByZWZlcmVuY2VzIHRvIHRoYXQgc2V0dXAgdGhhdCB3ZSdyZSBzdHVjayB3aXRoIGl0
DQpub3cuDQoNClNpbXBsaWZpZWQgZXhhbXBsZToNCg0KdXNiMDogdXNiQGZmOWQwMDAwIHsNCiAg
ICAgICAgY29tcGF0aWJsZSA9ICJ4bG54LHp5bnFtcC1kd2MzIjsNCiAgICAgICAgY2xvY2stbmFt
ZXMgDQo9ICJidXNfY2xrIiwgInJlZl9jbGsiOw0KCWNsb2NrcyA9IDwmenlucW1wX2NsayBVU0Iw
X0JVU19SRUY+LCA8Jnp5bnFtcF9jbGsNClVTQjNfRFVBTF9SRUY+Ow0KDQogICAgICAgIGR3YzNf
MDogdXNiQGZlMjAwMDAwIHsNCiAgICAgICAgICAgICAgICBjb21wYXRpYmxlID0gInNucHMsZHdj
MyI7DQogICAgICAgICAgICAgICAgc25wcyxxdWlyay1mcmFtZS1sZW5ndGgtYWRqdXN0bWVudCA9
IDwweDIwPjsNCiAgICAgICAgICAgICAgICBzbnBzLHJlZi1jbG9jay1wZXJpb2QtbnMgPSA8NTA+
Ow0KICAgICAgICAgICAgICAgIHNucHMscmVmLWNsb2NrLWZsYWRqID0gPDA+Ow0KICAgICAgICB9
Ow0KfTsNCg0KDQpJJ20gcHJldHR5IHN1cmUgdGhhdCB0aGUgInJlZl9jbGsiIGNsb2NrIG9uIHRo
ZSB6eW5xbXAtZHdjMyBkZXZpY2UgaXMgd2hhdA0Kc25wcyxkd2MzIGNhbGxzIHRoZSAicmVmIiBj
bG9jayB3aGljaCB0aGVzZSBwZXJpb2Qgc2V0dGluZ3MgYXJlIGRlYWxpbmcgd2l0aCwNCmFuZCBj
dXJyZW50bHkgZG9lc24ndCBkbyBhbnl0aGluZyB3aXRoIGluIGl0cyBjb2RlIGlmIGl0J3MgcHJv
dmlkZWQsIG90aGVyIHRoYW4NCmVuYWJsaW5nIGl0LiBBcyB5b3Ugc2F5LCB0aGUgZHJpdmVyIGNv
dWxkIGp1c3QgcHVsbCBvdXQgdGhlIHJhdGUgb2YgdGhhdCBjbG9jaw0KYW5kIGNhbGN1bGF0ZSB0
aGUgY29ycmVjdCBjbG9jayBwZXJpb2QgdmFsdWVzIG9uIGl0cyBvd24uDQoNCkJ1dCBnaXZlbiB0
aGF0IHByb3BlcnRpZXMgbmVlZCB0byBiZSBhZGRlZCB0byB0aGUgZGV2aWNlIHRyZWUgdG8gc3Vw
cG9ydCB0aGUNCmN1cnJlbnQgYXBwcm9hY2ggYW55d2F5LCBJIGd1ZXNzIHRoZSBkZXZpY2UgdHJl
ZSBzaG91bGQganVzdCBhZGQgdGhlIHJlZiBjbG9jaw0KaW50byB0aGUgY2hpbGQgbm9kZSBhcyB3
ZWxsLi4NCg0KPiANCj4gLS1TZWFuDQo+IA0KPiBbMV0gDQo+IGh0dHBzOi8vdXJsZGVmZW5zZS5j
b20vdjMvX19odHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvOWYzOTliZGYxZmY3NTJlMzFhYjc0
OTdlM2Q1Y2UxOWJiYjNmZjI0Ny4xNjMwMzg5NDUyLmdpdC5iYXJ1Y2hAdGtvcy5jby5pbC9fXzsh
IUlPR29zMGsheXRSQ1JuTzF2RFhrVlNWM056MDZkaFlkVDVraVpVNzVnY2pjczBiUHNzMlVRTTRt
U3dpajhXZ2x6ZGVtM2N0Tkg1ZyQNCj4gIA0K
