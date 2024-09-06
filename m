Return-Path: <linux-usb+bounces-14781-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 00F5196F376
	for <lists+linux-usb@lfdr.de>; Fri,  6 Sep 2024 13:47:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1F12B1C23FD0
	for <lists+linux-usb@lfdr.de>; Fri,  6 Sep 2024 11:47:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E51491CBE88;
	Fri,  6 Sep 2024 11:47:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="noFY9Vg8"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C0011CB339
	for <linux-usb@vger.kernel.org>; Fri,  6 Sep 2024 11:47:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725623270; cv=fail; b=dnS4s/RtvSoLimjhXS9QAAijmkQ1VIA0JS6f/Cu/k1MH+kUSvpu/cUr7sHFEPkw7oggbiiSBkKNafrlFwhBvdSIK3lyDqvMWzRn4UQ8rYcGU2w1FNymTAtgi3DMnhYb+XPpfae9uRLyTzVVTev0zSl+hA16/v6mJJ24alcq9HGg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725623270; c=relaxed/simple;
	bh=gc/DqbsK3MPzY3VdJ+YZwnfKA5sYOohX9Lu1phFio2w=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=sDTQd8RaTND2J3YjoVALhiKlvpdbIQ5lRYobwT/wnseOwfw+jDuULAGL4YIG3+HaqmgOn7qdFP5aZFQxRooIFzD/hsSVfZn3rbNagmLvY/E1J0F+AfUPwjQdYnmanoc6eEWU9zR7CO+jMqtYWWqabFdFafL+07nI25ki6oOqSZc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=noFY9Vg8; arc=fail smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725623268; x=1757159268;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=gc/DqbsK3MPzY3VdJ+YZwnfKA5sYOohX9Lu1phFio2w=;
  b=noFY9Vg8HnszpMy7YmdOGVcZctbC/JSOWhOcOKoPoCm5Zv6cMlqxINqU
   lkCCjcRFWRDO1lQSdHY0vOzDWamqpFWxjiDmmHeoIncZWUu6WwmsYsPiP
   myUFLF4dBHbgA4snnmnK8lNjJTYSvN+kxm4uM1E3EhWEkdixz6k/AQ+ms
   upCEZzY5H42nk36LYH05GgsbOPDjjhhg7F2A4BwNl4FCBRSP6U+yHs0p4
   e/4v9jBp2b/sMVy+YYlQRC00ZC80qbwfImrrWdF97CfWAQwMqjPCN//M6
   UqjFuBB55KtvxzSGZqx+6IB4/C6kAJEbbRYUay9q79wZlxWYZwtcBdUR7
   w==;
X-CSE-ConnectionGUID: i/n5pDHjT+ubu6+Kx19saA==
X-CSE-MsgGUID: q6O75tobR1iWMu5+Fr8YJw==
X-IronPort-AV: E=McAfee;i="6700,10204,11187"; a="24527665"
X-IronPort-AV: E=Sophos;i="6.10,207,1719903600"; 
   d="scan'208";a="24527665"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2024 04:47:47 -0700
