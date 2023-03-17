Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C53956BE0D7
	for <lists+linux-usb@lfdr.de>; Fri, 17 Mar 2023 06:55:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229800AbjCQFzD (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 17 Mar 2023 01:55:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229477AbjCQFzC (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 17 Mar 2023 01:55:02 -0400
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-vi1eur04on2051.outbound.protection.outlook.com [40.107.8.51])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13D963D0B3
        for <linux-usb@vger.kernel.org>; Thu, 16 Mar 2023 22:55:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Sr5o3c3kXLVj9hJaOLU5cjes+Mjf90ZIio4I6mmN/TGwNB0SWNazuW653EtDI35vcNckbWUGiiV1kirxVUYweodrpv+BTmF5M1Y2T1gdmVMAmGfukerApmAJSME+svZ4f53/+JypOP5lUxscdOBnw8vG0vKcpxZxq2Bso2rSnf8/oCj70MH9iw4kL/+jL8Gl+XcQV2EU0pzMyPPVLJYKRKewCq4+mwdQhRRZvwXJc+3d6zh4ARuaIV60ymXrNNbVkUW++s+LjKBg82Xr/4w+FIw8SrOPR02/QVFwJTaSDPfy3DQq+kfi4DxmzpNT1RnI2etLyrCHe8RQmZlElBP4lA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S5U/g378GW4NIh4Mk0KEbz5n29iJLWW7L9EJJ/H+zNw=;
 b=DsCWwfl3/Lyz9S6mWjZydy050rXOGSzAWcYuxQgop6XrEjRfTgK4AXi1aOYYgpFyqY5eEW962+ZVe7y2H3r2uTUM0vbhqxA5yuKXF2Ztw3rmSHS4j01gXX2Gn9/lMkJBAccey0UhNK040pHzYDGO7y3mCqUxqw1YUxnohnix9C51Ys1GnOowi1QeMNOK+o18NlhNlBJ6BpX+gd7In+yD0zX7aGj2inZW6eile+iVovdePVrjxi4R9LkZ9p5hJah/8qb0t3qaS9uDcaYorIBCU0Er82qe/JJ2dzEIG8nWhZN+9JhBBiWdxaBHmDuGNSdolu6UUrEo1Dcwrxc1d6OeIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S5U/g378GW4NIh4Mk0KEbz5n29iJLWW7L9EJJ/H+zNw=;
 b=LT17Xx4qLCJggM0jicBer0fXcKWN5ZS1/ot2IuAT/r0bMsSkglxf6znEMBLveOUcVD8R0EgapXphZVJiStftCemaXE3WGiPu1/3cJs55Ot8GOxnzDsminJcTGWMQSy6tzmCTzQr77E5lRYVKMGYVAe19fW9BWskDO6i42bEWSZQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB7PR04MB4505.eurprd04.prod.outlook.com (2603:10a6:5:39::26) by
 VI1PR04MB7088.eurprd04.prod.outlook.com (2603:10a6:800:11d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.35; Fri, 17 Mar
 2023 05:54:58 +0000
Received: from DB7PR04MB4505.eurprd04.prod.outlook.com
 ([fe80::5466:bfa2:3158:97c6]) by DB7PR04MB4505.eurprd04.prod.outlook.com
 ([fe80::5466:bfa2:3158:97c6%3]) with mapi id 15.20.6178.035; Fri, 17 Mar 2023
 05:54:58 +0000
From:   Xu Yang <xu.yang_2@nxp.com>
To:     peter.chen@kernel.org
Cc:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        linux-imx@nxp.com, jun.li@nxp.com, xu.yang_2@nxp.com
Subject: [PATCH RESEND v2] usb: chipidea: debug: remove redundant 'role' debug file
Date:   Fri, 17 Mar 2023 13:57:01 +0800
Message-Id: <20230317055701.2385115-1-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0072.apcprd02.prod.outlook.com
 (2603:1096:4:54::36) To DB7PR04MB4505.eurprd04.prod.outlook.com
 (2603:10a6:5:39::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB7PR04MB4505:EE_|VI1PR04MB7088:EE_
X-MS-Office365-Filtering-Correlation-Id: 032551ef-95c9-47a8-bb8f-08db26ac23d9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Un9EiMWDsVZaBpJEz1DC2BAsMS6Q8FCV8rsr/fAo9mVy8YYH49s9YFP1ZIdWh7cVjz4iH2IJ3ofD4s7JsrXgUIFqs4YYAKAElgFdCGzlWuK4q9Xyff5XdBWXwuOizeeRWM7QZbjxckUASrrqAoMq3c9ySUyF3665VoM7yAbQx1GDgevkRTb7oStl1Oryvedbg4hAAWG2f6xsQr32dvFTqFQHxcNRPVdwyAXYhDRI6Gn7OeQ0/+Vks03axORQQpsjQCF4Clos594cAv5/nmmNqB3VsUyRjJruROSsoGc+5qSyxaxlj3JNsLcVZiNSJLgYkCzTQQKzF5xyp5Uyql6r2bQrfknqb9ltZKbaEu9CMYzBIlEWyBKSsnFGRygAygGktIEcLNQ5dU4uwTLlZL2/hfZsn17jf5iAv89tk952R4r1Gyp4SH03zZESUXW9WqiRAtFZQ/OmUFPM8lM0INohs74yk7q66i7KF2urqqneEBvHtnVK9kwpit0/lHLZzsVOsb2A9CyJ0aXEueQQGGMYZNWbK/VRE/2xxXIarUq9QAYotGb7iGPdk06QiHUYVA4+MwLAJm9c2lHrF0G+HMzpLvJjUs6beV3ZDXVtfgqAZ4dBc3sQFdj3lwuptdAjbzz0/Nfrx9ZhEe4QDjlhqcyW+uuXYV8cjF133/T3wC4v9kcXxetqtWt3A4sTVxggjazOWAxXCoUXL60KrBQQndkobg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR04MB4505.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(136003)(366004)(376002)(346002)(39860400002)(396003)(451199018)(8936002)(6486002)(52116002)(66946007)(8676002)(66476007)(6666004)(66556008)(4326008)(6916009)(186003)(41300700001)(1076003)(6506007)(6512007)(2616005)(36756003)(26005)(2906002)(86362001)(478600001)(316002)(38100700002)(38350700002)(5660300002)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?yj10lzwtJ5ZE2+y3Ky+xKAyTaCbiaiFW8oivbWhnmutCaMC3Rdu87dXu7yWZ?=
 =?us-ascii?Q?zFaCzvg2/FzeBtR0PJam4DVXFL69IG5cUk2QZmNu+9RApJTWLOBLEEVd1l74?=
 =?us-ascii?Q?BiuN9KJ77v0SHWGQNLXyo8wknpRi+DKSgG8kd/FuxIisbp9ul7wG7eiKnBWL?=
 =?us-ascii?Q?Ah0LGiWPVkTBeO/08hRd87cN6e9Spg9sOKILrJ6sQcFCN6wVgfGNQYK31nH4?=
 =?us-ascii?Q?8Nt2UCaVuBwuSPCSpyaPa+nTXmwqY2e7ZrIf9HGUCdAixWLogOy7ppUynSd8?=
 =?us-ascii?Q?9CIOdSTPD4fHOIwcZQnqqaIg2/qP0QhujGIAbVN3Gr4Wh6v6Gsr0Y7z6+T5S?=
 =?us-ascii?Q?+xxd4m2o/gdoJWqJnar3h2jCxKXHXqb66yRCC+Eq3xzftFcHOvlolNBbrYue?=
 =?us-ascii?Q?Kn6p4S5PIFP1+jEZfePvBE/uOg6PAHl5cmsHlQLQxyjxCRh2xrsvlaW6/Fur?=
 =?us-ascii?Q?ss9iJCKLO9WElt50R0HgZPNrV8dF4C3kYuk9aE/ukOqptC8Us3/IcXqWCYnK?=
 =?us-ascii?Q?4R29HPXLS7cYuI+NuJSxXEmhAFx8YFKyu0wnetN2EhUPuDs2ddLJgLyQTq2M?=
 =?us-ascii?Q?JU43Qi8aMUaRJyjHKHy+oGQmB04ov6mBjp2GvGGei+noAixn6MKXIKrhstoC?=
 =?us-ascii?Q?Zj2Mi7VHS8NhVo1RxM0k122tWTVS4VyEysUQl182NAtTjPP3HBY7EEF02gX8?=
 =?us-ascii?Q?RF9/JRdkxVq7qiyBJ/AGzfGT6HxPbckA9M+safuMDpY3pt8McZxR59BSAOwT?=
 =?us-ascii?Q?T/Ql96XNPYdvDZwBiJOy74WHsFDQCTSPh9hxROj1YJKpo48mm3yvVFJPIc1D?=
 =?us-ascii?Q?Ru3D+Ye6gYpULWCHeRw3udfic47+FSIxlQgZKSnmX08kRLLivZVYF88YuNa2?=
 =?us-ascii?Q?wWxaT1mMBW21q5vQU+6NxHBKO2QuP8NQMnhxoNfKjWNkspjQiLO1zfd70pdA?=
 =?us-ascii?Q?jWGH8ywnfQQigLtMkRq5+Z+NlMrJWT4P3UDukdI2mCo45HtAJPoC5v2Ldyae?=
 =?us-ascii?Q?7IkS9IQM+f5UXrLWEWDAQB06CAwKoexNpVEafZTMqdQk2rLf1xEykxpGcOd6?=
 =?us-ascii?Q?hvQs76Z4SqNBo+mpA6JkzzbkW6FbaPssdTuNS35gn8WsFzV5AAn6o/giYjz/?=
 =?us-ascii?Q?6C6zX1TtQlOMfPWAcHYvsbwOCtNUMZX+JzZX3nDgCD5UqG9rruevLbsGmhHT?=
 =?us-ascii?Q?xBiWMQAifUuiKx5EdljgE+cml8Pom5BAxs0Uay5ti5qvSNjml/CJ4FUaVUXR?=
 =?us-ascii?Q?wejpTKmpqvY03YyNiBqlDs/RSz0J8CNd6Uf7GMH1bYPqmfQH7LPqt4oiHLa2?=
 =?us-ascii?Q?fzpQYDYYwV/MjgFwFDt7tv8WBvoY9fD2Ttpv3d6BWsSfaknRAxflBHAZjpSq?=
 =?us-ascii?Q?hlmE+YhHwQ8g9OhRji/DIz0EY5pzKUiT3jGhj7p9wwF2VJILgMFhO/9kFhq4?=
 =?us-ascii?Q?fl70x6Wk/IotP5NCbL7IC0wVBhvhzRjJTo73D0ALi2pzTfB7QwUHwuMoFTx6?=
 =?us-ascii?Q?a/je5EnuhYx6OtILpUf2VA1x6JthEMFrUBitC1lTXtlpA0LZTLqOArFcPwFd?=
 =?us-ascii?Q?JeXBTQoHFxP+umVswxYTJVzb0GL4LIuVlWZUwCWG?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 032551ef-95c9-47a8-bb8f-08db26ac23d9
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB4505.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2023 05:54:58.3727
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zuxKiLewiCt330OYVzuSF5JZhLlGXxEYtAev9mJXgFBzeV604Y31DLFg/TquhDiGYq5GK0bSEymAO0BcN0/6Iw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7088
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

