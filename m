Return-Path: <linux-usb+bounces-32993-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UP6lECJ9gGnE8wIAu9opvQ
	(envelope-from <linux-usb+bounces-32993-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 02 Feb 2026 11:32:02 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7477CCB03F
	for <lists+linux-usb@lfdr.de>; Mon, 02 Feb 2026 11:32:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7C310300D316
	for <lists+linux-usb@lfdr.de>; Mon,  2 Feb 2026 10:26:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B6643570A3;
	Mon,  2 Feb 2026 10:26:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="YmfHFfHt"
X-Original-To: linux-usb@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011034.outbound.protection.outlook.com [52.101.70.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6430B286415;
	Mon,  2 Feb 2026 10:26:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770027991; cv=fail; b=MTTCGpym0bkL3d3kkkbVS7E4x6merEdfoGYVYtAKMwjEA/Pt54KDNFXm0XRfGvZG7g5ylm8A5/n8WEm/YtZMQUoYa+UKPUaAY+vV3cUKzaIVic0QdBYgTDglwYY8ePxYax/Vv2zcBi+HF1xsXua896iub3XUkwKC4pLamjIZKPg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770027991; c=relaxed/simple;
	bh=j63BqSzJLK8VxB0Lf19hlcW+3PHIkwiW5uwGHR3/f0M=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=jUH312i9D0GUl6Vu5rscv/X2eaAyKB+NTssPwOXHTggc+Y9cPX9lbSefs/mQ1FzwbWZ4nD3t+NoTFuluWn1P8xDXI2NxP4m+j2/RWL5JIam5Ub49Fat6DGK9gvOylv09UbtNN7vQ2Qg957x6IfSyc2tbgautfer82qDKVw7uwsQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=YmfHFfHt; arc=fail smtp.client-ip=52.101.70.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jkXr7sXQC69UJ3EVBdEaxBwNFzVSBa6OKS4Dwq8hwzxqLxg15xYenKbHri/sII6QcCQBD23oQ1p+zNPLKYglWTL/nqY+ZtAZwCtDSLMboXaoFK8aytsiFeKQ3Q9UVN95dhZY11hgRxiPsh71mWejk6HwwL/9L1J+tEOhOXgxIvBC/tkaWwr29uiT8RCcTudUARwJKaDcETwe8fpF28bv6g+nQRLLbO9eHDaPD/rsRWU2jqihEPV+e47cSMck5ldEfUBv8dhNN74MaGc7ehGeVNDcA5ApiSIiyUatToo8o6k1fdTCI4Pd5RPJl/ttWowM89acHl6sFzKz+kcSOTdTOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y0Vku4QQAJbxXVxfZQtkBGkjdpcAXwFZypw9zYgmuls=;
 b=ZZ0TB6+Q2L+QV1P3EemZRMmG2Bd8F40hzWEwjZ0NMVffP71zJI+eHhr1hScSnhjC5ahx9JuK1IPZItALy44IE7MAKHM1NmSDjn7Uc1KyDGXkMFqaZ1rXFOldi283bn0OHi0dIcI82uUsEtAN7/NNTgS/1eOtFNL5zSLoCx2VtpR659O/Dvtvg+hTpakXI33ZhV8W9Bq4X9AfTCnEnr44In/hmdhx0l6pJAWGFy3I+SU8VZ5Ia3y7uaJR1tR3Pfp9m8bJn9Wbhy4v1VDsu0xYJmhnyf5eiqUp0BV9z0Kqmsnpmo2WIfLMl6PrBuWr5ySq/fy9FFnfx4u5jbG1xGxrzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y0Vku4QQAJbxXVxfZQtkBGkjdpcAXwFZypw9zYgmuls=;
 b=YmfHFfHtz0KA9b5IlJiLhOaEABYcXh0fg4iAZTyYtXcIjK7XJw0J5L79Wp1LqOSmQnArXydB0iJKp2IZpamrSWMaJ8P1+YncHtPktWJYoOO74UitqVg63v15RFFpf0ZwgbUBGAtiH2kyg+fxhW+E4x0ttoir4mke+/y3CJ4rgxrJm1prY9gV+IML4hvSi9j/ZRIo2j2Cey68PS5fOHOCnnkcNt8fYjUoS8bTkZKHvIBhO359AQfZ0kVbt8uqd8+hiEjhUNP93VFL0Zz5vJZt3nbfuqGStChGJkGOy93URCE/dv67tETAm6tw/tQIBsfJumLEfkTe2PqynF+ecczewg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM9PR04MB8825.eurprd04.prod.outlook.com (2603:10a6:20b:408::7)
 by AM9PR04MB8763.eurprd04.prod.outlook.com (2603:10a6:20b:40a::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Mon, 2 Feb
 2026 10:26:25 +0000
Received: from AM9PR04MB8825.eurprd04.prod.outlook.com
 ([fe80::49d0:5fa7:d131:7781]) by AM9PR04MB8825.eurprd04.prod.outlook.com
 ([fe80::49d0:5fa7:d131:7781%4]) with mapi id 15.20.9564.016; Mon, 2 Feb 2026
 10:26:24 +0000
From: Xu Yang <xu.yang_2@nxp.com>
Subject: [PATCH 0/3] add DWC3 i.MX driver based on flatten devicetree
Date: Mon, 02 Feb 2026 18:27:44 +0800
Message-Id: <20260202-add-flatten-dts-based-dwc3-imx-driver-v1-0-c44a5e919380@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACB8gGkC/x2NQQqDQAwAvyI5N7Baq9ivlB5Sk62Bdi3JYgXx7
 y5eBuYys4GLqTjcqw1MFnWdU5H6UsE4UXoLKheHJjRdKEBixvihnCUhZ8cXuTDyf7yifldk00U
 Mh05aaikOtz5Aaf1Moq7n5/Hc9wPm6HqVdwAAAA==
X-Change-ID: 20260202-add-flatten-dts-based-dwc3-imx-driver-96e4a4af9570
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770028079; l=1534;
 i=xu.yang_2@nxp.com; s=20250815; h=from:subject:message-id;
 bh=j63BqSzJLK8VxB0Lf19hlcW+3PHIkwiW5uwGHR3/f0M=;
 b=4olbRRaLUNjKqVy6OZDwMs817qvMSski1gkye3Jp606yb3K3NswiwquSzIbjoChVyykvEc4aX
 XbMgrpUnhelDLDjbPsZbDuINZB21RMtaLubXT6Kn5+66apJm1hQe4z/
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
X-MS-Office365-Filtering-Correlation-Id: 7e8ae7a1-969b-42c7-02b6-08de62457ff7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|376014|1800799024|19092799006|366016|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZnRaVVNUcEtSRUtDYjJkKy9ZTG9DaTRVVzhiY2VBNWI3VmdLdzI5dmJyanVa?=
 =?utf-8?B?MzFjTFovL1VncjY4WEpod0pvVmF2Q0NhdnBwTlM2UHlRNHliSjhscFdnZnlz?=
 =?utf-8?B?QXRHOWh0S0hSY2ZhQlJJSmZkTWhCREJiMEhQVnVSNCsxaGZhYzhSaHpRVFhS?=
 =?utf-8?B?bGh4UGQzeU9VSlExUHVhTWRMYklSRW5UbFdlMmFCaVB4VklLbjhZaFNxazl0?=
 =?utf-8?B?b2RXUVBQOGEyWm50NFpIbkhzNVVLZEp4T1JjU1lJelB4b1BJeGZQKzU2cXNr?=
 =?utf-8?B?QWIwWXFDM0phc0psV3Q1SW1ycHdsOWZuUHh3ZGkyWVpSYUhMSUN2VnpBUHpz?=
 =?utf-8?B?dmN1aExFMTdacTM0YXU2VlJrV3oyam5aR3MwQmdpNDIvRnc0T0ZWUWFFQUZy?=
 =?utf-8?B?REdOZFhLVGpraGpuUTJDMVJUYTMwL0xYU1pEY1cyNnIvaHRUeUNiWERmOGZp?=
 =?utf-8?B?SHhuWEdJZVhmZkQrbTVFeGVneU5pVzFrSDMxTzhWYXlTcXhoaExWdmRxMzNl?=
 =?utf-8?B?anY2aFNYV2dIcExjQXdSWE85Z1ZNSVpOLzUyZWRzV01LZHNqZ256eHorempn?=
 =?utf-8?B?L2ZFY3VJbVN0QjNKcWZhbzhkZ2ZWOFZ6N29rUzRTdHV5TnJMbnltUS9YTjZQ?=
 =?utf-8?B?dzRzSytQY0xWZVdmdW8wY1podWUyc0lZaUpJdWcwUE05ckRhUGd5eWtzZXM0?=
 =?utf-8?B?VGRjM2FGeW93OXlCRjVZTi9JR21jSUZpT05jclV1TjZ6SXRRU0YvTDBsV09J?=
 =?utf-8?B?K2poR3Rsc2JZTWVkTzhYb0cxdXIzTUgweEpBTXUyMUxsUEYyVFlTM3puT3VV?=
 =?utf-8?B?QW5MREJ6T3ozU1dCbklFeVNQOURzNmlvOXd3bVo2Uk0rVWY1dWh0bVpDV2NY?=
 =?utf-8?B?a0NuNHM0N0RoU3NhZVRwbkdhQUg3Mm8wSmViY1IvSU1wYW9PRVlyekEzZnJq?=
 =?utf-8?B?dncvdlpuZEIyUzA5OWRJL2tFZ1IxcEJCcDJvTDk3TVp2Q3hMZ1JQa0tLZkFL?=
 =?utf-8?B?dkNuemtRaU5WU0R2eWJMY0hrUk1KQzdsUHZ6akIxV0VSTHQ5anJJWkRsYW5l?=
 =?utf-8?B?ZUlnM2NUR0ZKdUpzenhmeEtTa1ZnSkRhdVJNTlFrVVFOZ3NIcksrQTBSSUNI?=
 =?utf-8?B?SG5BS050amJORjBya21nZlQycmlJMVVxL0NBK0g3Z01xanFDZC9GZDg5di9r?=
 =?utf-8?B?bHRyRTV6a0xuWjJUbXhVdDdWUEhFa0VkS25heXZqcGY5aXUrS1lIRzA4Wjds?=
 =?utf-8?B?elhvZXNEclRDRXUraGxzVjdjY1k0bXQzNG5SSGFLMXd2ay83c01XUnVBTG5U?=
 =?utf-8?B?MFN5MnFrZDU3Qnp0VkFCd0lUSlBMcDlydHR2ajFvUy85MlFTdjRCQXFqU3JM?=
 =?utf-8?B?NFBPMHBjRFZCV1A4MHBNd29TRTh0bGtEQytIakUvUko4dlhsSDRTV3g2VjE5?=
 =?utf-8?B?L0JScHQvNFNXeHE1aEhUSXI1VTg3bzhTaUcrSHZUWHhudHp3VWIyN0pmZHpX?=
 =?utf-8?B?a0I3d2hMejBQeWZZNmdVZThkUnB1MEpnVUczSHV5ZHcrZ2I4RFJKem1UblNR?=
 =?utf-8?B?NGRuQ3QvTUo4L2RobXIzRTdKaE9iTEpuWGV4aWt4YnNnNlo5MGFRSnk3UEZ2?=
 =?utf-8?B?bTNRMjNiWGw1UnJPaXFYZXVzTVF2Ly9rNHBJV3dBRUtVakJHYUhNeDFpK0Q2?=
 =?utf-8?B?QXkxdVBobkNBNS8yYkdCZkg2bzJHQlBIdDhkd3pUN2lHMXFmSDExNmd3Z2Ey?=
 =?utf-8?B?WDg1S2QyK3V6Z1pTNy84aElrYzUwMGZtMUx4Znp6R1B2Nzg1Qm5pN3Q2eVlH?=
 =?utf-8?B?YmF1ZXpqTEhBaUJ2S2cyUGc5VmJ5cUV0dStGM0xNa25VSjd3QkdQejQ1TVBH?=
 =?utf-8?B?SENwRHpxTXZjOVZ1NURCQXhuQm1lNS93ZmFjdjJhcWFPS2NYSU5sdzBta1lM?=
 =?utf-8?B?REhHNm5WSTdZYUticWlBRU0zSVpiNVFQWEVqaFQ5YW1jU0ErdEQxbHlCSGhX?=
 =?utf-8?B?N2xEVUxQemQ3Q3BiVm5HZCtBMVd1cks3ZExkbVZyMXdwYkQ0UVAyNmZKNVJZ?=
 =?utf-8?B?VkI5eTV4VVo0L21vVDBZVmg0MEFTRXo2b2NjN2hqakpXck1ZQmVJeVNpc2pZ?=
 =?utf-8?B?cURYSHkySm9qUjRVKytyMWlLbDhtc3RUYnBKaXRlM285dUVFejJIRUNNbElO?=
 =?utf-8?Q?bO9UhgCSISLst0MrPSMjHDE=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8825.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(1800799024)(19092799006)(366016)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?enJuU09GUzR5WnVuMmdRZWdNcDRxb3czdENlRXc2cGdzTjdCRTQvS21wVzZ4?=
 =?utf-8?B?cTB0SVpkelY0UHlST1lmVHhaUFlpaENTbWlpNllsbnBtUEdpK2h2NVY5VXEy?=
 =?utf-8?B?SnRValFZNmhmYmV3cG5SeXFyZnlBV3VGakFHaDVpU0VhT3ZRVjlvMjUrMnFn?=
 =?utf-8?B?bDIrb2RNbWw5Q0dPYlkxdnhHQ1ZQaGpNNnd6TXkvc3BReEV4NS9FZmpNUGND?=
 =?utf-8?B?MHUrMktGU0NMY2hzUmIrRHkxc0pHNXllWTVjek1DV1ErN1hMVWJ1S2taN2c1?=
 =?utf-8?B?VVBIbjNZb2pFMXpjblpnOWtpOVlOUng3cmtjWE5JWTVGWmkrUm42QUU3UW0w?=
 =?utf-8?B?QSthRyt2S2svSENIdzZnWkFEY3pabjBIeU0zTnRqczBmakZaUWRsUlo3a25R?=
 =?utf-8?B?WXY5NlN1cWhDK0Mvc3NTR3RmT1VtcVVGTkJ6YmVIUWZpQy9LcXlsZU5CMmtR?=
 =?utf-8?B?M25ZNkJOM3g2RDMxNng3bmFNMkJLalR1T3BkV0hMNmRWeld3VHBhYmFrVFFW?=
 =?utf-8?B?cVg0U0cxOFVHVktzTjJINXBaTUNXTkVMTVdHVVdwVmh2dkNQT01WSG1iOUR5?=
 =?utf-8?B?VlZ0WVBBWnlrRUMvMFBlWi9BMnRRMkdPNmlyVlp5UU9kdFdSQVZMT3lYdlgy?=
 =?utf-8?B?YU95OTlVSUk4aXRlOFgxMSszWHZDRkJ4SnB3bXhsQWVzWExrUmhLMzkxejEw?=
 =?utf-8?B?VERxQjhxZlE0OEZlczNwR0xpOENzZzBTZE9HZlFUTUFnQU11bnhvYWdwcUth?=
 =?utf-8?B?YVJQT0pSRzdUcUhra01kcHI0eDUxZ2YycXRpU0Z0T3BiYnMxNjAwa0lTS2RP?=
 =?utf-8?B?TytpYndyTDNUZ3BkbnF0d2twM1BNMkpRL3FqdTZTSHNRWG43YUxzN3h4VHVH?=
 =?utf-8?B?ZmE3TGd5R3pjWTdtRWpiWEIwWW03ZmhrNlYwZWZ1b29EN0oyUndtcHE1dmRI?=
 =?utf-8?B?LzRLbzFaQ0luV1FybWtpRFFzc3ZiNEtISmlMdkxRMDlLbUUwTUx0eW1kTXp1?=
 =?utf-8?B?THJ4K1d2WmFzbmhabU1uZ09CL0V0T1o3aGh6VHB5dEs5WW9zeS9HZXorZHhQ?=
 =?utf-8?B?Skh3bTFCREpRd2NxakpEdld6MHB1RFdJdEk4bjFvclpubVVOSXBhZlpNUCs4?=
 =?utf-8?B?Y2xQM2ZGVkVxSTZIbVJha09yclRTRG5IcEhUMTJIR1FBNEVHMWVwTEhjYXNP?=
 =?utf-8?B?YVpYOFdrWUsyb3o4RE9iS00vYnVPSVIzWVNZSjA2TncvWHZZSzRCeEpFNlRk?=
 =?utf-8?B?enNmUlAzcnNPREY4VkxobjRlOFdGVCswOERNc2MvSU03cVZzWk5mWGlyREJZ?=
 =?utf-8?B?T3N2a1U5cmdiK0tFK01EdHRNS3VwUjJqdjVGdkphZW5FcXFRN2VnTHpkenZX?=
 =?utf-8?B?d0o5NnhpRkY3NmhnL2FNR0k4RG42NW52SDRXc1dlUE1XcnFHNEw3Y0srZlYw?=
 =?utf-8?B?ZStCbU5aQ3Vkc1J5bmlKbzVvZVhzVk9xNFN2VXFlRCtXNVdJeHVRalF1djJJ?=
 =?utf-8?B?ZDdlZGd1ZFFQUk1SQTNIajhYb2RhU2hnZ0JJazg4eGs0SWZ4TkxEZWduYnYx?=
 =?utf-8?B?dmhVQ3VqTHFqVFZTN0Z5cmpXNmx4S2lxQ0JuTXJvUzNQV0pQRys3NEVMN01k?=
 =?utf-8?B?TFlrWDNaeTZ4Qmp0c1NQWm1ocHJnajFYUXNPbFpZRFBUaU83U0xIemh3dkNY?=
 =?utf-8?B?OS9YZ21Ta25ZTUluRlBsZkxYVDIyV0RNdVpSMTV0UGc3ODBrZWs0a2xZQzdR?=
 =?utf-8?B?OUJSSk94M1dPMjN1WEVIbk9KSmFjUnY3UFRCTnV3MlVqRE9pVU9rejdHOHJm?=
 =?utf-8?B?ZVBKTElvSDg2ZFhtcDFiVlJVQlJlYmh1MGZucXdyVzg3OE5VYXJLZVZrNmRj?=
 =?utf-8?B?cURoUFhDZkxjenBlZHIvMmwybXBVb2EwMUtlcjUzWjNyZGlFRkY2QWpsbTNU?=
 =?utf-8?B?SGE0YUwzT3VBZTZPVjVFRGRwOWY1NEJSTGNneUw4QkxhNDFQNDlLZnphUFJC?=
 =?utf-8?B?R0tnOGdpUm0zNGdFc2tlTStaL0F6OFdqVUw3NXZpdHZGYmc5U1hMSjNtcmo2?=
 =?utf-8?B?bkRLNGFpeDlPQ3dMdmFQQWtKaFQvdWp4VnN6Vk5wYzRGU3l2bVZQOVFidUhM?=
 =?utf-8?B?VjZXN2R1aUtyNEU3NEx1K3V2ak5CRjR1emNvQjljeU5WWnZoeUtZNnpGQ2xq?=
 =?utf-8?B?YXBtYjJyVTM0RFFFM1JCSGhhcVlFVTIwb2JkcnRabXU3bk1XMmdneEtaVGVF?=
 =?utf-8?B?U0EyakpzdXNLVFduYmFiUEpJcE94ZmRGc2dWME9tNUc2Vnl2d0NnR05VbkZr?=
 =?utf-8?B?VWNpemJocndHTS9kaEFuV1FxdW42ZWZURkFseXQyNk1UOXNXc3VzQT09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e8ae7a1-969b-42c7-02b6-08de62457ff7
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8825.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2026 10:26:24.1875
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vu+6od5jMxwKiy8w+3wsd9xBhGQQRGdo0HOGtPv0Y1WptJUTgDYYLUPd4oAG3YPPMDnJDSqgTrgLaX8UILitzw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8763
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32993-lists,linux-usb=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:email,nxp.com:dkim,nxp.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,i.mx:url]
X-Rspamd-Queue-Id: 7477CCB03F
X-Rspamd-Action: no action

The i.MX USB glue and DWC3 core are closely coupled. Describe the i.MX
USB block in a single block will bring more benefits than a parent-
child relation.

Now DWC3 USB common driver already support to do more key jobs in glue
driver, such as power management and core initialization. Now let's
make a step and add a flatten devicetree based driver.

The first one add a new "fsl,imx-dwc3" binding to describe all i.MX
related USB controller.

Then, to support wakeup capability even when controller experienced
power lost, a fix patch is added to make controller work after system
resume back.

---
Xu Yang (3):
      dt-bindings: usb: introduce fsl,imx-dwc3
      usb: dwc3: add may_lose_power flag
      usb: dwc3: introduce flatten model driver of i.MX Soc

 .../devicetree/bindings/usb/fsl,imx-dwc3.yaml      | 131 +++++++
 .../devicetree/bindings/usb/fsl,imx8mp-dwc3.yaml   |  13 +
 drivers/usb/dwc3/Kconfig                           |  12 +
 drivers/usb/dwc3/Makefile                          |   1 +
 drivers/usb/dwc3/core.c                            |   9 +-
 drivers/usb/dwc3/core.h                            |   2 +
 drivers/usb/dwc3/dwc3-imx.c                        | 428 +++++++++++++++++++++
 drivers/usb/dwc3/glue.h                            |   3 +
 8 files changed, 597 insertions(+), 2 deletions(-)
---
base-commit: 0a06917432a762d6233f88963c0b53e48dbac6b4
change-id: 20260202-add-flatten-dts-based-dwc3-imx-driver-96e4a4af9570

Best regards,
-- 
Xu Yang <xu.yang_2@nxp.com>


