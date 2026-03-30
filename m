Return-Path: <linux-usb+bounces-35639-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6CKvHVMZymk65QUAu9opvQ
	(envelope-from <linux-usb+bounces-35639-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 30 Mar 2026 08:33:55 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 35E45355FBA
	for <lists+linux-usb@lfdr.de>; Mon, 30 Mar 2026 08:33:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C3B4D300889D
	for <lists+linux-usb@lfdr.de>; Mon, 30 Mar 2026 06:33:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 838B73947B8;
	Mon, 30 Mar 2026 06:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="TNnURRJb"
X-Original-To: linux-usb@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013008.outbound.protection.outlook.com [40.107.159.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92739394492;
	Mon, 30 Mar 2026 06:33:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774852401; cv=fail; b=BH89UnohKbh92LbXv46cvsEVaEKSUpZPbnYyPkP8pOVGlfMsqpyIDcYlLF0D7ZzGkLw0qAoElS0+5PGwFA3/z9oiTXENCals7KD0e2Azr1HXNYMwRxhMbPUoxPZsQ6XWBKwxZ19fTmKGOTvkdM8PIuCyM6E2nTW/B8qBWWdgiPE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774852401; c=relaxed/simple;
	bh=ulT6zcM+tFLBNDagDEBVhngdiziTzU8SnEK+y7YNSg0=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=fCcxvaLId9tdEVl2Dy+Wdf8kDBOkBCSahAAScVk1EGyhWeR7CJzUBTH0QWlqCBzmjefryRIHevAw87s4kug68Z3KTOh5TdfX+p4KwYVSSenaLIvsj/cs5qVlx7ucXEqUSifHGtdWMr3bm0IwE3HaRR9H2KkVPmmULjvv+CU5agc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=TNnURRJb; arc=fail smtp.client-ip=40.107.159.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Dpd/8KykqFALJgnxFL/2nKr7tv4STV2GbR8yCrlM2/lrwG1oQFalCumX+4QmM3ZBBI1D6ajSn3nH9UXxnxQLsLKhJRr0vpsQrCfDh6I1O8t6hHlvzEHMebZV7SX7p5NegOy6IDPmPncp+i4zHD1+V6X5l9gXkrKKPMbhA/Iz4+Jr5zfKk+UBmZpAxZxnRi5aI1OnDE0qBBp9rnORCUfc1vp5+NR3A33LmEIC8lkRR0JaLeV2rrcRk/9MXFIWoODEcuuOJbDKvBmsxGGES/gQyOF82QllgI/s3TpHmJm5/CSg5JPop7OrGztCRlr/xzL916VuzCrrmIxcWXgD8jGAHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=08+YfOAKHFmUdMM9E+SDo8S/94vrVaM6bGzVZBFpEfc=;
 b=wSVvjGZ7pXobPYYiphcUThqlvefqjWFc0DWNIhuTrWQyP20h3y4/ZVqyYGUWI79bgC3dKdUmsNReEcA+TRT6ZrxartCCSB0+NB5Mqzdgu/MGqOLHPZgYdixmzD2WLyygZMZDI2r5pFh7RKQhI83gMZRj2iez3Y7cGqh4zl3C7FXcn9luOSdHRkYNpWn5L0ww7aI+l59e3msQIUnGMczexmqSf+MKOpITsL0gGofurMbIDKOISEjs5bBgDmKvbunT5tiHAaXZfN784QAKQUsg4oa6YH0WZX2KpZrYVm0gBZjlLmZrIccOWsyyRjTygUo46yXiwgc7ihYmzqpccqpCGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=08+YfOAKHFmUdMM9E+SDo8S/94vrVaM6bGzVZBFpEfc=;
 b=TNnURRJbYSaPEzYg5Q+z8a0V4rM4oh8G3aWwWivn9RVYGaTmvr3q4Qvu3MgQQi5h5f+l3MvFuMEajARvMr48ESfPZlKGvmEEDUUKO2ofrhFA6bRBjy9XIXuzJUUskdT7OYxbWzIbLVlI13OePvnf6NSFdvI7KSF7ivCg1wGEdwEYkYhkJUNIvtjEqO/16gTWhH4XMuYKwxTWNG55ygSXiWneXou0FYe/CdApz/Wr80E92CvGh7bFsvTrdR+bB/fNYoSAtQ2dny0JaPEiHNznrc4KG7MIGF1BtNpmxlmXUj15gwRyuDcuJokQfQnhNJs0bPqMIm0Rdo0JIVO2hfOnbg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by DBAPR04MB7430.eurprd04.prod.outlook.com (2603:10a6:10:1aa::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.28; Mon, 30 Mar
 2026 06:33:12 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::c67b:71cd:6338:9dce]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::c67b:71cd:6338:9dce%5]) with mapi id 15.20.9745.027; Mon, 30 Mar 2026
 06:33:12 +0000
