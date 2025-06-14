Return-Path: <linux-usb+bounces-24749-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 67890AD9CBE
	for <lists+linux-usb@lfdr.de>; Sat, 14 Jun 2025 14:47:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5433E189A8A5
	for <lists+linux-usb@lfdr.de>; Sat, 14 Jun 2025 12:47:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8754728DB71;
	Sat, 14 Jun 2025 12:47:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="OnnJwxlU"
X-Original-To: linux-usb@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010036.outbound.protection.outlook.com [52.101.69.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA9F11E519
	for <linux-usb@vger.kernel.org>; Sat, 14 Jun 2025 12:46:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749905219; cv=fail; b=lWY9X8l0J1FVzX0Dfy+hUrNvX5uJovdNxNcaNfA77S716c7zn1r1zy67eJefgtZhbcICaCU2jfYHrA/s/nAu40mgFLRDPZdAy9cJpHBpxysinSvSAHKmtmEKQ71/UhEboeTq2oM+uBT6ZkaGkM8JMmPz5Ry0yv/RTG80dUdZI9o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749905219; c=relaxed/simple;
	bh=sNBR0TVjgzjbSZSfEm0ERgkAkKbMeo3iGdWwVGtM80A=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=ZLltVayCWCYBZvu0m+hg09sOC6tXnrb0Ui92m1MD0GMjUb3m9zwuBxlMdXUcFW/fwa0toa7WyDOU9xXq+nJ3fl3FzbI05/Y58nqSRel778nFUTgqQR96fkn2jMPGpdBZvlvxiCgYpzb22SgB5H+E+XF6DeV/1ePG6JLIMX/haF8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=OnnJwxlU; arc=fail smtp.client-ip=52.101.69.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MQYjRsbeOrLyoY2g4hvYVcv4E4Zt5fR1I1bbGekQppIIxSuJg9IxrtKcXVGxU99OmKr4iCZafl0PQ0Jz7MO7sTgylX9SWvNRYDX9oY8grp0XKeYixoHKOUVyd+KXuvWIkQkaIaeAt2y3uwgMtLyJTpT5DW/BgmMqcl6TmAnIEbEpL5BlHW6Si+zWjDmfCfYakU2JKFckGuYtAr66ZfgP8aQRogww2PCHhllqB4OrZd81XDRYoXPla6DsJmrJl3JKmPDWYAPdGYOCFQgz9uZ25ydiGyjsDvMpSNhyxEoRM23LeGad3slIxWNOZgxfF2EJcknVeY+AZxRBtGq932aFAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CXgpuk5ti0fWV2tG0bgMXCAtdtvddA+uD56EAn3hP6Q=;
 b=fRXKYr8ngTNjGZl1xfaqJNAO7pLPrpPKXAPOMbInlJNm6IYoKUGS5ejHOPmG1hEtqLUoKSEfqiZQUABCuci1WyuxHeLAVgXKpvND8km+1HhtRm5sKIJg1T/cxQtlzFTXP/3PESjMmfVZ6GGwb0/uhwtg92htekYvb5lfuZM3qcGp3l4DJ3m8VnR2Dfih1YfRL2kBq8pyx68c/9/nwQNl3ujlMrbRDEre7jyAWd7wgv/CFeoZa2FzzbDXOARCJD372WibEoOGJhaii9ufX1SmBqrBP18kiMljLkEuk16OVzEN+A5N38FAEiAYW8WOGigRmJwBQhffUTsHq+qEZN9qJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CXgpuk5ti0fWV2tG0bgMXCAtdtvddA+uD56EAn3hP6Q=;
 b=OnnJwxlUQPPqDN8Vo6wStsrgIYdkIhYnCtNpEuqFpjD4dc5SMKee1ZGjOggBy1RgQnvWnvcaSc4p4xudMOm0v71c86nlqMXeuLilZERg2qukvzV8sqx3nyA6HGl9FvB5YmWa4ZxqiTfEDU6DkU/Gka9MigQF5/byVr4ySocm6VgHo0RJUYj6gTX55+8Rq6pCfudaMLbeU2Me/w0MtE4ZKlneSFv77WeTDr9pdAcj9grin/9cw4MclKvEAL7Q/2aNFNCG3hArTDIbc9DxnKX5WbzUJwhnGK2av9bRKIIK/yDSLvL5Z8zdPwux6D4eJ+n+uhllwAJg1pYHNjgivT4YiQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by DB9PR04MB8187.eurprd04.prod.outlook.com (2603:10a6:10:24a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.25; Sat, 14 Jun
 2025 12:46:54 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%6]) with mapi id 15.20.8835.026; Sat, 14 Jun 2025
 12:46:54 +0000
