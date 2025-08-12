Return-Path: <linux-usb+bounces-26776-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C40FB23A4C
	for <lists+linux-usb@lfdr.de>; Tue, 12 Aug 2025 22:58:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5C72A7A89E8
	for <lists+linux-usb@lfdr.de>; Tue, 12 Aug 2025 20:56:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E97CB2D6E4A;
	Tue, 12 Aug 2025 20:58:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=j-ernberg-se.20230601.gappssmtp.com header.i=@j-ernberg-se.20230601.gappssmtp.com header.b="XmX097A4"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68B402C21C4
	for <linux-usb@vger.kernel.org>; Tue, 12 Aug 2025 20:57:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755032290; cv=none; b=btZLI3Utp2kTvCllCcAmVfnYPvHaeBjp7PDSFGXU9D2sBmkOS6NMYKrFGVDjDwIgFy2M/q7hoaEaNfiQa3aYj4sQ02tRfA8GOGcrF1ALpSS6E7t4pWpcX1eNR6p9NqIL6WyFLnL79IjURV9hWd3XE9ngqaATUxk0/wRw+HhwsMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755032290; c=relaxed/simple;
	bh=6Q4Oq/xbYw0awazOURcsOPsRowz4FU6cz3+FWT4ucTE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SCIVzB3dy7jRjuImWBzrM4l/klMEc4/rkvTWmtq8RM99f5oDdionLccOYGBAsweGwRckrxSrDp3UIMMvpp6qZPC8KZReSUcruhd3sYo3ZIy5QvjjQ+HQETKybKB8NdKlDiWxvyDXG5B9EjSSMyhDg4GMX0S+ufYGTM9hqwooc8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=j-ernberg.se; spf=none smtp.mailfrom=j-ernberg.se; dkim=pass (2048-bit key) header.d=j-ernberg-se.20230601.gappssmtp.com header.i=@j-ernberg-se.20230601.gappssmtp.com header.b=XmX097A4; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=j-ernberg.se
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=j-ernberg.se
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-55b975b459aso5095193e87.3
        for <linux-usb@vger.kernel.org>; Tue, 12 Aug 2025 13:57:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=j-ernberg-se.20230601.gappssmtp.com; s=20230601; t=1755032277; x=1755637077; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=I1HYkWTm//0TzFaX3HirV9CEefr3/XfGLtwUTGZHPfw=;
        b=XmX097A4d4aVc/Gm/pMW5w7QcjfhJBwgREdg5Ti/XzhesoiDcPOgUqMyo1c5m/21Mf
         rP2g7nDZt1SaXpStcfjFV49zpLaBGIxXV4b3Ag6tueKayOSo/ye5ODThF8WWauv69MhY
         FpdcZpLez17cagD3kwFo77yFfwBmHlSKRWduqXGf2QdguEVGZjZ2/ZJ0vFNrVsUmZN38
         Cj04P64hya7wsM3VQHzetfGfumlQ9CvVvkqQJZJ4bsTC3kfcaxY1JzPrUYx1cfWPaFxW
         1wM+PuLZEvV0pDsJnt+GX587fxcOtks42wqnE4JkM2zFQCEgM5kpZk/8BNzG06nsBLpY
         Cb8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755032277; x=1755637077;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I1HYkWTm//0TzFaX3HirV9CEefr3/XfGLtwUTGZHPfw=;
        b=jVCJILsMveD0yMW3AUyGClqmvbGVNXgkuUYPeuAO7xnml8/0cEVMSJ3fUGemhsSz2N
         /i6MVJMZ44FHkKzlevfU80eANKjXg0hc75H3c/qujnIJNmxT8o4rN4K8HHbzEafzjy6G
         vxCm5oD3f+IHFqMbxxED4yesPp1CyQsfyhwgVssv6tnO+hMFj3bwzPCInlDr2ertxpCq
         KTGvmSG2UnPtBpDkPQ0oytkEHfHfMvD9kMqCHw3F/CqZzVz9Tn9kwOZZ0lLssok+Pouu
         gBh+eW5XOUg2JGoAIO/leCfNaoTEw4Z+4cSbm3pEAZZepjOC8YXI+LDiiA7TgQkbRtUf
         S+RQ==
X-Forwarded-Encrypted: i=1; AJvYcCV5KFI2X5SvEq7JuvPqTgXxzk0t9H20iSpxRnXeH+p0E0NhJwnI2HXNxXchSPQmj/duUXTyxokW0RQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwEv77cYLnHwp19PMzycQgrDdbeDmFkiuwy14Q1d8/+cjgOQQ60
	/7LWdiL+F+Z61Pl1ni7MDEwh3Jgp6jQCs/VsR9XRNZXiBKg8FdD7iN+ob13JLrg0ysE=
