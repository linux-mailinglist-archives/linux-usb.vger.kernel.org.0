Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E5D69138D66
	for <lists+linux-usb@lfdr.de>; Mon, 13 Jan 2020 10:07:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726277AbgAMJHH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 13 Jan 2020 04:07:07 -0500
Received: from youngberry.canonical.com ([91.189.89.112]:34539 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725268AbgAMJHH (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 13 Jan 2020 04:07:07 -0500
Received: from mail-ot1-f70.google.com ([209.85.210.70])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <kai.heng.feng@canonical.com>)
        id 1iqvgf-0000SS-Ri
        for linux-usb@vger.kernel.org; Mon, 13 Jan 2020 09:07:06 +0000
Received: by mail-ot1-f70.google.com with SMTP id m18so6051253otp.20
        for <linux-usb@vger.kernel.org>; Mon, 13 Jan 2020 01:07:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=y08y1Vf0ul0EzKQPAWCtvf/eaBmNdOl4Jj/XRj2SI+s=;
        b=dR5ewKnoiNBCqMvix3GuBKAbbuxQNpdpmFZ4mejjDq1FpFukVmvoxniVE+e+83ltzj
         lE/q7jVKF3hFGCUx4dLtZYKWDZIIU8KuM71T3aVZuRDZs6SFa26wumCFb4EdqKTYvHSa
         rFl77g+cfnznT8BzL3zQpn1TfLZ451Fej211BTX0vDukfvxrsvo1XtTIb86pRzPrgRUC
         gO6pWhIq/on6XOIwozaAxKO3FLb5UKsekxbheq6cehNiYQKSEohIs9jklSbgNbVoVNOR
         02hqJYr21pv63Ku4oqLLGBfOhvAewwT5mQJfQ8xQ+BGelo4ttttJJv6oShpSM6GkEIAb
         Zy/g==
X-Gm-Message-State: APjAAAXcrG0xPGFCJiKdETR42doEAdPx22SF+XVAnqXoO5DCVeepl4/E
        DPte/Xx59hTz17OJSS7zXlZbWtwlSopsibR/QOlbzbU+xKPyU56uynzd/FEbeE+PzktBf0hlYhZ
        jeywd3sCsBx2kFGhaAGyvha7SSK0G+tAkLUXs6lb14r6P7ab1mM8dFA==
X-Received: by 2002:a05:6830:2116:: with SMTP id i22mr12883833otc.0.1578906424884;
        Mon, 13 Jan 2020 01:07:04 -0800 (PST)
X-Google-Smtp-Source: APXvYqz1UBoFSpWRN87k5IpNKV/5s81VoSSDYKOfWs3DY7xagcs1yYHS47D0v7UYSuf8nrzns+dxZirJyN7rjK/r7b4=
X-Received: by 2002:a05:6830:2116:: with SMTP id i22mr12883821otc.0.1578906424631;
 Mon, 13 Jan 2020 01:07:04 -0800 (PST)
MIME-Version: 1.0
References: <20200103084008.3579-3-kai.heng.feng@canonical.com>
 <20200110080211.22626-1-kai.heng.feng@canonical.com> <20200111192353.GA435222@kroah.com>
In-Reply-To: <20200111192353.GA435222@kroah.com>
From:   Kai-Heng Feng <kai.heng.feng@canonical.com>
Date:   Mon, 13 Jan 2020 17:06:53 +0800
Message-ID: <CAAd53p6vGpv0L+XFa1raA2HzO+3LYvHwPW968CEuW8aDbNC7BQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] USB: Disable LPM on WD19's Realtek Hub
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     Mathias Nyman <mathias.nyman@intel.com>,
        Alan Stern <stern@rowland.harvard.edu>,
        AceLan Kao <acelan.kao@canonical.com>,
        USB list <linux-usb@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sun, Jan 12, 2020 at 4:01 AM Greg KH <gregkh@linuxfoundation.org> wrote:
>
> On Fri, Jan 10, 2020 at 04:02:11PM +0800, Kai-Heng Feng wrote:
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
>
> What changed from v1?  Always put that below the --- line.
>
> Also I only see 1 patch here, what happened to the first two?

The first two are can be actually treat separately, since they are
more generic fixes for xHCI.

>
> Please resend the whole series, and properly document what went on, you
> know this...

I forgot that, will do in next version.

Kai-Heng

>
> thanks,
>
> greg k-h
