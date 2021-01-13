Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 51E9D2F4F25
	for <lists+linux-usb@lfdr.de>; Wed, 13 Jan 2021 16:50:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726852AbhAMPsx (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 13 Jan 2021 10:48:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726612AbhAMPsx (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 13 Jan 2021 10:48:53 -0500
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com [IPv6:2607:f8b0:4864:20::d2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7FB32C061575
        for <linux-usb@vger.kernel.org>; Wed, 13 Jan 2021 07:48:13 -0800 (PST)
Received: by mail-io1-xd2d.google.com with SMTP id b19so2500097ioa.9
        for <linux-usb@vger.kernel.org>; Wed, 13 Jan 2021 07:48:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vHz+c/OMk0DHBunERNA5VoUoRd6N+j9o9tODoSYu1uM=;
        b=uyQPCYgmb10rLEMy7PoMIJ70DqyeQNHjxokycO6LbOwu1TZB0mFzqOde5A0ef5BeZD
         /vch8EaS03SIzAcuUXSEFMSe4WIyI9Y5koo/twfOl6a4T0Y9thA/3obfpor6UQHB4q0z
         8kwPDl0H43rejYyNp2TtO5hcbGctKLeK0ffDDQMChrjPrL6jHHtd6iQ+uQudPFP4rcnX
         9Q6mRRRT3YR7nn+EDIWZjQN93s3olqtpLCgWszEOcQsMwoUg6loi1MjX/etZ9cH1NzNH
         XO5liFBpWJYj9CksJrybmdhYAWBAGzn0P8tyUzccHtCP+oJH4IiukgPbYkmASyFaNydU
         q4eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vHz+c/OMk0DHBunERNA5VoUoRd6N+j9o9tODoSYu1uM=;
        b=T7nx9qZjUcY2qTWjpDsreTJO6OXNBHVh6w1azL2KVDu5R1iPyz03+knMhcuwFCpp8C
         hTboJG/UCjtemnANL78kiGTVrtjfALY/RI3qY2EDa9ocZJxPBHqXvKKIBRElpxsoH35+
         9IPWY62aLiqfUTs8ZaNdRDfIlx2keaU5lCM/G7qb5etj+Z2kU1vMRtOr4I+J0QJyo7Om
         JajOay9FfMD8Po0x4aDgmyne/3lv0sMryS93i7fxvgzu1APdPEYj2iXnYLTLUCZheitJ
         pdOLMBjuKBmIoLBusQkjJYKdooPVE6gEesPWslb3zi0TouJVuLgdWjRYt0+5majqat2m
         C5xg==
X-Gm-Message-State: AOAM533gkMG/4jplCns4HkBQu8VvPQ7I2Xoj6d8t4Pb90mydj8YT6Lrx
        vavUsCVRCjRR74czdgciBudSweoHh1VHJN6dDwp9vooRlNpGdQ==
X-Google-Smtp-Source: ABdhPJzaep8idbiDMltpqpVXBTruWfXJ78LhtF/7yMmICV+8tbkp366mOdknd3BI1ETpChynDpIj9OaQSpRlifvuUrg=
X-Received: by 2002:a6b:5018:: with SMTP id e24mr2209099iob.184.1610552892653;
 Wed, 13 Jan 2021 07:48:12 -0800 (PST)
MIME-Version: 1.0
References: <20210113140331.73500-1-lorenzo@google.com> <87r1mp2ajt.fsf@kernel.org>
In-Reply-To: <87r1mp2ajt.fsf@kernel.org>
From:   Lorenzo Colitti <lorenzo@google.com>
Date:   Thu, 14 Jan 2021 00:48:01 +0900
Message-ID: <CAKD1Yr2Ai+JBc4rhr7_V3mKD-a-z5XCrbK08Rfrgq3x7Y0BX+w@mail.gmail.com>
Subject: Re: [PATCH] usb: gadget: u_ether: support configuring interface names.
To:     Felipe Balbi <balbi@kernel.org>
Cc:     linux-usb@vger.kernel.org, Greg KH <gregkh@linuxfoundation.org>,
        =?UTF-8?Q?Maciej_=C5=BBenczykowski?= <zenczykowski@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Jan 13, 2021 at 11:09 PM Felipe Balbi <balbi@kernel.org> wrote:
> > -     bool                    zlp;
> > -     bool                    no_skb_reserve;
> > +     bool                    zlp:1,
> > +                             no_skb_reserve:1,
> > +                             ifname_set:1;
>
> let's keep one declaration per line, as it was before. Other than that,
> patch looks good.

Thanks for the quick review! Uploaded v2 to fix this. Also changed
strlcpy to strscpy as suggested by checkpatch.
