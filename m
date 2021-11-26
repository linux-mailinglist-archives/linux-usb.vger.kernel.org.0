Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 60C9345F08A
	for <lists+linux-usb@lfdr.de>; Fri, 26 Nov 2021 16:23:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350522AbhKZP00 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 26 Nov 2021 10:26:26 -0500
Received: from mail-eopbgr40112.outbound.protection.outlook.com ([40.107.4.112]:63622
        "EHLO EUR03-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1351661AbhKZPY0 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 26 Nov 2021 10:24:26 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=USo1l//KA1wqyWWjm7QclCpNh0bUwyEtk5xC7FVp6f0AQwOAlAtxm5/fSqvo++AWQ3OQbsZPTEqMH8xzD3SNfFEm1Km955hBUL1JEXsTTd1MjEmyDcMDpfmZHu5NYmK9/j/dUo1xydMk9kosq9VWGx96MUTsOsmkg+1YabeG/iJau14vF8bLcRjzDp0ogp6uHM09+xnw6mvYKTEY/JRzS1UD8OAsbyNwgxjXslC8w6JljT6ADMOkpohw8pYSBkJvtg9FZioG540QAUSZIEL2wVKlYuHQc3pz3Usc8nRxlyUzRtfuiRSbbhNXzZ7PSRlCfnkH2DFjG7bF/NAS/fCh4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4y8PsXp3Fe9PfRlSmIhxIeAxMV+Sb4vq5cDHy25MOiI=;
 b=VBWekgb4gy37nBuu0fcx58fV2o6Nfmr2Ym6PbrqgZGexwQMdMe40IQ0opoLfE62OTb7IJC4/xH9ba5QCN3gk8z6hwzSILVnTVNrfuSbt2lmrEIbshywPy8IyDw7RJBwZu7F7bqY2otspBNcr9AV2kTEsmpHYABkpW6ICjs6LWOww865pSjLysloqBpur47czDY0Bb929GtMSgDrk46Us2WxdMVD8u6ty6khmlpStGQwEI1JWf0iSuJ4Hi01oPHBnGjjkEwNyDtkYZo7oIJ3w/WRlh31BSwHtgEC+nlAtwW481siERqh8FqyEWCdYMKQisr7R0mneKnhAsEZ8E3nIkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 62.153.209.162) smtp.rcpttodomain=vger.kernel.org
 smtp.mailfrom=schleissheimer.de; dmarc=none action=none
 header.from=schleissheimer.de; dkim=fail (no key for signature)
 header.d=schleissheimer.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=schleissheimer.onmicrosoft.com; s=selector1-schleissheimer-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4y8PsXp3Fe9PfRlSmIhxIeAxMV+Sb4vq5cDHy25MOiI=;
 b=jr8FarWFFlF2Gnoyn2i4G8SLqCwfJTjFJ6Y8Yxq0vIPjwC39JKke9vGuy7/7wFzUUrvAB9iZd46PhTWMgAXsTRpSKUwbBC+lcqzcAS0/6SL+M2t+vq97lAESJlgDBOxpZSx+bmrPyGW8/ktIarJFRyj9FnTFRBY00hHs453xN7o=
Received: from AM5PR0402CA0024.eurprd04.prod.outlook.com
 (2603:10a6:203:90::34) by AM9P190MB1234.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:261::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.23; Fri, 26 Nov
 2021 15:21:11 +0000
Received: from HE1EUR04FT037.eop-eur04.prod.protection.outlook.com
 (2603:10a6:203:90:cafe::ed) by AM5PR0402CA0024.outlook.office365.com
 (2603:10a6:203:90::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.22 via Frontend
 Transport; Fri, 26 Nov 2021 15:21:11 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 62.153.209.162)
 smtp.mailfrom=schleissheimer.de; dkim=fail (no key for signature)
 header.d=schleissheimer.de;dmarc=none action=none
 header.from=schleissheimer.de;
Received-SPF: Fail (protection.outlook.com: domain of schleissheimer.de does
 not designate 62.153.209.162 as permitted sender)
 receiver=protection.outlook.com; client-ip=62.153.209.162;
 helo=mail.schleissheimer.de;
