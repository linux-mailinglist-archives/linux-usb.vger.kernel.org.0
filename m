Return-Path: <linux-usb+bounces-34834-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kBurK+76tmmmLAEAu9opvQ
	(envelope-from <linux-usb+bounces-34834-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sun, 15 Mar 2026 19:31:10 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EE039291EE7
	for <lists+linux-usb@lfdr.de>; Sun, 15 Mar 2026 19:31:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 61BBD301AE4A
	for <lists+linux-usb@lfdr.de>; Sun, 15 Mar 2026 18:31:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E58DE372EEF;
	Sun, 15 Mar 2026 18:31:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="bTcRWsoI"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30BFC3B2A0
	for <linux-usb@vger.kernel.org>; Sun, 15 Mar 2026 18:31:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773599465; cv=none; b=JpjeFUUeoihLi64Muu3aYpRpvzz3JJCtMbZvJy98/YFRh9J2pNmFALFZbLQHkKEuDCSRpuiy8A8xywsJsZbEm1l1E3fG7OfKnhcrXmjEeIG/bJC6uvoLotWvmNHm2ZKTlXdMVFuryf30H1eqdGb9VuuFBY2nla/xSSkzy5YKDcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773599465; c=relaxed/simple;
	bh=xCmQUqN/4Q+4Zi2EtltxM6MBUZd/RcowJgNQFbE0ods=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=lktb8dneG+uuFBVX3/qCwLP0Ptka1w73LTVNHRQfp/JQyjWoksc3C5KNzp0jt6L7xc2JDGCVid/d0NqV7zoyu1cmCg4WtKQPdWmVL99peXGpBHOQfoXSENpK7ZGwA5XhIXIL84OERyTiH1Wevawx0a6eBWnmBxdYAwhzZF2PhTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=bTcRWsoI; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-5091d71aa11so50427311cf.1
        for <linux-usb@vger.kernel.org>; Sun, 15 Mar 2026 11:31:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1773599463; x=1774204263; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RfaSUznmYmsEaZFsDVC2vDkpJ7ohjGHgWlnN3XJRyic=;
        b=bTcRWsoIUXc34ETD+A9WgYKdQ8t9nm1XglEqDoj+ozBWvgcr6zaBTk5pRkDW1WDXAl
         9zCXOUZ/k7RwTPD9BC7U6Pv9ej1JfK2mDeF8Y0KzYZlnDxL50OetDz8KBXf0XYDdoepR
         yvq5CtHv753UXlOoH3YfmVzRgpJd3hccBlxJRdataddcD48Mh+7UXeQ4zmkqa+bXkmue
         X0R5wAiwgnBnCB+71YkAqqHhhLQopMtIa6NI4Jmx217yeEioS7Ix3WqTPDZDmNkQj0c9
         5q5BmrTVd3hHh7PvFOWwri3CwZUS3EDseTPTCwPbK736FRgqU0HyZ0iKc2jd5crh0L/k
         9rYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773599463; x=1774204263;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RfaSUznmYmsEaZFsDVC2vDkpJ7ohjGHgWlnN3XJRyic=;
        b=WRurSYl+2TZ1GGmBGlsz485x3jQXs4dKt4EKeW23gextd908sddEwY0ZqT3c9qHyjK
         IbMvB5H4xBGUFGKyN77jnVmyy0xJuhNS1KdEQqs+M87OEF08rNjQE3d7FJoDE700vv7e
         tJBYPgsfq5p3U0UrMNmX+PTYRmsa9qhq+rLI5FMRrzZVjaFkG3sHMbT0bVes18aXE7CS
         z+Z0fBY05Qnri8N7yYza0DkKYcZMrMEheD7NAcsbirI5l34AimpkYqN5PJYnFKFNwF6c
         WWmc8HKmZlysslHu+Rudnc5r4n1puEfo26d7mR/6+8uNHMAtgiP85XeaGLQd3EdVFQPd
         /5BA==
X-Gm-Message-State: AOJu0YycVJanrOvgG2YllxeVjeelpKgYtKeCPleeGzX/RVehxR62lAdE
	7V576ygFZziCdgB15JiPxqQ9UVSSbPnEVtE9TGxDPOtI7NMQYdftvZfGxfLk+GJQse2JboqVXyB
	TtJY=
X-Gm-Gg: ATEYQzwvIyW3qdbELK9yzSnY2t2+7X9CkZIufLgn4Uen+WpqzuZZETI0tYC27UrgukG
	9vXny6P2S2ujFL+dKwyoG5CvX/w/l6XzWvokG2gqId6Ar6FoACYKeegFITr/yIHM6Ofp0uZyNHa
	83VzZ9LdcD9Uuc39pudTm3oIa0DJZ2+fczYwot1JPETxvld5VSBpTMsfQjoKRF4rBF2f6J1xgGS
	kSC1yKbrCZWdKW/VERmPwUy977BmA0Pt5jwoxJ1IOaZSQWa/hLee7SGH6rhCWtTZ0H2h/aTvAB7
	q0hWH3siETDFDVTwEybZJl5tdr/SQDZMAlYaWH8kcIf1UiRiO+rZYRsVFdghtSvRPzAp7TmpCMb
	1rzlxKsVpjia66EDpQm0GXXvPM17Zbo4xxB8cVQayNFD2JxXxSmFGunnXeS793GOP+RIOSj/pCZ
	VdniSQelRIJYkMiEcGvyVkvUkO
X-Received: by 2002:ac8:7d8e:0:b0:509:1657:a19d with SMTP id d75a77b69052e-509471c053amr177388841cf.15.1773599462936;
        Sun, 15 Mar 2026 11:31:02 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::687c])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50939e8e14esm98029251cf.6.2026.03.15.11.31.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Mar 2026 11:31:02 -0700 (PDT)
