Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A2BD624CB0D
	for <lists+linux-usb@lfdr.de>; Fri, 21 Aug 2020 04:57:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727034AbgHUC5P (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 20 Aug 2020 22:57:15 -0400
Received: from mail-eopbgr50073.outbound.protection.outlook.com ([40.107.5.73]:27655
        "EHLO EUR03-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725852AbgHUC5N (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 20 Aug 2020 22:57:13 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a+BpN8JhICIYO/vZyGO6E+wgTAY/e10Uvi59AHdIZMdB5i2HlIdm8+XxVK5wunpYeguvG6h8k6pwQ9RFLpYBpvXvbx5YrHPTe+iEEJk2r0+wJUd5a0vGpBk42xeOEsqn9SYBIdqi5kUJHczVZauRapSmNi9YhLCzdr2iRefLOaOj4biI/rVIG8aboD5ttEa+lqeWG+/pZiZdZR/Cpk9ntYZPI1pXV3S1i854oG6V2hBTwrv3pudzwteY1FqZLP7EGCLOiPhDkMInBmT9dkgisQlb/S78Qo18CNLgRI21rVkn43EiVuIxppww72WPcshw7rfwmXikKTLx5GWIAd0f1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kXLLEzae6hYFd9SMp6jcz74ft9RzWldmJs0gIGF/l58=;
 b=M4ZbWzD+sqG3PqPoeFlG5289ndKpGXR6ysIZV1xqkn3my+FRvuOEDI1AagjFkQndC5RuFcYIb56ua1vasnBPXlGK64XmQ5Sd4uU9FOxdL4YWcppVJsfUBYxD/nE7so8u9lDSPaW6GuxBxcefq1Jp2OuiG+2qjgGK2XkLMJko0XxBaL6oUZQLQEOmS5uN4Z0aHuWXetRpH/tmkXkK6n3KSluSM3etcX15ilqFJ14IeRF5v1xOTUu4kR1m+EdEyswK79VZMcV/K5JrSziM0cI5S9ooaqllTPYS6Q1T6hW3XyCdg3MupkBpdPMUuMyk4ipRpC1O+V3/9Fk0Egskq/Kupw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kXLLEzae6hYFd9SMp6jcz74ft9RzWldmJs0gIGF/l58=;
 b=qAQtLYzf/FFISxbF+lV+Gq5F4G26OuIHghVGC8vXyfL0IX97T9ecudh//09lCEaFJ7xAvx1TxWkbd8n858YRdxQoLARMTaTZDnKLdArPiyegxrp2bSGTqOpwbNrOf+QV+EO0HoLvAMfgPgXPKWIY+/xRW/DwXjmU3svxLqUPHVg=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from DB8PR04MB7162.eurprd04.prod.outlook.com (2603:10a6:10:12c::13)
 by DB7PR04MB5577.eurprd04.prod.outlook.com (2603:10a6:10:8a::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.26; Fri, 21 Aug
 2020 02:57:08 +0000
Received: from DB8PR04MB7162.eurprd04.prod.outlook.com
 ([fe80::acee:9763:7898:84a2]) by DB8PR04MB7162.eurprd04.prod.outlook.com
 ([fe80::acee:9763:7898:84a2%9]) with mapi id 15.20.3283.027; Fri, 21 Aug 2020
 02:57:08 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     balbi@kernel.org
Cc:     linux-usb@vger.kernel.org, linux-imx@nxp.com,
        gregkh@linuxfoundation.org, stern@rowland.harvard.edu,
        Peter Chen <peter.chen@nxp.com>
Subject: [PATCH v4 0/6] USB: UDC: Fix memory leaks by expanding the API
Date:   Fri, 21 Aug 2020 10:55:43 +0800
Message-Id: <20200821025549.4591-1-peter.chen@nxp.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0132.apcprd01.prod.exchangelabs.com
 (2603:1096:4:40::36) To DB8PR04MB7162.eurprd04.prod.outlook.com
 (2603:10a6:10:12c::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from b29397-desktop.ap.freescale.net (119.31.174.67) by SG2PR01CA0132.apcprd01.prod.exchangelabs.com (2603:1096:4:40::36) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.24 via Frontend Transport; Fri, 21 Aug 2020 02:57:06 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [119.31.174.67]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: bb934a89-d664-4c1a-f14f-08d8457de4d1
X-MS-TrafficTypeDiagnostic: DB7PR04MB5577:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB7PR04MB5577691A32D4298D85CED6E78B5B0@DB7PR04MB5577.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HxySOd+zFBhYgxy+7rqhVKZRyDSUWMqJvHK0vnnQ5EErc5f9wFc9T73d57qZJzJd54ZzTaD2eRJFsh/70qioRuLgIggnO83OeFYZvofRBY1sFEk3dvx9eaFHghxR0ibb0cSRTu/CzwY9/DvJ96H8+tZ32XOBprG4x8yZhpqjqOvxaYsnxvnQ+igMn9oBB+IYG+kmM19b+r5E+3CNw4pseszsuLc8ES2pIgNT1x0G+B4QQKKGtP8wPezYl41QmHfDvrDTMWmyHrieybsvzqhUlwVumD2q5smSsAKHUQMDkKknrmfxrShQb6Hns4Jet+YquEIndpos5bglej2uYDPu8w==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR04MB7162.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(376002)(136003)(366004)(346002)(39860400002)(52116002)(66946007)(2906002)(8676002)(6486002)(4326008)(6506007)(478600001)(316002)(6666004)(44832011)(36756003)(956004)(26005)(66476007)(66556008)(2616005)(8936002)(1076003)(6512007)(5660300002)(6916009)(186003)(83380400001)(86362001)(16526019);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 1LZc8Hut0bTZ5p/zypZzNiCbsiUOK3A1XiZJzxehQZgA1Lb3PysCsUp3l9deHhEGZjSE3s9RlZyY4HJgCWZoHAL84Y2GLiH2/VN1t+A2h/YL92AhDtwsbQBmeIn3xRBJWGAzH6R1NUpQYasjHZiClYqHBCrvHn4YgCWlLB7644L7tisAHg0hejHmoXJ94se2rfrK/UwM3IbngPuSwnfocghXRc8mWrrQydqXUAtK2dliBwCB3AJ7ssDwi0t7/uzE6O4qytW0y5PkdJH1FPNxlI2gotEmxOTwkZkuj0xn2staVes0dDotfcemktZ3mybwA/Ml7606FtJ3gdTXjAkU3gH0iC0kwtmwm2fwV696msvDwMRSkZfpuHOKZUL+GWDcw0ZQUER3k62k6dfqkJlSBXGsFCP7fdhUhn/OS4eZXi088NIMFWsxZtR4JzRKB3e7W43sUDkoiiDJLA7iZHhuH/oCGv4UoxUz91c9FOrrTjYOk+eJ8B8eHJsgNVKAKsLWEiSNrMTRCWUlNkAOEVahtiqrQ19bcw+rUdva+kKYYb76Yd9dehCXnsqE1ytGAUA7xn9r2ABD/bVoi2nP7OudszE7t5ZYL1NuxeoHzay2OPoVRsUF0LjQJDFVVT9gEqFOqRcdFkgprXKSxKk0qqw8mg==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb934a89-d664-4c1a-f14f-08d8457de4d1
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB7162.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2020 02:57:08.8119
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6rn3YYdXEinhZxXagiXMQnpxrKx2TigzUc5ZOEPpxJMMo+tqQiKAJrjpZU2nuAcqANfbOXgJC3P1YdqdYZNTlw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB5577
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This series expands the UDC API to fix some long-standing memory leaks
in the net2280 and net2272 drivers. And with expanding APIs, it could
manage cdns3 and dwc3 gadget device memory better without the hacks
at UDC core.

Changes for v4:
- Add Greg and Alan's reviewed-by.

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

