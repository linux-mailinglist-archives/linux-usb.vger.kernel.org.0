Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 892FE1CA6EF
	for <lists+linux-usb@lfdr.de>; Fri,  8 May 2020 11:19:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725784AbgEHJTG (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 8 May 2020 05:19:06 -0400
Received: from mail-eopbgr130054.outbound.protection.outlook.com ([40.107.13.54]:24847
        "EHLO EUR01-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725774AbgEHJTG (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 8 May 2020 05:19:06 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iShw0ctGQz5uZ7of8fuwVDndUY9QOF5aWAGB3ZKEpSJxI9tNbnLl3UPx9L4ktcoeQSev7yXgPuoz8BD40bBWiTqRP1tNPvqZH8YArhY3dlDQDTnuJu8U7zcmTJksgNoPyV3esyVHB1itIEvi2yFPAZHps4AfokYwyGjq7QfmaoiL1dw8rNf3HvXyCOMLF6EUBCqmDEbF6TU73cLsqPtLdksu4HPb90qnt1P3J6p94gJDWCzN83ulep5190k7cetENyR5Z8/Z1hcKh7binUeLpb+hP63RjgCxjpNhXsKpEJUQzCZLHHKlcFtG8UCZqaS7aA4QNiJsEDtd912zVu0Wvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GkOaKF7qe+GRkYx48s5FDo2fSvV+Bd2nHtGHdMQ/3FA=;
 b=hhuqmgJgeT9CrHWzdaYQSfJb5rrZ5aOiaUL4txgf5HVqyMfc2FXTwgIZ1OU0FeZdWwKzdV4X4dNJw6H5aK5ySPiYOoULEGuvUqe4qWbblaZ7SguZk39hpVuqHV4GHJuzuA+iquoYZ2N/dkQhhpOQDfnYnrWtFMl+hISHzoxmdNttu/xXDerrvNZmnGd3i8wB5U1ctxJZIh87dfJkRTmYF+Kz1vhWR8utbCaepxu/cwZob9s4Fa+8mx8jUmQ1IIZJoFljn+Jez7WG0JomG348JWLuqMgs54l8Lh+aExxoW8RKQrFcDywd8cwzobxE77zl9tmQTKdTV+Q58s1dF65egQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GkOaKF7qe+GRkYx48s5FDo2fSvV+Bd2nHtGHdMQ/3FA=;
 b=VDJCj3OmJJRazkfGDmoN3DjwafN6YgIkzcNNwFELvkOveZeW3BRkZTg8Xmt1A+KgOoQbnQdyuMyNY3/EmbBu7TamFs3IfcWGHB69l6BTcPpmII1Nr04YaigXbBs31QFZqmz+TFe+UX/QKEpJbIKtic7pdkMli8cBCcMxZuxxpdU=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from VE1PR04MB6528.eurprd04.prod.outlook.com (2603:10a6:803:127::18)
 by VE1PR04MB6479.eurprd04.prod.outlook.com (2603:10a6:803:11c::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.20; Fri, 8 May
 2020 09:19:00 +0000
Received: from VE1PR04MB6528.eurprd04.prod.outlook.com
 ([fe80::5086:ae9e:6397:6b03]) by VE1PR04MB6528.eurprd04.prod.outlook.com
 ([fe80::5086:ae9e:6397:6b03%7]) with mapi id 15.20.2958.035; Fri, 8 May 2020
 09:19:00 +0000
From:   Li Jun <jun.li@nxp.com>
To:     balbi@kernel.org
Cc:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        john.stultz@linaro.org, chenyu56@huawei.com
Subject: [PATCH] usb: dwc3: use readl_poll_timeout_atomic for register polling
Date:   Fri,  8 May 2020 17:09:45 +0800
Message-Id: <1588928985-1585-1-git-send-email-jun.li@nxp.com>
X-Mailer: git-send-email 2.7.4
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0120.apcprd02.prod.outlook.com
 (2603:1096:4:92::36) To VE1PR04MB6528.eurprd04.prod.outlook.com
 (2603:10a6:803:127::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by SG2PR02CA0120.apcprd02.prod.outlook.com (2603:1096:4:92::36) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.2979.28 via Frontend Transport; Fri, 8 May 2020 09:18:58 +0000
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [119.31.174.66]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: d08f3849-f2f9-4e5f-a75d-08d7f330d808
X-MS-TrafficTypeDiagnostic: VE1PR04MB6479:
X-Microsoft-Antispam-PRVS: <VE1PR04MB6479E347A68DECB07C2E10B089A20@VE1PR04MB6479.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-Forefront-PRVS: 039735BC4E
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ngTvqR3JKRnEfjoL2zKn9cXonwy24TYay4vuiZi/vGuiA8g/1XsXLHENk9fmViJau7vgcFv0dgI0uC1NMiQ0TgB+bTopnAIEMpczMB5Rj/665YnS83fnWDbEd4L3kYnSjAJroc8MkMvhBfckXjLVc1fvXS/NyZ0ce7C58vo9NvamAzCyr98VOnHHlOevWcxTsnQVRdEeNw3Gvk8kOEg7WqXSiT5pQGhyw2RQXIfwoYj7dmu4IVC2pgxbAmP/sbcYFPvTycSljz8QqyRBiwJ0yHfIX44jyJxGW91dh8rOp+QWsM3zH0Lj1vHHKs4QGyO5lpZtStOqFmRZxL7pDbSNPtfBZCi2ueoBkaJ8gHelELIKFt1VJ/wxXrubMTOGi75oQG0pY2k9ccrAqUTBufMSsIO8ql7fEpI9FBlhPXPuRyngVjHapiFqdbOQk9NcUMuEOhaxY+D6VgYdtfGs9V0QU/OmCVlwbLfT60h+idEHOsj+7d+DfCa+CpMKf0iqTDDwVZgxjJi9FWE5Er8DTIeob/5Y26MSJ9K2gktf0IihUbNAYMXWwEL2ezjp0PeoQ7rrNCWIwSQwOcMNHE90avaIDBtDmpCRysDlZPA/eiM0qrZIBF2/1dF1xqOfTq5krOvmZwbk4ku/9ye9ZYgdW0/WJA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6528.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(346002)(376002)(39860400002)(366004)(396003)(136003)(33430700001)(16526019)(186003)(6666004)(86362001)(956004)(2616005)(66946007)(6512007)(5660300002)(316002)(2906002)(6486002)(478600001)(52116002)(966005)(66556008)(8676002)(8936002)(66476007)(26005)(69590400007)(83310400001)(83320400001)(83290400001)(83280400001)(6506007)(6916009)(33440700001)(4326008)(36756003)(83300400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: +f3PbhH0LDGFAJLPj12adZEG4uOE9s2jLOWvrgezHQ8EfBPXIPCEiJ8Em2VUmhE0/6dfzhU+cW0G3+jurhT44SURouQeKvdYmCcqoZevwdk1WvIETBEl5vLmlMzKOiP7atbjBLOIpEJG78SUtNwBz20XYN8HL2Zor9+W4CyWtiKS4IZDMrrfhk9MTjla9UQ1o9/En3lqtGKe4pitREuFUuwjQKAF3c4zz/JFSRkc9R1KUBzy6KfL6XpeGm0ilqOJ/6BJIu3MivQVHXm2fQzjWMZd4fQSijahNN2Fz9IfB+lOAEPyDzqhkax1vqKunUyyGX3Vi3TZ6ZIvz10gi6p4eFmRE3GvHkfrfN5RsiHWDz6iEJgXPnS0tKACZSZ6L/YsXnHTy4G6pwEUimYhf3KkkJdRMq0Gd5Ozn4N2fbDEuDY6qJTvKOswiPJI0mw/gWmpxIweB+XkiiwItcGO5qT+gmgBLxkT3tNdQpUgj3d57wo=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d08f3849-f2f9-4e5f-a75d-08d7f330d808
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2020 09:19:00.8048
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qu2GGhj0+Obd4j5QWVH0RsHSm0Nu4berQoihoU6r8oOqVmB2tNcex8oyWCFwecd6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6479
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Introduce dwc3_read_poll_timeout_atomic for register polling to
simplify code, this way we use time(us) instead of register read
iteration counter to wait register value change, this is also to
resolve one ep command timeout issue found on imx8M, Chen Yu also
encoutered this problem on his Hisilicon Kirin Soc[1], on imx8M,
some ep command need more time to complete when SS PHY is at P3
because suspend_clk(32K) is used, trace shows it takes about 400us
to complete, see below trace(44.286278 - 44.285897 = 0.000381):

configfs_acm.sh-822   [000] d..1    44.285896: dwc3_writel: addr
000000006d59aae1 value 00000401
configfs_acm.sh-822   [000] d..1    44.285897: dwc3_readl: addr
000000006d59aae1 value 00000401
... ...
configfs_acm.sh-822   [000] d..1    44.286278: dwc3_readl: addr
000000006d59aae1 value 00000001
configfs_acm.sh-822   [000] d..1    44.286279: dwc3_gadget_ep_cmd:
ep0out: cmd 'Set Endpoint Configuration' [401] params 00001000
00000500 00000000 --> status: Successful

So set timeout to be 500us for dwc3_send_gadget_ep_cmd().

[1] https://lkml.org/lkml/2019/9/25/754

Signed-off-by: Li Jun <jun.li@nxp.com>
---
 drivers/usb/dwc3/gadget.c | 103 ++++++++++++++++++----------------------------
 drivers/usb/dwc3/io.h     |  22 ++++++++++
 2 files changed, 62 insertions(+), 63 deletions(-)

diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index a055525..cde64a3 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -229,30 +229,22 @@ void dwc3_gadget_giveback(struct dwc3_ep *dep, struct dwc3_request *req,
  */
 int dwc3_send_gadget_generic_command(struct dwc3 *dwc, unsigned cmd, u32 param)
 {
-	u32		timeout = 500;
-	int		status = 0;
 	int		ret = 0;
 	u32		reg;
 
 	dwc3_writel(dwc->regs, DWC3_DGCMDPAR, param);
 	dwc3_writel(dwc->regs, DWC3_DGCMD, cmd | DWC3_DGCMD_CMDACT);
 
-	do {
-		reg = dwc3_readl(dwc->regs, DWC3_DGCMD);
-		if (!(reg & DWC3_DGCMD_CMDACT)) {
-			status = DWC3_DGCMD_STATUS(reg);
-			if (status)
-				ret = -EINVAL;
-			break;
-		}
-	} while (--timeout);
+	ret = dwc3_read_poll_timeout_atomic(dwc->regs, DWC3_DGCMD,
+					    &reg, DWC3_DGCMD_CMDACT,
+					    0, 100);
+	if (!ret)
+		ret = DWC3_DGCMD_STATUS(reg);
 
-	if (!timeout) {
-		ret = -ETIMEDOUT;
-		status = -ETIMEDOUT;
-	}
+	trace_dwc3_gadget_generic_cmd(cmd, param, ret);
 
-	trace_dwc3_gadget_generic_cmd(cmd, param, status);
+	if (ret > 0)
+		ret = -EINVAL;
 
 	return ret;
 }
@@ -273,7 +265,6 @@ int dwc3_send_gadget_ep_cmd(struct dwc3_ep *dep, unsigned cmd,
 {
 	const struct usb_endpoint_descriptor *desc = dep->endpoint.desc;
 	struct dwc3		*dwc = dep->dwc;
-	u32			timeout = 1000;
 	u32			saved_config = 0;
 	u32			reg;
 
@@ -346,44 +337,36 @@ int dwc3_send_gadget_ep_cmd(struct dwc3_ep *dep, unsigned cmd,
 		cmd |= DWC3_DEPCMD_CMDACT;
 
 	dwc3_writel(dep->regs, DWC3_DEPCMD, cmd);
-	do {
-		reg = dwc3_readl(dep->regs, DWC3_DEPCMD);
-		if (!(reg & DWC3_DEPCMD_CMDACT)) {
-			cmd_status = DWC3_DEPCMD_STATUS(reg);
-
-			switch (cmd_status) {
-			case 0:
-				ret = 0;
-				break;
-			case DEPEVT_TRANSFER_NO_RESOURCE:
-				dev_WARN(dwc->dev, "No resource for %s\n",
-					 dep->name);
-				ret = -EINVAL;
-				break;
-			case DEPEVT_TRANSFER_BUS_EXPIRY:
-				/*
-				 * SW issues START TRANSFER command to
-				 * isochronous ep with future frame interval. If
-				 * future interval time has already passed when
-				 * core receives the command, it will respond
-				 * with an error status of 'Bus Expiry'.
-				 *
-				 * Instead of always returning -EINVAL, let's
-				 * give a hint to the gadget driver that this is
-				 * the case by returning -EAGAIN.
-				 */
-				ret = -EAGAIN;
-				break;
-			default:
-				dev_WARN(dwc->dev, "UNKNOWN cmd status\n");
-			}
-
+	ret = dwc3_read_poll_timeout_atomic(dep->regs, DWC3_DEPCMD, &reg,
+					    DWC3_DEPCMD_CMDACT, 0, 500);
+	if (!ret) {
+		cmd_status = DWC3_DEPCMD_STATUS(reg);
+
+		switch (cmd_status) {
+		case 0:
+			ret = 0;
 			break;
+		case DEPEVT_TRANSFER_NO_RESOURCE:
+			ret = -EINVAL;
+			break;
+		case DEPEVT_TRANSFER_BUS_EXPIRY:
+			/*
+			 * SW issues START TRANSFER command to
+			 * isochronous ep with future frame interval. If
+			 * future interval time has already passed when
+			 * core receives the command, it will respond
+			 * with an error status of 'Bus Expiry'.
+			 *
+			 * Instead of always returning -EINVAL, let's
+			 * give a hint to the gadget driver that this is
+			 * the case by returning -EAGAIN.
+			 */
+			ret = -EAGAIN;
+			break;
+		default:
+			dev_WARN(dwc->dev, "UNKNOWN cmd status\n");
 		}
-	} while (--timeout);
-
-	if (timeout == 0) {
-		ret = -ETIMEDOUT;
+	} else {
 		cmd_status = -ETIMEDOUT;
 	}
 
@@ -1877,7 +1860,6 @@ static int dwc3_gadget_set_selfpowered(struct usb_gadget *g,
 static int dwc3_gadget_run_stop(struct dwc3 *dwc, int is_on, int suspend)
 {
 	u32			reg;
-	u32			timeout = 500;
 
 	if (pm_runtime_suspended(dwc->dev))
 		return 0;
@@ -1908,15 +1890,10 @@ static int dwc3_gadget_run_stop(struct dwc3 *dwc, int is_on, int suspend)
 
 	dwc3_gadget_dctl_write_safe(dwc, reg);
 
-	do {
-		reg = dwc3_readl(dwc->regs, DWC3_DSTS);
-		reg &= DWC3_DSTS_DEVCTRLHLT;
-	} while (--timeout && !(!is_on ^ !reg));
-
-	if (!timeout)
-		return -ETIMEDOUT;
-
-	return 0;
+	return dwc3_read_poll_timeout_atomic(dwc->regs, DWC3_DSTS,
+					     &reg, DWC3_DSTS_DEVCTRLHLT,
+					     is_on ? 0 : DWC3_DSTS_DEVCTRLHLT,
+					     100);
 }
 
 static int dwc3_gadget_pullup(struct usb_gadget *g, int is_on)
diff --git a/drivers/usb/dwc3/io.h b/drivers/usb/dwc3/io.h
index 9bbe5d4..7b7d21f 100644
--- a/drivers/usb/dwc3/io.h
+++ b/drivers/usb/dwc3/io.h
@@ -12,6 +12,7 @@
 #define __DRIVERS_USB_DWC3_IO_H
 
 #include <linux/io.h>
+#include <linux/iopoll.h>
 #include "trace.h"
 #include "debug.h"
 #include "core.h"
@@ -54,4 +55,25 @@ static inline void dwc3_writel(void __iomem *base, u32 offset, u32 value)
 	trace_dwc3_writel(base - DWC3_GLOBALS_REGS_START, offset, value);
 }
 
+static inline int dwc3_read_poll_timeout_atomic(void __iomem *base, u32 offset,
+						u32 *reg_addr, u32 mask,
+						u32 val, u32 timeout)
+{
+	u32 reg;
+	int ret;
+
+	/* Tracing the initial value */
+	reg = readl(base + offset - DWC3_GLOBALS_REGS_START);
+	trace_dwc3_readl(base - DWC3_GLOBALS_REGS_START, offset, reg);
+
+	ret = readl_poll_timeout_atomic(base + offset - DWC3_GLOBALS_REGS_START,
+					reg, (reg & mask) == val, 0, timeout);
+
+	*reg_addr = reg;
+	/* Tracing the finial value */
+	trace_dwc3_readl(base - DWC3_GLOBALS_REGS_START, offset, reg);
+
+	return ret;
+}
+
 #endif /* __DRIVERS_USB_DWC3_IO_H */
-- 
2.7.4

