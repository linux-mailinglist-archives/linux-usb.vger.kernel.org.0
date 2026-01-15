Return-Path: <linux-usb+bounces-32391-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 52274D24AF2
	for <lists+linux-usb@lfdr.de>; Thu, 15 Jan 2026 14:12:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6557B30242BA
	for <lists+linux-usb@lfdr.de>; Thu, 15 Jan 2026 13:12:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1F9039E6E5;
	Thu, 15 Jan 2026 13:12:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=phytec.de header.i=@phytec.de header.b="uP8MgRQG"
X-Original-To: linux-usb@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11020099.outbound.protection.outlook.com [52.101.84.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3465A39E195;
	Thu, 15 Jan 2026 13:12:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.99
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768482724; cv=fail; b=akh5CzY6pRPetXAAymNkUaZ1xpN+PfiLoM0o0jd9nt4fR6nRWa4nm+mhBXqTDQc1TNgMTX9BJslVH64NYJkjuowzha8c4v4f3mzRQmhxEOUyRIf9EZDC3Zz2okRDuFj1Q/rMke6TmHKyjPb2hG5v9sdahW9Vvhx7OMOHaolNZcM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768482724; c=relaxed/simple;
	bh=owgj0rpb5BuCBcSkpRslzZvceTraG1o3lgJOnfWEIQc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=gx+sEluJSXoVJ9kzPH3aWcbt5XL8ea9gdka/GDk+QElMuhNHM0wDyHjUqxoDkMRYTFNAXURwlhRt0sc9s/msr+ZZz+BtUiw17eiw9w3YrJZ8UY2s/fGdS1R18S10B6N364RZguAWdGECqw3EpIkjuaVz9oXcjuMqEJ2XFkY4lnY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de; spf=pass smtp.mailfrom=phytec.de; dkim=pass (2048-bit key) header.d=phytec.de header.i=@phytec.de header.b=uP8MgRQG; arc=fail smtp.client-ip=52.101.84.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=phytec.de
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hoi7FcCtWD/62SAn6agp43GQZMqzYLEW0WkVDZ3TplAOzOU/6YBZJDkQ5Uf1UK4h5ZfimiGOvN3otitTXVKY7lhZEZAo9elQqkHiW7zflu8JJuyNu2EVAQUuBCwdPync4EXcfXvvEeo+iOTG3V6IcMJjmCg2nj74ugZBu7xCiuEJ/VWePvoeCTT7E8lD4jEzOGPHYuaN69l9drBxhLhd/70KNMVbbj3f1Dq0E89o0R+e2JZ1IZuNJN5JnyOa0aBsPsnH5R4iA8wec8yXSJbiOWE/eG6mCAM8AYbzyBelAEgm98qvwZtksdJSFyKqyGDtrOIHoAakinAMcErJuqvKAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vBNVgZk811ij/ynvduZQfcJuht5KydMcgG9bIO1ZBJU=;
 b=IjFbFc15Jvh8iuwB2AfuDljowa2GxBoCQNSoHCJX75rHfjzJSr8mGHZwQH+/vrRqxQ8VTQEmK7IWJQ/miP+jerrN6g6AJXghQ7AWdzBb4aZ6KXDYrHRRgvtpVG3XdJOJ9ICV69ZMedKFv2sXhiHgIRJlqWOshQLm9zo6LWUdcmAg9A4m3v1adFxPzB0m+mU8VhrpyE3FDeIqTCwwIl/mogHQ8NrW2M9lTFA99o1bdhIqLilNFoZFAVJqwKsbzwGYTsdxtY0OXcRATe/t2QlmB60Mj8Rg8CHpsQOzr2C9XsosrGicULt5m+YjsqEfxbBbCQxY1uTCLmOAo8mEkmeO4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 91.26.50.189) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=phytec.de;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=phytec.de; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vBNVgZk811ij/ynvduZQfcJuht5KydMcgG9bIO1ZBJU=;
 b=uP8MgRQG2zW6b252ebGLFIUidGhd1XSd3bvWUFEH+9mKJwER7BiHkF9whfsZxlsxv6FohdsyRKxPj3hMgrVItiGgxxzmDVFm27Xvni3wlHSlHeUkNn+WWw/tnhUeQ9Xq0k9qXrTAQ02QNRtQlgGoVDWC4ncx97thMpPEFjW331YKDLP0q+XtiGXdZuRLM11GN4fZSlig7ocbU4dm/t+WAiNGoFkQfRPAxHApZwq6ITOC5FqBVwFXr/D02NxelyiaCuTOLYG9iWKHUCgnahYRys831a8FqPsgAvoFwglQiWUxG+0Pbe2h9J9d5FCMMWRH0wMndr/usHyAC4NRGLGQdg==
