Return-Path: <linux-usb+bounces-33008-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0O8kOUPGgGl3AgMAu9opvQ
	(envelope-from <linux-usb+bounces-33008-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 02 Feb 2026 16:44:03 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CDDFCE642
	for <lists+linux-usb@lfdr.de>; Mon, 02 Feb 2026 16:44:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 756153040326
	for <lists+linux-usb@lfdr.de>; Mon,  2 Feb 2026 15:42:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 375CB37BE84;
	Mon,  2 Feb 2026 15:42:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="iVumYhiP"
X-Original-To: linux-usb@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011039.outbound.protection.outlook.com [52.101.70.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0ACC37AA89;
	Mon,  2 Feb 2026 15:42:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770046967; cv=fail; b=IYhVYZpX2Wdr+fjFIZwij5m3Z9jXyRtjmow00Zh000ONV+8E9wNl6SW0WVohI0w+81y4BEkg8steL+41QukcAvMJXZXLgMOoINbQMGRVJ/18ZWQhwYh8OAGgy6WfFkETmLJ8vWn9+5dh+P1PBLRDxjVBeL+NrVc49MkD1oa8euw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770046967; c=relaxed/simple;
	bh=PVhWWg6napYOme/NYKjaqmgyLaGpBBvb/979byBf8Cs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=X3+Esc0ADgPRs690m3+r08Mmg7vf2wvazrHGyfX6Kx4cE/9Q5Jwu0rA3BWhNkZBGvqKSLJky35+Jhhkgm1/+3ZkKr2gKy0AxX1ETNjtw40BnLJsMPq1P28II09aZzSbGQmrZENRp2KDnbeDMfbYRkugH+ZBNY382GxlhMMCC80o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=iVumYhiP; arc=fail smtp.client-ip=52.101.70.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tR6mb6rT4TVUc/6y8GAwl4K5H+itb3bqCKJq/QxYHQpC7Yp66OR7mV6HEBDp3anGvv3D7pglIAqKIhryPNuYnKN3MWqoHAFXoi3xhTxBAbZAtGXCH6KbYs1beiW1wF/Ze/Mckz1t29oQgMcHhBxQTIUonkQ5EaQY9jOCPs0nnQ7LwDSH2qPANHWZNEtqiRaAMUjUx/CcuuCCogB7HVz5bgKJZ6FeSz1388YxR81lzqwfJsLdurkaLlh/u/uIQU3KWsxxMSM09qhCeBoSRIh5EK7h6j+fT7hqs3GFBxYPTdayolqFa5OXSlJzRQLdjj76FJ8/c+ObzN3KkuTE8YEOWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DrddJk7i28REvpZYf0gwuj+Oh1doYWns99hrPPEwvvs=;
 b=zKxp/R4mXhKSO0lQIm364Cxt6iepWnNRDfwkyE8wE94mm4YiY6c8KU5ups8Wz9IRUYahKvfyuNfyH30dwyJxZhsZpvpOMH2ZkWCBSkVUJdEnMDGLhKM5hFYa9ZAxHUXD6LRtCtM1uo9v2eA9PGCrzUvDlThZKtENw2HRIQFjDfypo+91L4j8feb1YuY10vvwXS7e2UIXIx5GpFzORoDmvpA8wfYUUS5cn6bXt/0HyDMCB7HwhoR6/CIyZ0KDq3Im6DrSHSc1ZXX+/Orr8e0UvY6vFdOu1nwsBA0pKtWL2nOUW/CrWfo8t9/xodcw8y8V7bYpsQ8F1rT45XRF/9OSSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DrddJk7i28REvpZYf0gwuj+Oh1doYWns99hrPPEwvvs=;
 b=iVumYhiPNHAg3B8xie3TOcqBU6kGT1Ml/6Br9QGLaFzQoVx8ueA+D+Xcr/ZUJzjlMzj0JYDvedXbS7+UYDB8vxH8ysTMuW5PvrVtOGGzXx/Ouv83PfXQl3tkdJhbGmn0QwtBJXbLXKLuPgbTyXNvJfDYsczWmrXi9dFoHNyq53QibHuT3o665lPKddXwL0pFOd4lhttlsHeSe/PJrnIeXvPjGuFMc778UPcxCuO9z8CcsPnhw9sr6oRfbWbJMDf8DkT41vO6hyuHo3xqtshyH8HOQ3s2JtcyRKInZ8yGST7loaFW8htdYmv3InB4iwMNnbykJNJ8dlaXoqnMt5BNWQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by AS8PR04MB8835.eurprd04.prod.outlook.com (2603:10a6:20b:42e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Mon, 2 Feb
 2026 15:42:42 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9564.016; Mon, 2 Feb 2026
 15:42:41 +0000
Date: Mon, 2 Feb 2026 10:42:33 -0500
From: Frank Li <Frank.li@nxp.com>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Li Jun <jun.li@nxp.com>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] usb: dwc3: introduce flatten model driver of i.MX Soc
Message-ID: <aYDF6UkzX+GkuN9r@lizhi-Precision-Tower-5810>
References: <20260202-add-flatten-dts-based-dwc3-imx-driver-v1-0-c44a5e919380@nxp.com>
 <20260202-add-flatten-dts-based-dwc3-imx-driver-v1-3-c44a5e919380@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260202-add-flatten-dts-based-dwc3-imx-driver-v1-3-c44a5e919380@nxp.com>
X-ClientProxiedBy: PH8P220CA0003.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:345::27) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|AS8PR04MB8835:EE_
X-MS-Office365-Filtering-Correlation-Id: 2de4ffc0-8475-493c-bc35-08de6271b353
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|52116014|1800799024|19092799006|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?MxS3kvBm0o/CzvIe7T22t/4QCnEiiB9MgIdLAvUzgGPy0ewzdpQzjvIcWi6B?=
 =?us-ascii?Q?irX6kgTeqtMphMeU9rDkoh8Nl4MUTAFaU9bgBNB3U431v3aZ4JaYVIogEzsF?=
 =?us-ascii?Q?t/deoCNTND0VKPEieLVfFUKocKnvo0oFnflBDQZ2I4I9sOr9hifZ4n0lBDS6?=
 =?us-ascii?Q?NPcIXiN2/fRQ4EiC4SrgoVYI/ARtxP536k2MjgtBKFhka3fNk2D0GiSrd5bq?=
 =?us-ascii?Q?MDEZeTJ/Ftrw1g709zL9TLNFj0PsGYm0a77I7ceglwWjEGczp9haP+Im7gCf?=
 =?us-ascii?Q?SqhNp+QzGkly2UzZWhrUySEw6d4ZGEFUBMmMMCfsTGcelgu9S8deaduYD4oV?=
 =?us-ascii?Q?hYP2lyTEVpY/eg0OQbU/OwXdFSlpzGMw/rFkDDgNKsY0SIPt7ERBIO+GFFaQ?=
 =?us-ascii?Q?mmxoDv8YfI7OWZCdDbqkXPvhsemun6z58DWtzvFK+bsJmR1Fa1DQhgVMaUAf?=
 =?us-ascii?Q?KMpskQ6zfpooo93ReRoTE0l9xpCRhd2zyANyd5z2eEBJDYTG/lWauTdQFnpi?=
 =?us-ascii?Q?lkNtydvzR2DdGr73KZHXnMhWo9lyaJj1vG4zVpQzRXtAzH/4LWPL//eZo1qZ?=
 =?us-ascii?Q?P9tU+MY4xNcQTgA1FuMLto3NZca/QEKKzcwYjUdLhLnrGyMThHZ1+2aDTU1R?=
 =?us-ascii?Q?Ac89gtafsUgrXnstq7oLxoqYwnpVLxaz9n+m+P3eIm4OK+Ls0QduEQOt4zX2?=
 =?us-ascii?Q?OnhiWNUWrUKzjSNEZW6IOwPWFTATbxlAo4fffQ7pN/P5LKNE130kASkTf6Yr?=
 =?us-ascii?Q?2bYHhVpqUYMBkb4BLWbzmI1OeRmagng83Q2DuqrOJzrnlx8UZ/ouc3gItPmY?=
 =?us-ascii?Q?N5fbgGFDhUWMHwwDUTlkhDmiB01XsIIssJzf8xl8mpYpSOL6oiDLy5CP+Qf0?=
 =?us-ascii?Q?zDQRO1FtqEeevtIhNvlpWix3A8naVfHGrNr5mfFwOJ3vdkgTeil1bDxTbjZb?=
 =?us-ascii?Q?MGSmlwd/tTE+aLNvVb1TRl1QtccBLsg65271ogCqONLSC82NhRSSBg02m66E?=
 =?us-ascii?Q?kGTHtCCPCDsf9MpUYaQf+HtaMNzugp1XBrnxHmCYr1sLlMdGjw4zTi5Wk7YA?=
 =?us-ascii?Q?815ulTOu5tLSqIFQcjon1gNfTSELp0mcw9Kh6UIGCZvUbU2TpXLMbwZlfwxS?=
 =?us-ascii?Q?uyW5K7/4NpV8iBTU6hRiiby39fCqfImxYi4Q+cXJ2rMP+bKX1XZHuydXKW4K?=
 =?us-ascii?Q?4SHLgumujZcK5Si3aUadWGOYP7UzerUr1wYg88lqNqcgp2lqJE5cHhNSNEXO?=
 =?us-ascii?Q?YGsCn/JOQgxdsIpxF8B795SOOs3i0HonMB+X3H7qBFnQu5zMQ9BDdpdZrmmW?=
 =?us-ascii?Q?BbT1mBEyEN+RwOi0qctMexv/Te2eWL+/U0+yjiisqSMKX3llqL+BORhQYjID?=
 =?us-ascii?Q?e35gvYiLg03F5n6GGqYyKNZPsEgFehV7guGbaUGnh/XpZn/WvDNA6jkX5yKR?=
 =?us-ascii?Q?QGHFZbhB6aF8HuRdLTZNsqmTsgt6WeKH39HXYzyecryZ1Q5dFyh0A6DuMv42?=
 =?us-ascii?Q?WxydSyvOnA4+YusXWinQQTtNT5pEGxLSRVJWoZo+k7Nt5n46KaP7Cw9PSw/q?=
 =?us-ascii?Q?DyZ4AK1WoWGQ3H0+Rw/JHiepWxPMzNaDtKQ8jtgb42ChYbWaVyMlaxKhvFDN?=
 =?us-ascii?Q?ZEPLsylvkgsO7huwcgh+yH4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(1800799024)(19092799006)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?r7YykntAbDGsxGR6+c+7WcJlhDG53Ee1GKJnYUcZK0YJ2vsiviKVm5c/CtXP?=
 =?us-ascii?Q?SJ7cJL+EOdUefAwKiyYSeTlqhLRHhDQfkM5pySeCL4RKtlg3YGnkWi82hlGj?=
 =?us-ascii?Q?VDxQ5i+ZFuUr85QAjpHHifLTzvuBMZmpABmPFYHvCo42QSAq8vd4RWIJDL3y?=
 =?us-ascii?Q?GWrlsMjaaj8Z66eSdHrGkIZXDh56A3UXid3J+uuacmR8nUMsEHYIkJFOoEB5?=
 =?us-ascii?Q?xzNun3XTM+g2Om3qXfvLf2DE56eg9he64TCEblkTSZIHzPQTE2YUBNGCh70/?=
 =?us-ascii?Q?AWPmrY5WIYUS2p5wuVZXySEm3uV/3XuXsIdIsKkNT4y2q52b5EsDx/fBQp05?=
 =?us-ascii?Q?rFu6UXrN5CEsOb5UDBmhHcUH3nCOB3E1DpvljHYZ1iuQTMlePo9DOKTP+zNj?=
 =?us-ascii?Q?DPDPcBvHBpmzaThcNkpvpl21zXXPiCjlOY/O7OHHqBFUJOIThoeaQBmDYMMc?=
 =?us-ascii?Q?/u/K5PaJBkndZ7kzF2OwhaMva3i0qv3GzAI/Ic9AcApqTD32dFdcf0tfDixG?=
 =?us-ascii?Q?YlrJPMZTGaT/eb7EH2kQRNd/R1NCiL8b1uaJtBdw64lAr0AK09FVH4DC3kjY?=
 =?us-ascii?Q?/JQjJyfxTYMpsrWMNFepCraeoRo2sZmW2kgqw9ix8TemNc6ZuoR3vMlSgvA+?=
 =?us-ascii?Q?SPQJVMA4geYUhiu9d3rGPFwifmZUjeS2cGhSlDlOi+q58K+ON9uHV/d6ZIiz?=
 =?us-ascii?Q?RTtT8s+4iLnGxhjLfcJUey1k81pap9KlJ/gKE9jSEClvoG6VjHZvQIQ48uiq?=
 =?us-ascii?Q?ke347RwWivM67Ia+RxryJJoqL5bRH8zdUNoU3Wb7rcNe3GAsq4Nw2tkfxHSc?=
 =?us-ascii?Q?HDRR9r6b3XVMpu72yA+iqtPdZ0J9a0La/saKfixvvJWNv1cvFoJ9EEJ4OHso?=
 =?us-ascii?Q?k38Pr1nIWZ6WiU1JB9SzsiGyfNFIc48ZgstdjHYtJIuHkfERcyjdQhSuZQ7h?=
 =?us-ascii?Q?zhpifAnAat5J5rgmFllmneKm+CASeYggtkTFHjrfQ0D15GHCaOaOtLUMQgaI?=
 =?us-ascii?Q?p/2kiytnnjMhxX4yt7Wxt+C1NbFR61lIgZNh/Fmg6FPt/ZpFO5T1guQrM4ct?=
 =?us-ascii?Q?U1m22Bs9ezHvOq1r4C3jViK45egPFq2auNmgRsreZEKe7rnsZuikamAkIIA1?=
 =?us-ascii?Q?sPNH5mUkiM3zsV6vDvCgPWhQcGoEBeVL0e+6MKPwPodTiMAzT6QB05zoV9mr?=
 =?us-ascii?Q?GnnEPPOX8XBcu2JZ4TQ7SzUE2eZIshJB2gFgHbquyRCLN33sTRIxADsYnEgN?=
 =?us-ascii?Q?5DVTrYBn5NccuzEchTiFwvzP22q86+Ugw0v8MhYJxMBqx9PpT7sAFYQdDeA0?=
 =?us-ascii?Q?XEE1ZRtMwlrxj8qxtvdj72ME5Om9VpNl26M63r1mq4uIF9VGZOgck/kubIfU?=
 =?us-ascii?Q?M5pOkaOdp8k60Y01Wicav8LbvMqaxxLGRtUu/2EJzsFhMBfGM+FpsK+Em+bT?=
 =?us-ascii?Q?VBd/ZMcbsF7fN7N8XkTsxDRaY7ifQ3cDh5dltc1iLG8J70nxxIiddiYe6OOi?=
 =?us-ascii?Q?eat99jKgqLX2xKU99ms3ED23I2v+Z2o1Ch7lussE0HA/yGwHBp/aF+5oo+xR?=
 =?us-ascii?Q?R6HoKdEzhyRYiAh6ZgApMQCLbH2Hds8QUhv9kjlG8d9rlGJiPSYJp64oce4D?=
 =?us-ascii?Q?38GZin3SKIoRrmSVwRW4qc2qo2W2f0vD6jB8wwARckf7XD8thNGRzwPBH8aX?=
 =?us-ascii?Q?UotjHP+aTl8s2Ohjx2ztMuKHkVj6J2p6LUFWKi4y+Mn+w0oR?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2de4ffc0-8475-493c-bc35-08de6271b353
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2026 15:42:41.6073
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YBg3Qxgh+gn0HfFfzETgeBxVnZD7lftXT5Mtc3CYUvGz0KpS6k9L/kBJVHpZQpu+vYDrJeh0S094Vck69f7n/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8835
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33008-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FREEMAIL_CC(0.00)[linuxfoundation.org,kernel.org,pengutronix.de,gmail.com,nxp.com,synopsys.com,vger.kernel.org,lists.linux.dev,lists.infradead.org];
	DKIM_TRACE(0.00)[nxp.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Frank.li@nxp.com,linux-usb@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:email,nxp.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,i.mx:url]
X-Rspamd-Queue-Id: 5CDDFCE642
X-Rspamd-Action: no action

On Mon, Feb 02, 2026 at 06:27:47PM +0800, Xu Yang wrote:
> To support flatten dwc3 devicetree model, introduce a new driver.
>
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> ---
>  drivers/usb/dwc3/Kconfig    |  12 ++
>  drivers/usb/dwc3/Makefile   |   1 +
>  drivers/usb/dwc3/dwc3-imx.c | 428 ++++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 441 insertions(+)
>
> diff --git a/drivers/usb/dwc3/Kconfig b/drivers/usb/dwc3/Kconfig
> index 240b15bc52cbd5d5c9d08d9fddd8c63202de1a3c..18169727a413ee72405a89f477e4da16946e1764 100644
> --- a/drivers/usb/dwc3/Kconfig
> +++ b/drivers/usb/dwc3/Kconfig
> @@ -150,6 +150,18 @@ config USB_DWC3_IMX8MP
>  	  functionality.
>  	  Say 'Y' or 'M' if you have one such device.
>
> +config USB_DWC3_IMX
> +	tristate "NXP iMX Platform"
> +	depends on OF && COMMON_CLK
> +	depends on (ARCH_MXC && ARM64) || COMPILE_TEST
> +	default USB_DWC3
> +	help
> +	  NXP iMX SoC use DesignWare Core IP for USB2/3
> +	  functionality.
> +	  This driver also handles the wakeup feature outside
> +	  of DesignWare Core.
> +	  Say 'Y' or 'M' if you have one such device.
> +
>  config USB_DWC3_XILINX
>  	tristate "Xilinx Platforms"
>  	depends on (ARCH_ZYNQMP || COMPILE_TEST) && OF
> diff --git a/drivers/usb/dwc3/Makefile b/drivers/usb/dwc3/Makefile
> index 073bef5309b5b5d381c8c4690221091b4df7904a..f37971197203e1379d554da9d60860360ea9c3fe 100644
> --- a/drivers/usb/dwc3/Makefile
> +++ b/drivers/usb/dwc3/Makefile
> @@ -55,6 +55,7 @@ obj-$(CONFIG_USB_DWC3_ST)		+= dwc3-st.o
>  obj-$(CONFIG_USB_DWC3_QCOM)		+= dwc3-qcom.o
>  obj-$(CONFIG_USB_DWC3_QCOM)		+= dwc3-qcom-legacy.o
>  obj-$(CONFIG_USB_DWC3_IMX8MP)		+= dwc3-imx8mp.o
> +obj-$(CONFIG_USB_DWC3_IMX)		+= dwc3-imx.o
>  obj-$(CONFIG_USB_DWC3_XILINX)		+= dwc3-xilinx.o
>  obj-$(CONFIG_USB_DWC3_OCTEON)		+= dwc3-octeon.o
>  obj-$(CONFIG_USB_DWC3_RTK)		+= dwc3-rtk.o
> diff --git a/drivers/usb/dwc3/dwc3-imx.c b/drivers/usb/dwc3/dwc3-imx.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..57b175e929d7e163df5af7e2265ab7117fa1dc9a
> --- /dev/null
> +++ b/drivers/usb/dwc3/dwc3-imx.c
> @@ -0,0 +1,428 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * dwc3-imx.c - NXP i.MX Soc USB3 Specific Glue layer
> + *
> + * Copyright 2026 NXP
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/interrupt.h>
> +#include <linux/io.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/of_platform.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm_runtime.h>
> +
> +#include "core.h"
> +#include "glue.h"
> +
> +/* USB wakeup registers */
> +#define USB_WAKEUP_CTRL			0x00
> +
> +/* Global wakeup interrupt enable, also used to clear interrupt */
> +#define USB_WAKEUP_EN			BIT(31)
> +/* Wakeup from connect or disconnect, only for superspeed */
> +#define USB_WAKEUP_SS_CONN		BIT(5)
> +/* 0 select vbus_valid, 1 select sessvld */
> +#define USB_WAKEUP_VBUS_SRC_SESS_VAL	BIT(4)
> +/* Enable signal for wake up from u3 state */
> +#define USB_WAKEUP_U3_EN		BIT(3)
> +/* Enable signal for wake up from id change */
> +#define USB_WAKEUP_ID_EN		BIT(2)
> +/* Enable signal for wake up from vbus change */
> +#define	USB_WAKEUP_VBUS_EN		BIT(1)
> +/* Enable signal for wake up from dp/dm change */
> +#define USB_WAKEUP_DPDM_EN		BIT(0)
> +
> +#define USB_WAKEUP_EN_MASK		GENMASK(5, 0)
> +
> +/* USB glue registers */
> +#define USB_CTRL0		0x00
> +#define USB_CTRL1		0x04
> +
> +#define USB_CTRL0_PORTPWR_EN	BIT(12) /* 1 - PPC enabled (default) */
> +#define USB_CTRL0_USB3_FIXED	BIT(22) /* 1 - USB3 permanent attached */
> +#define USB_CTRL0_USB2_FIXED	BIT(23) /* 1 - USB2 permanent attached */
> +
> +#define USB_CTRL1_OC_POLARITY	BIT(16) /* 0 - HIGH / 1 - LOW */
> +#define USB_CTRL1_PWR_POLARITY	BIT(17) /* 0 - HIGH / 1 - LOW */
> +
> +struct dwc3_imx {
> +	struct dwc3	dwc;
> +	struct device	*dev;
> +	void __iomem	*blkctl_base;
> +	void __iomem	*glue_base;
> +	struct clk	*hsio_clk;
> +	struct clk	*suspend_clk;
> +	int		irq;
> +	bool		pm_suspended;
> +	bool		wakeup_pending;
> +};
> +
> +#define to_dwc3_imx(d) container_of((d), struct dwc3_imx, dwc)
> +
> +static void dwc3_imx_configure_glue(struct dwc3_imx *dwc_imx)
> +{
> +	struct device *dev = dwc_imx->dev;
> +	u32 value;
> +
> +	if (!dwc_imx->glue_base)
> +		return;
> +
> +	value = readl(dwc_imx->glue_base + USB_CTRL0);
> +
> +	if (device_property_read_bool(dev, "fsl,permanently-attached"))
> +		value |= (USB_CTRL0_USB2_FIXED | USB_CTRL0_USB3_FIXED);
> +	else
> +		value &= ~(USB_CTRL0_USB2_FIXED | USB_CTRL0_USB3_FIXED);
> +
> +	if (device_property_read_bool(dev, "fsl,disable-port-power-control"))
> +		value &= ~(USB_CTRL0_PORTPWR_EN);
> +	else
> +		value |= USB_CTRL0_PORTPWR_EN;
> +
> +	writel(value, dwc_imx->glue_base + USB_CTRL0);
> +
> +	value = readl(dwc_imx->glue_base + USB_CTRL1);
> +	if (device_property_read_bool(dev, "fsl,over-current-active-low"))
> +		value |= USB_CTRL1_OC_POLARITY;
> +	else
> +		value &= ~USB_CTRL1_OC_POLARITY;
> +
> +	if (device_property_read_bool(dev, "fsl,power-active-low"))
> +		value |= USB_CTRL1_PWR_POLARITY;
> +	else
> +		value &= ~USB_CTRL1_PWR_POLARITY;
> +
> +	writel(value, dwc_imx->glue_base + USB_CTRL1);
> +}
> +
> +static void dwc3_imx_wakeup_enable(struct dwc3_imx *dwc_imx, pm_message_t msg)
> +{
> +	struct dwc3	*dwc = &dwc_imx->dwc;
> +	u32		val;
> +
> +	val = readl(dwc_imx->blkctl_base + USB_WAKEUP_CTRL);
> +
> +	if ((dwc->current_dr_role == DWC3_GCTL_PRTCAP_HOST) && dwc->xhci) {
> +		val |= USB_WAKEUP_EN | USB_WAKEUP_DPDM_EN;
> +		if (PMSG_IS_AUTO(msg))
> +			val |= USB_WAKEUP_SS_CONN | USB_WAKEUP_U3_EN;
> +	} else {
> +		val |= USB_WAKEUP_EN | USB_WAKEUP_VBUS_EN |
> +		       USB_WAKEUP_VBUS_SRC_SESS_VAL;
> +	}
> +
> +	writel(val, dwc_imx->blkctl_base + USB_WAKEUP_CTRL);
> +}
> +
> +static void dwc3_imx_wakeup_disable(struct dwc3_imx *dwc_imx)
> +{
> +	u32	val;
> +
> +	val = readl(dwc_imx->blkctl_base + USB_WAKEUP_CTRL);
> +	val &= ~(USB_WAKEUP_EN | USB_WAKEUP_EN_MASK);
> +	writel(val, dwc_imx->blkctl_base + USB_WAKEUP_CTRL);
> +}
> +
> +static irqreturn_t dwc3_imx_interrupt(int irq, void *data)
> +{
> +	struct dwc3_imx		*dwc_imx = data;
> +	struct dwc3		*dwc = &dwc_imx->dwc;
> +
> +	if (!dwc_imx->pm_suspended)
> +		return IRQ_HANDLED;
> +
> +	disable_irq_nosync(dwc_imx->irq);
> +	dwc_imx->wakeup_pending = true;
> +
> +	if ((dwc->current_dr_role == DWC3_GCTL_PRTCAP_HOST) && dwc->xhci)
> +		pm_runtime_resume(&dwc->xhci->dev);
> +	else if (dwc->current_dr_role == DWC3_GCTL_PRTCAP_DEVICE)
> +		pm_runtime_get(dwc->dev);
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static void dwc3_imx_pre_set_role(struct dwc3 *dwc, enum usb_role role)
> +{
> +	if (role == USB_ROLE_HOST)
> +		/*
> +		 * For xhci host, we need disable dwc core auto
> +		 * suspend, because during this auto suspend delay(5s),
> +		 * xhci host RUN_STOP is cleared and wakeup is not
> +		 * enabled, if device is inserted, xhci host can't
> +		 * response the connection.
> +		 */
> +		pm_runtime_dont_use_autosuspend(dwc->dev);
> +	else
> +		pm_runtime_use_autosuspend(dwc->dev);
> +}
> +
> +static struct dwc3_glue_ops dwc3_imx_glue_ops = {
> +	.pre_set_role   = dwc3_imx_pre_set_role,
> +};
> +
> +static const struct property_entry dwc3_imx_properties[] = {
> +	PROPERTY_ENTRY_BOOL("xhci-missing-cas-quirk"),
> +	PROPERTY_ENTRY_BOOL("xhci-skip-phy-init-quirk"),
> +	{},
> +};
> +
> +static const struct software_node dwc3_imx_swnode = {
> +	.properties = dwc3_imx_properties,
> +};

I met similar case for layerscape dwc. because already use flatten,
directly use probe_data pass these information to core library.

Frank

> +
> +static int dwc3_imx_probe(struct platform_device *pdev)
> +{
> +	struct device		*dev = &pdev->dev;
> +	struct dwc3_imx		*dwc_imx;
> +	struct dwc3		*dwc;
> +	struct resource		*res;
> +	const char		*irq_name;
> +	struct dwc3_probe_data	probe_data = {};
> +	int			ret, irq;
> +
> +	dwc_imx = devm_kzalloc(dev, sizeof(*dwc_imx), GFP_KERNEL);
> +	if (!dwc_imx)
> +		return -ENOMEM;
> +
> +	platform_set_drvdata(pdev, dwc_imx);
> +	dwc_imx->dev = dev;
> +
> +	dwc_imx->blkctl_base = devm_platform_ioremap_resource_byname(pdev, "blkctl");
> +	if (IS_ERR(dwc_imx->blkctl_base))
> +		return PTR_ERR(dwc_imx->blkctl_base);
> +
> +	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "glue");
> +	if (!res) {
> +		dev_warn(dev, "Base address for glue layer missing\n");
> +	} else {
> +		dwc_imx->glue_base = devm_ioremap_resource(dev, res);
> +		if (IS_ERR(dwc_imx->glue_base))
> +			return PTR_ERR(dwc_imx->glue_base);
> +	}
> +
> +	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "core");
> +	if (!res)
> +		return dev_err_probe(dev, -ENODEV, "missing core memory resource\n");
> +
> +	dwc_imx->hsio_clk = devm_clk_get_enabled(dev, "hsio");
> +	if (IS_ERR(dwc_imx->hsio_clk))
> +		return dev_err_probe(dev, PTR_ERR(dwc_imx->hsio_clk),
> +				     "Failed to get hsio clk\n");
> +
> +	dwc_imx->suspend_clk = devm_clk_get_enabled(dev, "suspend");
> +	if (IS_ERR(dwc_imx->suspend_clk))
> +		return dev_err_probe(dev, PTR_ERR(dwc_imx->suspend_clk),
> +				     "Failed to get suspend clk\n");
> +
> +	irq = platform_get_irq_byname(pdev, "wakeup");
> +	if (irq < 0)
> +		return irq;
> +	dwc_imx->irq = irq;
> +
> +	irq_name = devm_kasprintf(dev, GFP_KERNEL, "%s:wakeup", dev_name(dev));
> +	if (!irq_name)
> +		return dev_err_probe(dev, -ENOMEM, "failed to create irq_name\n");
> +
> +	ret = devm_request_threaded_irq(dev, irq, NULL, dwc3_imx_interrupt,
> +					IRQF_ONESHOT, irq_name, dwc_imx);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to request IRQ #%d\n", irq);
> +
> +	ret = device_add_software_node(dev, &dwc3_imx_swnode);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to add software node\n");
> +
> +	dwc = &dwc_imx->dwc;
> +	dwc->dev = dev;
> +	dwc->glue_ops = &dwc3_imx_glue_ops;
> +
> +	probe_data.res = res;
> +	probe_data.dwc = dwc;
> +	probe_data.core_may_lose_power = true;
> +
> +	ret = dwc3_core_probe(&probe_data);
> +	if (ret) {
> +		device_remove_software_node(dev);
> +		return ret;
> +	}
> +
> +	device_set_wakeup_capable(dev, true);
> +	return 0;
> +}
> +
> +static void dwc3_imx_remove(struct platform_device *pdev)
> +{
> +	struct device	*dev = &pdev->dev;
> +	struct dwc3	*dwc = dev_get_drvdata(dev);
> +
> +	if (pm_runtime_resume_and_get(dev) < 0)
> +		return;
> +
> +	dwc3_core_remove(dwc);
> +	device_remove_software_node(dev);
> +	pm_runtime_put_noidle(dev);
> +}
> +
> +static void dwc3_imx_suspend(struct dwc3_imx *dwc_imx, pm_message_t msg)
> +{
> +	if (PMSG_IS_AUTO(msg) || device_may_wakeup(dwc_imx->dev))
> +		dwc3_imx_wakeup_enable(dwc_imx, msg);
> +	dwc_imx->pm_suspended = true;
> +}
> +
> +static void dwc3_imx_resume(struct dwc3_imx *dwc_imx, pm_message_t msg)
> +{
> +	struct dwc3	*dwc = &dwc_imx->dwc;
> +
> +	dwc_imx->pm_suspended = false;
> +	dwc3_imx_wakeup_disable(dwc_imx);
> +
> +	/* Upon power loss any previous configuration is lost, restore it */
> +	dwc3_imx_configure_glue(dwc_imx);
> +
> +	if (dwc_imx->wakeup_pending) {
> +		dwc_imx->wakeup_pending = false;
> +		if (dwc->current_dr_role == DWC3_GCTL_PRTCAP_DEVICE)
> +			pm_runtime_put_autosuspend(dwc->dev);
> +		else
> +			/*
> +			 * Add wait for xhci switch from suspend
> +			 * clock to normal clock to detect connection.
> +			 */
> +			usleep_range(9000, 10000);
> +		enable_irq(dwc_imx->irq);
> +	}
> +}
> +
> +static int dwc3_imx_runtime_suspend(struct device *dev)
> +{
> +	struct dwc3	*dwc = dev_get_drvdata(dev);
> +	struct dwc3_imx	*dwc_imx = to_dwc3_imx(dwc);
> +	int		ret;
> +
> +	dev_dbg(dev, "at %s\n", __func__);
> +
> +	ret = dwc3_runtime_suspend(dwc);
> +	if (ret)
> +		return ret;
> +
> +	dwc3_imx_suspend(dwc_imx, PMSG_AUTO_SUSPEND);
> +	return 0;
> +}
> +
> +static int dwc3_imx_runtime_resume(struct device *dev)
> +{
> +	struct dwc3	*dwc = dev_get_drvdata(dev);
> +	struct dwc3_imx	*dwc_imx = to_dwc3_imx(dwc);
> +
> +	dev_dbg(dev, "at %s\n", __func__);
> +
> +	dwc3_imx_resume(dwc_imx, PMSG_AUTO_RESUME);
> +	return dwc3_runtime_resume(dwc);
> +}
> +
> +static int dwc3_imx_runtime_idle(struct device *dev)
> +{
> +	return dwc3_runtime_idle(dev_get_drvdata(dev));
> +}
> +
> +static int dwc3_imx_pm_suspend(struct device *dev)
> +{
> +	struct dwc3	*dwc = dev_get_drvdata(dev);
> +	struct dwc3_imx *dwc_imx = to_dwc3_imx(dwc);
> +	int		ret;
> +
> +	dev_dbg(dev, "at %s\n", __func__);
> +
> +	ret = dwc3_pm_suspend(dwc);
> +	if (ret)
> +		return ret;
> +
> +	dwc3_imx_suspend(dwc_imx, PMSG_SUSPEND);
> +
> +	if (device_may_wakeup(dev)) {
> +		enable_irq_wake(dwc_imx->irq);
> +		if (device_is_compatible(dev, "fsl,imx95-dwc3"))
> +			device_set_out_band_wakeup(dev);
> +	} else {
> +		clk_disable_unprepare(dwc_imx->suspend_clk);
> +	}
> +
> +	clk_disable_unprepare(dwc_imx->hsio_clk);
> +
> +	return 0;
> +}
> +
> +static int dwc3_imx_pm_resume(struct device *dev)
> +{
> +	struct dwc3	*dwc = dev_get_drvdata(dev);
> +	struct dwc3_imx *dwc_imx = to_dwc3_imx(dwc);
> +	int		ret;
> +
> +	dev_dbg(dev, "at %s\n", __func__);
> +
> +	if (device_may_wakeup(dwc_imx->dev)) {
> +		disable_irq_wake(dwc_imx->irq);
> +	} else {
> +		ret = clk_prepare_enable(dwc_imx->suspend_clk);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	ret = clk_prepare_enable(dwc_imx->hsio_clk);
> +	if (ret) {
> +		clk_disable_unprepare(dwc_imx->suspend_clk);
> +		return ret;
> +	}
> +
> +	dwc3_imx_resume(dwc_imx, PMSG_RESUME);
> +
> +	ret = dwc3_pm_resume(dwc);
> +	if (ret)
> +		return ret;
> +
> +	return 0;
> +}
> +
> +static void dwc3_imx_complete(struct device *dev)
> +{
> +	dwc3_pm_complete(dev_get_drvdata(dev));
> +}
> +
> +static int dwc3_imx_prepare(struct device *dev)
> +{
> +	return dwc3_pm_prepare(dev_get_drvdata(dev));
> +}
> +
> +static const struct dev_pm_ops dwc3_imx_dev_pm_ops = {
> +	SYSTEM_SLEEP_PM_OPS(dwc3_imx_pm_suspend, dwc3_imx_pm_resume)
> +	RUNTIME_PM_OPS(dwc3_imx_runtime_suspend, dwc3_imx_runtime_resume,
> +		       dwc3_imx_runtime_idle)
> +	.complete = pm_sleep_ptr(dwc3_imx_complete),
> +	.prepare = pm_sleep_ptr(dwc3_imx_prepare),
> +};
> +
> +static const struct of_device_id dwc3_imx_of_match[] = {
> +	{ .compatible = "fsl,imx-dwc3", },
> +	{},
> +};
> +MODULE_DEVICE_TABLE(of, dwc3_imx_of_match);
> +
> +static struct platform_driver dwc3_imx_driver = {
> +	.probe		= dwc3_imx_probe,
> +	.remove		= dwc3_imx_remove,
> +	.driver		= {
> +		.name	= "imx-dwc3",
> +		.pm	= pm_ptr(&dwc3_imx_dev_pm_ops),
> +		.of_match_table	= dwc3_imx_of_match,
> +	},
> +};
> +
> +module_platform_driver(dwc3_imx_driver);
> +
> +MODULE_LICENSE("GPL");
> +MODULE_DESCRIPTION("DesignWare USB3 i.MX Glue Layer");
>
> --
> 2.34.1
>

