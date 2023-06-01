Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 35C197190B8
	for <lists+linux-usb@lfdr.de>; Thu,  1 Jun 2023 04:54:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231238AbjFACyi (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 31 May 2023 22:54:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229476AbjFACyh (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 31 May 2023 22:54:37 -0400
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2046.outbound.protection.outlook.com [40.107.21.46])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1AECF107;
        Wed, 31 May 2023 19:54:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F60Xtx2Q8c+SO9Ut10hVKDhetlTrTJWLU9uPOs/Ipa1t5vTn4DUfTCmW+m5+mpnmI/fkKuy8boaVUXg1A1R85WeTQoRWVnt+jQAUAz2fzjMd79FMcswF6M5BL/NyxnXJAhnHv9CnegS8p9qshIBnklarVnB3betuCJkIKHrNnND4R0bgZ/spGYtxSiWwRubZBTeSOKLWvvmzIPDl7GkiB7FzSQAAtLGUFot9vxXO+W5gkQV9/8lW9z9sgRuXbqOh8KxLYE/g1dKv1F3bDRq5JCOI+le1ITVynl4jnoBWXVkGZQBCyf4KfRDDg52tCVv9Zagq6KB+KP1HIY+r5iVYaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s8o8751T+8Ru8lfN8i65+ilZIEgLiS/3bbtu4X5NUGA=;
 b=A/tRL8LNrmDjNtadS3ICXiBXRHHX0yqFsOxoHYkXh137y91Gkp3Fmux9N0jNofMwf9HU0s+w2GmEna4/ZZaHHzy44bzeDiOUJ1e4vNQmS2CoFD3ZbFnAIlSEDVZOtMl7MIOF2NKX4XTlgoqRpHWcgAhhi8xYO0xfi9d0UEZNxKC420L51SUknU4tlWAp17fV2LNzdaglKC4ecK8ETHE9F5I60C3Aa0NheLmFJ47urCT1SIM1hiAR6I6oIkoQ5hzdYjiSTzglxgUZGwIwlw7eHHSLHJ2rBZ/f145YYrq19fV1pj8m3DtXz+zkY+DaA5z2UXfrNGCesmtO7luMaFbMPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s8o8751T+8Ru8lfN8i65+ilZIEgLiS/3bbtu4X5NUGA=;
 b=mHWK3yT/0TVf/1VMX0yUBZ/QMoVVYbY0sfiPxXiVRYemv9yXHJvFwJ0qsSWnPcbkKaTjplBrpuuHFmhCHJSuqX62/uubqsAhz5hkSIxODabVd0rSjmF02PBtCnUxWs5zKmll+WkqNZgSI7rbhnGtW1xOCj/RSoyvnk3MkkUnaN0=
Received: from DB7PR04MB4505.eurprd04.prod.outlook.com (2603:10a6:5:39::26) by
 AS8PR04MB8466.eurprd04.prod.outlook.com (2603:10a6:20b:349::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6455.22; Thu, 1 Jun 2023 02:54:33 +0000
Received: from DB7PR04MB4505.eurprd04.prod.outlook.com
 ([fe80::f9b0:8c34:e57:92a4]) by DB7PR04MB4505.eurprd04.prod.outlook.com
 ([fe80::f9b0:8c34:e57:92a4%7]) with mapi id 15.20.6433.024; Thu, 1 Jun 2023
 02:54:33 +0000
From:   Xu Yang <xu.yang_2@nxp.com>
To:     Krzysztof Kozlowski <krzk@kernel.org>,
        "peter.chen@kernel.org" <peter.chen@kernel.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>
CC:     "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>, Jun Li <jun.li@nxp.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Peng Fan <peng.fan@nxp.com>
Subject: RE: [EXT] Re: [PATCH 1/2] dt-bindings: usb: ci-hdrc-usb2: add
 fsl,imx8ulp-usb compatible
Thread-Topic: [EXT] Re: [PATCH 1/2] dt-bindings: usb: ci-hdrc-usb2: add
 fsl,imx8ulp-usb compatible
Thread-Index: AQHZkuNqnZ4onfW7gEu26w5L04zA/690o2IAgACd5lA=
Date:   Thu, 1 Jun 2023 02:54:33 +0000
Message-ID: <DB7PR04MB45053665C02CA40E1B4635C38C499@DB7PR04MB4505.eurprd04.prod.outlook.com>
References: <20230530104007.1294702-1-xu.yang_2@nxp.com>
 <55751ab6-4f6b-6d9f-c090-8216c5f5f357@kernel.org>
In-Reply-To: <55751ab6-4f6b-6d9f-c090-8216c5f5f357@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB7PR04MB4505:EE_|AS8PR04MB8466:EE_
x-ms-office365-filtering-correlation-id: bdff4858-6a2a-4472-186a-08db624b8731
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Qonj4Yolzk8XKocltQ9uZL0E2o3B9653KL8QXgs83o8CBjab81d5ePtUc2kgTGd3SANEMpAuiHHsjf3AR+Z8i5cObmtE4amEjJ3mcY9vOeLP/uHlxtqL9+DUKZm+saE3yoYH8hm5/YPcdorxMy1EZXiTR6MZpI9ZM2fJucoXd7DvA7XkE6Iv9DjA++3ps3YA4wjmWqlT3xi3If45F8WqJsPSFv1BpYAXzfJiHOQv8iMexlB7sLv99rlBYw9dtkVbdIL1iGCdGbH6IY/IjUNkuUV4qZubvccgYmHHjpqSuPgGx/2eVnfQKdWuHHc0AK2C860tLYR5dcAun7mhxkdndKjkOZWzRNd9SqI58exaZ06+bzOrpPVxpB3lviFUUXL0WdQDpZ47I5clBIdI0j9YnrmYaA5g8KfBYAhkIdXAlBvlht2D/2JM0cqVteRPIkt+JAkgHDiyvwzRlKvwqbLXn8hHA3GSdQ0aDkyJC67tMwQdCRRjmH0q0RQ6uPeE4/oSxgTWDqYafOekRYktVL89xRucVTB0ncaHXOgRZr5IU6WNNv5NvnpiBhG31vXoWA4W41HvlVmVnixrtp0T/wdFFYqzGG6Siyqa3DadVaGVnbqiz0JyZIrT1XJ/rRpw6wIb
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR04MB4505.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(346002)(136003)(376002)(39860400002)(396003)(451199021)(110136005)(54906003)(8676002)(8936002)(66556008)(76116006)(2906002)(4326008)(66946007)(64756008)(66476007)(66446008)(316002)(41300700001)(5660300002)(52536014)(478600001)(71200400001)(7696005)(33656002)(122000001)(6506007)(9686003)(53546011)(186003)(55016003)(26005)(83380400001)(86362001)(38070700005)(38100700002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QjNnU1UrdjNibTBpdWRPRVZUdnk3b2NoRnlDaGNVRmVheDNpQ1grYmhOS2NB?=
 =?utf-8?B?UnRKc2ppelMwemNJUXluMlphS0M0QTQxV1R0RmNJUUhEUUtwOWJIeUFEOTNY?=
 =?utf-8?B?cFdYV0ZqODFkdkhxN2xZK0RzTmRZcS9nZnY2SkxoK0g4bmdZcmtvY2ZaQjVk?=
 =?utf-8?B?UzR1eXlMWjVoM2M5YjQwaEhGOUpIa2hKYk1kTTBTMHdhcWRNSE1Fc2JNN3N6?=
 =?utf-8?B?a21XWmo2b1I1UnFpOVBnM0lOVU1pOGlrV05ZK3BDNU8wTmtKSEhHTUVXS1RX?=
 =?utf-8?B?RVdtcDNPUjFRa2VKYzZ0ZzJNaVZaU0p5V3k2TkNrRUtWSnRTK2VFbGZoMGlq?=
 =?utf-8?B?RzdOTFZlN2g3YzFwa3RyV1EyWDRETVhacTZmNnNxbnlWYmliZmxxQXl0ZThv?=
 =?utf-8?B?NFNUMjdRMTV0VlVVRXdyUS94VVhNKzdPakYzMXRIRmVLZjdRZ25HdGRIL3RD?=
 =?utf-8?B?SXByRlFkYXNRUVdibGc0bzM2NVliSEM0SklIYk1Dbm4zc1B3ZWt1bVhtNGpP?=
 =?utf-8?B?cW1DMVZaa2ZSejRMK2RENXd3Q3daaERPNVVTR3FpTWszOEk1M3pOUWt6RHNs?=
 =?utf-8?B?UUJhbWFlZXpCc3BvLzBRc1NQZGVaRnoxWXpSU3h2NEVyV0NQckduM0o4OExE?=
 =?utf-8?B?V2hsSnVDOEl5ZHZBNjBGVWgrZzY1Z21tRW5Rall0Wm84bmgvTGRFU1k1Y2FK?=
 =?utf-8?B?MGg2M0FPdXlyNllZc3lmVTJjbHJtMXhjTWt5dVRpa1dCaGhDRVdmR2pvU0V1?=
 =?utf-8?B?UHVBV20za3lYb0hyM21udVU5WUtCai9kY1gydEVPVDBBeSs2emhwMGpiWExT?=
 =?utf-8?B?bXlpclBNR0Y2OEVKZzF6WW9aN040cWJMR0JQWHUrWHczZUkxc1NnTmxRKzVt?=
 =?utf-8?B?L2xYSlg5Z0pveDBDbmhkM2ZqbW5zSmhXMTh6bXl1bXI4U0xNRXR6N2hneVU1?=
 =?utf-8?B?dUdBdWM2RVg1Tmo0Zm5paEVBYnhDZ3RVVkRvakRndTBET1NPSG15RG9odkVJ?=
 =?utf-8?B?dit2dnNueTM0Ym5tTVIvMU5uSHlkRW9uemQ2TWZkMzA5anJIMWM4VmMvZlZF?=
 =?utf-8?B?eHhlNVlySGI0MzdKTlBqUENydjFTNVQ1di8yQWtYYlpSZkZGdlViQnhtSXBr?=
 =?utf-8?B?SDZ0NTB2NXgrVk9oQkdNdk83dERNekhmSVFNOWM0Z3lUSHlZU1BYQlZkN1Mz?=
 =?utf-8?B?VkUzSkV3UnNIbStxRUNCbHFBVno4OEhjM2ZMbnI1QlZpMGJLN3E5QTcvVWN5?=
 =?utf-8?B?L3M5cmd5a2xwSkVLNVdPUnZQbnBVc09hTjFjbW9SNFZKRC9kQ3V5MURTWGsr?=
 =?utf-8?B?SmlmWlJ1aGpiUUdxeG95UndneFNpdFRtbThtcEtpdWtneXB2Y3EySEZHekkr?=
 =?utf-8?B?RnlobXpydUtISEJ0bmZlMjVoZmJSaUJ6RlBsSDdOaWQySy9yNHZ1NXd5dEdU?=
 =?utf-8?B?SCtmWDBsOVNva1AwenFZa0lLRzdvaWsrRk1iZmRpL0dUSWFLUVBiMzBCSy9z?=
 =?utf-8?B?UDd1YnFPYlVsUlA1bm1WdjJ4MVp1OHRFQlJIcnNPSWprMStTWUYwMHpiSndo?=
 =?utf-8?B?KzFwalJvQTJsS200L3NEaVpVdzdIY0Nsbm55OUZEVDQrSUd6c015VXZzUTI2?=
 =?utf-8?B?NXdobllvL3RWSDhzUk5JWDVQUVBDbEVkbVY5VTJiU2RsZWdsdnNnZm1CaWZO?=
 =?utf-8?B?aE0xNGFsZmFxZ2NveXJ4RXJoM0pvRmRLYk9qc01xN2tKNm5taXdhM3hxT1p1?=
 =?utf-8?B?cHFLMFhNVVUxWDFpbFVoUkU3V1hqS0Z6V3BwTG8xOVFwb291QXFnSklDTVN2?=
 =?utf-8?B?MFYvd1VTRWg1YWRGTmpIS2E3OUlIOXJlS2JiRnpxTWhDRngyczJWWGJ3M1V3?=
 =?utf-8?B?RXBrT0xjemNpRGtpN3hJeHVmVzlmblBYeDI0dmxiUDdLV2NwUDQ5K0ZDNmMz?=
 =?utf-8?B?QkZkcjk4WTh3dTBhbE1zMUdnYTJUMTNyK2ZlWDdxNjdvY1hCRExjbEN0Y1RT?=
 =?utf-8?B?UVlEUDVIa0syM3UrdlRlMFJESkNjNjBEcDF5QmZ1azlueUVxbXQ0enBGL01T?=
 =?utf-8?B?VnNiaGI3Y0h2OUZGOUc2Zk9XV1pjUUtaTnd6VFIzZmRCdDZkWjRUTUZBb0tP?=
 =?utf-8?Q?8fkM=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB4505.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bdff4858-6a2a-4472-186a-08db624b8731
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jun 2023 02:54:33.3110
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: f0GjNCqQMTceW5vB/vYgaLaqwxCMRbcoJKKua87G9YXCmOTeE3iu5rfyns5pHjrvpy0vWndWxOTqJjp9t/qbeQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8466
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

DQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEtyenlzenRvZiBLb3psb3dz
a2kgPGtyemtAa2VybmVsLm9yZz4NCj4gU2VudDogVGh1cnNkYXksIEp1bmUgMSwgMjAyMyAxOjIz
IEFNDQo+IFRvOiBYdSBZYW5nIDx4dS55YW5nXzJAbnhwLmNvbT47IHBldGVyLmNoZW5Aa2VybmVs
Lm9yZzsgcm9iaCtkdEBrZXJuZWwub3JnDQo+IENjOiBncmVna2hAbGludXhmb3VuZGF0aW9uLm9y
ZzsgbGludXgtdXNiQHZnZXIua2VybmVsLm9yZzsgZGwtbGludXgtaW14IDxsaW51eC1pbXhAbnhw
LmNvbT47IEp1biBMaSA8anVuLmxpQG54cC5jb20+Ow0KPiBkZXZpY2V0cmVlQHZnZXIua2VybmVs
Lm9yZzsgUGVuZyBGYW4gPHBlbmcuZmFuQG54cC5jb20+DQo+IFN1YmplY3Q6IFtFWFRdIFJlOiBb
UEFUQ0ggMS8yXSBkdC1iaW5kaW5nczogdXNiOiBjaS1oZHJjLXVzYjI6IGFkZCBmc2wsaW14OHVs
cC11c2IgY29tcGF0aWJsZQ0KPiANCj4gQ2F1dGlvbjogVGhpcyBpcyBhbiBleHRlcm5hbCBlbWFp
bC4gUGxlYXNlIHRha2UgY2FyZSB3aGVuIGNsaWNraW5nIGxpbmtzIG9yIG9wZW5pbmcgYXR0YWNo
bWVudHMuIFdoZW4gaW4gZG91YnQsIHJlcG9ydCB0aGUNCj4gbWVzc2FnZSB1c2luZyB0aGUgJ1Jl
cG9ydCB0aGlzIGVtYWlsJyBidXR0b24NCj4gDQo+IA0KPiBPbiAzMC8wNS8yMDIzIDEyOjQwLCBY
dSBZYW5nIHdyb3RlOg0KPiA+IFRoZSBpbXg4dWxwIGFuZCBpbXg4ZHhsIGFyZSBjb21wYXRpYmxl
LiBUaGlzIHdpbGwgYWRkIGZzbCxpbXg4dWxwLXVzYg0KPiA+IHRvIHRoZSBjb21wYXRpYmxlIHBy
b3BlcnR5Lg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogWHUgWWFuZyA8eHUueWFuZ18yQG54cC5j
b20+DQo+IA0KPiBQbGVhc2UgdXNlIHNjcmlwdHMvZ2V0X21haW50YWluZXJzLnBsIHRvIGdldCBh
IGxpc3Qgb2YgbmVjZXNzYXJ5IHBlb3BsZQ0KPiBhbmQgbGlzdHMgdG8gQ0MuICBJdCBtaWdodCBo
YXBwZW4sIHRoYXQgY29tbWFuZCB3aGVuIHJ1biBvbiBhbiBvbGRlcg0KPiBrZXJuZWwsIGdpdmVz
IHlvdSBvdXRkYXRlZCBlbnRyaWVzLiAgVGhlcmVmb3JlIHBsZWFzZSBiZSBzdXJlIHlvdSBiYXNl
DQo+IHlvdXIgcGF0Y2hlcyBvbiByZWNlbnQgTGludXgga2VybmVsLg0KDQpPa2F5LCBJIGdvdCBp
dC4NCg0KVGhhbmtzLA0KWHUgWWFuZw0KDQo+IA0KPiANCj4gQWNrZWQtYnk6IEtyenlzenRvZiBL
b3psb3dza2kgPGtyenlzenRvZi5rb3psb3dza2lAbGluYXJvLm9yZz4NCj4gDQo+IEJlc3QgcmVn
YXJkcywNCj4gS3J6eXN6dG9mDQoNCg==
