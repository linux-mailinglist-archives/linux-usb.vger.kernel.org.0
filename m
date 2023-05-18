Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C0FDE7079F6
	for <lists+linux-usb@lfdr.de>; Thu, 18 May 2023 07:57:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230025AbjERF5h (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 18 May 2023 01:57:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229530AbjERF5g (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 18 May 2023 01:57:36 -0400
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9CBB11999
        for <linux-usb@vger.kernel.org>; Wed, 17 May 2023 22:57:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1684389455; x=1715925455;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=xVOf5zCvii80hXi1WAANXkEZKkm0NJKZrGCCvCkOxFE=;
  b=MxlQ27fnfibLgNsG58HJptTuNISwFYReGhJL6vH2XR8o2ftO2GrCAKyt
   qId+MsxlEqP0YfVztJfnBZvF1L7a1fu3v9n/EOFD9iwKs2SZ/Xft/fFi6
   WRQ8LSm8MJsojvqczwAKsCXpizZmfdwvHStzNZnEH0ZWXcOUCe4FdBsjz
   j70bvChDrnB6rc30Qh0tSDxm10ryYgRIa8zV6HcImjUuGPUkwhfkA9ZDI
   pOkntKBjGudNzWZxLXssalOeS7fk40k609PCipxCtyTRg+lUOuu4C1Ft0
   FV8AfwRm3TTH1aNbRqP+WFAcNj1DT9DP2aEou4wwqvV6gkj83TXQ/8MoZ
   g==;
X-IronPort-AV: E=Sophos;i="5.99,284,1677567600"; 
   d="scan'208";a="152686401"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 17 May 2023 22:57:32 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 17 May 2023 22:57:31 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Wed, 17 May 2023 22:57:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dGl7LbX4bbAa2tTAbrRF7g8X0eNo8SLDlX1pMM368Ge4dwrfAATEcnKA8gwiezOMUon2MTDL1kfLSdQdm+KsLJj/7FmHr8DKhamk/riuu8LLg4NLY377D+7AAXa+v5HP3PULGk+e9dh+w0/nU4nKNW/MfY97+FFR8TvbzzZ6gLu7Czm/sbvrnCvGj8fdbpqdl7wcwbaCsqrKaazPDt4pERqIW2Ujoy4lmtQwXLXhzKWqlPPvazzD/bCZpTvUaY1QbRyLgMNUR0VVWeuha+OaOiRh/wU0JT9fDxEPlg2pgx/w3BoCLY1bBOm/GUkgFIwBTw4ldAKtkoXFT1tCOLH1Fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xVOf5zCvii80hXi1WAANXkEZKkm0NJKZrGCCvCkOxFE=;
 b=DOlJ8F5aD6LX4IzLzVkbsC84i3frJRFdogUNzsucTTW70CISGdloWIMc8enFfo1S7UoXgAPEN8aOYrRJOpW+n3b8OwqVkbfTKvsePpwoJP0P5vutkYQXnzin8APS8XKm/c0BzHjH8+iHWT4IujQlcbtK1WNVHzY93qJ+vtBSGdg2e/X1szQ4vfQTCsGku3BtZ/2girVWpwBuGAcPx+YRdKhDt4Xtfcqtt8Rt23TwFKB80v0063IQ6gPddtGPX5ViDMithzNwE3rp1jD1PZCMx665l16r6IDsFT9Y0jfRqZelslC8YZJKx+pLaXLNE5GsVwjPY6vN4MyOLbFpaBQFsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xVOf5zCvii80hXi1WAANXkEZKkm0NJKZrGCCvCkOxFE=;
 b=OqPXap4CGu5zkNubFLKViuckHonZwaAKbzgrRw+BqXfCoJ4E3FCCTEkYjdDn3IVZ4qXs0j7A7EIjA51NKQu6WV92E2ep+r/FRFQ9vIlTmb3/DfCKLGnSVcF8M+Bn0KqFHuSrnzd/XTAdOvkT1WP0uj8FTfC4TA5p5cjQhK/a1ig=
Received: from SJ2PR11MB7648.namprd11.prod.outlook.com (2603:10b6:a03:4c3::17)
 by MW4PR11MB7029.namprd11.prod.outlook.com (2603:10b6:303:22e::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.33; Thu, 18 May
 2023 05:57:29 +0000
Received: from SJ2PR11MB7648.namprd11.prod.outlook.com
 ([fe80::27bf:a69f:806f:67be]) by SJ2PR11MB7648.namprd11.prod.outlook.com
 ([fe80::27bf:a69f:806f:67be%5]) with mapi id 15.20.6411.019; Thu, 18 May 2023
 05:57:29 +0000
From:   <Claudiu.Beznea@microchip.com>
To:     <u.kleine-koenig@pengutronix.de>, <stern@rowland.harvard.edu>,
        <gregkh@linuxfoundation.org>, <Nicolas.Ferre@microchip.com>,
        <alexandre.belloni@bootlin.com>
CC:     <linux-usb@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <kernel@pengutronix.de>
Subject: Re: [PATCH 45/97] usb: ehci-atmel: Convert to platform remove
 callback returning void
Thread-Topic: [PATCH 45/97] usb: ehci-atmel: Convert to platform remove
 callback returning void
Thread-Index: AQHZiU2hz2Ikbuza/0yMZC/a4JPLTA==
Date:   Thu, 18 May 2023 05:57:29 +0000
Message-ID: <1e1063bd-5b68-52b5-8e1d-b61ee3aacb40@microchip.com>
References: <20230517230239.187727-1-u.kleine-koenig@pengutronix.de>
 <20230517230239.187727-46-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20230517230239.187727-46-u.kleine-koenig@pengutronix.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ2PR11MB7648:EE_|MW4PR11MB7029:EE_
x-ms-office365-filtering-correlation-id: a2b2e041-de92-48a1-ba98-08db5764c3aa
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: NqpHekLxH5sTcoCrfnwHkoBcwfrWs1Q6+ki/n+GXzabV+j5iqgI0w4Zbqv52MXgVZNnxIZPSuuI1Gshq0JIy7777s8CVYsUkLH//Gzwc9402S3lhjqzpwLKTnX5RPp/m7o3LEmvNmIsL4t5GheQj0ovmTTrSSRTnw1IcDVRhlvMDo8tVOMC2g24/8s7q+VrKF+excZljcXpXILxqfRNw+1E3X5tVOnS+gtj6HT//yn5mmyeqQ2YbyJvom/R1zC/FtMO7Zpa2StKA7/NibTo9RryqRVTWCkZug/sUxqNUYXnZQSl8UP6vNeOEAstetrRBzqvRAp1X9cH/WU/PbwlB3ZCQUuJY9zPXUV0B4RphtJSyrA8aV7nVO/MIYv3QXeu8GwHcW2/v2AA5qr8mbobrAsjuqYCKgTD6kuRV/ZP4+4szkZStCv1OzEH4CfJQ7aXcz8KyiJw0z+saB889A58l1yHB6463UEFjOko5fPkNk0oqRxTnXklwLBcJGsugNcWPHV3w+hSNFktdMhbZs40BZUHsCZ5VLsQznRxF1f2GXHrgxcs7UGqCH9F4t5VpWEplGNXqGJOnpvvqU6o0Xxc2/YH4bj44xkXsl824uOp2e1gEEkE30X134tylwMErYUdKbzJPFCcDDWhmsxWxORhl88cZNl8yh/WvExmGWCjYksRia/hHy8rGJ46+xp++U86e
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7648.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(396003)(136003)(39860400002)(346002)(376002)(451199021)(2906002)(91956017)(41300700001)(54906003)(31696002)(86362001)(110136005)(71200400001)(478600001)(76116006)(4326008)(8676002)(64756008)(66946007)(66476007)(66446008)(31686004)(316002)(8936002)(5660300002)(66556008)(186003)(38070700005)(6486002)(6512007)(38100700002)(26005)(6506007)(122000001)(53546011)(83380400001)(66574015)(2616005)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZVk3Rkl0RmRQT3BkUUViSHl0cGo0NEJFRFIyUUN1NWhkazhMR1ZKdkxUeHF3?=
 =?utf-8?B?NUU2K2NwNUQ0QzQwcXVkNkZmUDBadG1rNkRqazVubDM4NHJPNEN0SDE0dDhx?=
 =?utf-8?B?QWNySjljTEtTS0tqNldGMlFHaDhqNjc5MDIwakE1QTdUdDNGOG1WM2plbWN4?=
 =?utf-8?B?citrYzFPNG5ycTJ4S3VlYWNKZDZZTlYzYUYzTHVRNVZhYlU3cW0yQURzWUFT?=
 =?utf-8?B?eDdIdTBRamNJZjFjWE00emtvdGZSSDRZSnN6anRUSEhyL20wWDFpM25xWFhN?=
 =?utf-8?B?U0dZaHNsQ0NRaW1WYmpjd0tpUThFNGZLaEdyWEd1SFZTbG9YNXRlVC9PRmov?=
 =?utf-8?B?L0RzbjF4bnl6SGM0YXVrekVsRnhZdmhFSW5jVVRyVExaZDRrdm9SSHlocEJ0?=
 =?utf-8?B?M0dxc0dmWHZWaXFkMHlXdzJjN29jUGVURlZUYmNKU29nZzh3cW0zVFpRTnlQ?=
 =?utf-8?B?WXcxdlEvSmdoalh0cDFlRHRKVm1OT0pXYm1MTDZKdGFzZUU4RmdmbWJFQmJ4?=
 =?utf-8?B?eVlzZ0tVU21FYWFjcUxtUlZySkxndEI1RkhyU2pLZDdxWUc1L1F0dU96L21X?=
 =?utf-8?B?QWlxSU9IaFphbUZIeCtyeXc1WFV5VktzYlB1WHpkVjBzRXVzaXhxUFhUd0NL?=
 =?utf-8?B?MklCMmZSME5MSFBlLytxLzR2Y3pIWXNsQ2JuQnhhcUp1WkZXaXI2MHpGaUw1?=
 =?utf-8?B?ZnRLelBMY256eUQ3OEl0bEx3SkhaZzBuM3pvRStnenVLZDVHL3RaLzErZXFJ?=
 =?utf-8?B?YWVsNG52c3hLWFc1Rm42RHhyZkRyMk0yeFRoaTdtd3hXMEUrSkhSUjNYMUZK?=
 =?utf-8?B?NWNUVlIzbjBib2s2K0JFaHlSMmhnVUZXNXdvUytCU3NHOTR4QlBXMks0SWo5?=
 =?utf-8?B?eEJ5amF6U0g0K3ZaVjM1Vjl6Tnd0Ym5OUExtOTRqcVF3U0xENlRIalRja1JU?=
 =?utf-8?B?STVOSEg3TDcrS2JZK0VpbDVGUTNMTXlpVm1PWXpsWGg2NC9UNTVEejdia2RF?=
 =?utf-8?B?WkpSMHF5QURvZjlwSUlabkJVU3o0cE9ycGtSenNqalRJVnU3c2V4bnBsTEtS?=
 =?utf-8?B?b0RIWGJwc2FYaDBuSWFHQU56SWxFU0NLWWxZUGFMMWdDYkdacHVFTldlTk81?=
 =?utf-8?B?TzU3M1l2TG1ocnRiUzYwU0JJWGpWeTZMV21DSnR6RnQxSmtGQ1JUOHdYWmI5?=
 =?utf-8?B?ZU9tZS8rU1lHQWV2NWE2UWxiS2JBcndscFpZclNtbmxUQjlmYzVrMmVhNDlx?=
 =?utf-8?B?MysyK0Z6NllTdEpSbk1IR29oRkJTdFl1M2hNalZKeDRiZS9mZ2tGa2lpbmFj?=
 =?utf-8?B?dEgyYUFTVzNQcEdPKzUzTVI3V0wwM3VCSlpjVTlPckVvRzkzU0VjUEJJV09R?=
 =?utf-8?B?NDJpbUVTZEFvV0dSY2JIYlJoRDIrT29ieWI2QnVSN01IRGNsamt1NGd0cVhX?=
 =?utf-8?B?RklwOWtkMTVBaTZYbDZ2cGNkUlNub2NYOGtGYWI1dSs1N3VMQitoOG9DWElO?=
 =?utf-8?B?UnlxZlZyMnZ1dUNONHU4ZFlQMWxPODk5SUpiQzM3N3daTE10WS9PSkcxejZ6?=
 =?utf-8?B?RXRoTXZ5K24zejIwZVBmSTdBbmxmVjBvVXpLbWRQWDJ3ZHIxK1g3cnVTcmsw?=
 =?utf-8?B?TTdjZzVkUk1kVHUydndsM3l0MVBCQUFSYjFuNVBqNGFyaERWUXVqakdsUTQ1?=
 =?utf-8?B?RDBEQ1FFWlJHK1JYcEFaSmNTYzEybGlDdnY5L0ZzVjhyMy9leHBTLy9OUGZu?=
 =?utf-8?B?VFA4RkJBZXA0VU5iM0lJWnhGeXppKzlPYkNJeXc4TVkwNi9EOVZUem1KL01o?=
 =?utf-8?B?Z3FTOW83ZlQ2NlBXYnQ0eUpINm5iL29jUmdpK0syM0JUV2VLeGs2bFpzaXVF?=
 =?utf-8?B?T2NrVm9WdUpPcDBOMXRjc2cvME12T1lYRWtyYUt4cisyWWxqWFF0Zk1FUGYv?=
 =?utf-8?B?eWxxVE9yNEpKcjVqenVoVlJqb0tMT1hoTmRYc2JjaUlyanVtb1Zxc1JFOThz?=
 =?utf-8?B?SzJmZ2IwWjQ4Z0pkc3lVU2tJR25LdXR4WVBTV3dsSWZSOC9RdDYrZ1JaYm9U?=
 =?utf-8?B?Y0Z4ak9NMnBkOC9iWGZXWFE3dE55R2I5LzRMOWFmbk4rY280eHpkSENMcUNt?=
 =?utf-8?Q?XVMFgSzizap37gTaE0VOAzR6O?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F5290B56E5FACC4593C704AE34ECCDFB@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7648.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a2b2e041-de92-48a1-ba98-08db5764c3aa
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 May 2023 05:57:29.3536
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /tgdd9u8WCIg7w9l65LKnuOzroIKSIXVO/fIvc3Xwfs0UOZhn6PFTf8a2gWsvUJhbJKq+l6riE7BzbFX5mwN5Eo8xM1aJIsJ4QkeUOLPO68=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7029
X-Spam-Status: No, score=-5.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

T24gMTguMDUuMjAyMyAwMjowMSwgVXdlIEtsZWluZS1Lw7ZuaWcgd3JvdGU6DQo+IA0KPiBUaGUg
LnJlbW92ZSgpIGNhbGxiYWNrIGZvciBhIHBsYXRmb3JtIGRyaXZlciByZXR1cm5zIGFuIGludCB3
aGljaCBtYWtlcw0KPiBtYW55IGRyaXZlciBhdXRob3JzIHdyb25nbHkgYXNzdW1lIGl0J3MgcG9z
c2libGUgdG8gZG8gZXJyb3IgaGFuZGxpbmcgYnkNCj4gcmV0dXJuaW5nIGFuIGVycm9yIGNvZGUu
IEhvd2V2ZXIgdGhlIHZhbHVlIHJldHVybmVkIGlzIGlnbm9yZWQgKGFwYXJ0IGZyb20NCj4gZW1p
dHRpbmcgYSB3YXJuaW5nKSBhbmQgdGhpcyB0eXBpY2FsbHkgcmVzdWx0cyBpbiByZXNvdXJjZSBs
ZWFrcy4gVG8gaW1wcm92ZQ0KPiBoZXJlIHRoZXJlIGlzIGEgcXVlc3QgdG8gbWFrZSB0aGUgcmVt
b3ZlIGNhbGxiYWNrIHJldHVybiB2b2lkLiBJbiB0aGUgZmlyc3QNCj4gc3RlcCBvZiB0aGlzIHF1
ZXN0IGFsbCBkcml2ZXJzIGFyZSBjb252ZXJ0ZWQgdG8gLnJlbW92ZV9uZXcoKSB3aGljaCBhbHJl
YWR5DQo+IHJldHVybnMgdm9pZC4gRXZlbnR1YWxseSBhZnRlciBhbGwgZHJpdmVycyBhcmUgY29u
dmVydGVkLCAucmVtb3ZlX25ldygpIGlzDQo+IHJlbmFtZWQgdG8gLnJlbW92ZSgpLg0KPiANCj4g
VHJpdmlhbGx5IGNvbnZlcnQgdGhpcyBkcml2ZXIgZnJvbSBhbHdheXMgcmV0dXJuaW5nIHplcm8g
aW4gdGhlIHJlbW92ZQ0KPiBjYWxsYmFjayB0byB0aGUgdm9pZCByZXR1cm5pbmcgdmFyaWFudC4N
Cj4gDQo+IFNpZ25lZC1vZmYtYnk6IFV3ZSBLbGVpbmUtS8O2bmlnIDx1LmtsZWluZS1rb2VuaWdA
cGVuZ3V0cm9uaXguZGU+DQoNClJldmlld2VkLWJ5OiBDbGF1ZGl1IEJlem5lYSA8Y2xhdWRpdS5i
ZXpuZWFAbWljcm9jaGlwLmNvbT4NCg0KDQo+IC0tLQ0KPiAgZHJpdmVycy91c2IvaG9zdC9laGNp
LWF0bWVsLmMgfCA2ICsrLS0tLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwg
NCBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3VzYi9ob3N0L2VoY2kt
YXRtZWwuYyBiL2RyaXZlcnMvdXNiL2hvc3QvZWhjaS1hdG1lbC5jDQo+IGluZGV4IDhiNzc1ZTdi
YWIwNi4uNjE4MDhjNTFlNzAyIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL3VzYi9ob3N0L2VoY2kt
YXRtZWwuYw0KPiArKysgYi9kcml2ZXJzL3VzYi9ob3N0L2VoY2ktYXRtZWwuYw0KPiBAQCAtMTcz
LDcgKzE3Myw3IEBAIHN0YXRpYyBpbnQgZWhjaV9hdG1lbF9kcnZfcHJvYmUoc3RydWN0IHBsYXRm
b3JtX2RldmljZSAqcGRldikNCj4gICAgICAgICByZXR1cm4gcmV0dmFsOw0KPiAgfQ0KPiANCj4g
LXN0YXRpYyBpbnQgZWhjaV9hdG1lbF9kcnZfcmVtb3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2Ug
KnBkZXYpDQo+ICtzdGF0aWMgdm9pZCBlaGNpX2F0bWVsX2Rydl9yZW1vdmUoc3RydWN0IHBsYXRm
b3JtX2RldmljZSAqcGRldikNCj4gIHsNCj4gICAgICAgICBzdHJ1Y3QgdXNiX2hjZCAqaGNkID0g
cGxhdGZvcm1fZ2V0X2RydmRhdGEocGRldik7DQo+IA0KPiBAQCAtMTgxLDggKzE4MSw2IEBAIHN0
YXRpYyBpbnQgZWhjaV9hdG1lbF9kcnZfcmVtb3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBk
ZXYpDQo+ICAgICAgICAgdXNiX3B1dF9oY2QoaGNkKTsNCj4gDQo+ICAgICAgICAgYXRtZWxfc3Rv
cF9laGNpKHBkZXYpOw0KPiAtDQo+IC0gICAgICAgcmV0dXJuIDA7DQo+ICB9DQo+IA0KPiAgc3Rh
dGljIGludCBfX21heWJlX3VudXNlZCBlaGNpX2F0bWVsX2Rydl9zdXNwZW5kKHN0cnVjdCBkZXZp
Y2UgKmRldikNCj4gQEAgLTIyMyw3ICsyMjEsNyBAQCBzdGF0aWMgU0lNUExFX0RFVl9QTV9PUFMo
ZWhjaV9hdG1lbF9wbV9vcHMsIGVoY2lfYXRtZWxfZHJ2X3N1c3BlbmQsDQo+IA0KPiAgc3RhdGlj
IHN0cnVjdCBwbGF0Zm9ybV9kcml2ZXIgZWhjaV9hdG1lbF9kcml2ZXIgPSB7DQo+ICAgICAgICAg
LnByb2JlICAgICAgICAgID0gZWhjaV9hdG1lbF9kcnZfcHJvYmUsDQo+IC0gICAgICAgLnJlbW92
ZSAgICAgICAgID0gZWhjaV9hdG1lbF9kcnZfcmVtb3ZlLA0KPiArICAgICAgIC5yZW1vdmVfbmV3
ICAgICA9IGVoY2lfYXRtZWxfZHJ2X3JlbW92ZSwNCj4gICAgICAgICAuc2h1dGRvd24gICAgICAg
PSB1c2JfaGNkX3BsYXRmb3JtX3NodXRkb3duLA0KPiAgICAgICAgIC5kcml2ZXIgICAgICAgICA9
IHsNCj4gICAgICAgICAgICAgICAgIC5uYW1lICAgPSAiYXRtZWwtZWhjaSIsDQo+IC0tDQo+IDIu
MzkuMg0KPiANCg0K
