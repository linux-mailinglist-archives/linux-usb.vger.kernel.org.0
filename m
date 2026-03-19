Return-Path: <linux-usb+bounces-35126-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6HNWNCXJu2mtoQIAu9opvQ
	(envelope-from <linux-usb+bounces-35126-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 19 Mar 2026 11:00:05 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 63EDE2C92DA
	for <lists+linux-usb@lfdr.de>; Thu, 19 Mar 2026 11:00:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 552923288E7B
	for <lists+linux-usb@lfdr.de>; Thu, 19 Mar 2026 09:47:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 131023783CA;
	Thu, 19 Mar 2026 09:47:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="kdjUtSaE"
X-Original-To: linux-usb@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010030.outbound.protection.outlook.com [52.101.69.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3221D376492;
	Thu, 19 Mar 2026 09:47:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773913629; cv=fail; b=ctw6SlLVIAcN0KR7AwV02oLjkQ01ExRPk3ZEPSCMJqN3mKDFcxd9aL5c77IzlpvLCqH30ZSfLlWdgp33yq7a9Y4V1Bbwl7d0yAoHXSqIgqMDLiCAE8k+IEbAYkzlw6qyIXPKn8sgnRz2FClpBxN/JVP0sN78ALnsB0Lgdw7CgUw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773913629; c=relaxed/simple;
	bh=9O5536/fuDH6atmd0pDfBr7JMQaBdFHNOuF7WeroLCI=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=TVUDMuKDPycXirNtRe2h7Lq91LoEoo8RcGHzpm7t8SqF+FlfP7k8T/mlZl7SEb351EyoUF/nggmudFYxE9p+tn0qnHY70+93TvinDujoxepK2yOHsxSfBbSYiwaGuAHVvrs/pKIZwqvLLYhhOJIkGchjKVq25I9Y4tdNBDxYyoE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=kdjUtSaE; arc=fail smtp.client-ip=52.101.69.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TmoKvRKqjeH8jFuqysRRTeFx7z8jXSa3e8t9yHPqkpuX2GJvUXnVz9WEm+4XUiRtV22jekUOxwD/Nf+Efofluy/EjsyuOEb1dy5c87AP2FfUnxHtMjU1MmOZfX3IJxqPCi8ODbYyD0dKfZRdVO6A1JkRubAX5OU7VBiHBs0v0T/Ei9japBEWZWIK3DKBS0xMDEGKYMFitNqbOOkBwDCVZ8wIQJG3N0toP0mQGlRnBuQLvRkxlFP28xxmwxtVkfaRVACpVVQW4Z56vhvmihXPPpBOMP1bDFzHURSVzTBHXXsgJ6DT+3mBZxxRrJMNMhcd4p2cMcg3wMGiNl99KxF17Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jNzCP2JxuB2mLh1lsWyKZJTH1zuprYCdaG9e2a/4C8s=;
 b=KNqljs7Y4Ycoayv2vwpJG8JHJ2iHKL9EMdDhFrPvrfKUxFmTt3zTt2VqjvAFSPyPTYCg1wnq/fhr/J/xk4Eww4eBGAKpnnDuTEPtAcUr0SPutzxLC+yYBKze1YvEqDMW/ildnVGqxoFLSebpTcwK89ldto0KpiZbSbP/U3NoOgklSthWgZSEiobh2gf2P6q/ItumyA6G9PSQhBO2xRDpqTje/Doz9HPiR1sG7ylRXUWHUkwuEZdLH1CMOevfErEg8+3tYbFaiWhnDm0Y8xS/golsQya82XkBOl6kqmDpRUGRJud4QK591GPavl9nKyVPY0P9sBI+72A8FBnxu75H+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jNzCP2JxuB2mLh1lsWyKZJTH1zuprYCdaG9e2a/4C8s=;
 b=kdjUtSaEc0QzM9z7MCd6uPvyMq87STUNwe8U5cKEWroT+4WY5gMHrXhrXmfRW7zJhhEnKYWUfO5Mspgi7fFDhIMC9HQaviX6lcrwCEYOkjggsi269PdQCcH6Z5Uwj5xSS/b2fuOPD1aUvUEIDJarjPIrUHqts8VdSXdERaPAi9MVHQ1tN7ZKSipJcm4TiXTNS+Vj/q28juRexGVvnvH2An0GfiqWHf5kDmhtStsL8VIGzw7rGVLupogQRae/OWqpyuyxdVHuoYurncPSRWzmPWCLvVAqDwQaI4Y5Nbz8fO8JTaigErTOhyMSzpD3Rwzs7rDX9wEl9kU901G8ILU1Mw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by GV1PR04MB10453.eurprd04.prod.outlook.com (2603:10a6:150:1d2::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.24; Thu, 19 Mar
 2026 09:47:03 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::c67b:71cd:6338:9dce]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::c67b:71cd:6338:9dce%5]) with mapi id 15.20.9723.018; Thu, 19 Mar 2026
 09:46:55 +0000
