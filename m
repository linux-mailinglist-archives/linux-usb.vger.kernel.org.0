Return-Path: <linux-usb+bounces-33091-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6Pq1Figog2kxigMAu9opvQ
	(envelope-from <linux-usb+bounces-33091-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 04 Feb 2026 12:06:16 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E98A4E4E4D
	for <lists+linux-usb@lfdr.de>; Wed, 04 Feb 2026 12:06:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 181963037F1A
	for <lists+linux-usb@lfdr.de>; Wed,  4 Feb 2026 11:05:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92EBB3E9595;
	Wed,  4 Feb 2026 11:05:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="eW9T6sJc"
X-Original-To: linux-usb@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011061.outbound.protection.outlook.com [52.101.65.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7CE13E9586;
	Wed,  4 Feb 2026 11:05:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770203118; cv=fail; b=JDFHRGQ+mfG2Wql7Nn3ztvsEkE7mLCg2v/0MrzU/07LV6zYaSrYDUbXjfQnjX6+KIwCbysbFEoawTvMWbG6mDHmX2mef+U8gCGYBPPXRxaLuENv58UaT8PyFvhYqgdrevgYTXVzgLgP6xHadYlU9ymlSMQnp3KbcEWPEbDnsjvc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770203118; c=relaxed/simple;
	bh=YhHN3rjFMpHvNHQVLqbfJesc9LdgbayX/o3gDbwZ54g=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=Wbu7mW/nsNmTHZSl8ni69Gr/N6xPHMMiBxl+QbtQD8f80ftoWMFZLIggtQhH2F+S3bkraMRUdQiOa/s2lK+a2me54WyWrkFzfqfrjTZql1BX4Dbo9B2fB+S0zPeuuY1g4mq43O3BR/XBhQ7WIav/mE9UVXK+oy3Fhqs2k7EXo5A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=eW9T6sJc; arc=fail smtp.client-ip=52.101.65.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QcwGy5A4lN++TRI8kXXe7RMxuRhLpCbCKaGibIDrn1gvdAR0O1W/hRrvhthitBTyTn9Pfh9kN26NSIpxxMwN5jZi0R++5UeQftLo/VhUtc1fp0tlAETe2OxA724p70Fr6OSIU9O/lc0zDZaaYP6Z55PWv1rZLHjQ05xF/XS9Vlq0sGLWhjQa4x253eKujSevswYcwkVusr1PIs2i9Vn8lxTbcyagH+/B9TDqTsgMGosJF9kSYo1BII7DeCr/VJG8uMoBrjx2Iz/HekdUD1r8PWGLk8DM2iqSk5oIz8BROmWyfbYfKBFd+B3tgA2rMJX0zdH5bUxNo7e8kMTntdIibg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eOoQLa9FDgEk6wL2LygM7leXrYfcZf6BMdzW+MJvKdA=;
 b=aKiZ/nRSNxwAh9b38UMeLPCaF3KapiUbwkjdYFok7wPSuuW199LQCrPk/IYXB1hdDBxkrFQyASMMHAgIOiAlUCvSl4jxjNjayPeOSqjyZRRl1apK2hwmT+ow5p4h2/OnuUIpEO6FSdJOCnWlAVI+CxY8R1o0+slx2gnKW2qPozVjzFLYHI8ZuTff+uxsnmOMkIkCGSzyAthAR83mB0T0c680DTNt8ePtvU3w6v9tnEFdN1XvLJEp0d+FrbSie5QyJ9MAgNFntPpBGJ4mRidSIWPH31Hn8n3ge+FXx4W9lZCnqzbq436AeYAdZrh/mh4gCZOOjxlT+ewW+QrenOo+Rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eOoQLa9FDgEk6wL2LygM7leXrYfcZf6BMdzW+MJvKdA=;
 b=eW9T6sJc3SeMwwAyyKiWpnpwTyIK5fjSu/zHymAIlW4KNn0A+fbV4GMlJGOZrCOr6bRDmPTli0lFYcdZX4iWeh9KVFIaPnBqyAOeAWpcorzT4eh6y/eY8ikVh31lZ3qhtZ6myB3uO24pk5syWBn6mK2xBelj5ZT1jjFduPyDPs9biIP76CRXkGtWnfzkBUzcIMXM6MLreQsISlflFPvZ3qa6ZtLM9vZwkxNN28N5eB1KXcsyVe2gZQ9LovIa7WU67rPMfyRoyxNVmNjsAIuXYjewGHL6gF8ZGcksDmbwYENiEy0A0UPn2LCAbYK8QDH5mTPgC3VJFsdDrsaufmPPcw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8829.eurprd04.prod.outlook.com (2603:10a6:102:20c::17)
 by GV2PR04MB11303.eurprd04.prod.outlook.com (2603:10a6:150:2a3::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Wed, 4 Feb
 2026 11:05:14 +0000
Received: from PAXPR04MB8829.eurprd04.prod.outlook.com
 ([fe80::52de:f9c9:8c2e:7dd5]) by PAXPR04MB8829.eurprd04.prod.outlook.com
 ([fe80::52de:f9c9:8c2e:7dd5%5]) with mapi id 15.20.9587.010; Wed, 4 Feb 2026
 11:05:14 +0000
From: Xu Yang <xu.yang_2@nxp.com>
Date: Wed, 04 Feb 2026 19:06:17 +0800
Subject: [PATCH v2 2/3] usb: dwc3: add needs_full_reinit flag
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260204-add-flatten-dts-based-dwc3-imx-driver-v2-2-d2c9b5a58c01@nxp.com>
References: <20260204-add-flatten-dts-based-dwc3-imx-driver-v2-0-d2c9b5a58c01@nxp.com>
In-Reply-To: <20260204-add-flatten-dts-based-dwc3-imx-driver-v2-0-d2c9b5a58c01@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770203208; l=3904;
 i=xu.yang_2@nxp.com; s=20250815; h=from:subject:message-id;
 bh=YhHN3rjFMpHvNHQVLqbfJesc9LdgbayX/o3gDbwZ54g=;
 b=y3ZBtEBU5ilEN8JhTP3u3V+i5YEGgULD5IqWEvhE1/kH49iKCm+PIZKzhEzvt3Mz/1Z3L/E/2
 Ay5vpMbUsnQB7ZywavuGhulJe/VqUQibu6Y0zUKpCxPVZ2LNIO9+ZZi
X-Developer-Key: i=xu.yang_2@nxp.com; a=ed25519;
 pk=5c2HwftfKxFlMJboUe40+xawMtfnp5F8iEiv5CiKS+4=
X-ClientProxiedBy: SG2P153CA0030.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c7::17)
 To PAXPR04MB8829.eurprd04.prod.outlook.com (2603:10a6:102:20c::17)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8829:EE_|GV2PR04MB11303:EE_
X-MS-Office365-Filtering-Correlation-Id: 291771cf-3cd0-428b-6e85-08de63dd45e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|376014|1800799024|19092799006|366016|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Z3RvSXorQmZMa0VMWFF0RW9jdGtLZ2JFMlVrNWNqMnRVNVBBQVBLb09JNlNM?=
 =?utf-8?B?cjdZdUpLRTlNVmQ3YU5mRlppc1loUlcxR2E0VHVDdU1tSWRRMGs0SWRhS2ZC?=
 =?utf-8?B?anhhajRERlRnclE5ZTRGb3pGajdBN3FQVEMrc3MwRGs4c05lbnNDaVJNMnVC?=
 =?utf-8?B?Rzk3cHQxdkJSWGRkbTRwbm1jc093N1o3cDNMMHBjK0NEWmpsUEFKbkU3Z1FD?=
 =?utf-8?B?VnZkMUxqV1hPRHZabW00aXovR2tyOGxOVE9WS0JzNXNrcTVOK0VPYXh2MVNH?=
 =?utf-8?B?VFVUSUgzMWR0dEd5TlB0bDZxZCtmWERZZHFpVTV0bXVsRVh1TVJETEdvS0Zh?=
 =?utf-8?B?S3cxRTQrclRidzAzTVZnYzAyVkRSOXdPNVV0MHAzZnRxNzZiRUNuTkZHRmxD?=
 =?utf-8?B?ZUNwaUpaMnV6S0NSdUx6aUM3eGJ0VzQ1NEhCbWZBS1hEajN4cFJSNVZoVHJv?=
 =?utf-8?B?TWQwYlJ3eE5NYnRYRUtGWUxKS2lwWXhROCszSzVZWnNmYW1xd2VQSFFNYk1T?=
 =?utf-8?B?ZkkrVGpVM0ptZm5aZlBxeXdmVVB6ekR5YThzK0tJdEY5d3Z3ZXlsSWh2Tm84?=
 =?utf-8?B?U1dyT3hSb0xGWThCeFRNWGlYUXJta3o0NDVUdW5iZUJYdEN3RHlsNEFtN3dD?=
 =?utf-8?B?RCtkSHFtUFdDcWZHZWpIL3k4UzhsYzJ1eDJmamJmUVRTVHJHbndhUnQveUw1?=
 =?utf-8?B?QmczVkpYamc5OGE5UkYzRXhlZTc3S0VMeGpZRmtranlDS1RRaE9oallZVzJx?=
 =?utf-8?B?bzlqR3NTVk5yRUQ3dElINlpzSXJyMDRlcFlrNzBpTHJ4cDZhdlJmbzNaRGRY?=
 =?utf-8?B?Y1hjVXhoNFpjV0JqNXpOK3VtSnVNaVpTbUQvRThJajdrZ2ViR0pLMDkwMlhG?=
 =?utf-8?B?VGd5N3NkUjR3Z1E0ZHpvTVJjNytGQ2pFaGVNYmRkd1greG51RVVsZTZVcUJq?=
 =?utf-8?B?djY1cEY3V29aeHhrd041UHV4QjJacjNMY2E1Z1R4ZUk0TUxIWFRCMERGaXBr?=
 =?utf-8?B?ekZUOEIveCtxdGZLUHp4SGJLVWkxQWdzR0wvZHk2dno0a1hlanArYmpXNGd0?=
 =?utf-8?B?NUdOeUF6WUFDNmVvcmdrbmJWSU1sMnA2ZUxJaTl4OU9tLzZ2TEtmTkFSckR1?=
 =?utf-8?B?azRPcXhGcDd5RHBQMVlZMHRXczNoMHVYTDZua1YvMmthTG1KOWhEYk1VcTFQ?=
 =?utf-8?B?VnBiU1o5VVRSN2R3RHQ4VW9pUy9GMi9OeVVNdmR1TmZaZ3ZGN1FhYUwvUlla?=
 =?utf-8?B?dGFZV0duVlAveDZGOVcvajNOS1FQWGVkVXVYL01pUHlMVVpaLzRwbzBQYVF4?=
 =?utf-8?B?ZlhqcTF5MStDWnRaRG9sS2Mrenp4UXJpRXByMnphUzJFNjFXVXU1TUs2NzFJ?=
 =?utf-8?B?eUZ6eEdPRkpxb2dRSmU3ejlGU0poYW1YN0VjMC93aHRycGZzQ0M1MklUSXpG?=
 =?utf-8?B?SCtXVGtFKzVhamVhY1hlV3ZUOXBkUDZjenpXM3kyNzQ1UU41d0FLS1F1c08v?=
 =?utf-8?B?NVA2YlY0U0d5MnA4WEhQN1BuaUxwdUJMVkxMN3BWem85NFhSSmhBRkNNenAv?=
 =?utf-8?B?MWY3VGo2UXhjNnRub0V1RXNOWjFYMnFrMEdOUFNGTVRBRmVPUEhTU2NsWERY?=
 =?utf-8?B?UTliV2ZiejZsd2ppT1gxMlBnY0VxZEpCQTRtbzhHOXgrY25JTS8zekoyeFB6?=
 =?utf-8?B?UE5vc2hmZkxhbnJFckhXZ2FybzIrTmw4bjd3ZldhOGtWWVdQSGphOG9LVGdo?=
 =?utf-8?B?MmNXc3AzWGdPZ3VqNG1NaFFkcWpydENWNENFQnQwamwvL1ppbytsKy9pZkJJ?=
 =?utf-8?B?ZG9aVThyV2g2UmNabHBQN2FZTklyQmVzTXk0SjRheEJGUCsycFJUUmVmM3Rl?=
 =?utf-8?B?Y04xd0lkZ0JsRUZEa0JMcWVPVXlYY090aUZWWFAwSy82a0J6dEV4Umloa1lm?=
 =?utf-8?B?aWpzS0d4UHJmZzg4SmpSQjBvVEtSNW85N1I2VHhVZTF2MGFaL1RSVkVZdW4z?=
 =?utf-8?B?U3RucFRhK1ExNm9rZjJsMTBJSVpPVEtORllKUmxveWsvSk5aRVRoUUlZTDBj?=
 =?utf-8?B?L01QU0NkcDlyS0U4bEpBSU5MK3B4WXFXRGJzeXR1SzVVQkg4cTZ6T2o3Q1hU?=
 =?utf-8?B?dXZIa1RnN1ZBWnBobDhkdU5IN0dybXcxYnM5L25rczBZcGllUG1ja0RsYWNh?=
 =?utf-8?Q?O9GNYd1azG7SrVjYxcgJdJpFyF39NcRhQswSfKwVPUcL?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8829.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(1800799024)(19092799006)(366016)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N1hCUGNBQytBMUl1c2gxRkNUbjhGeTBEUGM1R0xEOHNNYU5lVXJ4RWhkbStE?=
 =?utf-8?B?OGQyMGRBK01rTVl5SUZmY0xsd1VrQXpzZ3ZQM3pQb0U4NlpGaHBzeWt1Q3RJ?=
 =?utf-8?B?cWRtRDdKZFgraVU0K3dPcm9KbnBoRGR5YVROZUdFUkJpOUNodnNpREppb1Nn?=
 =?utf-8?B?Z1JZN1JmQkZycm5yaTcrWG9jY3VOaEc0YjE5a0dZV2JMb210V0RQMjhiMENW?=
 =?utf-8?B?c2NDOUFRUkV0aGhuc1lQcFU3TE9xUVpTemhibzJQT0RpYmZaWjlvKzFWb0Jk?=
 =?utf-8?B?azJNRkUzNGpqcXMrTCtLNW43YVI5Zm9UUy9tWUloTk04RHVNS0Jsa09OekJW?=
 =?utf-8?B?MjZpMVF2RHdYeGhac0pqQnQyZTNib1N1YkUrSHNkZ0poSGdNYkswMkt3R3FZ?=
 =?utf-8?B?c0NSclZzUjlqai9OVWZRSEVNRDdsMkFKSDJOWFpHR0NQTFhnN3dHTmZDcS9Q?=
 =?utf-8?B?b20vYXRKU2JPZUtlNzVVRGl3K215TnR1d1dxMDhobEQvQVl2UlBiaS8xNG82?=
 =?utf-8?B?dU1NQnpQa1Z1U1N4ZnJUKzV1QTdtQWs0MzZNYjVsT0JabmxUb1k4NFlhWi9W?=
 =?utf-8?B?cUJmWFN0SkFsUHJ2NWRsMTcrS2RYeWlhSjl1bzBDYjFCR0lteE92U3dOcWtT?=
 =?utf-8?B?UE5MSTdXaHNTSlFlTkRIeko4MURWMFBVOFpyaXNKd0tYUkZjMTdZN3NFQzZE?=
 =?utf-8?B?Q2FIY0VDSmtCZC8xYlZwUkc4VUxOQ2s4SlNLZStVakVkWll0dGQ4TW9BUzk0?=
 =?utf-8?B?SFJaQ2ZnbG1iS0ZOa2ZJSW8rZlBoSEhGdW5HdFM5R0FBZFdFbWtjdGxxZTB3?=
 =?utf-8?B?TEJWdXJENmxhWmM0K21ha2hoeXNoL3hkWlhmRHhBM29jZTFmQ0NwNjBuU3Vw?=
 =?utf-8?B?R1ZzM3BZZ3g3dXdIdjh6NHY5WThUcW9QeDhPSkZ3ZG03MEZhYUZjS21aUVBx?=
 =?utf-8?B?bkFNUm5LMUg2YTgrcU5ZVjdOck9Ic1orcThHK21zYkt1bm5oTXZYS0szbjNB?=
 =?utf-8?B?UFRsV2FNMG9vejBGKy9NZk5pblo2TUZWbEw5Yk91TzAwMEQvcmU2KzAyWHp3?=
 =?utf-8?B?SHlqVlkzTFJyMVFXamtEdWVHcUtvM2pjY0JXazBteWs3SU4rMngvdGNJSGhH?=
 =?utf-8?B?WlN2eFpGUG9IZUdlYWRTTVZXdjM0OGM2OHg1OUxwN2pSeVNzVlMvdGlvNmZz?=
 =?utf-8?B?bW9CUUhTeXlBejRMZ21lRDQ4N1R6RUwybmpibHpLbTc4aW5NK0RLK3VYSzMz?=
 =?utf-8?B?SGlGZHorNUdzR0w3VzRQMXBOa1prNGswWnl5b2s5ZkpQV3lxQ2FYRlFqeE1h?=
 =?utf-8?B?RTFkSHk0cExhQTlMVDNtekp0aGVDL1dpdXNPS0RsWXZoR0RsUC8wd0RCeCt1?=
 =?utf-8?B?M0VhWXhpTUY3dE9MbEJRcWFDSVBIRDF4b1NROVRhUWplN2M3TmtjaTlTMEVI?=
 =?utf-8?B?eVFQaFJEc1phQWFkYnNkcStMZTdjcFZZcTkraVVXeExHb09XcEZSdTlqdVZm?=
 =?utf-8?B?SUJRNnNqMzJhNFk4QndSNUttdzY4ZTRLNlpRUG0wUXlXT0kzTmJ6VlpNUU1v?=
 =?utf-8?B?TFlyWVpoQ0FDeFRGODJjS01WOStaRFlPMGFtZ0tneEhMZEJ3eVIvM2VDeExR?=
 =?utf-8?B?NzNIZHdNZk9TNTYvWTBkdnNVNmQzT0FZbGJ1UWtJRnA5b1YwWFpOUzVzVGEw?=
 =?utf-8?B?VUp5S0NjeTAxVmZFRC9LaGdOR3k3NWwreUF6RmZuWUpLL0ZtOEYzdEhFVm1E?=
 =?utf-8?B?ckxZWW04L0lpblhEMjQ5OXM5dlRvOEN3R3RIdlV5SkZYTFVhQS9oYXpEcGVv?=
 =?utf-8?B?L1hpT3JsdjdlMVRiaDBTeC9vTHlTQ0lYNU5GWis4SmgzdldqcVVJdEVGa0Y1?=
 =?utf-8?B?TUdnWVIvd0dhRzdiMEx0U2UzZG9jaUVCQzk1di92M1U5NmFHaDhDbGhEQ25L?=
 =?utf-8?B?eGQ1YnhEa1FvSnpOYjhTMndTejZpNGg0WmlkK1hZN2luWDl4RU1VNDcyVVJO?=
 =?utf-8?B?YUZ0VGxvU2FLeThWMnVYc0VHcE5EMlNSOG1pNmxuQ1F3dXErYlc1ODkvRkpR?=
 =?utf-8?B?cnQweEsrbU5CcjNYNWExVDk3Mkl3d1ZGc0RIdURXcXFxSS9wNUlkUzJVWUxz?=
 =?utf-8?B?SFVsaXFBTXN1dllCdWtQUXh5L3N4bzJRcFlZNDFkQXg4NDhlVGZNUzZqVkc5?=
 =?utf-8?B?aEk0REU4NXk4TlpONHZ2L3ZQREc5dlpJZVJhcVlzenh2WW9QMEJVbjZ3RUxv?=
 =?utf-8?B?MUI3NHVJK2lvSUR0QUVwMGR2aGFBYVJmVUJzZ3pETjJHZ3ZseXpkVFU5L1pV?=
 =?utf-8?B?WkpJOVBhZzVZWllYYlVieWpKbnA2bWM2U0o2RVludkRiRUhNNlE5UT09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 291771cf-3cd0-428b-6e85-08de63dd45e3
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8829.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2026 11:05:14.6133
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eHJDDcwJLsqE3+JFV3/Jcy3u0dX2dBMnoNcR3vifEAsx8rkA9x3Etl4VGkz8jd56umJgtO9mP3hxuxEPxruf7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB11303
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
	TAGGED_FROM(0.00)[bounces-33091-lists,linux-usb=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,nxp.com:email,nxp.com:dkim,nxp.com:mid]
X-Rspamd-Queue-Id: E98A4E4E4D
X-Rspamd-Action: no action

The current design assumes that the controller remains powered when wakeup
is enabled. However, some SoCs provide wakeup capability even when the
controller itself is powered down, using separate dedicated wakeup logic.
This allows additional power savings, but requires the controller to be
fully re‑initialized after system resume.

To support these SoCs, introduce a flag needs_full_reinit for the purpose.
And the glue layer needs to indicate if the controller needs this behavior
by setting a flag core_may_lose_power in dwc3_properties.

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

---
Changes in v2:
 - put core_may_lose_power into dwc3_properties and check it in
   dwc3_get_software_properties()
 - rename may_lose_power to needs_full_reinit
---
 drivers/usb/dwc3/core.c | 9 +++++++--
 drivers/usb/dwc3/core.h | 3 +++
 drivers/usb/dwc3/glue.h | 3 +++
 3 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index c07ffe82c85049364c38c7ba152aab0ff764d95e..c5e0a1705b6f5117e1961b45d96a42c95c5ad421 100644
--- a/drivers/usb/dwc3/core.c
+++ b/drivers/usb/dwc3/core.c
@@ -1675,6 +1675,9 @@ static void dwc3_get_software_properties(struct dwc3 *dwc,
 	u16 gsbuscfg0_reqinfo;
 	int ret;
 
+	if (properties->core_may_lose_power)
+		dwc->needs_full_reinit = true;
+
 	dwc->gsbuscfg0_reqinfo = DWC3_GSBUSCFG0_REQINFO_UNSPECIFIED;
 
 	if (properties->gsbuscfg0_reqinfo !=
@@ -2462,7 +2465,8 @@ static int dwc3_suspend_common(struct dwc3 *dwc, pm_message_t msg)
 		dwc3_core_exit(dwc);
 		break;
 	case DWC3_GCTL_PRTCAP_HOST:
-		if (!PMSG_IS_AUTO(msg) && !device_may_wakeup(dwc->dev)) {
+		if (!PMSG_IS_AUTO(msg) &&
+		    (!device_may_wakeup(dwc->dev) || dwc->needs_full_reinit)) {
 			dwc3_core_exit(dwc);
 			break;
 		}
@@ -2525,7 +2529,8 @@ static int dwc3_resume_common(struct dwc3 *dwc, pm_message_t msg)
 		dwc3_gadget_resume(dwc);
 		break;
 	case DWC3_GCTL_PRTCAP_HOST:
-		if (!PMSG_IS_AUTO(msg) && !device_may_wakeup(dwc->dev)) {
+		if (!PMSG_IS_AUTO(msg) &&
+		    (!device_may_wakeup(dwc->dev) || dwc->needs_full_reinit)) {
 			ret = dwc3_core_init_for_resume(dwc);
 			if (ret)
 				return ret;
diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
index 08cc6f2b5c23631a752c77fd7394e5876c929f0a..01d92d680ba4ab9c85deaef39a8f55a6c95c3593 100644
--- a/drivers/usb/dwc3/core.h
+++ b/drivers/usb/dwc3/core.h
@@ -1117,6 +1117,8 @@ struct dwc3_glue_ops {
  * @usb3_lpm_capable: set if hadrware supports Link Power Management
  * @usb2_lpm_disable: set to disable usb2 lpm for host
  * @usb2_gadget_lpm_disable: set to disable usb2 lpm for gadget
+ * @needs_full_reinit: set to indicate the core may lose power and need full
+			initialization during system pm
  * @disable_scramble_quirk: set if we enable the disable scramble quirk
  * @u2exit_lfps_quirk: set if we enable u2exit lfps quirk
  * @u2ss_inp3_quirk: set if we enable P3 OK for U2/SS Inactive quirk
@@ -1369,6 +1371,7 @@ struct dwc3 {
 	unsigned		usb3_lpm_capable:1;
 	unsigned		usb2_lpm_disable:1;
 	unsigned		usb2_gadget_lpm_disable:1;
+	unsigned		needs_full_reinit:1;
 
 	unsigned		disable_scramble_quirk:1;
 	unsigned		u2exit_lfps_quirk:1;
diff --git a/drivers/usb/dwc3/glue.h b/drivers/usb/dwc3/glue.h
index df86e14cb706ca509206677f644da2a7225b1b26..d4ea635c92fb6045ee1e9064db953105d5b1f7a6 100644
--- a/drivers/usb/dwc3/glue.h
+++ b/drivers/usb/dwc3/glue.h
@@ -12,9 +12,12 @@
 /**
  * dwc3_properties: DWC3 core properties
  * @gsbuscfg0_reqinfo: Value to be programmed in the GSBUSCFG0.REQINFO field
+ * @core_may_lose_power: indicate the controller may not remain power during
+ *			 system pm
  */
 struct dwc3_properties {
 	u32 gsbuscfg0_reqinfo;
+	bool core_may_lose_power;
 };
 
 #define DWC3_DEFAULT_PROPERTIES ((struct dwc3_properties){		\

-- 
2.34.1


