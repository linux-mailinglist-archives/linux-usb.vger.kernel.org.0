Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C5B6228E59
	for <lists+linux-usb@lfdr.de>; Wed, 22 Jul 2020 05:03:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731876AbgGVDDo (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 21 Jul 2020 23:03:44 -0400
Received: from mail-am6eur05on2063.outbound.protection.outlook.com ([40.107.22.63]:8617
        "EHLO EUR05-AM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1731781AbgGVDDn (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 21 Jul 2020 23:03:43 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UVLilKOkGLJtSklh9a+5ofKMzHYF9Z2Pz6JIPvFEzTQwr5C+mnLJlSLTJBgpPSURwCwdpWP3OQUtRM8hdkTDDd9377OPV4uXfltVZLu76BMiRh5ilpHkeVQ8t1awO/a4Kny4sKA4oGklUh7gce7M5i6tpKHMcKnXxuUOVFvtvwTBmyubd51zjFiOZKS6RS1+4wW5BHQPXQciokr08UJfpR73/qnDMgKE10Y8+xz47+cEUpByFa5RU9Q+ljowDxsLY+P5uJvgMvzypc8Gh6w2wF2UelL4tl4hkTLQy89V7oGdcDb2G0onzB/tuCVUD4NUgPuOGoJHffEN/kvCHVScxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7FE/6fSS29qoNxhpO97Yyo4EsRmd9huRlVgOu+uWlqg=;
 b=OorAsbj582abrcNFiou3RQsy0n6w1ErMDe9QxKCXivpjKnC6uDUjsFSwKD3AGQm4hYeqChbmiGH19tKuf8qwGGGA9AH5s8O1rhGBWIcMwin0WMbY59l1NwUp9+V4zmt+NInW+9y+x5ILBgDQqO6Afm650qnzqFB2HvlePrNixbYXVgdld2AntUEdv3nHaYMurS3M2f817eMG65g/jOFkHWGJ8eDAxBREIjHoYshbR+Og8Ex7gOLsTgQ4lFSaCJnSSGVyImu/f3HoR0MU6a/3294JNs/tF/ddNQJBBIYDaLJI9b+GdtyUStHZ7GcTh0gbf6yb9dE0vCCKnzovb+U+Bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7FE/6fSS29qoNxhpO97Yyo4EsRmd9huRlVgOu+uWlqg=;
 b=nwmrtlPlxIi0dwwYZcyU3WUXgYF3m+c7SawRVzIjP6Jz+Kd73rbyKixGpVZ8NtWTCn0CqF7cpE1/vChRfGUmnBHJvf6O+g3pCwILdOXT1VLtcktg0jlAp3xPdL9y0QhLfhDQ3E8jWmR03O+3aGjH3t9sKxt0TCHlu7DmG66WTDg=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
 by AM5PR0402MB2738.eurprd04.prod.outlook.com (2603:10a6:203:97::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.23; Wed, 22 Jul
 2020 03:03:39 +0000
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1101:adaa:ee89:af2a]) by AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1101:adaa:ee89:af2a%3]) with mapi id 15.20.3195.027; Wed, 22 Jul 2020
 03:03:39 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     linux-usb@vger.kernel.org
