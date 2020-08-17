Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 607FB2463AC
	for <lists+linux-usb@lfdr.de>; Mon, 17 Aug 2020 11:46:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726809AbgHQJqi (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 17 Aug 2020 05:46:38 -0400
Received: from mail-db8eur05on2086.outbound.protection.outlook.com ([40.107.20.86]:12129
        "EHLO EUR05-DB8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726424AbgHQJqH (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 17 Aug 2020 05:46:07 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZBnc7/mYN04Ak8lLNAu7U2t5/RQOCzYKJ89mbwZnlUDC1ujHFYIsXI+wH+Jy7PhFdJgEk/JCRFFGKnymrYobIu3TFYke7oDyRqORZTjc2mlbN1nTepElLhlhe2opFt1c4YqTjG+wN09jtelKxL3lqdVZQheFvjcrlh142oTYgi+bViZtk0t5xZwlq6HxW6rt9v7k+4DwTqmIvpYM1wrVb6QrdxmE21nmI+j8PzN1dEw2qzHQSmypW8OkCu4NMRozvMBfRy6kJR0EKMRLD3eImDi0K3PU3mxpSM6dt2VV/AdmF2bNejnd9M7yLkj1qjONoTXo3SEfwvb0g9rV4vU+8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Eu+CRXIpItZzkvXr4syAY+4Txxg2Cj+SazsRxUIgVg4=;
 b=ewV4q5hjxusj9F5+fCjNE/PrJkxBaKuCa2ph+Mw2dJIY9tzwhqO6PLQZHDHVu5EkXfZK011TBMaNZGB4oS13zuACnU8yqfVzghOaOfMvHjc7YqKyeZygFm75tVLqBhB0clhDoXAhGtKUW8k2DDejwv/lYpDoebrPGTZrL71duQ6zqUWM8NN1eaKVFZ7X9a2ayw7Od7UR3xHCYNl/tOOlzSZX7mYqvgWDonHw6WUCESqsldIIbar4gjcCaqzFF8Jf5/ua9iVr1QNhTVuNIl8lhhd36tAPuhVbrM9BIMzw5ULm2yvaXzVlQGL27XMsxAiCm0wAe1UDFUrjsMeEDZ18+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Eu+CRXIpItZzkvXr4syAY+4Txxg2Cj+SazsRxUIgVg4=;
 b=KEQnGnwQGs6kMV42qPtxaJUIV4WRDGxfEcIWfCCps5h/5lWPZ+xf1dT3ZYsOeyx/q1qK+4T0YtFzHTenxECc2s8/Gcca2R0KVgOe9i2d2tfBOS2WT3bXrfrOW/I0iyGuwh1blSdLTU1UMNKBMGrYbehLexw+ZKAHz1DmhNPbWXg=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
 by AM5PR0402MB2740.eurprd04.prod.outlook.com (2603:10a6:203:9a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.15; Mon, 17 Aug
 2020 09:46:04 +0000
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1023:be8d:40c:efe1]) by AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1023:be8d:40c:efe1%3]) with mapi id 15.20.3283.028; Mon, 17 Aug 2020
 09:46:04 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     mathias.nyman@intel.com
Cc:     linux-usb@vger.kernel.org, gregkh@linuxfoundation.org,
        linux-imx@nxp.com, Peter Chen <peter.chen@nxp.com>
