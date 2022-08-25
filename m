Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6027F5A0CD2
	for <lists+linux-usb@lfdr.de>; Thu, 25 Aug 2022 11:40:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234323AbiHYJki (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 25 Aug 2022 05:40:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44470 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239339AbiHYJkX (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 25 Aug 2022 05:40:23 -0400
Received: from EUR02-VE1-obe.outbound.protection.outlook.com (mail-eopbgr20069.outbound.protection.outlook.com [40.107.2.69])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D961752451;
        Thu, 25 Aug 2022 02:40:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lkNX8aITQGeAC3pTe3Gp6ml/+yTDTGjgreDpjg4dfcDakRZrB72ng5Zh3G3slOrak2Yfy/yyLaWmzigWBlKoVovdoP2XXKWqupSQL1Wr+Z2aW1FzTRITAAiCYx0+P3hXaDqqYcbVI3aUTe90JH5SAju1NHK0e4DU8Dg9oVPL0rZxP+9RKlkEIVX8C3jHPU3qpEs5J6gFZzg8Ob1UI3VzhW6DS3XoQLDCdYSsCFLhPJJJ3O4W3kjpwCQ140iVq+qVQArhO3sUEHoWNtvoy+oe5Zw7aiRZwJNQHbAN1FDYVGQEzVF5tQElECD9g9NDJYl+VGoS6TLmfl+eBa8WQU3TEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VhRkddj9AcXiCUJhMHkQCFwxOidsd0yiIqoDZsBHUAE=;
 b=X0BJup2/LUeVJAC8DlbrvkkAtS1zXTLbXTwaAgSl8qHgc8wCg4WcgOeYsG2Ke3WkKtL4DfkTDY/UsU8dQZ7rQb5q0TPzQHHa8Mxejsk+WBsAu3md6Ugoj6i6nSId2YjrmEEQjaWocD8GuWFhdCFAPF+9wPOSg/p22Dn9LT2mxCnwNOxGt3BBDUsQDshg7+WYNazMKiVyfovI/ZxjodM0xh4+OvuWFnrX8UjRyZGXMvBuhfxGB5Aajw6oy4J5ESh8kBy6XCmjCpA7RuQVvvFTgdDkQkjU/OeYrkmbQ++WExOrv3IRpS5Dj+YnOF39EeVpI5gPY/WoSJftOOhM3loslQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VhRkddj9AcXiCUJhMHkQCFwxOidsd0yiIqoDZsBHUAE=;
 b=L8tEJlYjPXPCHilAS99i0015djtj/jd3lyHkPHy11GtuYUsJ3d85+fE0BG+SQMH23MGuA9odHiXTgnr797+bS+DSRonH4nFyJtaOABylGREfhbm2vrYUxJCMklYgy4fazNdCTPm24fDoQj3OUm9TjDIP3dhr52jq+RroeESpedI=
Received: from PAXPR04MB8784.eurprd04.prod.outlook.com (2603:10a6:102:20f::23)
 by AS8PR04MB9511.eurprd04.prod.outlook.com (2603:10a6:20b:44b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Thu, 25 Aug
 2022 09:40:16 +0000
Received: from PAXPR04MB8784.eurprd04.prod.outlook.com
 ([fe80::d1c7:f1db:fabc:dc57]) by PAXPR04MB8784.eurprd04.prod.outlook.com
 ([fe80::d1c7:f1db:fabc:dc57%7]) with mapi id 15.20.5566.015; Thu, 25 Aug 2022
 09:40:16 +0000
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
Subject: RE: [EXT] Re: [PATCH v2 2/4] mux: convert to use fwnode interface
Thread-Topic: [EXT] Re: [PATCH v2 2/4] mux: convert to use fwnode interface
Thread-Index: AQHYtubvDrjFMVzAD0iGTp0d/kEiia2/WHyAgAAGhvA=
Date:   Thu, 25 Aug 2022 09:40:16 +0000
Message-ID: <PAXPR04MB8784271BCFBE694BF600F6528C729@PAXPR04MB8784.eurprd04.prod.outlook.com>
References: <20220823195429.1243516-1-xu.yang_2@nxp.com>
 <20220823195429.1243516-3-xu.yang_2@nxp.com>
 <65e4928c-79ec-5dd4-022d-364898c65ccb@axentia.se>
In-Reply-To: <65e4928c-79ec-5dd4-022d-364898c65ccb@axentia.se>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1d11fe5d-080d-430f-5daa-08da867dd15c
x-ms-traffictypediagnostic: AS8PR04MB9511:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +ohMmGNGEQiNmXQrwDP9dRpteegNMd2+8igqDsQEceqdvNRnnaoy/srPRS8KICEmAoXEaIoudUXW/+R53NsSFDNecOoIE9+ooUN5hBIWTHLwvyrrAe0ayX2ZJRYEvQqeYh2t3xkaXGLvlM9R2igf9P20SLZykJVADj+5/1PletAFh1ADaodez0A/aN2KqQ921D6t0aAznzL+pvAjSQNxHLlKILtYEmj0IJyKUFZtxi8o3EH54Cn5IFk1v3tcKXepW5s9YcK9C8n2jq+cegEfSfVDgSSc2ZINP/FDUffJGiMMil3t8Xl79tmUM+xVN03T7wrMobmeSYEQ7/r4rB/pKLwSZ3OHEKKEe8wmKQzveMXNxzU2QJAeTLSSDguaPMEVV34STEgSrRolBZmspevAjClYQmGeYJjEt1BUMorImm4QpN7lKAa6+5JhAT7SWPyxx6xMrWziW2SYJ1lZnadzPMz3xBzoNvNXIJ1qebLotLfBlYZqTsWEIo3KZxTRHMjXh6QCN7WoXq0vw3kJsiZmbyp65LOEi4NvWn2gHZWMrldHCK0zzSdWZP3I2aMQabH/r6toQ6Sgzcp0B0kJqwX7oqNrInTtNitdfyj7r588BHfdByoENHNcsImKDUFlDYXvz7oWJrGrIFYZBgEl+x3eSfBtZ/NeS+w9bu4X8p18MCq9VPGMW1dwyHSOZB6/3zEEVnxau1aLVFeuQWK6NOYeSxwLQ0vLr0PkFqW2XILfpz5nbjplX+108aFNyRXVneKCq2rj3iC/V7qvl/tpQFL1zQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8784.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(376002)(346002)(396003)(39860400002)(366004)(122000001)(38070700005)(86362001)(38100700002)(4326008)(186003)(76116006)(66556008)(66946007)(64756008)(66476007)(83380400001)(66446008)(8676002)(52536014)(33656002)(316002)(8936002)(5660300002)(41300700001)(478600001)(71200400001)(53546011)(2906002)(7696005)(54906003)(26005)(6506007)(55016003)(110136005)(9686003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YnkyZ3ptZTNoL2dMY0krV1Z1bXBjSElwakJySWN2SERrL3JmTUhkUWRsMFRM?=
 =?utf-8?B?ZmUyTWhBV0R0Z1N4MS9jcXlyVVovTTdRYzBKTUg2eXc3aHN0UTYvdkpJUGJM?=
 =?utf-8?B?dGhvK240RDN1ZEF4Z1A0NjRBdzY1bzBoUXNZMms3WHRBU3Rzc0pGbnVzRGJu?=
 =?utf-8?B?Y3pSTUpnSjB3RlliQ21aeUZZRFdJcUV6S1phbDI3NHByMThOeFhYNHBxR0My?=
 =?utf-8?B?YStwdDhOYlFmN0pPRnBtYWM4UDZXWGx4ajhzemkxMUIveGFCSmFXNVg4SzIx?=
 =?utf-8?B?L3NFNHQzSCtjVGZCRlhnZmtuQkpwM0N6bzJnNlE2UjkxMExnb1RVWU8rWk9F?=
 =?utf-8?B?d1NBN0JIZ0E4SmRCY1dubHQ2VzUwdWJJKzRzWG5ucGlVRXBRWk5IVXErOUt2?=
 =?utf-8?B?M2RoWTNQTW1jWlF5a1A1Z3RRUEpzOGx1eHZIRE1sWWxoSkM5NzI1WGw4cUhn?=
 =?utf-8?B?dksyNUMxeC9RMlJ5YXlvM2ErNHVYOW1HRGNnSEZFVXdvSU5zTmZBY0crMGxI?=
 =?utf-8?B?amFYUFlPclpIZy9IREJxanVoZFNaZzQvZnZiYk5VdWdmM0lsOGdzcmFIM3FB?=
 =?utf-8?B?bHVkZkxkQXRZdnNhN28xSnpvbWpmOEtwRXYzeTNxNjhuTWE0OHNQNURiL2pO?=
 =?utf-8?B?RDUxbGt3aTBFUVNib0lyNWJGMU5GUy9MNk5YczNvZzRoNVExRG1QVXNKREwr?=
 =?utf-8?B?eFdDTGRRc081V2REUUdwKzNoRWIySkxrSFhkUHdqT0NxZjEyWUNQcTBDcjRO?=
 =?utf-8?B?OE5jWGNUL0ZtWi9LRW5renhPbjg1NVRKY25VZFZuN2hWS1ZpMHM0WnhqOUVw?=
 =?utf-8?B?R1cwRkZqcE5CRUZJZUx4TXJmb1F5NFFwZWhqcDdWR0tMTDE4dDY4WGlMZEk0?=
 =?utf-8?B?UzJFbm1DY1kyUHBwclhrei85WU54MXFOaGZ5M29aWUQ3L0w0Y29JbXJCc09I?=
 =?utf-8?B?Q0gwVDh3ajZXWGUxdmZIazVZMDBRU2F2WThjWmFNRGpYM2lYeCt4ZTNXZW40?=
 =?utf-8?B?MGxuN0VDZkRLYXN1UVBoaEk3eExNNWU1NzRqbUN0OFl0dzdTdG5tTFRQaHlL?=
 =?utf-8?B?QzJEaWdKaStYdmtxWk9hd0RjVWpWYmg0NVd3UU5QbkN1MytCSWc4bWVOSXJW?=
 =?utf-8?B?SkFKczl5d0o0MWRVTFE5TjJZNHI5eDFRWTVicU1DY3BURVpDSTI5N1UvZW1Y?=
 =?utf-8?B?K2RUSHo1aTZlQnlrNnZEaTZuY0I0NjErcXBjSGk2K3BlQUpYMktacm1uQWU0?=
 =?utf-8?B?cVpRc25NalpaK21BdndoRS9FSGh3dTc0WGtWbFBlM2JYUXdUTTNrdTN6K2pj?=
 =?utf-8?B?djZkekpKNlBGQUVsaFNoSEI2UDN0c2ZsSVBEekpMcDl6N0lnS1BldU1HcTYw?=
 =?utf-8?B?Z0NiQzcxZHYweWdQc2FPbjBJSUxiL09wZnJsajJhT2d3aXhCRTZzWE5ubDkv?=
 =?utf-8?B?blltaGJpWkNUTURtU1BlOTFxV0Fta2FPMW4yajVnTGNGZGFZeDFCTFBmTlQy?=
 =?utf-8?B?WUZqL080T0hGNjZhTHBUY3VKbFVTWlZQazVRbWtyTitCNXZ1cFh6UHZuT0du?=
 =?utf-8?B?TGRsbUtiWHE2NWpTR2NCRE8wb3Ryb1BBNUFhTmlsdDlUcGtDalduaVFGYjRs?=
 =?utf-8?B?cGtReUc2U1hFTGRsSDg0TkZXalRvZEdvVzVGSmpaeitrckhCRGxsUmhxRUZ4?=
 =?utf-8?B?amtEbEJmemV5OHN0OVplUmtHalJ2QUhkd25uWTZwYlVIYXZMZWZzR0dSUHov?=
 =?utf-8?B?Q0dHSVlhZW9PQkt5TUx0bXFYb1FUY3VXYnB3bzRpSkxEdUJ3SFJRcW5KMXZw?=
 =?utf-8?B?OXp5NmNrRXJGczIrZEFrRCtBUFJGKzBwQjZkckcxcWRGaUtKME9xUjhncVFL?=
 =?utf-8?B?Mk90WGNPYk91TVBabnhTV0ZMR28wQkVQVWtGaW04N2QyUG1XYXNFSk1vaVFu?=
 =?utf-8?B?MXJZVXdWQkNqOGYwV2FDOEJzU1BDeFhISytJM3NIalAwTkJHRThlVmtPNDE5?=
 =?utf-8?B?SEdSc3g4Z0lTUU1hU2dlbWVBMGNkblNpemlPUnNQdHJLU1gyRDN1UDRGWnJs?=
 =?utf-8?B?S1BteDZKYkRSamRwcUlXdk5sODhMYkhDYmhhWmR4ZElhTFFrS3BTNEpJc3JB?=
 =?utf-8?Q?hWHU=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8784.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d11fe5d-080d-430f-5daa-08da867dd15c
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Aug 2022 09:40:16.7403
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: T6KNKlhPRjbi4Bi0dbWqq61bo16r+BUo3a9ptuFsTowwl9ODZAvbw6zO0nZgYDYdlPJisamTMCzaLZe+WOPTLw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9511
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

SGkgUGV0ZXIsDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUGV0ZXIg
Um9zaW4gPHBlZGFAYXhlbnRpYS5zZT4NCj4gU2VudDogVGh1cnNkYXksIEF1Z3VzdCAyNSwgMjAy
MiA1OjE1IFBNDQo+IFRvOiBYdSBZYW5nIDx4dS55YW5nXzJAbnhwLmNvbT47IGhlaWtraS5rcm9n
ZXJ1c0BsaW51eC5pbnRlbC5jb207IHJvYmgrZHRAa2VybmVsLm9yZzsgc2hhd25ndW9Aa2VybmVs
Lm9yZw0KPiBDYzogZ3JlZ2toQGxpbnV4Zm91bmRhdGlvbi5vcmc7IGxpbnV4QHJvZWNrLXVzLm5l
dDsgSnVuIExpIDxqdW4ubGlAbnhwLmNvbT47IGxpbnV4LXVzYkB2Z2VyLmtlcm5lbC5vcmc7IGRs
LWxpbnV4LWlteA0KPiA8bGludXgtaW14QG54cC5jb20+OyBkZXZpY2V0cmVlQHZnZXIua2VybmVs
Lm9yZzsgbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnDQo+IFN1YmplY3Q6IFtF
WFRdIFJlOiBbUEFUQ0ggdjIgMi80XSBtdXg6IGNvbnZlcnQgdG8gdXNlIGZ3bm9kZSBpbnRlcmZh
Y2UNCj4gDQo+IENhdXRpb246IEVYVCBFbWFpbA0KPiANCj4gSGkhDQo+IA0KPiBNdWNoIGJldHRl
ciwgb25lIHNtYWxsIHRoaW5nIHRob3VnaC4uLg0KPiANCj4gMjAyMi0wOC0yMyBhdCAyMTo1NCwg
WHUgWWFuZyB3cm90ZToNCj4gPiBBcyBmaXJtd2FyZSBub2RlIGlzIGEgbW9yZSBjb21tb24gYWJz
dHJhY3QsIHRoaXMgd2lsbCBjb252ZXJ0IHRoZSB3aG9sZQ0KPiA+IHRoaW5nIHRvIGZ3bm9kZSBp
bnRlcmZhY2UuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBYdSBZYW5nIDx4dS55YW5nXzJAbnhw
LmNvbT4NCj4gPg0KPiA+IC0tLQ0KPiA+IENoYW5nZXMgc2luY2UgdjE6DQo+ID4gLSBjb252ZXJ0
IHRvIHVzZSBmd25vZGUgaW50ZXJmYWNlDQo+ID4NCj4gPiAgZHJpdmVycy9tdXgvY29yZS5jIHwg
NjUgKysrKysrKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KPiA+ICAx
IGZpbGUgY2hhbmdlZCwgMzMgaW5zZXJ0aW9ucygrKSwgMzIgZGVsZXRpb25zKC0pDQo+ID4NCj4g
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdXgvY29yZS5jIGIvZHJpdmVycy9tdXgvY29yZS5jDQo+
ID4gaW5kZXggNDliZWRiZTYzMTZjLi5lMzBlODU5ZWZkMzMgMTAwNjQ0DQo+ID4gLS0tIGEvZHJp
dmVycy9tdXgvY29yZS5jDQo+ID4gKysrIGIvZHJpdmVycy9tdXgvY29yZS5jDQo+ID4gQEAgLTE4
LDggKzE4LDcgQEANCj4gPiAgI2luY2x1ZGUgPGxpbnV4L21vZHVsZS5oPg0KPiA+ICAjaW5jbHVk
ZSA8bGludXgvbXV4L2NvbnN1bWVyLmg+DQo+ID4gICNpbmNsdWRlIDxsaW51eC9tdXgvZHJpdmVy
Lmg+DQo+ID4gLSNpbmNsdWRlIDxsaW51eC9vZi5oPg0KPiA+IC0jaW5jbHVkZSA8bGludXgvb2Zf
cGxhdGZvcm0uaD4NCj4gPiArI2luY2x1ZGUgPGxpbnV4L3Byb3BlcnR5Lmg+DQo+ID4gICNpbmNs
dWRlIDxsaW51eC9zbGFiLmg+DQo+ID4NCj4gPiAgLyoNCj4gPiBAQCAtNTEwLDExICs1MDksMTEg
QEAgaW50IG11eF9zdGF0ZV9kZXNlbGVjdChzdHJ1Y3QgbXV4X3N0YXRlICptc3RhdGUpDQo+ID4g
IEVYUE9SVF9TWU1CT0xfR1BMKG11eF9zdGF0ZV9kZXNlbGVjdCk7DQo+ID4NCj4gPiAgLyogTm90
ZSB0aGlzIGZ1bmN0aW9uIHJldHVybnMgYSByZWZlcmVuY2UgdG8gdGhlIG11eF9jaGlwIGRldi4g
Ki8NCj4gPiAtc3RhdGljIHN0cnVjdCBtdXhfY2hpcCAqb2ZfZmluZF9tdXhfY2hpcF9ieV9ub2Rl
KHN0cnVjdCBkZXZpY2Vfbm9kZSAqbnApDQo+ID4gK3N0YXRpYyBzdHJ1Y3QgbXV4X2NoaXAgKm9m
X2ZpbmRfbXV4X2NoaXBfYnlfbm9kZShzdHJ1Y3QgZndub2RlX2hhbmRsZSAqZndub2RlKQ0KPiAN
Cj4gUGxlYXNlIHJlbmFtZSB0aGlzIGZ1bmN0aW9uIHRvIG11eF9jaGlwX2ZpbmRfYnlfZndub2Rl
KCkNCj4gDQoNClRoYW5rcyBmb3IgeW91ciByZXZpZXcuIA0KV2lsbCBjaGFuZ2UgaXQgaW4gbmV4
dCB2ZXJzaW9uLg0KDQpCZXN0IFJlZ2FyZHMsDQpYdSBZYW5nDQoNCj4gQ2hlZXJzLA0KPiBQZXRl
cg0KPiANCj4gPiAgew0KPiA+ICAgICAgIHN0cnVjdCBkZXZpY2UgKmRldjsNCj4gPg0KPiA+IC0g
ICAgIGRldiA9IGNsYXNzX2ZpbmRfZGV2aWNlX2J5X29mX25vZGUoJm11eF9jbGFzcywgbnApOw0K
PiA+ICsgICAgIGRldiA9IGNsYXNzX2ZpbmRfZGV2aWNlX2J5X2Z3bm9kZSgmbXV4X2NsYXNzLCBm
d25vZGUpOw0KPiA+DQo+ID4gICAgICAgcmV0dXJuIGRldiA/IHRvX211eF9jaGlwKGRldikgOiBO
VUxMOw0KPiA+ICB9DQo+ID4gQEAgLTUzMSw4ICs1MzAsOCBAQCBzdGF0aWMgc3RydWN0IG11eF9j
aGlwICpvZl9maW5kX211eF9jaGlwX2J5X25vZGUoc3RydWN0IGRldmljZV9ub2RlICpucCkNCj4g
PiAgc3RhdGljIHN0cnVjdCBtdXhfY29udHJvbCAqbXV4X2dldChzdHJ1Y3QgZGV2aWNlICpkZXYs
IGNvbnN0IGNoYXIgKm11eF9uYW1lLA0KPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHVuc2lnbmVkIGludCAqc3RhdGUpDQo+ID4gIHsNCj4gPiAtICAgICBzdHJ1Y3QgZGV2aWNl
X25vZGUgKm5wID0gZGV2LT5vZl9ub2RlOw0KPiA+IC0gICAgIHN0cnVjdCBvZl9waGFuZGxlX2Fy
Z3MgYXJnczsNCj4gPiArICAgICBzdHJ1Y3QgZndub2RlX2hhbmRsZSAqZndub2RlID0gZGV2X2Z3
bm9kZShkZXYpOw0KPiA+ICsgICAgIHN0cnVjdCBmd25vZGVfcmVmZXJlbmNlX2FyZ3MgYXJnczsN
Cj4gPiAgICAgICBzdHJ1Y3QgbXV4X2NoaXAgKm11eF9jaGlwOw0KPiA+ICAgICAgIHVuc2lnbmVk
IGludCBjb250cm9sbGVyOw0KPiA+ICAgICAgIGludCBpbmRleCA9IDA7DQo+ID4gQEAgLTU0MCwx
MSArNTM5LDExIEBAIHN0YXRpYyBzdHJ1Y3QgbXV4X2NvbnRyb2wgKm11eF9nZXQoc3RydWN0IGRl
dmljZSAqZGV2LCBjb25zdCBjaGFyICptdXhfbmFtZSwNCj4gPg0KPiA+ICAgICAgIGlmIChtdXhf
bmFtZSkgew0KPiA+ICAgICAgICAgICAgICAgaWYgKHN0YXRlKQ0KPiA+IC0gICAgICAgICAgICAg
ICAgICAgICBpbmRleCA9IG9mX3Byb3BlcnR5X21hdGNoX3N0cmluZyhucCwgIm11eC1zdGF0ZS1u
YW1lcyIsDQo+ID4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIG11eF9uYW1lKTsNCj4gPiArICAgICAgICAgICAgICAgICAgICAgaW5kZXggPSBm
d25vZGVfcHJvcGVydHlfbWF0Y2hfc3RyaW5nKGZ3bm9kZSwNCj4gPiArICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICJtdXgtc3RhdGUtbmFtZXMiLCBtdXhfbmFtZSk7DQo+ID4g
ICAgICAgICAgICAgICBlbHNlDQo+ID4gLSAgICAgICAgICAgICAgICAgICAgIGluZGV4ID0gb2Zf
cHJvcGVydHlfbWF0Y2hfc3RyaW5nKG5wLCAibXV4LWNvbnRyb2wtbmFtZXMiLA0KPiA+IC0gICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBtdXhfbmFt
ZSk7DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgIGluZGV4ID0gZndub2RlX3Byb3BlcnR5X21h
dGNoX3N0cmluZyhmd25vZGUsDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAibXV4LWNvbnRyb2wtbmFtZXMiLCBtdXhfbmFtZSk7DQo+ID4gICAgICAgICAgICAgICBp
ZiAoaW5kZXggPCAwKSB7DQo+ID4gICAgICAgICAgICAgICAgICAgICAgIGRldl9lcnIoZGV2LCAi
bXV4IGNvbnRyb2xsZXIgJyVzJyBub3QgZm91bmRcbiIsDQo+ID4gICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgbXV4X25hbWUpOw0KPiA+IEBAIC01NTMsMzUgKzU1MiwzNyBAQCBzdGF0aWMg
c3RydWN0IG11eF9jb250cm9sICptdXhfZ2V0KHN0cnVjdCBkZXZpY2UgKmRldiwgY29uc3QgY2hh
ciAqbXV4X25hbWUsDQo+ID4gICAgICAgfQ0KPiA+DQo+ID4gICAgICAgaWYgKHN0YXRlKQ0KPiA+
IC0gICAgICAgICAgICAgcmV0ID0gb2ZfcGFyc2VfcGhhbmRsZV93aXRoX2FyZ3MobnAsDQo+ID4g
LSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAibXV4LXN0YXRl
cyIsICIjbXV4LXN0YXRlLWNlbGxzIiwNCj4gPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIGluZGV4LCAmYXJncyk7DQo+ID4gKyAgICAgICAgICAgICByZXQg
PSBmd25vZGVfcHJvcGVydHlfZ2V0X3JlZmVyZW5jZV9hcmdzKGZ3bm9kZSwNCj4gPiArICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICJtdXgtc3RhdGVzIiwgIiNtdXgtc3RhdGUt
Y2VsbHMiLA0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgMCwgaW5k
ZXgsICZhcmdzKTsNCj4gPiAgICAgICBlbHNlDQo+ID4gLSAgICAgICAgICAgICByZXQgPSBvZl9w
YXJzZV9waGFuZGxlX3dpdGhfYXJncyhucCwNCj4gPiAtICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICJtdXgtY29udHJvbHMiLCAiI211eC1jb250cm9sLWNlbGxz
IiwNCj4gPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGlu
ZGV4LCAmYXJncyk7DQo+ID4gKyAgICAgICAgICAgICByZXQgPSBmd25vZGVfcHJvcGVydHlfZ2V0
X3JlZmVyZW5jZV9hcmdzKGZ3bm9kZSwNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICJtdXgtY29udHJvbHMiLCAiI211eC1jb250cm9sLWNlbGxzIiwNCj4gPiArICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDAsIGluZGV4LCAmYXJncyk7DQo+ID4g
Kw0KPiA+ICAgICAgIGlmIChyZXQpIHsNCj4gPiAtICAgICAgICAgICAgIGRldl9lcnIoZGV2LCAi
JXBPRjogZmFpbGVkIHRvIGdldCBtdXgtJXMgJXMoJWkpXG4iLA0KPiA+IC0gICAgICAgICAgICAg
ICAgICAgICBucCwgc3RhdGUgPyAic3RhdGUiIDogImNvbnRyb2wiLCBtdXhfbmFtZSA/OiAiIiwg
aW5kZXgpOw0KPiA+ICsgICAgICAgICAgICAgZGV2X2VycihkZXYsICIlcGZ3OiBmYWlsZWQgdG8g
Z2V0IG11eC0lcyAlcyglaSlcbiIsDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgIGZ3bm9kZSwg
c3RhdGUgPyAic3RhdGUiIDogImNvbnRyb2wiLCBtdXhfbmFtZSA/OiAiIiwNCj4gPiArICAgICAg
ICAgICAgICAgICAgICAgaW5kZXgpOw0KPiA+ICAgICAgICAgICAgICAgcmV0dXJuIEVSUl9QVFIo
cmV0KTsNCj4gPiAgICAgICB9DQo+ID4NCj4gPiAtICAgICBtdXhfY2hpcCA9IG9mX2ZpbmRfbXV4
X2NoaXBfYnlfbm9kZShhcmdzLm5wKTsNCj4gPiAtICAgICBvZl9ub2RlX3B1dChhcmdzLm5wKTsN
Cj4gPiArICAgICBtdXhfY2hpcCA9IG9mX2ZpbmRfbXV4X2NoaXBfYnlfbm9kZShhcmdzLmZ3bm9k
ZSk7DQo+ID4gKyAgICAgZndub2RlX2hhbmRsZV9wdXQoYXJncy5md25vZGUpOw0KPiA+ICAgICAg
IGlmICghbXV4X2NoaXApDQo+ID4gICAgICAgICAgICAgICByZXR1cm4gRVJSX1BUUigtRVBST0JF
X0RFRkVSKTsNCj4gPg0KPiA+ICAgICAgIGNvbnRyb2xsZXIgPSAwOw0KPiA+ICAgICAgIGlmIChz
dGF0ZSkgew0KPiA+IC0gICAgICAgICAgICAgaWYgKGFyZ3MuYXJnc19jb3VudCA+IDIgfHwgYXJn
cy5hcmdzX2NvdW50ID09IDAgfHwNCj4gPiAtICAgICAgICAgICAgICAgICAoYXJncy5hcmdzX2Nv
dW50IDwgMiAmJiBtdXhfY2hpcC0+Y29udHJvbGxlcnMgPiAxKSkgew0KPiA+IC0gICAgICAgICAg
ICAgICAgICAgICBkZXZfZXJyKGRldiwgIiVwT0Y6IHdyb25nICNtdXgtc3RhdGUtY2VsbHMgZm9y
ICVwT0ZcbiIsDQo+ID4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgbnAsIGFyZ3MubnAp
Ow0KPiA+ICsgICAgICAgICAgICAgaWYgKGFyZ3MubmFyZ3MgPiAyIHx8IGFyZ3MubmFyZ3MgPT0g
MCB8fA0KPiA+ICsgICAgICAgICAgICAgICAgIChhcmdzLm5hcmdzIDwgMiAmJiBtdXhfY2hpcC0+
Y29udHJvbGxlcnMgPiAxKSkgew0KPiA+ICsgICAgICAgICAgICAgICAgICAgICBkZXZfZXJyKGRl
diwgIiVwZnc6IHdyb25nICNtdXgtc3RhdGUtY2VsbHMgZm9yICVwZndcbiIsDQo+ID4gKyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgZndub2RlLCBhcmdzLmZ3bm9kZSk7DQo+ID4gICAgICAg
ICAgICAgICAgICAgICAgIHB1dF9kZXZpY2UoJm11eF9jaGlwLT5kZXYpOw0KPiA+ICAgICAgICAg
ICAgICAgICAgICAgICByZXR1cm4gRVJSX1BUUigtRUlOVkFMKTsNCj4gPiAgICAgICAgICAgICAg
IH0NCj4gPg0KPiA+IC0gICAgICAgICAgICAgaWYgKGFyZ3MuYXJnc19jb3VudCA9PSAyKSB7DQo+
ID4gKyAgICAgICAgICAgICBpZiAoYXJncy5uYXJncyA9PSAyKSB7DQo+ID4gICAgICAgICAgICAg
ICAgICAgICAgIGNvbnRyb2xsZXIgPSBhcmdzLmFyZ3NbMF07DQo+ID4gICAgICAgICAgICAgICAg
ICAgICAgICpzdGF0ZSA9IGFyZ3MuYXJnc1sxXTsNCj4gPiAgICAgICAgICAgICAgIH0gZWxzZSB7
DQo+ID4gQEAgLTU4OSwyMSArNTkwLDIxIEBAIHN0YXRpYyBzdHJ1Y3QgbXV4X2NvbnRyb2wgKm11
eF9nZXQoc3RydWN0IGRldmljZSAqZGV2LCBjb25zdCBjaGFyICptdXhfbmFtZSwNCj4gPiAgICAg
ICAgICAgICAgIH0NCj4gPg0KPiA+ICAgICAgIH0gZWxzZSB7DQo+ID4gLSAgICAgICAgICAgICBp
ZiAoYXJncy5hcmdzX2NvdW50ID4gMSB8fA0KPiA+IC0gICAgICAgICAgICAgICAgICghYXJncy5h
cmdzX2NvdW50ICYmIG11eF9jaGlwLT5jb250cm9sbGVycyA+IDEpKSB7DQo+ID4gLSAgICAgICAg
ICAgICAgICAgICAgIGRldl9lcnIoZGV2LCAiJXBPRjogd3JvbmcgI211eC1jb250cm9sLWNlbGxz
IGZvciAlcE9GXG4iLA0KPiA+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgIG5wLCBhcmdz
Lm5wKTsNCj4gPiArICAgICAgICAgICAgIGlmIChhcmdzLm5hcmdzID4gMSB8fA0KPiA+ICsgICAg
ICAgICAgICAgICAgICghYXJncy5uYXJncyAmJiBtdXhfY2hpcC0+Y29udHJvbGxlcnMgPiAxKSkg
ew0KPiA+ICsgICAgICAgICAgICAgICAgICAgICBkZXZfZXJyKGRldiwgIiVwZnc6IHdyb25nICNt
dXgtY29udHJvbC1jZWxscyBmb3IgJXBmd1xuIiwNCj4gPiArICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBmd25vZGUsIGFyZ3MuZndub2RlKTsNCj4gPiAgICAgICAgICAgICAgICAgICAgICAg
cHV0X2RldmljZSgmbXV4X2NoaXAtPmRldik7DQo+ID4gICAgICAgICAgICAgICAgICAgICAgIHJl
dHVybiBFUlJfUFRSKC1FSU5WQUwpOw0KPiA+ICAgICAgICAgICAgICAgfQ0KPiA+DQo+ID4gLSAg
ICAgICAgICAgICBpZiAoYXJncy5hcmdzX2NvdW50KQ0KPiA+ICsgICAgICAgICAgICAgaWYgKGFy
Z3MubmFyZ3MpDQo+ID4gICAgICAgICAgICAgICAgICAgICAgIGNvbnRyb2xsZXIgPSBhcmdzLmFy
Z3NbMF07DQo+ID4gICAgICAgfQ0KPiA+DQo+ID4gICAgICAgaWYgKGNvbnRyb2xsZXIgPj0gbXV4
X2NoaXAtPmNvbnRyb2xsZXJzKSB7DQo+ID4gLSAgICAgICAgICAgICBkZXZfZXJyKGRldiwgIiVw
T0Y6IGJhZCBtdXggY29udHJvbGxlciAldSBzcGVjaWZpZWQgaW4gJXBPRlxuIiwNCj4gPiAtICAg
ICAgICAgICAgICAgICAgICAgbnAsIGNvbnRyb2xsZXIsIGFyZ3MubnApOw0KPiA+ICsgICAgICAg
ICAgICAgZGV2X2VycihkZXYsICIlcGZ3OiBiYWQgbXV4IGNvbnRyb2xsZXIgJXUgc3BlY2lmaWVk
IGluICVwZndcbiIsDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgIGZ3bm9kZSwgY29udHJvbGxl
ciwgYXJncy5md25vZGUpOw0KPiA+ICAgICAgICAgICAgICAgcHV0X2RldmljZSgmbXV4X2NoaXAt
PmRldik7DQo+ID4gICAgICAgICAgICAgICByZXR1cm4gRVJSX1BUUigtRUlOVkFMKTsNCj4gPiAg
ICAgICB9DQo=
