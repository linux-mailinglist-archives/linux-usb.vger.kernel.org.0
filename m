Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 623391371CA
	for <lists+linux-usb@lfdr.de>; Fri, 10 Jan 2020 16:52:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728428AbgAJPwN (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 10 Jan 2020 10:52:13 -0500
Received: from youngberry.canonical.com ([91.189.89.112]:52912 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728258AbgAJPwN (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 10 Jan 2020 10:52:13 -0500
Received: from mail-ot1-f70.google.com ([209.85.210.70])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <kai.heng.feng@canonical.com>)
        id 1ipwa3-0005uJ-8t
        for linux-usb@vger.kernel.org; Fri, 10 Jan 2020 15:52:11 +0000
Received: by mail-ot1-f70.google.com with SMTP id z3so1217643oto.22
        for <linux-usb@vger.kernel.org>; Fri, 10 Jan 2020 07:52:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=h8/Y2cObCbtCE26judrO9UsDxGUStHvjaWi0HH63cZM=;
        b=JsiOSgTwQdFf06+PhuTNNjsw/fDswgqxWcLfhdlWeLRj2axTZfJ/swyWBLK96bfPvx
         rAsIfLAchFnQCS4oTFbmvCbw7CvMQwIx7BtdG4Gw9Z9da+ZMESuOEdDBLJ4Q+hpZIyGf
         OQk/FEHhXQKSZ7KEIHRDGGFWn0sE4NNvjrLSRtXX4kzo536bLz1CIipGsNAFPXatV31n
         KrMnpkLNxBNRTxRataeeKJEGAmOQC3mRVbppZviW1LEl6NrciV1UYkr+fUaQpLnokgV0
         yCoW3mDOvnGxpHrpHTXmyRwDCZ+B1d9r7V6Jl0HtefN3clasHmtNpNVGy1CKmrPFsHz9
         +vHQ==
X-Gm-Message-State: APjAAAWv0Wi+j/lTpz4jL+leL15MEBtxda7TeclRBk4lxpf8BZZZP0jE
        SfUQgqIbY18ULInEvndmUSTHAJ75F13Q0HDDVq/L5fH/goLEUF5G2YNIjI+ig0CAP2r4gRdUAy8
        wDdl2HMywTTvI14OyTPfbKb/2h5FG11Zq+0ogxiRbKKh2ythB3+Bq3w==
X-Received: by 2002:a05:6808:aba:: with SMTP id r26mr2610243oij.4.1578671529978;
        Fri, 10 Jan 2020 07:52:09 -0800 (PST)
X-Google-Smtp-Source: APXvYqw4U5/Eei+IKj5uy59q12wc0wosUa0qQS+sc9rlFDM3l2mJyPy8NllwB2mPtnNVYhYREH4/IfvIF7a3u3WJDxw=
X-Received: by 2002:a05:6808:aba:: with SMTP id r26mr2610231oij.4.1578671529690;
 Fri, 10 Jan 2020 07:52:09 -0800 (PST)
MIME-Version: 1.0
References: <20200110080211.22626-1-kai.heng.feng@canonical.com> <Pine.LNX.4.44L0.2001101038390.1467-100000@iolanthe.rowland.org>
In-Reply-To: <Pine.LNX.4.44L0.2001101038390.1467-100000@iolanthe.rowland.org>
From:   Kai-Heng Feng <kai.heng.feng@canonical.com>
Date:   Fri, 10 Jan 2020 23:51:58 +0800
Message-ID: <CAAd53p56QynOLJPi3kKiQB1iScrDxj3X1FiycuVF7tP75yPD8A@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] USB: Disable LPM on WD19's Realtek Hub
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        AceLan Kao <acelan.kao@canonical.com>,
        USB list <linux-usb@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Jan 10, 2020 at 11:40 PM Alan Stern <stern@rowland.harvard.edu> wrote:
>
> On Fri, 10 Jan 2020, Kai-Heng Feng wrote:
>
> > Realtek Hub (0bda:0x0487) used in Dell Dock WD19 sometimes drops off the
> > bus when bringing underlying ports from U3 to U0.
> >
> > Disabling LPM on the hub during setting link state is not enough, so
> > let's disable LPM completely for this hub.
> >
> > Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
> > ---
> >  drivers/usb/core/quirks.c | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/drivers/usb/core/quirks.c b/drivers/usb/core/quirks.c
> > index 6b6413073584..2fb7c1602280 100644
> > --- a/drivers/usb/core/quirks.c
> > +++ b/drivers/usb/core/quirks.c
> > @@ -371,6 +371,9 @@ static const struct usb_device_id usb_quirk_list[] = {
> >       { USB_DEVICE(0x0b05, 0x17e0), .driver_info =
> >                       USB_QUIRK_IGNORE_REMOTE_WAKEUP },
> >
> > +     /* Realtek hub in Dell WD19 (Type-C) */
> > +     { USB_DEVICE(0x0bda, 0x0487), .driver_info = USB_QUIRK_NO_LPM },
> > +
> >       /* Action Semiconductor flash disk */
> >       { USB_DEVICE(0x10d6, 0x2200), .driver_info =
> >                       USB_QUIRK_STRING_FETCH_255 },
> >
>
> This is a very partial patch.  There were four hunks in the original
> version but there's only one hunk in V2.

Because the original approach is insufficient, it significantly
reduced the fail rate but the issue is still there.
USB_QUIRK_NO_LPM is used instead so no other parts are needed.

Kai-Heng

>
> Alan Stern
>
