Return-Path: <linux-usb+bounces-35304-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KBn0JCL0wGkwPAQAu9opvQ
	(envelope-from <linux-usb+bounces-35304-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 23 Mar 2026 09:04:50 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id ED75E2EE091
	for <lists+linux-usb@lfdr.de>; Mon, 23 Mar 2026 09:04:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6D66E302DB42
	for <lists+linux-usb@lfdr.de>; Mon, 23 Mar 2026 07:58:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27A117404E;
	Mon, 23 Mar 2026 07:58:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kHGMaVf6"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56D4936405C
	for <linux-usb@vger.kernel.org>; Mon, 23 Mar 2026 07:58:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774252735; cv=none; b=CrJq8ewPimMFE1HDy3ye/Gqf3jZuH7xI+Stx5FoiknfctbS3imKo9eaFF5XBlS/NJwfYHypEBRrk4c+ifDgc/ZW5lLcItIjHm6De961jdvPZb32aX+bh5QtBow51ahmXatg6fXQ1EGQFjZqqPFdw2FYKDRklMg0mewqBB0gJJjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774252735; c=relaxed/simple;
	bh=4KQcuvo6YzkNDD9zHDEoEGiEyr7Ep7oCDyKiODpqBMo=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Lrrle/fhuGKTgL8sy/hVO+2IKl4NDm14Pzun12ttGBr3NZ3KjUbaGqzYGFs9oP1OnAribHqgKXCFPH9m0XUHYzuKHBCI5gmL/JrQo79V33YF62AAOhAgUQWabqVSu6qd9VevKOPeqMAvg3xG3RC0dhpDkLFS6BXK2/BcTaNANao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kHGMaVf6; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-669efe709feso427116a12.0
        for <linux-usb@vger.kernel.org>; Mon, 23 Mar 2026 00:58:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774252733; x=1774857533; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yAX/7cErjTnTYB1b0qlUk9SWpyIXQDOX196VDxiUGag=;
        b=kHGMaVf6oaSieW8TMme+wP/JJEeDVZkM8zv7aDQdOJuj3rxPrLY1TsEeyHXkoNPKB+
         VxQENmtJTs/RlOFymttqAq5h2sA/n8gbbYmFTf3wmotN4zJzGokU8YRHNCNHohKjl1HQ
         EIa5uO+pJkjdBYlNPaES8SNlxusWUBThq97kfyDv1WSwjridmTljvnktSSwWmSqnL+20
         QNkzlHwM9Qqd5Tf8ujZXO8E9ZTri2udejKSK35kopLlmnOBoCgOnj2yx0MUCQ6Cw2ius
         1j/ptNapehRSAUl6MT77b5XFzULBAp6kcu8Sgcx2yf+1S7orWOjXY4aTcnjA8tIRUtLI
         ecdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774252733; x=1774857533;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yAX/7cErjTnTYB1b0qlUk9SWpyIXQDOX196VDxiUGag=;
        b=e+844Jpx/8cVmAQ5ikjrHLpPN+59r6VQoFKW8Llzn2r9UrS3JKqua3QbpSYlBkkk/7
         bD05owb/9WZMVbofYpGHjQDMd2pQNZ2gfnDwIVM2eIFg7L3Sc4vPXhed6fGXUsUVFy8G
         gfhk9+Qnfye7FtE+2uEOTahAljXdRJk/g6DHd1VJ/sMOBNuwkOvoLCh9mmkV35+vx4q5
         c3HZ/0URV2HjJMOCkTxDF7XZ2R6QTGDZd6fpTOhCsqDfKdVjNbj2L9sHB6m2namXjgaR
         u+1MqWRvHBkAvmsXtXhiJuscG7XMPL2KZlkV6exUmCbva3MevCWKs1yG91F9RAMrYyYY
         cqBg==
X-Forwarded-Encrypted: i=1; AJvYcCXlzTySAasrrxXIuf2GjQgZelYBpr+t/4ndGWfaumFWZq1xIY0GcAN+tTEzSQrbS9NSsUSavjOcKHY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwHPbyKDjaNd14uhlJlebCBNWFoxm/qUu5N4yeMPK9fbpLtrmiG
	P3lrIZ2p3YKY0iwTA3D/kiGtR5U8WDfCf4SWplBG7Rw34oY9KBSwg+FH
X-Gm-Gg: ATEYQzxE0nwarpxJQmNt5tdFsIlFcOthQ7HgtrO02MnTF7LJJa8Cxei9efvToCTFkP2
	N5EoM83KtTydHKiYjlccvLTDexDOutn9OMOQVFb+ogBN9QXwZ2hDie/YtZAYxHig25NZkEFvjjQ
	g4BNrlVGGHbQH8fb4EfcpcS/Ia4jE0iVYxf77aYcYP8wdlu4TfU9ZBG4xFumeKDeFaecua7wEJ7
	hU5A1Kbnu6HgCg/Mt3a68IvnA3KiVqg6Bv5yiH3BaYaQ6DUrYmK2ocsVIde8tIALXdW8jl+Aaxe
	6YvIUKmR5YikJzorWX+LJTshfyvB7LeLPvy/wgBZER0y6ks9QILUIhtfnDpYYQla7BrA5vhyaAB
	DYQFKyX0LWTBIWlUThzt1OOGSto3vHLXbfj12s/KJS1ru+5T8RhTUrWyqIrUnZza7Wmb9kvCFOR
	4aMW7OA/uFLKxAC7Opsa9QEeT1QqlwHqtHBe0=
X-Received: by 2002:a05:6402:5187:b0:663:4560:aa8d with SMTP id 4fb4d7f45d1cf-668c9c40bb1mr7954797a12.26.1774252732415;
        Mon, 23 Mar 2026 00:58:52 -0700 (PDT)
Received: from foxbook (bfk214.neoplus.adsl.tpnet.pl. [83.28.48.214])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-668d2390f7csm3370406a12.24.2026.03.23.00.58.49
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Mon, 23 Mar 2026 00:58:51 -0700 (PDT)
Date: Mon, 23 Mar 2026 08:58:45 +0100
From: Michal Pecio <michal.pecio@gmail.com>
To: Jeffrey Hein <jp@jphein.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans de Goede
 <hansg@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-media@vger.kernel.org, linux-usb@vger.kernel.org,
 stable@vger.kernel.org
Subject: Re: [PATCH 0/3] USB/UVC: Add quirks to prevent Razer Kiyo Pro xHCI
 cascade failure
Message-ID: <20260323085845.6bf57b3b.michal.pecio@gmail.com>
In-Reply-To: <CAD5VvzBE8Oq80EhFZnZ7kNrRC_rpoR25Ct5-Fg62yDZUHVtWzw@mail.gmail.com>
References: <20260321223713.1219297-1-jp@jphein.com>
	<20260322055354.03399a32.michal.pecio@gmail.com>
	<CAD5VvzBE8Oq80EhFZnZ7kNrRC_rpoR25Ct5-Fg62yDZUHVtWzw@mail.gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-35304-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michalpecio@gmail.com,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,stress-test-kiyo.sh:url]
