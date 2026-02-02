Return-Path: <linux-usb+bounces-32995-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SOiVERR8gGnE8wIAu9opvQ
	(envelope-from <linux-usb+bounces-32995-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 02 Feb 2026 11:27:32 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B4152CAE33
	for <lists+linux-usb@lfdr.de>; Mon, 02 Feb 2026 11:27:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1968430233D0
	for <lists+linux-usb@lfdr.de>; Mon,  2 Feb 2026 10:26:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 592E33596E8;
	Mon,  2 Feb 2026 10:26:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="SncYEWFt"
X-Original-To: linux-usb@vger.kernel.org
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013005.outbound.protection.outlook.com [52.101.83.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 323B72D8764;
	Mon,  2 Feb 2026 10:26:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770028001; cv=fail; b=MVyGFX9lx5EVZrY3JJ2HNrFIZ6jEN71K1/S9c85307Afskjlc3kEFmNxFnd286xYsfdwyEDgZf4JIAVxRi6bxcS+p3wXD/bbuHjmAQe2abbc6wkSmZOSrsWKPohQzfQUA7PoJoNW8KKHnBIqeHmGsNWpqMEYaX1sDLbKsx7/RGY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770028001; c=relaxed/simple;
	bh=CjNFvj790r+qQM7R1dVJMcRwOKvdSfwp9F6dOk0BI10=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=FeE/5fsZyVuJPyBqzGnW7+jVLRdev2mvGOJvzOHLOVf6DITX6JIpwYQSQCLbJ+V1En7oMFu0x06Jncu0n9gHD/tYZY2bz0tosu2eqGEwOywkSE9tBD89yKd4WUbU11wvDlDfdAlG4DThe3ImWTXBYqevEiCnLFMlssIKwZBSC0M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=SncYEWFt; arc=fail smtp.client-ip=52.101.83.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HZbXJWwVZxdsU6Hfo6pmtBFybFputEOqLLo4f3vDUgKVA9BYMGAIzSlPZTJBatXvEuKl84mqB2vPUqrSwgHWZNJbZnMK2Ckdc7/I7kaMrx6o+9o1yHEeypYO6J5hvZsU+T1ifmMCxrNPBrg7zrp3qgfjqcamb3dVaC9bCdtlVmlkVNfQz15+DVxY7aRqF2yWnHFD4Qo1pbZ76RGk5SQJzACk0NJ3X28LzhdqBMLZn6TL9VSNoS5lArGrSghw2pMaZTfOKnFK9FuRJXrL4h4XlcM+pt+XVcPeHH33KoOjbJ8STHxjA5Y0MSHeyRkQ/BkO/gpR7ESix1Kybi5VXj7foQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U6bfTIGWPh3x7uwMgrKiAFMqxBlFTj7DhJ8yRD7oAT0=;
 b=dda7QiLuT3wkx2CR9fb7lC8wUFyZlDUCMVxwNhalLacFOOSFBXkddRmsfNEhQSqDTJFkauh1GEa39JG3QeqftxcupV+O3DgsnGJ83ZUebA0MtF21836bofcaSdQ37srwZ1c/gHDdQ8IbVkmVLTu/QYuZ142MmtQR30eM1RXkl5hEKfxkcacqH+7kZmrYw3qcwCHlgiWBc3sYFO0oq2Bmf0c5b87XX7zDY/wQP2CYT8HJ9ykNO44tZt85FC3VHejmc7EsP2TKsR2qTo5mOjcjeBSc1vY6Mb522wZKwq95TGDbtm5cKelOAcFIoRs9irl+t+6Wkv69yK4VEvY1YlAmVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U6bfTIGWPh3x7uwMgrKiAFMqxBlFTj7DhJ8yRD7oAT0=;
 b=SncYEWFtsRPcIyb3AnM4vJn5ikKGuS7ncm2PCXucPaFb1Z0Puto0ZIxULQL4nzO0mo5wQUrAck+jJYgLXglO8vr6FBcTvnz7VSCHN0rCS9Hhs5jGrbCOdiOFNvrc5B1W5xKWHAw+1LGZSQVzfHnWds4PYEbhqK+nI1ET/V998Vn4W2+kgX/+PcqkBSZMM8mBe4Cto7A63o6w2Cov+j9vlh3NP8UHFB7L+Zv4bfPGC3OuQkEdPnkeYUy/VhyYqTO2Nq4TS79NgGkGvBTy4MVwPVrs4Ldu+/lvVBZrhHbmaEkp8PUXLP7xoI6AFlN4yH9WY5VPDdqs3EDyNsFMeCC2ww==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM9PR04MB8825.eurprd04.prod.outlook.com (2603:10a6:20b:408::7)
 by AM9PR04MB8763.eurprd04.prod.outlook.com (2603:10a6:20b:40a::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Mon, 2 Feb
 2026 10:26:36 +0000
Received: from AM9PR04MB8825.eurprd04.prod.outlook.com
 ([fe80::49d0:5fa7:d131:7781]) by AM9PR04MB8825.eurprd04.prod.outlook.com
 ([fe80::49d0:5fa7:d131:7781%4]) with mapi id 15.20.9564.016; Mon, 2 Feb 2026
 10:26:36 +0000
From: Xu Yang <xu.yang_2@nxp.com>
Date: Mon, 02 Feb 2026 18:27:46 +0800
Subject: [PATCH 2/3] usb: dwc3: add may_lose_power flag
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260202-add-flatten-dts-based-dwc3-imx-driver-v1-2-c44a5e919380@nxp.com>
References: <20260202-add-flatten-dts-based-dwc3-imx-driver-v1-0-c44a5e919380@nxp.com>
In-Reply-To: <20260202-add-flatten-dts-based-dwc3-imx-driver-v1-0-c44a5e919380@nxp.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Frank Li <frank.li@nxp.com>, 
 Li Jun <jun.li@nxp.com>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Xu Yang <xu.yang_2@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770028079; l=3771;
 i=xu.yang_2@nxp.com; s=20250815; h=from:subject:message-id;
 bh=CjNFvj790r+qQM7R1dVJMcRwOKvdSfwp9F6dOk0BI10=;
 b=KDNSm8VNlfhwNKeNgMJUbko7bSz7R2fLeDXHbDd4YOhNxPn3wsBo2xd7EUgBGm+GBLec85Olt
 6exKANmP7WzDHy5dyKtPl4VgFMfmlxR7yGrP1KlkKAHEnA1Z1NzkAXi
X-Developer-Key: i=xu.yang_2@nxp.com; a=ed25519;
 pk=5c2HwftfKxFlMJboUe40+xawMtfnp5F8iEiv5CiKS+4=
X-ClientProxiedBy: SI2PR06CA0016.apcprd06.prod.outlook.com
 (2603:1096:4:186::22) To AM9PR04MB8825.eurprd04.prod.outlook.com
 (2603:10a6:20b:408::7)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8825:EE_|AM9PR04MB8763:EE_
X-MS-Office365-Filtering-Correlation-Id: 46752fb5-f802-4a81-5be0-08de62458b6f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|376014|1800799024|19092799006|366016|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RGdqaVEvdjMrd1BYbml1ODVZMmN3NVdDeVJoTmU5c3NGMHk4Vk8zbTN1WWFY?=
 =?utf-8?B?L2hxbm9IY2VCdk90QmlwTHlLNi84c2ZLRnBjZ3hrOTRsUXJmR1NrOWdDaXB2?=
 =?utf-8?B?dGNIV0UrdHVWRWlFMjhEOE9Mb3VwZDJmaS9nQTBsOUM0cE1FMDQxV1pYT0M3?=
 =?utf-8?B?RDZnZzAvblpPVlROeFZvZDJtdGxDcU12d1ZVakRZbWQrWHJtWkNKYTdObXVH?=
 =?utf-8?B?dFZKdFYrcksyZGY1dFh6ZU5JTnVJTGRzdjFhVFhsZmhxbzlUY3UrVFhGU2Z0?=
 =?utf-8?B?RmlMVzJ1clF3bzZWdjdpM3lxWWhHT3NUbXlEa2kyalVCMHh3ZEhESm8yeXVp?=
 =?utf-8?B?bXFtNVUzMktxbkVVYlVUTFNDTkJLY09OL0JkUW1Ldm5sYzY0d1hLT29TZ3Fz?=
 =?utf-8?B?ZXk0R2o4NjA3Yko0QUhGZ1QwK3J3elNHMjhMUTZONjBub2tuQmg2dG5Ga2dJ?=
 =?utf-8?B?NFR1T3YyRU16SnRORHgvSnlkZ0FkNTdJY2pUWjZGR1hoaTRUY09jU28zdnJC?=
 =?utf-8?B?anovK1VxNGxrOTdnajY4RUJ2ZUhsRzNsTWp3Qks0LytUenNiYlZCbW5BU2Z5?=
 =?utf-8?B?M2VFT0dSOXl5SkZsQWxHQm41WExDcE02Q3ZsQ0FmbGNRSlZ6UmdrUWhFYjY4?=
 =?utf-8?B?TnNhcnpWM0h4aE0vSi9OTGNNUElBbEp1MXEwbFd4TmhFUFM3R0FCRjBMWER4?=
 =?utf-8?B?Y095dGhkMTYvMGo5c3RLbFN4MHRuOEk2SDZPRDBlRU5EVGt6NjNQckwxVGVI?=
 =?utf-8?B?U3htbHVyOGJpQVZSNlYxNEJpeHRQM1hIWFZ2UExjUUprdVBpQXpiOG1CMmpE?=
 =?utf-8?B?OFZaRWprc25KZWNLekVyM01LNjhlQ1paWHA4c2Y3dHUwNC9xTkJwT2tORGtX?=
 =?utf-8?B?RmxUelFpa3V1cnk0N1p0ODMyVW5rVUhjSzVrYTh4SWFKZERwZGRDNCt6cjBU?=
 =?utf-8?B?M0dPVm4rcUJhZGdic3dJeXhxUGZOME4xWVN3OGNuV0N1ZGZxOExhSEU3MU1W?=
 =?utf-8?B?TnhlZ0NOdzhZQ21rRTgrZFpGVG50Skx4Y29FSXo4WUNqZEdNWWdodTBUcVlI?=
 =?utf-8?B?OXpxRVdpSXA5WnJlUHBhc09NUW5NVHdEc2QwMmd2cVhBMmQvSmxueFJiazdP?=
 =?utf-8?B?RFVsZytXQW5aMklrQVhrZGtvZjI4ank4TFMzK1pwYzkyakRpZC9CSWVhVkdP?=
 =?utf-8?B?MVE0bUEvd0dYQlVkOWFuU1dvWVQ1V1MzTEZRZ0l5K3JrMENvblNOS2VzRVB0?=
 =?utf-8?B?K0RTODhyaXlnNkxTeWsvSVhMa2l3ZFFDalZrMHBLMVlTVHZqOE0xZXBNZ09v?=
 =?utf-8?B?VmJhQU0wdTdvbzZIa3J1V0IrTHVzUmIwTWJsWUhBaDY2Rm14QnlUK0JYZ0d0?=
 =?utf-8?B?bDVmdWkrWUlOUnY5UENZODRsMjZQcVZwY3NMMVQ5WEQrSW9mSlgvVGlPVkJl?=
 =?utf-8?B?QnFQQ0hhZUR2YXIzVG83L0drNVNSdDFJaFNockVSY0E1R0VjaUlhV0pLRWFa?=
 =?utf-8?B?bnFjcnEvblBlbVV5NVZxeHdpSVJPNlJ2MW85dFhKSmRrYWxmRFIzTGh1aHl4?=
 =?utf-8?B?TUNvV1AxbnIyWVZrTUZxalFvZnF5MWFyQWJ6c3NmNGpXdnFKdmg3YXdrejI5?=
 =?utf-8?B?SzRjdWpQUFlQRUdjT0FIR0VVWVNCZklRdHgvd0NIY2ZuN3gwUmVTT2p6Z3lN?=
 =?utf-8?B?QXR1Q1kzeHNSRmd5SEg4cnQvelpvUVlJTFNrOWxhOWVVQUlnQnlYQ1VpK1Jq?=
 =?utf-8?B?VGhrQkRKM0JWWFYzbVZOM1F6WG50WmtRZ2dIWjhjVytUaHVhdnNjK1JpdUY1?=
 =?utf-8?B?TmVQOEtySFlnekNjcU1PN0FsekF3L0JOSjdCSXhoNU9FNUQ2TnF3MitLWElM?=
 =?utf-8?B?WEJ6bkZ3YTI1Ni85Z3M1RlFMK3ZYeUhhVmVMMHNtOExKQ0FRUGhnWkNqT1pD?=
 =?utf-8?B?SStVS01CSEY3SC9MNnBVaGJsUEhBTFNBQzl3empOVjVtaDFYTmVoNU1zLzZY?=
 =?utf-8?B?K2dqNkJCazZ5S1U0eU51enhwWFNncDlCS2w5WTB2VkpubWY5TzRTU2lVSHdr?=
 =?utf-8?B?NVVLRG5FR2JjbllyakRrQ1JoVnNmeTRWL3dsRVBPRVhvSmdxSTJUcGJyWTBH?=
 =?utf-8?B?YWY4dDhxaHFwcnFzM3Nmd1dQMG4ydHQyUC8rYllQNDdhSGxsK0dxK1pnQVVL?=
 =?utf-8?Q?ATuAz5JClmL3VcrMzT/uj9rH+Vjk+FQeFxJGke8sERhu?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8825.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(1800799024)(19092799006)(366016)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L0FybjE1THAzR3J0dVUvRVVJSFVHVXRPN2d5MFd3aWRCaGNmNElkVHA5cFAx?=
 =?utf-8?B?eXU0V08rUnFEa0JMR2hJQytKOHV4STRaR0pnRGxJcWdPR3E5YnFRaGpNdTRl?=
 =?utf-8?B?Q01zT0YxVWZFMHNVYkVjZGcxRmdOSnRRczR5dkR6azFYYjNidEduMnhKbk1P?=
 =?utf-8?B?MEcvVVZzVGZvNlVZNEZTcmRONFBUNTlLT3JseUxabS9oZmNmYVNXQjdjMTVH?=
 =?utf-8?B?dmYrUmtYREZKUStHdTdIS3pPRngvSXlxYWppTXVRdnlyWWxzNm9JUFJGUmd6?=
 =?utf-8?B?bTEwMktKQnVuT2VtUWJZMmtiNXhpRGM5QXZ5UUJiVWJLUzRMM3dTeGxReXhC?=
 =?utf-8?B?TktjdFB2R2pOS2d3WEdvaTBHMWxldEZwYmd3ZmxXVThFTmFQMlRZYlE1QzVj?=
 =?utf-8?B?cTZQZ1lqUjRHdVlWMkJYUTQvQU40SnlRc2t4c2xsTE41VkR0cklHUmEzY3dU?=
 =?utf-8?B?QjVXQ1ZsSUpuZkF2NzdvaHFKUWJpMjFNRVF2WEdURkpETUdxdFJuQ01PdlN1?=
 =?utf-8?B?UnJZcVRaYk5KZnRwODJOdEhDSytHcmdCS0NHcE40UmVzandTVEY0OEFERkNx?=
 =?utf-8?B?ZzhSK3I1b09ISXJTeEFqZVhaMXlUdDdGVm9Zdk1YQThld1BzS2RLaXFMUE5h?=
 =?utf-8?B?YktLaWtUYzE1d1VONDU5U0U5V0g5QUlWb0xVSFZiTmxGaXBENm1jeGN4R1Bs?=
 =?utf-8?B?UGlwQTErUHJ4bkVoUHM0THZ4UkpuaEFlMGx2RENicFNlVEV3VHJMYjhnczdH?=
 =?utf-8?B?OGVwYVg5VzZ4UHR6a2hQNm9mOGRMK0laZklKUFRQYVVQdGVtYUNFa0x2Y1Zs?=
 =?utf-8?B?NENtLzhhWTZtVUVNMS9mN3AxNXZ5eGJJdUlRMVgyN3puU1pIL1FBSyttdU9k?=
 =?utf-8?B?NG5waTB0WjVLdEVJR1NGdEFEZ1h4eTEzTXNsd3JqM1c4dDh5bDlEREVOK3Iz?=
 =?utf-8?B?RXNMejQ0Q2dSS3UyZHRjRU1mVnhHeHJ5WmJiOUVRN09TcUpWWVptQ05nZ1Ro?=
 =?utf-8?B?QkMwTnJmV0pLd1daNXh2U1FYc0pybkFtVmNoc0xkbTB1OE9UNTlKMWJWS2F3?=
 =?utf-8?B?TGkrL2dqUG9zRU92eExoTkFqLzdrNnkyYlJFSWkzMDJQV2srWTFEQXYxTzZx?=
 =?utf-8?B?WmcyK0hwbTlMeVNaanBTeGI3RkFPUmMyRFVnL2ZVWVJhSS9UUmFnQzdvV05B?=
 =?utf-8?B?WDJyQzhOeGNrSGpNRk9Laks2TExOZDVlZDZITldOWC9CRk9nZmdOWm1NaFZl?=
 =?utf-8?B?b1ZoL01zSFluNm9Eb05YVUUzanNsVDZXelA5a1V1ZHYvOGNvVWdoakVHNS9t?=
 =?utf-8?B?MXh0b2VyalJjb3pHUDFmd3EyakJ2b0hDT1VHdTVkM1ZJcGQrMmZUOEx4MlhT?=
 =?utf-8?B?N0Q3eTNBRi9BYzZESFdNaU10N054OFpCQXNWMGZKazQzZWcxdXNsQk5ZblJV?=
 =?utf-8?B?NDc0V0VPOUlJMVJ0R3BLM2pRTk1SWWtyVCsrVmxJYzdMWkRwemhNQ2I5UnFx?=
 =?utf-8?B?U1ZoWHoydnRSNnJzMXZPUFJ3YndyRlZ3U0luSTBVNzVLV0dyMWc0dm1CU25n?=
 =?utf-8?B?d3N3TUdBTHNoNkg4RmlrdjdZd3N3emJwVi9OeUpFK1U0dFp5NmpkbitwbG5O?=
 =?utf-8?B?YVlTUVpGR2hGc2FHZkFVTVRPb2dXWk9kN3FLZlpFR28zcFpDOFpIc0dVaWNH?=
 =?utf-8?B?cDlhOFlBWDYrdHZZWEJkdmw1UWorOWk0eEt1Q295TzU3UXZGL2V0cm1GWThR?=
 =?utf-8?B?ODdUNGhTa2U2YjhXZngrK1NNM2FqeWtRV1dvbS9iYlBiMEFzc3JZaVhRUm9x?=
 =?utf-8?B?ajU5U2VMcWtIdWhxWlIxN2pFbFJqZ2NMQnNWdXZ2aGYyUlVjZmNHRzhjN2ZS?=
 =?utf-8?B?eEJSbkF1U2tNMmEvNit2ZHYyaDJzYUlXZ2RmWkNUdEU4eVp4TFZTc3RXWW0x?=
 =?utf-8?B?d0M1SnZGQUNkNGxDOFVkTmVkK1laczhiNFJxL21zYWxBTkxmTllOdWwzdWRu?=
 =?utf-8?B?bi95NzNaZ0FPakhWQy9JRFFTdjI1SEZvRFNxWkRjVTRYcTdNUldQczFoS3JV?=
 =?utf-8?B?SzJ0S0NsTlRCVktiYkViMnMwbS9GRmFxYVd3YTB6MTRZa0hzWDUvSUlKUTkv?=
 =?utf-8?B?Vm5oSW14MWd1TXhjbExkMXVNUStyUm5EMUw0REdLL0p4UklERlFjU1o1STB0?=
 =?utf-8?B?M21sb1VoRHdobUhuakdtcWxNNzVkbzZwcURKbWFwSTJPOVVObUM0RDFtU3o0?=
 =?utf-8?B?Um5lWWJLM1pncHVuaVBKdUZ6VjJ1MGVEd1MwTmJjbkRvZWoxdCt0bEpqbU5u?=
 =?utf-8?B?MDlESHYrNEVieHFudmswRC9wclN1aytENzU5MGlUTlcreEpXSVdNZz09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 46752fb5-f802-4a81-5be0-08de62458b6f
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8825.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2026 10:26:36.7659
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fGeKLMGE83OitKzq8BgL6t7nlpfPodcQkSO/CWH1ejmyjgK/eEPp7XtPtie4S9Gt0wnyIMc/uLE+14goyVyyYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8763
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32995-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[linuxfoundation.org,kernel.org,pengutronix.de,gmail.com,nxp.com,synopsys.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xu.yang_2@nxp.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[nxp.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,nxp.com:email,nxp.com:dkim,nxp.com:mid]
X-Rspamd-Queue-Id: B4152CAE33
X-Rspamd-Action: no action

The current design assumes that the controller remains powered
when wakeup is enabled. However, some SoCs provide wakeup
capability even when the controller itself is powered down, using
separate dedicated wakeup logic. This allows additional power
savings, but requires the controller to be fully re‑initialized
after system resume.

To support these SoCs, introduce a flag to track the controller’s
power state and use it throughout the suspend/resume flow.

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
---
 drivers/usb/dwc3/core.c | 9 +++++++--
 drivers/usb/dwc3/core.h | 2 ++
 drivers/usb/dwc3/glue.h | 3 +++
 3 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index c07ffe82c85049364c38c7ba152aab0ff764d95e..9d4326da5ec7669fa714707fb24556723cab51b8 100644
--- a/drivers/usb/dwc3/core.c
+++ b/drivers/usb/dwc3/core.c
@@ -2314,6 +2314,9 @@ int dwc3_core_probe(const struct dwc3_probe_data *data)
 			goto err_exit_debugfs;
 	}
 
+	if (data->core_may_lose_power)
+		dwc->may_lose_power = true;
+
 	pm_runtime_put(dev);
 
 	dma_set_max_seg_size(dev, UINT_MAX);
@@ -2462,7 +2465,8 @@ static int dwc3_suspend_common(struct dwc3 *dwc, pm_message_t msg)
 		dwc3_core_exit(dwc);
 		break;
 	case DWC3_GCTL_PRTCAP_HOST:
-		if (!PMSG_IS_AUTO(msg) && !device_may_wakeup(dwc->dev)) {
+		if (!PMSG_IS_AUTO(msg) &&
+		    (!device_may_wakeup(dwc->dev) || dwc->may_lose_power)) {
 			dwc3_core_exit(dwc);
 			break;
 		}
@@ -2525,7 +2529,8 @@ static int dwc3_resume_common(struct dwc3 *dwc, pm_message_t msg)
 		dwc3_gadget_resume(dwc);
 		break;
 	case DWC3_GCTL_PRTCAP_HOST:
-		if (!PMSG_IS_AUTO(msg) && !device_may_wakeup(dwc->dev)) {
+		if (!PMSG_IS_AUTO(msg) &&
+		    (!device_may_wakeup(dwc->dev) || dwc->may_lose_power)) {
 			ret = dwc3_core_init_for_resume(dwc);
 			if (ret)
 				return ret;
diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
index 08cc6f2b5c23631a752c77fd7394e5876c929f0a..5b1358f36490a001bc9e68139224f7be70a57995 100644
--- a/drivers/usb/dwc3/core.h
+++ b/drivers/usb/dwc3/core.h
@@ -1117,6 +1117,7 @@ struct dwc3_glue_ops {
  * @usb3_lpm_capable: set if hadrware supports Link Power Management
  * @usb2_lpm_disable: set to disable usb2 lpm for host
  * @usb2_gadget_lpm_disable: set to disable usb2 lpm for gadget
+ * @may_lose_power: set to indicate the core may lose power during pm suspend
  * @disable_scramble_quirk: set if we enable the disable scramble quirk
  * @u2exit_lfps_quirk: set if we enable u2exit lfps quirk
  * @u2ss_inp3_quirk: set if we enable P3 OK for U2/SS Inactive quirk
@@ -1369,6 +1370,7 @@ struct dwc3 {
 	unsigned		usb3_lpm_capable:1;
 	unsigned		usb2_lpm_disable:1;
 	unsigned		usb2_gadget_lpm_disable:1;
+	unsigned		may_lose_power:1;
 
 	unsigned		disable_scramble_quirk:1;
 	unsigned		u2exit_lfps_quirk:1;
diff --git a/drivers/usb/dwc3/glue.h b/drivers/usb/dwc3/glue.h
index df86e14cb706ca509206677f644da2a7225b1b26..b428a9f4a32625e7331f8492a408f7c20c915825 100644
--- a/drivers/usb/dwc3/glue.h
+++ b/drivers/usb/dwc3/glue.h
@@ -29,6 +29,8 @@ struct dwc3_properties {
  *		be ignored by the DWC3 core, as they are managed by the glue
  * @skip_core_init_mode: Skip the finial initialization of the target mode, as
  *		it must be managed by the glue
+ * @core_may_lose_power: indicate the controller may not remain power during
+ *		system suspend/resume
  * @properties: dwc3 software manage properties
  */
 struct dwc3_probe_data {
@@ -36,6 +38,7 @@ struct dwc3_probe_data {
 	struct resource *res;
 	bool ignore_clocks_and_resets;
 	bool skip_core_init_mode;
+	bool core_may_lose_power;
 	struct dwc3_properties properties;
 };
 

-- 
2.34.1


