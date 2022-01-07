Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E380487A06
	for <lists+linux-usb@lfdr.de>; Fri,  7 Jan 2022 16:58:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239764AbiAGP63 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 7 Jan 2022 10:58:29 -0500
Received: from mail-am6eur05on2048.outbound.protection.outlook.com ([40.107.22.48]:6002
        "EHLO EUR05-AM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S239687AbiAGP63 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 7 Jan 2022 10:58:29 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EbsU2YYfWdVj5JRkBmlRjF6lbcJLdbKjCVJ9A4qh8wTjVu5kJk6Au+B4cDMt3S3bOElyJMIcoobKJ7zXXyyNzRMepT5BtJEdQOrPw2FYKaOpbY+BqDGOBL3qXrjkj0+mfHNm6JebDMlZUZGY2vzLmy9vsXjlZ5lt8LYOTOCIeSLy/v+OoHnCLvHB1rNpGp78ZtmY8BluLs77G5XZjUGlS4at0tooF8gL1GqfCYlAdKaZqRfkiGMsTBfdBGdvBseS5igq8H8Zd/5cbGBnPxJBA20+OcaHMsj2eTZAei5c4ECxiJOReXn22KZIco8+pzJRxLHtLmWwe2MW7exjC+RXaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k3GVipKWAbnX3RncUIttUdwd5a+GhfAEhnthGs4hIx0=;
 b=Q5VxRCPUvVjuRJXds3lXsJ3PmtAO1JHech8ntwU3eQhM6UEkTOuywNWNMGgH2ocYLXGDROuG52HTvKzkVZ4/0mW4iwc6BPId21C/J2ekqOdwdKANM1kNnH/f/8SeHGosU3g8xDj/TrLW3Z6ww6mfp/EXxoV9PZjkTXmc+5L17KpdsG8PpWnl70quHIBolMbB46iglBLh4LYI85yPfVuCYpTHkKLJIgd25xp6yiz5kvjDnEbwbgqbjHpyxH/Yumm+j8IAPrPXRipm/siY70Yx51sk27dPx/NAEJe6Ze5qwa9apuruVT2pQO4CG/K2a1OeBWRRVTghGXafWIKiIJCS/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k3GVipKWAbnX3RncUIttUdwd5a+GhfAEhnthGs4hIx0=;
 b=rLZl2OeNc4i2WC0MPZi9slA7XqNUuXCgw7D6wl+TxvmV3MhkxLp2fuaWl4nHxg79SFk2MNlywIyggbiKUlO9qOVCwzPSafO13jLwPUE4+thMtoKqAphtPQhZEyz9hjbvKI3/Bb1J/2He1alOiJFessHd4zO0NKZzy5U5G5NZSRU=
Received: from PAXPR04MB9186.eurprd04.prod.outlook.com (2603:10a6:102:232::18)
 by PAXPR04MB9089.eurprd04.prod.outlook.com (2603:10a6:102:225::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.7; Fri, 7 Jan
 2022 15:58:26 +0000
Received: from PAXPR04MB9186.eurprd04.prod.outlook.com
 ([fe80::21ff:7873:e75:7c51]) by PAXPR04MB9186.eurprd04.prod.outlook.com
 ([fe80::21ff:7873:e75:7c51%8]) with mapi id 15.20.4867.010; Fri, 7 Jan 2022
 15:58:26 +0000
From:   Frank Li <frank.li@nxp.com>
To:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "mathias.nyman@linux.intel.com" <mathias.nyman@linux.intel.com>
CC:     "peter.chen@kernel.org" <peter.chen@kernel.org>,
        Jun Li <jun.li@nxp.com>, Zhi Li <lznuaa@gmail.com>
Subject: xhci crash at xhci_disable_hub_port_wake when system suspend.
Thread-Topic: xhci crash at xhci_disable_hub_port_wake when system suspend.
Thread-Index: AdgD3VfMVBJx3GKFRn+PRgFnr8Fjng==
Date:   Fri, 7 Jan 2022 15:58:26 +0000
Message-ID: <PAXPR04MB91861A98BE9D240FFEC1D560884D9@PAXPR04MB9186.eurprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 45bb185f-1461-4f29-bac3-08d9d1f68a6f
x-ms-traffictypediagnostic: PAXPR04MB9089:EE_
x-microsoft-antispam-prvs: <PAXPR04MB9089C7AC960AF121A6755057884D9@PAXPR04MB9089.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:568;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 6mvceoyPx8Z1JaAigc2b2x+p58E6ytPAwxmGN9RlSkZ3IblVCCvPOlGrtMdyT5o5bCjG7SIxtyApJlxj2kPFaiHM6F/aliu8ARv6RU51/eOUErc4RHJltuvnMcjxiFL7T4go5YXEBjEJjnKkGCkQN/PE053jgufDEdbRQzppA6j0jqAAUg9SNenFnQuc7wzw2F38fmhtX2f5utZv+WXPnk0IAOHNoKJxlcTmMRAKGwaJncIiHbTxY/djxFTiibhW8yqopDDYGPC9SR9xGWDy9ufy0eUYVhoFQbMQMu/bjgVVpHcDAVZQWTc8IelekVSU7Nmbj1kG/lAj4mqq26C3E3zQz2Wo+sx10oLGYxVGydQgbxubd+UAadbSiUIWPAfkuTI58PtmdCY/9TRiqz157DE9FAJs4cPzFf9iUnjTe87v3qoIDOEh8SIGSyfFUwHMaq26HVW4Zm/5C31JSb41zhJcwEvWq8377UQwJpugxImmloGnvmCijitlQxSiXZ0tHWYWlgM/AiztCTG5wnuQIXc2TyP2S1fdA4buj1XcLyi0AOu5JrtSFuPOfuIyR2wDjxh2teGPO1cvIkBNrOgly2B/bUiXC505cB1q3txMemZbIuaCmXjQHVUjwdCk8qLeioMHfxQdLgfrjJBdrzlx2yH/zcnLW5hhQSgvJkA9dzIzCYc4ie6IgTZX/wqpHO8xLR17459a/jW3LO4LGH6ksA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9186.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(38100700002)(83380400001)(86362001)(122000001)(38070700005)(316002)(9686003)(508600001)(44832011)(54906003)(186003)(55016003)(66556008)(66446008)(6506007)(76116006)(4326008)(66946007)(33656002)(66476007)(64756008)(26005)(8936002)(52536014)(110136005)(5660300002)(71200400001)(7696005)(8676002)(2906002)(15650500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?gb2312?B?TFIxNk0ydWI5OVZ5c2sxUkpubFVIVXB5TGdTNFJCUDcvTFZBWWRxREFrUzc4?=
 =?gb2312?B?L0huNGd3SlNpdW9vR2FrM2ZlazJoWGpnSkp6TmQ4SDNVN25qT05JL3J5cTNh?=
 =?gb2312?B?cVIrdWF3YWxtUzNIQU54Rkt6UWdpLzBCb1drU04wMHdJUzA4UlpMTFU5ZS9O?=
 =?gb2312?B?Rk9UYUk2M0NrQ2VFa2ZtbGtvaW9INERmbGhCU2xENjBrT0JteE1SOWNFZ240?=
 =?gb2312?B?WUxreWllQ0tFSno0QTlDMFpQcXJjcStjN1M3OHN0NzlRRmE0dG5WTDBTOXV5?=
 =?gb2312?B?OHZSWklYb1lXMDFYcEdlN0ptLzZSZUdRRjFsQ2ZMbGJvLzB3a1NybE9kdlp1?=
 =?gb2312?B?OGFybmdVdDE2aGRjMXB1bFZqblB2S3JZMFZjVmtwb0lvNEtCb1FBRzd0d1lq?=
 =?gb2312?B?RXV1alRIdDJrUkNjdE9RbXVRWHFTa3BnTjdzb1RoaWhHY3cwa3JEbVJ6NWdJ?=
 =?gb2312?B?eVpFbDdpL0tkd1pBcGw4dGdmc3oxTFpiYWNaUFd1c3JzcTU2NnpIbnQyNThX?=
 =?gb2312?B?WERYWXp3dEFHaEpUczhlc3hELy9hY09wcjNYdHV3NWQ1ZHg4SUZjTjNYUkU1?=
 =?gb2312?B?eUlHNE40QmhpRTlMb1Y4L01CVG5CaXpoNzlkSGV6RXJlSUpkbjNlTk1tc1Jq?=
 =?gb2312?B?WkpiOTlBMmdhUk5sS2szVjBqVUswR2phRlc5L1QyMVNOTy9PalVzQTN5cUQr?=
 =?gb2312?B?MS9Qa0Y4bmxGeVArdWVqeEVtYUUrSEp5cFBieWV2MXdtY0pPWVJYaTdzaUc3?=
 =?gb2312?B?Y2U1LzhYdDVjVXRnWWdlSjRJQmRidkx1UFRMdXpTQ1BSTHIvcExGcWUreGgr?=
 =?gb2312?B?VVdqWGQxUHNMa3N1VzdQL01jQVkxZGhGYU5MVlpBNytTR0E2eGY2L2ZQV1Jl?=
 =?gb2312?B?TWd1ZUIxNktxWnBxSVBzZFJlb1d6Q0p2cGRUNkJrQ2tkSWpXMStyakJ3blJN?=
 =?gb2312?B?VXhNRTZ2U0QwNDVPSTBLTTJxcFFMeUNyV1ViQWNEMlF2OFAzSURSUWZkSjFH?=
 =?gb2312?B?NWhBT2dFWEZHUFpMU2tYd0JzUDFUckZYL1JiNEZHOEJmMVdCenRvT2ZKRmlk?=
 =?gb2312?B?bW5tQ1N3bmVMdG5ISXpLRUtHNFgrOGVQNkdlSGMxK2FKaVZ6ak11aDRRbzdl?=
 =?gb2312?B?a3FlWWVOd3FlOHFqZm1hNHpyNzFoYzRFMFpMWW5DUVN1MW5ocTlGWHgvY0pR?=
 =?gb2312?B?UmdSbVFzUG5BRnNOcVRJRm1YS29NQkw1Y0poRUZFQjgxY2Urdm1XajF5bS9t?=
 =?gb2312?B?NFZpdkxpbkRaM1FwdTE3eTdWRVlIZVAyYjZUQzFGUGVJWlVBTFBsRXg3b0wz?=
 =?gb2312?B?eUhRVmdLcExWR2JnQXAxRDRlOHJFTUJzbFdrYW9ObjdmeVV0Uk9Jc1ZRbi8z?=
 =?gb2312?B?QVowdE5Sa2hWdWlvMnJUZXEvdHhrdmgvL1RGTHlTZDNhOGNxb2tpeTJtSENz?=
 =?gb2312?B?VVpwVDhJaUpSN3QxTG9MdG8vVFVabnhKd0h5d2hXNnl2TmVXVE56Z21hMkg3?=
 =?gb2312?B?eVhwS0ZQR3JVbkYvNG91QzVRa0JBalNCaG5FamRVN2loU1lCQVUxU0wwamFZ?=
 =?gb2312?B?Ukh5YUF4OTlwMCt3NXBON3BFVUJncm9aaERVTDJPNWl2N0N4UC8rTEIvMnNN?=
 =?gb2312?B?MW51T0tSTThCdGJ6blJFNytOaVNUcVI0V2pQVUhyQXlzRXpJNUcyclh3S0JV?=
 =?gb2312?B?a3kydXpqYnZpeVJQc0dMWVJjMmFaaTJCOU5xS2x5OXB5MmNCcjFLVWs5MitP?=
 =?gb2312?B?SHRYRWh5eEo5VVdoVUN6eHMwTGhWMW1wbUVidnNZMmMyZk45RSswekNLaW1I?=
 =?gb2312?B?Mk9iSVhld3F5eGFlamV3YVp2dUQ0WUJHRTdjUVVya0VZd2hZRnUvQUlrTFlt?=
 =?gb2312?B?WVZja0g1cWVtdklOS1NQWnJZV1czWGFPaWl3YVhNcllxSGE2dmg0SDFQcjVq?=
 =?gb2312?B?MGFYRStnd0VMejluWE1CQnk2YVRWVnBEYmM5UWtZdndXbmpxQWZKcHR5NmtF?=
 =?gb2312?B?enhwQ1hmeGJLZjNsbHZuN3prZkI4cncvQ2xKbGl1dTQrcENZalUrdkxOM1lP?=
 =?gb2312?B?dWxqUXphMXZGY3NSZlpnaUQwMEEwSjZUTjhTZGYwTWQ1ZldaMzBqbmpwckVS?=
 =?gb2312?B?L0F1c2dzanYxZXU1ZCtTY3d5TXFKM0ZYT2tja25vSkxhUXd4bWU5djZmeUVL?=
 =?gb2312?B?aFE9PQ==?=
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9186.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 45bb185f-1461-4f29-bac3-08d9d1f68a6f
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jan 2022 15:58:26.3592
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0aPLEt/kEi+1Xx6EVGvbwnwYgCZDQznbmRRXdA7Wgfg/xSCAAj3rMRr0WHOdP+esT+rre2F0QlpMV5OMYt01Ig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9089
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

TWF0aGlhcyBOeW1hbg0KDQoJUmVjZW50bHkgd2UgZm91bmQgYSBjcmFzaCBhdCB4aGNpX2Rpc2Fi
bGVfaHViX3BvcnRfd2FrZSB3aGVuIHN5c3RlbSBzdXNwZW5kIGlmIGVuYWJsZSByZW1vdGUgd2Fr
ZSB1cC4NCg0KCUJhc2lhbCBmbG93IGlzLg0KDQoJMS4gcnVuIHRpbWUgc3VzcGVuZCBjYWxsIHho
Y2lfc3VzcGVuZCwgeGhjaSBwYXJlbnQgZGV2aWNlcyBnYXRlIHRoZSBjbG9jay4gDQoJMi4gZWNo
byBtZW0gPi9zeXMvcG93ZXIvc3RhdGUsIHN5c3RlbSBfZGV2aWNlX3N1c3BlbmQgY2FsbCB4aGNp
X3N1c3BlbmQNCgkzLiB4aGNpX3N1c3BlbmQgY2FsbCB4aGNpX2Rpc2FibGVfaHViX3BvcnRfd2Fr
ZSwgd2hpY2ggYWNjZXNzIHJlZ2lzdGVyLCBidXQgY2xvY2sgYWxyZWFkeSBnYXRlZCBieSBydW4g
dGltZSBwbS4gDQoNCglXaHkgZmluZCB0aGlzIGlzc3VlIG5vdywgdGhhdCBpcyBiZWNhdXNlIHBy
ZXZpb3VzIHBvd2VyIGRvbWFpbiBkcml2ZXIgd2lsbCBjYWxsIHJ1biB0aW1lIHJlc3VtZSBiZWZv
cmUgaXQuIEJ1dCB0aGUgYmVsb3cgY29tbWl0IHJlbW92ZSBpdC4gDQoNCmMxZGY0NTZkMGYwNmVi
OTI3NWMxY2Q0YzY2NTQ4ZmM1NzM4ZWE0MjgNCkF1dGhvcjogVWxmIEhhbnNzb24gdWxmLmhhbnNz
b25AbGluYXJvLm9yZw0KRGF0ZTogICBUaHUgTWFyIDQgMjA6Mjg6NDMgMjAyMSArMDEwMA0KDQog
ICAgUE06IGRvbWFpbnM6IERvbid0IHJ1bnRpbWUgcmVzdW1lIGRldmljZXMgYXQgZ2VucGRfcHJl
cGFyZSgpDQoNCg0KCQ0KQWNjb3JkaW5nIHRvIEhDRF9GTEFHX0hXX0FDQ0VTU0lCTEUgbG9naWMs
IHhoY2kgc2hvdWxkIG5vdCBhY2Nlc3MgaGFyZHdhcmUgd2hlbiBzZWNvbmQgdGltZSBjYWxsIHho
Y2lfc3VzcGVuZCB3aXRob3V0IGNhbGwgeGhjaV9yZXN1bWUuIA0KDQogICAgICAgIHhoY2lfZGlz
YWJsZV9odWJfcG9ydF93YWtlKHhoY2ksICZ4aGNpLT51c2IzX3JodWIsIGRvX3dha2V1cCk7DQog
ICAgICAgIHhoY2lfZGlzYWJsZV9odWJfcG9ydF93YWtlKHhoY2ksICZ4aGNpLT51c2IyX3JodWIs
IGRvX3dha2V1cCk7DQoNCiAgICAgICAgaWYgKCFIQ0RfSFdfQUNDRVNTSUJMRShoY2QpKQ0KICAg
ICAgICAgICAgICAgIHJldHVybiAwOw0KDQogICAgICAgIC4uLi4uDQogICAgICAgIGNsZWFyX2Jp
dChIQ0RfRkxBR19IV19BQ0NFU1NJQkxFLCAmaGNkLT5mbGFncyk7DQogICAgICAgIGNsZWFyX2Jp
dChIQ0RfRkxBR19IV19BQ0NFU1NJQkxFLCAmeGhjaS0+c2hhcmVkX2hjZC0+ZmxhZ3MpOw0KDQpJ
IGFtIG5vdCBzdXJlIGlmIGl0IGlzIHNhZmUgdG8gbW92ZSB4aGNpX2Rpc2FibGVfaHViX3BvcnRf
d2FrZSBhZnRlciBIQ0RfSFdfQUNDRVNTSUJMRSBjaGVjaywgT3IgbmVlZCBhZGQgYWRkaXRpb25h
bCBydW5fdGltZV9yZXN1bWUgYmVmb3JlIGl0LiANCg0KDQpiZXN0IHJlZ2FyZHMNCkZyYW5rIExp
DQoNCg0KDQo=
