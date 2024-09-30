Return-Path: <linux-usb+bounces-15588-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 988DB989EA6
	for <lists+linux-usb@lfdr.de>; Mon, 30 Sep 2024 11:42:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BD07B1C2143E
	for <lists+linux-usb@lfdr.de>; Mon, 30 Sep 2024 09:42:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7999188739;
	Mon, 30 Sep 2024 09:42:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F1OVokLg"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2E581885A1
	for <linux-usb@vger.kernel.org>; Mon, 30 Sep 2024 09:41:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727689322; cv=fail; b=WZ2y6Ae8VsTUSO7WjK4eoqcFIJ/M41XkVGV56x0Ov7KPiZGyU+xPjv2IqZmXg3qtCb6ZqqMqvQfq4zj3lB/8YHnImFyeJleQONPUTr1wfKL1B4/gn1j5ciKsBNdXV36iiSCC98m+zvvEacGsR5OaRyE0QY4hPKxdPi1UjKii0gM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727689322; c=relaxed/simple;
	bh=oztplLTeya5QwtWWHZJM9VlsAIkDZJ2nEC8oxrrMoc8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=XAOYu3qMu+xUjy5B3yLZVoQS12zE7YyQLbvnDdhIYzuBPJor6D+pO8N+9LEbeT4/lBDAtrcjTO31iB5YGdBd348qAqJME+VgND++UjSQjdELcnC4y8EYxQUThW9+5FcicYtJoVB2MYcINP/+lrVjqZjHWuNjKPJnEiUwrOgtVY0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F1OVokLg; arc=fail smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727689319; x=1759225319;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=oztplLTeya5QwtWWHZJM9VlsAIkDZJ2nEC8oxrrMoc8=;
  b=F1OVokLgGEZ0AAMz2egn7CBMvOuerK/HnMGFTu1y8855zhBjU1+/LWrx
   vBOyI2weM2wR7uPE7ALybF5Sy3GWabjCz/AP0XeUcPL7+kmsPbPa6LHuh
   54zdt/8nR1Kbk0uQJhvtAEbu4ZXOzFWrHlkXOa4vco9CB6xqC0q9QyF5+
   dRJBM0HrVKTZZuR2X4If2bokAiNJ5Ee6q3+k1fdOXKRzPetNrF8qjMfC1
   K1/3UNlNlU9vXjZr4Al6SA8jFfw+tr0fW4GWW1QLttimU4zZruyJuGgcO
   2CnRrPss4DRgyY/sxs4oFnGzVch1veQWjnCVPwVOX6iIVCJqQPCUSmOh/
   g==;
X-CSE-ConnectionGUID: eULVWZboT22xVkfToEMlOg==
X-CSE-MsgGUID: brTAvFjvSkitUgIsFj9dBA==
X-IronPort-AV: E=McAfee;i="6700,10204,11210"; a="26653690"
X-IronPort-AV: E=Sophos;i="6.11,165,1725346800"; 
   d="scan'208";a="26653690"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2024 02:41:54 -0700
