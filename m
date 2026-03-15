Return-Path: <linux-usb+bounces-34814-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cF2JA+V1tmkYCAEAu9opvQ
	(envelope-from <linux-usb+bounces-34814-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sun, 15 Mar 2026 10:03:33 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A14AB2904E8
	for <lists+linux-usb@lfdr.de>; Sun, 15 Mar 2026 10:03:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 665943032CEF
	for <lists+linux-usb@lfdr.de>; Sun, 15 Mar 2026 09:03:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BACD02641E3;
	Sun, 15 Mar 2026 09:03:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=surban.net header.i=@surban.net header.b="fP3ufQvN"
X-Original-To: linux-usb@vger.kernel.org
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11021109.outbound.protection.outlook.com [40.107.130.109])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06C57EADC;
	Sun, 15 Mar 2026 09:03:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.109
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773565403; cv=fail; b=W3aCEsuppAs+3YPluXirBObMCoN0DT+9mjV59ezlYIaNuNBHyoon6gi9ly4HPF7NMjt7UC0JDlnqTMfqarWrcyivXY0RyIu0jbFP7B5oC3yVjpwP6TepGWpL0Kfw88JNi+GOjWHZpD1KV4qRp+nvPPT10/BOmlcKxggVFuIZ210=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773565403; c=relaxed/simple;
	bh=HphQTg0tXmFzX+qu5hoM9Njy1bzw/js5Jf5d78FuNNo=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=EoycOZyOxg0H1yz25LQRFx+6jz3sTExJyxURAMU+4/+cCp0k6YX6YwABfBCN1HSTylhlESUGE/GyN02UkpSKESEBtk3P3G9vfBAf0QIZr+eyUSlKr5YRjLeLPc7qHBzsPIwwKBHUVs1Dt3BU+W+FH15kNDxsWtANwhxYvNtl+WI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=surban.net; spf=pass smtp.mailfrom=surban.net; dkim=pass (1024-bit key) header.d=surban.net header.i=@surban.net header.b=fP3ufQvN; arc=fail smtp.client-ip=40.107.130.109
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=surban.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=surban.net
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SDrN+QXEcQtRix4Nnvm6ffK4xzIAu/Dcg9Jr3Hwpm9EE576iK7uewR8jFSO2O6/BsZpTpFVhiH3x3PaDIXbLSjZjvY1Filz3frdoBaVuYzxB1scXdrSq4fgFQpACdrU4YXxWrFqoPaAZlzdjVli5+nAAePeZNswBaQMb4E6/FchosaYgZJxBVnGxKhYTC0H7T9XY/xmprKU5JuO4hY4osES5T4H1l4NuQjRlkkk2njkFDsTptk+vMj/OfARuJ01DIU3ck4PKdlrHwPznbBJzOWdmkmrqCTvZhh+5EOliUIHpQlycczJeLnG55X0Y5+nThVGFIyB5qxj7DAIZx+CIdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SVSvqJXhPEl65418e6ZVHIzyvO4yBIwp93ntZuV3Wjk=;
 b=eWv5Rf+4U2ROCLesIyKOb3ZowIUtWp6Tlsd4fP6lRy6x43iYwZTM2zMOu+2w70TYR7fihsIIenjZt1onJmPWvusPAmGceLIApFFQu15bjY1WhL/ARMoO3WaI3zNTLyAeRiNM/DfzriMRwvi2nfJ/i3kHNN2ZmC962zGplzUO7guAbZrhzMhdgMUccIboFH8UQqsl7Fm8hhvox8sPGch9gzkcr193TTGRtyY6w3sfZ03T5+ZgFJdeSs2P/242i8aWPnSpSKNkwNsmqlvGvTPolqqUTaxpOHhUMdFVfsy9Tp66afyAeMX1aAZiVjKWnXDz2RwWd71ZVcD77gonuDt8Ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=surban.net; dmarc=pass action=none header.from=surban.net;
 dkim=pass header.d=surban.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=surban.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SVSvqJXhPEl65418e6ZVHIzyvO4yBIwp93ntZuV3Wjk=;
 b=fP3ufQvNDvj73lDaTtuC0J8C0U3FHR1fYFT+9JDp8XCbZbSDcU6EnUmFlmFMhDrWTDBI9FiHVEKRGsTkxZGBqH/iKKXx6IcI4qZRUBp1c5f6QJsjLLqKC8lTa3sEWcAgasLVHSYXCeTy6WcQYRnqhdtqFN/rf6vrVRmyfI2/q7Q=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=surban.net;
