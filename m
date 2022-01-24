Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A0737498A60
	for <lists+linux-usb@lfdr.de>; Mon, 24 Jan 2022 20:03:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344633AbiAXTDD (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 24 Jan 2022 14:03:03 -0500
Received: from mx0c-0054df01.pphosted.com ([67.231.159.91]:64877 "EHLO
        mx0c-0054df01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1345685AbiAXTAz (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 24 Jan 2022 14:00:55 -0500
Received: from pps.filterd (m0208999.ppops.net [127.0.0.1])
        by mx0c-0054df01.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 20ODEW8S015529;
        Mon, 24 Jan 2022 14:00:41 -0500
Received: from can01-to1-obe.outbound.protection.outlook.com (mail-to1can01lp2059.outbound.protection.outlook.com [104.47.61.59])
        by mx0c-0054df01.pphosted.com (PPS) with ESMTPS id 3dsvtr08xh-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 24 Jan 2022 14:00:41 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FyUsgjTgkAkH6lzuKB9hYT5S6Z/gtea33pfBzFd4ecqut9MbxesTQX260MkdQpFk6NwxTHXhHyMuz+7a2v5sLbWnO5Z1TOGE8es+tNeZYcSnmFFMYMxK78+H10ehXkX4kSxwtLVLWQnLoV+J94ljbDmhM6HVn1Ymnbm83RfETo5Jr3Ewsdprz8ckuP+rospAKDWBToGCWl4LFwPr2fM8rIpGSMAvKXHg2xqJej4toOwW9unMMTKShtwEoFCMkgULqQdKGRRO8f5Zlb8KFZe4ORO2/RyT/Of0H8iU+K6m6L6zqK3QjtTrpvidppV/LR4YKUJHSqipDNKEZ8Hm2s5rdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PRV/k4fJG406knCq+6nPCI2ipvmQmCv60+mIeXqOZ/o=;
 b=Zc0cyJBvTnxbkDZzfi58MWSkTogr2MnYuldzn/rvOdqOQH87cJIn7bjf2bDeJQXYTYkM4otyXpdfOoTH+wTY3oBEJbfotuSeL+A6l7ymRfHDf7Xg3yoN/NwAluaa6+JdvE6Xqm+Ud2uutgzzTyCzQ/3YRUZ37/E9wzVPg1WQ3b1t4kdC/fP4jfRq9GpHafNh6qo9DADp/I6ESrtR8Bo9+MIr+SwLBVA9SgrLyH8NfyMY1cMJW8lZaV0THLPp+4F3DY4G/0/3XOQ7mOzwOMPtj0QxVscZWsDTiMqccs+Q9hShRp95lmBrgIJrbEkdClnOYxnhu3Innu7Nvf3rR3llFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=calian.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PRV/k4fJG406knCq+6nPCI2ipvmQmCv60+mIeXqOZ/o=;
 b=I4N6oHmY2YJ2VVRdpxVCkMVJ6gipOMvhVTntKtrwvDNN/br7ai4ql3O6pZsJ5MSaoaqYJnrkCvzH/9lwX302TqqVSBXNkAwtIIGggF8wcYHn/q+k02y6lo32kcmuSm1Z5Fby0M+ic0x3unJGeNMCnTH4XkQN/uF5MNTJ76lpB6k=
Received: from YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:6a::19)
 by YT3PR01MB5610.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:60::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.7; Mon, 24 Jan
 2022 19:00:40 +0000
Received: from YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::6929:c39f:d893:b6c8]) by YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::6929:c39f:d893:b6c8%2]) with mapi id 15.20.4888.020; Mon, 24 Jan 2022
 19:00:40 +0000
From:   Robert Hancock <robert.hancock@calian.com>
To:     "MNARANI@xilinx.com" <MNARANI@xilinx.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
CC:     "michals@xilinx.com" <michals@xilinx.com>,
        "sean.anderson@seco.com" <sean.anderson@seco.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "balbi@kernel.org" <balbi@kernel.org>
