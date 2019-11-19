Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EF6781012E9
	for <lists+linux-usb@lfdr.de>; Tue, 19 Nov 2019 06:18:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727014AbfKSFSv (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 19 Nov 2019 00:18:51 -0500
Received: from mail-vk1-f194.google.com ([209.85.221.194]:38689 "EHLO
        mail-vk1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726711AbfKSFSu (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 19 Nov 2019 00:18:50 -0500
Received: by mail-vk1-f194.google.com with SMTP id o82so4744851vka.5
        for <linux-usb@vger.kernel.org>; Mon, 18 Nov 2019 21:18:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jDmWyWEB6X6hwrCpbp9uiQYwQF5jG8Fol62ACoWdqew=;
        b=c7Kdgz48g3DqmoLb5/0VghHmU09mTfosgKrO2YFfZPUvxt/RdRNli50PhjfWMgc4ne
         uonk3fenlMZy18GUcL68KuWUqJPsoMMCbzpudzypbhBT6G7/5MjrqMYVVh3gDukcvMoZ
         LbeoSYrtDWSK0Y9udIKVMAzyn/shXDgGetomc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jDmWyWEB6X6hwrCpbp9uiQYwQF5jG8Fol62ACoWdqew=;
        b=KgxkhUTSiV3OY5sCJlt5fS5Id00H9nYwGVDwZwcS3uLPByveXMgWuu2InChSc9ultk
         T6CulDoGOUfMcUTRgKBmQtbEcsE9YwBKPqCm3rX+PElVJZ/8oV/bxiI8OA9VWHiEE3h+
         XRRsKfsaHXtEIN7S0ith3mlT4iuPTE5KP6Aoen/yqTI6R3MHL2ogQwa2FD//qcQQKY5N
         ibt2MQq0qG2W+VHIP01inMiNWcWsePNknhNZ4Fu6rtcFovlPeUIioqHtmMcBDdF9QBHK
         8BQoFeRIxPxGFbtvYCr/D6sJ6332DfVjkQ/WhBBuG2XEwADtQxC5aYqN5JSxJXRGkF9b
         Aejg==
X-Gm-Message-State: APjAAAU+W1+fcqn4e0/UL8zmNkQMLU/RVOsHmA2JlGCnJ6k5cLfFhnRC
        akK4iP3rOVOhQSB+svpgrm49WCQ8B2/4jZgLL1ga6g==
X-Google-Smtp-Source: APXvYqzmN805E8eN41XyzvJqz/8UfDTMFSoZBSua6kbhailEbajnHsqg9CvbSCG2iONWHTyO5oZA5JWDZTSYdRVIGRE=
X-Received: by 2002:a1f:2556:: with SMTP id l83mr18367851vkl.77.1574140729713;
 Mon, 18 Nov 2019 21:18:49 -0800 (PST)
MIME-Version: 1.0
References: <20191117033149.259303-1-ikjn@chromium.org> <Pine.LNX.4.44L0.1911171043060.7716-100000@netrider.rowland.org>
In-Reply-To: <Pine.LNX.4.44L0.1911171043060.7716-100000@netrider.rowland.org>
From:   Ikjoon Jang <ikjn@chromium.org>
Date:   Tue, 19 Nov 2019 13:18:38 +0800
Message-ID: <CAATdQgBPrk=obCOiMAe1zAoP1As21MuzGzn-ixU56EmSkdQr1w@mail.gmail.com>
Subject: Re: [PATCH 0/2] usb: override hub device bInterval with device node
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Suwan Kim <suwan.kim027@gmail.com>,
        "Gustavo A . R . Silva" <gustavo@embeddedor.com>,
        Johan Hovold <johan@kernel.org>,
        Nicolas Boitchat <drinkcat@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sun, Nov 17, 2019 at 11:46 PM Alan Stern <stern@rowland.harvard.edu> wrote:
>
> On Sun, 17 Nov 2019, Ikjoon Jang wrote:
>
> > This patchset enables hard wired hub device to use different bInterval
> > from its descriptor when the hub has a combined device node.
> >
> > When we know the specific hard wired hub supports changing its polling
> > interval, we can adjust hub's interval to reduce the time of waking up
> > from autosuspend or connect detection of HIDs.
>
> In fact, _all_ hubs support changing the polling interval.  The value
> given in the USB spec is just an upper limit; any smaller value is
> equally acceptable.
>
> So why are you doing this only for hard-wired hubs?  Why not for all
> hubs?

Because we only want to apply it to a specific device instance under
our control.
We apply autosuspend to built-in touchpad device for power savings,

Users can attach external hub devices with same VID:PID that we don't want to
change the behavior. Maybe disabling autosuspend for external HIDs
can be more reasonable for that case?

>
> And is 250 ms really too long to wait for remote wakeup or connect
> detection?  What's the real motivation behind this change?

When a user starts to move the cursor while touchpad is in autosuspend state,
It takes more than >250ms (worst case can be >500ms) to wake up and response.
That makes the cursor stuck for a while and warp to another location suddenly.

Thanks.
>
> Alan Stern
>
