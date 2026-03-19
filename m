Return-Path: <linux-usb+bounces-35217-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id dTJFJEmLvGlv0QIAu9opvQ
	(envelope-from <linux-usb+bounces-35217-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 20 Mar 2026 00:48:25 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id F1BC32D4435
	for <lists+linux-usb@lfdr.de>; Fri, 20 Mar 2026 00:48:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2F5FD30CCC04
	for <lists+linux-usb@lfdr.de>; Thu, 19 Mar 2026 23:48:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 029C73793A9;
	Thu, 19 Mar 2026 23:48:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UzK8h78s"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 311BC344D86
	for <linux-usb@vger.kernel.org>; Thu, 19 Mar 2026 23:48:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773964096; cv=fail; b=JzPV0bGwFTHCFzzRkH+JZlKqIehmvlS+zAmJ4iTx/PCxx5pxij+sQcB0vKw1bY5mqRH5UjQk6kt7CWt1Gz9mBNsWd2A9tmClHA4IsO8mmMm/3YLqAYzbWTvfm3VOwxKBdZmHlMwsZg9UISEVMY8pUxFHMM+QOmflsye4U6XyUC0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773964096; c=relaxed/simple;
	bh=tv8+H/4gSIY3kYn/fRS4/IuEFnEy1Ss91/gljOlEr+g=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=lvb2AKc3V/IC2CizFnYbkucrl7zDolR02xUa0MdaRJfHPJyGs6EJV2donh6SF6tIym/7aSczI4HbupeREO+k9dKd0DK2mgD3VR0gx2aJ/8mFW4tLIUlPRPaADlPXXOD5LTkyH4MqsnBuOhb2FDpmFlXAusBcUArYKPy8UpO+Nnw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UzK8h78s; arc=fail smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773964094; x=1805500094;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=tv8+H/4gSIY3kYn/fRS4/IuEFnEy1Ss91/gljOlEr+g=;
  b=UzK8h78s353QC+nQ537p2KE/TzoevuPAl8eAOlMFMh3HqLOEsSmDD722
   CRwoRlRmanGTYvg/NrzjczSTef8wngb/qwgTOegCqISpEo88VEFD3ZgRq
   CLfR6+zDjwMYY0SYTFiE3ygI8LVmClwQJNydAalBwbZNDZgoSazlHWh8M
   2lM6RErFIeuGB6ZIidIcOpim1bfJ1By2ORg8UmfE+q2mtb3Gv9L2IDGi5
   Xz5nt+kzBq+pozW40sgw0oznOmo5+y8OM6cXKZ5GW0XjQ8B6txvooCMXS
   ULBzJOq7VWedVmtMNjm/9tizQVDhzjUEGsVt0d9hKw4Yj1GUQ34nu6yR3
   A==;
X-CSE-ConnectionGUID: O2TVXgQAT8y5sw5nQ1wApw==
X-CSE-MsgGUID: kYdRV0cOSr20D/+kSXr7Zg==
X-IronPort-AV: E=McAfee;i="6800,10657,11734"; a="78954440"
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; 
   d="scan'208";a="78954440"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2026 16:48:13 -0700
X-CSE-ConnectionGUID: gezXl4w7TT+A8TtjtHFqjQ==
X-CSE-MsgGUID: MdBdtbFxTtyGPYVBdzVlqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; 
   d="scan'208";a="222344038"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2026 16:48:13 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 19 Mar 2026 16:48:12 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 19 Mar 2026 16:48:12 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.63) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 19 Mar 2026 16:48:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LpiUWH4NEKRgG4oa0rfGXZrf2RniVLAnJXBk1Z0CSKI2KuoB5aQWoGCSArydtDw3wtD8dVhzMgrc1GsTU7s4BHupR1rX5QWMfkrzgkGQJ8xBJLOjof+Hosapbrg1nvQhg9/AuHRXDcxu2AwfWkQKM9BBUrzsvGg8I+1x2ucNv3AAIahzppsJpdm5fcUNllA+VPRcM9xMOgAyvshfQi1ywUyoOPGEFQtji7ykatgj/Pgny3s3sibSEMiw4rG/JMmARzlzgBfucchTskiBsxS6gi3W90WVuuVfAFMG87Vy0lk6N0gRnPFZg3EhcvmGFcmw82D9lshp8eRbVbTwNoKteA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=agGjuqU3yRPLLsoiqb7YHkgWWfEj6VAdgma43yLIBZA=;
 b=PSvEUB7nzaWVhsJavDigqz3B2rmUykbNhhpMkaIaSZzXiruFiv0PizEpEr9fn6kBRPZVcj9ABI5C10tIHzRX2tMnxLayHAPljVwWoYzkdMVZ8C+qHGCswnyXYJmrwK58vSYbUiYBQDgO8vUb9X14pD69Ut5pifacIkI++2pzpm6K0hD8ftcyyiJwy7fCfH9Y0LkUjrjLaVSI2yjnowO6shBUE+ULOvvFsG6s99JBgdU3CBa+bzPNbmlV16B5NxrpFHaTrKAtiz0fTcE9jsErQfuoylT9j/ZH4DdYf+btAYXfFoTZcMxyrZbLHTZVVhyORs/+rB1RlQER1zglEDLz8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL3PR11MB6361.namprd11.prod.outlook.com (2603:10b6:208:3b4::15)
 by DS0PR11MB7409.namprd11.prod.outlook.com (2603:10b6:8:153::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Thu, 19 Mar
 2026 23:48:04 +0000
Received: from BL3PR11MB6361.namprd11.prod.outlook.com
 ([fe80::6cff:a013:9499:b6c1]) by BL3PR11MB6361.namprd11.prod.outlook.com
 ([fe80::6cff:a013:9499:b6c1%6]) with mapi id 15.20.9745.007; Thu, 19 Mar 2026
 23:48:04 +0000
From: "Katiyar, Pooja" <pooja.katiyar@intel.com>
To: Johan Hovold <johan@kernel.org>
CC: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
	"heikki.krogerus@linux.intel.com" <heikki.krogerus@linux.intel.com>,
	"dmitry.baryshkov@oss.qualcomm.com" <dmitry.baryshkov@oss.qualcomm.com>,
	"Pathak, Asutosh" <asutosh.pathak@intel.com>
Subject: RE: [PATCH 0/3] usb: typec: ucsi: Add support for SET_PDOS command
Thread-Topic: [PATCH 0/3] usb: typec: ucsi: Add support for SET_PDOS command
Thread-Index: AQHcsZAKEfRqYuXmK0illRcKcp0kALW1g/0AgAEI2JA=
Date: Thu, 19 Mar 2026 23:48:04 +0000
Message-ID: <BL3PR11MB6361B1A1FA99E307EDDCB74BE74FA@BL3PR11MB6361.namprd11.prod.outlook.com>
References: <cover.1773090896.git.pooja.katiyar@intel.com>
 <abuoQm_XkYizxRU8@hovoldconsulting.com>
In-Reply-To: <abuoQm_XkYizxRU8@hovoldconsulting.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL3PR11MB6361:EE_|DS0PR11MB7409:EE_
x-ms-office365-filtering-correlation-id: f93f1549-ad2e-4421-fe35-08de8611f6c1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|10070799003|366016|1800799024|38070700021|7053199007|22082099003|18002099003|56012099003;
x-microsoft-antispam-message-info: OE2o3NdZdJwJaU13vUID5MadJpfliMBrkffctpdfyvW00eX1AMSAatX1NazHdGNoC1OK6FeYmF1/72wdk8LVq6lmG/aa3gH24oUJzmkUbVeW5rMvhY4o42ILk55iPndgLX1kteArZEaWI1LzOdzxiKM0VL0/dL8YiGMBSSzO6Iu3oWK4/LDkE1NUZqSWyId0QIkLgERbrQ+7F5cgvBEtJ2VJTXohC4YjHOcSh5Mft28upljVhgeKpCSw0k2J6zoR2ZOL2Hi2FmCqZ8QAw3u6rpdtw2sxuXm6G8W4LTl3LYwXh9/gEq3rFDilN19Wjibt85rMn57V1UgpqO0NSneWEcvjq4PuVjrcB2uXHNL+mVk9gUW8SQVOvapfOGtFFr0T4vNU6JWLPBiW2VKMB2hRTPswjBvvnpwRJn2yBGYpD+FsmKOaEvmDTjmIUvLeQAs9OF/WvYmV3cRLig4cK2fq/45vZnHtIY8dis3MXd/NkK1hTsAnF1meRlZBzpsNDtUujeI/bxmmEv1UOpqMh/6vFjCHqiCn84ob3ur5Fw6n1Otkg6MhIJH1PRq+HvJaiC067I8XgSumtWmbP5aXhsFkp4IKyG3/Ci2M10ZkJkmEXzUnvJl3eEEwaACrh0Zm8L2XYMdC/Qki6kWvsurxAYvWPLydRmELkUqlhaR1qAYq0jIlh2X7yKBhg5cUYbKzoSuc0urmEwz55u6UmYBUU6beNfAGj8Aga3kAPmr+Xius0A7o7yp7UdYnsXjCLOE15jugLPQEbxAQBrrvqaytqv4BKKbxoQ+IqFuXs7lj6rEbeIdhpRMToJNJxQBKa2gy1fp7
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL3PR11MB6361.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(10070799003)(366016)(1800799024)(38070700021)(7053199007)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?bz6jhQoUOUWgw3sV+wQkVfd7d2wchnBCzPPdDa6pVtuu/204Ddq7KRydFEH4?=
 =?us-ascii?Q?Aygtu265DIJgwal5LNsjD1UgcCUSp7GHHMDe+7hGzFKUEnXdQi/rmzD+rxk7?=
 =?us-ascii?Q?PCzDJQF6l6UlG4S0WIMuQsEAQNYy6M7D//2EzR+jVQkw9DcooDxO9+LQwQj6?=
 =?us-ascii?Q?ghG4VWeU4SIxhdhXwvTbjAED/ySY5AFrmE2JZ9YfxAd43ApWvbnqGXzFuXAw?=
 =?us-ascii?Q?yyRCMifXADxOPOsshyyKTKH1cpPu2zOUXFFj6X67PsZiN7gzJssxhoEDR8CO?=
 =?us-ascii?Q?i1W/RWsXvN9BN3j4BH77mm7/ipPxWfYOEU6owpEsnfvmANkd/qpfJiEaiFy0?=
 =?us-ascii?Q?14+AR3BnExX4c02ymIm1uOOBtxGVrlYO9Dpm+L2RoAt3JP3tuiija+m9vaOt?=
 =?us-ascii?Q?hoUB+i0Xsdo/A64iwDlEQn2kwM8d/5S1g6IT6beUpQOP092m9ogHaWlPhGAJ?=
 =?us-ascii?Q?MX/vG3qGm1uRrdPJANUsCg122CtKI8ZO6XZrOT061ZrMPNdeS9opZ1EOIvKs?=
 =?us-ascii?Q?YdJi5VxxGFk7wXFn5YUzg2Rc+pq8wissTTbIg7gbBMndlYlPxKY/N9EBhXG2?=
 =?us-ascii?Q?RpN4DOh7TY1xFDwzEnfmUvHsk99o9xktZDdczbwASzK/vmlOOHOUt4J6GbIa?=
 =?us-ascii?Q?r4OcZ+UI+rSV9EdZEF9uGGLlQgksszlJMGke9Zoz/TOz/nRVhlJzlKllqnPo?=
 =?us-ascii?Q?285qr3zceQ1NJgd2bNhQWhYjq8+mgWBZ6PG8nho2ejjXhtuvqbHL223q6ouE?=
 =?us-ascii?Q?/GXhl+VtbI97d0hQuArFm5mrpMu69gRk//TewLDF1JY8BLxLk6MXlnziFbNq?=
 =?us-ascii?Q?3lnGxskPYrIXKCvB+qMKW/+brJn/TFR3AZRQkABlfDT9gkaaJJ7b5DcjmJ5x?=
 =?us-ascii?Q?y6nfqoGX/0C7KftKU+wr3a+M6J2JvQXDEqOzYKMRt1j3DNNPE2KkRyXtmCi/?=
 =?us-ascii?Q?4A1DN87EEJca4svZS6fQwvaVW8XcsHAKk5OacxgqzmaR/j/g15INSEdG7Y50?=
 =?us-ascii?Q?PExKat0lhhhVi4JIHTP7NIOsrf6gc9ZlepFy80dpklNeMXMScj1wB4SqUYKL?=
 =?us-ascii?Q?u/Cg++AhkA4DM5+dfoRbM9Ml10dKKG6a39EEboqYBTn/wLl6k3O4lAlc27YD?=
 =?us-ascii?Q?VkCrg0krBDajxTnFDAWt7LZNMxMOcxDeYtXtUewjZ7jcz0skG8LAJ8nrIADP?=
 =?us-ascii?Q?SEmZgjOi1ZrjegsZvPQgNp0gki9xwsXbSSpkLfkT4V7vIHHEZM1WFCcEDW3E?=
 =?us-ascii?Q?WIOei/RnYdpLqWrBok/CqWsW97TB41mGZTrvvSalF2rdXsC8iWS44cGcNlI+?=
 =?us-ascii?Q?nxBMPWhCP/Xv2Bmui/wLb9QeC75saBc0VNTZVrz8zM82ENJBBSzpnB6mOpwC?=
 =?us-ascii?Q?AdcAbPAhAZ42p0sWz7Hdwoc1AdQvyKFy5raetbugznTrOxqRuVlv6T6+N0FF?=
 =?us-ascii?Q?//RLAhfJFZcdnGdiAzYALBqJHi07YCFj6eOJBpFkINBsmZJqEVXI4K/ZTonx?=
 =?us-ascii?Q?3pnYbyFTQikK+gEYSaKZpVBmebk9qihSIPUtNe7yfIKEzTBPq2jDtRTHhjZG?=
 =?us-ascii?Q?A3qg+IZJMOYGn/8/vwMLdOEcpb9K4Ng7JOc9KaEOo8V1j9dqEoXKm1xcsPsR?=
 =?us-ascii?Q?fsoRGz7KTBS1RQ8oMst56tk7ALka1rnB2+M/Xet6gIXVshHUCbF3luH54Syn?=
 =?us-ascii?Q?OkZo8aqCAi50zy1rg1piemy/AdqRJ5Q2q2Hb2hiMv51+ajpFu2y+Yh1cGP/c?=
 =?us-ascii?Q?kkiKdAWmb/7UQyeL7kJvkDo3zjitDVSik3/1AIuTszQYvtI0F1lTj+jK301H?=
x-ms-exchange-antispam-messagedata-1: BROOmspa0w1d+A==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: oTbB3pyg8inieMG3oHCuTP54i2NU+OeSHDgrLJJ7kRL4xrrKr7L1Cd3WILZC/CDbctXEGfgiwTBvCQ0YtDD3PQesbVAc34MO+CnkAVMubUPQjlnlI5i/I7ONbqgqbD5VdbMLzELFQt5FcxbYJRe1ycqtwnHfO9/jRhC9nxu03CJSj7h6gKD8NBV3x2+kZpDghsiJ63pKKq9+c68qjz1kYq0MZnZJysgeOxf4mzzs+Qe4b+NYsw4XTTgA/vtqog/kUvc4pPMdMv3tmrsLHHxDYwCx9uULmI+kdbuFE6kQUSKh7uwnGr2iffbhbh4KWws2EeeXio5P8d+CfhxhhvTO1Q==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6361.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f93f1549-ad2e-4421-fe35-08de8611f6c1
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Mar 2026 23:48:04.5131
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 30WdITmVluj2/0OOOvLUpydKoQld2yxjS9CtPEyoppwSrvVJ5x4h3VJ9Y+WPVf1SiKU5VNZbRmz3El/9+HBg7w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7409
X-OriginatorOrg: intel.com
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35217-lists,linux-usb=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,BL3PR11MB6361.namprd11.prod.outlook.com:mid];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pooja.katiyar@intel.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	NEURAL_HAM(-0.00)[-0.992];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-usb];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: F1BC32D4435
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Johan,

