Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 75EFB48119E
	for <lists+linux-usb@lfdr.de>; Wed, 29 Dec 2021 11:21:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233442AbhL2KVn (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 29 Dec 2021 05:21:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36210 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231809AbhL2KVn (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 29 Dec 2021 05:21:43 -0500
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12CD5C06173E
        for <linux-usb@vger.kernel.org>; Wed, 29 Dec 2021 02:21:43 -0800 (PST)
Received: by mail-pl1-x62a.google.com with SMTP id l16so3480552plg.10
        for <linux-usb@vger.kernel.org>; Wed, 29 Dec 2021 02:21:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YugLlpOMd0/4DC/hza11ghcrjL7VsurmcHoSEit8QkM=;
        b=lqqxidN8xwGBrMIBF+eODNuDxi538IYYZOEEnr2qHGn8JHuf5yaiPA3x0uC4uXQSgh
         CfQ7iT+LNARDyohFNYoqKuM9DX2pup59EM43W4dUrQvZ9hyCFavForVUL9dAawDC8RUP
         ZgqKAhtNy3Wp8Vqs8riaZ2EkfAelorWbFmEYebu0O8nIRjkMqwvrGiDJajl83iPLqEX1
         BSi6hOpE7814Q6RBSVSBmDkAtR47OoTnR7tO57ab2KwW2HHOsTYoHrAgR5LYCaQALVh4
         E6WjGTbEyivuNTrk/QGM+UqJIDIxa9rczd8tHls3bYpPyE4gD4hVkty2PGJsjuieNZCL
         pX5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YugLlpOMd0/4DC/hza11ghcrjL7VsurmcHoSEit8QkM=;
        b=sTcqUoakzyr6YeNH7/O7tz8cSLR0tABWDFizmb0uMlN7vVBGvlAYRUsH+vuS26v3zc
         IpEuySdXhf1+TaglhbRBXgWKCURL2jGdI8bcLn4Oxxmxg2yD2ifj9HPg2mFJKvoM2kuS
         QfVhPntN9m3I7soHq57kyKuakurUWo3OUKAgy5nvUrE4eKjrAXA7Srx+Zid25f/2QV4a
         gxB2uI1Z4rFcTzLNd/VY7JKXVRf10vsqk0lAL1ya1Bi86VOsCgusl7+SyI49LZTXZ6Gm
         /b0u3ZvPkEZT6w5hrucBh+5dPdeYBdPotq/fXZWVWSbuCcIFoyRqVpMCU0zbzSNwbBu6
         A4fw==
X-Gm-Message-State: AOAM530EZmwp61bkrMoyWskiTEfprY4rKjdj7Lv1F12R2zljk/5Rc1WU
        gMNo6FmNbxUFgSh5epcPbd6trYlbR3qm8IW5tkumNmmVtoCNpg==
X-Google-Smtp-Source: ABdhPJyvNx3o/xQnohHsi5zv4TBC74fIG6q5Tdg9Rfz9y0bZrhC2TSALAVSRZbpSAK1iD8AxBI+vv5nBqWgdU43nAyU=
X-Received: by 2002:a17:90b:4f4c:: with SMTP id pj12mr31315751pjb.121.1640773302093;
 Wed, 29 Dec 2021 02:21:42 -0800 (PST)
MIME-Version: 1.0
References: <20211228060246.2958070-1-pumahsu@google.com> <YcrKNP4TRXB6nsCI@kroah.com>
 <CAGCq0Lb8ZoGpbkLNhXG=OyWgvz_Qn3ABmq_uvMPJdyEKygMH+Q@mail.gmail.com>
 <YcwclrVzEXRxgUFa@kroah.com> <CAGCq0LbfWt2xTmRczhdZUXrwFTJdaMH3Zd-y4quqWi7kyaso6Q@mail.gmail.com>
 <Ycwvm5rdqVW4E27y@kroah.com>
In-Reply-To: <Ycwvm5rdqVW4E27y@kroah.com>
From:   Puma Hsu <pumahsu@google.com>
Date:   Wed, 29 Dec 2021 18:21:05 +0800
Message-ID: <CAGCq0LZc9Leh=oEiA2hPrpK9OBO+bnRR6hENr+emgFWGsaB0Yg@mail.gmail.com>
Subject: Re: [PATCH] xhci: re-initialize the HC during resume if HCE was set
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     mathias.nyman@intel.com, Albert Wang <albertccwang@google.com>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Dec 29, 2021 at 5:51 PM Greg KH <gregkh@linuxfoundation.org> wrote:
>
> On Wed, Dec 29, 2021 at 05:11:47PM +0800, Puma Hsu wrote:
> > On Wed, Dec 29, 2021 at 4:30 PM Greg KH <gregkh@linuxfoundation.org> wrote:
> > >
> > > A: http://en.wikipedia.org/wiki/Top_post
> > > Q: Were do I find info about this thing called top-posting?
> > > A: Because it messes up the order in which people normally read text.
> > > Q: Why is top-posting such a bad thing?
> > > A: Top-posting.
> > > Q: What is the most annoying thing in e-mail?
> > >
> > > A: No.
> > > Q: Should I include quotations after my reply?
> > >
> > > http://daringfireball.net/2007/07/on_top
> > >
> > > On Wed, Dec 29, 2021 at 01:53:04PM +0800, Puma Hsu wrote:
> > > > This commit is not used to fix a specific commit. We find a condition
> > > > that when XHCI runs the resume process but the HCE flag is set, then
> > > > the Run/Stop bit of USBCMD cannot be set so that HC would not be
> > > > enabled. In fact, HC may already meet a problem at this moment.
> > > > Besides, in xHCI requirements specification revision 1.2, Table 5-21
> > > > BIT(12) claims that Software should re-initialize the xHC when HCE is
> > > > set. Therefore, I think this commit could be the error handling for
> > > > HCE.
> > >
> > > So this does not actually fix an issue that you have seen in any device
> > > or testing?  So it is not relevant for older kernels but just "nice to
> > > have"?
> > >
> > > How did you test this if you can not duplicate the problem?
> > >
> >
> > Yes, we actually see that the HCE may be detected while running xhci_resume
> > on our product platform, so I'm able to verify this commit can fix
> > such a condition.
>
> Given that your product platform is an older kernel version than 5.17, I
> think that you also want this in the older kernel releases, so please
> mark it for stable backporting.
>
Thank you for advising.
Could I know how to do this? Just add "Cc: <stable@vger.kernel.org>"
to the commit message?

Thanks.
Puma Hsu
