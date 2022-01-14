Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B5E9D48E34D
	for <lists+linux-usb@lfdr.de>; Fri, 14 Jan 2022 05:31:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239192AbiANEbG (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 13 Jan 2022 23:31:06 -0500
Received: from mx0c-0054df01.pphosted.com ([67.231.159.91]:28499 "EHLO
        mx0c-0054df01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S239194AbiANEbE (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 13 Jan 2022 23:31:04 -0500
Received: from pps.filterd (m0208999.ppops.net [127.0.0.1])
        by mx0c-0054df01.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 20E4UZIb032297;
        Thu, 13 Jan 2022 23:30:57 -0500
Received: from can01-to1-obe.outbound.protection.outlook.com (mail-to1can01lp2054.outbound.protection.outlook.com [104.47.61.54])
        by mx0c-0054df01.pphosted.com (PPS) with ESMTPS id 3dj0fcha96-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 13 Jan 2022 23:30:56 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fqfhw2yYUTpODR5qAJHULz+DnoDeHW2OQ7Y+scVYDF5gSDzX5f7pakRgeV+gmKKZTzt+CM43t2prI3ODYLUgxFzTEakm8hRY8GIkCdru9n43DtdXnAMhYiudEOcJU8LGe1SfvBPt9pngdqajOaSIzJ6jw40WOPXI2WfLOIQfFvNVH8Gk0i/LrmHIHkJiK/4RltvPYngh+P+upi4HgIYaVOJDUl1AR1AuQH7LX/nBo0nC51NvpM6KjR9fqfa5GvbEl3BAx9Hf7lB7Y/oHcEvsPrhrecu07ozpEv0M48qdudrQ6A4c2vN+SmtL50P/AIwzrpomDXjQq627kkxD5Qa6xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1dsku1cu7I0sE7mzgVOEpGHJb0gMMnWSQ4rRws14Jgo=;
 b=GgfbteKZ8DbwNT4EovcyQ59lo34SDPyOdtbclsRrsqWWOGrIvXcdfKsOsWVMj5yt9O+SrwNq9qZYJ0BqzwI7pVJ0vX+WqdpUHbPNnPH/q/nj7PK0OKT1n6rF1psUAHj60M/uEFqv69ZR1KpBG5szOlYZWBoxWlr315XdTPU1rOC8KR/eQjUSRijh3VFAmqY7puqTClhaOrfCoyRK7in1azrOB1Wla59cTh3cFNpjxXb3UIhtEm5kVaYQ8268/C8M1yzLS5GR0kb7vv+eSNInTYG6FbFyiACZZlF63+2I3H+ZEDXnL3sVfrDP6oBzRGxn8m0T4obvqzZYMGXj+N8+tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=calian.com; dmarc=pass action=none header.from=calian.com;
 dkim=pass header.d=calian.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=calian.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1dsku1cu7I0sE7mzgVOEpGHJb0gMMnWSQ4rRws14Jgo=;
 b=GTOCKgSZ5o4xtE9h5+yulOkcLij0E5hFKbGoh0q9oMY23NK9cQdIgcqY74iFjFcRwTDUZehqDQzi4dNwlO9fLnK9qFJJS9EdgQc59H9FGDcU59O9ArhB/a0K3tJlNqBVfV5plVSLaDtmL3Nd31so0qqnFrRrE8zFfllB7SyY3pk=
Received: from YT2PR01MB6270.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:4d::14)
 by YTBPR01MB3390.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:1c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.11; Fri, 14 Jan
 2022 04:30:54 +0000
Received: from YT2PR01MB6270.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::d51:8098:30cc:5bb6]) by YT2PR01MB6270.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::d51:8098:30cc:5bb6%3]) with mapi id 15.20.4888.011; Fri, 14 Jan 2022
 04:30:54 +0000
