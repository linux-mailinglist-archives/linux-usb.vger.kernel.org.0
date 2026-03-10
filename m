Return-Path: <linux-usb+bounces-34500-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EOxvKuOFsGk5kQIAu9opvQ
	(envelope-from <linux-usb+bounces-34500-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 10 Mar 2026 21:58:11 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B3042580F9
	for <lists+linux-usb@lfdr.de>; Tue, 10 Mar 2026 21:58:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 50B8A3198C90
	for <lists+linux-usb@lfdr.de>; Tue, 10 Mar 2026 20:57:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 247153A6405;
	Tue, 10 Mar 2026 20:57:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="FEiEFbT8"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1670C3ACF04
	for <linux-usb@vger.kernel.org>; Tue, 10 Mar 2026 20:57:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773176231; cv=none; b=soFqHYpKHfWVDiWt1m6fGF9tRFLhgbcUuvazQbBRhAIJWywTeuWjLdZg/S5mrxG78cXZjFi6DPkfP+MXfcb5tAXlfiv/JIDgFi4CCt1kS+Spx+cLJuEVODeX53J5UG9xyqZI4y0O6X+qdVNhsPPfz5BFkjN5YlYDgTKf0dsHfqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773176231; c=relaxed/simple;
	bh=4cT/jwrcV8LVG6OSlx6IfVMiTJ6TX4BNoiyNTzoyBkA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sDxNtjB7lB2FrQ6f3DeHBccGOLtrOv+aLfh0Azu4lvVgxlzAn6hWXynPCbZBldsyh/mn0fydNSAGP5MTtuCKzxO/npFYR4duBmgnmUpgJ1cCGLm5gvDbZ8n14G0nFjFdGTSFyzxa7JdRXcsyMglCslhf81gNjrupB450Jh3pCSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=FEiEFbT8; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-b93698bb57aso53638866b.0
        for <linux-usb@vger.kernel.org>; Tue, 10 Mar 2026 13:57:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1773176228; x=1773781028; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=kSc4dq5MUmqJ3d2P0LjD1A3NlZrm65flx5lzHj2Pir4=;
        b=FEiEFbT8Np9s/mzL/h8h9KkhEqL0tOPUqlAjxmfPL7YpQxk5qqsBDfHI6gnyYAtZFK
         0MYMf0GXBC40n9mDdu0tQzWRSwis55wPzAKrAs6PI7N69Q8gkbkbdQ70lrAmjIgCpqQ+
         JwF2uRTBcnM2lhAxJL8WrCyaVAm+kwYbqMcWo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773176228; x=1773781028;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kSc4dq5MUmqJ3d2P0LjD1A3NlZrm65flx5lzHj2Pir4=;
        b=FKH6xlULCQDR2vWLs04lssDIE969fEEiZQAovue5Wm+tzAn38EeYSIPyGYCadosShD
         JUrYpvyLFzEay7mtgJSyznV1vSUL4tqpiwq19fTPJlcWSGKRY7i+RgYX5OS6y/bB+SiR
         D2KmEpCoi3Fun58Qc/WFIzWgf1OXnHx2mweZz7YuYAKzr9wH129tRQSsFqjPHzKS9a8G
         qVjfPqAp5hCxJ+w2GUkF++wr+YvaGzAhKkOWpm1jkRevhG1p5xkzj+xDGKTZV3SkIP9h
         LEsIqGOjze2ITOx0H8Y2O5/mV/vz9UegMJ0qJokysszXE79OMT1vC/2eDD/ObfU8wSig
         w9aw==
X-Forwarded-Encrypted: i=1; AJvYcCX4FJZN6wDY8KNltVZt1bHPRrIjnhc+1wZIX7c2xNRcfbTLUKv3oTUk9hyKzcmUzyUJbdnf08BsyOA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxOhsQD53viT0M+xlQDmTEuuMHq2hUiXzaGJPmV1fGbkU8zrvBi
	mGQ4+xhXwwosRrS4nTlxp0+TTsNgcxv0QpM1vZmXVKlH1E7owZxf99vl+0OSfHo16R7/UPYlBW7
	LNhuPlw==
X-Gm-Gg: ATEYQzzAQpp/T43uchOgJKQPNzB5bZ2OCYdIvrgBT3C7Yi2eLwXjGbybzkbHb3dC4n0
	RbhadcHnnxzg1pGbpksC0yfWlIaqliPkEbFHWamJKQqakFaV3D/qxlGM6dpaN4Kx5p7ATSyXbP5
	TosXK8ILlNuQHndCY/ZC9Og/+6bLdqwzElfOep+0g+y51rc76W73GL8EkcmDsClG+AOPKl1DJv6
	stlrw5kfGARzzXyrWnYWhGkapL48UiUpJrOusK+EYcHgYfkHw5/2q/Hw2W4RwhadDHMzNJzq5r2
	MIx9wm0vpQhI/Ncs4u/VCMFFMxqMmgDWbfNoUK5LdEADAkdPE3qMlb92+yaKx9JmFDPsb7WDefe
	wWpET2RCAubB93X62AdMytlxaPWzG0BLiPuTgnRauu4s6Y2b3y0gMukq+WVPsocu5hf3MbZnTXq
	gYMvcAKHT+Y6NKJZZIL+9Txmb3zxtNQWafDRelur76OyWGIF7ISQey7o0ilzpK
X-Received: by 2002:a17:907:d649:b0:b94:827:c580 with SMTP id a640c23a62f3a-b9711850fc4mr302237866b.6.1773176227814;
        Tue, 10 Mar 2026 13:57:07 -0700 (PDT)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com. [209.85.208.42])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b972de08c96sm762766b.7.2026.03.10.13.57.07
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Mar 2026 13:57:07 -0700 (PDT)
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-660ea6ceb5aso498868a12.0
        for <linux-usb@vger.kernel.org>; Tue, 10 Mar 2026 13:57:07 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUC5pbWLuhWv5iVF/S+8KBOWJlIlcoSeaUyq680GBCRssYwjxt71iOFMmVPbMq84d+4E+oEh9tXZps=@vger.kernel.org
