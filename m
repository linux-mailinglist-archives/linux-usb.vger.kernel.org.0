Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5C92C75ECCD
	for <lists+linux-usb@lfdr.de>; Mon, 24 Jul 2023 09:53:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229646AbjGXHxS (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 24 Jul 2023 03:53:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229644AbjGXHxR (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 24 Jul 2023 03:53:17 -0400
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2EC11E4F;
        Mon, 24 Jul 2023 00:53:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690185193; x=1721721193;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=GYLwZrIu/S29gH5kmLbKCY4Oj+6/GYSzTsrPGYoU4IA=;
  b=jG6Zd/krFfvTDQtBDkmdUa/QPhf7JhFVog1Yvc31x/P4hTgtXeCoiKyH
   Ips9uybWNLnKDEXRpdq7gb0S+dWOxdiKgDgmoroQrBnfi1U8bHO7d+VOw
   Pai0yRXHYc+tfQBGLqdlRBI4zAEFDEA5CDy/mCKzfLGGHaVHfpcYw/Uv8
   O0xYVozCRnlg0UdnX79TJgTQCDBzEgwfMQ6ruZUje76WWJVt8RIVwwHcq
   HSRT90VnEG98qhxIHO6/MGcYA/13RI87jQMlIvAfjvBkj7QPJDHXi9yEm
   eKMoOZKw0IQjGwPoWVJ//MTFS494h8hidKQGCo+H54wjN6PJHztDW/gl0
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10780"; a="352273453"
X-IronPort-AV: E=Sophos;i="6.01,228,1684825200"; 
   d="scan'208";a="352273453"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jul 2023 00:53:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10780"; a="790878391"
X-IronPort-AV: E=Sophos;i="6.01,228,1684825200"; 
   d="scan'208";a="790878391"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by fmsmga008.fm.intel.com with ESMTP; 24 Jul 2023 00:53:11 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 24 Jul 2023 00:53:10 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 24 Jul 2023 00:53:10 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Mon, 24 Jul 2023 00:53:10 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.177)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Mon, 24 Jul 2023 00:53:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n1PW8WWdNixRYIv1+kdA6pvqsL9+8vgK+MAKQRZk+WcuBBRZtltMOcHcFy+l4N1jxhmOjIMTXmSg9sDQvCd3bAWNi3uu3MDtSJEJmsz7KCps9i8t5EWsY8m6rz4MkKR/oLYiSUUgF89J1F5oS2JLOaK5qRRIYjNb4IOlxYjlGOmGOsSmPhflJdnnjVcETHQ/4sUOVEJ+axo51/yYVnywpA7b9Tui2vHlLs2Bkra1JNLg+URzVZOfFvIqTHqW4D/oCnpVCuoW61OoG8DS5cT12+QQu0HxyiotKrD1m5R1mqK/daFXCRzuGGfpXU9mie4rh/oUlzQR4vvUAkIbrP4Glw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GYLwZrIu/S29gH5kmLbKCY4Oj+6/GYSzTsrPGYoU4IA=;
 b=djCQbpQTcL7MXhe8YpTroTXSSz2u3VaWmUPwA5OfMkEaSG+g4elE2uxyWbJsh29aOziy6VauOfdSt285kOVfCuWJsYxRDO06ekjw7KcxBYBVEXYZOJqXbYc6DWkDHyty/njviq3KHyEfHnfzbD0qzUm4MVLMEf5LdGJk4QYXe4kv5TdBn1WctjL05jaZetSprlDODFOHHwoZORuRQ2PFQDjGvCwCP3vf6hzfOn6A7Pr2yUGwE1g1sooJ6kejHPky7+qTOK2Wqfg4Xmg8Ezhl7664nEtiHvmDrimSHzKZWxrutGqY3tJY3sODVr0Yq7+WSkH8Rspksq/6hYnB3F7p4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA2PR11MB4860.namprd11.prod.outlook.com (2603:10b6:806:11b::10)
 by DM4PR11MB6455.namprd11.prod.outlook.com (2603:10b6:8:ba::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.31; Mon, 24 Jul
 2023 07:53:04 +0000
Received: from SA2PR11MB4860.namprd11.prod.outlook.com
 ([fe80::bbee:647b:4a59:2a9a]) by SA2PR11MB4860.namprd11.prod.outlook.com
 ([fe80::bbee:647b:4a59:2a9a%7]) with mapi id 15.20.6609.030; Mon, 24 Jul 2023
 07:53:03 +0000
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
Thread-Index: AQHZvflH4k6c0u0O8ECuPkXMRwqJHa/IfkMAgAABPxCAAAUxgIAAA0uQ
Date:   Mon, 24 Jul 2023 07:53:03 +0000
Message-ID: <SA2PR11MB4860256BC6BC5A2F9259F8698002A@SA2PR11MB4860.namprd11.prod.outlook.com>
References: <cover.1690179693.git.adrian.ho.yin.ng@intel.com>
 <0d12c7a196d6ad81cfc69b281dd1c4cca623d9bd.1690179693.git.adrian.ho.yin.ng@intel.com>
 <70a823a4-54d1-18a3-3d77-45564d88e8f1@linaro.org>
 <SA2PR11MB486040E69B4DCE82631213328002A@SA2PR11MB4860.namprd11.prod.outlook.com>
 <2b3fcc1b-156d-9f5f-3436-139ebcd846fe@linaro.org>
In-Reply-To: <2b3fcc1b-156d-9f5f-3436-139ebcd846fe@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA2PR11MB4860:EE_|DM4PR11MB6455:EE_
x-ms-office365-filtering-correlation-id: 9cac12af-1046-472b-8c96-08db8c1b022d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: KWW9L3TI3Ph5oLa2oKwkoey9HfY376kJDkF+UhjD2KD/+JqcGuHBsLgngF3RA3+oiQCttgbEkoMIF68ZJEFQFkBVcsxqDQMkij/bT+yU6rKlYY/f7CvAr7nqbICumz9zD4OrvYCY+k48FNOn+OC9+DGVnEuVchKahnkzYvWUGZXvSZTECuarZN/z3j3WAK2TVI2okGnG0eVh4sVBDTW5mTca44Pa95uwszx2Tj+cLPcyQ5xVZHPc7srtW7R7F6/oAihVZYZ8Z5B2J8j3xjrrEnPJ1zYCNB+lm6F6C0oS5dpqTVj9r0e/8k3mO1OXN7G1eMVT9UfsF83QC0zDhoPCGA234F90Fijx3Ik6s5ONGsLYoGkfvWQs1AoJMkgSmjqSXptB6JqPUSzSVUeVU1kwVDZSoOKv2eJ6eWzGyIKip0sSUwrulnUQepwkFICyrn6iuUL0QsWV+X2Jrs8K1yOiAEKeTnCZCzf7NURZ3UOdtCNZTJ9Zw2u0HjdC2YPEe+XvSeNhXCH+QdOtrTGbK1TYQC0ajFDY6n4/IbbbsZhLQZ8xXK86LQW6bAaanBuGCVOrlxYSZK9sG3vl1c/z23WshSlOBgZBA0mtVvoFmEUMWKPAJ05rI4GE5Ty02pjO0HDWIcjHqP9zpCuxR27PbVBu/A==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA2PR11MB4860.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(396003)(346002)(136003)(376002)(39860400002)(451199021)(55016003)(2906002)(71200400001)(8676002)(7696005)(33656002)(38070700005)(41300700001)(316002)(64756008)(66556008)(66946007)(66476007)(66446008)(76116006)(110136005)(83380400001)(9686003)(82960400001)(122000001)(38100700002)(966005)(53546011)(55236004)(5660300002)(52536014)(8936002)(86362001)(186003)(26005)(6506007)(478600001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bVRyUWZTZGhObS82MVZDc2NycFp4akJ3Q2JETGZUNUtWWmpvUHlkemU3OVpk?=
 =?utf-8?B?cmZrSTRTK1ovTzJ3bkp0aytQeDB1UWZMM1kxdHVKeVpFVitVUVJVT0NhVUtV?=
 =?utf-8?B?UFB4cEhVM0NiUXlKQVNPZzl5b1ZmbEZwYzhpV1hrb09uczk1aXZ5YUhSNHFH?=
 =?utf-8?B?cXFlUTQ5UjBPZnhlejBpR0R0bEQwSFcxRHJYbnoxTFVMZk43bGZxVkxlRThu?=
 =?utf-8?B?WFc0QjFFbVNWZVhNQms3Ry9PL1E5Z1Y0WHAvQnl6RzhXTkhnaDRpd0pVYW11?=
 =?utf-8?B?TE9QUEFIamVWRUs0eGdJL2VhaWx1VElGd2VxNCtBQURYMTJHL09IdlBqbFFy?=
 =?utf-8?B?U0NwTVp0Z1lMQmlwaUNFZDg5d3luVktQZHdNU0Fkc0QxSXpLL205eUY4VW5R?=
 =?utf-8?B?K0kvblk3dDg3ZFNWaTVvQ3RhMzhhT3NLQ0YvNVBrTFc4UU1kWDBuTlNlZGcw?=
 =?utf-8?B?TklVMlBLbnh5K1hjeXEzNHgvWXUwaFAyT1BpUGJaUlIyWlovcTVWOHNNSWk0?=
 =?utf-8?B?a0lEeGdRKzlheVo1dlFsTTZUbGhza3g5UDlHSDh4S2J4bHpTeGNEbDZ3Smxt?=
 =?utf-8?B?RmtzZXJqWkFKUzl5TjRPZmErdFd4akJHdGJXNjVoamNsZDVNblM5WDZMbmdj?=
 =?utf-8?B?eFZoTEpOMVU1Z2k4NHF5Q1RtVTFPd2lidG1adElPMUF5SVN1NHJqV2JCZFNN?=
 =?utf-8?B?SjlNTjJsSkhjcWlFS21tVExKb3d4ZS83TW5sQ1NSdEg0MkhBWCtJb0Ztd250?=
 =?utf-8?B?Tnlzb2dYK3pNZkV5UkVNWmxiYkluYUlOeDNYckl4SUJyTU5PaUxLYWQ1L1ZU?=
 =?utf-8?B?NnlOZHZIRjJBcnZkajhpbmEwOXFPMGJXRWtWTGpycEwvQnBoVG5Tdi90RnVF?=
 =?utf-8?B?QWFOdG5OcmpBOXZUUTNvZ3BkQmhvcTlQYzRXekxhc25xeVFoWXNsRXNvOC9n?=
 =?utf-8?B?cHRBcVJxaU05d25vS3BnWHc4NjdNSmlMOVhaMG00QnUxYTZ0SWhybVBnaGcw?=
 =?utf-8?B?TWdUNW1IaHh4ZFdCTTRldElUV2ExaHZNc3h4Ky9xTkpYOE9BSFdFQjBYNTgy?=
 =?utf-8?B?ZVVDVVJIRDRmOGxGeE5URWNSOUxxOGNPSnBDTm9BUlpFbVgzWGYvcCtIdGFy?=
 =?utf-8?B?SVNLVXhUSGNJb2VMWFJTdVluR21WbzUwSVIrNW1PczNvU2FRdmdOVDFyS1lx?=
 =?utf-8?B?ajl4OHlxWmtaK1Jxa1p5ak14bnVJY3JXckd5SlFjTWMyWGRvbGZXZ2p5VzNy?=
 =?utf-8?B?bjBDM3EyVXMyL3JQcmlDQjluTmllWkNabm04UXluWG9iYTMwaERhRGZKT1Jn?=
 =?utf-8?B?WXJPbGhUOC9sbFV3MkI3KzFVemVNV1dBM05VeDQzUjRrSlNQNWk0cnJBSTc2?=
 =?utf-8?B?dkgxQVpXY0ZOem8wSFJDZFJialpZbmdtcjVIdTNjSDl0Um1za3RMYm9mMGNl?=
 =?utf-8?B?dStGL3ZjK0VwOG9sdGkrTnc2NkFFMStjd1c1UUhETjQvLzBBT3lxVkkrU0pV?=
 =?utf-8?B?aGN4MWlCWElrVW5yNHhnTzhzUnZrQVB0dWZBd3BDWjNUSkpaczJGYVN6WEZF?=
 =?utf-8?B?RllqUXM4UEhWUXcvN0NUMmgyZmk3VlVWKzl2VC9GQWQ4MHhla2VWVmEvQVk3?=
 =?utf-8?B?YVpMUkxGWTllN2dXOXAwSERQRlUvL1VveUpDdk1TMkttSU45ajA0Q3J0cW5G?=
 =?utf-8?B?RUxBRC9RL3BPUFdZcWwxSDFSZU5nM0dKTDlLS25wZENpL0dKN3BYc1RQVm5B?=
 =?utf-8?B?S3hvUHZEZ1p2Tm12Y1FKYnVIMXpoZjYveXQ5L3dIdjUydStrTitKbHo4bm14?=
 =?utf-8?B?Q3dvSlRodU1JbFYvejBNeDIyYk0yc3ViQmUwYkJhVElmVkRybjZYY0FkYjFu?=
 =?utf-8?B?SStxakoxRGVPako2SnMzMlJPa1pFMDBkelNkcFNrTU1CTkJiTjBCSkh5UjR2?=
 =?utf-8?B?TlVXbDlKRW5EY1k3bWhiR1liQjB6OE01dkJadll6NXZ5bndhZ2lyQ0FlakZ3?=
 =?utf-8?B?SHlmc1ltZlM3c0d4MjJ5L2ZDVEtiTUMxcHZKZWhQVUNQYVR3MkgrTkxzN0Ri?=
 =?utf-8?B?RnlXa2Q5bWlxTWkrdUY1cVhiQ2RENldOdnExOWFuTFdhSjNOSlYrRktqVm9w?=
 =?utf-8?B?TytoT2Ztd2liOEF5cjMwdUt4ZDBVSnJUWWJGckxUc1Nva1VFQ2VoM2o2ckRK?=
 =?utf-8?B?SVE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4860.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9cac12af-1046-472b-8c96-08db8c1b022d
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jul 2023 07:53:03.1398
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4YUcHoP1OjtKkAhIk5j9MmiKTcmurtqR3SaOthgYvrTgaEGGGxQ9XKM4jv3G0vjbJ72oOcjfo0KxSmPjrjmuel231k0LH7jxiS6zXX++3zs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6455
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBLcnp5c3p0b2YgS296bG93c2tp
IDxrcnp5c3p0b2Yua296bG93c2tpQGxpbmFyby5vcmc+DQo+IFNlbnQ6IE1vbmRheSwgMjQgSnVs
eSwgMjAyMyAzOjI4IFBNDQo+IFRvOiBOZywgQWRyaWFuIEhvIFlpbiA8YWRyaWFuLmhvLnlpbi5u
Z0BpbnRlbC5jb20+Ow0KPiBncmVna2hAbGludXhmb3VuZGF0aW9uLm9yZzsgcm9iaCtkdEBrZXJu
ZWwub3JnOw0KPiBrcnp5c3p0b2Yua296bG93c2tpK2R0QGxpbmFyby5vcmc7IGNvbm9yK2R0QGtl
cm5lbC5vcmc7IGxpbnV4LQ0KPiB1c2JAdmdlci5rZXJuZWwub3JnOyBkZXZpY2V0cmVlQHZnZXIu
a2VybmVsLm9yZzsNCj4gVGhpbmguTmd1eWVuQHN5bm9wc3lzLmNvbTsgcC56YWJlbEBwZW5ndXRy
b25peC5kZQ0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHYyIDEvMl0gZHQtYmluZGluZ3M6IHVzYjog
QWRkIEludGVsIFNvQ0ZQR0EgVVNCIGNvbnRyb2xsZXINCj4gDQo+IE9uIDI0LzA3LzIwMjMgMDk6
MTgsIE5nLCBBZHJpYW4gSG8gWWluIHdyb3RlOg0KPiA+PiBGcm9tOiBLcnp5c3p0b2YgS296bG93
c2tpIDxrcnp5c3p0b2Yua296bG93c2tpQGxpbmFyby5vcmc+DQo+ID4+IFNlbnQ6IE1vbmRheSwg
MjQgSnVseSwgMjAyMyAzOjA1IFBNDQo+ID4+IFRvOiBOZywgQWRyaWFuIEhvIFlpbiA8YWRyaWFu
LmhvLnlpbi5uZ0BpbnRlbC5jb20+Ow0KPiA+PiBncmVna2hAbGludXhmb3VuZGF0aW9uLm9yZzsg
cm9iaCtkdEBrZXJuZWwub3JnOw0KPiA+PiBrcnp5c3p0b2Yua296bG93c2tpK2R0QGxpbmFyby5v
cmc7IGNvbm9yK2R0QGtlcm5lbC5vcmc7IGxpbnV4LQ0KPiA+PiB1c2JAdmdlci5rZXJuZWwub3Jn
OyBkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZzsNCj4gPj4gVGhpbmguTmd1eWVuQHN5bm9wc3lz
LmNvbTsgcC56YWJlbEBwZW5ndXRyb25peC5kZQ0KPiA+PiBTdWJqZWN0OiBSZTogW1BBVENIIHYy
IDEvMl0gZHQtYmluZGluZ3M6IHVzYjogQWRkIEludGVsIFNvQ0ZQR0EgVVNCDQo+ID4+IGNvbnRy
b2xsZXINCj4gPj4NCj4gPj4gT24gMjQvMDcvMjAyMyAwODozNiwgYWRyaWFuLmhvLnlpbi5uZ0Bp
bnRlbC5jb20gd3JvdGU6DQo+ID4+PiBGcm9tOiBBZHJpYW4gTmcgSG8gWWluIDxhZHJpYW4uaG8u
eWluLm5nQGludGVsLmNvbT4NCj4gPj4+DQo+ID4+PiBFeGlzdGluZyBiaW5kaW5nIGludGVsLGtl
ZW1iYXktZHdjMy55YW1sIGRvZXMgbm90IGhhdmUgdGhlIHJlcXVpcmVkDQo+ID4+PiBwcm9wZXJ0
aWVzIGZvciBJbnRlbCBTb0NGUEdBIGRldmljZXMuDQo+ID4+PiBJbnRyb2R1Y2UgbmV3IGJpbmRp
bmcgZGVzY3JpcHRpb24gZm9yIEludGVsIFNvQ0ZQR0EgVVNCIGNvbnRyb2xsZXINCj4gPj4+IHdo
aWNoIHdpbGwgYmUgdXNlZCBmb3IgY3VycmVudCBhbmQgZnV0dXJlIFNvQ0ZQR0EgZGV2aWNlcy4N
Cj4gPj4+DQo+ID4+PiBTaWduZWQtb2ZmLWJ5OiBBZHJpYW4gTmcgSG8gWWluIDxhZHJpYW4uaG8u
eWluLm5nQGludGVsLmNvbT4NCj4gPj4+IC0tLQ0KPiA+Pj4gIC4uLi9iaW5kaW5ncy91c2IvaW50
ZWwsc29jZnBnYS1kd2MzLnlhbWwgICAgICB8IDg0ICsrKysrKysrKysrKysrKysrKysNCj4gPj4+
ICAxIGZpbGUgY2hhbmdlZCwgODQgaW5zZXJ0aW9ucygrKQ0KPiA+Pj4gIGNyZWF0ZSBtb2RlIDEw
MDY0NA0KPiA+Pj4gRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3VzYi9pbnRlbCxz
b2NmcGdhLWR3YzMueWFtbA0KPiA+Pj4NCj4gPj4+IGRpZmYgLS1naXQNCj4gPj4+IGEvRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3VzYi9pbnRlbCxzb2NmcGdhLWR3YzMueWFtbA0K
PiA+Pj4gYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdXNiL2ludGVsLHNvY2Zw
Z2EtZHdjMy55YW1sDQo+ID4+PiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPiA+Pj4gaW5kZXggMDAw
MDAwMDAwMDAwLi5lMzZiMDg3YzI2NTENCj4gPj4+IC0tLSAvZGV2L251bGwNCj4gPj4+ICsrKyBi
L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy91c2IvaW50ZWwsc29jZnBnYS1kd2Mz
LnlhbWwNCj4gPj4+IEBAIC0wLDAgKzEsODQgQEANCj4gPj4+ICsjIFNQRFgtTGljZW5zZS1JZGVu
dGlmaWVyOiAoR1BMLTIuMC1vbmx5IE9SIEJTRC0yLUNsYXVzZSkgJVlBTUwgMS4yDQo+ID4+PiAr
LS0tDQo+ID4+PiArJGlkOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvc2NoZW1hcy91c2IvaW50ZWws
c29jZnBnYS1kd2MzLnlhbWwjDQo+ID4+PiArJHNjaGVtYTogaHR0cDovL2RldmljZXRyZWUub3Jn
L21ldGEtc2NoZW1hcy9jb3JlLnlhbWwjDQo+ID4+PiArDQo+ID4+PiArdGl0bGU6IEludGVsIFNv
Q0ZQR0EgRFdDMyBVU0IgY29udHJvbGxlcg0KPiA+Pj4gKw0KPiA+Pj4gK21haW50YWluZXJzOg0K
PiA+Pj4gKyAgLSBBZHJpYW4gTmcgSG8gWWluIDxhZHJpYW4uaG8ueWluLm5nQGludGVsLmNvbT4N
Cj4gPj4+ICsNCj4gPj4+ICtwcm9wZXJ0aWVzOg0KPiA+Pj4gKyAgY29tcGF0aWJsZToNCj4gPj4+
ICsgICAgaXRlbXM6DQo+ID4+PiArICAgICAgLSBlbnVtOg0KPiA+Pj4gKyAgICAgICAgICAtIGlu
dGVsLGFnaWxleDUtZHdjMw0KPiA+Pj4gKyAgICAgIC0gY29uc3Q6IGludGVsLHNvY2ZwZ2EtZHdj
Mw0KPiA+Pg0KPiA+PiBTbyB5b3UgZGlkIG5vdCBldmVuIHdhaXQgZm9yIG15IGFuc3dlcj8gV2hh
dCBoYXBwZW5lZCBoZXJlIHdpdGggdGhpcw0KPiA+PiBjb21wYXRpYmxlPyBJIGFza2VkIHlvdSB0
byBjaGFuZ2UgZmlsZSBuYW1lLCBub3QgYWRkIGludGVsLHNvY2ZwZ2EtZHdjMy4NCj4gPj4gQWdh
aW4gLSB3aHkgdXNpbmcgZGlmZmVyZW50IHN0eWxlIGZvciBBZ2lsZXg/IFdoaWNoIHN0eWxlIGlz
IGNvcnJlY3Q/DQo+ID4+DQo+ID4NCj4gPiBUaGUgaW50ZW50aW9uIGlzIHRvIHVzZSBhIGNvbW1v
biBiaW5kaW5nIGZvciBJbnRlbCBTb0NGUEdBIHByb2R1Y3RzIHRoYXQgaXMNCj4gdXNpbmcgRFdD
MyBjb250cm9sbGVyLg0KPiA+IFRoaXMgaXMgZG9uZSB3aXRoIHJlZmVyZW5jZSB0byBxY29tLGR3
YzMueWFtbC4NCj4gDQo+IE5vcGUsIHlvdXIgZHJpdmVyIGNoYW5nZSBkb2VzIG5vdCBtYXRjaCBp
dCBhdCBhbGwuIFlvdXIgZXhwbGFuYXRpb24gZG9lcyBub3QNCj4gbWFrZSBhbnkgc2Vuc2UuDQo+
IA0KPiBEb24ndCBhbnN3ZXIgb25seSBoYWxmIG9mIG15IHF1ZXN0aW9ucy4gU28gdGhpcmQgdGlt
ZSAtIHRoZSBsYXN0OiBzaW5jZSB5b3UgYWRkDQo+IG5ldyBzdHlsZSBmb3IgQWdpbGV4LCB3aGlj
aCBzdHlsZSBvZiBBZ2lsZXggY29tcGF0aWJsZXMgaXMgY29ycmVjdD8NCj4gDQoNCk15IGFwb2xv
Z2llcy4NCkluIHlvdXIgb3BpbmlvbiB3aGljaCBpcyB0aGUgcHJvcGVyIHByYWN0aWNlPw0KMS4g
Q3JlYXRlIG5ldyBiaW5kaW5nIGZvciBuZXcgcHJvZHVjdHMgdGhhdCBpcyB1c2luZyB0aGUgc2Ft
ZSBjb250cm9sbGVyLg0KMi4gQ3JlYXRlIGEgY29tbW9uIGJpbmRpbmcgdGhhdCB3aWxsIGJlIHVz
ZWQgYnkgcHJvZHVjdHMgdXNpbmcgdGhlIHNhbWUgY29udHJvbGxlcj8NClJlZmVycmluZyB0byB0
aGUgY3VycmVudCBiaW5kaW5ncyB0aGF0IGFyZSBhdmFpbGFibGUgdGhlIHR3byBvcHRpb25zIGFy
ZSBiZWluZyBwcmFjdGljZWQgYXQgdGhlIG1vbWVudC4NCg0KSWYgb3B0aW9uIDEgaXMgdGhlIHBy
b3BlciBwcmFjdGljZSB0aGUgY29ycmVjdCBBZ2lsZXggY29tcGF0aWJsZSBpcyBpbnRlbCxhZ2ls
ZXg1LWR3YzMuDQpUbyByZXdvcmsgdGhlIGJpbmRpbmcgdG8gY2F0ZXIgZm9yIGFnaWxleDUtZHdj
MyBvbmx5LiBUaGUgY29tcGF0aWJsZSBpbiBnbHVlIGRyaXZlciB3aWxsIHJlbWFpbiB0aGUgc2Ft
ZS4gDQoNCklmIG9wdGlvbiAyIGlzIHRoZSBwcm9wZXIgcHJhY3RpY2UgdGhlbiB0aGUgY29ycmVj
dCBBZ2lsZXggY29tcGF0aWJsZSBpcyBpbnRlbCxzb2NmcGdhLWR3YzMuDQpUbyB1cGRhdGUgY29t
cGF0aWJsZSBpbiBnbHVlIGRyaXZlciBpbiBWMy4gDQoNClRoYW5rIFlvdQ0KQWRyaWFuIE5nDQo=
