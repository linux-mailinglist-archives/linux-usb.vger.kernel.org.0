Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 12ED863D028
	for <lists+linux-usb@lfdr.de>; Wed, 30 Nov 2022 09:12:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234419AbiK3IMV (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 30 Nov 2022 03:12:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234415AbiK3IMT (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 30 Nov 2022 03:12:19 -0500
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2058.outbound.protection.outlook.com [40.107.21.58])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A23929CA3
        for <linux-usb@vger.kernel.org>; Wed, 30 Nov 2022 00:12:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IerZKNiROUXAN2WxfmjqAPySsY/qmVPybSt3sZNfvPAHsbMF6sOTEAwDehs4AS/805kBVansn5r+vEV97nAlB1IKkwQQszKTUD0WhYsfK0XCQERFQtu5F4coySlAhJgRJfor3aCSnxCcXer4uh3NOCvmSgifRiYjBsOWDis5CCkeWXrq9CC8SZ2y++VRiG1CjL3cbUOij/iIfZPZNVR4XCsvk/q4YSWUS3fRf2t8qPUmO1uDvQ6h17RVdWYjj4lkenXVpWIeoZ4ZUIVc3liFAAimuW4ktt7I3NUSSdUUFLsyCTpxuXm+FiWPNnp2YI/Y/1P+OBd/HHgiU2eoloGl4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XPUoAnGq+H+wjLVrZ9PfD0JoUGh5ZiwNr0OG9FsdIyA=;
 b=AYF2jYIS9Tk2/yvCppVtdK0Ah8NVREKDj1K+BIknegc1YTsIiSo6ZOMWR/zYNjYt+C6SC7Z4nYYhvc2C/bJxUxEQsyPOeKfjPmufLzB6c0VyYEEcwM4k/YNioROxVVe1OL3qJK0FDBybCRi+r8OfmlF2VmFi5sYzPjkHKvgNUa3QYl0Y0jJDlY5c1YUE5SHow253+/C6vj3O5BFuMd6HUOmTnVua+OKfPnXasbbGpQTUk6/xm/L5gKu4W0vl3Z0ECVCZPX2HXRuv0XUV7kI3wTsgsUD6XzhxrYfaOfaa5elqEiHvvl5i5HXGmIWHd/97UIRJ2FmQeEGiLXjTHpQW4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XPUoAnGq+H+wjLVrZ9PfD0JoUGh5ZiwNr0OG9FsdIyA=;
 b=h+s0Y+CJ7dVcSr1Jnq7x/N8MURM0egQS4f/SBrNenFUf+srR8c87cqYPoa22WlPsUX3kKLkMzg10I7NxGn1yTES9FdAwUEIY8chj7HxqsuoFq9FqduA5ovBjnsSo8c7T7Bi/O9GPSx4hKtgVFeFV+A7aXy9uY6IH6rWcTsZmXcE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9591.eurprd04.prod.outlook.com (2603:10a6:102:270::18)
 by DB8PR04MB6890.eurprd04.prod.outlook.com (2603:10a6:10:117::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.23; Wed, 30 Nov
 2022 08:12:15 +0000
Received: from PA4PR04MB9591.eurprd04.prod.outlook.com
 ([fe80::8184:d5e2:3c61:b493]) by PA4PR04MB9591.eurprd04.prod.outlook.com
 ([fe80::8184:d5e2:3c61:b493%6]) with mapi id 15.20.5857.023; Wed, 30 Nov 2022
 08:12:15 +0000
From:   Xu Yang <xu.yang_2@nxp.com>
To:     peter.chen@kernel.org
Cc:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        linux-imx@nxp.com, jun.li@nxp.com, xu.yang_2@nxp.com
Subject: [PATCH v2 3/3] usb: chipidea: debug: remove redundant 'role' debug file
Date:   Wed, 30 Nov 2022 16:12:31 +0800
Message-Id: <20221130081231.3127369-3-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221130081231.3127369-1-xu.yang_2@nxp.com>
References: <20221130081231.3127369-1-xu.yang_2@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG3P274CA0007.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:be::19)
 To PA4PR04MB9591.eurprd04.prod.outlook.com (2603:10a6:102:270::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9591:EE_|DB8PR04MB6890:EE_
X-MS-Office365-Filtering-Correlation-Id: b8cd1fb1-a493-401e-fca1-08dad2aa977e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jIEX/pRG1K8AnZyNHWVY4gbRHyk075P1cvP0tC2XJo4PMJa91wSKRXOmlCw4kG4akfcoK1JbIp6s9s8sWK9HuVJwMPCSycVb0B6sJ2XVS39GR4xtfucTZdf9nYcExjpIMBA+KNt6zc8UwU+L1np8w7n0rlKFIvcjLa6qmkARg4LChdhS4ikwgkRHKN7qwn+fyy/CMcTa7Px5DSMQxjKfi0cyrW+nkg+KzmQlH58CAjWaZbfMqXkWqLic3v/Px84KjUfyr41B/CU7Ok1MVMmFUpEZV8N/oSgbCkJI79ZZNnZk0qBYOJpayYBYKUSizpFro/I64NSP8fAgMLlJJAYAEe4lzPVFxiqcT9N+nwyJsmo5QZJHXeSNg4YwkRLIshF9w5uTcJ8BMpztUyb10OGbX2FMSL113w+r+htwwvwdbi0bXj3HiJRTxV/IRcmcxzRnBCc0MroSDLGUEuJy3yQxGJlE5QNjRqYx+1ZOp/TCD2I4CC0nPeBsgJmKdU4MxPZkB7/VaJ3Egb5a5atwdqseaI3rO/Bxdj1ICiNtdDQIs63IXASFGZQCmgzW5V5yJ9unCaH0WVIZZLbbVKObrMgQ96iHmwhf+RosFzwvrAML1BTFa5YcSVCRFdhrFsn5MuMTCWPY/Xgr27bjA4vM5euiwr1ZCPk7RetU/Qg7Nu5SDmdCzbmrsTLsc6g16irMtPR+zDHa40sUqT3YJVrriMLKSQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9591.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(376002)(366004)(346002)(396003)(39860400002)(451199015)(2616005)(186003)(1076003)(6486002)(316002)(6916009)(86362001)(36756003)(38100700002)(83380400001)(6666004)(38350700002)(52116002)(6512007)(26005)(6506007)(478600001)(41300700001)(2906002)(8676002)(66556008)(8936002)(5660300002)(66476007)(66946007)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?a4Rndfw1m6ro0g0Xy98VCst/dtVmn5Vil7534BSPaFCNigdU6qrutmggfypU?=
 =?us-ascii?Q?vIzBr0AlRFrKqz+UA7deNcFLiG4oC/S23Dzt0TeFHOx5ZiKn1/+0aBwHr0SU?=
 =?us-ascii?Q?ctfVKNFYo952bYKhJxNW9EsqIBdktT26W8AcHc+1CTOFaPFxyDo77TQAQv1r?=
 =?us-ascii?Q?/hsmnI5KRk0N+pZAJnzAHWNUT07yBxq4Zc3/Hv8wsobhYfM/jz7vppsjLHig?=
 =?us-ascii?Q?Vq46NPd1Rk1EidSkaKzKxiDnQaWx+Xsuf8vC4XF//B1DNT7D0dciDEspHP/j?=
 =?us-ascii?Q?VcT8xujqEYmk2UsBJXgXllB2NRJN8avd3smkb03XeUajFvA7y22EFTrkrXn/?=
 =?us-ascii?Q?DIUYHOFwJSaF0TKzHPKbPdpxVFyH8zQ0ffclsVQy39eKH4n4+0LV9qPLyh/Z?=
 =?us-ascii?Q?sHNUxDDYXfsKKq0RmqMECjXeS0GJjuyRVxLde9ZG0szP280LSgN9JhzBP+xG?=
 =?us-ascii?Q?DLbapN+yXq299vWwNv5ti8Tz4LEjJK47D06Y4SOTmQ8TX5XqQ6foAjHCRaj1?=
 =?us-ascii?Q?pAutuBKCZwVIQ6czvPU6kJmGGkAGQIojDLFPN1J10eKut92I/AS+f6YYFZwZ?=
 =?us-ascii?Q?V54C7Hi7onh5KL03bCFXmFzaMc/5ojPJQVuI+A+14jIPTr+nMipWtYnHUmZM?=
 =?us-ascii?Q?6ivzCzE09vRb7MUPp9jmGu1Dm+SrqwM9bPhuQEh/mvIDPZLUa3uDssdPeL1A?=
 =?us-ascii?Q?Ei1WFAoeppmknBpevOz7HYI644C0TQMDIbNPMGxE0CZYsBre4w92PsTf4AI2?=
 =?us-ascii?Q?kDNR5lIZCUhCYzuGpXzId9v750h5/Xbeeh1n4J0CenJPqieOjxdAA0lO2woz?=
 =?us-ascii?Q?HlduTFb8YvzvxVDfntZDCy2qdnZFSkNK0hTBr2FUZCvQAKCNl9P5SNx9F6og?=
 =?us-ascii?Q?V4E3t+7yuTQLaKLcNH/yHGeNnr0cBEUvaJvpRcbtnIPAPYYmmqN32jkn1g3z?=
 =?us-ascii?Q?E10vyRgDIlnpvngfQ995MFLNlZMiP2l+bzJk7my3ArxuO5HaGfeaLPwvsa5J?=
 =?us-ascii?Q?7PtYxPAAuj6S577bIjvqXAvkViZ093Ne6sBXAhJj9fn7NHK7UFEwOxVfcqs6?=
 =?us-ascii?Q?gYNNxCpcfH9iY3JZPMA3ySmlqZSyzwQPu6iapTBS+emBu+Icazd+c76aVDGN?=
 =?us-ascii?Q?RcKkqPubswPCNCMLQ+8DG3SbfN59NDNvUJ1Z4aDW4pYs7i2JXAHfq7uDfXc3?=
 =?us-ascii?Q?DAZILy8cy2RMYr4b3hUPA7sosT164SeFebJPWG/BWRvsN4kJXbnb4zIYeGtf?=
 =?us-ascii?Q?fH18ckWuDupd97aRgQpYIRIqi2SzkxZcYL4zH70e1lszso80TkO2BCFY3PPf?=
 =?us-ascii?Q?ouCkJb9FVoh2JsqslFx+O2q7v5cpgUDOvbMbyvMnQZJJXsBU8MSL6tIfqBKR?=
 =?us-ascii?Q?d186XUpl/vWZZAnn9POJ/0lnOqBsfleAIbEoy1Nmw4SjjMmT9bPs4PEX9cMG?=
 =?us-ascii?Q?PZ0s2TvYsxCgdEwLaA9N8mNocMlyMqaQPxM/Av+RVq1pcYQdfu5JIEdNBSZU?=
 =?us-ascii?Q?548PePc4pCYfl9IqWw5RK+3qoYQvHzkzMWUulOkVKfwZY/lUE3JSP4VYEj7o?=
 =?us-ascii?Q?0XqojH7/W6lRkuNv/0gq9dB0f1WpVX0T4EA9f9Bd?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b8cd1fb1-a493-401e-fca1-08dad2aa977e
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9591.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2022 08:12:15.6489
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bWRomxYxZtzsE8CTZC6ELRM3PjcaQY+c3Ibyn8mezvAWuieRV8hBGccqATSdvJ2Dy5X1krzKeaQoqswcHjLgQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6890
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
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

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

---
changes since v1:
- no change
---
 drivers/usb/chipidea/debug.c | 55 ------------------------------------
 1 file changed, 55 deletions(-)

diff --git a/drivers/usb/chipidea/debug.c b/drivers/usb/chipidea/debug.c
index faf6b078b6c4..37da83de3cba 100644
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

