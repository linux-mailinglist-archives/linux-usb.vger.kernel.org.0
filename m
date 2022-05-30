Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 376CA5378AB
	for <lists+linux-usb@lfdr.de>; Mon, 30 May 2022 12:07:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234681AbiE3JKJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 30 May 2022 05:10:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234719AbiE3JJ7 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 30 May 2022 05:09:59 -0400
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-eopbgr80045.outbound.protection.outlook.com [40.107.8.45])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0BB697A45B
        for <linux-usb@vger.kernel.org>; Mon, 30 May 2022 02:09:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YzYClWAFkWE5DdZuH4Mav6ZJQGbvDNjVzpHAQOKsrSl28CQLzI8xBOmlWc/qBlwed6iUZKgCCcbkb7+9UxPkjlE8b2AhlsqiAFlF/CG8JufO9vhGzgzdA0S9K4xjhSoo6yZQTeZSr8OUbrPP0QSAAX7NOAGw5P0uiAImoryy3A4PHqSzmLFu7F9uxRLPo/P8UQ3GjZQNdhQ3GjNP2oulIf/AdGGuZOqfkNBeDXWse0bX8QJC9m+EdKVZPf24T9D8nT8Q9YVss9lj0CTsjZpq5fVnKNmR216sOI6YWPs8xV5nKD4Rhed61Vap9r+W/WQ5eKhrB1oQURnwcgZUYnA6DQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TOJfjW4zSJMMARFaED3nq7WgruT2hHffIxvaOVcS4XY=;
 b=kPbyY5LwQP7tCmJkLTCH7OgAXoD8bni/XF/5uJhWwqeaXzi1V3dvVbXixxVairFrCBUCJthX5Jqkz03Yfv8pzJQdiMSEWRvqwT2ajt4gWhlhLi+0NxhEUKeCFHstXZnvaFs/XXZswZ3pb450joKRI2Xze54Nf/bDKYyCVjiyHYm6y8ubHsOAkutzFRUl5XNjSvYewZSXI3VPwwEPbXnehrBTkG0CeFB3S9kcVZ9IcnWuFObWKhlibptP06pz73UdFO21RWhpWrfbxNYrp3ZMhIkjGbHDDbeeWq8MVx0/r9+TBbIFpysadtWtlkWST76tMTe6FUjF2ODrg02MWhRTPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TOJfjW4zSJMMARFaED3nq7WgruT2hHffIxvaOVcS4XY=;
 b=Gm45uadpebfExWfuxohB+ZFojKOOTWvanKEa9EbSeAQbFEP+r4PzNEPzmPnOFkzyasQRXJZRj/pblaIdB8HI6TNFRoowK/J4kBJcxCBMItbZIeeNiWqAercT3e/WB/lqQZDYvgS52kvm4WACRNPMbf+3DhqfU5IB1ZwB1u1dxd8=