X-Gm-Gg: ASbGncuB2qqwHJbXFP6t5V0onYGeeVcs/xp32YRdN2TNDRrDgFMrtm2JmzdWVx7nXyG
	suzjqTynhMLTVCDTLHClPvfOFLJkDf87ajvsVgqZvzAmLYIkV9Jlq7ToNsUQ7D/arsquHW66kaM
	EleE2qRJGkUTjIjNdNz+BkmaQeGdteSweCpOdZqlhkIaQcIvlySnK1g7jPILRDxKAw/gfOETDzc
	+S5NwdyQiXZWwP4FUrG3jcBvdrxcQK4vynbKjJwJZnvv6ySChJGsGoT0+YADNXa5QzkY24aGQLL
	eXvs8YqWtF9IDcbVDZBR9zrHhIvQL8StUKLAfaD927qQJMHlpMc9D+afyB/hrrkTkid7YgUGUkb
	5GSYXn/vHvckg5v6f+qH9nLpHp3IyHBqUxy1UuUbBbp4kYlsl9Q==
X-Google-Smtp-Source: AGHT+IGffUI/1EXOSK/t0KV6xGplfLMgAAk2k7PICLXaMIAixPTAVPj1NMw1SVef+Ih1sVF86CbZxw==
X-Received: by 2002:a05:6512:b12:b0:55a:4f05:6e4c with SMTP id 2adb3069b0e04-55ce0404609mr162441e87.49.1755032276914;
        Tue, 12 Aug 2025 13:57:56 -0700 (PDT)
Received: from localhost (90-231-233-65-no2360.tbcn.telia.com. [90.231.233.65])
        by smtp.gmail.com with UTF8SMTPSA id 2adb3069b0e04-55b88c990f1sm4946123e87.82.2025.08.12.13.57.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Aug 2025 13:57:56 -0700 (PDT)
Date: Tue, 12 Aug 2025 22:57:55 +0200
From: John Ernberg <j@j-ernberg.se>
To: Jakub Kicinski <kuba@kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Ammar Faizi <ammarfaizi2@gnuweeb.org>
Cc: Simon Horman <horms@kernel.org>, Oliver Neukum <oneukum@suse.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Linux Netdev Mailing List <netdev@vger.kernel.org>,
	Linux USB Mailing List <linux-usb@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Armando Budianto <sprite@gnuweeb.org>, gwml@vger.gnuweeb.org,
	stable@vger.kernel.org, John Ernberg <john.ernberg@actia.se>
Subject: Re: [PATCH net v2] net: usbnet: Fix the wrong netif_carrier_on()
 call placement
Message-ID: <aJuq00V5BD8OHGxF@nucleus>
References: <20250801190310.58443-1-ammarfaizi2@gnuweeb.org>
 <20250804100050.GQ8494@horms.kernel.org>
 <20250805202848.GC61519@horms.kernel.org>
 <CAHk-=wjqL4uF0MG_c8+xHX1Vv8==sPYQrtzbdA3kzi96284nuQ@mail.gmail.com>
 <20250805164747.40e63f6d@kernel.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250805164747.40e63f6d@kernel.org>

Hi Jakub, Linus, Ammar,

(sorry for the delay, on vacation, wasn't paying attention to the internet)

On Tue, Aug 05, 2025 at 04:47:47PM -0700, Jakub Kicinski wrote:
> On Wed, 6 Aug 2025 01:40:37 +0300 Linus Torvalds wrote:
> > So my gut feel is that the
> > 
> >                 if (test_and_clear_bit(EVENT_LINK_CARRIER_ON, &dev->flags))
> >                         netif_carrier_on(dev->net);
> > 
> > should actually be done outside that if-statement entirely, because it
> > literally ends up changing the thing that if-statement is testing.
> 
> Right. I think it should be before the if (!netif_carrier_ok(dev->net))
> 
> Ammar, could you retest and repost that, since we haven't heard from
> John?

I can't verify the suggested change until sometime in September, after I
return to office, but it feels correct.

However... I'm almost inclined to suggest a full revert of my patch as
the testing was clearly royally botched. Booting it on the boards I
have would have shown the failure immediately.

(I did see v3 of this patch being applied)

Apologies for the mess // John Ernberg

