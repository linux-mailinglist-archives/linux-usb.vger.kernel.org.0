Return-Path: <linux-usb+bounces-25431-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AC97AF6922
	for <lists+linux-usb@lfdr.de>; Thu,  3 Jul 2025 06:29:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2D8833AC020
	for <lists+linux-usb@lfdr.de>; Thu,  3 Jul 2025 04:28:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DC0E28D8E8;
	Thu,  3 Jul 2025 04:29:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TdQOkibF"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B466242A9E
	for <linux-usb@vger.kernel.org>; Thu,  3 Jul 2025 04:29:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751516959; cv=fail; b=WP5JuYCOnMrduSYOqjebQ/oL+2hsZKml3jr7bDrIYAxW2hTt0BbW8S8LmkeekEsqORdlcZgZ0mOWasO6G7vWPvaNP/kARpQ07QRDXf3F4vqW4Sdtzmd6mz3wJABtx/TCXXmN+QCYXFM1Ig07ndyPayK/e/LbzWLBPwbgh7ZCEVE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751516959; c=relaxed/simple;
	bh=xXtNjbcJAU/od5jeXJAy7+Xj6Zir4NeUhYuX+8nskOk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=XGfWn1vshVFpvtMYhqLTQ/EXxFLqTj/BBbZOFkl6/atJZM1j72XW0Hq5A8np6cPrg55D3U0+ClKmi4QzzEvjn1k7zrNzaOfTWGoi+s1VSC5tTLrJ8E3/ko28z7b5q7LFCOmPQAgPCpLS/C7sOtl0pnMBPTt3yxxUlR3jJlBJ3WI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TdQOkibF; arc=fail smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751516958; x=1783052958;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=xXtNjbcJAU/od5jeXJAy7+Xj6Zir4NeUhYuX+8nskOk=;
  b=TdQOkibFOr0W9/4/VSp/a495yj6JxcbotIQxaTzIw3iWxIgeEh7kURNg
   QkSZoIrn/QDxkWzd1aKNBqK3omWGtbpnoiHw0z4hr5qmeWgzJzGeo5ka6
   TDC6EeL6BdeD04KPrwR/diGsj35JR6/5m5MOhFi4RoOhtL2BBr0PHG1xu
   SzP1d0wJwADpW0JwQhMEZsEMYOcxj9tAYNliJWj73P1eGRdknzQMZnw/h
   LybSXlvoe7+bQcuoqiKer0BVIFT8F+XHO/vsCLah5BcmO6zBXjXcNedjn
   u2PI9umlVbP5SytQw6HsjjPuU0VZomibxJvHJ/Mmt9ey7fuNx5iEMReLy
   A==;
X-CSE-ConnectionGUID: xq0D1RUjRiuRktOhhJIigw==
X-CSE-MsgGUID: OCE9OOPnROmdvlVbbR3ngw==
X-IronPort-AV: E=McAfee;i="6800,10657,11482"; a="53796679"
X-IronPort-AV: E=Sophos;i="6.16,283,1744095600"; 
   d="scan'208";a="53796679"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2025 21:29:17 -0700
