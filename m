Return-Path: <linux-usb+bounces-36149-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yCCAAEaD2WmvqQgAu9opvQ
	(envelope-from <linux-usb+bounces-36149-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sat, 11 Apr 2026 01:09:58 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 933633DD656
	for <lists+linux-usb@lfdr.de>; Sat, 11 Apr 2026 01:09:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 913F43060CA4
	for <lists+linux-usb@lfdr.de>; Fri, 10 Apr 2026 23:06:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1149433EB1A;
	Fri, 10 Apr 2026 23:06:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jphein.com header.i=@jphein.com header.b="CxBF6S+B"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E7492D77E9
	for <linux-usb@vger.kernel.org>; Fri, 10 Apr 2026 23:06:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775862417; cv=pass; b=UmA6Pju0xBkCr9bgm3PxtTZF9H+9AQGX7ULF/cey+FcrDnnh30niVp0F3uTMrFh/rdav4shpMcaeHFpnrQGxMdDPtOpAu64NNSSrbf+6WmZW/mRRxm0MNIAHeOzcY05Le/d61yVh17Q5gohi0p5ELQmv7D6wUIaTHdFnqPSO/to=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775862417; c=relaxed/simple;
	bh=vN2EtTX1MylqicR1O6dQlJVyp/QYN50CxtPr327Svb4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mopKKm7SgkZLSd1XUWPO+2T+OcpLm9oYOp0J6BNlgJ2Mm5q/U1yIbo2leNgJT402MONCdTcjrvIfmQuyxVGbm358Ah8gaX++3pCwr/s+fqZTVjomGxzUMqG5TlOdkCJ9Erx3RWw2XIT6lKElrcDIuHBM9sC5LObTk9M/UndwQco=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=jphein.com; spf=pass smtp.mailfrom=jphein.com; dkim=pass (2048-bit key) header.d=jphein.com header.i=@jphein.com header.b=CxBF6S+B; arc=pass smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=jphein.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jphein.com
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-7991db3dc98so28596687b3.0
        for <linux-usb@vger.kernel.org>; Fri, 10 Apr 2026 16:06:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775862414; cv=none;
        d=google.com; s=arc-20240605;
        b=T41CtnuX+cRnhKehManVvgdSNnDMl0qo2/IJyHVzXw17FGU/4+3Zkm8HrV6b9tMzSO
         TBUzjAlL1PRwJW11fpzbIq8UEgVsohFq5FDXo/QSoXf8ofzHXs59xtS6Tnx5oHs21m1v
         BTL8pNDeWIl5qSzaoM7T/fSbCcX5rg9ihDdDj9dk2gU37QcxKH9SGqMpa73QTKgsynXf
         9DxC2XPcMrWUsYFdRAtapY2Yl792TDZSINQZYN+eky1aAKbt/GYR7LmZIIui3lsiKOTh
         r7iGKYAaNRMn2dwIytAUphWW0gfZwsNsK5+g8y/tWlW09VrqnIWJJ9to1izmnNWvZCjL
         MPNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=2fh7R+8P/2acO/tSXxa6JUuKvQWyL44+htLmxYHAaTA=;
        fh=8Hi1mM9PvuZESUg3gDSY3WKZRanHjWKOCaQg/yljAXM=;
        b=KQNfHZfZBFiyLzeV9G2LuK3DHaB9ORKrFm8EwWNP9043eRrC3WsKxrA5GDOeOj+zIw
         DgR1w1CacriIPH6Sq9sPgEI8jOq1fGrg4H5X8KBuJLnIYEOQRrCc7WCdqpSf+7MidO6n
         oq/YL/XKXXllzC5PgIsBKMPwYezDm1rTgx/tz2eQm5BbEdtSrEZZSXbBJdoKkT7eb33A
         izBpZeQIrLHr25GORCJ6JGNWpdfh0x8hHmOtyk/nzDUuz7baqRB2xrzatsee823MOmU9
         vFNFRN5nj2jXwwGZVMYs5EIAlcYZbmdvwgYnQldVSDEt0pwNu4632DatvV2nnD0cXc6K
         3Acg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jphein.com; s=google; t=1775862414; x=1776467214; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2fh7R+8P/2acO/tSXxa6JUuKvQWyL44+htLmxYHAaTA=;
        b=CxBF6S+B+NctWnFN+Pg0xBOPws1bh+Y9KrC0HvWw26WaOm7uKiWRhd9jdGf9LvdyRT
         Ar/rCH5YQluU176WKoiGPWNzD1AT28GD+eBmJke5RIeSC01voG2IGD4sylD58Du4Kh+y
         C1qCXWU+7lf9W+aP1zKkrtIywYGBgfNvwn6TL+2iKWR4z8vEbkYDRCvG8MCG89SiXnDH
         incZLpRGskBmApv52qTtBcg2hykRQZFZ5610rBApUYOqtLycxHl1YYyJQcojK/528Zs0
         ecaQz0dt4eZ7tOTCP7p6C6bYq6mxloyLsR6Nf1KCkIg5IFJH4VsqboTlIBmnJJnUjzbL
         B5sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775862414; x=1776467214;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2fh7R+8P/2acO/tSXxa6JUuKvQWyL44+htLmxYHAaTA=;
        b=eypBC79dSnXitKm7aCWUYRWa4sDJXEmTCOliUwIsn5x3qCw58GzorESraGAOX8Hya8
         RFu5z0YY7GLYQIcXBDy3v13hfqP/InMViN0sV2V+PUvXqb4bsUeLDoMeMzgjBponNHGX
         TiDa5qfA7wp4QNvtpYV4cq6GAoTS+RO8bDykaoWGgMQ5qq2Jb8+xGg2e4rj+fKMGQsk6
         d4ofi7xqe7ZCSi4f8R2UegGPwXFK+0kz2x5NfwIAo70wNdJrN/rB37WF2Gi/MzTk90eL
         h7fVOuT6z9HE6dJViv/JuNOHWQNZny1iP+y4tRtkI7PyMB9SJhcyoCaLhLyH6mP0YSNx
         UJoA==
X-Forwarded-Encrypted: i=1; AJvYcCV34TW/tX6e+vJeCPcj2nwmHiVkwzTqGcaqFAB0iq1uh21cqbsvY4m2KHHiuir9l7VrSADiIf3+y64=@vger.kernel.org
X-Gm-Message-State: AOJu0YzrqsVf4/X726dL5D5xr6+BBek3ise7BA9qH3pNRA8O6jAiPioi
	DK3SP1saqUqyP/85aXVrrcaTMBULJ974YnTcMewmvucH5Nu3pR00cknDV9+BlQAkms1gGY8gajq
	TPTvOUv0IQ3uyTsjOABsuPwnDXJBKBAjhZEREmiy3
X-Gm-Gg: AeBDietcnLcpsFL1i/in2Tj4VAtQNubLt2tkVJYPsdneknyS5dI4ZV6V3f7I6hSLYnk
	Qwv2T1xCRyIAO0kn67ZhNCo3wAuNADeKSvj2wI2lPO0PnBSNHGgS2p/JTx8+uIaJOkEQIDGq5JF
	0g2RsY2ZSWv82lSUYxop7/OTOG6nNBM4iHav93FNgtdVYkv6X8tTf7qjoSJBAW3AmSNucAZxkPz
	U26SCbdpXDj7GkeofvsaJeeo9utFhTyDcBEIBvceiHsaQiuJQi6ozHPjiP6lNJ3vl6L1QZnOjYh
	FGomVzFjq+sjADkQk6EF5al40l5Y7j+PWfzRw2x0YevjZ5TDRHDHvYDFq1D4LNWexQ==
X-Received: by 2002:a05:690c:dd4:b0:79a:b9cc:2100 with SMTP id
 00721157ae682-7af7157044cmr50486617b3.35.1775862414318; Fri, 10 Apr 2026
 16:06:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260331003806.212565-1-jp@jphein.com> <20260331003806.212565-3-jp@jphein.com>
 <CANiDSCvsxP+npQTHUrMTp+Z8XULYKSLTz2AFu+WQnsLbRBGa2w@mail.gmail.com>
 <20260409100247.7cfb62d1.michal.pecio@gmail.com> <20260409221749.5e6bccab.michal.pecio@gmail.com>
 <c4275422-a9b4-4519-95f9-1163a7912709@linux.intel.com>
In-Reply-To: <c4275422-a9b4-4519-95f9-1163a7912709@linux.intel.com>
From: Jeffrey Hein <jp@jphein.com>
Date: Fri, 10 Apr 2026 16:06:43 -0700
X-Gm-Features: AQROBzDzBZVABH3ehzq4hyArtfnxqlwCBGOOvEjT5kqYCvtlbA96XOybKX-WyUw
Message-ID: <CAD5VvzCEV_XbHc_Gby7mFPBSgSebqKDKJf3VC8HNRrD+xWaTJg@mail.gmail.com>
Subject: Re: [PATCH v5 2/3] media: uvcvideo: add UVC_QUIRK_CTRL_THROTTLE for
 fragile firmware
To: Mathias Nyman <mathias.nyman@linux.intel.com>, Michal Pecio <michal.pecio@gmail.com>, 
	Ricardo Ribalda <ribalda@chromium.org>
Cc: Alan Stern <stern@rowland.harvard.edu>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans de Goede <hansg@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-media@vger.kernel.org, 
	linux-usb@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
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
	TAGGED_FROM(0.00)[bounces-36149-lists,linux-usb=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[linux.intel.com,gmail.com,chromium.org];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,jphein.com:dkim]
X-Rspamd-Queue-Id: 933633DD656
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, 11 Apr 2026 00:48:05 +0300, Mathias Nyman wrote:
> One theory could be that xHC control endpoint refuses to restart when its
> dequeue pointer is moved to a no-op TD like in this case (second cancelled
> URB).
>
> This can happen when we cancel two control URBs at the same time.

I tested Michal's xhci patch (max_esit_payload clamp + short packet
err_count reset) on a custom 6.17.0 kernel. Two separate tests below.