From: Xu Yang <xu.yang_2@nxp.com>
To: peter.chen@kernel.org,
	gregkh@linuxfoundation.org
Cc: shawnguo@kernel.org,
	john.ernberg@actia.se,
	jun.li@nxp.com,
	linux-usb@vger.kernel.org,
	imx@lists.linux.dev
Subject: [PATCH] usb: chipidea: udc: disconnect/reconnect from host when do suspend/resume
Date: Sat, 14 Jun 2025 20:49:14 +0800
Message-Id: <20250614124914.207540-1-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0018.apcprd02.prod.outlook.com
 (2603:1096:3:17::30) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|DB9PR04MB8187:EE_
X-MS-Office365-Filtering-Correlation-Id: b28ab92b-5e28-4003-28e9-08ddab418a26
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?VcMczwr+mQwhIH2yYou1YubSP2azVdAqMnAo7N44W0QmX6eS+WlBGHQDmLuS?=
 =?us-ascii?Q?veQ8znfn2jFYHpN38wcwvZlj/CKcGBybXcReUgq63INk1i0ODQ5hM0MSBbZa?=
 =?us-ascii?Q?RtXm1vCRWf32F/VEszODZt/tGMpQIXwnQ6QK2icpHO9RFWy2fV5t2SQTVRny?=
 =?us-ascii?Q?SC1THb3vPrI71yYLjVgIoDeCeDNJp3RWO3LNjeH3fgAhimkxJql5BeYwCNoa?=
 =?us-ascii?Q?TK/dC3VXezCt+KotfhbvaCGFOPZ5EOqzvP4qSVVVL3XzdA8ht4H9zDJ9VMwk?=
 =?us-ascii?Q?NFJOhfxJopnaYbJbioyl4sj+TiDuDb4R4nnF54Zwmk79ELhfcycuRApYjsmh?=
 =?us-ascii?Q?vStgwyILqJm6cF8Cq9x29+tDxTIIGzjjP5LNN9XzP1DptHWpxmQToXy1AtaV?=
 =?us-ascii?Q?rNGjYEmY4mYZj7HSKmeBUP6DDibsI02SnDPwOLJrCrd4BEWOO5TIhPej+R8x?=
 =?us-ascii?Q?LdUA/TIv0dQG+7bpxN65VFgVoxOsR/bs5GH6RFyuhn46OtZuJDxvCJr6O85N?=
 =?us-ascii?Q?UUB9d+bCKMIGlyZLa5vDgwdxitDgyxVqem1qfk9+lFm49R6Le0F/z6wRuzNO?=
 =?us-ascii?Q?x0VHdg8vAdj/YZzO5BE50WpYtvAnSAlvGhD+0LbBldMwQBPBInt4l687dRWv?=
 =?us-ascii?Q?b9VTL8MYM1XioXXXd3zb7c9pLXog/+cjIgytWcAgKy+EKMw9o9FjNCUqXOHt?=
 =?us-ascii?Q?KHtlduBjxDAZFwavCmIU2iKS84wSXFtCKHo4VIpaZ9wyYa9IyeC0fJMYpFyQ?=
 =?us-ascii?Q?9bvyBTCHk14b6rC3IVCx4gaSxBFZ7rvXP063LHOnnXMiLjBGge4Ns6IET1Rv?=
 =?us-ascii?Q?V5I6oCpoOmOqRWM8424D66ZNZAWk5LfRLK3KVYuPVDtt24UHiNzHKDPfSDvX?=
 =?us-ascii?Q?w++ingU0oUQ7vgbGfe8FuEOkOWYqyi3cO5CfkS1cxgUZodbA0aatoq2Nsy7W?=
 =?us-ascii?Q?FkKh/PzbIT6pdoiZMf68Co+YV5xQ880cOrgvGXFbOd3bG+BlfMWYXaGWYjNd?=
 =?us-ascii?Q?504Z0OmZ+/5FYPfudQ09minOY4/LXaFfAwYNNgVBa46yTtBkjvJpnPFQnqyF?=
 =?us-ascii?Q?YdhRqdwZmtz+tOHF5fkUJIJnx26THK2ZJHDc3rbt+yCNDDaj5aolJCyoom6r?=
 =?us-ascii?Q?07l3e1/6XxYBCEWkWGRce0WRdA70xjwfCGHOqQPBA++kl38TTcQIAfZNMkrm?=
 =?us-ascii?Q?Nmzkc8wwmqukb17OnrWKu6igElzt4Ze7L0O0742I8EmRuthHujzu+6knfu9Y?=
 =?us-ascii?Q?/ZuslO28gG+mjjbpDFXCKNPtQrYO80rgPnmJXQBJoNjXdMN20c78dYzf+BuW?=
 =?us-ascii?Q?uI5iFTIzIoK8+9hmN+LdbcB6glbF1A4dgYHDCiTSYLaumiKNzONIeQuarOSa?=
 =?us-ascii?Q?NwgCCsYRM1A0qnnHEr4GDZpf3Er+M7A5kKuvGtYCZTXl0bx6kdUxiEWNdsVU?=
 =?us-ascii?Q?+X7YG2Z5PKJerHw6WheVE1bvAF7VfCC2oFjM/yf5KUdC7Fvkfdd/Wg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?YEvx+W3MbSu12PB/5ITwfPnOdzP5vonZQTr/NPnNrwD1GViCBJ8YpwBDZx7i?=
 =?us-ascii?Q?JRTJQaGO6oWrnnkGH3KbO/hn0TH0Xn15TC49Z0Oth8PeiUaQW945ZxGBB5L4?=
 =?us-ascii?Q?WI92O8b8ogWOeI9jY5fRO3r4q7IcgQdDEB/njaizRQx6iWwp2rVyr0p63m3q?=
 =?us-ascii?Q?BvnbcCdkV9IdIjmMb8CeJEI25srqnCk/jrlWS1ssyb4dnSfljd67P9/0LUlo?=
 =?us-ascii?Q?NJRVhmyzS8CemfxuVCAN3tW+3jBwGsLxd7IJinWg10nWf8bKcuchTrtbHGzl?=
 =?us-ascii?Q?HfCUcE4VYKaSglIUsXkFyMbQYnl2V+L6IvQ/G8d+2LbuUdponGvqYN6Fqh0r?=
 =?us-ascii?Q?2fbUKpz51AxA+6kFwgbee3Ooj60uhZoQQ0SB9vdJYM1PRO7wf6q2diGjkaFB?=
 =?us-ascii?Q?H/D/9l5CD0Zfee6TPbIz5Zy5D9eRvU7BIxKl1lyllCEkrde9TLWiaeXU/G/1?=
 =?us-ascii?Q?WnoDcJeR8AgVqGj3TjFG4GA/uy/m9kkP4VW/AW1sCEqT1T4cO5JfiihD3FIB?=
 =?us-ascii?Q?nNx8msl6NK9Y+2cEbIVk1vp/cNBmyB5Aok3kYZVO0hvfk8Todqu0TqBG6QIV?=
 =?us-ascii?Q?xefYsGI1lWixJaZDnBD6OGR19nfDLrHrzw4aHbNyVSYg6S1uQgefc55NYpPw?=
 =?us-ascii?Q?9pV3CxwnHnk81aj74Lf3bwyP/5HXB2NOnB9riHcfCAFdndjeWuvdMYevqr7l?=
 =?us-ascii?Q?ad8J/27KMNQFMD1DIYyqtlc/VJk435JK6vHrT8et/Q+caoc5dsIserrt6L60?=
 =?us-ascii?Q?x/Qte18s2fyMzhl0f2p/jkp4w3B3zjGJgCJ41LQriLLqqNN8Ui2qk6blTOdP?=
 =?us-ascii?Q?dxdTzx048x7dIij7AgafLGnPe15am2+G1hiyRPPq8Ty0/d1kpJBhh4hMzwcf?=
 =?us-ascii?Q?ACRTyxrUr2zPbMhdN1HQOXdq6i0u9Bjr47jjRzobM1mCN7Ejd0NyLOltSxCe?=
 =?us-ascii?Q?GmtbCRgBYlb9CNneKxbIPmh6uIcyMFI1GpQrHYTOfFqpj0oQGCW2NBozx0Oe?=
 =?us-ascii?Q?73tQd2O7tglSo9NGK8qhAyNx1m2zrsC+l76NHsYXlmuAyKi30StYUySmidko?=
 =?us-ascii?Q?iGu+HXshyolpZLc73c7eQwMNBeTflnv7N9PRH31efrWgDONcC+hDWfQBMCx6?=
 =?us-ascii?Q?TwxIC+oE34/6lXcXBm/dKc/PgbgKUL5gXDxoAM5Yflp27sgHTQmJQMDieyC/?=
 =?us-ascii?Q?9kgWucXfQ/wOOYvJozoPnW5Ei2Iz9fjUa8EtVKOLsp9syfqvTNlpf/dbo5KP?=
 =?us-ascii?Q?zsXlzzSsyBmWsKXrCuywJmwrI4JQdSt30DmezbWK8DWAuGpzVD4E8f+D3j7D?=
 =?us-ascii?Q?K4FtI2Ia0lQ6/97NIrlDLSshwfkkqVM9iUOHlIPMw+bmrMB+kOlt76VmxkFS?=
 =?us-ascii?Q?vtFdk7/jEpvpXWqb3yWFQsbk0WWCYbupDpOPtPMYM6/Mtzyha4Fr4W0ib4zA?=
 =?us-ascii?Q?mCSzEQwZdczUnm7FPEs19EfteqQtJcVBpW/ZUVOxdNgFGit5qmqJAVhRDpK8?=
 =?us-ascii?Q?7ilJ3GaQoMjMJb9kKt5Iz009Wu+cLAXGa0Y5yY5XRcePxDlLOFWsdwNm3ijf?=
 =?us-ascii?Q?C9t+MbcZeu5IF0jIUZWEEgSyeLBlKrogsskH1oqx?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b28ab92b-5e28-4003-28e9-08ddab418a26
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2025 12:46:53.7788
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vv7ugvBatRzBuxzORHFNjXPIzK5L7H5cdWE2Y4WUsFCYeycBpysff3GVpisYxhWL3YyZHPPwD5QAjQnz+Qp3HA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8187

