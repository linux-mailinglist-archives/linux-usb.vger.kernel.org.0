Return-Path: <linux-usb+bounces-18637-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B30719F622F
	for <lists+linux-usb@lfdr.de>; Wed, 18 Dec 2024 10:53:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6E1311884986
	for <lists+linux-usb@lfdr.de>; Wed, 18 Dec 2024 09:53:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DDF2197A87;
	Wed, 18 Dec 2024 09:53:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="U7nCCd03"
X-Original-To: linux-usb@vger.kernel.org
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (mail-am0eur02on2053.outbound.protection.outlook.com [40.107.247.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78825176FB6
	for <linux-usb@vger.kernel.org>; Wed, 18 Dec 2024 09:53:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.247.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734515614; cv=fail; b=KRZtgYxhrAh1grBk6MQMn7wiSyydm2gGyzoXQ9nkTZHBoRHsBTc8S/BlNmfi1iCZnnWVq953j0Ere0FdM1PNKi77+gdFL4H8Q7pMF6a6+ODzR+QhFBi96/pWdaxowQLTMjk2gih8bERvnjHGAHIzrqZYHBxUiiKix2XZWq5Twtw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734515614; c=relaxed/simple;
	bh=YFkTv9WvdXRlPp0k4hfz2m0wcqls9H0uspYF1JJsi2I=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=Sp9tOCuIA0AK3NmdOHL6zHcPIjElkuFPG9Sijz0iJ+Jg+9tZGN4dn6/2ATBLCUEYPt6vPrjTKmxG8LVQnp09vv46i1WUFrMmSwSPcUa+Tvc11msSePmi1LGpqqsyGzGk2kgMTc+XqeE7w8HjSuIj9MWnM8m42qc472eD9p34AWk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=U7nCCd03; arc=fail smtp.client-ip=40.107.247.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oJ0hE8pJxQoCSMd8RQkn+VRazfuIdRIpm1blZm5T4sjw5vPoydld1Gp9k8TfMXN/CIdJW8JsfEntQcGuVt3p8PI80iT67SLAfmPMgiHmwEYXBARwa2X8rd41IDzvWD6/BrZVsT01NVZdFKjGuLy0Ug7Miz1nGKIa6NSRVqQ+qA4QJOMv/S/nNfk8IUP99+GdJHLOgY4+miT3n5/20PRHIN3b94Whw0dWAus/N0tqaYjoUMahJX9Slt1wO1kW+SPZjxH+dg7bi+0di/WfLMzS6NhDnFuFXQgxIQH6i/YJaTOYYbKFkR1QZWuDOsx7eKsm1pxQy5KUq6OtIEhsZppu5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hLco5u1mmhjsQYHzArW0bojSYYvXr+/0DBfQ12C0/f8=;
 b=dIEfjL/URLQO0YD3I81B3hD62G7VPYTx8+sOzMENvd0SFqW4peutEGBZ+5Yz0f/064hqOGCZNWVk2to2bK/Unb9UB2bMjlKWSUS4SnkH3iJMwZEVYvBMufEe6EJZ1kwtHW20sKEfJ1IGVl+LTYggGJu7OgblcW7cETS6jOuuk1N073Lcfe3jMTFsKu4WHIm7cp6jpkYaNnbP46CAIglkkzEl3qQ5Lb+3RFsYP3++pSPpCz9Jf+hIiVfxbRxf8ebe2SY2pRIZJzi8X/mvYHDyUGMF/XmY0wCDhAC/XtLvYtlw83sfX+YpxY2vThct9+3KBAGlT7TYeXWtDC6fNsq6zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hLco5u1mmhjsQYHzArW0bojSYYvXr+/0DBfQ12C0/f8=;
 b=U7nCCd03dChwG1rwkMrPfTMRPIk0BDyb11yheQV8vMaziVVov97G0cNRiQhZ1IdtlcnTuktc6sdFjexbca6pzKBCQVQb+QWabPGoung04Rvplkl9JegnG1f1V24RM9HZiYle2NiC4/lioE++pGXJM2s+Q0kL+PS4CGhHYvXoBt/xBx+EufXNLDp6tbacpgRUq5hvP8h8pk5ogs8G+koCHMr/HvtwyxaSF2YJyEJaDKzQESzWauBY1KYsELrbzunlADrXtc0Dwl0W68Gn75H21LBj5I3ULBwMTRpj9U0KZRVZbNNCcQUja3qxVI43tQUYKPLkFpRw92yYBGaOhzxjgQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by AS1PR04MB9477.eurprd04.prod.outlook.com (2603:10a6:20b:4d9::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.18; Wed, 18 Dec
 2024 09:53:29 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%6]) with mapi id 15.20.8251.015; Wed, 18 Dec 2024
 09:53:29 +0000
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
Subject: [PATCH v4] usb: typec: tcpci: fix NULL pointer issue on shared irq case
Date: Wed, 18 Dec 2024 17:53:28 +0800
Message-Id: <20241218095328.2604607-1-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0006.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::11) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|AS1PR04MB9477:EE_
X-MS-Office365-Filtering-Correlation-Id: dbadab6d-c674-4e2e-3958-08dd1f49d2d6
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|52116014|7416014|376014|1800799024|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?n/2zdNye/8/KmS/vZfhjp0Fknw0zhF0GKR7GJCaz5wqYStSRaC1+BXjWwKFo?=
 =?us-ascii?Q?OGxBGVqdDAX07A4r7H3qQ4LZXpUTIDiUfKJDIHol63wUUgEsIdL4iB9nYM4k?=
 =?us-ascii?Q?6cFmrVEuqDTYPp1r2Uay/fX0G9gz8Ryi3kQMJuJO/QaPdLKPIYYZnOE9cZcq?=
 =?us-ascii?Q?I64Xq7zNiV0k66Jb6Yl84QGNvP36rF4ormDX2/+dod9Ae+oq/8QNAlBhAavz?=
 =?us-ascii?Q?jr89WyK0kGNkDWePGkXhFjupR6dEcaOPpYeA6NAFEqQnYK6dDbjYd16txTZm?=
 =?us-ascii?Q?2St06pWUR2+K/0zQUcloaOcfqmL16gYGW6MHvLcI+8QyNjaFwrIS5+iAw0rv?=
 =?us-ascii?Q?BwGAATEn4tG2yXFRgNdLbQPvSQQfiEzBP6Q90pyy+anuw52MX6uwW5HHUoa1?=
 =?us-ascii?Q?NS8/JhxmGN8Y6pyPR9tchh7mDBfC9xnLJ7we8148uK8ZlB1T3P415/6BwJJ7?=
 =?us-ascii?Q?g8QAUF7cUJ7nno1KFOxDkoJRYocLBUMuXejxHqPHwRu8EOf22ct/HnQY4LgE?=
 =?us-ascii?Q?FlHtrXFB2fO+qHDafVbXlBx/P14Zrak4NVTkKsjwdJHkMlYk+x8WDqOf0qwK?=
 =?us-ascii?Q?X+Tj6zLm6GJeJamUCtcWhOYF40LoVIaesUjbSUE1/cXCbvRpsm+aQeWHeXzx?=
 =?us-ascii?Q?Lrh20Qc22/abPgPivQG41aI1iEveaZ4w11M+hSIKbfxaAfhbpIHko96PUDpJ?=
 =?us-ascii?Q?w7W+zlE7iuNeSWlEASt5Mq0rhO68IHh6RhTOJDxmBYvxB84NNnqz/JRlvPRI?=
 =?us-ascii?Q?md/IZ4hy6xfX94F9H4Axdtb+736+aTCDbHQ93ouGthmmaWWvCD8CtnmPVAz7?=
 =?us-ascii?Q?01iduIKEtcmdhn8ZfjaizgHC4plnU8wL3bQoEDtckRLm3yWvRshw56oI1mUu?=
 =?us-ascii?Q?r1T8vM9Z9dY6EiW6eG4UQTWfKuNHMBFtJel128DKz9GPiZHrAIg/IUVNMWvD?=
 =?us-ascii?Q?Udb7LvjUrcbpZT44ZXCRr9VgXv3AVAqfTWvWdrwJj+2Dulcto4yKngjesLQw?=
 =?us-ascii?Q?/OXxNIdlVQ4+XOLgAh6g/7OIP1HMg4Q2zFmXzULl1tXncQQELZNeqCn1zXnA?=
 =?us-ascii?Q?e23skeqL01+/Cbpaxl/uMe6YAAp7BJaAHOC+L56rN8iUQvcx2m2EZsyXkQvr?=
 =?us-ascii?Q?9QAJBFCvoN+eESy+9PcApBU+lbwzIqmHdInrak8B2xj5H3oyrCLQrqRDGsTi?=
 =?us-ascii?Q?tHSvmj1vIxWEwnD/qODHrtF+zjY2U8HcLj/CewqLfFunQXhwYG55D9cMgfTW?=
 =?us-ascii?Q?JAREpxvoeDGsu0NWC8T9oscZzcVCETH8svqIBlVDRiIGqeRyt6zdk7ZzssUe?=
 =?us-ascii?Q?DyMW/r5WIQJMNipkZg0Ed4tCiCHsOVjRZebqhy5mdCQxwGVfOVKIQMYQxGGt?=
 =?us-ascii?Q?/Grw5akgxY9UV6x3q2SoJiUUtZq2hnv8fhNh0+NvkEWYI3aEVUXT+oiwV1VC?=
 =?us-ascii?Q?BZRPiIaj/EflKFR5gw7tI7qAUc2OWN92?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(7416014)(376014)(1800799024)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?EO9BUS7B7TXT5LrvnOkKUkzkZUGAqg6D1b72atpGuDBFk5a2QvXL1Q6daeMZ?=
 =?us-ascii?Q?d3vyVjQM0bIyItGBs1Jvsn8kz2N+d5sp0u0UlPupeVWSSY8sDMzsq0eXDSUk?=
 =?us-ascii?Q?1ZGJOr/dxqmLiSnmS8WgOGZWB/+Begel7LegY2hvROSwZk/iRvAv74Rp1m8G?=
 =?us-ascii?Q?wV6TGjeKU7h3j5HBc+jCOzT3xMIh9lG96p8YiSQRQ56VBi4Lkmw8aO4wBTDt?=
 =?us-ascii?Q?f+a+/wYcG7Sr2FWztQI0tRwlJPbGE7kOlkw2KL3CSXmMH8ZS+BA/QI+0jbct?=
 =?us-ascii?Q?LbGjZGtbXVbzMR8IFk0tg7P/CdkX5ASniDV44XMjT6QNEqVLrfNbUQmlrsCr?=
 =?us-ascii?Q?o8rcCPyQTmbBLUU1/LMVsV1j3HTvgxUBAjWkaXd4+DSXBc1subwgSx1QESdl?=
 =?us-ascii?Q?jMec8l+dKpN9B2HTqjdPJIJqj6eq1oe+Cxfy7Jzpjqvdld9EDRNUUGPIwjwM?=
 =?us-ascii?Q?ge9DJpiqz/eeqGXq7UOBwIJHLpyCT2NjyUZePq402XtdLphk6pX66KiUABag?=
 =?us-ascii?Q?hyVStaKEUuT5NETjzCx6JEygdZODA6LsdGa9wzJmwb78he/QQvona6sxBGui?=
 =?us-ascii?Q?Iy7TaIqZpjr2XOepEL+J+pWKIhUptXqImjLrSQPoQwHHyD9yT+oOTPhqLWwP?=
 =?us-ascii?Q?a0JW9iuskKylM2T/JD87AdKnWETcvsF07vb000Wlt2jnQdG/kPEWF7Wkq8PW?=
 =?us-ascii?Q?QPaioLJYfHT+20vaTfAO/GTRmXCt244H8WJZVMtj/iskbbcq6LM3cdZ0fbPE?=
 =?us-ascii?Q?KuWJMhHbKjoxjmZg+DKs7eKKNDBlBJ6beNuIp/SNypRGO/oW4vxUYLO0whhD?=
 =?us-ascii?Q?uNoMbeilVmoCMQjMONDxHknNGxeYwevas+5SEQENENBNOLTT7pOnsrTjXDtG?=
 =?us-ascii?Q?gjVhYEZBV8XOQRlPYczdhYpToKGF3zn0dB1FM+llfsPsj3SceC/qOLKQamo7?=
 =?us-ascii?Q?uvJ6iyuA9WurgiqBy52ErNqpQYSOUvCUOhPOQ2kSWYNhFfxLEaWGw60V5M2w?=
 =?us-ascii?Q?x04rKkJ8Z3PUurJi5dB5PVrvrU+LsbMqvJQh61loyQBeUhxfWQ5+22Oa4+Uc?=
 =?us-ascii?Q?yfZwFNB2OHaxhe/sqoAqUa+IFOh4vNeWFjjXVEwpPbr6nNMNIFSoF37Wf79x?=
 =?us-ascii?Q?fjD5wlDJAb5lbqh8uFdJQI2QN8syDNnxVmwtbrFU2xtC/Oc4uY21TG2q9HPA?=
 =?us-ascii?Q?aNjJE91d4oRiOegHDKtZsg3h/LvIXPF5TeMnA4hIHrpf/n1TK/pPHjOroC4p?=
 =?us-ascii?Q?OE5xjPGWvh2FxVY7jriJ2cVYAn9zcPLQwGFGWvIiWdu0RtJTyUQXge0oEfN9?=
 =?us-ascii?Q?Jv5F0F+UXYq9tJolKclvTcRHDeHQx2c8g9MwFU02u/aZurKxSG65rYDMjS+M?=
 =?us-ascii?Q?ZENS8K+emyXXLrDuNNULHyAAWrcMFuZfuWyy7+WeG6veUDAuS09crRBZ80xs?=
 =?us-ascii?Q?qZfhQwVvxGkK/hNv7u0ITDtCBFShhrX9sZCaUOO45JSEUvzQNILMvAdbQQ72?=
 =?us-ascii?Q?TxCL6lkFVqkeGLvnNoizDOJayjj0dweqyBsg8BQDndKNifdTVHYrJ8GaqJG0?=
 =?us-ascii?Q?zhl8sO/f2Nrfn0RhcIrZuCwajV1IzFsBmcFIyitH?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dbadab6d-c674-4e2e-3958-08dd1f49d2d6
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2024 09:53:29.1816
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 82x6xAmy8Q1IeghDgPLe/2qtDgc8vdqEDgQx3uLCXgnpZnrZrubpss4CFb0buflb3GayfmGSQTEG7vVHQt2BRw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9477

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
devm_request_threaded_irq(), the 2nd port interrupt handler will run at
first. Then the above issue happens due to tcpci is still a NULL pointer
in tcpci_irq() when dereference to regmap.

  devm_request_threaded_irq()
				<-- port1 irq comes
  disable_irq(client->irq);
  tcpci_register_port()

