Return-Path: <linux-usb+bounces-11125-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DBA439034AF
	for <lists+linux-usb@lfdr.de>; Tue, 11 Jun 2024 10:03:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BEF171C2312E
	for <lists+linux-usb@lfdr.de>; Tue, 11 Jun 2024 08:02:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D707174ED0;
	Tue, 11 Jun 2024 08:02:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=topic.nl header.i=@topic.nl header.b="ymbzmDNO";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=topic.nl header.i=@topic.nl header.b="Go+L6zgQ"
X-Original-To: linux-usb@vger.kernel.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2136.outbound.protection.outlook.com [40.107.20.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAFA7173321
	for <linux-usb@vger.kernel.org>; Tue, 11 Jun 2024 08:02:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.136
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718092957; cv=fail; b=ah8xJ+O1W9YnlbxccxMWal+85xy+hsOhoEJ2CXjoE204sUMpSVnN6Sc4ulWlfOo+h/8C/MAeViwAxWIdLXH6qmFifm7VIQv8yJ3/OEJi+qIRMu+8a3PsoK32HH7hxDXqAqVc20bz18Pd/RgdqXjA264S9dbeXOtRAsf1qDv/ov4=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718092957; c=relaxed/simple;
	bh=G+x/zKTvUvi3Lrz1nz4slZEJJRP82CClcze5QYOAzwE=;
	h=Content-Type:Message-ID:Date:From:Subject:To:CC:References:
	 In-Reply-To:MIME-Version; b=ui7IPrRdAepH0zwXOLIfiozGk11732gcpZJpLN1hZ/cuv4M9aCuE6HPbe4OuwIp6tOE5cIqSvgiYDg2aDMZ+vsToaJZu8eKgj7nT1d4HuWCS2cteX7uRhDV1QqWHF4aX/thEk+h8OVpsgb7hMNT7bywvwrIuq9PGXaifxo/r8pQ=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=topic.nl; spf=pass smtp.mailfrom=topic.nl; dkim=pass (2048-bit key) header.d=topic.nl header.i=@topic.nl header.b=ymbzmDNO; dkim=fail (2048-bit key) header.d=topic.nl header.i=@topic.nl header.b=Go+L6zgQ reason="signature verification failed"; arc=fail smtp.client-ip=40.107.20.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=topic.nl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=topic.nl
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=fail;
 b=adb7Ow6VZfapdQsVXvxMGotctiK1DHgsEdAiV6Dxh5HiOwhHREM7h2eBgkNCviTHoa9eER7xyqcKfUEinBzglBRhDLUkEiSyBX7FsXtyAkVW0fYNo5/qnfkehyydFyodfD6m6mszp+qqGI8FsnXEsrpdtlD/RHg/VEIDjauBFujzcmUnChjI85apXABUVL3uuxuH/0z4ERfLud704vyGpJizoJq7dXcQw5pNZTfEvwo2X4SOAHhMtn3sybv3O1BEXJ4ckKbyh0zLaRNDYrGVM/Zo9bGm9S9maL7JLIzpGjxeTVejLBMdZCNTmqlWnOEUHN8JATIpqzFjwR6aaCo83A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UNyr4q8+h5V3oZpFFEHrhX6OsI20/N+VglXXDoNfj0U=;
 b=k1ISF3ecmG/PdKSTirpeXFqVNZ9waWXDqizwxRqftfpOx2bD5tzMhB08MuVzZmyiqyxwt9BSxxwr3f2QlbTL6NCEYSpki1tPqRao5pydEXYIaSy0BJIAbKZu+bL6oZvQEaEhBE8ucSiQck4QqWIR2u4qsHlESOYsNyoMagl2oxpFW0MeuIA8UPmDafgCKCZPHsQ1L/Eq/mNwu46Xw/7ZlJKyTCzs4dvpv3DZc857ahqXoH8/uYyoDSudjk9GPJlt64V+NqdTrE1LpeqJL4dOJ4tnCsnt065uo707uy2aQlmiHhRJslzA1fCmy3Gjp9i+NTVobSVIy8ehcPlLLC5Zqg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 13.93.42.39) smtp.rcpttodomain=synopsys.com smtp.mailfrom=topic.nl;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=topic.nl;
 dkim=fail (body hash did not verify) header.d=topic.nl; arc=fail (47)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=topic.nl; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UNyr4q8+h5V3oZpFFEHrhX6OsI20/N+VglXXDoNfj0U=;
 b=ymbzmDNOZHibfHQZVRA4kUUrVTd8iOuB/KS+oW7HLBuuhBtzoE/YCC9s/E3MBKpTInkF1qVL2ia3swMl2MDDXsYa9CSGDsI2W+MAUtIZcLpwkxoIkrwq5wGCGRdeg7bNXsBdBXuEES3aeGTOQZr1Em+N22hxvl3fOlhUA/fXq20b6dcnbQQ8s2NzHIcXBs3lSpK5inzPJBU6QrGMbt8T0YQaD3Qjdpi0zsXs1VUXgf9+vIny70vVWCD9afYi/IH3iTjaqDMJZ8a5kZWCqoOPY7DRW5Zhkc3zVpUwx8Azn1hOc48viTE4bBofyisWRgPgRFFuPeoDTjDaVorz+UH7dw==
