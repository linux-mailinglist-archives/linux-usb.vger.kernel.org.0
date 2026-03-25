Return-Path: <linux-usb+bounces-35441-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oA/nGHG7w2kKtwQAu9opvQ
	(envelope-from <linux-usb+bounces-35441-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 25 Mar 2026 11:39:45 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F9F332325F
	for <lists+linux-usb@lfdr.de>; Wed, 25 Mar 2026 11:39:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 157FB306B142
	for <lists+linux-usb@lfdr.de>; Wed, 25 Mar 2026 10:34:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80CD43B8D40;
	Wed, 25 Mar 2026 10:34:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IkDRp4Ku"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89BF73B8BC6
	for <linux-usb@vger.kernel.org>; Wed, 25 Mar 2026 10:33:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774434840; cv=none; b=B0nfnxqViW6rdp/ATJUuzGb+7fiFVhImMAXpKF0f1m3EXJvyJWrkLRtFDKtpCGfJe568EPn96/Z0/XOXRcsYtoyLxhTxmm96G2LjCDagJKO41E4CiRwNbGSQ8CJIToTbULXfBfrAc8QjH0Xmfhri5n0c197pnJe64lEceJGHKxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774434840; c=relaxed/simple;
	bh=c3wAjR9U75BJRTzVgmGzpvqlNAq0YjuFyvH0k91DE2E=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fSOKCn+xNzYWJj6f95vr4HLzin1snNYoCzfy+v5hKXR7tU0nQVehgUtFrjVqp9jYbGcC7bo+bY5DzIZ4mBwfgtWrmSPKPaiH01vvh65IrshdcEj1gF/7gDbu/z1bhr6WY4xgy2ykfG+ASQHNHrNLNNXPt+IRGp6fnW9RB3eAYaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IkDRp4Ku; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6674cba2c50so1302717a12.0
        for <linux-usb@vger.kernel.org>; Wed, 25 Mar 2026 03:33:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774434837; x=1775039637; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xS5go8JPaCUs2K6BgRt95MJ82Od41gTawdoeEYv6y9o=;
        b=IkDRp4KuqKpyVmkN/hECq9PnY7jp/CPEljUJnClawL3Wy9qeznYVpqkdcwibYf/tZN
         1TQ9npwVnt1EGu9p0buciYIdotyPP/LCOZbIoTT2BjwUBgXq29gywLq06VJxGyc2hY+Y
         YqkOruHy6EqDawgSmHWOtqIoeuMLgE1Bct5e0IH2SizC2O8QO8Bb1A5K3KB8rFT54z65
         vQ54x6Tk+xIWPgyZUJFECQweKEcT3WxrXTUuWc/FnCUu+0dNVbNlndHLYI7fBGcV4V0Q
         3xIi0mmx+bF/aj8KOCqG1sbx4TQdwCyFFZKVLaKBq3U21JQhCvBcyyxXwGbOXWgDyK1+
         YS3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774434837; x=1775039637;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xS5go8JPaCUs2K6BgRt95MJ82Od41gTawdoeEYv6y9o=;
        b=nPfzoPlxkIteTzhXU7HFZ2jBOEynBZXO38urr95UJiPw8ZDD3AZzZHHnpegPYG+bNv
         fNUy3ok6Mi8Em40WVNlfjrG+5y89aNn+rZWETfLIYBB2ghewXUm8rc9ZOQMRnwL/D6/D
         ZtbiWRM1zc3+2PizTOfvgJ1NVSs8fggI2hGkEuj2DIDY3F3jgqyKXvoXvBQqNS82BllH
         W1F/Dp74Ds9bvVvArdi9lUsCebqvpFqd/TjenR78FBqo3bBhpWG90z4AQHNAbC3TqrLX
         FI67RQpX7ol4LTW6ILrqobqRqRPiopiKbVm/2zLTIaZ44X0Mfp/SFoDDtyJkfTGWGhPr
         GEEg==
X-Forwarded-Encrypted: i=1; AJvYcCVT/03K+6Skx3X9xGUCa47VFW2psEBIgQ7BAOX9H6bh7UDqm2bsVWBhJZHxZwpaYRy+N+jNT5MKdLc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzU2NsBY1TOycnPDHejDhj29IPfzMbIEIcyV+KvZBj8ZowyfwF7
	YNskLL9uoSXjeMSW4SSes4QYyiCJGPphGL/9ZG8jFk9BsaqXlg+Rvu6e
X-Gm-Gg: ATEYQzzMfpvKu2FNd+prTmsl0T5LD4dVr5LBwK6Taz7xJ3dC2cEiIusAVfrmRALFN56
	JmzZeJ9SXpzOVk8yoL/mHE/jQz6v2tgeZaxfddw+wRClWDSSQ5uSSQTAnPhBNpkd91hN5DGFyif
	cjBxAGdfE48o+5EyIahkb7I2ssGpQGd5TSbKeSqYgKBQEf8mJOfszqPn/E4TyOCVqt4waNI0viE
	Etg1ruemMzP4DQeD0I/Wl4azMrMmqtv8cFZR0aAX+idCMEzG98NpyDqj2joBiwPQrb8sJmWg6Jj
	UkLPzdAyVQ5ZirY4g/cjWpdrqHaqGuybW/YtvK1s5sT66jJycENS6NDjjSseC27WzTMXfKjXkHi
	5IkTZLsaCsI44y6JKFYTNlYV75s9sjx8aZpB/2mW9ywafm0jNRFdO9IpiIb8RLLjk3d/elxYBOb
	722OBOd/kpFNSautSqRLFpTRNv5gj2ZUrR7A4=
X-Received: by 2002:a17:907:982:b0:b97:5dc:3bd9 with SMTP id a640c23a62f3a-b99ae232b9amr182879166b.8.1774434836599;
        Wed, 25 Mar 2026 03:33:56 -0700 (PDT)
Received: from foxbook (bfk214.neoplus.adsl.tpnet.pl. [83.28.48.214])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9832f43c3bsm771151966b.2.2026.03.25.03.33.55
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Wed, 25 Mar 2026 03:33:56 -0700 (PDT)
Date: Wed, 25 Mar 2026 11:33:52 +0100
From: Michal Pecio <michal.pecio@gmail.com>
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: Mathias Nyman <mathias.nyman@intel.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Xu Rao <raoxu@uniontech.com>,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2] usb: xhci: Fix debugfs bandwidth reporting
Message-ID: <20260325113352.62919c91.michal.pecio@gmail.com>
In-Reply-To: <20260325113246.07681667.michal.pecio@gmail.com>
References: <20260304114928.110be4c4.michal.pecio@gmail.com>
	<d9ae5a8b-3aa0-451e-8a42-80ef73e2d210@linux.intel.com>
	<20260325113246.07681667.michal.pecio@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-35441-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michalpecio@gmail.com,linux-usb@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 3F9F332325F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Replace kernel USB speed numbers with xHCI protocol IDs expected by HW.
