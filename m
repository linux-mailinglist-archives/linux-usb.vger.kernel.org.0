Return-Path: <linux-usb+bounces-37652-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kHawOZqlC2qRKQUAu9opvQ
	(envelope-from <linux-usb+bounces-37652-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 19 May 2026 01:49:46 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D7E8575297
	for <lists+linux-usb@lfdr.de>; Tue, 19 May 2026 01:49:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1737D3073DC7
	for <lists+linux-usb@lfdr.de>; Mon, 18 May 2026 23:45:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44075341650;
	Mon, 18 May 2026 23:43:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nsbXNlhH"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1296433B6FC
	for <linux-usb@vger.kernel.org>; Mon, 18 May 2026 23:43:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779147824; cv=none; b=KXdhlYSruuZHLhh7F9TMttzKYDFQnhqXb5VnX5vVNUG+Onh/5cAzbYX89wY/CKcAL8bAaDf2FjKJ1KmcB8DQGCLLFBKJ6LFeAphYFafJdKGp7WSTK2VpBFJo+vjFTCzRdFgHatZyNvQ8AMQkt1bFaRdC5sYD+btZTf91kf3kzhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779147824; c=relaxed/simple;
	bh=IFNciou/V71XsBKVuFdNxfG7ygUigfWqW28bY5N29jo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OyCDb1CZbTNUsYfA0T+Q2hmA11W/Tg5dwX+pXM4rffS6tYydFwv1ZNdIU1UQe1741Uv6eo6PZem0M5ER28TXC36cEz7vr5rN5hKvvLwso68q61eTr+7QXExYGYpgTLQETXQly32bYlnzlaswJH8S92gwzHjvovzu1np8zptcFAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nsbXNlhH; arc=none smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-90caad2e944so315382685a.2
        for <linux-usb@vger.kernel.org>; Mon, 18 May 2026 16:43:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779147821; x=1779752621; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dNXEdcW1UqrQFdD6k33dDba7w+EtTVP9jWM9zY9ankQ=;
        b=nsbXNlhHA+tB2oxkBaaKv8KyLsUB2whEf0/6/zuCpGff1wqMNjsmu2EM1VZveXo1Y7
         ot7mWewa/Ll8O5t+8F+cFLy/kRcJUVBiBtbM1vEgiLvTJb2l8DW7vpKVgbPBW3Jngmbc
         kqyYl+bVKMdnVmRUBb0WmbRyYCi6ikPCr5quEv2Cly33hy7v5lTLGufPmJWWc+v/zxwx
         4yP6zNfTZmI4DIy04dLCT3E81u0Ch6VuF9+dBo0PrZtIl1r3FD1K85v8ZJmi9DdBgYsX
         UXWUQo7ktRiJH10ltqnYo5zRgB8v7qcFfA2HEKpF1GOC7CVF6A23lYnTFoV/kC7MqK2m
         N1kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779147821; x=1779752621;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dNXEdcW1UqrQFdD6k33dDba7w+EtTVP9jWM9zY9ankQ=;
        b=mKxUJD98C0e5vm3QpkZBUEJZ+4vhXIR+9tUcpwyvbLPeDfw2jIeK+794kUWyfwzam4
         Wm//Ez5Rn9PWYN2+FYqVLphUrvaCJLJ3i/UBAqZJvB/9E9CFv5PQEnZSjEwRGQrfkpmX
         rK1vcL0WpUlasGTbH3hr9jeCAQSyu3OFEXfV7pgZI0imFDUiJT0BFxR1W0PuZmldAIJt
         Y01P9z8MgIh5oWtaMpWbJ4YpC2EpzNnYh5WV0eFRbtaCftFpQHsA1oZ5TNbW46ZTUpM9
         D6goyxxoVFVk+BD37Lz1XoNMugCoxfijcp02ZxbSVG+6YxoURZpHuhC83rf/N7lxLUsG
         EkbA==
X-Forwarded-Encrypted: i=1; AFNElJ8NYII4CJHjU/j75WZkAWPaH2nHjtvovu/kQbeZMw8s2KDuVA5rZg1NpVgPj1WFrOV2Kkv1CLajG4Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YxGKVuowgVnghhg0UpvDJz/0XrPkzvGCy/KiVSWG/RwTDhuHiKt
	EthjnfuAx+xs7wOIzxfPcVjcu1ayGGjhORHFA8aftR49AC4jwCzhU5u2
X-Gm-Gg: Acq92OGMZ1VVTqe2K2NkUjjmrNkFNvHn8u5G3Ff3gSY5+hzHFFvDgzOG7TRQGQvXCee
	jiQltA6yHsu5ExFQ5aU5j5NR3cwg56sI8jHSAn08dtcdm2XjMd12bx7sExBcrsEzAU2a01yZ5LN
	TBgCcQ8L7iLUpusMyKvUq1o6KfG4E4wOQI2lzf6TVL37vF2YQ8TYiAa4dQiqvBSaPE788Fjg3Xv
	JvFdVf3Ns3xeSTmq7dH9MZD/MMaAbItPDqvHpxZzti+Z7Ph/nnzPNljIEuN3OZOYdmz/Vjh9Hlf
	6Q7nS11fFa0EwF+d/UqaZq30zYh8iHGisPnK3pX9OPnwKE/mMnUziapV8vMA4M3ABrbFeNUsPXH
	Z0vf4urdtEaME8O2EobgnquoRdqcQZXl1hgzh6fjzSuwvLBlRwgZZ9LOQFZcHp3awUGtL+Amwrr
	zzhzCvi7dBEhcv4nGR6GwBIL0v0/3UsHxjPj6z7iWBp74SaHTMGT7zJrW1jyqlHSSRYei83fFc
X-Received: by 2002:a05:620a:aa06:b0:911:ddfd:634a with SMTP id af79cd13be357-911ddfd6552mr2338074985a.4.1779147821044;
        Mon, 18 May 2026 16:43:41 -0700 (PDT)
Received: from mango-teamkim.. ([129.170.196.172])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-910ba36e1acsm1649398285a.3.2026.05.18.16.43.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 16:43:40 -0700 (PDT)
From: pip-izony <eeodqql09@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Seungjin Bae <eeodqql09@gmail.com>,
	Alan Stern <stern@rowland.harvard.edu>,
	Kees Cook <kees@kernel.org>,
	Chen Ni <nichen@iscas.ac.cn>,
	Sebastian Urban <surban@surban.net>,
	Ingo Molnar <mingo@kernel.org>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] usb: gadget: dummy_hcd: Reject hub port requests for non-existent ports
