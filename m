Return-Path: <linux-usb+bounces-18645-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 49C079F67CE
	for <lists+linux-usb@lfdr.de>; Wed, 18 Dec 2024 14:59:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A59437A02AC
	for <lists+linux-usb@lfdr.de>; Wed, 18 Dec 2024 13:59:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E35471B4233;
	Wed, 18 Dec 2024 13:59:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nvRrYNcO"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 203A4158853;
	Wed, 18 Dec 2024 13:59:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734530360; cv=fail; b=V/tJCSEHOolhAQMBQk75Ufcv59coKTWfuBZhqaS9QKBJDfEsnkNg/+ydqzjbf5ScPEIzoAt79j3w313wt3UTwdeuj4gIU+kMMFTEohBv5xCRSPZ6jsEgYxlcRgcnUY8USsnTWRnL6LuJJDITvx+mxzIsC1VsfXBVX1kV0Zj1b2k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734530360; c=relaxed/simple;
	bh=GOJrd7vygbCuM/pTSfq+oC5Im5VyECD86EC8TmerZl4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=AOiaL6GLNjqhtWK5bTSZoStgdPJmxaVOedIml4OhQOZ6L4vu2nJxahKQ2BZGESnjbFXylAwAKZfI+nblmlsLnvL6DIWI30AH7vSxOVWsEXUFaAKj8Y+qV0nkevcteLmxLiocbUFSSIvhqn/bTnXNkiXY8iMNINE4tD+z3KlHbvI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nvRrYNcO; arc=fail smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734530358; x=1766066358;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=GOJrd7vygbCuM/pTSfq+oC5Im5VyECD86EC8TmerZl4=;
  b=nvRrYNcOltX9kR6db4InehzbwAkp3o/zOMQ6UUYUYqUNXkUUGUcHO8kk
   VO2+9JlufgJ2DR28iYGTGhtTSXvz6U5U3dffjKSVZ9NYpCjjrCNBnLmW+
   WKBSlR5xeWOv0ZOLMTS3CjLHf6zL5ZQsgu+l+0UkCJtk8xW754ExmdlY2
   IPs7pDVGiHhRNaMLmMPIPUTwKI1s5WeociMo+9EwjUyrqwDH6k5C4Fx6s
   AYVMtda8eTDaG0nu1k+m5OqKS+m5nlohtNIwMaHb32lrA8g9m5aGSeQYU
   /GTtP65j8I1ZUhGIeN86UO7mknQbRWr0kVQSZstxwZf2Ygl2EsuISiXg3
   Q==;
X-CSE-ConnectionGUID: mKMsTg/xTZm7v5QXqy/erw==
X-CSE-MsgGUID: v5tr/TBuTTyii81+mea61w==
X-IronPort-AV: E=McAfee;i="6700,10204,11290"; a="35038036"
X-IronPort-AV: E=Sophos;i="6.12,244,1728975600"; 
   d="scan'208";a="35038036"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2024 05:59:17 -0800
