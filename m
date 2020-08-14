Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7938F244486
	for <lists+linux-usb@lfdr.de>; Fri, 14 Aug 2020 07:28:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726513AbgHNF2N (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 14 Aug 2020 01:28:13 -0400
Received: from mail-eopbgr70054.outbound.protection.outlook.com ([40.107.7.54]:62158
        "EHLO EUR04-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726064AbgHNF2M (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 14 Aug 2020 01:28:12 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bufTd0pkYw/an3i96Vnvze9vO3tY2wItJdE9L2EX9jTBa7pSNiHLUnV+r7bdq4oHr6/G1wk2czfoK7Ve2qsLGC6744OapeS0VuiyrqX6nEME/OEB8SvUxbylhAfs0GBFkjOdrh3HelzHIYAocMa7eJj+mh4HRGmGRQCI2S6ZQaZ641avMgKWHeA2JJJjDP++cbjlG3Y3+ZYjkQeqyZu8/DXU3v2o8hhzEHpepzxZ40vAELRpIg7XNICUnd9465LEv0cHYCN8Tmk8kIaNOROpBHtAfeWe2cN7NNdTSTRHG0fpZdsYD6QKLgMYGtl/L3y6DqxI/gYnwd3rrJqQHUJ03A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QkNqDeMbTvBZtkCom/59fK0EVG2PRQ/y1yWaIBd40mU=;
 b=JeSug8Bf4LdmLLDmy/xyF9qy5ztVCMbcy9uufuWhlO3jQVfQD/y15/84wyWpCbdyipg26+Pssk2b2W6x0GHCkoqyCrVW44uBjab09Auj6n5A6RKj7i5cD09i4l7mPMdXLRchyr7BxjkzzXlaLNWFLV9yIxdNMcBqvBTtM1PdccuBBr+OUZDdfCfJR5eaNQ44ZjNmj7hGJVnfbMah35TxlYBoAc8IaMH5IzRjSYvtLU5u53kpZ+qEC9fGw+oeQJZtfCxLSPpkyie2cGmfYfxGdyo2bs8EGcNkQDjW3EOK6Kwk7WccoTWI29IAjw9QSxywKE7CFFfHiDU7lvCCvZn9/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QkNqDeMbTvBZtkCom/59fK0EVG2PRQ/y1yWaIBd40mU=;
 b=Er3Vq6NKpISFWEKEdFpsuimr0Rc8RHdXBeDbPpHNs+Rj8ezwXB+tWc3M/9OvzQv1f9bHqxwFaEdIHRH+WTJE6PUB7p5ePZHUccv5T7gpQ1nqH6WjK9XCKO8oKdPF4dNpBgKc+mm5ghhUO2IB8S5cwna1y39P2U/9Fx4a+YNW+l8=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from DB8PR04MB7162.eurprd04.prod.outlook.com (2603:10a6:10:12c::13)
 by DB3PR0402MB3641.eurprd04.prod.outlook.com (2603:10a6:8:b::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.16; Fri, 14 Aug
 2020 05:28:07 +0000
Received: from DB8PR04MB7162.eurprd04.prod.outlook.com
 ([fe80::acee:9763:7898:84a2]) by DB8PR04MB7162.eurprd04.prod.outlook.com
 ([fe80::acee:9763:7898:84a2%9]) with mapi id 15.20.3261.025; Fri, 14 Aug 2020
 05:28:07 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     balbi@kernel.org
Cc:     linux-usb@vger.kernel.org, linux-imx@nxp.com,
        gregkh@linuxfoundation.org, stern@rowland.harvard.edu,
        Peter Chen <peter.chen@nxp.com>
Subject: [RESEND PATCH v3 0/6] USB: UDC: Fix memory leaks by expanding the API
Date:   Fri, 14 Aug 2020 13:26:56 +0800
Message-Id: <20200814052702.22789-1-peter.chen@nxp.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: SG2PR06CA0153.apcprd06.prod.outlook.com
 (2603:1096:1:1f::31) To DB8PR04MB7162.eurprd04.prod.outlook.com
 (2603:10a6:10:12c::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from b29397-desktop.ap.freescale.net (119.31.174.66) by SG2PR06CA0153.apcprd06.prod.outlook.com (2603:1096:1:1f::31) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.16 via Frontend Transport; Fri, 14 Aug 2020 05:28:05 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [119.31.174.66]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 1397e0a3-7099-4a95-3b9d-08d84012d35a
X-MS-TrafficTypeDiagnostic: DB3PR0402MB3641:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB3PR0402MB364135CFBB97F95F2E9D3BA28B400@DB3PR0402MB3641.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WVtrDLPdAx89ybjIfA+5aCcVsqdcLitk8+Om+i91g/CDFn2rFbiHKakTIv3idSDSWyuJFdB5kU3luHRc0f9Z88ifuo3dv8WQ7as91CqZ3GpSTjtiNL8uLzi/FaRNlp1nk7dATNC+QV/MqNmhXIwU5mKGQo8MMVQhYMnhGjJmq2MkrABTbxa5Ad7kpToVgHT4fxfIlJEib5iRhgqaHcOz6Fr8yd/XHh/ZH3XZLOnErvOFXEokg+WEXFix2BsvAUMsY2JLmD82KcJiKJ3yUlWXk7GMrAjtgc8vEhKs1EPu6XJZ+s0+7TAuk8x4GiuUTHKrgwLOAV3YqbDHB8i11qfs/A==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR04MB7162.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(39860400002)(366004)(136003)(396003)(6486002)(36756003)(86362001)(6506007)(6916009)(8936002)(2616005)(2906002)(4326008)(316002)(6512007)(8676002)(956004)(6666004)(83380400001)(16526019)(186003)(66476007)(44832011)(5660300002)(66946007)(52116002)(66556008)(478600001)(26005)(1076003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: /PbTrVYdeC+PcTd2inVEAOtMCxWyw2/5Wg51oEjc90aj3aIqXCdHS+JV5MG6sdhX0jXB/oNJKxHQg8OSYLBtIr9itHwv1HNbJ7OM/WZv0hjUhZPmSQn8hhdC8/r4j64V8DhGMVzet67ms5JThFDAi22xPlYFlb3wyU2aY39Pvcf98UkaV7m0Q5AW+jvkkxbOcQjm+kXPRwFCVWB8dbCYSeSSaWA/46Yx7IJkDOZZm32a+KbwcDxR4HVYjNgwIjqEeywmZrBowDZHjc7Rtd8YOiVzzZAbvoCoL35ey/7nfT/oVQCAxm3TaR1ZBc/QwU6SCuk3+A4gvv43zQdAoigwtJgkfXaGPEx26/Xsgtqj/J+NoOKvfKKg+eAezRbMEmhInAJHx8riWNw0eg8vrDsJw5gjFAXzIfA+Mo8g9tQab4LQrOki7TYwEmjcLMebUlxvvXFzQinJAC1U722qgEw9tlGvKlakGS2Z0PulTffDNAlDlLKC7wVtcFEpsjTFhFjFg+EnfCt0utPJTBUb1vGKkoFr9WIR9or20a1pRGJ0aBNHx7xOkSx2J0wrnh1NCNaDmdcDEU79AmyoEwHT81j/EQoS+rj53qCLsmC6PEgk417YIVMTi+QFR3bpGhC5nIYVlF8fWTECujnWlak5k1CBYQ==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1397e0a3-7099-4a95-3b9d-08d84012d35a
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB7162.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2020 05:28:07.5914
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rSC/yqTLBmVSdKPh+6HqitXE6HBruWWddw7xdrKyTZVkGg3f2IwyBpQwMQGbHgJRLpKl6pL/J9AvX78YEeKDIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0402MB3641
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This series expands the UDC API to fix some long-standing memory leaks
in the net2280 and net2272 drivers. And with expanding APIs, it could
manage cdns3 and dwc3 gadget device memory better without the hacks
at UDC core.

Changes for v3:
- Rebase the latest usb/next, and fix one build error for dwc3 [Patch 5/6]

Alan Stern (3):
  USB: UDC: Expand device model API interface
  USB: UDC: net2280: Fix memory leaks
  USB: UDC: net2272: Fix memory leaks

Peter Chen (3):
  usb: cdns3: gadget: fix possible memory leak
  usb: dwc3: allocate gadget structure dynamically
  Revert "usb: udc: allow adding and removing the same gadget device"

 drivers/usb/cdns3/gadget.c       |  20 ++++--
 drivers/usb/dwc3/core.h          |   2 +-
 drivers/usb/dwc3/ep0.c           |  26 ++++----
 drivers/usb/dwc3/gadget.c        | 108 ++++++++++++++++++-------------
 drivers/usb/dwc3/gadget.h        |   2 +-
 drivers/usb/gadget/udc/core.c    |  79 +++++++++++++++++-----
 drivers/usb/gadget/udc/net2272.c |  23 ++++---
 drivers/usb/gadget/udc/net2272.h |   1 +
 drivers/usb/gadget/udc/net2280.c |  11 ++--
 drivers/usb/gadget/udc/net2280.h |   1 +
 include/linux/usb/gadget.h       |  27 ++++++--
 11 files changed, 199 insertions(+), 101 deletions(-)

-- 
2.17.1

