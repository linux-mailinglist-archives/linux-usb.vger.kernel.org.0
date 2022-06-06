Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6544553F278
	for <lists+linux-usb@lfdr.de>; Tue,  7 Jun 2022 01:20:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232511AbiFFXUa (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 6 Jun 2022 19:20:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229472AbiFFXU3 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 6 Jun 2022 19:20:29 -0400
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C9361FA77
        for <linux-usb@vger.kernel.org>; Mon,  6 Jun 2022 16:20:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1654557628; x=1686093628;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=I4sEliqTbZZyXX49ChWswovXPLRbF9aEM/Cq4CWpvmI=;
  b=O0JOo16S6Ys8Ps56/WMELj/UADezTrQ0x7to4L2aTj10RX3OK8QBzUac
   qGyDEx/R6aH3sCpIQ43rbtatlYwXIa8Vg6F1izhB2fZoXmVCN70xgnSsN
   XC6uPBQiOVfp7eYu86wQzbI+i1L1sGV7lW3Oj9wdAY+P9MWYeNTNakP5+
   +eF4AMBkX5nqObsjeOMkijSvOE17CRcSefiZsmfhC9wEXWlaevcfvGfNi
   lgnV/74Iup9GHPSfmz+MWm4QYY9oNx9W651ZspwxrigxUguXzvUL0L/uQ
   dGODjC9NQqU8nb9qXbbNVUeOpovArlzTKf0K9wlHSObDEFMySMGH8uMAu
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10370"; a="337845678"
X-IronPort-AV: E=Sophos;i="5.91,280,1647327600"; 
   d="scan'208";a="337845678"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2022 16:20:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,280,1647327600"; 
   d="scan'208";a="906796367"
Received: from fmsmsx605.amr.corp.intel.com ([10.18.126.85])
  by fmsmga005.fm.intel.com with ESMTP; 06 Jun 2022 16:20:27 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Mon, 6 Jun 2022 16:20:26 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Mon, 6 Jun 2022 16:20:26 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Mon, 6 Jun 2022 16:20:26 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.43) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Mon, 6 Jun 2022 16:20:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V67fYlkcbe2wZC63Pi3QTe+XGnILxa22a1kX2m/OhpucvB3CtBW5dPX7kCeJ5yVsFnhxhUcc0jcg49B18T3oLuRoUhx/HUNgCACvHv8xqVOON4+MHb4IdJgTIYu1C/71UK7fnDrp5JiZRE6IJ6XdPBoGFGoQ7SihnQqU2zFSaeh9ouVcB8CI5Tay0nSYSh8Gk02QOQ6VcV9lFpHWYAdIC/9ym5bgIbzbViThIWzIhZ6awgBS6dU8VjeWWDP7K2DS4mr+un5Kk3QIE+5aNOYMpLgn5aF6BypZAgYCyIn6l/iNgYGQIGfzp3Da7lvWrM8PWZ6MP8vuOyxkrCPQoBUQvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I4sEliqTbZZyXX49ChWswovXPLRbF9aEM/Cq4CWpvmI=;
 b=WT+CCsckAtDWjHeAqgOKeLYmixwYxKVHnnceMTM6TxjfcZJihZ3FjwUtubsBX+mnBClCdmA7AI6KeoTrwpGwNnGngtaZU/4M7nRIvBuCw+7K6aL1sbOQckMmqWGWkD/Bj2H8v6/9gOAb50x+N34mg1apSDoD6mSC+wBEFfRva4shkfS+kHhO4D/iAR3Jyp+UYz4HhjEJVklXkdl77yWnDW2OsSz5+7exshITiieC9H6JP3powazQoyBfZ/r/1tRHmS8rG0/KWJioVYp4GPn4LZJdqIfYXBRc+KJgSVeQGJd0+l0pjusaT8YJ5EoQFpxpnZVcAA7TuMAjBax7N13TqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MW4PR11MB5823.namprd11.prod.outlook.com (2603:10b6:303:186::12)
 by BL0PR11MB3106.namprd11.prod.outlook.com (2603:10b6:208:7a::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.13; Mon, 6 Jun
 2022 23:20:24 +0000
Received: from MW4PR11MB5823.namprd11.prod.outlook.com
 ([fe80::ecb3:4e15:2d91:bf37]) by MW4PR11MB5823.namprd11.prod.outlook.com
 ([fe80::ecb3:4e15:2d91:bf37%4]) with mapi id 15.20.5293.019; Mon, 6 Jun 2022
 23:20:24 +0000
From:   "Sworo, George D" <george.d.sworo@intel.com>
To:     "mika.westerberg@linux.intel.com" <mika.westerberg@linux.intel.com>,
        "gdsworo@linux.intel.com" <gdsworo@linux.intel.com>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH] thunderbolt: Add support for Intel Raptor Lake
