Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3FC1559D98F
	for <lists+linux-usb@lfdr.de>; Tue, 23 Aug 2022 12:07:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243513AbiHWJ5v (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 23 Aug 2022 05:57:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348218AbiHWJzp (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 23 Aug 2022 05:55:45 -0400
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-eopbgr80087.outbound.protection.outlook.com [40.107.8.87])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8DC10A00D9;
        Tue, 23 Aug 2022 01:46:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Co0Mht11pUexmyERZ+fqyxrkyrFqGm5r0V4ZbyaSwHlQPBNJLOCRMil9gjoe9V/roq/FezKK2NTBKw9WonqfUfNMAmm8lHcJXlTfYOxTj2a2oh8Funb1fV1YcKn6JMn2vJd2LMwpPt0nVFS+06YbCx7Fg/Ee6vK1PY49gjAGiEceXYnEnXXbt/v/CUiKiRWOeANmlglxE7Kb5qSi6vwl2HGHuMVAE2AOHaWXlnJYK5H9xAQe4hMkdEeElx+se5HK6ENVstHwSveVGKE5OpLkL6O2vRbVyvp7gnyZhC+la7LcaEL0KGpxrupzOqhrmLU2yqvVC0PnWqWz8YvTQzN3VQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AhDtvQ/R64o9MrbtgWylDYMuJVSn6cU2uMb0enJ1Nbs=;
 b=X94rfqrY+nSAabnzrcpouvl/qoEpkWKlEaII6wdgGnodvwPigscEHRuhTgvxZOwqXCB5DDP04UKbaY9kJMvZa3X/q/5anW/M1BKyJFuAGSk5vd0HqnX7xwzTxydNzI5TJSJ7x51Rgk26TMNpgDrIEhOt4sa87/9iQIqCIYPp6g0tS+hDkyBr+R1IO9ReKo0v9H8RKg2xmCvGc61Aj95DHZ09cpRedZL721RHqGxJyYZUROMR3LHhbmM1mJuKgcyWowQqirJy5wV6bOQyl0FMtWlVoU+/1cZfZJ/FeZK//5rxBjy29UX5Gquhg6WvhStf/ETwrScbWC1lDKK4UgN1tA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AhDtvQ/R64o9MrbtgWylDYMuJVSn6cU2uMb0enJ1Nbs=;
 b=cgzWUQUSJ4Kl9dgNgMsfMgudMYmFhi70bjhw8pnwJAyyBZw8ybi5lB+h2lf8zrsoH/FZWnKdVM2R9RUgox5AuYqA20c76hS8y1Fr24z2KQBspRIrr+Gfalj+/pQcEv1zMMsYb/3X/ftpq0PF2+unA5NQhd+ZZTh5eciJx97mgWs=
Received: from PAXPR04MB8784.eurprd04.prod.outlook.com (2603:10a6:102:20f::23)
 by AM0PR04MB4435.eurprd04.prod.outlook.com (2603:10a6:208:76::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.14; Tue, 23 Aug
 2022 08:46:32 +0000
Received: from PAXPR04MB8784.eurprd04.prod.outlook.com
 ([fe80::60b7:af13:8472:2e8c]) by PAXPR04MB8784.eurprd04.prod.outlook.com
 ([fe80::60b7:af13:8472:2e8c%4]) with mapi id 15.20.5546.022; Tue, 23 Aug 2022
 08:46:32 +0000
From:   Xu Yang <xu.yang_2@nxp.com>
To:     Peter Rosin <peda@axentia.se>,
        "heikki.krogerus@linux.intel.com" <heikki.krogerus@linux.intel.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>
CC:     "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "linux@roeck-us.net" <linux@roeck-us.net>, Jun Li <jun.li@nxp.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
Subject: RE: [EXT] Re: [PATCH 3/4] usb: typec: mux: add typec orientation
 switch support via mux controller
Thread-Topic: [EXT] Re: [PATCH 3/4] usb: typec: mux: add typec orientation
 switch support via mux controller
Thread-Index: AQHYtfmSG+YWmixnKUSSCfEMo3eHoq28At4AgAApSUA=
Date:   Tue, 23 Aug 2022 08:46:31 +0000
Message-ID: <PAXPR04MB8784C83CC2A881EF35CA77088C709@PAXPR04MB8784.eurprd04.prod.outlook.com>
References: <20220822153517.3747679-1-xu.yang_2@nxp.com>
 <20220822153517.3747679-4-xu.yang_2@nxp.com>
 <c2261f2b-fa47-f988-bf5a-aaa3169c8c7e@axentia.se>
In-Reply-To: <c2261f2b-fa47-f988-bf5a-aaa3169c8c7e@axentia.se>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3bce4b17-a778-4fc3-5340-08da84e3fa6d
x-ms-traffictypediagnostic: AM0PR04MB4435:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: cbRm5eK0FsS5042Uf9O7uX9qsaKaVBRJBFiYPKIg4VEmgi90WYx2fzYXFLGm8uw2YQMswu+XDSMpq41n9dq3meE7pzONvOUBA8zghT8/0ycZA9f1fIpG6PaHiE1B9K79sJuCqO6df5zJVNk47g2MfAeHJuc2ChI4/xHC7FdTy5YVQp/6NEiI/fXe7Z2qV9l/GzYYWq7IFVVrcm6Yop4mDOwWJldK22+8lWTEnQVDhLfZc2qX33Sosaq5MBsstm7puObEkomGnUFJ+ijAGTBVj5SUay4Fs/3XWX7queYXKqlCofS0GIh/G3F4qkIAZzq6/0mDwImq5uHHLOqPUdQGnc62DIRJLptlflS/m35ne1eXSoZgAzdQjbAlKjRNp8u3X2a5QDbUVIJmnnwDXDFVyX6ikqNXz2RovsBr0+Uc2J6bV9Sc03gDhJv0sRHF1fkl4lem4uEFXbyQKQYu7Zmrq/pajIcOuVU5LtrJ5dQ5K9MmlbwbN8zfahYHwe4sojbYftXgElPgJcJsyCF7jcZJRg3LMfEh/Wm5swsVXGLa7uxk5OjBWtCtI818/mJi+UoHrK8TBu282lMiGFBXdZFiLEWEwQI9QF1D7v855RpYOY++2tFzOilPo/G1Y58kIR29WG8c18qjY8fGgtV0LTP3ilOqtNv4zxLIgUwhxaUvDIVL3cDPENWMV1S5kNg1LNh2hZfdEHn8r8QQaZdjGAfMyErb3VzL+AvjWBlYpwrmUh7B4ReiEUl3ELbqr2Y+HzGNXYc0J1zIJuTpIwcXCU1SWQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8784.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(346002)(376002)(366004)(396003)(136003)(2906002)(5660300002)(52536014)(8936002)(33656002)(316002)(8676002)(4326008)(26005)(9686003)(71200400001)(110136005)(41300700001)(478600001)(54906003)(6506007)(7696005)(53546011)(55016003)(38070700005)(38100700002)(86362001)(83380400001)(186003)(122000001)(66556008)(64756008)(66476007)(66446008)(66946007)(76116006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dXIvNFA2U0k3REU3OU84Mk5hU1RmRHdUMnJyeEZHSGJMY1NVU0VpeC9tWmJx?=
 =?utf-8?B?SEJpdkRIaGI4ZGJBd25GV09lU2cwZ1MzZnFDb0x4ZmRpWHNEc0laMEprMTYz?=
 =?utf-8?B?ekN5MkMwTVZFM2tiSDVrQzAvQmIzMUpDSG9mYnJjWEZBYmNXOE1CNWRMY1dG?=
 =?utf-8?B?dzEvYmZDa2YxNzJYMGFEMStHandNb21vTkxqTmJ1WUd6MmJSODR6YXVGU2dK?=
 =?utf-8?B?RytQcjdRMEdscU4yNjJJUVc3U2FYemRpMVkrc2RjdmNkZFlLWVVObElSMklh?=
 =?utf-8?B?d0FzUmZqSTdObGNreUkyM1ZYNytFRlpFNmkyU0xUMjlXWmF1cDFYRitKb0dL?=
 =?utf-8?B?V1BxVHBpTlJxUEJPemlwWFBUbUJVS1pTcVVuSHZsejAxamd4NVJvZ2FUdnpK?=
 =?utf-8?B?by9qTS81U1RWbGNrb21hcDBOQWk5T2JvWnV1MlJRcm5YUnR6TjNYSEdVMVlW?=
 =?utf-8?B?bk9ZSmFkUzdiQ1cwZG5wOGtNenk4a3g1N0dKN3BFb1pJQUxoakFLb0srYXBq?=
 =?utf-8?B?NDJnSWx3ZGFnQ3pPRmNMdSt2c1o2dUpNZ05TUkZXYmg3TlVXZFRNZXQ3VDR3?=
 =?utf-8?B?VEQ5amYrZWFVckZXY0J3SjFUWjNEZm0xY0VnSGRVUkJaR3hYZGs1eHJha2RV?=
 =?utf-8?B?TzlrRU5DSkZyM3kzSVNrRDVCOHZDelBxeSs0YWNDVXMrVWlBYzU1QVhTV2x6?=
 =?utf-8?B?ZEgrTlNBak5BWFF3MmR1SWFEVkRCanRDbDZGWTFuSDkza0hEejRmd3NUTWJq?=
 =?utf-8?B?cFJubmxVZzErNnNhL2gwUEhSenF5TDV4NmFNOEloZHhMRXdGeUFvWVhRU3V4?=
 =?utf-8?B?UDhReHBSQjZyRkxobGZmb1I3b3ZZSTJYWkp3SnhrTkdZY0hKVFh4c24zc3Ez?=
 =?utf-8?B?ditOUmNlczh3d2hZVE1aMktNZUJJK2lWVWxIVDR3SVJ5MGRrTmZPNzJJWWJh?=
 =?utf-8?B?OWsxVHlhU0xrMU9MYTc3dWZoOGcyZmVIS1ZJRnpSTlVYM3NLNWVvRTJ1ZjlN?=
 =?utf-8?B?eVdhTFB0ckIyNkNuSmdiazlqT2wwWE55ZHp4UjJUTGdNWEx5aTd2dVFWTlRK?=
 =?utf-8?B?cWZnSk9GWm9JV1pONUlXblVqUUtWWWI1VFh4S0hEcjBDdlJXMDAwR1BxMVFT?=
 =?utf-8?B?NWNueng0blgzU29LWUhyRkZ3SmRma0kwV3YvWDM4NUx4WjFGaEhjZkhHL24y?=
 =?utf-8?B?a0w4YURtbWpST2tTR1BuVENCQkFZV1k2aTFCYU1Od0NiMFdCdlp3ZVFJSi9s?=
 =?utf-8?B?SCtVWis1SlhRSFlzRHZUOUZ3QmphZ1Fxb3Q4TzJCYXJuM2tIU0IyUEJpWXBk?=
 =?utf-8?B?bHJNcGdzelEzMy9teGhqazM0clRCSzhXbUJMYmNBcjB4eGR0ZzNyY1dlWW1r?=
 =?utf-8?B?L2cyWFdLOFhDeGRyMzFJN2x1SUZzaGRzbFJCS2JVWEZXTUkvbFpFTnNoWC8v?=
 =?utf-8?B?MmdsdWVucWZsTWZXR3MzUGxMdmFrbzA4a1dPV0FKWmtaZ3I0S1BWK3JNL0Yr?=
 =?utf-8?B?QjR3MEpTbSs4TUYwc2hiUG1xeElPV04zZWovRWtnOWdieFl1WE9pWWxRQ2dE?=
 =?utf-8?B?cGNmQi9INFhkSC9FUmRVL0REWW00U05lcVp0UXRRZW4xNGZYdWVQWnBnTUFq?=
 =?utf-8?B?ZUdhRnZSSE9pSmNkS2J1ZDB5YWZQTjR2c3JmcmRTa0h5RGdNczRrZ1piUWRB?=
 =?utf-8?B?djh1Mkhtc21XcHZYdDJscmRYdEVYeVh1VGF5Q21LZzAvZ09STEhta29jOVpz?=
 =?utf-8?B?Rm5RSG1QVnNWTW91R0w5QjcrdERYRVFDYVRqQ042aFY5bVR4dnFBYmVsdGRI?=
 =?utf-8?B?elUzUHEvcEV2RGErTlZEL0JIWWRsZis0QjhSNUdhQ1BYUTZERFRjemxNOS9Y?=
 =?utf-8?B?SEV6TldEN3B3WHFKaXROMEhXT3dZN25pTFN2YUJUNnlicWpxOHEwcE1GYmNX?=
 =?utf-8?B?eC9FaTMwdzFlcnJQMHZaSEJpTVhBUWpTcUJ6dXhMZXlWUEIxNFBKNGFPYWQ3?=
 =?utf-8?B?NUhDdXdtNkEvUW9JdDRjMFBqOTdJejY3R2EzdjRYb2gyenlaQzlLWGtBaHJr?=
 =?utf-8?B?U1NBbHE1OVlWYUZMMzdETkVwSXNCdFlzNTZmOG1BcnkwUVM3OHY4Nzc2T2Vr?=
 =?utf-8?Q?LpyM=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8784.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3bce4b17-a778-4fc3-5340-08da84e3fa6d
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Aug 2022 08:46:31.9632
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: htgA8hAj2YkRLVwA0D908O0/lmMheWE3VUF1Do8E9vd4k0sZB9fs9D0yGzkotbswOEeeAiJPaX8YERaBkfLytA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4435
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

SGkgUGV0ZXIsDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUGV0ZXIg
Um9zaW4gPHBlZGFAYXhlbnRpYS5zZT4NCj4gU2VudDogVHVlc2RheSwgQXVndXN0IDIzLCAyMDIy
IDI6MTMgUE0NCj4gVG86IFh1IFlhbmcgPHh1LnlhbmdfMkBueHAuY29tPjsgaGVpa2tpLmtyb2dl
cnVzQGxpbnV4LmludGVsLmNvbTsNCj4gcm9iaCtkdEBrZXJuZWwub3JnOyBzaGF3bmd1b0BrZXJu
ZWwub3JnDQo+IENjOiBncmVna2hAbGludXhmb3VuZGF0aW9uLm9yZzsgbGludXhAcm9lY2stdXMu
bmV0OyBKdW4gTGkNCj4gPGp1bi5saUBueHAuY29tPjsgbGludXgtdXNiQHZnZXIua2VybmVsLm9y
ZzsgZGwtbGludXgtaW14IDxsaW51eC0NCj4gaW14QG54cC5jb20+OyBkZXZpY2V0cmVlQHZnZXIu
a2VybmVsLm9yZzsgbGludXgtYXJtLQ0KPiBrZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZw0KPiBT
dWJqZWN0OiBbRVhUXSBSZTogW1BBVENIIDMvNF0gdXNiOiB0eXBlYzogbXV4OiBhZGQgdHlwZWMg
b3JpZW50YXRpb24gc3dpdGNoDQo+IHN1cHBvcnQgdmlhIG11eCBjb250cm9sbGVyDQo+IA0KPiBD
YXV0aW9uOiBFWFQgRW1haWwNCj4gDQo+IEhpIQ0KPiANCj4gMjAyMi0wOC0yMiBhdCAxNzozNSwg
WHUgWWFuZyB3cm90ZToNCj4gPiBTb21lIGRlZGljYXRlZCBtdXggYmxvY2sgY2FuIHVzZSBleGlz
dGluZyBtdXggY29udHJvbGxlciBhcyBhIG11eA0KPiA+IHByb3ZpZGVyLCB0eXBlYyBwb3J0IGFz
IGEgY29uc3VtZXIgdG8gc2VsZWN0IGNoYW5uZWwgZm9yIG9yaWVudGF0aW9uDQo+ID4gc3dpdGNo
LCB0aGlzIGNhbiBiZSBhbiBhbHRlcm5hdGUgd2F5IHRvIGNvbnRyb2wgdHlwZWMgb3JpZW50YXRp
b24gc3dpdGNoLg0KPiA+IEFsc28sIG9uZSBtdXggY29udHJvbGxlciBjb3VsZCBjb3ZlciBoaWdo
c3BlZWQsIHN1cGVyc3BlZWQgYW5kIHNpZGViYW5kDQo+ID4gdXNlIGNhc2Ugb25lIHRpbWUgaW4g
dGhpcyBpbXBsZW1lbnRhdGlvbi4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IFh1IFlhbmcgPHh1
LnlhbmdfMkBueHAuY29tPg0KPiA+IC0tLQ0KPiA+ICBkcml2ZXJzL3VzYi90eXBlYy9tdXguYyAg
ICAgICB8IDc0DQo+ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrDQo+ID4gIGlu
Y2x1ZGUvbGludXgvdXNiL3R5cGVjX211eC5oIHwgIDcgKy0tLQ0KPiA+ICAyIGZpbGVzIGNoYW5n
ZWQsIDc2IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pDQo+ID4NCj4gPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy91c2IvdHlwZWMvbXV4LmMgYi9kcml2ZXJzL3VzYi90eXBlYy9tdXguYw0KPiA+
IGluZGV4IDQ2NDMzMDc3NmNkNi4uNWVlOTYwZmI2NjhkIDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZl
cnMvdXNiL3R5cGVjL211eC5jDQo+ID4gKysrIGIvZHJpdmVycy91c2IvdHlwZWMvbXV4LmMNCj4g
PiBAQCAtMTMsNiArMTMsNyBAQA0KPiA+ICAjaW5jbHVkZSA8bGludXgvbXV0ZXguaD4NCj4gPiAg
I2luY2x1ZGUgPGxpbnV4L3Byb3BlcnR5Lmg+DQo+ID4gICNpbmNsdWRlIDxsaW51eC9zbGFiLmg+
DQo+ID4gKyNpbmNsdWRlIDxsaW51eC9tdXgvY29uc3VtZXIuaD4NCj4gPg0KPiA+ICAjaW5jbHVk
ZSAiY2xhc3MuaCINCj4gPiAgI2luY2x1ZGUgIm11eC5oIg0KPiA+IEBAIC0yMiw2ICsyMywxMSBA
QA0KPiA+ICBzdHJ1Y3QgdHlwZWNfc3dpdGNoIHsNCj4gPiAgICAgICBzdHJ1Y3QgdHlwZWNfc3dp
dGNoX2RldiAqc3dfZGV2c1tUWVBFQ19NVVhfTUFYX0RFVlNdOw0KPiA+ICAgICAgIHVuc2lnbmVk
IGludCBudW1fc3dfZGV2czsNCj4gPiArDQo+ID4gKyAgICAgLyogQ291bGQgaGFuZGxlIEhpZ2hT
cGVlZCwgU3VwZXJTcGVlZCwgU2lkZWJhbmQgc3dpdGNoIG9uZSB0aW1lICovDQo+ID4gKyAgICAg
c3RydWN0IG11eF9jb250cm9sICptdXhfc3dpdGNoOw0KPiA+ICsgICAgIC8qIDMgc3RhdGUgY29y
cmVzcG9uZCB0byBOT05FLCBOT1JNQUwsIFJFVkVSU0UgZm9yIGFsbCBzd2l0Y2hlcyAqLw0KPiA+
ICsgICAgIGludCBtdXhfc3RhdGVzWzNdOw0KPiA+ICB9Ow0KPiA+DQo+ID4gIHN0YXRpYyBpbnQg
c3dpdGNoX2Z3bm9kZV9tYXRjaChzdHJ1Y3QgZGV2aWNlICpkZXYsIGNvbnN0IHZvaWQgKmZ3bm9k
ZSkNCj4gPiBAQCAtMTE3LDYgKzEyMyw1OCBAQCBzdHJ1Y3QgdHlwZWNfc3dpdGNoDQo+ICpmd25v
ZGVfdHlwZWNfc3dpdGNoX2dldChzdHJ1Y3QgZndub2RlX2hhbmRsZSAqZndub2RlKQ0KPiA+ICB9
DQo+ID4gIEVYUE9SVF9TWU1CT0xfR1BMKGZ3bm9kZV90eXBlY19zd2l0Y2hfZ2V0KTsNCj4gPg0K
PiA+ICtzdGF0aWMgc3RydWN0IHR5cGVjX3N3aXRjaCAqbXV4X2NvbnRyb2xfdHlwZWNfc3dpdGNo
X2dldChzdHJ1Y3QgZGV2aWNlDQo+ICpkZXYpDQo+ID4gK3sNCj4gPiArICAgICBzdHJ1Y3QgdHlw
ZWNfc3dpdGNoICpzdzsNCj4gPiArICAgICBzdHJ1Y3QgbXV4X2NvbnRyb2wgKm11eDsNCj4gPiAr
ICAgICBpbnQgcmV0Ow0KPiA+ICsNCj4gPiArICAgICBpZiAoIWRldmljZV9wcm9wZXJ0eV9wcmVz
ZW50KGRldiwgIm11eC1jb250cm9scyIpKQ0KPiA+ICsgICAgICAgICAgICAgcmV0dXJuIE5VTEw7
DQo+ID4gKw0KPiA+ICsgICAgIHN3ID0ga3phbGxvYyhzaXplb2YoKnN3KSwgR0ZQX0tFUk5FTCk7
DQo+ID4gKyAgICAgaWYgKCFzdykNCj4gPiArICAgICAgICAgICAgIHJldHVybiBFUlJfUFRSKC1F
Tk9NRU0pOw0KPiA+ICsNCj4gPiArICAgICBtdXggPSBtdXhfY29udHJvbF9nZXQoZGV2LCBOVUxM
KTsNCj4gPiArICAgICBpZiAoIUlTX0VSUihtdXgpKSB7DQo+ID4gKyAgICAgICAgICAgICBzdy0+
bXV4X3N3aXRjaCA9IG11eDsNCj4gPiArICAgICAgICAgICAgIHJldCA9IGRldmljZV9wcm9wZXJ0
eV9yZWFkX3UzMl9hcnJheShkZXYsDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICJ0eXBlYy1z
d2l0Y2gtc3RhdGVzIiwgc3ctPm11eF9zdGF0ZXMsIDMpOw0KPiA+ICsgICAgICAgICAgICAgaWYg
KHJldCkgew0KPiA+ICsgICAgICAgICAgICAgICAgICAgICBrZnJlZShzdyk7DQo+ID4gKyAgICAg
ICAgICAgICAgICAgICAgIHJldHVybiBFUlJfUFRSKHJldCk7DQo+ID4gKyAgICAgICAgICAgICB9
DQo+ID4gKyAgICAgfSBlbHNlIHsNCj4gPiArICAgICAgICAgICAgIGtmcmVlKHN3KTsNCj4gPiAr
ICAgICAgICAgICAgIHJldHVybiBFUlJfQ0FTVChtdXgpOw0KPiA+ICsgICAgIH0NCj4gPiArDQo+
ID4gKyAgICAgcmV0dXJuIHN3Ow0KPiA+ICt9DQo+ID4gKw0KPiA+ICsvKioNCj4gPiArICogdHlw
ZWNfc3dpdGNoX2dldCAtIEZpbmQgVVNCIFR5cGUtQyBvcmllbnRhdGlvbiBzd2l0Y2gNCj4gPiAr
ICogQGRldjogVGhlIGRldmljZSB1c2luZyBzd2l0Y2gNCj4gPiArICoNCj4gPiArICogRmluZHMg
YSBzd2l0Y2ggdXNlZCBieSBAZGV2LiBSZXR1cm5zIGEgcmVmZXJlbmNlIHRvIHRoZSBzd2l0Y2gg
b24NCj4gPiArICogc3VjY2VzcywgTlVMTCBpZiBubyBtYXRjaGluZyBjb25uZWN0aW9uIHdhcyBm
b3VuZCwgb3INCj4gPiArICogRVJSX1BUUigtRVBST0JFX0RFRkVSKSB3aGVuIGEgY29ubmVjdGlv
biB3YXMgZm91bmQgYnV0IHRoZQ0KPiBzd2l0Y2gNCj4gPiArICogaGFzIG5vdCBiZWVuIGVudW1l
cmF0ZWQgeWV0LCBvciBFUlJfUFRSIHdpdGggYSBuZWdhdGl2ZSBlcnJuby4NCj4gPiArICovDQo+
ID4gK3N0cnVjdCB0eXBlY19zd2l0Y2ggKnR5cGVjX3N3aXRjaF9nZXQoc3RydWN0IGRldmljZSAq
ZGV2KQ0KPiA+ICt7DQo+ID4gKyAgICAgc3RydWN0IHR5cGVjX3N3aXRjaCAqc3c7DQo+ID4gKw0K
PiA+ICsgICAgIHN3ID0gZndub2RlX3R5cGVjX3N3aXRjaF9nZXQoZGV2X2Z3bm9kZShkZXYpKTsN
Cj4gPiArICAgICBpZiAoIXN3KQ0KPiA+ICsgICAgICAgICAgICAgLyogVHJ5IGdldCBzd2l0Y2gg
YmFzZWQgb24gbXV4IGNvbnRyb2wgKi8NCj4gPiArICAgICAgICAgICAgIHN3ID0gbXV4X2NvbnRy
b2xfdHlwZWNfc3dpdGNoX2dldChkZXYpOw0KPiA+ICsNCj4gPiArICAgICByZXR1cm4gc3c7DQo+
ID4gK30NCj4gPiArRVhQT1JUX1NZTUJPTF9HUEwodHlwZWNfc3dpdGNoX2dldCk7DQo+ID4gKw0K
PiA+ICAvKioNCj4gPiAgICogdHlwZWNfc3dpdGNoX3B1dCAtIFJlbGVhc2UgVVNCIFR5cGUtQyBv
cmllbnRhdGlvbiBzd2l0Y2gNCj4gPiAgICogQHN3OiBVU0IgVHlwZS1DIG9yaWVudGF0aW9uIHN3
aXRjaA0KPiA+IEBAIC0xMzcsNiArMTk1LDEwIEBAIHZvaWQgdHlwZWNfc3dpdGNoX3B1dChzdHJ1
Y3QgdHlwZWNfc3dpdGNoICpzdykNCj4gPiAgICAgICAgICAgICAgIG1vZHVsZV9wdXQoc3dfZGV2
LT5kZXYucGFyZW50LT5kcml2ZXItPm93bmVyKTsNCj4gPiAgICAgICAgICAgICAgIHB1dF9kZXZp
Y2UoJnN3X2Rldi0+ZGV2KTsNCj4gPiAgICAgICB9DQo+ID4gKw0KPiA+ICsgICAgIGlmIChzdy0+
bXV4X3N3aXRjaCkNCj4gPiArICAgICAgICAgICAgIG11eF9jb250cm9sX3B1dChzdy0+bXV4X3N3
aXRjaCk7DQo+ID4gKw0KPiA+ICAgICAgIGtmcmVlKHN3KTsNCj4gPiAgfQ0KPiA+ICBFWFBPUlRf
U1lNQk9MX0dQTCh0eXBlY19zd2l0Y2hfcHV0KTsNCj4gPiBAQCAtMjA0LDYgKzI2Niw3IEBAIGlu
dCB0eXBlY19zd2l0Y2hfc2V0KHN0cnVjdCB0eXBlY19zd2l0Y2ggKnN3LA0KPiA+ICAgICAgICAg
ICAgICAgICAgICBlbnVtIHR5cGVjX29yaWVudGF0aW9uIG9yaWVudGF0aW9uKQ0KPiA+ICB7DQo+
ID4gICAgICAgc3RydWN0IHR5cGVjX3N3aXRjaF9kZXYgKnN3X2RldjsNCj4gPiArICAgICBzdHJ1
Y3QgbXV4X2NvbnRyb2wgKm11eDsNCj4gPiAgICAgICB1bnNpZ25lZCBpbnQgaTsNCj4gPiAgICAg
ICBpbnQgcmV0Ow0KPiA+DQo+ID4gQEAgLTIxOCw2ICsyODEsMTcgQEAgaW50IHR5cGVjX3N3aXRj
aF9zZXQoc3RydWN0IHR5cGVjX3N3aXRjaCAqc3csDQo+ID4gICAgICAgICAgICAgICAgICAgICAg
IHJldHVybiByZXQ7DQo+ID4gICAgICAgfQ0KPiA+DQo+ID4gKyAgICAgbXV4ID0gc3ctPm11eF9z
d2l0Y2g7DQo+ID4gKyAgICAgaWYgKG11eCkgew0KPiA+ICsgICAgICAgICAgICAgcmV0ID0gbXV4
X2NvbnRyb2xfZGVzZWxlY3QobXV4KTsNCj4gDQo+IFRoaXMgaXMgYnJva2VuLiBQbGVhc2UgcmVh
ZCB0aGUgZG9jdW1lbnRhdGlvbiBmb3IgbXV4X2NvbnRyb2xfc2VsZWN0IGFuZA0KPiBtdXhfY29u
dHJvbF9kZXNlbGVjdC4gRXZlcnkgY2FsbCB0byBtdXhfY29udHJvbF9kZXNlbGVjdCAqbXVzdCog
YmUgcGFpcmVkDQo+IHdpdGggYSAqc3VjY2Vzc2Z1bCogY2FsbCB0byBtdXhfY29udHJvbF9zZWxl
Y3QuIEhlcmUsIG11eF9jb250cm9sX2Rlc2VsZWN0DQo+IGlzIGNhbGxlZCB1bmNvbmRpdGlvbmFs
bHkgKGFzIGxvbmcgYXMgYSBtdXggaXMgY29uZmlndXJlZCkuDQoNCk9rYXksIEkgd2lsbCBpbXBy
b3ZlIGl0IGluIHYyLg0KDQo+IA0KPiBZZXMsIGFncmVlZCwgdGhhdCBpcyBpbmRlZWQgYXdrd2Fy
ZCAoYW5kIGZyYWdpbGUpLiBCdXQgdGhvc2UgYXJlIHRoZSBydWxlcy4NCj4gKHRoZSBtdXggaW50
ZXJmYWNlIHdhcyBub3QgZGVzaWduZWQgZm9yIGxvbmctdGltZSBzZWxlY3RzIGxpa2UgdGhpcykN
Cj4gDQoNClVuZGVyc3Rvb2QuIEknbGwgZm9sbG93IHRoZSBydWxlcy4gDQoNClRoYW5rcywNClh1
IFlhbmcNCg0KPiBDaGVlcnMsDQo+IFBldGVyDQo+IA0KPiA+ICsgICAgICAgICAgICAgaWYgKHJl
dCkNCj4gPiArICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIHJldDsNCj4gPiArDQo+ID4gKyAg
ICAgICAgICAgICByZXQgPSBtdXhfY29udHJvbF9zZWxlY3QobXV4LCBzdy0+bXV4X3N0YXRlc1tv
cmllbnRhdGlvbl0pOw0KPiA+ICsgICAgICAgICAgICAgaWYgKHJldCkNCj4gPiArICAgICAgICAg
ICAgICAgICAgICAgcmV0dXJuIHJldDsNCj4gPiArICAgICB9DQo+ID4gKw0KPiA+ICAgICAgIHJl
dHVybiAwOw0KPiA+ICB9DQo+ID4gIEVYUE9SVF9TWU1CT0xfR1BMKHR5cGVjX3N3aXRjaF9zZXQp
Ow0KPiA+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L3VzYi90eXBlY19tdXguaA0KPiBiL2lu
Y2x1ZGUvbGludXgvdXNiL3R5cGVjX211eC5oDQo+ID4gaW5kZXggOTI5MmYwZTA3ODQ2Li4yMjg3
ZTVhNWY1OTEgMTAwNjQ0DQo+ID4gLS0tIGEvaW5jbHVkZS9saW51eC91c2IvdHlwZWNfbXV4LmgN
Cj4gPiArKysgYi9pbmNsdWRlL2xpbnV4L3VzYi90eXBlY19tdXguaA0KPiA+IEBAIC0yNCwxNiAr
MjQsMTMgQEAgc3RydWN0IHR5cGVjX3N3aXRjaF9kZXNjIHsNCj4gPiAgICAgICB2b2lkICpkcnZk
YXRhOw0KPiA+ICB9Ow0KPiA+DQo+ID4gKw0KPiA+ICtzdHJ1Y3QgdHlwZWNfc3dpdGNoICp0eXBl
Y19zd2l0Y2hfZ2V0KHN0cnVjdCBkZXZpY2UgKmRldik7DQo+ID4gIHN0cnVjdCB0eXBlY19zd2l0
Y2ggKmZ3bm9kZV90eXBlY19zd2l0Y2hfZ2V0KHN0cnVjdCBmd25vZGVfaGFuZGxlDQo+ICpmd25v
ZGUpOw0KPiA+ICB2b2lkIHR5cGVjX3N3aXRjaF9wdXQoc3RydWN0IHR5cGVjX3N3aXRjaCAqc3cp
Ow0KPiA+ICBpbnQgdHlwZWNfc3dpdGNoX3NldChzdHJ1Y3QgdHlwZWNfc3dpdGNoICpzdywNCj4g
PiAgICAgICAgICAgICAgICAgICAgZW51bSB0eXBlY19vcmllbnRhdGlvbiBvcmllbnRhdGlvbik7
DQo+ID4NCj4gPiAtc3RhdGljIGlubGluZSBzdHJ1Y3QgdHlwZWNfc3dpdGNoICp0eXBlY19zd2l0
Y2hfZ2V0KHN0cnVjdCBkZXZpY2UgKmRldikNCj4gPiAtew0KPiA+IC0gICAgIHJldHVybiBmd25v
ZGVfdHlwZWNfc3dpdGNoX2dldChkZXZfZndub2RlKGRldikpOw0KPiA+IC19DQo+ID4gLQ0KPiA+
ICBzdHJ1Y3QgdHlwZWNfc3dpdGNoX2RldiAqDQo+ID4gIHR5cGVjX3N3aXRjaF9yZWdpc3Rlcihz
dHJ1Y3QgZGV2aWNlICpwYXJlbnQsDQo+ID4gICAgICAgICAgICAgICAgICAgICBjb25zdCBzdHJ1
Y3QgdHlwZWNfc3dpdGNoX2Rlc2MgKmRlc2MpOw0K