X-CSE-ConnectionGUID: iNXE1Tx4QneTopdwDYhnOQ==
X-CSE-MsgGUID: LGvLPzscSde3gv+huzx0cg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="128854249"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 18 Dec 2024 05:59:05 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 18 Dec 2024 05:58:51 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 18 Dec 2024 05:58:51 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.176)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 18 Dec 2024 05:58:51 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VbAx1t8QbAXwxen70+DZoZIdiOjKNf8ycvQXwn6eP7jffjPVI31miIB81wA2QaLPFlTSaqxrz+45CDyFMEyOfMkX4GGjuiHIxSoIz1huiXG+/GZBfRPqgzPXoj3jFodpVsoJk4mzikVuv3KGI45GKk5LvwnG4ov6tbU8Cd/218l618CB3YGOtC9CDeXTldcfchjlDl31BoQZH/dsfwWO5ek8c03UUpB841ycRn0rthgyLGUQ0sIHDIvXqhvUSPpaQyNxMnsR3ZFQv7c6eLdCqeSRCg8gRCf/IU/azGidjwK4kIHM30uItddYuYME+y7oBcVRFlElIFRM8hrDBTuFmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g4y26aWKkGKU0QHxP9xG/0vSaU8ZsakFCMlsv6lteDc=;
 b=VBX42/id21nLmaGNHNRqb68wEKRm/Yxiyf7BYsDO2zjSVEei4vH91jOz4WBzwJK3eTFS659PNEWkBg65sHQc8B7y/rkXXr8vgDRTUwB+kbeGQzXZlx3KN+X0cq5eC3KsKqatDRtZh+YYOaBMBrru241F4xSjwJXGdDlZNpyJwPb9GZwPhksDGfFrPECrgerTmtkfF6vKHZ34cF98cVw8lA2QPLKvwS63x/VUwqMVA4OjOviFNIXtVcmN04c5lj7iGO90lj3ZCHSreZ3lkNS8O2Q8kZedUns4AxmzlqvENcKuYmb7hWyMQr793Z09nfZonpy+hxmuj/w7Bi+6fc8dCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB7457.namprd11.prod.outlook.com (2603:10b6:8:140::18)
 by SA0PR11MB4670.namprd11.prod.outlook.com (2603:10b6:806:9a::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.13; Wed, 18 Dec
 2024 13:58:50 +0000
Received: from DS0PR11MB7457.namprd11.prod.outlook.com
 ([fe80::6078:57ee:53ba:57a5]) by DS0PR11MB7457.namprd11.prod.outlook.com
 ([fe80::6078:57ee:53ba:57a5%5]) with mapi id 15.20.8272.005; Wed, 18 Dec 2024
 13:58:50 +0000
From: "Gopal, Saranya" <saranya.gopal@intel.com>
To: "Christian A. Ehrhardt" <lk@c--e.de>, Sasha Levin <sashal@kernel.org>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Heikki
 Krogerus" <heikki.krogerus@linux.intel.com>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, Prashant Malani <pmalani@chromium.org>, Jameson
 Thies <jthies@google.com>, Abhishek Pandit-Subedi
	<abhishekpandit@chromium.org>, Neil Armstrong <neil.armstrong@linaro.org>,
	=?iso-8859-2?Q?Uwe_Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	=?iso-8859-2?Q?Samuel_=C8avoj?= <samuel@cavoj.net>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, Kenneth Crudup
	<kenny@panix.com>
Subject: RE: [PATCH 5/5] usb: typec: ucsi: Clear UCSI_CCI_RESET_COMPLETE
 before reset
Thread-Topic: [PATCH 5/5] usb: typec: ucsi: Clear UCSI_CCI_RESET_COMPLETE
 before reset
Thread-Index: AQHaepn1LhyztCr/UUiE4X9x7MOm+rLpSqsAgAHIMwCAAG6NwIACMkow
Date: Wed, 18 Dec 2024 13:58:49 +0000
Message-ID: <DS0PR11MB7457CB34BF977557C935DEFDE3052@DS0PR11MB7457.namprd11.prod.outlook.com>
References: <20240320073927.1641788-1-lk@c--e.de>
 <20240320073927.1641788-6-lk@c--e.de> <Z18hJM55ED2hYJ6D@lappy>
 <Z2Cf1AI8CXao5ZAn@cae.in-ulm.de>
 <DS0PR11MB7457CB5AE5287EB8D57FAB69E3042@DS0PR11MB7457.namprd11.prod.outlook.com>
In-Reply-To: <DS0PR11MB7457CB5AE5287EB8D57FAB69E3042@DS0PR11MB7457.namprd11.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB7457:EE_|SA0PR11MB4670:EE_
x-ms-office365-filtering-correlation-id: c6a59a10-bbc5-4b7c-f096-08dd1f6c1971
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014|38070700018;
x-microsoft-antispam-message-info: =?iso-8859-2?Q?anac/4b1dHIOCzTf6G4877Q9/LKXwZ+YT8tZgVgY5811+bcoEytQ8h6PNe?=
 =?iso-8859-2?Q?3XsqlEe1e+x34WUr6OZ4WStmOEn4F+NXoxa0yC56YxiSxQNNp5BemGFFu+?=
 =?iso-8859-2?Q?FMsjeKWs9hDyaeb+hr4ACQAIZ5ZB08fTgpwOCzRlmpme0d56rLY2e1SZyg?=
 =?iso-8859-2?Q?wKFCYvRDrb6ydFwj2nY0+J+MZcWnjKbBbwF6zcpUL99UaB9Gw30gDztjbz?=
 =?iso-8859-2?Q?MjFnd2BBOKxaV6XNTAaZxN4DLFb0mEKKtMZ4eCs0i750SdwXNHV4dltw3k?=
 =?iso-8859-2?Q?LG3/5/DXPnJbwDkiOmZ1fUerLBq3ImOPU2LqjH8x6lPnTd1f5ecNgHQCHO?=
 =?iso-8859-2?Q?rBo8RvOhQUA/yRk7OCZFWKPPP7AQU7KqlQeinmxVjEFbEraAIr3yCJ8SjI?=
 =?iso-8859-2?Q?Y6romc2dX4Fnqs43cdPkirphElo4u/mUbW6dTOGWC/rf0kTnhSVaE+emzO?=
 =?iso-8859-2?Q?odfJ0xLFPwD9UrbESEXD+Tgu5yBNjH1UKcXijFGRLSOGJXJp2P+nyPfuJa?=
 =?iso-8859-2?Q?NDXnSEAVyRkAlLbQYJCUrGy7Xu+LkT3izrcWP/skuuEDC+juCun6+t7vh0?=
 =?iso-8859-2?Q?Pf9/Nm/UxyG4+tj74RdsnjxlgfFvNrjyj/9BU4k813hY9HIrO0Z++ob8yo?=
 =?iso-8859-2?Q?kWVNP3tYdBbPz/tZJGZv6xqNdVQm3DH/3mwWiryS1QOQBVXyjAgKmzQp+Z?=
 =?iso-8859-2?Q?dAXYBj9cG0t3x6qIGxeBMn9CIzghcSvdsq4SdgZ0JLsruGqAA/+VH/uHmN?=
 =?iso-8859-2?Q?1e21S9khUixddyp1XRg5IJZrniWNJWplGZUcUUhzLX6Qe2IvebvnfQzDDV?=
 =?iso-8859-2?Q?HHhm0AlpPSZHQPlsOv5FbuNPVs6PgOhD/Ky8W7+ftVFMKX+90s3Mnfac7z?=
 =?iso-8859-2?Q?2l6HBNWHqfZ3+4h4NV7LQWCErJvxWBE65DJLdiYP7mxoWHC+fwCRZwKwhN?=
 =?iso-8859-2?Q?vf0BFBfQARq87D8vqmrJUB5AFp0dR5FdhcR+zH7pKvbR0TQGuEGe4nso/O?=
 =?iso-8859-2?Q?Dc2hy5ysl/Ln7iniNgYqmXrobIBb1HRBZrzG8FY9XdJoZC+EPW4rCIqpw0?=
 =?iso-8859-2?Q?wOuyVEQlFcyHOcxOWh9YdNyFzWTWWU/Cs2DdPOcVs1woP8mIQ8iY02HIje?=
 =?iso-8859-2?Q?0waik9oL9wNlRAFnkQR3uHqcrBQI207C8efbKbzTFQD+dJUfVsfk82KPG6?=
 =?iso-8859-2?Q?PkIyF1A9KmDkSu3qtplw82w+hRoL/R/YWZHjf6rZSdIs/oxSZMLRdigFrO?=
 =?iso-8859-2?Q?dcysUaRKD4KKGDeDvK43wVXqo3EstpfyGAUU7W4Qsdn6YziyyATSppzHM3?=
 =?iso-8859-2?Q?LMIh4vQF2ybfPmII2WKRhr9jl2YdC+T/Fwb1iZq6ukrYnZhEBEGr75zRRy?=
 =?iso-8859-2?Q?csuruRLvIoDipSu0+qXS9KfGPUA+EdUFRPrGsSA/0X+ATaIHDWgxXzbwNt?=
 =?iso-8859-2?Q?aKCfKO02SPzgXiJp/3aQcwGdfxzGzZGFMteI4o6+SRD//F0TT4CEstNhcF?=
 =?iso-8859-2?Q?EAMP5zg2D9KOt1Te7Cg3nJ?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7457.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-2?Q?0G+9WixyRHxahQxKYiS00xLiNxUOcioSw+w+75IVRSsmLPqN5vOoIOSKi6?=
 =?iso-8859-2?Q?vi40+wyjPex8P5wPszd/8xh8PuW7pB6ovMEalHp9isEEQfWAiTZs3Kvs4/?=
 =?iso-8859-2?Q?ThhuRCFRQIB9SRjfA6oaZHzh16VRFopAmGE+b6U3X2Eyk/HoATk4B3N5Gr?=
 =?iso-8859-2?Q?kLMQiCS7VfXqETcsC06rESClVCpqVhZt/rbnykKULmRDsNxkJJKEv9ogQZ?=
 =?iso-8859-2?Q?A75dFt8o18UzA80lQI9X1CWzPTC5Eqvz3xyRUcT4iQDLxfDDHEMaYvt1kY?=
 =?iso-8859-2?Q?AARwI30vbMX5vwnlrBXVRoZAl4CEiVWrkhtyAUIwP1T8/5SabeojC5/As2?=
 =?iso-8859-2?Q?8+yvxV4mw4xw5Z1jatjVQwlN/pmowcMpPgiW17F4pdoMGMJ+qz3ZPO793U?=
 =?iso-8859-2?Q?SwXZPlmzMyGIB7IQ+227YPtJ8Zu8ohdDfLtk/EYmfe71faEwCyaEI5xEm/?=
 =?iso-8859-2?Q?1HSQcG6vRQIxPZrLASemuFpI0f5vH/c8OgaDTC2yLMspxmwlUvLkVyJbfH?=
 =?iso-8859-2?Q?9vdSFb0yk1uCGYvCCd1N5Icok8ULR6xD/7TuC6W+2p6jUgulB8Op5kAV9t?=
 =?iso-8859-2?Q?lJ5fOfYQ5dlGyFMJLTI0J33j2QQX4zO3DfVyL+vtb0W1DaZ2fa1kZKiyUs?=
 =?iso-8859-2?Q?iL9jXh9KYSOOac5CR/BlZ3C2BvWydkwYJYJXVRFHDhXuUUfj5qeUENtfoY?=
 =?iso-8859-2?Q?Iy2UnXODbIEKXK4wvs2+EpQD+N1H1aPX+yQXkI9RetRW1GDuXM8/ZOLSCh?=
 =?iso-8859-2?Q?lh8sl3f+QFJY7si56ceCuGddhKtp3R6oGazIARFn4738SlEhAch2QJx7qK?=
 =?iso-8859-2?Q?WOn3drkAPKBC76i7S6hOR3p6hRTQ2aD2ed1CBnHqydOTgz+/V9sG2udaZ9?=
 =?iso-8859-2?Q?n9usDukpGR77+ZHfccgJhDbOE+kkqP+MvbOKR6CtoCMvOeLj/gqnQ5h5nP?=
 =?iso-8859-2?Q?edfTAUYJ7ho1ZoPZ6ugnOm8GU1VLGofAjf7abx91gR4/TW7OLJ7uLeBDVF?=
 =?iso-8859-2?Q?F6RZlcTQ+ZG/oTtlHhExIENIF9TKZ2f7+uFtCATkBdvMOQVjiWndBwP2hV?=
 =?iso-8859-2?Q?mXeJ48rkvg7qH1SYv5fxhdb836pUqKhkEA8Nlbtzik3n/A7SjWvWIrGSj6?=
 =?iso-8859-2?Q?9FeQ8uwqRNcd88dNri2ayzfgXLJF7s8psHGXswkwexq94J2U4uIQ2fziwF?=
 =?iso-8859-2?Q?VQYirRdFpK1J4M3t6XjhFr8oyi+8gHPGHKivcwPoli1y3Ojl81jq4/vAtx?=
 =?iso-8859-2?Q?O8gzqYrPvRVHIiO1RZfVvyrMtOjsFzM31QlLjHsYNWWISjuXfIIvJVLEUv?=
 =?iso-8859-2?Q?MlrZJueWLF1pE7nwnTvx0XEeQtt5OpWgBJ+1mihBfKgIZVnQEjLd8FsCNj?=
 =?iso-8859-2?Q?lTxHT8NpVdE77NT7IOLC4oc1xk9oYYOBVTLdF3sx+183UVcLjkUcyI3cJ7?=
 =?iso-8859-2?Q?yk6kjGahnTejALhXzxkEPdkcNAJmP91AzOV1JU7hhTk3AIZ3hpevdsCjjB?=
 =?iso-8859-2?Q?NVuyumZaexaSU2d2tVoZ0volw7Hw45jQ68wrH1Rrd5fZaFlk2uBdwwP2UA?=
 =?iso-8859-2?Q?rEFfPOTW3zndignyFaIXQbxlSYxsdyCm9fJGyJO0qgAhqOMQwIOe01ge48?=
 =?iso-8859-2?Q?MSGSVs/PZgNEUYh36j8yiEl0X9BEOOhA+N?=
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7457.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c6a59a10-bbc5-4b7c-f096-08dd1f6c1971
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Dec 2024 13:58:50.0019
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: J+spmMEgMixQqBkLMy0o+QzIqx7DvRee2l+Zl9MFsIskTqsd4mXto33JwfMfGp+T+ZdKIDuFm1yngnGYBXND2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4670
X-OriginatorOrg: intel.com

Hi Christian,

> -----Original Message-----
> From: Gopal, Saranya
> Sent: Tuesday, December 17, 2024 9:55 AM
> To: Christian A. Ehrhardt <lk@c--e.de>; Sasha Levin
> <sashal@kernel.org>
> Cc: linux-kernel@vger.kernel.org; Heikki Krogerus
> <heikki.krogerus@linux.intel.com>; Greg Kroah-Hartman
> <gregkh@linuxfoundation.org>; Prashant Malani
> <pmalani@chromium.org>; Jameson Thies <jthies@google.com>;
> Abhishek Pandit-Subedi <abhishekpandit@chromium.org>; Neil
> Armstrong <neil.armstrong@linaro.org>; Uwe Kleine-K=F6nig <u.kleine-
> koenig@pengutronix.de>; Samuel =C8avoj <samuel@cavoj.net>; linux-
> usb@vger.kernel.org; Kenneth Crudup <kenny@panix.com>
> Subject: RE: [PATCH 5/5] usb: typec: ucsi: Clear
> UCSI_CCI_RESET_COMPLETE before reset
>=20
> Hi Christian,
>=20
> > -----Original Message-----
> > From: Christian A. Ehrhardt <lk@c--e.de>
> > Sent: Tuesday, December 17, 2024 3:17 AM
> > To: Sasha Levin <sashal@kernel.org>
> > Cc: linux-kernel@vger.kernel.org; Heikki Krogerus
> > <heikki.krogerus@linux.intel.com>; Greg Kroah-Hartman
> > <gregkh@linuxfoundation.org>; Prashant Malani
> > <pmalani@chromium.org>; Jameson Thies <jthies@google.com>;
> > Abhishek Pandit-Subedi <abhishekpandit@chromium.org>; Neil
> > Armstrong <neil.armstrong@linaro.org>; Uwe Kleine-K=F6nig
> <u.kleine-
> > koenig@pengutronix.de>; Samuel =C8avoj <samuel@cavoj.net>;
> linux-
> > usb@vger.kernel.org; Kenneth Crudup <kenny@panix.com>; Gopal,
> > Saranya <saranya.gopal@intel.com>
> > Subject: Re: [PATCH 5/5] usb: typec: ucsi: Clear
> > UCSI_CCI_RESET_COMPLETE before reset
> >
> >
> > Hi,
> >
> > [ CC: Saranya Gopal <saranya.gopal@intel.com> ]
> >
> > On Sun, Dec 15, 2024 at 01:34:12PM -0500, Sasha Levin wrote:
> > > On Wed, Mar 20, 2024 at 08:39:26AM +0100, Christian A.
> Ehrhardt
> > wrote:
> > > > Check the UCSI_CCI_RESET_COMPLETE complete flag before
> > starting
> > > > another reset. Use a UCSI_SET_NOTIFICATION_ENABLE
> > command to clear
> > > > the flag if it is set.
> > >
> > > Hi Christian,
> > >
> > > It looks like kernelci is able to trigger the warning added by this
> > > commit:
> > >
> > > [   15.988528] WARNING: CPU: 0 PID: 8 at
> > drivers/usb/typec/ucsi/ucsi.c:1377 ucsi_reset_ppm+0x1af/0x1c0
> > [typec_ucsi]
> > > [ ... ]
> >
> > I think I can see what's going on.
> >
> > First of all: The warning is harmless and UCSI will still work as
> > expected (but there is an additional delay during init).
> >
> > The trigger for the warning is likely this commit (reviewed by me, so
> > ...):
> >
> > | commit fa48d7e81624efdf398b990a9049e9cd75a5aead
> > | Author: Saranya Gopal <saranya.gopal@intel.com>
> > | Date:   Fri Aug 30 14:13:42 2024 +0530
> > |
> > |     usb: typec: ucsi: Do not call ACPI _DSM method for UCSI read
> > |     operations
> >
> > The (compile tested) diff below should fix it and I can turn this
> > into a proper patch but I lost access to test hardware with UCSI,
> > thus this would need a "Tested-by:" from someone else before it
> can
> > be included. Maybe Saranya can do this?
>=20
> I can get access to a couple of systems using UCSI and get this tested
> tomorrow.

I realized that all the systems I currently have need the forced sync and h=
ence do not reproduce the reported issue.
I believe this patch needs to be tested on Chromebooks that support UCSI.
If so, it might take longer for me to get access to those systems consideri=
ng the holiday season.

Thanks,
Saranya
>=20
> Thanks,
> Saranya
> >
> >      Best regards   Christian
> >
> >
> > commit b44ba223cd840e6dbab6c7f69da6203c7a8ba570
> > Author: Christian A. Ehrhardt <lk@c--e.de>
> > Date:   Mon Dec 16 21:52:46 2024 +0100
> >
> >     acpi: typec: ucsi: Introduce a ->poll_cci method
> >
> >     For the ACPI backend of UCSI the UCSI "registers" are just
> >     a memory copy of the register values in an opregion. The ACPI
> >     implementation in the BIOS ensures that the opregion contents
> >     are synced to the embedded controller and it ensures that the
> >     registers (in particular CCI) are synced back to the opregion
> >     on notifications. While there is an ACPI call that syncs the
> >     actual registers to the opregion there is rarely a need to do
> >     this and on some ACPI implementations it actually breaks in
> >     various interesting ways.
> >
> >     The only reason to force a sync from the embedded controller
> >     is to poll CCI while notifications are disabled. Only the
> >     ucsi core knows if this is the case and guessing based on
> >     the current command is suboptimal.
> >
> >     Thus introduce a ->poll_cci() method that works like
> >     ->read_cci() with an additional forced sync and document that
> >     this should be used when polling with notifications disabled.
> >     For all other backends that presumably don't have this issue
> >     use the same implementation for both methods.
> >
> >     Fixes: fa48d7e81624 ("usb: typec: ucsi: Do not call ACPI _DSM
> > method for UCSI read operations")
> >     Signed-off-by: Christian A. Ehrhardt <lk@c--e.de>
> >
> > diff --git a/drivers/usb/typec/ucsi/ucsi.c
> > b/drivers/usb/typec/ucsi/ucsi.c
> > index fcf499cc9458..0fe1476f4c29 100644
> > --- a/drivers/usb/typec/ucsi/ucsi.c
> > +++ b/drivers/usb/typec/ucsi/ucsi.c
> > @@ -1346,7 +1346,7 @@ static int ucsi_reset_ppm(struct ucsi
> *ucsi)
> >
> >  	mutex_lock(&ucsi->ppm_lock);
> >
> > -	ret =3D ucsi->ops->read_cci(ucsi, &cci);
> > +	ret =3D ucsi->ops->poll_cci(ucsi, &cci);
> >  	if (ret < 0)
> >  		goto out;
> >
> > @@ -1364,7 +1364,7 @@ static int ucsi_reset_ppm(struct ucsi
> *ucsi)
> >
> >  		tmo =3D jiffies +
> > msecs_to_jiffies(UCSI_TIMEOUT_MS);
> >  		do {
> > -			ret =3D ucsi->ops->read_cci(ucsi, &cci);
> > +			ret =3D ucsi->ops->poll_cci(ucsi, &cci);
> >  			if (ret < 0)
> >  				goto out;
> >  			if (cci & UCSI_CCI_COMMAND_COMPLETE)
> > @@ -1393,7 +1393,7 @@ static int ucsi_reset_ppm(struct ucsi
> *ucsi)
> >  		/* Give the PPM time to process a reset before
> > reading CCI */
> >  		msleep(20);
> >
> > -		ret =3D ucsi->ops->read_cci(ucsi, &cci);
> > +		ret =3D ucsi->ops->poll_cci(ucsi, &cci);
> >  		if (ret)
> >  			goto out;
> >
> > @@ -1929,8 +1929,8 @@ struct ucsi *ucsi_create(struct device
> > *dev, const struct ucsi_operations *ops)
> >  	struct ucsi *ucsi;
> >
> >  	if (!ops ||
> > -	    !ops->read_version || !ops->read_cci || !ops-
> > >read_message_in ||
> > -	    !ops->sync_control || !ops->async_control)
> > +	    !ops->read_version || !ops->read_cci || !ops->poll_cci ||
> > +	    !ops->read_message_in || !ops->sync_control || !ops-
> > >async_control)
> >  		return ERR_PTR(-EINVAL);
> >
> >  	ucsi =3D kzalloc(sizeof(*ucsi), GFP_KERNEL);
> > diff --git a/drivers/usb/typec/ucsi/ucsi.h
> > b/drivers/usb/typec/ucsi/ucsi.h
> > index 5ff369c24a2f..e4c563da715f 100644
> > --- a/drivers/usb/typec/ucsi/ucsi.h
> > +++ b/drivers/usb/typec/ucsi/ucsi.h
> > @@ -61,6 +61,7 @@ struct dentry;
> >   * struct ucsi_operations - UCSI I/O operations
> >   * @read_version: Read implemented UCSI version
> >   * @read_cci: Read CCI register
> > + * @poll_cci: Read CCI register while polling with notifications
> > disabled
> >   * @read_message_in: Read message data from UCSI
> >   * @sync_control: Blocking control operation
> >   * @async_control: Non-blocking control operation
> > @@ -75,6 +76,7 @@ struct dentry;
> >  struct ucsi_operations {
> >  	int (*read_version)(struct ucsi *ucsi, u16 *version);
> >  	int (*read_cci)(struct ucsi *ucsi, u32 *cci);
> > +	int (*poll_cci)(struct ucsi *ucsi, u32 *cci);
> >  	int (*read_message_in)(struct ucsi *ucsi, void *val, size_t
> > val_len);
> >  	int (*sync_control)(struct ucsi *ucsi, u64 command);
> >  	int (*async_control)(struct ucsi *ucsi, u64 command);
> > diff --git a/drivers/usb/typec/ucsi/ucsi_acpi.c
> > b/drivers/usb/typec/ucsi/ucsi_acpi.c
> > index 5c5515551963..ac1ebb5d9527 100644
> > --- a/drivers/usb/typec/ucsi/ucsi_acpi.c
> > +++ b/drivers/usb/typec/ucsi/ucsi_acpi.c
> > @@ -59,19 +59,24 @@ static int ucsi_acpi_read_version(struct
> ucsi
> > *ucsi, u16 *version)
> >  static int ucsi_acpi_read_cci(struct ucsi *ucsi, u32 *cci)
> >  {
> >  	struct ucsi_acpi *ua =3D ucsi_get_drvdata(ucsi);
> > -	int ret;
> > -
> > -	if (UCSI_COMMAND(ua->cmd) =3D=3D UCSI_PPM_RESET) {
> > -		ret =3D ucsi_acpi_dsm(ua, UCSI_DSM_FUNC_READ);
> > -		if (ret)
> > -			return ret;
> > -	}
> >
> >  	memcpy(cci, ua->base + UCSI_CCI, sizeof(*cci));
> >
> >  	return 0;
> >  }
> >
> > +static int ucsi_acpi_poll_cci(struct ucsi *ucsi, u32 *cci)
> > +{
> > +	struct ucsi_acpi *ua =3D ucsi_get_drvdata(ucsi);
> > +	int ret;
> > +
> > +	ret =3D ucsi_acpi_dsm(ua, UCSI_DSM_FUNC_READ);
> > +	if (ret)
> > +		return ret;
> > +
> > +	return ucsi_acpi_read_cci(ucsi, cci);
> > +}
> > +
> >  static int ucsi_acpi_read_message_in(struct ucsi *ucsi, void *val,
> > size_t val_len)
> >  {
> >  	struct ucsi_acpi *ua =3D ucsi_get_drvdata(ucsi);
> > @@ -94,6 +99,7 @@ static int ucsi_acpi_async_control(struct ucsi
> > *ucsi, u64 command)
> >  static const struct ucsi_operations ucsi_acpi_ops =3D {
> >  	.read_version =3D ucsi_acpi_read_version,
> >  	.read_cci =3D ucsi_acpi_read_cci,
> > +	.poll_cci =3D ucsi_acpi_poll_cci,
> >  	.read_message_in =3D ucsi_acpi_read_message_in,
> >  	.sync_control =3D ucsi_sync_control_common,
> >  	.async_control =3D ucsi_acpi_async_control
> > @@ -142,6 +148,7 @@ static int ucsi_gram_sync_control(struct
> ucsi
> > *ucsi, u64 command)
> >  static const struct ucsi_operations ucsi_gram_ops =3D {
> >  	.read_version =3D ucsi_acpi_read_version,
> >  	.read_cci =3D ucsi_acpi_read_cci,
> > +	.poll_cci =3D ucsi_acpi_poll_cci,
> >  	.read_message_in =3D ucsi_gram_read_message_in,
> >  	.sync_control =3D ucsi_gram_sync_control,
> >  	.async_control =3D ucsi_acpi_async_control
> > diff --git a/drivers/usb/typec/ucsi/ucsi_ccg.c
> > b/drivers/usb/typec/ucsi/ucsi_ccg.c
> > index fcb8e61136cf..bb0dc2005c05 100644
> > --- a/drivers/usb/typec/ucsi/ucsi_ccg.c
> > +++ b/drivers/usb/typec/ucsi/ucsi_ccg.c
> > @@ -664,6 +664,7 @@ static int ucsi_ccg_sync_control(struct ucsi
> > *ucsi, u64 command)
> >  static const struct ucsi_operations ucsi_ccg_ops =3D {
> >  	.read_version =3D ucsi_ccg_read_version,
> >  	.read_cci =3D ucsi_ccg_read_cci,
> > +	.poll_cci =3D ucsi_ccg_read_cci,
> >  	.read_message_in =3D ucsi_ccg_read_message_in,
> >  	.sync_control =3D ucsi_ccg_sync_control,
> >  	.async_control =3D ucsi_ccg_async_control,
> > diff --git a/drivers/usb/typec/ucsi/ucsi_glink.c
> > b/drivers/usb/typec/ucsi/ucsi_glink.c
> > index 90948cd6d297..a78e53480875 100644
> > --- a/drivers/usb/typec/ucsi/ucsi_glink.c
> > +++ b/drivers/usb/typec/ucsi/ucsi_glink.c
> > @@ -201,6 +201,7 @@ static void
> > pmic_glink_ucsi_connector_status(struct ucsi_connector *con)
> >  static const struct ucsi_operations pmic_glink_ucsi_ops =3D {
> >  	.read_version =3D pmic_glink_ucsi_read_version,
> >  	.read_cci =3D pmic_glink_ucsi_read_cci,
> > +	.poll_cci =3D pmic_glink_ucsi_read_cci,
> >  	.read_message_in =3D pmic_glink_ucsi_read_message_in,
> >  	.sync_control =3D ucsi_sync_control_common,
> >  	.async_control =3D pmic_glink_ucsi_async_control,
> > diff --git a/drivers/usb/typec/ucsi/ucsi_stm32g0.c
> > b/drivers/usb/typec/ucsi/ucsi_stm32g0.c
> > index 6923fad31d79..57ef7d83a412 100644
> > --- a/drivers/usb/typec/ucsi/ucsi_stm32g0.c
> > +++ b/drivers/usb/typec/ucsi/ucsi_stm32g0.c
> > @@ -424,6 +424,7 @@ static irqreturn_t
> > ucsi_stm32g0_irq_handler(int irq, void *data)
> >  static const struct ucsi_operations ucsi_stm32g0_ops =3D {
> >  	.read_version =3D ucsi_stm32g0_read_version,
> >  	.read_cci =3D ucsi_stm32g0_read_cci,
> > +	.poll_cci =3D ucsi_stm32g0_read_cci,
> >  	.read_message_in =3D ucsi_stm32g0_read_message_in,
> >  	.sync_control =3D ucsi_sync_control_common,
> >  	.async_control =3D ucsi_stm32g0_async_control,
> > diff --git a/drivers/usb/typec/ucsi/ucsi_yoga_c630.c
> > b/drivers/usb/typec/ucsi/ucsi_yoga_c630.c
> > index f3a5e24ea84d..40e5da4fd2a4 100644
> > --- a/drivers/usb/typec/ucsi/ucsi_yoga_c630.c
> > +++ b/drivers/usb/typec/ucsi/ucsi_yoga_c630.c
> > @@ -74,6 +74,7 @@ static int
> yoga_c630_ucsi_async_control(struct
> > ucsi *ucsi, u64 command)
> >  const struct ucsi_operations yoga_c630_ucsi_ops =3D {
> >  	.read_version =3D yoga_c630_ucsi_read_version,
> >  	.read_cci =3D yoga_c630_ucsi_read_cci,
> > +	.poll_cci =3D yoga_c630_ucsi_read_cci,
> >  	.read_message_in =3D yoga_c630_ucsi_read_message_in,
> >  	.sync_control =3D ucsi_sync_control_common,
> >  	.async_control =3D yoga_c630_ucsi_async_control,