Thread-Topic: [PATCH] thunderbolt: Add support for Intel Raptor Lake
Thread-Index: AQHYdgi18FQAaNxQ+UCfh0z7tCI5Pa1CJg6AgADl3wA=
Date:   Mon, 6 Jun 2022 23:20:24 +0000
Message-ID: <0ef05fc3a7eda8f50b43c1646f2fa4e7d73e3b48.camel@intel.com>
References: <20220601224102.15266-1-george.d.sworo@intel.com>
         <Yp3K4xhNJ/PoY+HB@lahna>
In-Reply-To: <Yp3K4xhNJ/PoY+HB@lahna>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.36.5-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fbeadc2b-7945-4741-214a-08da48132262
x-ms-traffictypediagnostic: BL0PR11MB3106:EE_
x-microsoft-antispam-prvs: <BL0PR11MB310684EAD8D7FFF27C689548C0A29@BL0PR11MB3106.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: PfPqvMqVN1aBhVxpGBRwuaThAQjB3srcf5yRUu/DIhingEakKeGmmN+50lpp+db+pSQHrI0XW9iEiZXHGplVlHTbelUuDqSm/eJodsi0BXSdJBXvZFp27N3CV73+B63cxxpWH/MPOMukcVItqpC+TKJbNlv1BqpX98FWwnyt2djbzfBjYtNAmTtEnhxel9b+wt6HAY0CaVMgS3dhxBnqu1IKuTuFCuoLSfr8CEmchIzoqJzetV356bCUOfUJXzJPMhfE7GVHqdajQkvM3PZrfDtgQJsRjw3sFT20b32XB+ZvegvI+wNu1PqmuMbw3Yf9B2yivhwunQ9j/K8SRAaS1SMvZpvEZhwQ+HmSLql/p1e0Sicx6JBjKn0stYA3OsccShtWWfd3BBrqSbpg5kVax8aISJ+aB3gdxjKulOfz8XKjNemtoMtR95iGHyHMVmjODJofDE7Xup8U9TmH26X61LH0m6kpYrBfmCSwIXyx70JWcwl0KN1G3e81dM88cEM39TsEI10AAkvj7LRjyoX56tunp/6l6kRSMEuT9+2jVPz6m/UUadnOqOKQVycDGvl48idkiUTFuY9mKZJbPsGwsr5L25FBONzGQImHuwPERFbe0pJsbQc8pdR3DeuduA2pGQWwSWoHNLJAiRzH0lb4FbTozJN0VfOIRXkKn6qlBHIjwo8i10TIsD9ZzbukSNvG0c7OSI+fb9N0ZSmkKE5mWZ1yRi2Ifq5TpoLtIRVK3mtVWnDeMwHJg/ooUhK3HeC1brqZZxbOwmiMf4lVxrNa7ezPAZqP/NR2Xfxg/6IJJS4=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB5823.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(82960400001)(71200400001)(38100700002)(84970400001)(508600001)(6486002)(86362001)(2616005)(110136005)(4744005)(66476007)(66556008)(6506007)(6512007)(186003)(66946007)(316002)(64756008)(66446008)(2906002)(76116006)(36756003)(38070700005)(8676002)(4326008)(83380400001)(8936002)(122000001)(26005)(5660300002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NDMrUDdNY2F0cmtxZS93VXNDSlRyMEJxWDkwd21BUXhyUWhudEVpbDV3WXdI?=
 =?utf-8?B?dXdwdkJkRkJUcHgwUWgyQ3JBTThaa2ZiUC9JT2pZUytXc2hrQmxyY3RSWkNZ?=
 =?utf-8?B?MkZUbDJBdTJVTUZJUHhOcTZJWnBqd3BZZWtxYVM5TjU4andMUzJlempSNXdU?=
 =?utf-8?B?eUFMaGVNNDdYS1B5RXlEVGl5OHorUmZsVm5rdG9RM0wzK20zVG12UGF2RUZX?=
 =?utf-8?B?Z0JUc3lkVENGSGJUWUQ0eXY2YklubWdpN2daMzhBNllIak9RQmNJUEEyOEVn?=
 =?utf-8?B?bzVGQlcrT1ZGbmNpNlBkRlUxS1NLM2RiWlBrNjZIbzZWdzlZZmRETFltTytt?=
 =?utf-8?B?RUZnRkVSSHNFWFhoZ3FZYytCKzhYSDVYOUVvNjZ6elFTaExMOWhlVzFlWHpv?=
 =?utf-8?B?b21xclJkbWVQWFpGUFVrMXdYL3E2SHBXMDVlbmw5ditnVm9McjlEL0hjSThY?=
 =?utf-8?B?ekgyclZPTS91bm04aUlmcTNCaW0yKzNxZzdGaHFjaUdLVU1KMnRUUUpVMko0?=
 =?utf-8?B?Qk92WG1sVjFlbW5VbFBSQjJDY1hSbzBSZ0JaaDZpMGpRUkJseTNOaktmd0JY?=
 =?utf-8?B?WTZtUHovWkNwQ2J2bDRWY3JMY2M1TkZ5dEpmckNsd1BxSHdKZUpCQ2t5QmNa?=
 =?utf-8?B?SnlFY0NPd3pESG1iWTk3YW5UQ0VXL1hBRjU4MnQ1eE13dnJGN3NCS0Rqa01Q?=
 =?utf-8?B?T21HNTRCTzltOGFtMlpaSlZhdFN4VDdyUC9wVVZkSkx1eE1oYk4wYlNMMWRw?=
 =?utf-8?B?clQ1bjYwTG9qUE9LaU1scmFhc251WWVIZHVMcmIvNEw3N3VJVjBZaFZCK0U4?=
 =?utf-8?B?OXlITnN0VkFsLzMyd2t5bWNwYThKOGZtMEx3dlQzeEVJTGV6UGd5eTVhY3c2?=
 =?utf-8?B?NmcwNEdMVzJFMEpKaG5Wdjh1QUZEYmpnVHdiVVRiNytUWG5tQWhnT09Rck85?=
 =?utf-8?B?WHE0RjhSc09MSUlqRTkraThncTkvTmhIcVh3SWtEZWRrb3FiVmdSQmx6Z3pq?=
 =?utf-8?B?cC9mK0MxRWhHTzMzSjliREFjV0hjZFlvYkVBUW93U0ZsKzZwbFZzbzJkTjgz?=
 =?utf-8?B?WDFIRm9UcXBLNS9EMmUwZUhBZ2FxTVFEWEMvM1c2M0E4S0JMbHoyRkdRL1Fz?=
 =?utf-8?B?RWVqRnV3UzhBUnNrdlNZaEJybS9rbGlEL1dCcTVxRnEwc1FiVSt5dzYxRTUr?=
 =?utf-8?B?ODRsZUFvdmdVV1EzMGpnTmNWQnNQb1IwSlhFUG9sNTZmeFdKdVJWREt0QkQx?=
 =?utf-8?B?NU9rR0poU2Q3amoya1hQRnByeUpCRmhwSnVPa2Z5cTd2WURpekpQTGc1NEhX?=
 =?utf-8?B?aEg4b05rTEpKOFU2dlNjNU85cFp6dnZQakgrcGtyejdSL2lzM0hRUERQVlZB?=
 =?utf-8?B?REJZQ2F3WHcvcGpXVXkwejhRbG9uM3ljT0R1MkpYYzFLK3hTSERxTmxsTDBW?=
 =?utf-8?B?RlRYNWhaWjFIYnV4VU1MUDFGOFMrRHErK2QrK0xNRmdURFJ0dkdxRlQ2QVlE?=
 =?utf-8?B?OVIzdW9tdmVQVnZSSzFDbTJGVFRtS0NLeEh0Rjg5NkJwYS9Jc0V4aU1JbVM4?=
 =?utf-8?B?VEFyTko5eGJIMUk1N0pSN3dsUzdYQlhxc2FsVHJraHlnZHU2VndwdHM4NTkw?=
 =?utf-8?B?dks0bU9wSVBzT1V0NXljSG5GcnR2Z1pFa2xWcnduam1BdXpaZUtoZ3pPS2Rw?=
 =?utf-8?B?cWNpNE1tYnoyN3NHeDVmcUlyMHgxMWdzY0JaUXFmYTNLL0s2QnFMeHhEU3Qz?=
 =?utf-8?B?RE50ZjB4cVpEUG15aXpyQTVyYUNWMjQ5TFNJRU5JaUxsQ1g4ZEJ0UG8yMlVN?=
 =?utf-8?B?cnJQeXg4NEJLNExzVitydGNBeHZ4TnhId0tZNzh0NksyKzZ4VFF1ME1GRVFn?=
 =?utf-8?B?Nkp0ZVBTS3hQNFZzSy9FQmp1WFNkQjlvLzR1MW01RmpWUW5sOUt3azZjdVA1?=
 =?utf-8?B?UHZBc0kzWFBhM0RKTHA5Rks1UmUyTStxVlQ1SStpdHhoNmNTd0x3dHhWcE9z?=
 =?utf-8?B?MERsbEQwRGQwTytqbEwyRk9MNnBrbGpJbVJBcHZBVjlUeVJCRnJabk84MmNZ?=
 =?utf-8?B?L1dCOXkzUm5xMkxkb3pNSGczVFdzaXRUMVM2TTFHMHFlMTdEVHJRWDhzb3FC?=
 =?utf-8?B?bmFYMHRUYjBSR09FVy91T1pWYWpGUEU1MlR2ejE0R1VjVnpydkFQWHg2eW5v?=
 =?utf-8?B?N0VLaTZ4c1VIQjg2R3JYb0l1SmFRZ2t4azltc3Z3c0pscFRJVURmSnRhdG9P?=
 =?utf-8?B?Rm9DSVlUWDJlRzZpdTh4MmZZNTlvc0hKajFnaFJiaXBDOVRXMHFnSUJtNFB6?=
 =?utf-8?B?aFVOZU1rQWZieU8rUHUrUlk2RkUrU1YzZnVlKzBkVXptTlIyV25OemVJTFdU?=
 =?utf-8?Q?GFlQyCyM/JfwTh4qZVeoH4KFVYlxVh9lelkzW?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7E23CA1AE11308418AE4CF5EA45E414C@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5823.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fbeadc2b-7945-4741-214a-08da48132262
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jun 2022 23:20:24.4143
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mmHvVag27KFoJMSDo+YbYgkbRHZ4i6Ncwc3eopk+5HA51D4aRGOrqfkz7VP0G0z+7yDL5lJ5RVG3GrU9qDADpXydxxiE5GUPHHtOmjx6XPc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR11MB3106
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-5.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

T24gTW9uLCAyMDIyLTA2LTA2IGF0IDEyOjM3ICswMzAwLCBNaWthIFdlc3RlcmJlcmcgd3JvdGU6
DQo+IEhpIEdlb3JnZSwNCj4gDQo+IE9uIFdlZCwgSnVuIDAxLCAyMDIyIGF0IDAzOjQxOjAyUE0g
LTA3MDAsIEdlb3JnZSBEIFN3b3JvIHdyb3RlOg0KPiA+IEZyb206IEdlb3JnZSBEIFN3b3JvIDxn
ZW9yZ2UuZC5zd29yb0BpbnRlbC5jb20+DQo+ID4gDQo+ID4gIFJhcHRvciBMYWtlIGhhcyB0aGUg
c2FtZSBpbnRlZ3JhdGVkIFRodW5kZXJib2x0L1VTQjQgY29udHJvbGxlciBhcw0KPiA+ICBJbnRl
bCBBbGRlciBMYWtlLiBCeSBkZWZhdWx0IGl0IGlzIHN0aWxsIHVzaW5nIGZpcm13YXJlIGJhc2Vk
DQo+ID4gIGNvbm5lY3Rpb24gbWFuYWdlciBzbyB3ZSBjYW4gdXNlIG1vc3Qgb2YgdGhlIEFsZGVy
IExha2UgZmxvd3MuDQo+ID4gDQo+ID4gU2lnbmVkLW9mZi1ieTogR2VvcmdlIEQgU3dvcm8gPGdl
b3JnZS5kLnN3b3JvQGludGVsLmNvbT4NCj4gPiBDaGFuZ2UtSWQ6IElkYThkMDg3NjkxM2JhYTFm
ZmIzYzBiYzg4OGQ2NTAzZjMxNzU0MDZlDQo+IA0KPiBUaGlzIGRvZXMgbm90IGJlbG9uZyB0byB0
aGUga2VybmVsIGNoYW5nZWxvZ3Mgc28gSSBkcm9wcGVkIGl0LiBJIGFsc28NCj4gbW92ZWQgdGhl
IFBDSSBJRHMgdG8gZm9sbG93IHRoZSBudW1lcmljIG9yZGVyaW5nIGluIG5oaS5oLiBXaXRoIHRo
b3NlDQo+IGNoYW5nZXMgSSBhcHBsaWVkIHRvIHRodW5kZXJib2x0LmdpdC9uZXh0LCB0aGFua3Mh
DQo+IA0KPiBJIGFzc3VtZSB5b3UgaGF2ZSBhY3R1YWxseSB0ZXN0ZWQgdGhpcyBvbiBSUEw/DQpZ
ZXMuIFdlIGhhdmUgdGVzdGVkIGFuZCB2ZXJpZmllZA0KDQpUaGFua3MNCg==
