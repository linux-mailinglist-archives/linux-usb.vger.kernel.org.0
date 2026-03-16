Return-Path: <linux-usb+bounces-34852-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sID3NkPQt2n0VgEAu9opvQ
	(envelope-from <linux-usb+bounces-34852-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 16 Mar 2026 10:41:23 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DE90297328
	for <lists+linux-usb@lfdr.de>; Mon, 16 Mar 2026 10:41:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A1D58302DE10
	for <lists+linux-usb@lfdr.de>; Mon, 16 Mar 2026 09:40:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD3E238BF7E;
	Mon, 16 Mar 2026 09:40:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="i3zWbz2L"
X-Original-To: linux-usb@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011053.outbound.protection.outlook.com [52.101.70.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5060A38A737;
	Mon, 16 Mar 2026 09:40:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773654027; cv=fail; b=kz+N0NPXya7RUnAQi2AdObco3lVq269kOjllRcF538uP9oOCR8S6rvij09gm97OFB2eA2goFeTlbg6udTEQsEN3QDYge6HzG/TIwg9Xx2TLIkCGl4pwBHNTgJyjC1t/LN4AB4drc1vsfl8EMhjqK4vW/9yHn0zZuBd77ZWsLSDo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773654027; c=relaxed/simple;
	bh=21mEMT+QzqvXsBd3riVyfr3iqg+BwMSwP96eOo4izrA=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=VnmlJt1FqBY7sMRHLAg3X2Sp2TtDq6XK9reLOmmGVBGUpEBI16p84jazq3vLMeZ/wAYtLB8uhV9Vm542Sauyi0smRAdRxnnYZ5O6ROvrolW3ZdAN+MNzDILgVWUo6tDIwI5lWnyJdu4P7Z9l1GEK1dQDs1ljppncLxSR2M3TwvQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=i3zWbz2L; arc=fail smtp.client-ip=52.101.70.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cWpuDEwe+QEm6kaI7iKyNMydJEdZGarMpB/niNU3kjXrd5GtlkFNh6HEJz8h2CPHcyZWcMQeoJ2vt7lTjnr+neXJi7TygXZVRXS9BiqQRLGC/mLMZ8UF4lxR43V/Sp4WZknUQON2uhBIwh1z3LCiPkOnLxpSBam3ZaIpketFXenhBmZJvc+A3LpTAeoleQ3jfMKo8b6PHAVdIt+Z3m4+/XigTcMUk7kVB0opuI2vDie3GT0r+/NMBz2etHqd9SG7WHjohhG2SI/Cw2h1BUo4cMi7/JJcyEbzVTvn0Qr2gWRryeEXLeXOw404YTY9zQWgRZdgATYP8hAREQTglDa4dQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FqxwVzft9vwLgDMkpadjFEy7c7CbYPaHAkMXRWP9qYI=;
 b=J42ZwRdgh9NIcvgwEd8E4sxsc3Ic3+a8dugBmm46RIz/rHyS8nJXhhLrjGMeJInvMhYFgPjoZyYiLDd0TzP3qIADwmn5b3Em6mt+J/Ztkr8jTG+rsh2d22rJPzlwZpPRrkfa3u/sc4582rUBhPwZcLlluqtSPuS4FD/bWAeW1DSvI7jzpqAA2MBeZS1tpEUKWqqV/sMKw7Q3wfT8PFwk7zgTzsOXMZ7Q2SpOjw6TJKxUodNt9gRNv4e6Jx/wuZ3ncUFfkACKVfjmyD4N093QSNX2uAGJK33EDs/0taACcd2ScwykbzMYiAMpzXIwZTXo50LcOeNfhS1nP4TxCzVJ+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FqxwVzft9vwLgDMkpadjFEy7c7CbYPaHAkMXRWP9qYI=;
 b=i3zWbz2LCYzKepTzXJUFr4WAfFqLXhT2Jbsy8mRD34Udk/Y6+XNR280hgKimEjvmjREqtp9o0abtJOHPrWizMYEF/fQaC58mg5nejiQW8W7wpRbkaq3QT3VrlHg/TYIrL6tnR3EpDUtaPJ8Rc1jjUFjbjKJ/zcTS3LAK0014gPYjkgIDyoIYwdR3nvfPosPQena36gem/Llofby+xQqHcRpFtRrSLjt2olyrdwT2yLIMqzwXZ6Uz+Phm0WC0JreT4pO8BdtA9ToyMrrzTRDU3FRwMSnemILRv7qLzE5Izteq5/pGGNPTScCtC+VjFP1EmtULPhoj/9qtonWF/kNPGw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by AM9PR04MB8131.eurprd04.prod.outlook.com (2603:10a6:20b:3ed::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.22; Mon, 16 Mar
 2026 09:40:20 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::c67b:71cd:6338:9dce]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::c67b:71cd:6338:9dce%5]) with mapi id 15.20.9700.022; Mon, 16 Mar 2026
 09:40:07 +0000
