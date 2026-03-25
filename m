Return-Path: <linux-usb+bounces-35442-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YBeiGNq8w2kRtwQAu9opvQ
	(envelope-from <linux-usb+bounces-35442-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 25 Mar 2026 11:45:46 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D218C3233C8
	for <lists+linux-usb@lfdr.de>; Wed, 25 Mar 2026 11:45:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9E29C30C0712
	for <lists+linux-usb@lfdr.de>; Wed, 25 Mar 2026 10:34:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9A703B9DB7;
	Wed, 25 Mar 2026 10:34:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZLIh/JkK"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F95F3B8BBF
	for <linux-usb@vger.kernel.org>; Wed, 25 Mar 2026 10:34:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774434889; cv=none; b=Z94TlErwW3WFHDUij33XJRpVWVNOM4Z2mktAa4waDB+uscPQPBXxbJRuePT/JlUpqUofxOi1PXjyjZaWiCErh/6/8N9W+JR6RWzjfyvfZgdUdi9fpl1nqcm+cAbhRtzVBTQyb94clozACxjogHkoCOnUpiUBc+psKa8kODKtZZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774434889; c=relaxed/simple;
	bh=hdqvN8dbIVMYYR3KmJ72pADuTcifzKiscaN6z4J415I=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=usCsmF3bdNnSj56rXmHAl9CcH83jA+okwpjdtNUhyUDivd1nmbBBhzn/d161/I2KVeOyjRvYqCynk7tv4vhgN5+Ms1n8xsFaozhqv8EEI751LyBE+Q5n1KIcczKxNPYJ02Uhk2Q1mgPqyAjw9BRtg/W8q1ibb30kVA2ZKPVs3Vo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZLIh/JkK; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b976536806cso952101966b.0
        for <linux-usb@vger.kernel.org>; Wed, 25 Mar 2026 03:34:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774434885; x=1775039685; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=spsunTQ1jn61nQrCZCSca5bTUZV0NZxZvfA/zQfYZcw=;
        b=ZLIh/JkKXwELVsi2G6pmi6Km8YEw5YbuH+DbkDUbDBJN+qBOguT05ODkKFGgVMNxQe
         AyvBW8k+aH2Pfu54C3/O1rym9TMLhYUg42sLK5FXJSrK9Ezm+xDGc7bWzXOK8l79CqJo
         /0upwXFSez/U7z9WTVexkis4xRg6zUd5QWQIQt8vhsS37UupbcOKs/B6C0KoyVBneUco
         7UVtSNkpQoW3hY5WBfcb4LPQjQwgBmuhy2S+rdXsHBol0oyrlx9VQh+tmiJOLNep0Cvt
         koUE4FPkhbqaIVr/CYDXZeliexl05+UyAiOWeetvpDEZhUkog1VB2BXovKnJ1MNh86pd
         hAGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774434885; x=1775039685;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=spsunTQ1jn61nQrCZCSca5bTUZV0NZxZvfA/zQfYZcw=;
        b=TmP3AOWkZaOcFWJDwk96QLEXLQXknUCrrBbpNMImtVJJnxMLzx03bX8jrbUbvnyXA6
         7ueSs5hqLEZ/X9ogFb19/T845SQ+r9Em910pgspfy2jISFsH0ul4S+3C8d9lVBklV7GO
         HXau+sAEH7D2/BKmdqh4aYudkq/Mba456ArGbI4LdqhUh867NPSk4aCoiMRVFGWf3SIl
         EfYDz1OizC9+gQJqfRrgIWNB9KN/uytab2LDPaURtkiEFLeXOAZDtOG+sZ/e7HxDi9A9
         4QkbJRsrOQelhX4wqqhqnMGLJJrSKIxU/YY4S4Ke3OHJezHMfpv4RZyEzioNFuLwMgmU
         oDbQ==
X-Forwarded-Encrypted: i=1; AJvYcCUke9/HjclKj8YbLBZdd3+OJPuQGXIk4Ncdb0zijnm3DaeoCHJVuS4ivFEptVvGGnsjz+j5WoetX7U=@vger.kernel.org
X-Gm-Message-State: AOJu0YxVlF7Nu9J9qnpDA3vfikx55kkhsWrIYtqf2ff4qT2BGInC3rK+
	sr1AvSmn4/EL2qzwVip704A0/UWAZOqz8FlZIHxNtGieM6+vz9zArp1c
X-Gm-Gg: ATEYQzz6CHgs8jeHV/M9iHf3BbTKl+N1mAyNikxS9Z+t0o6xZDL4f3TtRFskw3vMXVv
	fAJ37RxISS+maxlTj4wk/7wrYRSVBYWJFvis/hXaw/7gtV4Mlq1dJ4tKr/0lD1qzmUeTYAq60jt
	pgyxXrZSNkHxtohkkXEmD5zYRrBYmq+epNxH0xD55vLjSqS+doeIrS1HohfPXvGksdbtorf5hJO
	5hVa0jSokmvBp1DU64QOnYhmM4lQtQHRs7CuXHxnysFHh51dB876NiIkfxE5ls9bETS2d4rDopK
	2sHCpceZn7AfD5PXyzX0E19lX/EHkfr/OY7ttEXafZkXYlXgAhF0r0MtzYyW74GAmGVPoG+DewB
	V+ZkXf7T/fVwEj6Sxhr8RNX/sP3eY27aLZVncfyjzV7TWwRAqaXn1r/Cc4N0usIIfyRJbZmx7g2
	97Ff3NM0VUY3Mk2s/f9XMWILJADohVOWLcQoo=
X-Received: by 2002:a17:906:416:b0:b97:306a:cb56 with SMTP id a640c23a62f3a-b9a3f1b21c7mr125602766b.22.1774434885365;
        Wed, 25 Mar 2026 03:34:45 -0700 (PDT)
Received: from foxbook (bfk214.neoplus.adsl.tpnet.pl. [83.28.48.214])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b98335de182sm759613666b.38.2026.03.25.03.34.44
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Wed, 25 Mar 2026 03:34:45 -0700 (PDT)
Date: Wed, 25 Mar 2026 11:34:42 +0100
From: Michal Pecio <michal.pecio@gmail.com>
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: Mathias Nyman <mathias.nyman@intel.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Xu Rao <raoxu@uniontech.com>,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3] usb: xhci: Fix debugfs bandwidth reporting
Message-ID: <20260325113442.07cc2976.michal.pecio@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-35442-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michalpecio@gmail.com,linux-usb@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: D218C3233C8
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

Rename port_bandwidth to port-bandwidth for consistency with others.

Signed-off-by: Michal Pecio <michal.pecio@gmail.com>
---

New in v3:
- rename port_bandwidth to port-bandwidth

New in v2:
- print an error string instead of returning -EIO
- document known and sometimes unobvious error cases

 drivers/usb/host/xhci-debugfs.c | 12 ++++++++----
 drivers/usb/host/xhci.c         |  9 ++++++++-
 2 files changed, 16 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/host/xhci-debugfs.c b/drivers/usb/host/xhci-debugfs.c
index 6cc0f60da771..55778c8cab78 100644
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
 
@@ -767,7 +771,7 @@ static const struct file_operations bw_fops = {
 static void xhci_debugfs_create_bandwidth(struct xhci_hcd *xhci,
 					struct dentry *parent)
 {
-	parent = debugfs_create_dir("port_bandwidth", parent);
+	parent = debugfs_create_dir("port-bandwidth", parent);
 
 	xhci_debugfs_create_files(xhci, bw_context_files,
 			  ARRAY_SIZE(bw_context_files),
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

