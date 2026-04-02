Return-Path: <linux-usb+bounces-35836-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aJ/zCckYzmmnkgYAu9opvQ
	(envelope-from <linux-usb+bounces-35836-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 02 Apr 2026 09:20:41 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A4B03850C2
	for <lists+linux-usb@lfdr.de>; Thu, 02 Apr 2026 09:20:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 45A8D30A848D
	for <lists+linux-usb@lfdr.de>; Thu,  2 Apr 2026 07:13:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B467388394;
	Thu,  2 Apr 2026 07:12:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="hDBMscgn"
X-Original-To: linux-usb@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012060.outbound.protection.outlook.com [52.101.66.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A47838759C;
	Thu,  2 Apr 2026 07:12:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775113978; cv=fail; b=Bf0rtmJqj4xTcgxEWJgJJW8y2HCUHmoQ5JtmzsJg0GHF5RQ3TsC7YiObyiPC91gXkr3a4sNu4XRxYPDHBpwE0uYR8WEX5hojXpW6qp/dSpcDUD/GzjcMDNMrQxanU+xrCRkIjacQw0PUfeftOOcF8+sj47GWKdyyJ6E0k3ZmJAM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775113978; c=relaxed/simple;
	bh=2jMN0lUuVhngz7chv6lU0CepW9MOHMDq5Fg4AxCD/S4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ishznD8leuLLBGroRoNNewi11Z90SdEOtfRLOOBPj9XzLRBQ3MNT4oR0cOgMblzx4xm6PO1e7fPBNWuIVgJtVbhOBcrGNdXFmV9ysifOBUtRTlOyLEpX/LrVJCpZbBxjjqMIkMJqbEXl8cvWG9vRHS/o82MI2t3hSOTBGz5uRHI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=hDBMscgn; arc=fail smtp.client-ip=52.101.66.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=urSkv53imTylluk4NNwcK1sB4j909vjMV4eQ1zH4uVLhsRrm+DmXMgy+36s1TdBZ5OGxJREIPDeJ8LdHBuxBrQDbkYwrUoh7KU5pcG51xm85YaY6romsIeGRYlI+9+DRypH8kvq2uageuPfvZUtKnQLgIwjnO1xHzHdxfKwUFr6CoAoTQQQe9BkZh8syoFHmDTTrKnJ3nEUIn0FpODT1mQE5uUHbzsy9QyZPu9gGJyg4AzW923jShDOMWRy5FMUowANXeKOXWQbK+CFkSq02JwYqEaFj4kuhbUhXu53cLeP6Ajxg1n+u5odOvz6sFRelNdw/E0WA3FWtwKv8tNIqkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F7Fz1Qp3sCsRXr/z31qGEeR0IznvyPFc3ICwOJn3oDY=;
 b=hsgEOLre7kQ93XxwOcxOO6/Xede/q15Xea0KCxHcbUs8nv5mBLu+JYRPfadHgSPs7sgXO0Lpywn1qeTg8xMvp2U2iJvVJqdT9GJZZSsPZ9VMpMf1JGz4D/KE/2NA4DC7gAXKMjLVfqQdjzD7LhJSevsySa6qKqfJZlcEaWXQgkh8nD0Rorkr83cbEPxBz52029VHbjk6mrMfF0+znh4Plo4qroxzEy8ZC0PDkUHkXTpq4eelT6wOUD+G+AJ/Gi1dMnJLwwb5bdQrkALR3NhT1fLJ4V0kGwQ0jDu3WoMldb0U2+srmtFPXXODtfWfGT9bd+BNo6Wsxebb6w1c2ZdsVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F7Fz1Qp3sCsRXr/z31qGEeR0IznvyPFc3ICwOJn3oDY=;
 b=hDBMscgnqMpzSU9CbNRvlnfWBVZXJI1QlwRS9tOEGmh+MBczZKDXzvOZ8cqTZ16SEGRRm3VF9AaEQHeW+CMjjbjnXCaWk4UcRCrxOUcihnRk8jd3l6u2eVu4mN4HFLj2o3yUd/kKzp9yqVU1lCULF1MGxjSnS7yuK35IX1uw3+5kBnwoZMBuzy6i3UCOFd1OSCU4oBnvtkCdBM6LbqFGcL3Py3bMCjDmaU6RrlsiqTbnTKsSY0vntXNwfNnCBO+Bq0Bv1Ua6ZsS+Ce062bDmOiCCmYpnfhw0S6uHgb/N0L16jw2HnhvhnRB7X44acHgSIaDVNJON4+svCliS5eItbw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by AM9PR04MB8761.eurprd04.prod.outlook.com (2603:10a6:20b:408::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.18; Thu, 2 Apr
 2026 07:12:55 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::c67b:71cd:6338:9dce]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::c67b:71cd:6338:9dce%5]) with mapi id 15.20.9769.016; Thu, 2 Apr 2026
 07:12:55 +0000
