Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DA52C1C3CB3
	for <lists+linux-usb@lfdr.de>; Mon,  4 May 2020 16:16:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728695AbgEDOQR (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 4 May 2020 10:16:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728446AbgEDOQR (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 4 May 2020 10:16:17 -0400
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8103EC061A0E
        for <linux-usb@vger.kernel.org>; Mon,  4 May 2020 07:16:17 -0700 (PDT)
Received: by mail-pj1-x1030.google.com with SMTP id a31so3825744pje.1
        for <linux-usb@vger.kernel.org>; Mon, 04 May 2020 07:16:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vGr4VJtpbWky6mt3MSOnebjTSnX/jE1HLmlXpNGtD2s=;
        b=jeN9ds2Hmzh8Fxt8ybz3rlm1ae3TUYKRSn3vE1a/6vAt8wFNZFfpsssUE1FgnBbC42
         sgf2Z8/o4PgwqvTtVUrdMq59PW13BmJycRcZBmCt96IIIxDXZuI4vTGr3AmXhMlhghqr
         S0vfLRckPhNIML8WqUowPn3yf+4hiEgJEQlDTwOYYmLEV0tGEj/35Zfckf/ZXPjGQ72F
         aV4lKZK8IN7ukF1R5MLLH3emaXsH7eMSkOG0DSkXyz2pffGjpLOpXiguMAzN1plMbZy8
         tdc76rkrWcFLz4NOaoUnexjY97UEPBm1lfIRVYDKR7hPiYIP4tfS7vSmPUbYvVMS3c/+
         wVTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vGr4VJtpbWky6mt3MSOnebjTSnX/jE1HLmlXpNGtD2s=;
        b=DPQztxxqcIDS794ObZcXfVIh/HQyClpJZ1fFOkYyIEV6D1eHMwGkZLR5EdlJY9pM6F
         TnPLN5V8J8TkAEjbAvjR+RjMpq48YdGDZ/5tf0HYaUfX8O6dyfn5bahnwzIn8BmlFoA+
         ctq+OSi2J/wOwt1+FVJl9RG4DBbzXvnrUYNzdB+90KlWLjajH0+lFPLEoG6pMZhwBXem
         19PRIohcdeteEec7ir9WRSTkS6lqA8oWBzqOJIIms3ozxhHjBmKJkFX52I/U3eigHGRp
         3+hlY468jCD/c0VANy0+I+87EykayF2M6Gd2vwxpFBr9lOvqY8S5wXI69q2zPeQmPxlw
         HK8A==
X-Gm-Message-State: AGi0PubOyDp4/Qs/OL6J57T9qEg/w0pCBbOtWQKcVGIaXcJ2SZqyrIUL
        vZoXjJwVC9YAleLtRAGJ03vCliVLleoIuzlC73WxYC+/KK5EqA==
X-Google-Smtp-Source: APiQypIxU+bGV6nmTOG2j2yQ9rcGwDAuKgKP/TX1DJeTvkdka8dmkyTGOIL48eXBbdkFNIB4IjzfL3N/TfHr0/wq/uE=
X-Received: by 2002:a17:90a:26a2:: with SMTP id m31mr17617244pje.128.1588601776522;
 Mon, 04 May 2020 07:16:16 -0700 (PDT)
MIME-Version: 1.0
References: <CAAeHK+x7AK=D1TA+K6hosWA=0-z0pqGu0W0QEVeZwqGNdFMaMQ@mail.gmail.com>
 <Pine.LNX.4.44L0.2004291005460.28180-100000@netrider.rowland.org>
In-Reply-To: <Pine.LNX.4.44L0.2004291005460.28180-100000@netrider.rowland.org>
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Mon, 4 May 2020 16:16:05 +0200
Message-ID: <CAAeHK+zdN280v54=qbEA5ALuXuCB3u=8BO8YHN+ZMzxWBzsQYg@mail.gmail.com>
Subject: Re: Testing endpoint halt support for raw-gadget
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        USB list <linux-usb@vger.kernel.org>,
        Dmitry Vyukov <dvyukov@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Apr 29, 2020 at 4:06 PM Alan Stern <stern@rowland.harvard.edu> wrote:
>
> On Wed, 29 Apr 2020, Andrey Konovalov wrote:
>
> > On Fri, Apr 10, 2020 at 5:53 PM Alan Stern <stern@rowland.harvard.edu> wrote:
> > >
> > > On Fri, 10 Apr 2020, Andrey Konovalov wrote:
> > >
> > > > On Fri, Apr 10, 2020 at 2:29 AM Alan Stern <stern@rowland.harvard.edu> wrote:
> > >
> > > > Something else: I've been testing raw-gadget with various UDCs that I
> > > > have [1] and everything seems to work, except for emulating SuperSpeed
> > > > devices with net2280. I've just found it out yesterday night, and
> > > > haven't had a chance to debug that yet, but if you know about some
> > > > potential issues I could encounter with SuperSpeed/USB3+, please let
> > > > me know.
> > >
> > > Well, USB-3 has streams, unlike USB-2.  You may want to think about
> > > supporting them.
> >
> > Do I understand correctly, that to support streams I basically need to
> > allow the user to set stream_id on the request being submitted?
>
> Yes, for bulk endpoints.

One more question (sorry for so many :).

Looking at other fields of usb_request struct I see frame_number.
AFAIU it's filled in by the UDC driver for ISO transfers. Does it make
sense to expose it to userspace? I don't see any composite/legacy
gadgets use that field at all.