Cc:     linux-imx@nxp.com, jun.li@nxp.com, Peter Chen <peter.chen@nxp.com>
Subject: [PATCH 1/2] usb: chipidea: add query_available_role interface
Date:   Wed, 22 Jul 2020 11:03:16 +0800
Message-Id: <20200722030317.14245-1-peter.chen@nxp.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: SG2PR06CA0170.apcprd06.prod.outlook.com
 (2603:1096:1:1e::24) To AM7PR04MB7157.eurprd04.prod.outlook.com
 (2603:10a6:20b:118::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from b29397-desktop.ap.freescale.net (119.31.174.67) by SG2PR06CA0170.apcprd06.prod.outlook.com (2603:1096:1:1e::24) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.21 via Frontend Transport; Wed, 22 Jul 2020 03:03:37 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [119.31.174.67]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: aa59b034-3d1b-4479-2185-08d82debd55e
X-MS-TrafficTypeDiagnostic: AM5PR0402MB2738:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0402MB27386C343E874AE198C53DF68B790@AM5PR0402MB2738.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:862;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0fMoF/jr5PI14sKHCmUzN3QExAAkRagFpUNa+ZlvloL2YYYbQmjmnkbTChptGkjRWRbtVd8TBQluRLuQ61zFU3+VuTQDPgd4raqketQZdwjdRWvUTlwC1R9sZYFCaCrP9eN3W2WQSkeTnl4tomBmfOs0myFNQhAG8AEiBM3PFF6XG+tc2D+v/Mf5B3GPb9w8Y62YMucwTOIHu5W4hljYJv77U7Ffu6BgSqfGE+WUTcWpxubK8FIcsIglofSiG8MyXF0DBJZ/rMzMY4hiEbs1w+d7pRWI6QSfpgqWLG85cJItWX9w1fRSb9X+vg1bSOhq6P4aUrI7P89LI8KXYp4bHfhCy3gOsH6hhCpZn/BSlCVwLzP5n7h0VPdZt33VKcf7
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7157.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(346002)(366004)(39860400002)(376002)(396003)(136003)(66556008)(6666004)(66946007)(66476007)(6506007)(52116002)(316002)(478600001)(36756003)(5660300002)(1076003)(44832011)(86362001)(186003)(16526019)(2906002)(956004)(2616005)(6486002)(26005)(6512007)(8936002)(4326008)(6916009)(8676002)(131093003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: BSuOL4onAFjwCT6xMEuqwxPlcpgjNH0tr3n8jkc/Pry6zDE7tGfFwNBXi6D+uLbg9RE1o7/jhjSZZ/J/9bH8gTbEihgKyTtisQ4M/W4T1qUaj7h8SAi5eyTOxdqr6SQrVLzfEkYfOuRdL1Gxwt09Ns6nSvLfBbi8myQFxWeCXrl2uZIzz206uAHwGm2tCUMFCaCPui0MQnVjsNc/Ak80MrHUUfo9of2ygEHeekxCdrNaTY/RBkF4t9z2X77aFtu3mYAepI/AGuLPFO03FHQFhByUePhp55xkq9c06yWowg3KYm66lnt+26ujXtFet/L/mDN5AMUgjwObDzrwbF0cLh1c8DOwNMTjbflVSv/fLTurj1UT9M438d/lFYvoCc04BgeS4XyU15jfxXDnaJ/HAhHuMhh5WkN+AtVDvtv+48fZdz2va7x7yUU2jmQYQys/IOb7PVo0Zl9ntzDl7JxbqRZmctMCzNBykViMSHdwEGc=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa59b034-3d1b-4479-2185-08d82debd55e
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7157.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2020 03:03:39.5087
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KqtjlJPIomMQ1tEosDF6kaBg3Ak93CFyBhOy/x6CuX2x+v8LGEmb3V39JtxFF/2HAnPBewZjUQHJ/F+0QSBCOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0402MB2738
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The glue layer may need to know current available role to do some
setting, eg, the wakeup setting. So we add ci_hdrc_query_available_role
for that.

Signed-off-by: Peter Chen <peter.chen@nxp.com>
---
 drivers/usb/chipidea/core.c  | 27 +++++++++++++++++++++++++++
 include/linux/usb/chipidea.h |  2 ++
 2 files changed, 29 insertions(+)

diff --git a/drivers/usb/chipidea/core.c b/drivers/usb/chipidea/core.c
index 9a7c53d09ab4..87ae3c8686a7 100644
--- a/drivers/usb/chipidea/core.c
+++ b/drivers/usb/chipidea/core.c
@@ -877,6 +877,33 @@ void ci_hdrc_remove_device(struct platform_device *pdev)
 }
 EXPORT_SYMBOL_GPL(ci_hdrc_remove_device);
 
+/**
+ * ci_hdrc_query_available_role: get runtime available operation mode
+ *
+ * The glue layer can get current operation mode (host/peripheral/otg)
+ * This function should be called after ci core device has created.
+ *
+ * @pdev: the platform device of ci core.
+ *
+ * Return runtime usb_dr_mode.
+ */
+enum usb_dr_mode ci_hdrc_query_available_role(struct platform_device *pdev)
+{
+	struct ci_hdrc *ci = platform_get_drvdata(pdev);
+
+	if (!ci)
+		return USB_DR_MODE_UNKNOWN;
+	if (ci->roles[CI_ROLE_HOST] && ci->roles[CI_ROLE_GADGET])
+		return USB_DR_MODE_OTG;
+	else if (ci->roles[CI_ROLE_HOST])
+		return USB_DR_MODE_HOST;
+	else if (ci->roles[CI_ROLE_GADGET])
+		return USB_DR_MODE_PERIPHERAL;
+	else
+		return USB_DR_MODE_UNKNOWN;
+}
+EXPORT_SYMBOL_GPL(ci_hdrc_query_available_role);
+
 static inline void ci_role_destroy(struct ci_hdrc *ci)
 {
 	ci_hdrc_gadget_destroy(ci);
diff --git a/include/linux/usb/chipidea.h b/include/linux/usb/chipidea.h
index 54167a2d28ea..025b41687ce9 100644
--- a/include/linux/usb/chipidea.h
+++ b/include/linux/usb/chipidea.h
@@ -99,5 +99,7 @@ struct platform_device *ci_hdrc_add_device(struct device *dev,
 			struct ci_hdrc_platform_data *platdata);
 /* Remove ci hdrc device */
 void ci_hdrc_remove_device(struct platform_device *pdev);
+/* Get current available role */
+enum usb_dr_mode ci_hdrc_query_available_role(struct platform_device *pdev);
 
 #endif
-- 
2.17.1

