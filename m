Return-Path: <linux-usb+bounces-52-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F2FB27A0356
	for <lists+linux-usb@lfdr.de>; Thu, 14 Sep 2023 14:05:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8F7AEB20BA2
	for <lists+linux-usb@lfdr.de>; Thu, 14 Sep 2023 12:05:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B01FF219E8;
	Thu, 14 Sep 2023 12:05:00 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8312A208BC
	for <linux-usb@vger.kernel.org>; Thu, 14 Sep 2023 12:05:00 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2051.outbound.protection.outlook.com [40.107.21.51])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC0F11BF4
	for <linux-usb@vger.kernel.org>; Thu, 14 Sep 2023 05:04:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nToJTc78VV6au9jLbafUryqjanD5XIsJwRXREja8H8syk8yQSxfsFTLPgNHxgQCgf9gRDPR1hdTX65kIE+Lc+AYpeFwd7MRUDgN1HMPMvQBe8YL48yygziMVXe1UrM2cO3h5hKAqxkH+Xy1U6JntVirM4Ng3BEmV1YhfHBA0UBb/2xZn/wMPIdbzYaFwwAPcwyqe0BS02W6RrgXwe7RBHdQSQbaydjHg+GAmpqFhh5y9iVmHe7a1aho/ogPfD+YxVoRrUIflCIKLpEUyBr/MBxnv1ljScTuIcMS1ICKfqazfiEfFOf7dBX4LtP3m3OUnz6zy5/fPkVZNqiKiPDmPiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5Or3B6gtTrRI1Q5LJEpOoV7Khe7m90u31Q3bE8F7ogo=;
 b=ljKZLW4Uv+rfwpWIjvFnSarOiWGae5tl/dkFNyLYw/EjSZ+GjsaAF4UCgQrCrKF6U0/dcaIClKfDq7M2FnWuUxvHGWyJvve1KWeXpm/FZ1eLYZgdjxHDlx6Cupgnrs+aVs+RJIqG40yKBUFj7PKWhszBfkQlPGV5FPhyUuMgnGX4+M+3cDH8YDiXQ/NpEkxhBzAzNqkwR0CCoqX7p73w0OvBF5MRMzpcPNsQmHUSoBiLIeZj+E9Y9ZGsRsdbUvU2Uhi2MLEDxv9C1LuME31CinHbFiUqiEKuIT/byxI3UZFiwpvReHicgmjaudv3/F0bJHSfF3l3yFgsoufTBqdziQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5Or3B6gtTrRI1Q5LJEpOoV7Khe7m90u31Q3bE8F7ogo=;
 b=rLmeJmCC34QV+r7ifhmYGN9Lb2g6QXSwe4N5EIJqUdIGvuV8ZmfZtMUK3KOJL1Sv79Jm4Ng5LHY0reD01K9i+gC2ujvH8af+eHvOiLLz0afW7JiGAZysyaotQDRkLn0ZqxfiZ3WPwcBgOKdW3VouIxFusMKRXKPYuqonzsJMoBk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB7PR04MB4505.eurprd04.prod.outlook.com (2603:10a6:5:39::26) by
 PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6768.34; Thu, 14 Sep 2023 12:04:57 +0000
Received: from DB7PR04MB4505.eurprd04.prod.outlook.com
 ([fe80::6444:e07a:e7f7:3923]) by DB7PR04MB4505.eurprd04.prod.outlook.com
 ([fe80::6444:e07a:e7f7:3923%7]) with mapi id 15.20.6792.020; Thu, 14 Sep 2023
 12:04:57 +0000
From: Xu Yang <xu.yang_2@nxp.com>
To: linux@roeck-us.net,
	heikki.krogerus@linux.intel.com
Cc: linux-usb@vger.kernel.org,
	gregkh@linuxfoundation.org,
	jun.li@nxp.com
Subject: [PATCH 1/2] usb: typec: tcpci: add check code for tcpci/regmap_read/write()
Date: Thu, 14 Sep 2023 20:09:35 +0800
Message-Id: <20230914120936.2955817-1-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0001.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::15) To DB7PR04MB4505.eurprd04.prod.outlook.com
 (2603:10a6:5:39::26)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB7PR04MB4505:EE_|PA4PR04MB9366:EE_
