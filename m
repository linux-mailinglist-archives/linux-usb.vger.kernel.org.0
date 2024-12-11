Return-Path: <linux-usb+bounces-18388-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BE6B49ECABF
	for <lists+linux-usb@lfdr.de>; Wed, 11 Dec 2024 11:58:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 54076285DBE
	for <lists+linux-usb@lfdr.de>; Wed, 11 Dec 2024 10:58:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B7FA2040B2;
	Wed, 11 Dec 2024 10:58:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Fpfknf3i"
X-Original-To: linux-usb@vger.kernel.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2081.outbound.protection.outlook.com [40.107.20.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45F67239BC5
	for <linux-usb@vger.kernel.org>; Wed, 11 Dec 2024 10:57:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.81
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733914679; cv=fail; b=qeYIA5C1f5iAQ9OakCHOhgPx9B8L37ydBKck6qJPXXymD2U8vJDEvm1WfiSrImjHf4z5JGlwp1XDGCJF11+DhnTA2R3CociCtDAuPw+DkKZanSud1Na7EuT4y3PB5VEbDC7h6DdqjypVfLNrkSMfvwTNUJfDGxKKu5Z1MJt6V5Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733914679; c=relaxed/simple;
	bh=iKg1SG+5DnLBbNCH/y8RvpyrNl1Y2+J93+RJjlb3Cvg=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=MlatS3gPgnJ5eHQldGqHnllCNdrU+sCZAkWRJGobBT3KRgRyaUXc3b5U68DYrtVgCzTz9lyUtglxZ/9hby/6eqidyJ1qT4jJRiruzZlGVmC5L+4CaAuxlOv/kHnOy5qCy6ZXuRPG1OW6TUovqAFBy26mXA/G3SizseIXQ2ODN8Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Fpfknf3i; arc=fail smtp.client-ip=40.107.20.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h7pUfttncoaN4DIZDQLyC8IEbu3vRVqAj2UbFb78B0vizvA7uq6wO6J86rR6wT0JwAvXouyZlKKxg6P8npZZHuuKb00B4UIkXYV91LbzTuPuJsrEHeO2a+eBVNpl7AlxKyFb43hozdD8wW4YZtQ2PQ6VxfCvXqt5mNHGEUyzxt8tnxthKP7A7LEj4z9uarslts1NOW0ptq4C+O28VToNM9Dwg8kv81ZDye4ZQqZNboSrbTtxVnDgg2D3FPI4uRmnxonDO5OhwNzMna4hPGc1fSpvqWsUa6ANcfbEuWekslVVwM9G5ZguDWMuurB9xd8aHTyjSqIMSqz/ASaFw21CeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uoyH22W8vWWbmV4eWWLEx1W1gprr01qg+yYf9eanoeo=;
 b=ozRiJ3BJU2FayhmN5ElWtzFqSWVhvm+9iztkBf6BnJrDSbDkFOPZTxN5Z4JuITsqL8BJ1e8fdASKM/IapSh9hTteURIwELEJCDWGji8JzTs1NsI+Xh0FD2RNZ1RfFUt0IEKlpShiOozu9yGm4lNE1W5ravmuqKt4s0eo5qJdLBOqnPju8aMc+wXT68Mb98J4kXadooUD4hbsMFGx7QSDzx4QABnpPltV8UMiJIIKcaX+v+XLStdne0DHVKJIhYjLYTAKh/qJfE31EQTMvCZmgGDNIuiBXouXjoXvMbkSdr0Bv2QVWYKVcRz2iB3iTJ0ewRjwv1PkXtwqAQcZSQrg5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uoyH22W8vWWbmV4eWWLEx1W1gprr01qg+yYf9eanoeo=;
 b=Fpfknf3ibpqoxVPBmQw7EcvNS0h3UoMXz+FJffzYFNS6OG0h7l5Szwf7KbGYMoBTY/U1A1TAs7KxpFjneeLyKYtG4HYcQzLMzNrZCkqOUM8jjZYxrhtoqdZ+JpYDEaJ5JCLn+9VFYmq3rxwMlMHUmkqscx8ou3X+7mhOP99DG+xFmEeOv3W21juUi7Qc5fMVF35mPaWIiF024lRS/S3bD5UwlMyn0JozJCtFI8qmbXAjAQN0FTfaHX1l70LB1X6ki9Dh9MU82CbM59EbsOd4OlsRUTpFqLTO368BZujH4vPb4ZMIwaeCKhh6aTrGXt/vrf++UlZHYHjcccHDGJObpw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by GVXPR04MB10151.eurprd04.prod.outlook.com (2603:10a6:150:1b7::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.15; Wed, 11 Dec
 2024 10:57:52 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%6]) with mapi id 15.20.8230.016; Wed, 11 Dec 2024
 10:57:51 +0000