They are numerically equal up to high speed, but instead of SuperSpeed
we were querying SuperSpeed+.

Gen1 hardware rejects such commands with TRB Error, which resulted in
zero available bandwidth being shown.

While at that, report failures properly. No attempt made at "tunneling"
all possible comp codes through errno, debugfs users may inspect the
result through event-ring/trbs.

Signed-off-by: Michal Pecio <michal.pecio@gmail.com>
---

New in v2:
- print an error string instead of returning -EIO
- document known and sometimes unobvious error cases

 drivers/usb/host/xhci-debugfs.c | 10 +++++++---
 drivers/usb/host/xhci.c         |  9 ++++++++-
 2 files changed, 15 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/host/xhci-debugfs.c b/drivers/usb/host/xhci-debugfs.c
index 6cc0f60da771..da528d07b815 100644
--- a/drivers/usb/host/xhci-debugfs.c
+++ b/drivers/usb/host/xhci-debugfs.c
@@ -703,6 +703,10 @@ static int xhci_port_bw_show(struct xhci_hcd *xhci, u8 dev_speed,
 		seq_printf(s, "port[%d] available bw: %d%%.\n", i,
 				ctx->bytes[i]);
 err_out:
+	if (ret == -EIO) {
+		seq_puts(s, "Get Port Bandwidth failed\n");
+		ret = 0;
+	}
 	pm_runtime_put_sync(dev);
 	xhci_free_port_bw_ctx(xhci, ctx);
 	return ret;
@@ -713,7 +717,7 @@ static int xhci_ss_bw_show(struct seq_file *s, void *unused)
 	int ret;
 	struct xhci_hcd		*xhci = (struct xhci_hcd *)s->private;
 
-	ret = xhci_port_bw_show(xhci, USB_SPEED_SUPER, s);
+	ret = xhci_port_bw_show(xhci, DEV_PORT_SPEED(XDEV_SS), s);
 	return ret;
 }
 
@@ -722,7 +726,7 @@ static int xhci_hs_bw_show(struct seq_file *s, void *unused)
 	int ret;
 	struct xhci_hcd		*xhci = (struct xhci_hcd *)s->private;
 
-	ret = xhci_port_bw_show(xhci, USB_SPEED_HIGH, s);
+	ret = xhci_port_bw_show(xhci, DEV_PORT_SPEED(XDEV_HS), s);
 	return ret;
 }
 
@@ -731,7 +735,7 @@ static int xhci_fs_bw_show(struct seq_file *s, void *unused)
 	int ret;
 	struct xhci_hcd		*xhci = (struct xhci_hcd *)s->private;
 
-	ret = xhci_port_bw_show(xhci, USB_SPEED_FULL, s);
+	ret = xhci_port_bw_show(xhci, DEV_PORT_SPEED(XDEV_FS), s);
 	return ret;
 }
 
diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index e6edafdfcdb4..c86819afdede 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -3262,7 +3262,12 @@ void xhci_reset_bandwidth(struct usb_hcd *hcd, struct usb_device *udev)
 }
 EXPORT_SYMBOL_GPL(xhci_reset_bandwidth);
 
-/* Get the available bandwidth of the ports under the xhci roothub */
+/*
+ * Get the available bandwidth of the ports under the xhci roothub.
+ * EIO means the command failed: command not implemented or unsupported
+ * speed (TRB Error), some ASMedia complete with Parameter Error when
+ * querying the root hub (slot_id = 0), or other error or timeout.
+ */
 int xhci_get_port_bandwidth(struct xhci_hcd *xhci, struct xhci_container_ctx *ctx,
 			    u8 dev_speed)
 {
@@ -3291,6 +3296,8 @@ int xhci_get_port_bandwidth(struct xhci_hcd *xhci, struct xhci_container_ctx *ct
 	spin_unlock_irqrestore(&xhci->lock, flags);
 
 	wait_for_completion(cmd->completion);
+	if (cmd->status != COMP_SUCCESS)
+		ret = -EIO;
 err_out:
 	kfree(cmd->completion);
 	kfree(cmd);
-- 
2.48.1

