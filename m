Return-Path: <linux-usb+bounces-36442-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sIk8DCHz6WmepQIAu9opvQ
	(envelope-from <linux-usb+bounces-36442-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 23 Apr 2026 12:23:29 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B71C4509C3
	for <lists+linux-usb@lfdr.de>; Thu, 23 Apr 2026 12:23:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3E5E430E02FB
	for <lists+linux-usb@lfdr.de>; Thu, 23 Apr 2026 10:18:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EB05394490;
	Thu, 23 Apr 2026 10:17:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="CGvEa5HO"
X-Original-To: linux-usb@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012027.outbound.protection.outlook.com [52.101.66.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1527839283C;
	Thu, 23 Apr 2026 10:17:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776939466; cv=fail; b=gl/dqxS9pLRIOQ7zLE/rKHe9YIpK4Ri3Z7nEh5D6lXBGWLZ6If4yPSQkZSxz8XSmpLw3Cx/lA+RhqrbbUGmZN6Cmm8tQaRTrvZYQ9fok2NN5XyPYUkncJaBqxb0auIftuRWuiYGnfGjkgK9V0T6CNRq6EHRzS0rR4f8WpsHC7Hc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776939466; c=relaxed/simple;
	bh=K17mP6HhktB13TqBAcYfcSxtT1rMEnvyIpbRFtrP3zs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=CVnOSqUwnQxFCXRk5iV7U5QyOmzzuLHwc5U56x3Ybelr9eGwe6xW5VxWA+8E/YBfPQRvpSiRssnfYGOitzxMw4bODgV81Vq7hkBVGWM4jbID4plPsFm6mu0sECePYMNX3YssiQdRCLhwpWRoPXcuyIz0KblLp8fylZWcns26AaY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=CGvEa5HO; arc=fail smtp.client-ip=52.101.66.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vrOXOd9Jo46cS+HfroUBf3cYLySnC0F5hqP20imWtJjTiP8FwhjN8rR7BB2w2HLvnvcx1bYbARJdFObj37SJCW7UdOBS6iQHLDiiZR0cZTzfgY8u/2OmaXuWjn8kvoxiOtUTzlx9KjOO+Ks26ujXJYymD8NxJjjHN+5ENpYWLzD/n53Nrta9U9uYaS3tmKMxlQIldmlv6+BwQxenJzqVBuS4ZzreuM7bKdpskAUqvajMTWFGtr6gyVtI2aBrNObZTTrDCJ1cY317A3JcDkGwjg9sn1Sv4FgPl30z8hWRsoQW+EC1YNa+0e+L2MEC0X7gfBLHQIy7MeBG2DtuH6uf7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vvf+5qsJfaL8MGcA5hFC2MlgOHUyUrpeKylZHbbzWdw=;
 b=m0VDke8gVNHGq1c7KrKvTK8yjnp7lYb0Qvk6CWwWCK/71UEAw8TjrjHgovb8epTxxTqSbZXKs7muMHnN+lfN2+rbiR84oXIWBUAWvXVTdoS9380zZYIlZJ1SYhrfd1ZsDymz6ihcDyniPu5jqAHfW2X+eTfgF7iQvhXWKJy4UPN+rXm0nJNQ6FbKNmjreT3HNNBOx2YjXUTnHG0avyvAAqne/eBZvw/RZ1m7YDzvVxYLAFi5EwJyOknH/lSfXZjfsIdjQCQ/U2eoLfYg2x4GXkuop/eBwVUPijkKEubAHiIvsvjNTSEIxmlut2ianPzHx8M/613zDfelrwqch78X7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vvf+5qsJfaL8MGcA5hFC2MlgOHUyUrpeKylZHbbzWdw=;
 b=CGvEa5HOGVEpVYdq/uGUGlAA6Ct7G7wMth/C3piotWdj5TkAgf9iPKRG4eq+O5CMmADl/qHlX5+nz74kFvlbIkIW4/So14Cd0lNt8/oYX4mwjKW/CmR6HUs8RUeg7RgmhwmLftsR6QVXcH+3EiiEdhgbIAC0DfQbLdaK9q52NYrfJhhqTzy3ej3eYNHGSBJ4BKI3/Mk+qjWZ0qSM3T9Gw2Ygv3uD0vidjBi80roKrUJFGmV/+YzJQS5rATm6Efv8gp9n5CC7RIut31YLOk4DD2uqUf370uoq+fMpftpSHJjFJqGEycQyu+psf9eVtc9b+s4ds+BrKsTuGFd+cbUPvA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by VI0PR04MB10855.eurprd04.prod.outlook.com (2603:10a6:800:25b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.21; Thu, 23 Apr
 2026 10:17:41 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::c67b:71cd:6338:9dce]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::c67b:71cd:6338:9dce%5]) with mapi id 15.20.9846.021; Thu, 23 Apr 2026
 10:17:40 +0000