Date: Sun, 15 Mar 2026 14:31:00 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: USB mailing list <linux-usb@vger.kernel.org>
Subject: [PATCH 2/2] USB: dummy-hcd: Fix interrupt synchronization error
Message-ID: <c7bc93fe-4241-4d04-bd56-27c12ba35c97@rowland.harvard.edu>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <46135f42-fdbe-46b5-aac0-6ca70492af15@rowland.harvard.edu>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[rowland.harvard.edu,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[rowland.harvard.edu:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[rowland.harvard.edu:+];
	TAGGED_FROM(0.00)[bounces-34834-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_ALL(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stern@rowland.harvard.edu,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,harvard.edu:email,rowland.harvard.edu:dkim,rowland.harvard.edu:mid]
X-Rspamd-Queue-Id: EE039291EE7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This fixes an error in synchronization in the dummy-hcd driver.  The
error has a somewhat involved history.  The synchronization mechanism
was introduced by commit 7dbd8f4cabd9 ("USB: dummy-hcd: Fix erroneous
synchronization change"), which added an emulated "interrupts enabled"
flag together with code emulating synchronize_irq() (it waits until
all current handler callbacks have returned).

But the emulated interrupt-disable occurred too late, after the driver
containing the handler callback routines had been told that it was
unbound and no more callbacks would occur.  Commit 4a5d797a9f9c ("usb:
gadget: dummy_hcd: fix gpf in gadget_setup") tried to fix this by
moving the synchronize_irq() emulation code from dummy_stop() to
dummy_pullup(), which runs before the unbind callback.

There still were races, though, because the emulated interrupt-disable
still occurred too late.  It couldn't be moved to dummy_pullup(),
because that routine can be called for reasons other than an impending
unbind.  Therefore commits 7dc0c55e9f30 ("USB: UDC core: Add
udc_async_callbacks gadget op") and 04145a03db9d ("USB: UDC: Implement
udc_async_callbacks in dummy-hcd") added an API allowing the UDC core
to tell dummy-hcd exactly when emulated interrupts and their callbacks
should be disabled.

That brings us to the current state of things, which is still wrong
because the emulated synchronize_irq() occurs before the emulated
interrupt-disable!  That's no good, beause it means that more emulated
interrupts can occur after the synchronize_irq() emulation has run,
leading to the possibility that a callback handler may be running when
the gadget driver is unbound.

To fix this, we have to move the synchronize_irq() emulation code yet
again, to the dummy_udc_async_callbacks() routine, which takes care of
enabling and disabling emulated interrupt requests.  The
synchronization will now run immediately after emulated interrupts are
disabled, which is where it belongs.

Signed-off-by: Alan Stern <stern@rowland.harvard.edu>
Fixes: 04145a03db9d ("USB: UDC: Implement udc_async_callbacks in dummy-hcd")
Cc: stable@vger.kernel.org

---

 drivers/usb/gadget/udc/dummy_hcd.c |   29 ++++++++++++++---------------
 1 file changed, 14 insertions(+), 15 deletions(-)

Index: usb-devel/drivers/usb/gadget/udc/dummy_hcd.c
===================================================================
--- usb-devel.orig/drivers/usb/gadget/udc/dummy_hcd.c
+++ usb-devel/drivers/usb/gadget/udc/dummy_hcd.c
@@ -913,21 +913,6 @@ static int dummy_pullup(struct usb_gadge
 	spin_lock_irqsave(&dum->lock, flags);
 	dum->pullup = (value != 0);
 	set_link_state(dum_hcd);
-	if (value == 0) {
-		/*
-		 * Emulate synchronize_irq(): wait for callbacks to finish.
-		 * This seems to be the best place to emulate the call to
-		 * synchronize_irq() that's in usb_gadget_remove_driver().
-		 * Doing it in dummy_udc_stop() would be too late since it
-		 * is called after the unbind callback and unbind shouldn't
-		 * be invoked until all the other callbacks are finished.
-		 */
-		while (dum->callback_usage > 0) {
-			spin_unlock_irqrestore(&dum->lock, flags);
-			usleep_range(1000, 2000);
-			spin_lock_irqsave(&dum->lock, flags);
-		}
-	}
 	spin_unlock_irqrestore(&dum->lock, flags);
 
 	usb_hcd_poll_rh_status(dummy_hcd_to_hcd(dum_hcd));
@@ -950,6 +935,20 @@ static void dummy_udc_async_callbacks(st
 
 	spin_lock_irq(&dum->lock);
 	dum->ints_enabled = enable;
+	if (!enable) {
+		/*
+		 * Emulate synchronize_irq(): wait for callbacks to finish.
+		 * This has to happen after emulated interrupts are disabled
+		 * (dum->ints_enabled is clear) and before the unbind callback,
+		 * just like the call to synchronize_irq() in
+		 * gadget/udc/core:gadget_unbind_driver().
+		 */
+		while (dum->callback_usage > 0) {
+			spin_unlock_irq(&dum->lock);
+			usleep_range(1000, 2000);
+			spin_lock_irq(&dum->lock);
+		}
+	}
 	spin_unlock_irq(&dum->lock);
 }
 