From: Xu Yang <xu.yang_2@nxp.com>
Date: Thu, 19 Mar 2026 17:48:49 +0800
Subject: [PATCH v4 2/2] usb: typec: tcpci: support setting orientation via
 GPIO
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260319-support-setting-orientation-use-gpio-v4-2-ab6dfa8610c2@nxp.com>
References: <20260319-support-setting-orientation-use-gpio-v4-0-ab6dfa8610c2@nxp.com>
In-Reply-To: <20260319-support-setting-orientation-use-gpio-v4-0-ab6dfa8610c2@nxp.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Li Jun <jun.li@nxp.com>, 
 Badhri Jagan Sridharan <badhri@google.com>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: linux-usb@vger.kernel.org, imx@lists.linux.dev, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Xu Yang <xu.yang_2@nxp.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773913749; l=2652;
 i=xu.yang_2@nxp.com; s=20250815; h=from:subject:message-id;
 bh=9O5536/fuDH6atmd0pDfBr7JMQaBdFHNOuF7WeroLCI=;
 b=XNmXWDRNddAVh3KArv39qpkpsUY4WDaxX8UzanMtHUTHeeC0CxRG/GCLb/8fyKkwmA1NV79Ne
 4BmaYOT0jHXDwdjAO5pdg4uh0us54qEvtvK+OJC0KZEjft2ho2BEQCI
X-Developer-Key: i=xu.yang_2@nxp.com; a=ed25519;
 pk=5c2HwftfKxFlMJboUe40+xawMtfnp5F8iEiv5CiKS+4=
