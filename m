Return-Path: <linux-usb+bounces-14971-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DCBE6976029
	for <lists+linux-usb@lfdr.de>; Thu, 12 Sep 2024 06:51:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 43D121F23DC9
	for <lists+linux-usb@lfdr.de>; Thu, 12 Sep 2024 04:51:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DC3318890A;
	Thu, 12 Sep 2024 04:51:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="hedBN14S"
X-Original-To: linux-usb@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011019.outbound.protection.outlook.com [52.101.70.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 815FC187336
	for <linux-usb@vger.kernel.org>; Thu, 12 Sep 2024 04:50:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726116661; cv=fail; b=fgnBf0ITPrTCDkEZ4tbyVozhE3LjL3m2MBvakAuo2lHnDIfd39BR365MhG874h9PgY7E5a1m/CFLlMZOXZiOZaLaFbClDEHRU2WVGhk6S+gXUUceuaQhnAZx+dPGlYxZyw7rMik477svF1j/4s8yWXsEqC16er7HbiTK9s/wOn8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726116661; c=relaxed/simple;
	bh=64uaUdVB0PGjBAoReMNuUQ9/L0jOpiJWfNi94pxEDP0=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=h0fQ/QZp5iVh6CI25MCW2RIhmvu5g6HV8v1mp16M1Q9ZuZWs+T+QnX3KOSOmth+jSxnphdVpK0fbDQWr/xuukvv5iBHngYRQMhOPlR9t0CYuPMhGnGx6ve/Um56fL1qzaQrkfhqhpaxG2CAZBdmrzxDco3uRaKR4qO7SuVj1pLA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=hedBN14S; arc=fail smtp.client-ip=52.101.70.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A5HVhX1MVLkXVsIFUrKYEkppfnMT3MvPGftsXMtGmd/ZWmvIaChFXIZ1AT9vi6olYQKnOUHVC0BtEBxnHPt9JslQUKnRqavtWYor5l7ayN/uzn01YHIQAywzDIig00pY3Iy6cjnHBaASmm82yK6M/jD+floOXqkz3MrkyYDhV6tAr74UPune5gdHze7t8TKTn3ocitoUzC5/9r5uBTsSvXgxMTgIAVQmZsHtJDDWAEFYVxEpmzvpeZ/OvxmTE25UBLcGTzyY8SZ+sHjwWl6mlbaB4MZ7Eh0qFvQUaa0ZS35SrUjSKlpeR5JdDCYKvYyT4DbkTLF4+YIWhtvXM+l8zA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NgKeVrnM/D9m0PXw2zi20j3/tMJZDDc4aHy8DE64DX4=;
 b=Bj8NtCtp/wP7BtIhk/ke3N5kLYH6xWLhS4ZidoUsy+X9fLhmrxrGemqomEGPfiSmWXbGe7NQT+WErGFJ5FIP0Ellb+KMK8gkLNnkC1D6FmtHy0NoVpIu6NtYr9DYUX1rjZo40EAEAVyNFsot4gl2mx9PJ5wJNNu8FmauhwUuCCqSSKUdym0S5Q16dniviXqOmxUIbUFCh1zqDn386YFgq2VOwF4uTWu9ruGuFOVZNHSy69FTLJbUizCkp3I4JP67Z4tYPDjq3q0KuGOQmuT5edz1WqWLODO/+4+Ewo8bWZdZoWuhkZncE85g3VEurmZxCdXXW3JHNr0iSLoSvPAlYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NgKeVrnM/D9m0PXw2zi20j3/tMJZDDc4aHy8DE64DX4=;
 b=hedBN14S8g/mH5xxAzAmIZ3RhHqdnnZo4Ms+hoyts3L545e6BURRNkBB/0V5bfKmBAab7g+FidyUiuch51a3NuwTda+mxUMzsebYq7EgpN267Ib8QxZB03eKVz0nBJKu2+ibxcpsiFjodPHXgEdiGtSPqNpzggNmvvp8mH1pf3L7eY3DPDYEO8BZQ3xNry7kP2QOABdJMWHahuAguq32bkZEEBtgnxeEMDDIBzlbEFs/WtRoIRaJJ+a/PxzggN8v/z10VmWH6Vupp+vN7k0g7+aml3zRX/XzRpfnLyMBnoSYYpCtK9FBk8OBipiy1r/nUkxUyAc9qzTu4U4SjFKyyQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by AM9PR04MB8555.eurprd04.prod.outlook.com (2603:10a6:20b:436::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.27; Thu, 12 Sep
 2024 04:50:56 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%4]) with mapi id 15.20.7918.024; Thu, 12 Sep 2024
 04:50:55 +0000
