Return-Path: <linux-usb+bounces-37992-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yOarHWKpE2ptEgcAu9opvQ
	(envelope-from <linux-usb+bounces-37992-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 25 May 2026 03:44:02 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 17C235C53EC
	for <lists+linux-usb@lfdr.de>; Mon, 25 May 2026 03:44:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 31C5E3011580
	for <lists+linux-usb@lfdr.de>; Mon, 25 May 2026 01:40:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCFA125A2B5;
	Mon, 25 May 2026 01:40:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DpS/Mfgk"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43FE5266581
	for <linux-usb@vger.kernel.org>; Mon, 25 May 2026 01:40:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779673241; cv=pass; b=he82ni9M7E6V5Bi0KogtVCvkbPYTLVxKCVMGUW+/5++d+QpT/zpCgQ41qV0+aOAZvxc+c3oNdOMHdeiM4KoYg6f29tCMHR9YNdfd7YC3KqQSR6r3S5ZgBzHkhf9VsVt6Ul7VsT6iuzj6myK2Jo8JfBCC1hjre6X4sSwjGlfQFGg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779673241; c=relaxed/simple;
	bh=6UQYl6eyZKUqMGH6/peysjFpMQP0SkbcM7BEOOu9bXc=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=VGGFwa115N8ASuEsgzto5ngW2pMAHf+Sezmbtw4Y4d2jxdq38XgVkozBLQZisEIoO2AOW41NH/hiQQOnrD/mLusf3i/DBRUluMs9nl+UeerCNZphism1rY4KOfQZdmhVc53wP43QgqlBJdaXe/7zOKeiD1kfc8elyDRamcsTKuY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DpS/Mfgk; arc=pass smtp.client-ip=209.85.210.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-7dcd17e19b6so5104734a34.1
        for <linux-usb@vger.kernel.org>; Sun, 24 May 2026 18:40:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779673237; cv=none;
        d=google.com; s=arc-20240605;
        b=b0Q3M/sO3mx0/wRkZUesZ/oAfqBCgZp6l+wRPGT83o/IJEHGGM0o94zhot2CfsSU6A
         49Z4aMSXf85xHcP7T1hGLgWCxoY7o6QHiFzSeEi84LHApBa6youlm3GzFx5jVduJi02h
         8c4p/b79DdcYLf9EgMdMWl5Nrd1osIPQZOTkDhORCrExkN+rcu3zUK05auH38fUkQraW
         BiiWVEVasGVZFa9/7cQ9PNX0BVUXj/MKp19gXXNDNGzinWdL2lvEF+pMS9eVr1SbAMKk
         mlksSNqHVcMeimJrnlzwQiMjMboeooLSfcCUHuxAZXzc7tl9RqiMq4XkR40jkQ6Z+zu1
         8R9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=K4k2OI+VB/Cd/340XtOgFH11SKShimTJe8JRAHnx0M0=;
        fh=bwmdJdIbjmesu1h4+tgssMEuLap7khrJGyMMdzVP/Nk=;
        b=EyfF69L1ayO0cosMjyZgoeSyiwfXB2G6yc9byMi10LBcBvJV2OL27nlqPDZSXRAJVe
         j+HbZ1tSCt6LMmEcL67i9GgPAKBkPtRePQkRm1jE6T3B9LMMonBYOmy6WnCZmfRJUMUg
         1riOjPKJuQqMsKLio4oFVjP9aDchLsLDcBR5vo9gIhQ7CirPoxHMzhL54l2uXOiAzo3C
         7ro//sjHnkn8WtR89IPqqzf7vM90YdlYLwHI7Yk9DNfYQMMq+0/CKqHTzDSrp1ci7rvG
         MiffHyzz6nahAhNqD7JeB9GBH+R8L/uhUyxByprWAaTcQwPx2WsK4JUHP407SJ1hvWFG
         urdA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779673237; x=1780278037; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=K4k2OI+VB/Cd/340XtOgFH11SKShimTJe8JRAHnx0M0=;
        b=DpS/MfgkBuVxiEs/VnzZSTGWOSMSnolaOMHFLerAUAuSMdARikZzPg+oEHNwsUhWQG
         N1KMoA/Iz11KaCldtMjU+XO6QcYxuvzw2cssi71DEIqm7gCsM/JxPUhZ8VjHWtutCB6g
         uotJ9AFn/qKUSo0YIl163ah6lZ2TIqW9sgofgLqvdbUD+gHtPyoJ6rDvvnUqskOSdIpx
         1wT3WwbUclAtvGByeekZd1/CfWCTNlNl8qwVMiZiD829eQvJJoiHAF6Ljpx28tEQTcvx
         WiuUaEzW4Vf3tyG/gcU3kMjdhxlk4b50AgdYkdtN21OqSJ9GL8OT4eNjDGoyKYPknG48
         yWhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779673237; x=1780278037;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=K4k2OI+VB/Cd/340XtOgFH11SKShimTJe8JRAHnx0M0=;
        b=iwkJPOjO7aa/ur8bl8slGf6zxxBZm8bVwvEod1sf8bDYqt5c77gId/xo5rQdf/yNFn
         4Dwu+IoAlh5s/AZW/kP0zdoOGowcjvkIY9QYhgz68G0aDkC4TSY+uyhXhhcNNigmIPFN
         LRbcrs/g8C/mmfTH26zkM+yn9NEcJONhy1594T4/4LeObi7UpcoFhHoFIH0LCCljhy+9
         aMRHWX5LqosSCYwKgMtPIPKyOlff9fxULHQbuCJ2mGpvJyiwUBmA13CJQ3PtC4x8YI/2
         iLsIzbQbIM60EeehTO0z/eWt5FMSQ1ZDyc6eJ3NuT6GqSXXeMbtvMU9kKeMtkLnzIn6c
         nnNA==
X-Gm-Message-State: AOJu0Yw5/0T+o2egSSiq3Oh1CmUun/69bwF7xhtDCn1BxToO7sa20P1L
	aX6dOo+y+q9UspvRPQeZyteOrDegroOw9YL8XNB7wQALqIzFepkwPEuUiUFcc+a1+H2V7fHijHD
	3MgHPs8fwcQwUbgXacjcdpZZYALHBswJIME8LnD8=
X-Gm-Gg: Acq92OEj0HP9ru2tXrlP0MI5vnc2Z9FJSLCxotX3ZVpB//Iolxnln9ONRuLX0X5L80O
	OfGolNofi8fPSx7QM1Twm16uQL/Dh4TEEBShZD91OTEJkxVxzkOqnWWds9at0ww1Ubb2N/q2khF
	tiHgc430DLCYgYOErRzIrJe/y/8Kic0ypafc7MD01guUqrjLmh/tblhC3ihFoqABgvbGMbwLz5c
	zxj6uhKMKQ6WHlHznPywvEe0ful2iUmHnqyg8MmTR+sT0oCo0qy2iP7Er/KK0UGeoqLE5v6Z4Bf
	Pb81H0Enrj96tE1WtuYUsiwotdBtetRxCJYLVcg72eBB68SlGaSGrKL+E0rumYhj+gJmVdl1onb
	XmQIRxoc2
X-Received: by 2002:a05:6830:349f:b0:7db:b5c9:2d87 with SMTP id
 46e09a7af769-7e5fee043cfmr7877198a34.11.1779673237501; Sun, 24 May 2026
 18:40:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Adrian Korwel <adriank20047@gmail.com>
Date: Sun, 24 May 2026 20:40:25 -0500
X-Gm-Features: AVHnY4IEtPryaTDGKIZaZ8ti5SbwQ19IRaMf9WSH0deAGqTVlZnt5GnBAPEKZTg
Message-ID: <CADgB2mE=WX_PxArBp40WpmQ-qQpbuxDRRE0TRg7Be_zGyuRqig@mail.gmail.com>
Subject: [PATCH] usb: gadget: f_midi: cancel work before midi is freed
To: linux-usb@vger.kernel.org
Cc: gregkh@linuxfoundation.org, stable@vger.kernel.org, dave@stgolabs.net
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37992-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	TO_DN_NONE(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[adriank20047@gmail.com,linux-usb@vger.kernel.org];
	RCPT_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 17C235C53EC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Adrian Korwel <adriank20047@gmail.com>

f_midi_disable() disables the USB endpoints but does not cancel the
pending work item before returning. Since f_midi uses the system
high-priority workqueue (system_highpri_wq) rather than a dedicated
workqueue, there is no implicit draining when the function is unbound.

The work item f_midi_in_work can therefore be scheduled via
queue_work() from f_midi_complete() or f_midi_in_trigger() and execute
after f_midi_free() has run, resulting in a use-after-free when
f_midi_transmit() accesses midi->in_ep, midi->transmit_lock,
midi->in_req_fifo and midi->in_ports_array.

This was introduced in commit 8653d71ce376 ("usb/gadget: f_midi:
Replace tasklet with work") which converted from tasklet_hi_schedule()
to queue_work() but omitted the cancel_work_sync() call needed to
ensure the work is not in flight when the structure is freed. Tasklets
did not require explicit cancellation in this path; workqueues do.

Fix by calling cancel_work_sync() in f_midi_disable() after disabling
the endpoints, ensuring no work item referencing midi can run after
teardown begins.

Fixes: 8653d71ce376 ("usb/gadget: f_midi: Replace tasklet with work")
Cc: stable@vger.kernel.org
Signed-off-by: Adrian Korwel <adriank20047@gmail.com>
---
 drivers/usb/gadget/function/f_midi.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/gadget/function/f_midi.c
b/drivers/usb/gadget/function/f_midi.c
index 4d9e4bd700d8..864527bf900c 100644
--- a/drivers/usb/gadget/function/f_midi.c
+++ b/drivers/usb/gadget/function/f_midi.c
@@ -430,6 +430,8 @@ static void f_midi_disable(struct usb_function *f)
        usb_ep_disable(midi->in_ep);
        usb_ep_disable(midi->out_ep);

+       cancel_work_sync(&midi->work);
+
        /* release IN requests */
        while (kfifo_get(&midi->in_req_fifo, &req))
                free_ep_req(midi->in_ep, req);
-- 
2.43.0