X-ClientProxiedBy: MA5PR01CA0214.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1f3::10) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|GV1PR04MB10453:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ffeb9bf-cfd3-43cd-49e0-08de859c74cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|52116014|19092799006|366016|38350700014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	DNIBaDXtOSvLOtHUK9xTZI9GybL60792Rv/pEbxseOKJWYDnf1S21V9f3f8wG5scWJ3hsciOfM0InaC6pKwUcVaMF/1Fh2baGsMKHqIQY5rIbR+EBQEkzccHR/36/8hqHhoIzcBrEgmRFDFiVPG97rSPGA1XnZgPcKa8JmCtqUsO6WBIuKXPeXjmvT5anBxelCp/s1WbSKMxHFhxuNh9dpeRZYYp2OWvuYMvEJC6xPHpIItyVSs1gDkRbR90oV9xmRa8nFpCbux5udjx5eIYarhouWvp+BvJslUT4Yqdj3y36zFud6dXQc3XS9r2LOcJ5UpJzAU5TR+i/wgofFsjSFlY4vYGsPg2ARhKhRHsiEkXvvSBz8mhF62uEy/ACj4esa96uJ+3ar9nSjEadpF9ApEUmIJdLTqqk+OWjj5Leg3fb5hEc4dxYcU7g9j0dFGD6Lj4BB//IDeU6v3F8Ph6ETGPxNMYiizh1Ono3TqDh1DXtfuxxCcOgvIhDvfh6VN5LwzXRi4Y1aJ5rJMzZCcSqDQcD/k1J+zOZqr90hsjBVvc4+rK9xfoyFSvT2urvF2hueoldW3pwqeDwTt9MtSitwEPOHIBf1xD3V5vB1Py+c0p1UcFk44Fp6diZvZEFnoIbW5qzjq3xeMoPJcVkjI+GV3Jv4fbyghgbE+8g4eTpAEaNbEO3ewkDDWDXAhbKAHmNqZOdSPYvkJndgdF7sL0/o2oIXtAPL+dikhECwe7eo7NnOLFQdg2FNHxBsV6VrUv2O05yWTrMzXEd6fkJ9FgUPsAiwZ643Y/epoNVpIZ+o4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(52116014)(19092799006)(366016)(38350700014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TW04VGVmTzArdW0zNC9sNGM2NFhsQ1N0S2syQjZzcWkyb2RKamluTEd3NElq?=
 =?utf-8?B?SkN1ZnFNUmpYVFYxc3BoUWpuSnRueW5vc1JZMFNsS1YvUlNTU0Y1bEh3Z2NW?=
 =?utf-8?B?WEdwaGRqMUdzLzFYWXVLV1lWbitySkxTMGJMWmI5UVA5VkdlMzdLb2ZCTkFP?=
 =?utf-8?B?eVJkeHVWME5VbTlIclR3QWIyZllwMDR4UjFya1pMeWQyd0QvUStxcjZ2ajF4?=
 =?utf-8?B?MkI4QndpUHBKMVFLeFUwaHpxd2toQkRycnlDMUU2Z2xJR1VKVHBPQkFxdThp?=
 =?utf-8?B?Nzl4bmZYbEFSUDlpdWF5WXNhRHJqVC9rSjM5NlpuR2hZZlZnQVFiZHBUcGNM?=
 =?utf-8?B?U1RsaExtdmlRTTdzLzA5c0d0c3FFek0yNUhkNkJ2M3lWOW9tWkErdGZiYUhp?=
 =?utf-8?B?VXZ4WW14Nm5qWENqTDg3RGdlVG9NVFJic29sUmlMWmNQZ3AzSjhlcmZlZUlo?=
 =?utf-8?B?SzZ3WXhGaGkyMDQvYlpPTnZMVCtHVXZka3dDcXAwTnp2aE5JUXVIcXdyZDV5?=
 =?utf-8?B?NW1CRERCR2NnSmJzUjAwOGd5cVJOTWZ2RnVrSE5FZkdWa1Zacklpd0c3V2ls?=
 =?utf-8?B?SE13TWRBSHFDUmhGM0RSWk5oNDg3bmNaeXdKVzJ4WWxROVhUbnhMYVVrSGtj?=
 =?utf-8?B?bkpUY1ZJcWNVRG5Va2wrUjMwTWpSVWNjc0pYR3RhaTBLMHovRS9ldTdvVy85?=
 =?utf-8?B?aEZwdDV3ckliWWE5RGNGeURiWHNiNW9QMlVEWGNVMHhSbGduS2YxalNsODBj?=
 =?utf-8?B?clliaGtkaStTM2hEb0Nta0o2N1hrSTJibDRDQXlBL3dtU0xmMy9QOHZJYWc1?=
 =?utf-8?B?YnZxWkJydGZtUUU0MnhLWEFXNkcrbC80cy96RHJVTXo2OUV2aWJWUjZPYUth?=
 =?utf-8?B?Rk9ZVzM3V3VuL0ljangxU1dIVmk4SHZMSjRoYTNmb0V0SnY1THgxQ3p5dGx0?=
 =?utf-8?B?aFJEVXIybXZ0RUR2eU1ZKzhzeUVxcDJXRWlMV0Q5d2Vpd3J4ZjRxanRYQjVK?=
 =?utf-8?B?NlByMzBwWFo5cEZUK3IyM3hVTlViM0tzWWZDSVpMN2lxNWNhbjh2TFNUbURk?=
 =?utf-8?B?VHFLUjY2MzBuZndweGVLbzBOMlU4cTZhY0Y4aUdOMmhMOThGVDhQUDY1U3gr?=
 =?utf-8?B?MmJxZDhkN3V4R2E3czhJS3h1ZkpMU0J4QWllbjF5VEZ0Y1hPMEMwblJhUVZY?=
 =?utf-8?B?QTV4OVBHMUp6dmNCY3ROSWZ6ZERyMEF4TlFxT0lyRVRhcnNwdTBic2JYdWdE?=
 =?utf-8?B?RHh3NE80Q2dzRStjZW5MOVNpbWlWNzhlemQrZ3V6YzYxbEZac2Y0ejYrTHpm?=
 =?utf-8?B?Y3ZvRDk1Q0Z6N0VQYWVXTG45SWNDelpId1dxRlZNZU1WVUY1V0lQU0RiL1lG?=
 =?utf-8?B?M1U3dnZjb1pKdXdHZWZFSVN4bDhBeTJWaEhZc3krNUo3OFZJUTcySDRWTS9W?=
 =?utf-8?B?bGtva2hKYzJjWEdWc3VIcHNSUEFnaFFGL1RFTWFoV1p3VE52QWszaGJHNEVp?=
 =?utf-8?B?MTRtcDFRbDJKTHllYlgwUGpLL1Z0TnhzdGNxblpNZ20vR2N3dkZuRGordkgx?=
 =?utf-8?B?T0hITGpoaEs4MWI5aTBWNmJGWm9rV0I3VTNacXZZN3FnbmdXYkYxaElmVVY1?=
 =?utf-8?B?TEIvcjJuUVNCVzZ4NkZMTTI2TFZoK1kxQWZSSTZrbDFkcmtjenlDREE2dlc4?=
 =?utf-8?B?Y3d0ckt6UENIM0pUVXdWWkMxdUdjVnNXdGVKOG13MmxOTjEwUkliTW9ZRm5T?=
 =?utf-8?B?K1htRDNoUmk1VEJpNEhacU5qMlFpVHBSclIwS2gzdGNNSSt1ay9zWnJ2QmVK?=
 =?utf-8?B?WEhXc1FDNzRRR3ZmcENBS2YrVVRYdjcrSzh6bUdNRjkvL3VHSmJDUkJIbmdi?=
 =?utf-8?B?U3RTZEtIMzlkUlMwakRNQjF0YjRqVm5iMzFYSXVzeVBsSzJ0ZTYrc2c5aUQ3?=
 =?utf-8?B?TXZvaTc3L1Z6a3A1WGhVVlJZVXRjdXVCN3NWb1htdzFISWNnYVg5eHFncjVI?=
 =?utf-8?B?RzEzQ25nZnNDd3hPQUpGaDNWbm4yMGQ5WVB2VlFDQmRMaHN4ZEQ5OHRtZ3ZW?=
 =?utf-8?B?QVlScDhCeEZsY1d5NmJTNXBoSVNiem85YWdCNGFzSlZQdnVFelRQTkFCS0ht?=
 =?utf-8?B?OVFUbWtmQnNxRG9SN3VmV0hEUmNmUFdOd1lwbmRFWnYxQ3J0YmJHSDJrRXpu?=
 =?utf-8?B?L0svUTkvemtCRjdzTUJkVjdRMDJZU0l3MkcrM291OGwyWHBYOGROTXFKc2Vw?=
 =?utf-8?B?NkxRNTNDSDhZQTRrY1JuTUFxelZiUUM1RjBmNDNtZm9xMHI4dXczTFIvOEpp?=
 =?utf-8?B?MVVHaDdNL1pNSEdWdzJWSkNqcEI1TWx2WUVpb0RENGlxQkYrQUJUQT09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ffeb9bf-cfd3-43cd-49e0-08de859c74cb
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2026 09:46:55.5425
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DKETK+ifeb6heoTN8F5OHaUXLRmL1GrxKivlDZERPDmXOj2EkgjIZ9q/75hX4VM5weCcVEDTFThnI156nDK0hw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10453
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-35126-lists,linux-usb=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xu.yang_2@nxp.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[nxp.com:+];
	NEURAL_HAM(-0.00)[-0.995];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:dkim,nxp.com:email,nxp.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 63EDE2C92DA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

