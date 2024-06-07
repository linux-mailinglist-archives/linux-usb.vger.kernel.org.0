Return-Path: <linux-usb+bounces-11006-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E1938FFBE1
	for <lists+linux-usb@lfdr.de>; Fri,  7 Jun 2024 08:10:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B25FA1F2270E
	for <lists+linux-usb@lfdr.de>; Fri,  7 Jun 2024 06:10:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59E1215278B;
	Fri,  7 Jun 2024 06:10:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=topic.nl header.i=@topic.nl header.b="HIdiLngV";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=topic.nl header.i=@topic.nl header.b="jGXSCQBb"
X-Original-To: linux-usb@vger.kernel.org
Received: from EUR01-DB5-obe.outbound.protection.outlook.com (mail-db5eur01on2132.outbound.protection.outlook.com [40.107.15.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7AF21514C3
	for <linux-usb@vger.kernel.org>; Fri,  7 Jun 2024 06:10:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.15.132
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717740615; cv=fail; b=e3oYTUrcsbz+5EpGEyMtsYFw0sUgVQ72rw67JPZ76sSSq4xCRCk3HStgAqy3V5gOiPV+VmpS05UPMDgGujX92fP9Cq3b8NbEGw4pxLU/ifnJBj9vIfL5WMoCmBhBk6ja5w2L1HeB3Apdq0Ga3G19vISJYJKx7vHyxKJodpQ4Xi0=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717740615; c=relaxed/simple;
	bh=ZYqgUk0yMcAPQ6xO6VhzLAhnUuHnsqLdsHK13Nn5pGw=;
	h=Content-Type:Message-ID:Date:From:Subject:To:CC:References:
	 In-Reply-To:MIME-Version; b=BvtxTXNN599imKSpYRUXu8nZ3VV7PGfgOtFYhcwaUzKXjgj/z/W3NqOY8PVeZghEh601ZBPVdsaElvviyXWwTP3PHrWTTE4h4Vh9sKW/GOUBF9DAmxPH3+c4Ky8tFVjSmmr151k+9y1HcI/ZSecAcOBfLp8TarCEq9MBjqchplU=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=topic.nl; spf=pass smtp.mailfrom=topic.nl; dkim=pass (2048-bit key) header.d=topic.nl header.i=@topic.nl header.b=HIdiLngV; dkim=fail (2048-bit key) header.d=topic.nl header.i=@topic.nl header.b=jGXSCQBb reason="signature verification failed"; arc=fail smtp.client-ip=40.107.15.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=topic.nl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=topic.nl
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=fail;
 b=BbiqYO5kLy6jiPmMVbLL8xW/s0I/XW5tTc2QGw/uSGPKl6cDe4JZrD+ulacWYO+F7qI9nhSfbTTJhd7OuOONZP31nK4lkPFxvh92s5U6jFmu/5X2Hhx/QIJT5BbdksA4kIbNUMC1JZCJRl0WKOV31O4UrHJw8MNPUDYIHJKj4nEFQZ5N/5FSQHrI1JzHyQgxXgiw/HrYhDe4Wwwc24GR+SUptyE0WFa7m8cWpegu9o8U98VGNVnKOmi0QdNN/bYIAV3MDBl03pfxeLpwznBzuUtHwdsCnml2TgD+EftjLGKfli0jcEIon/mxwhTOYADnvoFJwTB6VsVzxbO3WpY3VA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=96MEUticLrazCzp1dIdXWraVO84m1qJ8Rr+feOegx0g=;
 b=A7IgEBGVo2ksZPFVKfpHewYfBK/eAb7okh0S5kUcdA54nKjUtnO1x5Ds2/1y91q+N0v5rdGS7wxwXjnmGGDKM4JKUMnYRZJeh8rCjxsei8qKfYS7/B5y3S8a/9ld8eOAdWKWp8dhdz/DARzcsVCkz/TCDIDqekAytFLp4iABgxY9N0mu+vPFMN7bMsUrKPKZcO3QDlvl8S5YJx8ewNiYdsHnYAs63aFbOlReluDVhomkMQWzoM4ZL35lDWfeeycqeivSfctYTAzZnfHaBSWiNghIXA7rmuQtRqkstL7jhNuu8fkvTVHfGZMl2aw1aZTD2PbOEZpTZkbbSB5w6sL+7g==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 13.93.42.39) smtp.rcpttodomain=synopsys.com smtp.mailfrom=topic.nl;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=topic.nl;
 dkim=fail (body hash did not verify) header.d=topic.nl; arc=fail (47)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=topic.nl; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=96MEUticLrazCzp1dIdXWraVO84m1qJ8Rr+feOegx0g=;
 b=HIdiLngVskTMq2Af3Uy9eQ3E6NcPmGOzGMJeYgbK2PAOErvNCGMj8ef/S4OHs1CVxcbwkR636TSLZcZok2T24KAnk1O/bobnW7vMRqiUNoFFyZgeLj5t3A1QbEp0mR5Gp6g4r2Trb/R/31cOPKkiWZ6Y5oYHjW5vQJ/BybeB76zyN6cZxL+8GZt7d3YThsWas+4hgwxsPc64Mjf7oGsR4LuV+55m70/HpVoZm8V5d3P+QycMZ9wzc7+qFLEIJfrFEeOiGd8VSMQ8eer6l4g5IpGcQHxyHfC4axil+dGnw/J8q0+bR1xzd1gQYLUPaVkc+OqJ47UG1oDUuidfkVkCFw==
Received: from DU2PR04CA0323.eurprd04.prod.outlook.com (2603:10a6:10:2b5::28)
 by DUZPR04MB10039.eurprd04.prod.outlook.com (2603:10a6:10:4d9::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.33; Fri, 7 Jun
 2024 06:10:08 +0000
Received: from DU6PEPF0000B61B.eurprd02.prod.outlook.com
 (2603:10a6:10:2b5:cafe::9c) by DU2PR04CA0323.outlook.office365.com
 (2603:10a6:10:2b5::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7656.21 via Frontend
 Transport; Fri, 7 Jun 2024 06:10:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 13.93.42.39)
 smtp.mailfrom=topic.nl; dkim=fail (body hash did not verify)
 header.d=topic.nl;dmarc=pass action=none header.from=topic.nl;
Received-SPF: Pass (protection.outlook.com: domain of topic.nl designates
 13.93.42.39 as permitted sender) receiver=protection.outlook.com;
 client-ip=13.93.42.39; helo=westeu12-emailsignatures-cloud.codetwo.com; pr=C
Received: from westeu12-emailsignatures-cloud.codetwo.com (13.93.42.39) by
 DU6PEPF0000B61B.mail.protection.outlook.com (10.167.8.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7633.15 via Frontend Transport; Fri, 7 Jun 2024 06:10:06 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (104.47.18.107) by westeu12-emailsignatures-cloud.codetwo.com with CodeTwo SMTP Server (TLS12) via SMTP; Fri, 07 Jun 2024 06:10:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T46+EB+9R/TqdDFPquh1JXTatrNveMhMbxj/9JLgutI/g8AfdxwCbffobx1N4CSNS1X7Q7kImUH97xuECJGZZGneoqPcl2n6PgaNavzHLQlHmlZKeXEeInASjupIOvLg/IM9cSurMCdUDf14YLGlu2X2z6wZo087DsxmoU7KBs8Ji68uwOXjR5LYVE3Nlzy5Pq28s12f45xDBJxk0O+LxSyY8ZUuibHw8NtQJbHdJo/Yh15fr72bDOw85uX9KZbv9illxNVHnyLfYJmmsLC2vaybZSQyXjftH/nFlQB4a56x09HYki43xIc4yK+NtobGQ+GpA6pNGkbqkCN/EPu4Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sKVPtFiuYMVRDTXXZ/ykXqCN6bc9FTLVLwDmjh6Ef4s=;
 b=KsOkb5ZixBFvc0rK8z9DCojmA0HEz65rz9qP9WjWXtzoD9AtdknFQxlzlQQCN7jYaGR/le3XdvTD3Wmzi+5/aKEN2necgkw9kanT+0NqQDfoaV7ALFMhfvKPbOhmz6QqTNe7Wc0z9HBH5s/PWji1cy8N0BabwQ8YP/Nh55PCV8YO5E4tF7o9mR8KX5hZKitRqOd/tIZzV+hmosLzeADXdUlzUjutXySrJYsQHz1YqlfM0aNab2e/G96DC0de/x2fvI+GGrAvROXuCnl/uj52/9/MQhvkFGYd3i7gVABnFExw1GocH1fOKDDHQgYOtG+osJDtQLhyyNW5DZFI/2bpXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=topic.nl; dmarc=pass action=none header.from=topic.nl;
 dkim=pass header.d=topic.nl; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=topic.nl; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sKVPtFiuYMVRDTXXZ/ykXqCN6bc9FTLVLwDmjh6Ef4s=;
 b=jGXSCQBbc5LtxJEZ/2BvbWDtWTNSB93R/NK0G8Nvy4WkCAuMrJUIkmDPynMqM2XBMC1zjbzQEP5oVYr7SlZ8t1h9V+TPYL2/6TGLYaVrnC5JwQgEHGGnMWhGLTBTJR3DSxSvOBxxHC+GnmcsenrDpKzMhm2KVV3LhvYshFtVO9N1v5a3n3bZAhCgwOcQajdtTeO4wrAI9MwzsdzVbw3mWkY+R8J9vIoU0M8PHGpjtjiYc6+Dc/T4UaXcdVkKtl6iaZ2MPZUJcKRqUe74mYyXbgMR4VP5ndIcsAF3AmfpjoaMmF1LpOTy8P05/5RxqbcQ4FyHfSmsGEnLMy53VE5YLw==
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=topic.nl;
Received: from AS8PR04MB8644.eurprd04.prod.outlook.com (2603:10a6:20b:42b::12)
 by AM0PR04MB6930.eurprd04.prod.outlook.com (2603:10a6:208:186::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.34; Fri, 7 Jun
 2024 06:10:03 +0000
Received: from AS8PR04MB8644.eurprd04.prod.outlook.com
 ([fe80::e86d:f110:534e:480a]) by AS8PR04MB8644.eurprd04.prod.outlook.com
 ([fe80::e86d:f110:534e:480a%6]) with mapi id 15.20.7633.033; Fri, 7 Jun 2024
 06:10:03 +0000
Content-Type: multipart/mixed;
	boundary="------------ry6TehtcOoM0NrVhYMZ0lw9F"
Message-ID: <a630f365-7a7b-46e9-b5a4-9b150f31d74f@topic.nl>
Date: Fri, 7 Jun 2024 08:10:02 +0200
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
Content-Language: en-US, nl
Organization: Topic
In-Reply-To: <20240606202127.6gdk6v3jevrmoyzk@synopsys.com>
X-ClientProxiedBy: AS4PR10CA0025.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d8::14) To AS8PR04MB8644.eurprd04.prod.outlook.com
 (2603:10a6:20b:42b::12)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	AS8PR04MB8644:EE_|AM0PR04MB6930:EE_|DU6PEPF0000B61B:EE_|DUZPR04MB10039:EE_
X-MS-Office365-Filtering-Correlation-Id: 883f186a-27ff-4ff6-a578-08dc86b87a6e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230031|1800799015|52116005|376005|366007|38350700005;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?/2d9DAKKlu/JWJPhOxrkDvJMaMF6rR9B2jZh4TATh6CLTQXWSuAFTeeGw4iJ?=
 =?us-ascii?Q?qrG5y2muguKdjrZyIhNOvCeifnYcnMmD112ZDSNmDH7M5pYaQ1KnIRs/p//9?=
 =?us-ascii?Q?AVQvALHjZupvrEOAShY4TVpiPVq8LZpmTCrRFMOY8rybtZsi1Jx4Ju4Xw8cp?=
 =?us-ascii?Q?yUVkhyTVgNrd3Azd30sL1iZ5P0kKdIuh6MmhLvQkgRgL0vhbD5glxPJM1zqF?=
 =?us-ascii?Q?QFjC/giUcKtNsb1GhjHgsmeJcpivPAR8oBAoCuNwQPPj4rJ8nkaD8TMflwIk?=
 =?us-ascii?Q?Qqf7+BPL1BtVvg/BV7E7yPeMukhp0VQ5DemAwcIoAwdJ5XlEFhv7/M2fx5P/?=
 =?us-ascii?Q?D9jezCw/7gJelItCUmABEzW8HdawifOJfsteoJS4CJ57VXo9Gr9LqUaBYbV4?=
 =?us-ascii?Q?jzoIA8nKRALVIaPqL4MjWeKZknMNiGAPuvXouHkwS+Bw7orIfXgSDoVUPxqU?=
 =?us-ascii?Q?rpVOi9EK4ESE6Uzq3nq45SaGd3vna1cfZtxR6ZAQWxoB5DOA2L6MlRKZK426?=
 =?us-ascii?Q?4vEBd8L555tWwT9Kd4dMoA/XTPZVy73S8eXWpq3rKzpEwKbj81YO9052jkkE?=
 =?us-ascii?Q?819+HAqn1/eJKuQPCDy+x84Ibv2N3cQaFB21EAVTuFqVrxzVBNQkPbFNNuoV?=
 =?us-ascii?Q?DqpfrqwfI9MmMCrvH5829rYZP8ch1XJZMuKXHadQVlQNl1hWRtksErXKbIUW?=
 =?us-ascii?Q?qwlXDLDXAVVUuj2RMzlACap/WPEF5IHUWEf6tjmitm/zykVcf5+MBAoeONvo?=
 =?us-ascii?Q?OtFMIWq33NUIiP8TtFdsn/n/S5zf4lYztSooOVuDV9RiD75cIQILyv/OOJ0p?=
 =?us-ascii?Q?A2w75ASJgH3DAtNLIh5zLVyrBCaUspFMFMIkF0DhRv5Iw15NkCkOVYwPWWwT?=
 =?us-ascii?Q?c3TKxqhLQ9VbYxNafVMWLcDS8mEvDb+c3+Twbu6rLfuXoYIxvSLXX0N6xxVx?=
 =?us-ascii?Q?buBrG/CzoRohNm3+4ZcBTLB1Bgw04D/+Vbv3DfCM/b8TBRt84iRQ6NYCWKHS?=
 =?us-ascii?Q?xaCPQnfQl0OcseCoTiFra9jnWaV5GDBHykASpfMweUT+BnK5RdNO4gfH/V1w?=
 =?us-ascii?Q?f+2loAbfBlXtlei4gYedg+QUbYeMJuMZzvXs1yPNNrnXYz3D/OmJi1l3cnWn?=
 =?us-ascii?Q?8AKKo/hl2+gP3lYaRUGfuAoNbO8TioYKVafhqHPW4zmWcl+oFxIEbSESk1a3?=
 =?us-ascii?Q?NyNXPu+M0N6isCwKfE0Zz2hA8UFG9skgoqWubN+LN9aciLmFyu8v3Yvueobd?=
 =?us-ascii?Q?pkj9KzARz/G+Ut7SpXzG?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8644.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(52116005)(376005)(366007)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6930
X-CodeTwo-MessageID: a50d9476-919b-41c7-9774-bfe55a1d9abf.20240607061005@westeu12-emailsignatures-cloud.codetwo.com
X-CodeTwoProcessed: true
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU6PEPF0000B61B.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	d0f2eb5a-9a33-4ad6-2eea-08dc86b8787a
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|82310400017|35042699013|1800799015|36860700004|376005;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NWUrMXZHdG9pejlqV0xmeVg0dytQNjcrWXpabnlGVjRBOXV0T0pjaGRJMndI?=
 =?utf-8?B?RVdKWGFhUGZFMTVTMmVSTVVpc1JWdWRsUXFvWDEyTkhQaFp2aVNtK0VVSFpI?=
 =?utf-8?B?cW50SWVDdnNEZjJab3AwenhQT2xWMDYzMUZXZUlscjNEZ2kwb2Y2UTVPb0I4?=
 =?utf-8?B?L3YzSEt3K09ZQ0pTenJUWUVLSVd6bkE1eU9DNFR6M21UWWVnNmx2Zm00YWM3?=
 =?utf-8?B?OEc1dlVia090aUVic2xxbWtMaFd3OVRvZWlzR0MzU3U2MThFSUZ0S3BsaGdX?=
 =?utf-8?B?aitKRXN4Rkw2QjM0UDBtUDBJRTlnM0JOaG4rWmJ6Wit1bkJXN2ZHVncyZ1Zx?=
 =?utf-8?B?cXdtaHJteW04R1FDSVFhUjRObXF6d1RoOUF5V0lmNjBkSWJtSVY4My83ZitZ?=
 =?utf-8?B?OEdXU3VxQXZOamZ0eEtVbWRwb0RrRDgrZlhTNFkxYkZBTmU0TG5mVnhRM3dz?=
 =?utf-8?B?MnFZS21LQWtFc3dyM1FSdlVGSzVMeU1sU01NL3pPQm5ZL3YwenVRNmVUeUtT?=
 =?utf-8?B?RkNYSi9uemtENUdlYUNxZ2J6Q1NSbXplUzNvamZPR2s5NG5MTUpNRjllbllm?=
 =?utf-8?B?dVppYkZ1Y05LOW9KRk00VWhvLzFtZEoyNCtyN0FaWXVwWm9nSmlETVU5b3lZ?=
 =?utf-8?B?TkphNUZVYkM5MXR5RW5jVHE1TzBWYXZoTGdmMHlybnZ4VDdnM1Q3Ym5JVG00?=
 =?utf-8?B?MEU2MHFOT0U1ejNtaE11aGM5Y1ZPSWoxN3pRV1owOTZ4RWVrbzNTdThuLzlG?=
 =?utf-8?B?Tjh4SE1aa1ZyOHoyM0ljTVhNM2xDbEZVMnBxL2t4dDk3dTNJVlBhbzk2UXhL?=
 =?utf-8?B?NmNVb0d0Q0h4WkloNjl4MVExWmxTTnJPQm1EN3FrdGp1QXQ0OU5OdVAvek9n?=
 =?utf-8?B?NUhlMFhIbU5rN1pIeWRrOUc4VzIyWVEzaS9laC9jUnRwV0lqN1lFTnZzZHhE?=
 =?utf-8?B?V0FUVEswZlB1eHc0YWFXclJqUld0bjl2VktZYXZRNXFUSE5YOU1oZzdnWTBB?=
 =?utf-8?B?cHpHOFN1cWcxUGJZUndCNHNGRFRKTUtnSnFEdGhtQmFpUzQ3emZuZTZqRVZm?=
 =?utf-8?B?YjhkVWtmd2JocWk3VnU3Mm1LVyt0VXcwYnl6M0lHYnJuQTlyT2NRZHYxb2k5?=
 =?utf-8?B?WXVwUzBWOTFHdXcrSjRUem53U0xldnNOU0xlUDlLMzdCSFllWUZLQm54aWhQ?=
 =?utf-8?B?eWRxY2JSSmsranBkOVlFT0VRYlltVTJGRnFUWHJGM1BlbmZjYVVvc1d2NVVq?=
 =?utf-8?B?WjI5UW1nTEd1ZXQwZzJZSHpTdGpNdDNDandUSk03cXUySndGUW5FZVRaZUd4?=
 =?utf-8?B?SG1kUTRBdmFlTzRUNDFOL3NPcEw1UnJ1WGdTMWYvd0tEU3pEcCsxNDhpMUR2?=
 =?utf-8?B?UDllcTZRU0dqdC9OdmUxQ2ZHd283RXIvTDNqR3lVZERuU2Z2SEY0TzJhTkx4?=
 =?utf-8?B?WWFEVm0xNjRBcmFENmROSUs1QnRDaGhxaWF2Rmw2Rk1HQzZieEszK2lJWlN5?=
 =?utf-8?B?RzlOSDJFcG9iQjcvankvZnFmSTFKMTEzQVhsOGFlS0thOTVGRGVjTVBybXpt?=
 =?utf-8?B?UWt0ZVg1WVRwN0pIVElWL1ZWRUZKS1lFTVdyNTh1SnhDaUZETHJLTDFpdEdB?=
 =?utf-8?B?NjcwZlRUYnRxeDdIelJvZFVNZ25CQ0U4c0k4UmlreG1ET2l1dTRZQU1ibHJq?=
 =?utf-8?B?TUwzRGlYRGphY3d5WHBIL210QUZuWGZOSmFpMjZWTE41dmVDUGl2Y2svYVBB?=
 =?utf-8?Q?3wGl2Hzyv2baNl8ZDw=3D?=
X-Forefront-Antispam-Report:
	CIP:13.93.42.39;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:westeu12-emailsignatures-cloud.codetwo.com;PTR:westeu12-emailsignatures-cloud.codetwo.com;CAT:NONE;SFS:(13230031)(82310400017)(35042699013)(1800799015)(36860700004)(376005);DIR:OUT;SFP:1102;
X-OriginatorOrg: topic.nl
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2024 06:10:06.5475
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 883f186a-27ff-4ff6-a578-08dc86b87a6e
X-MS-Exchange-CrossTenant-Id: 449607a5-3517-482d-8d16-41dd868cbda3
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=449607a5-3517-482d-8d16-41dd868cbda3;Ip=[13.93.42.39];Helo=[westeu12-emailsignatures-cloud.codetwo.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU6PEPF0000B61B.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB10039

--------------ry6TehtcOoM0NrVhYMZ0lw9F
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

On 06-06-2024 22:21, Thinh Nguyen wrote:
> On Thu, Jun 06, 2024, Mike Looijmans wrote:
>> On 06-06-2024 02:28, Thinh Nguyen wrote:
>>> On Wed, Jun 05, 2024, Mike Looijmans wrote:
>>>> On 05-06-2024 01:06, Thinh Nguyen wrote:
>>>>> Hi,
>>>>>
>>>>> On Tue, Jun 04, 2024, Mike Looijmans wrote:
>>>>>> On 04-06-2024 03:03, Thinh Nguyen wrote:
>>>>>>> Hi,
>>>>>>>
>>>>>>> On Mon, Jun 03, 2024, Mike Looijmans wrote:
>>>>>>>> When disconnecting the USB cable on an LS1028 device, nothing happ=
ens
>>>>>>>> in userspace, which keeps thinking everything is still up and runn=
ing.
>>>>>>>> Turns out that the DWC3 controller only sends DWC3_DEVICE_EVENT_SU=
SPEND
>>>>>>>> in that case, and not a DWC3_DEVICE_EVENT_DISCONNECT as one would
>>>>>>>> expect. As a result, sysfs attribute "state" remains "configured"
>>>>>>>> until something resets it.
>>>>>>>>
>>>>>>>> Forward the "suspended" state to sysfs, so that the "state" at lea=
st
>>>>>>>> changes into "suspended" when one removes the cable, and hence als=
o
>>>>>>>> matches the gadget's state when really suspended.
>>>>>>> On disconnection, did you see disconnect interrupt? If so, it shoul=
d
>>>>>>> transition to USB_STATE_NOATTACHED. This change doesn't seem to dir=
ectly
>>>>>>> address your issue. Can you provide the driver tracepoints?
>>>>>> The device doesn't issue a disconnect event, I didn't have tracing e=
nabled
>>>>>> in the kernel but added some dev_info() calls to determine what was =
going
>>>>>> on. Added this to dwc3_process_event_entry():
>>>>>>
>>>>>> dev_info(dwc->dev, "event: 0x%x type=3D0x%x", event->raw, event->typ=
e.type);
>>>>>>
>>>>>> When disconnecting the cable from the host, I see this:
>>>>>>
>>>>>> [=C2=A0=C2=A0 50.841411] dwc3 3110000.usb: event: 0x6084 type=3D0x42
>>>>>> [=C2=A0=C2=A0 50.841457] dwc3 3110000.usb: event: 0x4086 type=3D0x43
>>>>>> [=C2=A0=C2=A0 50.841494] dwc3 3110000.usb: event: 0x6084 type=3D0x42
>>>>>> [=C2=A0=C2=A0 50.841534] dwc3 3110000.usb: event: 0x4086 type=3D0x43
>>>>>> [=C2=A0=C2=A0 50.841571] dwc3 3110000.usb: event: 0x4086 type=3D0x43
>>>>>> [=C2=A0=C2=A0 52.650990] dwc3 3110000.usb: event: 0x30601 type=3D0x0
>>>>>>
>>>>>> The "0x4086" and "0x6084" messages are endpoint events that occur al=
l the
>>>>>> time while connected. The last event is the "suspend" one. After tha=
t, total
>>>>>> silence.
>>>>>>
>>>>>> If you need traces, please point me to a description on how to obtai=
n them.
>>>>>>
>>>>>>
>>>>> Let me know if you run into issues following this instructions to
>>>>> capture the tracepoints:
>>>>> https://urldefense.com/v3/__https://docs.kernel.org/driver-api/usb/dw=
c3.html*required-information__;Iw!!A4F2R9G_pg!bahfjil5HEUq-fOHAwDfusutLJCLo=
gnfyLHTFLiSlVuZotpr99XBGg7nB0zRRnNF_M1pqEKcVa4KxNJwh3_F2dZWwVKTkUY$
>>>> I've attached the traces as a tarball. Hope it survives.
>>> Got them. Thanks.
>>>
>>>> At the start, the USB is up and running (and doing ethernet+mass stora=
ge). I
>>>> saved the trace after pulling the USB cable.
>>>>
>>>   From the capture, we can see that there's no system suspend, so there=
's
>>> no soft-disconnect.
>>>
>>> Base on the suspend event, you're running in usb2 speed (ignore the
>>> incorrect U3 state, should be L2):
>>>
>>> 	irq/94-dwc3-631     [000] D..1.   149.139290: dwc3_event: event (00030=
601): Suspend [U3]
>>>
>>> The DSTS from the regdump indicated that you're still in L2 despite
>>> disconnected. Looks like the phy was unable to detect and wakeup from
>>> the disconnection to notify the controller.
>>>
>>> Can you experiment with setting "snps,dis_u2_susphy_quirk" to disable
>>> usb2 phy suspend.
>> Adding snps,dis_u2_susphy_quirk doesn't make a difference, behavior is
>> identical.
>>
>>
>>> Does your device support SuperSpeed? If so, do you observe the same
>>> behavior while operating in SuperSpeed?
>> Just checked, still connects with superspeed. What led you to think it w=
as
>> only high speed?
>>
> Bit(4) of event info (0003) from device event value (00030601) indicates
> usb2 speed.
>
> Register DSTS field 2:0 indicates fullspeed. Even though this was
> captured after disconnection, the linkstate did not change, which led me
> to think that the connected speed did not change to Es.Disable either.
>
>> Do you want me to send new traces?
>>
> Can you also try to disable usb3 phy suspend with
> "snps,dis_u3_susphy_quirk" if you think it's connected in SuperSpeed?

Added this to the devicetree, but also no change in behavior.


> Please capture the traces again if it's operating in SuperSpeed.

I've attached new traces. Connected at superspeed (host reports=20
"superspeed" in its dmesg log, and the real data transfer speed is way=20
above highspeed)

I added register dumps before and after the disconnect.


--=20
Mike Looijmans




--------------ry6TehtcOoM0NrVhYMZ0lw9F
Content-Type: application/gzip; name="dwc3-trace.tar.gz"
Content-Disposition: attachment; filename="dwc3-trace.tar.gz"
Content-Transfer-Encoding: base64

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
/yPL2/6f9mqv9mqv9nqj639RPQY8AIwAAA==

--------------ry6TehtcOoM0NrVhYMZ0lw9F--