Hardware: Intel Cannon Lake PCH xHCI (8086:a36d)
Device: Razer Kiyo Pro (1532:0e05), bcdDevice 8.21
Kernel: 6.17.0-xhci-test (vanilla 6.17 + Michal's patch)

max_esit_payload 8 -> 64 confirmed firing at boot for EP5IN.

Test 1: Michal's xhci patch + JP's UVC patches + NO_LPM
=========================================================
Active: usbcore.quirks=1532:0e05:k (NO_LPM), DKMS uvcvideo with
UVC_QUIRK_CTRL_THROTTLE, Michal's xhci patch.

Result: HC died. The crash sequence from the full log:

1) 437 repeated Cancel/resubmit cycles on EP5 IN (ep 0x85, slot 5
   ep 10) over ~7 minutes starting mid-call:

  [15:18:58] Cancel URB 0000000028356cb5, dev 3.1, ep 0x85, starting
at offset 0x114a49080
  [15:18:58] Stopped on Transfer TRB for slot 5 ep 10
  ... (437 cancel/resubmit cycles through 15:26:04)

   This is the same "repeated unlinks on EP5IN" pattern you noted in
   the March 30 stall-6.17-stress-during-call log, Michal.

2) After the last ep 0x85 cancellation + endpoint reconfigure (add
   ep 0x81), ~994,000 spurious SHORT_PACKET events (comp_code 13)
   flooded the HC for ~5 minutes:

  [15:26:04] add ep 0x81, slot id 5
  [15:26:04] Successful Endpoint Configure command
  [15:26:04] Spurious event dma ..., comp_code 13 after 13
  ... (~993,703 spurious events through 15:30:48)

