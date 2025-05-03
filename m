Return-Path: <linux-usb+bounces-23672-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E181AA82BB
	for <lists+linux-usb@lfdr.de>; Sat,  3 May 2025 22:27:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DBA743BF3AD
	for <lists+linux-usb@lfdr.de>; Sat,  3 May 2025 20:26:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 012D027EC67;
	Sat,  3 May 2025 20:26:59 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mx01.omp.ru (mx01.omp.ru [90.154.21.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 622BC27EC7C
	for <linux-usb@vger.kernel.org>; Sat,  3 May 2025 20:26:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.154.21.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746304018; cv=none; b=ANjrSXLaN/L0p2+22HknZhF/UPUGGPc0xJnCG7FkQWTm9cecVZZf04PRZGK7goI75X/U4O1muQlXBVMaMgFr3xX/lqbp+vNLY73mRdAJTzobozNIZI6hboQGvl3Jr+HtCMiiqyLeHBh+Ldi7lAPcyhXMG7HhevKfZBaUV4y5xtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746304018; c=relaxed/simple;
	bh=Z/ue86elTeYugkCc41tkslhZpsWmh6LrPHmgS0mO7RE=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:CC:Content-Type; b=Fv3OevwrYwJ6mG7Rx+Y+QL7o5tHMGPTZF9m0NXBueJwTMkV9k6orJaRvyI0ChH8Xz9UPIvfF2lQf+5R8qqTzlYWWNLgUad3pBfO/eOk+PEWYljT9VXpQAFfaJOh+dbo1wFy0h9idKo2GhsyPxKvEQ5mvOrq1NAEuVM0wrFLCPIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=omp.ru; spf=pass smtp.mailfrom=omp.ru; arc=none smtp.client-ip=90.154.21.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=omp.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=omp.ru
Received: from [192.168.2.102] (213.87.129.16) by msexch01.omp.ru
 (10.188.4.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.1258.12; Sat, 3 May
 2025 23:26:32 +0300
Message-ID: <8c1a12b4-e8e5-4423-86b4-4b816d53cd7f@omp.ru>
Date: Sat, 3 May 2025 23:26:31 +0300
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Sergey Shtylyov <s.shtylyov@omp.ru>
Subject: [PATCH] usb: gadget: function: rndis: drop useless checks in
 gen_ndis_query_resp()
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	<linux-usb@vger.kernel.org>
CC: <lvc-project@linuxtesting.org>
Content-Language: en-US
Organization: Open Mobile Platform
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: msexch01.omp.ru (10.188.4.12) To msexch01.omp.ru
 (10.188.4.12)
X-KSE-ServerInfo: msexch01.omp.ru, 9
X-KSE-AntiSpam-Interceptor-Info: scan successful
X-KSE-AntiSpam-Version: 6.1.1, Database issued on: 05/03/2025 20:12:24
X-KSE-AntiSpam-Status: KAS_STATUS_NOT_DETECTED
X-KSE-AntiSpam-Method: none
X-KSE-AntiSpam-Rate: 19
X-KSE-AntiSpam-Info: Lua profiles 193083 [May 03 2025]
X-KSE-AntiSpam-Info: Version: 6.1.1.11
X-KSE-AntiSpam-Info: Envelope from: s.shtylyov@omp.ru
X-KSE-AntiSpam-Info: LuaCore: 56 0.3.56
 52db7f275cc9b6820389ba9ab2ac225370e1c244
X-KSE-AntiSpam-Info: {rep_avail}
X-KSE-AntiSpam-Info: {Tracking_uf_ne_domains}
X-KSE-AntiSpam-Info: {Tracking_from_domain_doesnt_match_to}
X-KSE-AntiSpam-Info: {SMTP from is not routable}
X-KSE-AntiSpam-Info: {Found in DNSBL: 213.87.129.16 in (user)
 b.barracudacentral.org}
X-KSE-AntiSpam-Info:
	omp.ru:7.1.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;127.0.0.199:7.1.2;lore.kernel.org:7.1.1
X-KSE-AntiSpam-Info: {Tracking_ip_hunter}
X-KSE-AntiSpam-Info: FromAlignment: s
X-KSE-AntiSpam-Info: ApMailHostAddress: 213.87.129.16
X-KSE-AntiSpam-Info: {DNS response errors}
X-KSE-AntiSpam-Info: Rate: 19
X-KSE-AntiSpam-Info: Status: not_detected
X-KSE-AntiSpam-Info: Method: none
X-KSE-AntiSpam-Info: Auth:dmarc=temperror header.from=omp.ru;spf=temperror
 smtp.mailfrom=omp.ru;dkim=none
X-KSE-Antiphishing-Info: Clean
X-KSE-Antiphishing-ScanningType: Heuristic
X-KSE-Antiphishing-Method: None
X-KSE-Antiphishing-Bases: 05/03/2025 20:13:00
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: Clean, bases: 5/3/2025 5:50:00 PM
X-KSE-Attachment-Filter-Triggered-Rules: Clean
X-KSE-Attachment-Filter-Triggered-Filters: Clean
X-KSE-BulkMessagesFiltering-Scan-Result: InTheLimit

In gen_ndis_query_resp(), params->dev is checked against NULL several times
in the *switch* statement; however, first it gets passed to dev_get_stats()
which dereferences it unconditionally.  Moreover, params->dev is checked at
the start of rndis_query_response() (our function's only caller) and error
is returned if it's NULL, so the checks inside the *switch* appear totally
redundant -- remove them.

Found by Linux Verification Center (linuxtesting.org) with the Svace static
analysis tool.

Signed-off-by: Sergey Shtylyov <s.shtylyov@omp.ru>

---
This patch is against the usb-next branch of Greg KH's usb.git repo.

The previous attempt to deal with this issue by Jim Lin [1] got withdrawn,
so 5 Svace's reports against this driver are stuck in our "debt" list since
2022 -- trying to move the situation forward now that I have some time...

[1] https://lore.kernel.org/all/20220908175615.5095-1-jilin@nvidia.com/

 drivers/usb/gadget/function/rndis.c |   34 ++++++++++++----------------------
 1 file changed, 12 insertions(+), 22 deletions(-)

Index: usb/drivers/usb/gadget/function/rndis.c
===================================================================
--- usb.orig/drivers/usb/gadget/function/rndis.c
+++ usb/drivers/usb/gadget/function/rndis.c
@@ -246,10 +246,8 @@ static int gen_ndis_query_resp(struct rn
 	/* mandatory */
 	case RNDIS_OID_GEN_MAXIMUM_FRAME_SIZE:
 		pr_debug("%s: RNDIS_OID_GEN_MAXIMUM_FRAME_SIZE\n", __func__);
-		if (params->dev) {
-			*outbuf = cpu_to_le32(params->dev->mtu);
-			retval = 0;
-		}
+		*outbuf = cpu_to_le32(params->dev->mtu);
+		retval = 0;
 		break;
 
 	/* mandatory */
@@ -266,19 +264,15 @@ static int gen_ndis_query_resp(struct rn
 	/* mandatory */
 	case RNDIS_OID_GEN_TRANSMIT_BLOCK_SIZE:
 		pr_debug("%s: RNDIS_OID_GEN_TRANSMIT_BLOCK_SIZE\n", __func__);
-		if (params->dev) {
-			*outbuf = cpu_to_le32(params->dev->mtu);
-			retval = 0;
-		}
+		*outbuf = cpu_to_le32(params->dev->mtu);
+		retval = 0;
 		break;
 
 	/* mandatory */
 	case RNDIS_OID_GEN_RECEIVE_BLOCK_SIZE:
 		pr_debug("%s: RNDIS_OID_GEN_RECEIVE_BLOCK_SIZE\n", __func__);
-		if (params->dev) {
-			*outbuf = cpu_to_le32(params->dev->mtu);
-			retval = 0;
-		}
+		*outbuf = cpu_to_le32(params->dev->mtu);
+		retval = 0;
 		break;
 
 	/* mandatory */
@@ -405,21 +399,17 @@ static int gen_ndis_query_resp(struct rn
 	/* mandatory */
 	case RNDIS_OID_802_3_PERMANENT_ADDRESS:
 		pr_debug("%s: RNDIS_OID_802_3_PERMANENT_ADDRESS\n", __func__);
-		if (params->dev) {
-			length = ETH_ALEN;
-			memcpy(outbuf, params->host_mac, length);
-			retval = 0;
-		}
+		length = ETH_ALEN;
+		memcpy(outbuf, params->host_mac, length);
+		retval = 0;
 		break;
 
 	/* mandatory */
 	case RNDIS_OID_802_3_CURRENT_ADDRESS:
 		pr_debug("%s: RNDIS_OID_802_3_CURRENT_ADDRESS\n", __func__);
-		if (params->dev) {
-			length = ETH_ALEN;
-			memcpy(outbuf, params->host_mac, length);
-			retval = 0;
-		}
+		length = ETH_ALEN;
+		memcpy(outbuf, params->host_mac, length);
+		retval = 0;
 		break;
 
 	/* mandatory */

