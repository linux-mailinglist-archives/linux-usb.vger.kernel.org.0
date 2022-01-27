Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A403C49EDAC
	for <lists+linux-usb@lfdr.de>; Thu, 27 Jan 2022 22:45:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231963AbiA0Vp1 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 27 Jan 2022 16:45:27 -0500
Received: from mx0d-0054df01.pphosted.com ([67.231.150.19]:16353 "EHLO
        mx0d-0054df01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233366AbiA0Vp0 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 27 Jan 2022 16:45:26 -0500
Received: from pps.filterd (m0209000.ppops.net [127.0.0.1])
        by mx0c-0054df01.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 20RC5BWk005984;
        Thu, 27 Jan 2022 16:45:13 -0500
Received: from can01-to1-obe.outbound.protection.outlook.com (mail-to1can01lp2056.outbound.protection.outlook.com [104.47.61.56])
        by mx0c-0054df01.pphosted.com (PPS) with ESMTPS id 3duu31rbk7-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 27 Jan 2022 16:45:13 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UN+jpJdoJJlQo+RF1QlHvSvMPdJ+n3yQwODovStoJzKsvlIYapsZBpc5RJmEMv+uMQkDAOgf0hr2LdC1UZlIr5A1th5RjCpFxygzom+i/yf7SCPhzrGEx1QpzAy1X7XpoMPBjyE0Vhz7fmm1CXEOoE9rCC7TUyzGHhaTJvWTrMhou3JyQLb0ROHtk+biYPZAAjH08zwEdjYypZiLbkywmDf6lPIO46nB36O6GCsWkD8BToTUu+4Jak6aAaZZXxi2twxdWPrZ7KYOwKc5YTjZFBmbtBtxJAGZblKSKqJDgYavNy/RSuWmLNl6929IsLHutTGC1/mn20qPg8d68/xygA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=64YmWOEWsFGLCccHDd9zM/L+Yj/X+HRVZLmLOkm5S5c=;
 b=H7GCUehqcEGJcUEtDnF6lb6dxPJ9mjeOximgDTttmVum0sOU4OGbwnAts97krTs65bLo99Ve9f4vDGOUziF5fBepFJdMPGaB6/IY15WNfG1J7hYqaLAm7r8/w484Rgc8JCI7aN+ZOXH1/etYG7chIHo1YlfLX+sPJhyxWr9IrlX3+RZ3GswJQXTUT4DEmRS52CqHVkYcnwGi/GIJXIbFbn0tnlPvKo6+CNjJVqnUOxaeMAEFgs0FGni+jBxjZgnI9muccyLPwBtzF8FBBKJsHwkUG789h5ta3ZRXq7S46k1v1t8x5L6OBdqgOooaV/cUhOQ6D6qiajvs+Z07IJbfVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=calian.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=64YmWOEWsFGLCccHDd9zM/L+Yj/X+HRVZLmLOkm5S5c=;
 b=U3hwWDY4h6d1OPYQZOtJ5OiTXIJUZ/Xr8pkN67pbHd1HFgEpM9kotMtvJoteOeINTmT9/vaOBp3lUEfj11oAUjFtOVqI+UTGFYYVQmEGwU7yvDoiBPOHSWHXyXG40VFML48VKmAQP5DBZLb6xWczEXsy//0MVr5MtdpjryJP9o0=
Received: from YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:6a::19)
 by YT3PR01MB8820.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:7d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.17; Thu, 27 Jan
 2022 21:45:11 +0000
Received: from YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::6929:c39f:d893:b6c8]) by YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::6929:c39f:d893:b6c8%2]) with mapi id 15.20.4888.020; Thu, 27 Jan 2022
 21:45:11 +0000
From:   Robert Hancock <robert.hancock@calian.com>
To:     "sean.anderson@seco.com" <sean.anderson@seco.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
CC:     "manish.narani@xilinx.com" <manish.narani@xilinx.com>,
        "michal.simek@xilinx.com" <michal.simek@xilinx.com>,
        "piyush.mehta@xilinx.com" <piyush.mehta@xilinx.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "balbi@kernel.org" <balbi@kernel.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: Re: [PATCH v8 3/3] usb: dwc3: xilinx: Add ULPI PHY reset handling