Received: from DUZPR01CA0110.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4bb::7) by DB8P195MB0616.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:10:15e::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.6; Thu, 15 Jan
 2026 13:11:56 +0000
Received: from DU6PEPF00009523.eurprd02.prod.outlook.com
 (2603:10a6:10:4bb:cafe::1a) by DUZPR01CA0110.outlook.office365.com
 (2603:10a6:10:4bb::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.6 via Frontend Transport; Thu,
 15 Jan 2026 13:12:04 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.de; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.de;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 phytec.de discourages use of 91.26.50.189 as permitted sender)
Received: from Postix.phytec.de (91.26.50.189) by
 DU6PEPF00009523.mail.protection.outlook.com (10.167.8.4) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Thu, 15 Jan 2026 13:11:56 +0000
Received: from llp-jremmet.phytec.de (172.25.39.81) by Postix.phytec.de
 (172.25.0.11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Thu, 15 Jan
 2026 14:11:55 +0100
From: Jan Remmet <j.remmet@phytec.de>
Date: Thu, 15 Jan 2026 14:11:21 +0100
Subject: [PATCH] usb: typec: hd3ss3220: Enable VBUS based on role state
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260115-wip-jremmet-hd3ss3220_vbus-v1-1-b7d9adfbe346@phytec.de>
X-B4-Tracking: v=1; b=H4sIAHjnaGkC/x3MSwqDMBAA0KvIrDuQTPzUXkWKaBx1Cn7IVFsQ7
 25w+TbvAOUgrPBKDgi8i8oyR9hHAn5s5oFRumggQ7mxNsOfrPgJPE38xbFzqo7I1Hu7KRaO+iJ
 9lmnjPcRgDdzL/86r93le9NR+b2wAAAA=
X-Change-ID: 20260115-wip-jremmet-hd3ss3220_vbus-732f74894acc
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, Krishna Kurapati
	<krishna.kurapati@oss.qualcomm.com>
CC: <linux-usb@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<upstream@lists.phytec.de>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: Postix.phytec.de (172.25.0.11) To Postix.phytec.de
 (172.25.0.11)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU6PEPF00009523:EE_|DB8P195MB0616:EE_
X-MS-Office365-Filtering-Correlation-Id: cc454845-280d-43f1-f1a9-08de5437a8ea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bmxIc1VCelhCUVA0UXVlbUgzSCtXcHNzbzZPNjZ4b0k2ZnpnWUpuWVZwYVUv?=
 =?utf-8?B?NFBvRElMRHBpMDhTRkRzOXgybTh2QjI0anIzU3MvNzBxcDkrWFhRZkdVRGI2?=
 =?utf-8?B?cGdnSURRK09FN2NvSDl2VS9kVVVHdE80aFdqYXVJa0RPYy80Z3k0MDNhcTNS?=
 =?utf-8?B?NmRteHVYU1FFT0NHbzFGZDVOeGVGUFlBQzNxbDdPS0pHL3NqWXZySDh4Q2RH?=
 =?utf-8?B?bGRydlNMdlU5SVZqQUpTa2xHSHB0ZW8wSlBONzE5MjU5aktmRkdHd2dnb0Qw?=
 =?utf-8?B?RXR1WU9XWUdXYSt1VFNsRG9tQ0orOGNTVzh1S1FPcjJyaGVVWEprcWM4aGR3?=
 =?utf-8?B?R0RXd2tKUmlCQ29jbnFuZDk1QkcrNUhQYU5hTWtRbVRDRW9YajdHd1EzcENB?=
 =?utf-8?B?b1lET0lrWHM2MXg2WjQwQUxLWlRuR2d3ZDRmQ3BJa2JwYmFsQlVXSUtOZ0xT?=
 =?utf-8?B?UjZmT09ib3dxaEdJc0hBSlBzSVJoZU8wdFRvZ1c5VnhQdktDN2daQ0lXQiti?=
 =?utf-8?B?Rk5IcjhISjVROFc3a29nTWVNWnNsZjRBUEFLS0hNRnBFdkFoeWFLSmtUdGhh?=
 =?utf-8?B?N2NZZWlqZjVnRFhtYmk4a0t1TGNHcmZERlgyc3M5dENueUI1d1RRU1dzbnlk?=
 =?utf-8?B?Z2FsRE1BY0YzQnlrTG9DTG90SEpCTGRvUnVSdWpGL2t6eERwc25PMWVURDZy?=
 =?utf-8?B?cFFkSGlXbXJ2YUFHeXp0Um43YUJibGdsdHl0dXArNFltTS84UUd6cGlsVjRR?=
 =?utf-8?B?dFRYUW5WNnlTTFVXeTVReENGaTMxdXNtSEtsWW9QSDNrTWZya2wrM1NVZGFF?=
 =?utf-8?B?TFpqejhGUlFPbGttZ2dVcFMrQXpzbVl1bktEcWFQdGd5ajVkYUVJVmlzNkp3?=
 =?utf-8?B?b0w1WmFnMTB0Y2VOWkc1Nmp6cFRoZW9wdFlkMk9iYjZMR2FZQjkyZHR0RThs?=
 =?utf-8?B?WEJsWE5sb1FZUEdOcUVUYzJBUldMelAxdlRaNEtVNFc3T2lMeGsxVi8wd2Fh?=
 =?utf-8?B?Yis4cHdxWEt6SFU1dE9pSlZycmZXWkE0V0xVNnlwMDFNSk8ya29CY1pZVDNi?=
 =?utf-8?B?S0xaTVFJQS9IL2duVnhLQ0ZWb0FDbU0wb2REQ3NIdHg0WmxMdUcrbkRhK1l4?=
 =?utf-8?B?QUNqTjIxK1lpaHkrcmV1RDhrOEFyeGtXbVk3QkVvKzR2TEpIcm53L1dkQ1Ni?=
 =?utf-8?B?YmJTRlBHdTJ0ZXRlM0t3NW10emEzWXNSM3VhTGhTZVZsckVsN0t5aStEdGtH?=
 =?utf-8?B?TGhucmlGUjF2M2lCWTl5KzN2QXY2U3JNQTgvbkVUQ1FvYk1Sa0xwU3FCeG5Q?=
 =?utf-8?B?TGl4NG1VVUlKaUJwdFNOL051eFlFc2RJOUJ4eEFnVTNjdUxoSXMwYTlNRnF5?=
 =?utf-8?B?c3hnNC9FZnpxbk4xSnRJT1hnUHhkd05hTTMxazdkWWJ2WTJnbWYzcDNvTjZH?=
 =?utf-8?B?QkNVODJHWjdUU2lITlMxVEdSZWFXTmgvV0ZzaERwRkdTaWVUN2pHazhjeFph?=
 =?utf-8?B?cXNDR2VyZWk3Z252REFHUDAzMTJTdnFicTZnQWgrT2pydUxCWitXU21pMXFj?=
 =?utf-8?B?TUxQRkN6c2E5ZE1yb3NPQjVkdUpOQVQzNjhwUFp2TVl4QldjQVZZbmp4N1dN?=
 =?utf-8?B?Tmt1RHErUGE1K3pVcFRLRExWeE9XZkl2blM5SE4wWm1xTXlQalQ4U2ozREl5?=
 =?utf-8?B?Z0JRaFplUGVhVktBL2daM2ZVUWdWT1dmNm5BTkwzWkRBZmQycTNDTkU5ZzV2?=
 =?utf-8?B?czhaanlHVjVJQ3pLWEo2V1JTYmI0NDd4VU9oZ096QUtxWTl5VjIweGdwS2ND?=
 =?utf-8?B?VzRDZnBnVlBxR3ZiQnYwWjFsM1NURDM1ZEp1bTJoZllRN0tSTjFIcUF5blF1?=
 =?utf-8?B?Tjk2K05JZjBTRzdxZ1VIZXdjcm1uVVhOTEEvVHgzbDVEOGp1NHZybDBwV3d6?=
 =?utf-8?B?bVhlQXlCSW9uRll0QVFiRVpVa1pCNlVnQ01Cd1V0T3RoVEhRa00vd3NBbFhm?=
 =?utf-8?B?aGgycVlHK2diUVlXTWZHZWlwZXhMTXdIZzFFeGpPZ3U4WWNHbU9VUmVYeXZz?=
 =?utf-8?B?c3A3UG9iYnVjYzdMczNTeFpadnBZNmdZKy8zTUhLWDFiMXJsVUJLVmtYRTJS?=
 =?utf-8?B?dWorMmZKbElTNEJmUWhmN29zeHRDVGpYTlhEeWJNOGtRYXdYbUV5UytRV2Rq?=
 =?utf-8?B?WXNTQVV0MnVnR2tueVU3NjJzZUVYaTlIN3ZyWFYxcDBTM1pjVFIySTk3aU9B?=
 =?utf-8?B?WWVwUW1ERVJKYlFISkJEcGFvRVF3PT0=?=
X-Forefront-Antispam-Report:
	CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:Postix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1102;
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2026 13:11:56.6365
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cc454845-280d-43f1-f1a9-08de5437a8ea
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Postix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource:
	DU6PEPF00009523.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8P195MB0616

For systems where the ID pin isn't available as gpio use the ATTACHED_STATE
register instead to control vbus.

From the datasheet:
"This is an additional method to communicate attach other
than the ID pin. These bits can be read by the application to
determine what was attached."

Use this method if id-gpios property is not set, but the connector node
has vbus-supply defined.

Signed-off-by: Jan Remmet <j.remmet@phytec.de>
---
 drivers/usb/typec/hd3ss3220.c | 27 ++++++++++++++++++---------
 1 file changed, 18 insertions(+), 9 deletions(-)

diff --git a/drivers/usb/typec/hd3ss3220.c b/drivers/usb/typec/hd3ss3220.c
index 3876f4faead679e6c04062ab2bcf2ae928913a0a..a7c54aa8635f70d6979d98c95f80d4dac277fef2 100644
--- a/drivers/usb/typec/hd3ss3220.c
+++ b/drivers/usb/typec/hd3ss3220.c
@@ -204,6 +204,20 @@ static const struct typec_operations hd3ss3220_ops = {
 	.port_type_set = hd3ss3220_port_type_set,
 };
 
+static void hd3ss3220_regulator_control(struct hd3ss3220 *hd3ss3220, bool on)
+{
+	int ret;
+
+	if (on)
+		ret = regulator_enable(hd3ss3220->vbus);
+	else
+		ret = regulator_disable(hd3ss3220->vbus);
+
+	if (ret)
+		dev_err(hd3ss3220->dev,
+			"vbus regulator %s failed: %d\n", on ? "disable" : "enable", ret);
+}
+
 static void hd3ss3220_set_role(struct hd3ss3220 *hd3ss3220)
 {
 	enum usb_role role_state = hd3ss3220_get_attached_state(hd3ss3220);
@@ -221,6 +235,9 @@ static void hd3ss3220_set_role(struct hd3ss3220 *hd3ss3220)
 		break;
 	}
 
+	if (hd3ss3220->vbus && !hd3ss3220->id_gpiod)
+		hd3ss3220_regulator_control(hd3ss3220, role_state == USB_ROLE_HOST);
+
 	hd3ss3220->role_state = role_state;
 }
 
@@ -330,18 +347,10 @@ static const struct regmap_config config = {
 static irqreturn_t hd3ss3220_id_isr(int irq, void *dev_id)
 {
 	struct hd3ss3220 *hd3ss3220 = dev_id;
-	int ret;
 	int id;
 
 	id = gpiod_get_value_cansleep(hd3ss3220->id_gpiod);
-	if (!id)
-		ret = regulator_enable(hd3ss3220->vbus);
-	else
-		ret = regulator_disable(hd3ss3220->vbus);
-
-	if (ret)
-		dev_err(hd3ss3220->dev,
-			"vbus regulator %s failed: %d\n", id ? "disable" : "enable", ret);
+	hd3ss3220_regulator_control(hd3ss3220, !id);
 
 	return IRQ_HANDLED;
 }

---
base-commit: 944aacb68baf7624ab8d277d0ebf07f025ca137c
change-id: 20260115-wip-jremmet-hd3ss3220_vbus-732f74894acc

Best regards,
-- 
Jan Remmet <j.remmet@phytec.de>


