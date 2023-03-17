Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 526366BE11B
	for <lists+linux-usb@lfdr.de>; Fri, 17 Mar 2023 07:15:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229477AbjCQGPF (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 17 Mar 2023 02:15:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229806AbjCQGOx (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 17 Mar 2023 02:14:53 -0400
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2074.outbound.protection.outlook.com [40.107.21.74])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F6AE6EB6
        for <linux-usb@vger.kernel.org>; Thu, 16 Mar 2023 23:14:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j8IozZL/c7D9eWnNVBSRGKYmY64FcRsio1D7c5uHaVWRHmPg6NqSgjitsoPDLqCX4mRFOTOP4svc/hYdt0rHzSHOIL9hIw0+NKOeu/3aDu0V/ShkLpy/Za+3tphMP2ZYJVbHrDfBzdfcSSxB2AqrwcjXJ7B0fYOtVpKIjDG9gh8Tr3nBRMBLS/Ty8URlmOL4brgE+wxMNmu69wcNjykLwz8W/kkNzPOtRaBYbD4X/nVAN6HrftbeLlDZg+L3NkMaV0Sx2crJQL9zEIqmjHh2a8KF7Kpvb5trZOBERNJIx5d5pZ7bPll1rh71PGs10nF0QSvv978DoFCd6dXTMNBTxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mJ930StX0z4/DeKon6+6tRFukxgHDHENxB2kEigh4vc=;
 b=e3MR9nVWPWc/ahDYsBMScuIyB8i5snpqLRCNULx+vq1kalOVSMpE7TMwAhcbso0XuOkVNKMgLB3dsLWO32stUdSqmDZplsEtgzwbPs9RiWd5q0++aKoQkTmZbD6NcTU5XP9f75iqxeDUr5WTZZFBV0zkBE+gedrFQRUN0MB+EAihnZGcZDR/V1tBr6nLrJMnC2s0tIrzbUkCbUkbwKfAPRWEWvl22dmmAw0MjZ5LdFtKteA2nt5gBmoQPKIq5odtsUgoOiJqa55A+LlKbg3VMEKXBH4APBgcbJK4dCnQNtU3Dlmt9zDnq/71kQxSwZ71D0zAQ8Vs/BRAFNZJeriAmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mJ930StX0z4/DeKon6+6tRFukxgHDHENxB2kEigh4vc=;
 b=I8CSh6OgMdDhpjIJZR4CZTUljtQ2dicSe6gpPPmP0nk2ingJaehJ0tBavOWZGF/8ZEAMwx2xPhPy28JjRQy5svKa2kOAlXsb09EZSoLURU0n2lLQrWL72C5jzc+FSBP+WEL48W5pka4XjVpybLkKGMbmlndDfKUuHdXdfI1zfMw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB7PR04MB4505.eurprd04.prod.outlook.com (2603:10a6:5:39::26) by
 DBAPR04MB7366.eurprd04.prod.outlook.com (2603:10a6:10:1a0::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6178.31; Fri, 17 Mar 2023 06:14:48 +0000
Received: from DB7PR04MB4505.eurprd04.prod.outlook.com
 ([fe80::5466:bfa2:3158:97c6]) by DB7PR04MB4505.eurprd04.prod.outlook.com
 ([fe80::5466:bfa2:3158:97c6%3]) with mapi id 15.20.6178.035; Fri, 17 Mar 2023
 06:14:48 +0000
From:   Xu Yang <xu.yang_2@nxp.com>
To:     peter.chen@kernel.org
Cc:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        linux-imx@nxp.com, jun.li@nxp.com, xu.yang_2@nxp.com
Subject: [PATCH v3] usb: chipidea: debug: remove redundant 'role' debug file
Date:   Fri, 17 Mar 2023 14:16:51 +0800
Message-Id: <20230317061651.2457567-1-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR03CA0106.apcprd03.prod.outlook.com
 (2603:1096:4:7c::34) To DB7PR04MB4505.eurprd04.prod.outlook.com
 (2603:10a6:5:39::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB7PR04MB4505:EE_|DBAPR04MB7366:EE_
X-MS-Office365-Filtering-Correlation-Id: c8d5e121-d53d-4034-6d53-08db26aee95a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BOLC2oAGFY7APS8AaOxyE+2eXg1kkHmMgvt892gL0WT8EpSJRWBNxtKTihjnZ7wZZVW2HZij00nLGplpEMRB3MGSSJ+BceMQvAZZBG8/BJsVt261BwUxOl6Ms7BGJM1O3UorAUWHVt/T0fuF0uuPFckpyvfEVNM/xth0XaNhlj2ySIovlrhsy2bZ6v6SuYvX+X0plXdTH7FE2QIGluG4rUFhElpcasBSz+bXdOsWccNXM/1WyL20I+3EQrIG9L/aLh/qEJfBpIzRcyuy6z6Z6t2VLm6URUQyPAu3i5Id/obOxdgKT50H8qewezFLMReTJjCRcr8niEojQZ2PsK0IsIOEy0eWz5EERrxX/kMqOSiZe+WpFe1xrJapFbEUO9X3d0RNb3HaNioGCcaZh1LrS+f0jEhjchYaHRpeqC/jI1k5wVe8FuMeGcumyyI/qMCfaPsOEEvVT4ixF0OaTE0kMZnTOH8Q4VmZhklkLA+8XRnR16zRC2NG449D9D7nssoyV4rblWpC5Pv5HtuzZIwz/uKdPu62icjsiSz7e3fpc1kWE7eTxijJj2wBMQ93asTtiw9+Il8zx5QQ1u6oTMPOlMNoT9wAVVcomoEuHdcNEEk9crRLnp7fdB2fbB+EntHyH0f/P15BBH0W3BWx2DddfsQ6dsyCymGCcC1ZT0JQex8jDAa9ETMpNXuMXNBxBFSx4GrTWREfAcQWD5QbFUeyiA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR04MB4505.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(346002)(376002)(136003)(39860400002)(396003)(366004)(451199018)(38350700002)(38100700002)(86362001)(36756003)(2906002)(4326008)(41300700001)(5660300002)(8936002)(6916009)(1076003)(6512007)(186003)(26005)(2616005)(83380400001)(316002)(6506007)(66556008)(6486002)(8676002)(66946007)(6666004)(52116002)(66476007)(478600001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4q2noAMOx6c4/mXSAZKx5Wf2Zh/jyH2gLvQZDTkHmXrvhvQdeeYjMoVT4wGi?=
 =?us-ascii?Q?EYC7eGOez+7T1q5nv4HMqf0aD1hK7cpXFP5K2euD67YcTlyweqwqw5hRm1X6?=
 =?us-ascii?Q?cOlu38kgC6brh4U75Lc9sk3BZpXkbISxQ7NXOGNCBKiw3tCKhYGd8Dy3/5gK?=
 =?us-ascii?Q?lRmSTDOSb20rRD/fWerLrQTROoJP5AG/EvGq+tgQoEOKBceeeuP/iQEHtlqD?=
 =?us-ascii?Q?/h7oeOW5F4fqyTCM47dus85JEmLK7bWnXUXHwX/b+3QFcs+ncTbTbp34XMj5?=
 =?us-ascii?Q?pOBup2lMhNv+4X+fOU/2l/zZzk5NqeGGl4kVhpgYrY0xtNBmI195oLNRvB3x?=
 =?us-ascii?Q?NT2FSqFbetyYKGTEa5hE4pppAbBDhgofPxyKFM+gIV/T1Zq0O1qIOJrBlG5k?=
 =?us-ascii?Q?PC1f0Vt37y9ln4FnTeMuOoALt4irm/JHqPuc1HOHuqHNph0KKnys+yd37YYC?=
 =?us-ascii?Q?/Jg0NPl8v8A3B0uPtMchWWfTHX+B+NZGxmSJyfkfD8AmeuId9AYf5UJ0/O3d?=
 =?us-ascii?Q?oJvpox01Bi/y3tg4GxXIMPdjBQsrXoJQDOoQILsMlzU0IyYwNg8zHcTaU1fA?=
 =?us-ascii?Q?2SDwZEbYh+H+xilna1ufmdCRa7IvEyKy1Oirhyhp80ePkx/AMPc+Y1O5ilRA?=
 =?us-ascii?Q?OXTTqaLzsjssKzXnGyRyI78SHeveh2QAYaoiJkzwK1m+AcbzczWm7rLI4ECS?=
 =?us-ascii?Q?j9MdZba2WhAciiJxPJU/y6U2IDhc7Yqv9X6NaEfJsCTNiO3xp/Xf07Ue17SW?=
 =?us-ascii?Q?zaEN52hm2BNQawY0i6PgRH4y7TKD5QhKU1xCkg7GpyYnLdNZfCBAPyEfcb44?=
 =?us-ascii?Q?nVDB9sU0b/nsOIM8y8YFeXdkhBdPHTqyPsfV+BnDSxZNfDDByKGFG+GLiow7?=
 =?us-ascii?Q?xF6armInZlUYhkt7JQc7YwaLpPCFii5wJkYS7JdbcPLDQcKqPf3hyiADQn/3?=
 =?us-ascii?Q?zCAUBxFxi4Am7WOa/NDWKzrkveoSnSMDMUyjZbAXu0SvtsJfF5I1evBOVFy2?=
 =?us-ascii?Q?S+6Ty5RFGjamtng9atIG9DyiitjWuEB3Om4hyWHrqg30CryOfKhYQ12pFlhY?=
 =?us-ascii?Q?ELf1wdeQI22wjJScgeYvX1arPHIO1qHt3QA/IWbphPnP1mZA1Ql8sdSK/M3S?=
 =?us-ascii?Q?5xwHbSyxpuAESTtmp02t7BdYKrfFpLoBQN6QLfccV83N3bGSk5LMb/TRKgzx?=
 =?us-ascii?Q?6jzonAjrcHTz6zNQfsWpZa8U7UUItWuX8+TTTpeT9/LjLn0I5BA8b5e8cN4N?=
 =?us-ascii?Q?4hyLkTEkEIpOTgLOiWX2T54kUeXR5qLX7vUNU4SaHKiWtX+Hiq8A8RX2a8k1?=
 =?us-ascii?Q?Y5Tol4tKC4X5G8p6aeR3dm8dmbHa/atHJcMM/xpYfYu6DkCwCVLAoPv/tIgJ?=
 =?us-ascii?Q?VmstmwAewhytvIanKTZDaus1ywkg3MwaVINKK0YwbM/QTpNXOyAxihkKNU6g?=
 =?us-ascii?Q?UFnQBpUxpiIs+XC/oSVUlWajuW5i/IEEWbtOI2Yr+BhgXTtm/1z1oXQBOLoX?=
 =?us-ascii?Q?5z1tCd5inJyib+aNjTLgY0CIyNmpZqB82NpobnMH5yJ7G9zzb5mLJJUW9z78?=
 =?us-ascii?Q?wf8D0yXb2230KxrM29/gzCKb8T8sXZ0Moqkh4/mF?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c8d5e121-d53d-4034-6d53-08db26aee95a
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB4505.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2023 06:14:48.6427
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tImLWdm0CrcYkDMNO9R8S6xD9DV9Z9AtvY5Ku8hdDOxHEtskb29simwEHv5wvPGxk6xkBI5d7sw+gUTsof9GIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7366
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Two 'role' file exist in different position but with totally same function.

1. /sys/devices/platform/soc@0/xxxxxxxx.usb/ci_hdrc.0/role
2. /sys/kernel/debug/usb/ci_hdrc.0/role

This will remove the 2rd redundant 'role' debug file (under debugfs) and
keep the one which is more closer to user.

Acked-by: Peter Chen <peter.chen@kernel.org>
Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

---
changes since v1:
- no change
changes since v2:
- add acked-by tag
---
 drivers/usb/chipidea/debug.c | 55 ------------------------------------
 1 file changed, 55 deletions(-)

diff --git a/drivers/usb/chipidea/debug.c b/drivers/usb/chipidea/debug.c
index bbc610e5bd69..e72c43615d77 100644
--- a/drivers/usb/chipidea/debug.c
+++ b/drivers/usb/chipidea/debug.c
@@ -247,60 +247,6 @@ static int ci_otg_show(struct seq_file *s, void *unused)
 }
 DEFINE_SHOW_ATTRIBUTE(ci_otg);
 
-static int ci_role_show(struct seq_file *s, void *data)
-{
-	struct ci_hdrc *ci = s->private;
-
-	if (ci->role != CI_ROLE_END)
-		seq_printf(s, "%s\n", ci_role(ci)->name);
-
-	return 0;
-}
-
-static ssize_t ci_role_write(struct file *file, const char __user *ubuf,
-			     size_t count, loff_t *ppos)
-{
-	struct seq_file *s = file->private_data;
-	struct ci_hdrc *ci = s->private;
-	enum ci_role role;
-	char buf[8];
-	int ret;
-
-	if (copy_from_user(buf, ubuf, min_t(size_t, sizeof(buf) - 1, count)))
-		return -EFAULT;
-
-	for (role = CI_ROLE_HOST; role < CI_ROLE_END; role++)
-		if (ci->roles[role] &&
-		    !strncmp(buf, ci->roles[role]->name,
-			     strlen(ci->roles[role]->name)))
-			break;
-
-	if (role == CI_ROLE_END || role == ci->role)
-		return -EINVAL;
-
-	pm_runtime_get_sync(ci->dev);
-	disable_irq(ci->irq);
-	ci_role_stop(ci);
-	ret = ci_role_start(ci, role);
-	enable_irq(ci->irq);
-	pm_runtime_put_sync(ci->dev);
-
-	return ret ? ret : count;
-}
-
-static int ci_role_open(struct inode *inode, struct file *file)
-{
-	return single_open(file, ci_role_show, inode->i_private);
-}
-
-static const struct file_operations ci_role_fops = {
-	.open		= ci_role_open,
-	.write		= ci_role_write,
-	.read		= seq_read,
-	.llseek		= seq_lseek,
-	.release	= single_release,
-};
-
 static int ci_registers_show(struct seq_file *s, void *unused)
 {
 	struct ci_hdrc *ci = s->private;
@@ -354,7 +300,6 @@ void dbg_create_files(struct ci_hdrc *ci)
 	if (ci_otg_is_fsm_mode(ci))
 		debugfs_create_file("otg", S_IRUGO, dir, ci, &ci_otg_fops);
 
-	debugfs_create_file("role", S_IRUGO | S_IWUSR, dir, ci, &ci_role_fops);
 	debugfs_create_file("registers", S_IRUGO, dir, ci, &ci_registers_fops);
 }
 
-- 
2.34.1

