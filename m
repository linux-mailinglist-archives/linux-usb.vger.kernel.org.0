Return-Path: <linux-usb+bounces-36596-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WNruFaU98GncQQEAu9opvQ
	(envelope-from <linux-usb+bounces-36596-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 28 Apr 2026 06:55:01 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CFAE647D6BD
	for <lists+linux-usb@lfdr.de>; Tue, 28 Apr 2026 06:55:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 838C6302A1A9
	for <lists+linux-usb@lfdr.de>; Tue, 28 Apr 2026 04:54:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F99922423A;
	Tue, 28 Apr 2026 04:54:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Omi+rLiO"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F11E71F09A5
	for <linux-usb@vger.kernel.org>; Tue, 28 Apr 2026 04:54:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777352074; cv=pass; b=FZSUFfaivlWznbTBmzkndJk0KZin2Df+Du6iko3AxLc9YwcrCvBLYbe+nK6UASWPyEZl3BbWW5WVJjMXQVm7fXOLIonzRYHKPMC00nPNIDPuxFXGwHcs/I7WtgdscABtTciC7s40mk8Z1UGQ/+aU92fwChl8+wWG8VGZlYrhfwo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777352074; c=relaxed/simple;
	bh=oLlvzt7wQd754o+fNti7yQsWlu8oDJ0/kFO4ahn9mrM=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=Hx4YNQFa+aSCcn8/qD+DklrDChRzBaRBekTMQ+6DSGskpWxgaOSCZilXRud2jDgcXtwe9u6vsiVXFUN9uW3gvdIUwQFDBHTZaeVQ8sAAzR3Oq0tUc8XgiaDJL/RBtf7gEl+YEf3OBHMx/65V3FeeGJtY72TeO8nGL0AIUUR5tEQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Omi+rLiO; arc=pass smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-79a535e7c00so118460777b3.3
        for <linux-usb@vger.kernel.org>; Mon, 27 Apr 2026 21:54:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777352071; cv=none;
        d=google.com; s=arc-20240605;
        b=fVhKXH+TQja1dzGdV/Qrp1ftt2ibhHfPlvR7YkhrQlogxtwMFr+sGgZ9/H0UKCtvbT
         nt2xaiD7z8TH4S75u9iFd5Lci2SgquuL7EmpbD2CVgP7PJgb2oBkq3QXiU2LN/LSgHC5
         Yy2ZJyJZNfV4UU69/keGbWgQVSMmpZkcKQbSA2sX/BrSc9/AOfrRnDuaBH4aW2+xQ/Qa
         8+ROdSjoq4uDSimecj1zk8J7bYHmEv3oEcc1yq6vMSpeSfqzw+FKfoFhVH39VUw6+Y80
         dKS7LTvib1ljXubOIpeaLG4JS9mcJCJDId0bNQkqfIqpOFSjKOFekkxA1o/32FDF59UP
         W88A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=c5yJ6QtvwIt+J51E0AEX/MTYwYAVQGf1uPUogc5Ssz4=;
        fh=kmxxZtidsjgy6yfXCItXjxYwJopnyhLzCImGwaShWOA=;
        b=KrPwd7mAX1EfHbv4YNJHV0fIXLPG2+CRdaDSJHDtgzbUqPsIAN9/p2EkAx9yea/9EF
         +JiQTaSp6sxB98ffW12B3tTUhrUujuP8SKYoXptk+6DiT1wCuy4lj8feW8TnxF7jeGTe
         7vUhAbBmfwA3m4RAqquaGS+twHTxI65vN9NEq6DYGagatxPu9TVLgI8pRN0UIHH4x2lq
         7Vuagzo4zaOWWrOGDsvfnlcDYzKS2QUqk+Vb35pYcxQ5NEs8uyKYhuUzONXyYoVy/0u+
         kE7SQiHu++03r8HK9ksXv03UJPOyg4cf44GKMAWQPRP9YHSMlCCBXjh8hsiCGl7wQpFE
         exQg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777352071; x=1777956871; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=c5yJ6QtvwIt+J51E0AEX/MTYwYAVQGf1uPUogc5Ssz4=;
        b=Omi+rLiOrs9L455c1HWo1rWwss93HxfTcqwPYwGbahbReAWmzX+BNs247Eb0ez2VAN
         3QE8b7LzHucEZzlqal/MCLerXdZXuX6CUcWCs7ZlgUnDSqL/JOLy6xPtEwKTbQa3hfyE
         0TO5VOUw95b7bM+xX0I1LEJxcstKvvYcUW2UIfeYiLvVRjddUAjUN7aYOhSp8T2M3vB1
         6sxiSSdHJLPgzC/OqhjU+sDmN7i5qQVoFx/6wn8W7HQJbUcBsGUl9OiNJieQrcOgYo9n
         4rZqxfpZzLwsvQKBDCcgg+mDh+w4LeFGAsPTVsQBQb7OsWTH8uR8MZFhBznVjeZW69xH
         VI7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777352071; x=1777956871;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=c5yJ6QtvwIt+J51E0AEX/MTYwYAVQGf1uPUogc5Ssz4=;
        b=LTYC6gvDLB1nX0d+RPpK+Up4h+5k+KpL72gEfh0grhlVHivA3XQ/HNnKrK7UCpNXxD
         5PHgB55iEg/BKZMzcP/5ffeAcJFde9LnBJ6uv453uiYfJgPZJIoQQqLpedomOd0CxBZn
         viMTjGhSuDkFbMYY+t1YymD4NKqjm9tSHyD8vFMx2MLOmfQEfnzJw96I93wxpuc/DbcT
         clpDQhFI97ZSxikklOyrXTVREo5Uvi6kc4G7vB6nSsvQcUN6B0uvkOPWHaJNmsQRHVxd
         M5jsOnDWP7OSL93MRqdCWBo69Ik+l9uUQupd4a/5Rje8IAKGU/x+BFx5su4MkffZP08Y
         /u4g==
X-Gm-Message-State: AOJu0YxJ7Fmtq3tHj7NEtx8X8Ysdg1iidLGCHGTxSdYtaBTSZh3MKp1X
	nBbgJnoKPq/347F7UX7YEAl8lLFIKJo+LnPnDj4BghdQw97uc7BqNKBMKxZULFesQyLLSirlcyg
	igGtoDo4DT/MJ0NpN4vg6WULPj9J64qbEY6mO
X-Gm-Gg: AeBDiesQ7lXxau2oLMRJar8M+9kNr2o6ZNyxLLXOAZGtHsUW57fNYWf7fKZK+QQ254Z
	xw0v37iWCuDMil6/sugysZ7ZLhp3PmU1C493YrjfkQqaq+WOY7+Cu0CbnASke1xLsMzidOpNtOY
	C2C1MK1i4njpW+SjMMum1UK+aBmsyr2vS5wJONKCCBXQZpm4KERFPPaWGeu+DSezdpU0lS1Rq13
	mJqfZLGk9c6vhecSJkm4bbY9r4b8vw0v60jYWqYG69SiVChfJYR9EbQNqGLtrdos0ApITwAFXl1
	6FfEWC8lol2Cpm00aeVp
X-Received: by 2002:a05:690c:4b0c:b0:7b2:9ad9:cd2e with SMTP id
 00721157ae682-7bcf50f490fmr15229327b3.14.1777352070977; Mon, 27 Apr 2026
 21:54:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Ginger <ginger.jzllee@gmail.com>
Date: Tue, 28 Apr 2026 12:54:22 +0800
X-Gm-Features: AVHnY4LPN2ibgbkOecF0vz3Ad-wqCGRP853NBhPt6pBq6Axs8UzNIXGeuRy0ETU
Message-ID: <CAGp+u1YpY=StJYjr0HdYV+uaKBdcaT3iU4jq-9vr3d_a=t_nvQ@mail.gmail.com>
Subject: [PATCH] usb: misc: yurex: fix ordering of usb_deregister_dev() and usb_set_intfdata()
To: Greg KH <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: CFAE647D6BD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36596-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gingerjzllee@gmail.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-usb];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mail.gmail.com:mid]