Received: from AS4PR10CA0029.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:5d8::18)
 by DU4PR04MB10959.eurprd04.prod.outlook.com (2603:10a6:10:586::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.36; Tue, 11 Jun
 2024 08:02:28 +0000
Received: from AM4PEPF00027A60.eurprd04.prod.outlook.com
 (2603:10a6:20b:5d8:cafe::4f) by AS4PR10CA0029.outlook.office365.com
 (2603:10a6:20b:5d8::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7656.25 via Frontend
 Transport; Tue, 11 Jun 2024 08:02:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 13.93.42.39)
 smtp.mailfrom=topic.nl; dkim=fail (body hash did not verify)
 header.d=topic.nl;dmarc=pass action=none header.from=topic.nl;
Received-SPF: Pass (protection.outlook.com: domain of topic.nl designates
 13.93.42.39 as permitted sender) receiver=protection.outlook.com;
 client-ip=13.93.42.39; helo=westeu12-emailsignatures-cloud.codetwo.com; pr=C
Received: from westeu12-emailsignatures-cloud.codetwo.com (13.93.42.39) by
 AM4PEPF00027A60.mail.protection.outlook.com (10.167.16.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7677.15 via Frontend Transport; Tue, 11 Jun 2024 08:02:27 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (104.47.51.233) by westeu12-emailsignatures-cloud.codetwo.com with CodeTwo SMTP Server (TLS12) via SMTP; Tue, 11 Jun 2024 08:02:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O+Cfxznv1ph3iBOGasXJGyVRgKBGDPhgPNubW7/PcOixvbmMKBRFoYlSJh3I0DnWU2UOMHvfdkuzGOH16aAl4nNGwWI5lHfRTu4jAUJB/aEslYxSCvjdVLD+YJOLNGwJ5mOQiQnPOjr+OSXvG9QRCB8Z/D0seHSsbHt2uWbzL7c1asCtE0RFGZXXA3Wr+t6nOtYLSbsEAavmrwi7vTQObsyRbmRrMwujZtgVo+MRItabTh71YgQ2HJ6QQoloZUZKh4nk/wh2HPy0dy26KHAFZIzLRXieA3ddDiq9jAmJWhxaSuky2MFGnNhUmnrnnoFT51LwJpVE/mdJNI4UbZYdiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g/ldOprgmUMMCb5TMrmYozhem1v+RW7SO66WEOWMo8c=;
 b=TEnM/1lUknn2CNGxNo0vJy8boxXzBZthK3BPTsHcYerwJI1UXoHLRyimgfvXecR7wwW61x5QspYvbc+unVCT63ouBRk5zDA05k9RS7AGwaZfuu/nLngV8ZdCnucttuDqiGt6G8jGJr7EwNJhF0+IgaVIbRFcMTfhYx7Mb4/8OYEBFbzUKLNiBPGM0KhdGqoM8OiOELGo1OGSSJ2f4Nze1U/Vyl4NDcwwr3RlJ8W/5mb/E+AfYqBE2xUBhyUZtQ/Z7/97N8uWvKHSDcnDY8P0mUndfz1A90BydEQQ2mCERUBEBHXBa9efiuZA3kUlA2tXCZwQQ/O0SXvuGqpmAeiYaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=topic.nl; dmarc=pass action=none header.from=topic.nl;
 dkim=pass header.d=topic.nl; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=topic.nl; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g/ldOprgmUMMCb5TMrmYozhem1v+RW7SO66WEOWMo8c=;
 b=Go+L6zgQPiA/PRlB9UbO5phvl2o96hpEvuLQ2mo6tQjknAekBEFD6UfLz7RydmwfZDVIlcQc35voMe/BSl85zYNS3LjjHg/Pu98z0adPrIIko18DS+2I4ifyPG0y7CF9VrYjy2NXwiQ97X3ycgj0udyrcW4+wHLV433Ppfs9JBPD7ivHxVcwXvaoopX+eViVUMd2mC0vo3fuYeumpmgWIXsdfhXfniTte0djTfabSoZLXx5rUdt3RwxLdttxwNH2hZeQLl4hUOKlOFwSXOUjBEcX9eWUqk0KrMlzl6E9YfGOIozxTRMP5fevVv6GN7sw+yhwyISeK9lJXIWwPB3Hjg==
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=topic.nl;
Received: from AS8PR04MB8644.eurprd04.prod.outlook.com (2603:10a6:20b:42b::12)
 by DU0PR04MB9444.eurprd04.prod.outlook.com (2603:10a6:10:35c::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.36; Tue, 11 Jun
 2024 08:02:23 +0000
Received: from AS8PR04MB8644.eurprd04.prod.outlook.com
 ([fe80::e86d:f110:534e:480a]) by AS8PR04MB8644.eurprd04.prod.outlook.com
 ([fe80::e86d:f110:534e:480a%6]) with mapi id 15.20.7633.036; Tue, 11 Jun 2024
 08:02:23 +0000
Content-Type: multipart/mixed;
	boundary="------------1kiRAvtjUz3fGJetHC5jrBT3"
Message-ID: <9eb64562-cbaf-4abb-95d8-5792d46bd63d@topic.nl>
Date: Tue, 11 Jun 2024 10:02:20 +0200
User-Agent: Mozilla Thunderbird
From: Mike Looijmans <mike.looijmans@topic.nl>
Subject: Re: [PATCH] usb: dwc3: gadget: Inform system of suspended state
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
CC: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
References: <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.949ef384-8293-46b8-903f-40a477c056ae.c5f44c79-75b2-43c1-a791-806fe8b693cd@emailsignatures365.codetwo.com>
 <20240603131304.233403-1-mike.looijmans@topic.nl>
 <20240604010256.4dxamwvcjxug6xfb@synopsys.com>
 <0fceefc4-2b3c-41a4-a6ac-d0b6dbacc1f7@topic.nl>
 <20240604230624.dk3pssivd7g3qb7p@synopsys.com>
 <023d03d8-ef52-41e5-be9b-d75be49c615c@topic.nl>
 <20240606002805.bziyz3y4bcysdysv@synopsys.com>
 <d4322992-8aa4-4eb7-b7f6-63b1b706ad7a@topic.nl>
 <20240606202127.6gdk6v3jevrmoyzk@synopsys.com>
 <a630f365-7a7b-46e9-b5a4-9b150f31d74f@topic.nl>
 <20240607225731.2d24p4as4x7mrfaf@synopsys.com>
Content-Language: en-US, nl
Organization: Topic
In-Reply-To: <20240607225731.2d24p4as4x7mrfaf@synopsys.com>
X-ClientProxiedBy: AM0PR03CA0091.eurprd03.prod.outlook.com
 (2603:10a6:208:69::32) To AS8PR04MB8644.eurprd04.prod.outlook.com
 (2603:10a6:20b:42b::12)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	AS8PR04MB8644:EE_|DU0PR04MB9444:EE_|AM4PEPF00027A60:EE_|DU4PR04MB10959:EE_
X-MS-Office365-Filtering-Correlation-Id: a47ce700-0c45-4a61-283f-08dc89ecd635
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230031|1800799015|52116005|376005|366007|38350700005;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?hJnvH09gaigrXnsjhJBnbjj8ocwATVjoHPmvP9FOsQA1W57jj9tywaXdWjrC?=
 =?us-ascii?Q?nxXtbEkf/cUlrQQbCArStN/h4Vn2BuU2Q+n8HC9w7dk4DCbpWJcduoSbD6bo?=
 =?us-ascii?Q?Ve9SddgFViUBTLwrOQduVjs7xUGlp4OIyJCmfYTFxySVM2a22sdaiPMUJaCT?=
 =?us-ascii?Q?e3P0RpnMcGt1YraGaQn+TzJcyO3gEeeusziS4AGHQ1SLWalBPyj6jHslsjzs?=
 =?us-ascii?Q?guc8YFVqpeJphPrdrQ365gGSyhoSUO0UXFkTD5AgTLipdgG6GI1cs9+joEwP?=
 =?us-ascii?Q?UsQT16aCCaUpAmIqv/cXNx42PPCiuHyYSIEcFqhDoXpOYmiBN310xKKExHyJ?=
 =?us-ascii?Q?uaIaa6J3ZbF9Q9FVMQ8AD3lORxeysx3pv1OB1KuoIyhquYJSfAK9UJL1po2W?=
 =?us-ascii?Q?CRlzEJW4s0z7r6SuAJt1V23DR07zOrQL46rLyiL/xtvuxZcHw125IpVDi/vy?=
 =?us-ascii?Q?t9TEd+VD9wuPHaJC05zvIqPKo3rhpt69iwNsstm0c7WFxOxI2vdB8dKQ0UoX?=
 =?us-ascii?Q?EIiSZenTCOMA+I5tDpe9dbqUfEpondL6gM6NO31Dr08JhToMzrWG8coYb4KL?=
 =?us-ascii?Q?L1LISoZPJXh8oNwRESrx7TzXCMk/SkUI0KjGOImU5rZKV2wD8xpRhA7ynzyB?=
 =?us-ascii?Q?GxSSWFhtgDO3yiHcG7u+dq0fmdVwAL6raSJUdhQRlFEt7Ty9Zd7WCMPq4geA?=
 =?us-ascii?Q?+2bqLiGAphrAur6wAn0b51ESVYyCWDbXW3qushXo4bGtaunxD35VZymTBSSy?=
 =?us-ascii?Q?DU4kAuXPlY6lnWsJW9CoE/gU94phWkyrplbZO9v1Ah+X/T1O3y9DErw7q1nZ?=
 =?us-ascii?Q?56H5JQbctcEO8pb6ofqq4nJrgsICfLrnPRuFuBRcj45uLNVOVGaGZKr4/NK4?=
 =?us-ascii?Q?XgvnBla8fDHUA7cyzN8oLByOP3YQyR0c33A5Yl0Z9iBFde4rfOg3b4jNB4qy?=
 =?us-ascii?Q?Oimi+zl5fkQ8eMx5qpwlNevhYQgV5hG2bdbigqiu15XaZDpi3PJtvflzspBL?=
 =?us-ascii?Q?8lF7uJpW8iaEveI2FcLxNL1iMX9BOZX1UCsTq3SpHhENcw0eSdj4Na5p76Kx?=
 =?us-ascii?Q?Q9FN3wuctTXHF58BLvD+yhgPPnsJu8pFPiod7Zd5W2r+5wUpPChNhfApz3zA?=
 =?us-ascii?Q?EdcuJUuHeJ1FsgTZonfWFFEE8hnk8cPU0u03TLSNfHIyZ15AGbnjo1bAXxWO?=
 =?us-ascii?Q?itlQ+UITzs20m73mCrTTCFJ8Q5niH1+wJ7e/XgW4rxdaFn4eq7WBNZjz0B/W?=
 =?us-ascii?Q?QdchgOugjc2Wgrc/zEWp?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8644.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(52116005)(376005)(366007)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9444
X-CodeTwo-MessageID: 92c312e4-ec01-4f8d-9789-7e1980882b4b.20240611080226@westeu12-emailsignatures-cloud.codetwo.com
X-CodeTwoProcessed: true
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM4PEPF00027A60.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	b28c11d4-14a3-4e89-d8c1-08dc89ecd2a7
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|35042699013|1800799015|82310400017|376005|36860700004;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZEpXMFRybCtFTDFYMWR5K1VOakJEMjVPVDFweHdjazh1TWt0aUxBUHNMTXhL?=
 =?utf-8?B?S041NkRDVlhXdFVveFRkQXZqOXRZd1hPVFpLYjROK0s4YlNUTk1rNjVEYzVH?=
 =?utf-8?B?MFVDa2Q0c1lRb0xtbE0xLzg4TDR6VktCOTAyc1FMNit1SEZ3TWxZQnJKSFlN?=
 =?utf-8?B?ZXgwUHFIQUZDck1HUGhKTzRuTGRmWUFSTG9vbVR2TURZdGJIVFZzUndCZU9J?=
 =?utf-8?B?ZXlIbk1BT1dmcVVYNjR4WXNMMm5uVjFoRktyTGkrUEtuVkl6SUlMTTR2R2s1?=
 =?utf-8?B?TEVmenp3QzB0Vkw1NGhRbzlaRE9uYWVuQWlxcGFZOWp4cEQ0RjNYaEFCS0RQ?=
 =?utf-8?B?K3l2bjdmOGtiMWMrY2E2NDByc2hkY2FHUERaMTNSdGYwL2dOK3JFU2pocWZW?=
 =?utf-8?B?bXEvMXdXTHFSVzQyc1I4T2lwWXp5aWhRLy8vMm5lMWZuWlhaeHI3cmV5Wm9i?=
 =?utf-8?B?d2JmdWt6QjRKN2ZyMzdXcENpZWJHK3dDcU82Qm1xTXl1L3ZDNnEvM0lCYllp?=
 =?utf-8?B?UTEzZXlxcmxHU1ZVZjQ1Ym9OZk4xejlEZzkvNWR4eGY2Z0w4Y0h5L3hOeWQr?=
 =?utf-8?B?cEMwWU1jNkp2SzROVTNoN0NKeG9pbzU0bG1ud0tqc2NtZ3NYS3RFQ3U3RFRQ?=
 =?utf-8?B?M1BxU2tVVGl0ZnlsdGlUanZHc1JYRStkL0tuMEc4dCtvcVJwVVhERlAxMkZw?=
 =?utf-8?B?SXJtZUtvd2t6Y2szM0JXL3FnZlUzUllIb3BXNE9wRjlrUzRmWStoM1hpTVVZ?=
 =?utf-8?B?cEhNMEJjUy9oZVRsVEFBQ0tFVXhnam8wM0FqNWJXaEtUQWp6UFBWM283SFNI?=
 =?utf-8?B?THY1dHpMdW1USmRYRmQ3NUxpWTVvLzJlcmRONENDTzJrZFVGd0pMS3Fvd3pn?=
 =?utf-8?B?QXcvTjcwcU5wejN6b21vN05NSlFuNUc0TG8vNkg0clphbnVOcWpSMVJlNEU2?=
 =?utf-8?B?SDA3NDhRWUREOWhORjZYN1FTZzRvSjMyYVRZeFRybXQ4bDlkY3JwdnV0VmN4?=
 =?utf-8?B?T2xyY09neHc5WGVOdDRMVmlYUkc3ZzREZzVkcFVrTDIxVnhBZC9oZXRQTnRS?=
 =?utf-8?B?cU9ZZGQyUlI4d2FDd2xGcEdiU004aG5mSDhWeDEvRis0eE43d0V6aWE1Q0Y5?=
 =?utf-8?B?UVo3cURhODIwbzJWRVlScFo1OFNXaFBlK1dQM25jWmFUejRuSjNGSzhYeGEv?=
 =?utf-8?B?WTQyd3RybTVZRUhpbThIcmdaODRBNXFrbldjK0c4UkpCWWdNWUQxaUE2QWlh?=
 =?utf-8?B?WUFwdFZZem5weEtGNGxqazlPczFuY09DSDZsOU93Z3k1MzBtUGRJcW1RVWR0?=
 =?utf-8?B?bjJQTEtUdDZxbkorR3FFT3hFS1FJWThRS2t4aFRPRm4rWXk5WVpROENTTkZW?=
 =?utf-8?B?Q2w2aXBXQ3BHRFRSdmI3VThqQURHSnE2d3VvK3BDK2xmODMzNTRjZUs0ZUh1?=
 =?utf-8?B?djRJY2lXNWJqK3NqWVloZldKaWZlRnpBcGx4Q21LVWJKVEVpTjhEbEdwVGVK?=
 =?utf-8?B?OTVGQ29MZEdZMURTNUVPV2pLTXl5NURNTHJsbC9aeXZYUldNMUhKTzlqZkVX?=
 =?utf-8?B?U3IyL0hrM3FkWXQrZmZUNzVJMnl2RTc5L2xabFd0S0haQTg2UHlZa2pCS2VD?=
 =?utf-8?B?RFMxRmgrR3FLQWplNHU3T0NYVHRKQzdqM1lvZzZESE13RDE1ZXlaQWFYbVM1?=
 =?utf-8?B?OWNBbnVGMkJnMFFuekM5Sk52a05EbWcyTDF4dXE5RCtDTVYwcG5zSUJSc3RQ?=
 =?utf-8?Q?mJpFmVDdWv2lc+tLZE=3D?=
X-Forefront-Antispam-Report:
	CIP:13.93.42.39;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:westeu12-emailsignatures-cloud.codetwo.com;PTR:westeu12-emailsignatures-cloud.codetwo.com;CAT:NONE;SFS:(13230031)(35042699013)(1800799015)(82310400017)(376005)(36860700004);DIR:OUT;SFP:1102;
X-OriginatorOrg: topic.nl
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2024 08:02:27.8237
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a47ce700-0c45-4a61-283f-08dc89ecd635
X-MS-Exchange-CrossTenant-Id: 449607a5-3517-482d-8d16-41dd868cbda3
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=449607a5-3517-482d-8d16-41dd868cbda3;Ip=[13.93.42.39];Helo=[westeu12-emailsignatures-cloud.codetwo.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM4PEPF00027A60.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10959

--------------1kiRAvtjUz3fGJetHC5jrBT3
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

On 08-06-2024 00:57, Thinh Nguyen wrote:
> On Fri, Jun 07, 2024, Mike Looijmans wrote:
>> On 06-06-2024 22:21, Thinh Nguyen wrote:
>>> On Thu, Jun 06, 2024, Mike Looijmans wrote:
>>>> On 06-06-2024 02:28, Thinh Nguyen wrote:
>>>>> On Wed, Jun 05, 2024, Mike Looijmans wrote:
>>>>>> On 05-06-2024 01:06, Thinh Nguyen wrote:
>>>>>>> Hi,
>>>>>>>
>>>>>>> On Tue, Jun 04, 2024, Mike Looijmans wrote:
>>>>>>>> On 04-06-2024 03:03, Thinh Nguyen wrote:
>>>>>>>>> Hi,
>>>>>>>>>
>>>>>>>>> On Mon, Jun 03, 2024, Mike Looijmans wrote:
>>>>>>>>>> When disconnecting the USB cable on an LS1028 device, nothing ha=
ppens
>>>>>>>>>> in userspace, which keeps thinking everything is still up and ru=
nning.
>>>>>>>>>> Turns out that the DWC3 controller only sends DWC3_DEVICE_EVENT_=
SUSPEND
>>>>>>>>>> in that case, and not a DWC3_DEVICE_EVENT_DISCONNECT as one woul=
d
>>>>>>>>>> expect. As a result, sysfs attribute "state" remains "configured=
"
>>>>>>>>>> until something resets it.
>>>>>>>>>>
>>>>>>>>>> Forward the "suspended" state to sysfs, so that the "state" at l=
east
>>>>>>>>>> changes into "suspended" when one removes the cable, and hence a=
lso
>>>>>>>>>> matches the gadget's state when really suspended.
>>>>>>>>> On disconnection, did you see disconnect interrupt? If so, it sho=
uld
>>>>>>>>> transition to USB_STATE_NOATTACHED. This change doesn't seem to d=
irectly
>>>>>>>>> address your issue. Can you provide the driver tracepoints?
>>>>>>>> The device doesn't issue a disconnect event, I didn't have tracing=
 enabled
>>>>>>>> in the kernel but added some dev_info() calls to determine what wa=
s going
>>>>>>>> on. Added this to dwc3_process_event_entry():
>>>>>>>>
>>>>>>>> dev_info(dwc->dev, "event: 0x%x type=3D0x%x", event->raw, event->t=
ype.type);
>>>>>>>>
>>>>>>>> When disconnecting the cable from the host, I see this:
>>>>>>>>
>>>>>>>> [=C2=A0=C2=A0 50.841411] dwc3 3110000.usb: event: 0x6084 type=3D0x=
42
>>>>>>>> [=C2=A0=C2=A0 50.841457] dwc3 3110000.usb: event: 0x4086 type=3D0x=
43
>>>>>>>> [=C2=A0=C2=A0 50.841494] dwc3 3110000.usb: event: 0x6084 type=3D0x=
42
>>>>>>>> [=C2=A0=C2=A0 50.841534] dwc3 3110000.usb: event: 0x4086 type=3D0x=
43
>>>>>>>> [=C2=A0=C2=A0 50.841571] dwc3 3110000.usb: event: 0x4086 type=3D0x=
43
>>>>>>>> [=C2=A0=C2=A0 52.650990] dwc3 3110000.usb: event: 0x30601 type=3D0=
x0
>>>>>>>>
>>>>>>>> The "0x4086" and "0x6084" messages are endpoint events that occur =
all the
>>>>>>>> time while connected. The last event is the "suspend" one. After t=
hat, total
>>>>>>>> silence.
>>>>>>>>
>>>>>>>> If you need traces, please point me to a description on how to obt=
ain them.
>>>>>>>>
>>>>>>>>
>>>>>>> Let me know if you run into issues following this instructions to
>>>>>>> capture the tracepoints:
>>>>>>> https://urldefense.com/v3/__https://docs.kernel.org/driver-api/usb/=
dwc3.html*required-information__;Iw!!A4F2R9G_pg!bahfjil5HEUq-fOHAwDfusutLJC=
LognfyLHTFLiSlVuZotpr99XBGg7nB0zRRnNF_M1pqEKcVa4KxNJwh3_F2dZWwVKTkUY$
>>>>>> I've attached the traces as a tarball. Hope it survives.
>>>>> Got them. Thanks.
>>>>>
>>>>>> At the start, the USB is up and running (and doing ethernet+mass sto=
rage). I
>>>>>> saved the trace after pulling the USB cable.
>>>>>>
>>>>>    From the capture, we can see that there's no system suspend, so th=
ere's
>>>>> no soft-disconnect.
>>>>>
>>>>> Base on the suspend event, you're running in usb2 speed (ignore the
>>>>> incorrect U3 state, should be L2):
>>>>>
>>>>> 	irq/94-dwc3-631     [000] D..1.   149.139290: dwc3_event: event (000=
30601): Suspend [U3]
>>>>>
>>>>> The DSTS from the regdump indicated that you're still in L2 despite
>>>>> disconnected. Looks like the phy was unable to detect and wakeup from
>>>>> the disconnection to notify the controller.
>>>>>
>>>>> Can you experiment with setting "snps,dis_u2_susphy_quirk" to disable
>>>>> usb2 phy suspend.
>>>> Adding snps,dis_u2_susphy_quirk doesn't make a difference, behavior is
>>>> identical.
>>>>
>>>>
>>>>> Does your device support SuperSpeed? If so, do you observe the same
>>>>> behavior while operating in SuperSpeed?
>>>> Just checked, still connects with superspeed. What led you to think it=
 was
>>>> only high speed?
>>>>
>>> Bit(4) of event info (0003) from device event value (00030601) indicate=
s
>>> usb2 speed.
>>>
>>> Register DSTS field 2:0 indicates fullspeed. Even though this was
>>> captured after disconnection, the linkstate did not change, which led m=
e
>>> to think that the connected speed did not change to Es.Disable either.
>>>
>>>> Do you want me to send new traces?
>>>>
>>> Can you also try to disable usb3 phy suspend with
>>> "snps,dis_u3_susphy_quirk" if you think it's connected in SuperSpeed?
>> Added this to the devicetree, but also no change in behavior.
>>
>>
>>> Please capture the traces again if it's operating in SuperSpeed.
>> I've attached new traces. Connected at superspeed (host reports "supersp=
eed"
>> in its dmesg log, and the real data transfer speed is way above highspee=
d)
>>
>> I added register dumps before and after the disconnect.
>>
> Thanks for the trace. It's indeed operating in SuperSpeed in the
> connected regdump. However, the GUSB3PIPECTL.SUSPENDENABLE is still set.
> Can you double check if you properly set the "snps,dis_u3_susphy_quirk"?
>
I've attached a trace with both "quirks" in the devicetree:
 =C2=A0=C2=A0=C2=A0 snps,dis_u2_susphy_quirk;
 =C2=A0=C2=A0 =C2=A0snps,dis_u3_susphy_quirk;

Interestingly, it still goes into "suspended" mode when I remove the cable.

--=20
Mike Looijmans
System Expert

TOPIC Embedded Products B.V.
Materiaalweg 4, 5681 RJ Best
The Netherlands

T: +31 (0) 499 33 69 69
E: mike.looijmans@topic.nl
W: www.topic.nl



--------------1kiRAvtjUz3fGJetHC5jrBT3
Content-Type: application/gzip; name="trace-with-u3-quirk.tar.gz"
Content-Disposition: attachment; filename="trace-with-u3-quirk.tar.gz"
Content-Transfer-Encoding: base64

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
bnGL24G2/wAc9vd6AMgBAA==

--------------1kiRAvtjUz3fGJetHC5jrBT3--

