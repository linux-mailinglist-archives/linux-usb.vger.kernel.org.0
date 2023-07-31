Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9E2227690E8
	for <lists+linux-usb@lfdr.de>; Mon, 31 Jul 2023 10:57:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230379AbjGaI5k (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 31 Jul 2023 04:57:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229971AbjGaI5Z (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 31 Jul 2023 04:57:25 -0400
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2077.outbound.protection.outlook.com [40.107.21.77])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51D95E5B
        for <linux-usb@vger.kernel.org>; Mon, 31 Jul 2023 01:56:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YD3ZN4g70aC3G2BmYIpA9YNjL1IW8DQU4xG8CFnmShYGgGGkD8HEoJCPGu9q/FooJE/JkPFQW9mP/4Qum/X4TaF2xjMQfwq2m0g0amZCweWA4JLJ/HemR/FRq3bNK7NYl5QS7xhicuy4i/nMRy9YCKkraV38UVUmuPbE8vgp32lN0c34Qj2sqmMddjG+x/OAnswp3fK/G3wGQGFLQVBGbqjVxNNucMVR4W1Pch0AYeH0zB2L1qgUjEEbJhDO/tkMcEnkEkK1Bis4QhkfWNRRTcCC3/J4vU2kxcTipJiAQk3e3dGwOSOfY7hhaoNERut8v3HBNnxb9KN7RBHp/kxw/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q65H4s7sVj7+aPTR2wfYpX9iyE2Mkw33iy1Dn9GYXGw=;
 b=ni2mBLwt1cSvxmPbTYx10tRMWJ+7MnVlpNDpmb4VWPG6yM9wVUIo5DUj6iIldziH196AhqUcui8EARnpXrD6NItpj+eV+SPIFyUU35rw+aDRY6Q7cMH1IuzDg4kiif993/6tJZRkfKBEG5fwQFasL6ZcG+No0WoqwlAm6T9uIgcMmjfjiAj4g66MYfp7j+gxETe0X9KBVoHQGo7ex4Yq3nOCwo+QnO/6/JhHN4+i9lv0FomB63/AaoSO3d7meydkRbe0ShJNTbiTVsvmFA4IkJBx7lzM5ODTRSbEd0CEirbfm8b9iE2nwnGRdg7H0M0eEdIfjehmEsS6gGPwEUb1yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q65H4s7sVj7+aPTR2wfYpX9iyE2Mkw33iy1Dn9GYXGw=;
 b=qqWE7N2x78+e9gB/CsOfzUU21sC5pNiuO6lldRPqYqgCHScmJXBN+DePv4fWjQbedx4BIWFifTg/E1DBKkTjaoLm6bSMc9LqhYvUOq5RsNSzDwuWDryvAUeK/y+sSOTyQnSUa3vpPqrlXxIckQKp5wT9BWANQEMccvtoCJ8p2Yo=
Received: from DB7PR04MB4505.eurprd04.prod.outlook.com (2603:10a6:5:39::26) by
 DB9PR04MB8172.eurprd04.prod.outlook.com (2603:10a6:10:249::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6631.42; Mon, 31 Jul 2023 08:56:34 +0000
Received: from DB7PR04MB4505.eurprd04.prod.outlook.com
 ([fe80::473a:28:1d98:10ab]) by DB7PR04MB4505.eurprd04.prod.outlook.com
 ([fe80::473a:28:1d98:10ab%5]) with mapi id 15.20.6631.043; Mon, 31 Jul 2023
 08:56:34 +0000
From:   Xu Yang <xu.yang_2@nxp.com>
To:     "linux@roeck-us.net" <linux@roeck-us.net>,
        "heikki.krogerus@linux.intel.com" <heikki.krogerus@linux.intel.com>
CC:     "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        dl-linux-imx <linux-imx@nxp.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Jun Li <jun.li@nxp.com>
Subject: RE: [PATCH] usb: typec: tcpm: not sink vbus if operational current is
 0mA
Thread-Topic: [PATCH] usb: typec: tcpm: not sink vbus if operational current
 is 0mA
Thread-Index: AQHZq0EWrRme1GvW7UiXk1aB0o5uBq/Twuqw
Date:   Mon, 31 Jul 2023 08:56:34 +0000
Message-ID: <DB7PR04MB4505C53A42BCECFBBDEBC2488C05A@DB7PR04MB4505.eurprd04.prod.outlook.com>
References: <20230630105656.2828595-1-xu.yang_2@nxp.com>
In-Reply-To: <20230630105656.2828595-1-xu.yang_2@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB7PR04MB4505:EE_|DB9PR04MB8172:EE_
x-ms-office365-filtering-correlation-id: 48c94bc1-6c18-4144-df23-08db91a40acf
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: DPJ6iASrriW8r776ipv8ObgKdd5+rP8HSDFHH3fPybIpKrK5VGk6QZcu6zD3cU+hL3tOPMBvQiweSxUrLG4nXSlz5FeH2n7XA8mMeUJv9L/P7SmKqP02gvzsLsFL3v4t6VjqZ3YyjzT1sPIzzty9KcYZe/Ns4lR6CNaqXKceAXCntj0KNJtWgIrkyrEjD4TDeSK/LHFD3jXs9xJMYa9nIE5gnZz/dScOBT2OWEuIugz74vDa4iWrpXxRgGkr+LFa3DTf9SqdCBwatIqOJ9RRmvI0JtnLAlPDpbdXCZGXQEXuRD59QSnE5sOWiTv5cHKcaHFzih3Pdvnv9WmNHTQfZFT2lqsrZPMcimeKrWJzv8tcJrdF2z8NOtMM2FB0FF+zNh32yRC4Gd9gnO6vfYON0ta8R31Lhvyu9WaEPBIQ4Pd8TLNzF9k7x+dbqwwLixZ3KZL7aIbgnO4fpaN9tmGC1SQ/x6w/dkRjVfpSncyhZEfChp0SG0vy6kXSOcw5CRHMN4KucCDa9f8khAoIx1sYgL/v5DdOGfrJwf3SyMPoGhpsqYycxsm3Zz1Be2p7NMmyTZBAjJuRSNFVE4w4EOmKuCEZWkZ61pYV1d32bMFQQswcJvHAVTrRYULs51QVC9GT
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR04MB4505.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(346002)(39860400002)(396003)(136003)(376002)(451199021)(9686003)(7696005)(55016003)(53546011)(6506007)(26005)(83380400001)(186003)(33656002)(76116006)(66946007)(52536014)(66556008)(38070700005)(122000001)(54906003)(110136005)(41300700001)(86362001)(66476007)(316002)(66446008)(64756008)(4326008)(5660300002)(8676002)(8936002)(38100700002)(2906002)(71200400001)(478600001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SVI2bHZFMmNkZlJIVmdqMGVoMVNiNmtQczF6ZklDSUNkajk1aEkxelZJc3Rw?=
 =?utf-8?B?YXVKdWJQSGVKNnRvblVkdURrWjhqd0tXRUxNK2tTY1RZYXRtRUhJUmpRanRn?=
 =?utf-8?B?b25Wb0FicFh6ejN0QWFLZkNHdkNjQllDbG5EbDF3Y01kWEU3L1FSYzVUcUdj?=
 =?utf-8?B?OVFjOUdURXZmWmhyWDRoOHBBc0EybDFVcDdnQkxYbTZJQW9zMFk3bC91ZlBR?=
 =?utf-8?B?bndXc2pHdGpadnd3d0pieUg0SmwwNUFVZnpNTnpoeVhsQlVHRlpuUFRORXpX?=
 =?utf-8?B?b3llVys1Z0xHd1dvN1ZTRUhyVUdnVW9xVTFwQnJIbTQ3elFZMTIzNENVaW8r?=
 =?utf-8?B?aDF2UVdQZkZiZm1TbStIRXNJTm5tQkx1YTZqa0YyRHV4WTdqM2Ywc2gycTFl?=
 =?utf-8?B?WXNZeDc4SStFNlZHMGF1aGxQZG9hTEFxT1JXaTNPN3M2VE54OW82WC90dVNO?=
 =?utf-8?B?VDdoZDc2TzRBbXdZWGt2SDMwaVFkS3NoT1RtZ3hDRzAvNkZKTENqZ1FWUFdS?=
 =?utf-8?B?SG0wdHQrQWNtMWFiRmtvQWNMSEM5SEZhWFc1RklGWGVuOFdyRWgvQzEvNU11?=
 =?utf-8?B?SzdEL1Zld0lYSCsybS95eXNnL2JIS2g0N1ZzdkZEejVRQ0IydVJEWVpDWmtv?=
 =?utf-8?B?TzhacFZTQ3RLMHpZcjRFcllNSloyTG9XNnBjVUdZaFI5QXo4aktvOUhmVnpW?=
 =?utf-8?B?b1RXSU00d2JuTXFoODZJU1AzWFlrbTA0Qko1YUV5K1JTdW1URnVsVVpQdjA3?=
 =?utf-8?B?cmR5N0R0a1NPQjFGeCtaTjVjY0R5TEh5ZG40a1MweDZSd1prUFRsaGMzdWJO?=
 =?utf-8?B?VjB6b3FKSzhyTkIzUnFkb1A4Umw1WW4zUlM2OWZwZEpoOXgvRUVRM3MzbWgx?=
 =?utf-8?B?WHFzb0k1dHI1bVN4NnZYOXMrdG1Wczdjd2pZNGJnUUlPQ0YvNGk5K3FrOGRG?=
 =?utf-8?B?OUNTZmNYU1IrUFA0Vlp4bUhrUmV4N0tXdE5oVllDSW1INnc4dWIvV3NrdDlh?=
 =?utf-8?B?b2t2MDVIZmhpKzJ4R2NPTWdsdEp4RG5LeXJqc2NuQ0JjKzd2MzNCV3c0d2Z1?=
 =?utf-8?B?R2gvTUJPaHhZRWpOQkZIQWpMZk92UUk5clZFckk0OWtCRlozeVpPNU9aNUVy?=
 =?utf-8?B?VWdGVm9mdXZ4dzR5SjdnbXMrZDJsaXdub29EelJSdUFCbGxNM3k1Ti9Jd0Yz?=
 =?utf-8?B?ZnIzeStZZjI2SGZaUnZKOERhemxMNHkramJNaVhXVkFRcDdXdUErQVpIQ29p?=
 =?utf-8?B?SUpOdk9GVDRwZmViODJQVGZUTXY4bm1uSmFzTHZDK2ZReXdIS2MrY00rU29u?=
 =?utf-8?B?VUNZZEl2T090cVNrMDd4S3AvNkkybXRxY3NKaTV1bUVWTE9CR2VPd3lQUWhw?=
 =?utf-8?B?VWZWeUM0dk4wVjluWmwwbVV2WTFiRUt3REcrVnBxb205L0N3Q3l4aDVSMExT?=
 =?utf-8?B?VTd4TTlBcEd6UHV4Mks2VmhuTkZLQXBMOWNUT0h0VG83S09VV2R4UXhVaWJx?=
 =?utf-8?B?R1cvSk9JVXdJa1JQNkxjd1B3aVVGY05MQWZJclBJcFIzUGJ5K05JejBkK3Vk?=
 =?utf-8?B?YjJZVXAxanlTdDVYS1pESExLeG11SWNXbk5sVWtoSENmKzBEay9kQ0k3UGFB?=
 =?utf-8?B?QTNsck9tMkpsUUpRL2VkeEsxWWZ3NEp3aHpCTkVzMTZ3VkRyQ3pvMnd5UmV6?=
 =?utf-8?B?Nm5lNnQ0aldKbG92RjdjNC84LzhDZHYzRWQrcDVteXdzYjRycGljYTZSN0NC?=
 =?utf-8?B?aFdLOWxNSWlRdThuOU9uTE51eWhmZWlNYmRtWmpYT3dQTUkrVkhibUdVckRF?=
 =?utf-8?B?Qm1PM0Job1lHMTl1SWRQdkNoUURTV0o1YjNueTV1bDlRUmtkMDBRYnlJL1Js?=
 =?utf-8?B?d25oK2sxcXFjMHowRGplMXIrb1ZVUjJidFpzNkdLOXJlbzhaNzNRTU04cVhP?=
 =?utf-8?B?SjcvalR5NnlsM0M2ZUNFWUZnb2VSOU10T1U5UEY1bUZaVDBGVG40ay9pUnVN?=
 =?utf-8?B?Y3FQRFQ5RTlFdTc5SzY5V3BoV3gwRUE3UzAxM2QwNWh2bnIybFV3b05FcXA5?=
 =?utf-8?B?cE14UjRjTG5uRDkvcHMvbUhYS3ZRTFREcnhxN3RaSmNHbU9LR3d5cTlUUjhY?=
 =?utf-8?Q?nzMM=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB4505.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 48c94bc1-6c18-4144-df23-08db91a40acf
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jul 2023 08:56:34.4935
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 90QaJW6CsoGxfin/n41r4X/lt5Ns+xYVGIYTQuIHJ8LHgjurYGnkQL7tJb7+ToWT07lxY1eVhPjwf7ydk4KTcg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8172
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

DQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IFh1IFlhbmcNCj4gU2VudDog
RnJpZGF5LCBKdW5lIDMwLCAyMDIzIDY6NTMgUE0NCj4gVG86IGxpbnV4QHJvZWNrLXVzLm5ldDsg
aGVpa2tpLmtyb2dlcnVzQGxpbnV4LmludGVsLmNvbQ0KPiBDYzogZ3JlZ2toQGxpbnV4Zm91bmRh
dGlvbi5vcmc7IGRsLWxpbnV4LWlteCA8bGludXgtaW14QG54cC5jb20+OyBsaW51eC11c2JAdmdl
ci5rZXJuZWwub3JnOyBKdW4gTGkgPGp1bi5saUBueHAuY29tPjsNCj4gWHUgWWFuZyA8eHUueWFu
Z18yQG54cC5jb20+DQo+IFN1YmplY3Q6IFtQQVRDSF0gdXNiOiB0eXBlYzogdGNwbTogbm90IHNp
bmsgdmJ1cyBpZiBvcGVyYXRpb25hbCBjdXJyZW50IGlzIDBtQQ0KPiANCj4gUEQzLjAgU3BlYyA2
LjQuMS4zLjEgc2FpZDoNCj4gRm9yIGEgU2luayByZXF1aXJpbmcgbm8gcG93ZXIgZnJvbSB0aGUg
U291cmNlLCB0aGUgVm9sdGFnZSAoQjE54oCmMTApDQo+IFNoYWxsIGJlIHNldCB0byA1ViBhbmQg
dGhlIE9wZXJhdGlvbmFsIEN1cnJlbnQgU2hhbGwgYmUgc2V0IHRvIDBtQS4NCj4gDQo+IFRoZXJl
Zm9yZSwgd2UgY2FuIGtlZXAgc2luayBwYXRoIGNsb3NlZCBpZiB0aGUgb3BlcmF0aW9uYWwgY3Vy
cmVudCBvZg0KPiB0aGUgZmlyc3QgZml4ZWQgUERPIGlzIDBtQS4NCj4gDQo+IFNpZ25lZC1vZmYt
Ynk6IFh1IFlhbmcgPHh1LnlhbmdfMkBueHAuY29tPg0KPiAtLS0NCj4gIGRyaXZlcnMvdXNiL3R5
cGVjL3RjcG0vdGNwbS5jIHwgMTIgKysrKysrKysrKy0tDQo+ICAxIGZpbGUgY2hhbmdlZCwgMTAg
aW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L3VzYi90eXBlYy90Y3BtL3RjcG0uYyBiL2RyaXZlcnMvdXNiL3R5cGVjL3RjcG0vdGNwbS5jDQo+
IGluZGV4IDgyOWQ3NWViYWI0Mi4uNGY3ZTRjNTBlODQ3IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJz
L3VzYi90eXBlYy90Y3BtL3RjcG0uYw0KPiArKysgYi9kcml2ZXJzL3VzYi90eXBlYy90Y3BtL3Rj
cG0uYw0KPiBAQCAtNDMwMSw3ICs0MzAxLDEyIEBAIHN0YXRpYyB2b2lkIHJ1bl9zdGF0ZV9tYWNo
aW5lKHN0cnVjdCB0Y3BtX3BvcnQgKnBvcnQpDQo+ICAJCQlpZiAocG9ydC0+c2xvd19jaGFyZ2Vy
X2xvb3AgJiYgKGN1cnJlbnRfbGltID4gUERfUF9TTktfU1REQllfTVcgLyA1KSkNCj4gIAkJCQlj
dXJyZW50X2xpbSA9IFBEX1BfU05LX1NUREJZX01XIC8gNTsNCj4gIAkJCXRjcG1fc2V0X2N1cnJl
bnRfbGltaXQocG9ydCwgY3VycmVudF9saW0sIDUwMDApOw0KPiAtCQkJdGNwbV9zZXRfY2hhcmdl
KHBvcnQsIHRydWUpOw0KPiArDQo+ICsJCQlpZiAocGRvX21heF9jdXJyZW50KHBvcnQtPnNua19w
ZG9bMF0pKQ0KPiArCQkJCXRjcG1fc2V0X2NoYXJnZShwb3J0LCB0cnVlKTsNCj4gKwkJCWVsc2UN
Cj4gKwkJCQl0Y3BtX2xvZyhwb3J0LCAiTm90IHJlcXVpcmUgcG93ZXIgZnJvbSBTb3VyY2UiKTsN
Cj4gKw0KPiAgCQkJaWYgKCFwb3J0LT5wZF9zdXBwb3J0ZWQpDQo+ICAJCQkJdGNwbV9zZXRfc3Rh
dGUocG9ydCwgU05LX1JFQURZLCAwKTsNCj4gIAkJCWVsc2UNCj4gQEAgLTQ1ODIsNyArNDU4Nywx
MCBAQCBzdGF0aWMgdm9pZCBydW5fc3RhdGVfbWFjaGluZShzdHJ1Y3QgdGNwbV9wb3J0ICpwb3J0
KQ0KPiAgCQkJdGNwbV9zZXRfY3VycmVudF9saW1pdChwb3J0LA0KPiAgCQkJCQkgICAgICAgdGNw
bV9nZXRfY3VycmVudF9saW1pdChwb3J0KSwNCj4gIAkJCQkJICAgICAgIDUwMDApOw0KPiAtCQkJ
dGNwbV9zZXRfY2hhcmdlKHBvcnQsIHRydWUpOw0KPiArCQkJaWYgKHBkb19tYXhfY3VycmVudChw
b3J0LT5zbmtfcGRvWzBdKSkNCj4gKwkJCQl0Y3BtX3NldF9jaGFyZ2UocG9ydCwgdHJ1ZSk7DQo+
ICsJCQllbHNlDQo+ICsJCQkJdGNwbV9sb2cocG9ydCwgIk5vdCByZXF1aXJlIHBvd2VyIGZyb20g
U291cmNlIik7DQo+ICAJCX0NCj4gIAkJaWYgKHBvcnQtPmFtcyA9PSBIQVJEX1JFU0VUKQ0KPiAg
CQkJdGNwbV9hbXNfZmluaXNoKHBvcnQpOw0KPiAtLQ0KPiAyLjM0LjENCg0KQSBnZW50bGUgcGlu
Zy4NCg0K