Shawn and John reported a hang issue during system suspend as below:

 - USB gadget is enabled as Ethernet
 - There is data transfer over USB Ethernet (scp a big file between host
                                             and device)
 - Device is going in/out suspend (echo mem > /sys/power/state)

The root cause is the USB device controller is suspended but the USB bus
is still active which caused the USB host continues to transfer data with
device and the device continues to queue USB requests (in this case, a
delayed TCP ACK packet trigger the issue) after controller is suspended,
however the USB controller clock is already gated off. Then if udc driver
access registers after that point, the system will hang.

The correct way to avoid such issue is to disconnect device from host when
the USB bus is not at suspend state. Then the host will receive disconnect
event and stop data transfer in time. To continue make USB gadget device
work after system resume, this will reconnect device automatically.

To make usb wakeup work if USB bus is already at suspend state, this will
keep connection for it only when USB device controller has enabled wakeup
capability.

Reported-by: Shawn Guo <shawnguo@kernel.org>
Reported-by: John Ernberg <john.ernberg@actia.se>
Closes: https://lore.kernel.org/linux-usb/aEZxmlHmjeWcXiF3@dragon/
Tested-by: John Ernberg <john.ernberg@actia.se> # iMX8QXP
Fixes: 235ffc17d014 ("usb: chipidea: udc: add suspend/resume support for device controller")
Cc: stable@vger.kernel.org
Reviewed-by: Jun Li <jun.li@nxp.com>
Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
---
 drivers/usb/chipidea/udc.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/usb/chipidea/udc.c b/drivers/usb/chipidea/udc.c
index 8a9b31fd5c89..1a48e6440e6c 100644
--- a/drivers/usb/chipidea/udc.c
+++ b/drivers/usb/chipidea/udc.c
@@ -2374,6 +2374,10 @@ static void udc_suspend(struct ci_hdrc *ci)
 	 */
 	if (hw_read(ci, OP_ENDPTLISTADDR, ~0) == 0)
 		hw_write(ci, OP_ENDPTLISTADDR, ~0, ~0);
+
+	if (ci->gadget.connected &&
+	    (!ci->suspended || !device_may_wakeup(ci->dev)))
+		usb_gadget_disconnect(&ci->gadget);
 }
 
 static void udc_resume(struct ci_hdrc *ci, bool power_lost)
@@ -2384,6 +2388,9 @@ static void udc_resume(struct ci_hdrc *ci, bool power_lost)
 					OTGSC_BSVIS | OTGSC_BSVIE);
 		if (ci->vbus_active)
 			usb_gadget_vbus_disconnect(&ci->gadget);
+	} else if (ci->vbus_active && ci->driver &&
+		   !ci->gadget.connected) {
+		usb_gadget_connect(&ci->gadget);
 	}
 
 	/* Restore value 0 if it was set for power lost check */
-- 
2.34.1