If the chip indicates its "Connection Orientation" standard output control
in STANDARD_OUTPUT_CAPABILITIES register, it can do the thing by
programming CONFIG_STANDARD_OUTPUT register. Due to the optional feature,
the chip which not present this capability currently doesn't have a way to
correctly set the data path. This add the support to set orientation via
a simple GPIO.

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

---
Changes in v4:
 - simplify gpiod_set_value_cansleep()
Changes in v3:
 - use "err = !!orient_gpio"
Changes in v2:
 - return early in tcpci_set_orientation() if using gpio method
---
 drivers/usb/typec/tcpm/tcpci.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/usb/typec/tcpm/tcpci.c b/drivers/usb/typec/tcpm/tcpci.c
index 8b7e6eb92ca2..0148b8f50412 100644
--- a/drivers/usb/typec/tcpm/tcpci.c
+++ b/drivers/usb/typec/tcpm/tcpci.c
@@ -7,6 +7,7 @@
 
 #include <linux/bitfield.h>
 #include <linux/delay.h>
+#include <linux/gpio/consumer.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/i2c.h>
@@ -42,6 +43,7 @@ struct tcpci {
 
 	struct tcpc_dev tcpc;
 	struct tcpci_data *data;
+	struct gpio_desc *orientation_gpio;
 };
 
 struct tcpci_chip {
@@ -316,6 +318,10 @@ static int tcpci_set_orientation(struct tcpc_dev *tcpc,
 	struct tcpci *tcpci = tcpc_to_tcpci(tcpc);
 	unsigned int reg;
 
+	if (tcpci->orientation_gpio)
+		return gpiod_set_value_cansleep(tcpci->orientation_gpio,
+						orientation != TYPEC_ORIENTATION_NORMAL);
+
 	switch (orientation) {
 	case TYPEC_ORIENTATION_NONE:
 		/* We can't put a single output into high impedance */
@@ -903,6 +909,7 @@ EXPORT_SYMBOL_GPL(tcpci_unregister_port);
 static int tcpci_probe(struct i2c_client *client)
 {
 	struct tcpci_chip *chip;
+	struct gpio_desc *orient_gpio = NULL;
 	int err;
 	u16 val = 0;
 
@@ -931,12 +938,23 @@ static int tcpci_probe(struct i2c_client *client)
 	if (err < 0)
 		return err;
 
+	if (err == 0) {
+		orient_gpio = devm_gpiod_get_optional(&client->dev, "orientation",
+						      GPIOD_OUT_LOW);
+		if (IS_ERR(orient_gpio))
+			return dev_err_probe(&client->dev, PTR_ERR(orient_gpio),
+					"unable to acquire orientation gpio\n");
+		err = !!orient_gpio;
+	}
+
 	chip->data.set_orientation = err;
 
 	chip->tcpci = tcpci_register_port(&client->dev, &chip->data);
 	if (IS_ERR(chip->tcpci))
 		return PTR_ERR(chip->tcpci);
 
+	chip->tcpci->orientation_gpio = orient_gpio;
+
 	err = devm_request_threaded_irq(&client->dev, client->irq, NULL,
 					_tcpci_irq,
 					IRQF_SHARED | IRQF_ONESHOT,

-- 
2.34.1


