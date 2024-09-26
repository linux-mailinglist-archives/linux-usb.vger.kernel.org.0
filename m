Return-Path: <linux-usb+bounces-15483-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B053986AF3
	for <lists+linux-usb@lfdr.de>; Thu, 26 Sep 2024 04:28:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8AC3AB20BD6
	for <lists+linux-usb@lfdr.de>; Thu, 26 Sep 2024 02:28:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2F18177998;
	Thu, 26 Sep 2024 02:28:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="iPRwaFcp"
X-Original-To: linux-usb@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11011012.outbound.protection.outlook.com [52.101.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDF4B174ED0
	for <linux-usb@vger.kernel.org>; Thu, 26 Sep 2024 02:28:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727317694; cv=fail; b=uhtQwcv4kvqoOOQ9j2bpKYvfUs6vMU8GyXETZcJxqHcg5mum+Tqn45+qPThz6lFbslOjEDUgJJp+zmhpYd3npk6qx2fumZXGQF3w7a00jyYMRFL4fQXeYE/iRr2S70Y+xrYRoC0AIfFMrKWLh3mxKHotaXfv7ccVF/c7KG/B64A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727317694; c=relaxed/simple;
	bh=rAPXjuJayXero/f/mIVAO31S2CScHLZ6fQXS2Gm9Oaw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=X4F+KQlqJkBInaI9ypDhopagz6fAZffH7S/cB0xM55onOryV0EFRyj9amYT9tBk+wSa83Hqi9aa4e3u6nLnQIkyJizYzu/DwKekXcEIkfPIhYleK82HbM6BrSeW0/G1pJIRlRhH9a5GWSDQWxWbOVMYStwxfqMrllcVqCq5V96c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=iPRwaFcp; arc=fail smtp.client-ip=52.101.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DeMVwwVeS+A5oJCYYy95Nc6PfZZVHucbllglVDpoaSF/Vtlt9yBy68fuk7iPwb3C+6GbOswkDZF3LMZyXmYMDcb6cmwZB7E+hgCILJjhmxySXohF3nZGMZ5VoWc285KY6OSCc99z48ahKCyL78GXW10XxrcCMDfqpS4Sq5KEGKWtzat9K+9AyrJmT1wR+7GwsDokR5mA8t6FFva4oTHnqdTGHgUA3tHepDIhpSRgBWFJjI1Yp3q/LJAZKIIBdqIJmGM20xrkJKi/0xP0ilXmjHCI1CTtevc9wgBa+r29OqeWDK6hYhN4kzMSW02LDXhEatbS5ElS9iTjAg67LovyQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/dgPoiDmzUDWUWId15U7RPATc+kkv3jyuhHBxmsVKsU=;
 b=juVowWaMRpRkto5X9Mb4ipMZi0akR+2kCoaH6JnqqQyXJIzJPIwv4tOuQLtK4mJD3IU2TJdSnLCd8v478nRbMBKErs/i+51OmeqIXUDAd9QR8pZWvRK4La9VO1txE+go9wKYQk+b22AIUAayBoeAfa6XDnjMx+dE2pNVFNvkkwFU86mXo6CPXdstI624hTu2fXIYHmWJ5foH1vJ7R9Sp0TNwOVI/vrOWuKuuG6M/Z2RrtD7L7HF9anN6XQ1BHOamkcq379t0wLNGLS0MJSOZxFAX8MLqeG/lbbVgt4HgSbW3afVF8qySTlj9Qt8LcsgqDQGhuskLHuQnx9IMm9kKMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/dgPoiDmzUDWUWId15U7RPATc+kkv3jyuhHBxmsVKsU=;
 b=iPRwaFcptNAnZ1iRVQ4uhFtJ1Y+DTHhwxVWroutvh/jgHCb0+K9Alb/x7m/cJjQ6XDF3pPDBDsI1MP4nxIDPAO4h4PJQpuQsGWGTrEqaa79h/JXHBQX4P4EtlP8gf9eQY7P12vZ5zwKes2ARcy1G2z6+kC8qMH4gwMZlj23bNWqiE7doZX1MK97bAGE1pZdEorZOLnpxfjH4WegX6XOksAZOUrmqDE76AnzGRSeFk6fBJnSlcQmeF9C7YXwczXBnU3EpbAS9ESDh+5Azi6HYZQHQpbey23AxaSFAWtxo/UNat41W/HCa56wWyvAFhF4PuYVsTwo3l8H4vuUVo3RdMA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8829.eurprd04.prod.outlook.com (2603:10a6:102:20c::17)
 by DB8PR04MB6972.eurprd04.prod.outlook.com (2603:10a6:10:11c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.27; Thu, 26 Sep
 2024 02:28:05 +0000
Received: from PAXPR04MB8829.eurprd04.prod.outlook.com
 ([fe80::cdc5:713a:9592:f7ad]) by PAXPR04MB8829.eurprd04.prod.outlook.com
 ([fe80::cdc5:713a:9592:f7ad%3]) with mapi id 15.20.7918.024; Thu, 26 Sep 2024
 02:28:05 +0000
From: Xu Yang <xu.yang_2@nxp.com>
To: peter.chen@kernel.org,
	gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	imx@lists.linux.dev,
	jun.li@nxp.com
Subject: [PATCH v3 2/3] usb: chipidea: udc: improve dTD link logic
Date: Thu, 26 Sep 2024 10:29:05 +0800
Message-Id: <20240926022906.473319-2-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240926022906.473319-1-xu.yang_2@nxp.com>
References: <20240926022906.473319-1-xu.yang_2@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2P153CA0011.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::14) To PAXPR04MB8829.eurprd04.prod.outlook.com
 (2603:10a6:102:20c::17)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8829:EE_|DB8PR04MB6972:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b3de2c2-cfbe-4ef0-0389-08dcddd2da18
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?1Uqjz2NHNE12abaFE12lmDf5awa6ZflDMNHurjqDBryv2iaTiDaezJ/etHjt?=
 =?us-ascii?Q?czQzdpktAVvPYwaXtd+V7LFC8yVbGvFV7oSwY05tIG/cvnldoiF492iEKl+a?=
 =?us-ascii?Q?panjRKcS4IxWWdka8TJtZOLGxWYhCr0vW6+/vNXPCvEzYkdRmw4VJpjfvpy6?=
 =?us-ascii?Q?QcMq/kt2jWS00vNC5l9CHjc6GShu8Di/YlSh7cVC6l8tB/132+eJBS4LyGvP?=
 =?us-ascii?Q?J7lF0inv6fuSxMuu+nUOoDCPoYobmFIr0866L4z1jwPQvN74mKkIpUqZDd3d?=
 =?us-ascii?Q?UJtJiFwQ38kVlDyApgYvqtIYaH/pMvIqQ+sPJoQbPLur8A4rtu6LgLdzYexv?=
 =?us-ascii?Q?Jne7Du/+Bt5XUJbDcUydc5I3ee+2I1mA3XTMKgQbHGRlLopDACObtgVXbVZH?=
 =?us-ascii?Q?eYgeTRU7mQN7e1bMFaCCgM2mK6NWEw7HLgoHmjoLu0HuB5hOY+Va/6BSaGH6?=
 =?us-ascii?Q?6YudA0B3Si0WfQpkFSEJwldVLiyK8M1fRvTh09vVObW4x/IXoIB6BGs86XHw?=
 =?us-ascii?Q?NEKswWv3duvUWr/3tBa2qKH+GXhkXhXD/HTvB1k5tecsp33M6nd9dsa3UeRW?=
 =?us-ascii?Q?MOKPXCJ3THGHH9ySFz+qZQS0OLx2lU0rkBtVwINIvDYEpNBLSIc6iFQeBLiC?=
 =?us-ascii?Q?h0xy+R5v9QugU63R/9zQWz1Y7dTPAWoPfpJs6kfMqv8fqTB8B9Vqy0dxcJ1H?=
 =?us-ascii?Q?N2xr3R9kg7AiNoxpPpnJOgG8OhCnVdwplUbvkjZki8F07hgWoif4Fb52IQLY?=
 =?us-ascii?Q?5nhUwArNOpYC8rvMh8B5kjK8PzZNpt1+4aGJlNkTdF2ZlCgWRH8xzAHQQFIT?=
 =?us-ascii?Q?MLNUY9RkX6+GdHom8yecEy9Nbse8Lsj3muWPLbd2vc4H7I7pWRubwbuZv+U5?=
 =?us-ascii?Q?zNHQyqG9eYsADrFKrdKs7WElu4vSfcamaNo89DKpTnqo2wSV51exJRjkjwdN?=
 =?us-ascii?Q?+4Fsw2G3/8JH77CgM1mRw9YQyd6LYOBwSwtFwBQxB2XS++y2sI2eKrlaMGjT?=
 =?us-ascii?Q?NOBhOcZRtxdzswEWZ7IsH+0/wVNppVPWSPjXzoIl8Av+0hriUwt6twLrFl8h?=
 =?us-ascii?Q?p/AFx4T6pliGdJvgICY2RTwhzrW57PqVfWH0E/Rk/9HzKtj6gGEoJcjlGyjF?=
 =?us-ascii?Q?eekQ82IqbIHGIwjNylMuawrdsHBvAkFrVxID97rV7+4v4HLbAB4X8axlln1j?=
 =?us-ascii?Q?GRkvnbZUONb9KRqf+6Ic3GS0h2kN0A2pMFbeBBbHkLUC4x+7QYvhNQsR+Iyp?=
 =?us-ascii?Q?B2bzl6Po7RFp9dyb0A/entiCKpWoMpL7JJw9186IyNSipHtL26HPiF9b7w1e?=
 =?us-ascii?Q?l5TywfCneVmEuSExxXpId1GXrAwC+ICVZqgwk+yqKg/NP5lNpoMNn0kA52bR?=
 =?us-ascii?Q?V0jMLBnM7iIgO12XJBwz49hWGeDfcISZDjpTzl4j5DnE8Ptvcg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8829.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?E7nXK5H2AIXL/qbP7LZ0E9cFHIhueqFUiZqvlPfOo1rGLOD/ivOpJr0m/M5g?=
 =?us-ascii?Q?j0kwVdS1B/075UA1TFY1hJxqpjNhebeLbOv4nlhoaEGlbUvW3k2wFYIS6Xwx?=
 =?us-ascii?Q?IckbuB3Q0pAiV5Y0IVpKSOi/iOnt/dYwTnjzQ8WOJLrCdw+NfYwUNJDoRWyW?=
 =?us-ascii?Q?mDljNeVEECVqiYB3PSier+V7Pdqz+olUTPlYpNh/03ISxN+MEFVPzwVx2Nc8?=
 =?us-ascii?Q?Qxa++NFZ7dWPJqrBImNCGdfj0kGnUpX0PgYaiIBbsrnMDNwnB+2Zgh3YNF+c?=
 =?us-ascii?Q?relsmO20R21TQJkNrhO5SY6vlhem2Xj8TQLKEngbFRsd8xpVMnqqrgZlss6S?=
 =?us-ascii?Q?hp2Z+E9RW2LC1JmoWI72aMWoF1OLFEZ8ddJO8tbbHte2INPYtm9L+hLRm/se?=
 =?us-ascii?Q?HAukrWa78D9lvx+V+wnfD6eHM5ENEcKvhKp6ocG923GgWn2Z7iVtsCi9Cpng?=
 =?us-ascii?Q?nGzh0eP4WM3VQ1MWd3R2FxuUi6iCILe7POQFuStEJm9GtcsVZc0Wy8H8kU1f?=
 =?us-ascii?Q?JKuEfo3XWzD5iNVxhjRzVWbiPIN6MnzHfX7UZ0+b475xUhTzDPneZIrGBTI1?=
 =?us-ascii?Q?w3YFa3tWWHjqrOyMUyZ+Ui8DOZ0GnJ/Pb1Jua0c3L+9WRyPc3I9GPpM7XtN3?=
 =?us-ascii?Q?pFgHIka/w5J1WzV9LrwPdqjxUN/t5J40ilqkMQ5HgydpRlZUfsacD4c9ogoa?=
 =?us-ascii?Q?LSLIn8m7UkMUIf83Jst+m5rbYWs6/NMCh+UmOCkGwwyUAQB3oMtbIaWwJ5/o?=
 =?us-ascii?Q?XpmBIY3oJ23XsXUXw8EH3/9u0AHvbaWhnXs6LryTS4BPFyvFWVy/Qx+W8O07?=
 =?us-ascii?Q?NRdgi+xtuUXXUF2yQ6UHxlzaw1GYxKNn+/90N7sPeRp2jDFxM3yymoTlK81J?=
 =?us-ascii?Q?dpNmFXP0tP6vYFXl5iaVfJNijguA0kDCDSmXoAbskijLibq4TABcs3Mrr8GI?=
 =?us-ascii?Q?agYGRFO2BvIasBoF5PPVtzOjQzCIPrecRlsNQD2q+44f/cgJLFv00Dcx3sfW?=
 =?us-ascii?Q?9imZ/b8zCWM2DRlGyPNPMJOQrFaEaWUFBUneyPmsQWFKVsKhOnG72Qt1/0/C?=
 =?us-ascii?Q?IMLIQmmAFjSEJvBYmCEgsJWIZlPKGeEVU4z1AdSziRbDO6c0AQe7P4/XAq12?=
 =?us-ascii?Q?mvdHIVx7V8cwRDybzkK+5pkoutUbB0OpJxacRkDmq/nmf3VdYIe3nB1JMzpw?=
 =?us-ascii?Q?8VDJ8WGVkaMKYyqGDE7JOc83po3t4CNRMEzaeyyTExIOkt9aAcN97/q2XDqf?=
 =?us-ascii?Q?wZ1kkhlLPdDSgVPfIhM22vbltecgw/FKYlv109T1Qj9ehAhhhKlvB4pxuF03?=
 =?us-ascii?Q?MCbV13/xSQlMOJdSeCdQsVBk97vBvBBKyX2o5sU0c87lQ4uHbYbuP9+8bgBm?=
 =?us-ascii?Q?3wVQ+DUrUK+Us60YiO/rMe5UCvGa3nyyuErYRxzZ1gsQYqMeGjj4cFDW5P8V?=
 =?us-ascii?Q?2As6ohrAS6/dyakAwuhtyVGKcMpkoDdjtLCnYCEaMOh7El8hafFzWH8sBzEd?=
 =?us-ascii?Q?UuD1mQalUD3lB6KJuNbez9gEJUXKsBMgtj+EkxuecRhln1Jo0lPljxc2Ammg?=
 =?us-ascii?Q?HZKgYWsz1FL70xSyiKzG+ATkPtwu5BRQIsuNCPst?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b3de2c2-cfbe-4ef0-0389-08dcddd2da18
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8829.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2024 02:28:05.4537
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c/dGcjYQb2ErxEJ+4AuotKD4T5TYP4PgWKS6W50KEteAbegKjA5plzTdCJbMqSqVdPNhgk520PGzwXS6hN3PLA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6972

Currently, ATDTW semaphore is used to safety link new dTD to dQH. But this
code has a bug when the endpoint is already in error before polling ATDTW
or just met error during polling ATDTW. In that cases, ATDTW will never
turn to 1 and the cpu will busy loop there.

When the endpoint met error, ENDPTSTAT will be cleared by HW. Therefore,
ENDPTSTAT should also be considered during this process. In case of
endpoint error, the current dTD should not be pushed to the head of dQH
since some dTDs may be still not executed. Therefore, the link logic is
also improved accordingly.

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

---
Changes in v2:
 - modify comments
 - fix kernel test robot build warning by using cpu_to_le32
 - add fix tag and cc stable
Changes in v3:
 - remove fixes tag and stable maillist
---
 drivers/usb/chipidea/udc.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/chipidea/udc.c b/drivers/usb/chipidea/udc.c
index b9ccf62e0a50..0132bb25c9b5 100644
--- a/drivers/usb/chipidea/udc.c
+++ b/drivers/usb/chipidea/udc.c
@@ -612,10 +612,17 @@ static int _hardware_enqueue(struct ci_hw_ep *hwep, struct ci_hw_req *hwreq)
 		do {
 			hw_write(ci, OP_USBCMD, USBCMD_ATDTW, USBCMD_ATDTW);
 			tmp_stat = hw_read(ci, OP_ENDPTSTAT, BIT(n));
-		} while (!hw_read(ci, OP_USBCMD, USBCMD_ATDTW));
+		} while (!hw_read(ci, OP_USBCMD, USBCMD_ATDTW) && tmp_stat);
 		hw_write(ci, OP_USBCMD, USBCMD_ATDTW, 0);
 		if (tmp_stat)
 			goto done;
+
+		/* OP_ENDPTSTAT will be clear by HW when the endpoint met
+		 * err. This dTD don't push to dQH if current dTD point is
+		 * not the last one in previous request.
+		 */
+		if (hwep->qh.ptr->curr != cpu_to_le32(prevlastnode->dma))
+			goto done;
 	}
 
 	/*  QH configuration */
-- 
2.34.1


