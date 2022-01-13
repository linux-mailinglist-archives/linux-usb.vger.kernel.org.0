Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A6FD548DD5C
	for <lists+linux-usb@lfdr.de>; Thu, 13 Jan 2022 18:58:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237371AbiAMR6r (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 13 Jan 2022 12:58:47 -0500
Received: from mx0d-0054df01.pphosted.com ([67.231.150.19]:30917 "EHLO
        mx0d-0054df01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233807AbiAMR6q (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 13 Jan 2022 12:58:46 -0500
Received: from pps.filterd (m0209000.ppops.net [127.0.0.1])
        by mx0c-0054df01.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 20DBiRcu014579;
        Thu, 13 Jan 2022 12:58:39 -0500
Received: from can01-to1-obe.outbound.protection.outlook.com (mail-to1can01lp2050.outbound.protection.outlook.com [104.47.61.50])
        by mx0c-0054df01.pphosted.com (PPS) with ESMTPS id 3dj2j2gmhe-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 13 Jan 2022 12:58:38 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FvfDRUxjHpodaMKShrLP94DmltoBDWgUrLjVGXITET90vhAGRqfkkIUwIwiVGaZ0OFMX7o01MIOFp/KyNlcLm2hBjZcCwHBe3gPGpmUMfaNd4VWWaywG47PwtRuHZmtYRJcsmTeuZI//kR5TR8JlpISN290buYAE3zeidddQrCk2EpGWDvtskh/nBuRmUzKv27NBx8lQP5H11yYJn66AJ7xh7X0xA0niGkqI8YJ1Geyl/5vBD85r9NmsoXR4WJvf4gE4XyJLWeXeW8c3ivVlXsphuq7XYOHACLCuobTnx4teguF25utYIEwgEYii8gkPH9VrcFcSAL5VcTwV4+kSaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cMbCL3BybOuy7F62OGg6O1D3hvQ1XDODSlom2DYJUdg=;
 b=Fk3Ta+gHrEq3rlTr3M8k+klIltdhqH2AWOJ0awsniT4qxCrRZuxUYrWtzDyrfYewEIBcj2iJcUDciwGSZ9rdF9sy//xccDb1NHfTbFIa9AOXiPXj0lbnNAMRU2ksEIbko4G6ENke3WViHOowvyYbkMndDxKsB4ZXHxG6XRPXEFhV0Vx1APHKbDh5iOC5o1+t6cWng48fj4TvJlXUrko3vNaD5vbRtuTzjVf9wM4t3gmJ3Ih2EWsDtewdIKfTl4pTSKB0VWhrnX9HYamkp9GX/wBkxZd7fptW8GZCww+tA9XckzzucyGUNgK26iWSVCYbUgZ4ArP+SRX22GX61929gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=calian.com; dmarc=pass action=none header.from=calian.com;
 dkim=pass header.d=calian.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=calian.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cMbCL3BybOuy7F62OGg6O1D3hvQ1XDODSlom2DYJUdg=;
 b=iSk/cFz1f+PWOSYTCHu4K4PMTKLYuWZQhMf32BnOi6l4o/uAucYdP9q57Fi5DmiXWeM2GfluY8S0hZROELBJ1jLGWfn3fGes8S0URqaIWlgk7RPyhWZHszhgqBH+TCjJmpKzEgF6nH+TdDgNXRyFXwQeOdp9bhmWBfoZS89/Xag=
Received: from YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:6a::19)
 by YT3PR01MB6277.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:5c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.10; Thu, 13 Jan
 2022 17:58:37 +0000
Received: from YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::6929:c39f:d893:b6c8]) by YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::6929:c39f:d893:b6c8%2]) with mapi id 15.20.4888.011; Thu, 13 Jan 2022
 17:58:37 +0000
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
Thread-Index: AQHYBl9u60C2FsFxl06K0u5fnKawSKxd7zSAgAGuB4CAADBKgIABdBqA
Date:   Thu, 13 Jan 2022 17:58:37 +0000
Message-ID: <2273126d255bd126e4ec97e90316027308b41c15.camel@calian.com>
References: <20220110201936.1371891-1-robert.hancock@calian.com>
         <20220110201936.1371891-4-robert.hancock@calian.com>
         <1641914089.158670.2944752.nullmailer@robh.at.kernel.org>
         <03419935b624427ef8a1ee6b545e236be9cc7941.camel@calian.com>
         <CAL_JsqKn16rZxRCaQQnxW+BRjxzQdn9DqUmj-XiyJuxBegg0dw@mail.gmail.com>