Subject: Re: [PATCH v6 1/2] usb: dwc3: xilinx: Fix PIPE clock selection for
 USB2.0 mode
Thread-Topic: [PATCH v6 1/2] usb: dwc3: xilinx: Fix PIPE clock selection for
 USB2.0 mode
Thread-Index: AQHYDvNa4+vu6C+EGkGm5J6m3L5486xxwOkAgADKioA=
Date:   Mon, 24 Jan 2022 19:00:40 +0000
Message-ID: <cb7fc7b898f9468a416fb4e23104bb21006ef1cf.camel@calian.com>
References: <20220121181841.2331225-1-robert.hancock@calian.com>
         <20220121181841.2331225-2-robert.hancock@calian.com>
         <DM6PR02MB42352135D31E17ED63A95D64C15E9@DM6PR02MB4235.namprd02.prod.outlook.com>
In-Reply-To: <DM6PR02MB42352135D31E17ED63A95D64C15E9@DM6PR02MB4235.namprd02.prod.outlook.com>
Accept-Language: en-CA, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.28.5 (3.28.5-18.el8) 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 721d97b0-b0e3-4b9e-4a2a-08d9df6bd079
x-ms-traffictypediagnostic: YT3PR01MB5610:EE_
x-microsoft-antispam-prvs: <YT3PR01MB5610D888E5B3745FD007FB6CEC5E9@YT3PR01MB5610.CANPRD01.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: uSXXOxbSl/5cewDC8nT0FnTbkKFjZbjFYwIClCJfJiMuuBJb8jNyulPWQH6YHIaI0QAXpGn/reMf73o1uaxJZxYpIypoT1+XkyUaLaCNd5jazJhNxeK6v8ELTqChv6Rkj5juBpqSJmtJ4iOTCrQZiEhzzJCR/VhfdGVAr5OVEnHyBiTeT6LA5cKLEL3WdfIBtwz7v4nP78v8ggR4S8peaSWwETFPkmiCPC8n2J7nB00QKL7Gp0iT4cZWLMEnqtlJxkJkKbirB7CtzeUfiTxPcpEOWG4YMEXLtTpX+TPGlFgZky8bQkBiqSqmCziEIf9P5zI0bltlxjMC1UNTlsXpkM5guLFABfrcFhxgXS/3wRvATkavYxGzMzBB0eg7IHyS3RQdPeRA5usjkruT9uAnQcA4bqYTGLX1Mgan0ZtJaigSvMShn3teknLnuPRtKfRk/DS6tFLOw8gjxm50kOigrIGUbL/QeFg2V9B456GX8i5lsc1lQK7I7He8Om9gb/uHbjVm546UZpqLqXrK8gmXMtH9INgVQnE5XBPd5clYdRt7V1/NdlfuguclxKere+OGOuFfsJzOZjAEpPUh/AIKBN7mPWC9W4CS/25tZL+oyMmz58wk5sroc1t8C8OZxvsW8lijbSXZxhKLk8eU7WDD82qOqOemGk5y7G2ozPTXnNGLcn21eZrS8dsTokGNJT/XcXbbACEEPgd/BrnmXvk60MEkJ7xNEVSHLH0IeeFGAko=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(366004)(186003)(38070700005)(6506007)(53546011)(54906003)(5660300002)(26005)(8676002)(36756003)(76116006)(38100700002)(91956017)(71200400001)(316002)(44832011)(6486002)(83380400001)(86362001)(508600001)(2906002)(66446008)(66946007)(66476007)(66556008)(8936002)(2616005)(64756008)(122000001)(6512007)(4326008)(110136005)(99106002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?c0VHamJoajB3K2dwS2FVZUtUM2ljT0gxOExUbG54Slgxcm5wQ1dRbEw4VVky?=
 =?utf-8?B?T0hFMUZ1RVBtNUxWQzZqK20xakl4YjAxTTliUC9sdW1JdWlndGU4LzQyT2hB?=
 =?utf-8?B?WGhDVG1zL2lWZFRuNXc0dElHTSt4UHF3dDBvdmFRZjcwaHdSc21WTXBBMk45?=
 =?utf-8?B?dkliYjVXKzRTK1FDYnF5VmErc1drNjJUVDkveWY1V0RXM3pCZSs2NGRDcU9V?=
 =?utf-8?B?blVmWkFBVGZwWEw3STF0Zk42aHNkTnV5MmlNOVlYMGg0Z1RZcGQrMURLV0xI?=
 =?utf-8?B?dDZ5a1p5cTNPaGxZSU5tQ2xjSVdoRk53V0ViM2xTdVpLUlluOWhuNGlvVWJt?=
 =?utf-8?B?bVpZMDkwQTVSV1RrZU5JOTU3dTQyaDdaWmszem1nMjE2QVk1YnBSYTd2eXJC?=
 =?utf-8?B?SU9yWEVJbnhaNi9tK2F0QnhXZW5tYU8wdDhQY3FrOGovUm5sWnBad2ozSGo4?=
 =?utf-8?B?Z21NOGo0NVhoVjhnUzM2NWREN2lacHVicEhPTHJKNm5ZTlBUdXh3U3VtenJx?=
 =?utf-8?B?bTRNalR0UXluNVVuVmUvSVNoek90aU43WGxHMDVINDZ2b0lwTFJxSThZQzlF?=
 =?utf-8?B?YjNYWlpPZlQzUEUweWpUbTJCOFQzREhnQ1BqanhaQ1dmQXk3dnVOSjE3Rmwr?=
 =?utf-8?B?L2tjZ0dNN3MzMllnVTdDOVNaWmYxUXovdHUvMGdabUNTRTdpckp3Q3d2Q1d1?=
 =?utf-8?B?aXdWM3pvcHBla1BNUnZLUDUyTFBtb2lmc2ZLREQwZDVLVlk3RTlMdjJrYWl4?=
 =?utf-8?B?cWIzRE1WNExXbldPNUZ6YVErazVDQ0c1czNMdERLZEFLaDE1dkdwSTh2b3h3?=
 =?utf-8?B?MklrNVdEZHczdnhtU3ppZWJlYkswbG9mSVg3Rk5aQ29iMjBCOGhodGpEUFFF?=
 =?utf-8?B?TmY3UGY2UFVsWFUyczU0akh3LzIwYXNEK3kweVg2M3EyTCt0eDZNdFByWHNq?=
 =?utf-8?B?ajltV2g1aHh4RjBpVXA1VmxrWDlSaGh0Q1BrTjEza2ZWNFppNHIybVJkMllv?=
 =?utf-8?B?YU1PMHovUDhVdTBUNkRwMkk3Y2RpT1hYeXluZmpsbkRSUTBxN0g4cXR4NUt6?=
 =?utf-8?B?eFRxYUptYXIzMENUTyt4YlRlVmp6NEhqWDE2THJKMmE5cjFjbkpRRE5GcHpm?=
 =?utf-8?B?WkxETW1GdUl0WUM5WFdacHZBK0VtUm5tVWVHTmF2UDlNZE1ZRTZ2RlRXRnRv?=
 =?utf-8?B?cWV0TXNlbGlOT2xQa2MxK2Z3Qm9Fako1RDBqSkxoWFdwamg2bEZFVE8ySFBr?=
 =?utf-8?B?TDhxMTFEajBsdkhmOTNkY1NYYURoaUt4OGVXOGxJUEdVU0RDWXpGTEsweEor?=
 =?utf-8?B?MGluaVcwUUdNSjEvSnB2NHU3dnBzMmlYSHZUUm1iczc1bE1QVWM2SHpVUSt6?=
 =?utf-8?B?S1NJZ1JHUStjYjBieUhmREdncmcrbjMvaE94T3k4V1V6UXVpendGcUsva05N?=
 =?utf-8?B?TDl0VzlQd2JKdmVPQllmRStKbU01YjVPdFpFcDJSYW0yU3hrNGs2bFlyNU5a?=
 =?utf-8?B?WEsyczVNbjV1bEFmcjhIZ0E3MG1sNVRqS3Qwd1d1Z2dCVnB2RmxOOCs0ZExo?=
 =?utf-8?B?WmlYWVhqS0dmUkMwSWFrdjNVL2tYOFJReFllQXkvS05OeXZsQkdNOG83VkhR?=
 =?utf-8?B?QnowRjZxZGVqbk1FN2c3QnJVdEtUU3B2cjNrVmJSQ1NHZW44bXpzL01XMzNt?=
 =?utf-8?B?Mi9yaE1XNmFnTm04MnFydUhtbnZ3cWJwRmNQeTZjNW43WFpHbHBjMGIxUlZ6?=
 =?utf-8?B?T2Y4M2JhdVJCbWVZeDFrQlkrTSt1aFZ2cXBibmJVdFp2c2tyWnFydXBMbStL?=
 =?utf-8?B?NTdiemFic3htYzJBMDVOcGs0R24zb1RLa1dYLzBxbHY3QmFiRGc3bWN5L011?=
 =?utf-8?B?Y2xPS3dPbElmVFpkaEdFdnZ2VEw4R3BET2RiOVdIRDhhdGljVmc2OGE4MmZz?=
 =?utf-8?B?OHFsNndJWUtTY2pQOExjeFdDUDhmRHM4OElUMVFSZUFWOXNMVnpOT2ZkS0hU?=
 =?utf-8?B?aHdKYzBHNDRhTGMySGtrSWMweHhHNUR2ZjBPWWZtaDIrdGM2eGh6THk3TVIw?=
 =?utf-8?B?bVljRHlrRFdoVnB4OC9NVHN6ZG5yZktMdmlORkJZNUVINkYwZmhsd285RVk1?=
 =?utf-8?B?Q3hjVGQyRE5JTVhmOUdtbHpTbnpmZWJLWHRYWGhjUlNjalFlTFBtMG9TeVlz?=
 =?utf-8?B?aXZBM0NBUmt2ZzNCMjI2WmhlK1NGMkIzeU1ybmhvdDRMZldzdTliYjVUZ3Vz?=
 =?utf-8?Q?gZDLI8RthTD7AbTut9MjEDOAMPJVlH6PIrTEWQf3L0=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D81B57867647784E817F5CEAF14B2B2D@CANPRD01.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: calian.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 721d97b0-b0e3-4b9e-4a2a-08d9df6bd079
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jan 2022 19:00:40.1115
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 23b57807-562f-49ad-92c4-3bb0f07a1fdf
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LWXlUeUyegrowXe82+Tv/3cAgTnQNIX/dtpjQ5h9YB1ZaeA3c8jnbjcen9b0VolatUQTEgg1kwWRjq45mA8H/UwCwcDsSjOq4lSizfUSyLw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YT3PR01MB5610
X-Proofpoint-ORIG-GUID: xb3lZk_rTDgzCT5qAQ8qzv9-_k8hzn0G
X-Proofpoint-GUID: xb3lZk_rTDgzCT5qAQ8qzv9-_k8hzn0G
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-24_09,2022-01-24_02,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 bulkscore=0
 clxscore=1011 spamscore=0 adultscore=0 malwarescore=0 mlxlogscore=999
 suspectscore=0 phishscore=0 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2201240125
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

T24gTW9uLCAyMDIyLTAxLTI0IGF0IDA2OjU1ICswMDAwLCBNYW5pc2ggTmFyYW5pIHdyb3RlOg0K
PiBIaSBSb2JlcnQsDQo+IA0KPiBUaGFua3MgZm9yIHRoZSBwYXRjaCEgUGxlYXNlIHNlZSBteSBj
b21tZW50cyBiZWxvdyBpbmxpbmUhDQo+IA0KPiA+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0t
DQo+ID4gRnJvbTogUm9iZXJ0IEhhbmNvY2sgPHJvYmVydC5oYW5jb2NrQGNhbGlhbi5jb20+DQo+
ID4gU2VudDogRnJpZGF5LCBKYW51YXJ5IDIxLCAyMDIyIDExOjQ5IFBNDQo+ID4gVG86IGxpbnV4
LXVzYkB2Z2VyLmtlcm5lbC5vcmcNCj4gPiBDYzogYmFsYmlAa2VybmVsLm9yZzsgZ3JlZ2toQGxp
bnV4Zm91bmRhdGlvbi5vcmc7IE1pY2hhbCBTaW1law0KPiA+IDxtaWNoYWxzQHhpbGlueC5jb20+
OyBNYW5pc2ggTmFyYW5pIDxNTkFSQU5JQHhpbGlueC5jb20+Ow0KPiA+IHNlYW4uYW5kZXJzb25A
c2Vjby5jb207IFJvYmVydCBIYW5jb2NrIDxyb2JlcnQuaGFuY29ja0BjYWxpYW4uY29tPg0KPiA+
IFN1YmplY3Q6IFtQQVRDSCB2NiAxLzJdIHVzYjogZHdjMzogeGlsaW54OiBGaXggUElQRSBjbG9j
ayBzZWxlY3Rpb24gZm9yDQo+ID4gVVNCMi4wDQo+ID4gbW9kZQ0KPiA+IA0KPiA+IEl0IGFwcGVh
cnMgdGhhdCB0aGUgUElQRSBjbG9jayBzaG91bGQgbm90IGJlIHNlbGVjdGVkIHdoZW4gb25seSBV
U0IgMi4wDQo+ID4gaXMgYmVpbmcgdXNlZCBpbiB0aGUgZGVzaWduIGFuZCBubyBVU0IgMy4wIHJl
ZmVyZW5jZSBjbG9jayBpcyB1c2VkLiBGaXgNCj4gPiB0byBzZXQgdGhlIGNvcnJlY3QgdmFsdWUg
ZGVwZW5kaW5nIG9uIHdoZXRoZXIgYSBVU0IzIFBIWSBpcyBwcmVzZW50Lg0KPiA+IA0KPiA+IEZp
eGVzOiA4NDc3MGYwMjhmYWIgKCJ1c2I6IGR3YzM6IEFkZCBkcml2ZXIgZm9yIFhpbGlueCBwbGF0
Zm9ybXMiKQ0KPiA+IFNpZ25lZC1vZmYtYnk6IFJvYmVydCBIYW5jb2NrIDxyb2JlcnQuaGFuY29j
a0BjYWxpYW4uY29tPg0KPiA+IC0tLQ0KPiA+ICBkcml2ZXJzL3VzYi9kd2MzL2R3YzMteGlsaW54
LmMgfCA4ICsrKysrKy0tDQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDIg
ZGVsZXRpb25zKC0pDQo+ID4gDQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNiL2R3YzMvZHdj
My14aWxpbnguYyBiL2RyaXZlcnMvdXNiL2R3YzMvZHdjMy0NCj4gPiB4aWxpbnguYw0KPiA+IGlu
ZGV4IDljYzNhZDcwMWEyOS4uZGQ2MjE4ZDA1MTU5IDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMv
dXNiL2R3YzMvZHdjMy14aWxpbnguYw0KPiA+ICsrKyBiL2RyaXZlcnMvdXNiL2R3YzMvZHdjMy14
aWxpbnguYw0KPiA+IEBAIC0xNjcsOCArMTY3LDEyIEBAIHN0YXRpYyBpbnQgZHdjM194bG54X2lu
aXRfenlucW1wKHN0cnVjdCBkd2MzX3hsbngNCj4gPiAqcHJpdl9kYXRhKQ0KPiA+ICAJLyogU2V0
IFBJUEUgUG93ZXIgUHJlc2VudCBzaWduYWwgaW4gRlBEIFBvd2VyIFByZXNlbnQgUmVnaXN0ZXIq
Lw0KPiA+ICAJd3JpdGVsKEZQRF9QT1dFUl9QUlNOVF9PUFRJT04sIHByaXZfZGF0YS0+cmVncyAr
DQo+ID4gWExOWF9VU0JfRlBEX1BPV0VSX1BSU05UKTsNCj4gPiANCj4gPiAtCS8qIFNldCB0aGUg
UElQRSBDbG9jayBTZWxlY3QgYml0IGluIEZQRCBQSVBFIENsb2NrIHJlZ2lzdGVyICovDQo+ID4g
LQl3cml0ZWwoUElQRV9DTEtfU0VMRUNULCBwcml2X2RhdGEtPnJlZ3MgKw0KPiA+IFhMTlhfVVNC
X0ZQRF9QSVBFX0NMSyk7DQo+ID4gKwkvKg0KPiA+ICsJICogU2V0IHRoZSBQSVBFIENsb2NrIFNl
bGVjdCBiaXQgaW4gRlBEIFBJUEUgQ2xvY2sgcmVnaXN0ZXIgaWYgYSBVU0IzDQo+ID4gKwkgKiBQ
SFkgaXMgaW4gdXNlLCBkZXNlbGVjdCBvdGhlcndpc2UNCj4gPiArCSAqLw0KPiA+ICsJd3JpdGVs
KHVzYjNfcGh5ID8gUElQRV9DTEtfU0VMRUNUIDogUElQRV9DTEtfREVTRUxFQ1QsDQo+ID4gKwkg
ICAgICAgcHJpdl9kYXRhLT5yZWdzICsgWExOWF9VU0JfRlBEX1BJUEVfQ0xLKTsNCj4gDQo+IFdo
ZW4gVVNCMy4wIGlzIGVuYWJsZWQgaW4gdGhlIGRlc2lnbiwgRlNCTCB3aWxsIHNldCB0aGlzIGJp
dCB0bw0KPiBQSVBFX0NMS19TRUxFQ1QNCj4gQW5kIGl0J3Mgc3RhdGUgd2lsbCBiZSBwZXJzaXN0
ZW50IHRpbGwgTGludXggc3RhZ2UuIFdoZW4gdGhpcyBkcml2ZXIgZmluZHMNCj4gdGhlIHVzYjMt
cGh5IHByb3BlcnR5DQo+IEluIHRoZSBkZXZpY2UgdHJlZSwgaXQgd2lsbCBhZ2FpbiBzZXQgdGhp
cyBiaXQuDQo+IEJ1dCBpbiBjYXNlIGlmIHRoZSB1c2IzLXBoeSBpcyBub3QgcHJlc2VudCBpbiB0
aGUgZGV2aWNlIHRyZWUgYW5kIGRlc2lnbiBoYXMNCj4gVVNCMy4wIGVuYWJsZWQsIHRoZW4gdGhp
cyB3aWxsIGNsZWFyIHRoaXMgYml0IGFuZCB1bHRpbWF0ZWx5IGl0IHdpbGwgZmFpbC4NCj4gDQo+
IEl0IHdpbGwgYmUgYmV0dGVyIHRvIHNraXAgdG91Y2hpbmcgdGhhdCBiaXQgaW4gY2FzZSB0aGUg
ZGV2aWNlIHRyZWUgZG9lcyBub3QNCj4gaGF2ZSB0aGUgdXNiMy1waHkgcHJvcGVydHkuDQo+IFRo
aXMgd2lsbCBza2lwIHRoZSB3aG9sZSBzZXF1ZW5jZSBvZiBQSFkgaW5pdGlhbGl6YXRpb24gKHJl
c2V0DQo+IGFzc2VydC9kZWFzc2VydCBhcmUgZG9uZSBpbiBvcmRlciB0byBoZWxwIGluaXRpYWxp
emUgUEhZKS4NCj4gU29tZXRoaW5nIGxpa2UgYmVsb3cgc2hvdWxkIHdvcmsuDQoNClNvIHRoZSBv
cmlnaW5hbCBwYXRjaCB3YXMgdGVzdGVkIGFnYWluc3QgaGFyZHdhcmUgdGhhdCBvbmx5IGhhZCBV
U0IgMi4wIHN1cHBvcnQNCmFuZCBzZWVtZWQgdG8gd29yayBmaW5lLiBIb3dldmVyLCB3ZSd2ZSBz
aW5jZSBmb3VuZCBhbiBpc3N1ZSB3aXRoIHNvbWUgb3RoZXINCmhhcmR3YXJlIHN1cHBvcnRpbmcg
VVNCIDMuMCB3aGVyZSBlaXRoZXIgaXQgZG9lc24ndCBkZXRlY3QgZGV2aWNlcyBhdCBhbGwsIG9y
DQp0aGV5IGdldCBkZXRlY3RlZCBidXQgdGhlbiBzZWVtIHRvIGRyb3Agb2ZmIHRoZSBidXMgdmVy
eSBxdWlja2x5LCBhbmQgd2UgZ2V0DQp0aGlzIHJlcGVhdGVkbHk6DQoNClsgICA5OS44NTg2MDdd
IHVzYiB1c2IyLXBvcnQxOiBDYW5ub3QgZW5hYmxlLiBNYXliZSB0aGUgVVNCIGNhYmxlIGlzIGJh
ZD8NCg0KVGhlIHNhbWUgcHJvYmxlbSBpcyByZXByb2R1Y2libGUgb24gdGhlIFhpbGlueCBaQ1Ux
MDIgYm9hcmQgd2l0aCB0aGUgc2FtZQ0Ka2VybmVsIGJ1aWxkLCB3aGVyZSB0aGUgVVNCIHdvcmtz
IGZpbmUgd2l0aCB0aGUgWGlsaW54IGtlcm5lbCBhbmQgYSBQZXRhbGludXgNCjIwMjEuMiBwcmUt
YnVpbHQgWkNVMTAyIGltYWdlLCBzbyBpdCdzIG5vIGhhcmR3YXJlIGlzc3VlLg0KDQpJJ3ZlIGJl
ZW4gdHJ5aW5nIHRvIGlzb2xhdGUgYW55IHJlbGV2YW50IGRpZmZlcmVuY2VzIGJldHdlZW4gdGhl
IFhpbGlueCBrZXJuZWwNCmFuZCBtYWlubGluZSBpbiB0aGlzIHJlc3BlY3QgYnV0IGhhdmVuJ3Qg
aGFkIG11Y2ggc3VjY2Vzcy4gT25lIGRpZmZlcmVuY2UgaW4NCnRoaXMgcGFydGljdWxhciBkd2Mz
LXhpbGlueCBjb2RlIGlzIHRoYXQgdGhlIFhpbGlueCBrZXJuZWwgaGFzIGNvZGUgdG8gcmVzZXQN
CnRoZSBVTFBJIFBIWSB3aGljaCBpcyBub3QgaW4gdGhlIG1haW5saW5lIHZlcnNpb24geWV0LiBI
b3dldmVyLCBhZGRpbmcgdGhhdCBpbg0KZG9lc24ndCBzZWVtIHRvIGZpeCB0aGUgcHJvYmxlbS4N
Cg0KSGF2ZSB5b3UgKG9yIGFueW9uZSBlbHNlIG9uIHRoZSBDQyBsaXN0KSBkb25lIGFueSB0ZXN0
aW5nIG9mIFVTQiAzLjAgZGV2aWNlcw0KYW5kIFVTQiAzLjAgY2FwYWJsZSBoYXJkd2FyZSBvbiBt
YWlubGluZSB3aXRoIFp5bnFNUCB0byBrbm93IGlmIHRoaXMgaXMgYSBtb3JlDQpnZW5lcmFsIGlz
c3VlPw0KDQo+IC0tLQ0KPiAgICAgICAgIGludCAgICAgICAgICAgICAgICAgICAgIHJldDsNCj4g
ICAgICAgICB1MzIgICAgICAgICAgICAgICAgICAgICByZWc7DQo+ICANCj4gLSAgICAgICB1c2Iz
X3BoeSA9IGRldm1fcGh5X2dldChkZXYsICJ1c2IzLXBoeSIpOw0KPiAtICAgICAgIGlmIChQVFJf
RVJSKHVzYjNfcGh5KSA9PSAtRVBST0JFX0RFRkVSKSB7DQo+IC0gICAgICAgICAgICAgICByZXQg
PSAtRVBST0JFX0RFRkVSOw0KPiArICAgICAgIHVzYjNfcGh5ID0gZGV2bV9waHlfb3B0aW9uYWxf
Z2V0KGRldiwgInVzYjMtcGh5Iik7DQo+ICsgICAgICAgaWYgKElTX0VSUih1c2IzX3BoeSkpIHsN
Cj4gKyAgICAgICAgICAgICAgIHJldCA9IFBUUl9FUlIodXNiM19waHkpOw0KPiArICAgICAgICAg
ICAgICAgZGV2X2Vycl9wcm9iZShkZXYsIHJldCwgImZhaWxlZCB0byBnZXQgVVNCMyBQSFlcbiIp
Ow0KPiAgICAgICAgICAgICAgICAgZ290byBlcnI7DQo+IC0gICAgICAgfSBlbHNlIGlmIChJU19F
UlIodXNiM19waHkpKSB7DQo+IC0gICAgICAgICAgICAgICB1c2IzX3BoeSA9IE5VTEw7DQo+ICAg
ICAgICAgfQ0KPiAgDQo+ICsgICAgICAgaWYgKCF1c2IzX3BoeSkNCj4gKyAgICAgICAgICAgICAg
IGdvdG8gc2tpcF91c2IzX3BoeTsNCj4gKw0KPiAgICAgICAgIGNyc3QgPSBkZXZtX3Jlc2V0X2Nv
bnRyb2xfZ2V0X2V4Y2x1c2l2ZShkZXYsICJ1c2JfY3JzdCIpOw0KPiAgICAgICAgIGlmIChJU19F
UlIoY3JzdCkpIHsNCj4gICAgICAgICAgICAgICAgIHJldCA9IFBUUl9FUlIoY3JzdCk7DQo+IEBA
IC0xODgsNiArMTkwLDcgQEAgc3RhdGljIGludCBkd2MzX3hsbnhfaW5pdF96eW5xbXAoc3RydWN0
IGR3YzNfeGxueA0KPiAqcHJpdl9kYXRhKQ0KPiAgICAgICAgICAgICAgICAgZ290byBlcnI7DQo+
ICAgICAgICAgfQ0KPiAgDQo+ICtza2lwX3VzYjNfcGh5Og0KPiAgICAgICAgIC8qDQo+ICAgICAg
ICAgICogVGhpcyByb3V0ZXMgdGhlIFVTQiBETUEgdHJhZmZpYyB0byBnbyB0aHJvdWdoIEZQRCBw
YXRoIGluc3RlYWQNCj4gICAgICAgICAgKiBvZiByZWFjaGluZyBERFIgZGlyZWN0bHkuIFRoaXMg
dHJhZmZpYyByb3V0aW5nIGlzIG5lZWRlZCB0bw0KPiAtLS0NCj4gDQo+IFRoYW5rcywNCj4gTWFu
aXNoDQo=
