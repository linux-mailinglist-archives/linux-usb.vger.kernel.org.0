Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1BFAF2047D2
	for <lists+linux-usb@lfdr.de>; Tue, 23 Jun 2020 05:09:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731547AbgFWDJy (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 22 Jun 2020 23:09:54 -0400
Received: from mail-am6eur05on2058.outbound.protection.outlook.com ([40.107.22.58]:15504
        "EHLO EUR05-AM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1731364AbgFWDJy (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 22 Jun 2020 23:09:54 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HVUEHWpKflZlNxRPy6m1GhE8px9IZHnKqz3LNAeJAZl0vGfLvo6o3SJ7v93krsMCEssdSRCto+4VNlZ3wjtjN0JIKc1ZkhAS54e3PWsGIA2USG7n+r7VYAxMpjlwyvHQe8GIjzEIUmmCg6zJrAmplluY2EhWOKIlqmaY7kLrLdKmIentQqyGd7cG9ftG3yF2pLHdDllMnbPIjJ1Lh0X0Wh7rm/aQ5JcmI706CpOAPxSUNWvnsFrNG5lRzFEs2Z8Df2hgBOTJHK30ZJksjbNaBZ91QIdfqmZ1t1gMmL5+RLtzbSO1Y3M3uEGnX0j13rGXPSKXSFW7VV7NtWnF4o180A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pvkFjdAcjzkvc5HTPc2ZDY79AaMCVkH3c7lsN+7iB94=;
 b=UZYEGW8vcYbpgZ9hZgaLT9ZuNw6fPk/5SVHCmUoiURxLho1kLq0KEQXW7/PkqvYGIOGdwLAze+S3HIEh0Z4SXP8MJxlwmJoPPxbN2OCbRs3xs7eI1qRyd09vuxuUOw97d6DPSkPqeXTbyCmRoYLA/UwnbJajKmnKojClSako78q/UBXMAnNYI6YGEw92+7kyjTnX5/7bYBlfp6lC2D2RzqeFi2ICMr4+f4T+17LjmjB6y0zgvWKzuWDRxl2oeIch1m6XEBo0i75ThQUmw/BxbAfnQ76erIJG4hMSTklHRc8lV/tt+1vcUMYkobu+ER3ZGDM2fpMPIpF/M/EVo3zDuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pvkFjdAcjzkvc5HTPc2ZDY79AaMCVkH3c7lsN+7iB94=;
 b=WHmGa07der+IxjIu9PFgVP3atvpaVAIoMMCrZly4eYdZlLr9QSWrEI2A5cc+nuMPEyqBIZXHXIfPWQq57JGhiZV120ZlxbQYA9HLPH3C8ueReqJsHiXbgyRHvUQi4S5NkmvmSOkhJlQq0paPnGFsdGAFyyPJmdTy3sgOZRv+q64=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
 by AM7PR04MB6854.eurprd04.prod.outlook.com (2603:10a6:20b:10c::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.22; Tue, 23 Jun
 2020 03:09:51 +0000
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1101:adaa:ee89:af2a]) by AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1101:adaa:ee89:af2a%3]) with mapi id 15.20.3109.027; Tue, 23 Jun 2020
 03:09:51 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     balbi@kernel.org, gregkh@linuxfoundation.org
Cc:     linux-usb@vger.kernel.org, linux-imx@nxp.com, pawell@cadence.com,
        rogerq@ti.com, jun.li@nxp.com, Peter Chen <peter.chen@nxp.com>
Subject: [PATCH 0/3] usb: cdns3: improvement for usb-next
Date:   Tue, 23 Jun 2020 11:09:58 +0800
Message-Id: <20200623031001.8469-1-peter.chen@nxp.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: SG2PR0401CA0015.apcprd04.prod.outlook.com
 (2603:1096:3:1::25) To AM7PR04MB7157.eurprd04.prod.outlook.com
 (2603:10a6:20b:118::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from b29397-desktop.ap.freescale.net (119.31.174.67) by SG2PR0401CA0015.apcprd04.prod.outlook.com (2603:1096:3:1::25) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.22 via Frontend Transport; Tue, 23 Jun 2020 03:09:48 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [119.31.174.67]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 58226453-09f3-4d44-b7eb-08d81722e4b7
X-MS-TrafficTypeDiagnostic: AM7PR04MB6854:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM7PR04MB685421380B7BA0C5D9A3623C8B940@AM7PR04MB6854.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3968;
X-Forefront-PRVS: 04433051BF
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GUi5BioMw5fD59ZsZ5hP6Pl7vcw/uDyHxXMUXIYD8R6aRieTlexcdSuJOMAVuGvNrBqd3ScsR57zOCdNN5SkxgctgYQQSKIlWeMlkQX4x4CwPQwrXhmvUQisIvsy+XKJ8ZzvYH4E3s5KQSOVqbEtibBmaReQM+YYQy5j7oZnpNZeX69CzhW+rb36kIYhaPEtnHDU2IOiWgm2cCsZgBx9J/dCTkijdKUG84guQw4g4eJL1Wc8TQYzpYz2G6gQMI4xnOqRpeH1Hs95vakqNvI8Ebm2NBAwfYq+EKJsVTL/NyAtW6cjmoQo8aOM00fpYySV5QiTZnOLs/BViW3z3GMQjA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7157.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(396003)(376002)(346002)(39860400002)(366004)(136003)(86362001)(6512007)(1076003)(4744005)(316002)(2906002)(66476007)(66556008)(66946007)(6486002)(44832011)(956004)(5660300002)(2616005)(478600001)(6666004)(26005)(16526019)(186003)(6506007)(8936002)(8676002)(52116002)(4326008)(83380400001)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: szdmW4knTP9MiIAu9Ua4HHOi0DoPDyuxckMT/NuzMN6H9CfUhrnsr+DGVCWDzvcEt3b1XqLtpQAs8uTlC46ZPqZLrWoE3ma64D+cKCDuwTA4KiWMdOWCcbdkGbjgIAN57dxl7heTtvAlTtkNcYQ96HhewelWM7pI2jHM4WedR0HCo5oEJeRxJYW9LRemdQmAvLSkF2snWdXPc91KHIaGH7kF3EizxYNMoBHVwinonqcGj6l/2s/aSplB81HLXbJMprPHkOxFDOj4dk0gMTsx3L4m8ikcHYCIiNUJkaCrcQYN2+F/0eq94y9NPPM9e+2Rs/rJBOLT22nNiFTHpCIXRPV+ezq0uJf/IDHNlOTvwxL5wKOIQCymx3RdSzXT9ndEbXPxHnE2hkviMRwkxYTCH8XI7QXbhV5QLbUruAbR/NkCJ9rQWB+tdntCycuNq+uCh439GFtWBCWRqrfaDkF+x9uuBm65p4oVCUL/rk1j6VkwURDECefflQ2IOZfj6/ei
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58226453-09f3-4d44-b7eb-08d81722e4b7
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2020 03:09:50.9444
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HcNxaI41w8vjO8m6iaQzWChKKunnU0E9sBYRHsXPWhoRBSNeBQswyfUKY6blrlG4Rddgp3qUSw7AqP1SpvH66w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6854
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Peter Chen (3):
  usb: cdns3: ep0: delete the duplicate code
  usb: cdns3: gadget: unsigned int is dereferenced as a wider unsigned
    long
  usb: cdns3: gadget: use unsigned int for 32-bit number

 drivers/usb/cdns3/ep0.c    | 2 +-
 drivers/usb/cdns3/gadget.c | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

-- 
2.17.1

