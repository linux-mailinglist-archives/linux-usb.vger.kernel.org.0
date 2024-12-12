Return-Path: <linux-usb+bounces-18424-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1011F9EE696
	for <lists+linux-usb@lfdr.de>; Thu, 12 Dec 2024 13:24:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E1CCC1881867
	for <lists+linux-usb@lfdr.de>; Thu, 12 Dec 2024 12:24:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19851212F9C;
	Thu, 12 Dec 2024 12:24:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="ZZ4Zqzt/"
X-Original-To: linux-usb@vger.kernel.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2059.outbound.protection.outlook.com [40.107.21.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BDBA211A1A
	for <linux-usb@vger.kernel.org>; Thu, 12 Dec 2024 12:24:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734006245; cv=fail; b=etACOrCz9uhkXKP3+P5AHeOfL4H4R8WpuKBqC++KenkluHUdPQzx0SrJHNWAkHpkWQ+GZjXuaiO8fzwMrsRalZk2blb7L6W4PV8uSbFBRnHL/6hTbWyAZYpduFp5cQvm1tVtTzeSsIf087wjDDaqCp7vE5syqNQI/VK+IIsSFK4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734006245; c=relaxed/simple;
	bh=uugom8MZr59unYpO+TcZ8LzRiPK60ey/Z3zwAGKjV6c=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=Zz18N5FHpmh7s5QK1ahwGfudTHxDHXJpyNVtxooGovGZAQAYQlO4DvKa/hVa+iVUQ1VfFNrJZV8ag5swBVPuFbEnzrmRtGuHur72AfIbH3dLx3NtRPdZRA/6r4aA7nF0AcLcM8iLAEquF8eqZwWZoBH1DgyBkQtPCrZNHc2J9zc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=ZZ4Zqzt/; arc=fail smtp.client-ip=40.107.21.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PkZ1wiKPob/+3+edVhN12e/wfU6eQlBWgouMycv4xThfkIaW3F0khjJiSmH7r48PIRzOoCkz/Nxzen5Lap5Rz4NdgjLM/+8K7ALvtphWhgUygqE46fQrjAvwlVlOxlMkeHcdPZHupCQ9/E+x33ihRduqxiKepqMHSmRvp5pjnl9vJiR7bHVE8IyD3iP4lZdZhufGkwzX5TRx1idObErbpOGwwD23Veupaaoc5R0s5+rKULIphnEC7wVmXwA4kn1cTlneMwHVqLKpMQGHutqWBuZeR/FcgSKd9gpKqO4xVM3zq6cq/0q/zTZ00hcqMawBLqKzRqADkhlieWU6E1QplA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VQbZJAdUSGXWUKP5/XVJotKdg8mmz3wZLzQoZEMWBjA=;
 b=uDNuarMi3XX2fIDjOQugJMFWzTzRptsGIcA0GeM41uyl+KH+rmjo3RQLsIVF1VjpFV8lbEcIYDj55WX4WzgO6FisJ57vRbyyZRy65VOFxP4LZ78HKG9e1Wf8AkKQrwB8Guf5jOnaIqPftJDhA5nEyZR4lVYjmojYg9kYTTC/ZKrI98Vqh35qkxtwxUwi5shUIe+9oJdyyFkLJqxCl5z6HMRXAXrjNtK70cbVnoVNvaK8J/qkBh/84Q4oAyb36O9jrH2H6Td/+d8E3ufL5TYWLOz3V0sE1xc6+QmTuvq4HRuDoXu+XhcHs7zOQHhtvB7guS6NUnJ8uM8jd/L1M2lduw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VQbZJAdUSGXWUKP5/XVJotKdg8mmz3wZLzQoZEMWBjA=;
 b=ZZ4Zqzt/y0enhJWqwGxVCm4YC8Xn+WnCtwuT35hbje5T9bPOG5Lmgusr93ZxeUBJM0duVmd339nrjF+UMP2B+s8MlnW1BQC6QG45WtKarMaw672NpQ2MotNUECshmsYztDNG4+zK6cwhg86GokK60MIm9WWbgz/LTbOCKlZupg88wUOBvc4zgYvJAOap+6lJt458NgUYf/nELYIItyBDa66hE0ftIy1NYHLWgkq5uWsmJH1/QFCwKgEYmB4H3GDAkAZ5IGgMtMwgMFjwQkyPVVkTgW8KU8BMpCpA+A/RF9G+NOVQwmRvuDmjsF40vr08YSS2EModVGOeBReDEnoo/A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by AS1PR04MB9263.eurprd04.prod.outlook.com (2603:10a6:20b:4c5::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.15; Thu, 12 Dec
 2024 12:23:59 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%6]) with mapi id 15.20.8251.008; Thu, 12 Dec 2024
 12:23:58 +0000
