Return-Path: <linux-usb+bounces-36862-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SDQvJyLS92kBmgIAu9opvQ
	(envelope-from <linux-usb+bounces-36862-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 04 May 2026 00:54:26 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id F25F54B7BA1
	for <lists+linux-usb@lfdr.de>; Mon, 04 May 2026 00:54:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 45346300A63A
	for <lists+linux-usb@lfdr.de>; Sun,  3 May 2026 22:54:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B13193AE18F;
	Sun,  3 May 2026 22:54:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jphein.com header.i=@jphein.com header.b="NdcC3gzQ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yx1-f44.google.com (mail-yx1-f44.google.com [74.125.224.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE0112147E5
	for <linux-usb@vger.kernel.org>; Sun,  3 May 2026 22:54:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777848862; cv=pass; b=TpVZ8BulzfvJhekVIZG9PIo+9F9lvdy703WIvd/1PedjpGZzh3b8wwO7qLUQN4OSUCcSRLtcXhR4JyMSaYYo8/RxrxaCy/CBsa91Bhc/kdrKcjJ1M5BBT8uHWLxCFxVl2x7Q59xWEJtceaiaJLsHVnVslu8GEY7gk82uitzzZ3g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777848862; c=relaxed/simple;
	bh=HHUqSrSbpan1HpTwDObpiGld6DV6AUvdUllNygldI6s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QEas9F5dJ9rFrQdIV9DQyNujUYVciY8CxBMk/pL8jG/6JZV0RRRMOOb8oOzIHsYjp6HGvKIb9iNo0+giY/zzeQBv1yNGKWq+w3gk5vC3TAMFB/faFI3nqPbiHkQ9Zni/L1kWPoZ1dl+aKn/G0AFlC1YixMIPEYKaUAr0DvxEW1o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=jphein.com; spf=pass smtp.mailfrom=jphein.com; dkim=pass (2048-bit key) header.d=jphein.com header.i=@jphein.com header.b=NdcC3gzQ; arc=pass smtp.client-ip=74.125.224.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=jphein.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jphein.com
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-65318dafbcbso2803531d50.2
        for <linux-usb@vger.kernel.org>; Sun, 03 May 2026 15:54:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777848860; cv=none;
        d=google.com; s=arc-20240605;
        b=c5nACqCooVP5hSdcPjkMpQ31VP3vQtQhbUE+ERK1kO20LOrpzcYy+5CfnRndQFg+kd
         6G19AXPjdhkPHcIKNiC3TVY5PYFiPeq7o4e42vO4GxBuRICz6GR/cVT96pqJgZYxwqW2
         efGaBaeYIfAs8ZPuDhuKsD76so9nycAvPYiml5bVAbGBPvvoJc4mtIEvpsOe3ArP/kQd
         W/p22QZeLTPkaYF20/uxFdi4AfrCHxbS8vItxIPwWHCzTwwTNHDG490iyUI9cxjHpSjA
         FQ4xKUXmFsTNXAx7LVq+nNyfSPYRsOXOCns4kZnSsxk1BAfZhzra0lcl1eKZAJNH89Dy
         d+lQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HHUqSrSbpan1HpTwDObpiGld6DV6AUvdUllNygldI6s=;
        fh=cSuwK1fwFdPIjAQRsQKypf2Fsmp2JCykkDYPJQtBWhk=;
        b=Y1afRBg8MARLm1Kuofef2ERTyIvqiyInCzgxJjnIIxk+vSSCfITQFnOGFY6AdkBBR7
         mu0t4duWhiYRnn+jOK9TA0bpnC+g23rz8UecoA3HESibsjP/FGPqz37Aosq3p9tOjCHR
         jrFWpAbDyRGLob952UVhMba23VuZ0OSGRSaIaxjUo56Rf3+Fhit/unCEvs4INuSAS8yN
         ssGB3STn0pAQ2OPnHqyFwLcqSm40r0sl7TAq80MK3nUbHqH0XHf3ljdyYoMa1UWlg4VR
         mnatXBQtjkixvVpqpKQMSyl4aRMjY+eepp9zGyRSmNncQ5y5LzXaHwx2lDnkVQeu4plG
         capw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jphein.com; s=google; t=1777848860; x=1778453660; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HHUqSrSbpan1HpTwDObpiGld6DV6AUvdUllNygldI6s=;
        b=NdcC3gzQADkEdZyAJtOeJ+IVs6BMc4gGSL0sDMVyVTZ6oxQnk/oF7sWHTXo1Tf+Yi6
         U4bzRNXVRESDJBo1DFzPvc2IcOhwx3rX+vHueT5iYwdTaY8+XN2YO3kOBh8T6/6nfFM+
         nZqXsZQosBrlLpPqcv/HN532w4+ScpHKUIhpG5bXadLN8yKEYYmq2xtoY8Shq1o2FQ9N
         M3VzPvr7o5kK+PUEeB1I3LqXSy2/djlRhP80zAZ6pxxOB4ICfdbueF+UcY0Yl0ChkXhe
         Xy0z+Nc5PkF8aHkDkCFSiWGWwht0PZ8J1sZtQ5KOpIHtPL1KNruroUMbX5B6ALS5rWPH
         KDeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777848860; x=1778453660;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HHUqSrSbpan1HpTwDObpiGld6DV6AUvdUllNygldI6s=;
        b=eKjvQvxN10zV9uRaztJYgvJBgMn2CtNZYwqHnb+lqyQmYR/61XugMHFdBgRmCgDMqG
         R5lr2igOywkjVZJ59a6QoH1EEKj4Mv5LgKkxPF9bKMhBw4qq65uHpCQIrEg+a5tC9Qoz
         3HIaLbRPYpNQsovHfXs/RAqAN5RJPq99M0HqLmcsFiIiH9kpoKT5R7sB8MNprQyxnjpF
         cZFa08i1dLriahTeHyeB1WY6Z6T/npstIjV+wzIeO5YVykBimzNHqBuBFjei/SR2mihD
         QZc3bgXvAO/AGNs7LL80T0hE6sdc6ctx65fAargNmr1Ev5p5685pXLACVmmuqa6Yln96
         M7DA==
X-Forwarded-Encrypted: i=1; AFNElJ8gWuGrdoNg2qUG8N8x7LrCg+52g63cPJ7rnw+xcQEURBso5KlbTBkLPQg/Ob5qW5HscMiXDyhojIQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzQ1tolC1bDgsjtFwh1+OsJbNOl7HFJrus5R40pI4Zp1ufej8RZ
	B10o27TYX6JftXhNE3JaG7Kq/vLAHEED5U0RNxmfczFBjJjDmd4JJGgskqG5n69PWPqKX650938
	mPhhap+tq9edVxUAK+InuYhbvkwgJRqEPVYcfz5LX
X-Gm-Gg: AeBDies9/OV309yIWX1xarsyOPhg7X/v3OrMlHtFA30uE/WWjIATfVmY9YONF8YpFnN
	z88JsLKP2/GeZ+F1CBk/MVSfjmf7STceu867FJGfkoW8JE23iX4VECGI7oF/GVSaNxHcv3jZiAw
	Oa0S7AGxsldV/vOqihojP3iQUIS53NcLkKZxC1t9/INpySYdJ/TZ9Nb1pOjEW+hkmqF6JF2xgcO
	B7eTLshJ/tZIyenIQQte128XTh3dsATyA3ZiVAXmRYtv0O2zkvxJjqU/9AYtRaEKXvMjM+qDt7O
	LBHWKV6N2r5cFa+2heNngm4n+twBpdx+FnhLF8w1t1sGDhYXxjp3rIMS9z2fz8DhpchmArOy8fe
	E
X-Received: by 2002:a53:b426:0:b0:651:9720:744c with SMTP id
 956f58d0204a3-65c3dbeec96mr6188357d50.63.1777848859718; Sun, 03 May 2026
 15:54:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260331003806.212565-1-jp@jphein.com> <20260331003806.212565-3-jp@jphein.com>
 <CANiDSCvsxP+npQTHUrMTp+Z8XULYKSLTz2AFu+WQnsLbRBGa2w@mail.gmail.com>
 <20260409100247.7cfb62d1.michal.pecio@gmail.com> <20260409221749.5e6bccab.michal.pecio@gmail.com>
 <c4275422-a9b4-4519-95f9-1163a7912709@linux.intel.com> <CAD5VvzCEV_XbHc_Gby7mFPBSgSebqKDKJf3VC8HNRrD+xWaTJg@mail.gmail.com>
 <20260413100545.71796c66.michal.pecio@gmail.com> <20260427083553.36ff4731.michal.pecio@gmail.com>
In-Reply-To: <20260427083553.36ff4731.michal.pecio@gmail.com>
From: Jeffrey Hein <jp@jphein.com>
Date: Sun, 3 May 2026 15:54:08 -0700
X-Gm-Features: AVHnY4LhPRw4XrdZjjt_olrWEaNJISf_JWRrz01TpDM2605apcllR8Yxymswj_U
Message-ID: <CAD5VvzBKvK3Z0HLoNx0VEbgyzQVq1CHwMKpCEpdC8zs8OowTNw@mail.gmail.com>
Subject: Re: [PATCH v5 2/3] media: uvcvideo: add UVC_QUIRK_CTRL_THROTTLE for
 fragile firmware
To: Michal Pecio <michal.pecio@gmail.com>
Cc: Mathias Nyman <mathias.nyman@linux.intel.com>, Ricardo Ribalda <ribalda@chromium.org>, 
	Alan Stern <stern@rowland.harvard.edu>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans de Goede <hansg@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-media@vger.kernel.org, 
	linux-usb@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: F25F54B7BA1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[jphein.com,reject];
	R_DKIM_ALLOW(-0.20)[jphein.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36862-lists,linux-usb=lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-usb];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid,jphein.com:dkim,jphein.com:url,dmesg.post:url]

