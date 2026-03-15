Return-Path: <linux-usb+bounces-34827-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sMMrKR7MtmlyIwEAu9opvQ
	(envelope-from <linux-usb+bounces-34827-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sun, 15 Mar 2026 16:11:26 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C9CC29125C
	for <lists+linux-usb@lfdr.de>; Sun, 15 Mar 2026 16:11:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C11733019811
	for <lists+linux-usb@lfdr.de>; Sun, 15 Mar 2026 15:11:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0217B370D53;
	Sun, 15 Mar 2026 15:11:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=surban.net header.i=@surban.net header.b="lRilrYdh"
X-Original-To: linux-usb@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11023114.outbound.protection.outlook.com [40.107.159.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51BDC34D90C;
	Sun, 15 Mar 2026 15:11:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.114
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773587481; cv=fail; b=f6j6UKWou+SDKGgDzyKZD8EUS89qp2E7TBT+4Gx27ENkUcI35Tb/q2+sEkYMXkpbY5GPjEV4Tvvg/B4LROxVmSe+xXbl2cS0+QIkF5m+bq3chb9S2GFi8uWsSGdUgYWEd9lxoSn/7r6+1Tskc5gcI75INbTSz9uueZlSIO8TSko=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773587481; c=relaxed/simple;
	bh=TO0KY9PaIC9oYtSeBX9Kx3tFGbDs86yOSFWksNg5RKU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=fKB+H1JFwBWA+SBFAfcoW/6I75np9xh5rjGkI6UnUTHufUrgIIziVYwI8qRTRrCDuSQhV4duZeGMpynrUm4LGNtb+Jfk5zMu1z1z+V1z6JuZTO7oZo7v44CwM6wsGVIv5T3tGnxSDDYu3+IfNZNknD33D1hdQz4seBvJBPM9J6Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=surban.net; spf=pass smtp.mailfrom=surban.net; dkim=pass (1024-bit key) header.d=surban.net header.i=@surban.net header.b=lRilrYdh; arc=fail smtp.client-ip=40.107.159.114
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=surban.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=surban.net
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Mndusg9/N81fjkpyAJwLmHtuUgRHfQscm5L4FPd0r/QaTmzyNCreEahbdUOPcTXb4BNgNF9NamAU0jPTTpmy1/nv5Uh/zPckPaybO//MsDeYdXO7nJyQNKTlVwmQzUpPUDF49lZyHCJOCUrhj8DUtcxkFcguJkk5+Ab0glpmYz+YAVRgmiaoNENGy06VMwvWDJnEl/LEKpS9rIKV3QsnfjoN4DDzASg06Z3rJBsbdSQeFH0SwPplOnixTqjJnbunVJ0TfhGg1l2XrB3yy0Y96MXcA54LXGkrdqFUDxLUQYc5jQ1XSu+412JSeQZajNlpZyEBxLifFLNvDr55Jx4Kyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Og5ASHoNRCW1mhZ0sVl0OJbDFNFi/4HRcaPDLVOpsl4=;
 b=vr4BXhXMtLLGC2rGALbv9nNq3AwR3jzIDRUmgZVbTVu7p/OXf4fO9wzy3kyYg2v66vFG/NjlgTKLJyKPlDeryx/9Ue+EBhU5j0yaxb9jXz5UISOQGZikscA4nDPH3E3nvGtWNAgnMpkn0ENmN3tj6MfoyQH1ezRiO97o9AyBxcem/WVRg7ESm/LMWa0O1RIU2IjSofPi5tdMXzxKLGtLjnKk6RmBU42I/5v/i/1/Hss3rOXq689d95y9HFjXAlBjO9tlUq9iG4MfAo54icEsfQIOyBmRdUh4kiinELbSHbi+ei3K6MG6mUMmBHJ5puidv+dGc3TwlFJxaGMa7uXqSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=surban.net; dmarc=pass action=none header.from=surban.net;
 dkim=pass header.d=surban.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=surban.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Og5ASHoNRCW1mhZ0sVl0OJbDFNFi/4HRcaPDLVOpsl4=;
 b=lRilrYdhts/NSxlfdkx2KuPD4uXVd7rPtAdZiJ7Okb6QlHa62daf+oIwGuM8L2JcAPBPlkQmgTyl+oiDVXG+QvQnGOhbyBnYhdkDYFqk6OgybX3+DxRglYgD09AJI688bAAUsBcGF+CHIx0Wt+YjwQG9jbmEiZFhNgbfepQbJco=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=surban.net;
Received: from GV1P189MB2668.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:1a2::10)
 by DU2PPFBEB675582.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::aa3) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.21; Sun, 15 Mar
 2026 15:11:17 +0000