X-Rspamd-Queue-Id: ED75E2EE091
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sun, 22 Mar 2026 15:10:28 -0700, Jeffrey Hein wrote:
> Both failure modes are in the device firmware (version 8.21), not the
> kernel, so they exist on any kernel version.  On 6.8.0-106-generic
> (where I tested), the TRB_STOP_RING case in
> xhci_handle_command_timeout() goes straight to xhci_halt() +
> xhci_hc_died() without attempting per-device recovery.

Command timeout is a failure of the xHCI controller, not the device,
and as Alan said, it's generally not supposed to happen so we are
curious how it happens and if it can be prevented in xhci-hcd.

Device behavior may be a contributing factor, as can be a kernel bug
or controller HW bug. It would be helpful if somebody tried this on
non-Intel hardware and on current kernels, because there were various
changes to xHCI error handling over the last two years.

> The stress test script is in the series repository:
> 
>     https://github.com/jphein/kiyo-xhci-fix
> 
> stress-test-kiyo.sh exercises UVC controls via v4l2-ctl at maximum
> rate -- brightness, contrast, saturation, white balance, exposure,
> focus, pan/tilt/zoom -- cycling through their full ranges each round.
> With 0ms delay between controls, the crash consistently occurs around
> round 25 of 50 (~5-10 seconds of sustained rapid SET_CUR).

OK, I will see if it does anything interesting on my hardware, but it
may be nothing because I don't have this camera.

Did you try it on a different camera in the same USB port?

> That said, the firmware lockup itself is controller-independent -- the
> device stops responding to USB control transfers regardless of the
> host controller.  What varies is the host controller's response to the
> resulting stop-endpoint timeout.  On 6.8, xhci-hcd takes the
> TRB_STOP_RING timeout straight to hc_died()

Nope, this is controller dependent because Stop Endpoint is a command
to the controller and it has no reason to fail. Something is broken.

Could you boot a newer kernel (compile 7.0-rc5 yourself or at least get
latest release (or beta) of your distribution), enable dynamic debug 

echo 'module xhci_hcd +p' >/proc/dynamic_debug/control
echo 'module usbcore +p' >/proc/dynamic_debug/control

then connect the camera, crash it again and send dmesg output?

Regards,
Michal

