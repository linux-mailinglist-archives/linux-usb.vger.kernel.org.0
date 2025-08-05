Return-Path: <linux-usb+bounces-26503-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 08ACFB1BCBB
	for <lists+linux-usb@lfdr.de>; Wed,  6 Aug 2025 00:41:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9F5B018A4E61
	for <lists+linux-usb@lfdr.de>; Tue,  5 Aug 2025 22:41:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 402B826D4E3;
	Tue,  5 Aug 2025 22:40:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="MBsLs35b"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 952E423ABBD
	for <linux-usb@vger.kernel.org>; Tue,  5 Aug 2025 22:40:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754433658; cv=none; b=OK2CA+SMdsJgspMrvwvf/9HhNE8xt1D21aT8fsl5J2YpuRzEjxdsTgsDShAMUCUQneoKuJdM2G/ZM/SY9CZni401cHIf2dKl4H3aL6hrM4BtOM8mLmSy8iZoh1whh0Cy/xSGdmIyenJx5KcYxUctgTtsICOcG0avlq8p7lQBTiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754433658; c=relaxed/simple;
	bh=zS1zWvhTT+IcSshTBcgi0LvYfFbo8Wss63zrFGwEmv8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Dgs8O9j/Uu5aGSEuNC6fKFfHVrfu0maJCU9MHlJIJInc7vRaP5vH4PHVtvp5W0ZO7Gbp4nn2ucUgfQRBgYaFLWY7dLOfrC3zuW69pJaydYxbooOoYuhqm4VnDOxxFjH/xeFrYe1YsAC/sURJVx/uVvj5+IX4e2GA8kGpDaNBvRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=MBsLs35b; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-615d0b11621so582851a12.1
        for <linux-usb@vger.kernel.org>; Tue, 05 Aug 2025 15:40:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1754433655; x=1755038455; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=X3m+xXB2nDYY2FTeCIps+Dx8G8ytYsYqX18zczPNIoE=;
        b=MBsLs35bqACeSKK91IC+0gMlre/rcy5m80+cOlXs+F/xIo0hHhAuTNmcpjWfwL4rkp
         Dpr/cKht4/giV33kEEzCUsizwY6Sj4D0bNb+zyQJVoHYjko1/GxRAIY68BTe0poDZqnS
         7OHKDGSIcDlb1eHgHWwIl6azEyR7aTYt5J7sQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754433655; x=1755038455;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X3m+xXB2nDYY2FTeCIps+Dx8G8ytYsYqX18zczPNIoE=;
        b=NslQEZ8iuQhe+zyi50SBP3oPSsXEjFsREMOjXXA75UG94QvV23XSpUjaKypen++BrO
         5kxeaMvrykiR8U6YJfP7aW+QNJr3ZSJWwlMatAFkRGH7Aurd1mUI6voAtBECEorKdqPL
         WxQ6Ce4BXKmK7XhMV1gNj+yFTvkmwpYfmkVOl9sX7p2yGjLlhaNzDrXruYjZWHiK7JH1
         8HTuAT4ZsEzzgvgbZkwU+dx8QZ3DXgITThEvHkyYqDFx1bS0Dgl1HgMpZdlgfzHzVPxl
         C27M/ACU2FGc/1Ws4cbW7WL2w5EFOduCeNWtdpimBuKXWp7NDAl5m0gblRspm44YN0eD
         ugzg==
X-Forwarded-Encrypted: i=1; AJvYcCW6koUNfj6Rq6dvV0w6phBbGx0RqZWyVjVebjlINY3Oo6kPus6BVJJFytZYF/sjS7v10NslOY6B4Fc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzrPAsIM507jDGCmm2fz1p5TcrRS8XvKFyzXp953EMlUOe1lNVS
	4FQ6dgg1b/HA5IcG9qtReSq4R5JhKT6KGIS/qcm5gUutiWVZlmXq7DWUgsSUIKsHc8NaYCGFCYT
	4qS9pdyGKhg==
X-Gm-Gg: ASbGnctTgJ2iJH+uB7hNy1nzFusMiVJcrFxLJ3KzMPdJ+JKWK1LgrMAHk4gd08+PVZV
	EjkfYwzndn/kFcURiUvQ9cGIW0/iYbwjAbfdTluKRqdN2WlLb5azOeyvqz1jWtB5GDeFH2W5Pqa
	B+AJgnv2YEchBuazztOHm3GuZ3tp+cAaJFxhVjO5Q8COvFK3DjLvHMLxu6KSLDy18vte0cu7ivk
	xSId3eDlTI/GobiUHmykhgZiDCzUjik3727d9FN5O7geG7kPEcIqs2rIxygKV9wrqdADcxO4Sq8
	bdiEJc4tY7kKo6y4+izretbY9euZ6b35hkScXc11zKaEhlSj4oajoh6iO84XCee7Cb69yExGLzC
	fQfCGIQlePDsiYGOJ/X58TOWrbnm9kP7hC3d7IifrasZdvyNa+h3gO0ZLIfF51qEcC21VQ2mz
