Return-Path: <linux-usb+bounces-36134-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ICUmIdPj2GnHjAgAu9opvQ
	(envelope-from <linux-usb+bounces-36134-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 10 Apr 2026 13:49:39 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E08AA3D65B6
	for <lists+linux-usb@lfdr.de>; Fri, 10 Apr 2026 13:49:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 95244302E874
	for <lists+linux-usb@lfdr.de>; Fri, 10 Apr 2026 11:40:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F3DA3B9DB3;
	Fri, 10 Apr 2026 11:40:27 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2103.outbound.protection.partner.outlook.cn [139.219.146.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3FBB37AA8C;
	Fri, 10 Apr 2026 11:40:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.146.103
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775821227; cv=fail; b=opsvFOYmJ+gGxeLjeEWRFqPIAWhxxJHoXvMLN11Hb3UwOeTUKpjPjiWvYw/iF6L31GfXvkbKhvoFboIs3SZAvO1O6RPFXdpzI7WS6mgocRmz54oeJF8y7YHihDYcmZ6ib+biKpGiRjGQt9wJ2sLkrw2LJ8L6rz1AOwQzVcyvx/A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775821227; c=relaxed/simple;
	bh=IcV+mYQ4Nshhlv9ayXM/V8nyFruLK2jgc2YFzP0bqC4=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=lhblNVSUxv8mMIW4M/ZlMVfBp09uPPYIBBKrC3YOfQYSm+N9t4hLDqiZN0/xc6YZU+2PGKjAWDeKcuf+XKv3X94CmySr4zddgznBmAWwcBKJW8BvSaCX+4chxl5GUAc4Wskw2e0pmMWurCuZBfuV5va7KCfwhKu5ZECYzxTlFaI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.146.103
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Az208zYmgzhtQidxE2lpaBueBC5KBEKlE3LhrralF01p6GySluxF4X//yfkDlpNpLyBcN9y2JAUMURmpAhTJwCft61vNo1x67LNUILu7/tKlFn15dhHgXMNNae3sPMPKBWgsQXJVjSeNxnBNRHVECxznx5SH6AyazueAo7CdH8Bg+cR5SVkEO8fXVRHy9CBCbS0s/oSZV5Ar4iPpsggddGbRbCHRdjXCgK+lQMd9g4aSp+RDDtKe4Xi6xEnKAhGMmEc5tUSoVsl30uHvdS306fIxFM0ssplT/6tUSdcvnbNKo4W5yUI0HYNmsjOfPHL32qaX+uHw1gW6w9moTbOSRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SwXrf7MEaMa9pe7q1D/Z7mLpWKFDBHOyw2tTf8NEkeo=;
 b=kbCSegA5ZgkjG+Kb2N/asm7uVeGC2galEB2PMEd0eabGrpkoOBNOcu4Q5xXzr0mcQuFRmgwmetcWJ77DKwzpqoM5GtnojoJtXSIVqygowgjywFGyLpMlO3ORf5786Zr5yssHq7F8HZgBLtIPUQi1gCLIdDLBDlu/WDJOki022QrbbwxvR2cf9klDEDHs8qaMOwL/vTpjJsYD+RD2U4ZfTiWJ0j9HUTpTPyr0LPoE224L9kKo1mv5QzvU1DBaimakZ7REiar+BBkodFdEBGiAUhuCwWrr/hnXl+okLbzs8L8EWVKSxWBBK7NyqKUJniKW6zGAhIEwKczi6PlQ08h2HA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:25::15) by SHXPR01MB0749.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:27::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Fri, 10 Apr
 2026 11:25:08 +0000
Received: from SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn
 ([fe80::9b99:12dc:a115:b90f]) by
 SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn ([fe80::9b99:12dc:a115:b90f%6])
 with mapi id 15.20.9723.018; Fri, 10 Apr 2026 11:25:08 +0000
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
Subject: [PATCH v2 0/2] Add StarFive JHB100 soc BMC DRD USB support
Date: Fri, 10 Apr 2026 19:24:58 +0800
Message-Id: <20260410112500.90432-1-minda.chen@starfivetech.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: NT0PR01CA0006.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510::8) To SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:25::15)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SHXPR01MB0863:EE_|SHXPR01MB0749:EE_
X-MS-Office365-Filtering-Correlation-Id: a1215f1d-f53f-46eb-b80a-08de96f3d255
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
 VIyd7AyJQDYjqPC1hsNWG6exHNs+ZCpP9O82Gd48Kjnbs3lyIoHhQeekryfwlno/oDHwHk7tqNl21vhCjuWcAty52cgQZ4EjQ5ArgUYcnPoNYIKqq1xsuk3qhb+FgSXFwYr3J2teiyXpTxcB1irCO/+a9/vgjmkrTkKQp5y6cAHh1ljxttvQgq9jkaOxVFZA/80x9jPkOjpYnQ2n8bLjvsOyCfWca1nDGgoOYR0HY3PY2+KWxyyJgi2Ozq4MzfRKMeaiJEkJi9Z9BltNs7Qjtdv3hDD/xVGIHGDVHSXZBvuSiisHm+oJTwLq6nYxuIG71NCKNcnREJ+mKWnxlCm74VTjvi2Jdpl7bh3LdNMlhjGm3J3Z7h4cgnMieuI+Yir8j3woibQ9IVDefy9J5qLFJPo1A1MusR5rftczS+26G+NE+W7O56zN4+Za8KBYQKjag8nKl0d1TAltHBW9QxvRy2MSEfAtTCol4Y6YyG7za2Cm/c+qEVhu532dD/jChlAJkO30mVdm1FP/ojTCCcrJHGThCqyEv5XSQoBhFT+oDmoSZIIXuT+SkkZIq4yjyFhEkH5Idcxz0xJADfFyD25SmQ==
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014)(56012099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?xdUfJBeDbq66YX3WzPvhc2ykZeJZqyaS+S8D2lgwTUxWDNtmnR0hNunXG/lf?=
 =?us-ascii?Q?3hSIvVoNXCtswTYe8pps/ZQAENlRK9C8qPQ/nYdTc6lybJXR25fyTY3KqF5X?=
 =?us-ascii?Q?wH3+Gr/HJErlTrutzCIXll4bD6jUn5/9agajiT1KcEdcjualmRJNFeN+OQWk?=
 =?us-ascii?Q?6CPiJIrxksuvsgrzK6IVC02NMP0P81PBZ3ZFwdqmj4J0Lu1wWqCY7hObkb8w?=
 =?us-ascii?Q?RUwVfHd6ysDBE8WtMaeipXafPV4M0kBcKUZpXKxCg2lI9XZQhG1kTS0YYKgA?=
 =?us-ascii?Q?2r7sFHY+cfC6pCFuxPpF1LTMI+yGdK3+NCXvxNW8AlpPrJSN1BiuoGXEYvAl?=
 =?us-ascii?Q?UivT+cAos2XThsn9iivz70Hhd9OefNTN3pe656+wChSyK/FdgfcmqNFg7sKA?=
 =?us-ascii?Q?HdseA9YV8jor0ESAaixDbhP7kB+MwUvq1M4BElx+1fXi4lbg8RSDNOEmGowp?=
 =?us-ascii?Q?CKDYOoRrXAszCi5+JclKxS0RY1zTkx9F96IdSUS860bS2VOTQzbWlNihrk39?=
 =?us-ascii?Q?qX+HpNbneLQQ1n11wZDAk63r0WA1fE/fToyVm+UomYWxe0xA8LKVFmR09J8T?=
 =?us-ascii?Q?BkSS/bBgcQJsDaL54VQeCnWofALX3oXU2InDIWwzAuv9TYRMO5s+4Ss3NMRH?=
 =?us-ascii?Q?GEcEoT5eJQRjRPZOR/nYxPa5D7YgiTUJ87sIRook7RINHZK/Tlfh576qd/ui?=
 =?us-ascii?Q?iMWVmUrn7jAln0Wzxs2XCthRmfAOZJP8VcjCLsGtVZadOCS5dtt3ATAcuVjz?=
 =?us-ascii?Q?Aw4LgJpOI7NQUNGeQajRVK/dLa4l6YYDeuqovLgTrixfxs7Vwv3V15WoaXLG?=
 =?us-ascii?Q?vH1xKcCux93yqwrEPA6CLTupEIS0IVRwqeGf0oAn5otaSGnN4XsAKSOEXN3k?=
 =?us-ascii?Q?ezpQBvPMvWhuQ4UhOg34Qxi5K+xGpiv8tgK0iQNTII+VOUDlLObVn2eK27R0?=
 =?us-ascii?Q?KnjIvtmXPQ67Gejqc7QtJRcs2HcKEUPh9txJfuBzgMfTdtedt937zl1vV2AP?=
 =?us-ascii?Q?GZo+lnWhjAEdLJrHeBMXIDVRYK2thqIR1YUwBH266flL18PkQ5BukOezU9SC?=
 =?us-ascii?Q?wqDqxzc3e7N2QcRggGwt2X2BtMSArcwlVOoWd3RydOxb8oB3UZ4PvG0lzbfz?=
 =?us-ascii?Q?sZVzqgxccMMi6YrHJ4NfChmWNIQtLa7tlwMuVAgjWQqQLsV7q8Y5Y7DjNqAY?=
 =?us-ascii?Q?vvezGH/lpX7AMjPs4hHjA7P5CBREV31U+sWEioKJ2F72a5tTypAnB+kDc16t?=
 =?us-ascii?Q?oOqh0HaMzhQcTILct8CMMerS2AUl8sSPwlF3vJ/9oqgbWUXHAmI4+7Igc9MK?=
 =?us-ascii?Q?9Hn73ilaurGcCGJdtlqjmEITpivzQfn5a2sr87DQeLWYkQZwYTJyyRh8XQKX?=
 =?us-ascii?Q?KLNic5EFG+tODqt+4V9bD/yH91dShkT2nXuY3/xdH6tmjWWlbQteSMsmDWMI?=
 =?us-ascii?Q?qCKZ5oDBKOUBxiC32inI00vXo7Rfir6GelVNIF34BvuKNT37v+Gu7Ad9sndJ?=
 =?us-ascii?Q?GzOiByIpOQSsGjdsWNAPk7GkG5HZkVAxy1mzx0ZGrTOgWsuB2MHm5q0/MZr8?=
 =?us-ascii?Q?rTUUNHqkByVzlYjbRD83R83x+U6wknhVIyIhCVZ3n4GdmJCQYRnvaPX0MOoa?=
 =?us-ascii?Q?NuEvtJfmDLgBJ9DgVXyxYZ/xntOcjaEQcgPIsjDVmIKTdMgEwoo+xZF7JRKc?=
 =?us-ascii?Q?0vWOtiW8BtZREpoETX3UMpCBCEFg8sd3OSXPMFsBXnaHfyoYj+x6N9wa75O+?=
 =?us-ascii?Q?pDCQiovznDi8CNtx2uOKBAS05ShzDL0=3D?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a1215f1d-f53f-46eb-b80a-08de96f3d255
X-MS-Exchange-CrossTenant-AuthSource: SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2026 11:25:08.5433
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t16uJaDZtv0/ftA7XjjD7e3vI3yXLSXxPZgTjZOhQdE1FG3ZRErFUFeKzpu9UvZp+C8ZnbD+ZamvwKXJhZhkbdWCcEyWXK3u6hO6zyYWB0I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SHXPR01MB0749
X-Spamd-Result: default: False [5.04 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[starfivetech.com : SPF not aligned (relaxed), No valid DKIM,quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-36134-lists,linux-usb=lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[minda.chen@starfivetech.com,linux-usb@vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	GREYLIST(0.00)[pass,body];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[9];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,starfivetech.com:mid]
X-Rspamd-Queue-Id: E08AA3D65B6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

JHB100 is a Starfive new RISC-V SoC for datacenter BMC (Baseboard
Managent Controller). Similar with Aspeed 27x0.

The JHB100 minimal system upstream is in progress:
https://patchwork.kernel.org/project/linux-riscv/cover/20260403054945.467700-1-changhuang.liang@starfivetech.com/

JHB100 contain 2 USB 2.0 dwc3 USB port, and integrated with USB
2.0 PHY. These 2 ports just for BMC soc use. Actually JHB100 contain
other dwc3 usb controllers, which is using as xhci over PCIe and locate
in PCIe EP. It is working for host server. But now PCIe EP driver is not
in upstream progress. So just commit BMC USB 2.0 port driver patches to
upstream first.

The patch base in V7.0-rc5

changes form v1:
1. Add review tag to patch1
2.v1 patch 2 delte one more line, v2 just add device compatible.

Minda Chen (2):
  dt-bindings: usb: dwc3: add support for StarFive JHB100
  usb: dwc3: starfive: Add JHB100 USB 2.0 DRD controller

 .../bindings/usb/starfive,jhb100-dwc3.yaml    | 64 +++++++++++++++++++
 MAINTAINERS                                   |  3 +-
 drivers/usb/dwc3/dwc3-generic-plat.c          |  1 +
 3 files changed, 67 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/usb/starfive,jhb100-dwc3.yaml


base-commit: c369299895a591d96745d6492d4888259b004a9e
-- 
2.17.1