In yurex_disconnect(), usb_set_intfdata(interface, NULL) was called
before usb_deregister_dev(interface, &yurex_class).  This opens a race
window with usb_open() in the USB core:

  T0 (yurex_disconnect)               T1 (usb_open)
  --------------------------           -------------------------
  usb_set_intfdata(iface, NULL) [t0]
                                       fops = usb_minors[minor]  [t1]
                                       /* fops still valid here */
  usb_deregister_dev()
    usb_minors[minor] = NULL   [t2]
                                       file->f_op->open(inode, file)
                                         yurex_open()
                                           dev = usb_get_intfdata() [t3]
                                           /* dev is NULL */

Because t0 precedes t1 precedes t2 precedes t3, T1 can obtain the
file_operations pointer for the device (t1, while the minor is still
registered), then continue into yurex_open() where it calls
usb_get_intfdata() and gets NULL back, leading to a NULL dereference.

Fix the race by calling usb_deregister_dev() first, which removes the
device from usb_minors[] before the interface data pointer is cleared.
Concurrent usb_open() that arrives after usb_deregister_dev() returns
will fail to look up the fops and will never reach yurex_open().

Reported-by: Ginger <ginger.jzllee@gmail.com>
Closes: https://lore.kernel.org/linux-usb/2026042718-unwieldy-dicing-626f@gregkh
Signed-off-by: Ginger <ginger.jzllee@gmail.com>
---
 drivers/usb/misc/yurex.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/misc/yurex.c b/drivers/usb/misc/yurex.c
index 6d03e689850a..b5484ab77e91 100644
--- a/drivers/usb/misc/yurex.c
+++ b/drivers/usb/misc/yurex.c
@@ -310,11 +310,12 @@ static void yurex_disconnect(struct
usb_interface *interface)
    int minor = interface->minor;

    dev = usb_get_intfdata(interface);
-   usb_set_intfdata(interface, NULL);

    /* give back our minor */
    usb_deregister_dev(interface, &yurex_class);

+   usb_set_intfdata(interface, NULL);
+
    /* prevent more I/O from starting */
    usb_poison_urb(dev->urb);
    usb_poison_urb(dev->cntl_urb);
--
2.39.5

