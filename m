Return-Path: <linux-usb+bounces-36382-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cL8XNpg052l+5QEAu9opvQ
	(envelope-from <linux-usb+bounces-36382-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 21 Apr 2026 10:26:00 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 67B754381BB
	for <lists+linux-usb@lfdr.de>; Tue, 21 Apr 2026 10:26:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D87E5302D09D
	for <lists+linux-usb@lfdr.de>; Tue, 21 Apr 2026 08:22:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D587C399359;
	Tue, 21 Apr 2026 08:22:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="j5E0Fntl"
X-Original-To: linux-usb@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011059.outbound.protection.outlook.com [52.101.65.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9EE8399019;
	Tue, 21 Apr 2026 08:22:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776759748; cv=fail; b=r7Gu+ekSgxl0oHMr+N62FqqtEL1T5Awvf4ER8xuPYs8xgpVOOOTQ1+Tjq6axmTMixo9P6iofWePeisUphjqQSPXWNTBq+H0KVbRKbdIXS4vttqD5kAOrAqIOp6J/ET9RQYdl4elcR3HAupgluBj/KtHnuSg3Sc+z0l85rpcDpsA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776759748; c=relaxed/simple;
	bh=1jJbqE2pIDkJdGAQla9QY07g5GXv+fVxsZSAOBNb9Yc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=qbH3ehEikNW3nTW/43pxO7x3W3D3OedFK8avBZu8LLo90ULH/6qqp8A7HVuUf9zp3/nl+XCpm30Tjq2/vpPuN690IV2byOrHNBnkwzzybIWdcyiEyaCfk/6zaHWeiwqi3xV6ad6GtKjiBfHy0vpkyk6mp9Uw0jYqNW9olpSfLrU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=j5E0Fntl; arc=fail smtp.client-ip=52.101.65.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iZZAotpLV6Bd+gIPpuIuLWuBzY+A8EhG7749EHGJaTi8DGH0PtzzIN2tdDmpIWh3XJZCdfHMBAIXZ/Z6sNd6iNr9CAIiNRT21Xv6nWpZSRH5unaMEzNGCqbO0MDtJN3Lv8p0aZX4EsAZhpYCAJ4icij2HDu5fLQOAk8nKY3Dffutt0C8lhxlMgpUnxxy2eUaS35la+adYHJG574DecjuQOSVu6g+m+yrXu7cdKglaqktmUr+U+ZM9UUvfFhb4kh3wFfeiX+wHk676RFoXCVIKHzD6wJdBGYr6c4jeMus2wa4Vfx+hbQyRy81VlubpjBnwi405xKOlS8+HfXCFVZV5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sLY/L8eiwHQbdpRTE/deE8ep0tXPQ/Yr06P9iQGBExo=;
 b=s4HFHIjjPfpcbWE2BfCINaqjhyQiKx9e3p8TByQCl3wVNvtXOpYFkgi15jOGUZEO7HSE5zkxEn4JqtjXINOkDGrb6huVxyO9za7frnFd/oqCU353yMw0OyQucKvWgWm8CIR2HoOlsDfNdWvW9ffy4cqKnRdbCr5bG1MjiAahDBCvjtotyaCIHrfehH7U8cbgGZyLSccx+LtUQ2qGJJJzNo3cJfFFJkaUf0RuX1TBX5ExWZ62ZOu6ohl08THl8CF9Zku86UEV9Vm4oMx22TiTtbzwpL+eN6+mHlczyCWESd61h43eylbjsEW69A/4aAz8SZ2EfG0swWzc1eSOP5u1Jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sLY/L8eiwHQbdpRTE/deE8ep0tXPQ/Yr06P9iQGBExo=;
 b=j5E0Fntlhdy6WIOuyhJlCLGGtFP5x/VYZr9je3gqwk770zxZMB46vr/pT05vMG/UsmCRoTEAoWMKxWmlfV8zc1gqbSPWm5rijYA0zwWAaKh29+fH/ROGSX/Mf1PbvqbYbv2Yp2a7pr0aKUjBE28jGKcHxK1QosgnmnFy6P2ld9q4aJv99bBoDp1TvovlkCJXJoL4AcKxFWHA4jflxs7OMaxatCIobqNVapAMtXPPSXoqjcgnZwp1ZmTcOkZhTsrdvJaS++pp7q6PZ85fe5a8P5lzW90BfaiS/eGgdJWjTHauNGF+NQxbSct9z6nAlMOLfH5t7bzck3Ed5r2dKSmGbQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by DBBPR04MB7532.eurprd04.prod.outlook.com (2603:10a6:10:207::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.16; Tue, 21 Apr
 2026 08:22:23 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::c67b:71cd:6338:9dce]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::c67b:71cd:6338:9dce%5]) with mapi id 15.20.9846.016; Tue, 21 Apr 2026
 08:22:23 +0000