Date: Mon, 18 May 2026 19:43:14 -0400
Message-ID: <20260518234314.1889396-1-eeodqql09@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,rowland.harvard.edu,kernel.org,iscas.ac.cn,surban.net,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-37652-lists,linux-usb=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[eeodqql09@gmail.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,harvard.edu:email]
X-Rspamd-Queue-Id: 8D7E8575297
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Seungjin Bae <eeodqql09@gmail.com>

The `dummy_hub_control()` function handles USB hub class requests
to the virtual root hub. The `GetPortStatus` case returns -EPIPE for
requests with `wIndex != 1`, since the virtual root hub has only a
single port. However, the `ClearPortFeature` and `SetPortFeature`
cases lack the same check.

Fix this by extending the `wIndex != 1` rejection to both cases,
matching the existing behavior of `GetPortStatus`.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Suggested-by: Alan Stern <stern@rowland.harvard.edu>
Signed-off-by: Seungjin Bae <eeodqql09@gmail.com>
---
 drivers/usb/gadget/udc/dummy_hcd.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/usb/gadget/udc/dummy_hcd.c b/drivers/usb/gadget/udc/dummy_hcd.c
index f094491b1041..f47903461ed5 100644
--- a/drivers/usb/gadget/udc/dummy_hcd.c
+++ b/drivers/usb/gadget/udc/dummy_hcd.c
@@ -2134,6 +2134,8 @@ static int dummy_hub_control(
 	case ClearHubFeature:
 		break;
 	case ClearPortFeature:
+		if (wIndex != 1)
+			goto error;
 		switch (wValue) {
 		case USB_PORT_FEAT_SUSPEND:
 			if (hcd->speed == HCD_USB3) {
@@ -2248,6 +2250,8 @@ static int dummy_hub_control(
 		retval = -EPIPE;
 		break;
 	case SetPortFeature:
+		if (wIndex != 1)
+			goto error;
 		switch (wValue) {
 		case USB_PORT_FEAT_LINK_STATE:
 			if (hcd->speed != HCD_USB3) {
-- 
2.43.0