Hi Michal,

Both tests done. Intel xHCI 0000:00:14.0 (8086:a36d, Cannon Lake),
kernel 6.17.0-20-generic stock, stock uvcvideo. Two Razer Kiyo Pro
units (1532:0e05, fw 8.21) on root ports 2-1 and 2-2.

hammerint (2026-04-29): 60s per Kiyo. Kiyo 2-1 logged 413,738
submit/cancel cycles on EP 0x85 IN; Kiyo 2-2 logged 416,350. Both
timed out cleanly (rc 124 -- didn't kill the HC). Zero xhci_hc_died,
zero "event condition 198", no command timeouts in dmesg.

Caveat: usbcore.quirks=3D1532:0e05:k was on the cmdline that boot.
Hammerint runs the link at full throttle so it never gets idle enough
to attempt LPM transitions -- NO_LPM should be inert here -- but I can
re-run without quirks if you want a clean reading.

stream-mmap loop (2026-05-03): 300s per Kiyo, MJPG 1920x1080 @ 30fps,
no quirks on cmdline. Kiyo 2-1: 134 open-fmt-stream-close cycles on
/dev/video0. Kiyo 2-2: 92 on /dev/video2. Both clean, dmesg.post empty
of fatal patterns.

So Intel survives both reproducers in the windows tested. Doesn't
disprove your "looks like a HW bug" framing -- consistent with Intel's
xHCI ring tolerating the cancel/resubmit pattern that kills ASMedia.
The cascade path is silicon-dependent.

Note on scope: neither test exercises the rapid-SET_CUR pattern
(settings spam during a video call) that triggers the firmware lockup
in real-world use. That separate trigger does crash Intel --
stress-test-kiyo.sh hits hc_died around round ~25 on stock kernel --
and CTRL_THROTTLE in the patch series addresses it. So the patch
series argument doesn't change.

Side note: the same v4l2-ctl focus_absolute reproducer is reported on
Linux ARM (Pi), Windows, and macOS by another user (Razer Insider) --
supports the firmware-bug framing. Reffed in the v8 upstream report.

For v8: CTRL_THROTTLE addresses the trigger (rapid SET_CUR -> firmware
lockup), not the xHCI-side cascade. The xHCI side is your territory.

Forensics: https://github.com/jphein/kiyo-xhci-fix (raw run output
lives in gitignored results/ dirs locally; happy to send SUMMARY.log +
dmesg dumps off-list if useful).

