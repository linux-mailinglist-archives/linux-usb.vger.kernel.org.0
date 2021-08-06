Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A9833E2EB2
	for <lists+linux-usb@lfdr.de>; Fri,  6 Aug 2021 19:00:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239579AbhHFRAW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 6 Aug 2021 13:00:22 -0400
Received: from mail-bn8nam11on2086.outbound.protection.outlook.com ([40.107.236.86]:7252
        "EHLO NAM11-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S235659AbhHFRAV (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 6 Aug 2021 13:00:21 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UFk5l6Y6hGyu4SDC6+7dfZm3+Yl03LLCfpKR8SmJOOUlSVTGWMy02qQiwC5LMGQ0e4UKe5UUDpF4FnX6666wHMrA7fLnArZMa7+UbmmjnrnACqLMGYmW7Cvx8SvM8GAB7VrFvoarQrgRqKP/wCxNSRfDwYf6XhOekrm+4PxUxH8Y6/sapiN/PUO0XnDk/Ql5GYB2QqWQFwzmWnJWOAMpKk0uUpAyXg+SH6OkIzx8aYEt8qrO8aglbiLacrF5JAbMTe9Qfg/mvuyx2KO/HgFcqQIpSTatJGsHM9MrgAalUF6MEf3Lu31wjv+AuJxrofT6uL6uFqdplhNwInFb1I6yWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yFW1ybPUF4EEIN5T359H0tYKZnXkJ+MBWUsfFEUzBlE=;
 b=KGmkPWJmj1wz6cH2kuAX/KtJmKW77w0LcWIYlLQ81jdhc+um4e5Ke+Wl1NQvapFZI/HnlC32UXqaCVaYtScpMYwzlrX7G9R3hPTxkQs7FwOr82SmyXTvk/CMuGQc1lXqUnDdHDASZYnadqd20LGyAfUBpSSqCv0ezt34wTo0qUscF7IT+jOt1gVtumjn0lgU7bKaKKi/Uf5+YFt7fv/pKA+b+W3W1XCV+DJA6BGQ6CcmuNSTd4S0Z3Di+RJm9KB5l+ET0g9cFFBnc3xO6u4K4oTkzRz+yZEe7yy/b1DA04C79plHs7x6zSVBBERbw1OouIUOGEmTlHdgRjgixGJRMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yFW1ybPUF4EEIN5T359H0tYKZnXkJ+MBWUsfFEUzBlE=;
 b=aBU3mZSnvPC8izDeHufZazTW2PtIGWeq3rBV3DC4ZVzWaQnxUygup6+z6LjJxm9s1akMnc/o6s5S3/KGc2AWeMOPTGzoAKjdcdbmk9+oHn1msHCuGlDjgTMrEvx1KiEWJyOwhsbJnvHwpYb5eoZtTILatKPl8A+eLaF9SgDL0ho=
Received: from BN0PR03CA0055.namprd03.prod.outlook.com (2603:10b6:408:e7::30)
 by MW3PR12MB4508.namprd12.prod.outlook.com (2603:10b6:303:5b::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.22; Fri, 6 Aug
 2021 17:00:02 +0000
Received: from BN8NAM11FT003.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:e7:cafe::25) by BN0PR03CA0055.outlook.office365.com
 (2603:10b6:408:e7::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.16 via Frontend
 Transport; Fri, 6 Aug 2021 17:00:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT003.mail.protection.outlook.com (10.13.177.90) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4394.16 via Frontend Transport; Fri, 6 Aug 2021 17:00:02 +0000
Received: from sanjuamdntb2.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.12; Fri, 6 Aug
 2021 11:59:58 -0500
From:   Sanjay R Mehta <Sanju.Mehta@amd.com>
To:     <mika.westerberg@linux.intel.com>, <andreas.noever@gmail.com>,
        <michael.jamet@intel.com>, <YehezkelShB@gmail.com>
CC:     <Basavaraj.Natikar@amd.com>, <Nehal-bakulchandra.Shah@amd.com>,
        <Shyam-sundar.S-k@amd.com>, <linux-usb@vger.kernel.org>,
        Sanjay R Mehta <sanju.mehta@amd.com>
Subject: [PATCH v3 3/4] thunderbolt: Skip port init for control adapter(0)
Date:   Fri, 6 Aug 2021 11:59:07 -0500
Message-ID: <1628269148-51355-4-git-send-email-Sanju.Mehta@amd.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1628269148-51355-1-git-send-email-Sanju.Mehta@amd.com>
References: <1628269148-51355-1-git-send-email-Sanju.Mehta@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6c78ba28-23d7-4bca-3868-08d958fba1a7
X-MS-TrafficTypeDiagnostic: MW3PR12MB4508:
X-Microsoft-Antispam-PRVS: <MW3PR12MB450836D4FCD61ADEF9159A2FE5F39@MW3PR12MB4508.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2887;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AwfroeY7Sj+I75vZCOBruMNebWMFEAhYFein2mFMLkAKMtqgN42jb16g+SfbAv3ctVVw6d2fUeg0+xiUu8OUGoj8yr7caAjaxFX6wquVtQ6zp4b2N1b3xds44yqvQSX9fgj316a2w45+qz+QwpN3Dr21z9LHNhDVl4ZvRrj0LH6Ps14wNLOun9k21COxGpSBfHFkVZMEt+8O8xigy4UdDFY0c2Xapammy0yM4jPgcx97ZpBof/2E7+uK9YPFGiSq71VNVNhBVEIZ1W/Fh1I6RasoMqKPwYwQnSX2gnT2iDo3xcoXl7RrT9ef+bF4IhzBAIZcPe7bPQLo1yjKdX3Q3JV2voRSALTBV+yalVI5nUnEyeqhWib4UklRl73UX6vf+niqUDkqZK9Ix+F+9yh66OzdpP/greoNS29UsTZ0IHV3TK0gCR7bN6vFMbY6nj8qrpJ/ffbT/Sed+nJ4xe15ef+byVQvcTs5NaE0xGUIEfu3JXdzD51OSt0ccNtqdbnllaKw7fJJ7Ik/xWYkGHikfCyFKlJHbHo9IyPrUEd1FQ1xahdv58zdb9s5UBLOJagP5TI2z1KeP9fRa6CHr/rSHGviC77GfptCMf4ApDY9iGJsETGNIuOUnO/QSno/Uj3IgwhQIN7Y2PCEyfMUyOQOTOcap2vEeoh5XX0TRcawvieX5T42ID5GC+QQZ0sCjSx1ZLE+J6MwHYTk8EY63SJFIct3NUicm+YfTTo+uh7bPVc=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(396003)(39860400002)(136003)(376002)(346002)(36840700001)(46966006)(81166007)(70206006)(2906002)(36756003)(26005)(82740400003)(356005)(426003)(4326008)(5660300002)(70586007)(2616005)(7696005)(6666004)(86362001)(186003)(54906003)(16526019)(82310400003)(316002)(336012)(4744005)(47076005)(110136005)(478600001)(8676002)(36860700001)(8936002)(83380400001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2021 17:00:02.1342
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c78ba28-23d7-4bca-3868-08d958fba1a7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT003.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4508
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Sanjay R Mehta <sanju.mehta@amd.com>

Adapter (0) is control adapter and as per USB4 spec in "Section 1.8",
"Control Adapters do not have an Adapter Configuration Space".

Hence skip port initialization for adapter (0).

Fixes: e6b245ccd524 ("thunderbolt: Add support for host and device NVM firmware upgrade")
Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Signed-off-by: Sanjay R Mehta <sanju.mehta@amd.com>
---
 drivers/thunderbolt/switch.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/thunderbolt/switch.c b/drivers/thunderbolt/switch.c
index 83b1ef3..6447876 100644
--- a/drivers/thunderbolt/switch.c
+++ b/drivers/thunderbolt/switch.c
@@ -2740,7 +2740,7 @@ int tb_switch_add(struct tb_switch *sw)
 			return ret;
 		}
 
-		for (i = 0; i <= sw->config.max_port_number; i++) {
+		for (i = 1; i <= sw->config.max_port_number; i++) {
 			if (sw->ports[i].disabled) {
 				tb_port_dbg(&sw->ports[i], "disabled by eeprom\n");
 				continue;
-- 
2.7.4