From: Xu Yang <xu.yang_2@nxp.com>
To: peter.chen@kernel.org,
	gregkh@linuxfoundation.org,
	jun.li@nxp.com
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev
Subject: [PATCH 2/3] usb: chipidea: udc: support dynamic gadget add/remove
Date: Tue, 21 Apr 2026 16:24:35 +0800
Message-Id: <20260421082436.1264442-2-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260421082436.1264442-1-xu.yang_2@nxp.com>
References: <20260421082436.1264442-1-xu.yang_2@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR06CA0219.apcprd06.prod.outlook.com
 (2603:1096:4:68::27) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|DBBPR04MB7532:EE_
X-MS-Office365-Filtering-Correlation-Id: cf8e637b-d3ff-4ece-a613-08de9f7f1cf0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|52116014|19092799006|366016|22082099003|56012099003|18002099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	ZqWZU2MuSVR1l2i+cRbyKYU4V26MmkgnuvMTjP8vWW6uUpdwPGqPUs5qVSAcjPLjyXTEW4u9uHFo/YQdRhaGHL2lZ6KnKHCHtTDbdYrlZQsCT7dJPjIJiKBT9crdbk8iNOm4zOwdmbsYav8XTEwd9gOmo8+L4oKo6Uf9xy8pA//nrKC7GHHbwbCwdYMqa0puZvxIVVJBYQ6jet7o4qrhPHisIXIuBJiGn/j0yXLhPUmtElT/KmFiszG7XBTaFYORCWjQysl1UrJB4tFShDqoM0cwRhz6U49FKE2dsAdWNikxomJkoIU57ehRv9L64Ta03hSx8xB84M4rhcxHp3ZZ7HYlUouCn7w0PC8itMML85tUKs+EzqsO73zssPeLcrbY767N1FBy2i2dqwYoF3OOXBi8RHx10PaxjS18dWuPIS5yxiqkO5m2Duf9hdV7VOCq4b6KQ3FPPqQt6EDyvGMfOgEfckamOvtOt/7KTndGdu0bKgIcvlgQgyZIvBGqGprBFEROFXXyeXsGDppJbZ2r9NvzicpzjMYtQQEEaY7at4wH8Kfws4Hj1VZ8K1UxRb+hx5LDfBJiOAA+CnLj8AQD9FdCfM3zBmRHE4X7Ta0qhsheK4dR61TQWU+pYWoiemsfVgRuMlzdYfaYDaaxVlxD5T+UcxZC2QGzzTElA2h1WIibRmuyHt5hwnRYkJzGO4RHjq7jJGwVA2cccep50X6zJ+7eJItmrcQp3wIjF4dY1H+GslafyPLJxxFmQGjM37zbZJz0uXytaZuztGQLoR4CUMNAWKi2dqpELvtqiD+GMOU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(52116014)(19092799006)(366016)(22082099003)(56012099003)(18002099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?SpnxyDOaHnE/8W8Wa2Iocsxyjnfc2XTXACXn7T08V9yLju3uUh4DUcU1lTvh?=
 =?us-ascii?Q?Iy7O9LGZT63ymmlup7gkj6YhbzhyEIDaHrzQwMo4N4HFeAuwKhK0lmDkNw1k?=
 =?us-ascii?Q?DtPd+WL80MAUqRk2ksb2aj+Z8jjlzjdirFQog6p5OWF8ZobfClXceJNUZsDi?=
 =?us-ascii?Q?rvqQFy2Py85ZJHimvgu46KabfU4FH5Us+ik6y/2qBhyRFE34Yhuckv8InLP4?=
 =?us-ascii?Q?IJ4Zw+ZOvYrDYUYF7GIJ8dhkMt4WVaujHZTblE1ZfzAvbLTyPb+3TJT1n9iW?=
 =?us-ascii?Q?59zePWcgnqVoHX8BSTCmGmfc1GHwYHYdfAfyyLA+61QI/9yKofrLPxXVgvma?=
 =?us-ascii?Q?IkO9FEf1SCf583/o5mAcXLkBdMOVHl1p1mWd++e6dn/wkjd3GalOWiIrDrZv?=
 =?us-ascii?Q?bpT2lJDdeISfO9YvtUsodx6D8bVDX3lTPhoREcP+Bu5wlzzxHOJ5SgCE8NXW?=
 =?us-ascii?Q?FtxLGHNoQHSpVk1i/GslfNekwMwgVouh8d31y+fHpI3WYroZg/mqTmyIqe8D?=
 =?us-ascii?Q?y2rSdQk8TPnvHozaff2WDl1p9y9AMVwm1KMYnIz6nslVpCwk4Vr79GSk5rSy?=
 =?us-ascii?Q?uKNNkCMJ//zJAfsOofTTQd0/nRV6U1GBTpRXj+JjySjOK4/nuM6pZuYO1wud?=
 =?us-ascii?Q?kXa7lIyfxtGWhLWSkXl7VZ5nLe4m5JQQ4BsmX5I8qY9DYa12adwV+43316Ku?=
 =?us-ascii?Q?XYx7rq0QZgglij9qJSg1A1EMuVjuqcOmjiwLhZjFDB62ACjn+jbqjX58iYKS?=
 =?us-ascii?Q?5grU/QU6tepWhPo85/mAzKY6kxOH6FiH8NMIOyrNbizbB+sQBiqi0PCazuAl?=
 =?us-ascii?Q?JElaR+GZgpTtMwNfxo7AB+lrQYp7J05tsy4OAHJfkrBw32aW0p0IvjeaYdVi?=
 =?us-ascii?Q?Q1+6DubA/y25A4Ri22oGBbLL7x83RhAkkipMzBSr4pqXcjVnapliia1KgeIs?=
 =?us-ascii?Q?UOA1Oc8slAYUkZG6LAIqSIE5gIGRRUkSNxqPCVVjeQUNewk7nSjE3VtIpUuR?=
 =?us-ascii?Q?gnaM0xPmJoppQeL8+IAkXD82dvgV3W4YZy+5Vf41lKWkTPyCOVFQCHK6BJU8?=
 =?us-ascii?Q?9Syv4ep+yLqnD4dBKd/tpao8V01PexSmjBXlJtNAmwLtluf/6s43nTAYO7+P?=
 =?us-ascii?Q?qn+xxVIKmxCAMthhB1AhbV/e3xuPdZm34Jr+HwJjw9JLmXdiNyqFPSLoONIW?=
 =?us-ascii?Q?AqVXhbsZ7/eu4hLUVADTI62rAnFzEEG5WQQoAUCGTKrXUFhPXKwn9L7OTrlP?=
 =?us-ascii?Q?hvSIZ/JICjv2QUTFcmvMZLDEZPgnIPO/BvQO8SKb8xZY65nrOGHIBVdp24HF?=
 =?us-ascii?Q?PeV2AlOLJ2Qkrp0kqJVvGtriu1iScCMQ6U+XBhBrNCXKIwpwGgC78JHlsRmF?=
 =?us-ascii?Q?Qci0LcIfZqD6NGoBsX+7QP1i8SciSiZEYCb2Wf/3hg0tLQ74F6ZMhS0Fipg+?=
 =?us-ascii?Q?0qGqvAwYT/dmH3+CH8jITgaNsiMY8mDKMwikVWVANID1PwkqoT0k1zIpCXKH?=
 =?us-ascii?Q?yt8rdjo45JMNeTwB1Vbnp1eqhWfF+TIxzPO8nweYxAv+W30V/On3UMsuX3RX?=
 =?us-ascii?Q?Yi+qb+DtDFBsQK0DLJdrcEdE1fH3NK8KTr2OOKsTu1v0mXkMjjNGjV74IIHP?=
 =?us-ascii?Q?jRlyfbJ6203v1szTQjlQrnPqqBVSysDV3etJOByoRB+w1bU3JzvU8b3Y8K7Q?=
 =?us-ascii?Q?ObnxGDbvap0oKD5B6XZnB2ODBz5aScWErYZPY4tqUvSaIqPtGfnsffW5N3ef?=
 =?us-ascii?Q?uGbRE9pxbA=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf8e637b-d3ff-4ece-a613-08de9f7f1cf0
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2026 08:22:23.0016
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R+wORqEn1E8Z0z0sBlRDtzfK8+8mDSYjjUT7/PbB8RX5M9mvI4bwBK9aalcxMhvpkqEHsaw98IaIk7mXzFCWSA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7532
X-Spamd-Result: default: False [1.34 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36382-lists,linux-usb=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[nxp.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xu.yang_2@nxp.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:email,nxp.com:dkim,nxp.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 67B754381BB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

When the device is connected and enumerated by the host, switching the
role from device to host leaves an asynchronous vbus_event_work() to be
run. This can affect EHCI host controller initialization process.

If vbus_event_work() runs after ehci_run() sets USBCMD.RUNSTOP bit, then
RUNSTOP bit will be cleared. As a result, the host controller fails to
operate.

The log below shows what happens:

[   87.819925] ci_hdrc ci_hdrc.0: EHCI Host Controller
[   87.819963] ci_hdrc ci_hdrc.0: new USB bus registered, assigned bus number 1
[   87.955634] ci_hdrc ci_hdrc.0: USB 2.0, controller refused to start: -110
[   87.955658] ci_hdrc ci_hdrc.0: startup error -110
[   87.955682] ci_hdrc ci_hdrc.0: USB bus 1 deregistered

The problem is that the chipidea UDC driver call usb_udc_vbus_handler() to
pull down data line but it doesn't guarantee that this operation has
completed before the host controller starts running.

Now UDC core can properly delete usb gadget device and make sure that vbus
work is cancelled or completed after usb_del_gadget_udc() is returned. But
the udc.c only call usb_del_gadget_udc() in ci_hdrc_gadget_destroy(). To
avoid above issue, let the gadget device add/remove dynamically during USB
role switching.

To support dynamic gadget add/remove, this firstly clear ci->gadget and
ci->ci_hw_ep memory so the driver won't access stale data when initialize
and reuse these data structures again. Secondly, this assign udc_start()
and udc_stop() to rdrv->start and rdrv->stop, meanwhile it removes
udc_id_switch_for_device() and udc_id_switch_for_host(). The things in
them also properly be merged to udc_start()/udc_stop().

Since ci_hdrc_gadget_init() doesn't add gadget anymore, this also adjust
the order of ci_handle_vbus_change() and ci_role_start(), otherwise, NULL
pointer will be met.

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
---
 drivers/usb/chipidea/core.c | 11 +++----
 drivers/usb/chipidea/udc.c  | 65 +++++++++++++++++++------------------
 2 files changed, 38 insertions(+), 38 deletions(-)

diff --git a/drivers/usb/chipidea/core.c b/drivers/usb/chipidea/core.c
index 7cfabb04a4fb..95d9db159ce8 100644
--- a/drivers/usb/chipidea/core.c
+++ b/drivers/usb/chipidea/core.c
@@ -1191,19 +1191,16 @@ static int ci_hdrc_probe(struct platform_device *pdev)
 
 	ci->role = ci_get_role(ci);
 	if (!ci_otg_is_fsm_mode(ci)) {
-		/* only update vbus status for peripheral */
-		if (ci->role == CI_ROLE_GADGET) {
-			/* Pull down DP for possible charger detection */
-			hw_write(ci, OP_USBCMD, USBCMD_RS, 0);
-			ci_handle_vbus_change(ci);
-		}
-
 		ret = ci_role_start(ci, ci->role);
 		if (ret) {
 			dev_err(dev, "can't start %s role\n",
 						ci_role(ci)->name);
 			goto stop;
 		}
+
+		/* only update vbus status for peripheral */
+		if (ci->role == CI_ROLE_GADGET)
+			ci_handle_vbus_change(ci);
 	}
 
 	ret = devm_request_irq(dev, ci->irq, ci_irq_handler, IRQF_SHARED,
diff --git a/drivers/usb/chipidea/udc.c b/drivers/usb/chipidea/udc.c
index d4277d6611ee..d52f89489893 100644
--- a/drivers/usb/chipidea/udc.c
+++ b/drivers/usb/chipidea/udc.c
@@ -2044,6 +2044,8 @@ static int init_eps(struct ci_hdrc *ci)
 {
 	int retval = 0, i, j;
 
+	memset(ci->ci_hw_ep, 0, sizeof(ci->ci_hw_ep));
+
 	for (i = 0; i < ci->hw_ep_max/2; i++)
 		for (j = RX; j <= TX; j++) {
 			int k = i + j * ci->hw_ep_max/2;
@@ -2289,6 +2291,8 @@ static int udc_start(struct ci_hdrc *ci)
 	struct usb_otg_caps *otg_caps = &ci->platdata->ci_otg_caps;
 	int retval = 0;
 
+	memset(&ci->gadget, 0, sizeof(ci->gadget));
+
 	ci->gadget.ops          = &usb_gadget_ops;
 	ci->gadget.speed        = USB_SPEED_UNKNOWN;
 	ci->gadget.max_speed    = USB_SPEED_HIGH;
@@ -2327,10 +2331,15 @@ static int udc_start(struct ci_hdrc *ci)
 
 	ci->gadget.ep0 = &ci->ep0in->ep;
 
+	if (ci->platdata->pins_device)
+		pinctrl_select_state(ci->platdata->pctl,
+				     ci->platdata->pins_device);
+
 	retval = usb_add_gadget_udc(dev, &ci->gadget);
 	if (retval)
 		goto destroy_eps;
 
+	ci_udc_enable_vbus_irq(ci, true);
 	return retval;
 
 destroy_eps:
@@ -2342,38 +2351,20 @@ static int udc_start(struct ci_hdrc *ci)
 	return retval;
 }
 
-/*
- * ci_hdrc_gadget_destroy: parent remove must call this to remove UDC
- *
- * No interrupts active, the IRQ has been released
+/**
+ * udc_stop: deinitialize gadget role
+ * @ci: chipidea controller
  */
-void ci_hdrc_gadget_destroy(struct ci_hdrc *ci)
+static void udc_stop(struct ci_hdrc *ci)
 {
-	if (!ci->roles[CI_ROLE_GADGET])
-		return;
-
+	ci_udc_enable_vbus_irq(ci, false);
 	usb_del_gadget_udc(&ci->gadget);
+	ci->vbus_active = 0;
 
 	destroy_eps(ci);
 
 	dma_pool_destroy(ci->td_pool);
 	dma_pool_destroy(ci->qh_pool);
-}
-
-static int udc_id_switch_for_device(struct ci_hdrc *ci)
-{
-	if (ci->platdata->pins_device)
-		pinctrl_select_state(ci->platdata->pctl,
-				     ci->platdata->pins_device);
-
-	ci_udc_enable_vbus_irq(ci, true);
-	return 0;
-}
-
-static void udc_id_switch_for_host(struct ci_hdrc *ci)
-{
-	ci_udc_enable_vbus_irq(ci, false);
-	ci->vbus_active = 0;
 
 	if (ci->platdata->pins_device && ci->platdata->pins_default)
 		pinctrl_select_state(ci->platdata->pctl,
@@ -2422,7 +2413,6 @@ static void udc_resume(struct ci_hdrc *ci, bool power_lost)
 int ci_hdrc_gadget_init(struct ci_hdrc *ci)
 {
 	struct ci_role_driver *rdrv;
-	int ret;
 
 	if (!hw_read(ci, CAP_DCCPARAMS, DCCPARAMS_DC))
 		return -ENXIO;
@@ -2431,8 +2421,8 @@ int ci_hdrc_gadget_init(struct ci_hdrc *ci)
 	if (!rdrv)
 		return -ENOMEM;
 
-	rdrv->start	= udc_id_switch_for_device;
-	rdrv->stop	= udc_id_switch_for_host;
+	rdrv->start	= udc_start;
+	rdrv->stop	= udc_stop;
 #ifdef CONFIG_PM_SLEEP
 	rdrv->suspend	= udc_suspend;
 	rdrv->resume	= udc_resume;
@@ -2440,9 +2430,22 @@ int ci_hdrc_gadget_init(struct ci_hdrc *ci)
 	rdrv->irq	= udc_irq;
 	rdrv->name	= "gadget";
 
-	ret = udc_start(ci);
-	if (!ret)
-		ci->roles[CI_ROLE_GADGET] = rdrv;
+	ci->roles[CI_ROLE_GADGET] = rdrv;
 
-	return ret;
+	/* Pull down DP for possible charger detection */
+	hw_write(ci, OP_USBCMD, USBCMD_RS, 0);
+	return 0;
+}
+
+/*
+ * ci_hdrc_gadget_destroy: parent remove must call this to remove UDC
+ *
+ * No interrupts active, the IRQ has been released
+ */
+void ci_hdrc_gadget_destroy(struct ci_hdrc *ci)
+{
+	struct device *dev = &ci->gadget.dev;
+
+	if (ci->roles[CI_ROLE_GADGET] && device_is_registered(dev))
+		udc_stop(ci);
 }
-- 
2.34.1