Received: from mail.schleissheimer.de (62.153.209.162) by
 HE1EUR04FT037.mail.protection.outlook.com (10.152.26.161) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4734.20 via Frontend Transport; Fri, 26 Nov 2021 15:21:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=schleissheimer.de; s=dkim1; h=Message-Id:Date:Subject:Cc:To:From:Sender:
        Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=4y8PsXp3Fe9PfRlSmIhxIeAxMV+Sb4vq5cDHy25MOiI=; b=XByJgvrE+aSAlU8ON8CQq/i0ts
        rHSapQIbcyYEulcu9mXtEmDBVLXMzMRcPLfcyPFhAwaESvhWTWn/TYWn6NdjKidBL1rikphrQ+GI0
        4hMySDkzYavXcW+K0zKEPb+/NLrTEQHMPZHpPA7YSY9dr3wPOAMw0p9+mBujjqW4dRsk=;
Received: from [192.168.10.165] (port=46364 helo=contiredmine.schleissheimer.de)
        by mail.schleissheimer.de with esmtp (Exim 4.94.2)
        (envelope-from <schuchmann@schleissheimer.de>)
        id 1mqd24-0006GU-2o; Fri, 26 Nov 2021 16:21:01 +0100
X-SASI-Hits: BODYTEXTP_SIZE_3000_LESS 0.000000, BODY_SIZE_1000_LESS 0.000000,
        BODY_SIZE_2000_LESS 0.000000, BODY_SIZE_5000_LESS 0.000000,
        BODY_SIZE_7000_LESS 0.000000, BODY_SIZE_700_799 0.000000,
        HTML_00_01 0.050000, HTML_00_10 0.050000, LEGITIMATE_SIGNS 0.000000,
        MULTIPLE_RCPTS 0.100000, MULTIPLE_REAL_RCPTS 0.000000,
        NO_CTA_URI_FOUND 0.000000, NO_FUR_HEADER 0.000000, NO_URI_HTTPS 0.000000,
        OUTBOUND 0.000000, OUTBOUND_SOPHOS 0.000000, SENDER_NO_AUTH 0.000000,
        TO_EMPTY 2.000000, __ANY_URI 0.000000, __BODY_NO_MAILTO 0.000000,
        __CC_NAME 0.000000, __CC_NAME_DIFF_FROM_ACC 0.000000,
        __CC_REAL_NAMES 0.000000, __DQ_NEG_HEUR 0.000000, __DQ_NEG_IP 0.000000,
        __FUR_RDNS_SOPHOS 0.000000, __HAS_CC_HDR 0.000000, __HAS_FROM 0.000000,
        __HAS_MSGID 0.000000, __HAS_X_MAILER 0.000000, __MIME_TEXT_ONLY 0.000000,
        __MIME_TEXT_P 0.000000, __MIME_TEXT_P1 0.000000,
        __MULTIPLE_RCPTS_CC_X2 0.000000, __NO_HTML_TAG_RAW 0.000000,
        __OUTBOUND_SOPHOS_FUR 0.000000, __OUTBOUND_SOPHOS_FUR_IP 0.000000,
        __OUTBOUND_SOPHOS_FUR_RDNS 0.000000, __PHISH_SPEAR_REASONS 0.000000,
        __PHISH_SPEAR_REASONS2 0.000000, __PHISH_SPEAR_STRUCTURE_2 0.000000,
        __SANE_MSGID 0.000000, __SUBJ_ALPHA_END 0.000000,
        __SUBJ_STARTS_S_BRACKETS 0.000000, __URI_MAILTO 0.000000,
        __URI_NO_WWW 0.000000, __URI_NS 0.000000
X-SASI-Probability: 19%
X-SASI-RCODE: 200
X-SASI-Version: Antispam-Engine: 4.1.4, AntispamData: 2021.11.26.144216
From:   Sven Schuchmann <schuchmann@schleissheimer.de>
Cc:     Sven Schuchmann <schuchmann@schleissheimer.de>,
        Woojung Huh <woojung.huh@microchip.com>,
        UNGLinuxDriver@microchip.com,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>, netdev@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] net: usb: lan78xx: lan78xx_phy_init(): use PHY_POLL instead of "0" if no IRQ is available