From: Xu Yang <xu.yang_2@nxp.com>
To: peter.chen@kernel.org,
	gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	imx@lists.linux.dev,
	jun.li@nxp.com
Subject: [PATCH 1/2] usb: chipidea: udc: limit usb request length to max 16KB
Date: Thu, 12 Sep 2024 12:51:49 +0800
Message-Id: <20240912045150.915573-1-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR04CA0196.apcprd04.prod.outlook.com
 (2603:1096:4:14::34) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|AM9PR04MB8555:EE_
X-MS-Office365-Filtering-Correlation-Id: d7a6e1e6-13a6-43e0-90dd-08dcd2e67cb6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|1800799024|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?A3uFSBcA+nkVFQ3LpB2OIex1IYqcgwMI4IbYo4PagIRZkj1nTIv8/dg9XOwv?=
 =?us-ascii?Q?T97AIgm/7TzxecsdiJTqTY+8H32ktzkmfE41bYWoeOUhASKXMJ4IAACCNjcv?=
 =?us-ascii?Q?cCW2yJznIgmqBZdtYp8uRnmfcz32jkh/+fvoxIT+vaRE62bg10Xyj7RRjhgi?=
 =?us-ascii?Q?UTfXIPUp/Q63JlgOhRCfyoW3LFklbSKFG1N5Z+5qa4J0ajsg0b4wjC8mlCKc?=
 =?us-ascii?Q?EQ1fjdEfDH9f+8rNgYZQGFaMMU5foXToFtzGHxup4RJ6CRKq+F9gKOgvaBrH?=
 =?us-ascii?Q?hqwE62ABUOpJiMnuzy7bODNpaqmTcfg3j3shv3dbw1/rA2Ynzbq4IcI8pWwq?=
 =?us-ascii?Q?4eOnNMKvK6NdWYmeWNyl/oKIpwIGGDiY6m8Vmsls/q/zPh4E7BxxziUxH6Dj?=
 =?us-ascii?Q?BRL5tIAYecmsN9zkUEKvs0OJCIN5VQy2fdxv03YoinfBm1xhReeKlIBL88yt?=
 =?us-ascii?Q?DMnFR7+ks9ySHYA71RWNS5HzJE2/d6wlmWnGo7N+uQkUC2CEKLcKCTNo6uFj?=
 =?us-ascii?Q?FQDHy2YzwK/WGqVXCM2epQxLpZRAtrf0r9fzaBxl1749bhWZTGTXb5iUEpU8?=
 =?us-ascii?Q?Ay6ICCr0ihQ45VsI3HXd1Sr+pGINHEXukWwXXqs7s+I02yyXSnVEP2MPnXHw?=
 =?us-ascii?Q?3zuU+EcKLyeQngJRlLW/UYLDLCLQQ2axmXgLxk0X1RfzAunGqi8eXYDd5CXS?=
 =?us-ascii?Q?NoDkz6DoTH9vSqbSswUd/5qUza+lBiusrXi0KCHLr72ODw4sLmJzXH/p+V0D?=
 =?us-ascii?Q?y4ODjciRuqIiPDwOjFCM0Oi3Xy5A6uzDiTQNIVMIc+P4ZDESafCjHH3AHFj0?=
 =?us-ascii?Q?h+7Sk/Ejj4epA3aPpKjDjQEKGnWvcZA1w4ta7UYBLCRhbiMljiROn+V8GJIL?=
 =?us-ascii?Q?pZW+pgLf413adxGgqcI+CMlW7oZxEzh0V8KxeA5+lCWzc/GF6XBhQA+1+J2G?=
 =?us-ascii?Q?YIeQ3lNJ6kVDNbc1fqJOvxGwI/agqbCi4Yzzr8UwvYyi5XcdaP1hVs0yXTvv?=
 =?us-ascii?Q?evFJfh03CKtLrCCkNGJOCM3TefJb5iuF61wW34JncU9Hzed7IzmjA0CR1X5+?=
 =?us-ascii?Q?H1OAbAVkddg0ywKVKMyhblFedXcxFzAoXk/5E3W9rZMRnH6IzpzZIf0WkgtA?=
 =?us-ascii?Q?NL5AEQO+csyXCI1GQcP0nTOIcV3FEWqud2iVljtoTR/nDPttGTsMJ1yeE/zm?=
 =?us-ascii?Q?5AqUPgRdrC0uKZSTDFQ3eWtlscx5ehY81u3V7XVBGbRtiPEWrYBTi38gHv5d?=
 =?us-ascii?Q?9ybY5iaEw0C6rV355yxZq5cdeHIbvNguC9JivA3UijWWzCckX0gaEtJZqb8r?=
 =?us-ascii?Q?f0paEt6gKq7TPw8Fmf0xB/xIbMoXfdy+D8IkcIPKeHzhK4GcV6nRH6O5uuxU?=
 =?us-ascii?Q?95WWXGnXj33HseOqWqFVDPp5gmDBHJvdTz6lS5rHzSyzaLiAog=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(1800799024)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?78boesSlgA8Ove0IRp6Louk5Xr71jcuva417Hd7sJRkO9piuGolO1Qs700AQ?=
 =?us-ascii?Q?Iccy2tfJ+U7W+Er7wqpLbnQ+rgZT331wpGJ6Auanv75eATw0FIWZsHQewT8B?=
 =?us-ascii?Q?GGvEgLqHwOt4V3HKoKKLHyvgNKxNX3SN5qumSboyx8XFQsRyRONPcTvghi1S?=
 =?us-ascii?Q?GfRdqKzJrk1k/hgnnnHrxGS5dkwlB+dYH1F4tMIQjPcKt6yZ6hbUJxPu+VAX?=
 =?us-ascii?Q?mK+nKj8h0vF24jSYyx35jFkoyiFEsgKTUwRXDfPcVIzAjlVtwM9Gl85ogRmG?=
 =?us-ascii?Q?VKXbrED5R2PJ6xppQnOm/w7WNdLlvmRoRRAeK9YqHupwa0w3Wxsu55cToMCw?=
 =?us-ascii?Q?WmIl1Yrz3CcMkBqKmJrSud+fx6ZofeUk49JLvJVTGDFbCZKkzT/WiK+VHMoX?=
 =?us-ascii?Q?z4Hy6jLVYMTy03LRMqaZlB73CryRfV+ETVBL9A1Q60TpHWgkImv297pHmJgT?=
 =?us-ascii?Q?Gpi/kn2I5PymBa8kb5D73pET8DCM2yoQ/dsG8FSMb3ZSMfPY9qL5RM2NlJ1A?=
 =?us-ascii?Q?TmBRM0RRiIjDMa2M2ZTZSeFxy60P7DY7vWwe2dppZ9186XC2UtS7aAGpn/BI?=
 =?us-ascii?Q?nLAGzd6fXIb4nDNHZL+HX1JUKeYJ07EmsM9k052il/rf4pz1DiBgszlbvINZ?=
 =?us-ascii?Q?MRFzf06S2JugqWTD2TkfxZCKnfPoVpe3ZYrOQNMbmpEPdl/fscl7x4Gx/RZ3?=
 =?us-ascii?Q?IpFxV3YOq4smsbuduCHIla1eV67wAbmpTmqxJV7QgXQv9YZba+K13zUqU0HP?=
 =?us-ascii?Q?S0CQmpIjUoyNlVr9CDIv0j0FU5K9R6ActoY7KW0iY6gA42oip765alt1qWll?=
 =?us-ascii?Q?4EZbWwNXpyaYaWxs1/ycdUTB5Jk1YAQJiI8O9aIfuvrjFqHakjbBr5G1uVtb?=
 =?us-ascii?Q?1FxSNCdYfLVHOxgUeazPjDZxDG3NNQ2RTlD+KZrIIrsT6zVGpcJ9ikFOrPXs?=
 =?us-ascii?Q?F9LT+Ln8RCxoBuH/eE03s8kBXoxi6dpbgCbXiePSnleolXWrrUkawB801rAx?=
 =?us-ascii?Q?u34eCSKpRshXfguGha1/T824cPMUAbVm6sEP6Q9da5CljlUvylmpq5Akl8f7?=
 =?us-ascii?Q?4/eMXQVVy3rGVvb5MnLwX12VQnfpQJdlTCWThy4LQ7GsKjC8/HDPtVVfWbOM?=
 =?us-ascii?Q?6PyP5m8PmustX3ukhjcM8cZjLvCZ9J0MNNFQ+ss7oyrn4Nk8n+XuEVVbyCeB?=
 =?us-ascii?Q?DsOfu1xibkPtdGYURDb09W75mlIy3n5Unhwn3yThEEQPl573qwhLWu6WRrap?=
 =?us-ascii?Q?lHxUxIw4OsEbBKvnDKlDT2X1nY2y0ovMK+bk5XxvZ01bBV42aTFu3jiqdpc/?=
 =?us-ascii?Q?0zbVHk6AisRQcLolyMh6dyCL15bau4YvJ18URrVDCuCpiKl7zkXYA7QLr5WM?=
 =?us-ascii?Q?rZtzE1nOwW21QYnKdxgr459vrnRHqeesjfvRaTyt5DoLUOpfraAqI7kjuoVC?=
 =?us-ascii?Q?20zfVb9U7HaMPB/D+uWyWM/eYK8bs26/0OlGOrsgYevhj0c61fymzGY84c1E?=
 =?us-ascii?Q?X9p1udDydc4yAuAYpYrF3y5oxCBt/ay3pa/NCJxFFuCXel67NQrd7ARICl/A?=
 =?us-ascii?Q?rtbqtn2xIz/+2b/GHz8p6NjK1lKpLzlxYSuwVC1M?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d7a6e1e6-13a6-43e0-90dd-08dcd2e67cb6
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2024 04:50:55.9007
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kaQKQk00kT1wS6cSuvPtHSrvIsS/YnRHJYHik4CrM3rzs15Tpx2Gunvd/Z74vwTyttQF8eHjw280WRcFcqJVgw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8555

