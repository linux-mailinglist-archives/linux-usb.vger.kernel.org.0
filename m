Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9380C78A8E8
	for <lists+linux-usb@lfdr.de>; Mon, 28 Aug 2023 11:26:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229865AbjH1J01 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 28 Aug 2023 05:26:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229938AbjH1J0S (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 28 Aug 2023 05:26:18 -0400
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (mail-he1eur01on2049.outbound.protection.outlook.com [40.107.13.49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C87169E
        for <linux-usb@vger.kernel.org>; Mon, 28 Aug 2023 02:26:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QQSRRjvXSYVmY38Hi4sDir2QHAgebEPfJLX2MTs14ztJJPMbK5nBz5p/bSfAbExIovlX4Rxkj4t6wCG/rJaw9wawA8RqA+uAD7WwHwwKDhKIstOlyMJ6rzDjuJnSK5D50T4b8yXKF7Bmy3wfTwIX4H1lirUftcnYWv7m1j+LhKu8IZQOAKU538GZtiPFf3f0+fEBFaBvdXL2wNM0JUjWZ04hAH7lWIsGLfWJozfpYwjSHZNqbJbTIrgaS+VP2mZEwEsLeBMUBAbMDbFZKSMD2Jt2xNGeTHEA4nzSh+DTLbsaWW19U53D+X9UJNg8eR+aLShpxe+EnMp6sI5wyKBWaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vqG2sAUsXZHtbv8qQ1ls8RwmopjiDctR3H/C+4Fnkm8=;
 b=Mzd/N9ZgSEfNlhQzYZFX3syxrjr6NEYvJq58cyKoTLnwWDtr3pa6oKf6hVFB4klNqgBzqlqyt2u1JpVdtZhP4iVXrIwv1G914oUkyxWNqUaAu771A29y4NTGx7RpsVckjypmVyJnwaR/7sVgmJRIsXGFnjK56nvXv5cstt3IM2zmkpO1UT6WJ42XmQOnloxTm4+KaD9b/Sse94Owj/UR2vn4N2K8XHn9FtM8K8UFIe2+JQKnq/NdvTAptCsRdzCUvd6lEekWil0rVdSP1r+CgT185Y6TbRFyQXTAiHf+OcNfPQFbMUJYfrGM1OmU8I/w+TWOJe5ZjbW/+ug+tR/+cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vqG2sAUsXZHtbv8qQ1ls8RwmopjiDctR3H/C+4Fnkm8=;
 b=hwIJfUwmgdBnVCOVIwY9kHboPSpQN8Vuegm05qh7GtnCn2dN4nORiBGIk+OgKrhID8qDtuJ6XMPNPJwUdSe7Gy7tIlqFPzBsBgKZNy3JxrBKxXXmNL9RzdEIVCOh1RmHAcwiXItQfsa3hkbaA528rsjhH0N1ygWhPrglgxljXME=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB7PR04MB4505.eurprd04.prod.outlook.com (2603:10a6:5:39::26) by
 PA4PR04MB9246.eurprd04.prod.outlook.com (2603:10a6:102:2a1::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.34; Mon, 28 Aug
 2023 09:26:13 +0000
Received: from DB7PR04MB4505.eurprd04.prod.outlook.com
 ([fe80::6444:e07a:e7f7:3923]) by DB7PR04MB4505.eurprd04.prod.outlook.com
 ([fe80::6444:e07a:e7f7:3923%6]) with mapi id 15.20.6699.034; Mon, 28 Aug 2023
 09:26:12 +0000
From:   Xu Yang <xu.yang_2@nxp.com>
To:     linux@roeck-us.net, heikki.krogerus@linux.intel.com
Cc:     linux-usb@vger.kernel.org, gregkh@linuxfoundation.org,
        jun.li@nxp.com
Subject: [PATCH 1/2] usb: typec: tcpci: add check code for tcpci/regmap_read/write()
Date:   Mon, 28 Aug 2023 17:30:34 +0800
Message-Id: <20230828093035.1556639-1-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0123.apcprd01.prod.exchangelabs.com
 (2603:1096:4:40::27) To DB7PR04MB4505.eurprd04.prod.outlook.com
 (2603:10a6:5:39::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB7PR04MB4505:EE_|PA4PR04MB9246:EE_
X-MS-Office365-Filtering-Correlation-Id: c6b712c7-2f01-4e28-b790-08dba7a8d226
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EGZUomoVVPT5Yxm+jcxai+axu33OtMWP+wlli1D7Hy9575xWcvX8A9N6q16sdVMCcP2E18zM4NZSOIf3GQQ+U0nU6eJt0x8JfpymBODPfW9MeHT5DcQftybYypVIvgOMxKt85fAVQH+L3vjRee8bkAF+ue8fy4wORUBodPsLVdmFFlYE7YYr1sxqFDXl1vbvtekF5HwovPYEosuD6acUSITV+mKwmwh60dirlZBVfTg7xPSl4k698xRpgi6xhxS4cJlVSTUIUy0iPZ+ruOIDCVrcw9fr7mpeWFV84872RAtuUp7VQr+vBlWwQmxleObPAQPFwAlaA4hglyO+1HredjRYfzWl57AEVma0tdq9sAouq2NB86c6I+Aextq2RkcYPEe+hAxI3V7MwePQBBAtpGZMlI7nN3oy1JnGOVfw/Sc5J2O94Na4SJ7sjnIBPUp8MX+fDoFgKxiey/DyS2IVKFaRmAFZBiqwfa9S2kkRKhQUah5VtQLzDJzXnf9lZRQgDX8C9FIvb+uaJAA24VJXkVOm/zPbYErvDfJbeuxKRRa137ebtGAjCtkD4a9uZWgkOgjce+ZlS374GROo5uoKel8lfr99oy8Ve5RxnB7HKi4GhP9yvIIdizwDZOVhNYq+
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR04MB4505.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(366004)(136003)(376002)(396003)(39860400002)(186009)(451199024)(1800799009)(41300700001)(38350700002)(38100700002)(6666004)(86362001)(83380400001)(478600001)(2616005)(26005)(1076003)(6512007)(52116002)(6506007)(6486002)(66946007)(36756003)(66476007)(2906002)(316002)(66556008)(5660300002)(8676002)(8936002)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7+yhV5eMtvwZM19XiSZJO3kipHxnoLt7uBA7QaEsz8UuyUc8LeYEbIxoJYQj?=
 =?us-ascii?Q?WlJaZjTfrvDRd7y3M+lsmbzivAKR1nxxMNmk74bxECxp2zn31dD8YtpLZfGC?=
 =?us-ascii?Q?GCpjKB9WfNKtJKbNrg+kTBW04QbKGu6Ow54NzRVB6ZYOri4XGZlJKIJkTTrT?=
 =?us-ascii?Q?YCdflCZl8vWOKjkZ6ACe9tty6RG23rEPGckHAQxPaFnrxPGiebAeDOv8NM0q?=
 =?us-ascii?Q?QrUUHxLPtG2s9KUeSauwZtqRxPleooUKGOXR25JPczv40PWAeBsmOtWlzwjZ?=
 =?us-ascii?Q?0QmkhTdFe0IsPXiFPOCBBTmtAzXYqLXT4p7zhWAWnmfcBwgav8HhflFQU6Cy?=
 =?us-ascii?Q?wVZp3MeQDMbEDleHIzG9SsIt2yQ7fTkz2iqvj9jBBl6MDZrz0OdGfiFMzeLG?=
 =?us-ascii?Q?IzGVim8oicgMqsO2p7G2q0EDUKBoFX65qAHjY8N8b9O9y68U/B8iCFV115Nc?=
 =?us-ascii?Q?VLJhcqpXFN/lybQA0E7pKMY+IvNlJmW377/S8BN0dWSkiswI80B96uSjnvkn?=
 =?us-ascii?Q?YUT0sIjftZtflWnMXsI/nAxwWY4MpUevFLDoMPgMfsbzXoD9WUC57upF4p1z?=
 =?us-ascii?Q?EsTasnOlPVg/Xn6110MNk1NC8ffyrJFKJH/JGE8oZqQmCUOOopRNJOROblOU?=
 =?us-ascii?Q?FZxh97AU/QPRWKPssr1Qb+dkWaF52Y9fbW5e0GeE+9wpY14D2VGXEAQ1AMpU?=
 =?us-ascii?Q?M/KqLuWBsgBF2bdKUDJju273RxIU6//vO2wYvqwfHUaVgu0e/ekFt3CgCAOc?=
 =?us-ascii?Q?R3eEy0onS0X1FoVLNzcNgVbt/mySXMEewMUvzsK9XmvYG3mAD855p//Vepuj?=
 =?us-ascii?Q?SvnonAa3Sust/M7nK7eLm7NIMufoNqOz0XkbfS/ykxWg7UGcPGbDIiqMhzHp?=
 =?us-ascii?Q?Pl2SxVfOGOB7PluFxNUV5GReA1mq8HynY5akWF6mfZSlaqt/vXhobE6+8/+1?=
 =?us-ascii?Q?wbITI0/mKqsJGvBSOm3nEidBqmTAFyldwSl29aMXUfNMlwrYrKER44eXjm5+?=
 =?us-ascii?Q?2AZRR575mc/FPBElxTZ8oCAKyq1RE2t+vMJ/Y1NNpfPtBcboXlxRMwhI9fVx?=
 =?us-ascii?Q?6L37aVuduTlFY+UAYdoM0T3DDoAf1aFhjYJOEi3KXAc7BVs+jhnx+dJ16fa3?=
 =?us-ascii?Q?pgOGuDdF/vAqcseySfqw9qp0GkGhrPJnfcDCRjC+JMsstNXfvKfBOzIJO4TP?=
 =?us-ascii?Q?HGNe4RMLkJss1OfqIpZ07cGMYoCVI1M0iU6Uhq27n1H3vgML/jYiiiOQ8m3w?=
 =?us-ascii?Q?Twn6BC3truQ7r4VKvgv9W9yT34NVRYXkhRwgD2yIF85Qekvta/lqu7YP6EHd?=
 =?us-ascii?Q?/wh2htGWSNKZ4fXaEvzmxnrgV+66C/A6IDX8ZzwJBD9FIrVNJjGUbMJGZxHI?=
 =?us-ascii?Q?UxmuPE46F4EAB+geWK1wSVLnwJYwBuvuyGJM1PE8ONy+0OLzx4OBkUeZ/5jI?=
 =?us-ascii?Q?6ibPJ7DuxUWb49ox50fhPwJ+iCgrpcotQxPI+57rGBmP14GPtl0X3Yf2tqKN?=
 =?us-ascii?Q?PUkESv5hvIeRv4juXGKqsQMsUop9JG7AQKNwTznSBRv2D+H4XJmRk3JtMSjC?=
 =?us-ascii?Q?TA6YfCdYdoi6IqqgVAf4UqkgK3bD30EdfFJ2RKNY?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c6b712c7-2f01-4e28-b790-08dba7a8d226
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB4505.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2023 09:26:12.7689
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EJoF0OZItwez+WEhAzb8pc9Ee7ZeSwOXl1mUA91l8Z897HOtuNfGex1mvfeti+xq87/Zl9sNlZW5G9+OlNAldQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9246
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The return value from tcpci/regmap_read/write() must be checked to get
rid of the bad influence of other modules. This will add check code for
all of the rest read/write() callbacks and will show error when failed
to get ALERT register.

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
---
 drivers/usb/typec/tcpm/tcpci.c | 36 +++++++++++++++++++++++++---------
 1 file changed, 27 insertions(+), 9 deletions(-)

diff --git a/drivers/usb/typec/tcpm/tcpci.c b/drivers/usb/typec/tcpm/tcpci.c
index 0ee3e6e29bb1..698d00b7fce9 100644
--- a/drivers/usb/typec/tcpm/tcpci.c
+++ b/drivers/usb/typec/tcpm/tcpci.c
@@ -657,21 +657,30 @@ irqreturn_t tcpci_irq(struct tcpci *tcpci)
 	int ret;
 	unsigned int raw;
 
-	tcpci_read16(tcpci, TCPC_ALERT, &status);
+	ret = tcpci_read16(tcpci, TCPC_ALERT, &status);
+	if (ret < 0) {
+		dev_err(tcpci->dev, "ALERT read failed\n");
+		return ret;
+	}
 
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
@@ -687,7 +696,9 @@ irqreturn_t tcpci_irq(struct tcpci *tcpci)
 		unsigned int cnt, payload_cnt;
 		u16 header;
 
-		regmap_read(tcpci->regmap, TCPC_RX_BYTE_CNT, &cnt);
+		ret = regmap_read(tcpci->regmap, TCPC_RX_BYTE_CNT, &cnt);
+		if (ret < 0)
+			return ret;
 		/*
 		 * 'cnt' corresponds to READABLE_BYTE_COUNT in section 4.4.14
 		 * of the TCPCI spec [Rev 2.0 Ver 1.0 October 2017] and is
@@ -699,18 +710,25 @@ irqreturn_t tcpci_irq(struct tcpci *tcpci)
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