X-MS-Office365-Filtering-Correlation-Id: 37300bf8-99f3-4a2d-0b47-08dbb51ad050
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	4jTCo1VH6AA8/G4WhlStRYVp2oz6Kzwq6iNeArMJ99tau21pHkVtiUXoRRZQ/tnL8o/gZo8X/t2AB6OAd/gjNyip9FURggww6SKbqMWHTYw6OEgSBZHLzro2UEcR435MgUBgRjr4BMyeYPQTZatilTi1HtipiuMd8gsKyzR1fa8LXkiGHYOSQ+SzoRBESc1stXstCR64daRGysh1VoPlZ/rySh2UnSPnNAf2v9nfGerbZZ82/kBDc4bRRck2qo5uD1zDZrFObKjfZD+8IX5v6q8nzm1YEptbitWVCniG37TbiUZ89MWXFkVomjZwHD/7lFV3V0KpBN5PQGMrPzLC/04Gzih6JYJw+1gmVp+M7IEGihoozXjAf1CIgaGb7D/ecKQlK2wt7XFfUpHEXvomHb5uVSCv0HIbp4T+Fp2qi2vqgwx+KfAxtw/yM4Xdat8N1x9xB5eGGpzhIjJDv6HN2ANQVkw40W0PC6trpdgEsfnEi4sUqnZcTYNRzfmTI9LhptkBwSYHjbx4i8L0TA0wnj1UIoeBL9XFF2bNq/WuP+qFlrUAZuOc0wdnNaZoJbsdJxJPg3oEMBpEtqJMGv094QVV7VAnXSiQWCXlptGZNhplqL51XoNBVk6YiTPcvu4d
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR04MB4505.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(396003)(136003)(366004)(39860400002)(346002)(451199024)(186009)(1800799009)(2906002)(26005)(1076003)(41300700001)(66946007)(316002)(66556008)(66476007)(5660300002)(478600001)(8676002)(8936002)(4326008)(6666004)(6512007)(52116002)(6486002)(6506007)(2616005)(36756003)(86362001)(83380400001)(38350700002)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?9VcXJyIOweug1mVOQ5IvYhSDCEiWabEzMxu7aEDLUq296xnsQOCRVJUKAP5b?=
 =?us-ascii?Q?vnGVM4QJmoBy0dDgXmHZ/J9pBKVduN4UtAHV+RpK6foyWVflex67zG/ciCyv?=
 =?us-ascii?Q?ebLj7sAMD3w0scpSPcXLipRY49tXC3mA15JOCIaZAVoAyTWLfzLOOCrJ9pTf?=
 =?us-ascii?Q?0HRHxDK2RvZlg9DMrT5Xd2XUd0wqsS7TApomGVgOAvdVwhpYcWp9BnDPbakz?=
 =?us-ascii?Q?PZzde7+Nfh5UIelWNon9pVs9x+LpLWSgf/4tGC1r5ktiLDabX/+6J/kTm0yt?=
 =?us-ascii?Q?uFO4wymeSgKaHPJXzNyuhy8iUy3UjvVAJjfnUqlRfElt9tw14IgnnM4yroIN?=
 =?us-ascii?Q?/tLVrEe4RLIINnyihsmN2w9Wm6WvE43Nd3KQWTj2pEQ1Phox5Yjx4YXIpbsS?=
 =?us-ascii?Q?evKCOWpfYNSuFyz5axdJGjjz7SilMxWJ9zO9Tn8OzMXc0zepmbcLcSzhy6Xo?=
 =?us-ascii?Q?bUOfQN4/CIuB4+4Cz3/MDXcazGNj9d6Agb6yC5JUPO6m9OHGuE0m3GI1339T?=
 =?us-ascii?Q?H4/LrZpPU0U17IzBTov5bFOq4OTw7jBUdEhibC4u+N4KtJ8GiiAMHXz03HXi?=
 =?us-ascii?Q?hEP3yjVmqahgXVSem1Q+tpG0WQGVi4zdpS3RIY8M/sEmSBShRKRoCAyqnt9D?=
 =?us-ascii?Q?jtU6zUv2ScZT997Ilbae1c3fjvn5LQvLE+oLM/1SjIozr7tz5fWUCYTa8Vzj?=
 =?us-ascii?Q?g6ZLNDjiTFu2lxGU+b3leJrO3kVDG1gpdlHd6qFISyiuzFSC2//06L4B5tGa?=
 =?us-ascii?Q?L+80DQ1GEG/6HQ9yaZnQUrJSFhRRmM4SPm/m25rzkgsoy+hwnhzhxCg8TeKA?=
 =?us-ascii?Q?tKAON0LD3NUCuRhNPn1758FoXxBcptKdbqpowWPvzayU/Kd7xW1AxyVd+Zzy?=
 =?us-ascii?Q?iNoVYFOD56AXnAzqXdxW0Umwx119lcUI9JQZkq6Xttq9tYFA3Un7wT+Yrqfh?=
 =?us-ascii?Q?MxV9GnyZRwWKbPTK2pmsB1rSIWyBZtilWoTSBvhSe+xyvp6jrwtoW7+HJ7x1?=
 =?us-ascii?Q?bEKTK7yHKgITXAC7SnrD/gKZPRURhD/mCzCI7lPHBn2pELvazTgTbSXjhVQh?=
 =?us-ascii?Q?Xh+gMSVF8fSiCd/KjTDurcbzztaMD9YovKo7K7Km1ogxdT/IY4udA05vM1Jp?=
 =?us-ascii?Q?k8S7th+sqPAPGfSCnmWvTj6hChJDF271Ajv5UBCzrHNWOmjJGFmrCd5Vba39?=
 =?us-ascii?Q?5u3G09wyvSsMoymUI2CPTKj7Q1IchGo4qCOzNSnzlvnXUaz6xIniy0TB1q1q?=
 =?us-ascii?Q?1BI9eb/dWdhyZviwH9TOAKD6KEG9ZBPVZvmmPFITCTXV+ULUV7fFNd3qMocN?=
 =?us-ascii?Q?Nti1lTO3AXIhkykQ5088mRYxy+6eU+fXhbSshTSUVVTM0FLFXLVoj2DhYkgX?=
 =?us-ascii?Q?sfn/V+/qEP9mYxUPXnZgeBdtMG5MKQUfk7fq5lNuVHvTClvJy+OK5G7xta4U?=
 =?us-ascii?Q?3ggmg9jQMOvqL0TMMwl21A+i4Bk6xM0VG56Y8Gmq9Frh/tn2ASObzmcERQiR?=
 =?us-ascii?Q?lE5y8MMFX2ERZ/MKtlJgiJ5NiPgb9gjdGJI+a1U7Hj3h5b9xbsA3qHuwrT8Q?=
 =?us-ascii?Q?wg3E+tTEjCdbPQPGr/x/N3LbiV++HdFfyKo7UChS?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37300bf8-99f3-4a2d-0b47-08dbb51ad050
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB4505.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2023 12:04:57.3618
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EPPZL7JMCFziGVtOwff3yVlSBYH9vuMzHl+qeQWapbK7w7kEzKzI66FCSQDUTl6HJrf6OoPldvDxUftmNlX9Yw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9366

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


