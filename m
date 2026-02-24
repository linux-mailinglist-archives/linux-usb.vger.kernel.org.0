Return-Path: <linux-usb+bounces-33614-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OMwfE1EYnWlTMwQAu9opvQ
	(envelope-from <linux-usb+bounces-33614-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 24 Feb 2026 04:17:37 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id BCD6A18158E
	for <lists+linux-usb@lfdr.de>; Tue, 24 Feb 2026 04:17:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B4548305BF7F
	for <lists+linux-usb@lfdr.de>; Tue, 24 Feb 2026 03:17:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CD7A29ACF6;
	Tue, 24 Feb 2026 03:17:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="KmaqCVbA"
X-Original-To: linux-usb@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011036.outbound.protection.outlook.com [52.101.70.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABF0223815D;
	Tue, 24 Feb 2026 03:17:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771903050; cv=fail; b=epvCRKe88MevlkBHO1fn/vbpLZLnYa8/+HjP3FEH3uAkOnHljRzPT/c0a7FNugrJ74d7i/pm9rtekH9fVG1lD5jN8FyR22BnkA73f0nPm0BnK/+oWQpypPx7AJ/InxrjUYsHFqke8R2c5T6rtBufndfjlNlmzwsjE0drkcl+8q4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771903050; c=relaxed/simple;
	bh=HNz56ICkbeNxhK9FVGTOmma5qzNFf4iPGS36RxjrxQE=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=eoSwE5hfQrxlQBz9zYMSXvzuZe+pQzk0gFpGKDcQJT9/tbATdu1okrWH1F/4uey9Jw4JI8FnGeHy/SqqSXgIZAyltIxYmQGoA2kaBaEL0ihXazzdaITDX7Cj4d1JEnrd351kBwFEpkEjnDIq0IKGiub1RG73otej6ZYK8gGFuhw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=KmaqCVbA; arc=fail smtp.client-ip=52.101.70.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JQ7cs30+S4ySIJz0M/7/kTua1a/ivQzpWfcqENSyNAZajtfmci63Ltr1Xf7z8KzP35UO+T8hLoyVumTv6kh+tKSax28+6/yXYxjRUXUfJe2qNxQVYy+nGToCN3Jey+CeaovHqz/M1Z0TuZejuuL5qm2stSFbWLz5gBvAshK2dfMB/jruSyrkWcANwEZRclqFHi015Byu8s7GZr5ax0ZWy5AoAF4sgFE8MUqpVPKUhC45XA7mI59F8MVDkhCnN0RiQOU4G2xZwqrx5seTYx7RRmSBcSUFKtaZClzDXUnBLCWiIYeoztB8usr3ZHOtUSaB7awSKvhVzld3BMZRzIdr8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BbAutCZeWSCBq9FrdIIre3PfnmEgzAuWY0bq9tV+YX8=;
 b=Op+iR1P4zkgpDEF9FhkGuJSyi02RRJqqCHN7De72yFHkXctMc2IxSSa8Wm7EyXR97yWWNhwNc93sDKQpSDg0jN06LK5BhzsM5n0WJOjm1uFh2ggi5MilmeM18PWjXZpxvCziC0zxTz048GebDKdCM5UQt4pZlxGMDxAbrzgu79pyOWKgvavdkGpZkH40BHdAdHtjZ6t/kknkYzpN5Zoy3zBIK+wh3Jy1iU1lQZe6CniK3ATUkZCC8cLkDXkb7KGdbRe5ri4gbrNTV5aaaPj7sxLLh7a2Lhk9AGFvbZ5vxpSw7fFE0YfKzvHK+aSoGSbQ4xXbsqkNfD/RNxBXPrOPlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BbAutCZeWSCBq9FrdIIre3PfnmEgzAuWY0bq9tV+YX8=;
 b=KmaqCVbASZU67HMYU/cq3HsvRQTdH6zM0LBX2+o5Y9cirvyr7ibJmDksJmWSnLF0My736ObYeNZFj0Cn7dA9W7NeCf7orjqApG3YZ/PEl3pm7Hl5B7mIVHgOZPhMZ30Jq65NpGwIHQL4eDBszHWC7yZfs6/Ud6rXTQp5Z0dB0ehnTT+CwfnaRi/FemAG2OEsuy+WMf5rmEb0Et2su25wH4sXQ1CymPNIumEf85CQ0JmYIv5v4M+uNV7tKY52n8YzUCCdaqHI90E9VnoSiQjf0k9cgU5p3aQRZVMEuJmvxZI0UTtpuB2exnbIsZbqRUTzCTn35XRtc4R6uWOzbsVd3g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM9PR04MB8825.eurprd04.prod.outlook.com (2603:10a6:20b:408::7)
 by AMBPR04MB11840.eurprd04.prod.outlook.com (2603:10a6:20b:6f2::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Tue, 24 Feb
 2026 03:17:26 +0000
Received: from AM9PR04MB8825.eurprd04.prod.outlook.com
 ([fe80::49d0:5fa7:d131:7781]) by AM9PR04MB8825.eurprd04.prod.outlook.com
 ([fe80::49d0:5fa7:d131:7781%6]) with mapi id 15.20.9632.017; Tue, 24 Feb 2026
 03:17:25 +0000
From: Xu Yang <xu.yang_2@nxp.com>
To: gregkh@linuxfoundation.org,
	m.grzeschik@pengutronix.de,
	stern@rowland.harvard.edu
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	jun.li@nxp.com
Subject: [PATCH v2] usb: port: add delay after usb_hub_set_port_power()
Date: Tue, 24 Feb 2026 11:19:09 +0800
Message-Id: <20260224031909.3546487-1-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR06CA0005.apcprd06.prod.outlook.com
 (2603:1096:4:186::12) To AM9PR04MB8825.eurprd04.prod.outlook.com
 (2603:10a6:20b:408::7)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8825:EE_|AMBPR04MB11840:EE_
X-MS-Office365-Filtering-Correlation-Id: 64e4c274-c5f1-445a-5d2b-08de73533b15
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?RULWiHr3B/9VX96e+UJz36zzJ/g40SO4zkEYsSxOIBqAM1SXaAi8+951DN2/?=
 =?us-ascii?Q?mdd6xnPCKsP6Dm4DCcxJ/DRGMmJ689ricmsS2sCvn5v5ROh6RKVmCvZAnmCW?=
 =?us-ascii?Q?QJ83M6w3UhAlGhHKvKAa8VKacCRbndmzOT4GVGC8a0L5Sx5TOvjkv/HnO8MA?=
 =?us-ascii?Q?oLL+2yU6pjc6gRNwXI0cpbINc3trFBV7UxvjoEsYq+RFqoOcHKTgHQwiGGld?=
 =?us-ascii?Q?+ZGJuG8JUtrtrgX2TMs448ObjsjLigbUqsEzIdpuF+WtSxXW0yIbtoG+n2DH?=
 =?us-ascii?Q?wq0J9x+dSu/yCcWWM45PA63InyimnPRjHTFWXOCVE6PeGbymxlq+o4Q+cp0I?=
 =?us-ascii?Q?2m6AcpoN0esO3lDPqpmkHZPeyzr3pt/l4Q+5B7YCzUHEOEWHNDGC0WjFFE5J?=
 =?us-ascii?Q?ZUAWjHg3krgtJLj8GvmDxWQkkuGJLlS4nbKUUJIfPO6ubwmvBvvr9XqyA32H?=
 =?us-ascii?Q?MbNxDPPs7dhLP2Wm0i193HIdP6DJ18cLX8vTY+LG7997CnaPBEfeJxgvozWU?=
 =?us-ascii?Q?wgqjFATUEol4A62O8v42Ttjx1717fh1K7Zau130xU2XKT51tpBlc6a4Jqcs8?=
 =?us-ascii?Q?5DY7/zwFX4SHQ1X70V16zQZTPNOeON+Yju36ORiE0jH3DpiMQwK4FHF5gpu+?=
 =?us-ascii?Q?/ChTdZtcCijJdgqy+QUOEocfb8ZIMssVrVtfaRchuzaTmQr8nSxGRHErmBgz?=
 =?us-ascii?Q?svJ8Og2vq/uTQDavnRgUIvcvQ2ZSCeFecol80NPTsdGpFZp92Dba2aFnhZzp?=
 =?us-ascii?Q?J0KMpYT9hJIon28qX0NVafKj1BebZnNx/9k6XiLW9TM/CnA4FjpzlsBdI4yq?=
 =?us-ascii?Q?8pQKyj3+JaJXFBI+BhAcqhHSJoYQ17KH6YML4Y+lV4Fk/6KvEO1bTmz8paSm?=
 =?us-ascii?Q?3LSK97iK9+K01BZiWSp4bgaMbX2X7S1kS9TuBaow2MvPz4AipN4r0zpkEnTI?=
 =?us-ascii?Q?IVJVogwnTSR+mZX/ppvaUJ7OovWej67I3H8i8kF+5pjglnyrnUWMvKQyn4Xs?=
 =?us-ascii?Q?5w3Wb4oao+4GtuCBuu97JuAZTjkChgJS0OwhLKoKEr8T1+rlcI4TVug4AWvI?=
 =?us-ascii?Q?3hs4ZPATe1apGCxmuPuetNpnSccgFjzGdxuQfflBLXPzIUCcOKvQUcnGdt9G?=
 =?us-ascii?Q?GNoXaJ5Dvrw6SDRFiG3dpZRcn3ihhxvtxZz/BWglrxdBDk3oSNas41ms6EPM?=
 =?us-ascii?Q?IufC1n/8fvmXlaILgMiCGrs4lqBhlpsGjmz0OF1VlZWllUZM5lb0wN2eYSKF?=
 =?us-ascii?Q?KGlNoMMIGKU5CU/9xLz095OVibE/whfLMYGFtGq5EYU7K4dBzGzpXbFpy8KJ?=
 =?us-ascii?Q?dficwUUzeqlOMX/j8J489gI4Aftxp/phI4U4isercFQY8aES1uIzJtl+dvdQ?=
 =?us-ascii?Q?GZ3pJhTW4GPWtS8aWVMbw0lcS1T8RfoO2LCPh10zexQawYgY/y3CZSwRcDEY?=
 =?us-ascii?Q?f4N6ZX3r6t3p4Ax+q2S+3+E+1m3EZypX6kS3E+c98aIn7bu6UZtoN0uAeD8g?=
 =?us-ascii?Q?5FxpRVYAcvIgY2XTpGjjGhrpkJd6A1tkmMgkx2ePifZuXmLaH9aw8OeqOZfY?=
 =?us-ascii?Q?ngYcqi8OL80V3DgOzzQJaLYretiy4dTm9kIG0ofqtleJKPNN4XaOeM/TR/DS?=
 =?us-ascii?Q?Ghfl7Q2UKMrAUAHpBPjMBFQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8825.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?A66gsEEaQwScwAANZOSNs5Ex2dzb3lUVtC2Ytdn3nzFG4EKMRC5NC7HfIrhm?=
 =?us-ascii?Q?W8U0QYG5Vftb9x3h2FjpGHyPKaTNDAgI76RnkRGMiHGBN0MGWgLJxFPasIt1?=
 =?us-ascii?Q?HhzmBeIqJUJZiDmFeO+8XZCrcvJqfGP5EBqVf5QWuY8MTjSrieDYMRQphUjn?=
 =?us-ascii?Q?tcBsjoRDV1dgZRPHncoIcESkBOLr+MB9hvRRZ/dTBsyb60SO+Pld7MT2Xgyp?=
 =?us-ascii?Q?/NRu9eT8mQa0v1XjsWIAvIWRv68YkMv8iT7utBtEPsGcK/5qBsnI7J1TAt/2?=
 =?us-ascii?Q?Hl2WdhuE3OUkxachFHZCdLBXU5rkGcT0Zh32Kg+ca+l+LRHQRd2/B8V+3Yq9?=
 =?us-ascii?Q?XuiwG++uvEwyUoaGP31MM58FDZNkqCM/AnfxB9LpShQlyfCSUazQsBjdCGRk?=
 =?us-ascii?Q?ABY+56s6L5HWaOOk70NR08LuNYx93vRIDIIjklp2fOkicDsFsWqZd9qNoHub?=
 =?us-ascii?Q?+1wBOcZrA+79HaqhrtkIfxxhSbl3hV2yj/5m8uhC3V7LAkl6KZ0d3vO5Nbq5?=
 =?us-ascii?Q?E4Zbe4203AnqyTqR7+Zi1bBM76yLyBfatfi3Vu69+HOltR4EjnB6aw0vIkYt?=
 =?us-ascii?Q?IdrPLVnCxM9e1pkMKMCgFwrPMUkXOHCmevFp66fHtokxd1hEIbJmvw5OIxIS?=
 =?us-ascii?Q?w9aDggHuQwvh6GbF+MR28mXQwaWWVZtGNEVBZnD6caSKTIeUPTBy1hk/5jDd?=
 =?us-ascii?Q?fTWdd15xmcb+bbPHyOjptYJwV8W/SFKowxl/BY14D+Sj60I7CwE/lxx0LRXb?=
 =?us-ascii?Q?W7gQGOY4XCysVhdTg/ZxMuuEnpp5Tz1zyx0V5Jquhh/5tYDt72gCLhydyJQQ?=
 =?us-ascii?Q?KaaNnDFLBdOsMjehnfAgsAXVhUNG4bEFBGgP+5KKHJhwpMdj2thTH5gkPupI?=
 =?us-ascii?Q?caafsqP8SxsJlW00Om1DnicPAXPxXiJiKMoxe2e23NZlJqE8wqxShF3mLOdz?=
 =?us-ascii?Q?8Ds83jpevuoOem4Os8MIPd6kMgRsBinZz8qrvgzP4FlVZtc3KLGfi4sW8eva?=
 =?us-ascii?Q?JZiMICEVFlfFncDsF9y2/jXMoxCl0b8YeTbUi4StRx/pV7iTuRh5j+vP91TU?=
 =?us-ascii?Q?dEwaraIFinkfGnCB+seL0Ff+qsIvFwRl9iFN6aajpRnJTPcVy5100VNHWUpc?=
 =?us-ascii?Q?Xl+hnoLEyE3MoBhHXvareHMw+TvGLKI8dURAdmIWE/0RjFas/WZyID2gE2Z1?=
 =?us-ascii?Q?psNh7T0xpJB8cs3VcyzACCylUqA1vKd5Lm9e7sEC2XHTcjNsVIvpUlS45ZQG?=
 =?us-ascii?Q?LTqq8F+6O3Hs1EGcFEGt0weu1kLnv8pe3k0ehGw/1FQ6GOqv6bq8KtFX7t2H?=
 =?us-ascii?Q?wYaMn4ke+UoCNr1EBkQwAEsOFzfZ5f4J6qNp/1ZiohL3/Q1LGxVvse857wIZ?=
 =?us-ascii?Q?9YBVC9jTnjoHbnMK5A1pZVZEA1FRVjuqlSuRMjtr0Apd8sAdC5COt8IRm7cw?=
 =?us-ascii?Q?it6LLc2lpvzvsQrLHpWTzL4GRqtLGul1DLsK+dRp4OI+g2QgWNouhbJnYKzN?=
 =?us-ascii?Q?FmbIMGh+6mkTiNeDnax5s6tx38K4fctDS5HCiely7CVC7X8VfH47TsUB9OBc?=
 =?us-ascii?Q?Y0WoOtqduvvSg/mvwW1e96fvGHa63DJWF6f4gdiNkvqdMFH65LlF9UZZu768?=
 =?us-ascii?Q?ffEbnH18CNPTHHkVxU23h24IrGGmoutiXm8TN+NlbEoNFxoFChxGXlc9OKkj?=
 =?us-ascii?Q?ke5DoMByXhueArw0AwRSHNTqqbFAGQhCguYYrcGS4De6z5BsPcx/1hDnM+4i?=
 =?us-ascii?Q?6Vm1cyjjiw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 64e4c274-c5f1-445a-5d2b-08de73533b15
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8825.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 03:17:25.2890
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HpMtNwPH4q9bRG1sY4k++sJFzgMmahc2msaixwnQcf+aJ9tdnVDbSI+5L3XZEZz8AK1/vn++Si2GstQQRKsiYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBPR04MB11840
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xu.yang_2@nxp.com,linux-usb@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_FROM(0.00)[bounces-33614-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	DKIM_TRACE(0.00)[nxp.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	MIME_TRACE(0.00)[0:+];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,nxp.com:mid,nxp.com:dkim,nxp.com:email]
X-Rspamd-Queue-Id: BCD6A18158E
X-Rspamd-Action: no action

When a port is disabled, an attached device will be disconnected.  This
causes a port-status-change event, which will race with hub autosuspend
(if the disabled port was the only connected port on its hub), causing
an immediate resume and a second autosuspend.  Both of these can be
avoided by adding a short delay after the call to
usb_hub_set_port_power().

Below log shows what is happening:

$ echo 1 > usb1-port1/disable
[   37.958239] usb 1-1: USB disconnect, device number 2
[   37.964101] usb 1-1: unregistering device
[   37.970070] hub 1-0:1.0: hub_suspend
[   37.971305] hub 1-0:1.0: state 7 ports 1 chg 0000 evt 0002
[   37.974412] usb usb1: bus auto-suspend, wakeup 1
[   37.988175] usb usb1: suspend raced with wakeup event         <---
[   37.993947] usb usb1: usb auto-resume
[   37.998401] hub 1-0:1.0: hub_resume
[   38.105688] usb usb1-port1: status 0000, change 0000, 12 Mb/s
[   38.112399] hub 1-0:1.0: state 7 ports 1 chg 0000 evt 0000
[   38.118645] hub 1-0:1.0: hub_suspend
[   38.122963] usb usb1: bus auto-suspend, wakeup 1
[   38.200368] usb usb1: usb wakeup-resume
[   38.204982] usb usb1: usb auto-resume
[   38.209376] hub 1-0:1.0: hub_resume
[   38.213676] usb usb1-port1: status 0101 change 0001
[   38.321552] hub 1-0:1.0: state 7 ports 1 chg 0002 evt 0000
[   38.327978] usb usb1-port1: status 0101, change 0000, 12 Mb/s
[   38.457429] usb 1-1: new high-speed USB device number 3 using ci_hdrc

Then, port change bit will be fixed to the final state and
usb_clear_port_feature() can correctly clear it after this period. This
will also avoid usb runtime suspend routine to run because
usb_autopm_put_interface() not run yet.

Fixes: f061f43d7418 ("usb: hub: port: add sysfs entry to switch port power")
Cc: stable@kernel.org
Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

---
Changes in v2:
 - improve commit message
---
 drivers/usb/core/port.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/core/port.c b/drivers/usb/core/port.c
index 44e38f922bc5..027a5f21c5f7 100644
--- a/drivers/usb/core/port.c
+++ b/drivers/usb/core/port.c
@@ -141,6 +141,7 @@ static ssize_t disable_store(struct device *dev, struct device_attribute *attr,
 		usb_disconnect(&port_dev->child);
 
 	rc = usb_hub_set_port_power(hdev, hub, port1, !disabled);
+	msleep(2 * hub_power_on_good_delay(hub));
 
 	if (disabled) {
 		usb_clear_port_feature(hdev, port1, USB_PORT_FEAT_C_CONNECTION);
-- 
2.34.1