On Thu, Mar 19, 2026 at 12:40:00AM +0000, Johan Hovold wrote:
> On Wed, Mar 18, 2026 at 03:25:28PM -0700, Pooja Katiyar wrote:
> > This series implements support for UCSI SET PDOS command. It provides
> > interface to send message out data and update source or sink
> > capabilities PDOs on a connector over debugfs interface.
> >
> > Pooja Katiyar (3):
> >   usb: typec: ucsi: Add support for message_out data structure
> >   usb: typec: ucsi: Enable debugfs for message_out data structure
> >   usb: typec: ucsi: Add support for SET_PDOS command
>=20
> This is really v6 after v5 was reverted:
>=20
> 	https://lore.kernel.org/all/cover.1761773881.git.pooja.katiyar@intel.co
> m/
> 	https://lore.kernel.org/all/20251222152204.2846-1-johan@kernel.org/
>=20
> What changed in v6?

Changes in this series compared to v5:

- Removed message_in and message_out related fields from global ucsi data
  structure and replaced with function parameter approach.
- Added message_out parameters to existing function parameters, keeping the
  flow similar to message_in data handling.
- Modified ucsi_sync_control_common() signature to accept msg_out and
  msg_out_size.
- Added write_message_out() to ucsi_operations struct.
- Added ucsi_write_message_out_command() function to handle commands
  which need to send message_out data to PPM.
- Updated platform interfaces and other function callers with new function
  signatures.

This eliminates the concurrency issues that earlier version introduced due
to shared data structure between multiple threads.

Thanks,
Pooja

