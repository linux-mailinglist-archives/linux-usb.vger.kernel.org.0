Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0D3B5781E79
	for <lists+linux-usb@lfdr.de>; Sun, 20 Aug 2023 17:15:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231305AbjHTPPH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 20 Aug 2023 11:15:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231278AbjHTPPF (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 20 Aug 2023 11:15:05 -0400
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2072.outbound.protection.outlook.com [40.107.22.72])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6DF691988
        for <linux-usb@vger.kernel.org>; Sun, 20 Aug 2023 08:11:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eRk+eo+yBHyVhlL0N0abfYdoRBwhKZBmkIMiUYX5QWaCEVrEt5A+0GRtHXOeP92lyPtGb/vhUT9dirjwv66v6doCJH9YsLLE/TCVLNTvTsbiJv1v5gAhwbG8WV+u3lCebXHeqXtvr9G6AkFWwXoWlDG7SsuDPX/S1LPyW+pQ2Xy9dWXCYsEKr5Yuhng6GZUXl8jM4qrzqHeJL5N1xG9W4KRRgIGBPvlX7N0KGrxNTK13hO7MX8ppOt1BkUcetLVgAz82OYdsSIS56OGoLjCOO+D1GUw9W+J26urGsOwWWZIKws3lT+vTKM0DSvR2cBuIpRGAP7q1pMrQzjwm/0ewjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HzC5cBWMvvz84Qp1MR45JcJOnQydpoCPMHHUUCXHO38=;
 b=c/6EeLlWvmbgtizCDYXyZ+MePmUp1R8hKeKgqglZMSd+c/N4jlvZNutvKG1y0175U0xbsSKdH0NHcTejdzIxYecEu4pSryo4pAJSRtmxwnTRoS9F8FZIqXs/8XY1lI+bHNq4tmUsFEt0m8uCkJAQjSj/LI+r9f5PtA6uhlF6behf49ljjUktMW9oIODK258bsckvBkH+E4/aNk03839fbRUY7332nC2ktM5K4puY0LITK6Dn1laMtmnlPhoKXLD9EmJuwKb9SeUvFiG2fokiTUmMHjqWVdfiF00Jh+8UV85brOIjtdy5TkUP/bNdMgxjABGkGmUC6lt8fr9UjoPb9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HzC5cBWMvvz84Qp1MR45JcJOnQydpoCPMHHUUCXHO38=;
 b=mIqVfK1YtYsjEEN1MXDpd144WCfWfemw34n/igK30kziBn0jka3bQSur04LWbwezUH9ql8Sb7BoA5IkpbK4vppteHsb5lgpSEn0y+P7N5i0sDLOYULf971vgq5of95p350bWLfF2+Qrn648vfIUaq8bo1I3KH43AoKYRjppDmVs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB7PR04MB4505.eurprd04.prod.outlook.com (2603:10a6:5:39::26) by
 DU2PR04MB8983.eurprd04.prod.outlook.com (2603:10a6:10:2e2::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6678.29; Sun, 20 Aug 2023 15:11:04 +0000
Received: from DB7PR04MB4505.eurprd04.prod.outlook.com
 ([fe80::6444:e07a:e7f7:3923]) by DB7PR04MB4505.eurprd04.prod.outlook.com
 ([fe80::6444:e07a:e7f7:3923%6]) with mapi id 15.20.6699.020; Sun, 20 Aug 2023
 15:11:04 +0000
From:   Xu Yang <xu.yang_2@nxp.com>
To:     linux@roeck-us.net, heikki.krogerus@linux.intel.com
Cc:     linux-usb@vger.kernel.org, gregkh@linuxfoundation.org,
        jun.li@nxp.com
Subject: [PATCH] usb: typec: tcpm: reset counter when enter into unattached state after try role
Date:   Sun, 20 Aug 2023 23:15:18 +0800
Message-Id: <20230820151518.1403006-1-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0131.apcprd02.prod.outlook.com
 (2603:1096:4:188::6) To DB7PR04MB4505.eurprd04.prod.outlook.com
 (2603:10a6:5:39::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB7PR04MB4505:EE_|DU2PR04MB8983:EE_
X-MS-Office365-Filtering-Correlation-Id: 68bfd753-3c3c-402a-a75e-08dba18fac01
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: E13bmrXMtZxqNpxTsXm9SMiR7FHRQnGdrNOQCsGcy7sm5mksfZTD7suT8vFeveWAz+IWANHvIdpz4BQf2mn35c6nuLSw6GDG25jDZHsadapppnPnmcmKdbFXJbkUeuhEyM4tXVDatFFCEDZMFzgmPIA8ipKZWyEd70DcrTIL5CZXDe5LHQ8PA3AiymZfoZPgkf2fai8V/1WWjsoUbwUdr8D/XS8C50n9cLdfUtD5b16SUf2zLEf8tHic9LMOmP9YCiuxhridLUUOMSxHEQdilT3zZCAgxESciZQvBtCjgVGim0Ntz9B3XDOt3xKCZv0ytu3m4LnD5VVsGSYjh+YjllvCBtqhrV1d+pLUMEuQM2yo0NBuE9jq0bwv6hDjSafYBfidzCFTxnic8Vp4H83mXCHhE46t+ymLdpyuxpQS/rcZDp/j8Ha+ZMqn7VLral8f9UU2f4wxqM73+k2Pq6gSyChsDiWAzjqJ1RbDJXCcP0pVfHnw4QIjgxbXojbbS4okRXbP2wY//ETo3m57e6nVvcFdaqGNeokOuD0D1GVC9IHE87qpXm6HcdyG7IHgrBXpv8eGXXeyveGmxzKFR8zxaSVHSWwsNUDx5EYNXZ/F9zs=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR04MB4505.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(396003)(376002)(136003)(39850400004)(366004)(451199024)(186009)(1800799009)(316002)(66946007)(66556008)(66476007)(41300700001)(5660300002)(38100700002)(38350700002)(4326008)(8676002)(8936002)(26005)(2906002)(4744005)(478600001)(86362001)(6506007)(6512007)(36756003)(52116002)(6666004)(6486002)(1076003)(2616005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Rawb0H05pQn0HwfIypoCHeNCDbrBNDWqTmyXcaDIfYAxQqxY52y0dAjg5K53?=
 =?us-ascii?Q?2g+MfJZzFj8oLYEwP45cqww0zS5wLtaiMaH3cPHftYuWhhVoBT7CcDj92xJ+?=
 =?us-ascii?Q?XQoubZYPxMs78nEsYRuUlHc2rHnNzNcwsygZ2mq7++RxFoOD2mQwHn7dSB61?=
 =?us-ascii?Q?ZxYCcaYf9Iy4ddj3SZoY+AWDws/61c6enV89TLAUcKp7KolduFbRFb3FUDje?=
 =?us-ascii?Q?eF4cEWABqnK8TS2oQrQEZ8QoW7lxQ6wCTTtpqI4wE8FTqQpljjf6oKBerSNF?=
 =?us-ascii?Q?yxLhySu549U8rQhwMVLlNutA7v8xSxKc4sizI4wzVDLdRcnnI8gwNp9kEOED?=
 =?us-ascii?Q?1D9vzmOvhip42aJ+coh+qsDyVnkD71fLFqcbdcK08CyfZOqZ/plvaVBDf81s?=
 =?us-ascii?Q?0BLUi/wmpZ8QA/m7HKpWfo4j32ycqtzO5NGWrsX1EsRJn6m0Rs73ztmFThXw?=
 =?us-ascii?Q?mXIToh45cQ9WnPGe6mZ4XAwrPsF1Fj8OfES/qLyPnmVNWA2f+5PhYKVaGYHg?=
 =?us-ascii?Q?MrV+ITqW2bR3hgAZnNZxAWt60Zlbq8YFjxmDMMsedQifErQ/z5jxA/noVInf?=
 =?us-ascii?Q?8eFCbm/6xGIOdgK7c7W1Bd2nwcxiDw0jTi4nHcq56Cj5VSVE0xeK7LN24CQI?=
 =?us-ascii?Q?2X2FeWX1PFkvedVzVxNHJ+gSZEXb1k4FswB3i8tSiFcWY7jfF5yugoSWD0MY?=
 =?us-ascii?Q?HZ5cfb5jwZQFGyFShutkA3/4ZRYtNDptXhBG7tnot6BQ59/0LgtsnW868oGg?=
 =?us-ascii?Q?UeMd3vkKy7kspfDL+hsZJ+1bHyLScVQXQBrxHHuGmBZmw1SYP+wKmHFteFJ2?=
 =?us-ascii?Q?R9im4JAkuROX5WJ1j4KoGsMj0MfiXSRexyghgZKN/oAFGbrPEu1JBrOsia85?=
 =?us-ascii?Q?Wj2VFBCxBoSDGM6q05Q1ytHZxsKTkdSfik8UpCaeIgizGOd8QvtaZVUxssmX?=
 =?us-ascii?Q?n1Yug8IuJcm+nhSs1Ts9QWQ38A81zXIjaiwucH3ztmKhzvGGeFBoTxkAmBrj?=
 =?us-ascii?Q?u6smjZE08/SDqtCZFso2W1XqcD24mnIapjTZxt+RZMBC1Jdjm+Gmv9ExsjZD?=
 =?us-ascii?Q?aEreZxU2YMi2cfqSXMU8Pu0gHRzQGPJs7+cUuI7Hw79gkF9hVCr1V3wrM74c?=
 =?us-ascii?Q?j8+sagHn4+tSNHL5P8UEthdDTyfHNYzy8bzOCw3MaZPcA/lO3jYLbcNNgNgh?=
 =?us-ascii?Q?DhpAQlJ6YKHyTrMeqPI+tbSbiG9aN9YwNAN2DrpVYN/xfCya0My03UOlu5P+?=
 =?us-ascii?Q?Gb9chlfCoKJuzPzmF9Hqq03AUKKgthWemY7kw3vriSSndxR1SFXHghddF1vy?=
 =?us-ascii?Q?JHWX1KPsUlBsMtb1hwkW1xcpkuyreir1RbJpEN06WzlayH8BcAO3aISCgGXo?=
 =?us-ascii?Q?7GZZkCcVw49y63Hu86G/yQL1iEYHGaOXWqcsZL0eIJodY824I7sOgmIDqsBR?=
 =?us-ascii?Q?0XPAZVtuYdMldEJrSn1JuxxMVZ6Y1FHFQ9daaAnoi85GNyBuG87mGJBhYrEY?=
 =?us-ascii?Q?iJZgGmyRFWuZr6EPR/HLbJVugbfsNVUAF14Ru/bX87yDKYxKo4PoSlwiTnP6?=
 =?us-ascii?Q?+ytpkiD1sMOHDp6FPXb+b05W498KNWLjKQ0TA8QC?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68bfd753-3c3c-402a-a75e-08dba18fac01
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB4505.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2023 15:11:04.4682
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EolPVObJR3WxdbZ9mQoG8WPv/d2NUmvdpXf1lhfdSoB9w8KGqsofvCfVoxur0Z/kZFtaVtHF/hezTmouABqCxg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8983
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The try_src_count and try_snk_count may still be 1 after enter into
unattached state. This may be caused by below case:
 - SNK_TRY->SNK_TRY_WAIT->SRC_TRYWAIT->SNK_UNATTACHED
 - SRC_TRY->SRC_TRY_WAIT->SNK_TRYWAIT->SNK_UNATTACHED

The port->attached is not true at the end and tcpm_reset_port() will not
be called. This will reset counter into for these cases, otherwise the tcpm
won't try role when new cable attached.

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
---
 drivers/usb/typec/tcpm/tcpm.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
index 5639b9a1e0bf..c9a186a8c58c 100644
--- a/drivers/usb/typec/tcpm/tcpm.c
+++ b/drivers/usb/typec/tcpm/tcpm.c
@@ -3719,6 +3719,9 @@ static void tcpm_detach(struct tcpm_port *port)
 	if (tcpm_port_is_disconnected(port))
 		port->hard_reset_count = 0;
 
+	port->try_src_count = 0;
+	port->try_snk_count = 0;
+
 	if (!port->attached)
 		return;
 
-- 
2.34.1

