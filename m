Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 52AAF48C8DD
	for <lists+linux-usb@lfdr.de>; Wed, 12 Jan 2022 17:54:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355382AbiALQyJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 12 Jan 2022 11:54:09 -0500
Received: from mx0c-0054df01.pphosted.com ([67.231.159.91]:8433 "EHLO
        mx0c-0054df01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1355390AbiALQyH (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 12 Jan 2022 11:54:07 -0500
Received: from pps.filterd (m0208999.ppops.net [127.0.0.1])
        by mx0c-0054df01.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 20CE6hSS020034;
        Wed, 12 Jan 2022 11:54:01 -0500
Received: from can01-to1-obe.outbound.protection.outlook.com (mail-to1can01lp2054.outbound.protection.outlook.com [104.47.61.54])
        by mx0c-0054df01.pphosted.com (PPS) with ESMTPS id 3dj0fcg3yy-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 12 Jan 2022 11:54:01 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ARnLrKYexUZFL0Gn3Nt+cKlm6koM96FtdcvICSbozg3/HJbzjLefDNXzwm3330vGfNX5+t4OCpJwPoM2A4asTbsWCsV93r2awkXadX7l3p2CaxKA3Ia++ooYnjQ5d1arDwTrilvpqC6qGE6n4PaA2psMi1SaafPC4KAz1qJ24l1EW8veCdhWk1rkxFeZZW7J2zDlOAY6N8BbVVUoq2muETh6dYbMxZmnKoGWYfuGDWvkeuyzZM+fRUbOaLtWbX6VYqDLZsoAo+i25g8h6Uil4NJnejUqNKRrzeGCao+ixKISVcWydipOW6D9uUJ1FYW3OqaBzLzYudcwgv68q/Vw0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N5siH2+r/nPwEcacXteZeCB66gs6kOHhruLXeUKouQQ=;
 b=IWQtc8qYPcOCIxk0HQJlEaa+rvsKu3jddTQRtXvVWhVrQ2/Ttevj08uvTSUstqiIgWqGjPq6ykRDbNMN4o3YkKWyhRzpCUXR8L6ZBEcfx6WeBzObOK+etyMsIedvmkK8PlZMINqdRu3Yutz59aB4roDsDn6vFmUpTQoROX7xJ99xGIPbPl1ft6F3/Aw+MVRm2oXcuyF/QM3Fnq4osKpBUlv8sEhMY27+fqDBNWz+VrEq2kKN6IS4o/Gas3IUw9mPl8aDzJptlImpXJyu8pzpIuvew+CGFgS09PYzVJE6XLF3gp5u/yNhaZQhOujmREXPETjc0CsZJDa5Msu26W7gWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=calian.com; dmarc=pass action=none header.from=calian.com;
 dkim=pass header.d=calian.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=calian.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N5siH2+r/nPwEcacXteZeCB66gs6kOHhruLXeUKouQQ=;
 b=Bd58tKZLbfHYxt69ZJyuT1+tfQ6dQXiUp0ilKGFAgpy2tUCH3mkaZfax6GrqItyUW8xptz6XMsqqqrx5l9qTauDayXC+FE0LUTRMCgEW8e8YQX7xQN5HV/G8wysg9jZ2KHG/A2u0fP8u4JQ+YoY/stWjQ2FUuEoRJdqwzacE0Tc=
Received: from YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:6a::19)
 by YT2PR01MB8808.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:bb::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.10; Wed, 12 Jan
 2022 16:53:58 +0000
Received: from YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::6929:c39f:d893:b6c8]) by YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::6929:c39f:d893:b6c8%2]) with mapi id 15.20.4888.010; Wed, 12 Jan 2022
 16:53:58 +0000
From:   Robert Hancock <robert.hancock@calian.com>
To:     "robh@kernel.org" <robh@kernel.org>
CC:     "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "mounika.grace.akula@xilinx.com" <mounika.grace.akula@xilinx.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "Thinh.Nguyen@synopsys.com" <Thinh.Nguyen@synopsys.com>,
        "michal.simek@xilinx.com" <michal.simek@xilinx.com>,
        "manish.narani@xilinx.com" <manish.narani@xilinx.com>,
        "balbi@kernel.org" <balbi@kernel.org>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v3 3/5] dt-bindings: usb: dwc3: add reference clock period
 fractional adjustment
Thread-Topic: [PATCH v3 3/5] dt-bindings: usb: dwc3: add reference clock
 period fractional adjustment
Thread-Index: AQHYBl9u60C2FsFxl06K0u5fnKawSKxd7zSAgAGuB4A=
Date:   Wed, 12 Jan 2022 16:53:58 +0000
Message-ID: <03419935b624427ef8a1ee6b545e236be9cc7941.camel@calian.com>
References: <20220110201936.1371891-1-robert.hancock@calian.com>
         <20220110201936.1371891-4-robert.hancock@calian.com>
         <1641914089.158670.2944752.nullmailer@robh.at.kernel.org>
