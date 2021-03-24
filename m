Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DA6053470DF
	for <lists+linux-usb@lfdr.de>; Wed, 24 Mar 2021 06:32:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235243AbhCXFcS (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 24 Mar 2021 01:32:18 -0400
Received: from mail-eopbgr00061.outbound.protection.outlook.com ([40.107.0.61]:53504
        "EHLO EUR02-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S235241AbhCXFcL (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 24 Mar 2021 01:32:11 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GZQcZVUEbejsmS5mZU+cI+Dvi3aSE5eSmRt2Fc+uc66lfjy6Nq27ttwPijRn831XQzMRRMDb7zGzM6a/YZvigxFLgLY0S4BFLkBBhHwNmkBbsDrKUdt0mKY6CyJvVvZo1lS54t0Fj8B4WyiBEgCaoB6ZTX8RO4LBt/tekXb7kajxFc4vS6GLyEqLm5KY0Q0i9iazMpBFXmBJktk8JvS6byU/OZHUWBLgpQbj7gVaD0eqAx5Y/FUOJPQuOUjZYUIVCCn3X1oOejsdp+L4MHRiH1CfsMdWEr9Ub8R1/zJDS+Y43O7gsYT/ZdSux4QvJ1By0EpXTmldH+bLxzUMW8fOjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N4MG7vkFeg1EDqLutZ6OqlwJ9xjyzSNF70hX/MFeLDo=;
 b=XlDEjziPie8iQtOBbMS/fMT9EajRG+sKefLNYwLY2+Wn4Wh6b7qsFTuJIW2LdUv7O6Gi04zd4+tI7ib+fbP4sRzj5c9Cx1zIUitG8GcLOnsQF0KOHgPUDNr6c/kGvJ6bxdWmrUS4M1XOSHDIOf2bZfSM24+Gd3N7WL73wCGUcLLfOG5EHHkzPI9YjEZ+m3F4ZVNZe2GN60EByIMkhgsT9rx5TLOAZZug5jKi5Gx6AevCGSdDo9sSTwjUGUBl/FL9ZmZIZ/U+g1I9omCT5UKY7E+vD3Uf7bpT/Ks7TdqQqm7pkmSDBMgBKGQj54AcNCqzz+NJVgE8SpWPsASeXli/aQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N4MG7vkFeg1EDqLutZ6OqlwJ9xjyzSNF70hX/MFeLDo=;
 b=TMrV8sZRUeHNAsbRgK5/FWMSNafjEx9DDvhkg4tYCVN1xYDXe5DZ3O5HalVFEiUXkYoTKU/CvVH4NR59rcaUqwLK8E0Y4GCA3KuRR9kYiLqPJsagDl0denSxTjGcSh5fEcd0tYWdCkkupiVEuL+Zh54Y62xMpn8gniF7bs8UGZc=
Authentication-Results: linuxfoundation.org; dkim=none (message not signed)
 header.d=none;linuxfoundation.org; dmarc=none action=none
 header.from=nxp.com;
Received: from VI1PR04MB5935.eurprd04.prod.outlook.com (2603:10a6:803:e9::17)
 by VI1PR04MB6784.eurprd04.prod.outlook.com (2603:10a6:803:13e::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Wed, 24 Mar
 2021 05:32:08 +0000
Received: from VI1PR04MB5935.eurprd04.prod.outlook.com
 ([fe80::801f:563a:65e:8d12]) by VI1PR04MB5935.eurprd04.prod.outlook.com
 ([fe80::801f:563a:65e:8d12%6]) with mapi id 15.20.3955.027; Wed, 24 Mar 2021
 05:32:08 +0000
From:   Li Jun <jun.li@nxp.com>
To:     gregkh@linuxfoundation.org, balbi@kernel.org
Cc:     linux-usb@vger.kernel.org, jun.li@nxp.com
Subject: [PATCH v2] usb: dwc3: core: don't enable wakeup for runtime PM
Date:   Wed, 24 Mar 2021 13:18:25 +0800
Message-Id: <1616563105-28565-1-git-send-email-jun.li@nxp.com>
X-Mailer: git-send-email 2.7.4
Content-Type: text/plain
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: HK2PR02CA0167.apcprd02.prod.outlook.com
 (2603:1096:201:1f::27) To VI1PR04MB5935.eurprd04.prod.outlook.com
 (2603:10a6:803:e9::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by HK2PR02CA0167.apcprd02.prod.outlook.com (2603:1096:201:1f::27) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3977.25 via Frontend Transport; Wed, 24 Mar 2021 05:32:06 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 880e853c-a954-47d9-a621-08d8ee862ab2
X-MS-TrafficTypeDiagnostic: VI1PR04MB6784:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB6784A92D0C6E4AB9CA284F4489639@VI1PR04MB6784.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jnGu9tb29QCaWHm7/oiCCYBzTEJ0nUZ+6zgwTTgJ6jycPtQTbtWjhQtyGm/XfuZPWLbPuFwIsfR98RoG8JMw2xo2RctvzD2OtA9C12m8zEF6zI3wpFdQGVC/1Bk264vGfZ0NJA8qLvEtnxCc8eb0ClgmuLWmJ25GerkBUJmDHENofZ4JLbpScrpQm4STM6ROR83P+yfF+w9hC8eSsc02fM8fHg3uxE9X6KJ44/cF7Q2M1E7EKXtExvkV2cYVlcfBirDqSmNeCegTJ15eUhDFyZh1ah7RHcMojsd2PelXmEHpNhsNRC1Ofh1ZREBLC25nUQ1yvqYBZWHfpGWidVHvFPVbNIhYqvWgddum8VHRGhSsU816cHff2uyr+mSbldrD3cK6smW/1XcsdGBG+snA1jM9mKk0NugnaIVPtrIskNLtYRVulhIR2hkpkxO/3Ro0h4nu8/kI+kGgtc+jFMlCalQ5rRAvD8bCbr62bLbF09jhhODwO7GaoNYgMyl8WHMpGOI+MDAOX4NpZoCcFBiZH7Ri56FGnXaYt7siYdzMz9/r6qG1cbt17d4lz+T7EQT6X1ARBjnvJdkTXKmT0wXLoHIEowA0259rfsdOCcDGVdS2W196+nTIaetsSGJqDJrz1gBOwGT8dvaON4qpN1dpvFyXhNbOxRBqPnX6RiN3x3kt4+TVyPRy16m2wyb6qQ4w
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5935.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(396003)(136003)(39860400002)(346002)(376002)(2906002)(83380400001)(66556008)(478600001)(52116002)(66476007)(66946007)(4326008)(5660300002)(6486002)(16526019)(316002)(8676002)(8936002)(6512007)(36756003)(186003)(6666004)(956004)(38100700001)(6506007)(26005)(2616005)(86362001)(69590400012);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?B3pvzIHes9h+2GyXdY2oNgd+KCbbv/0mrlY8ISbyrwzqZ4oGYAHcmPevj1If?=
 =?us-ascii?Q?9K9+uGjRZy1EaGYh9UCGwbpT8RQMrL+SXEPkMhDv69n2clX73G1vuWdJWIr/?=
 =?us-ascii?Q?/uyzOZJ2PNUqvX6Ipcd9pqsq+4LAtUcWWYG+9vbc0ZeJDo7CMEJ1WpKuS7CF?=
 =?us-ascii?Q?ZreEHxeMiiClqirt4KI6aDCoyw40q2O+tcRylD2sCnbek7MkUNwOcSD0ZCdH?=
 =?us-ascii?Q?LhLwe5JSJ9YxI0jV8o2+H91zj7wnBInsDHTHP7e6qWkSps2gHjEZ8WFW+VeJ?=
 =?us-ascii?Q?SAWjsfDgB9KqIHzEGwdJ5IZZouW6Orb7cQCoVmQ1yKGBU5yms05ONc9vYqRu?=
 =?us-ascii?Q?fbnYZu8wSUHKcwYdKLpoGpFDEFt+/ksaOrM/PMwNrwLGzlvyLsHgl4mZqM41?=
 =?us-ascii?Q?alrvCzlDr++OSki+FagBLWgvgOJcMOcaU9PaY38UZHJf7kp/Vt2NpmASi8Ew?=
 =?us-ascii?Q?HzC5phHCcUoBxQoZ9PE2YU9dS/JvX90tFJ7r4esiLHpgVyh4xndOA8IIpos0?=
 =?us-ascii?Q?DM9p3Nr1G4g696Y0p81PIAoKEReuruJ+Jgj6lS/qZKnV39AQjuovQ1q9m+r5?=
 =?us-ascii?Q?tgroInwHKvoMI8Yc8wryMy7kIIJnNZl31PXB/OcJwoukRV60CKn+UEYoMyBT?=
 =?us-ascii?Q?psiPSuexf8GhExfKBi4LLzFk0tVfRQ9kEUEM175Q2lRoyjVyl0mKNFOk3YJp?=
 =?us-ascii?Q?pjtfkb3JJdPfYcO/fUhMXgFuQ5eX/gB7y1DGfnRDFkWkcjUTTlVaDvDMjBbR?=
 =?us-ascii?Q?XJdl6HnFHOAThRRunHC2+AAxoCztxfOe2Csr/seLX3Z9yCach0k/zv67g4fD?=
 =?us-ascii?Q?3xgoba03RiN3iXTQ4+fsGqa1+59vlMjUXdj19PsRGKzcoaADz2Tynfc6BJwy?=
 =?us-ascii?Q?bcQsQBrW3Ihl9kwSfR2NJsrSY3khAJt08K46CRax/Jyzx4EH5zy2TGPG5Up4?=
 =?us-ascii?Q?9X050AUj/6qt+2VYxB3H9T6XZ8cNt80/8rCwkeFiq11dfl7mK0r+fpsjpyNh?=
 =?us-ascii?Q?2mJNIc47GQ5xsAKwQZ5uxRdUhNUG1jUxeLaCsL7q1NF4ijh15UV3IaoQsT/A?=
 =?us-ascii?Q?dQXVezdjqf/jnL4FaPMuOtx23MW/w7pvlmKkp7qUGCVtqEnPT6g+ZdNijSEO?=
 =?us-ascii?Q?y2uXY+PyDHi3a/BrFu0NvO4C+u5cBw1BD48AXT77Cknnr1zF5rMwVgH/1Gzb?=
 =?us-ascii?Q?nIar+AhLSACL3AoqFJnkSyakFdEAklibB10uo9idWbliJEHTR4vfaU03FuVu?=
 =?us-ascii?Q?4nfq1GMGvO61hbZp94voVmn+lSeGa239Fo2pZxqbszMLglRfzvoO6k5Rueqa?=
 =?us-ascii?Q?h5zRC9A9gVD/TjaeRTU16F19?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 880e853c-a954-47d9-a621-08d8ee862ab2
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5935.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2021 05:32:08.6212
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qE4Sbz/B+w/FMq0crMs54Wqx0QlbOrpPaUkI3m8XcMRjePG3CQqj3nuapmF23mMr
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6784
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Don't enable dwc3 core to wakeup system by default if runtime suspended,
this will make the power domain of dwc3 core or its parent device can't be
off while system sleep even system wakeup by usb is not required.

Fixes: fc8bb91bc83e ("usb: dwc3: implement runtime PM")
Cc: <Stable@vger.kernel.org>
Signed-off-by: Li Jun <jun.li@nxp.com>
---
Change for v2:
- Add fix tag and cc to stable kernel.

 drivers/usb/dwc3/core.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index 94fdbe502ce9..0bba5c21de56 100644
--- a/drivers/usb/dwc3/core.c
+++ b/drivers/usb/dwc3/core.c
@@ -1840,8 +1840,6 @@ static int dwc3_runtime_suspend(struct device *dev)
 	if (ret)
 		return ret;
 
-	device_init_wakeup(dev, true);
-
 	return 0;
 }
 
@@ -1850,8 +1848,6 @@ static int dwc3_runtime_resume(struct device *dev)
 	struct dwc3     *dwc = dev_get_drvdata(dev);
 	int		ret;
 
-	device_init_wakeup(dev, false);
-
 	ret = dwc3_resume_common(dwc, PMSG_AUTO_RESUME);
 	if (ret)
 		return ret;
-- 
2.25.1

