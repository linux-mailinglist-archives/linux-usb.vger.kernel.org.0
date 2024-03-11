Return-Path: <linux-usb+bounces-7794-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BEE4C877B17
	for <lists+linux-usb@lfdr.de>; Mon, 11 Mar 2024 07:52:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2258628237F
	for <lists+linux-usb@lfdr.de>; Mon, 11 Mar 2024 06:52:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8CB4F9FD;
	Mon, 11 Mar 2024 06:52:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="Mo965NQu"
X-Original-To: linux-usb@vger.kernel.org
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (mail-am0eur02on2046.outbound.protection.outlook.com [40.107.247.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 626FAFC17
	for <linux-usb@vger.kernel.org>; Mon, 11 Mar 2024 06:52:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.247.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710139935; cv=fail; b=TK+qHWYClDWrVOk+6TvtLpSNGD1koUx4jnnxJkq6gb8cbNCBpXrQfQFFmGKGU3WP/DRCVjqlBaQYTozGVLHhlqxyHOkPwygop046KJuTSq9GnzMHCgQfaLblXotaqH2aXYSDsm5jr74MdaIEsVu/f6F0FrbozUI1jQ49uzoNvpI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710139935; c=relaxed/simple;
	bh=3B0ob0P2kkKoVPo/r9rvedU150rQHMbpZkudZrDC9LE=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=qYJm/CBS/PieJn8XnOpWzTTusI0zjie+FJ+VpBB8Ux+YXiMCCKV/Cd8ChT6qNG37BYReKUByV8C8YcFYSakZ2/sh2dLg61haFFzTX/IxQMyK+x5hWvPTjB8VSjqCJkaqn90OFX6qJmjo8spchNJ5FBBDZl5PyBN4iLGGVGd4Mic=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b=Mo965NQu; arc=fail smtp.client-ip=40.107.247.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ME93sYVMmZq2Rgo4JHpjZEeX5MjTPlomfqMkVP2HQZM6nPrdwe6iQhkqhNsXLECs8hpPZjQbVUNBJUJr11KPUQ+Nn2ntJMNWkT8iTn9Ro7XlIEREB4NACMBTmrAEXiOb2tGsNYDvjGg49QaNO0K4tvd1jHZFlvkco4YjNgQkRUraBicEklfUVqCjXiVK/MMoj1XX+KfAFZqlBVDkbc4F+Rm4fsWv71DBVuZwqAJVopXSgMYmrkrwSiKWEa0NOx9Y6ub3HM7jgSnEDgX24VjlSRNZP3YaOhLylzIx91yv6cm99jZnmaE2ZdFZVk0rkY/ctMYvFT83ntynAADWS5Nz7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iikwJdY0YiqimEZ/jrqcQMGiU/Q31sV2HqDWBCi4EHI=;
 b=hPwESkRUdzCoGVnfi9d44tJ2iWyQCleZEFs3gvVzzRJ2opFUCJmqjx1rWkkhVoP8UyvebQCYOo5wHoZ74tsoNVi+N0RlsjX+rJ8P3HZlX0RDL54prdApIM8frhViRdGLtfOf+zlRcliNJi8I9wfSQZuEz2KzYLZGGuX2U305opGW0jxb/wOKGa8YTJTkSALxiwJFn7B8X+fM4W4SwME5eXg+x6GUEguAJOzV9uEm3lNfKXl+bS2AzHfcdyIH34zojn/MH9bK9rR2o56kbIdK/dhRm1Rxeq9si4k2YXZ4MHFhPwwlKG0oFU5AG6O20dA6CyToy8e7YiHMs1YO0cp/xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iikwJdY0YiqimEZ/jrqcQMGiU/Q31sV2HqDWBCi4EHI=;
 b=Mo965NQuqlC9oi09QHd1PkIfjv+vC+vzHHjgOhZ4GOPCO2ogKwUvuqBh7SVecwqvukmVivOszgJVPW9lvZw5xxuR2APfPqZb7LKqHJzHLRxf4xuIYITdPCa2+C5bMZ8uN1N0zySroYGIp6nESfaQTgLP3zolxxkC5VVtbTHHZMk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by AM0PR04MB7123.eurprd04.prod.outlook.com (2603:10a6:208:197::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.35; Mon, 11 Mar
 2024 06:52:10 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::d45f:4483:c11:68b0]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::d45f:4483:c11:68b0%7]) with mapi id 15.20.7362.035; Mon, 11 Mar 2024
 06:52:10 +0000
From: Xu Yang <xu.yang_2@nxp.com>
To: heikki.krogerus@linux.intel.com,
	gregkh@linuxfoundation.org,
	linux@roeck-us.net
Cc: rdbabiera@google.com,
	badhri@google.com,
	frank.wang@rock-chips.com,
	kyletso@google.com,
	zhipeng.wang_1@nxp.com,
	aisheng.dong@nxp.com,
	jun.li@nxp.com,
	linux-usb@vger.kernel.org,
	imx@lists.linux.dev
