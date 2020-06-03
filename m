Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 01C841EC9C0
	for <lists+linux-usb@lfdr.de>; Wed,  3 Jun 2020 08:53:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725855AbgFCGxq (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 3 Jun 2020 02:53:46 -0400
Received: from mail-eopbgr20057.outbound.protection.outlook.com ([40.107.2.57]:6241
        "EHLO EUR02-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725275AbgFCGxq (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 3 Jun 2020 02:53:46 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SpxLEVJNpkulhR9BmuqTBj/TC+D7R7Wp11dX6ZzmiG22jbtXPDDTwqeU7zAFuZiEUY00qg0Q6atjRBz+VH8RsPYAgeHpuXVZwBScecKphPNDfpj3FI1oQiB6nHUSAZpR1qbqI2mLIQ0MxQYVoO7JDTcb1Z+GFw2jSzDEit+797Cgr6F+0xVrtWWfFTLA/4eInce4HyT/DZgn3tGW5F3nSiWCzlQK2MCUYgZdNMRGDKADx8gOgvtVNpeLOMbYyklCg/AGy98AaWnDzkfyboNu67Bm+FnCWwoiOn4fgTWDC3m/qgMj19YxEsEN4yijAeFrNR9wdMwxNRU+KAbzcPsOMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8P3vsI45GfIrrL6MMnN3I8B2yYgTNt+Ny9WWjkGKdnA=;
 b=AcbihMZVA8PGvWmwH0WEiJBqqZheQ9IQXNS7KB3SUJyoRcjHJZf04gplgtM0e3PlokEt/ylmmhFhG+TW1qPuxbxwdO+h5AhZvMLu8nxuf7SOmmY9m+uTk7oRNr6QYlETq1jR/61GruoTRdJmRgTL63OZFX9k0qXbLnqf1JohD+wDCeihbIYG0Xkcph+si7WPvv6bi6VCiO/5B53oG9fl/j9hjOkpMWDCH4zH6DmqKH3dvvWKTkX6qFLJ9Lr9iBwdMH1ZfwcvOGn7SW63dg3/P9rI2/iPkx3fPJ8Vl/rcyE290NwfWZ7J9yhSZVTTrjktXyETwWPQPDjhiP4SjuJixw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8P3vsI45GfIrrL6MMnN3I8B2yYgTNt+Ny9WWjkGKdnA=;
 b=IwF843EnBFwQsG+JpjLb7O15ER2iYMbJM3KwhGSKN2N1Zg2RttVxcXy8zQlfLXMJqwLXsai7+KFHDfiCwtRmva3+4jLS+EHOuplzypB3qEiFRoEfqxxToPzM9Xbdmf6U7maEWWHDVUM1Xz3L/Sppub7X27vrrsYHXZMei8Tspus=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
 by AM7PR04MB6824.eurprd04.prod.outlook.com (2603:10a6:20b:10e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.19; Wed, 3 Jun
 2020 06:53:43 +0000
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1101:adaa:ee89:af2a]) by AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1101:adaa:ee89:af2a%3]) with mapi id 15.20.3066.018; Wed, 3 Jun 2020
 06:53:43 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     balbi@kernel.org
Cc:     linux-usb@vger.kernel.org, linux-imx@nxp.com, pawell@cadence.com,
        rogerq@ti.com, gregkh@linuxfoundation.org, jun.li@nxp.com,
        Peter Chen <peter.chen@nxp.com>
Subject: [PATCH 0/3] usb: cdns3: fix some endian issues
Date:   Wed,  3 Jun 2020 14:53:53 +0800
Message-Id: <20200603065356.14124-1-peter.chen@nxp.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: SGAP274CA0006.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b6::18)
 To AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from b29397-desktop.ap.freescale.net (119.31.174.66) by SGAP274CA0006.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b6::18) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.18 via Frontend Transport; Wed, 3 Jun 2020 06:53:40 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [119.31.174.66]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 70416b82-ae5d-49c0-c747-08d8078adab7
X-MS-TrafficTypeDiagnostic: AM7PR04MB6824:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM7PR04MB6824D1EA8D0DD576140FE8738B880@AM7PR04MB6824.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1728;
X-Forefront-PRVS: 04238CD941
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: l765gVVm4O/Eg1kXKs0vii1WGNV8SjsjQ55koLe5jMK7wwsTMICVEdOwyfg+Sxs/rPXmXR87d6BQUwLHvbtHpv5LsoWMWImcIXiyfvri+mlEmWgwT0MSK6flJMIfKL4umwDcAOMw6AcoYunXaRGh/5RjO3vJApKQlXNGROPNRIWm3vpFEm3ZBQaLCDG2kcp6P4GJViyhcEYNNVzbyStYdUJ8vaJHUtqOkvNtRhKgeDNhIL8W+DYOIwrR4caSrZSW+HTNLCglFLfk+7NnHdtfSfszHvY/5KJTam2jyLdXqi3AcFhrM+R+z1SXQ0bKEi+edLLbvttinYOKfaX26y2mhg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7157.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(39860400002)(396003)(366004)(136003)(346002)(376002)(478600001)(16526019)(8936002)(6512007)(6916009)(316002)(8676002)(956004)(2616005)(52116002)(6506007)(186003)(6486002)(4326008)(44832011)(26005)(2906002)(1076003)(4744005)(6666004)(86362001)(83380400001)(5660300002)(66946007)(66476007)(66556008)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: iEI+zgzP7CY+PfoGsCNF3Vtp4N7LSsZmBjIRC5NmCTPiI2nW+kWCrZ5N2fxIuOHo07E6KbjUN9kVqiwBI62hVbS1/c+MSKq1Km7vMiIphRG/9btxpRJKXxAtwqebU4bKLWNDZCm+VCoL8+HvYlqveym+P1ZqNdcQjMww9eBcQ7NsEzeC6PuMA8tz7jDi2cpnTSj0fpd0ikhmMsMNFCYblytxmvfQrXjOqab6DqfBJmGhGI0u4t9DDPXfK4cdC84eLO4qQFj3B3xa0up/BZsrNELrBzII9l3SS2Vt5vZ3tvzn9QmM3PYs2nhgAC6paLlbZ1n4G9lEEOJwZJgcHU+oNCQBCG5qbMG+RJmlsjgY8sOnuOQ68qRC7nTtbRFbW0vprIUoZvWmbEcMTF/mazxMSf1LO9rjrKaQ4WjnM6soyqH4damE6nZRgK9FlQTiHdfiNZ/C8Gc3+ZvVbChLNfZXtddxoZjietwljBDJhgHcJgw=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 70416b82-ae5d-49c0-c747-08d8078adab7
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2020 06:53:43.2599
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e4PIhx237RO3Bh4Z6ekHJP7y9BnetIaCU+0I5KAGI1TwdMg+cEeB1QB9EffTabcB3/L2cu3pl8KIOZfjnd/1WQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6824
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Reported by kbuild test robot. 

Peter Chen (3):
  usb: cdns3: ep0: fix some endian issues
  usb: cdns3: trace: fix some endian issues
  usb: cdns3: gadget: fix some endian issues

 drivers/usb/cdns3/ep0.c    | 30 +++++++-------
 drivers/usb/cdns3/gadget.c | 80 +++++++++++++++++++-------------------
 drivers/usb/cdns3/trace.h  |  6 +--
 3 files changed, 58 insertions(+), 58 deletions(-)

-- 
2.17.1

