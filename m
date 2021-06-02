Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B6A3398614
	for <lists+linux-usb@lfdr.de>; Wed,  2 Jun 2021 12:14:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230462AbhFBKQi (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 2 Jun 2021 06:16:38 -0400
Received: from mail-eopbgr150073.outbound.protection.outlook.com ([40.107.15.73]:39907
        "EHLO EUR01-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229826AbhFBKQh (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 2 Jun 2021 06:16:37 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CdWNWRdlXy6CoM1/r3KGpKgQ1FZvgtRCtwQXZQ6Ns+sdFLax1KxnRng99xEhF0nwiW7zIeudPvFxC2SR86TINsDn6fyAFGcs7PdSV0qUo/Oa/fKOIaQ99PE6PolWB5GuXSdBGlE6dh8ecjJlqUhiSopKQulfvg6CsqxnX1zM3Mti1r2BQXKNUrH3WtnNgk6fAnHVU3PxpNrU2Lx/b/kMCUxFsA23jRZpwO2KbRGD+wvcubvSjpJycROXMFpx/OQIXpRDXOewGP6x2OHX4h+8QReYde6NMOE0GbcZZ+p3eWBO49lxhU4OkNq/uzem/6ho44835TtOXs6rNxowSaryNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qj18dUO7WAVehaZXJrkWq2qdrPaU4ZbMgp8N5FbACPM=;
 b=lhM1ZWWTdHZThxkLtB6XjpXO/bi3yV94KSUfX2PLfWmn9rRRHhSUpUIIwNFkI7tiC4hKa6muLcOPP/ZHnMmyGVbIMtG2652i7F9caUfhjWNzbGCHGXBjsVwDS9n5GwrfUyXyaKy6AYRx9zp4eHTI6lwtdna6zemAuV7aKb/R3FDe7D58ExwMq0FsJHnG784KdcGGIMkObdPt0Ip6UjtqfwxTeAxGWUUc7JTeOIjW0AZxM1lAdmzUOMn32dOr5B23fjYzn30NKOTj8YEhuaShxl475G+YdBi227DKC6v9UqY27M5l85scvzJG6oZ1aCuc4lHP8qUeFySZMQJ5eT+8oA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qj18dUO7WAVehaZXJrkWq2qdrPaU4ZbMgp8N5FbACPM=;
 b=GmT7fQcrTOba5ySzPnNpQyURRcutMq8llVJyYvzmo6Qi3SXtk4v8/nU7locRZvSFtye7mZjzuJMTJKAuwJu4rWBKPTKQ0Wtc+f3p3JA/gcuf1+Ghtu7JD6gE6JWv7URIp0/etHN3s1dIXQSFHLQBD0FpzNUfz/W/BuBfOna5knA=
Authentication-Results: roeck-us.net; dkim=none (message not signed)
 header.d=none;roeck-us.net; dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB5935.eurprd04.prod.outlook.com (2603:10a6:803:e9::17)
 by VE1PR04MB7357.eurprd04.prod.outlook.com (2603:10a6:800:1ae::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.21; Wed, 2 Jun
 2021 10:14:53 +0000
Received: from VI1PR04MB5935.eurprd04.prod.outlook.com
 ([fe80::453c:f24d:af8e:f194]) by VI1PR04MB5935.eurprd04.prod.outlook.com
 ([fe80::453c:f24d:af8e:f194%7]) with mapi id 15.20.4195.020; Wed, 2 Jun 2021
 10:14:53 +0000
From:   Li Jun <jun.li@nxp.com>
To:     linux@roeck-us.net, heikki.krogerus@linux.intel.com
Cc:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org
Subject: [PATCH 2/3] usb: typec: tcpm: cancel frs hrtimer when unregister tcpm port
Date:   Wed,  2 Jun 2021 17:57:08 +0800
Message-Id: <1622627829-11070-2-git-send-email-jun.li@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1622627829-11070-1-git-send-email-jun.li@nxp.com>
References: <1622627829-11070-1-git-send-email-jun.li@nxp.com>
Content-Type: text/plain
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SG2PR06CA0156.apcprd06.prod.outlook.com
 (2603:1096:1:1f::34) To VI1PR04MB5935.eurprd04.prod.outlook.com
 (2603:10a6:803:e9::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by SG2PR06CA0156.apcprd06.prod.outlook.com (2603:1096:1:1f::34) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.4173.20 via Frontend Transport; Wed, 2 Jun 2021 10:14:51 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: efa2365d-2b5a-4d37-c0a1-08d925af4340
X-MS-TrafficTypeDiagnostic: VE1PR04MB7357:
X-Microsoft-Antispam-PRVS: <VE1PR04MB73579E2886C587415A9B4D08893D9@VE1PR04MB7357.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2399;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fwCMJgquQctLcyScysHwO02yHvOz6OVbOzc+BLmMNrdURd1nJqiCi/q6IxaGBnhfsB8a41KnVAIGRfyfZJYiUtFUM2E0rTDJdfTgsHaw81hepTZ2B0mUbAV0l9tHRhdRnEh4vH7+J68+1pWLD6pvdrV+n98g7oyVeH6kk8TcaBzixmGI0P8/FhAwuLphTU/YtPjtbM88lVvc1Gc1UV7pTinQH+27dwI6Tyye9+NZsd07/+a+DDBSffcJuV4Bdv6VR0HvXFmqlr2BHgZ3u9ZASMgrC6+Za61R7GAB6kTsC3qmM5HtPbZ+Y96fbqgXCA9urHVH49ykAvD94a7+c6fygjyPeGkND8pKaeADrWspQxXwGOACo/t2cNllvBW5ndP7G86fYqCReASxhQ3oyn2BR9smZdVw+jo/5aY52sR//cd2l2n5dd06dupQYbMY67iGQq85KBDikOmBtTykqSo3GFrT5JxwnEbE03btDMEKYZJ4/5S9mZ1n78pP8HKdfWkn+B8c9IXq49YwxX4KpuGRB0RlNTvRIHf7jjAGwYhuAPB1W4Jg/NgtN44dPV9bELdW5tinh+9q3zwpeuCFk5/DTrbs1zNjVmgZ12Xn9+rrXS3o3xI8mXqrVGacYbjpSUePZcPRxtsWxyRWPWEisnXQlyv0R1ewlUo5VNdQ5Du7OtMf2nNg+qT5/VT5rlDKTQUL
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5935.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(396003)(136003)(39860400002)(376002)(366004)(6512007)(6666004)(316002)(956004)(5660300002)(2616005)(8676002)(16526019)(66946007)(6486002)(6506007)(38100700002)(26005)(86362001)(2906002)(66476007)(186003)(478600001)(8936002)(52116002)(38350700002)(36756003)(4744005)(4326008)(66556008)(69590400013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?3Kx4cb1Yfam9CjvkjcyN4LW2mx/GF/4tHGi+49ifFtxJF2KoVlIER5Mq4NwI?=
 =?us-ascii?Q?BoeYwh/+FW3xwb/sMqDhjzmYaicmUj9JtfvOFcwqAOZd9D/A0D8fZ3uYp9Rg?=
 =?us-ascii?Q?aNR1WhO6NMA1v6uRfIcnFmFZUfsEpk68rXYI7CjRSHx/v5PAEuo6zJaQ3EbN?=
 =?us-ascii?Q?OftDtzFNIpuyJvC0DNETTWDigipSvxQwEMKCdBWbCXm1hymFPpN+PY0CTH/1?=
 =?us-ascii?Q?OvWcx/YALILVe01Z2MUAAwDjEaxKwFBVfvaZcQl90M94OArO10M1KlYaXu7s?=
 =?us-ascii?Q?ZW/Kejy3HgkaTDUKuZqq/sTNF6Me/gd04MgL2EN6tXksgLRYpwMEzALwUMGR?=
 =?us-ascii?Q?MblVuAHk6IrTwyV2qb7AfI4u1bdvzXfSs+lhR/PhhOoaJNeoM0OAnz/GuecL?=
 =?us-ascii?Q?qmZht6AOLvtkS92WbTcCsL2yOrTP4iyUfRUPLYnIdioKSPDb1+h5J6VXFKuB?=
 =?us-ascii?Q?T2mLwDqnTuKvqsqUF32IsJqtN/4gfVKPdKWTaRIBLT0EpCzTDskW02YD4iyB?=
 =?us-ascii?Q?BYeC39IwITQP1yen1em6nmFYiXBntYgkShtBemnVwgQGDHzadgMLwFV7cUr6?=
 =?us-ascii?Q?B1f8DhVq/ctGWHUBPYU/Uym0mOVRO2ePJ/LqdsICQI3YxgXx6OTJomvtulWZ?=
 =?us-ascii?Q?5w8lpNSN+hlHuXNVWOIsRlndnsFse6t3ZwC3/6jCHQxhkxu1bAsoBvJY2cDT?=
 =?us-ascii?Q?OyGiiKQDy60ztkMjmw+GyM27xerVRlLM/g8Yl46CZCGJC75UuQaHIOHlCEDV?=
 =?us-ascii?Q?Gn/v+T8Ox+fBUCYy0i7CUqkHZ7YU2qYbUCDqnx/6lwwq6LJkQHlshqrLdRL3?=
 =?us-ascii?Q?YDs35YHcOCBeaoEBvjZZffAjL0LT4lrZLRpCNMCClbLrB6Yk41m9wZsTEa6Q?=
 =?us-ascii?Q?p9EnTlxh3/sq1aHJIvfQLngTmiX9NYoiXGqxm6jiyYL6YTtJOjXA2PDIdM3s?=
 =?us-ascii?Q?xvxEGvnYa54QJ8UcJzKYCZS9zBRqrU0hIgSGdATkPNjRWgelIYRc76urdt9b?=
 =?us-ascii?Q?opRCYqkfbBAR9o+BFUmO9D8UdSBgVJ1tJv1t3yU+YnErg65U4hT/cWuiqO5r?=
 =?us-ascii?Q?KxOVDlGyPUKvZ1ew4uuVZRqFKTFsnbEODcVDU5pfTXq1Zwhc7iM+JqKtuJlU?=
 =?us-ascii?Q?JnaJdt99/6nT5sGmwBtpNAUGbEU2X6Y+X6AOBbbd6jyV3RfBHJFStyoo7CU+?=
 =?us-ascii?Q?64MlI+hnaL2Lw9dbqG3AXH8PDandJlc778j3bhihbgLutuir1QbZei+3/Nt8?=
 =?us-ascii?Q?IaQPPtEe9O2FFvcJzww73k52x6yniIAnZpgtunxn4fupv9WbEJiSBEVn0JcA?=
 =?us-ascii?Q?sfZpijthCPPxzYXay0u5iHQw?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: efa2365d-2b5a-4d37-c0a1-08d925af4340
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5935.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2021 10:14:53.1065
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nLWPQ+PKMHoz77aKuLJUQu6Sxj08Fi2ctwVOSdhS1cNgpeJXq6E0vRLlSH8zqyTe
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7357
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Like the state_machine_timer, we should also cancel possible pending
frs hrtimer when unregister tcpm port.

Fixes: 8dc4bd073663 ("usb: typec: tcpm: Add support for Sink Fast Role SWAP(FRS)")
Signed-off-by: Li Jun <jun.li@nxp.com>
---
 drivers/usb/typec/tcpm/tcpm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
index f47685e7923d..c7460df2119d 100644
--- a/drivers/usb/typec/tcpm/tcpm.c
+++ b/drivers/usb/typec/tcpm/tcpm.c
@@ -6328,6 +6328,7 @@ void tcpm_unregister_port(struct tcpm_port *port)
 {
 	int i;
 
+	hrtimer_cancel(&port->enable_frs_timer);
 	hrtimer_cancel(&port->vdm_state_machine_timer);
 	hrtimer_cancel(&port->state_machine_timer);
 
-- 
2.25.1

