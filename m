Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B7C71C5532
	for <lists+linux-usb@lfdr.de>; Tue,  5 May 2020 14:13:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728836AbgEEMNW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 5 May 2020 08:13:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728268AbgEEMNW (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 5 May 2020 08:13:22 -0400
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com [IPv6:2607:f8b0:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EBC9CC061A0F
        for <linux-usb@vger.kernel.org>; Tue,  5 May 2020 05:13:21 -0700 (PDT)
Received: by mail-pg1-x534.google.com with SMTP id o18so945936pgg.8
        for <linux-usb@vger.kernel.org>; Tue, 05 May 2020 05:13:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mxIo52dkjiLvxWy+gfMk6TBKmx0wnZO40XvXm/Q0mOM=;
        b=Khx2i1Dt8XSKgyJGM/0iMsBzhfLnAa40dMnBOv76ue5Wf4CMrxOVZCVx4XFGw8gi13
         3dfAHedlDDL9qKQkvsbgf5csT4ykw2MvBj7+r00pbg6VxyIgVHDuJDslExEXhKqjzSX6
         N/er241FshEga2hqosW8TnbUQr7BrCiCmY3iA40yq/XVraV4sLQblPWR8tNSUQm5qHHW
         QedHgbcNdXG4tqFP5nsFmRny0Jgxm3KnYWkBJ3p/1+JxFFiqv/cyR0W85Jz9SoDgvQOx
         KssaNmNkRcGkLVblvYSXDSS4rPpNsQCYb4CVNlPdnvxvchJMt6hICtS2hDzzi7AMEvWE
         jfcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mxIo52dkjiLvxWy+gfMk6TBKmx0wnZO40XvXm/Q0mOM=;
        b=Yu/iQorFZ1pydw1DhgYYK9Ag7+KQFBGR4hWx041SHFaCcxDQjDZzTm7Ke3nJu/QLSa
         mVgFH5f6scHTYat/WQJ2lQlX1d8WLv/buDRP2Ah618msYMEVESkJ6yLF4C5INoIGqRxA
         PLuXfUb4iFpkYut/L/smAeHF6ZD9YrwLXrI1EKRTDvC2/H1Y2g94HeXxnZKMlT3EQr4/
         ab27MRHNqN7BCxYZJBoNlDexive4YnMWMqf986ZepbMgBjGG4w9uu3jbuTuh9+DdcOkQ
         SHjeAdDdBz4kVV3zBmSLa/pVbCeAvHq9RGPMic9mviEQSA5w96HVinBj19QBx4VnMY89
         lGRA==
X-Gm-Message-State: AGi0PuYQqjdQSDLBXT332Lc8qAur39vjkawqE2AaIvOR4qtYrwGSstlz
        3seQA66Y+4bBKpWtMurfTtgGEFHKUrJhtwJoAUGleA==
X-Google-Smtp-Source: APiQypK7FAvYsgfCj+gh8FTtJ9E35Q5BzmuZ49FncOyTm/+1A3u+hFulQ2b5iSD1/4wwvnjFvt1/vaUmzeCCpH31Umc=
X-Received: by 2002:a62:5289:: with SMTP id g131mr3007163pfb.318.1588680800931;
 Tue, 05 May 2020 05:13:20 -0700 (PDT)
MIME-Version: 1.0
References: <Pine.LNX.4.44L0.2005041114130.11213-100000@netrider.rowland.org> <87a72mc2le.fsf@kernel.org>
In-Reply-To: <87a72mc2le.fsf@kernel.org>
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Tue, 5 May 2020 14:13:09 +0200
Message-ID: <CAAeHK+yk-qDR=8VvhEyxggT-3KuT26smHX_HTeUNRxg+1ObeQA@mail.gmail.com>
Subject: Re: Testing endpoint halt support for raw-gadget
To:     Felipe Balbi <balbi@kernel.org>
Cc:     Alan Stern <stern@rowland.harvard.edu>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        USB list <linux-usb@vger.kernel.org>,
        Dmitry Vyukov <dvyukov@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, May 5, 2020 at 8:34 AM Felipe Balbi <balbi@kernel.org> wrote:
>
>
> Hi,
>
> Alan Stern <stern@rowland.harvard.edu> writes:
> > On Mon, 4 May 2020, Andrey Konovalov wrote:
> >
> >> On Mon, May 4, 2020 at 4:24 PM Alan Stern <stern@rowland.harvard.edu> wrote:
> >> >
> >> > On Mon, 4 May 2020, Andrey Konovalov wrote:
> >> >
> >> > > One more question (sorry for so many :).
> >> > >
> >> > > Looking at other fields of usb_request struct I see frame_number.
> >> > > AFAIU it's filled in by the UDC driver for ISO transfers. Does it make
> >> > > sense to expose it to userspace? I don't see any composite/legacy
> >> > > gadgets use that field at all.
> >> >
> >> > Do any of those gadget drivers use isochronous endpoints?
> >>
> >> Yes, there are audio/uvc function/legacy drivers that use those.
> >>
> >> > In fact, it also looks like none of the drivers in gadget/udc/ touch
> >> > the frame_number field.  Maybe we should just get rid of it, since it
> >> > isn't being used.
> >>
> >> It is used by dwc2/3 gadget drivers (which are not in gadget/udc/).
> >
> > Well, if Felipe thinks we ought to keep the field then you might as
> > well export it to userspace.  Drivers are free to ignore it.  :-)
>
> dwc3 has its own private frame_number as part of its own endpoint
> structure. We simply copy that to the request. That's is currently
> telling the gadget driver which frame the request completed. It could be
> used by the function to decide when to queue more requests. It can also
> be used to predict if we're in sync with the frames or will we diverge
> and miss frames in the future.
>
> If nobody has implemented any of that so far, I don't mind removing
> it. We need strong evidence that this will never be used, though :-)

OK, I see, If this field is a potential candidate for removal, I won't
expose it through raw-gadget just yet, but I'll try to make the
interface extensible so that it can be easily added when needed.