From: Xu Yang <xu.yang_2@nxp.com>
To: peter.chen@kernel.org,
	gregkh@linuxfoundation.org,
	jun.li@nxp.com
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev
Subject: [PATCH v2 3/3] usb: chipidea: core: convert ci_role_switch to local variable
Date: Thu, 23 Apr 2026 18:20:02 +0800
Message-Id: <20260423102002.2675414-3-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260423102002.2675414-1-xu.yang_2@nxp.com>
References: <20260423102002.2675414-1-xu.yang_2@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0002.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::16) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|VI0PR04MB10855:EE_
X-MS-Office365-Filtering-Correlation-Id: 0981982c-8589-442e-1a0d-08dea1218d10
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|366016|19092799006|1800799024|38350700014|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	4Wthb9Uv2naSgWc+HI927XmGWLp7A+lcmm19bpTovx7CqeMIwfsn9oVYiyIclwYJHxBJruDKlVLmtFAcexJm/papu//ZwNmlPeYdQ+scxcm5ItA8+5mnjENbs1T3ODZNIA6GYSzZJWWlYku5NqLIbEqBVolRXai5Ww3OAEPCfGF5NdU8SIEJ90EWumYRhEsGz+ZqwIo2SFAgaIxV2TUK3t7rBXE0BY/F/9rzy0ZJ15m71MI89PJh6nWBLK/bZMi52Alh6GyIEW2X2N+24WiVPofREjSIqFmNvno8RZ4Rf7wrB7rsZqLNsGltkmqCyoqNPBD9DsSFL//tgnaBWhVQTpZoF5a9+bK7dL6aDTe+5pVfzaWVAJTEuyT/KdCIUQ/HoNK36ohzv7h5A55wk17LVfcf3I6CG3T1uqhZmzDvvZTWkZrWSd1EHxxPBPL0wYQ1cgLUH5apwD1kpn68o1dhiugP/jQ2JWK1BjQjWx5AwpOcC/Agx29oDD8QlPste5NjL62QXLrnkscDGW7DK+qdV8u1atkla3WDU03sWVboHjG++BiOjq3pzUA+C3/aa1yK3JSobGkSYFxVDulX9iZXg7H2PQ9mY5TnGyi/tEL2WGa6MIH/nU1RK5gqpS2lAr5PqFQ1C56cUzhoOrshr7dbKBPw4BmVjZ865UzDzzwX8iEzin2QJIrfYNSUaqxL2Xh/aLq5ThiIrXDnra/eAxAWP+XLFmBTo2Z6YtKgFqHgXBt9VzRACSaYM+eCzX8peZfarirOJM35Ce3f/mhabJZjtd6Sm75fCF4NvtTK8oCGg8s=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(19092799006)(1800799024)(38350700014)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?PdkerEpHnSFL8CgKYHi9B6d2zxcFnDM4HhFUgDDV9q+g7WC8SHX62yu8dkXT?=
 =?us-ascii?Q?qAHdy60wWPV3fcxJB8eKEMSAbEFYFjylTMCyqNUvib487gSnaBY5MLH+mZcZ?=
 =?us-ascii?Q?m5/4l80I3dPJYszlbZsH77F1fV19T6B2V775tAio9wDLLDJfYfWQxMpF0LvE?=
 =?us-ascii?Q?i5xka4n10tgaaYIa0YmjVmInmxz/dMEhmGfUQMLuP5BdK6lmi+Tmljm1CCQ+?=
 =?us-ascii?Q?yHq+O1HhVl14Yh7CYgTkW0F1I6yeQzGslIBmy2uJ8SP+iNaxlA6XqlUWmFv3?=
 =?us-ascii?Q?9terk0k4w0PpymEO5L5wjbvS7Qd45jsVUNW+IWmJXfGeERnWzaXkJhApBVsv?=
 =?us-ascii?Q?b4tqG2moD1j18KiT4EDOHl4raM2gMuWuc5c6+1xOY3lSdnYniNtSqJh2CRzG?=
 =?us-ascii?Q?vQDCmBiqpw8rDG83vbIIYyYfJ++b9Jf/4w/atUO8rODqxMTeW+Y54lUlzjo4?=
 =?us-ascii?Q?J7JtcqY5R9vikOlryw8kyEVIL5sLrBhDEkTWGtmS/BQZwyofDvvHMnbf4fl+?=
 =?us-ascii?Q?zMgYmG3hciaXoW/uRzqVsgYayeuR40yPLLx9kKow2tJ49dlCHAd9nF3Bo1/A?=
 =?us-ascii?Q?Bq2iKASmameSyaD9IxNa92MHjFubXBl9HN/MXcHEEE0MT/6ND+oLMaxboQbO?=
 =?us-ascii?Q?bxpYrb7Sl39/EZyya5edR/Z/gZULOcr0ZltLrAWohUsJH8i75facR7uKH6KW?=
 =?us-ascii?Q?92Q5q+puvfiTeEasc5RPaJ9ua5VB19QOelgzv9yUB28A1YkSOAKyRb2u4eUp?=
 =?us-ascii?Q?LZ3ZbqTx1cGoRZPSRpas/DFad3hgv9/ULltkbdUGxFte6vYQ60YcYaKpxoDJ?=
 =?us-ascii?Q?GbA6+qtGvKNKEql5LRkqRaGpgwZFIQnq3xbICOIq53Je26kHcW5d5G27ESzS?=
 =?us-ascii?Q?x8b8gwBi1k02mw8jITc4TLgmcAX/zh1oI8Wolkuj7gxKDpiBzlXxD/IVXtJS?=
 =?us-ascii?Q?TfDxy08/Der8/EzM3DN+maXHQ2lMUVuDVIjZi//5HBXoMGiENtXHfkJrolQf?=
 =?us-ascii?Q?nRPVVax6Mn0Mz3cZS/tsNIMriaqCuBoMjBMPo2giQMHK74DqEHi8xYWHxM9T?=
 =?us-ascii?Q?KK/5sLkVb6HiVGkld01hv8+pNbJxiBNSTm0NRVhe/zp9ReNv0YLpeLFer7Fn?=
 =?us-ascii?Q?aTcHZZhdY4J5/gHgSDr9B9WXDo2kVcMp4e4JWveCpIPXBATj6ZKqKLc8O4wM?=
 =?us-ascii?Q?b+QhUvGWsIBt0s/7JbuCwU5T1LfYKBAqkILzW8WaaMm5334GNI/UXDTVQR0l?=
 =?us-ascii?Q?l66K1BtXYRbZ/djXsdBin7KvT4DU31t3qhipMr6Wn+e78IX8jmEihj1k/ou3?=
 =?us-ascii?Q?7NzENGlef5RH91/3btSyPar7VaMGC2k8UFO4um+4b0Nmxbmilp04DQh2DFoU?=
 =?us-ascii?Q?+QdG6JBZPctTlzgX+OWS/C8bTG83jMWhg5QGmJSyQ3J2+2hl3Hz6z3sr5pzc?=
 =?us-ascii?Q?1aoDXcDBo/QsDMlHD+alboLUvQTNOYvWUsVOrMi1hJ4nLHU4HJ+GZUNl6njv?=
 =?us-ascii?Q?rCdKHpdMS2IrTxlrRxrdZr4QKDuhWpa0zg0CZztQwvWUMwnTjhtfvnIkfdOG?=
 =?us-ascii?Q?8HCLk1llA7bb+8i3Ntgp9aGUTu4V5saK/+iXdDM8/XBr/3Syh6Loro8S39++?=
 =?us-ascii?Q?69DqMGN9Dlr7oiFyKNsmiCahOlOsDbIELwEUsoXFIIv9Ouwzz8Ar+PjSH9ae?=
 =?us-ascii?Q?S36jvbPhiXMJjjW9+F+Wzo8ZkxND9X+Pem0NYWAPB5Bme7VW7orNWoM9Ps2f?=
 =?us-ascii?Q?BXEhRE2wRw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0981982c-8589-442e-1a0d-08dea1218d10
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2026 10:17:40.8625
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Bjq1XJuURtODOdpRK35aWbxT0zYR9aBJdkDpJmCQyiSHM4eHBiti8CsN4Pa7psaKCpZjW0fvtA2HOY0y44LL7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10855
X-Spamd-Result: default: False [1.34 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36442-lists,linux-usb=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[nxp.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
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
X-Rspamd-Queue-Id: 6B71C4509C3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

When a system contains multiple USB controllers, the global ci_role_switch
variable may be overwritten by subsequent driver initialization code.

This can cause issues in the following cases:
 - The 2nd ci_hdrc_probe() sees ci_role_switch.fwnode as non-NULL even
   though the "usb-role-switch" property is not present for the controller.
 - When the ci_hdrc device is unbound and bound again, ci_role_switch
   fwnode will not be reassigned, and the old value will be used instead.

Convert ci_role_switch to a local variable to fix these issues.

Fixes: 05559f10ed79 ("usb: chipidea: add role switch class support")
Cc: stable@vger.kernel.org
Acked-by: Peter Chen <peter.chen@kernel.org>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

---
Changes in v2:
 - add R-b and A-b tag
---
 drivers/usb/chipidea/core.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/drivers/usb/chipidea/core.c b/drivers/usb/chipidea/core.c
index 95d9db159ce8..07563be0013f 100644
--- a/drivers/usb/chipidea/core.c
+++ b/drivers/usb/chipidea/core.c
@@ -655,12 +655,6 @@ static enum ci_role ci_get_role(struct ci_hdrc *ci)
 	return role;
 }
 
-static struct usb_role_switch_desc ci_role_switch = {
-	.set = ci_usb_role_switch_set,
-	.get = ci_usb_role_switch_get,
-	.allow_userspace_control = true,
-};
-
 static int ci_get_platdata(struct device *dev,
 		struct ci_hdrc_platform_data *platdata)
 {
@@ -787,9 +781,6 @@ static int ci_get_platdata(struct device *dev,
 			cable->connected = false;
 	}
 
-	if (device_property_read_bool(dev, "usb-role-switch"))
-		ci_role_switch.fwnode = dev->fwnode;
-
 	platdata->pctl = devm_pinctrl_get(dev);
 	if (!IS_ERR(platdata->pctl)) {
 		struct pinctrl_state *p;
@@ -1033,6 +1024,7 @@ ATTRIBUTE_GROUPS(ci);
 
 static int ci_hdrc_probe(struct platform_device *pdev)
 {
+	struct usb_role_switch_desc ci_role_switch = {};
 	struct device	*dev = &pdev->dev;
 	struct ci_hdrc	*ci;
 	struct resource	*res;
@@ -1179,7 +1171,11 @@ static int ci_hdrc_probe(struct platform_device *pdev)
 		}
 	}
 
-	if (ci_role_switch.fwnode) {
+	if (device_property_read_bool(dev, "usb-role-switch")) {
+		ci_role_switch.set = ci_usb_role_switch_set;
+		ci_role_switch.get = ci_usb_role_switch_get;
+		ci_role_switch.allow_userspace_control = true;
+		ci_role_switch.fwnode = dev_fwnode(dev);
 		ci_role_switch.driver_data = ci;
 		ci->role_switch = usb_role_switch_register(dev,
 					&ci_role_switch);
-- 
2.34.1