From: Xu Yang <xu.yang_2@nxp.com>
To: heikki.krogerus@linux.intel.com,
	gregkh@linuxfoundation.org,
	andre.draszik@linaro.org,
	m.felsch@pengutronix.de,
	rdbabiera@google.com,
	emanuele.ghidoli@toradex.com
Cc: linux-usb@vger.kernel.org,
	imx@lists.linux.dev,
	jun.li@nxp.com
Subject: [PATCH] usb: typec: tcpci: set local CC to Rd only when cc1/cc2 status is Rp
Date: Wed, 11 Dec 2024 18:57:53 +0800
Message-Id: <20241211105753.1205312-1-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: JH0PR01CA0070.apcprd01.prod.exchangelabs.com
 (2603:1096:990:57::14) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|GVXPR04MB10151:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b91455c-bb47-483f-e803-08dd19d2a854
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|366016|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?8IwlXS+1aL6gTyK/mViwuFnExUWGm34wund942aqIIBainCR44zt+Gt257YZ?=
 =?us-ascii?Q?olK/CwAN9yczwwpjDgtT9p6kJOTagu4EL0stmOLDlNgFQCGiugB71aekdVkJ?=
 =?us-ascii?Q?MU4OeSvFzqcYP4LYyQL6fqEZzpokZBLq8pBeYM0IhMvaWLMqy0kIrqi/ZuRZ?=
 =?us-ascii?Q?KjSQW0Hi6PGEFkT/MNoeZwWoRlvdxIsz39HJeuvpYWrXGKrgrR11j+CPkbLB?=
 =?us-ascii?Q?QpS6CV7MQZAbC1i5N/zJgavxd2olpG6nYSoMPw+NpUwNi1M7y/FV6/Bj0Kj/?=
 =?us-ascii?Q?0NDVb/0u7drtO8xb/oqdWruaab3whDS3brjZsqf+RoogwZDMzMsNq7QKMJlk?=
 =?us-ascii?Q?MNyQ/AZevqWrUGezTEv9rqfAoNvjgemeRYWzuJeHNAErGHIz4iXg641ss4Vb?=
 =?us-ascii?Q?HzsXTwt7Xkj+UI56jC5T5dGj5xswPkcxv/o1bt182JLbMg93A4vAs7sLRJLD?=
 =?us-ascii?Q?8vaAVy8x83BO+yCWBjnHP0ElYyAfPkItj3+4XRLxIesXVdF1DgdOYlD/Ohed?=
 =?us-ascii?Q?kbairG5tSy4gb3dVD9W78wJgk+dZClSHsxzH3RbZZ/0UwfQLOIerpGrdqyMq?=
 =?us-ascii?Q?pA2lG3kA9TSZLzCo/XboRLVuEGEbf+YCDWBvcbXZh3rrH9XYpvVbWWRLCR3r?=
 =?us-ascii?Q?YS0ufEnK+Ay1eFN3GdQVbxrPRQR7bHxWZs/e8oOkJm8KTIG+lK4reoRNlVsM?=
 =?us-ascii?Q?E9R8UsQF6KrY1NmB2gP83MU5QQSjXqZ+uWldh6OAV4CnV/IO0onYLVke+pQo?=
 =?us-ascii?Q?LKc2PS+7xFU/vctXxDr2lv7l/X00VR+0b11uGS7UiNGUm15rfZIJMtUDGaAm?=
 =?us-ascii?Q?TzflAhknT6ZA944P4koQlNHs3xTLKtZHTEJweK2R75TzuuNm2N+XR0Nm8ALZ?=
 =?us-ascii?Q?DZX/T3kXqZQUupG5MtoYQtYhxEJ3yJ+yTdKAbAlCkaMBkNlDe1M0aF54Lndq?=
 =?us-ascii?Q?XzTYDiX/EuCZbfWsp3KfUukLJ8Ry0Y54GJZbsi3TP6do8OBh8CKVkCFQ6X9n?=
 =?us-ascii?Q?8BkLXQvF3XGH7c5bsVlb3sshb+rCOWyqnY51S6lNpt55yS2kfDgUdTMomkiD?=
 =?us-ascii?Q?V88cV30M/fCq2JJvOm8lXWyRgOPSLNO2/L7G6J6L1DATRJScoqeRylW+952Z?=
 =?us-ascii?Q?xKrlE55bH5aSrTmZP10msnyilxr83CUHLLi/kToVfMlM/YVaUSUr8X+UbVbm?=
 =?us-ascii?Q?ZXPYaWS/ZVoTQT60HxDRgNc6GSPIygRKd1LPMXG3qjciBNAdFgb8GymGa1l6?=
 =?us-ascii?Q?q0uS5Cn6WssfpT/Lv5ejhvDNg4fNqlUJsrps9f0LJ8S79eLRDn78QtRCLuU1?=
 =?us-ascii?Q?2iYYOeDt1h3fQbQ4YkldISWcbrrgNu0wM0eNAUajaQSHPVz7FYQJwC9Sg9jn?=
 =?us-ascii?Q?DthnpVetECA/Zd9at+bqJgw6+qMSDcGP+obRgRyM2MIsrsgz1w=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(366016)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?YjBEojvVkQZqufRBnQIq8tt9mVC/yqZsGwUGZpZregEZ1EQ1N4TJIIO3sQBg?=
 =?us-ascii?Q?4+Eh2ZkeTfX99Zdc9grJ9ZopDZFBDOz6cclpWQHLCMikXfDEm1AZ1dgaYjhU?=
 =?us-ascii?Q?OvubWVFiKRiNt51h0bUqMkDu23zwI8xoZpk6XQbhPxOoK2B2fq7NmCY5vSND?=
 =?us-ascii?Q?B8oAKBJI+K7USdyafuA3MOjqQseFcJ32vFbOsY0gdhYbW+NrjsjSrx4mGSXD?=
 =?us-ascii?Q?tZ3z9T4+8xIT7LfZaJDwWLTo3qapDJHO2cy8ywtYGSFq6qIFTKW4ccjrIwsT?=
 =?us-ascii?Q?gE5QpgqIRGVi+5OAaUwdStkabnvnlxNho5rYAJW1WxQ7P6XcRSBF3yaEieAm?=
 =?us-ascii?Q?koMl28nZqwKowASr7bX4ESDZT9Yp53ttvC61BHCH3E+DfCOkCJsVJnLNw0C1?=
 =?us-ascii?Q?EvZLYOitnoc3972+owbgpYvni4zwBG66OV2937jrUZ/4dqSIfwIlDDUqidch?=
 =?us-ascii?Q?o1qMLDtL7DkwgXMjvO7aualYnNZZjhcczW5cDAC6bOscRSlkcOyz4ipu+1O0?=
 =?us-ascii?Q?tvWfbv0mMBmBz+pTfssuqTXpwCdfIMrC+GS5VHwCpE8tYwqxtQT2tJYQ8s2f?=
 =?us-ascii?Q?I4b8is5rod8/qZW19NTBhWUX/QmEcn7H9RjDQXA1VLlBbLp6eFw7eb/xXYTZ?=
 =?us-ascii?Q?kGEDIVEI2e7cNXkxr42pmljNR6iBUnNNRnTP+6bt6MpHWuNHyegN4Oj/P+Sq?=
 =?us-ascii?Q?26slX+4ruOEsZiVsdSzUXiYZm3pPyyA73M7D+MflHKcpd7+n/Hx9XQAAbs2h?=
 =?us-ascii?Q?g7rXlkUpV1MzGTqNSblwNYjcA2JTAzgJgL7hI5DCPKLUPXW5Ec45AHONsqD/?=
 =?us-ascii?Q?fIYOeNvOaAJYVzDUHw/J4rZ9Vl2l1YP3vixnkYgpKE0zUKC3lzy140P2UcQv?=
 =?us-ascii?Q?8AElC7+Qkf7W/2dTC/ct7btINeak9SV7Ub9dWPkdw9xlSqyXVY1K7c4adXq9?=
 =?us-ascii?Q?JM6IQ9Yr44ohPZ5dqVdGHSehIPVhgs+MlYbEcEeVBU9lhVNQtFyOH2FYrCFZ?=
 =?us-ascii?Q?z5Xm2ixfq2j+KFFD3JCBZ8vVygt/+HVf8L4nCR2oqMXaD5fFSJN5lh9ONEuv?=
 =?us-ascii?Q?vdMN9Z/0WDXUFyZerIWUszN4X+oW4d4RYIWIXeDlGuDq9uSsi7gbERYMxc+O?=
 =?us-ascii?Q?tMJAJrAsUCpGdrlMA7nNrP2D/MBkPGX68RoiuJ1H0IlyC4K4IWHuusRhgyMp?=
 =?us-ascii?Q?nHmUiO28uHfDEnOwCLJYpJpSphluzOL1HSw1GkNskqjQoecJV4zPNYw6hII+?=
 =?us-ascii?Q?+CbMCKc5U7HtaWrVZurdEdgHlCY+2KMp8YJpF9VvPY/KuAEkoJFEE76Iega0?=
 =?us-ascii?Q?/Uxvah3pb7eWM3owt3nYpzk2RJLzpVJ7fJOvKFLrT1Gl02gC1yRHLomzHO1C?=
 =?us-ascii?Q?Vn2oNnIwhUlo+oqj/QxxCy5T5dINSw0VDMnYcYHl34c6o1SAimMldPXmlWo+?=
 =?us-ascii?Q?RjwvtKyg+6OTD1U2ijYwgkIpsEBBi1wL3yfCMBpbbFswuvRF9Fp3t4UsjV3b?=
 =?us-ascii?Q?Sfl+4rDyG16yDz3hxB/tTDpGWKmd5jRMGrDIsH2GcxMfkLJngiBSmBxja4wI?=
 =?us-ascii?Q?W5SphuckHrYTQAQJ3tCtAG3OSy5GRtei8uZxDOPJ?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b91455c-bb47-483f-e803-08dd19d2a854
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2024 10:57:51.8746
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NEkZzePWcHKCzD7i3tu7QOEFFoUqLCmh/x5zjNINNoFcwHLrZVI/lQAO9G2psHC2Vgbnf9emn2i5EGrudH1bXw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10151