In-Reply-To: <1641914089.158670.2944752.nullmailer@robh.at.kernel.org>
Accept-Language: en-CA, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.28.5 (3.28.5-18.el8) 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 95cc5ca1-9d83-4dea-88b6-08d9d5ec2079
x-ms-traffictypediagnostic: YT2PR01MB8808:EE_
x-microsoft-antispam-prvs: <YT2PR01MB880832241E588CD36CBCF348EC529@YT2PR01MB8808.CANPRD01.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: HbqRzlQsmM2ubXY4h9QBUaZwADYsJwCxNMHWETMK5psxv2SbXsDHBMhJgwwibcSSWGXuZQ13eyH0Cr6FL9Gyx+bIfTz0gmILZFzYUc/GwZed8cea5kqyrNw/2dtRkmzTELg3bV3AuEHMK/oCsjyF4yMLIzwCnXUAa7V21m2YIf0C1Dlb9I1bU8Qv0dckCTSFxFQ2iwCyc+Qgc41TFOBy2t45Cn2NNzcD+HO57frsN271XwSOxxILTo/Vmd1LNSVPg5BNQoOtOJFYDB71FhFKmmjIWVO8VpLviVNa9Guwe8JW4qYN9wUCqaSv2EimuCnbzlojJ7Qiw1Yydx3oOkjuO1Yu+EJXb0bSRvaS+VOTLxdscXXiPhNyDQof1cv8gfXNXAAeroecRLJJFeNxNJBjrQYpFPV7Ps2Cra8E6pEHAPsxHhJIwkix2Oel94EAMlZtP4o0QB6S10lAC3U/labtrMSEUf58RJYCCMxLDBrLPahYYI6Q/vweX17dbmZYSOekLUfPZiJivG8Cw2HjhEUg0VgJXUt3j8evPt8+nzlM9Hb5kdPizuWrc1TIReMkD9S++2aOozEUqIMQVcurPTdI6qrOpoOWINXDHKtPxqQ0q8O7e/K837U3Xi6aGjbv3FAwDCaJv0f41yNB1Ve6aNhW2ZSZw2FDfeBdZz0gFyuFklGbBLbSMF3Ta4vesZ3aVWvRiMqNwSdSvgiX+rENvBmVXEcc892PcdDgXxjpvAQt4UeOKntYAVDCJ/FMNzDU9nACAv6vvU50um5mSoQVVWr7g9dBMDOLCFV0ZUBJnj2jJIOisy2lEHJTtlqO1MOfhn0jS8mtj/B9c+xG1mPU0VZVYQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(366004)(2616005)(83380400001)(2906002)(91956017)(76116006)(44832011)(6512007)(66946007)(36756003)(71200400001)(86362001)(30864003)(8936002)(8676002)(122000001)(6916009)(966005)(508600001)(64756008)(6506007)(66476007)(38100700002)(66556008)(6486002)(66446008)(38070700005)(26005)(186003)(7416002)(5660300002)(54906003)(316002)(4326008)(403724002)(99106002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?K0lyTm83UUVSTXNHQUFLZkxVWEdFZ1FXRXUveWxPV1AyVDU0aU4vb0o4cXR3?=
 =?utf-8?B?dkk4bmsvanluQkdyVXpRYWFIOUN5cXdIYkRpRnNUcm4rY0ZkWjV6cERzTXFC?=
 =?utf-8?B?Szg5bFpkdkZjanZ1VlBwaGMrM3JwekRlOU9XT0RCMnhPSGZHQmxSTkh4ZkE3?=
 =?utf-8?B?Z1ZCbWN3a1JkRmZ5RDdSWGdHTEs3QWcxdG8wY29ObDY3Nk9mWkx2V1RJSCtQ?=
 =?utf-8?B?Njc1MWZtY3VCVm9aNEROSEJZalo5NTJIT2U1QktTUGg5VXRHL09CU0Z6ZCs2?=
 =?utf-8?B?TnV5M3hmMG4xTnhKdHFVMm80Zis1dFhpaW5OUkJ1TjlzSlpzdDNlU08rSHBC?=
 =?utf-8?B?L01pUDhkb1plK0FtbFZiSnJqWklHMW5sajg2SEZYVEhISmtHTCtEc0xtRDlV?=
 =?utf-8?B?SU9xVXV0U2R4akNnQlVHZ0FONFUwSXQzajFHT255QWVHNDA5QnVEUEorcTJl?=
 =?utf-8?B?bEZwM1VlL1Y5bDFHYktENlNZVm9ja1V0ZVdVeTFyUlN5M1ZKb3diMlRrMGFZ?=
 =?utf-8?B?TEFzbWlXdDNmVFNzdXZhMVQ2bVRvRjhxQnZseVZ1OEUzSVRlMXVMWVd4RXds?=
 =?utf-8?B?Z1IzOXJYM2N0SW9HdCtLWkJNditTRjNPRUFKQS9xY1c4MVpkb2xPV0QrclZQ?=
 =?utf-8?B?NEhNVFNUQnptRzBmVWJFM1BjZkNaRzk1NjdtY1g3eFJGR1NyR0ZRaENqSEJH?=
 =?utf-8?B?dE5objVmSVdxblBJWTNoeGtBUGdTTkhFOUU3endtVFNPMXFrTjJ6UTBGWCsr?=
 =?utf-8?B?MEc3WTZhQzBaTDRYbmFadFI1UmYzMks4YkcrMzJwQmU3MmVuSmhobnFwVUpx?=
 =?utf-8?B?bjEvVnhJOVpHU1ZPMEk2TGZUWFdWb01CcFM3NjNPaFJFMnNER3F0aTJzQ1hx?=
 =?utf-8?B?WUhVL01IQi9GM1BCU2pTM0JjMGIxRm1qd3d6aTdXc0p2Yi9PMkhncUd1alhJ?=
 =?utf-8?B?REpaVGhtUlhGbHNsK0lRdUphV243RDYwejVYaUVYNUpENU1ubU81RGViNDYy?=
 =?utf-8?B?M3czUnR3bzVNdCtFZHNpcmVSdFpOUEo3QVZoWG1lTFI1cFR4NENLdXN1NFFU?=
 =?utf-8?B?S0dIemEzRE9nRWN2SHRjZkUyVVdiNHNxSjR4WFgwT29HdXRRQlRkMFZHQXdQ?=
 =?utf-8?B?UjFUdzhyL3dpdjNnbE90eEZCelF3R1haTzBaVzFBNkxYRjRGWitUMjJ5UTNu?=
 =?utf-8?B?S240dGJGYklwTTZqMkdkYUlkbHlRMm53WDdMZjlhREdFZDlZcE94RXJDTWh4?=
 =?utf-8?B?RUxwTGdDR1g4bzJIZk5wMnA0OTRHWitlYXVSSG1YS1hKR1o3aUZpd1lISFVX?=
 =?utf-8?B?ZHhhR0lqL1cyb0pHRXB3TFVwaWVwSnQrZGR5dWQvQXQwbTJmOW93cEZlcDFU?=
 =?utf-8?B?RGVOd0VSQ05zRm9FVVFueGMxc3BZbmgwT2swT0FDbnFGb2ZVdjhBL1dpOUpq?=
 =?utf-8?B?WjBXOXhDd1dnckorMzN3UUhLSzB5SzlHd3c2aWs3cFREVndXdnlPVzNjS2NB?=
 =?utf-8?B?U0wydzZLK1BxMG9sRVFidTdoclVwMGloSDIvQ2hMVmluZE45Q1FSazI0SWNt?=
 =?utf-8?B?Vlhzci9hZTdVRWwxU2JGa1BQdlVMb3Z0dUpDWHpUOUlpYjgyQ2tDdFZjbk9U?=
 =?utf-8?B?cVdCVDJTNEtXUEpvSG51T29NNUpHTGl1aTlxU25yaklsMXJmcWdQUHpqVnJo?=
 =?utf-8?B?SVVOZy9tNmU4L25EWEZMNml3UWRJZmdOTUFPamFLUUxJWkd6SnRRRzIzbDdq?=
 =?utf-8?B?ZFRXa1dWeXV2QUx6akJ3clNmdHp2d1RkeTZJUHhCemNBM3VUMHBoSmE3SVBi?=
 =?utf-8?B?OGt1QlNJR1ZQVitaQkVvLzRob2dQcEhDZjdjQ0x4LytaUU5ldjkxVUtTOFBX?=
 =?utf-8?B?QlI1ZXVNM1RKMjRsUnVUTTZwR0tKNkpNdU5ETWEzVXpMOUpEUTFLRStMWWlY?=
 =?utf-8?B?KzY3dzV2Z2lJWGxZSUxSekMrYm5LblFsc3IvVHBpaDR2ZEkyR2FDT0NCZFh5?=
 =?utf-8?B?UzlVSGVRMmZESGtNZVNKbjhuTUwxd1dxSEMwL2trS2swb2sxMjdTQWJkZ1c2?=
 =?utf-8?B?cWg0bWllY204K3pkdXRoWDY3eVpNclpXN094UFJ0STRWVzBGK0tKMHBFemw2?=
 =?utf-8?B?SW1FM2lMamZpOURRcm42ejNsZmtNKy9iVmgyYS9id1dJK1NURGI1ZWFIbFc4?=
 =?utf-8?B?VSt1SGtjaWVGOVphd3h0bkJmd1J6aENQMjcrSE9zc2xGNVBMZDNtdmxaWEcz?=
 =?utf-8?Q?uGNPOsiyBnMhzH/RCHsUt+jjXUuq67TP/b213w90aE=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F328287C61AA8448968BD628D2DEE9B0@CANPRD01.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: calian.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 95cc5ca1-9d83-4dea-88b6-08d9d5ec2079
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jan 2022 16:53:58.2844
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 23b57807-562f-49ad-92c4-3bb0f07a1fdf
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KG3qBeDwGYpo2msSJU/Azq23mcV/HqDo9gy6svswwxPgEeiEipLALP+Nrl74sIziRt+13w8/IDkRgKai6mbXEesfw5QoJhife/0/wb/CPYY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YT2PR01MB8808
X-Proofpoint-GUID: 6nSiToCI53z_PhDXUllWPmMheuP2sKZr
X-Proofpoint-ORIG-GUID: 6nSiToCI53z_PhDXUllWPmMheuP2sKZr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-12_04,2022-01-11_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 spamscore=0
 mlxscore=0 adultscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 suspectscore=0 impostorscore=0 priorityscore=1501 phishscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201120105
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

T24gVHVlLCAyMDIyLTAxLTExIGF0IDA5OjE0IC0wNjAwLCBSb2IgSGVycmluZyB3cm90ZToNCj4g
T24gTW9uLCAxMCBKYW4gMjAyMiAxNDoxOTozNCAtMDYwMCwgUm9iZXJ0IEhhbmNvY2sgd3JvdGU6
DQo+ID4gRG9jdW1lbnQgdGhlIG5ldyBzbnBzLHJlZi1jbG9jay1mbGFkaiBwcm9wZXJ0eSB3aGlj
aCBjYW4gYmUgdXNlZCB0byBzZXQNCj4gPiB0aGUgZnJhY3Rpb25hbCBwb3J0aW9uIG9mIHRoZSBy
ZWZlcmVuY2UgY2xvY2sgcGVyaW9kLg0KPiA+IA0KPiA+IFNpZ25lZC1vZmYtYnk6IFJvYmVydCBI
YW5jb2NrIDxyb2JlcnQuaGFuY29ja0BjYWxpYW4uY29tPg0KPiA+IC0tLQ0KPiA+ICBEb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdXNiL3NucHMsZHdjMy55YW1sIHwgMTIgKysrKysr
KysrKysrDQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxMiBpbnNlcnRpb25zKCspDQo+ID4gDQo+IA0K
PiBNeSBib3QgZm91bmQgZXJyb3JzIHJ1bm5pbmcgJ21ha2UgRFRfQ0hFQ0tFUl9GTEFHUz0tbSBk
dF9iaW5kaW5nX2NoZWNrJw0KPiBvbiB5b3VyIHBhdGNoIChEVF9DSEVDS0VSX0ZMQUdTIGlzIG5l
dyBpbiB2NS4xMyk6DQo+IA0KPiB5YW1sbGludCB3YXJuaW5ncy9lcnJvcnM6DQo+IA0KPiBkdHNj
aGVtYS9kdGMgd2FybmluZ3MvZXJyb3JzOg0KPiBzY2hlbWFzL3VzYi9zbnBzLGR3YzMueWFtbDog
aWdub3JpbmcsIGVycm9yIGluIHNjaGVtYTogcHJvcGVydGllczogc25wcyxyZWYtDQo+IGNsb2Nr
LWZsYWRqDQoNCkknbSBhc3N1bWluZyB0aGlzIHNjaGVtYSBmaWxlIG5lZWRzIHRvIGJlIHVwZGF0
ZWQsIGJ1dCBJJ20gbm90IHN1cmUgd2hlcmUgaXQNCmxpdmVzPyBJIGRvbid0IHNlZSBzdWNoIGEg
ZmlsZSBpbiB0aGUgZGV2aWNldHJlZS1vcmcvZHQtc2NoZW1hIHJlcG8/DQoNCj4gL2J1aWxkcy9y
b2JoZXJyaW5nL2xpbnV4LWR0LQ0KPiByZXZpZXcvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL3VzYi9zbnBzLGR3YzMueWFtbDoNCj4gcHJvcGVydGllczpzbnBzLHJlZi1jbG9jay1m
bGFkajogJ29uZU9mJyBjb25kaXRpb25hbCBmYWlsZWQsIG9uZSBtdXN0IGJlDQo+IGZpeGVkOg0K
PiAJJ3R5cGUnIGlzIGEgcmVxdWlyZWQgcHJvcGVydHkNCj4gCQloaW50OiBBIHZlbmRvciBib29s
ZWFuIHByb3BlcnR5IGNhbiB1c2UgInR5cGU6IGJvb2xlYW4iDQo+IAlBZGRpdGlvbmFsIHByb3Bl
cnRpZXMgYXJlIG5vdCBhbGxvd2VkICgnbWluaW11bScsICdtYXhpbXVtJyB3ZXJlDQo+IHVuZXhw
ZWN0ZWQpDQo+IAkJaGludDogQSB2ZW5kb3IgYm9vbGVhbiBwcm9wZXJ0eSBjYW4gdXNlICJ0eXBl
OiBib29sZWFuIg0KPiAJL2J1aWxkcy9yb2JoZXJyaW5nL2xpbnV4LWR0LQ0KPiByZXZpZXcvRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3VzYi9zbnBzLGR3YzMueWFtbDoNCj4gcHJv
cGVydGllczpzbnBzLHJlZi1jbG9jay1mbGFkajogJ29uZU9mJyBjb25kaXRpb25hbCBmYWlsZWQs
IG9uZSBtdXN0IGJlDQo+IGZpeGVkOg0KPiAJCSdlbnVtJyBpcyBhIHJlcXVpcmVkIHByb3BlcnR5
DQo+IAkJJ2NvbnN0JyBpcyBhIHJlcXVpcmVkIHByb3BlcnR5DQo+IAkJaGludDogQSB2ZW5kb3Ig
c3RyaW5nIHByb3BlcnR5IHdpdGggZXhhY3QgdmFsdWVzIGhhcyBhbg0KPiBpbXBsaWNpdCB0eXBl
DQo+IAkJZnJvbSBzY2hlbWEgJGlkOiANCj4gaHR0cHM6Ly91cmxkZWZlbnNlLmNvbS92My9fX2h0
dHA6Ly9kZXZpY2V0cmVlLm9yZy9tZXRhLXNjaGVtYXMvdmVuZG9yLXByb3BzLnlhbWwqX187SXch
IUlPR29zMGshMjJIUjE4dlFOcGNjcDRGZTV4RFRYdEFPNEcwZngwV2hrbEx5S3RHcGp4RHAyeDN2
SlZSazdfbzV6andBeHotcENidyQNCj4gIA0KPiAJL2J1aWxkcy9yb2JoZXJyaW5nL2xpbnV4LWR0
LQ0KPiByZXZpZXcvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3VzYi9zbnBzLGR3
YzMueWFtbDoNCj4gcHJvcGVydGllczpzbnBzLHJlZi1jbG9jay1mbGFkajogJ29uZU9mJyBjb25k
aXRpb25hbCBmYWlsZWQsIG9uZSBtdXN0IGJlDQo+IGZpeGVkOg0KPiAJCSckcmVmJyBpcyBhIHJl
cXVpcmVkIHByb3BlcnR5DQo+IAkJJ2FsbE9mJyBpcyBhIHJlcXVpcmVkIHByb3BlcnR5DQo+IAkJ
aGludDogQSB2ZW5kb3IgcHJvcGVydHkgbmVlZHMgYSAkcmVmIHRvIHR5cGVzLnlhbWwNCj4gCQlm
cm9tIHNjaGVtYSAkaWQ6IA0KPiBodHRwczovL3VybGRlZmVuc2UuY29tL3YzL19faHR0cDovL2Rl
dmljZXRyZWUub3JnL21ldGEtc2NoZW1hcy92ZW5kb3ItcHJvcHMueWFtbCpfXztJdyEhSU9Hb3Mw
ayEyMkhSMTh2UU5wY2NwNEZlNXhEVFh0QU80RzBmeDBXaGtsTHlLdEdwanhEcDJ4M3ZKVlJrN19v
NXpqd0F4ei1wQ2J3JA0KPiAgDQo+IAloaW50OiBWZW5kb3Igc3BlY2lmaWMgcHJvcGVydGllcyBt
dXN0IGhhdmUgYSB0eXBlIGFuZCBkZXNjcmlwdGlvbg0KPiB1bmxlc3MgdGhleSBoYXZlIGEgZGVm
aW5lZCwgY29tbW9uIHN1ZmZpeC4NCj4gCWZyb20gc2NoZW1hICRpZDogDQo+IGh0dHBzOi8vdXJs
ZGVmZW5zZS5jb20vdjMvX19odHRwOi8vZGV2aWNldHJlZS5vcmcvbWV0YS1zY2hlbWFzL3ZlbmRv
ci1wcm9wcy55YW1sKl9fO0l3ISFJT0dvczBrITIySFIxOHZRTnBjY3A0RmU1eERUWHRBTzRHMGZ4
MFdoa2xMeUt0R3BqeERwMngzdkpWUms3X281emp3QXh6LXBDYnckDQo+ICANCj4gL2J1aWxkcy9y
b2JoZXJyaW5nL2xpbnV4LWR0LQ0KPiByZXZpZXcvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL3VzYi9zbnBzLGR3YzMueWFtbDogaWdub3JpbmcsIGVycm9yDQo+IGluIHNjaGVtYTog
cHJvcGVydGllczogc25wcyxyZWYtY2xvY2stZmxhZGoNCj4gbWFrZVsxXTogKioqIERlbGV0aW5n
IGZpbGUNCj4gJ0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy91c2IvcWNvbSxkd2Mz
LmV4YW1wbGUuZHQueWFtbCcNCj4gc2NoZW1hcy91c2Ivc25wcyxkd2MzLnlhbWw6IGlnbm9yaW5n
LCBlcnJvciBpbiBzY2hlbWE6IHByb3BlcnRpZXM6IHNucHMscmVmLQ0KPiBjbG9jay1mbGFkag0K
PiBUcmFjZWJhY2sgKG1vc3QgcmVjZW50IGNhbGwgbGFzdCk6DQo+ICAgRmlsZSAiL3Vzci9sb2Nh
bC9iaW4vZHQtdmFsaWRhdGUiLCBsaW5lIDE3MCwgaW4gPG1vZHVsZT4NCj4gICAgIHNnLmNoZWNr
X3RyZWVzKGZpbGVuYW1lLCB0ZXN0dHJlZSkNCj4gICBGaWxlICIvdXNyL2xvY2FsL2Jpbi9kdC12
YWxpZGF0ZSIsIGxpbmUgMTE5LCBpbiBjaGVja190cmVlcw0KPiAgICAgc2VsZi5jaGVja19zdWJ0
cmVlKGR0LCBzdWJ0cmVlLCBGYWxzZSwgIi8iLCAiLyIsIGZpbGVuYW1lKQ0KPiAgIEZpbGUgIi91
c3IvbG9jYWwvYmluL2R0LXZhbGlkYXRlIiwgbGluZSAxMTAsIGluIGNoZWNrX3N1YnRyZWUNCj4g
ICAgIHNlbGYuY2hlY2tfc3VidHJlZSh0cmVlLCB2YWx1ZSwgZGlzYWJsZWQsIG5hbWUsIGZ1bGxu
YW1lICsgbmFtZSwNCj4gZmlsZW5hbWUpDQo+ICAgRmlsZSAiL3Vzci9sb2NhbC9iaW4vZHQtdmFs
aWRhdGUiLCBsaW5lIDExMCwgaW4gY2hlY2tfc3VidHJlZQ0KPiAgICAgc2VsZi5jaGVja19zdWJ0
cmVlKHRyZWUsIHZhbHVlLCBkaXNhYmxlZCwgbmFtZSwgZnVsbG5hbWUgKyBuYW1lLA0KPiBmaWxl
bmFtZSkNCj4gICBGaWxlICIvdXNyL2xvY2FsL2Jpbi9kdC12YWxpZGF0ZSIsIGxpbmUgMTEwLCBp
biBjaGVja19zdWJ0cmVlDQo+ICAgICBzZWxmLmNoZWNrX3N1YnRyZWUodHJlZSwgdmFsdWUsIGRp
c2FibGVkLCBuYW1lLCBmdWxsbmFtZSArIG5hbWUsDQo+IGZpbGVuYW1lKQ0KPiAgIEZpbGUgIi91
c3IvbG9jYWwvYmluL2R0LXZhbGlkYXRlIiwgbGluZSAxMDUsIGluIGNoZWNrX3N1YnRyZWUNCj4g
ICAgIHNlbGYuY2hlY2tfbm9kZSh0cmVlLCBzdWJ0cmVlLCBkaXNhYmxlZCwgbm9kZW5hbWUsIGZ1
bGxuYW1lLCBmaWxlbmFtZSkNCj4gICBGaWxlICIvdXNyL2xvY2FsL2Jpbi9kdC12YWxpZGF0ZSIs
IGxpbmUgNDksIGluIGNoZWNrX25vZGUNCj4gICAgIGVycm9ycyA9IHNvcnRlZChkdHNjaGVtYS5E
VFZhbGlkYXRvcihzY2hlbWEpLml0ZXJfZXJyb3JzKG5vZGUpLA0KPiBrZXk9bGFtYmRhIGU6IGUu
bGluZWNvbCkNCj4gICBGaWxlICIvdXNyL2xvY2FsL2xpYi9weXRob24zLjgvZGlzdC1wYWNrYWdl
cy9kdHNjaGVtYS9saWIucHkiLCBsaW5lIDc2OCwgaW4NCj4gaXRlcl9lcnJvcnMNCj4gICAgIGZv
ciBlcnJvciBpbiBzdXBlcigpLml0ZXJfZXJyb3JzKGluc3RhbmNlLCBfc2NoZW1hKToNCj4gICBG
aWxlICIvdXNyL2xvY2FsL2xpYi9weXRob24zLjgvZGlzdC1wYWNrYWdlcy9qc29uc2NoZW1hL3Zh
bGlkYXRvcnMucHkiLA0KPiBsaW5lIDIyNiwgaW4gaXRlcl9lcnJvcnMNCj4gICAgIGZvciBlcnJv
ciBpbiBlcnJvcnM6DQo+ICAgRmlsZSAiL3Vzci9sb2NhbC9saWIvcHl0aG9uMy44L2Rpc3QtcGFj
a2FnZXMvanNvbnNjaGVtYS9fdmFsaWRhdG9ycy5weSIsDQo+IGxpbmUgMjUsIGluIHBhdHRlcm5Q
cm9wZXJ0aWVzDQo+ICAgICB5aWVsZCBmcm9tIHZhbGlkYXRvci5kZXNjZW5kKA0KPiAgIEZpbGUg
Ii91c3IvbG9jYWwvbGliL3B5dGhvbjMuOC9kaXN0LXBhY2thZ2VzL2pzb25zY2hlbWEvdmFsaWRh
dG9ycy5weSIsDQo+IGxpbmUgMjQyLCBpbiBkZXNjZW5kDQo+ICAgICBmb3IgZXJyb3IgaW4gc2Vs
Zi5ldm9sdmUoc2NoZW1hPXNjaGVtYSkuaXRlcl9lcnJvcnMoaW5zdGFuY2UpOg0KPiAgIEZpbGUg
Ii91c3IvbG9jYWwvbGliL3B5dGhvbjMuOC9kaXN0LXBhY2thZ2VzL2R0c2NoZW1hL2xpYi5weSIs
IGxpbmUgNzY4LCBpbg0KPiBpdGVyX2Vycm9ycw0KPiAgICAgZm9yIGVycm9yIGluIHN1cGVyKCku
aXRlcl9lcnJvcnMoaW5zdGFuY2UsIF9zY2hlbWEpOg0KPiAgIEZpbGUgIi91c3IvbG9jYWwvbGli
L3B5dGhvbjMuOC9kaXN0LXBhY2thZ2VzL2pzb25zY2hlbWEvdmFsaWRhdG9ycy5weSIsDQo+IGxp
bmUgMjI2LCBpbiBpdGVyX2Vycm9ycw0KPiAgICAgZm9yIGVycm9yIGluIGVycm9yczoNCj4gICBG
aWxlICIvdXNyL2xvY2FsL2xpYi9weXRob24zLjgvZGlzdC1wYWNrYWdlcy9qc29uc2NoZW1hL192
YWxpZGF0b3JzLnB5IiwNCj4gbGluZSAyOTgsIGluIHJlZg0KPiAgICAgeWllbGQgZnJvbSB2YWxp
ZGF0b3IuZGVzY2VuZChpbnN0YW5jZSwgcmVzb2x2ZWQpDQo+ICAgRmlsZSAiL3Vzci9sb2NhbC9s
aWIvcHl0aG9uMy44L2Rpc3QtcGFja2FnZXMvanNvbnNjaGVtYS92YWxpZGF0b3JzLnB5IiwNCj4g
bGluZSAyNDIsIGluIGRlc2NlbmQNCj4gICAgIGZvciBlcnJvciBpbiBzZWxmLmV2b2x2ZShzY2hl
bWE9c2NoZW1hKS5pdGVyX2Vycm9ycyhpbnN0YW5jZSk6DQo+ICAgRmlsZSAiL3Vzci9sb2NhbC9s
aWIvcHl0aG9uMy44L2Rpc3QtcGFja2FnZXMvZHRzY2hlbWEvbGliLnB5IiwgbGluZSA3NjgsIGlu
DQo+IGl0ZXJfZXJyb3JzDQo+ICAgICBmb3IgZXJyb3IgaW4gc3VwZXIoKS5pdGVyX2Vycm9ycyhp
bnN0YW5jZSwgX3NjaGVtYSk6DQo+ICAgRmlsZSAiL3Vzci9sb2NhbC9saWIvcHl0aG9uMy44L2Rp
c3QtcGFja2FnZXMvanNvbnNjaGVtYS92YWxpZGF0b3JzLnB5IiwNCj4gbGluZSAyMTYsIGluIGl0
ZXJfZXJyb3JzDQo+ICAgICBzY29wZSA9IGlkX29mKF9zY2hlbWEpDQo+ICAgRmlsZSAiL3Vzci9s
b2NhbC9saWIvcHl0aG9uMy44L2Rpc3QtcGFja2FnZXMvanNvbnNjaGVtYS92YWxpZGF0b3JzLnB5
IiwNCj4gbGluZSA5MywgaW4gX2lkX29mDQo+ICAgICByZXR1cm4gc2NoZW1hLmdldCgiJGlkIiwg
IiIpDQo+IEF0dHJpYnV0ZUVycm9yOiAnTm9uZVR5cGUnIG9iamVjdCBoYXMgbm8gYXR0cmlidXRl
ICdnZXQnDQo+IG1ha2VbMV06ICoqKiBbc2NyaXB0cy9NYWtlZmlsZS5saWI6MzczOg0KPiBEb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdXNiL3Fjb20sZHdjMy5leGFtcGxlLmR0Lnlh
bWxdIEVycm9yIDENCj4gbWFrZVsxXTogKioqIFdhaXRpbmcgZm9yIHVuZmluaXNoZWQgam9icy4u
Li4NCj4gbWFrZVsxXTogKioqIERlbGV0aW5nIGZpbGUgJ0RvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy91c2IvZnNsLGlteDhtcC0NCj4gZHdjMy5leGFtcGxlLmR0LnlhbWwnDQo+IHNj
aGVtYXMvdXNiL3NucHMsZHdjMy55YW1sOiBpZ25vcmluZywgZXJyb3IgaW4gc2NoZW1hOiBwcm9w
ZXJ0aWVzOiBzbnBzLHJlZi0NCj4gY2xvY2stZmxhZGoNCj4gVHJhY2ViYWNrIChtb3N0IHJlY2Vu
dCBjYWxsIGxhc3QpOg0KPiAgIEZpbGUgIi91c3IvbG9jYWwvYmluL2R0LXZhbGlkYXRlIiwgbGlu
ZSAxNzAsIGluIDxtb2R1bGU+DQo+ICAgICBzZy5jaGVja190cmVlcyhmaWxlbmFtZSwgdGVzdHRy
ZWUpDQo+ICAgRmlsZSAiL3Vzci9sb2NhbC9iaW4vZHQtdmFsaWRhdGUiLCBsaW5lIDExOSwgaW4g
Y2hlY2tfdHJlZXMNCj4gICAgIHNlbGYuY2hlY2tfc3VidHJlZShkdCwgc3VidHJlZSwgRmFsc2Us
ICIvIiwgIi8iLCBmaWxlbmFtZSkNCj4gICBGaWxlICIvdXNyL2xvY2FsL2Jpbi9kdC12YWxpZGF0
ZSIsIGxpbmUgMTEwLCBpbiBjaGVja19zdWJ0cmVlDQo+ICAgICBzZWxmLmNoZWNrX3N1YnRyZWUo
dHJlZSwgdmFsdWUsIGRpc2FibGVkLCBuYW1lLCBmdWxsbmFtZSArIG5hbWUsDQo+IGZpbGVuYW1l
KQ0KPiAgIEZpbGUgIi91c3IvbG9jYWwvYmluL2R0LXZhbGlkYXRlIiwgbGluZSAxMTAsIGluIGNo
ZWNrX3N1YnRyZWUNCj4gICAgIHNlbGYuY2hlY2tfc3VidHJlZSh0cmVlLCB2YWx1ZSwgZGlzYWJs
ZWQsIG5hbWUsIGZ1bGxuYW1lICsgbmFtZSwNCj4gZmlsZW5hbWUpDQo+ICAgRmlsZSAiL3Vzci9s
b2NhbC9iaW4vZHQtdmFsaWRhdGUiLCBsaW5lIDEwNSwgaW4gY2hlY2tfc3VidHJlZQ0KPiAgICAg
c2VsZi5jaGVja19ub2RlKHRyZWUsIHN1YnRyZWUsIGRpc2FibGVkLCBub2RlbmFtZSwgZnVsbG5h
bWUsIGZpbGVuYW1lKQ0KPiAgIEZpbGUgIi91c3IvbG9jYWwvYmluL2R0LXZhbGlkYXRlIiwgbGlu
ZSA0OSwgaW4gY2hlY2tfbm9kZQ0KPiAgICAgZXJyb3JzID0gc29ydGVkKGR0c2NoZW1hLkRUVmFs
aWRhdG9yKHNjaGVtYSkuaXRlcl9lcnJvcnMobm9kZSksDQo+IGtleT1sYW1iZGEgZTogZS5saW5l
Y29sKQ0KPiAgIEZpbGUgIi91c3IvbG9jYWwvbGliL3B5dGhvbjMuOC9kaXN0LXBhY2thZ2VzL2R0
c2NoZW1hL2xpYi5weSIsIGxpbmUgNzY4LCBpbg0KPiBpdGVyX2Vycm9ycw0KPiAgICAgZm9yIGVy
cm9yIGluIHN1cGVyKCkuaXRlcl9lcnJvcnMoaW5zdGFuY2UsIF9zY2hlbWEpOg0KPiAgIEZpbGUg
Ii91c3IvbG9jYWwvbGliL3B5dGhvbjMuOC9kaXN0LXBhY2thZ2VzL2pzb25zY2hlbWEvdmFsaWRh
dG9ycy5weSIsDQo+IGxpbmUgMjI2LCBpbiBpdGVyX2Vycm9ycw0KPiAgICAgZm9yIGVycm9yIGlu
IGVycm9yczoNCj4gICBGaWxlICIvdXNyL2xvY2FsL2xpYi9weXRob24zLjgvZGlzdC1wYWNrYWdl
cy9qc29uc2NoZW1hL192YWxpZGF0b3JzLnB5IiwNCj4gbGluZSAyNSwgaW4gcGF0dGVyblByb3Bl
cnRpZXMNCj4gICAgIHlpZWxkIGZyb20gdmFsaWRhdG9yLmRlc2NlbmQoDQo+ICAgRmlsZSAiL3Vz
ci9sb2NhbC9saWIvcHl0aG9uMy44L2Rpc3QtcGFja2FnZXMvanNvbnNjaGVtYS92YWxpZGF0b3Jz
LnB5IiwNCj4gbGluZSAyNDIsIGluIGRlc2NlbmQNCj4gICAgIGZvciBlcnJvciBpbiBzZWxmLmV2
b2x2ZShzY2hlbWE9c2NoZW1hKS5pdGVyX2Vycm9ycyhpbnN0YW5jZSk6DQo+ICAgRmlsZSAiL3Vz
ci9sb2NhbC9saWIvcHl0aG9uMy44L2Rpc3QtcGFja2FnZXMvZHRzY2hlbWEvbGliLnB5IiwgbGlu
ZSA3NjgsIGluDQo+IGl0ZXJfZXJyb3JzDQo+ICAgICBmb3IgZXJyb3IgaW4gc3VwZXIoKS5pdGVy
X2Vycm9ycyhpbnN0YW5jZSwgX3NjaGVtYSk6DQo+ICAgRmlsZSAiL3Vzci9sb2NhbC9saWIvcHl0
aG9uMy44L2Rpc3QtcGFja2FnZXMvanNvbnNjaGVtYS92YWxpZGF0b3JzLnB5IiwNCj4gbGluZSAy
MjYsIGluIGl0ZXJfZXJyb3JzDQo+ICAgICBmb3IgZXJyb3IgaW4gZXJyb3JzOg0KPiAgIEZpbGUg
Ii91c3IvbG9jYWwvbGliL3B5dGhvbjMuOC9kaXN0LXBhY2thZ2VzL2pzb25zY2hlbWEvX3ZhbGlk
YXRvcnMucHkiLA0KPiBsaW5lIDI5OCwgaW4gcmVmDQo+ICAgICB5aWVsZCBmcm9tIHZhbGlkYXRv
ci5kZXNjZW5kKGluc3RhbmNlLCByZXNvbHZlZCkNCj4gICBGaWxlICIvdXNyL2xvY2FsL2xpYi9w
eXRob24zLjgvZGlzdC1wYWNrYWdlcy9qc29uc2NoZW1hL3ZhbGlkYXRvcnMucHkiLA0KPiBsaW5l
IDI0MiwgaW4gZGVzY2VuZA0KPiAgICAgZm9yIGVycm9yIGluIHNlbGYuZXZvbHZlKHNjaGVtYT1z
Y2hlbWEpLml0ZXJfZXJyb3JzKGluc3RhbmNlKToNCj4gICBGaWxlICIvdXNyL2xvY2FsL2xpYi9w
eXRob24zLjgvZGlzdC1wYWNrYWdlcy9kdHNjaGVtYS9saWIucHkiLCBsaW5lIDc2OCwgaW4NCj4g
aXRlcl9lcnJvcnMNCj4gICAgIGZvciBlcnJvciBpbiBzdXBlcigpLml0ZXJfZXJyb3JzKGluc3Rh
bmNlLCBfc2NoZW1hKToNCj4gICBGaWxlICIvdXNyL2xvY2FsL2xpYi9weXRob24zLjgvZGlzdC1w
YWNrYWdlcy9qc29uc2NoZW1hL3ZhbGlkYXRvcnMucHkiLA0KPiBsaW5lIDIxNiwgaW4gaXRlcl9l
cnJvcnMNCj4gICAgIHNjb3BlID0gaWRfb2YoX3NjaGVtYSkNCj4gICBGaWxlICIvdXNyL2xvY2Fs
L2xpYi9weXRob24zLjgvZGlzdC1wYWNrYWdlcy9qc29uc2NoZW1hL3ZhbGlkYXRvcnMucHkiLA0K
PiBsaW5lIDkzLCBpbiBfaWRfb2YNCj4gICAgIHJldHVybiBzY2hlbWEuZ2V0KCIkaWQiLCAiIikN
Cj4gQXR0cmlidXRlRXJyb3I6ICdOb25lVHlwZScgb2JqZWN0IGhhcyBubyBhdHRyaWJ1dGUgJ2dl
dCcNCj4gbWFrZVsxXTogKioqIFtzY3JpcHRzL01ha2VmaWxlLmxpYjozNzM6DQo+IERvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy91c2IvZnNsLGlteDhtcC1kd2MzLmV4YW1wbGUuZHQu
eWFtbF0gRXJyb3INCj4gMQ0KPiBtYWtlWzFdOiAqKiogRGVsZXRpbmcgZmlsZQ0KPiAnRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3VzYi9pbnRlbCxrZWVtYmF5LWR3YzMuZXhhbXBs
ZS5kdC55YW1sJw0KPiBzY2hlbWFzL3VzYi9zbnBzLGR3YzMueWFtbDogaWdub3JpbmcsIGVycm9y
IGluIHNjaGVtYTogcHJvcGVydGllczogc25wcyxyZWYtDQo+IGNsb2NrLWZsYWRqDQo+IFRyYWNl
YmFjayAobW9zdCByZWNlbnQgY2FsbCBsYXN0KToNCj4gICBGaWxlICIvdXNyL2xvY2FsL2Jpbi9k
dC12YWxpZGF0ZSIsIGxpbmUgMTcwLCBpbiA8bW9kdWxlPg0KPiAgICAgc2cuY2hlY2tfdHJlZXMo
ZmlsZW5hbWUsIHRlc3R0cmVlKQ0KPiAgIEZpbGUgIi91c3IvbG9jYWwvYmluL2R0LXZhbGlkYXRl
IiwgbGluZSAxMTksIGluIGNoZWNrX3RyZWVzDQo+ICAgICBzZWxmLmNoZWNrX3N1YnRyZWUoZHQs
IHN1YnRyZWUsIEZhbHNlLCAiLyIsICIvIiwgZmlsZW5hbWUpDQo+ICAgRmlsZSAiL3Vzci9sb2Nh
bC9iaW4vZHQtdmFsaWRhdGUiLCBsaW5lIDExMCwgaW4gY2hlY2tfc3VidHJlZQ0KPiAgICAgc2Vs
Zi5jaGVja19zdWJ0cmVlKHRyZWUsIHZhbHVlLCBkaXNhYmxlZCwgbmFtZSwgZnVsbG5hbWUgKyBu
YW1lLA0KPiBmaWxlbmFtZSkNCj4gICBGaWxlICIvdXNyL2xvY2FsL2Jpbi9kdC12YWxpZGF0ZSIs
IGxpbmUgMTEwLCBpbiBjaGVja19zdWJ0cmVlDQo+ICAgICBzZWxmLmNoZWNrX3N1YnRyZWUodHJl
ZSwgdmFsdWUsIGRpc2FibGVkLCBuYW1lLCBmdWxsbmFtZSArIG5hbWUsDQo+IGZpbGVuYW1lKQ0K
PiAgIEZpbGUgIi91c3IvbG9jYWwvYmluL2R0LXZhbGlkYXRlIiwgbGluZSAxMDUsIGluIGNoZWNr
X3N1YnRyZWUNCj4gICAgIHNlbGYuY2hlY2tfbm9kZSh0cmVlLCBzdWJ0cmVlLCBkaXNhYmxlZCwg
bm9kZW5hbWUsIGZ1bGxuYW1lLCBmaWxlbmFtZSkNCj4gICBGaWxlICIvdXNyL2xvY2FsL2Jpbi9k
dC12YWxpZGF0ZSIsIGxpbmUgNDksIGluIGNoZWNrX25vZGUNCj4gICAgIGVycm9ycyA9IHNvcnRl
ZChkdHNjaGVtYS5EVFZhbGlkYXRvcihzY2hlbWEpLml0ZXJfZXJyb3JzKG5vZGUpLA0KPiBrZXk9
bGFtYmRhIGU6IGUubGluZWNvbCkNCj4gICBGaWxlICIvdXNyL2xvY2FsL2xpYi9weXRob24zLjgv
ZGlzdC1wYWNrYWdlcy9kdHNjaGVtYS9saWIucHkiLCBsaW5lIDc2OCwgaW4NCj4gaXRlcl9lcnJv
cnMNCj4gICAgIGZvciBlcnJvciBpbiBzdXBlcigpLml0ZXJfZXJyb3JzKGluc3RhbmNlLCBfc2No
ZW1hKToNCj4gICBGaWxlICIvdXNyL2xvY2FsL2xpYi9weXRob24zLjgvZGlzdC1wYWNrYWdlcy9q
c29uc2NoZW1hL3ZhbGlkYXRvcnMucHkiLA0KPiBsaW5lIDIyNiwgaW4gaXRlcl9lcnJvcnMNCj4g
ICAgIGZvciBlcnJvciBpbiBlcnJvcnM6DQo+ICAgRmlsZSAiL3Vzci9sb2NhbC9saWIvcHl0aG9u
My44L2Rpc3QtcGFja2FnZXMvanNvbnNjaGVtYS9fdmFsaWRhdG9ycy5weSIsDQo+IGxpbmUgMjUs
IGluIHBhdHRlcm5Qcm9wZXJ0aWVzDQo+ICAgICB5aWVsZCBmcm9tIHZhbGlkYXRvci5kZXNjZW5k
KA0KPiAgIEZpbGUgIi91c3IvbG9jYWwvbGliL3B5dGhvbjMuOC9kaXN0LXBhY2thZ2VzL2pzb25z
Y2hlbWEvdmFsaWRhdG9ycy5weSIsDQo+IGxpbmUgMjQyLCBpbiBkZXNjZW5kDQo+ICAgICBmb3Ig
ZXJyb3IgaW4gc2VsZi5ldm9sdmUoc2NoZW1hPXNjaGVtYSkuaXRlcl9lcnJvcnMoaW5zdGFuY2Up
Og0KPiAgIEZpbGUgIi91c3IvbG9jYWwvbGliL3B5dGhvbjMuOC9kaXN0LXBhY2thZ2VzL2R0c2No
ZW1hL2xpYi5weSIsIGxpbmUgNzY4LCBpbg0KPiBpdGVyX2Vycm9ycw0KPiAgICAgZm9yIGVycm9y
IGluIHN1cGVyKCkuaXRlcl9lcnJvcnMoaW5zdGFuY2UsIF9zY2hlbWEpOg0KPiAgIEZpbGUgIi91
c3IvbG9jYWwvbGliL3B5dGhvbjMuOC9kaXN0LXBhY2thZ2VzL2pzb25zY2hlbWEvdmFsaWRhdG9y
cy5weSIsDQo+IGxpbmUgMjI2LCBpbiBpdGVyX2Vycm9ycw0KPiAgICAgZm9yIGVycm9yIGluIGVy
cm9yczoNCj4gICBGaWxlICIvdXNyL2xvY2FsL2xpYi9weXRob24zLjgvZGlzdC1wYWNrYWdlcy9q
c29uc2NoZW1hL192YWxpZGF0b3JzLnB5IiwNCj4gbGluZSAyOTgsIGluIHJlZg0KPiAgICAgeWll
bGQgZnJvbSB2YWxpZGF0b3IuZGVzY2VuZChpbnN0YW5jZSwgcmVzb2x2ZWQpDQo+ICAgRmlsZSAi
L3Vzci9sb2NhbC9saWIvcHl0aG9uMy44L2Rpc3QtcGFja2FnZXMvanNvbnNjaGVtYS92YWxpZGF0
b3JzLnB5IiwNCj4gbGluZSAyNDIsIGluIGRlc2NlbmQNCj4gICAgIGZvciBlcnJvciBpbiBzZWxm
LmV2b2x2ZShzY2hlbWE9c2NoZW1hKS5pdGVyX2Vycm9ycyhpbnN0YW5jZSk6DQo+ICAgRmlsZSAi
L3Vzci9sb2NhbC9saWIvcHl0aG9uMy44L2Rpc3QtcGFja2FnZXMvZHRzY2hlbWEvbGliLnB5Iiwg
bGluZSA3NjgsIGluDQo+IGl0ZXJfZXJyb3JzDQo+ICAgICBmb3IgZXJyb3IgaW4gc3VwZXIoKS5p
dGVyX2Vycm9ycyhpbnN0YW5jZSwgX3NjaGVtYSk6DQo+ICAgRmlsZSAiL3Vzci9sb2NhbC9saWIv
cHl0aG9uMy44L2Rpc3QtcGFja2FnZXMvanNvbnNjaGVtYS92YWxpZGF0b3JzLnB5IiwNCj4gbGlu
ZSAyMTYsIGluIGl0ZXJfZXJyb3JzDQo+ICAgICBzY29wZSA9IGlkX29mKF9zY2hlbWEpDQo+ICAg
RmlsZSAiL3Vzci9sb2NhbC9saWIvcHl0aG9uMy44L2Rpc3QtcGFja2FnZXMvanNvbnNjaGVtYS92
YWxpZGF0b3JzLnB5IiwNCj4gbGluZSA5MywgaW4gX2lkX29mDQo+ICAgICByZXR1cm4gc2NoZW1h
LmdldCgiJGlkIiwgIiIpDQo+IEF0dHJpYnV0ZUVycm9yOiAnTm9uZVR5cGUnIG9iamVjdCBoYXMg
bm8gYXR0cmlidXRlICdnZXQnDQo+IG1ha2VbMV06ICoqKiBbc2NyaXB0cy9NYWtlZmlsZS5saWI6
MzczOg0KPiBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdXNiL2ludGVsLGtlZW1i
YXktZHdjMy5leGFtcGxlLmR0LnlhbWxdDQo+IEVycm9yIDENCj4gbWFrZTogKioqIFtNYWtlZmls
ZToxNDEzOiBkdF9iaW5kaW5nX2NoZWNrXSBFcnJvciAyDQo+IA0KPiBkb2MgcmVmZXJlbmNlIGVy
cm9ycyAobWFrZSByZWZjaGVja2RvY3MpOg0KPiANCj4gU2VlIA0KPiBodHRwczovL3VybGRlZmVu
c2UuY29tL3YzL19faHR0cHM6Ly9wYXRjaHdvcmsub3psYWJzLm9yZy9wYXRjaC8xNTc4MTA2X187
ISFJT0dvczBrITIySFIxOHZRTnBjY3A0RmU1eERUWHRBTzRHMGZ4MFdoa2xMeUt0R3BqeERwMngz
dkpWUms3X281emp3QXcwN29sSXMkDQo+ICANCj4gDQo+IFRoaXMgY2hlY2sgY2FuIGZhaWwgaWYg
dGhlcmUgYXJlIGFueSBkZXBlbmRlbmNpZXMuIFRoZSBiYXNlIGZvciBhIHBhdGNoDQo+IHNlcmll
cyBpcyBnZW5lcmFsbHkgdGhlIG1vc3QgcmVjZW50IHJjMS4NCj4gDQo+IElmIHlvdSBhbHJlYWR5
IHJhbiAnbWFrZSBkdF9iaW5kaW5nX2NoZWNrJyBhbmQgZGlkbid0IHNlZSB0aGUgYWJvdmUNCj4g
ZXJyb3IocyksIHRoZW4gbWFrZSBzdXJlICd5YW1sbGludCcgaXMgaW5zdGFsbGVkIGFuZCBkdC1z
Y2hlbWEgaXMgdXAgdG8NCj4gZGF0ZToNCj4gDQo+IHBpcDMgaW5zdGFsbCBkdHNjaGVtYSAtLXVw
Z3JhZGUNCj4gDQo+IFBsZWFzZSBjaGVjayBhbmQgcmUtc3VibWl0Lg0KPiANCg==
