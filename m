Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7D961164A3A
	for <lists+linux-usb@lfdr.de>; Wed, 19 Feb 2020 17:26:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726652AbgBSQ0H (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 19 Feb 2020 11:26:07 -0500
Received: from mail-eopbgr50080.outbound.protection.outlook.com ([40.107.5.80]:31139
        "EHLO EUR03-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726514AbgBSQ0H (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 19 Feb 2020 11:26:07 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eC7NG0//dhP4H1voEcRUEIHhxPeIxiDmM+3p/YKHRAOhmrMDU1kNV8+9BE2H9nynA/j3AIwuyEoLcS+SSs5qwVOrGdX7O8Mt2L5adY3r532jk4BqUkFvh9rFRE5vWGq2ujZ9+I6rPs9EMthhPYQozJA3AxdDMsK4CLCZvnxL/AvbRH/qI5cKQx0CZ0zrBbCRh8mLbdzMq3E7xdSP6FNCwZ78v31ZjpgxBU11YQj1FRdkKmKF0V85Dyv+wJ2OliOzwv6JwW1U4BgPdUJROLrI9A17JIQHdsfaNIe6htlEVIfLDDfaODDohx2M2ETeUgrVHVZJvJYUS4zIAmjbveYqKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GrjTSVGSbU7bLqjpsYIhTXbL4W72rvRI359cQiLlnew=;
 b=PSp5wYCrDNFs755cejpfiKKMUwPV4Dpk9IsXgnwvUPakArvY2OxBdIiAcmG5YWWzAOZXF6GvjMseTlUSZy3+8XtCgFSZ4NEBbjVSN2ScvAmjRPmUGIlSdv5QbRcAzuzUBvZfeVWMChqO7D2r3C5Aml7W8GaYgfM5kotHTyLE9iVCENIvFg2aoT9DhuWmaQTmWz+0R5cfnkavREuiyQUEvIJP49kPkgqJXYHW8xqM6SI9JBNmZ0x4e8Ad5+dNn3O66gMCKAi4GB2vbvKTqswLr0HILS+gxj/5uzeYvmx+VMq1uauBxWuVdNn4J/LH+dnnotX3gJQ2P69t3HmE06A4iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GrjTSVGSbU7bLqjpsYIhTXbL4W72rvRI359cQiLlnew=;
 b=X3kRJ1IPeNJQZkCBymeMsBTNTzZZHPPjsR+aCctyTDZOIZKWNZMEB2vNmy8cwmcRvpq9/qTDH4BklaiVkDuXfNItTqJ7wur4Yyb2yKG88ek8Q26FAjvbCmoc9s3iXNX2Zjwg1th4HJEfqE4K/5wSFi2j1l4Pt9R8G9p7st//6rg=
Authentication-Results: spf=none (sender IP is ) smtp.mailfrom=jun.li@nxp.com; 
Received: from VE1PR04MB6528.eurprd04.prod.outlook.com (20.179.235.146) by
 VE1PR04MB6413.eurprd04.prod.outlook.com (20.179.232.94) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2729.29; Wed, 19 Feb 2020 16:26:03 +0000
Received: from VE1PR04MB6528.eurprd04.prod.outlook.com
 ([fe80::ccb0:7d6d:adfa:423c]) by VE1PR04MB6528.eurprd04.prod.outlook.com
 ([fe80::ccb0:7d6d:adfa:423c%4]) with mapi id 15.20.2729.032; Wed, 19 Feb 2020
 16:26:03 +0000
From:   jun.li@nxp.com
To:     balbi@kernel.org
Cc:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        linux-imx@nxp.com, jun.li@nxp.com
Subject: [PATCH] usb: dwc3: core: don't do suspend for device mode if already suspended
Date:   Thu, 20 Feb 2020 00:20:04 +0800
Message-Id: <1582129204-22528-1-git-send-email-jun.li@nxp.com>
X-Mailer: git-send-email 2.7.4
Content-Type: text/plain
X-ClientProxiedBy: HK2PR06CA0015.apcprd06.prod.outlook.com
 (2603:1096:202:2e::27) To VE1PR04MB6528.eurprd04.prod.outlook.com
 (2603:10a6:803:127::18)
MIME-Version: 1.0
Received: from localhost.localdomain (119.31.174.66) by HK2PR06CA0015.apcprd06.prod.outlook.com (2603:1096:202:2e::27) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.2729.24 via Frontend Transport; Wed, 19 Feb 2020 16:26:01 +0000
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [119.31.174.66]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 4a2add80-2154-45d1-59fc-08d7b55869b5
X-MS-TrafficTypeDiagnostic: VE1PR04MB6413:|VE1PR04MB6413:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VE1PR04MB641321C073B0E77ED0BDD28D89100@VE1PR04MB6413.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2449;
X-Forefront-PRVS: 0318501FAE
X-Forefront-Antispam-Report: SFV:NSPM;SFS:(10009020)(4636009)(396003)(346002)(376002)(136003)(39860400002)(366004)(199004)(189003)(66556008)(66476007)(81156014)(8676002)(66946007)(81166006)(8936002)(15650500001)(69590400006)(2616005)(2906002)(4326008)(9686003)(36756003)(26005)(6512007)(478600001)(52116002)(6486002)(86362001)(316002)(186003)(956004)(16526019)(4744005)(6916009)(5660300002)(6506007);DIR:OUT;SFP:1101;SCL:1;SRVR:VE1PR04MB6413;H:VE1PR04MB6528.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
Received-SPF: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Sp2FdihhbKIJ87r969TZUAOSvyIm++uzoQuK0sJ3X9kB1MJV1g9GTuNWqYzg2q+blqd9zzLb4VegaeGRiYYE2QpXMILTPHbk/8QPTfl0BRtWeGRv5/g962z+LOeZfhMZAfqjcqWFs2AByoIRJImgA75GFGAuVKoLO1nSJBXjHp2TKd9Tk0Q593B6Sh5lgWUQSRAyC1kmumGs2/7tdr+N7qJGh/jXo3vYJH4YnneD/gLmow8uLThAKsCPHvU8p2BPKqrNm3k+SBg2x0R8Xpx4mrF2b1erP6IiNS5q8WrPPad3MJShMZrYS8n/BSXE/ZyO2A8Kf6Fag3hjzwibBz0lh+ysh+mgLEQAha4QO01gdOM6ye0KBxFmqinF1Pxf5k8K092BaDtLBKbAxIUDfWduazSV5WRIKFsS+A/HFm8MhmvbvY6vrKpskois7KdHqWlgayLadZ8jOtdrWmHcmApC4u8Zpt25OUNm4J2cxQmcaOpHI06z/VU4akIgSgLP20Zf4bK9iNYF0TAIJZ3q9SU+YTRh44MOd4LZ0WQ/3h85jVI=
X-MS-Exchange-AntiSpam-MessageData: LSdTlt0cuVPfW/H43j4ScFjbrEAoeXER9CSwE0M1HE1/zE2FPhatu+QchNDQPXVwaEiTP231kpfNmh7mzCFvIzQeEBKHxJ7IfAAaEUxBNWW3AQHvZ7lfNjO4IZjYq3LvsF7SLYzuHLjfgwn8s7LgPA==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a2add80-2154-45d1-59fc-08d7b55869b5
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2020 16:26:03.5064
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Tu5eu7qS+HHQcBoxzPEjJhJ3Fp+L7r9+brvhpuQItPEeyc7NANwiuMEhxJpZC7s+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6413
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Li Jun <jun.li@nxp.com>

If dwc->dev in device mode already runtime suspended, don't do it again
for system suspend.

Signed-off-by: Li Jun <jun.li@nxp.com>
---
 drivers/usb/dwc3/core.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index 1d85c42..51dc844 100644
--- a/drivers/usb/dwc3/core.c
+++ b/drivers/usb/dwc3/core.c
@@ -1637,6 +1637,8 @@ static int dwc3_suspend_common(struct dwc3 *dwc, pm_message_t msg)
 
 	switch (dwc->current_dr_role) {
 	case DWC3_GCTL_PRTCAP_DEVICE:
+		if (pm_runtime_suspended(dwc->dev))
+			break;
 		spin_lock_irqsave(&dwc->lock, flags);
 		dwc3_gadget_suspend(dwc);
 		spin_unlock_irqrestore(&dwc->lock, flags);
-- 
2.7.4

