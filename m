Return-Path: <linux-usb+bounces-27922-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 997ACB52CB3
	for <lists+linux-usb@lfdr.de>; Thu, 11 Sep 2025 11:09:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5353F16BCBD
	for <lists+linux-usb@lfdr.de>; Thu, 11 Sep 2025 09:09:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 946D12E88AF;
	Thu, 11 Sep 2025 09:09:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="3OBXkpl0"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6583E2E7F13
	for <linux-usb@vger.kernel.org>; Thu, 11 Sep 2025 09:09:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757581784; cv=none; b=ZPgmZ6uzb883/r0KsDzrEoBNEP1XLCvqKkliu+aQYX89tJlS5lQ3PZl1iASNOsOYhDHoNnFXZn/zxGy/+fD4W1C+hsQuZnmua20NZ7QLuKMJCNyAvnXBdUWKk5wBaHayRugZaSTPMgkSJQpN6VQX466xXZaqxaOBBfqqy+KNbf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757581784; c=relaxed/simple;
	bh=JT1E/i13IvgijLvsZgi5MJnurKxqHwmoQNRgLsvfswI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FoG4eauqDqjR4/Ag2Ips6BwrOPPHHxJ0nR277r20NcmHMiIeme3ID0eDWcgJiEpbTLqSgQhG8viKyYfEeluK++VajuJywO/wSu9bY4twxsHWaoOd5RlLDKyqN4IvCKIArTIiWGI0BG0k3GKavcJJxRebzUoSGilAar1pt5I8M8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=3OBXkpl0; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-45de2856648so48915e9.1
        for <linux-usb@vger.kernel.org>; Thu, 11 Sep 2025 02:09:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1757581781; x=1758186581; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nxEShyOg4SZ+IMoKLAaBbydOFhFdrPhOe5T+ZRDMQXY=;
        b=3OBXkpl0Yb7tRn6h87HAOSWyw6rfT3MIV2tIulna6MX4Tjw3WBOaYiFBkC/w6UOmRu
         QnYl1Y7aCov1ocddp2jeNw93CNlAMNY5bmlFPzrBs1wBNt02p237WzAiXR3ZXNLOM1/J
         tuQbJMUQMBoJv/7+PU5pet0FHxmIi+iCH/eVNEQjft0+5/39Tgu8M9ojy5LHThaey4tX
         TW98rUrcxLHsbGwTIdJMno9tlwuHfXltXENnzzLTKtm30oBCimpLKhZH31Q5Y5Y8NyHm
         +m360rF5mfm7LiVDXVZjtBNeXdApecBQ1xOP3MesSRf35Rnv+pwMjcvCgVLFsKKAXaPQ
         d8zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757581781; x=1758186581;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nxEShyOg4SZ+IMoKLAaBbydOFhFdrPhOe5T+ZRDMQXY=;
        b=sA0Q4EHdkPjo+YtazQUzdhuDfv+INTtn9vT73sV4eCd2L+w8QDaZUH7e5fnL8Lt0GK
         V4ISH0c8LVp01uX7GCdlk+C4kDw/JlhvHdZG+54wmz+aieY2iiTp8ETUUI29KuZ16AIk
         kgETPHZU9pykp7lhgaha8zaN5e1CEXJvJQx6wqPM9ubfg+dKfcS5Nd5EfPL0OpfF1J8g
         roh1nGx+6K12cQRtDe9K8bZcUKTceB1ITXcuencvog67KO0NyczfZG0CMy1KVAZaIhPa
         iyMidhL1bIJOQ1+ggz7aAIXx+rmZgjv54H/afRfcQd+oaN9S/vGSV6krhAsn8ra3dMiu
         0HrA==
X-Forwarded-Encrypted: i=1; AJvYcCV3kEUncmwuIqoe88TRBvXtOH2mTROtk5TCvn4iiS7nCCQnEOkCoWU3abkDPMXSXajdCcGIi1V1HuU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5wYvl1+yoJD6yqgcQTASljKUUf+Faq9eNAsJNFD3Gg/jyV3Zk
	LoPRdHMsntqQH/O/oNDc/tan2P6tivE212l7iL2ysSROhkBgPWa1RL7oNVoeyykeluw2UlE5big
	0eYPi4nlReQe18WO0hY5yUzIwmq207ziPpYD/WN8w