The cc1 and cc2 status returned by tcpci_get_cc() may be TYPEC_CC_OPEN
or TYPEC_CC_RA. So don't assume it's just TYPEC_CC_RD or TYPEC_CC_RP_*.
This will let local port present Rd on CC only when cc1/cc2 status is
TYPEC_CC_RP_*.

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
---
 drivers/usb/typec/tcpm/tcpci.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/typec/tcpm/tcpci.c b/drivers/usb/typec/tcpm/tcpci.c
index ed32583829be..2f15734a5043 100644
--- a/drivers/usb/typec/tcpm/tcpci.c
+++ b/drivers/usb/typec/tcpm/tcpci.c
@@ -282,7 +282,7 @@ static int tcpci_set_polarity(struct tcpc_dev *tcpc,
 			if (cc2 == TYPEC_CC_RD)
 				/* Role control would have the Rp setting when DRP was enabled */
 				reg |= FIELD_PREP(TCPC_ROLE_CTRL_CC2, TCPC_ROLE_CTRL_CC_RP);
-			else
+			else if (cc2 >= TYPEC_CC_RP_DEF)
 				reg |= FIELD_PREP(TCPC_ROLE_CTRL_CC2, TCPC_ROLE_CTRL_CC_RD);
 		} else {
 			reg &= ~TCPC_ROLE_CTRL_CC1;
@@ -290,7 +290,7 @@ static int tcpci_set_polarity(struct tcpc_dev *tcpc,
 			if (cc1 == TYPEC_CC_RD)
 				/* Role control would have the Rp setting when DRP was enabled */
 				reg |= FIELD_PREP(TCPC_ROLE_CTRL_CC1, TCPC_ROLE_CTRL_CC_RP);
-			else
+			else if (cc1 >= TYPEC_CC_RP_DEF)
 				reg |= FIELD_PREP(TCPC_ROLE_CTRL_CC1, TCPC_ROLE_CTRL_CC_RD);
 		}
 	}
-- 
2.34.1


