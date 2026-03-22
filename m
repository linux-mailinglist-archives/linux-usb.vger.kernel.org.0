Return-Path: <linux-usb+bounces-35296-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0DxZCOdowGlkHgQAu9opvQ
	(envelope-from <linux-usb+bounces-35296-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sun, 22 Mar 2026 23:10:47 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B9FDB2EAF7D
	for <lists+linux-usb@lfdr.de>; Sun, 22 Mar 2026 23:10:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3C7833009563
	for <lists+linux-usb@lfdr.de>; Sun, 22 Mar 2026 22:10:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05C6036E473;
	Sun, 22 Mar 2026 22:10:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jphein.com header.i=@jphein.com header.b="IuGXGlHa"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E9C5372B53
	for <linux-usb@vger.kernel.org>; Sun, 22 Mar 2026 22:10:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774217443; cv=pass; b=ErkQLq6L30JHiIdrAobHKr4fPae/B7amNG5YQoD+YjLice1qnp8rIVxidU8X7pEFTHPRYnPcrKOcRhvuuHKHaHPF0AFIieNShWVmPH19fP+uVdUJgZVkyJ0DQkOrS8N8XsvaXBVK5nU3Mr9RXEQCChx5clxxf1lpiw1/kNxYyrE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774217443; c=relaxed/simple;
	bh=x1w5Bh0hXE+R1kbLYv8/Hm/OkWz4e0lUE37K2HZ1y7I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=N8Z+Z8jlQ3CD0+dzsSqzET9z9skrAFrjU68bySiJ/6mHHdHp/VyRHbQdRJRM3KFa4zxpg72AKeQuxuRIso61YgIekjTcGBmlSZc0YTAvYw0MgM7Kp2tHPUWivAxoVZ0TyyVgLCR3nqCk2DM+8R8D2EdappI1XC0xsm7mnjTvQBY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=jphein.com; spf=pass smtp.mailfrom=jphein.com; dkim=pass (2048-bit key) header.d=jphein.com header.i=@jphein.com header.b=IuGXGlHa; arc=pass smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=jphein.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jphein.com
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-79885f4a8ffso29622847b3.3
        for <linux-usb@vger.kernel.org>; Sun, 22 Mar 2026 15:10:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774217440; cv=none;
        d=google.com; s=arc-20240605;
        b=I1MPd9iJ2RFwvlwu9ab5yeyxLV5anbUsRVGFaUg8sbA371/zwxxtxVebIUTIOqoeUE
         gykOZ35DAnW6e8Tb0tYJYUayoyw3KJX+Zt0e8F7y7IWUGJpVg5uo98kgpJvoXb5IEKwD
         3RwoNSNNeIr/xXhUYS35FWtVyLH4HSdaSssR9XwBn3KV13cZTbZ/WiQgzU4SeagNNR24
         SvFoxucBMKXfinA2jkPJBP69D4TJ0KlthVaTZt4VvbFeJYJJLgMpklBLdObbSbK5f3R0
         j5GrhqO4X6+YurGefbrIISgdJvjtDOyVDw9LL69zQYnK6LgnD+BUdvEdeFW9Z9Mpeh1m
         3PUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=maqbUFDVU1fBNlyXTgUimX3uQ68hwxMNeXFRVOxQKxo=;
        fh=QWCON2KrOTYdh4fBMDO2vEZ6QWDQNQVLZE8OsYgV5xE=;
        b=df59Jy7/wuyobB8l5fTvU/finGLXm7E/WEWdOw4Ok8nFNJHAWvlbSMa2ftYwO9eGut
         Oa7XNs8lMllT9QbDJMlKi+w0DXiHq9MgTjRpbAUUMI/cMyoqDAUxNssaZcw3NZgYiLzx
         0xBodky32mzaJ9FsoDU4qhm1jTkm9MDgu6QOqBCzz5Z1ZLpf229oc3tSHKxBWF8C8pHT
         TOsVEWYMekq+qyJj8m8XY/6uoEPtgcBrfJWCO3qY7js5DO3WriKFCVH9DqRGJ4VbRbbc
         YCVRW91AeIzB0SjBTWZV3RigNcFTSh53+abkltvEYeQujKbovy84fOnIi+jy+AzWZA6q
         a2Pw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jphein.com; s=google; t=1774217440; x=1774822240; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=maqbUFDVU1fBNlyXTgUimX3uQ68hwxMNeXFRVOxQKxo=;
        b=IuGXGlHa4iH+Gcl8bb3EaOnNcJ9RRFEMwHQ7+dvu13CvZhC/k8a3BpgiCxclaCRjTn
         h6P5bT1AnsG2fo+JKsMCnbAUTsuoS2xMMFrI94Q0QQLd+1NYC1X0CkKdBhf1KGNwc+kt
         x41naSrQPydOKrO26TQeN0r48fMo7Vs9SkLPlZjrj22lQT/uN2sWjmwFslMe53ofXxcn
         Gmj4oFHqB1ONXUpdyIPGpPEyIV9OjGL77vmNNznDy6qk14/CM+4+++6kwGrHRQvlAb6Q
         HRFJqNoD/gVQi9cCF1EtjMJRNgVbIYGKZuy0d8hsWLGQFYgkXHHvwf+igorImMOVi/yv
         FeXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774217440; x=1774822240;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=maqbUFDVU1fBNlyXTgUimX3uQ68hwxMNeXFRVOxQKxo=;
        b=aXmsxIKQ6sSC2nO5vGnAh4px65dpzewglVHr31UOUsynwYbKHqonSWeZHdTpqhVmCs
         gme1mXbXEhPD84M5ZJwtnFR7NCuYHhDYPsR6CER6VQtubxeEwVNDK/p3BvSJB0lXzcy/
         7vlU7vyiEKzrLTA8hCciDnrJYwtglBJ2wG4jw5L+DoHIDk64KvwWyhBvKymPitsEp/qg
         MfDgV6zBEc7ZjUA1NTcMTFgYY58UAwYO2h4wSAXYJ/z+b1yBoxuUrQDUUTZjHKjz1mm5
         rAIe5weP9O9/44v5+sY6INaqsT9PWgZAyc11VkLPQWjrHS0utAEDyeMR1/wSb9lcY414
         jWDg==
X-Forwarded-Encrypted: i=1; AJvYcCWlKeVCAlwTafUHO68jIEzlyfa8c0t30Kg9VpzxCnGwy10wEp7yXRyZbjxkq4FFRivJnAKSaWQQpbg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxRMqhjODVo58sh6rXcveOtSTSf/d4e5nD2/VQ8hGd18ftPN2kj
	iLUReAlKZBFI/04aQEyk88g/NQv2z0h7wAwtcGc2MhL/nnnBAEamqffggxnj4e3LHkOTdtJGvB4
	qHRl4bcAAE5povbJ6q0pun47IuTYMwqqcUucHeqJwXwKqMVTiFvA=
X-Gm-Gg: ATEYQzzX8N1GWR6hrfreJfoz0mti5q5KJalNZ6wpd8+WNWmdJrvZOfLK2AnSaTtFkoQ
	eTR1gQ/o6h9rgl14rZLchuizVgoQr7aYy9K5YrRi0J4XGTocNUzx8Xt4tfgZKoUt/aY169KSgH+
	rhC+/+BB0ye6esmoT31Euy0eubnCw1Efhqbhe9NhExLz1vPZo/l0S5ulq4hOO4mC1gQ07e4gJTH
	jl3DepX2G+8vxTOAjEcZwVyfE+lvn0Vdb8LMOPCLHyYXssqSHfxLh5EgKlkIAf1zMOsaP33MkZm
	jaWH
X-Received: by 2002:a05:690c:112:b0:79a:ac83:ac7a with SMTP id
 00721157ae682-79aac83b0ebmr30223357b3.36.1774217439889; Sun, 22 Mar 2026
 15:10:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260321223713.1219297-1-jp@jphein.com> <20260322055354.03399a32.michal.pecio@gmail.com>
In-Reply-To: <20260322055354.03399a32.michal.pecio@gmail.com>
From: Jeffrey Hein <jp@jphein.com>
Date: Sun, 22 Mar 2026 15:10:28 -0700
X-Gm-Features: AaiRm50oRG8Mr0cjFR7cCSGQaef51kLZ44-yoCLNOycpoaWX8w5YS5O5MF0Hd74
Message-ID: <CAD5VvzBE8Oq80EhFZnZ7kNrRC_rpoR25Ct5-Fg62yDZUHVtWzw@mail.gmail.com>
Subject: Re: [PATCH 0/3] USB/UVC: Add quirks to prevent Razer Kiyo Pro xHCI
 cascade failure
To: Michal Pecio <michal.pecio@gmail.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans de Goede <hansg@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-media@vger.kernel.org, 
	linux-usb@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[jphein.com,reject];
	R_DKIM_ALLOW(-0.20)[jphein.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35296-lists,linux-usb=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jp@jphein.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[jphein.com:+];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-usb];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stress-test-kiyo.sh:url,jphein.com:dkim,jphein.com:url,mail.gmail.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: B9FDB2EAF7D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, Mar 21, 2026 at 09:54:00PM -0700, Michal Pecio wrote:
> On Sat, 21 Mar 2026 15:37:02 -0700, JP Hein wrote:
> > This has been reported as Ubuntu Launchpad Bug #2061177 and affects
> > multiple kernel versions (tested on 6.5.x through 6.8.x).
>
> > Tested on:
> >   - Kernel: 6.8.0-106-generic (Ubuntu 24.04)
>
> How many of those problems still exist on current releases,
> where these patches would end up applied?

Both failure modes are in the device firmware (version 8.21), not the
kernel, so they exist on any kernel version.  On 6.8.0-106-generic
(where I tested), the TRB_STOP_RING case in
xhci_handle_command_timeout() goes straight to xhci_halt() +
xhci_hc_died() without attempting per-device recovery.  I have not
verified whether this path has changed in a more recent kernel.

I have personally reproduced the crash on 6.8.0-106-generic (Ubuntu
24.04).  The "6.5.x through 6.8.x" in the cover letter was overstated
-- I should have said the Launchpad bug has reports across those
versions, but I have only tested on 6.8.

> Does anyone have a repro?

Yes.  The stress test script is in the series repository:

    https://github.com/jphein/kiyo-xhci-fix

stress-test-kiyo.sh exercises UVC controls via v4l2-ctl at maximum
rate -- brightness, contrast, saturation, white balance, exposure,
focus, pan/tilt/zoom -- cycling through their full ranges each round.
With 0ms delay between controls, the crash consistently occurs around
round 25 of 50 (~5-10 seconds of sustained rapid SET_CUR).

To reproduce:

    bash stress-test-kiyo.sh 50

With the CTRL_THROTTLE patch applied (50ms rate limit), the same test
passes 50/50 rounds reliably.

> How does it behave on non-Intel USB controllers?

I have only tested on Intel Cannon Lake PCH xHCI (8086:a36d).  I do
not have a system with a non-Intel xHCI controller and this camera to
test with.

That said, the firmware lockup itself is controller-independent -- the
device stops responding to USB control transfers regardless of the host
controller.  What varies is the host controller's response to the
resulting stop-endpoint timeout.  On 6.8, xhci-hcd takes the
TRB_STOP_RING timeout straight to hc_died(), which kills the entire
bus.  A controller whose driver implemented per-device recovery could
isolate the failure to just the offending device.

The NO_LPM and CTRL_THROTTLE quirks operate at the USB core and UVC
driver level respectively, so they prevent the firmware from reaching
the lockup state regardless of which xHCI controller is underneath.

JP



On Sat, Mar 21, 2026 at 9:54=E2=80=AFPM Michal Pecio <michal.pecio@gmail.co=
m> wrote:
>
> On Sat, 21 Mar 2026 15:37:02 -0700, JP Hein wrote:
> > This has been reported as Ubuntu Launchpad Bug #2061177 and affects
> > multiple kernel versions (tested on 6.5.x through 6.8.x).
>
> > Tested on:
> >   - Kernel: 6.8.0-106-generic (Ubuntu 24.04)
>
> How many of those problems still exist on current releases,
> where hese patches would end up applied?
>
> Does anyone have a repro?
>
> How does it behave on non-Intel USB controllers?
>
> Regards,
> Michal



--
Jeffrey Pine Hein
Just plain helpful.
jphein.com =E2=98=80=EF=B8=8F techempower.org
(530) 798-4099