From: Xu Yang <xu.yang_2@nxp.com>
To: heikki.krogerus@linux.intel.com,
	gregkh@linuxfoundation.org,
	andre.draszik@linaro.org,
	rdbabiera@google.com,
	m.felsch@pengutronix.de,
	dan.carpenter@linaro.org,
	emanuele.ghidoli@toradex.com,
	parth.pancholi@toradex.com,
	francesco.dolcini@toradex.com,
	u.kleine-koenig@baylibre.com
Cc: linux-usb@vger.kernel.org,
	imx@lists.linux.dev,
	jun.li@nxp.com
Subject: [PATCH v2 1/2] usb: typec: tcpci: fix NULL pointer issue on shared irq case
Date: Thu, 12 Dec 2024 20:24:08 +0800
Message-Id: <20241212122409.1420962-1-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR04CA0013.apcprd04.prod.outlook.com
 (2603:1096:4:197::6) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|AS1PR04MB9263:EE_
X-MS-Office365-Filtering-Correlation-Id: 21712fb9-4f72-4b37-c95b-08dd1aa7da84
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|52116014|7416014|376014|1800799024|366016|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?oKZKmjbMq03pRQI7CS0A0GoAv1jeBXxkwZ1Zjz9XjiC/Pt2M+O+/pYy1fKlk?=
 =?us-ascii?Q?MoRhzvNOCCEt6a+WKlRRmRzr/pIusT4GlV249uS6bHXrkuP9Jm48uHnRSWvB?=
 =?us-ascii?Q?R1iqypY8HBT49A1R8vig8efQJxOhYMcTUQPPDm5sdATa8RiFsPtqjBeH3JXW?=
 =?us-ascii?Q?2jyY4sVQ6ZfrHF9ZcNBc6mPoO9Aat4DlG34GBvXNzqK3iIw0qxcaY/hoUjfN?=
 =?us-ascii?Q?dvrNuHDG0FWecMDE/gAXXAznyz6Yie8YIiCtl+XddP5nwmdRKOBixbTMxxZB?=
 =?us-ascii?Q?ZIIDszBYRF+fadxBL+SbR601KnQ3J0Tp7o7k7tfytay6/Y1DTMPmlkwur2d6?=
 =?us-ascii?Q?QjTp02xECGa6AXkOJTjloka+R/0727igWFtpxun1fw8nSVdaE3Yu57xFUX9S?=
 =?us-ascii?Q?R0CiIB1/cLVkVRtdqrbzNpsem+sC06Krfwszfw7lW0sJX2hk3NJolSB6swQ2?=
 =?us-ascii?Q?vYofPQ6F9jSsmuEggTI9JCbWIGrwTx4x+JdQjb+Jd5dA0fj3RIRfANUop+pb?=
 =?us-ascii?Q?+jLn0qLpiismvF3/zSDXzp/aJhOUc4XPhoWM/664NWmBwz8Krr/9gK0C+iLj?=
 =?us-ascii?Q?DZeE58zFP35M4biAq8yfTv6v0+BQagQR4H52TGb1X9XGp6J0vCnUktjJDdes?=
 =?us-ascii?Q?Q+N93I0Sm7aBP9VtDFtiv5gIXdD4iws88HoUG6N7K+f5uzR4Fi15pxoMIAzk?=
 =?us-ascii?Q?OX3mETapdAkUYbqFrOXtH8yrwnXZf/niUSnsy65WaDrV4jw6+BJGmz5Bl1SD?=
 =?us-ascii?Q?KJYl5afHOljYM+30xNDPy5EPXsEZnOfgY3K/xDGMe4kmcCuS7qi3yxkMxkyB?=
 =?us-ascii?Q?F06VrYlSEeTYCADOS/xPZWpXFvJ0IZshLhfyKTe71SYJMZ/PCSbTtXZgUiWv?=
 =?us-ascii?Q?ETrvcG0CvoG7hugOj7SUh46/+VCdQWoUBVUTeyvrJ+NtTjZPp8beUtvkaIeT?=
 =?us-ascii?Q?VNI1wtJ18SaOHCWBPx0FVbHP4Ihci+ALhai5ntbcOAEl+/JoQtLrwqQYeDOp?=
 =?us-ascii?Q?KcA6+cX31jYwODAopPzYr4xXQLfmjhk21GWQanvkLvht11dOWTZ3gV3LO0kq?=
 =?us-ascii?Q?drTJ2vpt1NxoRxPi02+jL3Rq8R+uYvhkYDTiVQh/4aZnxKaT+CWCH6P4XaSN?=
 =?us-ascii?Q?dqxtOnfmfh6Hgu2tgw3h3TdbrZEQi7QU9ZLnhrNYDSkwfflFc/cOVvqS2C8J?=
 =?us-ascii?Q?FTxzGOnHnaLjDmgq9XOiwtLKUneLjmguShc/x/JNZL52VW4F6XYLwAcpw00R?=
 =?us-ascii?Q?6Z3FniV9y9ShSi00L29uEw3vdAzEJ2BN+jieCDvqJynKKnKooNQUDdW/VjAj?=
 =?us-ascii?Q?yw2PvZGupfqdQLZc8IcSZLqMGwrUNMoa7ixsdxNvu4EEZOLeHzQRJ9ldovki?=
 =?us-ascii?Q?BNjkZCFBl11QfnOlZt5uSY3tRggkYNLJfP+oP+VxAwTUDhbdfV+rYAjA9gWH?=
 =?us-ascii?Q?pb9imW5Spfc=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(1800799024)(366016)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?lf9oWh6Afkm8VYuf2xZADZX4UBbv4i9N+CqCqP9O6vnth8YhxhIQAryDolpS?=
 =?us-ascii?Q?TH+yNm6Jap4JKEsf0p4hqDJGKl3AEjdAbxfDgxP9p5iY8gMwLQkMZx6ZMkYY?=
 =?us-ascii?Q?CjoIENW/bNZ7Waz64FB2KMZQ8JD8imBjymtCit8n4ZrT1QdZHXhpnsRl5awV?=
 =?us-ascii?Q?wbDljNo4UgHfTKNpBDUcNgUNAdeeS3bzG6QTmrBFEcq22gaJi23Rie8fdvQ4?=
 =?us-ascii?Q?4YuwsS9WDsY8Nsn9EKk/sqlmA4OKlYkEF1R40BKDqhjVd3Dz4Gv6bqGZ1A1i?=
 =?us-ascii?Q?gZ80nPsrsMQTtW/Jma6tqxtQXSXrRYVy0a0dEO2xEmHWe92ByRrKgjEVyorU?=
 =?us-ascii?Q?aBwvKyGYmh3ZD3eEW9kBIoX+gf3atVSeCo5rksd5Pc1DGPHhV+szaN3wOJNg?=
 =?us-ascii?Q?ORyG5fzsqf00g3w83+TGxMsf8tZNzP7MB4o2yqUqV1gw4H2fWsK3KI8pEXxi?=
 =?us-ascii?Q?UE4VVk1YGbiD104Hl7mAIfyarwOWtaIuqTxd7/FCEKdjvY/pAU5GLarT6/az?=
 =?us-ascii?Q?bD7P+4HfRDqS7qP3IT7c69KrxXEcGZQO6EecbgcU7seHUF9XQ7hW8D1CujQv?=
 =?us-ascii?Q?BAImvK3oM29fTQEcBQS/f288ihJ8zWyLj3CIwnkeOXL5dHQjJbTrGcIaVk8D?=
 =?us-ascii?Q?6kUUlWur1P2yKBJCPwwKL0bCW3545HWqipM0NCKCe17RTGz7lODL+ImgDA+y?=
 =?us-ascii?Q?pRzD+CN4cgCGmPtfLmHym50E+V/BTyQ5ydAAG5lbhoAbSlP9PXC0Rm5mN+WO?=
 =?us-ascii?Q?r7bZqjibdiTXpK6tjjZfw4OeRFI324cts9aF4ieaOHbhPT5RQbWcnBQJsQDB?=
 =?us-ascii?Q?mtHLJ+D1EerZG14bMM3ojXrEhunBzq6XjtQa7tCASk6eZHv35Z4RIMeqjX1L?=
 =?us-ascii?Q?Yc+OCYSUQL4Bj712rKXw0Kup7PQgFMzRtDkINWwwjny1uLBqHJh0CLKmIk9j?=
 =?us-ascii?Q?D+lIpMeGB54Qi50lVEK6Eqaua+S8T9EWuuxa0Tcp1S9ZA4G1r4B+cZWyfEhu?=
 =?us-ascii?Q?HzS9Sw6S8zUTa8fiCcyaM8CHemHIvFzrqloZb8WgbCcsAd/NFfjs4+qOPUfm?=
 =?us-ascii?Q?1MJQbbYvSJMreEm8wWgqhWRNZivFkq4C1Zl4wm+mfTpXVmsNHHfzMWzRdThl?=
 =?us-ascii?Q?99juBBaW1bCygqVEW7AjYJuzp1HDv0SsOrg8RTUvFq4AGQO03K474o6sPkQJ?=
 =?us-ascii?Q?CK1trDS/RoMvldFn3kesuuYjPTfbQ+eXX2tM3u7prOKxUesBKZuJb/wEOg6p?=
 =?us-ascii?Q?gLg84Ml+5TZsGg/7nLq4nTsLEAYU+D5x9ZdZ+I4L2Wsa3EqJvggatpcMNXom?=
 =?us-ascii?Q?e4L+giAgzBfajuMDyPjxYF4HGUEGjmQE/VcJknJTPbtN3ftI9dsHWdyYSgFo?=
 =?us-ascii?Q?P3ErEvYtNeDlJ2+nT+3WTYmIiMfrQZRbQmu1zWfWzGNne8vvGlLDoVjBrUBQ?=
 =?us-ascii?Q?rl6p2pXg/dtfjnyKqt1VjKExGCMOVy1ivCbE0bVDUIM1eTlTKyzKLYSRJtBw?=
 =?us-ascii?Q?sD6J8xP0gfxDPWf32p1E5spMFjjIuyEFYwksa5AMbu37/q3L7KEY1xZDSoSw?=
 =?us-ascii?Q?aUaJitiO+egxvN80hUFzz8fXezYfxcd/Q7ESsE6z?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 21712fb9-4f72-4b37-c95b-08dd1aa7da84
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2024 12:23:58.8353
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KwROA6n5+A+Y1mnz/htlXrTVRyJon09pxbq2FIAUutNRSWklYL5DfmLOmDEO82Cgvg3a0cGYAU6KR0jSzLmUsA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9263