Received: from PA4PR04MB9640.eurprd04.prod.outlook.com (2603:10a6:102:261::21)
 by PA4PR04MB7776.eurprd04.prod.outlook.com (2603:10a6:102:c4::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.19; Mon, 30 May
 2022 09:09:54 +0000
Received: from PA4PR04MB9640.eurprd04.prod.outlook.com
 ([fe80::10c:56e5:4208:3c4f]) by PA4PR04MB9640.eurprd04.prod.outlook.com
 ([fe80::10c:56e5:4208:3c4f%5]) with mapi id 15.20.5293.019; Mon, 30 May 2022
 09:09:54 +0000
From:   "Jun Li (OSS)" <jun.li@oss.nxp.com>
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "balbi@kernel.org" <balbi@kernel.org>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "J.D. Yue" <jindong.yue@nxp.com>
Subject: RE: [PATCH] usb: dwc3: add power down scale setting
Thread-Topic: [PATCH] usb: dwc3: add power down scale setting
Thread-Index: AQHYcaptAJTG14qTZkGTUfNT6DIUL60zeteAgAOr35A=
Date:   Mon, 30 May 2022 09:09:54 +0000
Message-ID: <PA4PR04MB96402B8336DA0EDED2602ED389DD9@PA4PR04MB9640.eurprd04.prod.outlook.com>
References: <1653642195-23889-1-git-send-email-jun.li@nxp.com>
 <7d4ad852-3781-2fde-1496-b80813fe505f@synopsys.com>
In-Reply-To: <7d4ad852-3781-2fde-1496-b80813fe505f@synopsys.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e26df0f7-88f0-456c-5bfd-08da421c2941
x-ms-traffictypediagnostic: PA4PR04MB7776:EE_
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-microsoft-antispam-prvs: <PA4PR04MB777660ACB7D11A028FA7D151C8DD9@PA4PR04MB7776.eurprd04.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: wMpv6CgolgHQzumcTIasqhS1S8EsHnwBPBL98HRNhjk3UKvwiztF4h2mt3Hzj5uH+ddsXWNSlinO+Tumap+Wu4SnsfHodvl5xVwH3CvY1UkYFHnd0J02qpPWNSQdUYDnJ68266lM9X5Acfq9TKBYB50YAKzbOQWPi6z5fJA31hThdd0x9ly6VZKbTuPCbqiok/ZsD+3HZEG9hmEwwgFUSwsMkoOualJlu1EW6NSkbZ6HTKlxtxp6tDRQpbKyGqz4h/RpZYMT1uBf7xqVFgixdzv8aL+JTViZkASTyxwWkED5HS7OPXaDCl7VMtzmWF2X4twZFatOlXhu23FMZgI+1NfpEVFzdoCXg0yGMPCiVgN+LuKjinvc4y9PlRttC0IMvvYIcT+xyk5lAVzN0NDQX9KLlvt0IYRqpmXfVpdUX56DKhe2ECZDOx2riJA2mL+QNYZfJnRqVdcCfhiNccsVAlBQixg4GjxWWx27aZ0vIVuzTwhCSm1ScynoxAuZWg0ys1qEetLTEUSdLMV6XNPfbo/P8jnpclG5Hoo2GapZHXRIq8hfEe5ObqWN+N5zQ/xRNc15W/4e0s0s+SY5DvM+9/w04YXvdkMFKhWD5M+MgN7TiXWRje/RfsmOTo4tthzw2oz5HJR2uZ9GKkvwKZKcZadTLz3tZ/PoD8CN/Djkhwp7NAzF2V7LgAPfVy3aryWsteTecQjEvKPX05ZpCbUzlg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9640.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(186003)(38100700002)(55016003)(316002)(4326008)(8676002)(110136005)(54906003)(66476007)(76116006)(66446008)(38070700005)(83380400001)(71200400001)(8936002)(64756008)(66556008)(53546011)(52536014)(66946007)(6506007)(7696005)(86362001)(508600001)(5660300002)(33656002)(122000001)(9686003)(26005)(2906002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?R1VrVHptRnBpQzBwWUlCdmhDSElwMnJPaDV3OFpiY2t5MUJHZ094d1E0VFI0?=
 =?utf-8?B?STIxbGNqWjJHUHRCbG8rT2FPeGxjM1p1NXhpbnR0cU8zRm1KeHhpYU9QaHk4?=
 =?utf-8?B?ZzBteFN0Z2VVOExseExzL3pSZlpnYmVGcTFoQ2hvN1U5TVkrVTFHWWN6dkFP?=
 =?utf-8?B?VVM2ckdEMGVTUEFTeVBBMkhWbUNTemdtUWMveHlCSVRsa0tyUkNrVFhNUW5p?=
 =?utf-8?B?dkQ3a0VlWlNjNEVkbU9hWm9GYVliR2NRS1VmamFINDB5cU5aamNQRjI2K2NE?=
 =?utf-8?B?aGNWSzRlN250Q3pXRlMrUXRsN05IeTJmMy9SQ0xiZHRBS1Ura3pFM3MzUVpv?=
 =?utf-8?B?OVR4WVU3TnY5NGx4ZnFVS3JSbC9iU09LaCs4TjhjTjhHbkhnSWduYS9oNFRE?=
 =?utf-8?B?V3lmL0N6VXBRWVh4bHNPU3diYTBEek93Yy9HKy9rWit5bWRTWUlYM25Da01h?=
 =?utf-8?B?OU42bnJBVVdkaFdmR0hZS1hkUFZaL09yZ0VvbEtKQkdLSmV0RHVuK09HMVg4?=
 =?utf-8?B?bmZuNVRzcUpUd1krU3dmOVdTTlNHeDRFRTlBL2QrOHpGYXFucVYyMTlZS1JR?=
 =?utf-8?B?d1VSdE9xOU5laERKZi9nZ1VQNkVwMzNibnVPVUcraTc2a0JxdmVSWEZON3FY?=
 =?utf-8?B?VzlGbi9iai9rMUpuWGUzV2k4SlNNbis3ZTJSUW40K3lSd3dvZ3ZDOGpVUFpK?=
 =?utf-8?B?NnhKSjRxY09xUW16NjRETVdrMmFLbHdIWC9UbndDUkd2WGxIVUdHVEE3eDFG?=
 =?utf-8?B?YlFKZW1BNzloUTlYeGVOOXZyZTVvMTJlQi9pc1FoL2lnZGJXRzFCZFpyaFhz?=
 =?utf-8?B?eUhFQVJUVzU0QVhCRmNXQ1o2eWtJTE03b1Vrbnk1U3NsczJPQUIvK2ZDL1V5?=
 =?utf-8?B?VUV2bEhRdnM0M0VYeUpyWlNrMTI0emlGaFFkQld6VysyeUtBeWJrUWVqRGRJ?=
 =?utf-8?B?Q1NzTXBqeW1qdUJWK1ZYOHpIR05qK1JnN2RMSk90Vldjb0N4RlJmRU9hRGNI?=
 =?utf-8?B?aVlsbHpmeUw5SzJIVzRUcE16MjZRUVFHRE5welpLRUtCUVBOTUxhNFZBWS9L?=
 =?utf-8?B?R0ovbS9WTzZ4UitsUTJ4YWtPS3hSeUxMWll1aUtFTHlXL245VVpONlhCa2xu?=
 =?utf-8?B?czhjQlZZVzhDTU9PVFZnYkJVNzloekgrZ2hLSkpKWFhCTmVwOEsxeWNyOTFs?=
 =?utf-8?B?cU9WQWozWks2UW9uSFNKQzZkODFUVzBoRG82R3NPVExyNDlaVHEwZ2lpdTRH?=
 =?utf-8?B?ODlmQzM3OTRpMzFnK01UcHBzam91clc2dGdjc2FMZTg2bDA4OCtTQ243ekl1?=
 =?utf-8?B?ckwvQmdlSlRHc2I3ai8wcEpOSndlcG9aVE9qN21FWHlZRmNTWmhDc1QrTmdE?=
 =?utf-8?B?czdGcFoySEVUU1FBeEZ3azVqMHphYmxMKytpNU1vWFVWcG9zNTBDc09tcW1B?=
 =?utf-8?B?MlJoSmkzOTdjbG44b0xIMi9SMW1ZKy9yWWd1QjFkcWdjMUFlL3UwUUJJM0ZG?=
 =?utf-8?B?RlpyQkNMaEo2NlJqc1RPdEhyZSt1dEN6cUtnNk9XSG9iWERrZ3lZYW0rTm9S?=
 =?utf-8?B?bUY3N3cvZzQ0YmtOWGYyWnQ5QjdzQ2VWWU5WcnNRN2tveWFEdHpVWThRTGRU?=
 =?utf-8?B?M2MvZ050MkJ2a0VlK1dvNlBNTUsrZUdDYzFnL1UrU0poUlE1L0NabmpOWWY3?=
 =?utf-8?B?Y1ZjWXhhUy83SzVZT01EZGNLeVBCcVR3bXM5NlBYZmliTXZRSldIdDVpK2g0?=
 =?utf-8?B?ZUtCVjhveXlSeE85bkppWllKZFE0TGhjVUQ2UVNMTnMzaEFSNzVna1pQNXlr?=
 =?utf-8?B?ZzR2TWxCbjkwcmIxeis1Rk1WZUtpenByUXlJZ0ovM09XMHBXNFF5UEdDZ09P?=
 =?utf-8?B?cG5BNUtZT2RRNW9SbFQ0M0U4ai9pS2llS1c4Z3MvbzNnK2NubVVaMytHN3Rh?=
 =?utf-8?B?dCtLTVl1SFl2ek8zQXNkRloyN2tDUkpPMHE4MWZDOHJCa3d5MVlnOEwyazlX?=
 =?utf-8?B?VGQ5R3FzZVQweVhtOXE0TEpYUGZHdExFRW42bGF2dFVDMFI3RTB1NTRXdC82?=
 =?utf-8?B?VTMvZGdkYXMvNEswRVVlTDBEWENkVGJXcU8wMmZRUlJOci9sTy9OVGNqcFJm?=
 =?utf-8?B?dlJZWW9idmtFamdRMHdneDAxWkI1eU1EalF2Ym1KRERCc3VEbDBXREYzVDNz?=
 =?utf-8?B?Z3AwdjZsRDd1My9WZmMrSlJibnlHREJCdnNxRlYxa2tNZTIzN1E5TkQxdjV3?=
 =?utf-8?B?dHcvNXhjQWpsc3VSdzRUQnU1RVFjdnVJblRsNHJ0bUEwUWZMajRoYlF6MzFu?=
 =?utf-8?Q?BMQ1tHlEtL/9X/EXsQ?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9640.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e26df0f7-88f0-456c-5bfd-08da421c2941
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 May 2022 09:09:54.4388
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SjFw5hcJ2r+FwfrMG1cUvd4X5GLHYSU51DjQSO72breTROdDfKtxssitn0MmTSA3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7776
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogVGhpbmggTmd1eWVuIDxU
aGluaC5OZ3V5ZW5Ac3lub3BzeXMuY29tPg0KPiBTZW50OiBTYXR1cmRheSwgTWF5IDI4LCAyMDIy
IDk6MDYgQU0NCj4gVG86IEp1biBMaSA8anVuLmxpQG54cC5jb20+OyBncmVna2hAbGludXhmb3Vu
ZGF0aW9uLm9yZzsgYmFsYmlAa2VybmVsLm9yZw0KPiBDYzogbGludXgtdXNiQHZnZXIua2VybmVs
Lm9yZzsgVGhpbmggTmd1eWVuIDxUaGluaC5OZ3V5ZW5Ac3lub3BzeXMuY29tPjsNCj4gSi5ELiBZ
dWUgPGppbmRvbmcueXVlQG54cC5jb20+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0hdIHVzYjogZHdj
MzogYWRkIHBvd2VyIGRvd24gc2NhbGUgc2V0dGluZw0KPiANCj4gTGkgSnVuIHdyb3RlOg0KPiA+
IFNvbWUgU29DKGUuZyBOWFAgaW14OE1RKSBtYXkgaGF2ZSBhIHdyb25nIGRlZmF1bHQgcG93ZXIg
ZG93biBzY2FsZQ0KPiA+IHNldHRpbmcgc28gbmVlZCBpbml0IGl0IHRvIGJlIHRoZSBjb3JyZWN0
IHZhbHVlLCB0aGUgcG93ZXIgZG93bg0KPiA+IHNjYWxlIHNldHRpbmcgZGVzY3JpcHRpb24gaW4g
RFdDMyBkYXRhYm9vazoNCj4gPg0KPiA+IFBvd2VyIERvd24gU2NhbGUgKFB3ckRuU2NhbGUpDQo+
ID4gVGhlIFVTQjMgc3VzcGVuZF9jbGsgaW5wdXQgcmVwbGFjZXMgcGlwZTNfcnhfcGNsayBhcyBh
IGNsb2NrIHNvdXJjZSB0bw0KPiA+IGEgc21hbGwgcGFydCBvZiB0aGUgVVNCMyBjb3JlIHRoYXQg
b3BlcmF0ZXMgd2hlbiB0aGUgU1MgUEhZIGlzIGluIGl0cw0KPiA+IGxvd2VzdCBwb3dlciAoUDMp
IHN0YXRlLCBhbmQgdGhlcmVmb3JlIGRvZXMgbm90IHByb3ZpZGUgYSBjbG9jay4NCj4gPiBUaGUg
UG93ZXIgRG93biBTY2FsZSBmaWVsZCBzcGVjaWZpZXMgaG93IG1hbnkgc3VzcGVuZF9jbGsgcGVy
aW9kcyBmaXQNCj4gPiBpbnRvIGEgMTYga0h6IGNsb2NrIHBlcmlvZC4gV2hlbiBwZXJmb3JtaW5n
IHRoZSBkaXZpc2lvbiwgcm91bmQgdXAgdGhlDQo+ID4gcmVtYWluZGVyLg0KPiA+IEZvciBleGFt
cGxlLCB3aGVuIHVzaW5nIGFuIDgtYml0LzE2LWJpdC8zMi1iaXQgUEhZIGFuZCAyNS1NSHogU3Vz
cGVuZA0KPiA+IGNsb2NrLA0KPiA+IFBvd2VyIERvd24gU2NhbGUgPSAyNTAwMCBrSHovMTYga0h6
ID0gMTMnZDE1NjMgKHJvdW5kZXIgdXApDQo+ID4NCj4gPiBTbyB1c2UgdGhlIHN1c3BlbmQgY2xv
Y2sgcmF0ZSB0byBjYWxjdWxhdGUgaXQuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBMaSBKdW4g
PGp1bi5saUBueHAuY29tPg0KPiA+IC0tLQ0KPiA+ICBkcml2ZXJzL3VzYi9kd2MzL2NvcmUuYyB8
IDIyICsrKysrKysrKysrKysrKysrKysrKysNCj4gPiAgZHJpdmVycy91c2IvZHdjMy9jb3JlLmgg
fCAgMSArDQo+ID4gIDIgZmlsZXMgY2hhbmdlZCwgMjMgaW5zZXJ0aW9ucygrKQ0KPiA+DQo+ID4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNiL2R3YzMvY29yZS5jIGIvZHJpdmVycy91c2IvZHdjMy9j
b3JlLmMNCj4gPiBpbmRleCBlMDI3YzA0MjBkYzMuLjE2ZDQ0MWRiYzI4YiAxMDA2NDQNCj4gPiAt
LS0gYS9kcml2ZXJzL3VzYi9kd2MzL2NvcmUuYw0KPiA+ICsrKyBiL2RyaXZlcnMvdXNiL2R3YzMv
Y29yZS5jDQo+ID4gQEAgLTEwMjksNiArMTAyOSwyNSBAQCBzdGF0aWMgdm9pZCBkd2MzX3NldF9p
bmNyX2J1cnN0X3R5cGUoc3RydWN0IGR3YzMNCj4gKmR3YykNCj4gPiAgCWR3YzNfd3JpdGVsKGR3
Yy0+cmVncywgRFdDM19HU0JVU0NGRzAsIGNmZyk7DQo+ID4gIH0NCj4gPg0KPiA+ICtzdGF0aWMg
dm9pZCBkd2MzX3NldF9wb3dlcl9kb3duX2Nsa19zY2FsZShzdHJ1Y3QgZHdjMyAqZHdjKQ0KPiA+
ICt7DQo+ID4gKwl1MzIgcmVnLCBzY2FsZTsNCj4gDQo+IENhbiB3ZSBkZWNsYXJlIHRoZXNlIHZh
cmlhYmxlcyBpbiBzZXBhcmF0ZSBsaW5lcz8gUHJlZmVyYWJseSByZXZlcnNlDQo+IENocmlzdG1h
cyB0cmVlIHN0eWxlLg0KDQpPa2F5LCB3aWxsIHVwZGF0ZSBpbiB2Mi4NCg0KPiANCj4gPiArDQo+
ID4gKwlpZiAoIWR3Yy0+c3VzcF9jbGspDQo+ID4gKwkJcmV0dXJuOw0KPiA+ICsNCj4gPiArCS8q
DQo+ID4gKwkgKiBUaGUgcG93ZXIgZG93biBzY2FsZSBmaWVsZCBzcGVjaWZpZXMgaG93IG1hbnkg
c3VzcGVuZF9jbGsNCj4gPiArCSAqIHBlcmlvZHMgZml0IGludG8gYSAxNktIeiBjbG9jayBwZXJp
b2QuIFdoZW4gcGVyZm9ybWluZw0KPiA+ICsJICogdGhlIGRpdmlzaW9uLCByb3VuZCB1cCB0aGUg
cmVtYWluZGVyLg0KPiA+ICsJICovDQo+ID4gKwlzY2FsZSA9IERJVl9ST1VORF9VUChjbGtfZ2V0
X3JhdGUoZHdjLT5zdXNwX2NsayksIDE2Mzg0KTsNCj4gDQo+IDE2a0h6ID09IDE2MDAwSHogcmln
aHQ/DQoNCnllcywgSSBtaXN1bmRlcnN0b29kIGl0LCB3aWxsIHVwZGF0ZSBpbiB2Mi4NCg0KVGhh
bmtzDQpMaSBKdW4NCg0KPiANCj4gPiArCXJlZyA9IGR3YzNfcmVhZGwoZHdjLT5yZWdzLCBEV0Mz
X0dDVEwpOw0KPiA+ICsJcmVnICY9IH4oRFdDM19HQ1RMX1BXUkROU0NBTEVfTUFTSyk7DQo+ID4g
KwlyZWcgfD0gRFdDM19HQ1RMX1BXUkROU0NBTEUoc2NhbGUpOw0KPiA+ICsJZHdjM193cml0ZWwo
ZHdjLT5yZWdzLCBEV0MzX0dDVEwsIHJlZyk7DQo+ID4gK30NCj4gPiArDQo+ID4gIC8qKg0KPiA+
ICAgKiBkd2MzX2NvcmVfaW5pdCAtIExvdy1sZXZlbCBpbml0aWFsaXphdGlvbiBvZiBEV0MzIENv
cmUNCj4gPiAgICogQGR3YzogUG9pbnRlciB0byBvdXIgY29udHJvbGxlciBjb250ZXh0IHN0cnVj
dHVyZQ0KPiA+IEBAIC0xMTA1LDYgKzExMjQsOSBAQCBzdGF0aWMgaW50IGR3YzNfY29yZV9pbml0
KHN0cnVjdCBkd2MzICpkd2MpDQo+ID4gIAlpZiAocmV0KQ0KPiA+ICAJCWdvdG8gZXJyMTsNCj4g
Pg0KPiA+ICsJLyogU2V0IHBvd2VyIGRvd24gc2NhbGUgb2Ygc3VzcGVuZF9jbGsgKi8NCj4gPiAr
CWR3YzNfc2V0X3Bvd2VyX2Rvd25fY2xrX3NjYWxlKGR3Yyk7DQo+ID4gKw0KPiA+ICAJLyogQWRq
dXN0IEZyYW1lIExlbmd0aCAqLw0KPiA+ICAJZHdjM19mcmFtZV9sZW5ndGhfYWRqdXN0bWVudChk
d2MpOw0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNiL2R3YzMvY29yZS5oIGIvZHJp
dmVycy91c2IvZHdjMy9jb3JlLmgNCj4gPiBpbmRleCA4MWM0ODZiMzk0MWMuLjcyMjgwOGQ4YzBh
ZiAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL3VzYi9kd2MzL2NvcmUuaA0KPiA+ICsrKyBiL2Ry
aXZlcnMvdXNiL2R3YzMvY29yZS5oDQo+ID4gQEAgLTIzMSw2ICsyMzEsNyBAQA0KPiA+DQo+ID4g
IC8qIEdsb2JhbCBDb25maWd1cmF0aW9uIFJlZ2lzdGVyICovDQo+ID4gICNkZWZpbmUgRFdDM19H
Q1RMX1BXUkROU0NBTEUobikJKChuKSA8PCAxOSkNCj4gPiArI2RlZmluZSBEV0MzX0dDVExfUFdS
RE5TQ0FMRV9NQVNLCUdFTk1BU0soMzEsIDE5KQ0KPiA+ICAjZGVmaW5lIERXQzNfR0NUTF9VMlJT
VEVDTglCSVQoMTYpDQo+ID4gICNkZWZpbmUgRFdDM19HQ1RMX1JBTUNMS1NFTCh4KQkoKCh4KSAm
IERXQzNfR0NUTF9DTEtfTUFTSykgPDwgNikNCj4gPiAgI2RlZmluZSBEV0MzX0dDVExfQ0xLX0JV
UwkoMCkNCj4gDQo+IFRoYW5rcywNCj4gVGhpbmgNCg==
