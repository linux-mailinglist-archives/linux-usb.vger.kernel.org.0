Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A7AEE1DC915
	for <lists+linux-usb@lfdr.de>; Thu, 21 May 2020 10:56:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728654AbgEUI4l (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 21 May 2020 04:56:41 -0400
Received: from mail-eopbgr130088.outbound.protection.outlook.com ([40.107.13.88]:24433
        "EHLO EUR01-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728641AbgEUI4l (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 21 May 2020 04:56:41 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZmozblPY68KCD46HXAC1z7+BYYPwVZxMiHQmD045pEOvRMo3CHLGlcXXbRjbnSt5FgkgJaAeoPC2oeUu7sKSFVTDRnpxF9AeeM1IpUhayK44+3f4vlgdAl5Vcv6bCAIRKhmI3q5iioMm1gqE5oY7jgvJr7uGFSBhoKlH1IPb6lRHLm74Y+PmFIDnKDyZbIj1p72n2hfl2XYOTDUAA7m3AqpOxaWbxzr+XSd4fJs0Mqc4yg9qaEPFpQFk3WjNguUXpj/CI6JukYk6S1Sp7CsWHLLipNOHtzAEj2ShigmOk1dLa/7+WYljO5mOl/p1I7a/6/1cDAaBxtFyD89p26JweA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZAMeFZ7SSOSX3P6mhFAHFJQ9uR9pXtNw7/VL8ZjQ5zc=;
 b=CTZ73G7dbIgxd1FYxdrmodN9gYNJbjv6h7S5sWXXfKCObAy2euMUloK6cJVroN3zbg5ssV4KhYGMjEISiX5SUVZFAljh7qXMkd/frtI0ry7x8KkSjWJWvrWAxb+EmcwqnW/Pw/ZMlKQrosULBf9TlCbKAz3YjiJ9ROSkIIlZP1BecTW3HhLnGPR5jww070XyP5WoR/wHE5tzi1RTkNOS6/ZTCJ522tFDYH6jCGtHYyAHVyp8jlduaf4VVYfdB18Su/lAH1AmjLRKTXPEIpP9FmL4DkZrYnIkXA8gRNjSSyL3DAmMjdhpetFbrAUGFoV5hR6AHVrP/0xP5aFS5fAFYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZAMeFZ7SSOSX3P6mhFAHFJQ9uR9pXtNw7/VL8ZjQ5zc=;
 b=IGuF6LLj0MxWd3v+S+iDwL9qGlU84UDb7MRJVwF927WEthgRVah1cvloOSgdZZRUNUKIcnf6BzYckKtc8k+YENKClXdqBgB/bkjGpUVd+TEKO08kBy1unsNQnUSPZRMdl+QYvYDCqKA1i4LnMSI1PCC2UThXtgiizjBfZMSpkP4=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from VE1PR04MB6528.eurprd04.prod.outlook.com (2603:10a6:803:127::18)
 by VE1PR04MB6605.eurprd04.prod.outlook.com (2603:10a6:803:124::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.27; Thu, 21 May
 2020 08:56:36 +0000
Received: from VE1PR04MB6528.eurprd04.prod.outlook.com
 ([fe80::5086:ae9e:6397:6b03]) by VE1PR04MB6528.eurprd04.prod.outlook.com
 ([fe80::5086:ae9e:6397:6b03%7]) with mapi id 15.20.3000.034; Thu, 21 May 2020
 08:56:36 +0000
From:   Li Jun <jun.li@nxp.com>
To:     balbi@kernel.org
Cc:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        john.stultz@linaro.org, chenyu56@huawei.com,
        Thinh.Nguyen@synopsys.com, linux-imx@nxp.com, peter.chen@nxp.com
Subject: [PATCH] usb: dwc3: Increase timeout for CmdAct cleared by device controller
Date:   Thu, 21 May 2020 16:46:43 +0800
Message-Id: <1590050803-3696-1-git-send-email-jun.li@nxp.com>
X-Mailer: git-send-email 2.7.4
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0080.apcprd02.prod.outlook.com
 (2603:1096:4:90::20) To VE1PR04MB6528.eurprd04.prod.outlook.com
 (2603:10a6:803:127::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by SG2PR02CA0080.apcprd02.prod.outlook.com (2603:1096:4:90::20) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3021.23 via Frontend Transport; Thu, 21 May 2020 08:56:33 +0000
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [119.31.174.66]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: ab026884-3b71-4ab0-7fca-08d7fd64de21
X-MS-TrafficTypeDiagnostic: VE1PR04MB6605:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VE1PR04MB66054C4D6E12FE2CDED6C79D89B70@VE1PR04MB6605.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-Forefront-PRVS: 041032FF37
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: abLRIu0YRHXbCPrY1ASoMBKWobYaXHbvcUaXh0MKxuM+dlXWoHKe8bS6zuRyvDC824ZCTy46pjiHRyQ/U6necgo3ljmMQDGKsfHJLOCyxbxVD1eoFXFz1z6dVPwEvc/sPuUy/IvFI221y0UquCFnNSFaY8o+8pdieF1ODpuYlfH1GNBpPoXUpuzH9sj+Hl/SMN/hmOIzLyInl1XnBK9jt8+PicNLV8Cr5BriInFnjmVJAGknRcvNAZXQrw3iFM679ahAO3nSsPD1tCypWOjAEAD9nwAt91Nv6GSTr4PWwv6Jp/mPhm7Y99H34zQHvbHD7mRBFvSxGTkVBZlPygwDkt8KWrwx754h+fs0nqWWFyzGpUJiFEv/vqcmwvllFNPp
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6528.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(366004)(136003)(396003)(39860400002)(376002)(346002)(6916009)(6512007)(26005)(69590400007)(6666004)(2906002)(52116002)(6486002)(86362001)(6506007)(4326008)(16526019)(186003)(8936002)(66476007)(66556008)(66946007)(2616005)(956004)(36756003)(478600001)(316002)(5660300002)(8676002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: YZZQtY/nO1D7y3IVaa8QjNMOVNPHoFtu+eu5jE8/fyAs11d1ZJ94cpft03w+1A/7JQ0oooG8irvPy3duAC+HzXcZL8a8zEMT+GQjavsSiurAudWGZlJCNAKsLL28hLFuE0tHOyxM5uFYbtr8otcM2ueWyRF2+z55D/6cNR3pDenpuyH40eH19fN8zdHEafduMjFlagwXOaLofk2xAyuXf/x+K8drMr26vv29srIe4b1ePsRvBYXufWwGbrHVrjgRf4t+Us61z9Wmuo09yychc9qrZnvYq16yK7zBDl7wid64fcdHHgAUbdzU8qVTuwa/uxOpypiu+PpgqBc+uotTP8V+cwQEvQQFLKRMt/3tt6rYOhuo6Aldf3QOJI6yJ5KjEaI4WNJc1IqaPUHQCQlZv+4Z03twuajdRmnMmMvHj4ZNQ0e2kCWp7y7mqk+SR/iUYCNjd0IDZseWosTbC1JT7BMdboBrHG+22mtHvocJbNA=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab026884-3b71-4ab0-7fca-08d7fd64de21
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2020 08:56:36.3807
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: REyangYrJAosH4ESxSNhF24sZ2so4wvod2wtta0m7JiIFtcPo5i7Jxzdg0Tec12p
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6605
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Yu Chen <chenyu56@huawei.com>

If the SS PHY is in P3, there is no pipe_clk, HW may use suspend_clk
for function, as suspend_clk is slow so EP command need more time to
complete, e.g, imx8M suspend_clk is 32K, set ep configuration will
take about 380us per below trace time stamp(44.286278 - 44.285897
= 0.000381):

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

This was originally found on Hisilicon Kirin Soc that need more time
for the device controller to clear the CmdAct of DEPCMD.

Signed-off-by: Yu Chen <chenyu56@huawei.com>
Signed-off-by: John Stultz <john.stultz@linaro.org>
Signed-off-by: Li Jun <jun.li@nxp.com>
---
 drivers/usb/dwc3/gadget.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index fea4fde..7739fe0 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -273,7 +273,7 @@ int dwc3_send_gadget_ep_cmd(struct dwc3_ep *dep, unsigned cmd,
 {
 	const struct usb_endpoint_descriptor *desc = dep->endpoint.desc;
 	struct dwc3		*dwc = dep->dwc;
-	u32			timeout = 1000;
+	u32			timeout = 5000;
 	u32			saved_config = 0;
 	u32			reg;
 
-- 
2.7.4

