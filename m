Return-Path: <linux-usb+bounces-13377-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D4FE9505C4
	for <lists+linux-usb@lfdr.de>; Tue, 13 Aug 2024 14:58:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F21471F2197C
	for <lists+linux-usb@lfdr.de>; Tue, 13 Aug 2024 12:58:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F050B19CD17;
	Tue, 13 Aug 2024 12:57:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g/2CdY9d"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDF1719CCF8
	for <linux-usb@vger.kernel.org>; Tue, 13 Aug 2024 12:57:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723553846; cv=fail; b=PP6IJdCamCJNIKU2iyYJ+L8tHI6+HWMYt421w7Vpi/fpOleTEsorE0guMeIPbGDzE9bgEm8d6FB4B66BeP+8xuevavuU8o5yxJC3MrdllqkSfb/ki76AQl6E0FzuBTOD2kSurFNuCW7mGGYsd44PZxyeUpHCEI2tNCHVTeIedJc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723553846; c=relaxed/simple;
	bh=hj+wopTvdIC6FBt4Rf3kHZZedoHA6km8XCmf3doWXI8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=p06xKlJ1IGS3Ow+NcwoJKYHRiPlwEMGoimUyu1KwO0bKongfxa8/RSBN2UP/bZc/52+2J9IFSKI3nhRuZFpTqt/QlPRhvRZmyGDBfn2e9RmRUnwlHGiW2aBS6H/WY1ykaW5OTLPyzcsylExfB1QcuELbwVqcvx8WgZHcbAEfwlQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g/2CdY9d; arc=fail smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723553844; x=1755089844;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=hj+wopTvdIC6FBt4Rf3kHZZedoHA6km8XCmf3doWXI8=;
  b=g/2CdY9dYRvvLbbI6zIB5eOUnfh0rw+2FOV/6VF29K01+nrwmjNAMPLR
   pN2MMpkLwuVCHEgzNYHt9SAxMCQJ8PH5C8kWgVV7RxbSb4kUeY7g9ofFG
   y6WuNggWfgIPzvNNMtljx6jQz9YSnuFJpQNy2d+hcOGsjUFgAQHEcVi89
   rmMnMC1IcSK3yHPXjClNe7KOQwKtNvCP5ughZCZRPRmj2uq0CLK15jpzq
   9OkihXAe/DbDztBpjbwaF8XVyvX1rf2HRG0V1XFSO5PPMsoEnN71Ach/9
   rjA2RxRYXxKOq/ObhVgsDfZ+w//MrB+7or2GpY/u4LzwuCKKuTnh8hxAT
   A==;
X-CSE-ConnectionGUID: m31dCJg0RYqsW+9UxCx7yQ==
X-CSE-MsgGUID: 6I5vSJOvQZCkhXlhXw2iVA==
X-IronPort-AV: E=McAfee;i="6700,10204,11162"; a="47116788"
X-IronPort-AV: E=Sophos;i="6.09,285,1716274800"; 
   d="scan'208";a="47116788"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2024 05:57:24 -0700