In-Reply-To: <CAL_JsqKn16rZxRCaQQnxW+BRjxzQdn9DqUmj-XiyJuxBegg0dw@mail.gmail.com>
Accept-Language: en-CA, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.28.5 (3.28.5-18.el8) 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c1033358-396d-4212-313d-08d9d6be5300
x-ms-traffictypediagnostic: YT3PR01MB6277:EE_
x-microsoft-antispam-prvs: <YT3PR01MB62774307547A8B244119B0E3EC539@YT3PR01MB6277.CANPRD01.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: JdVoq17yc+XJOVdte2TXXK3LAX+gIxVITP8n92zVQMQBShT1UbdZlFYhP85rTrdip4vnCder7Qzb+Q044a+CZ4yjlxCwEoczznvXu3boIC59wiEKzoGTInzWgW3vfW/4g3gd7xL0vOW6DjPgIevkTIoSvuL9vKtCPzPwJxLNx83Ry1vCZ7FwrY6FJ0ah9o1rm6iVWlZg9VvUnP40o6tiU4pGytlNld6LMd0/RPUDW7Hf4QNnaPCxmjT4xXVVAE/8ukPEiUIxFJs+pg+rRsxafSuLkr4MgW2Rd6eAqWsT+PuLEMgKIVVQl8nN9S6M4RGMY1v1o8DhdqE+38b8CT2RVWjfh2TKMDN0MARWabGfUWSAecgLobkGNAyn1uzqRsyrpDENCajfmjaDM6eQ0G0P/KiVxrfN8xCV6xgzV1r9hV/W2L5xDLhyUDVBZHNXQTF9zme//tHVg1ugjtjn5A67MpCY3VKdPgU44I/AXjwODODkNxh9Y8pbS4W+9BdQC85x0CGHZx5IczFSjvxLu4DUoRxHeDUd1JgXw+R3UjAaVNqs4lo9tKSqhPBw//sfO8bm62fjASbWaibBTPwotj6J0FiGUmjddK79XQSf4acC62T5Dwnfsu/avadf/8omTtgb2Sr34wcPioIr40VmT5t5HLxvOj8dJv8cy0iBdJq776FJREAzOjckqEel+1PJ/VNCqux/qQf6TtJxBkItbJWjpJf2p7V7+Wh+trl7yq1LLMipMi2ToHs/PpVxjEI2eB26lmrDu7T+i2KlUYeXuVUdPiexdV2RMBjEPGGv9lvXcjzWnsrx9Mn4Ax8q63Wxt07Eqax3YmsaFlaORRNy4rYNfUNOVWbBPfx7Pvrlzwu9GL4=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(366004)(53546011)(26005)(6486002)(38070700005)(66446008)(66556008)(6916009)(38100700002)(4326008)(64756008)(8936002)(8676002)(66476007)(6506007)(186003)(122000001)(508600001)(54906003)(5660300002)(15974865002)(316002)(66946007)(83380400001)(6512007)(76116006)(2906002)(91956017)(36756003)(44832011)(71200400001)(86362001)(2616005)(99106002)(18886075002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RW9JbEVCTkRkZGdnWDRxRHN0NHlMdVpOWmUyQkxSc3JjejV6OEtRN1lHaGpH?=
 =?utf-8?B?cG9ZenZOWndqOGlKMEVWOGE4aWlDK3REelFjVUFJNkRLK2V5b1VzVXg5UTBV?=
 =?utf-8?B?QTY3OXJFT25hR1dvNzhSK2s5Y3FPY29ld2Iyb0tNeXc5Wm1yL1N5V3dUVnJp?=
 =?utf-8?B?cCtoc0ZnQWl6YytmRTYzRGNIVWc0Ymh4RHViZEFoZGhyL2VoWEN0ZlEwUGk2?=
 =?utf-8?B?UFJPam9KVkU1YWl6TkpEMEdQRTlNMzJnTnJqWDVEMVdBa1Y2VkNJK1E2NVlj?=
 =?utf-8?B?RmpVOWVGUDhSUjRxK2ZiQnljY3Y3RmI1QnZCVkV5d0tXUGtPQjNWS3pMNDQ5?=
 =?utf-8?B?VzV3TjJIWmMwL1d4bmRLMG81c3JId0djM1hGRnB4d2cxelc4VjJ3QWhDc2JP?=
 =?utf-8?B?elhveWZ0TWMwWWdoempFTEszaXIrTXYzZjhXTzlyYVNkNE1qMlBuKzlGNTRu?=
 =?utf-8?B?ZEJ5K0RWTmdybmhmQmd6N3dib2xPeGlsSThGUjhLQlpTNGJUSHhySzZaUDNP?=
 =?utf-8?B?WlFNNkNVamN0bVFQbHhhWnBUemNMQzB4cDJxeGt2T3dNQTNkS3F1R2VpU2gv?=
 =?utf-8?B?ZXZHc3k3ZUVTZDBBamRvSnpTSFgzT0E0QkxPS3YwL2hrL3NCVXRvTlBtcjJR?=
 =?utf-8?B?Uzgyb0tSNDl6WkZpMGh5cWpKOTdWMEozRzZmV3gwMGJKbnFXa21nSDhldGU5?=
 =?utf-8?B?WnhIWGxpKzBNTFNpYXFDckFVNWJXYWVJUXNkM2JDem91MVpNa1hUc2IzSnB2?=
 =?utf-8?B?VFpqbWtFaHRHdmdkVk0zT3NpRGl1WjBUYlc2N0tmY2NxOGZMR1VHOEk0VFYz?=
 =?utf-8?B?VlhFZzc1WmVBbmZRak9RNjRrZitkaUpycWJxVU1NdkJUTkRKYTdoZElPbFBa?=
 =?utf-8?B?eUJSVWRRTExSR3llOGpFQUUxbHZsVklUMkR5Y0FFK0c2aFMxc3U3dmYvcGhL?=
 =?utf-8?B?WlEzK1hyTXQyWG1yMTdwb2plWGtFMm5PL2pRWnZzQWx6a1p3dkp6SitubXFk?=
 =?utf-8?B?cVdvcGpjbGJ2NlJuV1djYkEwQkhQTG9RMjQ2UmNYQUFsMnc4MDUrQnFyWlh5?=
 =?utf-8?B?UXJYWGgrNEt1WFdPRHF1YVJReFBQNDc4bUN0bSs5RldiUWdoK1NhRWJJUmdM?=
 =?utf-8?B?MVVIVkQyVG5CN05SZURBNVM1ZTF6cE9UbGQ0dTc0UjNOclpBT2ZBR1pTYnZZ?=
 =?utf-8?B?bGgxSi8vYStCSkFwN3IvditRcXdRRGlaNVlBYUtieVdPbit2cVdlekhTZnZn?=
 =?utf-8?B?bDJVUDNhaUxmWjdhdUo5TkFRMVlraEFSNTJNVzdXN21kQnAvd2VJV2V3SVBM?=
 =?utf-8?B?YStwcjgzNEdmV1ZxZDYrKzEzUndPeWcvQnduUkhYZEI0RGw1dVF5UlUxZWVo?=
 =?utf-8?B?R3JXOTM0NlBqUW9mbGtZc3FqQmVtdWp6TlRicHlJejR2QkdIRDRQQ2FCdUVh?=
 =?utf-8?B?UXBra2JldG11aUUySnJ0S2w4OGYvdkhEVFdtazF1aXBJb0lqTjlRS2FMZ0di?=
 =?utf-8?B?dTMvanQ4ZmFSRklrdk9tRmZ1WHowaVp0THlYb1Jxc0JSTzgvMm5NSmd1ajdW?=
 =?utf-8?B?OU1RbFNvcjByeEpsT2JPRzArb1BkNm5WTEZGaFk5QndITHNzTlRERnlJK1M4?=
 =?utf-8?B?N09wZ1BNKzJkN3hLWm9rOEVmRG5WMnU0MWNTbDUxV3hRQytFWjBCL3lVU0Rj?=
 =?utf-8?B?eVErMnNjbzRyK3V5SENMU0tCL3dHTjJ5YkxIT1V2bnZpMjdLa0lCQVZiRmIr?=
 =?utf-8?B?TUZJZC9ZUmR4YVRLSS96VURDSFVJMkYwc01zbU9nMjBGbnVZVTVSanN0dVJa?=
 =?utf-8?B?QUNXSXUwSzNZYjE4a3NOV1dMem5MN0tBYzFnK1h5TDZVcDV1RUlwb0xCN2Zp?=
 =?utf-8?B?bEltWUNZbGdvTk93dXlkYWZFaFNOckVQaFFjOXBOM01lZzdYWTlrb2VHZXdV?=
 =?utf-8?B?T3VQN3FjZlVvRUpteXdWWFYwMktsUXh0amhhUGpIbGNDS2JYTTBzMXNtakdt?=
 =?utf-8?B?R1ZMN0xNREdsYnYxWFQ5Snl5cUx1MnRHUnduc3JFaWVERkdXMUk3akdiWHpO?=
 =?utf-8?B?a0tORlhwb2J6TEl6OHBDNnFDNGxyMFZna2xiUUs2TEdmMFk2QnpnZTFyYXE1?=
 =?utf-8?B?MTB5SloyOFNHcUx0bklOL0V0aWxSSkFPdERnd0hCVHIrWDhzZVFBNDRmL1dP?=
 =?utf-8?B?aytvQ3E4SXhoNHUvU1JQSkRJZWs5QnhTV2tUSEdqTGFlTmZGemtPTlVoUmdy?=
 =?utf-8?Q?0G3t5iQ6vmbJjjaimu8eBQUW6NqvxuJd4fkEMg9yUs=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F4647710D153F441B7DAF3EA2B7BC806@CANPRD01.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: calian.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: c1033358-396d-4212-313d-08d9d6be5300
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jan 2022 17:58:37.3350
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 23b57807-562f-49ad-92c4-3bb0f07a1fdf
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0gZUnqAXEmvh76vm1REpAYzWDQZvN8qgietmS41Uh8mxAMmz3ye7muHXOGDx/91rcsy3w/Yn36Nlpnjvak+oa+PMRa7exEBVgKaWhJdcrW0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YT3PR01MB6277
X-Proofpoint-GUID: fjTZAKoaAHoFBsU1CtdxsvtNVvDvQKdS
X-Proofpoint-ORIG-GUID: fjTZAKoaAHoFBsU1CtdxsvtNVvDvQKdS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-13_08,2022-01-13_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 malwarescore=0 bulkscore=0 priorityscore=1501 mlxlogscore=581
 lowpriorityscore=0 spamscore=0 phishscore=0 adultscore=0 suspectscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201130111
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

