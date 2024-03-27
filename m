Return-Path: <linux-usb+bounces-8462-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 83B1488D89C
	for <lists+linux-usb@lfdr.de>; Wed, 27 Mar 2024 09:18:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 98E801C26F4A
	for <lists+linux-usb@lfdr.de>; Wed, 27 Mar 2024 08:18:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE1872D047;
	Wed, 27 Mar 2024 08:18:44 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2108.outbound.protection.partner.outlook.cn [139.219.17.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26E5D24A08
	for <linux-usb@vger.kernel.org>; Wed, 27 Mar 2024 08:18:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.108
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711527524; cv=fail; b=ZDAAkOhnRPAP4pyxDegkgk9g9b6plfEonAkWW2beYXJJfI2EiVJgP/0wvoX3F7q3j2rrBypeJh7X9iJ9tcXILCn4I6epbzQ/KFk2SHdzFJbvFajCGzJLZ23YnFXcz1rjUDVpWTTOZ7ZdavrxAtSPd+Yg/o0z+4xCPACqnMwomQ4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711527524; c=relaxed/simple;
	bh=xXh+Me8ewbezRBZQ2mRX0gH0PB+fq2O94ENhjV/ZiyI=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=fWD2vgYNhzKYlEyIz7jUiHrkEGYR5bSVrE9xNclCpCmullYHdeCehNELvstT7ySoe/b0XtRXRBHHNIHMKV+MhN8DKbqS3NC1otCuodfgDVDvAWIG7SwaWEHqgWrZMsRKZHMkM9XnCkdMw2bx6h+D/mYI3Q7tPSkSFHfKAQa+zAM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nSyw0z5hESPjW8lxLkywdTtUc8HPfQ/Kc7A62vab0gDD1FWn/AZUF1TTvozNxOL9uxIeezE0ZVf4D5fYnCi7UnE/PZ19H9Mn5CSVzYGvMGL7OWTlKMltdhX+CNuX+gOwCWOs30IOhPWTgxtoBbgNSVGsapFnVUCJW8NOJi+uxf3aDTp2+zWW2d6b1gF+f6hLrBGO2zlcmwHogD1clxyoMSE1ZN5fyhrxKZ+3OtAUxmVwevbHgdkkFuKzaN7IVvol51rkioI6XZq2LIF9Okfq+VE6wjHP4EXv35VgEAylnoO3mjOX3OcAEz+ut1Cr4naPU8x1ERibP2kBfIHqldk5Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xXh+Me8ewbezRBZQ2mRX0gH0PB+fq2O94ENhjV/ZiyI=;
 b=CdtHpHjVFBJidolkufrnzut/kg790IOrEjcJ8QlWvWkliX+Zo4GI8nsZ3Cji05NC3IWpowDg2mZSJsFPAP3+ZLDCyGZv9UC9wFbbusuIFtvm8n3LSr43YGBVG8H7YvN37S+MHkkcbeIS9XXCtXpz2GooL35w1gz/zh2n5nBmFOM2cjhhqeO42d02voEZClFEekJhJZLOPjv+6mAlmUvbengQ0s2TkoKGhqYZcPh0oh7oN6gHb9PXZOonRDJd/NXhZ8yrNLBLPj2Un/S5XygtZaFR/T6EnR7K9nTEdwE4ORRJ/WSa+vyr5TeZE+/oE+3TpnzeoiCL3ImwG14VQHokiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:25::15) by SHXPR01MB0719.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:26::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.33; Wed, 27 Mar
 2024 08:04:21 +0000
Received: from SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn
 ([fe80::c738:9e6b:f92e:8bb9]) by
 SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn ([fe80::c738:9e6b:f92e:8bb9%6])
 with mapi id 15.20.7409.031; Wed, 27 Mar 2024 08:04:21 +0000
From: Minda Chen <minda.chen@starfivetech.com>
To: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject:
Thread-Index: AdqAHV+7FbMXbkUVQme2LTYYFyvv2w==
Date: Wed, 27 Mar 2024 08:04:21 +0000
Message-ID:
 <SHXPR01MB0863559622E0F010F4236220E634A@SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn>
