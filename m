Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3C92C53E3D2
	for <lists+linux-usb@lfdr.de>; Mon,  6 Jun 2022 10:56:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231760AbiFFIyE (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 6 Jun 2022 04:54:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232565AbiFFIxl (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 6 Jun 2022 04:53:41 -0400
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (mail-eopbgr70052.outbound.protection.outlook.com [40.107.7.52])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 064503B013
        for <linux-usb@vger.kernel.org>; Mon,  6 Jun 2022 01:53:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AH17sSz2EXxjtqJ0HCEJXeuKbVUUkXjhExR4CnJLyAM++icq6TAq628aLs+O1A6xoHGt+UbA/KQozD6fzd/x+PFg5tvt7E7sv6At1/3a6e8AOxZw07b15Jq9qkSCrImfZQr+TVtZOHH7QJizqm3LTbOMAINu/I5hjNR4I0Px/SVkEVDkPNN0Y7c193CHZN2wJINUO4VJoc/RRw7Lf33O/ItBPgGkIamU9H4Uzleg038YgVBParPWM33iRWKiCqgAPLEEvhx8Gtolp2ntHcbcOEmUye3FTpPcaWsry8oBROFThaDsqI0RbWHypQTaXN1fVBzDZ9O7xibA1WwYDTLFUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BD0Qb+JUkqmMqRHv1zt3kUW46sQOmDilxg6bNfW2uxg=;
 b=FdqpMxLtt3pm53Gn32iT9AIMKqaC2r4NlqMHZmT7LibD5S0PPAIA6k6sbLMf4KagNWRZs26/dPvI871+ovZ6PfXK9BHmPt26m99BxDerKiSTw8X0kkstNc5dlL7G9prXGLwLxI/rEHwU6E3Ywi565a+ZmVdvh6KlzTNh7IjIrwkHsdwBt4EJnYAGOBJMmqRdU0WIUgJmaKdkXLP/8Fy5Dj3E31fyqHsVuxWdWAveE3P8iF4Y+5jfmXQhnKcraxRa+YkRSuzRq71GGvK43oNgTKqr4K3Fhh3hoIrC8io3nkqueoCxIPyClTpj7FHEgXgUW80GUEFjoKhRkEGI3NrDTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BD0Qb+JUkqmMqRHv1zt3kUW46sQOmDilxg6bNfW2uxg=;
 b=ViZvxuMWmIsbeM6APX5mOqwc2RnYnb61ddnkWnNLhU2J8Wsk6bNyodEBkYuPSiufZxbq4x3JrUH5Za4CToyjzuvoAoCW5p2A7xOgOjgfTaKy32WcRUSdTY2IG7gTRFDgHF8y20vD793WjkPSXhbyxiVy2K1u/XshkhyUptHaTwA=
Received: from PA4PR04MB9640.eurprd04.prod.outlook.com (2603:10a6:102:261::21)
 by DBBPR04MB7946.eurprd04.prod.outlook.com (2603:10a6:10:1ec::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.19; Mon, 6 Jun
 2022 08:53:31 +0000
Received: from PA4PR04MB9640.eurprd04.prod.outlook.com
 ([fe80::10c:56e5:4208:3c4f]) by PA4PR04MB9640.eurprd04.prod.outlook.com
 ([fe80::10c:56e5:4208:3c4f%6]) with mapi id 15.20.5314.019; Mon, 6 Jun 2022
 08:53:31 +0000
From:   "Jun Li (OSS)" <jun.li@oss.nxp.com>
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        "Jun Li (OSS)" <jun.li@oss.nxp.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "balbi@kernel.org" <balbi@kernel.org>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "J.D. Yue" <jindong.yue@nxp.com>
Subject: RE: [PATCH] usb: dwc3: add power down scale setting
Thread-Topic: [PATCH] usb: dwc3: add power down scale setting
Thread-Index: AQHYcaptAJTG14qTZkGTUfNT6DIUL60zeteAgAALK4CAA6oqAIACCNIAgACeQACAAQt+gIAHPaqg
Date:   Mon, 6 Jun 2022 08:53:31 +0000
Message-ID: <PA4PR04MB9640AF202D092F13C38E928089A29@PA4PR04MB9640.eurprd04.prod.outlook.com>
References: <1653642195-23889-1-git-send-email-jun.li@nxp.com>
 <7d4ad852-3781-2fde-1496-b80813fe505f@synopsys.com>
 <a0573de8-fb99-797d-bd49-e1aab7223c12@synopsys.com>
 <PA4PR04MB964065D4D3ED6DF8009A4EDB89DD9@PA4PR04MB9640.eurprd04.prod.outlook.com>
 <f935ca2a-9b24-99d7-106e-77b95abeeefc@synopsys.com>
 <PA4PR04MB9640D219F6992324938D593189DF9@PA4PR04MB9640.eurprd04.prod.outlook.com>
 <b159cdeb-8fd2-fc52-99fa-42d2f88263d4@synopsys.com>
In-Reply-To: <b159cdeb-8fd2-fc52-99fa-42d2f88263d4@synopsys.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: db6c25ed-d154-4d16-face-08da479a080b
x-ms-traffictypediagnostic: DBBPR04MB7946:EE_
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-microsoft-antispam-prvs: <DBBPR04MB7946691F97E5D8B5F3A56FCCC8A29@DBBPR04MB7946.eurprd04.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Ho23Lf8IyNPeNmK303f9ThlzSXiJOJcau4NwW3JeFLMczGs68KSHqAws3QfByHfyO1yC+832vVY58qMr/mYz5FogLIRQcNddJZ87zPZex7ty+LDu3q3Ef99652BF8tRTFDiwBK+yj/OrkSoBYOQyhiHNzXvSxxYiETRTR8VzOvgVbC9gaEebPX+DlY+nIdYq5vcIwoqF0McrbrUAA/qsMOorYSSfMkyYOrLe3c6tH7NwqV0iq3SB9irvPhSlKBxmapFZcn3o0W2q16+ie/hz9E3VoyJ/q16mhGr1ys3O8FvGpyawybVcHyVBdGGiHiAZ2ttzeeTlS/vs6uUElM9fczd4UGlEPEKJoAO5v3e55UQUXYvijegtkDBUzhpdJDx61ClrTgq4cPhjbnCd07wriA7yBvZOCvzE5Z8rCaO0v3sVO+duaEJB5dNjJWvrdq/BZk43sCZwOe5Un3iznW4gRCl8d7Ympbk3bHpvbgVcSVypDm3BngHKp5mZKT3GPP4ckeNpeQtP+fMFPC8rVLE2rNpAXzMUScCSODPz+iuOSxl1lIpGkbCy1D9K2M4LeJI34esu02ITLPX5sodSaIKHR5AWGbJNFcfgk+90G37qa9zeik9IT7MghZl0nm/Z3FWMWpC2YqDwvxSbs8M/GwGcqHuhb9vjdp3CkPxfI2yLAEQHsfep+wPN/7FgcK3O0dpnDhJMVWt3oO92isGn+nS8+A==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9640.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(53546011)(5660300002)(6506007)(7696005)(8936002)(55016003)(508600001)(33656002)(2906002)(52536014)(122000001)(83380400001)(54906003)(110136005)(38070700005)(186003)(4326008)(8676002)(86362001)(64756008)(66446008)(66476007)(66946007)(71200400001)(76116006)(9686003)(66556008)(38100700002)(26005)(316002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bUxzQldCRzNFRG5BYUVYMkFZZlBZN0xrSDNJNXpFSHV4c0lWQk16dHdtYWRw?=
 =?utf-8?B?TnNDbC9GZXg5VTdHWDNnMW9vVjNpZDJOU3R6WVpDbXBwRW04V3BJMWJSZlpY?=
 =?utf-8?B?bUY1bVQrVVlSVDJxdjhBek1LejM1Zm9tMWJVOGs4cXBiYWtvRkhVVkxVTVdk?=
 =?utf-8?B?dWpYMDBneEVYbVBJZnBCWmxSVDI3Y2FXRTg1NUNkdDRQUmNsSFlMcGQwNFFD?=
 =?utf-8?B?RWFScG9LL05CL0JEU1Y0aEFBUXZwS1RxcmRKZ3FpVWl1TExCanNxZGRWTGdP?=
 =?utf-8?B?Zy9jUEJ6Q3BJSGNJbytGMUU4ZmZEaFc4TmxCeitZUFZ5STkwaW44blNISUR2?=
 =?utf-8?B?M0lHSjl5N3lNaDdPWUNkUG8rR0ZVVlE3L0Q0MFNuRFNuSDNJeXl3Wllwc1hu?=
 =?utf-8?B?c2NHWEVpdlhrTXd4MjV1TGp6WlFVc3h6ZE1GMFIvd3FZdUNsMFB2dmlVaVZs?=
 =?utf-8?B?Qm81WWtrM0tsWGdwZGo5dE5TL2lEbHhCNkoyeTFtUktIaEJTRWVGMTFlSWpD?=
 =?utf-8?B?cFdubzZxY3B0R204VTIzUUFabnRMdDdPRmFFa0gvcVNyZDQxZDM2aXZpZlR0?=
 =?utf-8?B?azdpL0NqckZtaEErNDZoYmdwWUdjaFBXa0ppcFdBa1pZdzdOditOR0FacExU?=
 =?utf-8?B?QUtMYVF3SWhxSXh4NXdpSzJXWWovdTdiM3FhWUlZaE1lOEJqNVl1MDEvZ3lM?=
 =?utf-8?B?L043SUZ2SmVaMlMycU9SYUtqMHFlbnExeUNpRHBRKzB6MW5VZmdxM0VIY2lw?=
 =?utf-8?B?U2FtdzRUb2sydEpxeGNhZ1JFRWhLQWdTWjBpemwyRVBTY1lLNDhxVGs1dEQ4?=
 =?utf-8?B?ZnptdWxHUXNqd2hnRGFMRVNCTGttQXhCRFRtR2d3cmkrSU5td3N1YmhlQm9V?=
 =?utf-8?B?MFhmbEt2Yy9zcHFwYzRuT09mV1BTVlhBLzMvcVhVVlIrVEpiSkpxSTdjaFpT?=
 =?utf-8?B?S1NzVG0rSHV4Skd5RURkRmN2WStld3pUb2tvYUFhQ2c5MmRJYWxTMHFQRnZj?=
 =?utf-8?B?QkNaNG4xVkxoaWh4NEo0cGxmdnR3amMwWkUxejN2U29xbXZ5b0pXK2dGS0JI?=
 =?utf-8?B?d3VVTWRpNzVIVllxeER6OXVENFZWMVVRM29seHZ5NzlCMmkyb1NQY3BJd2gy?=
 =?utf-8?B?MFJ4cmdQNUNSK1lHdCs2VTdqS3hLNmhKTitKZFl6V3FZQklVN1V6elIxZm1t?=
 =?utf-8?B?RGJLR3FBQWR4Y3VCZmZLMG1sa0FwTzZ1RXdKUWZIRlhwRUZKVHNnRUVnUDgv?=
 =?utf-8?B?WGxicVJjTHZIR2VSZ1d3ZU1maC9wUHhjRDc5RDFXQk5FUDJsMUJxZGM1OXQ0?=
 =?utf-8?B?OXdJSjNoNFd4RE5hMThCNTFXNXVIUjE3OUN1enpIRDMySXdqZ0dRWVc5R1lW?=
 =?utf-8?B?RnhyY3hvd0tXV1owZURVWk9MOWkvQm5DRzBWQ3FyMlp6ZENMR3k1aEhDZlcr?=
 =?utf-8?B?Zk1DMEdVZ3VvdEt3NWx2bDgrWXo4dkZ6R2JBWWczQ0wzZWRjcnNocUVNbHdP?=
 =?utf-8?B?dm5qMXZtZG1rKzJjclhPQ2s2eDZZR0szenZlRHI2YUVXYlBweDV6TWJCcnNU?=
 =?utf-8?B?VXFjcHpFQXJIU1pYQTdUQVBCU2tPaisweUUxbUNsWlAvWFVUVkZNMkZ4NEdm?=
 =?utf-8?B?ejBKUE1uOUpqeS9nMG5ZdVprd2VJNkRyTkkvRWxMbnEwaFFjRERsSjdncWw4?=
 =?utf-8?B?NFhSOHB5TVZvUzhENyswUXhZQ3JLanJJb2tORjRtQnBuR2JnMkVvQldCWnpq?=
 =?utf-8?B?WDE1NDVLS0VnVWpnZUxQMDd0UDNjSU5wTy9rMXpKUEVuYko2MlU5c1htOWZV?=
 =?utf-8?B?SlZsUTc0S1E3QldUSFp2YkovdVdRV09JS3krY3VUZUNpL3lhWXg2UWhad0Rl?=
 =?utf-8?B?S3g3SXF0b3lERXpQUHRIaUNQeTdYTXBTOGpCV2tvTjhEamRtZG5iSlBpbk9v?=
 =?utf-8?B?emxjY2J5cjR3Mm54TlBjTHdueFpYd1ppSjdqdDdSNmVVOEN3b2NnUk9hN3E1?=
 =?utf-8?B?MnlBY1VpcmlOcEkyTG42SEFXME85VFMwVHRYSmhWT0pPYW00c21ERGQ4K1hi?=
 =?utf-8?B?Tm1BRDhpQnFoQlZCNGJwMEZOcjNIQzNTZ2xZTDJIcW95aWZuKzlWSDdyWTE4?=
 =?utf-8?B?ZThLYnc3ZXFpcGhmaURsZ3hyVVVUekxGUjhCMk04S2I5QlU4bDFuaVAyeS9v?=
 =?utf-8?B?aldqSFJGRy9FMzBFdnhLU0wzL1FCNXdJc1pTai9mUTJiMDljSlF6VzRzRlUw?=
 =?utf-8?B?cmx3QTNtZm5iaUsxbEhsOVRRNjhGajFyTC9qZ1ViS0NRZmNjQXNZZlVxTVR0?=
 =?utf-8?B?Y1l5YXhiam5vc0l4enZ6bDlWR0IyYVJVWmhaRkRJYnBJZXNCeWZ5Zz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9640.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db6c25ed-d154-4d16-face-08da479a080b
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jun 2022 08:53:31.1260
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: e89iPcIpD/U7p/G7HRipqml9iVdFhCk7n8eAyRFAta1RqIJPpLwYwhETCjn6bv4s
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7946
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogVGhpbmggTmd1eWVuIDxU
aGluaC5OZ3V5ZW5Ac3lub3BzeXMuY29tPg0KPiBTZW50OiBUaHVyc2RheSwgSnVuZSAyLCAyMDIy
IDI6MTIgQU0NCj4gVG86IEp1biBMaSAoT1NTKSA8anVuLmxpQG9zcy5ueHAuY29tPjsgVGhpbmgg
Tmd1eWVuDQo+IDxUaGluaC5OZ3V5ZW5Ac3lub3BzeXMuY29tPjsgZ3JlZ2toQGxpbnV4Zm91bmRh
dGlvbi5vcmc7DQo+IGJhbGJpQGtlcm5lbC5vcmcNCj4gQ2M6IGxpbnV4LXVzYkB2Z2VyLmtlcm5l
bC5vcmc7IEouRC4gWXVlIDxqaW5kb25nLnl1ZUBueHAuY29tPg0KPiBTdWJqZWN0OiBSZTogW1BB
VENIXSB1c2I6IGR3YzM6IGFkZCBwb3dlciBkb3duIHNjYWxlIHNldHRpbmcNCj4gDQo+IEp1biBM
aSAoT1NTKSB3cm90ZToNCj4gPiBIaSwNCj4gPg0KPiA+PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2Ut
LS0tLQ0KPiA+PiBGcm9tOiBUaGluaCBOZ3V5ZW4gPFRoaW5oLk5ndXllbkBzeW5vcHN5cy5jb20+
DQo+ID4+IFNlbnQ6IFdlZG5lc2RheSwgSnVuZSAxLCAyMDIyIDEyOjQ4IEFNDQo+ID4+IFRvOiBK
dW4gTGkgKE9TUykgPGp1bi5saUBvc3MubnhwLmNvbT47IFRoaW5oIE5ndXllbg0KPiA+PiA8VGhp
bmguTmd1eWVuQHN5bm9wc3lzLmNvbT47IGdyZWdraEBsaW51eGZvdW5kYXRpb24ub3JnOw0KPiA+
PiBiYWxiaUBrZXJuZWwub3JnDQo+ID4+IENjOiBsaW51eC11c2JAdmdlci5rZXJuZWwub3JnOyBK
LkQuIFl1ZSA8amluZG9uZy55dWVAbnhwLmNvbT4NCj4gPj4gU3ViamVjdDogUmU6IFtQQVRDSF0g
dXNiOiBkd2MzOiBhZGQgcG93ZXIgZG93biBzY2FsZSBzZXR0aW5nDQo+ID4+DQo+ID4+IEp1biBM
aSAoT1NTKSB3cm90ZToNCj4gPj4+DQo+ID4+Pg0KPiA+Pj4+IC0tLS0tT3JpZ2luYWwgTWVzc2Fn
ZS0tLS0tDQo+ID4+Pj4gRnJvbTogVGhpbmggTmd1eWVuIDxUaGluaC5OZ3V5ZW5Ac3lub3BzeXMu
Y29tPg0KPiA+Pj4+IFNlbnQ6IFNhdHVyZGF5LCBNYXkgMjgsIDIwMjIgOTo0NiBBTQ0KPiA+Pj4+
IFRvOiBKdW4gTGkgPGp1bi5saUBueHAuY29tPjsgZ3JlZ2toQGxpbnV4Zm91bmRhdGlvbi5vcmc7
DQo+ID4+Pj4gYmFsYmlAa2VybmVsLm9yZw0KPiA+Pj4+IENjOiBsaW51eC11c2JAdmdlci5rZXJu
ZWwub3JnOyBKLkQuIFl1ZSA8amluZG9uZy55dWVAbnhwLmNvbT4NCj4gPj4+PiBTdWJqZWN0OiBS
ZTogW1BBVENIXSB1c2I6IGR3YzM6IGFkZCBwb3dlciBkb3duIHNjYWxlIHNldHRpbmcNCj4gPj4+
Pg0KPiA+Pj4+IFRoaW5oIE5ndXllbiB3cm90ZToNCj4gPj4+Pj4gTGkgSnVuIHdyb3RlOg0KPiA+
Pj4+Pj4gU29tZSBTb0MoZS5nIE5YUCBpbXg4TVEpIG1heSBoYXZlIGEgd3JvbmcgZGVmYXVsdCBw
b3dlciBkb3duDQo+ID4+Pj4+PiBzY2FsZSBzZXR0aW5nIHNvIG5lZWQgaW5pdCBpdCB0byBiZSB0
aGUgY29ycmVjdCB2YWx1ZSwgdGhlIHBvd2VyDQo+ID4+Pj4+PiBkb3duIHNjYWxlIHNldHRpbmcg
ZGVzY3JpcHRpb24gaW4gRFdDMyBkYXRhYm9vazoNCj4gPj4+Pj4+DQo+ID4+Pj4+PiBQb3dlciBE
b3duIFNjYWxlIChQd3JEblNjYWxlKQ0KPiA+Pj4+Pj4gVGhlIFVTQjMgc3VzcGVuZF9jbGsgaW5w
dXQgcmVwbGFjZXMgcGlwZTNfcnhfcGNsayBhcyBhIGNsb2NrDQo+ID4+Pj4+PiBzb3VyY2UgdG8g
YSBzbWFsbCBwYXJ0IG9mIHRoZSBVU0IzIGNvcmUgdGhhdCBvcGVyYXRlcyB3aGVuIHRoZSBTUw0K
PiA+Pj4+Pj4gUEhZIGlzIGluIGl0cyBsb3dlc3QgcG93ZXIgKFAzKSBzdGF0ZSwgYW5kIHRoZXJl
Zm9yZSBkb2VzIG5vdCBwcm92aWRlDQo+IGEgY2xvY2suDQo+ID4+Pj4+PiBUaGUgUG93ZXIgRG93
biBTY2FsZSBmaWVsZCBzcGVjaWZpZXMgaG93IG1hbnkgc3VzcGVuZF9jbGsgcGVyaW9kcw0KPiA+
Pj4+Pj4gZml0IGludG8gYSAxNiBrSHogY2xvY2sgcGVyaW9kLiBXaGVuIHBlcmZvcm1pbmcgdGhl
IGRpdmlzaW9uLA0KPiA+Pj4+Pj4gcm91bmQgdXAgdGhlIHJlbWFpbmRlci4NCj4gPj4+Pj4+IEZv
ciBleGFtcGxlLCB3aGVuIHVzaW5nIGFuIDgtYml0LzE2LWJpdC8zMi1iaXQgUEhZIGFuZCAyNS1N
SHoNCj4gPj4+Pj4+IFN1c3BlbmQgY2xvY2ssIFBvd2VyIERvd24gU2NhbGUgPSAyNTAwMCBrSHov
MTYga0h6ID0gMTMnZDE1NjMNCj4gPj4+Pj4+IChyb3VuZGVyIHVwKQ0KPiA+Pj4+Pj4NCj4gPj4+
Pj4+IFNvIHVzZSB0aGUgc3VzcGVuZCBjbG9jayByYXRlIHRvIGNhbGN1bGF0ZSBpdC4NCj4gPj4+
Pg0KPiA+Pj4+IEFsc28sIHNob3VsZG4ndCB0aGUgdmFsdWUgc2VsZWN0ZWQgYmUgdGhlIG1heF9y
YXRlIG9mIHRoZSBzdXNwZW5kDQo+ID4+Pj4gY2xvY2sgYW5kIG5vdCBqdXN0IHRoZSB2YWx1ZSBm
cm9tIGNsa19nZXRfcmF0ZSgpPw0KPiA+Pj4NCj4gPj4+IEluIG15IGNhc2UsIHRoZSBzdXNwZW5k
X2NsayBpcyBmaXhlZCwgc2VlbXMgbWF4IHJhdGUgaXMgb25seSBVc2VkIGJ5DQo+ID4+PiBjbG9j
ayBwcm92aWRlciBhbmQgdGhlcmUgaXMgbm8gQVBJIHRvIGdldCBtYXhfcmF0ZSBmb3IgY2xvY2sg
dXNlcnMuDQo+ID4+Pg0KPiA+Pg0KPiA+PiBTZWVtcyBsaWtlIG9ubHkgdGhlIHVzZXIvZGVzaWdu
ZXIgb2YgdGhlIGRldmljZSBrbm93cyB0aGUgbWF4IHJhdGUNCj4gPj4gZm9yIHRoZSBzdXNwZW5k
X2NsayBpZiB0aGUgY2xvY2sgZnJlcXVlbmN5IHZhcmllcy4gV2UgbWF5IG5vdCB3YW50IHRvDQo+
ID4+IGluYWR2ZXJ0ZW50bHkgb3ZlcndyaXRlIHRoZSBjb3JyZWN0L3Rlc3RlZCBkZWZhdWx0IHZh
bHVlIGZvciBhbGwNCj4gPj4gZGV2aWNlcy4gTWF5YmUgd2UgYWxzbyBuZWVkIGEgbmV3IGRldmlj
ZSBwcm9wZXJ0eSB0byBpbmZvcm0gdGhlDQo+ID4+IGNvbnRyb2xsZXIgb2YgdGhlIHBvd2VyIGRv
d24gc2NhbGUgdmFsdWUgYW5kIGdpdmUgdGhlIHVzZXIgYW4gb3B0aW9uDQo+ID4+IHRvIG92ZXJy
aWRlIHRoZSBjYWxjdWxhdGVkIHZhbHVlIGhlcmUuDQo+ID4NCj4gPiBVbmRlcnN0b29kLCBjb25z
aWRlcmluZyB0aGlzIGlzIGEgcmFyZSBjYXNlKHdyb25nIGRlZmF1bHQgdmFsdWUpLCBhbmQNCj4g
PiBEVCBtYWludGFpbmVyIFJvYiBkb2VzIG5vdCBsaWtlIGNvbnRpbnVlIGV4cGFuZCBkd2MzIGh1
Z2UgcHJvcGVydHkNCj4gPiBsaXN0DQo+IA0KPiBMYXN0IEkgY2hlY2ssIFJvYiBkb2VzIG5vdCBs
aWtlIGV4cGFuZGluZyBxdWlya3MgaW4gZHdjMyBvbmx5IChidXQgSSBjb3VsZA0KPiBiZSB3cm9u
ZyBoZXJlKS4gSSBkb24ndCB0aGluayB0aGlzIGlzIGEgcXVpcmsgYXMgbm90aGluZyBpcyByZWFs
bHkgYnJva2VuLg0KPiBJdCdzIGp1c3Qgc29tZXRoaW5nIHRoZSB1c2VyIG5lZWRzIHRvIGluZm9y
bSB0aGUgY29udHJvbGxlci4NCj4gDQo+ID4gZm9yIHRoaXMga2luZCBvZiBzb2MgbGV2ZWwgdGhp
bmcsIGluc3RlYWQsIHByb3Bvc2UgaW1wbGllcyBieQ0KPiA+IGNvbXBhdGlibGUsIGRvIHlvdSB0
aGluayBpcyBpdCBhY2NlcHRhYmxlIHRvIHVzZSBjb21wYXRpYmxlIGNoZWNrIGxpa2UNCj4gYmVs
b3cgZm9yIHRoaXM/DQo+ID4NCj4gPiBpZiAob2ZfZGV2aWNlX2lzX2NvbXBhdGlibGUobm9kZSwg
ImZzbCxpbXg4bXEtZHdjMyIpKQ0KPiA+DQo+IA0KPiBJIGRvbid0IHRoaW5rIHdlIHNob3VsZCBk
byB0aGF0LiBUaGlzIGlzIGEgY29tbW9uIGNhbGN1bGF0aW9uIGZvciBkd2MzeA0KPiBjb250cm9s
bGVyIGFuZCBub3QgdW5pcXVlIHRvIGp1c3QgeW91ciBwbGF0Zm9ybS4NCj4gDQo+IEhvdyBhYm91
dCB0aGlzOiBjaGVjayB0aGUgZGVmYXVsdCBzZXR0aW5nIHRvIHNlZSBpZiBpdCBtYWtlcyBzZW5z
ZSBiZWZvcmUNCj4gb3ZlcndyaXRpbmcgaXQuIFRoYXQgaXMsIG9ubHkgb3ZlcndyaXRlIGl0IGlm
IHRoZSBkZWZhdWx0IHZhbHVlIG9mDQo+IEdDVEwuUFdSRE5TQ0FMRSBpcw0KPiANCj4gKiBMZXNz
IHRoYW4gdGhlIGNhbGN1bGF0ZWQgdmFsdWUgZnJvbSBjbGtfZ2V0X3JhdGUoKQ0KPiAqIFJpZGlj
dWxvdXNseSBoaWdoIHRoYXQncyAobWF5YmUgM3gpIG1vcmUgdGhhbiB0aGUgY2FsY3VsYXRlZCB2
YWx1ZQ0KPiANCj4gTGV0IG1lIGtub3cgd2hhdCB5b3UgdGhpbmsuDQoNClRoaXMgbWFrZXMgc2Vu
c2UgdG8gbWUsIEkgd2lsbCBzZW5kIG91dCB2Mi4NCg0KVGhhbmtzDQpMaSBKdW4NCj4gDQo+IFRo
YW5rcywNCj4gVGhpbmgNCg==
