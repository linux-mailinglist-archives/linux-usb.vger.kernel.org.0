Return-Path: <linux-usb+bounces-8953-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 72285899302
	for <lists+linux-usb@lfdr.de>; Fri,  5 Apr 2024 04:11:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 909371C21DF5
	for <lists+linux-usb@lfdr.de>; Fri,  5 Apr 2024 02:11:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5818AF9F7;
	Fri,  5 Apr 2024 02:11:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alpsalpine.com header.i=@alpsalpine.com header.b="U0T544UE"
X-Original-To: linux-usb@vger.kernel.org
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2113.outbound.protection.outlook.com [40.107.113.113])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F04B7484;
	Fri,  5 Apr 2024 02:11:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.113.113
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712283098; cv=fail; b=K/30/CNal1EybLqYSoQ1NqWAMCjjJM9BfNdsoEBSjUZVZYr2dOKqujNSCkcrc8RnQigkEnLss18e/jNKA7eQqFIF8Oy+wrg+TFEZJYwCMrC/2LlCTHarq8WrMICnp8pfcloab98J+vZ/I0F0jHuszBcYRXHWSDemjbeOo2Z/YSU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712283098; c=relaxed/simple;
	bh=nfNKK4R9Ilm8/f5kp7TOtsoOvCGeii9/DscmWDSq49E=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=iR0iyzjhCP7ribqpUyEN/uNqKYvClpLvjpRpo/l1gzu5dtNvjCPt3myu8eSVwSpfr45gJ0h+2eGsEkbpqiN8DWwbYCNwIe9KMF19XPjSEvUHZ4FTRHIje/kZ4eiV5UINwITR596G+2YEyqJqTTe9kcl/DJF5z937nGhPMi84tMQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alpsalpine.com; spf=pass smtp.mailfrom=alpsalpine.com; dkim=pass (2048-bit key) header.d=alpsalpine.com header.i=@alpsalpine.com header.b=U0T544UE; arc=fail smtp.client-ip=40.107.113.113
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alpsalpine.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpsalpine.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C0b4LOUguACFXE9b6udgM2Snz2M0GDQ61WoXoPkAfOxsdk5z+WmtLlUEJD0bHjpdNDcNnjUsHFLFfepQEGs638V2s/siGJZb1cdKB9gsLShVkQphiSNMFCDYellFf+9lY4r5GlV6KYv7hoV0cOQtd6QSBHiLN6aYx1GSmLuZIS8abCChcfMzSpj20fQS2fcAvSAuVNQyyc/gWVpzDCIcvq8Ey37Sw9M3anJ9o1qWLsclhXI9j67ZH4G/OBCkyjI4nl+SFSVPLqDKivGpmVJ9QPgQdgJNVFkZ6jz6BtQVR83YXP8IotX7Mqu5mSEAhX0xX2L7pZJDdX/dykL04rQphw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ADzFUyDCVU57rKOPiguDTxNErXg/pv/LfMC26d+/oDk=;
 b=VUavxl54w8reGuyMchcOX/G8Il2XkgLGzkEKpuuWn2ua3qSQ+HLX/GZbZPoprgkikBDWlnXaSKrfCL7qb2j1RNIC3rFT9gniZYTSNn8j7m+z6OgNs0/9YWKXN9x47SGcICvWIHTWH21usOPVxMRL7/UtFuMESPslawyMYDGDUHpwZUS9LQ7vB385d4/TDjWuh9aNjhRBSmHrEzQOpuUrYPRSZji3xJen7BZdygI6NXrnyJn3OUWz9Fog4d9qxNzKz5P9lFaWD5MgPkQDJ/GrIQh29lmyDKqntAJUPUslLaX9TFJiB4VG0s6T9+OI+RL/8L26Ct66UOeOsQln1Yfd4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=alpsalpine.com; dmarc=pass action=none
 header.from=alpsalpine.com; dkim=pass header.d=alpsalpine.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alpsalpine.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ADzFUyDCVU57rKOPiguDTxNErXg/pv/LfMC26d+/oDk=;
 b=U0T544UELL7Zdr8VH10eXqeZDSY/RRmFmhsBtmPzJq63FhLnpGijnNR4FVnW22t/t2GKiDK40oRwgddkcx/yOedRhmFu4Lg9c3ubPsmGZn7vbiRAqSrM/oWTm+oOuEP8JF9MP+uhSJSao3iWCSOZiaVdLZAtwzMvKreHOVF9bGlX6U8isMB6JZDg9nFrtam3cLct5gawPXzDXdnJbvbqCjjUAsnBZB9ZAgM1NEMMtNeeGXTgmfYpAFvjcA71kE6/mqtt5fAuuKGdSVI9ZY7GWFc6f2y8XGi5d/iMyeqhsq0U3gBIeY857bww3ECZKMCstmByZ21N2ty0hivHfFuXcw==
