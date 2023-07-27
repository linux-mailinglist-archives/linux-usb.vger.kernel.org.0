Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C5C5F7643B0
	for <lists+linux-usb@lfdr.de>; Thu, 27 Jul 2023 04:09:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230307AbjG0CJX (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 26 Jul 2023 22:09:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230294AbjG0CJU (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 26 Jul 2023 22:09:20 -0400
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79AB92126;
        Wed, 26 Jul 2023 19:09:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690423753; x=1721959753;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=ylRxP+TBGhUjJSrtT9sWKLkLcS7oGmhim+VXrI9geE0=;
  b=A+wfW1ZLY8IdcuOUIY5AF0mJkkO6+/nBH5afbtTHXKDYnue0BHrisYKN
   yyiqyXKXjJeXOjADOCyq3zpvTP+FERL6OIdr+AKo7PXWCIsQ4fAgKDu7L
   Zo0OgfcOqFbfJB3+aglVYXger9kmKba6y33Bv3Pn+kLOD8GH5XdnBmnk8
   NUI+K8f3fKsiWkSvH1kpbq9HXyJNxB5J20gitblOq0Lbldc8xMWYtve/l
   wAs6GWQCxS386MHZf+0doXVqc4G899rJq91FeqvqhUN1PIm0FqbvRL5jp
   zi7f6WBfWbT0TDuxvtdTXv97Q5P14aJwZpobKTgM+4k4OzGvfv+YJkd84
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="434455692"
X-IronPort-AV: E=Sophos;i="6.01,233,1684825200"; 
   d="scan'208";a="434455692"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jul 2023 19:09:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; 
   d="scan'208";a="870164051"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmsmga001.fm.intel.com with ESMTP; 26 Jul 2023 19:09:13 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 26 Jul 2023 19:09:12 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 26 Jul 2023 19:09:11 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Wed, 26 Jul 2023 19:09:11 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.42) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 26 Jul 2023 19:09:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Oz9PFy0gmYelegz2BzpqHCme6Cts1k9gi9d0EbuotHxEfOGXqJpcb6hJu9NH+NhTflt7NNm57bchK1a6ybXjm79WlR1ntl/gxWIkKvI+en3LaF8ygIN+kbITPX/YxBazjiuJozKgVcI9rno/rhe+qOvZq1+ScS6QBL/fcPOp8Idq1Hv0to1fFZudVuPdyEUJy0dSTY7aP5mZ9ODyLft2+oYcdewq8ktXQt88+5sFKz9vm/3J0Ft0wGWNuzFROndM3TkQcKIJ7QNWYvxKVcOFu3zf7WyhLpF4zuEFQRpIX2z4JEyYWyhbJUNFOQGDLU2XckKerD/wMlDe/vd+oim0yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ylRxP+TBGhUjJSrtT9sWKLkLcS7oGmhim+VXrI9geE0=;
 b=j/hcyB6vxE6ruNMan311Lh1Z0LNZgGcxIs4MKs/BaoBfHWiYgoeegzhG15u6IJ9QnneTaAdw/IlSaTnHQ4p1Q5RfZHg31hPQHwCwUnVZQrLy/z77kY9cZ8tIu7mka0bkYPU5m8bIIbnFmIfi+OwZehJNA8oBhsiwaHyNtDXux9+rQXHkqkPddePEBQorB7ZyGS2XDbf3hFha8wDru82k+7dqzr+0dm6slhnt3NAAN8ND15R3URLg9G4FsC81EKs00Gh/pNf/oC+9yQTVSReydovfpXZekgYJCBqZYtjVtX5jvo2f3wLZ0ZXZ4D3eFMGxzVWaHjZJp/DJ/ylySIYUbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA2PR11MB4860.namprd11.prod.outlook.com (2603:10b6:806:11b::10)
 by CH0PR11MB5442.namprd11.prod.outlook.com (2603:10b6:610:d1::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Thu, 27 Jul
 2023 02:09:05 +0000
Received: from SA2PR11MB4860.namprd11.prod.outlook.com
 ([fe80::bbee:647b:4a59:2a9a]) by SA2PR11MB4860.namprd11.prod.outlook.com
 ([fe80::bbee:647b:4a59:2a9a%7]) with mapi id 15.20.6631.026; Thu, 27 Jul 2023
 02:09:05 +0000
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
Thread-Index: AQHZvflH4k6c0u0O8ECuPkXMRwqJHa/IfkMAgAABPxCAAAUxgIAAA0uQgAAVI4CABESUIA==
Date:   Thu, 27 Jul 2023 02:09:05 +0000
Message-ID: <SA2PR11MB486033FD1B402BC5DA672A958001A@SA2PR11MB4860.namprd11.prod.outlook.com>
References: <cover.1690179693.git.adrian.ho.yin.ng@intel.com>
 <0d12c7a196d6ad81cfc69b281dd1c4cca623d9bd.1690179693.git.adrian.ho.yin.ng@intel.com>
 <70a823a4-54d1-18a3-3d77-45564d88e8f1@linaro.org>
 <SA2PR11MB486040E69B4DCE82631213328002A@SA2PR11MB4860.namprd11.prod.outlook.com>
 <2b3fcc1b-156d-9f5f-3436-139ebcd846fe@linaro.org>
 <SA2PR11MB4860256BC6BC5A2F9259F8698002A@SA2PR11MB4860.namprd11.prod.outlook.com>
 <70d1f41d-2c00-d80b-97c1-6d80301d79b8@linaro.org>
In-Reply-To: <70d1f41d-2c00-d80b-97c1-6d80301d79b8@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA2PR11MB4860:EE_|CH0PR11MB5442:EE_
x-ms-office365-filtering-correlation-id: f73d503d-a783-48ae-8482-08db8e46742c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 2DuK7GqYNfQjwRPsa6//ak4Nr/KqlUsg3qImiw4iInOoAOuQ92t9mVKSze3EeIqk6yN2hOMkpO+CXIkcIGAw+QR9zChk5cI8OTILy21mHlOG/PfBDIUqGHQgahz+UKV28vYZ5arccAqP07lwRelHBM4CmOf/+qQB5mW9KbYXXeoxNAZud5r8nSBe47Hjt0NgqL60gFy3nypiLjluWsvjpgjhXwNtzRY3S0HLeNdTryYNuahtbhnSdU1w6iynLs45S60XfBFynMsEP2e5WHAepM1u/Wq89Hv5q4qbpVCfBsHOB4dWg1Wlx4olYhnOQtZzgmIDjTcCtM9Rz5Y+p8Ke+YcTVgumPig0DXujvCauwnMcYFT1nIL/Z9hMD7hY2tO1Uae7raFBxSt31khZqHGzjxN65/KRZhwxPdtPjYIbrJrwfCKo5X1USDJvuz7jHea44gaHfDQit5twdaojsYJdhl6YLBlMq6Fyt+NaLr4MUzMMXxvFE0Aym76LesH2BV3Nqyfjyo9sorct+tN0QhYxyyzrVi58zjYogBYwCpyIB1cJk0Mk+K2yHeUyI+/UXr6bS9VJVD45s7YtP67fcRfJJExNCfKVMUqPQ9EOk+9EjxWaLCa/csFZFRj57Ef+yFo+peFMqHZK3I9Y22hSJIMkrQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA2PR11MB4860.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(136003)(396003)(346002)(376002)(39860400002)(451199021)(9686003)(966005)(110136005)(7696005)(478600001)(66556008)(71200400001)(53546011)(186003)(26005)(6506007)(2906002)(66476007)(64756008)(316002)(76116006)(5660300002)(8936002)(8676002)(41300700001)(52536014)(66946007)(82960400001)(66446008)(122000001)(38100700002)(33656002)(38070700005)(55016003)(86362001)(83380400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WnFPenQra2pUSk1lR1lJZkVhRWs5MURwMnVNdE0vRmVjcS9mcTVPV3d5eUIr?=
 =?utf-8?B?bGxDMkJzd2ZRQ2M1ZHZod1dYVWsycGJxeDAybEVOQlFveXRHYU4zNWc2YjB1?=
 =?utf-8?B?VFVRM0RWUDdqeUhCLzBibU1KR1FBNllzUTd4TlRoWDE1MTZKMGlZRmZpVjFI?=
 =?utf-8?B?S2E4T2pYYjVwZThSTS9DWVRWQkN2RkpUQmlVakhzaG9TUWZ3MzJwekFzYkpw?=
 =?utf-8?B?L2dBRkM4V2wwS1JtZFh4U21WekxYNks1RURnaUdHY0oreis5SHoxY1QreGhS?=
 =?utf-8?B?NWVQaDd3cVhsWC8wSFNUb0htRC8xTUN0SmNJMTNVa05PZTFQeEhxUzlMRDVr?=
 =?utf-8?B?Vk1McTl0MzFzT2NrTUViRVlGek5uZXg4eHlyT3kya3F6akduS1VyWkJUK2Fp?=
 =?utf-8?B?M3RiTGdjNFpvVFg2RVRvVXFVK1poMlJzTlZ4c0FzdUY1Ukt1cTFtZVhoK2Js?=
 =?utf-8?B?WHpOMlV3WGY4aGd5bHpYTng0RW5UbSs2aC95ZTRDU0JoRzVrdTVUVFBWWWox?=
 =?utf-8?B?Nzl0MXY3dmRRbXZMcy9TYUlXRS83RDNwVGtMcyt6SHFnMXJnRFIrbnhWZFJ1?=
 =?utf-8?B?bXQ4azZSaWh2dnJ0MzU0NkRWQ3RQRlk0QXNRUWtzakdFb2JCUVdNa0sxc2FF?=
 =?utf-8?B?WjRaMkx5dEpITFd3TjBrcjdHYVFCcXhVUHlBdGdtUjJkdDZBS29GcmIxRytL?=
 =?utf-8?B?VlFjMHhub09ONFluNWxKbnZwRXREM0JLVWNKbUo0YVY3bkcxMXkvUHg0ZzNh?=
 =?utf-8?B?RHZMS0grNnMrdmx6VEE1Q0IwcTJMaytHVXJqZVNWS0x5eTBHRlN3OG5GVURv?=
 =?utf-8?B?Q2RObFZQVG1QSUdtN3hYdWllcWE3Mld2akRUWE9vSUJiazhKemlCaXNocVg4?=
 =?utf-8?B?Y0FqWmRVbGZ0QXVNdXJMUE05NzQvbFllaWJGajIrM3QwWDFDTjFYZGNNYjZl?=
 =?utf-8?B?V3JZWm15Z2NWU0sxTG5UUll1YWdCU2IvYWR2bm9oTG5RSjlYeUN0NjRwRk9G?=
 =?utf-8?B?NjB1S29PWUtTY2tEblE2NnFBNWlhVEV2amZ1Z3lsOTRvc2NLNmt1WlNtd1hF?=
 =?utf-8?B?ODMxREZ0Wm9XZ2p3TWI2c1pzOHNnblZBTWppdXA0QnZIajhLTnJ3VzAxbzhu?=
 =?utf-8?B?Nk01WHBobCt3U2dEWEtjRC9VcWJXSkpHZGw5c1M0VGRQNW9pOGhWYVE2aUU4?=
 =?utf-8?B?ZVlZVE5DNkZYMCtsU0c0ZFYzY1dFQVJCekEwbWd2YTRkTWhVV2xMQ0RxNnAw?=
 =?utf-8?B?SFNIRC9qUkwxeGpkT3BHT1N2ZWFad0ZUUkp3L1l1SFZuSWVFYktCWG5OMGE3?=
 =?utf-8?B?VXpEOHQvbjVLa2dyeWZxbVVMb3Zxd1ZuMUF1cVFaN2VXU3NXa25RNHBMbnFi?=
 =?utf-8?B?Wnp6VjFyK2VxdmE3WGwzdFZYTk55a3JLRU96ZjJCTkplVVFyejNCTVQreGM5?=
 =?utf-8?B?b1lRc3ZzckkzTDlrRVgzVVpXYWl6U01RSzE1YXA3SDZuTjFFMDRzQTdZakZC?=
 =?utf-8?B?dk56SC9mMXlSSXpCWkw3QW5PMEVmWDJtU2tGSnVMSDl4dWRDMVBzbGNhdE5R?=
 =?utf-8?B?YkpuZndwblVBUUhSWVNFNk9KKzdoeVlZMHp3a2RFMlBEV1dFb2JnOUNNU2xO?=
 =?utf-8?B?Q1VKdFgwaDNXUEJHZ3RpVzdyL2l3bVQyVE9ES0JrK2IzVTBSL1lmQ3J1eHc1?=
 =?utf-8?B?V0xCT0VWZDQvWlNaS3ZGcE1tM2FhMzVDU3huRmdmdUcvNzNCcWIzYlhIajF6?=
 =?utf-8?B?VVlXSFhIMjdCc0tKa0Vya09pYWpuNEZ5SnlwbnltdUNzTnlQS3Y2RzQvaUJE?=
 =?utf-8?B?cFNVcUZLK2RCWFdiRXdjNjB1ZFIrOE9ZaUlCQ0h3TTl0WlNIcmZjSnQ0WDdp?=
 =?utf-8?B?dHQyNGFhN2ZGMGRtV1VLaFR2a2pRWlM5MFBZQjFpdHVBYXRsQzZhcTZ3cTFY?=
 =?utf-8?B?emJ3SXdNT1d1OWRuWkgxdDRGd2IzSDB4TVhtWTZ6cnVLRDQ4cDVadHdpeGoy?=
 =?utf-8?B?QXhVbXcrSUFFYjFWcTl4a0xHOEIzbXdSTVlVMEpRMGpuZ0xnTXovWjBVZU16?=
 =?utf-8?B?WnNFNXA3ODJYTWJ1bzJsTjdMWmNmZG1ubFhYQlFpWjlTV3crVU82NjEzb1RO?=
 =?utf-8?B?aDFhNm9jbk1XTldXWjMyRjgrbWgyS1JZOXNSVkhHZi9XR2poR2ZMUndkQmVG?=
 =?utf-8?B?S3c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4860.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f73d503d-a783-48ae-8482-08db8e46742c
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jul 2023 02:09:05.0920
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: H5TIJLSAbnDChCNhCw3a4Txo7vQwAUXc7jM5+2FekFkDJIN67tWVzzLnyjDStKZuCnsrVEVPFbHlfSOYXpAl4ikFOeStxemcrjLpLW97f4A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5442
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBLcnp5c3p0b2YgS296bG93c2tp
IDxrcnp5c3p0b2Yua296bG93c2tpQGxpbmFyby5vcmc+DQo+IFNlbnQ6IE1vbmRheSwgMjQgSnVs
eSwgMjAyMyA0OjU1IFBNDQo+IFRvOiBOZywgQWRyaWFuIEhvIFlpbiA8YWRyaWFuLmhvLnlpbi5u
Z0BpbnRlbC5jb20+Ow0KPiBncmVna2hAbGludXhmb3VuZGF0aW9uLm9yZzsgcm9iaCtkdEBrZXJu
ZWwub3JnOw0KPiBrcnp5c3p0b2Yua296bG93c2tpK2R0QGxpbmFyby5vcmc7IGNvbm9yK2R0QGtl
cm5lbC5vcmc7IGxpbnV4LQ0KPiB1c2JAdmdlci5rZXJuZWwub3JnOyBkZXZpY2V0cmVlQHZnZXIu
a2VybmVsLm9yZzsNCj4gVGhpbmguTmd1eWVuQHN5bm9wc3lzLmNvbTsgcC56YWJlbEBwZW5ndXRy
b25peC5kZQ0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHYyIDEvMl0gZHQtYmluZGluZ3M6IHVzYjog
QWRkIEludGVsIFNvQ0ZQR0EgVVNCDQo+IGNvbnRyb2xsZXINCj4gDQo+IE9uIDI0LzA3LzIwMjMg
MDk6NTMsIE5nLCBBZHJpYW4gSG8gWWluIHdyb3RlOg0KPiA+PiAtLS0tLU9yaWdpbmFsIE1lc3Nh
Z2UtLS0tLQ0KPiA+PiBGcm9tOiBLcnp5c3p0b2YgS296bG93c2tpIDxrcnp5c3p0b2Yua296bG93
c2tpQGxpbmFyby5vcmc+DQo+ID4+IFNlbnQ6IE1vbmRheSwgMjQgSnVseSwgMjAyMyAzOjI4IFBN
DQo+ID4+IFRvOiBOZywgQWRyaWFuIEhvIFlpbiA8YWRyaWFuLmhvLnlpbi5uZ0BpbnRlbC5jb20+
Ow0KPiA+PiBncmVna2hAbGludXhmb3VuZGF0aW9uLm9yZzsgcm9iaCtkdEBrZXJuZWwub3JnOw0K
PiA+PiBrcnp5c3p0b2Yua296bG93c2tpK2R0QGxpbmFyby5vcmc7IGNvbm9yK2R0QGtlcm5lbC5v
cmc7IGxpbnV4LQ0KPiA+PiB1c2JAdmdlci5rZXJuZWwub3JnOyBkZXZpY2V0cmVlQHZnZXIua2Vy
bmVsLm9yZzsNCj4gPj4gVGhpbmguTmd1eWVuQHN5bm9wc3lzLmNvbTsgcC56YWJlbEBwZW5ndXRy
b25peC5kZQ0KPiA+PiBTdWJqZWN0OiBSZTogW1BBVENIIHYyIDEvMl0gZHQtYmluZGluZ3M6IHVz
YjogQWRkIEludGVsIFNvQ0ZQR0EgVVNCDQo+ID4+IGNvbnRyb2xsZXINCj4gPj4NCj4gPj4gT24g
MjQvMDcvMjAyMyAwOToxOCwgTmcsIEFkcmlhbiBIbyBZaW4gd3JvdGU6DQo+ID4+Pj4gRnJvbTog
S3J6eXN6dG9mIEtvemxvd3NraSA8a3J6eXN6dG9mLmtvemxvd3NraUBsaW5hcm8ub3JnPg0KPiA+
Pj4+IFNlbnQ6IE1vbmRheSwgMjQgSnVseSwgMjAyMyAzOjA1IFBNDQo+ID4+Pj4gVG86IE5nLCBB
ZHJpYW4gSG8gWWluIDxhZHJpYW4uaG8ueWluLm5nQGludGVsLmNvbT47DQo+ID4+Pj4gZ3JlZ2to
QGxpbnV4Zm91bmRhdGlvbi5vcmc7IHJvYmgrZHRAa2VybmVsLm9yZzsNCj4gPj4+PiBrcnp5c3p0
b2Yua296bG93c2tpK2R0QGxpbmFyby5vcmc7IGNvbm9yK2R0QGtlcm5lbC5vcmc7IGxpbnV4LQ0K
PiA+Pj4+IHVzYkB2Z2VyLmtlcm5lbC5vcmc7IGRldmljZXRyZWVAdmdlci5rZXJuZWwub3JnOw0K
PiA+Pj4+IFRoaW5oLk5ndXllbkBzeW5vcHN5cy5jb207IHAuemFiZWxAcGVuZ3V0cm9uaXguZGUN
Cj4gPj4+PiBTdWJqZWN0OiBSZTogW1BBVENIIHYyIDEvMl0gZHQtYmluZGluZ3M6IHVzYjogQWRk
IEludGVsIFNvQ0ZQR0EgVVNCDQo+ID4+Pj4gY29udHJvbGxlcg0KPiA+Pj4+DQo+ID4+Pj4gT24g
MjQvMDcvMjAyMyAwODozNiwgYWRyaWFuLmhvLnlpbi5uZ0BpbnRlbC5jb20gd3JvdGU6DQo+ID4+
Pj4+IEZyb206IEFkcmlhbiBOZyBIbyBZaW4gPGFkcmlhbi5oby55aW4ubmdAaW50ZWwuY29tPg0K
PiA+Pj4+Pg0KPiA+Pj4+PiBFeGlzdGluZyBiaW5kaW5nIGludGVsLGtlZW1iYXktZHdjMy55YW1s
IGRvZXMgbm90IGhhdmUgdGhlDQo+ID4+Pj4+IHJlcXVpcmVkIHByb3BlcnRpZXMgZm9yIEludGVs
IFNvQ0ZQR0EgZGV2aWNlcy4NCj4gPj4+Pj4gSW50cm9kdWNlIG5ldyBiaW5kaW5nIGRlc2NyaXB0
aW9uIGZvciBJbnRlbCBTb0NGUEdBIFVTQiBjb250cm9sbGVyDQo+ID4+Pj4+IHdoaWNoIHdpbGwg
YmUgdXNlZCBmb3IgY3VycmVudCBhbmQgZnV0dXJlIFNvQ0ZQR0EgZGV2aWNlcy4NCj4gPj4+Pj4N
Cj4gPj4+Pj4gU2lnbmVkLW9mZi1ieTogQWRyaWFuIE5nIEhvIFlpbiA8YWRyaWFuLmhvLnlpbi5u
Z0BpbnRlbC5jb20+DQo+ID4+Pj4+IC0tLQ0KPiA+Pj4+PiAgLi4uL2JpbmRpbmdzL3VzYi9pbnRl
bCxzb2NmcGdhLWR3YzMueWFtbCAgICAgIHwgODQNCj4gKysrKysrKysrKysrKysrKysrKw0KPiA+
Pj4+PiAgMSBmaWxlIGNoYW5nZWQsIDg0IGluc2VydGlvbnMoKykNCj4gPj4+Pj4gIGNyZWF0ZSBt
b2RlIDEwMDY0NA0KPiA+Pj4+PiBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdXNi
L2ludGVsLHNvY2ZwZ2EtZHdjMy55YW1sDQo+ID4+Pj4+DQo+ID4+Pj4+IGRpZmYgLS1naXQNCj4g
Pj4+Pj4gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdXNiL2ludGVsLHNvY2Zw
Z2EtZHdjMy55YW1sDQo+ID4+Pj4+IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L3VzYi9pbnRlbCxzb2NmcGdhLWR3YzMueWFtbA0KPiA+Pj4+PiBuZXcgZmlsZSBtb2RlIDEwMDY0
NA0KPiA+Pj4+PiBpbmRleCAwMDAwMDAwMDAwMDAuLmUzNmIwODdjMjY1MQ0KPiA+Pj4+PiAtLS0g
L2Rldi9udWxsDQo+ID4+Pj4+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy91c2IvaW50ZWwsc29jZnBnYS0NCj4gZHdjMy55YW0NCj4gPj4+Pj4gKysrIGwNCj4gPj4+Pj4g
QEAgLTAsMCArMSw4NCBAQA0KPiA+Pj4+PiArIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogKEdQ
TC0yLjAtb25seSBPUiBCU0QtMi1DbGF1c2UpICVZQU1MDQo+ID4+Pj4+ICsxLjINCj4gPj4+Pj4g
Ky0tLQ0KPiA+Pj4+PiArJGlkOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvc2NoZW1hcy91c2IvaW50
ZWwsc29jZnBnYS1kd2MzLnlhbWwjDQo+ID4+Pj4+ICskc2NoZW1hOiBodHRwOi8vZGV2aWNldHJl
ZS5vcmcvbWV0YS1zY2hlbWFzL2NvcmUueWFtbCMNCj4gPj4+Pj4gKw0KPiA+Pj4+PiArdGl0bGU6
IEludGVsIFNvQ0ZQR0EgRFdDMyBVU0IgY29udHJvbGxlcg0KPiA+Pj4+PiArDQo+ID4+Pj4+ICtt
YWludGFpbmVyczoNCj4gPj4+Pj4gKyAgLSBBZHJpYW4gTmcgSG8gWWluIDxhZHJpYW4uaG8ueWlu
Lm5nQGludGVsLmNvbT4NCj4gPj4+Pj4gKw0KPiA+Pj4+PiArcHJvcGVydGllczoNCj4gPj4+Pj4g
KyAgY29tcGF0aWJsZToNCj4gPj4+Pj4gKyAgICBpdGVtczoNCj4gPj4+Pj4gKyAgICAgIC0gZW51
bToNCj4gPj4+Pj4gKyAgICAgICAgICAtIGludGVsLGFnaWxleDUtZHdjMw0KPiA+Pj4+PiArICAg
ICAgLSBjb25zdDogaW50ZWwsc29jZnBnYS1kd2MzDQo+ID4+Pj4NCj4gPj4+PiBTbyB5b3UgZGlk
IG5vdCBldmVuIHdhaXQgZm9yIG15IGFuc3dlcj8gV2hhdCBoYXBwZW5lZCBoZXJlIHdpdGgNCj4g
Pj4+PiB0aGlzIGNvbXBhdGlibGU/IEkgYXNrZWQgeW91IHRvIGNoYW5nZSBmaWxlIG5hbWUsIG5v
dCBhZGQgaW50ZWwsc29jZnBnYS0NCj4gZHdjMy4NCj4gPj4+PiBBZ2FpbiAtIHdoeSB1c2luZyBk
aWZmZXJlbnQgc3R5bGUgZm9yIEFnaWxleD8gV2hpY2ggc3R5bGUgaXMgY29ycmVjdD8NCj4gPj4+
Pg0KPiA+Pj4NCj4gPj4+IFRoZSBpbnRlbnRpb24gaXMgdG8gdXNlIGEgY29tbW9uIGJpbmRpbmcg
Zm9yIEludGVsIFNvQ0ZQR0EgcHJvZHVjdHMNCj4gPj4+IHRoYXQgaXMNCj4gPj4gdXNpbmcgRFdD
MyBjb250cm9sbGVyLg0KPiA+Pj4gVGhpcyBpcyBkb25lIHdpdGggcmVmZXJlbmNlIHRvIHFjb20s
ZHdjMy55YW1sLg0KPiA+Pg0KPiA+PiBOb3BlLCB5b3VyIGRyaXZlciBjaGFuZ2UgZG9lcyBub3Qg
bWF0Y2ggaXQgYXQgYWxsLiBZb3VyIGV4cGxhbmF0aW9uDQo+ID4+IGRvZXMgbm90IG1ha2UgYW55
IHNlbnNlLg0KPiA+Pg0KPiA+PiBEb24ndCBhbnN3ZXIgb25seSBoYWxmIG9mIG15IHF1ZXN0aW9u
cy4gU28gdGhpcmQgdGltZSAtIHRoZSBsYXN0Og0KPiA+PiBzaW5jZSB5b3UgYWRkIG5ldyBzdHls
ZSBmb3IgQWdpbGV4LCB3aGljaCBzdHlsZSBvZiBBZ2lsZXggY29tcGF0aWJsZXMgaXMNCj4gY29y
cmVjdD8NCj4gDQo+IEkgc3RpbGwgZGlkIG5vdCByZWNlaXZlIGhlcmUgYW5zd2VyLiBXaGljaCBz
dHlsZSwgbmFtaW5nIGNvbnZlbnRpb24gZm9yIGFnaWxleA0KPiBpcyBjb3JyZWN0IGZvciB5b3Vy
IHBsYXRmb3JtPw0KPiANCj4gV2h5IHRoaXM6DQo+IGdpdCBncmVwIGFnaWxleCB8IGdyZXAgaW50
ZWwsDQo+IA0KPiBnaXZlcyBkaWZmZXJlbnQgY29tcGF0aWJsZXMgdGhhbiB5b3Ugc3RhcnQgaGVy
ZT8gSSBhc3N1bWUgSW50ZWwvQWx0ZXJhIGtub3dzDQo+IGJldHRlciB0aGUgcGxhdGZvcm0gc28g
d2lsbCBwcm92aWRlIGhlcmUgc29tZSBndWlkYW5jZS4gSWYgdW5zdXJlLCBwbGVhc2UNCj4gY29u
c3VsdCB5b3VyIGNvbGxlYWd1ZXMuDQo+IA0KPiANCg0KTm90ZWQuIFdpbGwgY29uc3VsdCBJbnRl
bCBMaW51eCBncm91cCB0byBnZXQgdGhlIGNvcnJlY3QgbmFtaW5nIGNvbnZlbnRpb24gYW5kIA0K
Z28gdGhyb3VnaCBhbm90aGVyIHJvdW5kIG9mIGludGVybmFsIHJldmlldyBwcmlvciB0byBhZGRy
ZXNzIHRoZSBpc3N1ZXMvY29uY2VybnMgDQpyYWlzZWQgYmVmb3JlIHN1Ym1pdHRpbmcgdGhlIHJl
dmlzZWQgcGF0Y2hlcy4NCg0KPiA+Pg0KPiA+DQo+ID4gTXkgYXBvbG9naWVzLg0KPiA+IEluIHlv
dXIgb3BpbmlvbiB3aGljaCBpcyB0aGUgcHJvcGVyIHByYWN0aWNlPw0KPiA+IDEuIENyZWF0ZSBu
ZXcgYmluZGluZyBmb3IgbmV3IHByb2R1Y3RzIHRoYXQgaXMgdXNpbmcgdGhlIHNhbWUgY29udHJv
bGxlci4NCj4gDQo+IFdoYXQgaXMgIm5ldyBiaW5kaW5nIj8gV2hhdCBkbyB5b3UgbWVhbiBieSB0
aGF0PyBOZXcgZmlsZSwgdGhlbiBub3QuDQo+IA0KDQpZZXMuIE5ldyBCaW5kaW5nIG1lYW5zIG5l
dyBmaWxlLiBXaWxsIG5vdCBwcm9jZWVkIHdpdGggb3B0aW9uIDEuDQoNCj4gPiAyLiBDcmVhdGUg
YSBjb21tb24gYmluZGluZyB0aGF0IHdpbGwgYmUgdXNlZCBieSBwcm9kdWN0cyB1c2luZyB0aGUg
c2FtZQ0KPiBjb250cm9sbGVyPw0KPiA+IFJlZmVycmluZyB0byB0aGUgY3VycmVudCBiaW5kaW5n
cyB0aGF0IGFyZSBhdmFpbGFibGUgdGhlIHR3byBvcHRpb25zIGFyZQ0KPiBiZWluZyBwcmFjdGlj
ZWQgYXQgdGhlIG1vbWVudC4NCj4gPg0KPiA+IElmIG9wdGlvbiAxIGlzIHRoZSBwcm9wZXIgcHJh
Y3RpY2UgdGhlIGNvcnJlY3QgQWdpbGV4IGNvbXBhdGlibGUgaXMNCj4gaW50ZWwsYWdpbGV4NS1k
d2MzLg0KPiA+IFRvIHJld29yayB0aGUgYmluZGluZyB0byBjYXRlciBmb3IgYWdpbGV4NS1kd2Mz
IG9ubHkuIFRoZSBjb21wYXRpYmxlIGluDQo+IGdsdWUgZHJpdmVyIHdpbGwgcmVtYWluIHRoZSBz
YW1lLg0KPiA+DQo+ID4gSWYgb3B0aW9uIDIgaXMgdGhlIHByb3BlciBwcmFjdGljZSB0aGVuIHRo
ZSBjb3JyZWN0IEFnaWxleCBjb21wYXRpYmxlIGlzDQo+IGludGVsLHNvY2ZwZ2EtZHdjMy4NCj4g
PiBUbyB1cGRhdGUgY29tcGF0aWJsZSBpbiBnbHVlIGRyaXZlciBpbiBWMy4NCj4gPg0KPiANCj4g
DQo+IFJlY29tbWVuZGVkIHByYWN0aWNlIGlzIHRvIHVzZSBzcGVjaWZpYyBjb21wYXRpYmxlIGZv
ciBib3RoOiB5b3VyIGRldmljZQ0KPiBhbmQgYXMgZmFsbGJhY2sgZm9yIGFueSBmdXR1cmUgZGV2
aWNlcy4gSW4gY2VydGFpbiBjYXNlcywgb3B0aW9uIDIgaXMgb2theS4NCj4gDQo+IA0KDQpOb3Rl
ZC4gVGhhbmsgeW91IGZvciB0aGUgZmVlZGJhY2suIA0KDQpUaGFuayBZb3UNCkFkcmlhbiAgTmcN
Cg==