From: Xu Yang <xu.yang_2@nxp.com>
To: peter.chen@kernel.org,
	gregkh@linuxfoundation.org
Cc: jun.li@nxp.com,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev
Subject: [PATCH v2 2/3] usb: chipidea: core: allow ci_irq_handler() handle both ID and VBUS change
Date: Thu,  2 Apr 2026 15:14:56 +0800
Message-Id: <20260402071457.2516021-2-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260402071457.2516021-1-xu.yang_2@nxp.com>
References: <20260402071457.2516021-1-xu.yang_2@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA5P287CA0025.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:17a::15) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|AM9PR04MB8761:EE_
X-MS-Office365-Filtering-Correlation-Id: 401548f7-39af-4742-2745-08de908742b7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|19092799006|56012099003|18002099003|22082099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	rie1XOl7urCrRxkZHKzv2HcPqt8lfoDmv7DI9h1MWEhBiSCPN8oZ1ZwN4Y78eJ4X2ltATrRsZGTFiCVlenBDfEh4Pg137qXnJnrOI70IHViXUSwMdiJe1e3a/wPcoCsoTsdYGclR22fiGgATP2Qb+n2HqkoRtvezAphPIElrQgAZjfg0HZWlCq2IGkXk96OojeN9sn10dvaZo6ASEt41+dRAFWtCQ1+Qo2vGRCDAi/9iY/Rzf4GEnwfOZzHmD8Cfx/qdcGyrak5MUhJHY7VxLewhUyeeLZH77uWM05Q1OiiV1EguP9efhKoLDtoSL9c3Vept0AiVvgJZShdzU33bygJF20O7WgnY/XM604WiP9MzzA2FUSRXpH1rca935EkwFcGkkhmWv2muyyIlMsscYZW24R1aHadSGHRvHuGAznYCrnMh5WdthJayF10sQ8EG6C0Dy7IWMRNd8Y5ArKM0d5CQ8+HOOCgplv67n/Qs/XU22KlMi4w018mlhN8a1UYA34MI0rRn9RuYkWItedcTTbpHehqqCmo9k06Op2h1pnSbmyLyChtHxp4fe/wDynYinL6O1bm4Kf0gAFHBTSnu90axotgBubboq8Ad+BMmenGNfErnSwS9CFbf4yJDN7Sw56XU6sido9amKjnU2LR3qPsTfTzRHiw5fRdQK9vcGVvlXLibxtwtwmG/eSG8BUY3yKl/VrJPnp740vlypganWTNNEq+HEc9xKHwYxfam5yiUHt+cWD0kN0klfI5u906a4Nx2hFixPUuzQmngu01uhcxvyZPAYGUI+EDpCEATjuI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(19092799006)(56012099003)(18002099003)(22082099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?3QOCbDCDxODfVf5Ot9vQip411AzPgHlmgPMKW+RutFL3seqEoVShMi6L4GXg?=
 =?us-ascii?Q?3xbScQtHV1n4yaWEHishMKw5UXRZ+fxdvQVz7nF4nBm71QMvUf/zIg9aYdr3?=
 =?us-ascii?Q?kgocNTX90XRx3s6O45OydWpWo/cx64WeK6hbAFJj/qGYVF9U9/F0kl2bPb7H?=
 =?us-ascii?Q?KqSnNwXr35AKBjEYuzzz+Tw3o6JpcOU7pZKswLDvSrYfqUA39fB26f/Pnlon?=
 =?us-ascii?Q?AsHrFyPgcemEbyqT7ZgmoTqUCW+5OiGsQbzqp95+7Em41mJQhQR1d1zT7zN/?=
 =?us-ascii?Q?SmDDRi1Uk2KHxshrUO98XmkV7Xb6ue84FsmRjFs7juytlQ77QZ3POPbRvq5V?=
 =?us-ascii?Q?EsGnA1+cOrpzoj6U1h0vcOyrp37Y39WbsjN/l1elk7aVLGVRdg0+4dtpglit?=
 =?us-ascii?Q?1dibwoOOsydTKn+5/wlC6eNA1XDM/39K8M/qMjyUI2SBcOLucLTF8OQeR9Ol?=
 =?us-ascii?Q?RHgTLgboXYc5AX6pwn8WKR0OTC9NzJRyVXMPi0k/hpgPflISFFGWw7ucfmU0?=
 =?us-ascii?Q?pL7VkBFH7QvefuyZQl3IXEM7mH+36Uur7qhqQxlEmuXBtTfBH/4EJGNHzsgk?=
 =?us-ascii?Q?thD8YnLDb2RIik0PGqK+H4Rj0MGlsrALlYWxL9yPscIpxDQWfJlGeQdSWKJg?=
 =?us-ascii?Q?d27RxCFlwQqHGhsGvxuxuorT502JQNOffIUuw1C/uarQbDRBzBxUbifTawhb?=
 =?us-ascii?Q?zFcdDc1vpIyh3K9zvtBHeYldDzSYb4q3IHk4BNMD1XmaaMuez9XXQBcXsZad?=
 =?us-ascii?Q?/7bC0dgTDKabsr0s6SjdrqEkd3J2CRk16LNt/NXYjyIu+YbcoMtUwciXciPi?=
 =?us-ascii?Q?mu1JOwCFpmYX7DeNet2zMUaojPgjejTMT2bvebOTJOL39RHR2DHI/+2DEWcq?=
 =?us-ascii?Q?YO4pVFY11KlqiieZYGx7QRqUE9MX5/ruoN7ok1++8Jg/YP9G9ncV/2sYcN+g?=
 =?us-ascii?Q?rlUJYONAQNSzR3kThEwTY8a87r5SFBACatuGIytjih40OF7Cjibq/tru+2ax?=
 =?us-ascii?Q?Lrh9tXdpRKi0YzO3IyVGg7yAwM9tXTaQ5a9berQ6VJvaXdGNpRKs+j0hOhEz?=
 =?us-ascii?Q?DaxXGamvSVfS/uDike2Pzl8MvW9oSj07FNqn+kvn/wSaTSCdKnpmWR4vEdVS?=
 =?us-ascii?Q?bQJ7XY+NhkR/bN3rK+VzretyDCuG2zywEETHZfgErvy6B1VX8qHc7ePbyjES?=
 =?us-ascii?Q?bHpRJ117otAPH+ZAeJZyy725ck2R4qSo2G1pS4JMS2XkmU4U+PZfXzWXKOgL?=
 =?us-ascii?Q?PNXxK9G4o6Y7DDd/84QsWgdRAGkFJU7QZEXQmJpRWNbmGribe8ixb/nqo8cC?=
 =?us-ascii?Q?mGkirIBf5Bcw8vw3YD9sXvjJPmGGYIQ4iBwVY5sIs2qX2RtPj8mc/g7me3y4?=
 =?us-ascii?Q?Kq1Fz4YpkctT9OvVL5nL05o4V+2R+RYMD18yPn1Hs+g/dnIFXLszJ5RmVsVO?=
 =?us-ascii?Q?UoMD1teoffzVpi0ueb0R0O9kIZzrVy+i9mq44nLxdsmVsS8xxFZswNC+uAta?=
 =?us-ascii?Q?phefmJLE/yffTQkFTlGZLg1+1/jy4EqQbJpMkuxQzVN0pxUzlXCzexSw4rKI?=
 =?us-ascii?Q?q3m+UifqMicAb5XcYFSvMNFhbttIPuyj5ZGHBXNM7uW3kYAThGp8k+cpiipo?=
 =?us-ascii?Q?QfukybKR2yh5sWgLxByTw9BGqX20Ou2XY+QCQJoQMC5lNBDNSNsFc23BgXq2?=
 =?us-ascii?Q?CvqxvGeJ09pXMQDGiuJ2nE+UYt04iHYZyQLVvigboyI3wxgecXbql74FGJTn?=
 =?us-ascii?Q?zLKfIKlVCQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 401548f7-39af-4742-2745-08de908742b7
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2026 07:12:55.0274
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SgJpgUOVQYqpVwRt+M+0cvOjqXMIh59iVpHj3h7Wj27/7JKpygyPu4qP8qwSBZiV8/5lp4Dcf5nNS1eGebmaPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8761
X-Spamd-Result: default: False [1.34 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35836-lists,linux-usb=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[nxp.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xu.yang_2@nxp.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 7A4B03850C2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

For USB role switch-triggered IRQ, ID and VBUS change come together, for
example when switching from host to device mode. ID indicate a role switch
and VBUS is required to determine whether the device controller can start
operating. Currently, ci_irq_handler() handles only a single event per
invocation. This can cause an issue where switching to device mode results
in the device controller not working at all. Allowing ci_irq_handler() to
handle both ID and VBUS change in one call resolves this issue.

Meanwhile, this change also affects the VBUS event handling logic.
Previously, if an ID event indicated host mode the VBUS IRQ will be
ignored as the device disable BSE when stop() is called. With the new
behavior, if ID and VBUS IRQ occur together and the target mode is host,
the VBUS event is queued and ci_handle_vbus_change() will call
usb_gadget_vbus_connect(), after which USBMODE is switched to device mode,
causing host mode to stop working. To prevent this, an additional check is
added to skip handling VBUS event when current role is not device mode.

Suggested-by: Peter Chen <peter.chen@kernel.org>
Fixes: e1b5d2bed67c ("usb: chipidea: core: handle usb role switch in a common way")
Cc: stable@vger.kernel.org
Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

---
Changes in v2:
 - change ci_irq_handler() instead of assign id_event/b_sess_valid_event
   as true and queue otg work directly
---
 drivers/usb/chipidea/core.c | 45 +++++++++++++++++++------------------
 drivers/usb/chipidea/otg.c  |  3 +++
 2 files changed, 26 insertions(+), 22 deletions(-)

diff --git a/drivers/usb/chipidea/core.c b/drivers/usb/chipidea/core.c
index 87be716dff3e..7cfabb04a4fb 100644
--- a/drivers/usb/chipidea/core.c
+++ b/drivers/usb/chipidea/core.c
@@ -544,30 +544,31 @@ static irqreturn_t ci_irq_handler(int irq, void *data)
 			if (ret == IRQ_HANDLED)
 				return ret;
 		}
-	}
 
-	/*
-	 * Handle id change interrupt, it indicates device/host function
-	 * switch.
-	 */
-	if (ci->is_otg && (otgsc & OTGSC_IDIE) && (otgsc & OTGSC_IDIS)) {
-		ci->id_event = true;
-		/* Clear ID change irq status */
-		hw_write_otgsc(ci, OTGSC_IDIS, OTGSC_IDIS);
-		ci_otg_queue_work(ci);
-		return IRQ_HANDLED;
-	}
+		/*
+		 * Handle id change interrupt, it indicates device/host function
+		 * switch.
+		 */
+		if ((otgsc & OTGSC_IDIE) && (otgsc & OTGSC_IDIS)) {
+			ci->id_event = true;
+			/* Clear ID change irq status */
+			hw_write_otgsc(ci, OTGSC_IDIS, OTGSC_IDIS);
+		}
 
-	/*
-	 * Handle vbus change interrupt, it indicates device connection
-	 * and disconnection events.
-	 */
-	if (ci->is_otg && (otgsc & OTGSC_BSVIE) && (otgsc & OTGSC_BSVIS)) {
-		ci->b_sess_valid_event = true;
-		/* Clear BSV irq */
-		hw_write_otgsc(ci, OTGSC_BSVIS, OTGSC_BSVIS);
-		ci_otg_queue_work(ci);
-		return IRQ_HANDLED;
+		/*
+		 * Handle vbus change interrupt, it indicates device connection
+		 * and disconnection events.
+		 */
+		if ((otgsc & OTGSC_BSVIE) && (otgsc & OTGSC_BSVIS)) {
+			ci->b_sess_valid_event = true;
+			/* Clear BSV irq */
+			hw_write_otgsc(ci, OTGSC_BSVIS, OTGSC_BSVIS);
+		}
+
+		if (ci->id_event || ci->b_sess_valid_event) {
+			ci_otg_queue_work(ci);
+			return IRQ_HANDLED;
+		}
 	}
 
 	/* Handle device/host interrupt */
diff --git a/drivers/usb/chipidea/otg.c b/drivers/usb/chipidea/otg.c
index 647e98f4e351..def933b73a90 100644
--- a/drivers/usb/chipidea/otg.c
+++ b/drivers/usb/chipidea/otg.c
@@ -130,6 +130,9 @@ enum ci_role ci_otg_role(struct ci_hdrc *ci)
 
 void ci_handle_vbus_change(struct ci_hdrc *ci)
 {
+	if (ci->role != CI_ROLE_GADGET)
+		return;
+
 	if (!ci->is_otg) {
 		if (ci->platdata->flags & CI_HDRC_FORCE_VBUS_ACTIVE_ALWAYS)
 			usb_gadget_vbus_connect(&ci->gadget);
-- 
2.34.1