From: Xu Yang <xu.yang_2@nxp.com>
Date: Mon, 16 Mar 2026 17:41:56 +0800
Subject: [PATCH v3 2/2] usb: typec: tcpci: support setting orientation via
 GPIO
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260316-support-setting-orientation-use-gpio-v3-2-0e6622b00dd9@nxp.com>
References: <20260316-support-setting-orientation-use-gpio-v3-0-0e6622b00dd9@nxp.com>
In-Reply-To: <20260316-support-setting-orientation-use-gpio-v3-0-0e6622b00dd9@nxp.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Li Jun <jun.li@nxp.com>, 
 Badhri Jagan Sridharan <badhri@google.com>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: linux-usb@vger.kernel.org, imx@lists.linux.dev, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Xu Yang <xu.yang_2@nxp.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773654143; l=2604;
 i=xu.yang_2@nxp.com; s=20250815; h=from:subject:message-id;
 bh=21mEMT+QzqvXsBd3riVyfr3iqg+BwMSwP96eOo4izrA=;
 b=s0FrlCKSYhr9+2dNIKbhUSmWp0PFXz3Kjcsj0Quwmj1eGi6m4DRvopb1Avzvn8aJKg9H7Gc2Q
 XwnpsdysHtkDcXu1oW0nsxh2JTKXEO3txrAJ5aDSabXhzAGFi6/Q+mR
X-Developer-Key: i=xu.yang_2@nxp.com; a=ed25519;
 pk=5c2HwftfKxFlMJboUe40+xawMtfnp5F8iEiv5CiKS+4=
X-ClientProxiedBy: SI2PR02CA0036.apcprd02.prod.outlook.com
 (2603:1096:4:195::15) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|AM9PR04MB8131:EE_