This will restore the logic to the state before commit (77e85107a771 "usb:
typec: tcpci: support edge irq").

However, moving tcpci_register_port() earlier creates a problem when use
edge irq because tcpci_init() will be called before
devm_request_threaded_irq(). The tcpci_init() writes the ALERT_MASK to
the hardware to tell it to start generating interrupts but we're not ready
to deal with them yet, then the ALERT events may be missed and ALERT line
will not recover to high level forever. To avoid the issue, this will also
set ALERT_MASK register after devm_request_threaded_irq() return.

Fixes: 77e85107a771 ("usb: typec: tcpci: support edge irq")
Cc: stable@vger.kernel.org
Tested-by: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>
Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

---
Changes in v4:
 - squash two patches to one
 - rewrite commit message
 - add Tested-by
Changes in v3:
 - no changes
Changes in v2:
 - no changes
---
 drivers/usb/typec/tcpm/tcpci.c | 25 +++++++++++++++----------
 1 file changed, 15 insertions(+), 10 deletions(-)

diff --git a/drivers/usb/typec/tcpm/tcpci.c b/drivers/usb/typec/tcpm/tcpci.c
index 2f15734a5043..48762508cc86 100644
--- a/drivers/usb/typec/tcpm/tcpci.c
+++ b/drivers/usb/typec/tcpm/tcpci.c
@@ -700,7 +700,7 @@ static int tcpci_init(struct tcpc_dev *tcpc)
 
 	tcpci->alert_mask = reg;
 
-	return tcpci_write16(tcpci, TCPC_ALERT_MASK, reg);
+	return 0;
 }
 
 irqreturn_t tcpci_irq(struct tcpci *tcpci)