X-CSE-ConnectionGUID: OcvzcNB8QEK0GAUxbm5TBQ==
X-CSE-MsgGUID: o0lY6GRNR7KmA6/jAKzwtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,207,1719903600"; 
   d="scan'208";a="65927926"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 06 Sep 2024 04:47:46 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 6 Sep 2024 04:47:46 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 6 Sep 2024 04:47:46 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.175)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 6 Sep 2024 04:47:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kFTZLl3vIbVkcZDB5GjrQpUYLtl8RTKDhQXV5u84D+WNIQQbaUx+qCleodnomCXbCwkalzwJSV7jGluuFa/ARoS9huNfvWDTB2cWm1dSpFKYp/WPcieEoxrJNoS42ZnHksd2L352NBY+sQALbp459dWWXADynIuOJvGtpmzY85se56LSRW1o2xiAfIUt3oaJQxlugtrjMeG5imgZxCvsl69xYYrredkBKu9mnVTeZmdlAF8fWqsTRwHe3BYmtyv1PfSWgZ+ARa6Tfe4o2dFs7oQoyEtdftSdvhzqisekhBFh1mYHjbxPcz7S0I/ZlnTvmKD4ew692SjP/4ZJp2goaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UyBvnqVqeYCRPkgrbyznpUgft8yyc81NpCo2bkoWhSs=;
 b=mw4nlDPRWfswNy+A5fNLzlElXUkvKsayYtjKj2aVleC8Dwhn5IROdjt6xlv6aHpvLYFgw5TiGPQ3nDmwEz1JN73/YXFcDdGplzzAVugt2vc7PVCoLpiF3eBWTvfW7TnR5NVSJhbGESgIaAVkhMKaqbVG9vHVef+hMV7+FeDt4uogI6Gb5O8bc2742K7YaqYS6TFaWGGIHoAdZOww1/mBqTTrQhhSUXS2WWKveNtH1dQznvbEYKZlP2F5QGloi6Qk9qg+Ha0LtAmY6CEBgYaHWCCHrrS3sB6O3hdBSszLH8BNNyeCcL9dti5pxYNHIQgfiQuDxKDyK3Ijc+bo6nQwZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB7457.namprd11.prod.outlook.com (2603:10b6:8:140::18)
 by MN0PR11MB6109.namprd11.prod.outlook.com (2603:10b6:208:3cf::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.25; Fri, 6 Sep
 2024 11:47:43 +0000
Received: from DS0PR11MB7457.namprd11.prod.outlook.com
 ([fe80::6078:57ee:53ba:57a5]) by DS0PR11MB7457.namprd11.prod.outlook.com
 ([fe80::6078:57ee:53ba:57a5%5]) with mapi id 15.20.7918.024; Fri, 6 Sep 2024
 11:47:43 +0000
From: "Gopal, Saranya" <saranya.gopal@intel.com>
To: "Christian A. Ehrhardt" <lk@c--e.de>, Heikki Krogerus
	<heikki.krogerus@linux.intel.com>
CC: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "Regupathy,
 Rajaram" <rajaram.regupathy@intel.com>
Subject: RE: [PATCH] usb: typec: ucsi: Do not call ACPI _DSM method for UCSI
 read operations
Thread-Topic: [PATCH] usb: typec: ucsi: Do not call ACPI _DSM method for UCSI
 read operations
Thread-Index: AQHa+rYWiHrR/od/8E2qmfl3hPaXrrI/fD+AgADg7YCAClBVEA==
Date: Fri, 6 Sep 2024 11:47:42 +0000
Message-ID: <DS0PR11MB74574A426FAA3322F4FFC017E39E2@DS0PR11MB7457.namprd11.prod.outlook.com>
References: <20240830084342.460109-1-saranya.gopal@intel.com>
 <ZtGGcRpavSITFai7@kuha.fi.intel.com> <ZtJDH4UCJMQbOWBY@cae.in-ulm.de>
In-Reply-To: <ZtJDH4UCJMQbOWBY@cae.in-ulm.de>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB7457:EE_|MN0PR11MB6109:EE_
x-ms-office365-filtering-correlation-id: b3a2a374-0260-49d5-2a30-08dcce69b7c6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?eFMdPvLtBD0+CnFYZc0XgNe5YVBlMCHQStvV/fRor7WEr6teWPTNq025kdxo?=
 =?us-ascii?Q?g6/qS8rQNegr+Az57FQqxq7PHXqpV3tqDu82YUU2GyxtPRZK3T89TLocDv7B?=
 =?us-ascii?Q?uKJ3QCJAwBwRrpsg55hnXe+7ixSrdXho4CNBstXJgFqzXl4jdhDjU+kNzN86?=
 =?us-ascii?Q?oaAKxW5WhaZ0aXE31nnkxonoi5apX8V+VnpKCTILDm1ar90k/ugCGjAA3gk3?=
 =?us-ascii?Q?hexk/OfTKQZwpwUXIY0Evf/I5W0CNrxLHcBVGShnbVDMWxVpXUmuQ6gbDPk+?=
 =?us-ascii?Q?KyoH/2Ma2IBUtFQKYnas3NesiZZ0Zeq+RmXO/i4+X10dnXbDyHKkyUDBBrfi?=
 =?us-ascii?Q?1qLBQ/iMhdJmG4v3hSjcafwgbHBeArwmXhYRD1Nd/IVbq/vOmEBVIkEwimp1?=
 =?us-ascii?Q?xdbO10i/bIwnD+nFpMknKiY6OUxF1MoiYSv/MwVemUylBt7165HfQ2+HKi6p?=
 =?us-ascii?Q?zd7zqSHUQhcHQbnFi5Akd7VtjvYCL3OssI2TiV8KvidOTzKHsXhhUw2/CRrA?=
 =?us-ascii?Q?Z4W8xZw1u+f1Gh/XjDHvsak7fWaYxXD/38TZ31zt+KvvQabQKlUB10uXCBGJ?=
 =?us-ascii?Q?NkDzHFgqtZPyjW4KDFbExwIDf/el2RNwbIPC2mymUrHJp0qtlii6hVQUASq2?=
 =?us-ascii?Q?zkwF8FZvhpblIc0GO9yk+W1ZCWQE+Bw2/u4Gpwi0un3YpMNAMDdthroLQkZE?=
 =?us-ascii?Q?ju5R6eSNYtVn+7EHT7cuN4izwsmXR5k2OxXC8QZUFnm/Rpg0O5aZxJwT7MaV?=
 =?us-ascii?Q?2d8Eu6FzkH9Twff/QE7OmAnYmBeISWCIOgHGndiO0KGzD1el6BtNMYsyam0Q?=
 =?us-ascii?Q?Zqxngif0fczZMON5TYqUzxxZGLv/BUUpVYzkoZ9b3MBzcXzqsT9znTQY2Ciz?=
 =?us-ascii?Q?iyR1nEnMUFufMdnjns+LLpigmYYGphfTIAlYeHYthISzwBCChsX8ICDKWDLL?=
 =?us-ascii?Q?hp36gG9WLcuMdCQeD+Qk2J8+SiayYHR5YMUk35Eu2H5w+pdWK0RGU5bJ1NYB?=
 =?us-ascii?Q?8uI1EqQvuTg8JRthXEXn0I+naRH5WyYvPpsDVdW1ktRQ7a9G+FSW3ToX04xR?=
 =?us-ascii?Q?hI+OpuUpcN8D8ovr6ZJiJvQa6btqzD4aVLxzwE5AhWELmx8in5h1YZbWVZNh?=
 =?us-ascii?Q?S2X4hbHC5kJerdxz93cVolWNyGifJTEOCzznKMDBadFs2EhM5JLbJBxoj04d?=
 =?us-ascii?Q?NwUnyht7vP3gXkoNb1YShxci9CmjKVqDM9skjOx222gi7e0pmSXaZbcBWBxK?=
 =?us-ascii?Q?41u9NqHv7K7oEbA/C8ioLL2Wmu9cGAR6pL6tK3J2q94RSVw/gh98Ot1Vw0mD?=
 =?us-ascii?Q?eWe+avwAx+TzaR7uvT2HIYOrSBXz9Iw1CDVJHyQTF5ZWpL6kA/sI7uDuh3K+?=
 =?us-ascii?Q?p/i6uoVykpgYmz3fwgWBReWfkoeQ4IPxcG0hNYNn/ftfhbv9XSbdLXUyfz6X?=
 =?us-ascii?Q?aPmZ2/FzzyI=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7457.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?S0AqMd5/ZpOQFa6TQxCaiUTn/J5EUjNs5rZQClu5uHIgIy+tXyEAR2uliC8b?=
 =?us-ascii?Q?We8c2YOGlrDfxGxUOo0FpAOeCr05uJ3nn+mQVCtm6xs3NK4aAQALiuKfFO/f?=
 =?us-ascii?Q?sj75mKt2q0lAkzrF31Q6qiNg5uwtU7UuFaFrgZmnse/McYRiL/U2g3UUCU9J?=
 =?us-ascii?Q?H8YFU5BhoLmoAhbez8NBeJJjdWCnv1GOW3ItQ2LcEaGzK41grm6PrHEJXrsX?=
 =?us-ascii?Q?vS/wJdESApUgVSMjfajkDCKDImSNameLGcbfHHLnTZXf845+n/6fYfPQiWOF?=
 =?us-ascii?Q?InZLj9rbN6d5flD7MxSxiIIwEBZ+7M9kaum0FjeEmIlO9jzOvMUGZWM8U566?=
 =?us-ascii?Q?D1u6FNeIJXaxeVeh/vH8BzP4GotPGL1kjxmKGZUMFc8vMceCVetcNC7xbzDi?=
 =?us-ascii?Q?yJQT8zOd+XNNOdVraOvr3VQHK92xVDf+/5DLvdclNTfbHeQXbE2jEp5Yt9aP?=
 =?us-ascii?Q?JUFhTWSca6hAdJF1OpFcHd2iE9TN4LoCNd+7LipSqM2GRnAgFBbePPcpyFdu?=
 =?us-ascii?Q?IymlG7rDuSo4OkyVbz78EW3ypfmgBU3YuG1M7zRwVQcR7iHLx/wXo8GaxB6E?=
 =?us-ascii?Q?47fkyJfptFsWDC1yN9bVMtcp0s+o9BAFJ5mMn2O699UOTjKae+xOB8FgA8fQ?=
 =?us-ascii?Q?qZOtUeWNWs1Kac7m2cDx5OYPajTgeKAoVRStjIsWHTI1uoREdwa+MidzQtqU?=
 =?us-ascii?Q?bs824O1TTN7qCiNid/094S6JH+Y7PysrV0/urWef68+7g4hqMD0ox0as6fnz?=
 =?us-ascii?Q?pcwFyO6zTAsiiFHP68ItYFWW8KzFWFugfagLIB+W8enmQ4wMJNXLfLPgVGt9?=
 =?us-ascii?Q?7UhiY5/66o6WyXQETYqvnkGDgcqLdsqlpnd1hZgln8+2OJatiV+VeJhRTJo5?=
 =?us-ascii?Q?UBMo1qAuet0hI/7CKt4/abXPwbRSkA+EJrAJXy1RzlSw1q9V/uX6VSvSNBG+?=
 =?us-ascii?Q?s3jD16uP+w6tOw3OdGfwwTWu9kblVwSb8oqOTX1mSfHxFo06vTJ2npgsQejX?=
 =?us-ascii?Q?CUjXZrjaD/dJGz8C6whWwGC35ib2xBBn9POOL0mdWXDRsNFcVII3ePsr3Uj9?=
 =?us-ascii?Q?T3AkQpRw/6wmdFD/4xZlKeTOQkmCvuJNcSOOW2mI+9jTJ87iemun2H8KzzSZ?=
 =?us-ascii?Q?VmNhZVKQI2URkJNdlSNe3RXerQDe+La6oBzUzePGN4N6BGut+bssByyu/8Qu?=
 =?us-ascii?Q?rm5O2rqT0FQL8jpOZg83QZTqDTTjtul55uwtoNbD8jic7r9HGaNXC7KQmVlb?=
 =?us-ascii?Q?4A35b74E4nPEHTRJG7mdjtu8/KviK+iBD72LInhuvbyQhGSe4m78M242/D4h?=
 =?us-ascii?Q?cY6IkJs/y+tPe8uAnV3JPlRlrLOJcq1ikQ4ZknM3wg+5t6NKbZOPZZOEj/6x?=
 =?us-ascii?Q?TitXEw9ZG6yxYjcyl0WuVLEfuMTpqxdXsJOlF9Oyx401G0eblf8kglTNUWTj?=
 =?us-ascii?Q?fRZjeOKkEoaIuVdLkXe7lhRixHjTzJaxhlmhgQp+UpD89GnVVdBQisEouGrH?=
 =?us-ascii?Q?QMSHbUwQcWWsLm0YFzu0gkoXO5Gc9qq2Tq7h4pysxdgL8GnaHRp40God7BEg?=
 =?us-ascii?Q?pfXQmGcXx3e6o2Q26RXW2CUMvau+YKaCCrf41wvA?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7457.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b3a2a374-0260-49d5-2a30-08dcce69b7c6
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Sep 2024 11:47:42.9242
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IPRvmTA1oa/cadh1/llxAeyP7bSCnh8ZVq6GDEo/DaQpL6dAdGJTsGafnN0o3u0IFfIeb8CMsShip4DWjkxo6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6109
X-OriginatorOrg: intel.com

Hi Heikki, Christian,

> -----Original Message-----
> From: Christian A. Ehrhardt <lk@c--e.de>
> Sent: Saturday, August 31, 2024 3:40 AM
> To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> Cc: Gopal, Saranya <saranya.gopal@intel.com>; linux-
> usb@vger.kernel.org; gregkh@linuxfoundation.org; Regupathy,
> Rajaram <rajaram.regupathy@intel.com>
> Subject: Re: [PATCH] usb: typec: ucsi: Do not call ACPI _DSM method
> for UCSI read operations
>=20
>=20
> Hi Heikki, Hi Saranya,
>=20
> On Fri, Aug 30, 2024 at 11:44:33AM +0300, Heikki Krogerus wrote:
> > On Fri, Aug 30, 2024 at 02:13:42PM +0530, Saranya Gopal wrote:
> > > ACPI _DSM methods are needed only for UCSI write operations
> and for reading
> > > CCI during RESET_PPM operation. So, remove _DSM calls from
> other places.
> > > While there, remove the Zenbook quirk also since the default
> behavior
> > > now aligns with the Zenbook quirk. With this change,
> GET_CONNECTOR_STATUS
> > > returns at least 6 seconds faster than before in Arrowlake-S
> platforms.
> > >
> > > Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> > > Signed-off-by: Saranya Gopal <saranya.gopal@intel.com>
> >
> > Maybe this should be marked as a fix. I think this covers:
> > https://lore.kernel.org/linux-usb/20240829100109.562429-2-
> lk@c--e.de/
> >

Heikki,
I see that Christian's other patch is marked as a fix already (https://lore=
.kernel.org/linux-usb/20240906065853.637205-1-lk@c--e.de/T/#u).=20
So, can this patch go in as it is?
Please let me know if I need to resubmit with any changes.

> > Christian, can you check this?
>=20
> The change certainly looks like the correct thing to do and would
> remove the need for the zenbook quirk. I'll try to get that combination
> tested by the original reporter of
> 	https://bugzilla.kernel.org/show_bug.cgi?id=3D219108
>=20
>=20
> > > ---
> > >  drivers/usb/typec/ucsi/ucsi_acpi.c | 56 +++-------------------------
> --
> > >  1 file changed, 5 insertions(+), 51 deletions(-)
> > >
> > > diff --git a/drivers/usb/typec/ucsi/ucsi_acpi.c
> b/drivers/usb/typec/ucsi/ucsi_acpi.c
> > > index 7a5dff8d9cc6..accf15ff1306 100644
> > > --- a/drivers/usb/typec/ucsi/ucsi_acpi.c
> > > +++ b/drivers/usb/typec/ucsi/ucsi_acpi.c
> > > @@ -61,9 +61,11 @@ static int ucsi_acpi_read_cci(struct ucsi
> *ucsi, u32 *cci)
> > >  	struct ucsi_acpi *ua =3D ucsi_get_drvdata(ucsi);
> > >  	int ret;
> > >
> > > -	ret =3D ucsi_acpi_dsm(ua, UCSI_DSM_FUNC_READ);
> > > -	if (ret)
> > > -		return ret;
> > > +	if (UCSI_COMMAND(ua->cmd) =3D=3D UCSI_PPM_RESET) {
> > > +		ret =3D ucsi_acpi_dsm(ua, UCSI_DSM_FUNC_READ);
> > > +		if (ret)
> > > +			return ret;
> > > +	}
>=20
>=20
> This is slightly incorrect because we wait for the completion of at
> least one other command (UCSI_SET_NOTIFICATION_ENABLE) by
> polling cci.
> However, this is a very minor corner case. It could be fixed by adding
> an optional ->poll() method or similar that is NULL on other
> implementations and does the DSM READ on ACPI. We could then call
> this
> before read_cci when polling for completion. If this is done -
> >read_cci()
> would never call the DSM method.
>=20
> However, the change in its current state is a definitive improvement,
> and looks good to me. Thus feel free to add
> 	Reviewed-by: Christian A. Ehrhardt <lk@c--e.de>

Thanks for the review, Christian.

Thanks,
Saranya
>=20
> > >
> > >  	memcpy(cci, ua->base + UCSI_CCI, sizeof(*cci));
> > >
> > > @@ -73,11 +75,6 @@ static int ucsi_acpi_read_cci(struct ucsi
> *ucsi, u32 *cci)
> > >  static int ucsi_acpi_read_message_in(struct ucsi *ucsi, void *val,
> size_t val_len)
> > >  {
> > >  	struct ucsi_acpi *ua =3D ucsi_get_drvdata(ucsi);
> > > -	int ret;
> > > -
> > > -	ret =3D ucsi_acpi_dsm(ua, UCSI_DSM_FUNC_READ);
> > > -	if (ret)
> > > -		return ret;
> > >
> > >  	memcpy(val, ua->base + UCSI_MESSAGE_IN, val_len);
> > >
> > > @@ -102,42 +99,6 @@ static const struct ucsi_operations
> ucsi_acpi_ops =3D {
> > >  	.async_control =3D ucsi_acpi_async_control
> > >  };
> > >
> > > -static int
> > > -ucsi_zenbook_read_cci(struct ucsi *ucsi, u32 *cci)
> > > -{
> > > -	struct ucsi_acpi *ua =3D ucsi_get_drvdata(ucsi);
> > > -	int ret;
> > > -
> > > -	if (UCSI_COMMAND(ua->cmd) =3D=3D UCSI_PPM_RESET) {
> > > -		ret =3D ucsi_acpi_dsm(ua, UCSI_DSM_FUNC_READ);
> > > -		if (ret)
> > > -			return ret;
> > > -	}
> > > -
> > > -	memcpy(cci, ua->base + UCSI_CCI, sizeof(*cci));
> > > -
> > > -	return 0;
> > > -}
> > > -
> > > -static int
> > > -ucsi_zenbook_read_message_in(struct ucsi *ucsi, void *val,
> size_t val_len)
> > > -{
> > > -	struct ucsi_acpi *ua =3D ucsi_get_drvdata(ucsi);
> > > -
> > > -	/* UCSI_MESSAGE_IN is never read for PPM_RESET, return
> stored data */
> > > -	memcpy(val, ua->base + UCSI_MESSAGE_IN, val_len);
> > > -
> > > -	return 0;
> > > -}
> > > -
> > > -static const struct ucsi_operations ucsi_zenbook_ops =3D {
> > > -	.read_version =3D ucsi_acpi_read_version,
> > > -	.read_cci =3D ucsi_zenbook_read_cci,
> > > -	.read_message_in =3D ucsi_zenbook_read_message_in,
> > > -	.sync_control =3D ucsi_sync_control_common,
> > > -	.async_control =3D ucsi_acpi_async_control
> > > -};
> > > -
> > >  static int ucsi_gram_read_message_in(struct ucsi *ucsi, void
> *val, size_t val_len)
> > >  {
> > >  	u16 bogus_change =3D
> UCSI_CONSTAT_POWER_LEVEL_CHANGE |
> > > @@ -190,13 +151,6 @@ static const struct ucsi_operations
> ucsi_gram_ops =3D {
> > >  };
> > >
> > >  static const struct dmi_system_id ucsi_acpi_quirks[] =3D {
> > > -	{
> > > -		.matches =3D {
> > > -			DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK
> COMPUTER INC."),
> > > -			DMI_MATCH(DMI_PRODUCT_NAME,
> "ZenBook UX325UA_UM325UA"),
> > > -		},
> > > -		.driver_data =3D (void *)&ucsi_zenbook_ops,
> > > -	},
> > >  	{
> > >  		.matches =3D {
> > >  			DMI_MATCH(DMI_SYS_VENDOR, "LG
> Electronics"),
> > > --
> > > 2.34.1
>=20
> Best regards,
> Christian


