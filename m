Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ACF095428A3
	for <lists+linux-usb@lfdr.de>; Wed,  8 Jun 2022 09:58:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230213AbiFHHy7 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 8 Jun 2022 03:54:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234450AbiFHHyn (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 8 Jun 2022 03:54:43 -0400
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1021A1D7852;
        Wed,  8 Jun 2022 00:23:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1654673027; x=1686209027;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=7JlieFPEyOIHku3V0JFz55+v1O+7vrREnly0CE/az48=;
  b=ru7w6987DD0XqsqWKG7JVxin9Af+60rXOkC0LY2hF6ueDGOtvf3mD5dD
   mDG91Ls0kpdp80izZkuHBB2hmTXq4GOR9f06SbI+9j+TMYGvzc33BQMy0
   o8OrwIaYBAs0bn6FecNt1aCmvszvVL6pzsz0KFlY+N0Vx7qsR8Z6hrCsk
   YJQqeyP4jvTjowJeV/JuC3BZe+ifDOZzbfFPFnbLdIbNShf9j3w4jDozv
   keHsJz+h4m+bka2Be94cMfy+lXvk3fwUWiCrJT6f+ha50hJbbWVo0ElLR
   Pg9K8QIRqWt8viiYNJDSfFVXOr74AskFOGspbbvpPd7sbMyhT8f8RnPSs
   w==;
X-IronPort-AV: E=Sophos;i="5.91,285,1647327600"; 
   d="scan'208";a="177023302"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 08 Jun 2022 00:22:04 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Wed, 8 Jun 2022 00:22:04 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17 via Frontend Transport; Wed, 8 Jun 2022 00:22:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BxwycsAL4gu1smR/x4oyDxat88nljU0WnwL9nqS7jclMH3vofSo246+O/gFzmv2P+Pl/tZnMaeyK8T5HltgHUQxG3A31Wa2JcyJw0D/AjRGCfpSBCubK/N5g9+enHibhfX3NMy1oYVggj5cV3xKqNQ2DYQrRxTSTCbh9dkILCYmeNJwnD+LI+9QUIx324Lh+NZpaIb7gc1h2uXtDJxjB406vMu2/XN3+jDJIHdgfgD4LW7l1xtB1XbtZyI824CkDYa7dOXnYDJV1XsNWCLUOCM1ux589SGjq+kTxwJyDI8iAfgviV0WIOt0qUqginOcH0n7SCslX4bhHPAN7f9+xVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7JlieFPEyOIHku3V0JFz55+v1O+7vrREnly0CE/az48=;
 b=ZbhBtA+QGh7q/4jIldwLG93kXXr4Cb+5Vhd3KLd70U61Z3zHZnR4MGf7Eu8mPYUrqEySy0LtLXRWzx/nvmTHX6RlyWtVGM9TY1Co0hFzJ9MVJ2ykQ7ck1S7GIWuDaAIrX3bcf+YRm3vmXCGnoGs5KC1Nezx4fCnpXkitYZIYdp0KOervOlr0uXA0UKL+GAD+vvsAEKCZRmu4XnfWjzzMPhprOakil6RmFOYr6sAQUZgAqpol+CAU2QX/u/u09qUwAsegFli3Tj3zQ8Hrc/25Nf7dscW+xz9XQW5zoFlpUae5A1paF1S6S4G8DuEn55MRsZe+vRroEOnBvAbgTENx4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7JlieFPEyOIHku3V0JFz55+v1O+7vrREnly0CE/az48=;
 b=UurUOWW/5xqGn9wD9pwQjwd1Iv61O6c0du5ab2F6R8uFUchJEd50kaT/x/6qRazjdK/lptiX6V4pnk9qsNJKb1tAyH8+waSsGxNjh2NY3rfabOkjWAMDSQKSXVFqT5+m3A79Dm0SCgmFgX2N3XpxzpUa5rsQ3u5mp4zJ5hkh2mU=
Received: from CY4PR11MB1960.namprd11.prod.outlook.com (2603:10b6:903:11d::21)
 by DM5PR11MB1596.namprd11.prod.outlook.com (2603:10b6:4:b::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5314.13; Wed, 8 Jun 2022 07:21:59 +0000
Received: from CY4PR11MB1960.namprd11.prod.outlook.com
 ([fe80::457f:8e4d:4bc1:b997]) by CY4PR11MB1960.namprd11.prod.outlook.com
 ([fe80::457f:8e4d:4bc1:b997%12]) with mapi id 15.20.5314.019; Wed, 8 Jun 2022
 07:21:59 +0000
From:   <Claudiu.Beznea@microchip.com>
To:     <clement.leger@bootlin.com>, <stern@rowland.harvard.edu>,
        <gregkh@linuxfoundation.org>, <Nicolas.Ferre@microchip.com>,
        <alexandre.belloni@bootlin.com>
CC:     <linux-usb@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v2] usb: host: ohci-at91: add support to enter suspend
 using SMC
Thread-Topic: [PATCH v2] usb: host: ohci-at91: add support to enter suspend
 using SMC
Thread-Index: AQHYewhwzRTJtY5GFUO2l9pU4pPtzQ==
Date:   Wed, 8 Jun 2022 07:21:59 +0000
Message-ID: <50c01ba3-39a9-1689-0b22-db78643cfc95@microchip.com>
References: <20220607133454.727063-1-clement.leger@bootlin.com>
In-Reply-To: <20220607133454.727063-1-clement.leger@bootlin.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b2d82b08-d8f3-4e0b-28ef-08da491f937c
x-ms-traffictypediagnostic: DM5PR11MB1596:EE_
x-microsoft-antispam-prvs: <DM5PR11MB15967A5A350A3BBEB829FE3287A49@DM5PR11MB1596.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: iELnCvHSnbeKpYpF02ta5X/CNCKFetoDJqouOpcU7SnfhdTdp7EhR0tp7Gn9V92Ea+yHgOfefSyt0/3H0EotC4GO4yd720pUI4oLJdornv4sgw7zJMtPq6QniLKphFhQlbTDPXEw09s3oFQPfqWvzQdfNnrCq35rxbTIPn8GAssAeM0WqFHQYED7dBIqNwZFpVvi6kBqBnilNxSAE6aKeHICOvCnMDrL97rFEiJZZgagc8NJauHbdGTq3S3Ra1lVePKYLvU08bsugdJQvknDubeA6UeLDAT7lLRKwXnAmNx07CGpJYT7emxK0Rizb/hiGmALO2C5mye1RLgF6zKwb7QiZCyGnoG37ObDLiDf5aqNH7pAC2uSVrJvv2qK0hgaptNJlca4KcI7BcqI9O+yKq+umwKEBUO3BJuDL9S0ttklYffVR2ZWzOUBXdRXMX1FFMJ/iC9XF8lWxb9H8jb2AVmg20wSfRbmfDZ0gSq6IN8I6QVsTBiGX5gMXv9XLHjpxdulpvXBClmPE4UkGjgm8kuwgPRCpiMImSJs4XzXdSblp2hq51pYeK+3ubzmrNXFPEWY5Xmmyhr0MD6O9W6Qt4xS4hyD6F6yqBMKQQ/clEcAEMOipHvFr76f1GfKa8Unu/it/mwA0W4Mt6Qg8ZY3RmZ9PNlZbfkc9IfmB41rrEofPoe3p/7ZiORwcHAyqzQOK4uGpTiqqPfwCSEeGr9uAKL32XaxrH1fBdY+KeX7UBYvjniylP4GaaFX/5HWnSFEDShxtqvszrUCtu/SrmSFTw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY4PR11MB1960.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(38100700002)(66476007)(66446008)(8676002)(64756008)(5660300002)(508600001)(6486002)(31696002)(91956017)(76116006)(86362001)(36756003)(66556008)(122000001)(31686004)(83380400001)(2616005)(71200400001)(15650500001)(4326008)(66946007)(8936002)(66574015)(2906002)(53546011)(186003)(6506007)(26005)(6512007)(54906003)(316002)(110136005)(38070700005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?b1M1S2EyUFllTzI1OGlKNnlFN1pqd0ZMU0NmcWtjdEtmS1VMVldvV3JTWWtY?=
 =?utf-8?B?U2NZUXhZeXduelcybVN4Y010TUhDMVhXWlJxbEdjR2g0SDczUnZnQm1kT0VR?=
 =?utf-8?B?YmhNVXNVU2htcG9aRmZHL1RUNFQ3SDBMb003NTd0VXg1bytZT3Vta09kOTFk?=
 =?utf-8?B?NHdxcjFtbE9PYXJxK2RTVGJZU3ZtRVE5UkxUdmpFdGpTb2xlTzFUaU1GT1Ri?=
 =?utf-8?B?WGFCRkVZSENQM0k5Nkp6bGYvREVaSFR1UzVUOHoyaCtKd01ZNEVwYklnMWl4?=
 =?utf-8?B?NnJiSlQvczJseURIUTZBTnlZdG8xUGRUc1VGSllEWTZ4dWpNSm1Ra21admx3?=
 =?utf-8?B?cTIwT25tOGtRU3FIVTVBU1JWWU01OUw3UDhMNVlQNTJtODlWdHZMYU1LQXQx?=
 =?utf-8?B?QkdtUnFHQXQ1bG5mWUZQVjNFYlhzSGt4UlBzME9ITENSVVhuYWsyVVA2dDN3?=
 =?utf-8?B?THFVZjdpb2FGNSt5YU0zeTl6enBHNHViZkFFQ3VBay9jNTJycGk5MjFWL0ta?=
 =?utf-8?B?bm9ma1pCOEZoMmhTSzRZYTNmL29lenRLSHlqUUFPTHhlKzFoNnR1YlZVNkpy?=
 =?utf-8?B?VGI5S1p0THVIR01BRXRNM0xWUGE0ZVpoclYrRXJzRUtYNDhVSEl1cG5KZjdy?=
 =?utf-8?B?eUVYRkFKRnZmZDhrc0pZdnVUVnI1Sm4vaEdhK2RKTU5TNk1HUkFvTkRUc2U0?=
 =?utf-8?B?Y3pKdkZYMlkrUVV3bWhROERSdHBtY2tIWXFYMWZNdVFPODFwQjJXVmg5UnNi?=
 =?utf-8?B?Tko3VjA5TWJFRXlNSTlvazlkbGJKMEZjV2lIcUsvWEx6Y2RUMnJ3cXlENGh4?=
 =?utf-8?B?Vk44L2tGUHBGOWlBbFBsR3lCWm1FVVZzQUI4S2lBaUtmK1hoVnhtWFp0bEFx?=
 =?utf-8?B?a3dWWDdqYVEzN2NHQTdhZjIxQ2l6TkNNL1RoV3ZvbkhjMjJ1MVlnMWsrdWlF?=
 =?utf-8?B?ZTJxeVN1WlhUZEFsb2tqL3dhaUFwZzAzMTlqbmJ2RVVxcWhFQlNKK1lUVXEx?=
 =?utf-8?B?bnFyNVlDOGtsUVFQN21vOHRFclFKS0J5d2d1Nk5Cb3Vjd1hmTFRnWjN6OEJM?=
 =?utf-8?B?RTNuUjVVMEg2TEZrOWV3VTlBandNNGlORVlHSVh6V2o4U3VCK3BhTmtLbHdv?=
 =?utf-8?B?NUJyVXZzbkZwNElZYUtvaWhrT3FsWWxYY0V2OTdvbk05b3BBRHhnV0JUMmpI?=
 =?utf-8?B?WHQ1dUtBT2JVZGdaNVExMmdEalhtd3Btb2lPdkFkdUhZeEpOZmM3VFd5bWlq?=
 =?utf-8?B?azdVNjVhbE1zSmdwdjU1K0UxZDZNaStucEh4elhEVXc5SFRIMkFaN0l0bmVD?=
 =?utf-8?B?dWx3d0ErSCtOZEJVSk5lajJTZ3FYMmlzd1d0bUg3T3RhWlJScFoyYnhDL2R1?=
 =?utf-8?B?Q0pIOUZhV2tqSHF2QXR6THdRS1hzRHNRWWVwb0JqcWk5TTdSZUpNeWJ1Smpu?=
 =?utf-8?B?VEZvMC9iblNUL3h1UklhOGJRdW5uQnJqSHl3cTdmQnRWcXJkNGRvci9NZEFp?=
 =?utf-8?B?V3Vld2VPdlVYZGVreWFhempaOThRclJiL096ekpPSHFTWHRBVGd6Q1lPcmZs?=
 =?utf-8?B?c2h3TlV2VFdIMzR0UnJiY2lVN2NXZ05Zd0lFZ1RVbmxKVVArZ0hTWjQ3bWZE?=
 =?utf-8?B?bVVZbGZtUnV6Y2lPeDI5T0dhRlIzakFZSTJYL3pyLzRWK0t6QkplblNWNkRD?=
 =?utf-8?B?SjNqelg1amhCVDdnWUZZcUdtdzBDRlFQZk13anpvakxIWmpSRFYraEUraUdC?=
 =?utf-8?B?S0J3VVQrVGIzajZVTmN0NmdsQ3pnVGUzUm84aEJrTEF2eWhPc1k0WHFIWWtx?=
 =?utf-8?B?NERVM2NUY1M3a1JtQkMwQmdqcGJhK0RyaVREVjdFUXl4b1pKcTErRmlVQUwv?=
 =?utf-8?B?dHBUUjJOaHgvcFdoa2k4MUhzU0diS2QyK1dXRFY3dnBheExOdHlVZ0N4TXEy?=
 =?utf-8?B?SFIrNnVaQ1pTYnlwVDVmRUFSbEJOak9vVGVLUTVwSWh6Y0E1dmk2eVdoN0pH?=
 =?utf-8?B?YTVzY1dwYmRXdUJCajkvYzVkRmM3Z2ZNY3dkZ09NaHhUbmIxL1pZdjJ2R0ti?=
 =?utf-8?B?WmxoMG9jUjRETWtubXdTTUdESTdUVzZSUjIyQ0RDYzVDa2JxT1ZnYXhCRit4?=
 =?utf-8?B?bFRWWEk0blRrRnlGVVRNeDRFcGdnTm8zVHdwY0x0eUZsNUk1ekhrUVBDVlhi?=
 =?utf-8?B?STk0QmRST0RnMG1Ea042SklMT2FkTkJiY0JKQW5tK1Jka2dZREJqK1BXZnpj?=
 =?utf-8?B?U1hXYjB5blFnOHhLQWpWNndZQ1lIVGtIYkRVMFM5NjE5bjVQb2NSekt3SXlQ?=
 =?utf-8?B?cnM2dVIxN3MyRjdXMjFXdFYzS3p6MW5WcXg4ajRuOENYSHMwTWdVZzV1R1ZL?=
 =?utf-8?Q?Kzej7GQFmythGTX0=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <43366E0EB2D1C0408FCBCDCF37855866@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY4PR11MB1960.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b2d82b08-d8f3-4e0b-28ef-08da491f937c
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jun 2022 07:21:59.3391
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gdnEYnezApr1Hn3p5P37n0Sgg/hw/GCfLnfB+VgyDFlrOXHzbfqnQ1D3zK12TTi2z2tCiQ6P9egrHBwMZObQYp/90UiUTJWpKz9ilU7ow18=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1596
X-Spam-Status: No, score=-5.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

T24gMDcuMDYuMjAyMiAxNjozNCwgQ2zDqW1lbnQgTMOpZ2VyIHdyb3RlOg0KPiBFWFRFUk5BTCBF
TUFJTDogRG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW5sZXNzIHlvdSBr
bm93IHRoZSBjb250ZW50IGlzIHNhZmUNCj4gDQo+IFdoZW4gTGludXggaXMgcnVubmluZyB1bmRl
ciBPUC1URUUsIHRoZSBTRlIgaXMgc2V0IGFzIHNlY3VyZWQgYW5kIHRodXMNCj4gdGhlIEFUOTFf
T0hDSUlDUl9VU0JfU1VTUEVORCByZWdpc3RlciBpc24ndCBhY2Nlc3NpYmxlLiBBZGQgYSBTTUMg
dG8NCj4gZG8gdGhlIGFwcHJvcHJpYXRlIGNhbGwgdG8gc3VzcGVuZCB0aGUgY29udHJvbGxlci4N
Cj4gVGhlIFNNQyBpZCBpcyBmZXRjaGVkIGZyb20gdGhlIGRldmljZS10cmVlIHByb3BlcnR5DQo+
ICJtaWNyb2NoaXAsc3VzcGVuZC1zbWMtaWQiLiBpZiBwcmVzZW50LCB0aGVuIHRoZSBzeXNjb24g
cmVnbWFwIGlzIG5vdA0KPiB1c2VkIHRvIGVudGVyIHN1c3BlbmQgYW5kIGEgU01DIGlzIGlzc3Vl
ZC4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IENsw6ltZW50IEzDqWdlciA8Y2xlbWVudC5sZWdlckBi
b290bGluLmNvbT4NCg0KUmV2aWV3ZWQtYnk6IENsYXVkaXUgQmV6bmVhIDxjbGF1ZGl1LmJlem5l
YUBtaWNyb2NoaXAuY29tPg0KDQoNCj4gLS0tDQo+IA0KPiBOb3RlczoNCj4gICAgIENoYW5nZXMg
aW4gVjI6DQo+ICAgICAgLSBDaGFuZ2UgY2hlY2sgb3JkZXIgaW4gb2hjaV9hdDkxX3BvcnRfc3Vz
cGVuZCgpDQo+ICAgICAgLSBSZW5hbWVkIHNtY19pZCB0byBzdXNwZW5kX3NtY19pZCBmb3IgY2xh
cml0eQ0KPiANCj4gIGRyaXZlcnMvdXNiL2hvc3Qvb2hjaS1hdDkxLmMgfCA2OSArKysrKysrKysr
KysrKysrKysrKysrKystLS0tLS0tLS0tLS0NCj4gIDEgZmlsZSBjaGFuZ2VkLCA0NiBpbnNlcnRp
b25zKCspLCAyMyBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3VzYi9o
b3N0L29oY2ktYXQ5MS5jIGIvZHJpdmVycy91c2IvaG9zdC9vaGNpLWF0OTEuYw0KPiBpbmRleCBh
MjRhZWEzZDI3NTkuLjk4MzI2NDY1ZTJkYyAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy91c2IvaG9z
dC9vaGNpLWF0OTEuYw0KPiArKysgYi9kcml2ZXJzL3VzYi9ob3N0L29oY2ktYXQ5MS5jDQo+IEBA
IC0xMyw2ICsxMyw3IEBADQo+ICAgKiBUaGlzIGZpbGUgaXMgbGljZW5jZWQgdW5kZXIgdGhlIEdQ
TC4NCj4gICAqLw0KPiANCj4gKyNpbmNsdWRlIDxsaW51eC9hcm0tc21jY2MuaD4NCj4gICNpbmNs
dWRlIDxsaW51eC9jbGsuaD4NCj4gICNpbmNsdWRlIDxsaW51eC9kbWEtbWFwcGluZy5oPg0KPiAg
I2luY2x1ZGUgPGxpbnV4L2dwaW8vY29uc3VtZXIuaD4NCj4gQEAgLTU1LDYgKzU2LDcgQEAgc3Ry
dWN0IG9oY2lfYXQ5MV9wcml2IHsNCj4gICAgICAgICBib29sIGNsb2NrZWQ7DQo+ICAgICAgICAg
Ym9vbCB3YWtldXA7ICAgICAgICAgICAgLyogU2F2ZWQgd2FrZS11cCBzdGF0ZSBmb3IgcmVzdW1l
ICovDQo+ICAgICAgICAgc3RydWN0IHJlZ21hcCAqc2ZyX3JlZ21hcDsNCj4gKyAgICAgICB1MzIg
c3VzcGVuZF9zbWNfaWQ7DQo+ICB9Ow0KPiAgLyogaW50ZXJmYWNlIGFuZCBmdW5jdGlvbiBjbG9j
a3M7IHNvbWV0aW1lcyBhbHNvIGFuIEFIQiBjbG9jayAqLw0KPiANCj4gQEAgLTEzNSw2ICsxMzcs
MTkgQEAgc3RhdGljIHZvaWQgYXQ5MV9zdG9wX2hjKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBk
ZXYpDQo+IA0KPiAgc3RhdGljIHZvaWQgdXNiX2hjZF9hdDkxX3JlbW92ZSAoc3RydWN0IHVzYl9o
Y2QgKiwgc3RydWN0IHBsYXRmb3JtX2RldmljZSAqKTsNCj4gDQo+ICtzdGF0aWMgdTMyIGF0OTFf
ZHRfc3VzcGVuZF9zbWMoc3RydWN0IGRldmljZSAqZGV2KQ0KPiArew0KPiArICAgICAgIHUzMiBz
dXNwZW5kX3NtY19pZDsNCj4gKw0KPiArICAgICAgIGlmICghZGV2LT5vZl9ub2RlKQ0KPiArICAg
ICAgICAgICAgICAgcmV0dXJuIDA7DQo+ICsNCj4gKyAgICAgICBpZiAob2ZfcHJvcGVydHlfcmVh
ZF91MzIoZGV2LT5vZl9ub2RlLCAibWljcm9jaGlwLHN1c3BlbmQtc21jLWlkIiwgJnN1c3BlbmRf
c21jX2lkKSkNCj4gKyAgICAgICAgICAgICAgIHJldHVybiAwOw0KPiArDQo+ICsgICAgICAgcmV0
dXJuIHN1c3BlbmRfc21jX2lkOw0KPiArfQ0KPiArDQo+ICBzdGF0aWMgc3RydWN0IHJlZ21hcCAq
YXQ5MV9kdF9zeXNjb25fc2ZyKHZvaWQpDQo+ICB7DQo+ICAgICAgICAgc3RydWN0IHJlZ21hcCAq
cmVnbWFwOw0KPiBAQCAtMjE1LDkgKzIzMCwxMyBAQCBzdGF0aWMgaW50IHVzYl9oY2RfYXQ5MV9w
cm9iZShjb25zdCBzdHJ1Y3QgaGNfZHJpdmVyICpkcml2ZXIsDQo+ICAgICAgICAgICAgICAgICBn
b3RvIGVycjsNCj4gICAgICAgICB9DQo+IA0KPiAtICAgICAgIG9oY2lfYXQ5MS0+c2ZyX3JlZ21h
cCA9IGF0OTFfZHRfc3lzY29uX3NmcigpOw0KPiAtICAgICAgIGlmICghb2hjaV9hdDkxLT5zZnJf
cmVnbWFwKQ0KPiAtICAgICAgICAgICAgICAgZGV2X2RiZyhkZXYsICJmYWlsZWQgdG8gZmluZCBz
ZnIgbm9kZVxuIik7DQo+ICsgICAgICAgb2hjaV9hdDkxLT5zdXNwZW5kX3NtY19pZCA9IGF0OTFf
ZHRfc3VzcGVuZF9zbWMoZGV2KTsNCj4gKyAgICAgICBpZiAoIW9oY2lfYXQ5MS0+c3VzcGVuZF9z
bWNfaWQpICB7DQo+ICsgICAgICAgICAgICAgICBkZXZfZGJnKGRldiwgImZhaWxlZCB0byBmaW5k
IHNmciBzdXNwZW5kIHNtYyBpZCwgdXNpbmcgcmVnbWFwXG4iKTsNCj4gKyAgICAgICAgICAgICAg
IG9oY2lfYXQ5MS0+c2ZyX3JlZ21hcCA9IGF0OTFfZHRfc3lzY29uX3NmcigpOw0KPiArICAgICAg
ICAgICAgICAgaWYgKCFvaGNpX2F0OTEtPnNmcl9yZWdtYXApDQo+ICsgICAgICAgICAgICAgICAg
ICAgICAgIGRldl9kYmcoZGV2LCAiZmFpbGVkIHRvIGZpbmQgc2ZyIG5vZGVcbiIpOw0KPiArICAg
ICAgIH0NCj4gDQo+ICAgICAgICAgYm9hcmQgPSBoY2QtPnNlbGYuY29udHJvbGxlci0+cGxhdGZv
cm1fZGF0YTsNCj4gICAgICAgICBvaGNpID0gaGNkX3RvX29oY2koaGNkKTsNCj4gQEAgLTMwMywy
NCArMzIyLDMwIEBAIHN0YXRpYyBpbnQgb2hjaV9hdDkxX2h1Yl9zdGF0dXNfZGF0YShzdHJ1Y3Qg
dXNiX2hjZCAqaGNkLCBjaGFyICpidWYpDQo+ICAgICAgICAgcmV0dXJuIGxlbmd0aDsNCj4gIH0N
Cj4gDQo+IC1zdGF0aWMgaW50IG9oY2lfYXQ5MV9wb3J0X3N1c3BlbmQoc3RydWN0IHJlZ21hcCAq
cmVnbWFwLCB1OCBzZXQpDQo+ICtzdGF0aWMgaW50IG9oY2lfYXQ5MV9wb3J0X3N1c3BlbmQoc3Ry
dWN0IG9oY2lfYXQ5MV9wcml2ICpvaGNpX2F0OTEsIHU4IHNldCkNCj4gIHsNCj4gKyAgICAgICBz
dHJ1Y3QgcmVnbWFwICpyZWdtYXAgPSBvaGNpX2F0OTEtPnNmcl9yZWdtYXA7DQo+ICAgICAgICAg
dTMyIHJlZ3ZhbDsNCj4gICAgICAgICBpbnQgcmV0Ow0KPiANCj4gLSAgICAgICBpZiAoIXJlZ21h
cCkNCj4gLSAgICAgICAgICAgICAgIHJldHVybiAwOw0KPiArICAgICAgIGlmIChvaGNpX2F0OTEt
PnN1c3BlbmRfc21jX2lkKSB7DQo+ICsgICAgICAgICAgICAgICBzdHJ1Y3QgYXJtX3NtY2NjX3Jl
cyByZXM7DQo+IA0KPiAtICAgICAgIHJldCA9IHJlZ21hcF9yZWFkKHJlZ21hcCwgQVQ5MV9TRlJf
T0hDSUlDUiwgJnJlZ3ZhbCk7DQo+IC0gICAgICAgaWYgKHJldCkNCj4gLSAgICAgICAgICAgICAg
IHJldHVybiByZXQ7DQo+ICsgICAgICAgICAgICAgICBhcm1fc21jY2Nfc21jKG9oY2lfYXQ5MS0+
c3VzcGVuZF9zbWNfaWQsIHNldCwgMCwgMCwgMCwgMCwgMCwgMCwgJnJlcyk7DQo+ICsgICAgICAg
ICAgICAgICBpZiAocmVzLmEwKQ0KPiArICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4gLUVJ
TlZBTDsNCj4gKyAgICAgICB9IGVsc2UgaWYgKHJlZ21hcCkgew0KPiArICAgICAgICAgICAgICAg
cmV0ID0gcmVnbWFwX3JlYWQocmVnbWFwLCBBVDkxX1NGUl9PSENJSUNSLCAmcmVndmFsKTsNCj4g
KyAgICAgICAgICAgICAgIGlmIChyZXQpDQo+ICsgICAgICAgICAgICAgICAgICAgICAgIHJldHVy
biByZXQ7DQo+IA0KPiAtICAgICAgIGlmIChzZXQpDQo+IC0gICAgICAgICAgICAgICByZWd2YWwg
fD0gQVQ5MV9PSENJSUNSX1VTQl9TVVNQRU5EOw0KPiAtICAgICAgIGVsc2UNCj4gLSAgICAgICAg
ICAgICAgIHJlZ3ZhbCAmPSB+QVQ5MV9PSENJSUNSX1VTQl9TVVNQRU5EOw0KPiArICAgICAgICAg
ICAgICAgaWYgKHNldCkNCj4gKyAgICAgICAgICAgICAgICAgICAgICAgcmVndmFsIHw9IEFUOTFf
T0hDSUlDUl9VU0JfU1VTUEVORDsNCj4gKyAgICAgICAgICAgICAgIGVsc2UNCj4gKyAgICAgICAg
ICAgICAgICAgICAgICAgcmVndmFsICY9IH5BVDkxX09IQ0lJQ1JfVVNCX1NVU1BFTkQ7DQo+IA0K
PiAtICAgICAgIHJlZ21hcF93cml0ZShyZWdtYXAsIEFUOTFfU0ZSX09IQ0lJQ1IsIHJlZ3ZhbCk7
DQo+ICsgICAgICAgICAgICAgICByZWdtYXBfd3JpdGUocmVnbWFwLCBBVDkxX1NGUl9PSENJSUNS
LCByZWd2YWwpOw0KPiArICAgICAgIH0NCj4gDQo+ICAgICAgICAgcmV0dXJuIDA7DQo+ICB9DQo+
IEBAIC0zNTcsOSArMzgyLDggQEAgc3RhdGljIGludCBvaGNpX2F0OTFfaHViX2NvbnRyb2woc3Ry
dWN0IHVzYl9oY2QgKmhjZCwgdTE2IHR5cGVSZXEsIHUxNiB3VmFsdWUsDQo+IA0KPiAgICAgICAg
ICAgICAgICAgY2FzZSBVU0JfUE9SVF9GRUFUX1NVU1BFTkQ6DQo+ICAgICAgICAgICAgICAgICAg
ICAgICAgIGRldl9kYmcoaGNkLT5zZWxmLmNvbnRyb2xsZXIsICJTZXRQb3J0RmVhdDogU1VTUEVO
RFxuIik7DQo+IC0gICAgICAgICAgICAgICAgICAgICAgIGlmICh2YWxpZF9wb3J0KHdJbmRleCkg
JiYgb2hjaV9hdDkxLT5zZnJfcmVnbWFwKSB7DQo+IC0gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgb2hjaV9hdDkxX3BvcnRfc3VzcGVuZChvaGNpX2F0OTEtPnNmcl9yZWdtYXAsDQo+IC0g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAxKTsN
Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgaWYgKHZhbGlkX3BvcnQod0luZGV4KSkgew0KPiAr
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIG9oY2lfYXQ5MV9wb3J0X3N1c3BlbmQob2hj
aV9hdDkxLCAxKTsNCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4gMDsN
Cj4gICAgICAgICAgICAgICAgICAgICAgICAgfQ0KPiAgICAgICAgICAgICAgICAgICAgICAgICBi
cmVhazsNCj4gQEAgLTQwMCw5ICs0MjQsOCBAQCBzdGF0aWMgaW50IG9oY2lfYXQ5MV9odWJfY29u
dHJvbChzdHJ1Y3QgdXNiX2hjZCAqaGNkLCB1MTYgdHlwZVJlcSwgdTE2IHdWYWx1ZSwNCj4gDQo+
ICAgICAgICAgICAgICAgICBjYXNlIFVTQl9QT1JUX0ZFQVRfU1VTUEVORDoNCj4gICAgICAgICAg
ICAgICAgICAgICAgICAgZGV2X2RiZyhoY2QtPnNlbGYuY29udHJvbGxlciwgIkNsZWFyUG9ydEZl
YXR1cmU6IFNVU1BFTkRcbiIpOw0KPiAtICAgICAgICAgICAgICAgICAgICAgICBpZiAodmFsaWRf
cG9ydCh3SW5kZXgpICYmIG9oY2lfYXQ5MS0+c2ZyX3JlZ21hcCkgew0KPiAtICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIG9oY2lfYXQ5MV9wb3J0X3N1c3BlbmQob2hjaV9hdDkxLT5zZnJf
cmVnbWFwLA0KPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgMCk7DQo+ICsgICAgICAgICAgICAgICAgICAgICAgIGlmICh2YWxpZF9wb3J0KHdJ
bmRleCkpIHsNCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBvaGNpX2F0OTFfcG9y
dF9zdXNwZW5kKG9oY2lfYXQ5MSwgMCk7DQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgcmV0dXJuIDA7DQo+ICAgICAgICAgICAgICAgICAgICAgICAgIH0NCj4gICAgICAgICAgICAg
ICAgICAgICAgICAgYnJlYWs7DQo+IEBAIC02MzAsMTAgKzY1MywxMCBAQCBvaGNpX2hjZF9hdDkx
X2Rydl9zdXNwZW5kKHN0cnVjdCBkZXZpY2UgKmRldikNCj4gICAgICAgICAgICAgICAgIC8qIGZs
dXNoIHRoZSB3cml0ZXMgKi8NCj4gICAgICAgICAgICAgICAgICh2b2lkKSBvaGNpX3JlYWRsIChv
aGNpLCAmb2hjaS0+cmVncy0+Y29udHJvbCk7DQo+ICAgICAgICAgICAgICAgICBtc2xlZXAoMSk7
DQo+IC0gICAgICAgICAgICAgICBvaGNpX2F0OTFfcG9ydF9zdXNwZW5kKG9oY2lfYXQ5MS0+c2Zy
X3JlZ21hcCwgMSk7DQo+ICsgICAgICAgICAgICAgICBvaGNpX2F0OTFfcG9ydF9zdXNwZW5kKG9o
Y2lfYXQ5MSwgMSk7DQo+ICAgICAgICAgICAgICAgICBhdDkxX3N0b3BfY2xvY2sob2hjaV9hdDkx
KTsNCj4gICAgICAgICB9IGVsc2Ugew0KPiAtICAgICAgICAgICAgICAgb2hjaV9hdDkxX3BvcnRf
c3VzcGVuZChvaGNpX2F0OTEtPnNmcl9yZWdtYXAsIDEpOw0KPiArICAgICAgICAgICAgICAgb2hj
aV9hdDkxX3BvcnRfc3VzcGVuZChvaGNpX2F0OTEsIDEpOw0KPiAgICAgICAgIH0NCj4gDQo+ICAg
ICAgICAgcmV0dXJuIHJldDsNCj4gQEAgLTY0NSw3ICs2NjgsNyBAQCBvaGNpX2hjZF9hdDkxX2Ry
dl9yZXN1bWUoc3RydWN0IGRldmljZSAqZGV2KQ0KPiAgICAgICAgIHN0cnVjdCB1c2JfaGNkICAq
aGNkID0gZGV2X2dldF9kcnZkYXRhKGRldik7DQo+ICAgICAgICAgc3RydWN0IG9oY2lfYXQ5MV9w
cml2ICpvaGNpX2F0OTEgPSBoY2RfdG9fb2hjaV9hdDkxX3ByaXYoaGNkKTsNCj4gDQo+IC0gICAg
ICAgb2hjaV9hdDkxX3BvcnRfc3VzcGVuZChvaGNpX2F0OTEtPnNmcl9yZWdtYXAsIDApOw0KPiAr
ICAgICAgIG9oY2lfYXQ5MV9wb3J0X3N1c3BlbmQob2hjaV9hdDkxLCAwKTsNCj4gDQo+ICAgICAg
ICAgaWYgKG9oY2lfYXQ5MS0+d2FrZXVwKQ0KPiAgICAgICAgICAgICAgICAgZGlzYWJsZV9pcnFf
d2FrZShoY2QtPmlycSk7DQo+IC0tDQo+IDIuMzYuMQ0KPiANCg0K