Thread-Topic: [PATCH v8 3/3] usb: dwc3: xilinx: Add ULPI PHY reset handling
Thread-Index: AQHYEw4cKdrCLpyMAkmRB8a35wnjcKx3Tb4AgAAad4A=
Date:   Thu, 27 Jan 2022 21:45:11 +0000
Message-ID: <6aa43d6182286e197b3d8361f65747a3b657d490.camel@calian.com>
References: <20220126234017.3619108-1-robert.hancock@calian.com>
         <20220126234017.3619108-4-robert.hancock@calian.com>
         <a0505ff0-093b-eb67-98b0-b2c93a2771ab@seco.com>
In-Reply-To: <a0505ff0-093b-eb67-98b0-b2c93a2771ab@seco.com>
Accept-Language: en-CA, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.28.5 (3.28.5-18.el8) 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7a9f8665-df96-4f55-368b-08d9e1de4b90
x-ms-traffictypediagnostic: YT3PR01MB8820:EE_
x-microsoft-antispam-prvs: <YT3PR01MB88205185573E94DB41B8A4B6EC219@YT3PR01MB8820.CANPRD01.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: w1oLgRpR69iAvnWzZZAbogCPKS7xrnSEkFsiUT/WYVeSFeZAlm4jR9OAG5bt6nm5U5Rplr8NkRJvK7ED5vMzTYfmpnBKUOft1Rqf51sJzBCxbWvUkHZ2mlin7QLMK1rnGBt3CkifiJOKX6VavIORbimFs5yZemJiBFEo4kofE4SK28YhSDqTapOYO/RD7DHdZruFggzJjo7dB8XxvGzfY6INplRnxa3sEprgE6C988gjQv7rIe0iJJQ8pQ8gjfnbjwnegFJhcXffwkxwWOkB44o9dMzTNMWhvixLpZuOe4E3b44kr7o29SYs9+mzNiNt621t+urEmwxwJT/ZI/6WM46ZSQWs7Wiajb8nXSrAhqEkiwscZ8acjVgKNHquqP7ASvrmSnFMlQKtxs/Ox0RAB85Y0OUDo3Evbz0WH3zPKeiAu3KTM1vxZem65nSX7ecozrF5M6afvgvCmEMSIE37YfYjlhDcCbWJRFSIDjueok3Wc7zR5fi1ESAPw4v0jdSExgXN8QwbVytUNWoAA+TypYBTHX3gUqQTp0m+9xfkS21aVydIvptAeKVmTyPrVxokjj99f7Z+g6usUUloYQX+jDc9CuSG6Vq4vV6nLDoLGe+PXEUqWXsIlcl0mnK6hH3VGS48su6numK+wAwAXKupsJyXs+OlPGyZ/T0lvLboZqBjQ1IwSoSmg1hBUiW0T0NBg/2rCmfJ4p1WlX8tw/3qqgsvUFlV7HSoIra9WMvrtaPAj8P9vD3A2TfYxMsESUlR+Z/j0knLUkRO31zH0DD3yJzzpMigV2gaJJE0JSg/BDLOQNpNqNbcogR4oaeGBgGORWMwStSMmeQe/Etv0uETPje06lWAZHaJRhM6VqVMyrg=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(83380400001)(186003)(26005)(6506007)(2616005)(6512007)(36756003)(53546011)(71200400001)(5660300002)(38100700002)(15974865002)(66556008)(508600001)(6486002)(122000001)(2906002)(316002)(64756008)(8936002)(66446008)(8676002)(38070700005)(44832011)(54906003)(66476007)(66946007)(76116006)(110136005)(86362001)(4326008)(99106002)(18886075002)(20210929001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?d05RU2xKL0lGQWl0V0lVQXJZaWxEM2ptYmJXL1l3c2p3TjVKOFYzRTVZTHM3?=
 =?utf-8?B?Vy9UeHhtUmtrL1FJUDV3VzJ0bnVoUE1vOWpjWGw2eGpDRHI3VjU4T2oxZ0M3?=
 =?utf-8?B?QjFHUWVwR2tzN2FKQ0JFbnFTaUs1cmtqSWlFcVdaSnQxOUNzRllMMWg0S2k5?=
 =?utf-8?B?UlRnMkdHRk01cTNQUmhNc211UXhrVGk3LzJLVm1veEhsNS81QXp3dWJQMXBV?=
 =?utf-8?B?SllsNGQ5eWxjTVpvaXQxNlRLcGJGaFNURGR5RSs4ZGlrMUhKNmphR1lRdDRq?=
 =?utf-8?B?ZHZzbVpXb3U2Y1JBdHJhVTFueXBGREk2RjZkSU5vQTJEZUVSSEJlUDZrUWNo?=
 =?utf-8?B?SzQ2alhja1p0Uk90Z1N6K203Uk5jbGlCdW03SDFQcFVKekdPNm51NVhRcTRp?=
 =?utf-8?B?MVZDZWpCRkVzRVZqek5WQmJhVzEvWjJDN3RwZkd2Q1h4cFJGR3F3VUhLdGpz?=
 =?utf-8?B?d2NuT200Nm9abWNKM2hHWlVnMHJkMjJtbG1QekNpSFgzVXZmOWorci9uWmkv?=
 =?utf-8?B?Q3pyNzAyTWlCTWdvQlFxdTFCSGVrNXNHaGxqZmludzdrZndGL0hCMVNQTklC?=
 =?utf-8?B?SHU5RSt0ZHdUTWZCOXE2VmNobHdQVmdScndrVVlkaXo4TGMxb1gzZHhnYkN3?=
 =?utf-8?B?bW0yazZ4MS9lR3lWMUZXQ09RM3YzbDFSc3RkbHdZQ3BFWXByN1dqQStRRTF4?=
 =?utf-8?B?cUpoZnFzQnhiTzR3cGtZdUVWVnA3T2tDZC96dktyUDNzQStwV09OeFZucXVC?=
 =?utf-8?B?TjVBOVF0aVdTSktEeWRjeXI1WXpDMitFdEVLNkRoc1VPUFJDa2pSenJieGR6?=
 =?utf-8?B?TUwvODVaTnhURytjdXVGa0FxdEdoaVg3NjcvRFY0cmZ2bm1XTkdlQkdsbzNh?=
 =?utf-8?B?dUluQ1BlZEVLVWJTSy9BTVc2ZG1uaXNFSi9OQ3gxaGV5UmgyV3gzSXU4bytL?=
 =?utf-8?B?dSt6TFcreGtOOVZOelFlbEdvWjVNWVlPWDVQQUMwa2l5TjF6MG41TklvdTdK?=
 =?utf-8?B?OFRvd3J5a0hHRkVENUlkL21vZ1FMcEYySDZ0RFV1UDVFTTU1aVBGZXlFRWJC?=
 =?utf-8?B?Zzkwd1NiajlNamFBNEZINXVqUzdrQXNsMUFBQUloSmlxWFpQWDhyRkN0Ujc1?=
 =?utf-8?B?N0ErV3cvVXZuSkRCMWJMTDR1c1dtMDVnSU9UUVhjVGJXUGJCRDM5Ni9MNlRH?=
 =?utf-8?B?OHRoNytaeTJyemFKUTEwVExwL0tadjdoZXRBVlBFYU9aK1FaRHdtdDI4L3ZM?=
 =?utf-8?B?dnVsRU9mS3A1eDlXbjVSVzdFSDBhTVRlU0x6b1NlNFllOFlTY1JYNDFzVEx0?=
 =?utf-8?B?M2QvUGMrNWQ5N3JQUkJ5bkh2SXkvbW8zUFZrN2VOdjJyTFczd1JmSVVoTTh5?=
 =?utf-8?B?NVhVSVFqbW1DK1NETzRpZGNOZ0NoekZxVzVaWEU3ckphNW1zeXNXeUNEZWh2?=
 =?utf-8?B?Qkw5TXJiam1VemJPV25TYnJBVXprUDlsMVBITVdFdm4rdzNRaHduSzdjenlv?=
 =?utf-8?B?QitocnhUWFpidmFvVFFZdWtUWTBTNHc3YTd6N3g3MnEwNkNkbVJkeUV0NXNI?=
 =?utf-8?B?bXNYZnBUbVFTdjVWZG1TNG55bXVrY3RJY2VSNVRzUkdIMEtnYUVPVktkMDJE?=
 =?utf-8?B?VUltSVlyZnhFb3JXdnFUdGNIcTJnekhrY0JRclVpVHZrUkRuRWZkQ3pGME81?=
 =?utf-8?B?Ni9tTWFJVE91elE4M1JDZlduTHdPS1BZZ3RPa0didTRxTW9SY0VvTmdhdVZ3?=
 =?utf-8?B?RDB6ZENLRCtvYmpRS2M4UnF1RzFrUFhjQnN4amduVzJLcjYvTEVlTW01ekxP?=
 =?utf-8?B?ZS9qdGJoVVBQOWFiVEFBR1VYQXFibjFSOU9uL296dm9lZVQ4UzlRSUVqWS9L?=
 =?utf-8?B?UlJ3aTU4VmVnNzlJMGZjQWZwbERMY3ZDTk1UMHFoa0RvN0IvTUtRaWw1RUp3?=
 =?utf-8?B?T0Z2SmpvdHpXNlJhWlc2Y251WjlkcmZ5RS90MEpBSU9DNUF2NExWcGRkbTRh?=
 =?utf-8?B?bGlEWC84YkJwaEFKZjJDV1VXYWFvOHhKa09ERVp3UUoyWERITURzVEw1MXB6?=
 =?utf-8?B?bkpac2o4OVoyS05mYTU2bkJmVEFzMXo5OWtlMnFubE14aG43T2ZXSXZoWVho?=
 =?utf-8?B?RWxwc2FtRDRIcmJXUHhFODJuYUdla1ZnSDdyTFhqNlA3aXYxcWFJUW1NRkFm?=
 =?utf-8?B?eURxZ2gzaVZOSFpTSERrNW9aM3NYSkp3ZkpMdUM2Y0UzMk1jYjdQVTBEUFJC?=
 =?utf-8?Q?wzrn41nFRukhL1qPgFUAdbShGjKnF0BMr+xT5Df4tg=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <FA6163C221B6EF469FAF5FC999AA6327@CANPRD01.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: calian.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a9f8665-df96-4f55-368b-08d9e1de4b90
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jan 2022 21:45:11.5586
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 23b57807-562f-49ad-92c4-3bb0f07a1fdf
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: M/+PSgLW+5/ZS10frccy0AzanesytjhqGUYFcSdJhJdlCq+1kgKHHmBA0kNewhDuwYJQvcNFywlbRNyDMf5wY35ylFjBz7C4EBLjMu1jJ2Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YT3PR01MB8820
X-Proofpoint-ORIG-GUID: cC-IO39_X06HzYdcgvZqxIauDikY41Eh
X-Proofpoint-GUID: cC-IO39_X06HzYdcgvZqxIauDikY41Eh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-27_05,2022-01-27_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 phishscore=0 spamscore=0 adultscore=0 priorityscore=1501 bulkscore=0
 clxscore=1015 mlxscore=0 lowpriorityscore=0 mlxlogscore=999
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2201270125
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

T24gVGh1LCAyMDIyLTAxLTI3IGF0IDE1OjEwIC0wNTAwLCBTZWFuIEFuZGVyc29uIHdyb3RlOg0K
PiBIaSBSb2IsDQo+IA0KPiBPbiAxLzI2LzIyIDY6NDAgUE0sIFJvYmVydCBIYW5jb2NrIHdyb3Rl
Og0KPiA+IEhvb2sgdXAgYW4gb3B0aW9uYWwgR1BJTy1iYXNlZCByZXNldCBmb3IgdGhlIGNvbm5l
Y3RlZCBVU0IgVUxQSSBQSFkNCj4gPiBkZXZpY2UuIFRoaXMgaXMgdHlwaWNhbGx5IGFscmVhZHkg
ZG9uZSBieSB0aGUgZmlyc3Qtc3RhZ2UgYm9vdCBsb2FkZXIsDQo+ID4gaG93ZXZlciBpdCBjYW4g
YmUgbW9yZSByb2J1c3QgdG8gZW5zdXJlIHRoaXMgcmVzZXQgaXMgZG9uZSBwcmlvciB0bw0KPiA+
IGxvYWRpbmcgdGhlIGRyaXZlciBpbiBMaW51eC4NCj4gPiANCj4gPiBCYXNlZCBvbiBhIHBhdGNo
ICJ1c2I6IGR3YzM6IHhpbGlueDogQWRkIGdwaW8tcmVzZXQgc3VwcG9ydCIgaW4gdGhlDQo+ID4g
WGlsaW54IGtlcm5lbCB0cmVlIGJ5IFBpeXVzaCBNZWh0YSA8cGl5dXNoLm1laHRhQHhpbGlueC5j
b20+Lg0KPiA+IA0KPiA+IFNpZ25lZC1vZmYtYnk6IFJvYmVydCBIYW5jb2NrIDxyb2JlcnQuaGFu
Y29ja0BjYWxpYW4uY29tPg0KPiA+IC0tLQ0KPiA+ICBkcml2ZXJzL3VzYi9kd2MzL2R3YzMteGls
aW54LmMgfCAxOSArKysrKysrKysrKysrKysrKysrDQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxOSBp
bnNlcnRpb25zKCspDQo+ID4gDQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNiL2R3YzMvZHdj
My14aWxpbnguYyBiL2RyaXZlcnMvdXNiL2R3YzMvZHdjMy0NCj4gPiB4aWxpbnguYw0KPiA+IGlu
ZGV4IGE2ZjNhOWIzODc4OS4uMWVlNjAxMWFkYTQ0IDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMv
dXNiL2R3YzMvZHdjMy14aWxpbnguYw0KPiA+ICsrKyBiL2RyaXZlcnMvdXNiL2R3YzMvZHdjMy14
aWxpbnguYw0KPiA+IEBAIC0xMSw2ICsxMSw3IEBADQo+ID4gICNpbmNsdWRlIDxsaW51eC9zbGFi
Lmg+DQo+ID4gICNpbmNsdWRlIDxsaW51eC9jbGsuaD4NCj4gPiAgI2luY2x1ZGUgPGxpbnV4L29m
Lmg+DQo+ID4gKyNpbmNsdWRlIDxsaW51eC9ncGlvL2NvbnN1bWVyLmg+DQo+ID4gICNpbmNsdWRl
IDxsaW51eC9wbGF0Zm9ybV9kZXZpY2UuaD4NCj4gPiAgI2luY2x1ZGUgPGxpbnV4L2RtYS1tYXBw
aW5nLmg+DQo+ID4gICNpbmNsdWRlIDxsaW51eC9vZl9wbGF0Zm9ybS5oPg0KPiA+IEBAIC0xMDEs
NiArMTAyLDcgQEAgc3RhdGljIGludCBkd2MzX3hsbnhfaW5pdF96eW5xbXAoc3RydWN0IGR3YzNf
eGxueA0KPiA+ICpwcml2X2RhdGEpDQo+ID4gIAlzdHJ1Y3QgcGh5CQkqdXNiM19waHk7DQo+ID4g
IAlpbnQJCQlyZXQgPSAwOw0KPiA+ICAJdTMyCQkJcmVnOw0KPiA+ICsJc3RydWN0IGdwaW9fZGVz
YyAgICAgICAgKnJlc2V0X2dwaW87DQo+ID4gIA0KPiA+ICAJdXNiM19waHkgPSBkZXZtX3BoeV9v
cHRpb25hbF9nZXQoZGV2LCAidXNiMy1waHkiKTsNCj4gPiAgCWlmIChJU19FUlIodXNiM19waHkp
KSB7DQo+ID4gQEAgLTExMCw2ICsxMTIsMTQgQEAgc3RhdGljIGludCBkd2MzX3hsbnhfaW5pdF96
eW5xbXAoc3RydWN0IGR3YzNfeGxueA0KPiA+ICpwcml2X2RhdGEpDQo+ID4gIAkJZ290byBlcnI7
DQo+ID4gIAl9DQo+ID4gIA0KPiA+ICsJcmVzZXRfZ3BpbyA9IGRldm1fZ3Bpb2RfZ2V0X29wdGlv
bmFsKGRldiwgInJlc2V0IiwgR1BJT0RfT1VUX0hJR0gpOw0KPiA+ICsJaWYgKElTX0VSUihyZXNl
dF9ncGlvKSkgew0KPiA+ICsJCXJldCA9IFBUUl9FUlIocmVzZXRfZ3Bpbyk7DQo+ID4gKwkJZGV2
X2Vycl9wcm9iZShkZXYsIHJldCwNCj4gPiArCQkJICAgICAgIkZhaWxlZCB0byBnZXQgcmVzZXQg
Z3Bpb1xuIik7DQo+ID4gKwkJZ290byBlcnI7DQo+ID4gKwl9DQo+ID4gKw0KPiA+ICAJLyoNCj4g
PiAgCSAqIFRoZSBmb2xsb3dpbmcgY29yZSByZXNldHMgYXJlIG5vdCByZXF1aXJlZCB1bmxlc3Mg
YSBVU0IzIFBIWQ0KPiA+ICAJICogaXMgdXNlZCwgYW5kIHRoZSBzdWJzZXF1ZW50IHJlZ2lzdGVy
IHNldHRpbmdzIGFyZSBub3QgcmVxdWlyZWQNCj4gPiBAQCAtMjAxLDYgKzIxMSwxNSBAQCBzdGF0
aWMgaW50IGR3YzNfeGxueF9pbml0X3p5bnFtcChzdHJ1Y3QgZHdjM194bG54DQo+ID4gKnByaXZf
ZGF0YSkNCj4gPiAgCX0NCj4gPiAgDQo+ID4gIHNraXBfdXNiM19waHk6DQo+ID4gKwkvKiB1bHBp
IHJlc2V0IHZpYSBncGlvLW1vZGVwaW4gb3IgZ3Bpby1mcmFtZXdvcmsgZHJpdmVyICovDQo+ID4g
KwlpZiAocmVzZXRfZ3Bpbykgew0KPiA+ICsJCS8qIFRvZ2dsZSB1bHBpIHRvIHJlc2V0IHRoZSBw
aHkuICovDQo+ID4gKwkJZ3Bpb2Rfc2V0X3ZhbHVlKHJlc2V0X2dwaW8sIDApOw0KPiA+ICsJCXVz
bGVlcF9yYW5nZSg1MDAwLCAxMDAwMCk7IC8qIGRlbGF5ICovDQo+ID4gKwkJZ3Bpb2Rfc2V0X3Zh
bHVlKHJlc2V0X2dwaW8sIDEpOw0KPiA+ICsJCXVzbGVlcF9yYW5nZSg1MDAwLCAxMDAwMCk7IC8q
IGRlbGF5ICovDQo+ID4gKwl9DQo+ID4gKw0KPiA+ICAJLyoNCj4gPiAgCSAqIFRoaXMgcm91dGVz
IHRoZSBVU0IgRE1BIHRyYWZmaWMgdG8gZ28gdGhyb3VnaCBGUEQgcGF0aCBpbnN0ZWFkDQo+ID4g
IAkgKiBvZiByZWFjaGluZyBERFIgZGlyZWN0bHkuIFRoaXMgdHJhZmZpYyByb3V0aW5nIGlzIG5l
ZWRlZCB0bw0KPiA+IA0KPiANCj4gRG8gd2UgbmVlZCB0byBoYXZlIHRoaXMgaW4gZHdjMz8gV2h5
IG5vdCBqdXN0IHVzZSB0aGUgdXNiLW5vcC14Y2VpdiBkcml2ZXINCj4gKGFrYSB1c2JfcGh5X2dl
bmVyaWMpPw0KDQpJIGhhZG4ndCBub3RpY2VkIHRoYXQgb3B0aW9uLiBKdXN0IHRyaWVkIGl0IG91
dCBhbmQgaXQgc2VlbXMgbGlrZSBpdCBkb2VzDQp3aGF0J3MgbmVlZGVkLiBTbyBwYXRjaGVzIDIg
YW5kIDMgY2FuIGJlIGRpc3BlbnNlZCB3aXRoLiBQYXRjaCAxIGlzIHN0aWxsDQpuZWVkZWQgaG93
ZXZlciwgSSBtYXkgcmVzdWJtaXQgdGhhdCBhcyBhIHN0YW5kYWxvbmUgcGF0Y2guLg0KDQo+IA0K
PiAtLVNlYW4NCi0tIA0KUm9iZXJ0IEhhbmNvY2sNClNlbmlvciBIYXJkd2FyZSBEZXNpZ25lciwg
Q2FsaWFuIEFkdmFuY2VkIFRlY2hub2xvZ2llcw0Kd3d3LmNhbGlhbi5jb20NCg==
