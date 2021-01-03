Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 945742E8B58
	for <lists+linux-usb@lfdr.de>; Sun,  3 Jan 2021 09:20:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726210AbhACIUF (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 3 Jan 2021 03:20:05 -0500
Received: from mail-mw2nam10on2046.outbound.protection.outlook.com ([40.107.94.46]:48160
        "EHLO NAM10-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725829AbhACIUF (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sun, 3 Jan 2021 03:20:05 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YiNg5LUeWXW5EZclSt+MKqw9tgY4FRL4kVxxMcLvctm38R/OMkWMKl8mHG/NR6xMUwVC7PObp5a99WrJMob5tIapK6YbhW1WPBqv8xKy9QIg7XjtTPjbR0WaRmJDIsSqAvL8OcnmqjbKlit1qYp9lH1MVzOwI465NJQO0ZE4PvbejtT87EwWkPUuAyADEh+i5Gn1KGtXBacXOa0UDwt77d7E1P1tad+59d5BJCXcZeLUivKbMbEnBURS1Kok1wtk5P2qozidm/5TJvEwWqToXKMknYbkSp8YGcMGK6sZ6hM3j6kt9BFgad3osA9DZEfcqm2CHQvI/ycZ7kDmlwmxtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YSVY1U7rFgfzx7KSaJc+0/aSQ7jeEBD4xxpWGVQygS8=;
 b=fcGkqGw5OxSzFaXdi80yBBiRvtUiJeOvvrnKAjuIMbpR5dQhmMc8m1QbgJ857XN9IpS2jVxvH8UbHzx4z/kP4KpaTJ5RGWVRlbITohdw8EscHBCdlhEdotRRm/KOLkWRzv5B0svP8Ore9Qp0PwBL/iQJu8zzf15nGSiRSeECK/OLWX3UwrvKkERvEWcgdTC1OBGGnOgjIuIdYweixWrvSRGPyp3eLwhu/qaYSMzYXC+u0asrZfxOGasNOw40dhscJh+tXi4t6rxJGPRA7D54e2lq1BVqgsp87Jb3V9l/ZB2Fsc4VwHYw4vSMNC75LAxOBC6mC+6h6/vUZ0s868yWqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YSVY1U7rFgfzx7KSaJc+0/aSQ7jeEBD4xxpWGVQygS8=;
 b=qUfyBeHzMI1OcxjVUijBXDYVX3RUGq7IwR14Iv/FAO+N5rKu9WFzAUYFvw1E6rqpGg9wnU8q3oAUnx2iP0OLlXUL8St3nABW1Gt3IludHMVk71RtavJ2ez4JpSbKBp4/QI/0wi0Sq+mstI94PfF3GU5ThXEwns/R8HDo/ouWcn8=
Authentication-Results: linuxfoundation.org; dkim=none (message not signed)
 header.d=none;linuxfoundation.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BYAPR11MB2632.namprd11.prod.outlook.com (2603:10b6:a02:c4::17)
 by BYAPR11MB2903.namprd11.prod.outlook.com (2603:10b6:a03:89::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3721.23; Sun, 3 Jan
 2021 08:19:15 +0000
Received: from BYAPR11MB2632.namprd11.prod.outlook.com
 ([fe80::94a4:4e15:ab64:5006]) by BYAPR11MB2632.namprd11.prod.outlook.com
 ([fe80::94a4:4e15:ab64:5006%5]) with mapi id 15.20.3700.031; Sun, 3 Jan 2021
 08:19:15 +0000
From:   qiang.zhang@windriver.com
To:     gregkh@linuxfoundation.org
Cc:     stern@rowland.harvard.edu, linux-usb@vger.kernel.org
Subject: [PATCH] USB: add __get_free_pages() in hcd_buffer_alloc function
Date:   Sun,  3 Jan 2021 16:19:02 +0800
Message-Id: <20210103081902.2381-1-qiang.zhang@windriver.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HKAPR03CA0014.apcprd03.prod.outlook.com
 (2603:1096:203:c8::19) To BYAPR11MB2632.namprd11.prod.outlook.com
 (2603:10b6:a02:c4::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-qzhang2-d1.wrs.com (60.247.85.82) by HKAPR03CA0014.apcprd03.prod.outlook.com (2603:1096:203:c8::19) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.4 via Frontend Transport; Sun, 3 Jan 2021 08:19:13 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 92e0e070-3c74-4e9b-9e91-08d8afc04237
X-MS-TrafficTypeDiagnostic: BYAPR11MB2903:
X-Microsoft-Antispam-PRVS: <BYAPR11MB29035B8F9BD568BBACCBB2E0FFD30@BYAPR11MB2903.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2733;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NYhsCNdjVpcEx+6EJBlFqCWs7Oastaa7dS19KNAWZmYzq4Ds0CxqBFU+RecEwpaazk7qu44zhQqZ/h/7pSECmmL3bYm+D2JtwBxyEM3DCwabPG2cfswlUhTY+beHxqvCzu626s6wVSZtkz8TYYZ+CD66lxtPR34KweEHTOTECj2snkup05CI56gYVVLAW92wpKWUlUDRtBtpGq6oGqLsrhCNZRBeixiOqONpJGdS8KGFm8azcdzBbwFXoFL6UjnlIrrBZly1RBTL75zXdt+a/WfKurZaESn7+ElSArYd6vLpNV0poRZOya35NWvAgkI4F/iT4gEhg+EU7QJTsCJy6xdWP82yT2lTS8aQTz2kyH9QviJKzhLHtJuKrHN+zbEDaXCXByuh0/5D9Dg7qlggqA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB2632.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(136003)(376002)(396003)(39830400003)(346002)(83380400001)(956004)(66476007)(2616005)(36756003)(6916009)(16526019)(6486002)(4326008)(186003)(66946007)(5660300002)(316002)(8676002)(66556008)(6512007)(2906002)(86362001)(26005)(6666004)(6506007)(9686003)(478600001)(8936002)(1076003)(52116002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?jxfmTVNTGRuRJKG6WNTYlB9SwoE7Wk8+YaFUNkMkKu9JZwsPZDjLYe3XZWc/?=
 =?us-ascii?Q?5WDFxCc0g1Mo4aTbVkEHw1PRqjvL600izbE0b9wP8+9HYTd7xk9CGV/1VSqW?=
 =?us-ascii?Q?utymht/sOuphTnNMwnftb+zH8cdTZ90EMWBHFJgDuyg3grvoqdh7d/5KSSWj?=
 =?us-ascii?Q?9kISTpTpUKbcrs+lQ7kgb3m2Kh56PC0uBTXVc+UpuQRTVBzy/dp82cD5sEhQ?=
 =?us-ascii?Q?/BX9RmfAc2osmJJlLVMGFBWxQs7QZSksQQ6ASLrqDK6zo5bm7Xr52skA7lon?=
 =?us-ascii?Q?uSEA9FvIN6vV/ek4qkItAU2F3bcDFQbhhxaLVVtAu5zMv3AOmS0qTH4rRQdm?=
 =?us-ascii?Q?Favb/t96AnlMxEKQQ7DNyAulunsRtqtdjvr+CPKlwzjVQeistEtR55p8cGjZ?=
 =?us-ascii?Q?ZCqYxT2t6dDy/O/5j54hAq+NitfLpF74GsX3ek0zPgh3E7t8vRYHEKsMN1Qy?=
 =?us-ascii?Q?q5lrCVCFzzYRJeUGNZkhzm+qGzyeJ975vBrCGFLdrWdTnYpwjbDjoJBwotUD?=
 =?us-ascii?Q?8t/J276yM+eFTcz2m3hLiAcFkzXHks4aSVb4GZ9vgAf/weEDndUrdHO5byIP?=
 =?us-ascii?Q?g8/7J90G9zlGCYNMaPGn5jLWz9N8Jj1Iz7HlXy68iJBAUuAageiomx7PfYO+?=
 =?us-ascii?Q?Z25zGsY2wq23+1bnUj8sjxA66ncrXzNyOeSQ4+BRKtblNfTf2kSfRuIJUGPG?=
 =?us-ascii?Q?Sk0IZi6gCgIeqlNszR5Up0sjZUC4AglI2zAHGa8r1pHrYP0DlteCx6WeJjls?=
 =?us-ascii?Q?fZZwVOek/hDx0vUWxgBIIElF1O8Uwd71Qid10JO0azOmdHhV97pym5AKC2wC?=
 =?us-ascii?Q?aIQBpvMUFnqjMOuaR+CL054YouEuRSihhrU6dp5IG538Kl7wCF0/j4LAXOZm?=
 =?us-ascii?Q?N52Ys+d0K+k183YQDUVaekXjydrQyixDPCW2M1xOhHwfQs6nD04hnCWEGpKd?=
 =?us-ascii?Q?CcqrWU/mo9d3V5G+dKFw8xgAq9mDby0aatHBESLGsq4=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2632.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jan 2021 08:19:15.1498
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-Network-Message-Id: 92e0e070-3c74-4e9b-9e91-08d8afc04237
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uq5+DrdKDetytq+XzqZya1NjjqCXpZa3OnUnPq8aS8MZwnNt7HqJVx3j50DpSvBJHt+tqEkFSQ4vqExRHSShq/eKbvzOHJbydFzz9S0DH1U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2903
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Zqiang <qiang.zhang@windriver.com>

When USB hosts just use PIO, allocate memory by slab/slub
memory manager, if the required memory size is larger than
one or more page sizes, need allocate memory directly from
buddy systems.

Signed-off-by: Zqiang <qiang.zhang@windriver.com>
---
 drivers/usb/core/buffer.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/core/buffer.c b/drivers/usb/core/buffer.c
index fbb087b728dc..28e7db9f93d5 100644
--- a/drivers/usb/core/buffer.c
+++ b/drivers/usb/core/buffer.c
@@ -131,7 +131,8 @@ void *hcd_buffer_alloc(
 	/* some USB hosts just use PIO */
 	if (!hcd_uses_dma(hcd)) {
 		*dma = ~(dma_addr_t) 0;
-		return kmalloc(size, mem_flags);
+		return size < PAGE_SIZE ? kmalloc(size, mem_flags)
+					: __get_free_pages(mem_flags, get_order(size));
 	}
 
 	for (i = 0; i < HCD_BUFFER_POOLS; i++) {
@@ -160,8 +161,8 @@ void hcd_buffer_free(
 	}
 
 	if (!hcd_uses_dma(hcd)) {
-		kfree(addr);
-		return;
+		return size < PAGE_SIZE ? kfree(addr)
+					: free_pages(addr, get_order(size));
 	}
 
 	for (i = 0; i < HCD_BUFFER_POOLS; i++) {
-- 
2.17.1

