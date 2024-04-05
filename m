Return-Path: <linux-usb+bounces-8952-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 80AB38992FF
	for <lists+linux-usb@lfdr.de>; Fri,  5 Apr 2024 04:10:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9EC021C21BE3
	for <lists+linux-usb@lfdr.de>; Fri,  5 Apr 2024 02:09:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1129FFBF6;
	Fri,  5 Apr 2024 02:09:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alpsalpine.com header.i=@alpsalpine.com header.b="CeZ3VXKR"
X-Original-To: linux-usb@vger.kernel.org
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2133.outbound.protection.outlook.com [40.107.113.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C24128EC;
	Fri,  5 Apr 2024 02:09:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.113.133
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712282993; cv=fail; b=iSfa0YCB8MknSmj5BUfdCQkHVTGeH9wTbeFFER31u18VflCuULapn3n+cf9wHekxruxjQgOuKUdkIRjWuONaNW6C4BLdJBZyAN3fXMR5HKw8GGOslNQmTE4okos/6SLMsQ5VK6SIHwwI0i1L8EH+faWZNFpPzdrSsQ3A6Yxzlls=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712282993; c=relaxed/simple;
	bh=nfNKK4R9Ilm8/f5kp7TOtsoOvCGeii9/DscmWDSq49E=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=GQlW3rd6ZPd1O4eiOlvasZcT5JA09zhiPRiX1TuVVcSod4UwlBpUdx27PrejBQN9BmIu2IYDILNeA5UO40IkM1P+VVWiaDJ3gUNlDtaFBOL5KWE90NICR5PC7//K+vadfAglzj4QbMfVSuqq5A8puCXuijmx3JxnPos3SHlRWNg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alpsalpine.com; spf=pass smtp.mailfrom=alpsalpine.com; dkim=pass (2048-bit key) header.d=alpsalpine.com header.i=@alpsalpine.com header.b=CeZ3VXKR; arc=fail smtp.client-ip=40.107.113.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alpsalpine.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpsalpine.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Cjzb9acy605pou2HKdMSiE/35Exv0QK6YQeSe1jlYHCKIBje2D4WTdJaD6BVLlgxFgYAH1aFKGvy0sgf3Gz9HNZB3LZfeQKTcGu8CHHibzU+qIYIvh5lIMV4BFYiIDE5zKB329G+s6mTNWz5jKdUPbLY7RhdjklOMGIXpit0h+CsK3qRCFweoSEzv1khCs/ERAMWQ4+2elL48fT4y5GiLl1OLPFiXNBj9snW1Y37a664pXB1ZM1uXHvZawgjXGb3u/UKYDl/MB9qrgr7hf3ZKHx0e+avK1hijf4F9sGtnda5WE6iWixBX8UcSic+b3ylZ5LwGs+7Z3pRbPQCa6OkDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ADzFUyDCVU57rKOPiguDTxNErXg/pv/LfMC26d+/oDk=;
 b=YuVdwLeIuFGBldOUAngc84Dbr9zMGR8M3ogPeXbygzA1bcL8cy4FTPR2PuJ1UO0bLtvfG1rT7csZNnG+Efqe1lkSEPL7UFlnRz1WlRFngsOFCQaBZuE8vtqMu57pGA+H/LcBXeLwmgFlQCIYgekmb1AxvK4m/2ubk4eadhhVbH6PUrO66uGeMpxJPNCXHiB9JWLxIsZyDSPersvA4PhVqA7yTTlz/EmYIJ+w80/u0qyyLhtGuYi+teFBXlWpbXOqRct2PNxI8TXQeqdAfv57lLHgZhzXHq/0fB09DOj4qJNVtOSlgtYrXwyaB3V/mozbfOWtCzHc+Q2uPkBk3wz1wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=alpsalpine.com; dmarc=pass action=none
 header.from=alpsalpine.com; dkim=pass header.d=alpsalpine.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alpsalpine.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ADzFUyDCVU57rKOPiguDTxNErXg/pv/LfMC26d+/oDk=;
 b=CeZ3VXKR1M7x9bcsLl40+HIJXAJAEIsbQS4fZ0M+/jRIXhr5dggtvdVZBKFd7TJ7D7U/eijSYefqRN8CQZ7NHnM+ld8r0R8B+2EY5VWkxE9O8clPD9VRXzn6UunYxTeJ41X4Zl22dldF3aAV+2xctc8QP+xlBaY/EAY3TYklTUYJHIADucYqp53Ro0pJI59TLaNFUVSyiI4nxdM8/P8RuzRQnzW21/D+VdJb9Q2aPn32VasQG3AAIeIbaGOqBoIN2zAYMDyevXwEbTdhwUwFN7ftWoAigDq+EFU0dfiiWh2KjxTxVEFRiUv3ZjEPsRvT4LNabAsG3QSmJhPrVdCNVw==
Received: from TYVPR01MB10781.jpnprd01.prod.outlook.com
 (2603:1096:400:2ae::14) by OSAPR01MB7325.jpnprd01.prod.outlook.com
 (2603:1096:604:11c::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Fri, 5 Apr
 2024 02:09:48 +0000
Received: from TYVPR01MB10781.jpnprd01.prod.outlook.com
 ([fe80::b541:f53c:6306:6e2b]) by TYVPR01MB10781.jpnprd01.prod.outlook.com
 ([fe80::b541:f53c:6306:6e2b%4]) with mapi id 15.20.7409.042; Fri, 5 Apr 2024
 02:09:48 +0000
From: Norihiko Hama <Norihiko.Hama@alpsalpine.com>
To: stern@rowland.harvard.edu,
	mdharm-usb@one-eyed-alien.net,
	gregkh@linuxfoundation.org,
	corbet@lwn.net,
	linux-doc@vger.kernel.org,
	-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	usb-storage@lists.one-eyed-alien.net
Cc: Norihiko Hama <Norihiko.Hama@alpsalpine.com>
Subject: [PATCH v2] usb-storage: Optimize scan delay more precisely
Date: Fri,  5 Apr 2024 11:16:07 +0900
Message-Id: <20240405021607.12902-1-Norihiko.Hama@alpsalpine.com>
X-Mailer: git-send-email 2.17.1
Content-Transfer-Encoding: 7bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0247.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:456::18) To TYVPR01MB10781.jpnprd01.prod.outlook.com
 (2603:1096:400:2ae::14)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYVPR01MB10781:EE_|OSAPR01MB7325:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	N9bus4Kaf8dSi4Vkpun15K5ti1LLO3exIQxcSh7RekxxeSYBOxIF8Zr4w7VCAY96mz4CejQ47RAwmAtZOBmtH3g9X+yBzafz0OmlDgohV0RZY3Z+grysoLbHja557f8e7AUuL2odmLSZb1hVjJ3TUjuGP+4ihHsXetDUReXsQZOGitYK0yRy6SLNGWygDq/vX4LCEsbkPhKLC7CwlL2pNScc5fbIvEJh1KtDlWk+6Za4reCYCmwWyeOmTHcLYE6SjWGaOhTyktKLXF87wL1N8Sq9qB/O1oIHn/EHzrGsGyHsBT4ZxRZGB98fBURYS8R7P3RrOWsY6nCY+s3WMaVUkgqMHOJ7W6TFcVIR7eeP8C7gChys0QEM8kudtyRoXpAxIdLqwQ9XTj+0SER4aa5c1E5JCfUze8AzORHUKdZOXyGtWDVjiPte9mnyHXp0SXFxcSd3BzqB+HOH8/EmK1CGI7+b7aNgAuxzRBmFlZqHpENTFGqzgJ5twOQO8Zb8Jn4Jk1IyYPv0udyA4JxxWpfe1SKkSnup2QfYbh5DXxx2WRSwiPhrS8Rthjmx+Lgfaxl4nWjSXCbxHrC8HdqvQKYWhGA36HJhxKsf+Z28GI8tLSnIeSqu+LlVYsHKpTdEWTlMd3ixjr+pi5v2PhKOiqGFUCCda85HBX5ogTlN5RbPFeCNTihGbW5bPMFWEkRf/IUusM/YZIKVR4oyVpm1KQ3N9q/95IYGMciv225jq+qofrk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYVPR01MB10781.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(52116005)(376005)(1800799015)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?yezclXiKLY5F5XGJArk9tt8uxSKPDXAZyKtboMJyvaQAau2ZpVGihc+LZq7i?=
 =?us-ascii?Q?GG+00IZ5i2O6ZQBE2eBnotwKOnzc79tqvyQZ5Zd3Socsb0sNCXBx+dQhyxvJ?=
 =?us-ascii?Q?MlzSSeYReKefJhgDgX+mRAt2pKySQ0nDmHZdzKATERPUFabNR3EsQejHD5Uj?=
 =?us-ascii?Q?gjwNa1GAGRewfzQgO4XkDL62jZdIRF/aXZdQ/WEtQC2jQ/Zl5ZbEOHkjJwDm?=
 =?us-ascii?Q?u2A740dmSxj9pdaZdJNTAjkMTHgJDB7AQ1lNBTFnm7BmjBdsmGb+yLns6B1Z?=
 =?us-ascii?Q?U6nkjzNgIxr/7T62nCA20QQc+mXh1qCIJvCKFhEvUhAxj2TCd6YCJwW0AWaA?=
 =?us-ascii?Q?MNpHHceCIrHI0rGh0RHozuSBhI8qo8ZVRD7QQ6cGytjQFms9J/a/ZX+AC7gj?=
 =?us-ascii?Q?X0stbphwCoh1e1ocuAhtphtlQwc5/JRSiTqN4w4mPiJpbVpE5FIfZQZtuWOF?=
 =?us-ascii?Q?QWFeSYAbiwNctc8kp7uYoXVBtRcn/NXBZeoK/e/RUD9CxXQ08EKV1TRA/h3S?=
 =?us-ascii?Q?2eH8w5nkXhEyPQ0HuJ4/EjLtH4QTvhZVSi28bP9fNkU6FPXyKbIOxrMOSJ9U?=
 =?us-ascii?Q?Hj3+3hSEsiT7qkGCIO1dMqes0v+9Cu5CqkgINIWuo05Whd3Zn61W+0hrIt5u?=
 =?us-ascii?Q?ytCKyA2+PO3qT0ORUR83ZlZKh2Ase32L5jvSvLZenWx/MF7hPgSSFiUfbySD?=
 =?us-ascii?Q?DGXK0494XTS3EczSReVsYTPI4gQBSog+gKdVlzAkwswxl7bUwhNvP4u0U3E+?=
 =?us-ascii?Q?KL0gWuP+Xg8f1RMBGfkl6lexLjvN5UWwxqxLOG5YgKuuQErOSWJ9d8u9XebE?=
 =?us-ascii?Q?dWMxqI/emXCeprQcV5IP0cFKyqfWgoLKvj9f+ZgIuU4gzT8ECZ+yXkN+9VhJ?=
 =?us-ascii?Q?prEDQbQjZTCrDjl9R+SYkHYWZAJ0mTR6KLnfisRGHjMCFFDveA3+V0z2mBuO?=
 =?us-ascii?Q?5n0UoTTY0b+82ILm09QOytBn9SI8IYFj2hoQlgFATHb0lYosvQZekQTytWfj?=
 =?us-ascii?Q?ZgWwEMyCBmFRh9cMRONh/1qqC+JN5o05NhJDGaxuAXHcZwGAHrzMSwruVVwo?=
 =?us-ascii?Q?n+VpLDmO5A3CYnBpVZtRc+BtQZftdfbLHi8dWRpNEwXIKiiUGruBe40tyQkP?=
 =?us-ascii?Q?39saLCZc0pkOj0uvtecGrfTVry8dtYMjrveUeBOG9iWkLXezQQA6ViYfVKtq?=
 =?us-ascii?Q?EqcrG7tXi3KEupCj2jC6Ir+0iQIlzCFi1ZeBjvKLfOHS8TFTQzH1OjRmJ+69?=
 =?us-ascii?Q?muzq5A5q2qE7QHiOSl4g4M8eFHgum86c6O277qvjiAg1lmju+YSrdiwvhHKr?=
 =?us-ascii?Q?92PCoitSZpP5R2B03naNMT8Q5MIZMhKsefihq+T30Ux5FwqVCSzfUogFcx3u?=
 =?us-ascii?Q?5odqtXXS+yXRkm0/s1wPdPFE29JN9Jep2dKsMrd31OVYkrw5HibLKrU6gUeB?=
 =?us-ascii?Q?XF4heCJ2RzFv74laeC6Nt51iYzeQGa6yFXGZ7prekNkl0MAGaAlVl8Wpypwi?=
 =?us-ascii?Q?az2220lDZuhgkzOGjOI+6hszlmPAxa+pUDhJh+qXPZJ3zXUTTZRFz3BT1oUZ?=
 =?us-ascii?Q?tWjizLxFqA+gfNANhck70xLViI8QREd+hDqZHcjj?=
X-OriginatorOrg: alpsalpine.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c7d9d64f-ddca-448e-7c24-08dc5515781b
X-MS-Exchange-CrossTenant-AuthSource: TYVPR01MB10781.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Apr 2024 02:09:47.9301
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 57e76998-77bd-4b82-a424-198f46eb2254
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OvGxd/whC8Ohg+mCIn16IJd9oXZe+IVIq16/l+67iUMpeA4WxvvSkVAwnWd6WJkH6OjFxsDS3G63HUduWth1eA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSAPR01MB7325

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


