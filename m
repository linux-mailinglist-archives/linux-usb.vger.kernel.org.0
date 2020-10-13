Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A7BDA28CAFD
	for <lists+linux-usb@lfdr.de>; Tue, 13 Oct 2020 11:28:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403988AbgJMJ2e (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 13 Oct 2020 05:28:34 -0400
Received: from mail-eopbgr10070.outbound.protection.outlook.com ([40.107.1.70]:52033
        "EHLO EUR02-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2403925AbgJMJ2d (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 13 Oct 2020 05:28:33 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nYfXff/9IL344zr5K/yKVWo5BUNmtIWEf7Z3DIo/SdZeOTVfymxE11D3Lxln7YCmXO23TlAxP2Sh7fJdWxhr4QZ3V10aheWHkKodVnoDd6KwLij9Sz84YE2B0CbUnsU4yCTYURygDXUP0/uBFhQLYB7do/xonqM9qxXzFmtebGGLEXjczx/8bfJWBkdLPRXl94ksTIhHEToTnedNuKuq9KQ7Si+LvpaahoXvo/sReVFCrSN/R89WtheR/+LXK0Q+aW3g7A5QPSGl66DqgbWdJF/o+KW/0JUhr7woD7j8BekGdncBi9hOz2D/22L0pmS18J2E6LWanPaBsD0scmAhnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HcwPu2s0ELml1pal/3f8ZsMha8SV95c+ez34nWF7IKQ=;
 b=imIM5QpbSQi9l98jwTdaNND1tUlJgwoIfc4l7V6/iMQD2k+E8TRdN+UAofnour/egUeXktF3Sx7itHcX+PycSxj1ba/uxAddnVo08i849PmNTG0Ed+nQQqXn/En3A0dsHfij4hSXQzw2lbnx568306LZCNjoTLGmxOKHpehYA8CQRkYeuHkWq6MElXU0Fy15YYlhkIR0zJhDJ6J4J3uP+ul+FDSwDAoGOzSXNz/dSPif7vQ9ROe1bQuhroZWbLHQLxdgu3knBvzOrt4JxkAHv7tRv+qVeMKCdDoAL1zrCM3K4ArEYafQo4r+y3x7ruroGIvNklyVW9syeEwIP/rG0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HcwPu2s0ELml1pal/3f8ZsMha8SV95c+ez34nWF7IKQ=;
 b=BkOUXbzbH54zCekRveN2IeerfYSOluNw7Es8D+o5GAn9DTHQYx6FkcW+o/23duYboIo6MQ9rDkR5jz/BAg6h/zQsYn+uyl3kRn2Jyp7znJ8G/7wAKxxi3IVZHUUmhPtZLhvEz3/RzK95BQucbOrzATLebAtdKOzXUgVdoFE8seg=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from AM8PR04MB7300.eurprd04.prod.outlook.com (2603:10a6:20b:1c7::12)
 by AM0PR0402MB3364.eurprd04.prod.outlook.com (2603:10a6:208:17::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.29; Tue, 13 Oct
 2020 09:28:27 +0000
Received: from AM8PR04MB7300.eurprd04.prod.outlook.com
 ([fe80::ad01:9b1c:3b4b:3a77]) by AM8PR04MB7300.eurprd04.prod.outlook.com
 ([fe80::ad01:9b1c:3b4b:3a77%7]) with mapi id 15.20.3455.030; Tue, 13 Oct 2020
 09:28:27 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     balbi@kernel.org
Cc:     linux-usb@vger.kernel.org, linux-imx@nxp.com,
        Peter Chen <peter.chen@nxp.com>
Subject: [PATCH RESEND 2/2] usb: gadget: core: do not try to disconnect gadget if it is not connected
Date:   Tue, 13 Oct 2020 17:27:46 +0800
Message-Id: <20201013092746.10602-2-peter.chen@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201013092746.10602-1-peter.chen@nxp.com>
References: <20201013092746.10602-1-peter.chen@nxp.com>
Content-Type: text/plain
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SG2PR04CA0192.apcprd04.prod.outlook.com
 (2603:1096:4:14::30) To AM8PR04MB7300.eurprd04.prod.outlook.com
 (2603:10a6:20b:1c7::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from b29397-desktop.ap.freescale.net (119.31.174.66) by SG2PR04CA0192.apcprd04.prod.outlook.com (2603:1096:4:14::30) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.23 via Frontend Transport; Tue, 13 Oct 2020 09:28:25 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 934468f7-5bd2-444a-3617-08d86f5a56d6
X-MS-TrafficTypeDiagnostic: AM0PR0402MB3364:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM0PR0402MB3364CD3674560170F52E9B2A8B040@AM0PR0402MB3364.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pZA2XnKW7fdWn+FUv2MyjuBWwYAv6xjXVlNzy40fLDvsghI5RPUP8u5XzWGgzY9r2MCH9r4y0p5WlEKBHh/56uOH+dwY2/splubgryHsCLNEyNM/Pho5QU1EtbM6o3KFh+7di48hzq3UYckBCC+wWEMEj/LEg9+fS4a+yyCpI8DXIkQ4qABVkXcnQsVbNRutGJvAoAF7oJkGXbx4lfOCNbg/bY6zOzPOCmwv2DldBW7ptzf5Y9R0mGhyd0akCQGXYQEmShDkFC69uuiDtEHf6NZsj1xRjlWuhyJgfgmE8GFbDOnMIuywdLFIqUnD8PnOhSt3jC1hgqTZclrBXRo9bQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7300.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(376002)(136003)(346002)(396003)(39860400002)(316002)(4744005)(1076003)(52116002)(956004)(36756003)(66476007)(66556008)(8676002)(6486002)(44832011)(66946007)(4326008)(2616005)(6506007)(16526019)(8936002)(5660300002)(478600001)(6666004)(2906002)(6512007)(6916009)(86362001)(186003)(83380400001)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: zm1sFQA0eKh4tV81pCMR1mDKCN/7AKBgXs/CAodLVHXflfCHXOWVMZOhml801XPUjSQzYytACWXn1MI0zDq5xn/AecmMyoNiWC8cdkm+ShYkDDFH8hJe3Thu7TcWV+AFo15L35U7E4XqxZSjv/qTGElQZ1XfNXmGUGujUDLNf/+rJZZgVN83HtL/IzvF78suUqA99MI4okWb2CArCV6yvFFvOR3slAJ4Tv0EucoQU526wwlRCdBrS99YbGUttHCw+Tx7fwImv9cJiQC97U3yZdvLSji2PozpWRNQv6Krf9cR8bpg93xhnOLKh3FTp6BNC/meyMQPxRqDUzVNRxLqj+E9XYLITWcjQYgoZoVHVntQm7XimDhpFZuAluoXvIwn/5O+ICw9b5tSxeSOpn6u6QVsJ+raQglHKREaZdz793GiM+Dvcvv2kepgBlSnIR01m0r5hl4aGRPgBtphZYMrY/SnJ4A+4DQ1+ZKCQG5TPAuK0ZVugd2u7mIRtO9a5nuJ6cqZLxsiEv8FmROiZrCAt65WbXfhkGY+5y3CiCgK8jcNv4BqynUF+br1MVjZklOQPmmEHHhfmeVMMI8VtaeD04iB6g+nGPoLiS14vwFFLuS+TPikg3PralvajM4BwOWhjWNfD9FPzDacxMgMTCVBOw==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 934468f7-5bd2-444a-3617-08d86f5a56d6
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7300.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2020 09:28:27.0839
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zQbJ87ZABDN9ZPMyFBUjWLgnN6SvVqOWqm4oJFq8mpSah26ZC8J0M/YIQ5gzWybAuPmUOiT3loo0Wb4cZsWKpQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR0402MB3364
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Current UDC core connects gadget during the loading gadget flow
(udc_bind_to_driver->usb_udc_connect_control), but for
platforms which do not connect gadget if the VBUS is not there,
they call usb_gadget_disconnect, but the gadget is not connected
at this time, notify disconnecton for the gadget driver is meaningless
at this situation.

Signed-off-by: Peter Chen <peter.chen@nxp.com>
---
 drivers/usb/gadget/udc/core.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/usb/gadget/udc/core.c b/drivers/usb/gadget/udc/core.c
index 215ecbe8b692..8ad4203dea8c 100644
--- a/drivers/usb/gadget/udc/core.c
+++ b/drivers/usb/gadget/udc/core.c
@@ -672,6 +672,9 @@ int usb_gadget_connect(struct usb_gadget *gadget)
 		goto out;
 	}
 
+	if (!gadget->connected)
+		goto out;
+
 	if (gadget->deactivated) {
 		/*
 		 * If gadget is deactivated we only save new state.
-- 
2.17.1

