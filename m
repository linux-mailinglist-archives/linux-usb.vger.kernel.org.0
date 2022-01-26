Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A55E49D5DB
	for <lists+linux-usb@lfdr.de>; Thu, 27 Jan 2022 00:02:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232802AbiAZXCB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 26 Jan 2022 18:02:01 -0500
Received: from mx0d-0054df01.pphosted.com ([67.231.150.19]:52295 "EHLO
        mx0d-0054df01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230166AbiAZXCA (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 26 Jan 2022 18:02:00 -0500
Received: from pps.filterd (m0209000.ppops.net [127.0.0.1])
        by mx0c-0054df01.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 20QK9QJ8001725;
        Wed, 26 Jan 2022 18:01:53 -0500
Received: from can01-qb1-obe.outbound.protection.outlook.com (mail-qb1can01lp2059.outbound.protection.outlook.com [104.47.60.59])
        by mx0c-0054df01.pphosted.com (PPS) with ESMTPS id 3dud3cr2x0-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 26 Jan 2022 18:01:53 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Kb6F/UNWFuh8spaY9to2qmLQvw2kjRHNVeBRMOj9KImMJ8HVZE1ikdJ1mGwgPMg8BrLKPcS8ABgePRVCgbLeuYPSQdjTJQnYVOwXYbqaHNBu1dCS/skRdmW0usHk6tF9dgqoKiC0UtRo3zza4c84P/lwe1drr14ed9OnzojWOZZuG0vxTVfXX1rCDfve8IovwRpZHvnzyl13lSyu8H4atj4poz2o6f6t2kewLHMT29lteGeXgTLvUYkwncZ2cF+Nteyyg42L0xeSRfkxwz0amkYqQ0EdiJhB+JKO4jj9cxhgz7TXkCqgJn7m+cPvVDEMp8+g6lXN5YStale4+3qCJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P3ilCa2A+0UgjzMoCqdu/XbBxuR4XgDW10wNHL89y/Y=;
 b=lN+GJP/AvCeEAedHwviz/+rpXHPkYbbCedWF0bD3/5HFEypO86cZmwUMF2pbuhq/2oMsO/CAoZuD/ZULm6mgodyNlDuXOT4rOx8PK5TPjS/vgO7tElbHwCRuKl/e6Yjh3fQamrbLESKfCvaMVYZml2qA1rvmBWTNwKeELifXXPDtmRxmmQFQJU8Dt5s4Cry6XBRl7iJgXZW/tjLlRz43K+rf04D5fZMPjGABvJ4Kn1Tc9axqraooTy4L12FLu2wjGiwWKuyvcdQGIYnsMEAOfxRGSacS/Djc5eiUMmeRj/52WMTNA1Df/yOXmm4/S/sr8yQpKz5X9QJWBzlZ0S/HIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=calian.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P3ilCa2A+0UgjzMoCqdu/XbBxuR4XgDW10wNHL89y/Y=;
 b=Dmefz5OffIGIwdKmoYUmSUzZ4Hs2BAEYrnUJ8H4JhDPD13piHegpOOEChwfIl5us+3tRLYJGrGhjFiZZHRkZFGBiQie1R9zdJ42YAsrQJ6ch54sCUeQCh9LyCiJgf/OQA35042gDipnJBDRIvM2uFIIFvEe8S8n0DCid4Hn27MA=
Received: from YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:6a::19)
 by YQXPR01MB3719.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:c00:4c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.15; Wed, 26 Jan
 2022 23:01:49 +0000
Received: from YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::6929:c39f:d893:b6c8]) by YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::6929:c39f:d893:b6c8%2]) with mapi id 15.20.4888.020; Wed, 26 Jan 2022
 23:01:49 +0000
From:   Robert Hancock <robert.hancock@calian.com>
To:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
CC:     "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "sean.anderson@seco.com" <sean.anderson@seco.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "michal.simek@xilinx.com" <michal.simek@xilinx.com>,
        "manish.narani@xilinx.com" <manish.narani@xilinx.com>,
        "balbi@kernel.org" <balbi@kernel.org>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "piyush.mehta@xilinx.com" <piyush.mehta@xilinx.com>