Received: from TYVPR01MB10781.jpnprd01.prod.outlook.com
 (2603:1096:400:2ae::14) by TYTPR01MB11035.jpnprd01.prod.outlook.com
 (2603:1096:400:3a1::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.42; Fri, 5 Apr
 2024 02:11:33 +0000
Received: from TYVPR01MB10781.jpnprd01.prod.outlook.com
 ([fe80::b541:f53c:6306:6e2b]) by TYVPR01MB10781.jpnprd01.prod.outlook.com
 ([fe80::b541:f53c:6306:6e2b%4]) with mapi id 15.20.7409.042; Fri, 5 Apr 2024
 02:11:33 +0000
From: Norihiko Hama <Norihiko.Hama@alpsalpine.com>
To: stern@rowland.harvard.edu,
	mdharm-usb@one-eyed-alien.net,
	gregkh@linuxfoundation.org,
	corbet@lwn.net,
	linux-doc@vger.kernel.org,
	kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	usb-storage@lists.one-eyed-alien.net
Cc: Norihiko Hama <Norihiko.Hama@alpsalpine.com>
Subject: [PATCH v2] usb-storage: Optimize scan delay more precisely
Date: Fri,  5 Apr 2024 11:17:38 +0900
Message-Id: <20240405021738.13577-1-Norihiko.Hama@alpsalpine.com>
X-Mailer: git-send-email 2.17.1
Content-Transfer-Encoding: 7bit
Content-Type: text/plain
X-ClientProxiedBy: TYBP286CA0047.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:404:10a::35) To TYVPR01MB10781.jpnprd01.prod.outlook.com
 (2603:1096:400:2ae::14)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYVPR01MB10781:EE_|TYTPR01MB11035:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	66OvF3yfHsI5XoNhzVlgX5LFzIKhRpAiJdLefoOh16ayasX6oPO1FYbq+iskTYuM0uxpUvRKEpTPVR0KUPp+Ft8KYrf7k790Jst3JzndLBqIC3wlJdUOvDOQt7WFQxkOC5vyKLeNKTLTkHKxmAbeiHqjzM4meriQ4K5c2HVXnS2pHhR5sdKgHaWePbkzmgCyQL+3uepqkfk0GmmBQDh18pC27nS0SQhvB/ldO2Dxom8p9loBZBavfESKUxioqJ2Gd7gYMOj/bgFm00zGvtln6ZPUuM2AMO7bj3HZ2NjrWZlfZM/P0HGJ03WDx+bqItWG/VP973uOv/AhTf6P+EFx7Nc7NfVHvRL6MguHQvLSeJiMpa+3TZl8Lz1UbCrXqX7g78ulw0zHph/iD01LLI5SNBg7l7kTTNfcviY45XhChBJXD1PtGFakb2UrSzK9ajl8lqbgRcnCyJGD9G68LgrF4cm550+DxRtmeuAfgTEVNuzlGFgTrzMTzj/o4xvbNQVWg6NpF6eikmWkMp2SUDS7D7QdtkIlE3Dvqxv79rRqU5uqhb2t3Beyjv7JR8QEgfE+3oT2m3/PZ9KN5pVYTa2kWRjh+oB3MBZ9Pvaq4lzB7NejjOkx0qNuSSwc49IAeUjJnFzHl1EZTJSMipjMWYBD5k4V5LCmRjXgSEwRjUwrWNLcIQOfglurwBC5aAft7BAQlcF82z6rNTsc2Kphq2SZ7Numz+j6XqcM1BNASU4RbV4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYVPR01MB10781.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(366007)(52116005)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?GLJx+px+DqxZIFVldrCuoPl8pDTnyIu156Gnq/YOrdfLxAhg0+cDJPVP8QF8?=
 =?us-ascii?Q?tedsrrcJYVSqiGJYuIzucoigrkv7kO6dATx1nv1V6cTtMEsGLNFr4xoltmEt?=
 =?us-ascii?Q?mSvoP+cAH/powg+ygFdjZCoYdNCZxA74tCWLutQKBxXvelBHd2CfxySzBrfn?=
 =?us-ascii?Q?UXnV+LtSWZHLNHq1MeZ/3G1/jsy0iYPTlQGRjPZEWBJQutU0fSbQ1b+1dyR6?=
 =?us-ascii?Q?TFa8NqQ8bi+xGZSxjp596HrIP0IaIvwqZs8gfUEuLxmgESsSODwSDE8X1gT/?=
 =?us-ascii?Q?cbOOojr0iut6pZXQSYrYxYRscDm83aMIfF6UXWoAdNLu/3o/JGcOKg12WSCl?=
 =?us-ascii?Q?4xvyBZvFtSMAPoskbZdm3iwCEgedsCZW5HCVjO5Sl/qY5x8nGsGwK1WXtr4o?=
 =?us-ascii?Q?/Me9myvB40RNue3XBQo35Ryqdja5DnCSszd2JOqc03YZgQeJi/zfKl/nJcMd?=
 =?us-ascii?Q?+lj1eTpQq84ajoyEPtZd/l1Ma2yRogkk/Q2Ye8TBrxrWioH9bAcF9Rx00Q2t?=
 =?us-ascii?Q?jdz2t8/P1jGpSgo6H8pzVhkWptbmj8THxKBPPX0OKxOfTT0kutiZqe0tQ6Op?=
 =?us-ascii?Q?yEZL/8SbrrZet3Fvie0qEKmABx7k3/RjxAMCaI3hwYnt+Hu5fzxd0tJMG5Ib?=
 =?us-ascii?Q?rsHLUiHQKr45ILe9VYPpCFqr3naUyYrQ96qR25zw/tksx5dWejHfp3kf8drd?=
 =?us-ascii?Q?vbQvdXRrH9+vjcMXy3wvqY1bU2MLujptBp9mD/GxNsPSrjAhl3OMB2GWjCmv?=
 =?us-ascii?Q?eutzGffMhwRh2xA7Ygcoa/Xy8xv3DoYNjlGfXiXmfK/Uq095iKicylie5OcT?=
 =?us-ascii?Q?I3vXyZSCQ9Ae7YaDTXGK2TPWHg2ovESYV2x8GjEHeu2CvTsZDSUfQWa9cr00?=
 =?us-ascii?Q?Y7GhPxI3oyLCR4q7vlzI4h6QzTlqqmfVhChr8eGDBZlNYnWSoZZsH6mpMSLx?=
 =?us-ascii?Q?wVPkLuytJzRQsIfoGIoFCQw9sTsWXlfxqOD2UlatV5RGWGTTMTKeKQ6fWyxe?=
 =?us-ascii?Q?WUEH3jLZiyLZe0QllWmbMFYLrxfmTDsFa3bcggDf+l4nC47pIl8JaBvl3XDy?=
 =?us-ascii?Q?f+At/F8ueyYwJ347cfEcwLtV5N9jXjKvEcHbuu5BvQh5LEIHg5Q+/HTw8ZEH?=
 =?us-ascii?Q?Us4tjwm9yjy6evMM42d6tiDJyBvd15aPoHu0KfWZ5rY+BPss5LTYaXf5hMrl?=
 =?us-ascii?Q?7N/etaOcm9b5k7jAoVYsP3pO4ZN5kZgo4+/g7nFejCBIgqsq4HDciXY7WJAo?=
 =?us-ascii?Q?IIfsoXDcxsL28ZXi40wau0arQdtNbcVtUih+LPGUoPEj3/zIYgIYHrThrxOm?=
 =?us-ascii?Q?TR/z1TbNZhAUZbkst+58FLES4FhbowgEDa7YbBZaYqxiFLiicrVLuhJiTlJq?=
 =?us-ascii?Q?YxXwuLdBvhu8dJGYbxF/RBDwbsgTe1S1BZ/CacpjUzxWW+hz4AKglN30l3wo?=
 =?us-ascii?Q?FUZhZBEyPa1P+OwuN38WlJ3DwDI6cI+q1jdelVjkHY9XKLEehnpKV0fVZLu+?=
 =?us-ascii?Q?VrFXS7gscc6qbiH3A5PDCmRr4Lovqu1XUJ8K2ZapC83Y8zSdZEK0rgZPjjyL?=
 =?us-ascii?Q?3gFcyZED4zj9+hsZBhhUhVSlKxbHYKhj+YDLsK67?=