X-CSE-ConnectionGUID: Zu/YF6NRRfCkt8VDM+VNbg==
X-CSE-MsgGUID: ubhnPt2yToyAIGLyk6CdPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,285,1716274800"; 
   d="scan'208";a="58303778"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 13 Aug 2024 05:57:24 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 13 Aug 2024 05:57:24 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 13 Aug 2024 05:57:23 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 13 Aug 2024 05:57:23 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.42) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 13 Aug 2024 05:57:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dHifMP44o5FLhVXemB3akyywB7fncKi9oSDBPFZglUR1xGAJthe/9KMRyuRn+bpNeGBxDOVfSj9Vx94anfAcpc4o4r2Im+3EcUlGRPSGw9CqVEWclGsOWxHtxgIrDfR0xZc9H7eEGFl0SJo8qOexEMBqqP0mcJw/wJAA4+49um9LqlFhW2RmEru3jK4TX44cNCpa3l6Pn54Ikm++BOplEqstUH71LUTiZ9Mcx3r312LbHxPfga2yMhvs8mu3CnbvNmWBJk+SB+BWFkdPNiQwpQGo4FXxmxDeaZRybbCe2sdoEEaqG0Yru1bstXRP3nmrYBrsyG5ts/C8JzJZr0ucZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fxl8yrF4COIKNWrwPYhAN/8PGLKkt7QpeItluloQjE4=;
 b=pr+ASRhWgcr+P7s6fWqw5Khym2mPoUNQT4n+uQEMU8DQCXuqZUB7uXAWgQXyKeKo2SbMDdA2VH1ZLVadFQuo5b+CgQbt/rodSdRtNKrDi4cl6w7r24X0+e2ZC1IBiseyECiJrYVoFF1dFYCYrLIp6U+Kn8A/70N6FHtfb5+bCpmOrVrtUNkqJlr0671lE9MhWSS9nUL6Mh9DwJZcScBktpccih/BB3Moo3gl0h/kij2gT7o62lAdUCoT0bUaQPgPJr3w3+rH2Cd8j36VvMA6NM8AGheJY/wFBpnBVKH5gbTlfrOVf0IAwu7vF6yKIGG9WuIVF5GtHkm2dHJ8Y/05JQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MW5PR11MB5787.namprd11.prod.outlook.com (2603:10b6:303:192::7)
 by IA0PR11MB7402.namprd11.prod.outlook.com (2603:10b6:208:432::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.27; Tue, 13 Aug
 2024 12:57:21 +0000
Received: from MW5PR11MB5787.namprd11.prod.outlook.com
 ([fe80::20f8:8626:d842:9ba3]) by MW5PR11MB5787.namprd11.prod.outlook.com
 ([fe80::20f8:8626:d842:9ba3%4]) with mapi id 15.20.7828.031; Tue, 13 Aug 2024
 12:57:21 +0000
From: "Wu, Wentong" <wentong.wu@intel.com>
To: Hans de Goede <hdegoede@redhat.com>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>
CC: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: RE: [PATCH] usb: misc: ljca: Add Lunar Lake ljca GPIO HID to
 ljca_gpio_hids[]
Thread-Topic: [PATCH] usb: misc: ljca: Add Lunar Lake ljca GPIO HID to
 ljca_gpio_hids[]
Thread-Index: AQHa7J0hrmlMcXaE10+lEuG4gTFqy7IlJtaQ
Date: Tue, 13 Aug 2024 12:57:20 +0000
Message-ID: <MW5PR11MB578752CDB13BCDD38D8AB4848D862@MW5PR11MB5787.namprd11.prod.outlook.com>
References: <20240812095038.555837-1-hdegoede@redhat.com>
In-Reply-To: <20240812095038.555837-1-hdegoede@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW5PR11MB5787:EE_|IA0PR11MB7402:EE_
x-ms-office365-filtering-correlation-id: aa56f244-6fc8-4a1b-e296-08dcbb97782d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?d1wN098XVleJH8fbQfb9YUe+/ou0YThLwrxaL/99pdl6UkV37HDrwVfnwHUF?=
 =?us-ascii?Q?bF7LAnuGQB7KAZIdSirEewjLVkT+B/zQ3sYOVghBg6h9YM9S6pAnr2INfj71?=
 =?us-ascii?Q?IcDtH0U2wbldNk4GgXmPySFljtS8ihFMs6OZ6yG+kKat6NdtsLTgKi080KGy?=
 =?us-ascii?Q?se6i5v64Wn6xUSfaR4/BaXi6zcN70nDHSQoMXEU5bhnDyo/Br3gyS2UihN1J?=
 =?us-ascii?Q?r3UL134VwCrz0yc7s2UXQmXB4vjOOfVD4KVZI4mvVKfdgvg63NQfG2wKPOqD?=
 =?us-ascii?Q?vTKti2Aacn+O9rQVVzWKvxupl+3vy7pCPVYpzq9i1IDwf4NQYG4c0CFMed02?=
 =?us-ascii?Q?McY/FzDXA159LaY21ct6s23zCa9Ryiw1Vz5J2NeXDYRkkOfhe37pG+nSwyHq?=
 =?us-ascii?Q?kaaDj4bOYZBLCT8tT6SG5U637x5g0uDMcN/MqU4U8ydhl714WruHCvZwKeIC?=
 =?us-ascii?Q?tX4JUWctD6kEWdUYtaT4tRsvVahd3RrESu9pExAS/f7gj7kHfpNjkJST+trX?=
 =?us-ascii?Q?MNbLU5yfPQL1jVo95LM4XFu1o1VOVZBDD0PE8p8ZwDldtBkILyiGxXY2joKK?=
 =?us-ascii?Q?b+8CkeK/Q0F1ay7soAK8jn1ONxlGokC4JwMEZHp9YS5Sz1b7DvGv7cGFknvM?=
 =?us-ascii?Q?GiyqnkOfy8ZJJBe5KAmQdewUh6Ukf2bJZxr4RmyFZ3qYELlKkUMDCRFJszE2?=
 =?us-ascii?Q?YgBH6Loq5u4gaS7iIp3wlxFcdDlUQj/S0Ikmw8IFdwWHGNFRuuccDoCI/JWF?=
 =?us-ascii?Q?5BMcrUQ+IlxHwNqxGqCu/iXaMljVetXX6BYizG/cbinzXsbdtfmXOlTixXeI?=
 =?us-ascii?Q?AmkZ1K8cB7+qzB9rtrVJXtOo0QFAZWK/rDCkc7zuxhN2EFMeCPGun5KgMtgu?=
 =?us-ascii?Q?Xy0Cg8JnWayoLhsDFxZR9R6HKZXmEqxN+CAWoeT2Vage4d54K1vuC8+oqGpk?=
 =?us-ascii?Q?WyiKpRl4U1d2Mj7YKo+PYVgv/R+sNlPBnZt1kk/8b+LLui/0M9u+/WYe3LBs?=
 =?us-ascii?Q?+2KhlXfnB2It8gRbAMY+A900ET6uCmioEuCE+xD5LrcryCPhbPuzkbuuQHQn?=
 =?us-ascii?Q?OxhVucxvGVJ0MhQhO/qmZotTkaQ+pQCchfsCmJO4VF/80zDh3HufKOCg2WOz?=
 =?us-ascii?Q?VTipgDopDtzlG07V1pkpyOn1J7/40Iq0nKAco3eQnokKqX7yBZr/JcgzBUyf?=
 =?us-ascii?Q?TINHBwIL2rhEzMYBbgfzTr0AlnrZwE2Yb6ucqLHb/pNoqc/GBMwIKGLX+/FS?=
 =?us-ascii?Q?bHDtK5vCdeXeW0i5cnQ4ILAyn5z0A5/rigB9sAq+27uMXS7fEmE5JtnUfvsS?=
 =?us-ascii?Q?eStCSe6QNPQcF2hO+w0M3kUbj9lCyOJLxB9KzI/noqxQ5A=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW5PR11MB5787.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?CisBF205FxVxS7CTef4kvb9amAfdHev5BlK9CkKjaiL4WBnwlZGuQmjtgzz2?=
 =?us-ascii?Q?XHkdo6Zvyw+ue1eNVhh2hOQ4Nw7QPuGxzmW9DbJfMwKMQxxJVfBouHbx8131?=
 =?us-ascii?Q?J8XcmCdjejX0Vu742k4qhwiNE+qJBrBXBr8S9g5wDJJLdbO5n/2YxPcervnD?=
 =?us-ascii?Q?KraU7XeudRiq+pH3SjZWQ1reiE8a5z3VesRRdnaQQOAWXKL9vDvl2w4Ys40M?=
 =?us-ascii?Q?uqo8tDvWZ4IZv3/HwrCLVlQfYCSXqjzkTp9erri0qNbMmuiaD5SlgGfQQAyZ?=
 =?us-ascii?Q?rWh/jO1qh1swS75IFxZpsmtLWUlaV/0DlNvTqMRMsPu666m3lyEgO1+hQHkf?=
 =?us-ascii?Q?rm/WU6SSC2uL8/ustQSP5XIYY9nPs59bqyiwJX4YXMlUPT3HdEdMIFbx9m1V?=
 =?us-ascii?Q?gQMwGySioygHYOcp6F9ejWaZmMKgbuHZlm8ANtMJ/m/qo4P56s414g56VBjR?=
 =?us-ascii?Q?Lpn1hLi06dHfOu4CdAoqgjcjMbaMCtEJTqePOzjAiloIpBUq6tP7DF4ZxDXe?=
 =?us-ascii?Q?UM8vQ7hYTZ2nYFRot5lFpI0TZoIA+PTiE1FGpN2GJH7+IwKL4ZHdAoUR4cWD?=
 =?us-ascii?Q?XRMWtRPe/df9f6KtkxKptJvQvkaQ1TzJelC0RzTVGaeATMTpbNVItannyWJs?=
 =?us-ascii?Q?c74zUB98xWQEfmG7BpxdRImB0GRvSUtLZyzjhr5Ow7Oh1dlRON5yZ6AZGvhF?=
 =?us-ascii?Q?H+Z5FGvm3EQmhN10/kJlLKbyMgWOqD90+w3eo6V4XFOnf3Cnw/iXMorWhxmZ?=
 =?us-ascii?Q?N2v2TVQTjZxd/emnHB0WI8+ptB6ZaM8H3/O4SJ9JLXQ37RrN2h1dX7/b52Ve?=
 =?us-ascii?Q?7JwlPf9hlIs8iAH1jBWu0HKD6K2jiaSw6QfsJnK1sDs5UaJj3Obki/Wd2BiB?=
 =?us-ascii?Q?iArGt28QultHjwI6ofHDSOXHNeah8gOr+xnXD/oErsWpOmcsROyzsyVwwNna?=
 =?us-ascii?Q?f64pNSH2kVqfnNR9YJuQPuaGk7CgJPEZsjRvCQwKrkFpicyZFrHkBx0vriM5?=
 =?us-ascii?Q?WCn4+uZdoYC2AJdTJFq1yfmEB7bZVEPY+ckvZXdq5kHYH6jE0UodiVt+pphr?=
 =?us-ascii?Q?tqyl5nNww/UqEqSxTXd6uyvfiNNVG9ENPjXFALZ8wEFrRiT9J0KHUOWCKyWY?=
 =?us-ascii?Q?b+BzU8+AqWihQ4QuDCUhdLMytjLlz5rD8Iknu2QabC9TLze3rRZ8vIMpj0aw?=
 =?us-ascii?Q?TeWquO0zRF0H1R9rNCRuZfUvvoxdhy2bhUpIf6GavC+HznhJyvbBH2nDG541?=
 =?us-ascii?Q?mAbkKFZLiz3gmJnpAdufizkOEMh92ISKH2YYPPldAr5Z/2nftahVGAXo9npy?=
 =?us-ascii?Q?WvcScQ8FbTi/p0z8ZmoZlokM72MZntKj/jreItioinmBgsCtOeAUd09b6b5X?=
 =?us-ascii?Q?/5s1arDqqdg+9VCQmQTL5sUC3X4WM7r+e5OwwaYbrOME5uXoQKyNpYdfRBNZ?=
 =?us-ascii?Q?BEzvUC5v2khHfiJDmZG+yg1L1FCvZF4UEZWIKim5P3rv/hkbtrpetQijnk5P?=
 =?us-ascii?Q?dg/oRM+tnAyZDBucYLJv1bIu44/WwDfE9Hc5rSAhw0TezcLTh64YLq2X2IuC?=
 =?us-ascii?Q?69jQ59GTeyew4NYWAmeN5VRnk6DXKXJ0YmNmSBqw?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW5PR11MB5787.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa56f244-6fc8-4a1b-e296-08dcbb97782d
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Aug 2024 12:57:21.0220
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mAz3i++AfeTlXzi3ouNLRJrL3ghJUNlYoT4UciY/totqcy9klqX3M6b0lD/LrDHxOp2BK/agyS+qsUHsCTuEHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7402
X-OriginatorOrg: intel.com

> From: Hans de Goede <hdegoede@redhat.com>
> Add LJCA GPIO support for the Lunar Lake platform.
>=20
> New HID taken from out of tree ivsc-driver git repo.
>=20
> Link: https://github.com/intel/ivsc-
> driver/commit/47e7c4a446c8ea8c741ff5a32fa7b19f9e6fd47e
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Reviewed-by: Wentong Wu <wentong.wu@intel.com>

Regards,
Wentong
> ---
>  drivers/usb/misc/usb-ljca.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/usb/misc/usb-ljca.c b/drivers/usb/misc/usb-ljca.c in=
dex
> 2d30fc1be306..1a8d5e80b9ae 100644
> --- a/drivers/usb/misc/usb-ljca.c
> +++ b/drivers/usb/misc/usb-ljca.c
> @@ -169,6 +169,7 @@ static const struct acpi_device_id ljca_gpio_hids[] =
=3D {
>  	{ "INTC1096" },
>  	{ "INTC100B" },
>  	{ "INTC10D1" },
> +	{ "INTC10B5" },
>  	{},
>  };
>=20
> --
> 2.46.0


