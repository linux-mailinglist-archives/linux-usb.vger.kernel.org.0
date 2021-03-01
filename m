Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1457B327676
	for <lists+linux-usb@lfdr.de>; Mon,  1 Mar 2021 04:49:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232126AbhCADtD (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 28 Feb 2021 22:49:03 -0500
Received: from mail-dm6nam11on2057.outbound.protection.outlook.com ([40.107.223.57]:26593
        "EHLO NAM11-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232124AbhCADtB (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sun, 28 Feb 2021 22:49:01 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ex/tcPNr11knmZ8Xgfb/+U9Xtt/+MTowxQNrAAL8Ha42j+gxPmoMHaLx79a3MFy91ferwyTtrRiF0dzR6wvAYGDJRzqf0KD1tT07ML4dXarSPsCp7hBAK7MLamHiEqITufOf/5xekOJxJGFRfnfZHjICbNu8mEhyQK7PQHncDEbABjMlg7TTr8yQ/3perEgGq9j+QIzuEHTx0s2KkW1rjHoVjDMgAcqkdMNB0FTq+fayqlCuuEwG7D22PKIP0HpJcXq/kRIt5wCo/CaAvqk9wbv/GJcIrhQzCRhmtRQUa8GbJ8nniHbNS3rYGhtNUz/gP3UaT7jlJIkpegS62yJBvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SzPK9vqRRE+ZFNkPM1mQ89DIBsAM7DyT3FfG1uJPEwk=;
 b=TimkHvApHpbQBeb/qu4MbaJOaBhBc5s5uO/HO0B4kGS0kHggm4yAvshg2iRgW652mBs0pUrdoJiA+ldYwp8z2C5aAPGW71xCJ6SKT9Xrry3DIecQJJ40uyCE55f/DUmoGW0boSwpHMrDq4f8e1G2i92hTEpm5vqDX8HESJdxmzirjruCdJ86PjpD1lI0PYorXGRgBbmj4Sh34o5jmSQUn3qKNz4J4WD//hfyJg6B8B0M02S31tpMqwpvoQiEKV2Hi7cmHFAMyK/9e7t/zGqMeKBIMkKUgyWJq5gHOgR8c5TsNoUcZ5J8U+otEu7GvmbgdK6qXVjK6yv2nv5wp91XNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SzPK9vqRRE+ZFNkPM1mQ89DIBsAM7DyT3FfG1uJPEwk=;
 b=hCD7PC+/x2shFUPB363ibr4I/11bUx5RNYUjrEhLZ6fLKAxyUEFR63jaQhnV+xY2zZGOpu/GFgVfZNLbpU/w53MLXAgB929NMTCRI/rVpO7a/OyGAcdzJYSskvfd14qygKc0PaDUwt3K8dTp/AgEZjsgtl/LFpn+dDP2S7TBO9g=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=windriver.com;
Received: from BYAPR11MB2632.namprd11.prod.outlook.com (2603:10b6:a02:c4::17)
 by SJ0PR11MB4976.namprd11.prod.outlook.com (2603:10b6:a03:2d7::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.31; Mon, 1 Mar
 2021 03:48:14 +0000
Received: from BYAPR11MB2632.namprd11.prod.outlook.com
 ([fe80::89a3:42c3:6509:4acd]) by BYAPR11MB2632.namprd11.prod.outlook.com
 ([fe80::89a3:42c3:6509:4acd%4]) with mapi id 15.20.3890.028; Mon, 1 Mar 2021
 03:48:13 +0000
From:   qiang.zhang@windriver.com
To:     zaitcev@redhat.com, gregkh@linuxfoundation.org
Cc:     linux-usb@vger.kernel.org
Subject: [PATCH] USB: usblp: Add device status detection in usblp_poll()
Date:   Mon,  1 Mar 2021 12:03:00 +0800
Message-Id: <20210301040300.20834-1-qiang.zhang@windriver.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK2PR06CA0021.apcprd06.prod.outlook.com
 (2603:1096:202:2e::33) To BYAPR11MB2632.namprd11.prod.outlook.com
 (2603:10b6:a02:c4::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-lpg-core1-vm1.wrs.com (60.247.85.82) by HK2PR06CA0021.apcprd06.prod.outlook.com (2603:1096:202:2e::33) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.19 via Frontend Transport; Mon, 1 Mar 2021 03:48:12 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 76177652-aa71-4292-b382-08d8dc64d6d9
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4976:
X-Microsoft-Antispam-PRVS: <SJ0PR11MB49765CD1EADED157E9836C8FFF9A9@SJ0PR11MB4976.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nphnxmM7s74wpPGKksSaubTQD+iMyRR8FKX+69sMy4JhPd4pjBG4yboDZMFlA5xl3/yigg/PoTDb2R48iuFul+fHk+v2s26fUdf3KV0z39N38XNBLaXs7LLMT2Z+GTiQrfArkhy3e/u3xPVfts5uklWR/gj1Q1emY1qDoH5gkuTTeVKcXvHiGXukK7zBbXqz/mjOX/As24v9VMjqcF6OiZMErYHviBz4CWtJ+DHvd8xh5d7l6HVHha6zZJP9mRteVD88+HQlluU1L3v5YQ4ltdS7GK/31zFuUknJEVyn96oTqKv/TEi4DPGbw/b1YM51JzVIlOlohTmWpblN5u4bdOnT6T0GRrlNCt/acQ3yRHkNzDIbWTvdny0N/q2RQCNDZAZTJZVUFW6JK0rvNpko9ZXuwfiYW2B0rPZdKJS7FJEpQrnSSB+7mNIUFsC8OCU/XgOOBMJ3uTTD8Osa/RixKMN+xF0HAATOwbI0vuMKRyBq3TbfkorBTgKq5VRUzRWns8m/z2wNOJ97C3yfNn41qQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB2632.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(366004)(39840400004)(396003)(346002)(376002)(8676002)(5660300002)(6486002)(8936002)(6512007)(83380400001)(16526019)(2616005)(66946007)(6506007)(6666004)(186003)(66556008)(36756003)(956004)(478600001)(4326008)(66476007)(2906002)(26005)(1076003)(316002)(86362001)(52116002)(9686003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?7tBsKKH+3JTVv6S6HVDM/eO1u37LPDFOYEKem1b/dgliwnH1aB208vANkRwZ?=
 =?us-ascii?Q?q0y3FXy3o4VJIkBfHHCE+fGktxSjKZPZ9HFeNZ1TfBUDF7Fh57QfmTxO6WDk?=
 =?us-ascii?Q?MoPGVBRBSuzJmnCbUcHoPvwIsPE0KpWz3952f7vATkZOyb4t323/Tns/ugom?=
 =?us-ascii?Q?YsuhjFsJMgBGRQ6YtLa56Y6+my97CItOEkfBIfgDHphKirrzl4y+vSBzJY/R?=
 =?us-ascii?Q?kE5ao0xwdmynLH5i9StnlEBzVPORP5oTEjraVtANMHabpUR8jStNPFBByQkV?=
 =?us-ascii?Q?259zGEAL0+6tvzqg58ukZmfH82ZJAlnGtCC1RDrFGC9F/R37u/IlkqfHNcrT?=
 =?us-ascii?Q?FcHLsnXrjHFFAyxhu1hFjdE6i/fn4Rb1j3V37juKmMzck8HPIwZb+xuSNSuQ?=
 =?us-ascii?Q?E/Etl4uvzfHXkci0kXndYNM+st3AIxGU/sjPWK9ykgYAGRj8t473KF1TljOW?=
 =?us-ascii?Q?fSa0QYmgHotuP3WKzOFAHVLc92ytrN/OjA8upoW+L4+Bz0k2OMF+QHStGSbS?=
 =?us-ascii?Q?YDzocdMyWmvjwinosl5DtSBuiGJoy/Aiq4LDalTY3k2tu8jTKt7meG5CxLOi?=
 =?us-ascii?Q?CDG4WM6Xd3YLJT8bKy5y5hJOSyy4enc6kyjnEVDNOjLfml1+Spgcm9XiMNeb?=
 =?us-ascii?Q?PnkguPdUIZLvgsIeYTF8TBLlYXtOIYfUsYHYmVhpuyk/u/bcD+6ybwn5yamZ?=
 =?us-ascii?Q?3/rZJ1SnuX4zbwx/PSQ1H8lO7e7ej5whccUcXTCz63hzpmFdlZ1fjAGjrSyH?=
 =?us-ascii?Q?dUl2V6jGUtsAEHO03xkw/YfwuWRqd/y6UO1aMV8WLMaTd/9w5FLvJagJsAxl?=
 =?us-ascii?Q?fQ9oIKfQILg3+jaf+yDrtsWjMPDOwEh0Bfwtqej5p3CRxL+YOKaz3QB8o+LU?=
 =?us-ascii?Q?jwGk25Mir14Z/nNC0mfAqpUS3SyCHO2BJL8zLJ99w8mrBsWpIz8Hzy9g9mGH?=
 =?us-ascii?Q?7q50oWVf1qJ3YAcd6eqKNDQfKF5DNQkYkJC8fB6J8wzS4fRpxcy7chnVWFK/?=
 =?us-ascii?Q?qhHjf47buHSUlEyc0BcX8la0F9wU2uCuvuLb9ut5ZMd0TLj6YOjIGA6PgRji?=
 =?us-ascii?Q?+zipWvDEhvOG5siwKw8ZMNjnqx+RKVWxsGOw2lFCLVCpRy93eRS+jAmhfveK?=
 =?us-ascii?Q?sIcYwXTLivoFCJgL0oT7P2KU4M4qRlq05PSOjf229TdkGKhpbmcQtWNyPPYv?=
 =?us-ascii?Q?idBQhgjLx927skNdDl32rGOW/3TK9vqOJeT2rixWzQpQfTtD7g22VEYHABk+?=
 =?us-ascii?Q?Ttcl5GDWqRMEJOeHOaAU9ft+bsrv9oPpvIDeYrpfu3mMAVwiJmiWX82SXCz1?=
 =?us-ascii?Q?vTCbQnUNFWKOipgEvkgZNrOw?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76177652-aa71-4292-b382-08d8dc64d6d9
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2632.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2021 03:48:13.8073
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oQBYpqJZJzaR+48yPgBpUWCZPw0NB94lj/dkhr0J2wQW9xJr3Ixo0dLS6zC0rv2d9N19h59bTmNbvV4HA4ixBcmenZEZ4ysdzg90DXq2Tb4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4976
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Zqiang <qiang.zhang@windriver.com>

If usblp device has been disconnected, direct return
'EPOLLHUP | EPOLLERR' in usblp_poll().

Signed-off-by: Zqiang <qiang.zhang@windriver.com>
---
 drivers/usb/class/usblp.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/usb/class/usblp.c b/drivers/usb/class/usblp.c
index c9f6e9758288..40095c8826d2 100644
--- a/drivers/usb/class/usblp.c
+++ b/drivers/usb/class/usblp.c
@@ -498,6 +498,12 @@ static __poll_t usblp_poll(struct file *file, struct poll_table_struct *wait)
 	unsigned long flags;
 
 	struct usblp *usblp = file->private_data;
+	mutex_lock(&usblp->mut);
+	if (!usblp->present) {
+		ret = EPOLLHUP | EPOLLERR;
+		goto no_poll;
+	}
+
 	/* Should we check file->f_mode & FMODE_WRITE before poll_wait()? */
 	poll_wait(file, &usblp->rwait, wait);
 	poll_wait(file, &usblp->wwait, wait);
@@ -505,6 +511,8 @@ static __poll_t usblp_poll(struct file *file, struct poll_table_struct *wait)
 	ret = ((usblp->bidir && usblp->rcomplete) ? EPOLLIN  | EPOLLRDNORM : 0) |
 	   ((usblp->no_paper || usblp->wcomplete) ? EPOLLOUT | EPOLLWRNORM : 0);
 	spin_unlock_irqrestore(&usblp->lock, flags);
+no_poll:
+	mutex_unlock(&usblp->mut);
 	return ret;
 }
 
-- 
2.25.1