X-Gm-Gg: ASbGncugQxV+bmrQCNqGYzurtGz4XsYVUVtBLw6sEUUTmGjfqCpnmDXOz6z6StjOt/Z
	d+703JdxI49JsD2WioRV/kXV9T7UdnfbBIkyd5aNA4Z6YjVshWWB4mSodxjJiCCHUfpXlKRti5O
	k2BMXoZ2yI/Ch7IxC9risdBF1U5IAXemEx/v50uen4yO7C4E1WO1SLilzFvSGyLcpEW6GuLfchC
	cT3QHDOGMrXX6TsVxS0LjiWb0xqdO6ZbqEcKhXVgjyNITJ478A=
X-Google-Smtp-Source: AGHT+IG23s6lNfR+CIiGz37h46KPzj73nsB2N9PYmLBmAclhypIuYA90jnuGk8OXVbrv7pA6aVf7+DkgSS66RpI9vKg=
X-Received: by 2002:a05:600c:a105:b0:45b:9bcb:205 with SMTP id
 5b1f17b1804b1-45df820dde8mr2449225e9.5.1757581780459; Thu, 11 Sep 2025
 02:09:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250904114854.1913155-1-khtsai@google.com> <2025090651-unifier-award-3e0a@gregkh>
 <CAKzKK0oi85bnyT3Lq_TXz8YwFrmBxQd8K1q7hRDv-Oww75F_tQ@mail.gmail.com>
 <2025091132-scenic-avalanche-7bec@gregkh> <d37497c1-904e-4a04-a300-a60a21bcc212@linaro.org>
In-Reply-To: <d37497c1-904e-4a04-a300-a60a21bcc212@linaro.org>
From: Kuen-Han Tsai <khtsai@google.com>
Date: Thu, 11 Sep 2025 17:09:13 +0800
X-Gm-Features: AS18NWDiHIY9N4ZCiQdyx0zzB8O3b4PZd9Duf2w8OPrCyF3a8vCGUcWSwdxFcJ0
Message-ID: <CAKzKK0q5xRpR9hW=j-Hj6LNjogPK6jELRqB0Ob+VF6TbSve4bw@mail.gmail.com>
Subject: Re: [PATCH] usb: gadget: f_ncm: Fix NPE in ncm_bind error path
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Greg KH <gregkh@linuxfoundation.org>, zack.rusin@broadcom.com, 
	namcao@linutronix.de, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Greg, Krzysztof,

On Thu, Sep 11, 2025 at 4:49=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 11/09/2025 10:35, Greg KH wrote:
> > On Thu, Sep 11, 2025 at 02:50:15PM +0800, Kuen-Han Tsai wrote:
> >> Hi Greg,
> >>
> >> On Sat, Sep 6, 2025 at 8:15=E2=80=AFPM Greg KH <gregkh@linuxfoundation=
.org> wrote:
> >>>
> >>> On Thu, Sep 04, 2025 at 07:46:13PM +0800, Kuen-Han Tsai wrote:
> >>>> When an ncm_bind/unbind cycle occurs, the ncm->notify_req pointer is
> >>>> left pointing to a stale address. If a subsequent call to ncm_bind()
> >>>> fails to allocate the endpoints, the function jumps to the unified e=
rror
> >>>> label. The cleanup code sees the stale ncm->notify_req pointer and c=
alls
> >>>> usb_ep_free_request().
> >>>>
> >>>> This results in a NPE because it attempts to access the free_request
> >>>> function through the endpoint's operations table (ep->ops), which is
> >>>> NULL.
> >>>>
> >>>> Refactor the error path to use cascading goto labels, ensuring that
> >>>> resources are freed in reverse order of allocation. Besides, explici=
tly
> >>>> set pointers to NULL after freeing them.
> >>>
> >>> Why must the pointers be set to NULL?  What is checking and requiring
> >>> that?
> >>
> >> I set them to null as a standard safety measure to prevent potential
> >> use-after-free issues. I can remove it if you prefer.
> >
> > So either you have a use-after-free, or a NULL crash, either way it's
> > bad and the real bug should be fixed if this can happen.  If it can not
> > happen, then there is no need to set this to NULL.
>
>
> ... or there is a second (wrong) free somewhere else, which would crash
> and this NULL prevents it. In that case there is a real bug which,
> instead of being solved, is being hidden by this NULL assignment making
> it even more difficult to find and fix later. :(
>
> Usually that's the case I saw when people null-ify pointer after free.

I really appreciate you taking the time to explain this. I see your
point clearly now: my change could potentially mask the real bug
rather than fixing it.

I'll rework the patch to use the __free() helpers for automatic cleanup.

Regards,
Kuen-Han