Currently, the deivice controller has below limitations:
1. can't generate short packet interrupt if IOC not set in dTD. So if one
   request span more than one dTDs and only the last dTD set IOC, the usb
   request will pending there if no more data comes.
2. the controller can't accurately deliver data to differtent usb requests
   in some cases due to short packet. For example: one usb request span 3
   dTDs, then if the controller received a short packet the next packet
   will go to 2nd dTD of current request rather than the first dTD of next
   request.

To let the device controller work properly, one usb request should only
correspond to one dTD. Then every dTD will set IOC. In theory, each dTD
support up to 20KB data transfer if the offset is 0. Due to we cannot
predetermine the offset, this will limit the usb request length to max
16KB. This should be fine since most of the user transfer data based on
this size policy.

Although these limitations found on OUT eps, we can put the request to IN
eps too, this will benefit the following patches.

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
---
 drivers/usb/chipidea/ci.h  | 1 +
 drivers/usb/chipidea/udc.c | 5 +++++
 2 files changed, 6 insertions(+)

diff --git a/drivers/usb/chipidea/ci.h b/drivers/usb/chipidea/ci.h
index 2a38e1eb6546..f8deccfc8713 100644
--- a/drivers/usb/chipidea/ci.h
+++ b/drivers/usb/chipidea/ci.h
@@ -25,6 +25,7 @@
 #define TD_PAGE_COUNT      5
 #define CI_HDRC_PAGE_SIZE  4096ul /* page size for TD's */
 #define ENDPT_MAX          32
+#define CI_MAX_REQ_SIZE	(4 * CI_HDRC_PAGE_SIZE)
 #define CI_MAX_BUF_SIZE	(TD_PAGE_COUNT * CI_HDRC_PAGE_SIZE)
 
 /******************************************************************************
diff --git a/drivers/usb/chipidea/udc.c b/drivers/usb/chipidea/udc.c
index b1a1be6439b6..5d9369d01065 100644
--- a/drivers/usb/chipidea/udc.c
+++ b/drivers/usb/chipidea/udc.c
@@ -969,6 +969,11 @@ static int _ep_queue(struct usb_ep *ep, struct usb_request *req,
 		return -EMSGSIZE;
 	}
 
+	if (hwreq->req.length > CI_MAX_REQ_SIZE) {
+		dev_err(hwep->ci->dev, "request length too big (max 16KB)\n");
+		return -EMSGSIZE;
+	}
+
 	/* first nuke then test link, e.g. previous status has not sent */
 	if (!list_empty(&hwreq->queue)) {
 		dev_err(hwep->ci->dev, "request already in queue\n");
-- 
2.34.1


