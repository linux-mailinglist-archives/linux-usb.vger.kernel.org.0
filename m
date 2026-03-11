Return-Path: <linux-usb+bounces-34526-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sONzKiMysWm0rwIAu9opvQ
	(envelope-from <linux-usb+bounces-34526-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 11 Mar 2026 10:13:07 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 63589260169
	for <lists+linux-usb@lfdr.de>; Wed, 11 Mar 2026 10:13:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8838D30269D5
	for <lists+linux-usb@lfdr.de>; Wed, 11 Mar 2026 09:12:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC87D3C0625;
	Wed, 11 Mar 2026 09:12:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="LF5uY5OZ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 064703C5DDB
	for <linux-usb@vger.kernel.org>; Wed, 11 Mar 2026 09:12:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773220363; cv=none; b=VHeihB1d7qNjbKxA6j/bB0U2A31Fm/ADkZ+laGagh2Ue7kTTPB2eyHMIel1sUvdrUMyvKjoGGyDs4837Sj9o1OoCXHGD7s1/93H+l71xkZfEL4SRpkZXeDDmjz89HCMIBUW7qTefDlhN5IeoVZX8BVB4bkTUlhCuLybG+bWOv+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773220363; c=relaxed/simple;
	bh=IuJEJeZeAA0dtPdJGCR2Y6So5KmMJbEcKNQPLePgIVk=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=bHzzxyoLXBtZtul+8hsk8krdeW8Rf30MfzKdxtCU+R/mHEuDlzF/dtZvhMmgZHJmR939dp/rBv4wzCcCab58kAraL6UiqKwACrybqk4Du9MPvM5JF945pCJbRWTZ9ysRn7nubor623vhXrjWLQEakNgtyea/QkvOXRMcXGDVS0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--khtsai.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=LF5uY5OZ; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--khtsai.bounces.google.com
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-2ae44db60c2so105230215ad.2
        for <linux-usb@vger.kernel.org>; Wed, 11 Mar 2026 02:12:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1773220354; x=1773825154; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=CfExovoAn7o/levAKL1G/GcHLpVojQhg0czDHj9L5ow=;
        b=LF5uY5OZctOYzLVhoMiE1XP6YQAez1/qTF8BV54ijBQQ9IYMmFWr2ZJuV3Rmw7mwh+
         7/m9R6bhH2rbCVvMeCVP+HpMEw4PA/HAh6BVbgBA9lTLxnsTBjSFQmfUEe2WZaEtTYPY
         xsL5cNPfZUNW/AakqiPO0RJ/cz8VKHQ0AZJQKIO5UrTEaRZeeKylrkfjFV0/vqjVO2np
         zKpF40JHapezhjIbxooK45UwFVW+Tlb4nQApYAxN74ZniyA2O9O7RYHNRkc3f+JpGUjD
         ptj1afAErakMZpfoahzIeeEpx1meQY3LhoXx4sFUwM4bbgWCpQgIMsbNuWii0LezIq8/
         ZC1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773220354; x=1773825154;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CfExovoAn7o/levAKL1G/GcHLpVojQhg0czDHj9L5ow=;
        b=as83YM2Rt+wp+Q2cAjeUuX5hg8gI5pxEfl4V6GjMIzJP2FsB32vJGWv6gI256SpZEc
         Hvr+KgZqsL/oBb73gpYKojKB4IfXXY/oulMwF0NtONvRaAaQkpsdsb5lf/5T3wQcyTqb
         3BeJELTMUlTfPnkcqZLXwNlFY7i0PXteE3z8zcNmpPXcOQHZsSPTO44gdaeUYv/of3gE
         CsEz7XsI5Lyzs94N5qQFM0SQ37Ej+7vapp4Rjw+Er0qUrpTXr+saCtMXGhOJDepb8snY
         L5Tlb2hVNh19MpLSemecAoNlEH4Mvy5kqIMt7B5Rvcq/EhQRBKflLJhS8yx0rIzZuG37
         OLTA==
X-Gm-Message-State: AOJu0YxNK+ZDeHGtb/sOTsiQYNmzsFyTO7tN9mlTINqQgImfE98FlKqP
	x+ziXEkZdEQbZqVyk/PEdwzDERPu0eXDn8rNR4SfMOWl7sUF8Evafb9CWE89VuIQj+aVdhT0OnJ
	ldq1cGQ==
X-Received: from pfbbk8.prod.google.com ([2002:aa7:8308:0:b0:829:753a:73c1])
 (user=khtsai job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:a110:b0:398:9b42:69f7
 with SMTP id adf61e73a8af0-398c60e40e9mr1761475637.39.1773220353942; Wed, 11
 Mar 2026 02:12:33 -0700 (PDT)
Date: Wed, 11 Mar 2026 17:12:15 +0800
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAO4xsWkC/x3MwQpAQBCH8VfRnE0ZIryKHLT7X+YytCspeXeb4
 +/wfQ8lREWisXgo4tKku2VIWZDbFlvB6rOpruquakR4xbkhstfkdjO4k+0At30nfugb8SFQbo+ IoPf/neb3/QAKuI/CZwAAAA==
X-Change-Id: 20260311-gether-disconnect-npe-5861d9831dff
X-Developer-Key: i=khtsai@google.com; a=ed25519; pk=abA4Pw6dY2ZufSbSXW9mtp7xiv1AVPtgRhCFWJSEqLE=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773220352; l=2489;
 i=khtsai@google.com; s=20250916; h=from:subject:message-id;
 bh=IuJEJeZeAA0dtPdJGCR2Y6So5KmMJbEcKNQPLePgIVk=; b=RULJ9mQMu2H/bZkTzSiCY3jQvdU2YAWixzuX8Ru1zDG+HqQwUttR/mnK7HLj9mn01Vabu+zY/
 I3rYDCiho2GBChi++LgedTLhr40Ti6DPsaTCvVbuYvZucu927qnf03s
X-Mailer: b4 0.14.3
Message-ID: <20260311-gether-disconnect-npe-v1-1-454966adf7c7@google.com>
Subject: [PATCH] usb: gadget: u_ether: Fix race between gether_disconnect and eth_stop
From: Kuen-Han Tsai <khtsai@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	David Brownell <dbrownell@users.sourceforge.net>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org, Kuen-Han Tsai <khtsai@google.com>
Content-Type: text/plain; charset="utf-8"
X-Rspamd-Queue-Id: 63589260169
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[google.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34526-lists,linux-usb=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[khtsai@google.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[google.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Action: no action

A race condition between gether_disconnect() and eth_stop() leads to a
NULL pointer dereference. Specifically, if eth_stop() is triggered
concurrently while gether_disconnect() is tearing down the endpoints,
eth_stop() attempts to access the cleared endpoint descriptor, causing
the following NPE:

  Unable to handle kernel NULL pointer dereference
  Call trace:
   __dwc3_gadget_ep_enable+0x60/0x788
   dwc3_gadget_ep_enable+0x70/0xe4
   usb_ep_enable+0x60/0x15c
   eth_stop+0xb8/0x108

Because eth_stop() crashes while holding the dev->lock, the thread
running gether_disconnect() fails to acquire the same lock and spins
forever, resulting in a hardlockup:

  Core - Debugging Information for Hardlockup core(7)
  Call trace:
   queued_spin_lock_slowpath+0x94/0x488
   _raw_spin_lock+0x64/0x6c
   gether_disconnect+0x19c/0x1e8
   ncm_set_alt+0x68/0x1a0
   composite_setup+0x6a0/0xc50

The root cause is that the clearing of dev->port_usb in
gether_disconnect() is delayed until the end of the function.

Move the clearing of dev->port_usb to the very beginning of
gether_disconnect() while holding dev->lock. This cuts off the link
immediately, ensuring eth_stop() will see dev->port_usb as NULL and
safely bail out.

Fixes: 2b3d942c4878 ("usb ethernet gadget: split out network core")
Cc: stable@vger.kernel.org
Signed-off-by: Kuen-Han Tsai <khtsai@google.com>
---
 drivers/usb/gadget/function/u_ether.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/gadget/function/u_ether.c b/drivers/usb/gadget/function/u_ether.c
index 338f6e2a85a9..2c970a0eafd9 100644
--- a/drivers/usb/gadget/function/u_ether.c
+++ b/drivers/usb/gadget/function/u_ether.c
@@ -1246,6 +1246,11 @@ void gether_disconnect(struct gether *link)
 
 	DBG(dev, "%s\n", __func__);
 
+	spin_lock(&dev->lock);
+	dev->port_usb = NULL;
+	link->is_suspend = false;
+	spin_unlock(&dev->lock);
+
 	netif_stop_queue(dev->net);
 	netif_carrier_off(dev->net);
 
@@ -1283,11 +1288,6 @@ void gether_disconnect(struct gether *link)
 	dev->header_len = 0;
 	dev->unwrap = NULL;
 	dev->wrap = NULL;
-
-	spin_lock(&dev->lock);
-	dev->port_usb = NULL;
-	link->is_suspend = false;
-	spin_unlock(&dev->lock);
 }
 EXPORT_SYMBOL_GPL(gether_disconnect);
 

---
base-commit: 1be3b77de4eb89af8ae2fd6610546be778e25589
change-id: 20260311-gether-disconnect-npe-5861d9831dff

Best regards,
-- 
Kuen-Han Tsai <khtsai@google.com>


