Return-Path: <linux-usb+bounces-15591-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 49F3298A01C
	for <lists+linux-usb@lfdr.de>; Mon, 30 Sep 2024 13:09:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BAC38B244D3
	for <lists+linux-usb@lfdr.de>; Mon, 30 Sep 2024 11:09:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01A0818D627;
	Mon, 30 Sep 2024 11:09:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GNLdfHhy"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 094B314D6F9
	for <linux-usb@vger.kernel.org>; Mon, 30 Sep 2024 11:09:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727694554; cv=fail; b=ggJyN0j2UQa1lizIiGKxPR9ll8OZcCqw0EebUS8Kc/cZIHcM6cokV9AXNknTAjWaSrV+Ml5Ll0umJs0dcFsFTfObdxiG3OQQEIIb0GDNGuIEN5QykibLOrkhB3stVDeoX491NYTogCc6Sc10sl1SJRRp6WY9ezejgADv98m+qc8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727694554; c=relaxed/simple;
	bh=nIkAPvOO6ySMrIXwyjdReU4AC4KH4SAQCsR8OCpx9os=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=pYX4dNM6cPlMDL10OhZIIIb37DfYOslCJI7nGyrfdKwQnDtaBvGCcnfurpmdLVb1LyY2PBjGSf4mlOycEu4bvU0tkp/8mAjeUVJ8vQ0sYVBTcuL3kZ2do0o4OHhFw8DJe37/f5mCWS0UYwwyx04VAvWrRB+gOkwhj7XDFobs20k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GNLdfHhy; arc=fail smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727694552; x=1759230552;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=nIkAPvOO6ySMrIXwyjdReU4AC4KH4SAQCsR8OCpx9os=;
  b=GNLdfHhyl+iPPAeh9BQk9RFHrgU5AFqPM1gOl7/8z2Ezy6jkstBTOsL3
   2tO+HTlwY5uHfFE96vWq5lpyhipraeAsl/BOAfzj2XFpggnXRuG9ITX5z
   S2IAJYVa2bBeQZYMi8xH/YpCCUZ9cKSinulQyF6/fIN754CNuwZuLkZZf
   gnyqZob4K/31eULpiHHDMYN/25y/Lo3N3AgYKtFg5JvlPAs0doutWwG41
   BTbkP8OmyWtjbrmp6l8vRx2WPfNeHLlJoyLkHi0OnQRZAJhzrenWeVV9f
   hjL9dI1oWLgdFychnCWNgkRNtBXIYDAGVXugJxR/Cchw84gCMlxDfO/VX
   Q==;
X-CSE-ConnectionGUID: jyIzf88hTzaBujnOYoiuxQ==
X-CSE-MsgGUID: paPWr4bQTOqH7bva9wq27g==
X-IronPort-AV: E=McAfee;i="6700,10204,11210"; a="30475645"
X-IronPort-AV: E=Sophos;i="6.11,165,1725346800"; 
   d="scan'208";a="30475645"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2024 04:09:11 -0700
