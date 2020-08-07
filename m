Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CAED523EA9E
	for <lists+linux-usb@lfdr.de>; Fri,  7 Aug 2020 11:42:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726809AbgHGJms (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 7 Aug 2020 05:42:48 -0400
Received: from mail-eopbgr50089.outbound.protection.outlook.com ([40.107.5.89]:59671
        "EHLO EUR03-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726382AbgHGJmr (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 7 Aug 2020 05:42:47 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T/uc/aV3C3mzjZ/f8spQVcwCyhwBbV2AyLJX+GJLhVVGBqZoZBdAKzZZ/AmAMYbkh6CjXt3sB+gk/m2QIN0AN05eaXXoG02PxHM6ap8Gsj7bsW3gLd/jSkXtzDZpeIUqYpLmO2ByoLKa82Hvurw5PUkvfTqSN9wNdi3+KqwEklOQ9eb4eUH5+0RXiqOtYp8aT/AVXK7PwKjRJvvbMpfPWtMVfu7nQg+m61wbiw793oq5X2rS8QN+q/KYZQcJIBOgSf/MCwln8bhVFSmoUBrxxfFHR18ziNftns7BG9mzm5NTfkEghy18206BJMXM1unweuysN8SvJEBFQsK2VZV1cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aNF3dnhmmis1otN/Ac219ig4nBKU443aQZAj8jme3d4=;
 b=KM62hy3uB6xuPg10gUpD1OynQESnw2Y25o3+Zk5l7ivYOa9TB3zBrVBk35lDZ9Tw62kT+/Gm0A37E2u2NOWnz263HteoPITwuT9NxFE5nh0kX0W8hf53qqhJwz0KUFIDW/5+usrx0S8ZqI+h9d/pqcf2S+UN0rhDvfJX69toQXMSF/t7UNZFDxpqK00b0kTuCyrJOaNybWcoh+5Sj4fALrp3FslexT8L/n+Mg+BZ06fI48hwndvZWXD0mfV0i108pS2FhmY+WQvBJ6KDDubk/7RnQZKWs/kVZfuqNMfMsotIzKd4zLQykargIOQgZkdV9OlXoZMY7u+4LR16QiZIrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aNF3dnhmmis1otN/Ac219ig4nBKU443aQZAj8jme3d4=;
 b=XzCJXmGvpa0UUpN96ubnDFgyQwVuXVX4jWIF8n+adILRAZZPSd1V3iYApqUd8iOCh+P8ULD1TjErR1HKE78BCsMgUeiAdCmtKixReaY4LAnz5idRAkYy6mrMJdsvhsx1RQ8HA79uZobvFp/pZUlFzc92Sbi3jLpY8tQ4o9fFGoE=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
 by AM7PR04MB7077.eurprd04.prod.outlook.com (2603:10a6:20b:11c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.19; Fri, 7 Aug
 2020 09:42:43 +0000
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::ed7f:8755:5994:7fcf]) by AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::ed7f:8755:5994:7fcf%5]) with mapi id 15.20.3261.020; Fri, 7 Aug 2020
 09:42:43 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     balbi@kernel.org
Cc:     linux-usb@vger.kernel.org, linux-imx@nxp.com,
        stern@rowland.harvard.edu, gregkh@linuxfoundation.org,
        Peter Chen <peter.chen@nxp.com>
