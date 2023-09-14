Return-Path: <linux-usb+bounces-54-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 695737A0361
	for <lists+linux-usb@lfdr.de>; Thu, 14 Sep 2023 14:10:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 186082819E1
	for <lists+linux-usb@lfdr.de>; Thu, 14 Sep 2023 12:10:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81A8D21A09;
	Thu, 14 Sep 2023 12:07:26 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FB18208AC
	for <linux-usb@vger.kernel.org>; Thu, 14 Sep 2023 12:07:26 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2043.outbound.protection.outlook.com [40.107.21.43])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B4291BF4
	for <linux-usb@vger.kernel.org>; Thu, 14 Sep 2023 05:07:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WZ8BeYKih5N2fytNZGCsWOkhTJ/d9mPy2NYJdjPZdkkhGAT16n5nnpocvo2YZ0OBejSSNQ391R8cjNyzIwY8LezuT6immhRwk+oESMno7nPUOaxAWmnesIVFo2en/ExYw9QZPhwtPE2mFPBi8/NAE/pJGqFXSkO8gnWkFghjWHO1BsQTo8Q4PwvujTjSL/e7R0I1jpNpC4gPLyiJh+01yKkpNupgpIbsSxtMWb6iE7U6vbkS0PdqojKsu4pKNuh7Zde7Ni/okIMOvxIbozBQXcUHBBOvzPUmsOvXOPCApgRBLFEBRE5C/YIj7NhnvmohVzmp66CxTjFvmzxDqafkDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5Or3B6gtTrRI1Q5LJEpOoV7Khe7m90u31Q3bE8F7ogo=;
 b=oLaMt5ZP1IAU7eFHfSmkMJyfG4g8Eqv3c7WHXbKlHsCXYQ1D8UU2C7RupmX+ElZDYxSokY9HSK+zm5GKkloltRKQMhppZW5nA0eFuvt1c03FJxCTfKRPmQxQRIwu3W5KAAoI42ZbUEG3b6pb6fpXAnazoXU+kw0CYp4zbmagwd+eiORD2+NHSwEFx7k766wn5jhpwvbc8BgNAMlVJ4H5Kf+XMsohBZMT3eEnkyBv+GQ7I6jIkz+CfqNfZMI21lvsdGyh2/kCviBS6M6yq57IjkqnDgkjhT2cpM0sj+LftGPL1e4a66nEf0e8rRYfH6ZscbYB2rpiSiFrBgwoQAjy4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5Or3B6gtTrRI1Q5LJEpOoV7Khe7m90u31Q3bE8F7ogo=;
 b=KJ6cZbXCQqNijeYTRii3j/0qlobhhct3CrX6CZdyJlBez41GrOl4DlwYsBfygx32tt/ismyDU2wQn2CaKmqyOof98PWkqUn7WsUh9+BoL+vofJCIkp/TQTWD00u1ltfcB52b2OeUztq8D75W2fow2KFGNmMebvZcV3SVV64kyRk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB7PR04MB4505.eurprd04.prod.outlook.com (2603:10a6:5:39::26) by
 AM9PR04MB8486.eurprd04.prod.outlook.com (2603:10a6:20b:419::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.20; Thu, 14 Sep
 2023 12:07:22 +0000
Received: from DB7PR04MB4505.eurprd04.prod.outlook.com
 ([fe80::6444:e07a:e7f7:3923]) by DB7PR04MB4505.eurprd04.prod.outlook.com
 ([fe80::6444:e07a:e7f7:3923%7]) with mapi id 15.20.6792.020; Thu, 14 Sep 2023
 12:07:22 +0000
From: Xu Yang <xu.yang_2@nxp.com>
To: linux@roeck-us.net,
	heikki.krogerus@linux.intel.com
Cc: linux-usb@vger.kernel.org,
	gregkh@linuxfoundation.org,
	jun.li@nxp.com
Subject: [PATCH v2 1/2] usb: typec: tcpci: add check code for tcpci/regmap_read/write()
Date: Thu, 14 Sep 2023 20:11:57 +0800
Message-Id: <20230914121158.2955900-1-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR04CA0207.apcprd04.prod.outlook.com
 (2603:1096:4:187::9) To DB7PR04MB4505.eurprd04.prod.outlook.com
 (2603:10a6:5:39::26)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB7PR04MB4505:EE_|AM9PR04MB8486:EE_
X-MS-Office365-Filtering-Correlation-Id: 73b4299e-ab83-40fb-5346-08dbb51b26d8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	elY0G+3E3Hx8oeN5xIYnC8gVRcOGnXgXzoZis0QnYizV9Suo4QUJK9gIPHhhDHHllNIqSiqQ8S88x33z899gnUMn2wz+zDYrxCKK7HEIEU0JnizvwyirblMCnudo9FTOGFIdv2ZZ+pC9S4yjyTl+NeEyQktUU/gYnWBs/NaSFhylNuIE6wmIF6EA4Ad+KQFv6uILDtKT5RDrJVK++j4bj8co/+JnsuOmJ4Cwv22SC/K4nB2q53DKFFyo94nuoHZkgXroivdU9WnR5EU5qI+9XnEY/A13gKF5KSod1mq8qrhW0GOZm1P/apwdnJLSC3kdgiu1TSGv4UVdnDiQ3jd8RsH/hghWQ/3lWvArTrRk+us9nnf6w4Fk9PfVRk+6TsgabGKejrYGO2JbHuhsJ7SqDl4ZYv2RKGbhdwMOjlQVMdTS0Jl1UQ9mg7j2XNpTu0Z9rmrSsebVJvkdYDgYcP064clg0wS7j40amY1LScoUFjiHHXkBZnk1J9Nd45ivERc9x1rLzaUfdfEXEkfz6D6wNdaDX5TBT58LpAWmBvys+K2uXg3OxdCGrPtllwW5YdCXPEEXCdwamk9bTjKg1dAGnGkX5krvfWign8jx/8V0DeY2uFNt/8jHAKj19fwfTUWj
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR04MB4505.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(346002)(376002)(366004)(136003)(396003)(1800799009)(451199024)(186009)(36756003)(38350700002)(38100700002)(86362001)(6666004)(478600001)(1076003)(26005)(5660300002)(52116002)(66946007)(6486002)(6506007)(66476007)(316002)(66556008)(6512007)(41300700001)(4326008)(2616005)(8676002)(8936002)(2906002)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?edYG1Cx2weBnT4pDuxvd4S67mpZxmcMDjrm9VtsQSvwyAp6Za9UQxYD6XsIW?=
 =?us-ascii?Q?ukCdxWjk/LlglDhLQJwKob0fcrSXWJHfzKOUzCrxAQUop7OCyq32wNyX+jfv?=
 =?us-ascii?Q?fFxv8V2GQNXwrjppmTFvlIRcyq9EJLWlHnqmdksJbCYMo0pHjDlhheoIxB0d?=
 =?us-ascii?Q?TcnxQKOVioa0m3xrHpdJ0NQ4evqgqovtBWKn0gYVMQ7P65/ni7sXiJ/0TDre?=
 =?us-ascii?Q?eUU++Doed7pxjqn2TnO4aT41tNKr/DcuIgl9ZIsVrsxHEfxlEVAHyVTSdy9f?=
 =?us-ascii?Q?2wgsZNYMOq0lptah1PCIlu51eTH/l7Vvaocn1dZMqn64eQ3oEfUzoZIIIXO3?=
 =?us-ascii?Q?+YfgYcXvkUvM/ctp0AOl8ZJNF4XNBfn54vk3HmYZXviOPN8BJ8jY0WLEf0iY?=
 =?us-ascii?Q?2U5EsITjLUT0kkXGHeBiedybmaEme9BdIOJ7KoqbrLCSbIZw3oRjHuSftFLo?=
 =?us-ascii?Q?E9vyP+8q0aOcRonUqkCTFrdP8feZR1nUWxXbq3iPb+bsjUG29hhz/a5hMsfL?=
 =?us-ascii?Q?ig2NotvMhO+D9B4Dn8IDBVmXqocTq7mpe1qt6UA0sPel8HMAlPoPHjSDgRSk?=
 =?us-ascii?Q?lT8dgLXkdiTOWgw3vvEFQGjKxkeppL4+clJ9mbBYumv4wzdEGESgW7k8Epqf?=
 =?us-ascii?Q?jh7Oqn8TR+Fblk8vbCwTGMu0bQojC9j2KctzTgiM9Xr4DsxGSxlgwq2EyIs2?=
 =?us-ascii?Q?xyurl4s16vzZ8fsLK19oDw1Y+j5Nm5LemRSESr1szOdGQt+ClVqPV9hK1+Jz?=
 =?us-ascii?Q?n1jTmGaD8o1fHVcPwiCW5WGWdajB6Y85JSMKgoYfK8tjcB84GWapKv/BsziB?=
 =?us-ascii?Q?19S16lRuK4KUIOy2EyAIaeaAGCrpaOgfaO8xg9T88jsiFqOU1dtQ/OWd24JG?=
 =?us-ascii?Q?vVGFHKUCRq8GZuDQk0lCN3Vxy9DN7+kprUrCpU5HIvp8M3wwx40teKQ1pDma?=
 =?us-ascii?Q?CwAXTej0lStCQYpjmoqgb2x39ksN9KHk4lDDFNbQw3TikQW7OZs+dW1R2k/+?=
 =?us-ascii?Q?l4JT/poQRmH1xg3e4jNJBz6K4gHlqlxctMa+qB+zaWlhh9PCfvu0sZFy1kM4?=
 =?us-ascii?Q?YFrEd/tzXrrLiEJB/Ob1elYxIdSwcbBtq4YN+XiHGjW8vGkQdiZG2ERj0fsP?=
 =?us-ascii?Q?sOiRW77P54KRhz4JN+W/P+1DtDqgVIzSSL/F5Pi2UB9h2YL161x3vBbbKHWU?=
 =?us-ascii?Q?6sq2p832g0Yh9aR6Qh1s3f+J3y9IOidnhh+pnLlyK970Phu+DKJ1U4Q83krk?=
 =?us-ascii?Q?Tg0EjSOPYTVyWajHydhbZ1mOMXAh9mZpS/+ybfxg8OhiKVDsLtCBsu6MvYv2?=
 =?us-ascii?Q?IT1Kpr+ZoZhAKNprG0JXyqNdZk++x/X+8PqU5RkBMkAIjKOyxYbyypHKWmJN?=
 =?us-ascii?Q?hdTLvV34D8McP6bKo6TsSh2n/yjodzr5S1gTtN4ueTeuJMLCNzjwMmziasRW?=
 =?us-ascii?Q?IKyzT5cX9/GQ7Yn0jtsmlNFVrWc8MRtbRkAPmMYLZnhcvvGFf5cAlzD/mr43?=
 =?us-ascii?Q?te8z2RYIIZoGnQ9MGu4VG8XagJMQdV1Fr5GLt+zmSkKK9XmGdUhlJ7muysAT?=
 =?us-ascii?Q?rCQ6RoTUtvJtILEZyKF3ZiDLFWduOFNg32ZOl7od?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 73b4299e-ab83-40fb-5346-08dbb51b26d8
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB4505.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2023 12:07:22.6050
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +8PqfEiOpsp2XM8hp5z2pUeo2fMrbUT1EoySChWteDfiPysm4H0QDaSnm080N/mXaNo9b+9wV9uRnIHuU2sgow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8486

The return value from tcpci/regmap_read/write() must be checked to get
rid of the bad influence of other modules. This will add check code for
all of the rest read/write() callbacks and will show error when failed
to get ALERT register.

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

---
Changes in v2:
 - remove printing code
---
 drivers/usb/typec/tcpm/tcpci.c | 34 +++++++++++++++++++++++++---------
 1 file changed, 25 insertions(+), 9 deletions(-)

diff --git a/drivers/usb/typec/tcpm/tcpci.c b/drivers/usb/typec/tcpm/tcpci.c
index 0ee3e6e29bb1..8ccc2d1a8ffc 100644
--- a/drivers/usb/typec/tcpm/tcpci.c
+++ b/drivers/usb/typec/tcpm/tcpci.c
@@ -657,21 +657,28 @@ irqreturn_t tcpci_irq(struct tcpci *tcpci)
 	int ret;
 	unsigned int raw;
 
-	tcpci_read16(tcpci, TCPC_ALERT, &status);
+	ret = tcpci_read16(tcpci, TCPC_ALERT, &status);
+	if (ret < 0)
+		return ret;
 
 	/*
 	 * Clear alert status for everything except RX_STATUS, which shouldn't
 	 * be cleared until we have successfully retrieved message.
 	 */
-	if (status & ~TCPC_ALERT_RX_STATUS)
-		tcpci_write16(tcpci, TCPC_ALERT,
+	if (status & ~TCPC_ALERT_RX_STATUS) {
+		ret = tcpci_write16(tcpci, TCPC_ALERT,
 			      status & ~TCPC_ALERT_RX_STATUS);
+		if (ret < 0)
+			return ret;
+	}
 
 	if (status & TCPC_ALERT_CC_STATUS)
 		tcpm_cc_change(tcpci->port);
 
 	if (status & TCPC_ALERT_POWER_STATUS) {
-		regmap_read(tcpci->regmap, TCPC_POWER_STATUS_MASK, &raw);
+		ret = regmap_read(tcpci->regmap, TCPC_POWER_STATUS_MASK, &raw);
+		if (ret < 0)
+			return ret;
 		/*
 		 * If power status mask has been reset, then the TCPC
 		 * has reset.
@@ -687,7 +694,9 @@ irqreturn_t tcpci_irq(struct tcpci *tcpci)
 		unsigned int cnt, payload_cnt;
 		u16 header;
 
-		regmap_read(tcpci->regmap, TCPC_RX_BYTE_CNT, &cnt);
+		ret = regmap_read(tcpci->regmap, TCPC_RX_BYTE_CNT, &cnt);
+		if (ret < 0)
+			return ret;
 		/*
 		 * 'cnt' corresponds to READABLE_BYTE_COUNT in section 4.4.14
 		 * of the TCPCI spec [Rev 2.0 Ver 1.0 October 2017] and is
@@ -699,18 +708,25 @@ irqreturn_t tcpci_irq(struct tcpci *tcpci)
 		else
 			payload_cnt = 0;
 
-		tcpci_read16(tcpci, TCPC_RX_HDR, &header);
+		ret = tcpci_read16(tcpci, TCPC_RX_HDR, &header);
+		if (ret < 0)
+			return ret;
 		msg.header = cpu_to_le16(header);
 
 		if (WARN_ON(payload_cnt > sizeof(msg.payload)))
 			payload_cnt = sizeof(msg.payload);
 
-		if (payload_cnt > 0)
-			regmap_raw_read(tcpci->regmap, TCPC_RX_DATA,
+		if (payload_cnt > 0) {
+			ret = regmap_raw_read(tcpci->regmap, TCPC_RX_DATA,
 					&msg.payload, payload_cnt);
+			if (ret < 0)
+				return ret;
+		}
 
 		/* Read complete, clear RX status alert bit */
-		tcpci_write16(tcpci, TCPC_ALERT, TCPC_ALERT_RX_STATUS);
+		ret = tcpci_write16(tcpci, TCPC_ALERT, TCPC_ALERT_RX_STATUS);
+		if (ret < 0)
+			return ret;
 
 		tcpm_pd_receive(tcpci->port, &msg);
 	}
-- 
2.34.1