JP

Jeffrey Pine Hein
Just plain helpful.
jphein.com =E2=98=80=EF=B8=8F techempower.org
(530) 798-4099




On Sun, Apr 26, 2026 at 11:36=E2=80=AFPM Michal Pecio <michal.pecio@gmail.c=
om> wrote:
>
> On Mon, 13 Apr 2026 10:05:45 +0200, Michal Pecio wrote:
> > Question: can you kill it by starting some video application to set
> > the camera up, closing it and then running this loop?
> >
> > while :; do v4l2-ctl -d /dev/video0 --stream-mmap --stream-count=3D1; d=
one
>
> Hi again,
>
> Any chance you could try it? And also the attached test program:
>
> cc -lusb-1.0 hammerint.c -o hammerint
> sudo ./hammerint 1532 0e05 0 85
>
> Initial arguments are VID:PID of the device, next is the number of
> an interface containing some interrupt endpoint and then the endpoint
> address (including 8_ if IN).
>
> I tried with a variety of SuperSpeed devices (UVC, NICs, hubs) and this
> reliably breaks ASMedia HCs within seconds. If the same is the case on
> Intel then it's a bigger problem than just UVC.
>
> The video streaming loop breaks even more controllers. I have some
> general idea how the streaming case could be dealt with, but not so
> much the interrupt one. Maybe rate limiting. I found that avoiding
> Set TR Dequeue to Link TRBs reduces failure rate, but not to zero.
>
> Long ago I also looked at the issued command sequences and I haven't
> noticed obvious errors or spec violations. Looks like a HW bug.
>
> Regards,
> Michal

