Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 165A0455B20
	for <lists+linux-usb@lfdr.de>; Thu, 18 Nov 2021 13:01:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344446AbhKRMEx (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 18 Nov 2021 07:04:53 -0500
Received: from mail-co1nam11on2066.outbound.protection.outlook.com ([40.107.220.66]:20865
        "EHLO NAM11-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1344416AbhKRMEu (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 18 Nov 2021 07:04:50 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MZDxGMJDWe1h97T6GA0LmPHeYxJK1G2ihRdKvR0+hP5mjV6fJqpJnd1OpI2xMBEQFKjeHgBfvB3+/xbvH+g5FpTPEEJfrjXbVBZi6k7sdPqQBBpaT1vWeMMavSH36B5dug17HE590pUbTeAWDxmb1v2HsFSBRiAlvcJnIJgAQ5paRIkzGUQsMWGa2M9wZL8zQMCw1QYJrZpQynugtEjcRv60HOOQR3YUJVi+/0gLcNOn3sSRlhdIa4fmqKbDq3bej58Xa9SQXo8NUpeHYQlztW7hlnVV8PnU/hIgpWC+vEe8UnjibGjHx++GO4bwWoZKslPPHHeqLp+ahQy8A0EZcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ldsqx9Nq8j44eQETQNbCm3M7fKgqZ2v6VdzGUKzlBTY=;
 b=klOAnmM5ppkidMZFAgHkiMjanSTN0498zNArGxVX5cn64hiIPm5PiM8LkfVoby5RzGccwjmO+hkPj+JidcMQeKLWEYtc9qrNAs2CY91M7k+pnALg2fFgBFKcaLuEjxYS6IUQgCYcy2/+AvpN8rZhMClGMVQusBZr2c0xJQFqM4Lh+kpGtZWx3boJDAmXpV4wzosNhGER3Ouk4KBTubPnQ2gX5oXJxuK971ik61YsgZd8zS1VBxs3ymdGWcoE+59W1LT52JD82f/VxE14YBW0+4ZkJzT+ZsCk63ZGRXRGp99/dqXO9zyenvPNGlYIxlznMmQLtxc3GP3CFY9fjOTvFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ldsqx9Nq8j44eQETQNbCm3M7fKgqZ2v6VdzGUKzlBTY=;
 b=RW/iV8TI9HpgTnpSJ+r0c1BYCqfiHuaAivfjxSO+2BbSIs+pKKMQlSDy47DP8I2hG5LcC2Y1w3llbllmScEsVyNaM+vxC9ert3Rr1UjHZKUBVOIoC1sDL6VBxpN/yP+mRymunPEpFPwOnzsxWbdKANaty4HA6MYcOtmDCias5tM=
Received: from SA9PR10CA0005.namprd10.prod.outlook.com (2603:10b6:806:a7::10)
 by DM6PR02MB3978.namprd02.prod.outlook.com (2603:10b6:5:98::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.17; Thu, 18 Nov
 2021 12:01:49 +0000
Received: from SN1NAM02FT0056.eop-nam02.prod.protection.outlook.com
 (2603:10b6:806:a7:cafe::c9) by SA9PR10CA0005.outlook.office365.com
 (2603:10b6:806:a7::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.22 via Frontend
 Transport; Thu, 18 Nov 2021 12:01:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 SN1NAM02FT0056.mail.protection.outlook.com (10.97.4.111) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4713.19 via Frontend Transport; Thu, 18 Nov 2021 12:01:49 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Thu, 18 Nov 2021 04:01:48 -0800
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Thu, 18 Nov 2021 04:01:48 -0800
Envelope-to: linux-usb@vger.kernel.org,
 shubhrajyoti.datta@gmail.com,
 gregkh@linuxfoundation.org,
 balbi@kernel.org
Received: from [10.140.6.59] (port=58964 helo=xhdshubhraj40.xilinx.com)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <shubhrajyoti.datta@xilinx.com>)
        id 1mng6s-0000rg-On; Thu, 18 Nov 2021 04:01:47 -0800
From:   Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
To:     <linux-usb@vger.kernel.org>
CC:     <git-dev@xilinx.com>, <shubhrajyoti.datta@gmail.com>,
        <gregkh@linuxfoundation.org>, <balbi@kernel.org>,
        Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
Subject: [PATCH v2] usb: xilinx: Add suspend resume support
Date:   Thu, 18 Nov 2021 17:31:43 +0530
Message-ID: <20211118120143.1079-1-shubhrajyoti.datta@xilinx.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d795f298-2108-4c13-602d-08d9aa8b33ab
X-MS-TrafficTypeDiagnostic: DM6PR02MB3978:
X-Microsoft-Antispam-PRVS: <DM6PR02MB3978349F09AE31F7CB032A04AA9B9@DM6PR02MB3978.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: avW/jv7kgFaBt/C0Y9co08W+ByvCiKhg8H1U+jUTY+Z8w6vYnPXk9BOUHI144XNF53ZM5+4MX+p55YFjbzMgVQ7S9QH1x9pAjeowp3xYdBZws2Eeo3hpA3yaJTWAPTE1HCcXqZNKO7zr+3UEOHIXwb//4QcOPFioiNrIbbdKoR2CYszstkGoh4io3UnAB3NkuyC0YBMDPt9uxMHKVUazZZOxnUwAYH1viqWLV6514X3cFKInrKvCmRYLPjvy2GOzBuolrbU+bQ3rxJLu/fWOxQO7wGF60IKf5Fs5l3sfGBjeLPTlhWp8781vpazGru+BzWN6GogSl89z72Ceqgwt0lMT9pCaWarzYEQ0cJXdP7UYAF0P4rGaIy2RFH/xmCFHKyxTII4UmKeOktm7e0P+QqVBFVe28MAicUUB18qOjtf31PtOvyRCZEPjzGblKsmcBOK7fX+iikWlu6rqT9K5K8YFMg6M6TIzMRa3/oGW9UswycP2+F8J3vJrn1tLfQcHFVGSc1mx4sZniJmwM9KpIDmSY22OLJBmBmHd/oWjVB2Y046G15+rJSCR0cJLDv74FlBYx+jkUjasGyklG/BoQGylPjFiUY+sJ3xGB2TtyiUxx0o9nPrzkcjdDVONAkC2mTX2MetdsAXqEmjnPqboeAOG4kA+UdnIJk49KufYGsNLyYgk9cq47KfVcahYcOMof4DxQbf9Fcu+DeVhjL5WS+iUGbBBqHnR2P6gyKG0agk=
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch01.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(36840700001)(46966006)(186003)(1076003)(5660300002)(508600001)(83380400001)(26005)(4326008)(36860700001)(8676002)(2906002)(9786002)(82310400003)(7636003)(70206006)(356005)(107886003)(6666004)(2616005)(316002)(36756003)(426003)(54906003)(7696005)(47076005)(6916009)(8936002)(15650500001)(70586007)(44832011)(336012)(36906005)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2021 12:01:49.2871
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d795f298-2108-4c13-602d-08d9aa8b33ab
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1NAM02FT0056.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB3978
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Add suspend resume support. In the suspend udc is suspended
and it is set to ready at resume for it to be functional.

Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
---
v2: Call suspend instead of disconnect

 drivers/usb/gadget/udc/udc-xilinx.c | 56 +++++++++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/drivers/usb/gadget/udc/udc-xilinx.c b/drivers/usb/gadget/udc/udc-xilinx.c
index 30070a488c87..a0570b9d722f 100644
--- a/drivers/usb/gadget/udc/udc-xilinx.c
+++ b/drivers/usb/gadget/udc/udc-xilinx.c
@@ -2175,6 +2175,61 @@ static int xudc_remove(struct platform_device *pdev)
 	return 0;
 }
 
+#ifdef CONFIG_PM_SLEEP
+static int xudc_suspend(struct device *dev)
+{
+	struct xusb_udc *udc;
+	u32 crtlreg;
+	unsigned long flags;
+
+	udc = dev_get_drvdata(dev);
+
+	spin_lock_irqsave(&udc->lock, flags);
+
+	crtlreg = udc->read_fn(udc->addr + XUSB_CONTROL_OFFSET);
+	crtlreg &= ~XUSB_CONTROL_USB_READY_MASK;
+
+	udc->write_fn(udc->addr, XUSB_CONTROL_OFFSET, crtlreg);
+
+	spin_unlock_irqrestore(&udc->lock, flags);
+	if (udc->driver && udc->driver->suspend)
+		udc->driver->suspend(&udc->gadget);
+
+	clk_disable(udc->clk);
+
+	return 0;
+}
+
+static int xudc_resume(struct device *dev)
+{
+	struct xusb_udc *udc;
+	u32 crtlreg;
+	unsigned long flags;
+	int ret;
+
+	udc = dev_get_drvdata(dev);
+
+	ret = clk_enable(udc->clk);
+	if (ret < 0)
+		return ret;
+
+	spin_lock_irqsave(&udc->lock, flags);
+
+	crtlreg = udc->read_fn(udc->addr + XUSB_CONTROL_OFFSET);
+	crtlreg |= XUSB_CONTROL_USB_READY_MASK;
+
+	udc->write_fn(udc->addr, XUSB_CONTROL_OFFSET, crtlreg);
+
+	spin_unlock_irqrestore(&udc->lock, flags);
+
+	return 0;
+}
+#endif /* CONFIG_PM_SLEEP */
+
+static const struct dev_pm_ops xudc_pm_ops = {
+	SET_SYSTEM_SLEEP_PM_OPS(xudc_suspend, xudc_resume)
+};
+
 /* Match table for of_platform binding */
 static const struct of_device_id usb_of_match[] = {
 	{ .compatible = "xlnx,usb2-device-4.00.a", },
@@ -2186,6 +2241,7 @@ static struct platform_driver xudc_driver = {
 	.driver = {
 		.name = driver_name,
 		.of_match_table = usb_of_match,
+		.pm	= &xudc_pm_ops,
 	},
 	.probe = xudc_probe,
 	.remove = xudc_remove,
-- 
2.17.1