Received: from VI2P189MB2656.EURP189.PROD.OUTLOOK.COM (2603:10a6:800:230::12)
 by AM7PPF351D2A478.EURP189.PROD.OUTLOOK.COM (2603:10a6:20f:fff1::68f) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.22; Sun, 15 Mar
 2026 09:03:19 +0000
Received: from VI2P189MB2656.EURP189.PROD.OUTLOOK.COM
 ([fe80::4f27:10a8:fdea:41e8]) by VI2P189MB2656.EURP189.PROD.OUTLOOK.COM
 ([fe80::4f27:10a8:fdea:41e8%4]) with mapi id 15.20.9700.018; Sun, 15 Mar 2026
 09:03:19 +0000
From: Sebastian Urban <surban@surban.net>
To: gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	surban@surban.net
Subject: [PATCH] usb: gadget: dummy_hcd: fix data corruption with queued requests
Date: Sun, 15 Mar 2026 10:03:07 +0100
Message-ID: <20260315090307.304644-1-surban@surban.net>
X-Mailer: git-send-email 2.53.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZR0P278CA0159.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:41::8) To VI2P189MB2656.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:800:230::12)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI2P189MB2656:EE_|AM7PPF351D2A478:EE_
X-MS-Office365-Filtering-Correlation-Id: 123fd607-b5b2-4856-7c9e-08de8271b3b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|10070799003|376014|52116014|366016|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	9ueAq+jrZl86LdgMeHSUmDSOSpW/GmZtdHFTi5+OhzKj4bZK3Zu9P9bbEtxqT+oby8hHUfQUsgpPfbw5zSqD7XCWuKxFnXYNMoOhsyUB1glQtUsaYIA0AI3cKd6qKbttQ/tSZzFRSK5pkB7TkGV2i8Jck9wOisi3e+IruIu90brsjwlfPmGppOKJuEFxHTD/Ozw+qWuVG5Gna2iK3qaLODqFvaYPqBKJO2Xv3schfxZ0R5JWbXSdec4detALm1NeMTnjAXUCCdap2YwRwrsSdityYkGj+WykyOi9IapKXMQmBIVhFVTNRiZTV3b6HH/jjEISS7SHkOfMiEakqdk/NJ4gNpco/vOjvC6VN06cZyrxxO0al1at9sHJMQgG4KKVa6S2b3bEJlRi6YnW4OqdL7It0EwXTVpm0o6xsVDJbAX+kECmFlj9KbqrLi+j2VmwKsXiGmln+roMDBSkwA6DopBNSvzF2EFNgjpAJ5cmNdErDDQT5ZXcHYx86YWCpoefkjAI4AqKJgkt/UCH5Fn3LX0jGaWp5CZZpaFVHnuKLGEcS+s8NGTf1h28k00Q/GnRolOs83ZjiXlPwaZZZl2PMoKsyohLOuZsik0dFLwwAYcYo1oiC6w1tDJD9/kUS7O4AossTEF+SOxfc6YtdVz4u+WVPCzbaFvg6gudb30vK/k9lkuoF535rvvvQeTQWJ1Ur8+yZFv9/Pvf3e41UwFmBt9/mvRBGv2iePg3qL8jI7M=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI2P189MB2656.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(376014)(52116014)(366016)(56012099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?MkmLJZVSz+sZMb4eRMZDOzw8E1VAHQMCR7imbPrB4QiI2cHrHX3WZZYoVZ1c?=
 =?us-ascii?Q?WTMMgAw+aAWFDgGHjK1R87OPajUJsa4l8FpmDI3wk7t6pSRMTJXln9lmrbey?=
 =?us-ascii?Q?aufKVhX5tX7aL8HAThlaZBz5LSRy2KJz03Sx6b+Tw9Se58VWhXpGxw4aHv6a?=
 =?us-ascii?Q?1IBzj5TvWJeuNBsdNNoIn8w6e2MiYXi+rWb0F0cB0g15/MWkj162VUCRYVJN?=
 =?us-ascii?Q?YbX1BBLtcN1JzMzINFLfOtb6KwHEwHl3VZntGsKYwXKiWhhJpHy848nr/16q?=
 =?us-ascii?Q?yIXh7AyXQEqTV6FHjl3jIQOvOhmt4Z9omFakfo/z1AJFcvOB2aXUWurpyp4I?=
 =?us-ascii?Q?51yu2fXgvOEyrtsVfalkC85FPDfIT2P7gisLdMJcka47Kn3xFaOILrC6kAZU?=
 =?us-ascii?Q?FF4zWmUdVSeLbcuuGhZoFVRJu0GG9SN+dLh3oqO8EzyBuNrONYcxAOofeyeC?=
 =?us-ascii?Q?DhUXmFruW3AyaGBOkl38+JQqqhBW7h+OzEYbk7vsN9af3Bk3r6QoDVWBKYYP?=
 =?us-ascii?Q?w66G9qjR+3Y3Eq66MyYgmj65LtJUonyPudUzFzfa4cpedv1VeGdyxVAu83dt?=
 =?us-ascii?Q?qrxNJ5YGw6ORaUMIfhtRgpCzTyxbj3BWelLBqTHHGJ4VIVXHSVkWIejXuPXS?=
 =?us-ascii?Q?jxrJvRFsaDtYzRI4STxKsxi6Zr960fE3KtFdAaWlNbkzBXhqK8rd4pLUL75M?=
 =?us-ascii?Q?ksNksyed3Kts5tFWxDDdQgjrruIBFE9W5sbiNZjoequfcR8lM92b82eFmKQt?=
 =?us-ascii?Q?z2xDg+VD7GVuwELCkAuL3yI8oLJ6LWWWWE93RRr9vTOWUPP6RM3CnQxqkS5X?=
 =?us-ascii?Q?RMuNeWjA2GhpfMqqGh+X/Ox1S7P1jnZFYv4+k6lx/J3WEbGPgQs4urE7nDCA?=
 =?us-ascii?Q?7HtlJHlxGKfNEusLOc9T5yPtLW9IiaD0Lurk0eRqZ7i++HUb5Ls6iXmglby2?=
 =?us-ascii?Q?qHBqhHur69kCLZmkSZ+m+jxBr4ObVhod4eCpPcAhoo5fbqjbsqy/XRE02eTr?=
 =?us-ascii?Q?GR4TW01o115bG4o1eFx58j79D9LXaxcUGnJ+deEe2F6VzkjSDgrmez9O455W?=
 =?us-ascii?Q?nNKsCPkIcPTrnB/L1PgAeMBm3ErzmMeN0VWj+qvUobFI5jWd35DpSYu5g5TN?=
 =?us-ascii?Q?CnfwtNGCiTKHmXKCPlndqXs+DttZ9X8pQR5NW7wOfsUV39kfLDtbJsgEpTby?=
 =?us-ascii?Q?geci9hucD58WaF0HG4ctRy42cO9y6MA4R2NpGQKs0wJZ4RG3s3zZdTa3/Uxz?=
 =?us-ascii?Q?5jqyz3kyinw8COFcmRvjkY4sd/rAxTJ4hfM46ewXHz1o9or0cHjAOZJQogEI?=
 =?us-ascii?Q?93x1ZR2uCOF9d5/uXdSUd5JHtpMrdBTj5A81592p+8D3Z2wuGXMKoXoV+QKK?=
 =?us-ascii?Q?Lm9wkDY3XYmXX9iNvFw6uUDTYwH8pK824lmA5MciSxqkg4Frq8PeaYVBs+Tf?=
 =?us-ascii?Q?/pO744OF0GxtE7RDdAXmjnjxfnYgzIiDw0AsIakPtRDILW18sn61B4OFzotm?=
 =?us-ascii?Q?DBtgwrhVjJOFKCR88mEQuRPTEDpVXIQxG/ytgyLYvw92RxIPT0gfL5jwCxvX?=
 =?us-ascii?Q?/6nRokYLaBxtXdco8J+P9RyLLiZl5pKihokDPnuoFneSjVpuQbkuYJYUGKCU?=
 =?us-ascii?Q?lthgOQmpEyDcpn75Yu4VOR6wSqrTX3vlYFn6hTYZDukuhBMOXYwCaxKSmHfH?=
 =?us-ascii?Q?e0fViyvhuTieA5nxVgEv+gbI1bBqX9FJPrTCp9jwybvzhfS9bKY0gPB8Knjy?=
 =?us-ascii?Q?doYZT85CiyOa+67qvH3gpOsMUzPIE7c=3D?=
X-OriginatorOrg: surban.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 123fd607-b5b2-4856-7c9e-08de8271b3b4
X-MS-Exchange-CrossTenant-AuthSource: VI2P189MB2656.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2026 09:03:19.2396
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: a27af4ff-c4b3-4dec-be8d-845345d2ab67
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TP98WytuqgLjG+iGguqcbC+sC81E38D2nfCK2qaGT7DyiOd9OdcGKHRj9Za3VrUGiRyy2YlAfQI6WUsDDEEusw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PPF351D2A478
X-Spamd-Result: default: False [1.84 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[surban.net:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34814-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[surban.net:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[surban.net];
	RCPT_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[surban@surban.net,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: A14AB2904E8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The transfer() function in dummy_hcd iterates over all queued gadget
requests for a given endpoint via list_for_each_entry(). When the
per-frame bandwidth budget is exhausted mid-request, leaving a
partially-transferred gadget request, the loop continues to the next
queued request instead of stopping. This breaks data ordering in the
URB transfer buffer.

Two consequences:

  1. Data corruption: bytes from subsequent requests are written into
     the URB buffer ahead of the remaining bytes from the incomplete
     request. On the next timer tick the incomplete request resumes,
     appending its remaining data after the out-of-order bytes.

  2. Premature URB completion: if the next request is a ZLP or shorter
     than the remaining host buffer, it triggers the is_short path and
     completes the URB before all data has been transferred.

Fix this by breaking out of the loop when the current request has
remaining data (req->req.actual < req->req.length). The request
resumes on the next timer tick, preserving data ordering.

Signed-off-by: Sebastian Urban <surban@surban.net>
---
 drivers/usb/gadget/udc/dummy_hcd.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/usb/gadget/udc/dummy_hcd.c b/drivers/usb/gadget/udc/dummy_hcd.c
index 1cefca660..0eead4a85 100644
--- a/drivers/usb/gadget/udc/dummy_hcd.c
+++ b/drivers/usb/gadget/udc/dummy_hcd.c
@@ -1534,6 +1534,12 @@ static int transfer(struct dummy_hcd *dum_hcd, struct urb *urb,
 		/* rescan to continue with any other queued i/o */
 		if (rescan)
 			goto top;
+
+		/* request not fully transferred; stop iterating to
+		 * preserve data ordering across queued requests.
+		 */
+		if (req->req.actual < req->req.length)
+			break;
 	}
 	return sent;
 }
-- 
2.53.0