Subject: [PATCH] usb: typec: tcpm: fix double-free issue in tcpm_port_unregister_pd()
Date: Mon, 11 Mar 2024 14:52:19 +0800
Message-Id: <20240311065219.777037-1-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR04CA0007.apcprd04.prod.outlook.com
 (2603:1096:4:197::19) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|AM0PR04MB7123:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b0b9a23-1d36-41ad-82a8-08dc4197c643
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Uubze4bdHGizcJ8qZy7cmwi09hzyOVBDsBEfHMzZL1XgRnVnZnK5WUMdVgovHf60GIGV7OPu/soXLO3dzwD1vRkNrA3WcaFORY3uQOg+zxNHh2AfRB2F9Ibie8c5WQCCT2DUGCyI2vYS7R0OqaIHQCLFL8+9neyaA14yy8ay02cIF55i2Mn8kQ1ne/xvyGBKf4Iikekx0AAo/30nVnlYh3RPKRxYBb6EDpXHeFYG6QTDbIyNv7g8ByH0VGnk6IVAViKYkipw+hyyl+rd5Z6NlUS0oVyg6/ikRonpYXE1tabQqwbkh66ZxrVbUX7em25CdkhYJLYfYIBRh7oz+PGzmUjlKhEy32musW5njZAoI+rvj2hi3tKujSq/M7gX9rbi8cqq/orz/vXJ5nQEtjMj/l9qijispsHuDGtLF4h7Gwn8qysApzttB5IYz/ZADLqwvclEBSshgS6OamnwBXVm2Kc+IzGd2EcKRfkEmWT1H2icYYaIKSlUTO/Xw2/Vq1q0fonJRtYppgLRKe0KXHqzKt2HHYCRMPOU9GL24gGYiG4JMJRMsXahl4BP7t98LmD4rHOggqNji3vgEbbbxI1flUlG+ssCqoLBlrMV8kYSfFH0PBU+fh1vbSFm1Uc4MeAYJQL1MuWioCQ7NnzlrT58CPlE5VheR3ap2rMYgZ7m74dtIvP1tdWeVQ4VGDlZ8HRFNwDU4z7aQZcNvarGb/BLGog1RsZmD5s1SkJdznAA7Vg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(52116005)(38350700005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?mLCfugKLmMWUqQX0F84gQbpA4Ne4gOETY/63J6TO//A0GomiANOLzoiJpGk9?=
 =?us-ascii?Q?9wfLqRoGmSmhFZcqzAlPV+iif6rpw05jc8HJ23cxfCJuLH8TnF67IHZ/IAPW?=
 =?us-ascii?Q?KhvuAEVIkZIOyBeulq2IAN51QRD6m9hX+1qf/zedlCoeVptzJWbnKp96qPqO?=
 =?us-ascii?Q?cSvdnMAZ6MqsR7eMUeRuMhEZiwP8j0d0F/Sn3An+p8WBD74XEoLEAQvsVPOv?=
 =?us-ascii?Q?/e/Ugy4yTFaKhwMvuCN7Ax2rL4arYZPPJuVBjytuNtx+yhSeQPjjIXyvKz/N?=
 =?us-ascii?Q?A7w6NaYjkUu1DE8PtxHx8ULRVgdO0AiNfeSFPdbMQvvH4i+XJWpc9r+EjIch?=
 =?us-ascii?Q?0xWiBWlYK90oqw4fwaDFhf1mdeOdTPidnUdFDI12FMRxR0xjUK3BcPPUMk8l?=
 =?us-ascii?Q?gEVWiyPRp6wHJDIqhA06IHhHowBvQz12K0b+Ph4maNPontXq6L5xh/SRvpRd?=
 =?us-ascii?Q?55CNLiiB+kfhQlOo9gxYLVufuhNXkAfs10g3yZnIblJCXvxO82UDyw6BMGWR?=
 =?us-ascii?Q?Yqp/gwcILIYshtSiQ9bp48bk9lhUDcJ25Dnku6CnCIZhc6HXr6pgigi1/91A?=
 =?us-ascii?Q?8ICut3EEkIxfqYLMXXlsi8cizXrInW3ud7lRQZfJ2AFRXylZnozjWVLhZYeI?=
 =?us-ascii?Q?t2ay31/DwTHqmLk3tqf76Df0BS4ei7LyYgSSiglVpK8Zs/RAKSXx92unhP5E?=
 =?us-ascii?Q?dVe6l1dDGpf6f9nafMA1uJE6QqB5d5XtC9FAC1ANtCPA/75lD5EdaAK7KlIs?=
 =?us-ascii?Q?T/QRPf0KaOsyPA56K4JoGpHcxgQ1LidHqZnVBUaWbIIfno4R4vjopyhL7vBZ?=
 =?us-ascii?Q?Wxol5XTrAcfD6M8yDxyQokPQkYGM/V6ssyf3GRo8H2f8buEnulSduGlf6Dy8?=
 =?us-ascii?Q?bii6ud0IhMGpu+D54dED4ZQ93NvV4OanCl82Rx2H14D2PhuwstiaFIoMwnkE?=
 =?us-ascii?Q?4z+NQwkEiwfRJLIoS/rVMQ80c8+APz1JbYc+RZ8WZ7IyyryN1tvawYNZJM12?=
 =?us-ascii?Q?sVEe9ArNuojebkcM83hpNG3IeQYdVqDeuYwY+vn2L8Rskg84YIko/RJl5J/I?=
 =?us-ascii?Q?EmZHuv++noTKzTpLX/Pgm0WsnNSK2OpwIKQvh0LpL5CwZamwS26LoM5J1Xz8?=
 =?us-ascii?Q?l/0dRraKlhuB8oKgD0cC0FWcqLcD1mr0OUUneG/i73hzljSwAmCeO6aJvPx9?=
 =?us-ascii?Q?JrlDp3n6q9dpemYwTXlffeesVJP7rJzATwXArz8Id5lq/7iaRYKRT9nbHvLE?=
 =?us-ascii?Q?rh4utqiuO8fklsAQwfag0UZWaI9tJ3RSZapwgd4WQ0s8QmD4diMXD8tcXkD6?=
 =?us-ascii?Q?b/ZqgXOravwJefwsCM0BkjiqI3bPvfVZKTyxt6YfF5Q1IYJkALMpdZUQG+zY?=
 =?us-ascii?Q?GhTnKVjs+PFgEYINeNwz1bOJYAefeVKiTRawrExdnaCH+wCUHQ11eamVZwBe?=
 =?us-ascii?Q?CfgGEwR3ZAs9DdzxhZWdiqB54//oXVnvOQNbqY1iUXtgEcOpAnOx++XTslJx?=
 =?us-ascii?Q?yDMrOWlT+3jCXITcYRV04xmrYEjcITnDHd0cISAOv/TzjAc38KGz8+LAonP1?=
 =?us-ascii?Q?p0Yla0/FOCj9F+OCChzHdfdkFQ4wjNSVug/0Bp1j?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b0b9a23-1d36-41ad-82a8-08dc4197c643
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2024 06:52:10.4753
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IOwlSlO37N2EKVfRczgr6IGZr6I0o8I2CtUiOHN/BgE+IvYDgOrwz2nEtISBSWSmF0domCcTQpHRjjF9HbsQlw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB7123

When unregister pd capabilitie in tcpm, KASAN will capture below double
-free issue. The root cause is the same capabilitiy will be kfreed twice,
the first time is kfreed by pd_capabilities_release() and the second time
is explicitly kfreed by tcpm_port_unregister_pd().

[    3.988059] BUG: KASAN: double-free in tcpm_port_unregister_pd+0x1a4/0x3dc
[    3.995001] Free of addr ffff0008164d3000 by task kworker/u16:0/10
[    4.001206]
[    4.002712] CPU: 2 PID: 10 Comm: kworker/u16:0 Not tainted 6.8.0-rc5-next-20240220-05616-g52728c567a55 #53
[    4.012402] Hardware name: Freescale i.MX8QXP MEK (DT)
[    4.017569] Workqueue: events_unbound deferred_probe_work_func
[    4.023456] Call trace:
[    4.025920]  dump_backtrace+0x94/0xec
[    4.029629]  show_stack+0x18/0x24
[    4.032974]  dump_stack_lvl+0x78/0x90
[    4.036675]  print_report+0xfc/0x5c0
[    4.040289]  kasan_report_invalid_free+0xa0/0xc0
[    4.044937]  __kasan_slab_free+0x124/0x154
[    4.049072]  kfree+0xb4/0x1e8
[    4.052069]  tcpm_port_unregister_pd+0x1a4/0x3dc
[    4.056725]  tcpm_register_port+0x1dd0/0x2558
[    4.061121]  tcpci_register_port+0x420/0x71c
[    4.065430]  tcpci_probe+0x118/0x2e0

To fix the issue, this will remove kree() from tcpm_port_unregister_pd().

Fixes: cd099cde4ed2 ("usb: typec: tcpm: Support multiple capabilities")
cc: <stable@vger.kernel.org>
Suggested-by: Aisheng Dong <aisheng.dong@nxp.com>
Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
---
 drivers/usb/typec/tcpm/tcpm.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
index 3d505614bff1..afbb0d832db2 100644
--- a/drivers/usb/typec/tcpm/tcpm.c
+++ b/drivers/usb/typec/tcpm/tcpm.c
@@ -6940,9 +6940,7 @@ static void tcpm_port_unregister_pd(struct tcpm_port *port)
 	port->port_source_caps = NULL;
 	for (i = 0; i < port->pd_count; i++) {
 		usb_power_delivery_unregister_capabilities(port->pd_list[i]->sink_cap);
-		kfree(port->pd_list[i]->sink_cap);
 		usb_power_delivery_unregister_capabilities(port->pd_list[i]->source_cap);
-		kfree(port->pd_list[i]->source_cap);
 		devm_kfree(port->dev, port->pd_list[i]);
 		port->pd_list[i] = NULL;
 		usb_power_delivery_unregister(port->pds[i]);
-- 
2.34.1


