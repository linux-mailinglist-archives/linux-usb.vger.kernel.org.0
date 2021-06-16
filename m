Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8FD873A8EF1
	for <lists+linux-usb@lfdr.de>; Wed, 16 Jun 2021 04:43:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231960AbhFPCp2 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 15 Jun 2021 22:45:28 -0400
Received: from mail-am6eur05on2081.outbound.protection.outlook.com ([40.107.22.81]:27008
        "EHLO EUR05-AM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231494AbhFPCp1 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 15 Jun 2021 22:45:27 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cnOtJXAge/XwapCW03hYK6x2pjLEXIpHUoeZVq2/Yn+BIv292lLpxGRgGCYmBkRgibmgsdLGQjo950korzAoBbaHyqleiNdZlj1fKrEZRyWuN8l1hNXJXO8N7tB0Yk6tkMVd/bVyT4vfUgN5MFZaT7DgTgcb1Tyw9RUGVYfCUqdoNamDQxqIsLnC7/ex2MicFCHS4UH0x6xVnR8be92ok4sK7mHlDvkj1r9ZlLrQ8trEnqmmzQxYgS7wFcNqkjpEFnn2Vx7cTM8zFbavxWnk1ZWH0fQbdqWmrhAAenk2riQchmPwNKMSdn++ttX30Vj/KpMyiKzkCPLGDvXmayYAbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xPeocXvFRWPrgKpzWak8Y99eE6OcuRf99Pz+tC4tTwE=;
 b=nzRV+PPsczi9w8cLnDPHJwuMkjsXQw61jF8Gjm/5jD9xnHxUqIm5+sCJ9HyuocQufEbrfzT1tD2vzQvfSvauRkGpCtdJryUWmWWIY8wxfbY79SSlFWhVAEMjBT+7gmdBQDGevlcQsEzyPk6qPiBtrChd7l5i/30lKstYBHTBmkBSYPZ0313cad+ea6rgY7zXnCJfyzjKm6k2Fd/I5p7v7I0XedBsyppUac1ph2fwbPRwsvGrJyryFEtMeUwTdCJZaI/bkmhwFauNkUkAlPG9rEISulIoQQiASj7jR4lmr/SspmEUVnw4mdKWTjasT/coLWelZzJT+sI9U7bs0PZaCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xPeocXvFRWPrgKpzWak8Y99eE6OcuRf99Pz+tC4tTwE=;
 b=Pju57XpZZiaKJYBnsqJhtZUWD33ydvXbZR8BhKxm7W5fj7X8lWR9B/MGNmJiONcly+iWERNC43rTnxb5KzY8DyWXAfjJwKZv3zQDQrbIN4y0/9hzFa0MT44+MeQ+s+ll/XGO/zRTcUKoZAk9YcGxEqUQCcmcUebyVd6mIPSFY8c=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB5935.eurprd04.prod.outlook.com (2603:10a6:803:e9::17)
 by VI1PR04MB5630.eurprd04.prod.outlook.com (2603:10a6:803:e6::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.24; Wed, 16 Jun
 2021 02:43:20 +0000
Received: from VI1PR04MB5935.eurprd04.prod.outlook.com
 ([fe80::79b2:6f7:b5ef:ed81]) by VI1PR04MB5935.eurprd04.prod.outlook.com
 ([fe80::79b2:6f7:b5ef:ed81%5]) with mapi id 15.20.4219.025; Wed, 16 Jun 2021
 02:43:20 +0000
From:   Li Jun <jun.li@nxp.com>
To:     peter.chen@kernel.org
Cc:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        linux-imx@nxp.com, zhipeng.wang_1@nxp.com
Subject: [PATCH] usb: chipidea: host: fix port index underflow and UBSAN complains
Date:   Wed, 16 Jun 2021 10:24:58 +0800
Message-Id: <1623810298-32001-1-git-send-email-jun.li@nxp.com>
X-Mailer: git-send-email 2.7.4
Content-Type: text/plain
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SG2PR04CA0132.apcprd04.prod.outlook.com
 (2603:1096:3:16::16) To VI1PR04MB5935.eurprd04.prod.outlook.com
 (2603:10a6:803:e9::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by SG2PR04CA0132.apcprd04.prod.outlook.com (2603:1096:3:16::16) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.4242.16 via Frontend Transport; Wed, 16 Jun 2021 02:43:18 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 87accff8-169e-45c0-30b4-08d9307080cf
X-MS-TrafficTypeDiagnostic: VI1PR04MB5630:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB56302F593CD8237700C92CF4890F9@VI1PR04MB5630.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:226;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /thigFj9QR60pFL/zG+KU59qZUVxUahLcTfila0rrr5m/Lb0ONgwMMFi+rSqzRD0IbrT4sGPQi9O2DCUe4W2EGOEfs+ShFRRyBfxS6ZM1WmKtUch+caYBrLTXDh8T3f2aEBu3AhjTaXX7dNDT/mdBnKLl5bUix/uD8X1Eq2mU15Bkv284QrG7ZplzrsScGnJTLeLQU/GPBVCZ2n9Ci0Z68wMi+C0DJ/04E3D2YtSNxKSu5G7rx6fS9FrNIRrk66QwVDdtZI0yts7/WbIpY/2UfHDhlXWSCNbkVJzYBg7dFlJw3oBsK8tZksXpLC17xEvEWcki3SOcoj0JBFYKEwZP/axgDwW8JkWXSOWDW2mwBftAUipt4wm6j1zG8l4CGmOYpEjJbZj7p4iJTpsDuWKqqeGQRq027sViOpoPele5JxMFHu6WgRHOWU18z0Np1gbb0pl9OQZpDeHYVxz7/1CZ/m5ARSmL3aY7rYm1835GC75OtKPixD6MeCS4XVIoGdHFozB26HSWelYgL8FxAOpH0bGOIBGhbGKvNsQSPXyIVIDGm8Ahs2mM/4Ft5z9wHaNYXRtPtCiGiJS/Tv0fMGpNZD7v+u9gyTS8tUnmtC5Jacne+sk0jT/dTf9lqRMqVVpcM+FnfNDyrF4kUrv2pjx0LkjdZOZbPHTx33VOhl66kYyQvxcT0ysjj7dqQnIbaYW
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5935.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(346002)(376002)(366004)(396003)(136003)(4326008)(38350700002)(16526019)(478600001)(956004)(2616005)(8936002)(2906002)(186003)(6916009)(5660300002)(6506007)(86362001)(52116002)(8676002)(316002)(26005)(6666004)(36756003)(6512007)(6486002)(66946007)(38100700002)(66476007)(83380400001)(66556008)(69590400013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4R8eBztoduIPTwO7P2xZn3dY+vo+R+NOqhkzNrjKV+JJm873ge29V6GQDzGc?=
 =?us-ascii?Q?1iMC3M1U1OV0u2GhNapJru/LtLEkOVifiHgXg304s6kY6KvB+Oel6o5URvci?=
 =?us-ascii?Q?PhZSfieLKZtljy+MWyPdVO84cSQFQ6ar22n+laxOw0KztfI3m5gQZZj3+xub?=
 =?us-ascii?Q?eq8+8NkczarLSQEB2FMnxJjI4l+uvikObepwhBPRLsTECue/apj0KPH9YPev?=
 =?us-ascii?Q?SsOhEq2NkHkvurLj+1M5tXK1NGdoKE0ak+KoYP94dkbPmKR+XqNOpu6O33YD?=
 =?us-ascii?Q?RirkyaPK9t4pCguGsfUyf6mTJG3GHghqAUGBizSkwrKP+v0P3vCBFehWcFuK?=
 =?us-ascii?Q?NVdaM6l5H9b7sTtWNmEhlF0N019KgdVNcJiFwHLPraype8Eg8EVcH+QjDXtG?=
 =?us-ascii?Q?yIYq337eknPn3izj2ISkdGodSQ3aCGRBYO+sRtlhQdJTC/o90Fv/y09IXbJH?=
 =?us-ascii?Q?kGTGzgV4WsnxkgPcJuVD/6R3D4UqrlMOicYdTOxhew+qZ7x+u0xPmTKBojzW?=
 =?us-ascii?Q?j0AX6I5UF0TA9FTLN4jWNrbGDyeHqyqcvsgZvgykoznpzUAJlqHrYRosISBc?=
 =?us-ascii?Q?dcnI/RLn30Rm/1ouG5GfUHAUQJXHBQmWWzCFW3WDreeILpbDLywlH7j9X9Un?=
 =?us-ascii?Q?Ylhf0CJ2LU+5Q4pTAM/Rp2fvPnZ4zDU0lxu7s3pFRdyHngWXRvxAvtigEESZ?=
 =?us-ascii?Q?K3O+Y0zl+ZWMZcclWRzBdxCO2sr5WrhdAer7itlXjRbwa592TNw3/uEMXvjz?=
 =?us-ascii?Q?oKTZutjCzTGvt8A9SSEkl+rq1763GmI02CFSqVxsLX4RMyPQKoHcpiX+cuBh?=
 =?us-ascii?Q?MHy6YAEAbMf8csCwXspEl+8fff8m37Iz7hjqcQ41KfOvmYG5u6I3s/FhVw4K?=
 =?us-ascii?Q?yta0vA0Up2cYwsMB9L7cxPiTh1+KsYG+PqNb5v5CxBwYDi7nE77IbxSIsGOm?=
 =?us-ascii?Q?a4hNHRwFeKHL/UHHHsIUZJqOEltAcTu7TdbpA4/kotLeTwWOAE6w5kL/ZrLZ?=
 =?us-ascii?Q?eLp6yBxz+ns0trFVGYIMXII0OK/Ruwx+4C0MuvL96xAUMeQeTB5BypkWUlIJ?=
 =?us-ascii?Q?jFPVF5YhbdmkSRNyeEd3cFwg6tc5IIMjkd95J4gZPZnqzmkdtw//oWqS/Q4e?=
 =?us-ascii?Q?rFcjJb7emwZuoPEb2M1nAAqXFQ129TG24lfdZ7yeO1m6i7KFWz+mmGi/ImJl?=
 =?us-ascii?Q?vlRltnbjSk4N1U4deopdx+a8vKdeyjTQpuxtu9vBE43ug7YD+iX5os2Yt3OM?=
 =?us-ascii?Q?+C8q4px8tIMp4RSdCwvDxhY2eW5yDeCC/x18zWGJ6XjfecD6rhn2UwZbfapy?=
 =?us-ascii?Q?nswvp/oHEivssfeq/DBmNJ/+?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 87accff8-169e-45c0-30b4-08d9307080cf
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5935.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2021 02:43:20.7207
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MpqaflM/+efHj1Ny+8if9kLdVk4rnX21v0/TfoTgkGYhqIYRTu/RGiTqzXsR6vW3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5630
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

If wIndex is 0 (and it often is), these calculations underflow and
UBSAN complains, here resolve this by not decrementing the index when
it is equal to 0, this copies the solution from commit 85e3990bea49
("USB: EHCI: avoid undefined pointer arithmetic and placate UBSAN")

Reported-by: zhipeng.wang <zhipeng.wang_1@nxp.com>
Signed-off-by: Li Jun <jun.li@nxp.com>
---
 drivers/usb/chipidea/host.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/chipidea/host.c b/drivers/usb/chipidea/host.c
index e86d13c04bdb..25327b1b49b7 100644
--- a/drivers/usb/chipidea/host.c
+++ b/drivers/usb/chipidea/host.c
@@ -241,14 +241,16 @@ static int ci_ehci_hub_control(
 {
 	struct ehci_hcd	*ehci = hcd_to_ehci(hcd);
 	u32 __iomem	*status_reg;
-	u32		temp;
+	u32		temp, port_index;
 	unsigned long	flags;
 	int		retval = 0;
 	bool		done = false;
 	struct device *dev = hcd->self.controller;
 	struct ci_hdrc *ci = dev_get_drvdata(dev);
 
-	status_reg = &ehci->regs->port_status[(wIndex & 0xff) - 1];
+	port_index = wIndex & 0xff;
+	port_index -= (port_index > 0);
+	status_reg = &ehci->regs->port_status[port_index];
 
 	spin_lock_irqsave(&ehci->lock, flags);
 
@@ -288,7 +290,7 @@ static int ci_ehci_hub_control(
 			ehci_writel(ehci, temp, status_reg);
 		}
 
-		set_bit((wIndex & 0xff) - 1, &ehci->suspended_ports);
+		set_bit(port_index, &ehci->suspended_ports);
 		goto done;
 	}
 
-- 
2.25.1

