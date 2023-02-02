Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0C394687BF3
	for <lists+linux-usb@lfdr.de>; Thu,  2 Feb 2023 12:15:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231994AbjBBLPC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 2 Feb 2023 06:15:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231971AbjBBLO7 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 2 Feb 2023 06:14:59 -0500
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (mail-db3eur04on2055.outbound.protection.outlook.com [40.107.6.55])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1EB7F885F0
        for <linux-usb@vger.kernel.org>; Thu,  2 Feb 2023 03:14:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S/xvG40183aeqcrS9SwUFtGmDLBPBpk1pgci4Ma/AnxlYiiS0btsUzgZAvGGvBDFIDnYjEPMa9mA4i8toRckh661h1jvM/DhHSX63wB05lVn/o0QOwTQHmYyoZjsGI6zzdiNOldghoXIcWweCf/9MQwkN3kHMbV5voWi1jTQiFQ5BTz07N27tzJ/SEg46V8mvuNm3auMHZPcLveLkwdBWFrUl/sc8HVjYFqLk+8pkfraEu8zVc3M6dZfd8quZLacUlUBXso60TG+aaqSMPwewU6pNczNSyNhd17bSlichsFrhDOenTBK8Mm2IWcGmFJU+XyVep1/qkmuRo5Qqb8y0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ydS8pRXrGlZwrAy7YOfZT9gV447RfmKHje7NREe0VLs=;
 b=gNWROAj5H5E9S+kPDn2J6US1E1WhkF9N4pyawxz8M3ZCMgXXPmqlaO1Sgz4vA23gOb45MWd43A5SjnHj1lDGell3cbdgS1CNbNwn+9iaYhpn/1toJKHYPqOnj7aQXpqxb7yn56B2mTG3pY2/fakm+2018QRE/WEqYy9SWhdY1tKylOtzamRIQBHYleQCsp+o3oCGU6i7ym8n/Ph+gYzkUDG1LixPRRoYcgzYCHSq5moKbBQu1TDs8K/vr21OWPovdvJpWL+9ashuZje5mNAtCpBNnVoGKkkbVTN2DEHZvrruw7CqrDXFdhlbTz5tOJ7lPzA5h71Lw1tVTv7g0wPVIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ydS8pRXrGlZwrAy7YOfZT9gV447RfmKHje7NREe0VLs=;
 b=TfNNdYfYRspfzZEtYoxWIawzaLSb08Fmd4pcWG4ladGVXFRMm6CaxPlEFzYNLzrmm7W4T8y5r7vCUdiWFuR9ZxljOuQphCOUYv7megAWbY3zlnSzCBC/TkjpjGsMHjkdBNZuzE37ZCkenGrxrwW58wbsy+x6mZzQXr7bz4kqerY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB7PR04MB4505.eurprd04.prod.outlook.com (2603:10a6:5:39::26) by
 DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6043.25; Thu, 2 Feb 2023 11:14:53 +0000
Received: from DB7PR04MB4505.eurprd04.prod.outlook.com
 ([fe80::f874:ee07:56fb:cbe0]) by DB7PR04MB4505.eurprd04.prod.outlook.com
 ([fe80::f874:ee07:56fb:cbe0%6]) with mapi id 15.20.6043.036; Thu, 2 Feb 2023
 11:14:53 +0000