X-OriginatorOrg: alpsalpine.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 09a41e31-39bd-4cac-0642-08dc5515b6bb
X-MS-Exchange-CrossTenant-AuthSource: TYVPR01MB10781.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Apr 2024 02:11:32.9829
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 57e76998-77bd-4b82-a424-198f46eb2254
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TaQ8nw0ilD+urPKOY4CQ63rzvVxsNu+gGvNBR6tY58+vA0Sr0IsUl/LSv4krllJ2x5WimOCcXsprA7z+jVa2zg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYTPR01MB11035

Current storage scan delay is reduced by the following old commit.

a4a47bc03fe5 ("Lower USB storage settling delay to something more reasonable")

It means that delay is at least 'one second', or zero with delay_use=0.
'one second' is still long delay especially for embedded system but
when delay_use is set to 0 (no delay), still error observed on some USB drives.

So delay_use should not be set to 0 but 'one second' is quite long.
Especially for embedded system, it's important for end user
how quickly access to USB drive when it's connected.
That's why we have a chance to minimize such a constant long delay.

This patch optimizes scan delay more precisely
to minimize delay time but not to have any problems on USB drives
by extending module parameter 'delay_use' in milliseconds internally.
The parameter 'delay_use' is changed to be parsed as 3 decimal point value
if it has digit values with '.'.
It makes the range of value to 1 / 1000 in internal 32-bit value
but it's still enough to set the delay time.
By default, delay time is 'one second' for backward compatibility.