The tcpci_irq() may meet below NULL pointer dereference issue:

[    2.641851] Unable to handle kernel NULL pointer dereference at virtual address 0000000000000010
[    2.641951] status 0x1, 0x37f
[    2.650659] Mem abort info:
[    2.656490]   ESR = 0x0000000096000004
[    2.660230]   EC = 0x25: DABT (current EL), IL = 32 bits
[    2.665532]   SET = 0, FnV = 0
[    2.668579]   EA = 0, S1PTW = 0
[    2.671715]   FSC = 0x04: level 0 translation fault
[    2.676584] Data abort info:
[    2.679459]   ISV = 0, ISS = 0x00000004, ISS2 = 0x00000000
[    2.684936]   CM = 0, WnR = 0, TnD = 0, TagAccess = 0
[    2.689980]   GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
[    2.695284] [0000000000000010] user address but active_mm is swapper
[    2.701632] Internal error: Oops: 0000000096000004 [#1] PREEMPT SMP
[    2.707883] Modules linked in:
[    2.710936] CPU: 1 UID: 0 PID: 87 Comm: irq/111-2-0051 Not tainted 6.12.0-rc6-06316-g7f63786ad3d1-dirty #4
[    2.720570] Hardware name: NXP i.MX93 11X11 EVK board (DT)
[    2.726040] pstate: 60400009 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[    2.732989] pc : tcpci_irq+0x38/0x318
[    2.736647] lr : _tcpci_irq+0x14/0x20
[    2.740295] sp : ffff80008324bd30
[    2.743597] x29: ffff80008324bd70 x28: ffff800080107894 x27: ffff800082198f70
[    2.750721] x26: ffff0000050e6680 x25: ffff000004d172ac x24: ffff0000050f0000
[    2.757845] x23: ffff000004d17200 x22: 0000000000000001 x21: ffff0000050f0000
[    2.764969] x20: ffff000004d17200 x19: 0000000000000000 x18: 0000000000000001
[    2.772093] x17: 0000000000000000 x16: ffff80008183d8a0 x15: ffff00007fbab040
[    2.779217] x14: ffff00007fb918c0 x13: 0000000000000000 x12: 000000000000017a
[    2.786341] x11: 0000000000000001 x10: 0000000000000a90 x9 : ffff80008324bd00
[    2.793465] x8 : ffff0000050f0af0 x7 : ffff00007fbaa840 x6 : 0000000000000031
[    2.800589] x5 : 000000000000017a x4 : 0000000000000002 x3 : 0000000000000002
[    2.807713] x2 : ffff80008324bd3a x1 : 0000000000000010 x0 : 0000000000000000
[    2.814838] Call trace:
[    2.817273]  tcpci_irq+0x38/0x318
[    2.820583]  _tcpci_irq+0x14/0x20
[    2.823885]  irq_thread_fn+0x2c/0xa8
[    2.827456]  irq_thread+0x16c/0x2f4
[    2.830940]  kthread+0x110/0x114
[    2.834164]  ret_from_fork+0x10/0x20
[    2.837738] Code: f9426420 f9001fe0 d2800000 52800201 (f9400a60)

This may happen on shared irq case. Such as two Type-C ports share one
irq. After the first port finished tcpci_register_port(), it may trigger
interrupt. However, if the interrupt comes by chance the 2nd port finishes
devm_request_threaded_irq(), the 2nd port interrupt handler may be run at
first. Then the above issue may happen.

  devm_request_threaded_irq()
				<-- port1 irq comes
  disable_irq(client->irq);
  tcpci_register_port()

This will restore the logic to the state before commit (77e85107a771 "usb:
typec: tcpci: support edge irq").

Fixes: 77e85107a771 ("usb: typec: tcpci: support edge irq")
Cc: stable@vger.kernel.org
Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

---
Changes in v2:
 - no changes
---
 drivers/usb/typec/tcpm/tcpci.c | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/drivers/usb/typec/tcpm/tcpci.c b/drivers/usb/typec/tcpm/tcpci.c
index 2f15734a5043..db42f4bf3632 100644
--- a/drivers/usb/typec/tcpm/tcpci.c
+++ b/drivers/usb/typec/tcpm/tcpci.c
@@ -923,22 +923,20 @@ static int tcpci_probe(struct i2c_client *client)
 
 	chip->data.set_orientation = err;
 
+	chip->tcpci = tcpci_register_port(&client->dev, &chip->data);
+	if (IS_ERR(chip->tcpci))
+		return PTR_ERR(chip->tcpci);
+
 	err = devm_request_threaded_irq(&client->dev, client->irq, NULL,
 					_tcpci_irq,
 					IRQF_SHARED | IRQF_ONESHOT,
 					dev_name(&client->dev), chip);
-	if (err < 0)
+	if (err < 0) {
+		tcpci_unregister_port(chip->tcpci);
 		return err;
+	}
 
-	/*
-	 * Disable irq while registering port. If irq is configured as an edge
-	 * irq this allow to keep track and process the irq as soon as it is enabled.
-	 */
-	disable_irq(client->irq);
-	chip->tcpci = tcpci_register_port(&client->dev, &chip->data);
-	enable_irq(client->irq);
-
-	return PTR_ERR_OR_ZERO(chip->tcpci);
+	return 0;
 }
 
 static void tcpci_remove(struct i2c_client *client)
-- 
2.34.1


