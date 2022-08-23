Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D161B59E746
	for <lists+linux-usb@lfdr.de>; Tue, 23 Aug 2022 18:30:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243191AbiHWQaM (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 23 Aug 2022 12:30:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242416AbiHWQ3w (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 23 Aug 2022 12:29:52 -0400
Received: from EUR02-HE1-obe.outbound.protection.outlook.com (mail-eopbgr10106.outbound.protection.outlook.com [40.107.1.106])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DFDB811F751
        for <linux-usb@vger.kernel.org>; Tue, 23 Aug 2022 05:57:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZEbFd2hbnq2Mn1BIeNPPHDyPyHtRCrWGo7kJuAi/qYlHKlVQ9HcVSi9uTG2lUDt6lD7/kb2Y4DoAZ9Kk+nxTGXKoP8vZMs8h+G0aiNFsXrbLH1Bete+3Xg4j3Ns/5Hy9aQXykH1jqmUisMrhkPMT1p05YZVCTH2GPbXl7VBjEyAyPdMrvcCn+5LEsol6WMQras7blTvpgRbOQCXu3BVtxb78eve5O1O8mRF7zt7jLmYD79XBkaq5emVadFErwIxCIcdW9TAbC2SPC76Gh1caISzkwkLuaS/vycj4djxSQ/5n3EHzY2fkC/6tHKAedKPLWAw/IqpHRDWBpzphFOpxiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HFCLfN8J6c5cnnipQpydA4RFVNrGxvvYtR4fmbsxH3A=;
 b=kH31QBopByjNsZX3wdEJJGwI4cf2F1iybvDTaE5Og4G1NR2dScSyNP3X1xZglN9WrSO/07hYDbp9kyHjE60myMGJ0G7SZXHQ3xIEfFu60VaOS4Y6R8B0AuVyL/IvQHXAtSFnc8xoLR8Lf4CUYnN9Ft08Bk1c0e9kXP/LUeiemj5nMucg+Tb+u+b6+laBVESREWiZgiyZgkw0sCLuHXgM7//biOaQWE7CTMmQPvEbYVqQTVqeHaN+7NQmFyN0bVEjzOr/LkkXSwnY+/wiwZhmSSGVygF1U6b1M8UWgNud0aI95XcbTA22rCIRE3J7IQTiqMryAvSUIxw7hTIs0YAstA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bang-olufsen.dk; dmarc=pass action=none
 header.from=bang-olufsen.dk; dkim=pass header.d=bang-olufsen.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bang-olufsen.dk;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HFCLfN8J6c5cnnipQpydA4RFVNrGxvvYtR4fmbsxH3A=;
 b=DY69iBL0JTkgRSeDp+wTBAPgq9sbiZ0Z1qD0cVbhrLOpuDqLEUp89FV/Oh58Ievv81Qle+f16qFVZEuk8NvXfDI3VtcFxfmVWmhJ7X3BXGEXwOo4v1lmVG6qqNcyntWl7G4z+vTnK9Dj4AIy8zPxfvtzD3TLedctDVaeEmHeOg4=
Received: from VI1PR03MB3950.eurprd03.prod.outlook.com (2603:10a6:803:75::30)
 by DB8PR03MB5961.eurprd03.prod.outlook.com (2603:10a6:10:ec::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.24; Tue, 23 Aug
 2022 12:57:20 +0000
Received: from VI1PR03MB3950.eurprd03.prod.outlook.com
 ([fe80::3965:8efc:7af6:756e]) by VI1PR03MB3950.eurprd03.prod.outlook.com
 ([fe80::3965:8efc:7af6:756e%7]) with mapi id 15.20.5482.016; Tue, 23 Aug 2022
 12:57:20 +0000
From:   =?utf-8?B?QWx2aW4gxaBpcHJhZ2E=?= <ALSI@bang-olufsen.dk>
To:     Marek Vasut <marex@denx.de>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Yassine Oudjana <y.oudjana@protonmail.com>
Subject: Re: [PATCH 2/2] extcon: usbc-tusb320: Add USB TYPE-C support
Thread-Topic: [PATCH 2/2] extcon: usbc-tusb320: Add USB TYPE-C support
Thread-Index: AQHYttWmyehv8/f4MUWjXc+kyDNMBK28S5IAgAAmhIA=
Date:   Tue, 23 Aug 2022 12:57:20 +0000
Message-ID: <20220823125719.bafu6k72jf5u7z7z@bang-olufsen.dk>
References: <20220730180500.152004-1-marex@denx.de>
 <20220730180500.152004-2-marex@denx.de>
 <20220823094934.so377vfpe4vipxuw@bang-olufsen.dk>
 <d1df55df-3baf-4200-cee5-7dbc3311a4de@denx.de>
In-Reply-To: <d1df55df-3baf-4200-cee5-7dbc3311a4de@denx.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bang-olufsen.dk;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cda5e4bb-424c-4e60-5826-08da850703ea
x-ms-traffictypediagnostic: DB8PR03MB5961:EE_
x-ms-exchange-atpmessageproperties: SA|SL
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: HQJijGMwQrhz090CDuSCGJyLJxxsTZdItgsUB96PEJtrE9mR9tL+T1hEc4v2M89fA8C/esmEM6NmJp+KlhqyJk/vyzvIJlWbmygjGkL6ckHUJ9Lcj1nkRDzpoWyVKQUKQTWyDRHg0OXgsthGUcjm821rGPQDEdL8IIh1kgMqBaFCM2EydbheTIQKCSQiJeYim1NPXs/mJ6Vctq34RhQ8MGXt3NZdaDcUyNr+sWm+ERcOvgRwb8weAasLLFPgg0LlUpuu8w+hRrivFCXH0vRMDyAsL3AvnP9AFG07FJI/xPB5swJrfU229Zk7QTHyXPwadfhBDuODK935cYQLKnwtJO46rwnXG5KlzB/NBtYLe16gQEEQSxAW6cfr/HjHqDKH8Lmgg5HQaRr0cIQ/IVwpSS4o8CyW0WFRRxt3YxopGZ3dVGelCnY188cJFkoGFO26+8ZSXAQVDX767pmlUJQcwyct0s6PAHVPD5j16LA4rcU/Zcjd4c7g0VILl0gBupRpu0FOBiL0ZCywReKhxZ8dvseavkRO735hbq2Ii6wDY7yUGw6EJv8/OMrGVk1J5ukHv+qIwuXPfZgdHf2dd+rq/xxATAc90leo4rSzlshP79P7FrHkTRgg5h7IKJKFuzw5XwyhxGbmjLRe0b2G75ABhAA+HF3kJ0O5p+CNizc9ru+PJOpycN//2zmrJNeAtpxbUSg5WgdfNaRPpfcLo0TmYbh3BlEl4rlF1mR0CNufiwl7lWlNm4POk3Gd6vQJ1M1XF8Uy9Z1dJLIGs8jLcwgNiZoflTa0oqemjfjgfo/E2u4=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB3950.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(366004)(39850400004)(396003)(376002)(136003)(83380400001)(66574015)(26005)(53546011)(6506007)(6512007)(2616005)(2906002)(1076003)(186003)(38070700005)(86362001)(36756003)(38100700002)(122000001)(966005)(316002)(76116006)(91956017)(6486002)(8676002)(4326008)(66556008)(66946007)(66446008)(6916009)(64756008)(66476007)(8936002)(85182001)(54906003)(85202003)(5660300002)(41300700001)(8976002)(478600001)(71200400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Myt6c2xoTVRKZGRPMVhmNjU5eDFvaTlXcCs2K2lxSEw0d2hvN01OMFNiTkNF?=
 =?utf-8?B?RkVmR21Hbml5TTZwYVRVeG0vN0s3ZGtxZkg0Qm9KMlNsY1ZkV0xTNWNBZVRs?=
 =?utf-8?B?djJidkJnV1R3czkxVHhLdEkvVEdPVmJVcTd4cFJSeDRmQUZSSno0eGxLNDUw?=
 =?utf-8?B?eWczZ2FEVFZtbWRFaURtdDNFbVpXbkE3WHFvM3MyMkg0c2NFQ2V6TzJYN0xN?=
 =?utf-8?B?SFVoeEVRR1RTQnNJSE5ucDhYMzdXTldOUkVyUGpWSEhLK2cxM0dqVGRSRk4v?=
 =?utf-8?B?WU9sR2FSSDB3NmtxSmJaR0ltc3Z2NzZSOGhwRXErR3BiV1Z1bE13cDRPYjZ0?=
 =?utf-8?B?TmhBZmRwYjRFTDR3NGNqNkQvdWlUV1VRRkNSRTFjMEtkZFIyaUlMNXFKUDY5?=
 =?utf-8?B?RGgrVWFXd1BJU3V5dC9MSWVBSGJPbm91VTVodnpwMWlBMkV4dS9ueVByMVIx?=
 =?utf-8?B?SzNjdmdaUFhIREI2UUl5cDJzTEU2UVFGRHlpOW1CbHc4YTdwRzZIVVVzaFcy?=
 =?utf-8?B?b2l0U0pRQTlMWVZBa09sVWdXNzRwenlVb1ZaSGlhT1dweS9YWW5WVE1obkxS?=
 =?utf-8?B?d3BhVHA4UGJDem5NRGs4aXZsN0ZQMC9Td1BIb2NkdDNUdjVwTnUvQlRHU2dy?=
 =?utf-8?B?Y1FDN25rQk1GTFkvNmxYYmliS3hrOS82MjlMWUs0WER0S2tZZVpESWI3RUw1?=
 =?utf-8?B?bjdwQ3BPK2Rmdm4rYU9oRFdKWEU3ZTg3czNuSU12Z29TY2wvbEhzejFPUW5B?=
 =?utf-8?B?MlFFSnNmenBNc2lodGNUZVV6TjFackh5OUlldXpzc1JTcWs2eWwwTDdlZm5Y?=
 =?utf-8?B?TW16NGVSZ1JET2FwdXhnVC83ajVZYnk2VE5vVnZrWFl1c0NnOFl0ejg0S1lX?=
 =?utf-8?B?NlRnQjZFTHBDcjNVaVd4SlNoZWZTR1luL2NQeW14enYzdGdadC9QVXMrQnov?=
 =?utf-8?B?aUxrUGRCYzRNbWlnRSsrRjFISE1JeVpOM3poQWFTN1R3WVBNRW1OVUlKbW5k?=
 =?utf-8?B?SHR3eU5HZ0FLMWxJNUN5NVF5RGNkWk80cDVhbFlaMTczMEwzZGFCOGlnZ0do?=
 =?utf-8?B?Y0lkVlMxcVlGcnA3dHVkb2ZZQTJtbGhCaTRIQTlVU1p2MXlpb0IvQ0QyTVJm?=
 =?utf-8?B?SGZ0K3hEMlBPTVAxOUdJNUFlWndiRDJqN20yZlAzWVZKd3pNTHF5NnA1MU9u?=
 =?utf-8?B?QVpJVHU3U1lRSWR5UGNVWGhGQUFBVkxTbU9rdXVwMFV6NjF0OG10WXV4QTIx?=
 =?utf-8?B?UW5nditSd3RkL0loai9tc0dYOTdMMWt4MUc1YzFQZkNSSHBIZktyM0NrVDRr?=
 =?utf-8?B?TSs5Qlg3UmdMUllwcmJBQjU5bk1DRXp1YTV2cHZpT3J4dkFZdEhZV0wyWFY4?=
 =?utf-8?B?S2o0Q3QwOXFBOFEyZ1FuN0pFcUoxcEFvSVMxcGRSUEVFZ2hlaFVzbnBCN3I1?=
 =?utf-8?B?TVd1b0tENVhqK1RTY25BV2xURmhOd2F3Y0F4YjlTbVAvcmg2OXBwTVFMWlpW?=
 =?utf-8?B?K1FJUklLSjB6NGdhU3dvUGhra0xwKzkrSHZFS2Qvclh6SnlqMEZ5amg4Qmx1?=
 =?utf-8?B?azgyU0QyWXBWQTVXcVlVcVQxUm9VUW85cmZZVlVhN0I4YnNobVhjc2UvN3d5?=
 =?utf-8?B?R3NvLzhtK2lNYTZNN1BhWkJPZnV6clVlN2xhUWZmMExIWUxZR3pkZ1V6YmdX?=
 =?utf-8?B?Q3EzcWdsaE1NK3BCcTZNNDU5U0J5VGpyb0FJcDZXUERaWFlZTnUxR09tN3lQ?=
 =?utf-8?B?Y3p2OHlGOUJiYzFQM3ZQc2w3cGRhWWJkK2FRcjdVRDl0dWRNYzIxdnVXTisr?=
 =?utf-8?B?cXBMSTc0MjUxTERKUWI0ZlVCWmwrM3FyNW8valBiMFVkd0lkUGMzVTZNc0Fh?=
 =?utf-8?B?L2dJOFNhbEZnVjhqOGt5ejRrZUlBRHpIR08zbDdaMFMwdDFHRmpaYWpzMDlW?=
 =?utf-8?B?VUxNaTVzRDE2MTdZRktQU1JCaEtYdE93dlJvUTF5YWZjckdzVWE5T09jVTFU?=
 =?utf-8?B?QVZDWGk0clB2dHNzMzZrN0Fvcm9kZENGazRBcTh2b3c4TGZZRHUyMkU3dlJW?=
 =?utf-8?B?Z2RTbDh1YjFJR1BIbGZSUkk5VXZlbmlTL3gzblhWNTFNNFl4OTRBaGgrVTRO?=
 =?utf-8?B?SmM4b0swYTBOajB5UU1WYXM0R3ZLOEJRK2pDQ0RkUGRXQ2dZQ2FrMG4xYkN3?=
 =?utf-8?B?bHc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <63CF8E714292E8418F27AB6DF0F30D7D@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bang-olufsen.dk
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB3950.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cda5e4bb-424c-4e60-5826-08da850703ea
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Aug 2022 12:57:20.3145
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 210d08b8-83f7-470a-bc96-381193ca14a1
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: slTVds8o15sSfbKJlskoDtxrPURfHKzfkqpM3ibjECUmSMC2YyZgLeBhWgVcqbApYr+hodDU0Y30LPLlEiXlKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR03MB5961
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

T24gVHVlLCBBdWcgMjMsIDIwMjIgYXQgMTI6Mzk6MjhQTSArMDIwMCwgTWFyZWsgVmFzdXQgd3Jv
dGU6DQo+IE9uIDgvMjMvMjIgMTE6NDksIEFsdmluIMWgaXByYWdhIHdyb3RlOg0KPiA+IEhpIE1h
cmVrLA0KPiANCj4gSGksDQo+IA0KPiA+IE9uIFNhdCwgSnVsIDMwLCAyMDIyIGF0IDA4OjA1OjAw
UE0gKzAyMDAsIE1hcmVrIFZhc3V0IHdyb3RlOg0KPiA+ID4gVGhlIFRJIFRVU0IzMjAgc2VlbXMg
bGlrZSBhIGJldHRlciBmaXQgZm9yIFVTQiBUWVBFLUMgc3Vic3lzdGVtLA0KPiA+ID4gd2hpY2gg
Y2FuIGV4cG9zZSBkZXRhaWxzIGNvbGxlY3RlZCBieSB0aGUgVFVTQjMyMCBpbiBhIGZhciBtb3Jl
DQo+ID4gPiBwcmVjaXNlIHdheSB0aGFuIGV4dGNvbi4gU2luY2UgdGhlcmUgYXJlIGV4aXN0aW5n
IHVzZXJzIGluIHRoZQ0KPiA+ID4ga2VybmVsIGFuZCBpbiBEVCB3aGljaCBkZXBlbmQgb24gdGhl
IGV4dGNvbiBpbnRlcmZhY2UsIGtlZXAgaXQNCj4gPiA+IGZvciBub3cuDQo+ID4gPiANCj4gPiA+
IEFkZCBUWVBFLUMgaW50ZXJmYWNlIGFuZCBleHBvc2UgdGhlIHN1cHBvcnRlZCBzdXBwbHkgY3Vy
cmVudCwNCj4gPiA+IGRpcmVjdGlvbiBhbmQgY29ubmVjdG9yIHBvbGFyaXR5IHZpYSB0aGUgVFlQ
RS1DIGludGVyZmFjZS4NCj4gPiA+IA0KPiA+ID4gU2lnbmVkLW9mZi1ieTogTWFyZWsgVmFzdXQg
PG1hcmV4QGRlbnguZGU+DQo+ID4gPiAtLS0NCj4gPiA+IENjOiBDaGFud29vIENob2kgPGN3MDAu
Y2hvaUBzYW1zdW5nLmNvbT4NCj4gPiA+IENjOiBHcmVnIEtyb2FoLUhhcnRtYW4gPGdyZWdraEBs
aW51eGZvdW5kYXRpb24ub3JnPg0KPiA+ID4gQ2M6IEhlaWtraSBLcm9nZXJ1cyA8aGVpa2tpLmty
b2dlcnVzQGxpbnV4LmludGVsLmNvbT4NCj4gPiA+IENjOiBZYXNzaW5lIE91ZGphbmEgPHkub3Vk
amFuYUBwcm90b25tYWlsLmNvbT4NCj4gPiA+IFRvOiBsaW51eC11c2JAdmdlci5rZXJuZWwub3Jn
DQo+ID4gPiAtLS0NCj4gPiA+ICAgZHJpdmVycy9leHRjb24vS2NvbmZpZyAgICAgICAgICAgICAg
IHwgICAyICstDQo+ID4gPiAgIGRyaXZlcnMvZXh0Y29uL2V4dGNvbi11c2JjLXR1c2IzMjAuYyB8
IDE1OSArKysrKysrKysrKysrKysrKysrKysrKysrKysNCj4gPiA+ICAgMiBmaWxlcyBjaGFuZ2Vk
LCAxNjAgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPiA+IA0KPiA+IEhhcHB5IHRvIHNl
ZSBJJ20gbm90IHRoZSBvbmx5IG9uZSB0aGF0IG9ic2VydmVkIHRoaXMuIEkgd29uZGVyIGlmIHlv
dQ0KPiA+IHNhdyBhbHNvIG15IHByZXZpb3VzIHN0YWIgYXQgdGhpczoNCj4gPiANCj4gPiBodHRw
czovL2xvcmUua2VybmVsLm9yZy9saW51eC11c2IvMjAyMjAzMDExMzIwMTAuMTE1MjU4LTEtYWx2
aW5AcHFycy5kay8NCj4gDQo+IEkgaGF2ZSBub3QuDQo+IA0KPiA+IEkgaGFkIHNvbWUgaXNzdWVz
IHdpdGggdGhlIGR0LWJpbmRpbmdzIHdoaWNoIEkgY291bGQgbm90IHJlY29uY2lsZSwgYnV0DQo+
ID4gdGhlIGJhc2ljIHByb2JsZW0gd2FzIGhvdyB0byBkZXNjcmliZSBhIHR5cGVjIGFjY2Vzc29y
eSBtb2RlIG11eA0KPiA+IGNvbm5lY3RlZCB0byB0aGUgVFVTQjMyMC4gUGVyaGFwcyB5b3UgaGF2
ZSBhIGJldHRlciBpbnR1aXRpb24gZm9yIGhvdw0KPiA+IHRoaXMgc2hvdWxkIGxvb2s/DQo+ID4g
DQo+ID4gT25lIHRoaW5nIHRoYXQgaXMgbWlzc2luZyBmcm9tIHlvdXIgaW1wbGVtZW50YXRpb24g
dGhhdCB3ZSBhcmUgdXNpbmcgb24NCj4gPiBvdXIgZW5kIGlzIHRoZSBVU0Igcm9sZSBzd2l0Y2gu
IEkgc2V0IHRoaXMgZnJvbSB0aGUgdHlwZWMgZHJpdmVyIHZpYQ0KPiA+IHVzYl9yb2xlX3N3aXRj
aF9zZXRfcm9sZSgpLg0KPiANCj4gSSBvbmx5IHVzZSB0aGlzIGNoaXAgdG8gZGV0ZWN0IGNoYXJn
ZXIgdHlwZSAoYW5kIGNhYmxlIHBvbGFyaXR5KSwgdGhlIGRldmljZQ0KPiB3aGVyZSB0aGlzIGlz
IGludGVncmF0ZWQgaXMgYWx3YXlzIHBlcmlwaGVyYWwgYW5kIGNhbm5vdCBjaGFyZ2Ugb3RoZXIN
Cj4gZGV2aWNlcyBvciBiZWNvbWUgaG9zdC4NCj4gDQo+IEJ1dCBJIHRoaW5rIHRob3NlIGFmb3Jl
bWVudGlvbmVkIHJlcXVpcmVtZW50cyBjb3VsZCBiZSBleHRlbmRlZCBvbiB0b3Agb2YNCj4gdGhp
cyBwYXRjaCwgY2FuIHRoZXkgbm90ID8gSSByZWNhbGwgSSBsb29rZWQgYXQgbGVhc3QgYXQgdGhl
IGRpcmVjdGlvbg0KPiBkZXRlY3Rpb24gYW5kIHRoYXQgY291bGQgYmUgYWRkZWQgZWFzaWx5LiBJ
IGhhdmUgbm8gd2F5IG9mIHRlc3RpbmcgYW55IG9mDQo+IHRoYXQgZnVuY3Rpb25hbGl0eSwgc28g
SSBkaWRuJ3QgYWRkIHRoZW0gYXMgcGFydCBvZiB0aGUgcGF0Y2guDQoNClN1cmUgLSBpZiB5b3Vy
IHBhdGNoIGdldHMgbWVyZ2VkIHRoZW4gSSdsbCBqdXN0IGV4dGVuZCBpdC4gRmFpciBlbm91Z2gN
CnRoYXQgeW91IGNhbm5vdCB0ZXN0IG9uIHlvdXIgYm9hcmQuDQoNClRvIHRoYXQgZW5kLCB5b3Ug
Y2FuIGFkZDoNCg0KUmV2aWV3ZWQtYnk6IEFsdmluIMWgaXByYWdhIDxhbHNpQGJhbmctb2x1ZnNl
bi5kaz4NCg0KVGhhbmtzIQ0KDQpLaW5kIHJlZ2FyZHMsDQpBbHZpbg==