X-Received: by 2002:a17:907:d0a:b0:b8a:e013:9c5b with SMTP id
 a640c23a62f3a-b972d3d0198mr7390166b.4.1773176226334; Tue, 10 Mar 2026
 13:57:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <6733bdfb-3e88-479f-8956-ab09c04c433e@linux.dev> <fba86ac0-e13e-4c54-9515-c091b24f9f80@linux.dev>
In-Reply-To: <fba86ac0-e13e-4c54-9515-c091b24f9f80@linux.dev>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 10 Mar 2026 21:56:54 +0100
X-Gmail-Original-Message-ID: <CANiDSCtLj-N+M+JmP3C_y=vNtSy-UN7XtkXaZ=dLN6f0kd7rYg@mail.gmail.com>
X-Gm-Features: AaiRm52L-3CdDUlW4ddDCKvcPAUyRlLkRbbVnGwrXwgSb9y1qKmzj0cwSOaFOSk
Message-ID: <CANiDSCtLj-N+M+JmP3C_y=vNtSy-UN7XtkXaZ=dLN6f0kd7rYg@mail.gmail.com>
Subject: Re: [BUG] uvc_status_stop hangs if called from async_ctrl.work
To: Sean Anderson <sean.anderson@linux.dev>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans de Goede <hansg@kernel.org>, 
	linux-media@vger.kernel.org, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: 0B3042580F9
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34500-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[chromium.org:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ribalda@chromium.org,linux-usb@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-usb];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.dev:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,mail.gmail.com:mid]
X-Rspamd-Action: no action

Hi Sean

Thanks for the report.

