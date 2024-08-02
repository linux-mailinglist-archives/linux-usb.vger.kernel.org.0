Return-Path: <linux-usb+bounces-12873-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E94F94581A
	for <lists+linux-usb@lfdr.de>; Fri,  2 Aug 2024 08:41:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ABA311C229F3
	for <lists+linux-usb@lfdr.de>; Fri,  2 Aug 2024 06:41:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1314046B91;
	Fri,  2 Aug 2024 06:41:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="As8E9WBW"
X-Original-To: linux-usb@vger.kernel.org
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (mail-vi1eur02on2050.outbound.protection.outlook.com [40.107.241.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 552262C9D
	for <linux-usb@vger.kernel.org>; Fri,  2 Aug 2024 06:41:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.241.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722580900; cv=fail; b=Rd5YvV/ZDUI9HZsMLD6+XNT4GKPEUTcgMmE/EwpNTBeE3CPbfKOoK0wV07FsSqVVrad5CBJvNbxz4iICsMun+9ARO6/rZ6KlsxHsoeHt4/Vy6xLsc353ozwNaHCAv2y2sJO1CcOltf/Mf02oYcc67w89kw5yq9AczfM51qJsjF0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722580900; c=relaxed/simple;
	bh=TQclZveqVPecEc/y277pfyqqYWyKPDrypt4vCALTAEE=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=jWWpfdS+UpWUvD0kJynPPY7wbLWzhMNeVNxfoQZ2DAEvN+e6V0huhU0GKzduc9IMBKpKDeNsTWSjt9tSfI0mZcx8NtXs62S59O94gAr0JMUi4AxpJ0Mxovwht22+quDe7uYw+BqDYJuXB6qPzqd8IlpmmEWcLKEtKUNA9yuEC4E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=As8E9WBW; arc=fail smtp.client-ip=40.107.241.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TGH4VCegNliYnKtI+MpwS+kCLYUC2YrC/JkwKOwWqEli7Oz/evahQE4PeDRdUc2bq5VobdhjOBOByTcQ6cQuAj0AfLGyXwj8B9GdCe08EOLWZyPn5OTrANxBi4u91/Vf2qgFkXn/mbppAjYPPZNNqt5rcPiVim6EWEWkMF6Xnw8k4mPJf9Wnx6cwPhmG38N0sGDeleU9wWz9yuewFM59gOJUytxJVh8vqSusxJogKnUmibCQOMXJLd/ypaYy2zgx3sOcWg7mqSSRQp4jUXdgAGt498Ym87KAXCqSsceBxPEIH+aE+zD1oK8OX+SsxAB8xr0wv2hWrj/GrXfI4/FQQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ItpeDekfNvrLKLD+YESZthM0WBsbldC7HQ0hJocnjZY=;
 b=Fuf00aDVHdMFPX25aBrJM52R2FPz/FWCSk7Akvko1QOUGAO4wjreHisyT+mCmn9dcDMmrrVdT+VaruDvUOb4wcjPH4VgXa9jjxrLv2x65o/IZxyKi6S2Zgg+iH+C/cfQZVMR+rxJE3fBnSKL6UPzEAbkyIV4AElTkjBwV7e+ZWR3QSfLN80HSXgk7k021/Eg8LWhAe+fSv0ugpD8qK4K76HX7mq7dnkEqp9w8yyCZA+2FI/h4B7Tv4/2YtcEpYQDlXu2LpM/29Yd/6+Lq1lMRTWJiZ+ipC8bjbN4oKDrzJQ9TjCDzfiKvT9zmBzTUT9bSg7Hbmxnl+W0EbI4eAuujg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ItpeDekfNvrLKLD+YESZthM0WBsbldC7HQ0hJocnjZY=;
 b=As8E9WBWmZZZpuoJzI8p3zU5jXqvaU/4WK25xnGZ9NBshueHl3rdpM/p4eXSTNNRLrCMibnrjNoeTnuA9TCrsV4sMqRYBwo4YoE0zxWLmP4Fgf0U1BOfETj2+CitawfVNZ2xPl+BV523TZxIqibW2zKfqNbgULTCwkS6va1oFzWoZnzvR9oMr/aAYTKOsDRWmpex7rHYPJc0HivTZJOY29/24ajcD7cMFZEDAn09CM1AG77Mc1//35PJyRfkzYKlNrJf8OvF/BeYBEqaOdYBAGGFPC5VkIFgJAdY9ZUJiSpCljegPVYjhK7IO8PQHEgi1Lfoj2z93CZk/7Gh5Bu6Ng==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by AM0PR04MB7171.eurprd04.prod.outlook.com (2603:10a6:208:19c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.23; Fri, 2 Aug
 2024 06:41:34 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%5]) with mapi id 15.20.7784.016; Fri, 2 Aug 2024
 06:41:34 +0000