From:   Robert Hancock <robert.hancock@calian.com>
To:     "robh@kernel.org" <robh@kernel.org>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
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
Thread-Index: AQHYBl9u60C2FsFxl06K0u5fnKawSKxd7zSAgAGuB4CAADBKgIABdBqAgACLiQCAACUiAA==
Date:   Fri, 14 Jan 2022 04:30:54 +0000
Message-ID: <c93da0468a305853940c13e0314a16b512fd3e22.camel@calian.com>
References: <20220110201936.1371891-1-robert.hancock@calian.com>
         <20220110201936.1371891-4-robert.hancock@calian.com>
         <1641914089.158670.2944752.nullmailer@robh.at.kernel.org>
         <03419935b624427ef8a1ee6b545e236be9cc7941.camel@calian.com>
         <CAL_JsqKn16rZxRCaQQnxW+BRjxzQdn9DqUmj-XiyJuxBegg0dw@mail.gmail.com>
         <2273126d255bd126e4ec97e90316027308b41c15.camel@calian.com>
         <CAL_JsqJY58nVoanh8EvS3TUTF28V3AsNwsv+6=jSH3BHNzn0ZQ@mail.gmail.com>
In-Reply-To: <CAL_JsqJY58nVoanh8EvS3TUTF28V3AsNwsv+6=jSH3BHNzn0ZQ@mail.gmail.com>
Accept-Language: en-CA, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.28.5 (3.28.5-18.el8) 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 958541a7-8bc6-4e01-f2b9-08d9d716a747
x-ms-traffictypediagnostic: YTBPR01MB3390:EE_
x-microsoft-antispam-prvs: <YTBPR01MB3390798B8AE0872CD5333ABFEC549@YTBPR01MB3390.CANPRD01.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: BOykPdje4+TONsFTi507uk9oH2usbdeUQgHfNMLXxC8AqISnxT+uo1Z39jlOvjNGEzl8leBAGU94PltTohWTHtusjijXNzkzKUxqDfSZyd48wlIt07A6fa/ygZ1NjCzDdlHNNKoqqH8PbXjVqC/AOaWi3017uQUZhCg860qatDlufV466gDhZrdX4ZjRDEahp1yqNRoDXlQtvOUhZUNvzYKmMVHt+FAjL2LSxo1ABCaoQCWU5vb9u/2WDclnZVAWgMj9MwqieLNZfq5VTkE/5iHdujzZvAL4VE7IcjFqDEw0HWYbSDi8YCn2RTDelkp+TYGcGgp9fhUpW+mn6uOTTX+gWFYXrVRSvImM+v7kKEB6ZAmJgC+VV7SmtfcTPp2gj2YAsrd4gelZdKUWnFYQpOnyCgkVlJ2LLhIgLQ3si6dQ4eV+QyO8YCTVanZlm8dDMlUMA3A+Af4cKQ25xjH0eq4EBxiFYxZlSnN1JTRuZ8j97c5w+6Edm/Bus921O08VZGdAZhWh4GiFXAm9//KXK0S/nmw08BDgWjJwkTnZQhH1xbzl2b14QrhRzlWYcu0wOJJBgj2Y76elwR5D+2PTG98XleONFVF1vZACUb8imrcigQPiyMJ3r7gGqXluPYdrxm9MXt5IKwijCEsCIhAXtunR8Hs1roegpf5AFRCdKQQILCTR87byUP1yxPbeWPi1augSHo8eUiWccZPWEpgXMqpTplUwliIYOfwwfe6Kd44=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:YT2PR01MB6270.CANPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(366004)(86362001)(2616005)(4326008)(71200400001)(508600001)(8936002)(38070700005)(122000001)(38100700002)(6916009)(66556008)(5660300002)(83380400001)(6512007)(66476007)(6506007)(186003)(6486002)(53546011)(26005)(91956017)(66946007)(64756008)(54906003)(316002)(66446008)(76116006)(44832011)(2906002)(36756003)(8676002)(99106002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SVZLaGFTQmNHR0dmQWVIYlJORVVXd1FsWHUwb1VKbEEzcGhxc0VPcHY2YlFk?=
 =?utf-8?B?L2xHenB3aU5EdTRwWGU2UytVL0NjZmJDbVNoTnhHOU9aN1U0SGNDZFA3OGZP?=
 =?utf-8?B?SmoxUjVrL3MzOUlyYmdRV2tqRmU4aDVRUWhSaTFRa0NtUGZ0b1FHQXhLNGlx?=
 =?utf-8?B?elZqNW5yVDUwalBEaHNnRjJrYTBieTBJZUg3ZE4vL2V5eGJVZGN3ZU1WTy93?=
 =?utf-8?B?M1FQQVhjTGVlTE9rdmdRT0VHOXNZSTQrOEkxaWtCaFF4eDdrWkJGYnE4YVBH?=
 =?utf-8?B?NzRpZXMrOEN2dGJ4cmlZekVLcjJ5eHJvc2FDYXcxM1JLWGRQUk9pRElycjBt?=
 =?utf-8?B?UWZxQkU1RU5QSUtsVTV3RWp0QWIrT21iQVNXV2pLdUJ6SkZSUXVsaVoyKzkv?=
 =?utf-8?B?M0MvbG9NNE5TYkZjcWlZTkFGRGdtSGJRT2xmYkh5Rk0yVUM0V21HaDVmbDAx?=
 =?utf-8?B?dDgycVlrOEZDbzEraDIwTW9WQklUV3ljMnR3QzNocExzQmRiNGd4YVQ4Tlps?=
 =?utf-8?B?RlpjNHdQT3EwZzRldEpZblZhQ2tZdWkxZ2lIU2V5OVgzMzNjejBndnEyV0dZ?=
 =?utf-8?B?b0NVN3lwUVZUNGFZU1N4RTl5NGliaCtxL3o2OEVDdjdYcE4yemVjczlWM3hM?=
 =?utf-8?B?d2VlQklPZTFHeDRBUklaUUFzaEFFU05IMmZBU2VtRitnQTRSQXhlTkFVMHho?=
 =?utf-8?B?SlBsdXBPMHhGR2NqZzVUdkVvOHpzWTNYM2hWZzl0aHZRSUhTM0ZHWExVamdp?=
 =?utf-8?B?ZFVJblZPU2psSUhpL0ZtRGpjTEdiYWxrUGQ0QmQ5R3lpQXZmY1VlQzFpNEpL?=
 =?utf-8?B?alVGZDV3enhmOE1vZlIwYitZMUhvc21YNmNmaXNUT0NDZ1lMZEt3Tjd3aFZv?=
 =?utf-8?B?Q3JTNWhwK2NITDQ0WEQva3hSaTlBcmdWeWZtdVd3Rkc3aEtaYjlKVGY0bmpl?=
 =?utf-8?B?clFXUVl5SUN3djgzNXJEUXNtRHNSWlpWcHBLRlNWWktneXF0Ky85Y3FGOVhB?=
 =?utf-8?B?ekx3Y2lVV1p3dWRlRXBaSmVlMTdQMFEvbXJTSHNJSnpIM21UejhMc3NOdHlj?=
 =?utf-8?B?N1I2VXRPekxXcTM3WFVvMlM0VTlsaWlmTGxOb0h0aWZXdXhya3NuZ1kvUmRJ?=
 =?utf-8?B?WTF6aVNSMElPWWZRMlA0dGpDcUtjK3d5T3ZieCtjMXdQLzVOZTBlSEZCSjNS?=
 =?utf-8?B?RVdLdEdCdTZqREw2V0tzTkRaRjd6SmdxSlhrUkYxM1psVWNwd1lPQUpoRDBu?=
 =?utf-8?B?UXorWFVtTUVtcjc2LzhhcXhja3RRTng5eEcvK0JSU3FmTHlpemx2bjNnaEQ5?=
 =?utf-8?B?YnlsZWZHOFkzU0Zmb2hIdzVBUUpsUlZWanBWY25IdjNZdW5ReGp1dWxaaVFK?=
 =?utf-8?B?V2pEQlNWU3lQdVZPOHpDSXhVU1VQL0ZkSVE0RFVVUkp1QXczZEQ1WWt2bHFy?=
 =?utf-8?B?N0VKK3RiRGhtU2puSVhLV3ZpSE82bHF0c0plUnVmWWtpNWFiRFNXTEx1T3dC?=
 =?utf-8?B?QlMxWmZrRlAxUHdXQnY3Smo4SUpVN3YzUUFQeG5wUEJURldNT1dab3piblNG?=
 =?utf-8?B?d200NHdiTXc1L21EU0pyUDFhNUMxbCttV05oeWo1T1h0NHdzL25iR1pYd2dP?=
 =?utf-8?B?OTlVNytFMXRiWEFlTXYySVBVMXFrdE5QUzMrOEZBVGpITFZSdldmbGRtekEx?=
 =?utf-8?B?SHpXOVR5dmZXTGxIZE9IUWZ0UEdUSEVMcU1MSmxqWWtGckFhaVlOOEtEVnZi?=
 =?utf-8?B?QzJEMTJWOE4vZmtqdzMzQ3VIS201UGs5SW9JRlRrSy85cDk5U1pzWDAvNXZE?=
 =?utf-8?B?ZkFBYXY4bndmODVwcitOOXJzSi9tSnhGaEozeVM1aW9VeG03ZWpRYkRSai9z?=
 =?utf-8?B?eDJmWk5GZkpNTG5DbGNKbkwzdkwvVlhBTGttODNVQytrVGRqVnRmVW5EUUlp?=
 =?utf-8?B?d2F5L211NFlWK29CMndBandMT2lvQzZ6aDJiT1JJcUJaY2FBQVIwU09nZXpM?=
 =?utf-8?B?TGRqTXoyWFhGV2ZIWkdJTDlOcWtxVTZaVVdvdUx6T3pLdThjbkladzg1MGJ3?=
 =?utf-8?B?aXFFaWxyQlJ6VFNTcmJ2RTFnbFpnNU4yUEpLL2FFbWl5SWlXVWxtK1EzaFhB?=
 =?utf-8?B?R04yclFYTEFMNUc1cTRwZXlCTU9EbXEvN1dEVDBoZjRjNUVGVkc5Nit2ZDBI?=
 =?utf-8?B?QitmN2VDbWtMSU5ueGZPUDZ3NVorUk9NWG0yZDlCZk1sVlhUZE5PMWd1eFRZ?=
 =?utf-8?Q?7OHspm8izeU2DQFngm6ilpo8T8zj3Q7ujevyXWZGjE=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4A1E57530401DA49A0968C8CB3570B3C@CANPRD01.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: calian.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: YT2PR01MB6270.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 958541a7-8bc6-4e01-f2b9-08d9d716a747
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jan 2022 04:30:54.4147
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 23b57807-562f-49ad-92c4-3bb0f07a1fdf
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UQ57re5aJiKqyUFmr0ZgaAL6rjvgIEeG3618yjZlrcWMG7UuuZ6JTh8defoT7a72Q8hk+y6xsJEgighTfKVER6iIi8WAs2TvbJg9XAz5rG4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YTBPR01MB3390
X-Proofpoint-GUID: R_45S9S0B_wGuVNBCNT85_m-BHmQ3zUb
X-Proofpoint-ORIG-GUID: R_45S9S0B_wGuVNBCNT85_m-BHmQ3zUb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-14_01,2022-01-13_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=716 spamscore=0
 mlxscore=0 adultscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 suspectscore=0 impostorscore=0 priorityscore=1501 phishscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201140029
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