Accept-Language: en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SHXPR01MB0863:EE_|SHXPR01MB0719:EE_
x-ms-office365-filtering-correlation-id: cac3509d-16a8-4145-892c-08dc4e3482ae
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 iDko1dP3JzcGSg3qvJwtBYQotBzt+aORfJY50g5PKwG38+5FLjM3kYtFPBFn2ij33/MrpR3/KXkhW0jNDrrLe8+sKHgHURgE3LKo/RYr4HB2TnaG3mCqMtp6fRedYYa0SVbUBuCKbF3cLDXZttgJRVKJIIEti7mlRLvYwiJ7dTaz6rQRVnWuD4iJDMrOq7Eo4i57zDiqWwRCwCqZJtyU3wYfqUHq30NdHPvIH3yy/+e4qc0jGe/q0TIdsh2OluDgnVGd77PHyKYDFh237BsnRmiwGyrwQ3ufWvDsr0E6sWGn67n1scfR7C8e/Ob2UM9FQ6WwV5YZgrx86TPdKkBjy34mXz2IQFnDokMt1Mvc2st4oLSi+qj0B8ajs06+QGP9uSr6mfpROOa7vEY7La65TSLG5Ik7jGN1gYcgxRfvNFgZrhJnqWF+eiJOAwaEFUqrYURrYVw/7dfEEb7U4H8dFlv84PknKc6F0qJ1WLnqXn+Q4rcj19lnXeSLzEm2tepV6mHIL7UhnkG0jiOGCDdYsfqBp7koJ3LDtvv0xoVhy15cNVwx9+UDRbvOvcTJDQ0xKgwSHiMBd3WWOALE6KtRLOZjo+n1EvtsPP5K08rrI3C8peizNBhzKXxV8gEYtowm
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:ms;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230031)(366007)(41320700004)(1800799015)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?c5XpYOHtF3i9bWVC3/flKp+60Wxc8RqNuQh+L7fV1UrC3T8kU/5REHu3KiTP?=
 =?us-ascii?Q?ZTgWQ42gR35zhgylEmDWXttqoqJ+H9QjP+hhthbBgMDnc5ccyWz32NqHMu7K?=
 =?us-ascii?Q?Cth/dOO1F5ic8EdC62XJTzjNk/usnZ18dpRpGOoVXFTubydkWp64axa26Gen?=
 =?us-ascii?Q?bm6Q7Ap7mukpZ8QPF6+gfOCntRkRb+WhLKIib9KnYtVbjBwAq3YxIYMg2J0Z?=
 =?us-ascii?Q?Jcmx5BdNOnIrsM5M8dwqdNEv/6WpGfJRB7V39ak5J0apgRQgj/dBX0yCO+dL?=
 =?us-ascii?Q?il4SmJNc1rLrzTGJ/jVunltPfAczMKZwnNBGEL8dLhk+zV+RS1JTpgbuHfza?=
 =?us-ascii?Q?kJwrpNh4pVTz+zW9ZqyRuiuQb0IhAvzwCt4Aq+QrCJt1eAqRtDH4ECAiHYCi?=
 =?us-ascii?Q?rUP25jmxUPVFoACj5R/qNSWTE35IPZogcE9I9RjzIrvB4R4ir5vcXyWzcO6J?=
 =?us-ascii?Q?K/GM2dqYy3Th/fEdSDRcumh4eAw183mpv700Kry4pMxfSnBR5hieg0oTLWZg?=
 =?us-ascii?Q?/4oCVnCN6YFNAMfzqfqsyCzAJP5uLS/2q/ZomlsPpX2iaPAJ7AG2C42F5p0d?=
 =?us-ascii?Q?fz7oWiOSMXNRLEqX39OW26Ra0kqlehTwfib0tfoQKSKKiXUXKSfpMjaS8Nmw?=
 =?us-ascii?Q?85WfNhhUwBP87Y1iKYawKo7LLsREzxz6Gzuck0iNFQ/DzyPI5OFxc9LJzJpm?=
 =?us-ascii?Q?8uYdiXDWhtoCfaRUGAPWljaubnp0mVXYZjDpSWnW/Yan4+b9hw4W/B8eMYdn?=
 =?us-ascii?Q?ntwlZjFLd953dJZyulbaeeQYO22oI17xLoRzcM7CtI7UhurEL2GJnPuXHOhn?=
 =?us-ascii?Q?AVMyM/CIeUhRYdNmqv+jfOii20s9RZAWL2FJYSMRfiayCLsnq7rZR4Tzywrx?=
 =?us-ascii?Q?0i+CsONDFR8WY3yMn586tg3x3AFmju3sKaDIyAmb7SVDfXKwFyaOvezr6Jj6?=
 =?us-ascii?Q?+J1LLsUIOpBd7aRR5lg7U/BHi7y83UXRes1X9mfE7iRdCqGXsLVXNelbHO+k?=
 =?us-ascii?Q?0KEUqjw7+BvHBcTMWvUHIPstdROCNYrst1OujsI8zLhLRiq4OlKwYvbl4d7+?=
 =?us-ascii?Q?W2SvPdKLkai2fOUtECAfb0JuzoWGdZDM1W++2+9cUECRczGypuG9kxP8qP3T?=
 =?us-ascii?Q?qXSFVugtH8nRKU/HrUDKAsDvPz/ON82MZL51a+mlqCNCRkF6kguJsAZl/Tf2?=
 =?us-ascii?Q?m/vaFZGkSJ5ynE3STkTTGFXVELb4k/QtXB7lW2JqyRewBfLUlMxA1WkE/IzG?=
 =?us-ascii?Q?Lh/Ofkx9DrieBg+36TAKLFcf99Vc4AUWop50/FQ4doyNplN6Sse883NRZTvL?=
 =?us-ascii?Q?E3S4rIMH/acBZBEjk9n9gkeTVr20gGERFK/YWhypdmqtKrcHKVI3FIRdwWdK?=
 =?us-ascii?Q?ZBDRc1ctLfFffOUrdkQzNb/t/Yox4FrzXCQkWqFo39MLzF7MYs6h7+TVw995?=
 =?us-ascii?Q?ZWwbGdM9ADWqUGSNdPfjFdqgnpGIS1e5gKQSmNMagtWKJMfXtO3HGgtDGgEc?=
 =?us-ascii?Q?XY9NYr5tFxvBnXIXEsCZN76hXYqRl9TV3lqn1YRVHyTwR5w0WpNBinTQHBOE?=
 =?us-ascii?Q?iB66w85eCZJfBgtw4ThHeCSzoFT00EFO2dY7EbPS?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-Network-Message-Id: cac3509d-16a8-4145-892c-08dc4e3482ae
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Mar 2024 08:04:21.6969
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: j1k07LqDiSvJ/pUvzStYk2rUGU/5RBX9uJCYY7HJk7zq4mP+A2+HUhtoB6R78DRJgl5J/57k9woJtKCmK24iILWvrz230K8Wa6X6D2GO3+M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SHXPR01MB0719

subscribe linux-usb minda.chen@starfivetech.com