@@ -923,22 +923,27 @@ static int tcpci_probe(struct i2c_client *client)
 
 	chip->data.set_orientation = err;
 
+	chip->tcpci = tcpci_register_port(&client->dev, &chip->data);
+	if (IS_ERR(chip->tcpci))
+		return PTR_ERR(chip->tcpci);
+
 	err = devm_request_threaded_irq(&client->dev, client->irq, NULL,
 					_tcpci_irq,
 					IRQF_SHARED | IRQF_ONESHOT,
 					dev_name(&client->dev), chip);
 	if (err < 0)
-		return err;
+		goto unregister_port;
 
-	/*
-	 * Disable irq while registering port. If irq is configured as an edge
-	 * irq this allow to keep track and process the irq as soon as it is enabled.
-	 */
-	disable_irq(client->irq);
-	chip->tcpci = tcpci_register_port(&client->dev, &chip->data);
-	enable_irq(client->irq);
+	/* Enable chip interrupts at last */
+	err = tcpci_write16(chip->tcpci, TCPC_ALERT_MASK, chip->tcpci->alert_mask);
+	if (err < 0)
+		goto unregister_port;
 
-	return PTR_ERR_OR_ZERO(chip->tcpci);
+	return 0;
+
+unregister_port:
+	tcpci_unregister_port(chip->tcpci);
+	return err;
 }
 
 static void tcpci_remove(struct i2c_client *client)
-- 
2.34.1


