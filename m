Return-Path: <linux-usb+bounces-35627-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ELYsDZ5IyWl9xAUAu9opvQ
	(envelope-from <linux-usb+bounces-35627-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sun, 29 Mar 2026 17:43:26 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AC9FF352AC3
	for <lists+linux-usb@lfdr.de>; Sun, 29 Mar 2026 17:43:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9231A3021B3B
	for <lists+linux-usb@lfdr.de>; Sun, 29 Mar 2026 15:40:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BC0E31CA4E;
	Sun, 29 Mar 2026 15:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ArmjnmeB"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2F01175A77
	for <linux-usb@vger.kernel.org>; Sun, 29 Mar 2026 15:40:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774798830; cv=none; b=Ug1SDSyEtbU/gc4ceVmrdhvlH2EJko7hS/QeusdG1Qw0xrnASf8kG/3jZywVUDyIjoKFoXsHht+K7xCR7ujID0VvkOxH/2zAELZOfs+GWOFsxMiDUt6O8mcTlJPgj7SSsaM2yprz60Blei/59O5AIeJfNDYFvvO6EJQ0z7OavSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774798830; c=relaxed/simple;
	bh=8apU0B3fbaHM+K49pJhbNmwWZqpX90u0ey0dDQIekJ8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mXP5zSDZCFxsNIhuNq766asAQb/TsNTddH2HAa8g0uhxPl9JbM2nyeL5qCawlury+ysEghwjvpChgfIlhe3bS26FVZa5s6mcwFtGTzDOp1RFdg1PrI5gEBtXRVB+8pcq9MAy4E8nfruhESFwJitwnxydXQNbSbOydpI9Jr1hjAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ArmjnmeB; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-66ad907833dso6412151a12.3
        for <linux-usb@vger.kernel.org>; Sun, 29 Mar 2026 08:40:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774798827; x=1775403627; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jO7SbHDenYF2z2Mmy1AKtMlG0wX0LKgJ7wQHanxgzJo=;
        b=ArmjnmeBROTpOCowAVnKISrVXa0DMwcpoxKvblXTYsFOUxBp3sP0BEDB0lBerQMnLf
         RusaPu0DUjHAEXCV4nQpuejRR5/orM1MYI68ANpjkD+St460cNVj6FFN5OF02wHKiTvx
         X//mMBs+qSbvgUlIJGBZ2OYxs21s65zy5GKA99agedugIf5vDsePjgblaOpxS/iwJXX8
         RK4NugGV6h/N8cwfgImsuMdbHPlhXbaaWR5jL7lTOVjnn2Yc5OIMBvl8/nJ4PEK811ao
         3/RchuFe9OrwWu6fuJO0H6BwgSqK8VeGPKgE3AzS7Hv3JxbqHZny8sV6HGbjXRpWil7p
         Oxmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774798827; x=1775403627;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jO7SbHDenYF2z2Mmy1AKtMlG0wX0LKgJ7wQHanxgzJo=;
        b=GpSazNPYCsxXEhc05PEMASdQA+ofzTr4IFhjbq7k6QsOr39Z3MKQ4KDp7VhTxsclrq
         hAlHRq2bdUrXi+Q80+C4pSrA2kFR5EWJ4+XQ0hHyYvYj4BYl4L+cZtV9E2ToCdcVpNNk
         g/X3qTWY5FRRaCHwPLPiKZ3ZBDMcV0dioAIn6fMaXZRPn6CKZpzz+r7vtTon/mRanXOF
         aZK6Dp1k83o9wRUeKhBb52cBqoYif3w0XsKdzVtPTDquAETE6+4jr0t5Kp+97maPO11x
         HjQykD6za+HKQDnqEmeXKtftCXhxgCZgB+Nzq3SPitNsDnBSVhHYlCVDVgyy0mbKFLeM
         jhsg==
X-Forwarded-Encrypted: i=1; AJvYcCUasQOVbwb3otS9ekFk67MnphK9AYhGYvGxcwVFfUPLeSZUk0dkDP2pXl0JSgrtkoNXI8lXhACm+fE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4q2Jwwtj5wWWsyyYWYLqri/44aW/I0PK7hCnHYAtGbsXutLAv
	AkMWBFpjaFnFZ2wJZ6pqNXT512nJJA+mjo6870F+ltt5bLjOv405hzUG
X-Gm-Gg: ATEYQzwx8JZnJCJ2J095qr/gMacwPeylkxwLXvznCQsZTWSfWTNVsBnchKh8bAb2aZx
	zjbw0+k5Rj0df7hWsD2GEOyF29mFW+nO/gE9mqiYLBT8E7Fq4hklXRTy2i4CMKzwCbulUyshqs8
	ODfP9ew9kuGnbrd8op+x56Lyv86pBx7++dJO9C1TwXCV/bIdEa7K+kl7LpWNGiaFX0+M8knwzfW
	o3XMAuYEnLQLUeDu6UwuHkvacjHmUJa6tnQjMBGJpoHTeCYRPNe8kJB5TVVKZh9EG+CQCDEtsNh
	y4lWulkhAFA/4G/Oz6Fq+ixEHtAOQJdTcZbPXEu2dEhp1XCGzd/mqkFidsQAWtMfCK8RPIO0Yc7
	hlaWhhmhGxF8v2W5IMzGqViFT1DjRUJcJX3cHUkAN+adcZcVRW9LhXt0XoYFwFVRh+yedDfO3ZB
	yXE1MkJxrpyyJ24fVVDdAyMYCuf+mvtPI8
X-Received: by 2002:a17:907:a28d:b0:b98:22e7:72b with SMTP id a640c23a62f3a-b9b507a7bf9mr533680266b.30.1774798827144;
        Sun, 29 Mar 2026 08:40:27 -0700 (PDT)
Received: from foxbook (bfi53.neoplus.adsl.tpnet.pl. [83.28.46.53])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b7b227393sm175930966b.63.2026.03.29.08.40.26
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Sun, 29 Mar 2026 08:40:26 -0700 (PDT)
Date: Sun, 29 Mar 2026 17:40:22 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Jeffrey Hein <jp@jphein.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans de Goede
 <hansg@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-media@vger.kernel.org, linux-usb@vger.kernel.org,
 stable@vger.kernel.org
Subject: Re: [PATCH 0/3] USB/UVC: Add quirks to prevent Razer Kiyo Pro xHCI
 cascade failure
Message-ID: <20260329174022.6513d797.michal.pecio@gmail.com>
In-Reply-To: <CAD5VvzDWF7SO0Aytp3K_uXV6ZYoqEqN1dhfv7VtMAHSpHP+qTA@mail.gmail.com>
References: <20260321223713.1219297-1-jp@jphein.com>
	<20260322055354.03399a32.michal.pecio@gmail.com>
	<CAD5VvzBE8Oq80EhFZnZ7kNrRC_rpoR25Ct5-Fg62yDZUHVtWzw@mail.gmail.com>
	<20260323085845.6bf57b3b.michal.pecio@gmail.com>
	<CAD5VvzDWF7SO0Aytp3K_uXV6ZYoqEqN1dhfv7VtMAHSpHP+qTA@mail.gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-35627-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michalpecio@gmail.com,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: AC9FF352AC3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sun, 29 Mar 2026 08:03:42 -0700, Jeffrey Hein wrote:
> I have now tested on 6.17.0-19-generic (Ubuntu 25.04) with dynamic
> debug enabled for xhci_hcd and usbcore, and without any of my proposed
> patches or workarounds applied. No udev quirks, no LPM disable, no
> control throttle -- completely stock kernel.
> 
> Results: the stress test passes 50/50 rounds with 0ms delay. On
> 6.8.0-106-generic the same test crashed consistently around round 25.

Thanks for the update, that's good to hear.
Hopefully it will still work without dynamic debug too.

If you would want to fix the old 6.8 kernel you will need to talk with
Ubuntu about it, because that version is no longer supported upstream.

Regards,
Michal