Subject: [PATCH 0/6] USB: UDC: Fix memory leaks by expanding the API
Date:   Fri,  7 Aug 2020 17:41:45 +0800
Message-Id: <20200807094151.13526-1-peter.chen@nxp.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: SG2PR03CA0113.apcprd03.prod.outlook.com
 (2603:1096:4:91::17) To AM7PR04MB7157.eurprd04.prod.outlook.com
 (2603:10a6:20b:118::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from b29397-desktop.ap.freescale.net (119.31.174.67) by SG2PR03CA0113.apcprd03.prod.outlook.com (2603:1096:4:91::17) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.5 via Frontend Transport; Fri, 7 Aug 2020 09:42:41 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [119.31.174.67]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: ff95bd9a-c13b-421b-2d6e-08d83ab63bbd
X-MS-TrafficTypeDiagnostic: AM7PR04MB7077:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM7PR04MB7077B8AD8FE2CE78F1CB02018B490@AM7PR04MB7077.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: irKRP4VVhTUvn9gbUQgZNZYvzblTj1GeZ8kzMn0xk2o6LPVq0k3Wve/xwFPe6qPw38CyHwYlpNMiWwDUCZvD4+r3pU9w52j+soSZR5iqvyHTeZWawRymul+XxZ1/i7l/RawoSh5udReVC3PEe88nmsKbnDtwBAQCh13S3f4x370Jw69qhmWhcbW71H6FLma9RCQjS7rFpo8WnxSlZZ2MTgytHeUthY4gL03f2F1AaNbFM+uwCPKoankQQHGiC+4OuNPcKxXkvgPLcyctRO+0kTTRgh9Og4+Nkf0vze85Vkn64ubaNScK9FOyLM0qLp6lMi77L5kA7llkzjWxfrOLyw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7157.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(366004)(346002)(136003)(39860400002)(376002)(396003)(956004)(2616005)(5660300002)(86362001)(16526019)(44832011)(6486002)(186003)(66556008)(66946007)(4326008)(6512007)(26005)(52116002)(8676002)(83380400001)(1076003)(66476007)(36756003)(8936002)(478600001)(6916009)(316002)(6506007)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: HWQBZWZczOhJWZgMnObymStgqBUngvDIwe56kKlCQr6RJP2OtsEm2zLsZdOH24mwDQ+gmH3f8T2eFX2rH8r41msmdzhs0u5U7rR+xTAG9KF+RTMnMFYmDZrKo0u/ZnULuUuFifo3x0cAN27F2vEZIs2kqFMLmP0fe9tzkhgTnQl7xshV+1JyblX8xuqeqjSeoBeUjZg3bIIMbw8R8sNQQNMzfFuZ4TjhbC/Bo8givsl267D3L2e5WsJW982DW/fqe+XdlL3npL0p0LbqVFhu+eH/g/BVSX7ra+R1tUm5hMsLbC0HvN7lYekqdRbhbXNnQErr9Ev+Fbjiyd5ysT1FiMg1M+ZWDCbngWtABqjaq4dETFFhXnr0RDYPOwZApd/xXBp1cQ6pIG82/N4Y/wlpY4gutcFZ/M6bXu0xt3m7W9Th016lIWhI6MDBRO9J2N3+243f2ge+vHS32TdQ96DdOhBEqka4sdvMfZb2O05xlkwIjO6jIsh0b/+zrzY8XNpQaut4rQoGwKfzVwOdXlyjulVLWQoouAMEW/K5L3pI9g5eoHu7tUud0NkM2E496Ad1aBib3znf6l6Ng07af/UNvKaLTgaRss12h4bWvzWHxx5GMg2zpYbGp6Zn6GwJF5jHC55OzarsloWd/Vbnv+YmhQ==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff95bd9a-c13b-421b-2d6e-08d83ab63bbd
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7157.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2020 09:42:43.6863
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eDMuAQMUDPAs92eL5H1dSKizmxbHh+behn5TXMOhC7DTx1YBfwONwHJdubQL41HJL5NPlCxIdJr4JgvJ8F3vyQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7077
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This series expands the UDC API to fix some long-standing memory leaks
in the net2280 and net2272 drivers. And with expanding APIs, it could
manage cdns3 and dwc3 gadget device memory better without the hacks
at UDC core.

Alan Stern (3):
  USB: UDC: Expand device model API interface
  USB: UDC: net2280: Fix memory leaks
  USB: UDC: net2272: Fix memory leaks

Peter Chen (3):
  usb: cdns3: gadget: fix possible memory leak
  usb: dwc3: allocate gadget structure dynamically
  Revert "usb: udc: allow adding and removing the same gadget device"

 drivers/usb/cdns3/gadget.c       |  21 ++++--
 drivers/usb/dwc3/core.h          |   2 +-
 drivers/usb/dwc3/ep0.c           |  26 ++++----
 drivers/usb/dwc3/gadget.c        | 106 ++++++++++++++++++-------------
 drivers/usb/dwc3/gadget.h        |   2 +-
 drivers/usb/gadget/udc/core.c    |  79 ++++++++++++++++++-----
 drivers/usb/gadget/udc/net2272.c |  25 +++++---
 drivers/usb/gadget/udc/net2272.h |   1 +
 drivers/usb/gadget/udc/net2280.c |  13 ++--
 drivers/usb/gadget/udc/net2280.h |   1 +
 include/linux/usb/gadget.h       |  27 ++++++--
 11 files changed, 203 insertions(+), 100 deletions(-)

-- 
2.17.1