T24gV2VkLCAyMDIyLTAxLTEyIGF0IDEzOjQ2IC0wNjAwLCBSb2IgSGVycmluZyB3cm90ZToNCj4g
T24gV2VkLCBKYW4gMTIsIDIwMjIgYXQgMTA6NTQgQU0gUm9iZXJ0IEhhbmNvY2sNCj4gPHJvYmVy
dC5oYW5jb2NrQGNhbGlhbi5jb20+IHdyb3RlOg0KPiA+IE9uIFR1ZSwgMjAyMi0wMS0xMSBhdCAw
OToxNCAtMDYwMCwgUm9iIEhlcnJpbmcgd3JvdGU6DQo+ID4gPiBPbiBNb24sIDEwIEphbiAyMDIy
IDE0OjE5OjM0IC0wNjAwLCBSb2JlcnQgSGFuY29jayB3cm90ZToNCj4gPiA+ID4gRG9jdW1lbnQg
dGhlIG5ldyBzbnBzLHJlZi1jbG9jay1mbGFkaiBwcm9wZXJ0eSB3aGljaCBjYW4gYmUgdXNlZCB0
byBzZXQNCj4gPiA+ID4gdGhlIGZyYWN0aW9uYWwgcG9ydGlvbiBvZiB0aGUgcmVmZXJlbmNlIGNs
b2NrIHBlcmlvZC4NCj4gPiA+ID4gDQo+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IFJvYmVydCBIYW5j
b2NrIDxyb2JlcnQuaGFuY29ja0BjYWxpYW4uY29tPg0KPiA+ID4gPiAtLS0NCj4gPiA+ID4gIERv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy91c2Ivc25wcyxkd2MzLnlhbWwgfCAxMiAr
KysrKysrKysrKysNCj4gPiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxMiBpbnNlcnRpb25zKCspDQo+
ID4gPiA+IA0KPiA+ID4gDQo+ID4gPiBNeSBib3QgZm91bmQgZXJyb3JzIHJ1bm5pbmcgJ21ha2Ug
RFRfQ0hFQ0tFUl9GTEFHUz0tbSBkdF9iaW5kaW5nX2NoZWNrJw0KPiA+ID4gb24geW91ciBwYXRj
aCAoRFRfQ0hFQ0tFUl9GTEFHUyBpcyBuZXcgaW4gdjUuMTMpOg0KPiA+ID4gDQo+ID4gPiB5YW1s
bGludCB3YXJuaW5ncy9lcnJvcnM6DQo+ID4gPiANCj4gPiA+IGR0c2NoZW1hL2R0YyB3YXJuaW5n
cy9lcnJvcnM6DQo+ID4gPiBzY2hlbWFzL3VzYi9zbnBzLGR3YzMueWFtbDogaWdub3JpbmcsIGVy
cm9yIGluIHNjaGVtYTogcHJvcGVydGllczoNCj4gPiA+IHNucHMscmVmLQ0KPiA+ID4gY2xvY2st
ZmxhZGoNCj4gPiANCj4gPiBJJ20gYXNzdW1pbmcgdGhpcyBzY2hlbWEgZmlsZSBuZWVkcyB0byBi
ZSB1cGRhdGVkLCBidXQgSSdtIG5vdCBzdXJlIHdoZXJlDQo+ID4gaXQNCj4gPiBsaXZlcz8gSSBk
b24ndCBzZWUgc3VjaCBhIGZpbGUgaW4gdGhlIGRldmljZXRyZWUtb3JnL2R0LXNjaGVtYSByZXBv
Pw0KPiANCj4gVHJ5IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy91c2Ivc25wcyxk
d2MzLnlhbWwNCg0KVGhhdCdzIHRoZSBvbmUgSSdtIHBhdGNoaW5nLCBidXQgaXQgc2VlbXMgbGlr
ZSBpdCBpcyBjb21wYXJpbmcgdGhhdCB0byBhbm90aGVyDQpzY2hlbWEgZmlsZSB0aGF0IEkgY2Fu
J3QgZmluZCwgYW5kIGlzIHVuaGFwcHkgYmVjYXVzZSB0aGUgbmV3IHByb3BlcnR5IEknbQ0KYWRk
aW5nIGlzbid0IHRoZXJlPyBUaGUgd2F5IGl0J3MgZGVmaW5lZCBpbiB0aGUgYmluZGluZ3MgZmls
ZSBpdHNlbGYgc2VlbXMgbm8NCmRpZmZlcmVudCBmcm9tIHRoZSBvdGhlcnM6DQoNCmR0c2NoZW1h
L2R0YyB3YXJuaW5ncy9lcnJvcnM6DQpzY2hlbWFzL3VzYi9zbnBzLGR3YzMueWFtbDogaWdub3Jp
bmcsIGVycm9yIGluIHNjaGVtYTogcHJvcGVydGllczogc25wcyxyZWYtDQpjbG9jay1mbGFkag0K
L2J1aWxkcy9yb2JoZXJyaW5nL2xpbnV4LWR0LQ0KcmV2aWV3L0RvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy91c2Ivc25wcyxkd2MzLnlhbWw6DQpwcm9wZXJ0aWVzOnNucHMscmVmLWNs
b2NrLWZsYWRqOiAnb25lT2YnIGNvbmRpdGlvbmFsIGZhaWxlZCwgb25lIG11c3QgYmUgZml4ZWQ6
DQoNCi0tIA0KUm9iZXJ0IEhhbmNvY2sNClNlbmlvciBIYXJkd2FyZSBEZXNpZ25lciwgQ2FsaWFu
IEFkdmFuY2VkIFRlY2hub2xvZ2llcw0Kd3d3LmNhbGlhbi5jb20NCg==