From:   Xu Yang <xu.yang_2@nxp.com>
To:     linux@roeck-us.net, heikki.krogerus@linux.intel.com
Cc:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        linux-imx@nxp.com, jun.li@nxp.com, xu.yang_2@nxp.com
Subject: [PATCH v2] usb: typec: tcpm: fix create duplicate source/sink-capabilities file
Date:   Thu,  2 Feb 2023 19:16:16 +0800
Message-Id: <20230202111616.1484680-1-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0041.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::18) To DB7PR04MB4505.eurprd04.prod.outlook.com
 (2603:10a6:5:39::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB7PR04MB4505:EE_|DU0PR04MB9417:EE_
X-MS-Office365-Filtering-Correlation-Id: 98b5a0e9-4425-46bd-a5e3-08db050eb559
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xrO2C8/qJpnnaB1jLFvvkrrVtuE8HC+3DYNEyAiXErZunO/A0UxavGUunMIQL9kkZrIE/rPVuJN2Wkb0qmTDyrElTtRx4b9tkF2rTTXf47cyLPXmf0zcTYoWPiKm3uNm9kL+eevT0rlzbA5vmS8aZ0vZUX8H0peMRtJkt/01KgLVyBQuFzJP+7id8OIHqPmEDXYbT7QJVi+GqxpcoAbZfKe8Ur3ZhDpfPxsDavEKviBc5u5ntLGlH6SBfCxKq/mYts+sQxV5wm+eNzvPKNnOKExLTpYQjyNRYWIr7+iJpcmRTg21d3MiS/HcnhYuY6k+QG/bAgKhgJHWoPUzAHe9doB0sY9n5Wyaw9nXUL3fbwtnGglBDzZczWDO5SiNiBnbyhj0TBqIMwID6gjk1Nx2EkL9c8t45ghkE81dnd30fN0WLTMEVVkOIVoUafm+jOYY7O2w2UQhjosjdiIAhRV8Ly7TPnejQMOBi0FfRhgU7F82/7gN3XRrudIajIIuAolLO+1iDbBmdIMvMZPs+yMa2ZZXTn5sMC1S8HDqGiJ57LZXDWHbFqjz7wSNIc3PdDGKqATNGjwcYB3WWc4VHCaTfRQRuDwYrCmF8L0EFVjSlaiA7RkA22FdELMwM6SfrRYp7hX5Mkuw0xUPNpdnX6BZHA4OWcbqeaxt0qAChTg1Jg14gDbnkwXMX3vhruwPoLO6P9a3MeAi2GEIg4MNdKrffA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR04MB4505.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(346002)(396003)(39860400002)(136003)(376002)(366004)(451199018)(6486002)(38350700002)(6506007)(36756003)(1076003)(5660300002)(38100700002)(6512007)(2906002)(186003)(6666004)(52116002)(26005)(83380400001)(316002)(4326008)(8676002)(66946007)(478600001)(41300700001)(8936002)(2616005)(86362001)(66556008)(66476007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0eYaQmw+fjjkt3QUyt97Uw9MwzCMDMqHR0EaGZpAnCGOCGzA7oO4Mxp0pUbK?=
 =?us-ascii?Q?NWRFneUmGMXMwosRCehPuGTbf5uIOSO0m5qgZe5xazoMLuT3wGEmyzOFdtt3?=
 =?us-ascii?Q?PYc3pgHev7e5Dqcl+Rjl2tyTMAxzLyFGnclJa3R8c73wfkfKics5wtoLsNhf?=
 =?us-ascii?Q?XZ77KH2chZHLpq7ipoRv+b2Qw60cobFNwwDT4uknWIjygU5eo855POJtOWuI?=
 =?us-ascii?Q?8eyPm3VV3dlcdkIa4372X37f0Dnipcpj3EByGNrCvDvOkkSkSrt9a0FdwgGO?=
 =?us-ascii?Q?w5+EB7VzB3yPpdhfrn/LNLY2tbWDQrnz7wquq1pzFzy+MOR9qrpvurv3nElb?=
 =?us-ascii?Q?ZHuVT6ow5UDkgcBSRLqakZJIKUdqbEWNt008Eib9SM/hEpqhu+qhPYeqOfci?=
 =?us-ascii?Q?Q3cMTx65f+XVnL7LB3P+IP3oa7RnAswANY2FF084bY7l2/9vpkogQrjm8WQi?=
 =?us-ascii?Q?E8M6rEeOyGSFLtnx8XgPMnAEejIcjhekz79QrsYe9Nwqqtq6CrIttK+ELET1?=
 =?us-ascii?Q?CDSkDIiwg08OmKDvV5uLlYmBSC6Bkx71mGH4T3lNMFSyr79vqGLKR1S94wHU?=
 =?us-ascii?Q?BplRgh/J28B2WOpMStJgB1D52S/5pT250Mw8D6EvmlwUtxS/iWqkU55qpoNl?=
 =?us-ascii?Q?R/oEo6A/F1vLUW4N4gF4IGJd+MvGg6j6FMajpAFB15tfrG7+C79SwYFlBODN?=
 =?us-ascii?Q?TzD4C4ZvCt/fTml8E9/RrfclcM+SDFjMUluUUNFunat8ZXfGu5AxaqWgl4W7?=
 =?us-ascii?Q?EQIqv2LeIdhQ9NEcKobcFpP9tb9ZFfoqXhxRZsgNJJmD56DEaKd65HgjSW98?=
 =?us-ascii?Q?i2ou/Srgh+7wI2fuWSi2poFuCgcRQXBuIFmS7La2TbLNG2wgeETVuprvoUaV?=
 =?us-ascii?Q?8Oaf4JtDc87wUTuvAQVjETuGoxKuyNVMgEPuqMU+t43elDAdv5+UiIaNT3cC?=
 =?us-ascii?Q?X6aFueaNDDyt0NTIPsdWuGze8rXfJx/Hlm3RL6N4aknIx8eV9Bev36c8xLlU?=
 =?us-ascii?Q?+ZMSGC7OHZwM0vIOgMHDhy+Ok7a4ryCSB5LZTkNWe0HeZvWfI1G29sFFchtz?=
 =?us-ascii?Q?4TpClyuZjMxHw5GRkFjvK1/mdEJbt2dpYCwsACK9iJsdovgxCR2xrLqBZFre?=
 =?us-ascii?Q?R9fa3ymXSow5LIFIQ8xK8OYmMhM4z+BxkoXvFFWxQCCFyMMhNJBZ7LS7DNJK?=
 =?us-ascii?Q?1H8RsPee6pzdnZNesQedsst+kPT+7CeavkocuXIBY+pF2Yhnr0hCohMJAYZS?=
 =?us-ascii?Q?RiLGINZGBW0U5mLS0qXWNPUWHXDwe1eJ6pPBbzeQA25u93ZdPj4F2il3bO/v?=
 =?us-ascii?Q?ogNMXb7W5snOws6MTCF+shhG1y9qpA4h6lVEFSr6ow2rOfe6aZU+bz3zet0g?=
 =?us-ascii?Q?2VdHeqhwgj34pLyMUq75oYdu6HRs6FPq99JxswR1CtB9ipZJqO7WSjFtzW+r?=
 =?us-ascii?Q?xPw3eb4c9gCcnFCarOadXQkp6aMkvDUGADxsCEB1fyGjPjm28djYPFNPfVVJ?=
 =?us-ascii?Q?a2yHDu4Wq0kJ9Xvnjd5oF7wVTHRHiEN5ewKqkqpQEBE+ny5m/gz6Psj5yH1+?=
 =?us-ascii?Q?coeXN9AyIUl/6zs4FbfnNdsq+ZLbmzuU4bajOHIk?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 98b5a0e9-4425-46bd-a5e3-08db050eb559
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB4505.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2023 11:14:53.7507
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2AwKu0BFmCw+V9Onn031jMDLEvRzlizKUwmZmZkZ4gRlN1GJ172ac2RPi/7WZLQDIZ8f/joczsX60yx0uza2Pw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9417
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

After soft reset has completed, an Explicit Contract negotiation occurs.
The sink device will receive source capabilitys again. This will cause
a duplicate source-capabilities file be created.

And the kernel will dump:
sysfs: cannot create duplicate filename '/devices/virtual/usb_power_delivery/pd1/source-capabilities'

This will unregister existing capabilities when received soft reset or is
sending soft reset by sink.

Fixes: 8203d26905ee ("usb: typec: tcpm: Register USB Power Delivery Capabilities")
cc: <stable@vger.kernel.org>
Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
---
 drivers/usb/typec/tcpm/tcpm.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
index a0d943d78580..d84649838082 100644
--- a/drivers/usb/typec/tcpm/tcpm.c
+++ b/drivers/usb/typec/tcpm/tcpm.c
@@ -4570,6 +4570,8 @@ static void run_state_machine(struct tcpm_port *port)
 	case SOFT_RESET:
 		port->message_id = 0;
 		port->rx_msgid = -1;
+		/* remove existing capabilities */
+		usb_power_delivery_unregister_capabilities(port->partner_source_caps);
 		tcpm_pd_send_control(port, PD_CTRL_ACCEPT);
 		tcpm_ams_finish(port);
 		if (port->pwr_role == TYPEC_SOURCE) {
@@ -4589,6 +4591,8 @@ static void run_state_machine(struct tcpm_port *port)
 	case SOFT_RESET_SEND:
 		port->message_id = 0;
 		port->rx_msgid = -1;
+		/* remove existing capabilities */
+		usb_power_delivery_unregister_capabilities(port->partner_source_caps);
 		if (tcpm_pd_send_control(port, PD_CTRL_SOFT_RESET))
 			tcpm_set_state_cond(port, hard_reset_state(port), 0);
 		else
-- 
2.34.1