Subject: [PATCH v2 6/7] usb: host: xhci-plat: improve the comments for xhci_plat_suspend
Date:   Mon, 17 Aug 2020 17:44:39 +0800
Message-Id: <20200817094440.23202-7-peter.chen@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200817094440.23202-1-peter.chen@nxp.com>
References: <20200817094440.23202-1-peter.chen@nxp.com>
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0094.apcprd02.prod.outlook.com
 (2603:1096:4:90::34) To AM7PR04MB7157.eurprd04.prod.outlook.com
 (2603:10a6:20b:118::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from b29397-desktop.ap.freescale.net (119.31.174.67) by SG2PR02CA0094.apcprd02.prod.outlook.com (2603:1096:4:90::34) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.16 via Frontend Transport; Mon, 17 Aug 2020 09:46:02 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [119.31.174.67]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 95d9e107-6ada-4bd1-babc-08d842925b8d
X-MS-TrafficTypeDiagnostic: AM5PR0402MB2740:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0402MB27409B1E314ACCAD3E9CA6048B5F0@AM5PR0402MB2740.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3968;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: upy1S9j5FyWbvQRYPiNlZ79hXbLExEovbEI4/Vzpp2XSzpOwniRFRAucK3YGahyZLkyNjjHgBNzpPw7+bpQjl2clDrBcyUKb/LsW+eqibAicI4nV559WPOTA1xKgu9n0PQjLxWcdVB1aFopAeYWDvQ//0UgWVtMERQzBFxUZ4neNOdz42kRbwXgXJFDaDIHM7n/JOST+B3BKbRqctBi98dgCktNkiGr2M/Wk0zWxHWQIOzn6vMCxtitewGVVo7WcuPyJqTecmHGXCqXgFqH6kkWCfVto1vg+/pXyh3krtUK9lcWJKTcEaK9JtqMkRREEQaT4EPRn64kYiXzGYLYy4g==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7157.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(136003)(346002)(376002)(366004)(396003)(5660300002)(66476007)(4326008)(36756003)(2906002)(8936002)(6486002)(66556008)(4744005)(44832011)(83380400001)(6512007)(6916009)(66946007)(8676002)(316002)(6666004)(16526019)(186003)(26005)(52116002)(86362001)(2616005)(478600001)(1076003)(956004)(6506007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: vclUIZGo4O7DZHpwrkendIoEO/kF1chmHfzdepc7K/s0/mr+dpzMmn1mWF+raxbmmyEF1VpKDkBwWVTTQb2MMeStrn7+Rk8jzKhUXJ63cNE30tXlu4aM42H7MeYHnM4T4nGBrFWvi//UCgb93py0i+8upHEM405I+ulUPlWxIiW2sxV1ADy0Fs22a1e85Bm3fmd0X+QqGDuBPr7bN9p+nHBTLkHrqJow26P9rdpAOmLrLoP69WSE+nkWeoX68iJ1niORh+VYvSqG0JSpErIHw8I+s8JTChiSS0wGTKh13Km/RUjS81aM2Yk2g5MPSYkzhtqoqOkgiNuClN4hmI4DgP42B5OJ0TNrKAIU4IAjQz207y/wY6k+gZJi7LwG0psYvLQB1FrDGxeJliy9Y90ovBWSKHVkh32uE1/Sl2naEO47H7GfGvatS2c69s8LJhLsN18ck2htaVdDgpZU3FgcNpaeH1KeeO9hw6uLDKLsF1PJUh/je+JguWfVubrH09/YkcqQn9Qq3+Yg11iRRBB80Z/nBn9B4MB7YEjVtXCQOv1SUAtC6JpR5gz5vDfFapBJUgCLo+HVx8fsDJUl/YQzh/Q5maLVyuDc8oZ587xkFyMAlIkWl1R7YfEr8Nyi+clHTFglhpD3oGlI3Ix45l6oaw==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 95d9e107-6ada-4bd1-babc-08d842925b8d
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7157.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2020 09:46:04.5501
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ms4L0RMBtfbe0UNt3SB4rHRaIOCKAjNDHe6O6QPA8djmvEMVDxPTG3HnIhTGLgS0RNXZz7OWqWewQIIy/W34HQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0402MB2740
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

To reflect the current code status.

Signed-off-by: Peter Chen <peter.chen@nxp.com>
---
 drivers/usb/host/xhci-plat.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/usb/host/xhci-plat.c b/drivers/usb/host/xhci-plat.c
index cfca6fc8947c..aa2d35f98200 100644
--- a/drivers/usb/host/xhci-plat.c
+++ b/drivers/usb/host/xhci-plat.c
@@ -421,11 +421,7 @@ static int __maybe_unused xhci_plat_suspend(struct device *dev)
 		return ret;
 	/*
 	 * xhci_suspend() needs `do_wakeup` to know whether host is allowed
-	 * to do wakeup during suspend. Since xhci_plat_suspend is currently
-	 * only designed for system suspend, device_may_wakeup() is enough
-	 * to dertermine whether host is allowed to do wakeup. Need to
-	 * reconsider this when xhci_plat_suspend enlarges its scope, e.g.,
-	 * also applies to runtime suspend.
+	 * to do wakeup during suspend.
 	 */
 	return xhci_suspend(xhci, device_may_wakeup(dev));
 }
-- 
2.17.1