3) Control transfers started timing out, with miss service interval
   errors on isochronous eps 2 and 4:

  [15:30:48] Cancel URB ..., dev 3.1, ep 0x0
  [15:30:53] Cancel URB ..., dev 3.1, ep 0x0  (5s stop-ep timeout)
  [15:30:53] ThreadPoolSingl timed out on ep0in len=0/2
  [15:30:53] Failed to query (GET_CUR) UVC control 6 on unit 1: -110
  [15:30:59] Cancel URB ..., dev 3.1, ep 0x0
  [15:31:04] Command timeout, USBSTS: 0x00000000
  [15:31:04] xHCI host controller not responding, assume dead

Full log (2.9MB gz, 1.06M lines):
https://github.com/jphein/kiyo-xhci-fix/blob/main/kernel-patches/crash-evidence/crash-6.17.0-xhci-test-20260410-152541.log.gz

Test 2: Michal's xhci patch ONLY (clean isolation)
====================================================
Active: ONLY Michal's xhci patch. No usbcore.quirks cmdline, stock
uvcvideo (DKMS module disabled), LPM and autosuspend at defaults.

Result: HC survived.

Video call ran successfully. Then ran stress test (rapid v4l2-ctl
control transfers -- focus, white balance, exposure, zoom, brightness
cycling). Firmware locked at round ~23:

  [336.489500] usb 2-3.1: pipewire timed out on ep0out len=0/0
  [336.489503] usb 2-3.1: disable of device-initiated U1 failed.
  [336.489510] usb 2-3.1: v4l2-ctl timed out on ep0out len=0/8
  [336.504055] Transfer error for slot 36 ep 10 on endpoint
  ... (repeating timeout/error cycle every ~5s)