From: Xu Yang <xu.yang_2@nxp.com>
To: heikki.krogerus@linux.intel.com,
	gregkh@linuxfoundation.org,
	rdbabiera@google.com,
	linux@roeck-us.net,
	badhri@google.com,
	kyletso@google.com,
	sebastian.reichel@collabora.com
Cc: linux-usb@vger.kernel.org,
	imx@lists.linux.dev,
	jun.li@nxp.com
Subject: [PATCH] usb: typec: tcpm: avoid sink goto SNK_UNATTACHED state if not received source capability message
Date: Fri,  2 Aug 2024 14:41:56 +0800
Message-Id: <20240802064156.1846768-1-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0017.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::10) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|AM0PR04MB7171:EE_
X-MS-Office365-Filtering-Correlation-Id: 8582a565-9d84-4543-9d65-08dcb2be26b7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?9jg2CurhfVRNTEmA4eRQgOhfXiIueYEU7NNY3vH1lMe3RQGqoRw15LrNRLOk?=
 =?us-ascii?Q?KztSF/DCrueEGfwReLJT/gVaXh4O6IJlnSPtQ6s9iqWU2GPksZiCYh8BGRqW?=
 =?us-ascii?Q?R5l7kE1AaR8DMIEZED0pAFGxmTUOYUoSA9oyrmV0X4cGXGEiajapt0jS2EeP?=
 =?us-ascii?Q?5VIZNZqCKqF1qGwBERt7umwUSHsGkWbsRGEI5mhEVOoUx4aAJEfc1IypHiZm?=
 =?us-ascii?Q?z4l+vMRwNttSmXHX63hmbPTssjyFKyPp7jxRwhxaasDCwOngXbljAYmQrQBi?=
 =?us-ascii?Q?lJhhfQM0EU4axJhPQgSTlqGQdsX36qWWczII5YJ9hVUA8E9GSIYCq0ssQjcV?=
 =?us-ascii?Q?OqxgXPgYGLLJ6rCfbvT2DcWdUKGLKKDwvRsQ6xMsi641rG82nAoIcIZKblyr?=
 =?us-ascii?Q?UN847SrntjltUIsv5P+R+L30mD8GQD2+8KfMzMlV+0omxweghXcx46F9Bixn?=
 =?us-ascii?Q?Vu8rLSUx37Fjg1FoBCf6R8AFKNSfWzhFovr5zhGH/uDSSlSbRx538Z7oGt4i?=
 =?us-ascii?Q?dQDi3UvREar/K0302cPKRd4XAB+ZqkS/JIHpIzj7emDoaA7u52evFxGkDUeP?=
 =?us-ascii?Q?FlUlsLRGzKi9frBCdTuwzj7U4xYJFd2lLnHeofnIv8ESNzFizjlCJyjqTenf?=
 =?us-ascii?Q?MRq7tXJ2VyaH/AZ1wx6jJbuP0SelFrpesLmTHSnYW844LmG7FtrDGYg4p8OU?=
 =?us-ascii?Q?o3KvIP4NCAm7IBgvRjotftTzZ0p33FJulrrtxd6pb6nmwUFPT6W67RwxNR8I?=
 =?us-ascii?Q?7cXaRCE+KQ8/tkxM2ChhDrCtTBJfgWvYOjJdiSns11rjYWbnyoELEjz7PnE1?=
 =?us-ascii?Q?4ya6cqcgyphmb4Tnsmzn0/UxnsD8kWW/xG2aAjBkj+Q6CVlrayAEEpwoGcpn?=
 =?us-ascii?Q?ciGa3pa3O/nxmV5Xa3dLFY6RQ/VS1b1+oqhaVrxy/vSJ9bLJY50ZMDDm4VaW?=
 =?us-ascii?Q?BQJ6yOlXkGc4x311hHD7dwPs7+qvQSRW/7fGD3vdPvoQefIRd0PMTVQEGXdp?=
 =?us-ascii?Q?OUV+W45HzBNGz69kUyCMFKfnxKQrPr4Bzkf1Nlh6GfSgBgoyZZMTKB3nIluS?=
 =?us-ascii?Q?v8D/YluYQBlAjkiw7lf6iL0v69bPTu2+rLHu641PnPkC7WEu8EzYpwNaZGlk?=
 =?us-ascii?Q?IWUxikNxTQ2XSV1Ybb9Q50MAov21UjNT/Zpc9S2p4XpYK88t1uOOEJZmeoNX?=
 =?us-ascii?Q?aVETwoM4J5Fv3arrqUUTYy2VrZdIY3naJmtHdDcJZjaV2KoyYsuuO4TMB/49?=
 =?us-ascii?Q?EbMbQHgVIFJnE0ILhEGP6yyrBtidQ9yoLF63aheK+/mdoi5vIRANGmEL3fAq?=
 =?us-ascii?Q?DxUHeuHaYjwcIpaAXLMmUV+37tY4hjZBhNjMB2zliUx6HO5ZbhtVA+I+kRKL?=
 =?us-ascii?Q?kFDEDwGbA2NPTFoThIUVxhWeyJ6wu9Fqb7BE0R0cwvPzTN22/A=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?5kNBuNQR6X+a3B6jTO04jiQtwtVTVskh/iqQVlqugEJwLHIIZOHewHVKhVpj?=
 =?us-ascii?Q?+tm/4v6U+p/KOhvS8M40+nZM5+5VpAh8oscNCfmKKHXeN4jUlt7QuoPZ6RaX?=
 =?us-ascii?Q?W59+TpmDMF2x46cZE57KaEKhKcSStV8OEhpyxZZD5LArG7V1tPMdiNauYke2?=
 =?us-ascii?Q?679+chp7hrFVZ/YTlLAEez6wte+fHUn6l3iDV4RWqzfhspV7z1xf6kbvwbGj?=
 =?us-ascii?Q?i3wnS9N8dtVz7undRCqBJaia0XAqLJQF+9V81weOzGGfxJ+oBo3k5BitGkzF?=
 =?us-ascii?Q?tejeP8oL8Sc+qzd+EwgSynVJydJETDYKDpBcVNSMiEYN5jgqDk3AUT20EZtC?=
 =?us-ascii?Q?ckDCBcwO4QYEzIpfigLhpgJN32O5HbQ9TM4Dd6d5imvOeWvsYmDZgpeIgGlf?=
 =?us-ascii?Q?hhv5kA4towSBnBt8O4EZpJfV6wJKHAjP1SfQMQiDH4ndcGBYXwttFXoLBy0A?=
 =?us-ascii?Q?Wrf2aIMP/VoPSgT9zAM6QyP3skDnJJtjYs4Lp+j4RZXjqz0RWO5108LaW6F4?=
 =?us-ascii?Q?nnQSBO4+8oHlq7lGHSUkzIGZsQJo5DRiciw9YoLgYKCKoQ/qfCRB+VSIDKyA?=
 =?us-ascii?Q?GYRWpO4w7h75aVdWXdOf8ImE9INWB5ScVutsnvBzA7aTwRSwLle2OsDHMS8n?=
 =?us-ascii?Q?VDsdAQyffE9aGfSGQAuVYt//ZLQt4VxgQ/e3krCZhYq6CPctAPM9Q0OkGagq?=
 =?us-ascii?Q?hx5JCgEkSzn0LyQJRl6GoBgfRaGPTg8tlqFDzVTWcDVvvCp6j2WUsHCyl6CL?=
 =?us-ascii?Q?20IJEpihQox+mBZrhj0WiAlRW7Z3OYkG4hhBx/R5N9BXP8UuQ2sec+d4V7BE?=
 =?us-ascii?Q?+Hb9X/4IJ+fVqXGQjq+cgQKCwh7DX9ArK21eSjei44cXwIit9pbiqEGhLxVv?=
 =?us-ascii?Q?pWQO6dVwvWNrMgqRfkNfH85h65KI4Qc2QCtLe42pAccb1NYDGLKdidMSFWk7?=
 =?us-ascii?Q?7U/8whPQsCTY1VyNjMN94rGxFfNnX90/7utth6u6lHpgmovJItJAdMW+ggle?=
 =?us-ascii?Q?zYu2t+8264Z5Rb5EftcD2cr8KpnkGN+/cLgUwrSY7tbqbW/qYuItdn7053us?=
 =?us-ascii?Q?FACaNXcnnOLCl1XlmpZIeVqEq6pfG+eDVrD+YYPaWECjEynAp/Xa73P6NdZ4?=
 =?us-ascii?Q?T+Dcs57W/0nlD+pXTKeAgT5GLrtvulibiF2QrMFa31QpkpYOySPh2C/0fzIp?=
 =?us-ascii?Q?gujZNjEcTwf88erhuN8XI+Okyzp+HqHSRsV36yCtk6eMcYlu/AyRSyZJENfi?=
 =?us-ascii?Q?xQHkwfVSdNlR5OqSnVdXxUlxalH3wRu1aDVGG/NGcxSa1upoCWRhxCtJRi+N?=
 =?us-ascii?Q?rIepYNzDNv26jGUflZTlTq3d8jPTfwAT3Ul4McnK9FsWgCFP6xdBgLAJ46Yk?=
 =?us-ascii?Q?9IgrICSuWM9VHJXh9UFAWtX4Nv9Q6sDyadzj7e0Ni7lWMaNszre8XMSgpsB1?=
 =?us-ascii?Q?X/1GIVz99vrRbpatFxrOlNiq4htomeaRsjoqgyON2rhDpcsJth93HmByreB5?=
 =?us-ascii?Q?84f0bSMEPYrJGV2ChmmIw9b6LHQ0Hi82zhQnC1+T2NrO3JGZM9ljKeJWv6/0?=
 =?us-ascii?Q?MeFV3E+8qAWYNtSXylHyhgU634pb3mUr9mLRDOhK?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8582a565-9d84-4543-9d65-08dcb2be26b7
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2024 06:41:34.4569
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 55trJsdIFe/91jX0Yocc1QNt3BtQq8fogeeNEeZEnZRCIRUzgVBaMSEFEvnQlZi7b5DbxNL6Ky+nv3G1dTrwDQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB7171