X-Google-Smtp-Source: AGHT+IFQb0ymL4LkaMfpoLFxjZzpiBBcB5V5+AM9jpsA/UF1JLJvB7HjusFV89MmTHf/vWsupVp8hA==
X-Received: by 2002:a17:907:948d:b0:af9:6c38:c4ff with SMTP id a640c23a62f3a-af990915008mr55234966b.19.1754433654722;
        Tue, 05 Aug 2025 15:40:54 -0700 (PDT)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com. [209.85.208.41])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a1e833dsm967992966b.64.2025.08.05.15.40.53
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Aug 2025 15:40:54 -0700 (PDT)
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-61576e33ce9so666013a12.1
        for <linux-usb@vger.kernel.org>; Tue, 05 Aug 2025 15:40:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV9gZsqhf7n1WCCx14dVr/IPkJ26+6d2o+hdxWaEdYQidMUFlk2s2BTK9aTCaNJm9G4viUTb0VXQYk=@vger.kernel.org
X-Received: by 2002:a50:d6da:0:b0:615:1ffe:7e13 with SMTP id
 4fb4d7f45d1cf-61796e84ddamr347112a12.16.1754433653535; Tue, 05 Aug 2025
 15:40:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250801190310.58443-1-ammarfaizi2@gnuweeb.org>
 <20250804100050.GQ8494@horms.kernel.org> <20250805202848.GC61519@horms.kernel.org>
In-Reply-To: <20250805202848.GC61519@horms.kernel.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 6 Aug 2025 01:40:37 +0300
X-Gmail-Original-Message-ID: <CAHk-=wjqL4uF0MG_c8+xHX1Vv8==sPYQrtzbdA3kzi96284nuQ@mail.gmail.com>
X-Gm-Features: Ac12FXzn6xC3GEWZwV8GpsWb-o1g1X9WA5sVZ0frXqURB1sH9fEGM06GbVjXWic
Message-ID: <CAHk-=wjqL4uF0MG_c8+xHX1Vv8==sPYQrtzbdA3kzi96284nuQ@mail.gmail.com>
Subject: Re: [PATCH net v2] net: usbnet: Fix the wrong netif_carrier_on() call placement
To: Simon Horman <horms@kernel.org>
Cc: Ammar Faizi <ammarfaizi2@gnuweeb.org>, Oliver Neukum <oneukum@suse.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Linux Netdev Mailing List <netdev@vger.kernel.org>, Linux USB Mailing List <linux-usb@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Armando Budianto <sprite@gnuweeb.org>, gwml@vger.gnuweeb.org, 
	stable@vger.kernel.org, John Ernberg <john.ernberg@actia.se>
Content-Type: text/plain; charset="UTF-8"

On Tue, 5 Aug 2025 at 23:28, Simon Horman <horms@kernel.org> wrote:
>
> I have looked over the patch and it appears to me that it addresses a
> straightforward logic error: a check was added to turn the carrier on only
> if it is already on. Which seems a bit nonsensical. And presumably the
> intention was to add the check for the opposite case.
>
> This patch addresses that problem.

So I agree that there was a logic error.

I'm not 100% sure about the "straightforward" part.

In particular, the whole *rest* of the code in that

        if (!netif_carrier_ok(dev->net)) {

no longer makes sense after we've turned the link on with that

                if (test_and_clear_bit(EVENT_LINK_CARRIER_ON, &dev->flags))
                        netif_carrier_on(dev->net);

sequence.

Put another way - once we've turned the carrier on, now that whole

                /* kill URBs for reading packets to save bus bandwidth */
                unlink_urbs(dev, &dev->rxq);

                /*
                 * tx_timeout will unlink URBs for sending packets and
                 * tx queue is stopped by netcore after link becomes off
                 */

thing makes no sense.

So my gut feel is that the

                if (test_and_clear_bit(EVENT_LINK_CARRIER_ON, &dev->flags))
                        netif_carrier_on(dev->net);

should actually be done outside that if-statement entirely, because it
literally ends up changing the thing that if-statement is testing.

And no, I didn't actually test that version, because I was hoping that
somebody who actually knows this code better would pipe up.

                Linus