I have not been able to repro with qv4l2 on my computer :(.

Could you try if this patch works for you? Not saying that it is
beautiful patch, or the way to do it.... but it will let me know if I
am looking in the right place.


diff --git a/drivers/media/usb/uvc/uvc_status.c
b/drivers/media/usb/uvc/uvc_status.c
index 231cfee8e7c2..cca2aed162c3 100644
--- a/drivers/media/usb/uvc/uvc_status.c
+++ b/drivers/media/usb/uvc/uvc_status.c
@@ -340,7 +340,9 @@ static void uvc_status_stop(struct uvc_device *dev)
         * Cancel any pending asynchronous work. If any status event was queued,
         * process it synchronously.
         */
-       if (cancel_work_sync(&w->work))
+       if (&w->work == current_work())
+               cancel_work(&w->work);
+       else if (cancel_work_sync(&w->work))
                uvc_ctrl_status_event(w->chain, w->ctrl, w->data);

        /* Kill the urb. */
@@ -352,7 +354,7 @@ static void uvc_status_stop(struct uvc_device *dev)
         * cancelled before returning or it could then race with a future
         * uvc_status_start() call.
         */
-       if (cancel_work_sync(&w->work))
+       if (&w->work != current_work() && cancel_work_sync(&w->work))
                uvc_ctrl_status_event(w->chain, w->ctrl, w->data);

        /*

On Tue, 10 Mar 2026 at 21:11, Sean Anderson <sean.anderson@linux.dev> wrote:
>
> On 3/10/26 15:57, Sean Anderson wrote:
> > uvc_status_stop can be called from uvc_ctrl_status_event_work:
> >
> > ============================================
> > WARNING: possible recursive locking detected
> > 6.19.6 #5 Not tainted
> > --------------------------------------------
> > kworker/3:1/59 is trying to acquire lock:
> > ffff8b6685d71e28 ((work_completion)(&dev->async_ctrl.work)){+.+.}-{0:0}, at: __flush_work (kernel/workqueue.c:3985 kernel/workqueue.c:4239 kernel/workqueue.c:4271)
> >
> > but task is already holding lock:
> > ffffd3e4c0387e40 ((work_completion)(&dev->async_ctrl.work)){+.+.}-{0:0}, at: process_scheduled_works (kernel/workqueue.c:3252 kernel/workqueue.c:3359)
> >
> > other info that might help us debug this:
> > Possible unsafe locking scenario:
> > CPU0
> > ----
> > lock((work_completion)(&dev->async_ctrl.work));
> > lock((work_completion)(&dev->async_ctrl.work));
> >
> > *** DEADLOCK ***
> > May be due to missing lock nesting notation
> > 5 locks held by kworker/3:1/59:
> > #0: ffff8b668004fb48 ((wq_completion)events){+.+.}-{0:0}, at: process_scheduled_works (kernel/workqueue.c:3251 kernel/workqueue.c:3359)
> > #1: ffffd3e4c0387e40 ((work_completion)(&dev->async_ctrl.work)){+.+.}-{0:0}, at: process_scheduled_works (kernel/workqueue.c:3252 kernel/workqueue.c:3359)
> > #2: ffff8b66858524a0 (&chain->ctrl_mutex){+.+.}-{4:4}, at: uvc_ctrl_status_event (drivers/media/usb/uvc/uvc_ctrl.c:1955) uvcvideo
> > #3: ffff8b6685d71d90 (&dev->status_lock){+.+.}-{4:4}, at: uvc_status_put (drivers/media/usb/uvc/uvc_status.c:407) uvcvideo
> > #4: ffffffff86cefac0 (rcu_read_lock){....}-{1:3}, at: __flush_work (include/linux/rcupdate.h:331 include/linux/rcupdate.h:867 kernel/workqueue.c:4213 kernel/workqueue.c:4271)
> >
> > stack backtrace:
> > CPU: 3 UID: 0 PID: 59 Comm: kworker/3:1 Not tainted 6.19.6 #5 PREEMPT(full)  4105649303813dfd90b7c3b8911a9bfd5ad160d7
> > Hardware name: SECO S.p.A. C93/C93, BIOS 1.12.02 Corinne 04 07/03/2025
> > Workqueue: events uvc_ctrl_status_event_work [uvcvideo]
> > Call Trace:
> > <TASK>
> > dump_stack_lvl (lib/dump_stack.c:124)
> > print_deadlock_bug (kernel/locking/lockdep.c:3044)
> > __lock_acquire (kernel/locking/lockdep.c:3897 kernel/locking/lockdep.c:5237)
> > lock_acquire (kernel/locking/lockdep.c:470 kernel/locking/lockdep.c:5870 kernel/locking/lockdep.c:5825)
> > ? __flush_work (kernel/workqueue.c:3985 kernel/workqueue.c:4239 kernel/workqueue.c:4271)
> > ? mark_held_locks (kernel/locking/lockdep.c:4325)
> > ? __flush_work (kernel/workqueue.c:3985 kernel/workqueue.c:4239 kernel/workqueue.c:4271)
> > __flush_work (kernel/workqueue.c:3986 kernel/workqueue.c:4239 kernel/workqueue.c:4271)
> > ? __flush_work (kernel/workqueue.c:3985 kernel/workqueue.c:4239 kernel/workqueue.c:4271)
> > ? __pfx_wq_barrier_func (kernel/workqueue.c:3794)
> > __cancel_work_sync (kernel/workqueue.c:4429)
> >  uvc_status_stop (drivers/media/usb/uvc/uvc_status.c:343 drivers/media/usb/uvc/uvc_status.c:322) uvcvideo
> >  uvc_status_put (drivers/media/usb/uvc/uvc_status.c:408) uvcvideo
> >  uvc_pm_put (drivers/media/usb/uvc/uvc_v4l2.c:47) uvcvideo
> >  uvc_ctrl_clear_handle.isra.0 (drivers/media/usb/uvc/uvc_ctrl.c:1939) uvcvideo
> >  uvc_ctrl_status_event (drivers/media/usb/uvc/uvc_ctrl.c:1959) uvcvideo
> >  uvc_ctrl_status_event_work (drivers/media/usb/uvc/uvc_ctrl.c:1996) uvcvideo
> > process_scheduled_works (arch/x86/include/asm/jump_label.h:37 include/trace/events/workqueue.h:110 kernel/workqueue.c:3281 kernel/workqueue.c:3359)
> > worker_thread (kernel/workqueue.c:3440)
> > ? __pfx_worker_thread (kernel/workqueue.c:3386)
> > kthread (kernel/kthread.c:463)
> > ? __pfx_kthread (kernel/kthread.c:412)
> > ret_from_fork (arch/x86/kernel/process.c:164)
> > ? __pfx_kthread (kernel/kthread.c:412)
> > ret_from_fork_asm (arch/x86/entry/entry_64.S:256)
> > </TASK>
> >
> > The task will wait forever for itself. This causes all future UVC status
> > accesses to block with TASK_UNINTERRUPTIBLE and will prevent removing
> > the UVC device (and this a clean shutdown).
> >
> > I can reliably induce a hang by running qv4l2 and changing any control
> > (but guvcview seems fine).
> >
> > --Sean
>
> +CC Ricardo since he seems to have worked on this area in the past



-- 
Ricardo Ribalda