Subject: Re: [PATCH v7 4/4] usb: dwc3: xilinx: Add ULPI PHY reset handling
Thread-Topic: [PATCH v7 4/4] usb: dwc3: xilinx: Add ULPI PHY reset handling
Thread-Index: AQHYEkhjvO9bTxxECk29LvnEpbGKlax17NMA
Date:   Wed, 26 Jan 2022 23:01:49 +0000
Message-ID: <b89621916fe8a4575f75fdb9837c6ac040072f42.camel@calian.com>
References: <20220126000253.1586760-1-robert.hancock@calian.com>
         <20220126000253.1586760-5-robert.hancock@calian.com>
In-Reply-To: <20220126000253.1586760-5-robert.hancock@calian.com>
Accept-Language: en-CA, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.28.5 (3.28.5-18.el8) 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b9fd1883-ab4b-4b2b-81da-08d9e11fd5ac
x-ms-traffictypediagnostic: YQXPR01MB3719:EE_
x-microsoft-antispam-prvs: <YQXPR01MB3719AFF8611C1977C9E674AAEC209@YQXPR01MB3719.CANPRD01.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: jiYttCfikR9aMuxNjsU3h3Z7IgKCtHvTv3EOL5YKOv8Up06YXkFFOKCV+ifqlkNNSn5ndR/kauodHkHFH0sq7rmnOdWv1lSpm78Pu+YnK5NsaxfHt7r8/fZbOl7yJvssIALVo8xHNga5SCnpVyrfZAR9Y9ip5lTSIQvnwkFsuf6OU+ajOciL8nDdemse1L9UBPZ6chnFE5r9VY4zD6qQIanA6qrTAhUc1kPr48Slm13vOIXWOdFAeiKVsnmsIacJySSDHfAImm9SPAemxRWqhJAzRc2/A1mtbVV/0pB8tbeMsBijJixH1O08d4fgnW48R5X/FIn15FBTbyDaEjY9W962hC3WbzG/ql+XzuCHiKx19uGt4mT30ckTxt9/3iDY3kHQAcIFd9H/v8SOjVHNj24Fj12Y61cdtnwsBeyKkKXw2wCMi16M8Fflsl8yxERMUz6DGXIwoWeYwcryVwee6mt3NUhsbKt+n4/oQIBxhvdpiKNsLbv1bDbGLxPtadzzCHR0Y1gnvHlztpIlIU4fRBc+Qlx15hnQaiz6EYxP3pD7Er314OTuugS6jGRmgu8XXCRhlHJCJXg/6EbieZa3ZIV4ZRxxMoJYxZxMHDVBhA+xdchbHKOu6j8cPZlE+lsaGAhcx/fo3JICPf6lykhufq0HL92dsM0LcHi4xLnshbJlLGqiKFWH/PCBAwFRaGoFByvQUN3OVTqQJix70e0YPf1OVgESbjWANYkLozVU8KLyLs0dek2laCDLNdejg+0tq+TCymVlpoIjGAsrgh+SC4M6c6lifZs0aqLnE6Y5m2SiRwrGN7SurT5wdBhu0lcGlaATsPHRU+9+PBbBra1dy7cRf4F26nKt+5nr/C28Uz0=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(15974865002)(54906003)(66446008)(66476007)(8936002)(6486002)(83380400001)(66556008)(4326008)(8676002)(498600001)(66946007)(76116006)(86362001)(64756008)(5660300002)(6916009)(6512007)(186003)(36756003)(38100700002)(122000001)(26005)(2616005)(71200400001)(2906002)(44832011)(38070700005)(6506007)(99106002)(18886075002)(20210929001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OG9FaERUbEphWU9IWjFTTEVPRW5jSDlCeENNWndHcnlpZlJMZDFaeHNoMGFG?=
 =?utf-8?B?UGk4bHBuNDE5WUxlNVA1WWxoeFVpQ3NKUFJTMmE5enN5M0NTZEI1Wk9kLysv?=
 =?utf-8?B?YjdPYXJwbjY4Rk1QbHNwaVFTdTNBdnczcklQc0NtVGprd3NSOU9jV2YyV2xG?=
 =?utf-8?B?Lys5a2RoTHB6MTFpTitTa1NKRGgycE4yUEN1TXZJL1ZmaUtnN055bUQ1RFdh?=
 =?utf-8?B?Wmh4eWx0OERoSzEwR3VHOXh0Vm1rT2ZCKy9QRTd0QWVzVkt1cFhVKy85K0pF?=
 =?utf-8?B?enhYczY3UHp2WnEvSDZObmN5T2dNSmFJYXh3U2J2YjZEcXh5UGlqOUJrK0FC?=
 =?utf-8?B?TDhyeWc5UlZWbnh3WjVnMUxycUYxWXdEb3o2WXpjb0I3VHJaTDJDTmFxTnJS?=
 =?utf-8?B?Tjlwenh1V2M5cmxxRTdWbVdaKzhidFdEZ1FZZjkxYWJjdk95c0FBcGJ3bE43?=
 =?utf-8?B?REVwK3FWbnFZRUdTeDZRZndzTXRPOVNKMlRtcFhHVnlDS2JpR0NuQTNDYXNi?=
 =?utf-8?B?WXVCNHp5WUtlbE9VTkx2dnV5V1FLVS9lcVpKL3Baa3RDclh5SzZQeEJFVWd2?=
 =?utf-8?B?Q2I5eWVnWk5OZzNLQ2RSY0ZXY1pVNWdXbyt3a2tNVm9yTG55dFpaZEZjc2JS?=
 =?utf-8?B?aE1EQk5RcnBnOXZKUytJVktJYm44anVFK29OMFJkSkh6RERiY0kxUUFGekhZ?=
 =?utf-8?B?NUk3dktqMFlWRTV2OGFoMzNVTkJUTkVReDV3d1NPQXkwbnFxZHlEWWpoSlU0?=
 =?utf-8?B?bjZJOWt2RitKTjFxbG9FWWFQZE11K0ZCZHNrdlVUM1dnOTh1bFErMWErS1lq?=
 =?utf-8?B?TnNaMGd6K2R4c3IrTnlkdm1tS1JuS0ZqMTJVVlRhR0FxeU9hSzFVY1dqaXJW?=
 =?utf-8?B?bWhxK3dFMVc2VXBpQWdlcTZiV0hWakYwcThxMUVXeVE4dkRPd1NYSGhDZytE?=
 =?utf-8?B?YVpMRE80bTdYQnVISkwvMXdscTRkTmdEVVB6aE1Nem9DM2t5akZrcDlGN0Nz?=
 =?utf-8?B?NGxrblhQQXBTQS8wWUlJMjVvUS9KZXFHV3dLdmVyUCtRVDIvR3dhMjNLSWZv?=
 =?utf-8?B?YkhUUFE1WnlXU3BOYVM5SUxFa1prNUZyZzMrNG5ocWZ4R1RwVG1HeThTSTVm?=
 =?utf-8?B?cHFpSmoxZjFZbDEyc0FDUnVUMzNyMDFIdjczc28wTjh6dy9TdmxrWTdCdE8x?=
 =?utf-8?B?UnNrU0o4T1BuWThIZWgram9YaDhkd2k5Q3NsVmRwcHIxQ2d6aXduTUVUcEY4?=
 =?utf-8?B?alZkSlhBNUpoWlBZbjRjVUwwcVBwNGdtV2JYRXdaSEI5Ky9SNThSQ2xpK1Uz?=
 =?utf-8?B?ZG1ESUx6S1RJb3dVWDJUektxZnRPakRwTENWd01nRzlPUWZNR0RBZkI1RVQw?=
 =?utf-8?B?TkNqUTQ3M1ZhWXYwK1drc0Q5eHpPbzR6dHZHNWpQbWl0NkxNOWtQaE5OMWtu?=
 =?utf-8?B?K3NIc3Z2WFc5Q1Rpa3gyQ1JZM0hOdjQvazFpREZycXBCTllVemVBMDEzejY3?=
 =?utf-8?B?UFhHbzI5ekdXT1RiRlZZL0R5aG5uZ2JzRVZWRjNrT2ZoaEJHNHM3QTFVZFNI?=
 =?utf-8?B?L3RrSDM5eFhiNHR6MkQzejZrbVdSNHpyZ2E1TGdFT004QXFuVHJTRkRxR2RX?=
 =?utf-8?B?YWVNUXB1WGNEcExxZ3ZaamlCRWtZQ2JFVldNNy9PUGRMalgwMVU5S3VTQWcv?=
 =?utf-8?B?S2pEL2Mxcm8yZmx0SEtwZWlySi9uOWgyc0NuVUUyMTB0R25nRUtzQzR0ZGJD?=
 =?utf-8?B?eTk2U2NUS2VHOGg0YXNNVXRxcUlWSndGMmFtREZSbmxwdENOZ2dER0ZvcG5s?=
 =?utf-8?B?L05wTEdUZ1NhaHRIRnlHT1p5bzh2WUloV3p4MjV2VkVPS3lPZlBhOTV0bXVX?=
 =?utf-8?B?cFVwYmgzeGNBZHFnWnNNZ05JUDBSUUJvRVZUbUliWVZBZHViNzI4TE5OSGVE?=
 =?utf-8?B?c2lkcnhXRXUvMHlaS3BWbDcrKzFxTGdGVWRsNitRcjZWZ2tVbzRTZEF6aXVS?=
 =?utf-8?B?VURZNS8yVGdNWlY4NWFUeVdJRjBGUFptTTJCN0YvOEtMQjNlWE1HT3NwaTdW?=
 =?utf-8?B?eHAxRjNPc2NMcHdENmNaTmtOajY5NUgreFBleUZmTVg1NEJXVlRCSTN3amRm?=
 =?utf-8?B?TGdkamQ4TU8zSGo4WER4UG9yZy9KVk00aGpWTFJnQ2JJbkRrVTg2Q1Q0TGxG?=
 =?utf-8?B?NUc0U2dxNHlWaGUwNm5FWCtSbGEydDVYMFplci94ZkQvMG01c2ZMQkJhMUdK?=
 =?utf-8?Q?S2fcDiMnePFmopE6/0Fh0koy1SOo5FBbCnMkSQyWBw=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A9D5B9A3A1563F4EA30A47F463FC3755@CANPRD01.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: calian.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: b9fd1883-ab4b-4b2b-81da-08d9e11fd5ac
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jan 2022 23:01:49.4255
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 23b57807-562f-49ad-92c4-3bb0f07a1fdf
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AtCxGfpJ7zd0l8aza015KR3pPbzsSjjnho0XWq8oA9lah95/NzCk59nQdnyP01OpG8J+CCLucbdXh5QVU//WGDAGCj+WPgCfezriqUkenhA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YQXPR01MB3719
X-Proofpoint-ORIG-GUID: 0mQTgI9jIOffa0V3vno6Zhg5deao92aE
X-Proofpoint-GUID: 0mQTgI9jIOffa0V3vno6Zhg5deao92aE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-26_09,2022-01-26_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 malwarescore=0
 bulkscore=0 mlxlogscore=999 spamscore=0 lowpriorityscore=0 clxscore=1015
 mlxscore=0 impostorscore=0 phishscore=0 suspectscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2201260131
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

T24gVHVlLCAyMDIyLTAxLTI1IGF0IDE4OjAyIC0wNjAwLCBSb2JlcnQgSGFuY29jayB3cm90ZToN
Cj4gSG9vayB1cCBhbiBvcHRpb25hbCBHUElPLWJhc2VkIHJlc2V0IGZvciB0aGUgY29ubmVjdGVk
IFVTQiBVTFBJIFBIWQ0KPiBkZXZpY2UuIFRoaXMgaXMgdHlwaWNhbGx5IGFscmVhZHkgZG9uZSBi
eSB0aGUgZmlyc3Qtc3RhZ2UgYm9vdCBsb2FkZXIsDQo+IGhvd2V2ZXIgaXQgY2FuIGJlIG1vcmUg
cm9idXN0IHRvIGVuc3VyZSB0aGlzIHJlc2V0IGlzIGRvbmUgcHJpb3IgdG8NCj4gbG9hZGluZyB0
aGUgZHJpdmVyIGluIExpbnV4Lg0KPiANCj4gQmFzZWQgb24gYSBwYXRjaCAidXNiOiBkd2MzOiB4
aWxpbng6IEFkZCBncGlvLXJlc2V0IHN1cHBvcnQiIGluIHRoZQ0KPiBYaWxpbngga2VybmVsIHRy
ZWUgYnkgUGl5dXNoIE1laHRhIDxwaXl1c2gubWVodGFAeGlsaW54LmNvbT4uDQo+IA0KPiBTaWdu
ZWQtb2ZmLWJ5OiBSb2JlcnQgSGFuY29jayA8cm9iZXJ0LmhhbmNvY2tAY2FsaWFuLmNvbT4NCj4g
LS0tDQo+ICBkcml2ZXJzL3VzYi9kd2MzL2R3YzMteGlsaW54LmMgfCAxOCArKysrKysrKysrKysr
KysrKysNCj4gIDEgZmlsZSBjaGFuZ2VkLCAxOCBpbnNlcnRpb25zKCspDQo+IA0KPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy91c2IvZHdjMy9kd2MzLXhpbGlueC5jIGIvZHJpdmVycy91c2IvZHdjMy9k
d2MzLXhpbGlueC5jDQo+IGluZGV4IGUxNGFjMTVlMjRjMy4uMDc3ODIzNjUwOWJmIDEwMDY0NA0K
PiAtLS0gYS9kcml2ZXJzL3VzYi9kd2MzL2R3YzMteGlsaW54LmMNCj4gKysrIGIvZHJpdmVycy91
c2IvZHdjMy9kd2MzLXhpbGlueC5jDQo+IEBAIC0xMSw2ICsxMSw3IEBADQo+ICAjaW5jbHVkZSA8
bGludXgvc2xhYi5oPg0KPiAgI2luY2x1ZGUgPGxpbnV4L2Nsay5oPg0KPiAgI2luY2x1ZGUgPGxp
bnV4L29mLmg+DQo+ICsjaW5jbHVkZSA8bGludXgvZ3Bpby9jb25zdW1lci5oPg0KPiAgI2luY2x1
ZGUgPGxpbnV4L3BsYXRmb3JtX2RldmljZS5oPg0KPiAgI2luY2x1ZGUgPGxpbnV4L2RtYS1tYXBw
aW5nLmg+DQo+ICAjaW5jbHVkZSA8bGludXgvb2ZfcGxhdGZvcm0uaD4NCj4gQEAgLTEwMSw2ICsx
MDIsNyBAQCBzdGF0aWMgaW50IGR3YzNfeGxueF9pbml0X3p5bnFtcChzdHJ1Y3QgZHdjM194bG54
DQo+ICpwcml2X2RhdGEpDQo+ICAJc3RydWN0IHBoeQkJKnVzYjNfcGh5Ow0KPiAgCWludAkJCXJl
dDsNCj4gIAl1MzIJCQlyZWc7DQo+ICsJc3RydWN0IGdwaW9fZGVzYyAgICAgICAgKnJlc2V0X2dw
aW87DQo+ICANCj4gIAl1c2IzX3BoeSA9IGRldm1fcGh5X29wdGlvbmFsX2dldChkZXYsICJ1c2Iz
LXBoeSIpOw0KPiAgCWlmIChJU19FUlIodXNiM19waHkpKSB7DQo+IEBAIC0yMDEsNiArMjAzLDIy
IEBAIHN0YXRpYyBpbnQgZHdjM194bG54X2luaXRfenlucW1wKHN0cnVjdCBkd2MzX3hsbngNCj4g
KnByaXZfZGF0YSkNCj4gIAl9DQo+ICANCj4gIHNraXBfdXNiM19waHk6DQo+ICsJLyogdWxwaSBy
ZXNldCB2aWEgZ3Bpby1tb2RlcGluIG9yIGdwaW8tZnJhbWV3b3JrIGRyaXZlciAqLw0KPiArCXJl
c2V0X2dwaW8gPSBkZXZtX2dwaW9kX2dldF9vcHRpb25hbChkZXYsICJyZXNldCIsIEdQSU9EX09V
VF9ISUdIKTsNCj4gKwlpZiAoSVNfRVJSKHJlc2V0X2dwaW8pKSB7DQo+ICsJCWRldl9lcnJfcHJv
YmUoZGV2LCBQVFJfRVJSKHJlc2V0X2dwaW8pLA0KPiArCQkJICAgICAgIkZhaWxlZCB0byBiaW5k
IHJlc2V0IGdwaW9cbiIpOw0KPiArCQlnb3RvIGVycjsNCj4gDQoNCkp1c3Qgbm90aWNlZCB0aGlz
IGZvcmdldHMgdG8gc2V0IHRoZSBlcnJvciBjb2RlIHRvIFBUUl9FUlIocmVzZXRfZ3BpbykgYW5k
DQpicmVha3MgaW4gdGhlIGRlZmVycmVkIHByb2JlIGNhc2UuIEFsc28sIHRoaXMgc2hvdWxkIGJl
IGRvbmUgZWFybGllciB0byBhdm9pZA0KYmFpbGluZyBvdXQgdG9vIGxhdGUgaW4gdGhhdCBjYXNl
LiBXaWxsIHJlc3VibWl0IGEgbmV3IHBhdGNoc2V0IHdpdGggdGhpcyBmaXgNCmZvciB0aGUgcmVt
YWluaW5nIHR3byBwYXRjaGVzIChmaXJzdCAyIGluIHRoaXMgc2VyaWVzIHdlcmUgYWxyZWFkeSBt
ZXJnZWQpLg0KDQo+ICsJfQ0KPiArDQo+ICsJaWYgKHJlc2V0X2dwaW8pIHsNCj4gKwkJLyogVG9n
Z2xlIHVscGkgdG8gcmVzZXQgdGhlIHBoeS4gKi8NCj4gKwkJZ3Bpb2Rfc2V0X3ZhbHVlKHJlc2V0
X2dwaW8sIDApOw0KPiArCQl1c2xlZXBfcmFuZ2UoNTAwMCwgMTAwMDApOyAvKiBkZWxheSAqLw0K
PiArCQlncGlvZF9zZXRfdmFsdWUocmVzZXRfZ3BpbywgMSk7DQo+ICsJCXVzbGVlcF9yYW5nZSg1
MDAwLCAxMDAwMCk7IC8qIGRlbGF5ICovDQo+ICsJfQ0KPiArDQo+ICAJLyoNCj4gIAkgKiBUaGlz
IHJvdXRlcyB0aGUgVVNCIERNQSB0cmFmZmljIHRvIGdvIHRocm91Z2ggRlBEIHBhdGggaW5zdGVh
ZA0KPiAgCSAqIG9mIHJlYWNoaW5nIEREUiBkaXJlY3RseS4gVGhpcyB0cmFmZmljIHJvdXRpbmcg
aXMgbmVlZGVkIHRvDQotLSANClJvYmVydCBIYW5jb2NrDQpTZW5pb3IgSGFyZHdhcmUgRGVzaWdu
ZXIsIENhbGlhbiBBZHZhbmNlZCBUZWNobm9sb2dpZXMNCnd3dy5jYWxpYW4uY29tDQo=