X-MS-Office365-Filtering-Correlation-Id: 7dd9fd5b-7f19-4f2c-57d2-08de8340026d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|1800799024|376014|7416014|52116014|38350700014|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	ulQseqNyuC1zSBRzwER5+bKY2+LPDXNzolGYqJXOMhZTqvm76a065eX4YAv0nsq6U4WkXA4Nh8FLCTjCPS0fb66VKtqSJYdI9WTwb6OGebbYJMgKnFnDaJrsraWzGWzrB32GpXKoTyDxAZG5UQXsor9+yUdl8OWDmG31y8rt4KkZ9FESy0Q5SBHPzTpJ8W5e3xAstx4CFe1zz8qV7UFIFCzQ2PR7Xm15JZULZwvzvizylj3TXirgtnujmW5UN44yAPwuLwyGQaq1amcq+OSc0DwiZ/PfFJFuP3sNaR4m5HbfAt2p4OrRbcmjosMFOsnKjMN1mHMmDIXwvwvX2XNJbnORxW0iYt/Cp3Ei4iVpS+cf88orHNtn8Yx7CcdU9ynoh3AH9aO52Hci9BnmXkjO6rN4/DwjcikE/NNSRMyoEL3zJkbhu6HW/PIlcNVIK2qpwN2OpDG9dWzX1oy/axfatiApTBBi4WK24vruspO+bS72Fb+L3v1Gh1E6C1Mt26zFSZncN+EVN4R+F0z2Ipbx/WBxcMrdoF7usv3WDLEC5w5c7P9uBOYwuUimJOdiuxWZE4vgNh0OELVPxNqjdsCoqsADRa00flM6BSDG8zmtsuKQSoGWfQJTJw9FSsIJ77Xb5Mw/4UgLpzkIzqJn8+h1dKfglbcgo/98Tj4wHmlCDOboS+oL4E2wdqhVDnHsQ8ScR/Oh8NYcq6DBuXc/gHDvT7YEv2guwj2wGqLweI+TWfoYBv3vpYccpBkX7Mdx7BfzE2haHAe+1f07hJEvug4tf5chBuvSRIpG4Fe4Ij1+dOQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(1800799024)(376014)(7416014)(52116014)(38350700014)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SVZaU3gxWjVNVHZlSStkYUZ3YUFFalBlYnZxMHZoOTZVVHJ4TWkzU0Z6QnFu?=
 =?utf-8?B?MGRBRTZpRFJwUC9xMzZpREFvYzZpUkRIdzZPczlHVERzc1FWN3NyZ1kwRGw4?=
 =?utf-8?B?ZGJxamJrdjlOMzZPYk9OOVhDMlIyQWQwdXRZdzFxV2NQMUhGZkprcXgrRC9Y?=
 =?utf-8?B?QUxuWDRIUk16VnRGSElnb1p6VzdqRU9Hdk5Gd2wxNHdqZCtCUHlNUzNvR1Ru?=
 =?utf-8?B?ZURBTnkxUXRrdGV1V0hsNmpNc1JyWGNYVlJ5RDJDZ1ZOT2Ixd0swWFkyL2tU?=
 =?utf-8?B?aklNVFg5MGpQWXdmWFZFOHRFZmYvWHNUcjZMc1A0YTBSalpyL2laWFN1aXJ3?=
 =?utf-8?B?TDFmZjF6YWpQb3R3K1UzVzJUY0ltbVhQZkdYVy8vZnhCVWhFSExOWVVVSkNK?=
 =?utf-8?B?OUt6NndBR25sWFNkTjN2eVFLZEtod24wR09aTngzWGgyUnFhNXlZcDlvUGk0?=
 =?utf-8?B?NnVBQmhNTEhxc0VkbUJQV1ZxQlJ3SUgzRzhoWTlVa2ZXaTRvbU9IMjRTd0NF?=
 =?utf-8?B?NFZJaWhMZkxHRFdUeXFZQ2k3MjlBbXRRczdFa3N5dDlKdVVZZmN3S2hQVkZU?=
 =?utf-8?B?THFhTFhkUG8wZnRXanlWYXBINkp3NU1jTytPaGd1RGN6a3U2UHZsMiszQWdM?=
 =?utf-8?B?bFpQRTBrcDl5ZjNaU1NWanpYUFQzSjdOZ0NGbEJScGhLK0Y0V0p2SkJzTGlB?=
 =?utf-8?B?aDc2V0NhTVpWTXNRa1JvcklzaGhvbkpIUWdqcitGQi9zQUEzcEhWVFQwcVNG?=
 =?utf-8?B?bUlONjdUL2EwTUpjTzRVUUljQlVITCt5dWFEajZ2TTlETE5KcWRSeXpBUzVQ?=
 =?utf-8?B?U1ZTQ2VmdHdNRW0wYW1lQzgxVGpNTEh4VitsS1d3dEtJL0xaTVNHU3gyakNU?=
 =?utf-8?B?VnVwc1kyUXZNR25oNWxDTmpKWE9EKzBwVnhWY1JyTzBHSkFjcUoxaS9FOC9v?=
 =?utf-8?B?MUJ0cHRBYWV2bVA4Qnh3KzBLN1lYNE5ZVHRrWEtwTlJpUjJKc05ZdDNKa295?=
 =?utf-8?B?UUVPWXptTUtkRHBsSDA2WVVaVEhmUHJBZmh6RlpqSXpLLzJSMS9RS2xxQk5I?=
 =?utf-8?B?SFdTOXhQRDB4MXA1ZEU2dkpNWGduM3FmOU4vRThZN1RYMlROa0ttMWtSWHdO?=
 =?utf-8?B?ekxsZDlZMzk3V1pOV29rVXF3ZTVMREkzdk8rVFdKRVZCVEs1Q1o4eFJmcXdu?=
 =?utf-8?B?c29GNWNxVG0vZitEcE05ZmNnbHhWR2E2KzJTRmNSMHhFeEZ0dElEdm1pSlpK?=
 =?utf-8?B?UU9ETGp0Ylk4eGlpQWQvOWV6UzdvOG1Dd3ZXczlrZWJMWFp0YlFLbUpEQkhM?=
 =?utf-8?B?TnpFaVEvbnEvRWQ3OFd2NHA0QUEyWWJuWlRGQTVITFhacDhOazF3NGZJVGRH?=
 =?utf-8?B?bUZNWGEyT3dyL2MwMnJBVmlBbXVGekZxUFZiUjRNcjRpUkdFcjRXUjltR0dJ?=
 =?utf-8?B?Q0lXZVByZTVnWUErUWRqMUV5bW1WTU5SK0RvSWlZeUZBcUVJcUt2Q2g3Q012?=
 =?utf-8?B?TUtDNSs4cXNoRjZCSC83MzNsb3JCWjBIRXg4RWZndjFhOHNwNjZvbVowS1VE?=
 =?utf-8?B?WmhXYmJsQkJLdDFNNSsrb2JSaUFsVE52K3lUUnlpcjRKYk1nUW1kaW5mc2J6?=
 =?utf-8?B?eW1iL0tGdkw5cG14VHNsQTV1RDRqdGxqUW93Rzh1cXFUNUtaQ2FNMElod3Ar?=
 =?utf-8?B?R2x0bXBnOG5tS29mejVqdXMyWVU4RU5SemJVZWZqSm1neTBDWU9ndkRyMWwv?=
 =?utf-8?B?RTUvZ2ZWZHpDR3FGTTFjYzBQdGt5d2NtLyt1UXRyajF6cldIT1RvbFZMT1U3?=
 =?utf-8?B?UmlKSGhPSzg5bUZZK0IwZWU4R3M5cG1nTnlTNVQ0Q2NzVVpTQkl2RFBnMmI0?=
 =?utf-8?B?c1NIeDl0N0orZWx1ZjJkL3RwRVRjUzNKTzZtSlU3TEljWmV5Q2YraWZUb0Q2?=
 =?utf-8?B?Q3E1ZkxsQmMrMGJlcFJ0YURjMnVvK3BYV2QvMlJydHFpelNMNVc3T1FLbTly?=
 =?utf-8?B?STN2RHB5NTZnbHRHSisvWlplR25PdWh4MGVFbTBtd20yTFFxbXRDWmJZNUlC?=
 =?utf-8?B?bWg0cmpaMVFUUkxjbTZVMHozbXdKaGxtYVBQaDAreTdmODBEWjZUdyt0UG1k?=
 =?utf-8?B?dnNBZzIvYXNyZ2IvWjVEcHZ5OTRTWnAvQjNVNjlORmxBZlZrell6RlRCMmFE?=
 =?utf-8?B?b1FRODhMZ2g2eno3N2M4SWt1S2dMVHBJR3pZM3YwcVZmNWtTV0VaSUJjOVE4?=
 =?utf-8?B?N3dXK3Fpczh5RVVlZjZYK24zSGRNQTY4TlhzMDZQTm8wbFdPclJiQUk3Q0tX?=
 =?utf-8?B?R0t0TVJVd2gxUXpWaC9CSEdVWFozN0VjMm80dW90ZllXckJKK2pFUT09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7dd9fd5b-7f19-4f2c-57d2-08de8340026d
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2026 09:40:07.5951
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tHmhTxaGj3gZOZY+Umvz8Kk/iTAS67G8HrJQEra64neZVe4/1zUoKZoMghx4hw2i1v9VOxdtTXMDBiG1FPRZcQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8131
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-34852-lists,linux-usb=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,nxp.com:dkim,nxp.com:email,nxp.com:mid]
X-Rspamd-Queue-Id: 5DE90297328
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
Changes in v3:
 - use "err = !!orient_gpio"
Changes in v2:
 - return early in tcpci_set_orientation() if using gpio method
---
 drivers/usb/typec/tcpm/tcpci.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/usb/typec/tcpm/tcpci.c b/drivers/usb/typec/tcpm/tcpci.c
index 8b7e6eb92ca2..c3f478202fbf 100644
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
+						orientation == TYPEC_ORIENTATION_NORMAL ? 0 : 1);
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


