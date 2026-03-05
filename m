Return-Path: <linux-usb+bounces-34070-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sOLRCTdnqWlN6wAAu9opvQ
	(envelope-from <linux-usb+bounces-34070-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 05 Mar 2026 12:21:27 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B898C210852
	for <lists+linux-usb@lfdr.de>; Thu, 05 Mar 2026 12:21:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DAF89306A82A
	for <lists+linux-usb@lfdr.de>; Thu,  5 Mar 2026 11:15:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B61D38E108;
	Thu,  5 Mar 2026 11:15:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MkG59GJq"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61901386431;
	Thu,  5 Mar 2026 11:15:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772709328; cv=none; b=kdtE45vE1ECxa9wUY3gBuAA0UVPBgyd4hPkIv77La6zPB59kk52hyuRI51hiEUTGkaSah7Qc568kaMgimOsLlbgMhJqtI7a5Ipd1bYmIr3d92Dzuy+OqPO4h+gbDk6/CukO1Ne34h2r3BdqWl6LGouryw2Vu4riacF4KLVP2KMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772709328; c=relaxed/simple;
	bh=1AiE2nAY8josHKUT6kRxF3mlw9VySkREoY8DEdUcpGM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Z+tK8aQlPmeinL5HJVknJe102TioOGzAmzdwFQCqkSplr+5xIU1YLBn+YazBouP+Jaj2qUn4ZRcQsLu7KTTlBiSL0tlu1JnNEM5N6bRqgPMqJTUGQDMHPj63kkw+XhnvvgHGc9CVr09Q+uBjtEkihHCRrIsAXKb0V4T17j8mk3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MkG59GJq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3BF7AC2BCB5;
	Thu,  5 Mar 2026 11:15:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772709328;
	bh=1AiE2nAY8josHKUT6kRxF3mlw9VySkREoY8DEdUcpGM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MkG59GJq43BLzxauzkA2VuaFTA51HPRcraXUuKuFZHJRj1RPPpVWUFDN1yr5Olq0J
	 nCkZIckUM+czN1a6txyttOr53oW8kU5+YOeui6YBRL4gtd44OmrLIvE6gLRqpzcoxU
	 wNzlLVYd+u0rNqMzG0IzLrLYJ2gJ6QjbZ1F/FRR6Se+R44JVfZUXvbyUP/ORzpAUQ0
	 d0wtE9ZLUUd7Mw/0pFZ94ldqAq+y47AIuxDMnaYhieZ4hDkVj8px1YiSpMJgp5LmFG
	 LkcO3pw5v8Q7M2uqAxN8ZYKzUDPw0SCXIJh4RM+G+ByYuv04N5FBTFk7vOINaGjeVI
	 nJqLXqENhukNg==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1vy6ft-000000004nk-3tki;
	Thu, 05 Mar 2026 12:15:25 +0100
From: Johan Hovold <johan@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Lixu Zhang <lixu.zhang@intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan@kernel.org>
Subject: [PATCH 4/5] USB: trancevibrator: drop redundant device reference
Date: Thu,  5 Mar 2026 12:15:10 +0100
Message-ID: <20260305111511.18386-5-johan@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260305111511.18386-1-johan@kernel.org>
References: <20260305111511.18386-1-johan@kernel.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: B898C210852
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34070-lists,linux-usb=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[johan@kernel.org,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Action: no action

Driver core holds a reference to the USB interface and its parent USB
device while the interface is bound to a driver and there is no need to
take additional references unless the structures are needed after
disconnect.

Drop the redundant device reference to reduce cargo culting, make it
easier to spot drivers where an extra reference is needed, and reduce
the risk of memory leaks when drivers fail to release it.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/usb/misc/trancevibrator.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/usb/misc/trancevibrator.c b/drivers/usb/misc/trancevibrator.c
index 6aaec2db360b..37f6b79889a6 100644
--- a/drivers/usb/misc/trancevibrator.c
+++ b/drivers/usb/misc/trancevibrator.c
@@ -92,7 +92,7 @@ static int tv_probe(struct usb_interface *interface,
 		goto error;
 	}
 
-	dev->udev = usb_get_dev(udev);
+	dev->udev = udev;
 	usb_set_intfdata(interface, dev);
 
 	return 0;
@@ -108,7 +108,6 @@ static void tv_disconnect(struct usb_interface *interface)
 
 	dev = usb_get_intfdata (interface);
 	usb_set_intfdata(interface, NULL);
-	usb_put_dev(dev->udev);
 	kfree(dev);
 }
 
-- 
2.52.0