X-CSE-ConnectionGUID: svdnW9WATiiSTSZZPITsZg==
X-CSE-MsgGUID: YK2VUPJaRdCy1gM/OhvLng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,165,1725346800"; 
   d="scan'208";a="73282440"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 30 Sep 2024 02:41:55 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 30 Sep 2024 02:41:54 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 30 Sep 2024 02:41:54 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.171)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 30 Sep 2024 02:41:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HUCJw3cSMn/MRYWwyk82dGD1EYCmL1t50xWJzy0e37LHq5J3iBRB4bYafTij5DwfIlXch7k4wE+CtQRK3/nhLfdpDHOVuHVLygFHwrRgPekqEfFrv8EezMhDhLHr/q2X9QQ9cavHaNsavCbACGnTntzGfYJELlQxq1lfVgJvUNo5uxMixQXDdyYREV2NaNUIPtRSUNyLliRuzo6ezRLoELrXg/pSrEjYfmHtrV7u2bNaFrvRvAYZ+IOTXGsKSE6R4HHSavbn6wsHR+wz7AWNiNEJa9+nP0xBXikLaJTvPgpmBNm3nKcxx464L0txQ8UgXjDvpzp8R0d0lsZDQYWbWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rZEP5XjqS03b5vaXdCi9nUHXbcx6BqvtTLeURR9IEME=;
 b=k7PQgMFif8J1vCDhfM3cYqsDpl7NwVLpGl1dSQ6WJ/mMrz49/48mi5CXxA9ZBVwR7i2Z2Ziao+TL4cwxisEsdXuLj582LTAZmJOZi1SCLGAsqWsWhlTJbfrII6qDiQmztnV+agt0ZaADsq4x1kAE8tDY3ttX1WQP9DnjHbN78gni5P51gSKi48I6uxt9iU8/wevdcVtDhTYx71qWGVCVeD9LnWLso9IzoCCBCBvKZSuJxEMcjFIn4Rgrbpmzbh5HBEgOjDScamWjTAwm/a+IMLh+vpjEZIXhDrIyWpVuK66TpLeojrR6/Tg/mO67UBFQflTwvNTGYNy5Pom5bHMVdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB7457.namprd11.prod.outlook.com (2603:10b6:8:140::18)
 by DM4PR11MB6288.namprd11.prod.outlook.com (2603:10b6:8:a5::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.26; Mon, 30 Sep
 2024 09:41:51 +0000
Received: from DS0PR11MB7457.namprd11.prod.outlook.com
 ([fe80::6078:57ee:53ba:57a5]) by DS0PR11MB7457.namprd11.prod.outlook.com
 ([fe80::6078:57ee:53ba:57a5%5]) with mapi id 15.20.8005.026; Mon, 30 Sep 2024
 09:41:51 +0000
From: "Gopal, Saranya" <saranya.gopal@intel.com>
To: "'Christian A. Ehrhardt'" <lk@c--e.de>, Heikki Krogerus
	<heikki.krogerus@linux.intel.com>, "gregkh@linuxfoundation.org"
	<gregkh@linuxfoundation.org>
CC: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "Regupathy,
 Rajaram" <rajaram.regupathy@intel.com>
Subject: RE: [PATCH] usb: typec: ucsi: Do not call ACPI _DSM method for UCSI
 read operations
Thread-Topic: [PATCH] usb: typec: ucsi: Do not call ACPI _DSM method for UCSI
 read operations
Thread-Index: AQHa+rYWiHrR/od/8E2qmfl3hPaXrrI/fD+AgADg7YCAClBVEIAEkC6AgACaQYCAARnOAIAAr9oAgB6W84A=
Date: Mon, 30 Sep 2024 09:41:51 +0000
Message-ID: <DS0PR11MB7457767F548B993C11B69E36E3762@DS0PR11MB7457.namprd11.prod.outlook.com>
References: <20240830084342.460109-1-saranya.gopal@intel.com>
 <ZtGGcRpavSITFai7@kuha.fi.intel.com> <ZtJDH4UCJMQbOWBY@cae.in-ulm.de>
 <DS0PR11MB74574A426FAA3322F4FFC017E39E2@DS0PR11MB7457.namprd11.prod.outlook.com>
 <Zt6979hVhtzGBeq6@kuha.fi.intel.com> <Zt8/VYZomXPGoF0/@cae.in-ulm.de>
 <ZuArunRcvrVbKPKC@kuha.fi.intel.com> <ZuC/Po0iPHYDl7Y9@cae.in-ulm.de>
In-Reply-To: <ZuC/Po0iPHYDl7Y9@cae.in-ulm.de>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB7457:EE_|DM4PR11MB6288:EE_
x-ms-office365-filtering-correlation-id: 34c11d43-44c7-4890-0f84-08dce1341c97
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?rZWgr1g82ksjpJ8qXaV6j41JG3QYueBSaVKdhEZGqE4coTNaqNS7qVmwBXyl?=
 =?us-ascii?Q?W41eMtQ2koOVkiuCB7LwFAbso6P7MjGCbg3O10RSHVzmPEhWqUhAqPuAamdU?=
 =?us-ascii?Q?+grnQMffsPpNVxw208XPMvgc2VgzDwhYDfj5E2BduBpGBTJd44STq7+lDdeQ?=
 =?us-ascii?Q?XO69ccpPoShN+r0/irZzEX5VEWYuRUSSj5bbAKH5OSRYroRerbTxZFfdHlIH?=
 =?us-ascii?Q?s8aX30HSJedrZQoLcnG8uxubxLSsCzzvCEcqwAsNtmKdQ9y4s7FlnXUUSe07?=
 =?us-ascii?Q?Fis1+trzwJfs5G35QG0mBoKerbz1ZBoA5xK0W7Doh96ChE25z7Iv5oqB48j4?=
 =?us-ascii?Q?oQiqVMCrN6A8hFD2JUqzrerKByx4hpHUE2CSMCPjfC5jJtOp0Asbpiblwtur?=
 =?us-ascii?Q?YImRTAmDP20aR0UXJMlBVRbYxoPjQkB0Zcmud8fL6zbIGUJs5ugE1G2ya8Bg?=
 =?us-ascii?Q?GJI0SQe2B66jkWa3sAdJd9Z7vARt2NLEwui+W0mjb0JNzl556sp++L5klvcm?=
 =?us-ascii?Q?OUMWExV2EM/+ugfdYF1aLSi9RPF7RaE6FFFxfajCvaLOmkCLQwh4P6G/4LxV?=
 =?us-ascii?Q?DpHq1AAV/sM30f7fZw6uzm2AWRRptPZcaeZadX/Dgr0m/Fmz87aphO1wlBRR?=
 =?us-ascii?Q?KF77AEyB8rCOKXdlihMkSiK0h74Fy6mRT8J/oN5Ve7TYi1wNwIMh7NbxkhQ1?=
 =?us-ascii?Q?yNSIBplmo44DiBynSZjCErQLy/zlUg01oDELpl07+2VjzgyopZ8WStjs/kRr?=
 =?us-ascii?Q?msrtXeizCAoS0lduvs3Znz60MQ7IaFj0cNIlZ0p6t7LUIwz2YjTEYviaoZfF?=
 =?us-ascii?Q?UwxQng+r+dIKg8VBCi6vjfLHmI9XHs2FVQRdBPmOv3z54xiJM6A9pWHGF7sn?=
 =?us-ascii?Q?qQtpAfv5+Es2/Je3mC5riey0vAy4Zi4HvGOz4pXZNjdFpWJBkV5G0qVPFv1k?=
 =?us-ascii?Q?Mmu8fVcUm9TCnwdN0+Bd5iPgZpd26gLpJw7GP7dCHY08yE8JBKOnjlrsiX6g?=
 =?us-ascii?Q?LHFtZWYpubKcAnpjAVWF0wRYlFgozeLN9ihOI7IfBJx0TrQ6Z1IKOK4ddUkB?=
 =?us-ascii?Q?qkQMSvRFqamg+r+CBhXL+fnzaa0iOHxcRROFus2DP08LiTo21cp05Z2uqB0O?=
 =?us-ascii?Q?aHGWyQcCKC6OcRQLSxtcvInL6ygn/gCRQ4qJMwM/xAT2YD3sEFwamsr+oLW9?=
 =?us-ascii?Q?Z0bAxr6FNvgOeApu5/cjTZb0f8H8wdlPrS6wUppgF1nzlDP/aC6UMMENEBDZ?=
 =?us-ascii?Q?wUrbEodT01vMxTP2RnAndVYX1wXBNufDdRIW1G+MSyRumcgQIDb1M9p9je15?=
 =?us-ascii?Q?5JSsrDWmkpKsPg5DEg9XTuSJ237c38Q2Jo1G8Kn2Bgw2wvGHFnWwe9JmZl5Q?=
 =?us-ascii?Q?QhAXGws=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7457.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?eBzBLo5q8pfjxQ+bCnxGhOzDDGvr+o9T23AJn4WdaZ4aSwhj2sFAoIRtI0UT?=
 =?us-ascii?Q?JaDyILGHfaBQnqXqcc8g/a47X67JOzBeKKDGklhZQNZu2k/fM4bLxlpwLs4f?=
 =?us-ascii?Q?74zNxwzh2NWeoxMaWXHVICNx9fs/y9+LCvov0elq2y2As3XSCytqKDtBZti8?=
 =?us-ascii?Q?v2Wdo12KlpIpKCDi/GLP6iJYTS0tgajGZvYlDVJUmtHwljwfhhNErwh8j4LL?=
 =?us-ascii?Q?e0oUvjTtIoYBMx7Gkcan6OZ8TYBreSy/ZHlHlcgkLBVkDEaR3QMjohZYe6bL?=
 =?us-ascii?Q?BQXp6wyfZ/AriTC13rmCNI1RW8hJh5k3wi3DsJRHeOLwFycwyEqw/BV/a5IN?=
 =?us-ascii?Q?Ie9C8bLxHu7kpKeDDBF9YM2uGppZP18boxFh1KtEPuWgrpMcLGqj+rYRr3gY?=
 =?us-ascii?Q?zrEp8UlDvCldy0c7Dqe/Nns7jPelC5jDWG+CPbu9QUOwJhebxTt4QdFeIEcH?=
 =?us-ascii?Q?pIWqIrVjx8CISAbFKr2GgJYfP+QrlhvbezwylpmmbRNdUVDFMEM0z/vuf9b/?=
 =?us-ascii?Q?o9FaNFKR/CZTLtTQdCBDW64QJtQobmqLKkQZxXK4O+UQCcDzkKDKXcruuLMm?=
 =?us-ascii?Q?bLfWjueKk/7BzTqyWGgWiLADLEzzEmN5iPqGA99/XSAam80la5aW/x5od/xI?=
 =?us-ascii?Q?9VxcE51ri6FCXTkq68Ofacqk/jCytxSAlLyZqdIvpA5ivYQSpTuOG/IAu2HY?=
 =?us-ascii?Q?Sd1YBFGUp0sUfwdKoV23Bwg8ZOZUUmzjzxfRh4OVF7/0Sk3uR7VzyVxDRQEq?=
 =?us-ascii?Q?ZjU9ybIIFizmowtCCcNNvUq9KnFK4O6F/d1w4/HkttG6v35IqSswGjTbswUm?=
 =?us-ascii?Q?yYGZtZU9eeVgbLCGv2N7Sn39QJ6UZx3I0YhbCJjFnDHoldTRvjJe+8OfBjSf?=
 =?us-ascii?Q?IFioEPjesjOOrSda2EOVw47yv1DYX0TDWwlUr6aDHtKgGRGYmKXIeKnsZkwd?=
 =?us-ascii?Q?9m51Gehsver6/scn4yGkTnWkS3JQUzh8CAU5LTyF4cVY+bXtfV2Ed8X/HAAh?=
 =?us-ascii?Q?i/CNS+G5cvgto3X4IrkfUqUIuSvIGtwO4TGz004vuB4Xg1Mht4KCQCO53bk8?=
 =?us-ascii?Q?k+2wb5Ts4rZ6mAvZpZpwEQQsHhwXn2nOCs4eqIlb8h0oQAYkwXsZ79mKLNOb?=
 =?us-ascii?Q?KjP2QJr3apmPyc0/9qGFj3H4MfWvWWbofHm+QmictAKQ1Cvvh84w1vLXX6vr?=
 =?us-ascii?Q?IuY7HRBummxPVBx4dJwHj29U4AhGCz5J1NH4bKaPcfMOsM50U51lEdUsK5dm?=
 =?us-ascii?Q?C/AdAi4qzHGgrQ1dJUDNoObHGY2gWwj8LoGEnhw3OrYjDtEkMkAxk7n6J0yc?=
 =?us-ascii?Q?zFpV8DdMADmUVTroGGDOiqi6WV0iVAci2tLfI/64dyGfJxG292HieuF6VNLS?=
 =?us-ascii?Q?NiS/h2ZDphmTMI+8DV8gAaVDTnX0Cb+0zCFthr4ouWuveVMgT8KdfmA9acno?=
 =?us-ascii?Q?5v1XZVedlqtR1eA+SUTMjvV5Gzke8AM04MUHPRC5RBZmuLoSMT0ezBBRQfNK?=
 =?us-ascii?Q?qvYQ9z7LSf5cVevExmVKoF8dQl+gFlB9jU+UcjLgYhQ9Xp1xbCDBl91mP2gZ?=
 =?us-ascii?Q?EQQ4Zn0jcAZg4wsLxubtk4ti0iiXrQn3l2OdIc7l?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 34c11d43-44c7-4890-0f84-08dce1341c97
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Sep 2024 09:41:51.3956
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YAC5yEx0BIl1A1z842knaB0P+lxVgm6ONj3uw4nEbhkliaI2CnIkNDmHZvJnSQ7eoG+JNvPydmMa8sBze2QFAw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6288
X-OriginatorOrg: intel.com

Hi Greg,

> -----Original Message-----
> From: Christian A. Ehrhardt <lk@c--e.de>
> Sent: Wednesday, September 11, 2024 3:21 AM
> To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> Cc: Gopal, Saranya <saranya.gopal@intel.com>; linux-
> usb@vger.kernel.org; gregkh@linuxfoundation.org; Regupathy,
> Rajaram <rajaram.regupathy@intel.com>
> Subject: Re: [PATCH] usb: typec: ucsi: Do not call ACPI _DSM method
> for UCSI read operations
>=20
>=20
> Hi Heikki,
>=20
> On Tue, Sep 10, 2024 at 02:21:30PM +0300, Heikki Krogerus wrote:
> > On Mon, Sep 09, 2024 at 08:32:53PM +0200, Christian A. Ehrhardt
> wrote:
> > >
> > > Hi Heikki,
> > >
> > > On Mon, Sep 09, 2024 at 12:20:47PM +0300, Heikki Krogerus
> wrote:
> > > > Hi Saranya, Christian,
> > > >
> > > > On Fri, Sep 06, 2024 at 11:47:42AM +0000, Gopal, Saranya
> wrote:
> > > > > Hi Heikki, Christian,
> > > > >
> > > > > > -----Original Message-----
> > > > > > From: Christian A. Ehrhardt <lk@c--e.de>
> > > > > > Sent: Saturday, August 31, 2024 3:40 AM
> > > > > > To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> > > > > > Cc: Gopal, Saranya <saranya.gopal@intel.com>; linux-
> > > > > > usb@vger.kernel.org; gregkh@linuxfoundation.org;
> Regupathy,
> > > > > > Rajaram <rajaram.regupathy@intel.com>
> > > > > > Subject: Re: [PATCH] usb: typec: ucsi: Do not call ACPI _DSM
> method
> > > > > > for UCSI read operations
> > > > > >
> > > > > >
> > > > > > Hi Heikki, Hi Saranya,
> > > > > >
> > > > > > On Fri, Aug 30, 2024 at 11:44:33AM +0300, Heikki Krogerus
> wrote:
> > > > > > > On Fri, Aug 30, 2024 at 02:13:42PM +0530, Saranya Gopal
> wrote:
> > > > > > > > ACPI _DSM methods are needed only for UCSI write
> operations
> > > > > > and for reading
> > > > > > > > CCI during RESET_PPM operation. So, remove _DSM calls
> from
> > > > > > other places.
> > > > > > > > While there, remove the Zenbook quirk also since the
> default
> > > > > > behavior
> > > > > > > > now aligns with the Zenbook quirk. With this change,
> > > > > > GET_CONNECTOR_STATUS
> > > > > > > > returns at least 6 seconds faster than before in
> Arrowlake-S
> > > > > > platforms.
> > > > > > > >
> > > > > > > > Reviewed-by: Heikki Krogerus
> <heikki.krogerus@linux.intel.com>
> > > > > > > > Signed-off-by: Saranya Gopal
> <saranya.gopal@intel.com>
> > > > > > >
> > > > > > > Maybe this should be marked as a fix. I think this covers:
> > > > > > > https://lore.kernel.org/linux-
> usb/20240829100109.562429-2-
> > > > > > lk@c--e.de/
> > > > > > >
> > > > >
> > > > > Heikki,
> > > > > I see that Christian's other patch is marked as a fix already
> (https://lore.kernel.org/linux-usb/20240906065853.637205-1-lk@c--
> e.de/T/#u).
> > > >
> > > > The other part still needs a fix.
> > >
> > > Well technically not. I've established with the reporter of
> > > 	https://bugzilla.kernel.org/show_bug.cgi?id=3D219108
> > > that the immediate regression (keyboard on ASUS laptop not
> working) is
> > > fixed with the ucsi.c patch (that got your Reviewed-By today)
> alone.
> > >
> > > UCSI on the ASUS laptop is still broken but it always was, AFAICT.
> > > Thus I'd like to push the above mentioned patch as the fix for
> > > the regression.
> > >
> > > The reporter was very helpful and responsive in testing and
> > > I intend to look into the reason why UCSI does not work after
> > > that with the reporter's help.
> > >
> > > > On Thu, 5 Sept 2024 at 20:00, Christian A. Ehrhardt <lk@c--
> e.de> wrote:
> > > >
> > > > >
> > > > > Hi again,
> > > > >
> > > > > attached is version 4 of the patch. This will not fix the error
> > > > > messages we talked about (I have to think about this some
> more).
> > > > >
> > > > > It should fix your keyboard issues, though.
> > > > >
> > > > > Heikki had another request to change the patch and it would
> be
> > > > > cool if you could test this version to make sure that it really
> > > > > fixes your immediate problem.
> > > > >
> > > > > Best regards,
> > > > > Christian
> > > > >
> > >
> > > > [    0.019168] [Firmware Bug]: CPU8: Topology domain 1 shift 7
> !=3D 6
> > > > [    0.019168] [Firmware Bug]: CPU8: Topology domain 2 shift 7
> !=3D 6
> > > > [    0.019168] [Firmware Bug]: CPU8: Topology domain 3 shift 7
> !=3D 6
> > > > [    0.019168] [Firmware Bug]: CPU8: Topology domain 4 shift 7
> !=3D 6
> > > > [    0.019168] [Firmware Bug]: CPU8: Topology domain 5 shift 7
> !=3D 6
> > > > [    0.019168] [Firmware Bug]: CPU8: Topology domain 6 shift 7
> !=3D 6
> > > > [    0.019168] [Firmware Bug]: CPU9: Topology domain 1 shift 7
> !=3D 6
> > > > [    0.019168] [Firmware Bug]: CPU9: Topology domain 2 shift 7
> !=3D 6
> > > > [    0.019168] [Firmware Bug]: CPU9: Topology domain 3 shift 7
> !=3D 6
> > > > [    0.019168] [Firmware Bug]: CPU9: Topology domain 4 shift 7
> !=3D 6
> > > > [    0.019168] [Firmware Bug]: CPU9: Topology domain 5 shift 7
> !=3D 6
> > > > [    0.019168] [Firmware Bug]: CPU9: Topology domain 6 shift 7
> !=3D 6
> > > > [    0.019168] [Firmware Bug]: CPU10: Topology domain 1 shift 7
> !=3D 6
> > > > [    0.019168] [Firmware Bug]: CPU10: Topology domain 2 shift 7
> !=3D 6
> > > > [    0.019168] [Firmware Bug]: CPU10: Topology domain 3 shift 7
> !=3D 6
> > > > [    0.019168] [Firmware Bug]: CPU10: Topology domain 4 shift 7
> !=3D 6
> > > > [    0.019168] [Firmware Bug]: CPU10: Topology domain 5 shift 7
> !=3D 6
> > > > [    0.019168] [Firmware Bug]: CPU10: Topology domain 6 shift 7
> !=3D 6
> > > > [    0.019168] [Firmware Bug]: CPU11: Topology domain 1 shift 7
> !=3D 6
> > > > [    0.019168] [Firmware Bug]: CPU11: Topology domain 2 shift 7
> !=3D 6
> > > > [    0.019168] [Firmware Bug]: CPU11: Topology domain 3 shift 7
> !=3D 6
> > > > [    0.019168] [Firmware Bug]: CPU11: Topology domain 4 shift 7
> !=3D 6
> > > > [    0.019168] [Firmware Bug]: CPU11: Topology domain 5 shift 7
> !=3D 6
> > > > [    0.019168] [Firmware Bug]: CPU11: Topology domain 6 shift 7
> !=3D 6
> > > > [    0.019168] [Firmware Bug]: CPU12: Topology domain 1 shift 7
> !=3D 6
> > > > [    0.019168] [Firmware Bug]: CPU12: Topology domain 2 shift 7
> !=3D 6
> > > > [    0.019168] [Firmware Bug]: CPU12: Topology domain 3 shift 7
> !=3D 6
> > > > [    0.019168] [Firmware Bug]: CPU12: Topology domain 4 shift 7
> !=3D 6
> > >
> > >
> > > >
> > > > > So, can this patch go in as it is?
> > > > > Please let me know if I need to resubmit with any changes.
> > > >
> > > > If you prefer that we go with Christian's patch to fix the issue
> > > > - which is fine by me - you need to rebase this on top of his
> patch in
> > > > any case. So you will need to resend this either way.
> > > >
> > > > Christian would you mind resending that second patch after all
> where
> > > > you take the Zenbook quirk into use on that ASUS system?
> > >
> > > See above. The immediate regression is fixed with the already
> > > reviewed patch alone. The remaining issue with UCSI on the ASUS
> > > laptop not working can be fixed separately.
> > >
> > > I'd rather base a fix for UCSI on the ASUS laptop onto Saranya's
> > > patch because I think that patch is the correct thing to do.
> > >
> > > Unfortunately, testing by the original reporter was inconclusive
> > > wrt. this. I have one report of a test run with the (classical)
> > > ASUS quirk (and the other patch) where UCSI on the ASUS laptop
> > > did work. Patch version v1 was the result of this.
> > >
> > > With Saranya's patch and my patch to ucsi.c the regression was
> gone
> > > but UCSI did _not_ work.
> > >
> > > As this does not make sense because Saranya's patch should be
> > > equivalent to the ASUS zenbook quirk. Thus this needs more
> > > investigation and dropping the zenbook quirk patch looks like the
> > > correct thing to do.
> > >
> > > > Let's make that as the actual fix for the issue. Maybe it's more
> clear
> > > > that way.
> > >
> > > Please let me know if you disagree and I can resend the ASUS
> quirk
> > > patch.
> >
> > No, that's not necessary. So we go ahead with this patch from
> Saranya
> > as is - we don't caim it fixes anything. Then you guys continue
> > debugging that UCSI not working on the ASUS laptop issue. If I got
> > this correct then:
>=20
> Exactly. And
> https://lore.kernel.org/all/20240906065853.637205-1-lk@c--e.de/
> proceeds but is independent.
>=20
> > Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> >
> > If there was nothing else, then my appologies for all the noise.
>=20
> No need to. The state of things was confusing and this type of
> "noise" is your job as a maintainer :-)
>=20
> Thanks for the review.

Gentle ping to consider taking this patch.
Heikki and Christian have reviewed the patch and no more changes were sugge=
sted.
The patch still applies clean to linux-next.
Please let me know if any more changes need to be made.

Thanks,
Saranya
>=20
> Best regards,
> Christian


