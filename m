Return-Path: <linux-usb+bounces-36096-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CNyZNh1+12m7OwgAu9opvQ
	(envelope-from <linux-usb+bounces-36096-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 09 Apr 2026 12:23:25 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7788F3C921F
	for <lists+linux-usb@lfdr.de>; Thu, 09 Apr 2026 12:23:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 78CE230A85E0
	for <lists+linux-usb@lfdr.de>; Thu,  9 Apr 2026 10:12:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BBEE3BED1A;
	Thu,  9 Apr 2026 10:12:53 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2105.outbound.protection.partner.outlook.cn [139.219.17.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 522E63BB9E6;
	Thu,  9 Apr 2026 10:12:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.105
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775729573; cv=fail; b=sD4dkwkuAgArj9FWXVDMLRCc83KdxqYbKUSL0AY1K6BVVizZeUZIr/i5cfJPljdQbpef1i9BbbDomYgcE3TYjR/9aYCzdGwY4LHLmPxc2aH0os1LFV/I3rHqCYCUE9ekiph4wAJXgugx2WYo9k6ZechOCPpuCLachXKSEcH2l6s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775729573; c=relaxed/simple;
	bh=OOv9Wz1SH7+sjrlsgN26n5gd1w08v7xpgRACCw2kDuU=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=lYnhFt8eYuxr6QQ8hNzqgjcQoISXfNWJ0gKaPzd9LcFxLwqosu5MVZ1biqQR1axJCsPUP0arJF5/5zwkt5jcLZcbEqLlDRAHL4GdR086JZpEsW5K2sK0J6RrjAzSQfBQ+XA5ZmlPew+uDl+RJcMza8khaXs88BVf+Nbaj4PlV88=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LpFac9uEMQrsqVBccyu+phN+pxStruvZIYNN6MmpKxsaPMKtqE3uAMmSeEcE/4TsrlcASCFafd1qqItR+kGqYh0YtYfD4Xhere/miCCGnpED4ULzn5b8xsc4Hos66z60BI+t9FBm9tKo8gMv2ONJxwkLxPd7/up+PrfnODk7qeVOD81YE8KzO56M7M5fVRN7lESSaNbrnMSrILMOyW4VKB0SCX4o0ozo5AAfrXqVqDGWJI+uF88MnNSHnp4B0ZrPzaWaz4/S4rUMTAOuSiDy96/gXpnSmXqQbUAOZhUwbQIHRjh+xQCOUhEWQlvUuTPAsGG5/NhfPxrvAl3p8266RA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oRO8Eq616sUXFIo99uR3UhrCfRas+t0xumBagJd+PfI=;
 b=lh+u1FO/NtmsOUxRzfrY8gFJornJbIM6hGTr8cKAiAkkwcpSuS2cO7V6ZeipUK4cvu7vsEszrWdaZT071BsRCHkV63dHIUlA0RalQqey6PDXNGo164gBYGVFaObV/cKegrhJdvGYCGsIFrsynS0SEvesqSHEfR9dK1ns7dAmxTUVmkbhGLIMmTOUvtFHkTzBrRu2Y+LFeDUajj4MZSm627DvFFq64heXIgsEmsOZl99sT8MrvbM2BAaTWmrtAR6Yokg6HhvIqU8h4Z71a74eVBnzSjbN3xd7gkI4r7WW1tdKdZnhpqf6tbDSEfolaTm+s0H9D6fQJyirNs0Fdv9z3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:25::15) by SHXPR01MB0752.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:26::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.24; Thu, 9 Apr
 2026 10:12:35 +0000
Received: from SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn
 ([fe80::9b99:12dc:a115:b90f]) by
 SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn ([fe80::9b99:12dc:a115:b90f%6])
 with mapi id 15.20.9723.018; Thu, 9 Apr 2026 10:12:35 +0000
From: Minda Chen <minda.chen@starfivetech.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor@kernel.org>,
	linux-usb@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Minda Chen <minda.chen@starfivetech.com>
Subject: [PATCH v1 0/2] Add StarFive JHB100 soc BMC DRD USB support
Date: Thu,  9 Apr 2026 18:12:25 +0800
Message-Id: <20260409101227.39417-1-minda.chen@starfivetech.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: SH0PR01CA0014.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:5::26) To SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:25::15)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SHXPR01MB0863:EE_|SHXPR01MB0752:EE_
X-MS-Office365-Filtering-Correlation-Id: 929b8133-59ac-41cb-b77a-08de96208535
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	0I7CKemWpPpR/hEV15j8q2GZKqDUmKyezkPsUWxFKnjtO2jo8WqrYy3tvuzaf8e4jsL3EjioIfjRqy0aM7OKi7tOZyu5Ijb59/IBexSWfrQ3d1uFFMuvWKMicV0AGKCBJIRjhtHEOiv4r6UxN6giAI49YreIgKpu9txB++qZMP0dvSNnTijxIsq54VyYLHqgPJAwC3WXEZQqBn9vvcULY6nZSFBIiFJ9JcThENtM4KBu/RQ4UVHLm+hf0mXdv98aL18eALtUyfb2WHahFPI6DDevEk4QvnVgtVoRuD9nvM+FqvodgnTq6zPFwyxiBbrt2R+xU83/68kj8VOdNd/yiq0JEVybxguCF0DXyk+HO85ZMyjRdaVF1ZVnSBZIRn2tJWIbsAb65e4ei8GLbE6rgj3Kg6uamUb2Z16wMHNJC+DK2F5d5U90va4L8Gyya4qSEsL2MaeCFnY0sQXVEbg7Bj/LoIw3Wks2Qk2UhzwZDHXJORPtcNNYTAgPVsAeRd8WmFe1sM9qbih6ucKtpqXIarK6lSQDJ6UNRbbTs2UurLfS38yQ6QdaSEF0d1Yo3XgT0tWMn+VBAwWbUwUV/qiF0w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014)(56012099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?pwwYmg5NYBA2nZLCCLgs2/h6AU4GsIu0uts7bqCoK7XjWw7s0hsuwQ3yRFmp?=
 =?us-ascii?Q?gthqNG5BuVsspW2x4gtPaDAgOwc5hsCr5lZRxU8otMkdSoLEx8OCtos+S/XZ?=
 =?us-ascii?Q?d67B+vepx2zV8fvcqOevoj/bhdv8wHxRe6BxUdvuFrH78jWasiG7X3fHQ8wn?=
 =?us-ascii?Q?d278Bx3B54z9kVF3XNwepAQVBskF17T9EtH+CJUsGo0S24B3G2XP2iYbGeSd?=
 =?us-ascii?Q?mt1cfPBydi3yAQZN6pMenlv6cgIXbRO+M+vEnv88BvaD1wuinPKowNBlYPoz?=
 =?us-ascii?Q?JechHgTAyPp2fkqUj/2NZH9xLMi82wRf6RSsWTs3GrhU9jj06YihND7B/VYS?=
 =?us-ascii?Q?HI3tNQfm9SAClmiAfKthhI7dA6zzoyu3PuCjLOf5QfYI54yDO7mm+nzbG+5J?=
 =?us-ascii?Q?wMFo/hSuMreQmWAEam6Zw9kk5WYCUJKORXuaN3zz73ONG/rZjci2VguztrgQ?=
 =?us-ascii?Q?o8vnsnDfhkpZV2eRwwtBuiXpspUBYd2vAt+e4H+nn7EAV7LcT/t5aKi+s5eV?=
 =?us-ascii?Q?oFRNftGLTrcXBJfNeUu5BhU871Wgl9B3JVdAhZlPlRBhQpiluOC5O4QrYQyZ?=
 =?us-ascii?Q?1WNdBpfTZQWhy02TbWwuj7RmT0u3NhWFHDNrzW6OqFrywzlR7qoyqiWDo9Of?=
 =?us-ascii?Q?C+souOopVBxW5E4P1oiEqigvxffilv0AkJLCBL5CSQRneZk410lCYLVYvYxH?=
 =?us-ascii?Q?QETgzccd37ieJNMjXKydgT6/tESmOwgz+egHneYKYN8S+a9QbMyqFHO23qPy?=
 =?us-ascii?Q?gRDDbn8yqTVqCGQQACospDOb2PjnERUeNJwfRF8Th5O0hB91ttS6/QQ7Q9hX?=
 =?us-ascii?Q?MMuJLpDmtu9MjpNT7KkgmsxfOYfh4ts5b11aOJ2tFcS+umDhRvyqXXLuK9yL?=
 =?us-ascii?Q?kU9l+ARo8dFqzvmuqQGTdQg/LDDubEzwkotuGfMwmuF9HJEOoBeDsoDSNV5u?=
 =?us-ascii?Q?hw22OWwdmhSLeGLTaKNMtROtstd4Dk7eJIM+w0bPhKvpiE2Rmb/9FQnAAnQO?=
 =?us-ascii?Q?1yxwxHIfX6y1syv/pe9DsaMOkjfCRIBpBm9mmo3hGXom8oyDK2rFb7spNsoE?=
 =?us-ascii?Q?rLaeCMCHGZIfDKH271JWvdVJfLpuP6fje4imkdYyxFPw+MFUosPATHf9w05b?=
 =?us-ascii?Q?ojwpscyvwDpgWzTXmfTVB8mWabY4ElJaKc2u7T5HoRqED3npm8vE0VyB0VeH?=
 =?us-ascii?Q?4xJmLjxVQkOdL4tCoArHHYgAjmQOb4GztcKiZoeWXq4G0ZGYuLi7ck5qRMGA?=
 =?us-ascii?Q?b0I6lVtBT3vROqakhGg6axEyrcDX7snNZOjs7dUKhuxlJbcypOvKLWRfneN7?=
 =?us-ascii?Q?u/fOqggBtDi+dtDiwWuI2GQgJdQ4tEq8hgw5P6LBw/384YSrriTboNR4e07C?=
 =?us-ascii?Q?rp4ZtKY0PDWTY2PXWz2+PzGVyAPXFbZbfGWh88Mltf8c75nOSe2jZztiM/9m?=
 =?us-ascii?Q?PvTl1y3SwLlk4tmUv7CH481GmS+AwWhW5g4+YIN41CJ6VrVy3OlNTDY1RT/T?=
 =?us-ascii?Q?OaV3x9X73SWAa+aLhbTQ0fgFnXHL+0Sd6pEv/hTYhIAejqsYyiT8c+UnzWks?=
 =?us-ascii?Q?bVQPk03hAJWliWy8TYdZhJExbbyD7nk41+nemRohdLdQzTohkL/jpm+rAeF9?=
 =?us-ascii?Q?Xab+6y+WzVqYUWstPVDvc0quq99d3q8WMAmAJ8mECkdCd9o7tDFAk1Huy4lL?=
 =?us-ascii?Q?3On7LAGbX4P3+42yR0tAS/yufMSuhrkqXqWSLoIQMOcPeGjMrNq2aXabzlUl?=
 =?us-ascii?Q?t00yTiB+At8eN+vIh5qIeehtg7Tr2bU=3D?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 929b8133-59ac-41cb-b77a-08de96208535
X-MS-Exchange-CrossTenant-AuthSource: SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2026 10:12:35.2714
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PNV/gyJoMbbnJSFvaEpspMvF3vsRJ/JomOyD8zbZjS0/Mq6PY6RHyOZJsu42cg8Ki6QPVTZGDNInJ7yFKaiMdsiiQGThZuCuSUa5He+7MSk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SHXPR01MB0752
X-Spamd-Result: default: False [5.04 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[starfivetech.com : SPF not aligned (relaxed), No valid DKIM,quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-36096-lists,linux-usb=lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[minda.chen@starfivetech.com,linux-usb@vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	GREYLIST(0.00)[pass,body];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.339];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[9];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[starfivetech.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 7788F3C921F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

JHB100 is a Starfive new RISC-V SoC for datacenter BMC (Baseboard
Managent Controller). Similar with Aspeed 27x0.

The JHB100 minimal system upstream is in progress:
https://patchwork.kernel.org/project/linux-riscv/cover/20260403054945.467700-1-changhuang.liang@starfivetech.com/

JHB100 contain 2 USB 2.0 dwc3 USB port, and intergrated with USB
2.0 PHY. These 2 ports just for BMC soc use. Actually JHB100 contain
other dwc3 usb controllers, which is using as xhci over PCIe and locate
in PCIe EP. It is working for host server. But now PCIe EP driver is not
in upstream progress. So just commit BMC USB 2.0 port driver patches to
upstream first.

The patch base in V7.0-rc5

Minda Chen (2):
  dt-bindings: usb: dwc3: add support for StarFive JHB100
  usb: dwc3: starfive: Add JHB100 USB 2.0 DRD controller

 .../bindings/usb/starfive,jhb100-dwc3.yaml    | 64 +++++++++++++++++++
 MAINTAINERS                                   |  3 +-
 drivers/usb/dwc3/dwc3-generic-plat.c          |  2 +-
 3 files changed, 67 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/usb/starfive,jhb100-dwc3.yaml


base-commit: c369299895a591d96745d6492d4888259b004a9e
-- 
2.17.1