For example, it seems to be good by changing delay_use=0.1,
that is 100 millisecond delay without issues for most USB pen drives.

Signed-off-by: Norihiko Hama <Norihiko.Hama@alpsalpine.com>
---
 .../admin-guide/kernel-parameters.txt         | 10 +++
 drivers/usb/storage/usb.c                     | 69 +++++++++++++++++--
 2 files changed, 75 insertions(+), 4 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 561d0dd776c7..ae1eb5988706 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -6190,6 +6190,16 @@
 	usb-storage.delay_use=
 			[UMS] The delay in seconds before a new device is
 			scanned for Logical Units (default 1).
+			To specify more precise delay, supports 3 decimal point.
+			The range of decimal point is in milliseconds,
+			hence the minimum value is "0.001".
+			Example:
+				delay_use=1
+					1 second delay
+				delay_use=0.1
+					0.1 second delay
+				delay_use=2.55
+					2.55 second elay
 
 	usb-storage.quirks=
 			[UMS] A list of quirks entries to supplement or
diff --git a/drivers/usb/storage/usb.c b/drivers/usb/storage/usb.c
index 90aa9c12ffac..f63e53464dda 100644
--- a/drivers/usb/storage/usb.c
+++ b/drivers/usb/storage/usb.c
@@ -41,6 +41,7 @@
 #include <linux/kthread.h>
 #include <linux/mutex.h>
 #include <linux/utsname.h>