Since commit (122968f8dda8 usb: typec: tcpm: avoid resets for missing
source capability messages), state will change from SNK_WAIT_CAPABILITIES
to SNK_WAIT_CAPABILITIES_TIMEOUT. We need to change SNK_WAIT_CAPABILITIES
-> SNK_READY path to SNK_WAIT_CAPABILITIES_TIMEOUT -> SNK_READY
accordingly. Otherwise, the sink port will never change to SNK_READY state
if the source does't have PD capability.

[  503.547183] pending state change SNK_WAIT_CAPABILITIES -> SNK_WAIT_CAPABILITIES_TIMEOUT @ 310 ms [rev3 NONE_AMS]
[  503.857239] state change SNK_WAIT_CAPABILITIES -> SNK_WAIT_CAPABILITIES_TIMEOUT [delayed 310 ms]
[  503.857254] PD TX, header: 0x87
[  503.862440] PD TX complete, status: 2
[  503.862484] state change SNK_WAIT_CAPABILITIES_TIMEOUT -> SNK_UNATTACHED [rev3 NONE_AMS]

Fixes: 122968f8dda8 ("usb: typec: tcpm: avoid resets for missing source capability messages")
Cc: stable@vger.kernel.org
Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
---
 drivers/usb/typec/tcpm/tcpm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
index 26f9006e95e1..cce39818e99a 100644
--- a/drivers/usb/typec/tcpm/tcpm.c
+++ b/drivers/usb/typec/tcpm/tcpm.c
@@ -4515,7 +4515,7 @@ static inline enum tcpm_state hard_reset_state(struct tcpm_port *port)
 		return ERROR_RECOVERY;
 	if (port->pwr_role == TYPEC_SOURCE)
 		return SRC_UNATTACHED;
-	if (port->state == SNK_WAIT_CAPABILITIES)
+	if (port->state == SNK_WAIT_CAPABILITIES_TIMEOUT)
 		return SNK_READY;
 	return SNK_UNATTACHED;
 }
-- 
2.34.1