X-CSE-ConnectionGUID: UCFeBl6oRzm6APJKgAWW9w==
X-CSE-MsgGUID: IY+3VkPDSA6RP8u4VTLudg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,283,1744095600"; 
   d="scan'208";a="191429927"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2025 21:29:12 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 2 Jul 2025 21:29:11 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 2 Jul 2025 21:29:11 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.71)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 2 Jul 2025 21:29:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ad/dDDVk0TiJXdwvhT1dtBYLaPChK6TaNkN08oUqlfQ/mfbFBVr3oS9+8ol5KO+emVoZR+PWQ5YIwwtBXUazZpAN7BhP7BfAvK2Cgpe4B5r9twRhkd2zBs2z8YQqGZLhzD46ZT/YYfg4ftpbioqoIQHUBY4Wj4IR/U2YEDUwLRsPALb4GMDE2ZWm7Y5nG6TUzwthnx9BacCFTjLFgWEJK1X7U7p3fdXtZgD99RlsG6W1f7Iqf3McYs0m399sMmNVRyKw6g5MItzZP02hLDw/QDxKgNwl137mq4RMOLvwEGWjoeWhRhK+CtKRwjdhr19nQOZutaihBJ7tNROMy7SiTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RTihXuRE709fDCvqjGbLtTsSUndFKJFTHgXrkSGfS+Q=;
 b=rE8ISIqL0D22KcBPNYF2o4lBXbnGU9x69VxeE1CZmLYv81cNHSCQEC/fcu6sexFSz4sT29e+v9EhcHyTN5wCpX+vRB/1r1MiMGL3VX74/pKuh2//zqatQuYjrHB+qaoaTz8ZSvYnPIFdqo3Jo1f5lxKFj2fP/x0RfMwNV5ReSnGoWLv28i2PmSZsAgNzZZFg+5lovlUepggsJi5+G1gyOpsE4R6WZmrp0rKUBAESGyLhC8BV0u0k8eKwzH6f2oZijgAZJcTT8V3BMUilPbiR4wag+GW918ryuXYyZ7beW3al/CnretbrKWbrbuAdEQQ+q8r11sapIftOcXhZP02JlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL3PR11MB6361.namprd11.prod.outlook.com (2603:10b6:208:3b4::15)
 by IA3PR11MB9375.namprd11.prod.outlook.com (2603:10b6:208:575::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.29; Thu, 3 Jul
 2025 04:28:42 +0000
Received: from BL3PR11MB6361.namprd11.prod.outlook.com
 ([fe80::6cff:a013:9499:b6c1]) by BL3PR11MB6361.namprd11.prod.outlook.com
 ([fe80::6cff:a013:9499:b6c1%4]) with mapi id 15.20.8901.021; Thu, 3 Jul 2025
 04:28:42 +0000
From: "Katiyar, Pooja" <pooja.katiyar@intel.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, Dmitry Baryshkov
	<dmitry.baryshkov@oss.qualcomm.com>
CC: Greg KH <gregkh@linuxfoundation.org>, "linux-usb@vger.kernel.org"
	<linux-usb@vger.kernel.org>
Subject: RE: [PATCH v2 1/3] usb: typec: ucsi: Add support for message out data
 structure
Thread-Topic: [PATCH v2 1/3] usb: typec: ucsi: Add support for message out
 data structure
Thread-Index: AQHb54k6qDVWXJV+3kuLcMSMCkzjPLQYqVAAgARQ+4CAAAD9gIAAFOIAgAABwwCAACymAIACjvBQ
Date: Thu, 3 Jul 2025 04:28:42 +0000
Message-ID: <BL3PR11MB6361636FCA9529F89B2691FBE743A@BL3PR11MB6361.namprd11.prod.outlook.com>
References: <cover.1751042810.git.pooja.katiyar@intel.com>
 <cc0b7701c4ea3d1001fefeb3df65caeb3e624722.1751042810.git.pooja.katiyar@intel.com>
 <2025062813-untying-hesitancy-088a@gregkh>
 <aGOgeSIOK-nDRGHB@kuha.fi.intel.com>
 <de4c73cc-2aaf-4987-a49c-dff2f38ba0f6@oss.qualcomm.com>
 <aGOy0qEUXQ7Rl3Cw@kuha.fi.intel.com>
 <45d5003d-87e1-4e8c-9eda-b1f67c7e57f5@oss.qualcomm.com>
 <aGPZwGekEihFjB-4@kuha.fi.intel.com>
In-Reply-To: <aGPZwGekEihFjB-4@kuha.fi.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL3PR11MB6361:EE_|IA3PR11MB9375:EE_
x-ms-office365-filtering-correlation-id: 0109fea7-055c-43be-ff1d-08ddb9ea176e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|10070799003|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?4ubKYmx7LhQ7AFyKYGnFTlm+CFUvUnzI/5qF8q2xt8lLseRVxzB71EH2c5YF?=
 =?us-ascii?Q?ZTRPBRL69aoqwLdS4HbsVMiKA3/6JK0xKWhDF9rQqeed4FIsO/zAAE+/Ub0a?=
 =?us-ascii?Q?9LunR+dspQ0qD/78jZSfJIh1o1nd/xkEq+KofnLX0Vl9qLNeXArpAmmwH5Zz?=
 =?us-ascii?Q?JKzPj/SYwxq0Xr4IpEfPJaN5dOC14Pjux+c5RW636u4NTHDFtA3cRwf+U5qf?=
 =?us-ascii?Q?eW7RCrdvJ8LZ/UDDo0YSK9xfED8i0XoC1kMpvXUHzcTI2d9mBVgy3UKxmBhR?=
 =?us-ascii?Q?qXVs54R87KFH2xJUza1wB8R4XDeuTrwZuHq/Rih962XVY2SkDPBRHSO4WKdU?=
 =?us-ascii?Q?J3GAp6JDDbnXbOeZJwCvH1LmilM2JgRZLEgDtMjrWgar5q5n7Ofx1ITn53b5?=
 =?us-ascii?Q?mqzbLA8XmzqjFgenSRDk3EQciHMXp5QimKc31iCnLNv0fvXBmnvZXWH+2EII?=
 =?us-ascii?Q?pU8X/rDwU2YMLMTBIwCBQzavmrNnbL0CRNC9LgScPhhPyfP4leUKcsai7FSD?=
 =?us-ascii?Q?MoiLKlUMo8mIzTfYqJv3woLw71ZH8qIGANJWwWIBJrPfK3IcpmggT3tgrs/a?=
 =?us-ascii?Q?Xc9/001zR5+TPEd+NGjVv3dmzYiMMuthC28YWOJ8fI7MUrDNWxLYxQTt779Z?=
 =?us-ascii?Q?fn3qKSTf6nINt9Z6E39t7Luf2yicE+bvnv8bZlKdUW25Bq/fGTIj75C/SGsU?=
 =?us-ascii?Q?OT87/mFUM7JSIgQtOa/6I/HnxSHw0VUbU+8UkiwWBWKWCfDX/UMeZx9czRpL?=
 =?us-ascii?Q?UfvxSesFMix+62sdg4Ik9tJt0HVOb+lmZDzE8FVJSRVCEIi6E5bsZtxHcliA?=
 =?us-ascii?Q?NUfSmN133bl1WcIou8+NYbPXvMFK3ncXsQ/fSP1zZeGy5LV/JnlJr3JsQj1i?=
 =?us-ascii?Q?qv4m//ajbQp6BqrQkgBvbTSJe295+MdCHoR/6hOXV3VQ8+3BAAKqkwC5LlzM?=
 =?us-ascii?Q?5PK5xi8QJA/S4d+Bv7LE4AZGA1DGb8S4z1ypZU6td9Xf+5WXylct0WpJRwxa?=
 =?us-ascii?Q?54xv4jfHB8CN4mQCGLvztzX9vk1PUq0O7TMQvM3FwL2/FfZcJeQQI+VvNqhe?=
 =?us-ascii?Q?eTDBncgYG1uAVLM5cK3t7dDAZpSEoNsV9gHcmKsnMRUkI2b35ubhzlbXHz4R?=
 =?us-ascii?Q?ZlUfun7YQ8f63cdSWIfIG92T9BqxjaNJsgKwbs9IPNGYKv0XanPdsnu+DsdS?=
 =?us-ascii?Q?g7935OwtAoKuOJk20bBuiq3RoE1Cncqii9eQpBVOqt5z3Szkb07ipfevZVNz?=
 =?us-ascii?Q?3puvl8OOR/SBFrJtY/Xo5NQq7rRifCmLOCNSWf3E1Mf10IzH3QIPPmEx0ZLY?=
 =?us-ascii?Q?QtZYS8X1R6ko+PU1UwRqpJHrfru/qA6nAj4tHlBM1CbD8q6Q5wASsXSZ+QAg?=
 =?us-ascii?Q?+Dkg+QotQZErmw8CwduvOwDm66AH8TWoKS/yvi1v2tGDhDKFYfMaQlT1nMc/?=
 =?us-ascii?Q?B8kytLiKxZcsSQ0TkicPoqjNve41B+TPCFwachV/iEdi0u62JapoBvjVPcDR?=
 =?us-ascii?Q?1CYkdxSueuRK39c=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL3PR11MB6361.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(10070799003)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?tBtyswePF9NfDa3YpdpDNTqCFfGmN4HJ9IN0Ur2bBzuWDDp73mteVJCjg8P3?=
 =?us-ascii?Q?vmhBXA1eOmqy51ROFG6vzc++RGFWLcqeF28ai+ZMZ/945m8n58DdytWGp8bu?=
 =?us-ascii?Q?SnrkuCrBGj5Br8YQs2g0Ql5IkDyjPnv7lDJzYhchRKAC3SwmddLbfjEMb6Nz?=
 =?us-ascii?Q?GZnoFocXL1XG+YEuGa89yBiDCdQATmWDYhUAA6Jt1lvCa5NACiS60Z7o8VOe?=
 =?us-ascii?Q?teqjJXxXLlCneZneXHKUZbIoh4B5FDjA5a0InX15jABnLXrG8jAWp8ZlGH3J?=
 =?us-ascii?Q?xwLq/QDYeimGkHOtNza80w/RpTHdGaoABRlqEH8v9CdZTB+/xW2U9AO1aOMK?=
 =?us-ascii?Q?sHNKaYgn8OHHpm7vCLAzveFslNHOBLUDuVYoWn3GUWrCuyt4/MzrYc7Y/MWu?=
 =?us-ascii?Q?Z+We46eqtmzOo3E4IEsgvh17B2ydbbnsOKhG7/xI4TWrH6Wy1MkDB8d5tojs?=
 =?us-ascii?Q?iEXpknFBu09zOHJW/LbS1ggyeUBUW8Rth/+uwsMsh1E2Fm9ZKEyVMXYgwM63?=
 =?us-ascii?Q?TvkFgtvvaNxTdM/RHREsDYKI1H1MjqxM2I/Da1toQUCy74bNiwOneGLAQfUt?=
 =?us-ascii?Q?MXM60iSw7sKnGl7S/CX0zXpBvFYiXQ5UWGUVYrxQQhjdWTF1rL9OdTEvkzMv?=
 =?us-ascii?Q?9aN54+v8px6qOb9j+Yfe90i/M7yRPxvqovfnuMmQe1g7K+a8Bb2s13mzytZh?=
 =?us-ascii?Q?UsbI/nC/vCh4CX7l7BIpB7ghUD+eSnqsgXhnKnPnS8pqPcy09jehxya4UOoH?=
 =?us-ascii?Q?jvcLoKncfINwWpr9i0R7QzBpGIopQziT3hW4fcfNRai/iZgrzk9zEVIFgPtA?=
 =?us-ascii?Q?sgah/0BMv0ScNowGdJsCmUm2WmD/HzHVFgW3+alTHhkBLuoQwT5fibX/S3IU?=
 =?us-ascii?Q?/mk5T8GrcGWKiKk91bojkXTID/6Q/LW4Y3I3c6/e+gKWlJEJVtDLbM9jGB1M?=
 =?us-ascii?Q?2oo1xvQaO5ykeHKp6Vu1Wub2Pjvdh9gHQqMasG50wyGSpQYUq/ml848QF2+D?=
 =?us-ascii?Q?MqKqp8YQE8W9iJ2h/WceSl/Hhnr1wrR7Y+CZtcGbYbkqz5zmLR5LbBNCCdHT?=
 =?us-ascii?Q?zKOLHYd6Bv9qWI7/AdsvAqBFJpCUQYfFX+euYEqtzZ1cb0uALukmeOP57Von?=
 =?us-ascii?Q?yxwgEsDoVmoajZ9wk+pWoOr4wcePHwrdzb2h78nJLsmbfBHsWiIFLz5Wb9nh?=
 =?us-ascii?Q?OGkLCgRGwMKkV0a/HUi3QLAai5GtjnMLkWvZHHkCeTcisUNtTqTL4APC78w1?=
 =?us-ascii?Q?514TjfN11ptszKLjpnXYjEWyObAezEj+n0XRzeVM8UzP+hGQQN1pUE4gUGvc?=
 =?us-ascii?Q?HKiGWhamuMOGctkPDLKvK6xnW1wFnmsoPkh+oylxCoydUMXl5FO+ZVry0EHb?=
 =?us-ascii?Q?Aa8swN4ZqNPogL2EVjars33KNW7UsEwWbJsnHN9TpGjJB0qdYepXyPiPgY1e?=
 =?us-ascii?Q?A3Y4QR0jhGnL78OJxH20Tahz4EyHfY8p9y6vEL6ga3ewR/3t5noKzVOE2CoS?=
 =?us-ascii?Q?iMlV9q8b6vTTzXabGEJkmo07Sshax7q+eeDOWChPRn16TdWRB97UdlKeSdpD?=
 =?us-ascii?Q?nFCuIi7J/B8YDaZme+eCxIyfKP7LeRgtTzgw+7peBqaeHoAjFnfBUubakSly?=
 =?us-ascii?Q?bQlwE63plLI7HaVQ4RHXXQk0Hpp4OrlezPP11/kNWvHO?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6361.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0109fea7-055c-43be-ff1d-08ddb9ea176e
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jul 2025 04:28:42.2707
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZNOP1JjjbaxHIU+QRe4/qoASFgsPA5+LezKhbAmS7hZmYq/5eAx9Br4isbB2MsU6O+LPqAjDWB3q1LBOXfP77w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9375
X-OriginatorOrg: intel.com

Hello Greg, Heikki and Dmitry,

On Tue, Jul 1, 2025 05:51:12AM -0700 , Heikki Krogerus wrote:
> On Tue, Jul 01, 2025 at 01:11:24PM +0300, Dmitry Baryshkov wrote:
> > On 01/07/2025 13:05, Heikki Krogerus wrote:
> > > On Tue, Jul 01, 2025 at 11:50:21AM +0300, Dmitry Baryshkov wrote:
> > > > On 01/07/2025 11:46, Heikki Krogerus wrote:
> > > > > Hi,
> > > > >
> > > > > On Sat, Jun 28, 2025 at 04:51:56PM +0200, Greg KH wrote:
> > > > > > On Fri, Jun 27, 2025 at 11:10:10AM -0700, Pooja Katiyar wrote:
> > > > > > > Add support for updating message out data structure for UCSI =
ACPI
> > > > > > > interface for UCSI 2.1 and UCSI 3.0 commands such as Set PDOs=
 and
> > > > > > > LPM Firmware Update.

...

> > > Okay. So how about a data structure for the entire mailbox that we ca=
n
> > > pass to these functions?
> > >
> > > struct ucsi_mailbox {
> > >          u32 cci;
> > >          u64 control;
> > >          void *message_in;
> > >          size_t message_in_size;
> > >          void *message_out;
> > >          size_t message_out_size;
> > > };
> >
> > What about a slightly different proposal (following ucsi_ccg design):
> >
> >
> > struct ucsi {
> >    // .....
> >    u32 cci;
> >    u8 message_in[UCSI_MAX_MESSAGE_IN];
> >    u8 message_out[UCSI_MAX_MESSAGE_OUT];
> > };
> >
> > The caller will fill ucsi->message_out, call sync_control with a proper
> > length specified, then read UCSI_CCI_LENGTH(ucsi->cci) bytes from
> > ucsi->message_in.
>=20
> Looks better indeed.
>=20
> > Note: I'm positive that we can handle message buffers in this way. I'm =
not
> > so sure about the CCI, it might be too dynamic.
>=20
> Pooja, I'm sorry about the extra work needed. Can you check this?
>=20
> P.S. I'm already on vacation so there will be delays with my
> responses.
>=20

Thank you for the feedback and suggestions.

I can start working on the changes. Before diving into implementation,
I would like to clarify a few points.

1. What is the preference with respect to the lengths of message in and mes=
sage out,
should the length be included as part of the ucsi structure or should be pa=
ssed as=20
separate parameters to relevant functions?

2. As Dmitriy pointed out, cci changes might be too dynamic and hence we be=
lieve
it's better to include message_in and message_out as part of the ucsi struc=
t and
exclude cci. What are your thoughts on this?

3. Implementing these changes will affect functions across different interf=
aces such as=20
ACPI, ucsi_ccg, cros_ec_ucsi etc. At this time, we can only validate these =
changes on the=20
ACPI interface. Unfortunately, we don't have the means to test other interf=
aces. What
is your suggestion to proceed with implementation? should owners of other i=
nterfaces
be involved for validation?

Thanks,
Pooja