Received: from GV1P189MB2668.EURP189.PROD.OUTLOOK.COM
 ([fe80::ff2b:8780:d726:86e8]) by GV1P189MB2668.EURP189.PROD.OUTLOOK.COM
 ([fe80::ff2b:8780:d726:86e8%6]) with mapi id 15.20.9700.021; Sun, 15 Mar 2026
 15:11:17 +0000
From: Sebastian Urban <surban@surban.net>
To: gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	surban@surban.net
Subject: [PATCH v2] usb: gadget: dummy_hcd: fix premature URB completion when ZLP follows partial transfer
Date: Sun, 15 Mar 2026 16:10:45 +0100
Message-ID: <20260315151045.1155850-1-surban@surban.net>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <9f2c403b-5955-4e6b-a356-330cebead7ed@rowland.harvard.edu>
References: <9f2c403b-5955-4e6b-a356-330cebead7ed@rowland.harvard.edu>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR2P281CA0037.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:92::6) To GV1P189MB2668.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:150:1a2::10)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1P189MB2668:EE_|DU2PPFBEB675582:EE_
X-MS-Office365-Filtering-Correlation-Id: 27da1a61-63d2-496f-d375-08de82a51b79
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|10070799003|1800799024|52116014|376014|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	ECgGTqUXRkGy111RsJsukJMh1JIprnmvH1uGrHllMhEeM1l9Ay0OqVJGaI0Fr3LEhvn9HbIDQ5Wq96568ACgocS53gX1MTk/ulNk7/50tIwDjT+R1cIvVy2J5QkkWk4hUhK4Zs2W1+/HENsPzjTjaD5ntdEp7/T8BrK19FbgD02QPPw1FqwsDL9RvMl/k3fPgyTuTHs/LmQsvVmNnw/HQqn0F6Gy5NVoAj+e6x2RHlOBC5ePTmkC8dVCN/ZqGvkvX7wCSLbnYVrHJgaLhO6em9JzVhzW/WXu2+MJuwb/cNcZwjwE199lL9uZ6V8QoqKgiB6XIptVv/61OXKj1Iql6CrOueWqOXfAZHekE+CXb2UZpSUSpEjJ+07nGVCgN5rVFDA8WNnw1hCJhiImecHxnePpEghnlatcKbocWXCw+YqAwrgG/2RcnQSlxC9RWaU/zRDnXUu20NOmh1wdOPLWR8pLAG/9Z03F9Xm3lDrNscr0Ol6kO+W/r9dEy3EuxzK/3SUqEdorTpc91btQdjCCOV2xmwGrvcTbGxV0DTjSm49vRzpS6KMPuD+2iL+3iKQ4Q32Z2Nf0jtbARdAB6kSON8v4CoBD/q31zwGwl25YzKTRluL3K58jhHZnNxOyoA+qzjpvR3CJI9O/XG/DnoQY8BgaQVw0Igg35VzU2dzyHeQqYx9uToaaqMLCYLf8XUe730Zg1QQjLXcHL75nV9h5SWW+/gRLtwhXEszMzNikQDY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1P189MB2668.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(10070799003)(1800799024)(52116014)(376014)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?roAvRCI6s21wa0svYokjhaMn+gtRWhBZ5iYAkWDA31HQuSHqsqLoInwgEGHb?=
 =?us-ascii?Q?Q5JRz309rezi6o4CMSox2RF0v6LGthelxk0jD1epows9tC1Ukel97QdKi4qJ?=
 =?us-ascii?Q?fQiPFT7DScJCxHxPuutHrehzz/xn6MtkZlVCRSBtyZK8vLesTQqkV+KG8pPL?=
 =?us-ascii?Q?7cQe6Kh1n9dAWJGwedR08IazNdlQAFqh8mi236AaaAHc8ynNfBmLKhxAqtH7?=
 =?us-ascii?Q?9eFRGZCq0RhfKXHzDwYFNNoB6ww7ZXU+4J+Bv/HDYjzaJW6p9gfUJq6nMUm+?=
 =?us-ascii?Q?2Lt9CAp100zxbXYWmGqtY56tbq6+A0e5xSdvRC1koc3yzHNkp5AT1nmVZR6z?=
 =?us-ascii?Q?jnoubW+AE0UZAVo6ker0zV9/xQAgBiscKqA9WQeTBYwdeLCmJKK0ZpNDDqnT?=
 =?us-ascii?Q?D+86Jfswo9w46KP0aJWqIISUePynaRSFSiCRcC6Go1URjPpQAuujexyo0aut?=
 =?us-ascii?Q?jztpAD1wzMWFMb3J1pm8BL+uMIJMKrVLcnkm+6FBUEIpBKf1Kq7lBlGh3ViJ?=
 =?us-ascii?Q?jxk4n8nXqIRlAYnZ+vfln+fMkUYkQNHebDgQ6j6xmQlYhTsIO9ml+UjNx8HU?=
 =?us-ascii?Q?2qjSt3+NFl5v1Z2v1+qXvDFy3eWXqwWtRC5BpUMo+CQ5oWT0xcBAwkXyQBgM?=
 =?us-ascii?Q?A+2GqNkOGyO2ribYyg3dLC/OeyRcozShLZWjwtG3cHRSesM7NXRoYya2aY2C?=
 =?us-ascii?Q?pF3s7Ty7F3RljH/npVdSxExa6WusmwA34ThlYi8VTtZSYqbfOV0JsBzcu7IE?=
 =?us-ascii?Q?JRE7iLFL+aUu9T60K3c8R1Kt/ggvxLLy2jiB0jPnDEDj3OtJQDGIQbWM4e93?=
 =?us-ascii?Q?p4zB3vODbXi/yjUGA+3OUsmbEnGkTsOPTcbexKCs6ERvtnSq1egOwmgJ1ymJ?=
 =?us-ascii?Q?Ilvp/srQL2Kb/JVpMavPmvYunhLUj+lOdA/KgjJ8W/88/hXYDCzbw2Ouxzk1?=
 =?us-ascii?Q?E+Sp6WRk0YzzJzQyCu/XE7Tyh0JRHI5vDqIMquulWnV0tEKmFgYEhDgyvtqF?=
 =?us-ascii?Q?E6DIDVk96yqqnELd/LOWJl2FDGCi6OMdNoH5W0caq9AWXoXTK5CQm5b8vLnL?=
 =?us-ascii?Q?a0/smqWzpsMCL67PYjIZNbDXQkF/7PhQ/IDcWKt+7d7izD8sRC+PVEEXzA1J?=
 =?us-ascii?Q?WGMoZMjDe0wDNzoyPmvuTJ8ENy8Lb671Jnul9FKvCiXvLv/eI/KyG0g+SxXg?=
 =?us-ascii?Q?YNDvY7KmoGZcVP1BcZmQmSemwrmV+Wc1u6tgc9CaAqhNpJySFCcG63twcjRp?=
 =?us-ascii?Q?SFgu+xndsHE0f8iURTc6hahGW8ELej5RNu3kOBqV4K5PWAIaFNjiIO6ODRnr?=
 =?us-ascii?Q?KxZ5lm3YK9uN+i8xSNzG9sq+4gusQsRbIvuJcE7niFPT1Lzwstbb2NIqMiXX?=
 =?us-ascii?Q?5ZrFFbdJiXNn0IpEJo3mKqJxDWDMKySQttbZUjgxAFPn1H/AczS7lRBZOO/p?=
 =?us-ascii?Q?oGf9DcQFoPQbkbZtvsdCqymnqqPbLE1od6l5ewlFbuaS28Z8tc4zksJvONxc?=
 =?us-ascii?Q?ERxPXIs3T4LMRLf9JVXt6AMcjQN0AZqZLMjWfZmPJlWOp0fMoaj/xbE9Qchb?=
 =?us-ascii?Q?5vBsm0TPqkWO6NcwWVHa+/HI65r5hUVvR1MDIFo+kDotaU0WceZyx1f/KQZz?=
 =?us-ascii?Q?+uEKlMipABWqIkBrCGw2V1Wxd3DropNQkc0Fzd0j1+h7loHU3nGSeuggg6jP?=
 =?us-ascii?Q?Ly4TqjCHWw4oA2WQskMfV3qUi74irgW3vsQnh2iLlWENgasG79/ohiNyZlya?=
 =?us-ascii?Q?McFq9nZB2/vWNrXPsvH9+oXo1D1CokM=3D?=