Date:   Fri, 26 Nov 2021 16:20:40 +0100
Message-Id: <20211126152040.29058-1-schuchmann@schleissheimer.de>
X-Mailer: git-send-email 2.17.1
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 335af9e7-29df-4200-56b1-08d9b0f060d0
X-MS-TrafficTypeDiagnostic: AM9P190MB1234:
X-Microsoft-Antispam-PRVS: <AM9P190MB12349312DAFE124CA8C0F6CDD3639@AM9P190MB1234.EURP190.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /w9So8JphlpqYFIGKiA634NSI3uhIxC2ll0jT4LGFTMobDPss30F21Wq0Mp2htyJCtCr6RI5kgwYJXUGp/5oJHxSnwFacuIg9ueqB7egX80hHvWmUryt1u4mVKopZ/8E9zjQsfLWpz+4L+zfISRLy6TJtQ8JA1QAmPJalbWYPKT9N6c2Kd23ntj9sHvttRJg5+/vGZo3HDcvCzhQxKO2xl62K4UpRQ8osX2tvShemKMDRXJwvLujZOWnBgS1f6Bqado2D4Z4OAzrEC42Z/QD1B670xt7cKt2qQ2FbK/iK0RN3RqwbMOS/r8gMzsnCxZ4YrXeeFEPDjvTzsgrhgYPMBC8ylT1rF41kpe85Rqa40LkezVEClvl7IbtgMOnuUobPwblMSdDlRD4DAdNIrdlcvIIgRewQ9ylShWjokYRIlLTfNrDr3ufb/e3OpmiUx/UTnqTHVQ28uLn76KkLfjRxPxBobgQ3eJst/INMrFODjEwckEefjDPitWuvcnQc6n4GJthrS2SEUMc5nphud8bzsPRkQ4wNwWdSG0joQQJf1HqdCA++4d2/IbN4klz6FjAD4Zogqmqf3Wy66+x+uRsplLRyXdsUF2oEGH1OcTHK+FfiLCHigwR4LwKo6/X7nRW0o2pjsPX46vng1BJyewtGKL0YgotjD1ecaMLiINBooUFC49r9QAyzMOgaWAcqsGiCyblIdU+c+ip3lgTKKJDwJqHCJp0tKbj0Tbc1f7+awM=
X-Forefront-Antispam-Report: CIP:62.153.209.162;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:mail.schleissheimer.de;PTR:www.schleissheimer.de;CAT:NONE;SFS:(4636009)(346002)(39830400003)(376002)(136003)(396003)(36840700001)(46966006)(6666004)(9786002)(47076005)(36860700001)(508600001)(356005)(7636003)(426003)(1076003)(82310400004)(336012)(2616005)(7696005)(186003)(26005)(54906003)(2906002)(316002)(5660300002)(36756003)(8936002)(8676002)(4326008)(109986005)(83380400001)(4744005)(70586007)(70206006)(266003);DIR:OUT;SFP:1102;
X-OriginatorOrg: schleissheimer.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2021 15:21:11.1592
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 335af9e7-29df-4200-56b1-08d9b0f060d0
X-MS-Exchange-CrossTenant-Id: ba05321a-a007-44df-8805-c7e62d5887b5
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=ba05321a-a007-44df-8805-c7e62d5887b5;Ip=[62.153.209.162];Helo=[mail.schleissheimer.de]
X-MS-Exchange-CrossTenant-AuthSource: HE1EUR04FT037.eop-eur04.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9P190MB1234
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On most systems request for IRQ 0 will fail, phylib will print an error message
and fall back to polling. To fix this set the phydev->irq to PHY_POLL if no IRQ
is available.

Signed-off-by: Sven Schuchmann <schuchmann@schleissheimer.de>
---
 drivers/net/usb/lan78xx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/usb/lan78xx.c b/drivers/net/usb/lan78xx.c
index 2bfb59ae0eaf..185e08c1af31 100644
--- a/drivers/net/usb/lan78xx.c
+++ b/drivers/net/usb/lan78xx.c
@@ -2398,7 +2398,7 @@ static int lan78xx_phy_init(struct lan78xx_net *dev)
 	if (dev->domain_data.phyirq > 0)
 		phydev->irq = dev->domain_data.phyirq;
 	else
-		phydev->irq = 0;
+		phydev->irq = PHY_POLL;
 	netdev_dbg(dev->net, "phydev->irq = %d\n", phydev->irq);
 
 	/* set to AUTOMDIX */
-- 
2.17.1

