Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2AD9375EC60
	for <lists+linux-usb@lfdr.de>; Mon, 24 Jul 2023 09:21:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230519AbjGXHVl (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 24 Jul 2023 03:21:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229823AbjGXHVj (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 24 Jul 2023 03:21:39 -0400
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AEFAEA0;
        Mon, 24 Jul 2023 00:21:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690183298; x=1721719298;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=Py9mpj8V2YIkevUQtFlHLMclyGt2gyMc9C3EbBDMt+s=;
  b=A7DC0dxwZIEAYTIAlEmqfMk5YgRSwjo3OTivM66gIu7tbN8uSAyuabbR
   cEYlqNquAMNZ2s+cqRHRaCLOZ5IAr+6/CQums+8jkIEVg2TOIzT6BvjdV
   VQyFvmWlWUduTt6V07K8cZznxvKhn1maFIeK1VIrKgyqofJf2ygFAmuRl
   Ml9g9/axsbn9+nElBdWSrjzADSdcOG7GjxLBFrnKH6Q409wbKz3xOoWNM
   ls9EddlkVPu2hkHNZzSlyyv7+u3uUC2uzlhQsb5jqPgZIC8GcW833Cc1Z
   yV7swUJhAlMjTG67cbSEsH/YvOi3G40qKalmxQjXtS/fLL01AeJ81eFFz
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10780"; a="364830956"
X-IronPort-AV: E=Sophos;i="6.01,228,1684825200"; 
   d="scan'208";a="364830956"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jul 2023 00:20:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10780"; a="719560364"
X-IronPort-AV: E=Sophos;i="6.01,228,1684825200"; 
   d="scan'208";a="719560364"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by orsmga007.jf.intel.com with ESMTP; 24 Jul 2023 00:18:36 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 24 Jul 2023 00:18:35 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Mon, 24 Jul 2023 00:18:35 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.170)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Mon, 24 Jul 2023 00:18:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iho4jeuUIt2V/Woe+GKDbiDuFY1BxESzIfjctmV3svNhVILXMtZFh8g9vJ2WboX5bf0f5FkV3WE7O8dEvo953Fy2lSGkjfdwzNiKwfRwzJQ3A4ZEEdDt0wkGIM877qdtD8Pi80ZepK5eP+uymh1bwx7GnHanhMdhqCE7KMPOEL23LBi0heVeruB3cbWFSFVPPvUDlcWzLjo2bBk4ssM15EIPm95Db8dDXnwjbpnlbu32uvMfCtMUNG9k0QGNRpuBNS8he9V/XbuUllyUvilnpQ1Xp1QxN2SAy9UkAy9bgRFOl5Wh21XwR2s88PiFKZ13+aEzS4QocO5VZdMAI7rRoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Py9mpj8V2YIkevUQtFlHLMclyGt2gyMc9C3EbBDMt+s=;
 b=n4gSH1zW6F1/HKGH86xDgZvfKWBsj3nDC0hJpSM811hZeOz/48Km+t0DqkZjY7NhBar2eit995X+Zlq6BtDgfQX5UWL0UXGPPgTxgjc125Q6gi5Wz3z63OT+67tg7h2XUkyA5saP1ZHHo6XLh94Z2VzNkJHSBMcLg78zLpkHXOJbRAz962NX2wwQKKXBAtRfasGSnxk4rOFseOai0URhxeDNluj7RJlCsvpWqZAnK/zXi/MFb/KaNdFVznGcrj1w4Ajkt2iHrKeelecbcVCi9FbMqbTrIe9KGTw3g6wK+a11RY8PcaKkNlbkJgG9KdTevDZ/8B/EJpemd5boxExnfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA2PR11MB4860.namprd11.prod.outlook.com (2603:10b6:806:11b::10)
 by CYYPR11MB8407.namprd11.prod.outlook.com (2603:10b6:930:c1::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.32; Mon, 24 Jul
 2023 07:18:34 +0000
Received: from SA2PR11MB4860.namprd11.prod.outlook.com
 ([fe80::bbee:647b:4a59:2a9a]) by SA2PR11MB4860.namprd11.prod.outlook.com
 ([fe80::bbee:647b:4a59:2a9a%7]) with mapi id 15.20.6609.030; Mon, 24 Jul 2023
 07:18:32 +0000
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
Subject: RE: [PATCH v2 1/2] dt-bindings: usb: Add Intel SoCFPGA USB controller
Thread-Topic: [PATCH v2 1/2] dt-bindings: usb: Add Intel SoCFPGA USB
 controller
Thread-Index: AQHZvflH4k6c0u0O8ECuPkXMRwqJHa/IfkMAgAABPxA=
Date:   Mon, 24 Jul 2023 07:18:32 +0000
Message-ID: <SA2PR11MB486040E69B4DCE82631213328002A@SA2PR11MB4860.namprd11.prod.outlook.com>
References: <cover.1690179693.git.adrian.ho.yin.ng@intel.com>
 <0d12c7a196d6ad81cfc69b281dd1c4cca623d9bd.1690179693.git.adrian.ho.yin.ng@intel.com>
 <70a823a4-54d1-18a3-3d77-45564d88e8f1@linaro.org>
In-Reply-To: <70a823a4-54d1-18a3-3d77-45564d88e8f1@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA2PR11MB4860:EE_|CYYPR11MB8407:EE_
x-ms-office365-filtering-correlation-id: fd3e7c24-2f61-464c-7fc7-08db8c163031
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 5G86jxlEEDpFa4ayrkRq1qeOI4CFnL9k3hPk8SroCjNORhCEANVYxW74wGSSULqnH6S2KP1Vimt2zJwJ7/+cIMRTwhbM8KyOcbtDO9SUGAoAb12XrB5roBUpxEtPMxzooC3gInzlc4VXLdzouRg3k5FWmvsN2ZCEW0USDko2wQ/LaTXMvcPkSW26+2hONJhGOhE93P/+BW4pFeO2CVOoHYjOaO9RZfvD7aYBjFU1630u0RPPI84dwbcBITFTULmKtzJE7BOl5LNNs7MWU8aOXsW0FK6skurRhdknCsIKKuozEinHJvUZiqkMGy75tOsPf5Wkpex4Q4wl9r8HN8AqUFi4aqeevXivo63KCAVRXyxQotMYW4QMWzO1IoB8XUzKN/WTUc8AS8Lf7snQ2sSY5imr+n0jAjbYImUC/mJhfLXQM2KY14oQxws8OhYjGR7SceEjz3wmxZGVKrthhR4RK89Rc6x+TcefVXGClcfZZLoxx0u0mESIgGOYwhL+lX19Frg9ApPT9EWEMOnd6WvPkAlbIp2yW4HJy1Oa5Tf5CamSYHa4OwEarUDULYvF51kGtuah+seXvdBaK3xgp7X0ggnTYtvWoSRnIGVmSLTi7fkZ7XeIZTdIOqSjzLOx/2xETSSG8fhyBKMWh0eQbujj6g==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA2PR11MB4860.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(346002)(396003)(136003)(376002)(39860400002)(451199021)(5660300002)(52536014)(83380400001)(2906002)(8936002)(8676002)(38100700002)(966005)(6506007)(53546011)(478600001)(122000001)(55236004)(26005)(186003)(41300700001)(7696005)(55016003)(110136005)(82960400001)(86362001)(64756008)(66446008)(66556008)(71200400001)(9686003)(66476007)(38070700005)(316002)(33656002)(76116006)(66946007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RzZCUTBhS0cwcENQVWFtbUNRVHhoOWZGYjd0czNsM005QW5UcTZzbnc3aU42?=
 =?utf-8?B?eGNTemJqNE9MekxycVdCWENCd2RJRkxEVTEyRE5SZjl3OEw4NE0wd1NyWTJ4?=
 =?utf-8?B?Y2lmSllKdzVIemoxOVZQTDFtNmxrMW4zbTlMRGhscHVrRVJjNXZHZFpVNUE2?=
 =?utf-8?B?cDR3RXhId3p4aHFsenlsNDFDYmNxVnArSldQK1FNTjRFdWg5alh4a01TOXl5?=
 =?utf-8?B?T0w2VGNvRkh5YTMwZ0xPaFU4czFKMnhxdVAvQ0RPTDBHbHJqR2hxdGYwdVp3?=
 =?utf-8?B?MU54U095QUx0WXp6QlB2elhlUWZQV3oxS2F4NXVFWTNsSkwvZFh0NmFQRG9T?=
 =?utf-8?B?U2NFWGw2WjFTaGd6V2ora3BwMHpJVHZpRGdWNXRDcVlTZndReVdlanNqd2FZ?=
 =?utf-8?B?dHFJSGFQRGU0bnR6U21paytudkRSU2p4OGMxbUFxQzdpTUZPOW1LSW1ibll4?=
 =?utf-8?B?NlM1K3lZVVBCU3hNVG1FNmFnakVmdkFkcWNjYjRYMy9Rak1pWWx5UFluMjNR?=
 =?utf-8?B?Z0twWG5leE1MRDhYM3JWN1ZnakJYcWs1TlE0MmRaRWR2TlRsWEhPTWFwQnh3?=
 =?utf-8?B?SnZpbmRMVFZDNVFjcjVKenZOYkJ5RjAzcnhvamZMZktBOXV0RnpKa0dxL0JQ?=
 =?utf-8?B?RjdRcjR3VkxFT3B5Tkt3bnJONENzMnltNW1nYXRGdXlBcE9hRllFeWZZcnVr?=
 =?utf-8?B?RGFqeDJ5YXN6VTZ6UGFHRzh2ektqa3RmVEJQQ1ZtSGV6RUJ1RmU3QmlsNmlC?=
 =?utf-8?B?RXcybzZiVFZtSWNzTkp6SVdYZXZyeDNkeVgvY3NNUnZWc2JWdUYvTzQxdFls?=
 =?utf-8?B?cDYrSVpkQWZ3Vms1MmhTblFzWTFYRkFOY0FrRlQvcnFScXJGOW5rQUdiakN5?=
 =?utf-8?B?SU1yc2k5ckNGaWNQSktFTmh1bTdmb05WVEVBdlRUYU5hV1Ntem9STzVLREE4?=
 =?utf-8?B?T2gzWTQrb2JSUVl2eno1Vjh4SjRPYWNYT0VJVFlmMDZQeTBCNVBndTZBcEIv?=
 =?utf-8?B?anJTQTh1STJFY2VIaVlUNURRQ3ZQSGc2YXJBVU1OV1dUZXlmZmZyc1JJRC9T?=
 =?utf-8?B?SUVHZDhrVEU2VGZkUU9ScUkySVl3RC9CcndmQWs5OEJBUFNQSGw1TlNlZlkv?=
 =?utf-8?B?cmRnY2JsZVB2UFJKR0xqMC9DS0FXRUp5aDBSWGxGaTlyVGd1SUYzOCsvd3Z2?=
 =?utf-8?B?VnplUDhKaHF4d2J1Vk0rU2ltRm1qQjJzUzlPYnEzYVU3cGljYjZYWXRlV2ps?=
 =?utf-8?B?WTVHY0ZKZWxPTjV4M0lVdEJsOUJhREQxcXorSEVqZWU1U2xOQ2lQbUVxWXBM?=
 =?utf-8?B?cWFDZU1hZlZSam1zaUtIdjdONGNuVWx3NTUwZ1ZSZms0cmhieFdaZWhzNDU1?=
 =?utf-8?B?OUticTZxbVR1cnJ4TVpicWoyZTJ6c2xWd1dUcE5VaWwwRHZOYm9vMTgwQVdr?=
 =?utf-8?B?L2JMc2FGOUMyUXFrOVR4TWE2Y3A3YkcycHNMaEFWZ2c3cjQ1MVJjWU00OXdk?=
 =?utf-8?B?WkltbzJJbDVMblFueUVhVk1ZeFQ3R1R0Qno1c2c1M3JNelJuZWptY1ZDYTB2?=
 =?utf-8?B?dVhwL1EyRUw2dmtKdUQrOHVrUzZuMGx2bndxUHJDOGQvQjBNUHFUeUFSbFFF?=
 =?utf-8?B?UElEbDk4d3RsS3NvZWFGY3NnbWJiYnpkblh1WVNJeStHQ0tzK2I1czVNeXpD?=
 =?utf-8?B?T1FDeUpCQTJwdXdWcDNnZXZuUWVwY2hBR3lBdmdUQUZqNTN3bDUrdmFjWnJm?=
 =?utf-8?B?SkIxVVN3RlFLbS8xaWFEbG5IcFhNWGI3TlkwVjhpeVF1S0U0Wm96dmE4NzVV?=
 =?utf-8?B?WjQyL2dNMm1jQ2lSY3NER3hBSytBOXoramdWc1hjWkdnTGxRTy9uaTV3YlpD?=
 =?utf-8?B?VStZN1J3amhrbm9EUW5kYkt1bmtia0RNVW1PMmsydkZFZ3dWOGJ5NHorcGtt?=
 =?utf-8?B?Z0RPaVlteFFMeTZnV2RkZkJ1MTIzdkthYjdzUFQyOVRRMEFzdlZ3ZnBia2ty?=
 =?utf-8?B?QTZFN25XYjlLbmp6aUV2cXlNYmZJNDFvb29LeFRPNXZMRVd6U0xRcysxWXhB?=
 =?utf-8?B?aE5PQ3p4a3dySFVMaHd6MmRlbjUzK2Y5K2Rnek5mTlBNZHRWZ3VTaWRXOVJ0?=
 =?utf-8?B?N0k0Z1ZaL0xndEdjdklDQVpIY3g3SUkyQ2VOdWtvdlRScGp5RldwYnhrMGpQ?=
 =?utf-8?B?Wnc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4860.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd3e7c24-2f61-464c-7fc7-08db8c163031
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jul 2023 07:18:32.8423
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Sd6HeGyb+9+MvQNYUbbximsOHDKa0AIbD/fwYB67EAeJyWBAWLWx92T3fnq+/1MT7/4LvebgOE9I4lM2DyLomng997DLDNPw/FDHvW1FVow=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR11MB8407
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

PiBGcm9tOiBLcnp5c3p0b2YgS296bG93c2tpIDxrcnp5c3p0b2Yua296bG93c2tpQGxpbmFyby5v
cmc+DQo+IFNlbnQ6IE1vbmRheSwgMjQgSnVseSwgMjAyMyAzOjA1IFBNDQo+IFRvOiBOZywgQWRy
aWFuIEhvIFlpbiA8YWRyaWFuLmhvLnlpbi5uZ0BpbnRlbC5jb20+Ow0KPiBncmVna2hAbGludXhm
b3VuZGF0aW9uLm9yZzsgcm9iaCtkdEBrZXJuZWwub3JnOw0KPiBrcnp5c3p0b2Yua296bG93c2tp
K2R0QGxpbmFyby5vcmc7IGNvbm9yK2R0QGtlcm5lbC5vcmc7IGxpbnV4LQ0KPiB1c2JAdmdlci5r
ZXJuZWwub3JnOyBkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZzsNCj4gVGhpbmguTmd1eWVuQHN5
bm9wc3lzLmNvbTsgcC56YWJlbEBwZW5ndXRyb25peC5kZQ0KPiBTdWJqZWN0OiBSZTogW1BBVENI
IHYyIDEvMl0gZHQtYmluZGluZ3M6IHVzYjogQWRkIEludGVsIFNvQ0ZQR0EgVVNCIGNvbnRyb2xs
ZXINCj4gDQo+IE9uIDI0LzA3LzIwMjMgMDg6MzYsIGFkcmlhbi5oby55aW4ubmdAaW50ZWwuY29t
IHdyb3RlOg0KPiA+IEZyb206IEFkcmlhbiBOZyBIbyBZaW4gPGFkcmlhbi5oby55aW4ubmdAaW50
ZWwuY29tPg0KPiA+DQo+ID4gRXhpc3RpbmcgYmluZGluZyBpbnRlbCxrZWVtYmF5LWR3YzMueWFt
bCBkb2VzIG5vdCBoYXZlIHRoZSByZXF1aXJlZA0KPiA+IHByb3BlcnRpZXMgZm9yIEludGVsIFNv
Q0ZQR0EgZGV2aWNlcy4NCj4gPiBJbnRyb2R1Y2UgbmV3IGJpbmRpbmcgZGVzY3JpcHRpb24gZm9y
IEludGVsIFNvQ0ZQR0EgVVNCIGNvbnRyb2xsZXINCj4gPiB3aGljaCB3aWxsIGJlIHVzZWQgZm9y
IGN1cnJlbnQgYW5kIGZ1dHVyZSBTb0NGUEdBIGRldmljZXMuDQo+ID4NCj4gPiBTaWduZWQtb2Zm
LWJ5OiBBZHJpYW4gTmcgSG8gWWluIDxhZHJpYW4uaG8ueWluLm5nQGludGVsLmNvbT4NCj4gPiAt
LS0NCj4gPiAgLi4uL2JpbmRpbmdzL3VzYi9pbnRlbCxzb2NmcGdhLWR3YzMueWFtbCAgICAgIHwg
ODQgKysrKysrKysrKysrKysrKysrKw0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgODQgaW5zZXJ0aW9u
cygrKQ0KPiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQNCj4gPiBEb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvdXNiL2ludGVsLHNvY2ZwZ2EtZHdjMy55YW1sDQo+ID4NCj4gPiBkaWZmIC0t
Z2l0DQo+ID4gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdXNiL2ludGVsLHNv
Y2ZwZ2EtZHdjMy55YW1sDQo+ID4gYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
dXNiL2ludGVsLHNvY2ZwZ2EtZHdjMy55YW1sDQo+ID4gbmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4g
PiBpbmRleCAwMDAwMDAwMDAwMDAuLmUzNmIwODdjMjY1MQ0KPiA+IC0tLSAvZGV2L251bGwNCj4g
PiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdXNiL2ludGVsLHNvY2Zw
Z2EtZHdjMy55YW1sDQo+ID4gQEAgLTAsMCArMSw4NCBAQA0KPiA+ICsjIFNQRFgtTGljZW5zZS1J
ZGVudGlmaWVyOiAoR1BMLTIuMC1vbmx5IE9SIEJTRC0yLUNsYXVzZSkgJVlBTUwgMS4yDQo+ID4g
Ky0tLQ0KPiA+ICskaWQ6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9zY2hlbWFzL3VzYi9pbnRlbCxz
b2NmcGdhLWR3YzMueWFtbCMNCj4gPiArJHNjaGVtYTogaHR0cDovL2RldmljZXRyZWUub3JnL21l
dGEtc2NoZW1hcy9jb3JlLnlhbWwjDQo+ID4gKw0KPiA+ICt0aXRsZTogSW50ZWwgU29DRlBHQSBE
V0MzIFVTQiBjb250cm9sbGVyDQo+ID4gKw0KPiA+ICttYWludGFpbmVyczoNCj4gPiArICAtIEFk
cmlhbiBOZyBIbyBZaW4gPGFkcmlhbi5oby55aW4ubmdAaW50ZWwuY29tPg0KPiA+ICsNCj4gPiAr
cHJvcGVydGllczoNCj4gPiArICBjb21wYXRpYmxlOg0KPiA+ICsgICAgaXRlbXM6DQo+ID4gKyAg
ICAgIC0gZW51bToNCj4gPiArICAgICAgICAgIC0gaW50ZWwsYWdpbGV4NS1kd2MzDQo+ID4gKyAg
ICAgIC0gY29uc3Q6IGludGVsLHNvY2ZwZ2EtZHdjMw0KPiANCj4gU28geW91IGRpZCBub3QgZXZl
biB3YWl0IGZvciBteSBhbnN3ZXI/IFdoYXQgaGFwcGVuZWQgaGVyZSB3aXRoIHRoaXMNCj4gY29t
cGF0aWJsZT8gSSBhc2tlZCB5b3UgdG8gY2hhbmdlIGZpbGUgbmFtZSwgbm90IGFkZCBpbnRlbCxz
b2NmcGdhLWR3YzMuDQo+IEFnYWluIC0gd2h5IHVzaW5nIGRpZmZlcmVudCBzdHlsZSBmb3IgQWdp
bGV4PyBXaGljaCBzdHlsZSBpcyBjb3JyZWN0Pw0KPiANCg0KVGhlIGludGVudGlvbiBpcyB0byB1
c2UgYSBjb21tb24gYmluZGluZyBmb3IgSW50ZWwgU29DRlBHQSBwcm9kdWN0cyB0aGF0IGlzIHVz
aW5nIERXQzMgY29udHJvbGxlci4NClRoaXMgaXMgZG9uZSB3aXRoIHJlZmVyZW5jZSB0byBxY29t
LGR3YzMueWFtbC4gDQoNCj4gPiArDQo+ID4gKyAgcmVnOg0KPiA+ICsgICAgZGVzY3JpcHRpb246
IE9mZnNldCBhbmQgbGVuZ3RoIG9mIERXQzMgY29udHJvbGxlciByZWdpc3Rlcg0KPiANCj4gV2hh
dCBoYXBwZW5lZCBoZXJlPyBJdCB3YXNuJ3QgaGVyZSBiZWZvcmUuDQoNClJlbW92ZSB1bm5lY2Vz
c2FyeSBkZXNjcmlwdGlvbiBpbiBWMy4NCg0KPiANCj4gPiArICAgIG1heEl0ZW1zOiAxDQo+ID4g
Kw0KPiA+ICsgIGNsb2NrczoNCj4gPiArICAgIGl0ZW1zOg0KPiA+ICsgICAgICAtIGRlc2NyaXB0
aW9uOiBDb250cm9sbGVyIE1hc3Rlci9Db3JlIGNsb2NrDQo+ID4gKyAgICAgIC0gZGVzY3JpcHRp
b246IENvbnRyb2xsZXIgU3VzcGVuZCBjbG9jaw0KPiA+ICsNCj4gPiArICByYW5nZXM6IHRydWUN
Cj4gPiArDQo+ID4gKyAgcmVzZXRzOg0KPiA+ICsgICAgZGVzY3JpcHRpb246IEEgbGlzdCBvZiBw
aGFuZGxlcyBmb3IgcmVzZXRzIGxpc3RlZCBpbiByZXNldC1uYW1lcw0KPiANCj4gTmVpdGhlciB3
YXMgdGhpcyB1c2VsZXNzIGRlc2NyaXB0aW9uLCBpdCBpcyBvYnZpb3VzLg0KDQpSZW1vdmUgdW5u
ZWNlc3NhcnkgZGVzY3JpcHRpb24gaW4gVjMuDQoNCj4gDQo+ID4gKyAgICBtYXhJdGVtczogMg0K
PiA+ICsNCj4gPiArICByZXNldC1uYW1lczoNCj4gPiArICAgIGl0ZW1zOg0KPiA+ICsgICAgICAt
IGNvbnN0OiBkd2MzDQo+ID4gKyAgICAgIC0gY29uc3Q6IGR3YzMtZWNjDQo+ID4gKw0KPiA+ICsg
ICcjYWRkcmVzcy1jZWxscyc6DQo+ID4gKyAgICBlbnVtOiBbIDEsIDIgXQ0KPiA+ICsNCj4gPiAr
ICAnI3NpemUtY2VsbHMnOg0KPiA+ICsgICAgZW51bTogWyAxLCAyIF0NCj4gPiArDQo+ID4gKyMg
UmVxdWlyZWQgY2hpbGQgbm9kZToNCj4gPiArDQo+ID4gK3BhdHRlcm5Qcm9wZXJ0aWVzOg0KPiA+
ICsgICJedXNiQFswLTlhLWZdKyQiOg0KPiA+ICsgICAgJHJlZjogc25wcyxkd2MzLnlhbWwjDQo+
ID4gKw0KPiA+ICtyZXF1aXJlZDoNCj4gPiArICAtIGNvbXBhdGlibGUNCj4gPiArICAtIHJlZw0K
PiA+ICsgIC0gY2xvY2tzDQo+ID4gKyAgLSByZXNldHMNCj4gPiArICAtIHJhbmdlcw0KPiA+ICsN
Cj4gPiArYWRkaXRpb25hbFByb3BlcnRpZXM6IGZhbHNlDQo+ID4gKw0KPiA+ICtleGFtcGxlczoN
Cj4gPiArICAtIHwNCj4gPiArICAgICNpbmNsdWRlIDxkdC1iaW5kaW5ncy9pbnRlcnJ1cHQtY29u
dHJvbGxlci9hcm0tZ2ljLmg+DQo+ID4gKyAgICAjaW5jbHVkZSA8ZHQtYmluZGluZ3MvaW50ZXJy
dXB0LWNvbnRyb2xsZXIvaXJxLmg+DQo+ID4gKyAgICAjaW5jbHVkZSA8ZHQtYmluZGluZ3MvcmVz
ZXQvYWx0cixyc3QtbWdyLmg+DQo+ID4gKw0KPiA+ICsgICAgdXNiQDExMDAwMDAwIHsNCj4gPiAr
ICAgICAgICAgIGNvbXBhdGlibGUgPSAiaW50ZWwsYWdpbGV4NS1kd2MzIiwgImludGVsLHNvY2Zw
Z2EtZHdjMyI7DQo+IA0KPiBTdGlsbCB3cm9uZyBpbmRlbnRhdGlvbi4uLi4NCj4gDQoNClVwZGF0
ZSBpbmRlbnRhdGlvbiBpbiBWMw0KDQo+ID4gKyAgICAgICAgICByZWcgPSA8MHgxMTAwMDAwMCAw
eDEwMDAwMD47DQo+ID4gKyAgICAgICAgICByYW5nZXM7DQo+ID4gKyAgICAgICAgICBjbG9ja3Mg
PSA8JmNsa21nciA1ND4sDQo+ID4gKyAgICAgICAgICAgICAgICAgICA8JmNsa21nciA1NT47DQo+
ID4gKyAgICAgICAgICByZXNldHMgPSA8JnJzdCBVU0IwX1JFU0VUPiwgPCZyc3QgVVNCMV9SRVNF
VD47DQo+ID4gKyAgICAgICAgICByZXNldC1uYW1lcyA9ICJkd2MzIiwgImR3YzMtZWNjIjsNCj4g
PiArICAgICAgICAgICNhZGRyZXNzLWNlbGxzID0gPDE+Ow0KPiA+ICsgICAgICAgICAgI3NpemUt
Y2VsbHMgPSA8MT47DQo+ID4gKw0KPiA+ICsgICAgICAgICAgdXNiQDExMDAwMDAwIHsNCj4gPiAr
ICAgICAgICAgICAgICAgIGNvbXBhdGlibGUgPSAic25wcyxkd2MzIjsNCj4gPiArICAgICAgICAg
ICAgICAgIHJlZyA9IDwweDExMDAwMDAwIDB4MTAwMDAwPjsNCj4gPiArICAgICAgICAgICAgICAg
IGludGVycnVwdHMgPSA8R0lDX1NQSSA5NCBJUlFfVFlQRV9MRVZFTF9ISUdIPjsNCj4gPiArICAg
ICAgICAgICAgICAgIGRyX21vZGUgPSAiaG9zdCI7DQo+ID4gKyAgICAgICAgICB9Ow0KPiA+ICsg
ICAgfTsNCj4gPiArDQo+IA0KPiBEcm9wIHRyYWlsaW5nIGxpbmUuDQoNCkRyb3AgdHJhaWxpbmcg
bGluZSBpbiBWMy4NCg0KPiANCj4gSW5zdGVhZCBvZiByZXNlbmRpbmcganVzdCBhZnRlciB5b3Vy
IHJlcGx5LCBhbGxvdyBmb3IgcmV2aWV3ZXIgdG8gcmVzcG9uZC4NCj4gDQoNCk15IGFwb2xvZ2ll
cyB3aWxsIHdhaXQgZm9yIHJlcGx5Lg0KDQpUaGFuayBZb3UNCkFkcmlhbg0KDQo=
