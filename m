Return-Path: <linux-usb+bounces-37805-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eFCtEZb1DWoz5AUAu9opvQ
	(envelope-from <linux-usb+bounces-37805-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 20 May 2026 19:55:34 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 668F7594ECB
	for <lists+linux-usb@lfdr.de>; Wed, 20 May 2026 19:55:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2A41B314A112
	for <lists+linux-usb@lfdr.de>; Wed, 20 May 2026 17:07:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EC403F88B5;
	Wed, 20 May 2026 17:05:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k+NaWKSC"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 605133F20FF
	for <linux-usb@vger.kernel.org>; Wed, 20 May 2026 17:05:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779296755; cv=none; b=MNrVuazzzNWcn3HBm7entzwW/fGnxdMB39+j4l5gIOv3eKz2ApmmN6D28xOewjiAew7/E5TmPfa3ET0D9n78/paEHYyY3MzxYNz9bew+PV8O9QioJgnpnGztZ96t6WO7DTL1eofrJsT454T6Jcak1Uy5+4garrAy9rgPh9P6edg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779296755; c=relaxed/simple;
	bh=1SCzkgF9PvsHxjb9lyI9BlvsZWUVe3Upe8UmE5OIpIM=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=WQ/KKHbz1x//XQE+CNjNj5YK0hnfIqxrn7YiLiY3/eeULT3Aopxyr7kKWZtHCRphTfMYwMirL9g7wmWH608Az+eIzqe7Hi5OkGnFlv1FXDM45dUUMkGpMHPtQfTSoJa07gGn5CXlK31QUtwpE9elzPMgmZE65uzGk+IuI/k1BRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k+NaWKSC; arc=none smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-304106b1204so1591433eec.0
        for <linux-usb@vger.kernel.org>; Wed, 20 May 2026 10:05:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779296753; x=1779901553; darn=vger.kernel.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sdTK9o9VO0ImBsZXUTs441nhBkuew2OXcA3OSkDKtdM=;
        b=k+NaWKSCh6pnbmfynib3aCB6b9N/ooxUFKJJWcbvGeJZ6QLUZAjcJtCiXLmo5/n5sP
         l23C52dy72uTU5K9oV5SBlOtP4RuvL4jyDiqUz6o082VEOtN8KfkMOxWJULvJhKfP7M1
         ZGQW/+cfwwjfqBEHa86RnmZkHSoRBktLQY40+crDbcVSlWLdFqgbcu/1bk6AnS9Q1Qhn
         nJar0LDcnbeGoehJSlgehhuclPUW2ce14eaZXSdV1nVZRmch+wcIMz0DhVNW4W6UFpJB
         SMTjvs/zoAuf9mKc2Wxq0WKyM0fn9UtsO8RMr2e2gm2fiFH+SJmd/xkHtgkwoL1eQ594
         qZUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779296753; x=1779901553;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sdTK9o9VO0ImBsZXUTs441nhBkuew2OXcA3OSkDKtdM=;
        b=KqmyF5jkQGsXbglJy37r0qBbD+swVI9ykAqZ7fu+bQpBQ9lqYmQ1MO6szUo3kN8BVZ
         +CYzWK3y/PtfVCFfxCbtXD/osCkO7yFIJF3msXsH3J8GWDMaRwaf4Rypb4KLDCGpLpVa
         +SVwFbUDcYfivA20OTGXYYNBSkakSmupbx9F9xhfJq4PjUdTQ5G1kf9EWK4gEdanzDsf
         w2W7JtveB7n/qWH44NMYBC/n2pfdhpgs+FPGqd+leQK+W9lyAiBpKMtgOUS9mgfUwK8D
         D0bqBA+ux6nwtIx6yazk+XPsbJksvSRl2vmnqY3u0kEy95Lzp2VXVbNeCCrr0RW9H+Nf
         GVew==
X-Gm-Message-State: AOJu0YzE6EQofo4VW7Eo599ilRJbm0W9QNHJMza/z1UisG4pnlZ1DHLQ
	0T5KVzLbYdI7mJ21Ie+FLYh3QC9VmDTpPMtrDUBME6dZ/YNoqnrEEGvYEdXFKurx
X-Gm-Gg: Acq92OFPLKQp3xzWh2HvnmKwKGri6XT9hbD0vE98Rt+edNA+GSiq+AjDm3yY7lQO6dU
	+3fQBVBICGqaiqwYOLpSmMBcj3zHiwZt8ndRENWygqzJaHDKs8/rdiDfvLpBRvJncv6PZjVVSTl
	y8XiVFqGEb7XMXYh0hKwB2SFjnIojTRYG+uc3+t9fU8iiWVA5CpblXEhMMr8gTN4DlIdapz6btR
	nKYNSt/uGSCIafoQzyWEvwHveWfTy2DxMTpnUIbHso09OoO9UowDNhat15KXZoIz3ivtv/eXM7v
	s6xTBR5f7tK7QOrMMPlrijGOR1nAI3d9qtfPuwHInf6jWvQl3U+GLVX1M7saBSWrHuF+zYMBv4y
	YxjNBQg8Z+d0oVLw/UstWohvyVj2YIjpRkFLrdpdLan8TNHQaI6Qd4yDNAO6dNGCtRMSscOMcWy
	usxF4tYQii+fq1VP68G6ckgDDRj7Lvq+V9AhF5TAWSgPXFKr7IzNleyQ8=
X-Received: by 2002:a05:7300:4307:b0:2ea:4228:ab11 with SMTP id 5a478bee46e88-3039818ef2emr10819087eec.3.1779296753450;
        Wed, 20 May 2026 10:05:53 -0700 (PDT)
Received: from smtpclient.apple ([2601:644:601:140:8505:5f30:f1:866b])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-302977a9474sm19275583eec.25.2026.05.20.10.05.52
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 20 May 2026 10:05:53 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81.1.4\))
Subject: Re: [PATCH] USB: EHCI: inflate max_tt_usecs and implement sitd
 backpointers
