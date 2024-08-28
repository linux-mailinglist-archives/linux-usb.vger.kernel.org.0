Return-Path: <linux-usb+bounces-14257-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AC8E196367C
	for <lists+linux-usb@lfdr.de>; Thu, 29 Aug 2024 01:54:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6520A284345
	for <lists+linux-usb@lfdr.de>; Wed, 28 Aug 2024 23:54:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9F5C16D4CA;
	Wed, 28 Aug 2024 23:54:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DaQYRvQB"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DD9F165EE4
	for <linux-usb@vger.kernel.org>; Wed, 28 Aug 2024 23:54:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724889285; cv=fail; b=fShXNJHAUTjul74X5BMNubEnqlmJHFAqrL++8+VbQkp4QUFJydD4a6aV0bleghhA0W6UDL3AmYp91IqF5G+wAGbD5JoEs+SN6fIZJx+9i8nnr2/iISqTz1beC9HqDmkXUsi98zRTHdBxj+7a6pegVPsJ+wsmy5dghqCQgXOolHA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724889285; c=relaxed/simple;
	bh=JqEL2FJOo5TUpmN3SxnPjOV+v3Rdt8ZJiooQyEPvO/c=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=t65kNAOxHc3BN8fhaE5mD6rS7YaSTo/AZms81rnZDI+W8trPspgp70IIxMe2TXCjOHXm0TXeyWo822B7aBiy8WKpMhq4i5dr4kRp9f/YIKAMkKyMntv0gQp+dsT8PicucCQI9lK8SMdzn8e+mXu2Fegw8aLLhFG57A3KLXpy+e0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DaQYRvQB; arc=fail smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724889283; x=1756425283;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=JqEL2FJOo5TUpmN3SxnPjOV+v3Rdt8ZJiooQyEPvO/c=;
  b=DaQYRvQBSX+ZNEPQdbSKCPUlhnMhHF6xiVZw0cxGuZB8JshWuwY53U7Y
   Py9UszpiDrv0q9kMJyhRo5Vh1UXWFMaH0YXkqoR7n6TP7zWy1hcMnCEzX
   IdXVDPeO6ry6GKTDSrVhOlV/rvlu2VmFTPygrLqoxIuEHWbNT7AGzjDXj
   86uiuqwVHNnWCXToer9lYwTR2eWUkiN9BkQ4Argd9BmHlB6cqB//5oCs6
   tVlidFh9+aBr7BKRkp2TQBfFkIkn9AJG9fY9cYKje+og5AoAXw2kGTcg5
   Ooiz3xTDEo9jtaHxtPMQp3ax9BiufcfeEvCyGfjt+/qkoZXhOlStfSry7
   g==;
X-CSE-ConnectionGUID: waoOniz/QOKNUXzgVOXlNw==
X-CSE-MsgGUID: cAWTqAUMT42MrxTR9h/P8A==
X-IronPort-AV: E=McAfee;i="6700,10204,11178"; a="27329227"
X-IronPort-AV: E=Sophos;i="6.10,184,1719903600"; 
   d="scan'208";a="27329227"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2024 16:54:42 -0700
