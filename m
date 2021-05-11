Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 07F53379DD4
	for <lists+linux-usb@lfdr.de>; Tue, 11 May 2021 05:31:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229968AbhEKDcy (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 10 May 2021 23:32:54 -0400
Received: from mail-dm6nam11on2077.outbound.protection.outlook.com ([40.107.223.77]:39297
        "EHLO NAM11-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229465AbhEKDcx (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 10 May 2021 23:32:53 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JPsRUGtlnM5O/d1BONPHSqBFzLDXz7rdf0hvvhDOIo5yII+enyf9tVJAGZcnRcq/RTLt42v3whlCcqyh6pDC6HjxKUVI3fLaIYjaO3wwRFJMpoWNw4/ORS4OJg0vOIH9msstHtPACoF22YPVus5k3WYCebN1dy9dMxAFN+3xFUe13Sk/SW+aLhxNuQ2EFFqv430Lkp+2GZ3HL1XL/w07b6veSxklQ3uGVlNnLruoIW7yDrd3laZoY10pozai8FJkM9HWdCTcLI1cD6rEhyvI5CEdM/el0eFSCDZfH5nYd4V7/0jQ4W928TObgmv4gUvNPwJGP8DLHElLL7sxSfvYpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Td3nIWQB2Rk3gpat5z7dmKwVKLx4/puIoJSNgws/syc=;
 b=W7rrCfCE7VyHS3apeNC8ae4TQVWvl1Vu55ZUmI4TMs+zW1JumAcVeeZxAjaE4gTkp4nGWruFH4A8nH4NRhTCFBwKtQ3Jgr68waQw3BqSoXeQkxO6LY43NrmLWaECf9slmJMrpgRQ51IGhczleDVOVEg6dCxlVe8B9phC8zaCoqnmSKSnvHxzdYQSHetePe/eyxgETVmp+aUatffjGHzsuP0qdrQW54486PFDVyoqjak4YJP2DNAijUzZpS8JQduuJQ/Atmo5yQPA8Mlis2wKtrcZk+Vhc4TMl9MNHFYQimgBOwrFLn440kGevA+FHC/wMdYHnyjkI2QKVfKa4aSCIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Td3nIWQB2Rk3gpat5z7dmKwVKLx4/puIoJSNgws/syc=;
 b=qLEElGcbwpsuEw0Uz+3LMW/RE/9zpGp13pIA8TJyNaLe/Bkhtm5bHG4zIxzAjWEJHJRyM4Mfv1f95VrNiDZYgsRDOt02R6PZZNp6O8ytOujbYxYgXkQs6L8RI/Zu9YRz7Xojbw4Rcgggzao8hzD0MewjtijttghPF1XPRvOjVO4=
Authentication-Results: i-love.sakura.ne.jp; dkim=none (message not signed)
 header.d=none;i-love.sakura.ne.jp; dmarc=none action=none
 header.from=windriver.com;
Received: from DM6PR11MB4202.namprd11.prod.outlook.com (2603:10b6:5:1df::16)
 by DM4PR11MB5277.namprd11.prod.outlook.com (2603:10b6:5:388::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.25; Tue, 11 May
 2021 03:31:44 +0000
Received: from DM6PR11MB4202.namprd11.prod.outlook.com
 ([fe80::60c5:cd78:8edd:d274]) by DM6PR11MB4202.namprd11.prod.outlook.com
 ([fe80::60c5:cd78:8edd:d274%5]) with mapi id 15.20.4108.032; Tue, 11 May 2021
 03:31:44 +0000
From:   qiang.zhang@windriver.com
To:     penguin-kernel@i-love.sakura.ne.jp, gregkh@linuxfoundation.org,
        oneukum@suse.com, lee.jones@linaro.org, qiang.zhang@windriver.com
Cc:     linux-usb@vger.kernel.org
Subject: [PATCH] USB: cdc-wdm: Fix ODEBUG bug in wdm_disconnect
Date:   Tue, 11 May 2021 11:31:40 +0800
Message-Id: <20210511033140.29658-1-qiang.zhang@windriver.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK2PR04CA0051.apcprd04.prod.outlook.com
 (2603:1096:202:14::19) To DM6PR11MB4202.namprd11.prod.outlook.com
 (2603:10b6:5:1df::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-qzhang2-d1.wrs.com (60.247.85.82) by HK2PR04CA0051.apcprd04.prod.outlook.com (2603:1096:202:14::19) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.25 via Frontend Transport; Tue, 11 May 2021 03:31:40 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 669a3d7e-fc88-4b26-fb68-08d9142d4b78
X-MS-TrafficTypeDiagnostic: DM4PR11MB5277:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM4PR11MB5277E5FE4DAD894DA7E0921BFF539@DM4PR11MB5277.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mt22fUpuolJ9qfoq230IJF4OtOHucM/glTqQmP1nRyR5AAcl8bMgBRvy+PdOTJZ52UN0v6dc9tMON8YXKtdLEffc4Vsp8F7I8l5G1i4BY1eQ2Xhp4gmYPkpmA4bmo4MsDTb3MoTrnF6hep+0p79/HA7vr7kUV07BUyoEzCe+OtXr0ceyxEMMKZzwr6CDWTiLp1vthwJabvGJWlvbIAkb0+zmQxByNt65P8HXUXbm6wJb+ehMG+bDSsTv9O8VsfKJwLsz3sZ9/kSOueJ0kxV4HKbGmCc5j0p1YA+qr9p++Ln7IqWwZxvGyapXfahDZWf9NMw4FoK72aKpH6XGlGX0Wq8pfz4fpaT4xDBxJleYccCiOn0bq259yJ5Lsd0gM5BuErJF6Kbo6QWuwrHMXgT3ndikQsu0H2OD7m+7WVTvtQ0+AqIW20j3pn6UoA0awGUgChOwUU/rkXqqHmiRodLMdXnMzdBVfjruz5Q5SMlo46NKuhfbruw6z/sn38+f6Ttx198d9VMVkqsqsOzIYEnmC+q6hEoUpH/+kGjBSub7DBrWsXxSHKULHdXCJjdHW2ACEhoRaqJrxmqWBd2R+WnN7iXQVlbT+VqcyDZDcaL2ndo5FivTy78e3YqYV8lYbRn6J0haN+ATA/zD8bAk2/Bwzg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4202.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(39850400004)(366004)(396003)(346002)(136003)(36756003)(6506007)(66476007)(2906002)(8936002)(52116002)(83380400001)(16526019)(66556008)(38100700002)(38350700002)(5660300002)(86362001)(6486002)(186003)(1076003)(2616005)(956004)(66946007)(26005)(6512007)(316002)(9686003)(478600001)(4326008)(8676002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?zeaEJ+qA1LP+q26toknNx4ua+pIbrtpyDbMWFO30dF2vyPjr8t1USHFt5aCz?=
 =?us-ascii?Q?A+Oafm9MWuDjY/1rekUGzi3cTQiWvqwjdoBjPTm9KXHmq5WvSBAd/CT5y3uU?=
 =?us-ascii?Q?Y5D0w6Os7Zin07Fp1swWP9YQ5q2qbYZayOFMkF9HhsXffW5XWU60OZOoQi17?=
 =?us-ascii?Q?L8i6o+F+JgBchseSuyI23kVZTjvQXDHZTP52F0DamOG+7UEiHZ1WBVS6emh/?=
 =?us-ascii?Q?n+0MdLJsR3rIFsFcrudI9CfilLay6qud2G5hy4pC4ekziZIPG0wPUX8CwcNZ?=
 =?us-ascii?Q?uf6XYgM2dRGN9UQYAvbqa95B8vcVK8TBl/NY5DQtcxouUdZ2LoIfwysVmhHa?=
 =?us-ascii?Q?fiLgA1jXjRwgXeC82Woght8qZTOgkcULrLLwiJ/9PSH4+IvzmgqB3L8i75YB?=
 =?us-ascii?Q?j+W7JnyEL8mHbpJMXAVktWN+ldZ593B/h2EsD2GvyNMGEHBvxpPzkR5CYN8Z?=
 =?us-ascii?Q?aHPob5XudIHfTzwreTdnMyurD+V/PlVOE0uHP79xEv6vCIYMcQGiXrw9MvSW?=
 =?us-ascii?Q?IMrR6XKfydShPJYsVErjEeaCzOYtpQyzOQhGb2iNnRFn680b71sMnCvtZFte?=
 =?us-ascii?Q?1jwtuL1sItnZ3xXI1GHBh6aG/LSfYdAVxTshLqK3wMHBdo1N9MBELj8pTMQb?=
 =?us-ascii?Q?I+KCzajP0gVY8sSU6WIoWHiM82C5qFO2/gRd8+RtW2yQVr/MDDGYsI0IcYs2?=
 =?us-ascii?Q?HBKskcsY41xjmaPTFh4CpZ0AWfA27pL0UkObcUyT6yUWv72xsRlGbrMUz9nf?=
 =?us-ascii?Q?vOXvmCX2KyVrWhNdbXIh6uv8UejPx6IJB1TrPZ9ZnbbZvPhKbCYmH9DK32pK?=
 =?us-ascii?Q?ak/KAkkShec4wlxmXKPtSpx9JDpAFlvHoTnp85fLmy25niRYFQjY1UJaWp90?=
 =?us-ascii?Q?IYVDFlhR68HGptwsyU5w9g7Njo5CefzkFwkYBVBrngEQFam89Dy7DKxxPOWq?=
 =?us-ascii?Q?beR+YqfDQuk7T8xtQbbZS7oF5zvg5O1FctQNVI72jtwdKZy8LBYRTub8Shrr?=
 =?us-ascii?Q?JaFXGeD1xuyllJr2JLXikirShkG3k3G3YS3mU1P9Dlv5n9kuBAR8h+6nKdJb?=
 =?us-ascii?Q?C8apzgRj5tWSa3lLNGp2q1n4yHH1FkL8GJj/WQiJD4OAOzfNQtDU9grYzeXJ?=
 =?us-ascii?Q?hPxvjMMcTsk3As7b+TdLw/KVh2AiGZHD9NB9MPgcAmC6TJaLx9WxUrGNzXVZ?=
 =?us-ascii?Q?AhsmlhpyYfHkMlD20NXVBDffYmdoAZH2ty0CIzZP4pmewOu4yP33UIBr91hH?=
 =?us-ascii?Q?fkGjM3wdzSwgRDMrSQkVvjQdpE4lJmat44oS+57hxbXntr3vH0mD1A10bx7q?=
 =?us-ascii?Q?Mq5+GkcO26jtQh7f2y0StHv2?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 669a3d7e-fc88-4b26-fb68-08d9142d4b78
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4202.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2021 03:31:44.3956
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1LVrA4MUEnA10BSCKocLvUAavn01NnOyDUk8tPigknkaylVu8maPcWjX9lL4LILETyBtx6MlqfDPlWi5NQi4+RxAZPnc2cSdjaVpXe7aR4U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5277
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Zqiang <qiang.zhang@windriver.com>

ODEBUG: free active (active state 0) object type:
work_struct hint: service_interrupt_work+0x0/0x110
arch/x86/include/asm/bitops.h:207
WARNING: CPU: 0 PID: 9431 at lib/debugobjects.c:505
debug_print_object+0x16e/0x250 lib/debugobjects.c:505
Call Trace:
 __debug_check_no_obj_freed
 debug_check_no_obj_freed
 slab_free_hook
 slab_free_freelist_hook
 slab_free
 kfree+0xdb/0x3b0
 wdm_disconnect+0x3bd/0x450
 usb_unbind_interface+0x1d8/0x8d0
 __device_release_driver+0x3bd/0x6f0
 device_release_driver_internal
 device_release_driver+0x26/0x40
 bus_remove_device+0x2eb/0x5a0
 device_del+0x502/0xd40
 usb_disable_device+0x35b/0x7b0
 usb_disconnect.cold+0x27d/0x791
 hub_port_connect [inline]
 hub_port_connect_change [inline]
 port_event [inline]
 hub_event+0x1c9c/0x4320
 process_one_work+0x98d/0x1580
 worker_thread+0x64c/0x1120
 kthread+0x38c/0x460
 ret_from_fork+0x1f/0x30

This warning is generated because when kfree wdm_device,
it is found that there is still an active work in workqueue,
This phenomenon may be due to the following reasons.
when the devices disconnect, although the work was cancelled,
but the schedule_work still may be called, therefore, before
scheduling work, we need to detect the status of the device.

Reported-by: syzbot <syzbot+7da71853830ac3289474@syzkaller.appspotmail.com>
Signed-off-by: Zqiang <qiang.zhang@windriver.com>
---
 drivers/usb/class/cdc-wdm.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/class/cdc-wdm.c b/drivers/usb/class/cdc-wdm.c
index 508b1c3f8b73..50fa951d84a1 100644
--- a/drivers/usb/class/cdc-wdm.c
+++ b/drivers/usb/class/cdc-wdm.c
@@ -221,7 +221,8 @@ static void wdm_in_callback(struct urb *urb)
 		 * We should respond to further attempts from the device to send
 		 * data, so that we can get unstuck.
 		 */
-		schedule_work(&desc->service_outs_intr);
+		if (!test_bit(WDM_DISCONNECTING, &desc->flags))
+			schedule_work(&desc->service_outs_intr);
 	} else {
 		set_bit(WDM_READ, &desc->flags);
 		wake_up(&desc->wait);
@@ -306,10 +307,12 @@ static void wdm_int_callback(struct urb *urb)
 			return;
 		if (rv == -ENOMEM) {
 sw:
-			rv = schedule_work(&desc->rxwork);
-			if (rv)
-				dev_err(&desc->intf->dev,
-					"Cannot schedule work\n");
+			if (!test_bit(WDM_DISCONNECTING, &desc->flags)) {
+				rv = schedule_work(&desc->rxwork);
+				if (rv)
+					dev_err(&desc->intf->dev,
+						"Cannot schedule work\n");
+			}
 		}
 	}
 exit:
-- 
2.17.1