X-CSE-ConnectionGUID: 67DFzW28TpaRHtVPHaxCHA==
X-CSE-MsgGUID: 7ZB05aB2QNe3KPthq5C3Hw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,165,1725346800"; 
   d="scan'208";a="77777923"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 30 Sep 2024 04:09:11 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 30 Sep 2024 04:09:10 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 30 Sep 2024 04:09:10 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 30 Sep 2024 04:09:10 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.174)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 30 Sep 2024 04:09:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gxXgeUwcR8/kggl3e/1JlLWMiQpb7Fl5BgDgb0LY+8DPdb/rNZbmjWWl5nLtcuPsBzI8c/b2TX6Ek85p5WTvTRQvlERnKpc+Q0RzPzmGDcU6qox23UBFSlbq4Firt187m5Mc/pBzsJQf3u01yad+8gCgYodn+ANsr6Z0Dp34VV+IFl88b55CfOhDLOo9DjOknY7MTRf/Z4ECKZFqdjNpGLMbMWcMkUKe9VFipAtcCmLVW91DxHwIVkNNg49FAvstlg/O7drgzDyUhW7hMoU5fKT5vIxuVdQRiQ3hLu4v5ivmPklOv1x+VSFq8O+p78OFYvRjoBBRndbZwvTc6u+C7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yRkJ3t7GKQ3Wmu7cPdigEWbT08IZOwQYRoL75yZdaP0=;
 b=TusJpuhsM/NqbUTFfDDlXfDWyZfceuOFODCcu7r7glY1STR0zD2CovWrsnfKi2WrzPMettr/v4+Gzl1j89A+OdVkSD64fpozaOIapWoKGEZycRF3rRWj19xT+LzwauA9oxJXxc0BUBOE5UkbkW5nvzhk+8m9a0U6Z2BgLApHya7CF1LVXjbFDGg+7bCU9g8yhy5YWxhgxYyBhMMP1T/Hi7hP6hp6DWhSktIw/3CLYhP4iMBh4+T062VS+KNa5M3PDOcp6vvmLvtfVWNP8A6FQTtnb6cwtuBlruXkYI1Dj0zVDYxSEJHYU0IJcKl0bqhB62W4gCZcYEYkhWXsBeVAEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB7457.namprd11.prod.outlook.com (2603:10b6:8:140::18)
 by IA1PR11MB6324.namprd11.prod.outlook.com (2603:10b6:208:388::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.26; Mon, 30 Sep
 2024 11:09:06 +0000
Received: from DS0PR11MB7457.namprd11.prod.outlook.com
 ([fe80::6078:57ee:53ba:57a5]) by DS0PR11MB7457.namprd11.prod.outlook.com
 ([fe80::6078:57ee:53ba:57a5%5]) with mapi id 15.20.8005.026; Mon, 30 Sep 2024
 11:09:05 +0000
From: "Gopal, Saranya" <saranya.gopal@intel.com>
To: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
CC: "'Christian A. Ehrhardt'" <lk@c--e.de>, Heikki Krogerus
	<heikki.krogerus@linux.intel.com>, "linux-usb@vger.kernel.org"
	<linux-usb@vger.kernel.org>, "Regupathy, Rajaram"
	<rajaram.regupathy@intel.com>
Subject: RE: [PATCH] usb: typec: ucsi: Do not call ACPI _DSM method for UCSI
 read operations
Thread-Topic: [PATCH] usb: typec: ucsi: Do not call ACPI _DSM method for UCSI
 read operations
Thread-Index: AQHa+rYWiHrR/od/8E2qmfl3hPaXrrI/fD+AgADg7YCAClBVEIAEkC6AgACaQYCAARnOAIAAr9oAgB6W84CAABUAgIAACshQ
Date: Mon, 30 Sep 2024 11:09:05 +0000
Message-ID: <DS0PR11MB74575FA29F2F9D7B0A52F39BE3762@DS0PR11MB7457.namprd11.prod.outlook.com>
References: <20240830084342.460109-1-saranya.gopal@intel.com>
 <ZtGGcRpavSITFai7@kuha.fi.intel.com> <ZtJDH4UCJMQbOWBY@cae.in-ulm.de>
 <DS0PR11MB74574A426FAA3322F4FFC017E39E2@DS0PR11MB7457.namprd11.prod.outlook.com>
 <Zt6979hVhtzGBeq6@kuha.fi.intel.com> <Zt8/VYZomXPGoF0/@cae.in-ulm.de>
 <ZuArunRcvrVbKPKC@kuha.fi.intel.com> <ZuC/Po0iPHYDl7Y9@cae.in-ulm.de>
 <DS0PR11MB7457767F548B993C11B69E36E3762@DS0PR11MB7457.namprd11.prod.outlook.com>
 <2024093022-scoured-groggy-81fd@gregkh>
In-Reply-To: <2024093022-scoured-groggy-81fd@gregkh>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB7457:EE_|IA1PR11MB6324:EE_
x-ms-office365-filtering-correlation-id: 68dc893b-253b-471f-b60a-08dce1404c7c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?oc6YYK/AhJyn1UwemownKlx2bnczkc44KO/hCmFl/Y2eBdfoCXIYbJ8yffpt?=
 =?us-ascii?Q?8itNA9+1DuoKJ8UcrZZyUjxzt1fSuGcQW5r+jAZIPgXNxj/I/eJ4mYDx5h0s?=
 =?us-ascii?Q?IUoAGUxw7JgkEP5vE0KA61sqRe1qybus5AxekJF9wo8lIJPAmvtFRpvFnOc9?=
 =?us-ascii?Q?wU5Qa2GkwVygh4nEVe7B6x6FasoOS1u5F33Zbtd0y/vmtv/Uv2pCVUYBF5NT?=
 =?us-ascii?Q?cRgWgPsxI6pidL8+LTj5CVIf6pGeGUWg3j1nu4gQclXBQMCCU1L/+87hi9ej?=
 =?us-ascii?Q?EubfNZMwSXBmH+LvGuX1QKC1lFVgiRTOhWa4yK1hdEg97ObTylTBefAeSMjV?=
 =?us-ascii?Q?sBVXSE02yszvlvZqd1aauQ2XPnZBhG7t5gPJHQ0rSGxRtHywYWkLz2MFHtd0?=
 =?us-ascii?Q?t05q8YzGv/dgWClHYP6jwums1a7wcVT3lC90i5HvXkozVcOwpmHl+u6e8Xx4?=
 =?us-ascii?Q?oGR40oMFbnrj77OAl5/+KpEaLCX/h8mpQkwpyXMWQpQPWyrQsTPnZO90YCep?=
 =?us-ascii?Q?SQfKbsaulVQ8PpPxlsjxc1KdODHdrT9Ms20vBQbSK/8d/cF6cnkWzj6gLhvl?=
 =?us-ascii?Q?n4uOhhpSaqLGjxt6jvaZ4uyTMg/QmTLmlXvTnXKzOBFTjiVTY6T3YNCcs2SV?=
 =?us-ascii?Q?KfU9ecELQTmlYZcusnQF0eX6ry7js11WTbkXItJ/3S1uq+ekPu+hG3yMJ4GH?=
 =?us-ascii?Q?COeDFT25hxl9cv5+ORmTm1o0IF1ZZsIDp1k65r6mLNrckoqtI+zsc6xnK+wr?=
 =?us-ascii?Q?ej/33W14YA0LCB9EyO4Pcf4MFbPaSKy098iRoum3t+risvEOuaJOc0MmpiJf?=
 =?us-ascii?Q?d1vQWxehU4EFrVhQezicrHt+pcu3KWvYCYffeQVRDTe/cNzK6F0p1fNNBQ9W?=
 =?us-ascii?Q?IO0EI7i+dTDwDBSEGdQbVFQmntDF86Ojikk0EPhB3bkX0i8hCcTl4UaUnQW5?=
 =?us-ascii?Q?f86pxyK4rv8dxtZNS1FXU+ijoWwjHRWpIC0+R+xjfGdESddI/wD+Ho+t/0su?=
 =?us-ascii?Q?A25TRU19OqbpJkzXhnNeIjvmkmJi3SCPkOUj3iWTRIbM8SdCgNOnmSTDoeNn?=
 =?us-ascii?Q?3/nO8t99601NSQDlr8Gr4wr0uL04LjAKq5s+zdzqznw0injWQ79NjXLPhf9J?=
 =?us-ascii?Q?C/kqVOPpGAz1CNjeH4yv6JqTR0r6fiZFQSYtXi57wRuvK/RioMeHPselDK2I?=
 =?us-ascii?Q?10UbN0umXZo1gy20q/YKq13/COkV3fwcpVGgJepWxdg7ur+iRZ+5mETao457?=
 =?us-ascii?Q?xFVeRiErYU3RaAnRsjlxupJ3awj3xl23ymD+6y4YkX7ndM4m5lccIzg/WH00?=
 =?us-ascii?Q?/omE1iKZaRRnAO59G7pXXRwwRiBbhwuyBJbpeBHHgzQVf8JceiWygctHhM03?=
 =?us-ascii?Q?5ijlPfw=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7457.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?PaorUfQCSnlsSL5S4aCgtCIkxF5lDxn3KWV+52GeArCeGLbJMF6L2KpeSMVA?=
 =?us-ascii?Q?e9NzT1ZiHqoZqoNqfjMgaFJv4JgOVaI1FI5N+DV/K/g5ssJOIS8MZxoOOiFJ?=
 =?us-ascii?Q?NrVzbI6cA/2Zt2+fSK540MQhZ0RQ/nUTxZLjKgSrlEhzzKaSTpY4sJrXkEpb?=
 =?us-ascii?Q?yCxw5grEPwtcrSXCxAcrodthx/S34M6BJ/KRB34w/F1zRy9l9sYH+ioHph7K?=
 =?us-ascii?Q?BYQpLpXeV6qgCUOsZY0UypKYV9EVp5WkdrbW9bdkACCWoprmZ+pnFlXqx7cx?=
 =?us-ascii?Q?pqao5YJSDia2TFlPJ+4aeM9eKrMIDIJJbf/1ZDPZpN1Vtq46FAPFRM1sT1Of?=
 =?us-ascii?Q?gtzsnsHl9r73XdvyXR16k8j0EPZt5PGiGJwVUVGrqhVcFIxRYWNtDgeXQNSu?=
 =?us-ascii?Q?P9FltzcQBITIDr9PMu6rXFl36aKkN8wXF46XH9Orihc0AImf7g374LlAbChJ?=
 =?us-ascii?Q?ulhUgVsy+Era+tk4vaPQRw7P9lPao8RJiDjpbSH6CWtggZJXkvCmPq/Tombs?=
 =?us-ascii?Q?hiZNwxP4EKh276DQEmXDJkr5vt2CUCsPHJauXBMGYTMSZB0hnFxWg/v8uHVL?=
 =?us-ascii?Q?bXNIij6bk1u47jzJVlM4dKOEt6tq+EMV9Ebo3c6VjSWoT2OP3UN+lkGY+Xf0?=
 =?us-ascii?Q?tI1RsyuhM4R0q2cGrA2T89WRH565jznzThxrPcnkmERQF3viGTSY4kzRvvR3?=
 =?us-ascii?Q?HJJWvlscGMu/Y/0sEiKdZV42nOQKFq6iMcYP9VgML6D/i0giSsHNRvgldYM2?=
 =?us-ascii?Q?MvOX2WEWRN6M/jPHDO6KPHU3B/UKoK4GovZcKOrhhGp9M+YGtEnYRGMMw5yB?=
 =?us-ascii?Q?bO7x/BN/nS7XkffFjvOBBB3IDr1v/tOuy9pz4PXj4mHwsAsUxAOFUy5kYh6n?=
 =?us-ascii?Q?BKn5EUHIvzVTCY6SAI6oyWuq597xuE0QDnVOgIfra57pm6/GyKKdtMRbPAxN?=
 =?us-ascii?Q?SPT372mDE6fpuu2Eqtup2U+wIHP/R/XGXcFzq6mMq8ownRRL3f2ySbss57gp?=
 =?us-ascii?Q?Aos+J84SxxswOyti9R53SK9aRong2Kb0b6Ajg7Do482F2sxY7rnSaZuMaBNW?=
 =?us-ascii?Q?yx/C1MtwE5CAcfEcMGPy8rSV9WaUVLC35fufeJpCo2SaU4MgrYhjgexlvFt9?=
 =?us-ascii?Q?W6e0yQ6H1TKovNL2qH2E1lsLTUkP/ukYX95sHSpc1AIfTMqOpwNVYamhXCNr?=
 =?us-ascii?Q?c2GnlMP//4n2JcI53oeK7s47SOHVqPG7A5jWT4rKXNsRIgRV/mR5rh8Y3xzu?=
 =?us-ascii?Q?pRX2zKnVyWGYdeIsvlnu7qpdv2BtN48x7Z2lP2Qb92pZt7gVOe2cP3N+ks0G?=
 =?us-ascii?Q?Y5+F6hltIxW5oKedTWB1g4pSbsO8FjN/LD7XRydOQS37WrObOyr7IwWq9Bl+?=
 =?us-ascii?Q?w+2fRcIrY331PbQVI+FgG7mt/sTg2ero/7FbNk0VySFq3RRnbu52iEYJwbzz?=
 =?us-ascii?Q?Npk93N2OeAwOxayugLmPvJNRtq1tO9mJUZKdMVl6m+mYZ5bl6B8iAl+XUXwe?=
 =?us-ascii?Q?cIqmgymOsVD6EWpcdiC/RZoxJZWWvP2UyYuawTTv/EIP5aJohadhM2jaTsns?=
 =?us-ascii?Q?UrzhYDHhmQarS4h/XPsXhR30SeG/2+XeVh8SLBRr?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 68dc893b-253b-471f-b60a-08dce1404c7c
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Sep 2024 11:09:05.6883
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: es0EV0cveMsCCvNQWyLMIv2XsFp1XGonN8RgDqcxnZSuZSq8rmcAJ3f/0VyhA1xfNvb26CTZdknahaESFqE6OA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6324
X-OriginatorOrg: intel.com

Hi Greg,

> -----Original Message-----
> From: gregkh@linuxfoundation.org <gregkh@linuxfoundation.org>
> Sent: Monday, September 30, 2024 3:44 PM
> To: Gopal, Saranya <saranya.gopal@intel.com>
> Cc: 'Christian A. Ehrhardt' <lk@c--e.de>; Heikki Krogerus
> <heikki.krogerus@linux.intel.com>; linux-usb@vger.kernel.org;
> Regupathy, Rajaram <rajaram.regupathy@intel.com>
> Subject: Re: [PATCH] usb: typec: ucsi: Do not call ACPI _DSM method
> for UCSI read operations
>=20
> On Mon, Sep 30, 2024 at 09:41:51AM +0000, Gopal, Saranya wrote:
> > Hi Greg,
> > > -----Original Message-----
> > > From: Christian A. Ehrhardt <lk@c--e.de>
> > > Sent: Wednesday, September 11, 2024 3:21 AM
> > > To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> > > Cc: Gopal, Saranya <saranya.gopal@intel.com>; linux-
> > > usb@vger.kernel.org; gregkh@linuxfoundation.org; Regupathy,
> > > Rajaram <rajaram.regupathy@intel.com>
> > > Subject: Re: [PATCH] usb: typec: ucsi: Do not call ACPI _DSM
> method
> > > for UCSI read operations
> > >
> > >
> > > Hi Heikki,
> > >
> > > On Tue, Sep 10, 2024 at 02:21:30PM +0300, Heikki Krogerus
> wrote:
> > > > On Mon, Sep 09, 2024 at 08:32:53PM +0200, Christian A.
> Ehrhardt
> > > wrote:
> > > > >
> > > > > Hi Heikki,
> > > > >
> > > > > On Mon, Sep 09, 2024 at 12:20:47PM +0300, Heikki Krogerus
> > > wrote:
> > > > > > Hi Saranya, Christian,
> > > > > >
> > > > > > On Fri, Sep 06, 2024 at 11:47:42AM +0000, Gopal, Saranya
> > > wrote:
> > > > > > > Hi Heikki, Christian,
> > > > > > >
> > > > > > > > -----Original Message-----
> > > > > > > > From: Christian A. Ehrhardt <lk@c--e.de>
> > > > > > > > Sent: Saturday, August 31, 2024 3:40 AM
> > > > > > > > To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> > > > > > > > Cc: Gopal, Saranya <saranya.gopal@intel.com>; linux-
> > > > > > > > usb@vger.kernel.org; gregkh@linuxfoundation.org;
> > > Regupathy,
> > > > > > > > Rajaram <rajaram.regupathy@intel.com>
> > > > > > > > Subject: Re: [PATCH] usb: typec: ucsi: Do not call ACPI
> _DSM
> > > method
> > > > > > > > for UCSI read operations
> > > > > > > >
> > > > > > > >
> > > > > > > > Hi Heikki, Hi Saranya,
> > > > > > > >
> > > > > > > > On Fri, Aug 30, 2024 at 11:44:33AM +0300, Heikki
> Krogerus
> > > wrote:
> > > > > > > > > On Fri, Aug 30, 2024 at 02:13:42PM +0530, Saranya
> Gopal
> > > wrote:
> > > > > > > > > > ACPI _DSM methods are needed only for UCSI write
> > > operations
> > > > > > > > and for reading
> > > > > > > > > > CCI during RESET_PPM operation. So, remove _DSM
> calls
> > > from
> > > > > > > > other places.
> > > > > > > > > > While there, remove the Zenbook quirk also since the
> > > default
> > > > > > > > behavior
> > > > > > > > > > now aligns with the Zenbook quirk. With this change,
> > > > > > > > GET_CONNECTOR_STATUS
> > > > > > > > > > returns at least 6 seconds faster than before in
> > > Arrowlake-S
> > > > > > > > platforms.
> > > > > > > > > >
> > > > > > > > > > Reviewed-by: Heikki Krogerus
> > > <heikki.krogerus@linux.intel.com>
> > > > > > > > > > Signed-off-by: Saranya Gopal
> > > <saranya.gopal@intel.com>
> > > > > > > > >
> > > > > > > > > Maybe this should be marked as a fix. I think this
> covers:
> > > > > > > > > https://lore.kernel.org/linux-
> > > usb/20240829100109.562429-2-
> > > > > > > > lk@c--e.de/
> > > > > > > > >
> > > > > > >
> > > > > > > Heikki,
> > > > > > > I see that Christian's other patch is marked as a fix already
> > > (https://lore.kernel.org/linux-usb/20240906065853.637205-1-
> lk@c--
> > > e.de/T/#u).
> > > > > >
> > > > > > The other part still needs a fix.
> > > > >
> > > > > Well technically not. I've established with the reporter of
> > > > > 	https://bugzilla.kernel.org/show_bug.cgi?id=3D219108
> > > > > that the immediate regression (keyboard on ASUS laptop not
> > > working) is
> > > > > fixed with the ucsi.c patch (that got your Reviewed-By today)
> > > alone.
> > > > >
> > > > > UCSI on the ASUS laptop is still broken but it always was,
> AFAICT.
> > > > > Thus I'd like to push the above mentioned patch as the fix for
> > > > > the regression.
> > > > >
> > > > > The reporter was very helpful and responsive in testing and
> > > > > I intend to look into the reason why UCSI does not work after
> > > > > that with the reporter's help.
> > > > >
> > > > > > On Thu, 5 Sept 2024 at 20:00, Christian A. Ehrhardt <lk@c--
> > > e.de> wrote:
> > > > > >
> > > > > > >
> > > > > > > Hi again,
> > > > > > >
> > > > > > > attached is version 4 of the patch. This will not fix the err=
or
> > > > > > > messages we talked about (I have to think about this some
> > > more).
> > > > > > >
> > > > > > > It should fix your keyboard issues, though.
> > > > > > >
> > > > > > > Heikki had another request to change the patch and it
> would
> > > be
> > > > > > > cool if you could test this version to make sure that it real=
ly
> > > > > > > fixes your immediate problem.
> > > > > > >
> > > > > > > Best regards,
> > > > > > > Christian
> > > > > > >
> > > > >
> > > > > > [    0.019168] [Firmware Bug]: CPU8: Topology domain 1
> shift 7
> > > !=3D 6
> > > > > > [    0.019168] [Firmware Bug]: CPU8: Topology domain 2
> shift 7
> > > !=3D 6
> > > > > > [    0.019168] [Firmware Bug]: CPU8: Topology domain 3
> shift 7
> > > !=3D 6
> > > > > > [    0.019168] [Firmware Bug]: CPU8: Topology domain 4
> shift 7
> > > !=3D 6
> > > > > > [    0.019168] [Firmware Bug]: CPU8: Topology domain 5
> shift 7
> > > !=3D 6
> > > > > > [    0.019168] [Firmware Bug]: CPU8: Topology domain 6
> shift 7
> > > !=3D 6
> > > > > > [    0.019168] [Firmware Bug]: CPU9: Topology domain 1
> shift 7
> > > !=3D 6
> > > > > > [    0.019168] [Firmware Bug]: CPU9: Topology domain 2
> shift 7
> > > !=3D 6
> > > > > > [    0.019168] [Firmware Bug]: CPU9: Topology domain 3
> shift 7
> > > !=3D 6
> > > > > > [    0.019168] [Firmware Bug]: CPU9: Topology domain 4
> shift 7
> > > !=3D 6
> > > > > > [    0.019168] [Firmware Bug]: CPU9: Topology domain 5
> shift 7
> > > !=3D 6
> > > > > > [    0.019168] [Firmware Bug]: CPU9: Topology domain 6
> shift 7
> > > !=3D 6
> > > > > > [    0.019168] [Firmware Bug]: CPU10: Topology domain 1
> shift 7
> > > !=3D 6
> > > > > > [    0.019168] [Firmware Bug]: CPU10: Topology domain 2
> shift 7
> > > !=3D 6
> > > > > > [    0.019168] [Firmware Bug]: CPU10: Topology domain 3
> shift 7
> > > !=3D 6
> > > > > > [    0.019168] [Firmware Bug]: CPU10: Topology domain 4
> shift 7
> > > !=3D 6
> > > > > > [    0.019168] [Firmware Bug]: CPU10: Topology domain 5
> shift 7
> > > !=3D 6
> > > > > > [    0.019168] [Firmware Bug]: CPU10: Topology domain 6
> shift 7
> > > !=3D 6
> > > > > > [    0.019168] [Firmware Bug]: CPU11: Topology domain 1
> shift 7
> > > !=3D 6
> > > > > > [    0.019168] [Firmware Bug]: CPU11: Topology domain 2
> shift 7
> > > !=3D 6
> > > > > > [    0.019168] [Firmware Bug]: CPU11: Topology domain 3
> shift 7
> > > !=3D 6
> > > > > > [    0.019168] [Firmware Bug]: CPU11: Topology domain 4
> shift 7
> > > !=3D 6
> > > > > > [    0.019168] [Firmware Bug]: CPU11: Topology domain 5
> shift 7
> > > !=3D 6
> > > > > > [    0.019168] [Firmware Bug]: CPU11: Topology domain 6
> shift 7
> > > !=3D 6
> > > > > > [    0.019168] [Firmware Bug]: CPU12: Topology domain 1
> shift 7
> > > !=3D 6
> > > > > > [    0.019168] [Firmware Bug]: CPU12: Topology domain 2
> shift 7
> > > !=3D 6
> > > > > > [    0.019168] [Firmware Bug]: CPU12: Topology domain 3
> shift 7
> > > !=3D 6
> > > > > > [    0.019168] [Firmware Bug]: CPU12: Topology domain 4
> shift 7
> > > !=3D 6
> > > > >
> > > > >
> > > > > >
> > > > > > > So, can this patch go in as it is?
> > > > > > > Please let me know if I need to resubmit with any
> changes.
> > > > > >
> > > > > > If you prefer that we go with Christian's patch to fix the
> issue
> > > > > > - which is fine by me - you need to rebase this on top of his
> > > patch in
> > > > > > any case. So you will need to resend this either way.
> > > > > >
> > > > > > Christian would you mind resending that second patch after
> all
> > > where
> > > > > > you take the Zenbook quirk into use on that ASUS system?
> > > > >
> > > > > See above. The immediate regression is fixed with the already
> > > > > reviewed patch alone. The remaining issue with UCSI on the
> ASUS
> > > > > laptop not working can be fixed separately.
> > > > >
> > > > > I'd rather base a fix for UCSI on the ASUS laptop onto
> Saranya's
> > > > > patch because I think that patch is the correct thing to do.
> > > > >
> > > > > Unfortunately, testing by the original reporter was
> inconclusive
> > > > > wrt. this. I have one report of a test run with the (classical)
> > > > > ASUS quirk (and the other patch) where UCSI on the ASUS
> laptop
> > > > > did work. Patch version v1 was the result of this.
> > > > >
> > > > > With Saranya's patch and my patch to ucsi.c the regression
> was
> > > gone
> > > > > but UCSI did _not_ work.
> > > > >
> > > > > As this does not make sense because Saranya's patch should
> be
> > > > > equivalent to the ASUS zenbook quirk. Thus this needs more
> > > > > investigation and dropping the zenbook quirk patch looks like
> the
> > > > > correct thing to do.
> > > > >
> > > > > > Let's make that as the actual fix for the issue. Maybe it's
> more
> > > clear
> > > > > > that way.
> > > > >
> > > > > Please let me know if you disagree and I can resend the ASUS
> > > quirk
> > > > > patch.
> > > >
> > > > No, that's not necessary. So we go ahead with this patch from
> > > Saranya
> > > > as is - we don't caim it fixes anything. Then you guys continue
> > > > debugging that UCSI not working on the ASUS laptop issue. If I
> got
> > > > this correct then:
> > >
> > > Exactly. And
> > > https://lore.kernel.org/all/20240906065853.637205-1-lk@c--
> e.de/
> > > proceeds but is independent.
> > >
> > > > Reviewed-by: Heikki Krogerus
> <heikki.krogerus@linux.intel.com>
> > > >
> > > > If there was nothing else, then my appologies for all the noise.
> > >
> > > No need to. The state of things was confusing and this type of
> > > "noise" is your job as a maintainer :-)
> > >
> > > Thanks for the review.
> >
> > Gentle ping to consider taking this patch.
>=20
> It has been mere hours since the merge window closed and I could
> even
> consider applying this change.  Please relax and understand the
> ecosystem in which you are working in (also remember the weeks of
> conferences most of us have been at right now.)
>=20
Sorry for my previous mail. I realize that the time I sent it wasn't correc=
t.

> To help make this work better, please take the time to review other
> pending patches for the subsystem, which will ensure that your
> changes
> get moved to the top as others get reviewed.  I'll wait for you to do
> that before getting to this one...

Sure, let me take the time to review the other pending patches.

Thanks,
Saranya
>=20
> thanks,
>=20
> greg k-h