X-CSE-ConnectionGUID: ZZcMCYMGSqOj1/6aFvMhjQ==
X-CSE-MsgGUID: ZG1PaAGgRDuY1YJ3MWQ1+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,184,1719903600"; 
   d="scan'208";a="68060329"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 28 Aug 2024 16:54:43 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 28 Aug 2024 16:54:42 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 28 Aug 2024 16:54:41 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 28 Aug 2024 16:54:41 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 28 Aug 2024 16:54:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wwfJizG7fpMLPFxMmBktm3bgRlEqbzWZot/9Y+mVNQpXnaJO1L4yNE9HTVTH2vfhehixJdrZ8Db8KvtI5oRtrs3ptpoFPwZAAB7o3R1Nlir1EbGm7dnQfIysJt02i+4d34QrKIYwQByv3OXf9tq/Vc24TISyPTHnUVKzk6IQCxxqYh7dUU6lENUxlMO0L6VhXWM9Jb30ZoAVB6mBkGREk0v8d6ryDJRGQzMiAQlBZX+PpB9ikwOjmsuXGxIAkmoFznN/wlsUhtxXMalrNjOKryr+9pVeQBSh/n00rs6NHMxfr6Zr73Cew6OGKp0TcI9EiC7qgn3RKB+QrcwNSKOEng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ky1/9FAqT7dQcffzxGfB0g0SzSbI+PAaEYJCuGBFAl4=;
 b=j2hdf2FfJWJmG0MS/0JtY9/z+ligclP0aEeUlEwHA/HayuvMT4JvYd04xMPi+0HVQjOlxs5Sirz2a0Rs2YHhHk/0xgb5dPauHJe9TeVEmoneAlPtSovQScXntvjCxiS5YzVgXNRlewhuwC2pBjyZv5XMVLrj1lKrBBnllRyiMCIbcRaW8lZDSbDrGLxCjdvf9C/x0LHoF8PyJoyyJQ7Pzq2GANYUixB9WrqVTWMbSKhzzrc63FSbkTyKkkGyPFMlYDJZfUdD6WB9GdpSN+W1rgq7jNReFs3duiZ/aBpAMJGRfWP9wuleklfrp3NUromtYCU8JoO0xL3QYy+CbhNz0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ0PR11MB5770.namprd11.prod.outlook.com (2603:10b6:a03:421::6)
 by CY5PR11MB6344.namprd11.prod.outlook.com (2603:10b6:930:3b::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.23; Wed, 28 Aug
 2024 23:54:32 +0000
Received: from SJ0PR11MB5770.namprd11.prod.outlook.com
 ([fe80::6380:de9d:7f00:e9ea]) by SJ0PR11MB5770.namprd11.prod.outlook.com
 ([fe80::6380:de9d:7f00:e9ea%7]) with mapi id 15.20.7897.021; Wed, 28 Aug 2024
 23:54:32 +0000
From: "Pilla, Siva sai kumar" <siva.sai.kumar.pilla@intel.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, Abhishek Pandit-Subedi
	<abhishekpandit@chromium.org>
CC: Jameson Thies <jthies@google.com>, Benson Leung <bleung@chromium.org>,
	Bartosz Szpila <bszpila@google.com>, "linux-usb@vger.kernel.org"
	<linux-usb@vger.kernel.org>
Subject: RE: [RFC PATCH 3/3] usb: typec: ucsi: Helpers for new
 GET_CONNECTOR_STATUS fields
Thread-Topic: [RFC PATCH 3/3] usb: typec: ucsi: Helpers for new
 GET_CONNECTOR_STATUS fields
Thread-Index: AQHa+WWIWzIdZb3F5Ey3lil62K/VHLI9UuLQ
Date: Wed, 28 Aug 2024 23:54:32 +0000
Message-ID: <SJ0PR11MB5770FF121048EC303BCE37BA8F952@SJ0PR11MB5770.namprd11.prod.outlook.com>
References: <20240828161502.2774996-1-heikki.krogerus@linux.intel.com>
 <20240828161502.2774996-4-heikki.krogerus@linux.intel.com>
In-Reply-To: <20240828161502.2774996-4-heikki.krogerus@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR11MB5770:EE_|CY5PR11MB6344:EE_
x-ms-office365-filtering-correlation-id: 3407542a-d249-401d-7221-08dcc7bcc325
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?FaMgVuE68iUMFJdJWaDBMDfbCxNw7zOohZSoVIi7I9C4MRSrWHF8lTGOUKeq?=
 =?us-ascii?Q?6KywC5VOMJBLFKRDBaVtdnbIGX0ntMwb3F2RIOo4o+EKAfDBUBIKXVfDj1Qk?=
 =?us-ascii?Q?xvJjl+vY5X79DAqz+0+gK1mNsg4zcmd4QXINTlBlOTepvi5Xbnv6WXMLHPQq?=
 =?us-ascii?Q?23A6h41b0uhI26Yj1d53KvGd0ba70ccnojfZsPcs38o+phTAI5tykzYUKku5?=
 =?us-ascii?Q?kREvKaT+g1xuiS/c0sjmQ3xHf6cZ1laTpkNtNooLflljLdBRooQBFQaSwNg/?=
 =?us-ascii?Q?Hkwx/iV1IZ1QuHkdJePnBTJ3tzzMG+cp+qvxyB5vCpCIYrwp1obMDGAmHwUr?=
 =?us-ascii?Q?dyJpNHLf6W9GL6G8mOYwui3rGlxIFjp28pUNDvBP+RXB+QhR/1KjHzubfZhg?=
 =?us-ascii?Q?JshEsakZOWIQSu+KFm/hGa1tjWhZU8/SCBTJvK8OKpYPAveapquT2hpTnhLi?=
 =?us-ascii?Q?pdj9pEL7WhNdoQFPpD8Q+afTOfbGKSJzbvyrD+2H688pBGwhPTw4bQ8IZLSL?=
 =?us-ascii?Q?j9tHEP6/lAzcZJLctrrWcrvU6tQ1S+N723fwCEBmGILfglOiP4u5srpjA242?=
 =?us-ascii?Q?iXrTkx0bSrpgkF2z67La8bXl7GWVHkr5c8VdMLW+cAYlK2LJ79yoQRgcljKH?=
 =?us-ascii?Q?YTAklINpEHcoMHjXWetQXgWoPIFoBc2Xp7mo5aEp/lzjEjgEH2T/xAdtdui1?=
 =?us-ascii?Q?V1/dAfQWx4nuG3TviKPt9w1qjqGw/O4Uv5xw+2y4BEYDg4h5IVmIz/Diwlz1?=
 =?us-ascii?Q?YHaFuEQUMZKw+e0d+4kWh/OG4Yw/EESQQLU9BbgWuqsoTiM88gXTebNxYjTd?=
 =?us-ascii?Q?Q240OrnGYBb5EzMfVnBKQj5euuIL4iFmREl4Yp3GR2MeEWLW9UTIBr01Z8Hw?=
 =?us-ascii?Q?yL4xKXat6ZWMPeY39CAyFuxKQ4HL6UJXRkka6c5ttEXzpeu1HH1KZoN6TtMj?=
 =?us-ascii?Q?Wybr3jYCIvgpRTn6jha1aZ7l8dVESBbRm048cm+10dON+vmsK3qfWCwV0wNc?=
 =?us-ascii?Q?3PxtJacLQlW5B8unqlmFHd0kv6iyVV4iit8rAkO63iGA/gIfOkSSmAf+zFMU?=
 =?us-ascii?Q?5r63ou5Fd7UExgWolt57ykhCGgiHtiaUZLUTQ4zQ6Isssm6XAVDuZrr+/tSZ?=
 =?us-ascii?Q?aYbEXgEg+OkHyfQ4z8XXw0U7E66dr30Wc1T4Es1VOCgWl6/UZYbR5gy7rlN8?=
 =?us-ascii?Q?eWElkRfNKbXZstZsK/Xf1v8DLwD2Fo7bwiGxPHvkH7KpJTi9mAw3D71hixu3?=
 =?us-ascii?Q?E6BaUIlu18Psda1Dn6fDSbDQCa7pjCA0v/8PM5kr/VqA8flrr/kG1eIrJK0H?=
 =?us-ascii?Q?4J4WDgysxJC0jbOAFSFbVMuIsWEPDzBzDTp790WkmR5l3dbOhGe1hfFvpuZD?=
 =?us-ascii?Q?tY+83wQQxq2ZyrehY1FfSf7xisG5ujafX4txRVVqZBOeoIVNbQ=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5770.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?wLlmNa7mEN9JRlq6oqKaGGweTSS+zSQ+RL9peQf1eUBV79V5T/dlizXLV/WN?=
 =?us-ascii?Q?0f0CTdd38tklenC/6QlQ1Oi/YsWoJ7RTHWPYMtJoQl95uVu71KNuQsaPAqPn?=
 =?us-ascii?Q?DHSw+Pb4VbUfulWKqF4Vae9yBBtUjI4FV5J8E4fxrwjzah2NRdgf05cXP1l4?=
 =?us-ascii?Q?UlDCqevVTL3utkibNy2HjYgvRaPQf/zEKhgpF1/vRc+LgbyvqgYvw7haGdic?=
 =?us-ascii?Q?3X6bVsjz+SMT0DsRQTRud93Ff8AO07cCo5i8l5ecB5FVFjQ4fMAUKKRxy5OF?=
 =?us-ascii?Q?OeBwu0HLfoomWzlboUdVQ0ojmJJa8AmDoJsiImU+88F8shFd1Jys649heckY?=
 =?us-ascii?Q?xG8fMROMlbGmqQm10PNzXa1jyD4Fsy1z+BpBDCMtVBa997GOnlvsmEEQSUx2?=
 =?us-ascii?Q?oO1zGLi4DoMzThai+Vsb7D1IO072CS7CyycPR/G9LEI5rqBYQiy5MSZrD0cB?=
 =?us-ascii?Q?ZCl4Bv08iH2ZA8JvvSCxOmgjZyjiU5Z+TX5M6DHoXgFMTDsBpfXYCLmgGizy?=
 =?us-ascii?Q?e4QPeJKnv97Cfk9axcXsrNA1v3VdIcd/ZGU5CONtGXbyLa8z7BWUCQ81Tppm?=
 =?us-ascii?Q?WRV0/2Tn28u6AyjU/+IQSgO3vAZ580Hf+xZVPsbnVWOEnV857NCAk2nRxBFK?=
 =?us-ascii?Q?yoKbfRzmqfBKyiCSIdLPR1O4FAbMouVvCR34M7Qcq+nB9IHQXWD9tfZ+fhDq?=
 =?us-ascii?Q?rlAgj0SJ39yGwu+vuwhVj1hU/sGeMsowb7+NKuZFyLAt/o4HL0LONRMcqBkw?=
 =?us-ascii?Q?+KpAO6Kdjq47o48UIspvMaR8xhloefIugP10YNqmulRvIkL+N4vn3JvTwcyp?=
 =?us-ascii?Q?gxr9QavZ3vptqXIQ77XAMVoQCfpawEWC4JMMXoF2ccO8mfet3vMIKvvaa89+?=
 =?us-ascii?Q?lmpHh0McWKS0CA6cDeGsAYc3+p36x4jJFL/V8ZDLgTMVqGXwyIFGo65FP+OZ?=
 =?us-ascii?Q?upYxofzK6AZTysik0IX2+NNrB+EVSpbtnfKObgAFNnGJ8P2h2rWU5cT6OIJp?=
 =?us-ascii?Q?yDzFJDkbxg4lFMxIXDHM3ARmc0OXEsAo6Pp6shR+3wfPM+Wn9MW97R/0cPAu?=
 =?us-ascii?Q?IqjYRXQX/HJG9cSIQ6F79Ih4Po6LfetowtI2lRRu2A+FP+1pq7iZ+GZ/A1u8?=
 =?us-ascii?Q?qx1lb9Jp8VYaFgDxR1WnprRJfWIDhy5im1mxbizS90AR5jd7tYwraOv/qgNh?=
 =?us-ascii?Q?wQ3Ct/4YYj7TnWnRVO5iPf5UgewQdondO4xCqN7XNe0Kt4iPLDMEyvSRUhm9?=
 =?us-ascii?Q?YWYK25MVU54k4DgpsSuFB1Z6RA5bEiS0GIrwfBxaM0dloEoQzPxI/pdJwU9K?=
 =?us-ascii?Q?St8rVqCq0TLLfk3uF5Are6e0q5f7iy1z1Rt6nFcleOkntfKoyK8qdt8K68Qw?=
 =?us-ascii?Q?qqtJ2wuiYe8zF3gZV2Kxx4CtFtrEJ77CsDb7BftQXQTQZiI2dmabN0/gj/v8?=
 =?us-ascii?Q?ovC4WcdAsnE/GZRUE6TOZr17jo5Mah7DYfS/0XSbEOCVhgoIkrGmDEBklRPc?=
 =?us-ascii?Q?4t/gC3gPFFT6fjlgYVtzDH5Yj44ufRwGUJVJuOAaurG7fglecKZegi2Y8eyw?=
 =?us-ascii?Q?aarsSAMFnnhbbwA/w303bfVMO+kJ3NZ9Oh0+WTe6RHTEw0hUclab9GHkwN4k?=
 =?us-ascii?Q?sA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5770.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3407542a-d249-401d-7221-08dcc7bcc325
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Aug 2024 23:54:32.1441
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: e0vYF+TYVzcDc/n7C6EMcbYKpl5i9YxIpz4DpnBFRg81nIf6sn53L+qd3qc3BO4c5mVjaDtCKdZM47jUslzB/xPGLy62WpNvk6uNuuLMmzo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6344
X-OriginatorOrg: intel.com

>=20
> UCSI v2 introduced new fields to GET_CONNECTOR_STATUS.
> Adding a helper for each field. The helpers check that the
> UCSI version is v2 or above.

I believe this approach helps us from ensuring new fields are only used in =
supported versions.

>=20
> Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> ---
>  drivers/usb/typec/ucsi/ucsi.h | 66 +++++++++++++++++++++++++++++++++++
>  1 file changed, 66 insertions(+)
>=20
> diff --git a/drivers/usb/typec/ucsi/ucsi.h b/drivers/usb/typec/ucsi/ucsi.=
h
> index dfbc0f6c1b9b..adcbfc96dfcf 100644
> --- a/drivers/usb/typec/ucsi/ucsi.h
> +++ b/drivers/usb/typec/ucsi/ucsi.h
> @@ -524,4 +524,70 @@ static inline void ucsi_debugfs_unregister(struct uc=
si *ucsi) { }
>  #define USB_TYPEC_NVIDIA_VLINK_DP_VDO	0x1
>  #define USB_TYPEC_NVIDIA_VLINK_DBG_VDO	0x3
>=20
> +/* ---------------------------------------------------------------------=
----- */
> +
> +static inline enum typec_orientation ucsi_orientation(struct ucsi_connec=
tor *con)
> +{
> +	if (WARN_ON(con->ucsi->version < UCSI_VERSION_2_0))
> +		return TYPEC_ORIENTATION_NONE;
> +	return UCSI_FIELD(con->status, 86, 1) ? TYPEC_ORIENTATION_REVERSE :
> +						TYPEC_ORIENTATION_NORMAL;
> +}
> +
> +static inline int ucsi_sink_path_status(struct ucsi_connector *con)
> +{
> +	if (WARN_ON(con->ucsi->version < UCSI_VERSION_2_0))
> +		return -EINVAL;
> +	return UCSI_FIELD(con->status, 87, 1);
> +}
> +
> +static inline int ucsi_reverse_current_protection_status(struct ucsi_con=
nector *con)
> +{
> +	if (WARN_ON(con->ucsi->version < UCSI_VERSION_2_0))
> +		return -EINVAL;
> +	return UCSI_FIELD(con->status, 88, 1);
> +}
> +

I think the below fields are supported from UCSI v2.1 onwards. Can you plea=
se perform version check accordingly.

> +static inline int ucsi_power_reading_ready(struct ucsi_connector *con)
> +{
> +	if (WARN_ON(con->ucsi->version < UCSI_VERSION_2_0))
> +		return -EINVAL;
> +	return UCSI_FIELD(con->status, 89, 1);
> +}
> +
> +static inline int ucsi_current_scale(struct ucsi_connector *con)
> +{
> +	if (WARN_ON(con->ucsi->version < UCSI_VERSION_2_0))
> +		return -EINVAL;
> +	return UCSI_FIELD(con->status, 90, 3) * 5; /* mA */
> +}
> +
> +static inline int ucsi_peak_current(struct ucsi_connector *con)
> +{
> +	if (WARN_ON(con->ucsi->version < UCSI_VERSION_2_0))
> +		return -EINVAL;
> +	return UCSI_FIELD(con->status, 93, 16);
> +}
> +
> +static inline int ucsi_average_current(struct ucsi_connector *con)
> +{
> +	if (WARN_ON(con->ucsi->version < UCSI_VERSION_2_0))
> +		return -EINVAL;
> +	return UCSI_FIELD(con->status, 109, 16);
> +}
> +
> +static inline int ucsi_voltage_scale(struct ucsi_connector *con)
> +{
> +	if (WARN_ON(con->ucsi->version < UCSI_VERSION_2_0))
> +		return -EINVAL;
> +	return UCSI_FIELD(con->status, 125, 4) * 5; /* mV */
> +}
> +
> +static inline int ucsi_voltage_reading(struct ucsi_connector *con)
> +{
> +	if (WARN_ON(con->ucsi->version < UCSI_VERSION_2_0))
> +		return -EINVAL;
> +	return UCSI_FIELD(con->status, 129, 16);
> +}
> +
>  #endif /* __DRIVER_USB_TYPEC_UCSI_H */
> --
> 2.45.2

-Thanks,
Siva.

