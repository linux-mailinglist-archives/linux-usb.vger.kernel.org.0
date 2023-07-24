Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 82BE075EBBA
	for <lists+linux-usb@lfdr.de>; Mon, 24 Jul 2023 08:38:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230442AbjGXGix (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 24 Jul 2023 02:38:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230451AbjGXGiq (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 24 Jul 2023 02:38:46 -0400
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AEF96E49;
        Sun, 23 Jul 2023 23:38:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690180699; x=1721716699;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=f6SanqRhKjyvKTWoyAt1uN1uR80OoYn7CiDMUP4ptR8=;
  b=Hj56Ym8y6dqCbC4LBT6acayD4eQIx/DxpM+WR05lH/3w6hpemhF0sHS0
   ldl7l7fSi4H5fJYCqgu0JFUgg4tiTYoVtqqRAuVKf011rSlpOu9imWWf/
   sLYdjrpDgsuGETjCncq+q30dKxe7XSoIrQWDT9/jjLiPvz4JrkfaPnGRw
   iT0gqxG9Y8spX+C/5Wj1lg0TxG+DYni8e4Y86QbLlIhFn2qcAB/LHgIZK
   VHyCZ8fZ76ujrIX6l9G2KJjKTvatBBRGzZ9ljK83d7BaljpVPUQW158K4
   yVqf+2CGIc2TcwfRe5r4AOvQyjlTQkiqckZfaQLLZcIqWPJPsVpfMe596
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10780"; a="346962773"
X-IronPort-AV: E=Sophos;i="6.01,228,1684825200"; 
   d="scan'208";a="346962773"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2023 23:35:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10780"; a="790848311"
X-IronPort-AV: E=Sophos;i="6.01,228,1684825200"; 
   d="scan'208";a="790848311"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmsmga008.fm.intel.com with ESMTP; 23 Jul 2023 23:35:56 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Sun, 23 Jul 2023 23:35:56 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Sun, 23 Jul 2023 23:35:56 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.172)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Sun, 23 Jul 2023 23:35:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OYMfcgWnZkEd3Vsq8HX1FPgQ3ysB7NIw5fGPsAB8+i67YlgSgFEo8E6v4/iEqJtQeRsO+x23g2ZtbVxjgom6P/+ocOr1tuAqJWGAY44ARgRv6vBX1lULhPQIdbjogC5H0nSdIU4QVTgpM5AQJ0fF8vDkVRitskOAgDZ6nFd4B5j8qL8H6ccX0SV2DR4Kkngxl/fJUSD084ZBG3QWXdwMYK1IkZ4oDzWJBcg2uZ18ryfeut8YJJ0irM9EoMXcuMKoBpL9C/JJsKOBfIyhRBpJzbuiwC/SmiqWm+VDsvGNNopsElXqc41b1rgd8j+oIsQ9NgpXPN82AgV5/8tVP3Yheg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f6SanqRhKjyvKTWoyAt1uN1uR80OoYn7CiDMUP4ptR8=;
 b=aCW1wyn6FcnDBRnsgBIBNqZdK61G8LYEhetihhKOir22bU1KuGEeHL/LypYyg/fuERin8k5Vj8/lrUWBsUO945pafKdbv0hpQCupawd5LjnzOr+UE/7nrTtWSMJ2/onh91hsI3lnIKzkGPHadkfmfOiWhjqlatEMA1wbgiqxx6Jp+VwF15fSnGf6O5CuG9b3XGtdjsD59xU18cQ9ZT42sEw3FhQ4JEBzdXFLTZLt+Dd0JlXcrOpr2+bEfwfvbkQTJ92DvjS9xx6cyVJpUU5a7qcNquuAzqRnHcsPvV1GlL+UJ2gjO+9nSP8/3anoCaCLWq8uctkPJOOvY9Q2UNHiLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA2PR11MB4860.namprd11.prod.outlook.com (2603:10b6:806:11b::10)
 by CY5PR11MB6137.namprd11.prod.outlook.com (2603:10b6:930:2b::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.32; Mon, 24 Jul
 2023 06:35:54 +0000
Received: from SA2PR11MB4860.namprd11.prod.outlook.com
 ([fe80::bbee:647b:4a59:2a9a]) by SA2PR11MB4860.namprd11.prod.outlook.com
 ([fe80::bbee:647b:4a59:2a9a%7]) with mapi id 15.20.6609.030; Mon, 24 Jul 2023
 06:35:54 +0000
From:   "Ng, Adrian Ho Yin" <adrian.ho.yin.ng@intel.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "krzysztof.kozlowski+dt@linaro.org" 
        <krzysztof.kozlowski+dt@linaro.org>,
        "conor+dt@kernel.org" <conor+dt@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "Thinh.Nguyen@synopsys.com" <Thinh.Nguyen@synopsys.com>,
        "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>
Subject: RE: [PATCH 1/2] dt-bindings: usb: Add Intel SoCFPGA USB controller
 bindings
Thread-Topic: [PATCH 1/2] dt-bindings: usb: Add Intel SoCFPGA USB controller
 bindings
Thread-Index: AQHZu4wmFMDuTqmP0ku24sGheQzy/a/D3MmAgASdKVA=
Date:   Mon, 24 Jul 2023 06:35:53 +0000
Message-ID: <SA2PR11MB4860EE675DF40F1B6925AF0C8002A@SA2PR11MB4860.namprd11.prod.outlook.com>
References: <cover.1689913114.git.adrian.ho.yin.ng@intel.com>
 <68037e45970a9ef930c609c002d36863d96b39cc.1689913114.git.adrian.ho.yin.ng@intel.com>
 <216a3abe-1350-cbb1-4cfd-0dc4d7f70a88@linaro.org>
In-Reply-To: <216a3abe-1350-cbb1-4cfd-0dc4d7f70a88@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA2PR11MB4860:EE_|CY5PR11MB6137:EE_
x-ms-office365-filtering-correlation-id: b0e93b8f-82d1-43f0-00ef-08db8c103abe
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: tULtdcCUxttDuuUq6FW6B9NzoL2DA7qF5KNVSsB4Tcwq5H7PrTpBlTTEL5b6XcldqQ7/O2wfjiV1tOP88MC5bPAMPi+Z+xCD9oDLQm5gipxDWmxQDl416cILFEVMSMgdlTxFwaRroibzZrMlmpU9I9H+SBR6wz/yjVB21RbVTNMilZqoyK5FsJxgaSK+BJ96aRjgt/aVHxG/ieTks6EwyUz5IpVP1CwBgGmiPipEQn0o3VjSYABPWcz1VzeIO66XAEqf18MJOUUxfgPBB9DmnbXRE0znMOtcGdXl2nQ4DviLGQWZsDOHIs7WzKEnFq7k4MDfoO7szGm+OFg+vFVmcnJy7jnMacGkoBguoKFfxNByUlq5A4zTbQojtjFTiMHehBjdgl4AO586CZBiKWGxgEUGKzjpBj305eNJK5EUDEnABud8yVIOiYyjdgb/LMwxkkzpr3xTbm41XxuQxhGkEW9iR8Bqh36jgr2rTGS52TcQwQmzK3Nx0GEbNkrKo4GBohtdGlZ7120nKzjtTSvgbKuOAzobStb9VPDzDsjmHWNjlGottpLsy5PC89gWZJyOZXmLa6u+TdNkK9/7TOWqyppIEaqLrVBwltCkxAOpHhxV1OuOxTzcWyEWOb9zDvRJt/gynlbhXI3jzHAy4/aX4Q==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA2PR11MB4860.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(346002)(376002)(39860400002)(136003)(366004)(451199021)(2906002)(64756008)(76116006)(66946007)(66556008)(66476007)(66446008)(7696005)(33656002)(71200400001)(478600001)(86362001)(966005)(9686003)(110136005)(83380400001)(186003)(82960400001)(122000001)(26005)(38070700005)(6506007)(55236004)(53546011)(38100700002)(55016003)(41300700001)(8936002)(8676002)(5660300002)(52536014)(316002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YnFsNGQ2LzlNdllwaGJrQU91ajFLN1FGMDA5dngzKy9qcEpPeDVCZnpJZXhX?=
 =?utf-8?B?SWNZQWpHSTQ0aXRHOEZrMktpaHVUaitQTDJnb3NJQnJ3aXEycDZnL3JEdUF4?=
 =?utf-8?B?bUl6UlVxSDB2dGRVdmV0aWdrNGpySS80UmYxUnBvQzg0K1ZQNDRaaEsyeFpi?=
 =?utf-8?B?R2VUallHUVVWSk1qbVQxNFEvR1EzZ210OFpFc1JEbXlQaHNCT0Q4Zjkycy9V?=
 =?utf-8?B?bDZIWUxQNTVyMm11bWVSNjYrS3hGSjQzUGlBa1hTcXNKdUsxK1AwNWhOWVZy?=
 =?utf-8?B?aTZCaGVzMXE2Wk0vd1gwdkhuWWVzYytTMUFZYTJ0Z1Zsa0FlMVdkdHBjN3hr?=
 =?utf-8?B?akdaeW0xYVJ6QlBXUGVJaUU3bHVIOFNWclE1OTdudHFPZjQ1Ukw4V0thRnJl?=
 =?utf-8?B?TzdaUlludTNUcldkWWxIOUo3QWRMTlNwMlZ4R0RBOFpta3lmNmhuM3BjTS8v?=
 =?utf-8?B?ZC9wYU5HV2cyaDJERzJ5ZlJFcXRmdzl4YWp5SzExeXZVLytYVXVMSG5mYXNk?=
 =?utf-8?B?RG1XRDNnVFcySDV1bUhuOEw2ZGdQTFk2MDdlL0ttY3NQVzlSK1JKZThPRXlk?=
 =?utf-8?B?alhacjA5ZUtqV3J6eWJ3Vkp5NldpNEN4eUlZcHcraWtVWnJ3eVJPSWZCUWxN?=
 =?utf-8?B?ZkJaOFBGcXRPL0dDbWJpdDJmbWF6VVdHbnhKbWgxNG9pRVJWR21hU1UvdDlk?=
 =?utf-8?B?VTJUbmtSVUxib2RNOUlaWkJHMVpMcFBZcUp1YStzZ3hPZ21uWHk5WW5OMWhh?=
 =?utf-8?B?cGhKRDV3VUxPMEVESWhHSlVoUytUVkFXcHZHYVBYaTJVMEdPZnZSSzNINGZ5?=
 =?utf-8?B?Vlh0VWlya0JZYzExbW5BOWdWWmE1MXphWVVNWUR4dzdUaVp0VTJlRnVzQm51?=
 =?utf-8?B?bGRQckFBQm0xdVlONmFJUVVoamcrOEVDTWZtVnFWUnZGRFpKT3picEVBQ0R4?=
 =?utf-8?B?OEs5VW5VWFBVT0xTcjBMRCtDQkFYN1BUTWxHWmJNZ0toQUI1UlZMZy9Za09a?=
 =?utf-8?B?MUR2WUF6dzB0UVFnSS9IbEN6Vk05ZUFOa1lmRzBJUS9TTzgwM2wvdWJUa3ds?=
 =?utf-8?B?LzhFb2FOalNaUmtMUm9yVWlPRVQyaE8xdEEyc1hZd2tuSlBwVlUyVnVTYTJz?=
 =?utf-8?B?UVQ4RGR4bW1sbDRCRnhjbjJiejRDWms1OWg3UHRRNmh2QU45OFNOamlJR01Q?=
 =?utf-8?B?WjBldGNtWnQ3RSttWWNvOUVDSEFFenRtQVJvcjNUZm1sQ2VSbk0zek1wNEd5?=
 =?utf-8?B?Q2REeGRuZmVIN2szU0twVm5sTzhtTW54MHhQK0dGYWczQ3ZMR2cwSEhkOXFu?=
 =?utf-8?B?bFV2dWNON2N1Z09IZ2tUMzBOdDZNMlVSVWxmOXRqVnZjTXE0SVF6WjBQMXpv?=
 =?utf-8?B?Q3U3Mkhrd1JnTmdXVTk2bGNmUjZCb2ptM25tS21wYkhydmJrdTVQTVpkbk55?=
 =?utf-8?B?ZnBjYWhRQlFsak45aVZMcXcrbFdTODg2UFNFZE11NjZVcGFmSDM2VGwzbmhQ?=
 =?utf-8?B?SUcxamV2S2ZVS25KZ0E3RWdSK0F5ZXVGN2ZSNitPL2NoOUs4WWtpN1pKQXgy?=
 =?utf-8?B?OGVteVpLbVpqc3RBTTEzTVUxMG5NMWpwR2hxa2lPaTJDUFcyQlY0ZGUrUzFw?=
 =?utf-8?B?a1E4TzlQcGdIbGkrTnc4c3E2UGlKam9GV1drUmZqQnJKbVMyK2NQMGpjc1c0?=
 =?utf-8?B?R01FUm93U3o5ZStYck5HSy9QVEVWbm9IT1RncGtNRlRiOWltaXpHKzZRTHNw?=
 =?utf-8?B?Rit0QTJBYzdRdTZZaW1sSzNBNVlVRTFXZGxVemVUU0l6WXVVQzdUZmxPdkdX?=
 =?utf-8?B?WlM5VnFoL3RBOGdwRE9wMy9IYlpPUThNYVRVTEd5d04zK3E3T3A1V0wrVzNK?=
 =?utf-8?B?dEt4cCs5ZHllTWJWeWZYVkt2Slp0WitjaDNueG5nbTVRWUYrWVhQZlVua3Fi?=
 =?utf-8?B?YkZoMGxFWlpPRzRkTGp2dnoxcVhNSWtjNU4vbXdacG1oVWR4Z2YwZ2xmNWhH?=
 =?utf-8?B?dlZzU3BqanNnYzluanUrdGJYTk1EOG1Oem9TUzUwOGtvazljZ3hrbVN2YnNW?=
 =?utf-8?B?eGh1Zk9pMm1jeHpmVVd4elRQYmllMzRLSHd1RjVObjVFTjlrWEpPcFVTSGRU?=
 =?utf-8?B?bS9yOUR0YS85Q3g4YUFGcGtuaDMvbFNNSWdGNVJtU3JBRU9OeXlXVUhQOUM2?=
 =?utf-8?B?SEE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4860.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0e93b8f-82d1-43f0-00ef-08db8c103abe
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jul 2023 06:35:53.5872
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jmJR7TEIfB7zgGIBJuC9zoxht3lsdkS4BqIweAJEZddwp0xGVp5o4eUe6e8l6dmbPEXieaY79JF/BshnOAj/d6RXdgA7pniO6N9+rOVlPyM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6137
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

PiBPbiAyMS8wNy8yMDIzIDA2OjMwLCBhZHJpYW4uaG8ueWluLm5nQGludGVsLmNvbSB3cm90ZToN
Cj4gPiBGcm9tOiBBZHJpYW4gTmcgSG8gWWluIDxhZHJpYW4uaG8ueWluLm5nQGludGVsLmNvbT4N
Cj4gPg0KPiA+IEV4aXN0aW5nIGJpbmRpbmcgaW50ZWwsa2VlbWJheS1kd2MzLnlhbWwgZG9lcyBu
b3QgaGF2ZSB0aGUgcmVxdWlyZWQgDQo+ID4gcHJvcGVydGllcyBmb3IgSW50ZWwgU29DRlBHQSBk
ZXZpY2VzLg0KPiA+IEludHJvZHVjZSBuZXcgYmluZGluZyBkZXNjcmlwdGlvbiBmb3IgSW50ZWwg
U29DRlBHQSBVU0IgY29udHJvbGxlciANCj4gPiB3aGljaCB3aWxsIGJlIHVzZWQgZm9yIGN1cnJl
bnQgYW5kIGZ1dHVyZSBTb0NGUEdBIGRldmljZXMuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBB
ZHJpYW4gTmcgSG8gWWluIDxhZHJpYW4uaG8ueWluLm5nQGludGVsLmNvbT4NCj4gDQo+IEEgbml0
LCBzdWJqZWN0OiBkcm9wIHNlY29uZC9sYXN0LCByZWR1bmRhbnQgImJpbmRpbmdzIi4gVGhlIA0K
PiAiZHQtYmluZGluZ3MiIHByZWZpeCBpcyBhbHJlYWR5IHN0YXRpbmcgdGhhdCB0aGVzZSBhcmUg
YmluZGluZ3MuDQoNCkRyb3BwZWQgImJpbmRpbmdzIiBpbiBWMiBwYXRjaC4NCg0KPiANCj4gPiAt
LS0NCj4gPiAgLi4uL2JpbmRpbmdzL3VzYi9pbnRlbCxzb2NmcGdhLWR3YzMueWFtbCAgICAgIHwg
NzggKysrKysrKysrKysrKysrKysrKw0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgNzggaW5zZXJ0aW9u
cygrKQ0KPiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQNCj4gPiBEb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvdXNiL2ludGVsLHNvY2ZwZ2EtZHdjMy55YW1sDQo+IA0KPiBGaWxlbmFtZSBt
YXRjaGluZyBjb21wYXRpYmxlLg0KDQpVcGRhdGUgY29tcGF0aWJsZSB0byBtYXRjaCBmaWxlIG5h
bWUgaW4gVjIgcGF0Y2guDQoNCj4gDQo+ID4NCj4gPiBkaWZmIC0tZ2l0DQo+ID4gYS9Eb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdXNiL2ludGVsLHNvY2ZwZ2EtZHdjMy55YW1sDQo+
ID4gYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdXNiL2ludGVsLHNvY2ZwZ2Et
ZHdjMy55YW1sDQo+ID4gbmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4gPiBpbmRleCAwMDAwMDAwMDAw
MDAuLmRlZGVmNzBkZjg4Nw0KPiA+IC0tLSAvZGV2L251bGwNCj4gPiArKysgYi9Eb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdXNiL2ludGVsLHNvY2ZwZ2EtZHdjMy55YW1sDQo+ID4g
QEAgLTAsMCArMSw3OCBAQA0KPiA+ICsjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiAoR1BMLTIu
MC1vbmx5IE9SIEJTRC0yLUNsYXVzZSkgJVlBTUwgMS4yDQo+ID4gKy0tLQ0KPiA+ICskaWQ6IGh0
dHA6Ly9kZXZpY2V0cmVlLm9yZy9zY2hlbWFzL3VzYi9pbnRlbCxzb2NmcGdhLWR3YzMueWFtbCMN
Cj4gPiArJHNjaGVtYTogaHR0cDovL2RldmljZXRyZWUub3JnL21ldGEtc2NoZW1hcy9jb3JlLnlh
bWwjDQo+ID4gKw0KPiA+ICt0aXRsZTogSW50ZWwgU29DRlBHQSBEV0MzIFVTQiBjb250cm9sbGVy
DQo+ID4gKw0KPiA+ICttYWludGFpbmVyczoNCj4gPiArICAtIEFkcmlhbiBOZyBIbyBZaW4gPGFk
cmlhbi5oby55aW4ubmdAaW50ZWwuY29tPg0KPiA+ICsNCj4gPiArcHJvcGVydGllczoNCj4gPiAr
ICBjb21wYXRpYmxlOg0KPiA+ICsgICAgY29uc3Q6IGludGVsLGFnaWxleDUtZHdjMw0KPiANCj4g
V2h5IHVzaW5nIGNvbXBhdGlibGUgc3R5bGUgZGlmZmVyZW50IHRoYW4gb3RoZXIgQWdpbGV4IGJs
b2Nrcz8gV2hpY2ggDQo+IG9uZSBpcyByZWNvbW1lbmRlZC9vZmZpY2lhbC9jb3JyZWN0Pw0KDQpU
aGlzIHN0eWxlIGlzIHVzZWQgc28gdGhhdCBmdXR1cmUgU29DRlBHQSBwcm9kdWN0cyBjYW4gcmV1
c2UgdGhlIHNhbWUgYmluZGluZy4gDQoNCj4gDQo+ID4gKw0KPiA+ICsgIHJlZzoNCj4gPiArICAg
IG1heEl0ZW1zOiAxDQo+ID4gKw0KPiA+ICsgIGNsb2NrczoNCj4gPiArICAgIG1heEl0ZW1zOiAy
DQo+IA0KPiBXaGF0IGFyZSB0aGUgaXRlbXM/DQo+IA0KDQpVcGRhdGUgd2l0aCBpdGVtcyBkZXNj
cmlwdGlvbiBhbmQgZHJvcHBlZCBtYXhJdGVtcyAgZm9yIGNsb2NrcyBpbiBWMiBwYXRjaC4NCg0K
PiA+ICsNCj4gPiArICByYW5nZXM6IHRydWUNCj4gPiArDQo+ID4gKyAgcmVzZXRzOg0KPiA+ICsg
ICAgbWF4SXRlbXM6IDINCj4gPiArDQo+ID4gKyAgcmVzZXQtbmFtZXM6DQo+ID4gKyAgICBpdGVt
czoNCj4gPiArICAgICAgLSBjb25zdDogZHdjMw0KPiA+ICsgICAgICAtIGNvbnN0OiBkd2MzLWVj
Yw0KPiA+ICsNCj4gPiArICAnI2FkZHJlc3MtY2VsbHMnOg0KPiA+ICsgICAgZW51bTogWyAxLCAy
IF0NCj4gPiArDQo+ID4gKyAgJyNzaXplLWNlbGxzJzoNCj4gPiArICAgIGVudW06IFsgMSwgMiBd
DQo+ID4gKw0KPiA+ICsjIFJlcXVpcmVkIGNoaWxkIG5vZGU6DQo+ID4gKw0KPiA+ICtwYXR0ZXJu
UHJvcGVydGllczoNCj4gPiArICAiXnVzYkBbMC05YS1mXSskIjoNCj4gPiArICAgICRyZWY6IHNu
cHMsZHdjMy55YW1sIw0KPiA+ICsNCj4gPiArcmVxdWlyZWQ6DQo+ID4gKyAgLSBjb21wYXRpYmxl
DQo+ID4gKyAgLSByZWcNCj4gPiArICAtIGNsb2Nrcw0KPiA+ICsgIC0gcmVzZXRzDQo+ID4gKyAg
LSByYW5nZXMNCj4gPiArDQo+ID4gK2FkZGl0aW9uYWxQcm9wZXJ0aWVzOiBmYWxzZQ0KPiA+ICsN
Cj4gPiArZXhhbXBsZXM6DQo+ID4gKyAgLSB8DQo+ID4gKyAgICAjaW5jbHVkZSA8ZHQtYmluZGlu
Z3MvaW50ZXJydXB0LWNvbnRyb2xsZXIvYXJtLWdpYy5oPg0KPiA+ICsgICAgI2luY2x1ZGUgPGR0
LWJpbmRpbmdzL2ludGVycnVwdC1jb250cm9sbGVyL2lycS5oPg0KPiA+ICsgICAgI2luY2x1ZGUg
PGR0LWJpbmRpbmdzL3Jlc2V0L2FsdHIscnN0LW1nci5oPg0KPiA+ICsgICAgI2RlZmluZSBBR0lM
RVg1X1VTQjMxX1NVU1BFTkRfQ0xLDQo+ID4gKyAgICAjZGVmaW5lIEFHSUxFWDVfVVNCMzFfQlVT
X0NMS19FQVJMWQ0KPiANCj4gRHJvcCBkZWZpbmVzLiBJbmNsdWRlIHByb3BlciBoZWFkZXIgb3Ig
dXNlIHNvbWUgbnVtYmVycywgaWYgdGhlIA0KPiBoZWFkZXJzIGFyZSBub3QgdGhlcmUgeWV0Lg0K
DQpSZW1vdmVkIGRlZmluZXMgYW5kIHVwZGF0ZSB0byB1c2UgbnVtYmVycy4gDQoNCj4gDQo+ID4g
Kw0KPiA+ICsgICAgdXNiMUAxMTAwMDAwMCB7DQo+IA0KPiBOb2RlIG5hbWVzIHNob3VsZCBiZSBn
ZW5lcmljLiBTZWUgYWxzbyBhbiBleHBsYW5hdGlvbiBhbmQgbGlzdCBvZiANCj4gZXhhbXBsZXMg
KG5vdA0KPiBleGhhdXN0aXZlKSBpbiBEVCBzcGVjaWZpY2F0aW9uOg0KPiBodHRwczovL2Rldmlj
ZXRyZWUtc3BlY2lmaWNhdGlvbi5yZWFkdGhlZG9jcy5pby9lbi9sYXRlc3QvY2hhcHRlcjItZGV2
DQo+IGljZXRyZWUtIGJhc2ljcy5odG1sI2dlbmVyaWMtbmFtZXMtcmVjb21tZW5kYXRpb24NCj4g
DQo+IA0KPiA+ICsgICAgICAgICAgY29tcGF0aWJsZSA9ICJpbnRlbCxhZ2lsZXg1LWR3YzMiOw0K
DQpVcGRhdGUgbm9kZSBuYW1lIHRvIGJlIGdlbmVyaWMgaW4gVjIgcGF0Y2guDQoNClRoYW5rIFlv
dQ0KQWRyaWFuIE5nDQo=