+#include <linux/ctype.h>
 
 #include <scsi/scsi.h>
 #include <scsi/scsi_cmnd.h>
@@ -67,9 +68,69 @@ MODULE_AUTHOR("Matthew Dharm <mdharm-usb@one-eyed-alien.net>");
 MODULE_DESCRIPTION("USB Mass Storage driver for Linux");
 MODULE_LICENSE("GPL");
 
-static unsigned int delay_use = 1;
-module_param(delay_use, uint, S_IRUGO | S_IWUSR);
-MODULE_PARM_DESC(delay_use, "seconds to delay before using a new device");
+static unsigned int delay_use = 1 * MSEC_PER_SEC;
+
+static int delay_use_set(const char *s, const struct kernel_param *kp)
+{
+	unsigned long long delay_ms = 0;
+	int scale = MSEC_PER_SEC;
+	const char *p = skip_spaces(s);
+
+	if (!isdigit(*p))
+		return -EINVAL;
+
+	while (isdigit(*p)) {
+		delay_ms *= 10;
+		delay_ms += scale * (*p++ - '0');
+		if (delay_ms != (unsigned int)delay_ms)
+			return -ERANGE;
+	}
+
+	if (*p == '.' && isdigit(*(p + 1))) {
+		p++;
+		while (isdigit(*p)) {
+			scale /= 10;
+			if (scale == 0)
+				return -EINVAL;
+			delay_ms += scale * (*p++ - '0');
+			if (delay_ms != (unsigned int)delay_ms)
+				return -ERANGE;
+		}
+	}
+	if (*p == '\n')
+		p++;
+	if (*p)
+		return -EINVAL;
+
+	*((unsigned int *)kp->arg) = delay_ms;
+	return 0;
+}
+
+static int delay_use_get(char *s, const struct kernel_param *kp)
+{
+	unsigned int delay_ms = *((unsigned int *)kp->arg);
+	unsigned int rem = do_div(delay_ms, MSEC_PER_SEC);
+	int len;
+	char buf[16];
+
+	len = scnprintf(buf, sizeof(buf), "%d", delay_ms);
+	if (rem) {
+		len += scnprintf(buf + len, sizeof(buf) - len, ".%03d", rem);
+		while (buf[len - 1] == '0') {
+			buf[len - 1] = '\0';
+			if (--len <= 1)
+				break;
+		}
+	}
+	return scnprintf(s, PAGE_SIZE, "%s\n", buf);
+}
+
+static const struct kernel_param_ops delay_use_ops = {
+	.set = delay_use_set,
+	.get = delay_use_get,
+};
+module_param_cb(delay_use, &delay_use_ops, &delay_use, 0644);
+MODULE_PARM_DESC(delay_use, "time to delay before using a new device");
 
 static char quirks[128];
 module_param_string(quirks, quirks, sizeof(quirks), S_IRUGO | S_IWUSR);
@@ -1066,7 +1127,7 @@ int usb_stor_probe2(struct us_data *us)
 	if (delay_use > 0)
 		dev_dbg(dev, "waiting for device to settle before scanning\n");
 	queue_delayed_work(system_freezable_wq, &us->scan_dwork,
-			delay_use * HZ);
+			msecs_to_jiffies(delay_use));
 	return 0;
 
 	/* We come here if there are any problems */
-- 
2.17.1