From: Xu Yang <xu.yang_2@nxp.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	gregkh@linuxfoundation.org,
	badhri@google.com,
	amitsd@google.com,
	kyletso@google.com
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-usb@vger.kernel.org
Subject: [PATCH v2] dt-bindings: connector: add pd-disable dependency
Date: Mon, 30 Mar 2026 14:35:18 +0800
Message-Id: <20260330063518.719345-1-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA5P287CA0146.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d7::6) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|DBAPR04MB7430:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ace8a60-7c71-4a2e-9c72-08de8e26376b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|1800799024|19092799006|366016|38350700014|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	ZaxhjkpCB4XH/EhL3OBEMVcr2ZyRYzmmdc2qCqSkvGsFr9jrrLt/LXIP2kePzSwbkBMRC8shAmWGADmDr66CaMcLc4uDWJcKjh3kwdpWc3BetXcOthSwc82TtLOpcuAjhbmWN0dKWBJZHPfgFU0Pc9s+ivUS4PTNqkUFumU+M+vD35BPXZ6vDWi93SHnWs9fjFffv1ivv5nPDKIE1QMzFBReAmePDcn4KVysjJRvTulS3+DAGJNqdCgHztUbFrNBbr+qy9nGUwfaKsH2UAQnIbOsqAMM7S/RLwCh9lOHAl3txsW+uVfNcmHns+/lvZcuQXnnNUbXU2EKBhMUNTtFQz42REd1uOnyV2nWJYc/DzAYgZAwqE+IiWAvPijVmf+Ww9UH9AXl+uisv1hBXBrZJAXQmn5X7K/veZQGMVu5LIHnDGlbrqQLZgjIY5FkJOTWtCEcNDhV1uejHSQedAud2p4LJCusGYMyx3yLXzJruaAkeojFM4iixNSCQxQgxVrTGTfIpkxvKU0QAsQa9rlO4iUpWhvuWgnMFLC7GvNXcuxg94dAPOz3AODfq5x9frDxENpn/20G1oZqDxDqRbntpPhOPhavYyZuL04tuaM45KSLDLi59ONUztFGchaAOuJFvNhV4jR8NFXYeW02me5zDf3zWUizp53kYo3U2W8mVOWNLfyxZM6Ks4UfRf82u1z/Lw2Qm7UTrJPj/whuGpm6xcd4Rarrx7Gkw1R7ivChSLF3ueLCoBNZXn4GjV8/d/uGOab9G0MPp3NSorHyo0vtLlPE4KBGdq3xapXSDLE/qQY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(1800799024)(19092799006)(366016)(38350700014)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?YcSocY51XdZpW3rM11x+hEp88RVsNdi5nLMxtCin+ITT1XcQgxsLgAH6mBc2?=
 =?us-ascii?Q?dXfbS3c+5bnR89JR7mhNJFTWf371UPXiXsv+BtDn1cYPyegyE6BA2ROXsqIL?=
 =?us-ascii?Q?ehWARI+hH/7br8k9pZDBKmI7FXobGs8qiHlxDSncSFHy/El8aSXFTvE4awd1?=
 =?us-ascii?Q?YPnOFCLJ7qbhEbZlGuK5BNR5ddf4pEfnGXrmE5J9RAVI/xJw84xOA5Ls27Co?=
 =?us-ascii?Q?dXgDIsxNqam7cNqtz+obg73Q8ubu8mLfA2KObfMBY33l50j27gPLK6um0HnT?=
 =?us-ascii?Q?DKHqGXKVe6I8n+zEyVaHJv44K1k9oVziFiMaZu0U+vlux/DQpdPsA59gp4KN?=
 =?us-ascii?Q?95jK8h/oEeNeUPRcb7FNFKOvGCvsWxI3E1nE05RaxP3gWGOIE4c++y/KxZrA?=
 =?us-ascii?Q?SQoW3aD3xxIdBHz7bQpilHOnOE5Pf+mxGllDALBNHdpR0XR0OtwBeETJyBat?=
 =?us-ascii?Q?SZcO0gO97ldeVHRrYdDaJXUq+uPb0cLxlAf3sxjUaWQfc+IL4lTaGlUHAFse?=
 =?us-ascii?Q?oikW73dk6PYMpQTpMHc1JrCo/OTLzVXiGV9IRF/8uDw5NmyO7O6iFHCSMcTt?=
 =?us-ascii?Q?Ps11iuAnnGI9Xv0j6u3arsiPrU4Qr1idZcuS9PLLrlHPVC6ctqwXtYhyv53v?=
 =?us-ascii?Q?qfdqB3HBvB7ZTKCoj2bZ714oveTMPM7cWNOD+CuYcnpNKTpnRc+igvGixKeR?=
 =?us-ascii?Q?bMNLU2cr+ITumEX82ITeCQ+GVeqizceHd82zskpLdBg53zeQxFKIYaA2XhPX?=
 =?us-ascii?Q?dck4lAwshXtJcYEQYuYlxd8FwlOn06lmFkCCEEak2RsIVnXdjLz3I7yzIBKs?=
 =?us-ascii?Q?GpxTnUlIHTFQ2Ywy6mr4ls1cg703lYx8h8JIQWGAZzRLqa1wwa5RKF0sUZvA?=
 =?us-ascii?Q?7uYG8x6XILjOWV3MGQ2azYIXEMQoXALnH9u7HPy3ZhtxjYm5XyVcHv+Huhqc?=
 =?us-ascii?Q?5b9qvX14Eh2qBA98GX0LN31WenPtNVyR7JFAsQL4du+aATzVzmOjqMNP+WpM?=
 =?us-ascii?Q?o2b2dNwSMVQnlElvtAx+sXPKnWErIve8FbW8zIuONvW8rpmESMJboou22wq+?=
 =?us-ascii?Q?8VR0wD5//xueU3pCVa97PrmgPLU2NkhU64S0CD2aGh0ldimk4qHDgC4JrJ4Z?=
 =?us-ascii?Q?fpIdYmu2AblewTkkztt5nlDAq9fNnQpnCdcqgk3PYmWkHQtVZrM8BMIx4Xl/?=
 =?us-ascii?Q?xwqkUT/aD3bqYmz7gPTgXNFK1LRFQBXWFb8fdxNwvcOumtMp53X1AlSl6jOX?=
 =?us-ascii?Q?/kTDKJOhw5b0DQ6Wfx14DN7ZWGCBJUrwNxebPiQLV6wYi/p2jK5RUlbVV6T4?=
 =?us-ascii?Q?uNktHlmlZwuF2miNyz/sfjXM+VcUNXo7IHHitnQumdbMH8L4GOE7PaoiOHt+?=
 =?us-ascii?Q?M8K1vvgu44G4sLkAkeYzOEi6+DN8p2S5GRaPJfLMGZb4Oh7NvMw8EM1qNui8?=
 =?us-ascii?Q?OS+x9nTC4lVmMKUavLfBv+v7RcEd7NYpn6g7Xt1v1YpazqnuXTLZjoAiDQYZ?=
 =?us-ascii?Q?AglwJQznb0QGxPs9YBmDWu3jfAt89nZee/hBstVNmAg/7X32D1K+SnFB3Buj?=
 =?us-ascii?Q?BxT1OXAoEs2R6LoP03jiCxpiWZUHyAcabXWGDbCluIs8TCER7xsWHSey6hD5?=
 =?us-ascii?Q?OaTi9NG4g78tPt8ambzFHZ8RRU9lWrcZ2VSYCYiQUBm5tCtBollhV/YbG3S1?=
 =?us-ascii?Q?vK11/KqcO2o2dX/XL3TOtxxbeXkZn4sfYcQktJ3TSNSn9N0JIuoJNcVy71JR?=
 =?us-ascii?Q?fox0an90DQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ace8a60-7c71-4a2e-9c72-08de8e26376b
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2026 06:33:12.8246
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jrVzj4BmDUJ9roO7mUyE2KWF3slxGFcoHMhlGkMCKak6nDUqQr30rEmwJPH6QOifFS9zkyUWK2sDAl5zV1Gm2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7430
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_FROM(0.00)[bounces-35639-lists,linux-usb=lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[xu.yang_2@nxp.com,linux-usb@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	DKIM_TRACE(0.00)[nxp.com:+];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	TO_DN_NONE(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 35E45355FBA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

When Power Delivery is not supported, the source is unable to obtain the
current capability from the Source PDO. As a result, typec-power-opmode
needs to be added to advertise such capability.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Fixes: 7a4440bc0d86 ("dt-bindings: connector: Add pd-disable property")
Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

---
Changes in v2:
 - add acked by tag
 - DTS patch has been picked by Frank
---
 Documentation/devicetree/bindings/connector/usb-connector.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/connector/usb-connector.yaml b/Documentation/devicetree/bindings/connector/usb-connector.yaml
index a00b239960a3..8ca0292490a2 100644
--- a/Documentation/devicetree/bindings/connector/usb-connector.yaml
+++ b/Documentation/devicetree/bindings/connector/usb-connector.yaml
@@ -335,6 +335,7 @@ properties:
     maximum: 100000
 
 dependencies:
+  pd-disable: [typec-power-opmode]
   sink-vdos-v1: [ sink-vdos ]
   sink-vdos: [ sink-vdos-v1 ]
 
-- 
2.34.1