T24gVGh1LCAyMDIyLTAxLTEzIGF0IDIwOjE4IC0wNjAwLCBSb2IgSGVycmluZyB3cm90ZToNCj4g
T24gVGh1LCBKYW4gMTMsIDIwMjIgYXQgMTE6NTggQU0gUm9iZXJ0IEhhbmNvY2sNCj4gPHJvYmVy
dC5oYW5jb2NrQGNhbGlhbi5jb20+IHdyb3RlOg0KPiA+IE9uIFdlZCwgMjAyMi0wMS0xMiBhdCAx
Mzo0NiAtMDYwMCwgUm9iIEhlcnJpbmcgd3JvdGU6DQo+ID4gPiBPbiBXZWQsIEphbiAxMiwgMjAy
MiBhdCAxMDo1NCBBTSBSb2JlcnQgSGFuY29jaw0KPiA+ID4gPHJvYmVydC5oYW5jb2NrQGNhbGlh
bi5jb20+IHdyb3RlOg0KPiA+ID4gPiBPbiBUdWUsIDIwMjItMDEtMTEgYXQgMDk6MTQgLTA2MDAs
IFJvYiBIZXJyaW5nIHdyb3RlOg0KPiA+ID4gPiA+IE9uIE1vbiwgMTAgSmFuIDIwMjIgMTQ6MTk6
MzQgLTA2MDAsIFJvYmVydCBIYW5jb2NrIHdyb3RlOg0KPiA+ID4gPiA+ID4gRG9jdW1lbnQgdGhl
IG5ldyBzbnBzLHJlZi1jbG9jay1mbGFkaiBwcm9wZXJ0eSB3aGljaCBjYW4gYmUgdXNlZCB0bw0K
PiA+ID4gPiA+ID4gc2V0DQo+ID4gPiA+ID4gPiB0aGUgZnJhY3Rpb25hbCBwb3J0aW9uIG9mIHRo
ZSByZWZlcmVuY2UgY2xvY2sgcGVyaW9kLg0KPiA+ID4gPiA+ID4gDQo+ID4gPiA+ID4gPiBTaWdu
ZWQtb2ZmLWJ5OiBSb2JlcnQgSGFuY29jayA8cm9iZXJ0LmhhbmNvY2tAY2FsaWFuLmNvbT4NCj4g
PiA+ID4gPiA+IC0tLQ0KPiA+ID4gPiA+ID4gIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy91c2Ivc25wcyxkd2MzLnlhbWwgfCAxMg0KPiA+ID4gPiA+ID4gKysrKysrKysrKysrDQo+
ID4gPiA+ID4gPiAgMSBmaWxlIGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKykNCj4gPiA+ID4gPiA+
IA0KPiA+ID4gPiA+IA0KPiA+ID4gPiA+IE15IGJvdCBmb3VuZCBlcnJvcnMgcnVubmluZyAnbWFr
ZSBEVF9DSEVDS0VSX0ZMQUdTPS1tDQo+ID4gPiA+ID4gZHRfYmluZGluZ19jaGVjaycNCj4gPiA+
ID4gPiBvbiB5b3VyIHBhdGNoIChEVF9DSEVDS0VSX0ZMQUdTIGlzIG5ldyBpbiB2NS4xMyk6DQo+
ID4gPiA+ID4gDQo+ID4gPiA+ID4geWFtbGxpbnQgd2FybmluZ3MvZXJyb3JzOg0KPiA+ID4gPiA+
IA0KPiA+ID4gPiA+IGR0c2NoZW1hL2R0YyB3YXJuaW5ncy9lcnJvcnM6DQo+ID4gPiA+ID4gc2No
ZW1hcy91c2Ivc25wcyxkd2MzLnlhbWw6IGlnbm9yaW5nLCBlcnJvciBpbiBzY2hlbWE6IHByb3Bl
cnRpZXM6DQo+ID4gPiA+ID4gc25wcyxyZWYtDQo+ID4gPiA+ID4gY2xvY2stZmxhZGoNCj4gPiA+
ID4gDQo+ID4gPiA+IEknbSBhc3N1bWluZyB0aGlzIHNjaGVtYSBmaWxlIG5lZWRzIHRvIGJlIHVw
ZGF0ZWQsIGJ1dCBJJ20gbm90IHN1cmUNCj4gPiA+ID4gd2hlcmUNCj4gPiA+ID4gaXQNCj4gPiA+
ID4gbGl2ZXM/IEkgZG9uJ3Qgc2VlIHN1Y2ggYSBmaWxlIGluIHRoZSBkZXZpY2V0cmVlLW9yZy9k
dC1zY2hlbWEgcmVwbz8NCj4gPiA+IA0KPiA+ID4gVHJ5IERvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy91c2Ivc25wcyxkd2MzLnlhbWwNCj4gPiANCj4gPiBUaGF0J3MgdGhlIG9uZSBJ
J20gcGF0Y2hpbmcsIGJ1dCBpdCBzZWVtcyBsaWtlIGl0IGlzIGNvbXBhcmluZyB0aGF0IHRvDQo+
ID4gYW5vdGhlcg0KPiA+IHNjaGVtYSBmaWxlIHRoYXQgSSBjYW4ndCBmaW5kLCBhbmQgaXMgdW5o
YXBweSBiZWNhdXNlIHRoZSBuZXcgcHJvcGVydHkgSSdtDQo+ID4gYWRkaW5nIGlzbid0IHRoZXJl
PyBUaGUgd2F5IGl0J3MgZGVmaW5lZCBpbiB0aGUgYmluZGluZ3MgZmlsZSBpdHNlbGYgc2VlbXMN
Cj4gPiBubw0KPiA+IGRpZmZlcmVudCBmcm9tIHRoZSBvdGhlcnM6DQo+IA0KPiBUaGUgcHJvYmxl
bSBpcyBpbiBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdXNiL3NucHMsZHdjMy55
YW1sDQo+IHdpdGggdGhlIHByb3BlcnR5IHlvdSBhZGRlZC4gSXQgaXMgYXMgc2ltcGxlIGFzIHRo
YXQuIEl0J3MgZmFpbGluZyBvbg0KPiB0aGUgbWV0YS1zY2hlbWEgdmVuZG9yLXByb3BzLnlhbWwg
d2hpY2ggaXMgaW4gdGhlIGR0c2NoZW1hIHJlcG8gKGFuZA0KPiBhbHNvIG9uIHlvdXIgY29tcHV0
ZXIgd2hlcmUgZHRzY2hlbWEgaXMgaW5zdGFsbGVkKS4NCj4gDQo+IEp1c3QgcnVuOg0KPiANCj4g
ZHQtZG9jLXZhbGlkYXRlIC11IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy8NCj4g
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3VzYi9zbnBzLGR3YzMueWFtbA0KPiAN
Cj4gPiBkdHNjaGVtYS9kdGMgd2FybmluZ3MvZXJyb3JzOg0KPiA+IHNjaGVtYXMvdXNiL3NucHMs
ZHdjMy55YW1sOiBpZ25vcmluZywgZXJyb3IgaW4gc2NoZW1hOiBwcm9wZXJ0aWVzOg0KPiA+IHNu
cHMscmVmLQ0KPiA+IGNsb2NrLWZsYWRqDQo+ID4gL2J1aWxkcy9yb2JoZXJyaW5nL2xpbnV4LWR0
LQ0KPiA+IHJldmlldy9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdXNiL3NucHMs
ZHdjMy55YW1sOg0KPiA+IHByb3BlcnRpZXM6c25wcyxyZWYtY2xvY2stZmxhZGo6ICdvbmVPZicg
Y29uZGl0aW9uYWwgZmFpbGVkLCBvbmUgbXVzdCBiZQ0KPiA+IGZpeGVkOg0KPiANCj4gVGhlIGlt
cG9ydGFudCBwYXJ0cyBhcmUgd2hhdCBjYW1lIGFmdGVyIHRoZSBhYm92ZS4gUmVhZCB0aGUgJ2hp
bnRzJy4NCg0KSW5kZWVkLCBsb29rcyBsaWtlIGl0IHdhcyBtaXNzaW5nIHRoZSAkcmVmIHRvIHNw
ZWNpZnkgdGhlIHR5cGUuIEkgdGhpbmsgbXkNCmNvbmZ1c2lvbiB3YXMgYmVjYXVzZSB0aGUgaW1t
ZWRpYXRlbHkgcHJlY2VkaW5nIHBhcmFtZXRlciBpbiB0aGUNCmZpbGUsIHNucHMscmVmLWNsb2Nr
LXBlcmlvZC1ucywgd2FzIGFsc28gbWlzc2luZyAkcmVmIHdpdGggbm8gY29tcGxhaW50cywgSQ0K
Z3Vlc3MgYmVjYXVzZSBpdCBoYXMgdGhlIC1ucyBzdWZmaXguLiBXaWxsIHVwZGF0ZSBpbiB0aGUg
bmV4dCB2ZXJzaW9uLg0KDQo+IA0KPiBSb2INCg==
