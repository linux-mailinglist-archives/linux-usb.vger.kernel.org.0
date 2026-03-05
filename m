Return-Path: <linux-usb+bounces-34065-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6DbKERNnqWlN6wAAu9opvQ
	(envelope-from <linux-usb+bounces-34065-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 05 Mar 2026 12:20:51 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B4B67210835
	for <lists+linux-usb@lfdr.de>; Thu, 05 Mar 2026 12:20:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C459A3042956
	for <lists+linux-usb@lfdr.de>; Thu,  5 Mar 2026 11:15:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B04DB387341;
	Thu,  5 Mar 2026 11:15:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EC3YoEtv"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BF2636F40E;
	Thu,  5 Mar 2026 11:15:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772709328; cv=none; b=jhTicf6PVOowf7h4nJ2N3qyVt/Q45IBWn73TRg7S2vOIym7pahzvxtAukMaDIoizEZO4v8MNvRnMCkbPJdVZbE0ngiewKJqAX2LCw1qCe3JMZnW24oRZRfM/m8U98zocgU6WOPDY0M8voCE8WOH11EgyN03N8/inzotRw8MdaJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772709328; c=relaxed/simple;
	bh=YX6VeJZoImKept7XZEeAhxhhHVTyX4TzApXk5bpoRrM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=o3h6bG6gH0RWuNkIvk8Cxe876nSrAG91vmEs2jUNVwokaPLstrOcKCpsyR4YkcTY2ZtmzhUpxmoENaYX6B4zRAnvHgq4LrcRxhgs5x4My1GGwvx0i8VH1BjX18TBqUUSdWvR1BxuRGOCwd8VlT/+Is1kPa/EZaIfvWipEyjTUcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EC3YoEtv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1296EC2BC87;
	Thu,  5 Mar 2026 11:15:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772709328;
	bh=YX6VeJZoImKept7XZEeAhxhhHVTyX4TzApXk5bpoRrM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=EC3YoEtvNkWDguq9ApRsCFWsrWCZzppYRYqKnU6rd9/plfXVz70WL4PEIIwY4IFFs
	 GtxcqW1O4uSvaFVO2N7bnwVONt4NmiWHVENT2+iXlQPjTsmhhOVWFZG89Mh5jPl7jE
	 vIgFZPoNmdtWikRAIjLZ0F7mcxyIGuNtQqyKXHX7rTT4xEx+TrACf1Pwov9cJ5w+DV
	 CLiqCn3JaNQsjPNUxVictqCBum5QqzmDxOK47B69+Bgy3CNvjH1GBtxBqf+DNQP2u8
	 zzLjiD2puVOzU+3PC0FVrdiIPtNS6l1xL1JQKtakocOklLAhQfyCT+ZceVrako4yiY
	 qTcbqt+uoUSGA==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1vy6ft-000000004ni-3r1G;
	Thu, 05 Mar 2026 12:15:25 +0100
From: Johan Hovold <johan@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Lixu Zhang <lixu.zhang@intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan@kernel.org>
Subject: [PATCH 3/5] USB: ljca: drop redundant interface reference
Date: Thu,  5 Mar 2026 12:15:09 +0100
Message-ID: <20260305111511.18386-4-johan@kernel.org>
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
X-Rspamd-Queue-Id: B4B67210835
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34065-lists,linux-usb=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Action: no action

Driver core holds a reference to the USB interface while it is bound to
a driver and there is no need to take another reference unless the
interface is needed after disconnect.

Drop the redundant interface reference to reduce cargo culting, make it
easier to spot drivers where an extra reference is needed, and reduce
the risk of memory leaks when drivers fail to release it.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/usb/misc/usb-ljca.c | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/drivers/usb/misc/usb-ljca.c b/drivers/usb/misc/usb-ljca.c
index 7e85fd12da56..c60121faa3da 100644
--- a/drivers/usb/misc/usb-ljca.c
+++ b/drivers/usb/misc/usb-ljca.c
@@ -776,7 +776,7 @@ static int ljca_probe(struct usb_interface *interface,
 	init_completion(&adap->cmd_completion);
 	INIT_LIST_HEAD(&adap->client_list);
 
-	adap->intf = usb_get_intf(interface);
+	adap->intf = interface;
 	adap->usb_dev = usb_dev;
 	adap->dev = dev;
 
@@ -787,7 +787,7 @@ static int ljca_probe(struct usb_interface *interface,
 	ret = usb_find_common_endpoints(alt, &ep_in, &ep_out, NULL, NULL);
 	if (ret) {
 		dev_err(dev, "bulk endpoints not found\n");
-		goto err_put;
+		goto err_destroy_mutex;
 	}
 	adap->rx_pipe = usb_rcvbulkpipe(usb_dev, usb_endpoint_num(ep_in));
 	adap->tx_pipe = usb_sndbulkpipe(usb_dev, usb_endpoint_num(ep_out));
@@ -797,14 +797,14 @@ static int ljca_probe(struct usb_interface *interface,
 	adap->rx_buf = devm_kzalloc(dev, adap->rx_len, GFP_KERNEL);
 	if (!adap->rx_buf) {
 		ret = -ENOMEM;
-		goto err_put;
+		goto err_destroy_mutex;
 	}
 
 	/* alloc rx urb */
 	adap->rx_urb = usb_alloc_urb(0, GFP_KERNEL);
 	if (!adap->rx_urb) {
 		ret = -ENOMEM;
-		goto err_put;
+		goto err_destroy_mutex;
 	}
 	usb_fill_bulk_urb(adap->rx_urb, usb_dev, adap->rx_pipe,
 			  adap->rx_buf, adap->rx_len, ljca_recv, adap);
@@ -836,10 +836,7 @@ static int ljca_probe(struct usb_interface *interface,
 
 err_free:
 	usb_free_urb(adap->rx_urb);
-
-err_put:
-	usb_put_intf(adap->intf);
-
+err_destroy_mutex:
 	mutex_destroy(&adap->mutex);
 
 	return ret;
@@ -864,8 +861,6 @@ static void ljca_disconnect(struct usb_interface *interface)
 
 	usb_free_urb(adap->rx_urb);
 
-	usb_put_intf(adap->intf);
-
 	mutex_destroy(&adap->mutex);
 }
 
-- 
2.52.0