Device firmware was completely unresponsive, but the host controller
survived. No hc_died(). The transfer errors were on ep 10 (EP5 IN,
the endpoint Michal's patch targeted).

Full log (1.2MB gz):
https://github.com/jphein/kiyo-xhci-fix/blob/main/kernel-patches/crash-evidence/crash-6.17.0-xhci-test-20260410-154243.log.gz

Full dmesg:
https://github.com/jphein/kiyo-xhci-fix/blob/main/kernel-patches/crash-evidence/michal-only-stress-20260410.log

Summary
========
In both tests, EP5 IN (interrupt, wBytesPerInterval=8) was at the
center of the problem. In Test 1, the repeated unlinks on EP5 IN
led to a spurious event flood that eventually killed the HC. In
Test 2, EP5 IN had transfer errors but the HC handled them without
dying.

The key variable between the tests was the UVC throttle and NO_LPM,
not Michal's xhci patch (which was active in both). I don't yet
understand why the additional UVC-layer mitigations would make the
HC outcome worse, not better. Different test conditions (stream
teardown in Test 1 vs active streaming in Test 2) may explain it.

Michal, re: lsusb -- I built usbutils 019 from source and confirmed
it decodes wBytesPerInterval natively:

      Endpoint Descriptor:
        bEndpointAddress     0x85  EP 5 IN
        bmAttributes            3
          Transfer Type            Interrupt
        wMaxPacketSize     0x0040  1x 64 bytes
        bInterval               8
        bMaxBurst               0
        wBytesPerInterval       8

Full lsusb -v (usbutils 019, 927 lines):
https://github.com/jphein/kiyo-xhci-fix/blob/main/kernel-patches/crash-evidence/lsusb-v-kiyo-pro-usbutils019.txt

v7 patch 2/2 included lsusb -vv (934 lines). If lsusb -v is preferred
I can swap it in a v8.

I have other Intel machines available for testing if you'd like to
confirm this isn't Cannon Lake-specific. No AMD hardware currently.

JP

