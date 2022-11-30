Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0EED163CF93
	for <lists+linux-usb@lfdr.de>; Wed, 30 Nov 2022 08:06:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233683AbiK3HGo (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 30 Nov 2022 02:06:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36286 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233628AbiK3HGl (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 30 Nov 2022 02:06:41 -0500
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2084.outbound.protection.outlook.com [40.107.21.84])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F49358BE6
        for <linux-usb@vger.kernel.org>; Tue, 29 Nov 2022 23:06:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BaZjbQvx2BYoGCBP1ZVu9j2GB6uu9sPV+rLUrIAxHmaSEq6BViqqMtcVYcdEvh+uxZ3n/wdwqZfgmU54/bZKewb54QK1nZOxaH38jYQXGsMxrNoFrXjr1CyUpLF9bD4f/ckpRv3TCfEw2pKThPNBk8b0sSKdf1r1Yzzgvkg9h+C67tm+B+Riamgo+BZ67o32gMNGsLsN6eBAEKV554ai8LHz98MwUn5+XyrvQ5xp7esdtIPVOjl9IZJ4xqlbCAs4FqR6g8jTjOxMaF/i98UNY3Gd8etVEbA0lGmpdfVbgLPbbijEzOAVhc2l9VNPuYZf9NAN+1dam4TpeIxMPR3/GA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nrFC/ZeawTLzjiRX8VpIupW9bUpdYyYzulhyOL0f0yM=;
 b=UaM7Xs/LJviGFrC5SF2FwsECs/+5PepRJ0T0loPvspBOQeRyzIqsQy6vqR7eLbL4UYA+cKqEVQziUlWviCy/qdn3q7tY1XhcP5qmGHA9kSeCBgSkwKndrsW6i2+JwIYw1ZSQNl2wYkq4UZGX84hvRdTEKsdeDnNnEyIISx8YjrxirUaipCcAqZBDpqhcAY38e4VagPA/URnrz5C+jfRcSDc1WBSg3DJufMQyIgZcZNXrASCDPy+/PWoivvHpKqMJIzQeqSzziT+UQwoYBFFsixXAH6GXXeq7rNoYnsdSBH1oPs2vYXGGQCmR7ecjIZjPdMYUk1VRYxKmI8RUENqZww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nrFC/ZeawTLzjiRX8VpIupW9bUpdYyYzulhyOL0f0yM=;
 b=Nd8W/AgsmTN7gK1KJ2SRn3bCLQxnwelSo2X7yqEybJBSE7obYLW2it5yKhGS7Zd8qCD0mwz4rgnEy3pT/Ex9h7S2E4rEQNTc1HxpfSb9n7cEcr5IPmsNsTLlKQxaRo2FaFwEg5qLmxcZZLyufxErdlDU8IXSV8RCB5Mj2lP4p20=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9591.eurprd04.prod.outlook.com (2603:10a6:102:270::18)
 by PR3PR04MB7227.eurprd04.prod.outlook.com (2603:10a6:102:82::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.23; Wed, 30 Nov
 2022 07:06:37 +0000
Received: from PA4PR04MB9591.eurprd04.prod.outlook.com
 ([fe80::8184:d5e2:3c61:b493]) by PA4PR04MB9591.eurprd04.prod.outlook.com
 ([fe80::8184:d5e2:3c61:b493%6]) with mapi id 15.20.5857.023; Wed, 30 Nov 2022
 07:06:37 +0000
From:   Xu Yang <xu.yang_2@nxp.com>
To:     peter.chen@kernel.org
Cc:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        linux-imx@nxp.com, jun.li@nxp.com, xu.yang_2@nxp.com
Subject: [PATCH 3/3] usb: chipidea: debug: remove redundant 'role' debug file
Date:   Wed, 30 Nov 2022 15:06:57 +0800
Message-Id: <20221130070657.2447756-1-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0017.apcprd02.prod.outlook.com
 (2603:1096:4:194::17) To PA4PR04MB9591.eurprd04.prod.outlook.com
 (2603:10a6:102:270::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9591:EE_|PR3PR04MB7227:EE_
X-MS-Office365-Filtering-Correlation-Id: c78bd6ba-0ced-46b5-af6b-08dad2a16c5e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 62Tq1/C3W0IUxUDbtDfEGs3axodDR2O6nNjuarqaQfLUQKb74t1p4sPGTvFTDUCtTOt38Ja4e+8v/acqd6lvZYKuK1m3dfZfJqzliYYa59E8lBm9s2dmsXK5wel4On1az13giv1wGPOqACvyuJZPKu5xLWfz0qV+KxmItpwMpWdOEbM9Fh8WAaUK5sKjbVXZ3b/ufLU86qtyZGrpgHbwEC/EAVj1r+k15wfuaI8APYyLcPZHwOLBHJiCHzKxN86nq8V8AEX2oVM81KQ/GPwUt2Unu/QryT5rG2cCfgnh4MsI3KfHXK4ZVYkBJb3g0YJ29/CTfbwvleTp4P0aAwqRvyKbN5EhToiYdVfiYO63Wz14cldjulH7YewbZz1VtAFGeYA+0qWVydJotdCBOSmfC27yXlS0eJPjGbhAtKjOhDcVB1BZCzw4wbc55PbY7QFLbsjgRtPJUFoXJ5THFqep9XMHbO1T+JjPe90FtDQMg0IaayzJMbcbXbgd94/NG37CJDzhIHALtG3qp/E9Kpw8ah0oWS6sikDRmQX+UwVdbJvDfIVEHX5G8W30jCf8/pzxtYxGI94b+PAcXIJCur9LVwKOhyc6yGbnq3KeferzR9PkbVrZVuiOvdY4iFQVshHcYSIVaA+6srJf9DJNB/dWOiKvAKqZf0qIDJMknnq4wueJw91bszte0TBZcMtefXlIV7Ig1B3Srok8588a8+EQEw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9591.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(136003)(376002)(396003)(346002)(366004)(451199015)(2906002)(6506007)(66476007)(41300700001)(6916009)(4326008)(66556008)(36756003)(186003)(316002)(8676002)(8936002)(5660300002)(86362001)(478600001)(26005)(6512007)(2616005)(6486002)(38350700002)(1076003)(6666004)(66946007)(52116002)(38100700002)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?CmcYS90sGZiYPjbxWaGwsEBnL3c021GYbd+iZ00r4zaQUtdHA8ihT5WPUCJh?=
 =?us-ascii?Q?59XvmMbwtp17XpXkxmZ3jbnCR4cIYAQh8NdDObcyO8T63nXLZMqmmwJm8Npa?=
 =?us-ascii?Q?MZ4iRVNf/RkAlvVf9/O0XVbOepJT8Ls58RMs7qmexGj2fg6aaNNMWEP4i/Il?=
 =?us-ascii?Q?vdnEYK83zxQEZmqSgX+foOYVDDRqmo0Cqi9RsoOlGh/mTOhYdRMsNkkKIn8V?=
 =?us-ascii?Q?FU9fVSG4OwvWjUnCPSzmVqeBXhwGlXX1IB7lV945Wyp5mxKbCe1/BlCLJP9U?=
 =?us-ascii?Q?jbsQAYCX0x3ZUbht3D9NNVyrEcH1d7cMum9lXBPwzNsoFXOqbkqthK4dFYZB?=
 =?us-ascii?Q?5xn/SReQK1zB58oRJ/bGWySS2AUEedP1Nqxj4gFu9kL0OjUWDUatEZnm3qWw?=
 =?us-ascii?Q?Rb1/00dLyy9f7hP5BkhnaFQXGrooSbNt/lCF5ZM4wMcYS1y4GlOCHMAqjrUf?=
 =?us-ascii?Q?D2VUOWzOXOz15SY7woC4H0r5E0XjB82ft0ip1jZ6qZMYibuTWa1PDq/PRgaf?=
 =?us-ascii?Q?Z4WxAE3R7WIl5KgruzNoLczHGQP4Zye89XEm4yqVuta8XcyCCLe/i72qWUZN?=
 =?us-ascii?Q?qZ3QEDMt2+o051pKUmqiLJ8Z5LjkharDNItbaJwrswIU87+zmUq78oOb9HQe?=
 =?us-ascii?Q?rl1fsdNkfKpnR9pSRyp0dHh3qJWP1uRrXIvk2ObHCcgn96yeaNF/MVA9NDSC?=
 =?us-ascii?Q?wxcep312OnTKkDxvMhU+nqIMT40DC3oZnoC24ToAL+ZmDjgwDe+9JurPU7p4?=
 =?us-ascii?Q?6h44TkX33axs+tgyc1t9qcuY3QSrxbp84FZil5XJ0ZkH0fDA0Wo4WPviPJhg?=
 =?us-ascii?Q?4OVEGT8+eRfz1HSpvg/74sLRKtTvsQft18vDWTd1+vJyZXFm0465KT3MFF3u?=
 =?us-ascii?Q?sSayjsMywftw1f7IB7wtBdfMecBROHqLBBqyHoMu376xwyFaJDX1HTOfw52z?=
 =?us-ascii?Q?Yrf08NiR6yuUlpl6LrrHc50n/r7uBVrjBEZDlY09ehRkVMS+FkFwEUPKKF+m?=
 =?us-ascii?Q?DXV12O/UxMtUcxwpwaAHckQnWaLbXGNIafMd3Q8LDLcRjqpB2dzwXS4msv4t?=
 =?us-ascii?Q?D7c5mQDNY5GsJA83qNE2fDi6GHFbpWlkUjvHPO9Wludp9aWsNaPzgX9hXUdo?=
 =?us-ascii?Q?oZksvUzObT9zP+YsKd6/ahtNkoKFyzCGUQg2Fx5v+MBwlwPoo35I4E37vwAF?=
 =?us-ascii?Q?irf7miVmyNinSKJm2/ZNkJnlQJPHfcJEUQAj1UdK9VAxQqKBoJSiug6RLEGu?=
 =?us-ascii?Q?/H4P0dygPlZd40zr3jshrSrXVccXPDgiegXP9hhJixnFGfjk7D4hgcIIpj9W?=
 =?us-ascii?Q?vCLZzA9xkOvHKLnQz0qUfHvb/4YmYrr6Ja/W7+jjk1vUj5uSIEwbwtoOLVYo?=
 =?us-ascii?Q?NUQkIrkPy0dXn7isyrDn4MP0mgrIevKaESH5ZfFo18an99/O+yvNBVRrydIY?=
 =?us-ascii?Q?ps22QXUkV7c1q5qYfH0241T0k9T0OUFptoJGDahr5FaFu+R70+0Kb1eNfDl1?=
 =?us-ascii?Q?rLohymbAEYSGYpb67Dv4+p28jgrKd5ugKN7vviT8nxrAHhOwowxp2jetreu1?=
 =?us-ascii?Q?kjpka8uwRFuNSKOxcS6wgW9AzppzAfIb79WvDAzr?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c78bd6ba-0ced-46b5-af6b-08dad2a16c5e
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9591.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2022 07:06:37.8558
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NxefVX4yeD/gnvrsrQS+7cbJph93fidsL8ssEJ9Iz20/eI1GA7A7Bks/APRQbhKDZR7WmUivVxIVVgIZGYdLIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7227
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