From: Brent Page <brentfpage@gmail.com>
In-Reply-To: <4C69D317-184B-470E-87E9-4337547C78DD@gmail.com>
Date: Wed, 20 May 2026 10:05:39 -0700
Cc: Alan Stern <stern@rowland.harvard.edu>,
 Michal Pecio <michal.pecio@gmail.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <705CFCA1-92BF-40E8-B036-3ECBD4F557F6@gmail.com>
References: <35666FD0-D108-41FD-8CE4-CD8F0DD87472@gmail.com>
 <4C69D317-184B-470E-87E9-4337547C78DD@gmail.com>
To: linux-usb@vger.kernel.org
X-Mailer: Apple Mail (2.3826.700.81.1.4)
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[rowland.harvard.edu,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-37805-lists,linux-usb=lfdr.de];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brentfpage@gmail.com,linux-usb@vger.kernel.org];
	RCPT_COUNT_THREE(0.00)[3];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	NEURAL_HAM(-0.00)[-1.000];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 668F7594ECB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


OK, a coherent set of additions/edits to the patch:
---
diff --git a/drivers/usb/host/ehci-sched.c =
b/drivers/usb/host/ehci-sched.c
index 7c2f2125d..04cf55484 100644
--- a/drivers/usb/host/ehci-sched.c
+++ b/drivers/usb/host/ehci-sched.c
@@ -1478,7 +1478,7 @@ sitd_slot_ok(
  } while (uframe < EHCI_BANDWIDTH_SIZE);
   stream->ps.cs_mask =3D mask;
- stream->ps.c_mask2 =3D c_mask2;
+ stream->ps.c_mask2 =3D c_mask2 << 8;
  stream->splits =3D cpu_to_hc32(ehci, stream->ps.cs_mask);
  stream->c_splits2 =3D cpu_to_hc32(ehci, stream->ps.c_mask2);
  return 1;
@@ -2242,7 +2242,14 @@ static void sitd_link_urb(
  sitd->stream =3D stream;
  sitd->urb =3D urb;
 - sitd_patch(ehci, stream, sitd, sched, i);
+       if(stream->ps.c_mask2 && (stream->ps.period!=3D1)) {
+           packet =3D i/2;
+           sitd->last_in_urb =3D i=3D=3D(2*urb->number_of_packets - 1);
+       } else {
+           packet =3D i;
+           sitd->last_in_urb =3D i=3D=3D(urb->number_of_packets-1);
+       }
+ sitd_patch(ehci, stream, sitd, sched, packet);
  sitd_link(ehci, (next_uframe >> 3) & (ehci->periodic_size - 1),
  sitd);
 @@ -2291,13 +2298,17 @@ static bool sitd_complete(struct ehci_hcd =
*ehci, struct ehci_sitd *sitd)
  int urb_index;
  struct ehci_iso_stream *stream =3D sitd->stream;
  bool retval =3D false;
+ bool                 has_ssplits;
   urb_index =3D sitd->index;
  desc =3D &urb->iso_frame_desc[urb_index];
  t =3D hc32_to_cpup(ehci, &sitd->hw_results);
+ has_ssplits =3D hc32_to_cpu(ehci, sitd->hw_uframe) & 0x00ff;
   /* report transfer status */
- if (unlikely(t & SITD_ERRS)) {
+ if(!has_ssplits) { /* just contains frame-hopping CSPLITS */
+    desc->status =3D 0; /* actual completion status reported by =
previous sitd */
+ } else if (unlikely(t & SITD_ERRS)) {
  urb->error_count++;
  if (t & SITD_STS_DBE)
  desc->status =3D usb_pipein(urb->pipe)
@@ -2317,7 +2328,7 @@ static bool sitd_complete(struct ehci_hcd *ehci, =
struct ehci_sitd *sitd)
  }
   /* handle completion now? */
- if ((urb_index + 1) !=3D urb->number_of_packets)
+ if (!sitd->last_in_urb)
  goto done;
   /*
diff --git a/drivers/usb/host/ehci.h b/drivers/usb/host/ehci.h
index c1c006bd3..6c9b6f390 100644
--- a/drivers/usb/host/ehci.h
+++ b/drivers/usb/host/ehci.h
@@ -583,6 +583,7 @@ struct ehci_sitd {
  dma_addr_t sitd_dma;
  dma_addr_t backpointer_sitd_dma;
  union ehci_shadow sitd_next; /* ptr to periodic q entry */
+   bool             last_in_urb;
   struct urb *urb;
  struct ehci_iso_stream *stream; /* endpoint's queue */
---

I configured my 1023-byte-endpoint peripheral to have a bInterval of 2 =
so that I could test the patch's period!=3D1 code.  The patch appeared =
to perform well for this case.  That said, the peripheral's endpoint is =
actually not that demanding because the number of data bytes per frame =
is only ~750.  It just has to set wMaxPacketSize to 1023 due to hardware =
limitations and the fact that 750>512.  So, I plan to conduct some more =
intensive tests requiring closer to 1023 iso-in data bytes and maybe a =
few interrupt bytes for good measure.

From,
Brent Page