X-OriginatorOrg: surban.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 27da1a61-63d2-496f-d375-08de82a51b79
X-MS-Exchange-CrossTenant-AuthSource: GV1P189MB2668.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2026 15:11:17.6999
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: a27af4ff-c4b3-4dec-be8d-845345d2ab67
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hGZqP3X2PAwQADucqsZGwVvZ6Sr4gq9TByVLfvYduJZfC6p71LTOIaZ+2zedzyj7n/HWsAjehcPp8CfNlqL5aQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PPFBEB675582
X-Spamd-Result: default: False [1.84 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[surban.net:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34827-lists,linux-usb=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,surban.net:dkim,surban.net:email,surban.net:mid]
X-Rspamd-Queue-Id: 0C9CC29125C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

When a gadget request is only partially transferred in transfer()
because the per-frame bandwidth budget is exhausted, the loop advances
to the next queued request. If that next request is a zero-length
packet (ZLP), len evaluates to zero and the code takes the
unlikely(len == 0) path, which sets is_short = 1. This bypasses the
bandwidth guard ("limit < ep->ep.maxpacket && limit < len") that
lives in the else branch and would otherwise break out of the loop for
non-zero requests. The is_short path then completes the URB before all
data from the first request has been transferred.

Reproducer (bulk IN, high speed):

  Device side (FunctionFS with Linux AIO):
    1. Queue a 65024-byte write via io_submit (127 * 512, i.e. a
       multiple of the HS bulk max packet size).
    2. Immediately queue a zero-length write (ZLP) via io_submit.

  Host side:
    3. Submit a 65536-byte bulk IN URB.

  Expected: URB completes with actual_length = 65024.
  Actual:   URB completes with actual_length = 53248, losing 11776
            bytes that leak into subsequent URBs.

At high speed the per-frame budget is 53248 bytes (512 * 13 * 8).
The 65024-byte request exhausts this budget after 53248 bytes, leaving
the request incomplete (req->req.actual < req->req.length). Neither
the request nor the URB is finished, and rescan is 0, so the loop
advances to the ZLP. For the ZLP, dev_len = 0, so len = min(12288, 0)
= 0, taking the unlikely(len == 0) path and setting is_short = 1.
The is_short handler then sets *status = 0, completing the URB with
only 53248 of the expected 65024 bytes.

Fix this by breaking out of the loop when the current request has
remaining data (req->req.actual < req->req.length). The request
resumes on the next timer tick, preserving correct data ordering.

Signed-off-by: Sebastian Urban <surban@surban.net>
---
Changes in v2:
  - Rewrote commit message to describe the specific ZLP-after-partial-transfer
    scenario rather than overstating the general case (Alan Stern).
  - Added reproducer and step-by-step code path walkthrough.

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


