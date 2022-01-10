Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8E0C948A25A
	for <lists+linux-usb@lfdr.de>; Mon, 10 Jan 2022 23:05:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345178AbiAJWF0 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 10 Jan 2022 17:05:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241786AbiAJWFS (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 10 Jan 2022 17:05:18 -0500
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B06B5C061748
        for <linux-usb@vger.kernel.org>; Mon, 10 Jan 2022 14:05:17 -0800 (PST)
Received: by mail-ed1-x535.google.com with SMTP id u25so59438653edf.1
        for <linux-usb@vger.kernel.org>; Mon, 10 Jan 2022 14:05:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xG5YQM2soHgltVkLWBjbHR5Qz+VeD3CXossiL42kw8o=;
        b=gHq4E60gLW4E9HRci3mAQDryUMUxbSPUrzfRwKsmHu0LQO5++Un+hSyzsuOQK0S9Qi
         K0CJUYHQjk2XAYdLvxaa/gke3RJJLJ9XOFnBBUmIdmfBjzS7zzeXmFu3wT7JiHI8uqGf
         sDlCglR3xW8q2UPDquEdZ2iM/iMYSCm69mh7Xt0FNNhllIb5HOaPPJ3v7Vd/Zz6gVrKX
         fJ+r6OhoGw7JzTSEoLsM/oQ5UILTjPZZgHwF1F+/9b65AUi3VyjmbjYw3TLjaAC42HNn
         pRfG94PEdLR8JKmSEhYcZxgwcFV0LJyglFDe2fLrP7wTzanCePvJKZvXpYTc6iOMGnAW
         9Jow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xG5YQM2soHgltVkLWBjbHR5Qz+VeD3CXossiL42kw8o=;
        b=NYUQlb2wgpHoqhM9HrPQdTspL4pqt88n54YCqXPkqf/wW5saT5Y+1t76OXsvtUFXa+
         rJvORM11KqI5WEWKe6Q/j0iIYmbcdx7dGO9VDItNkXgZI9gCNpyujyZceeP23B7zhWFA
         QWConxk+ozCt0tth4TwIazpSSrd4zJKOESMb3KNw1BJC1dKJ5EuQRLCYZ5qSI8v7f66B
         hMwUSnSPQvD/GkI6ZWdMXfiAnIt1P0XmP4IlZyYeS70mqQLobh4imywR9BSFPO4HP8Pe
         sYGidPqmzB9W0Lz5TtgoRxCeAf4dE65UHhXcMwHU8VEuL78O+DvuCgJ4F9RtUOaGK3J9
         O6Kw==
X-Gm-Message-State: AOAM533jVdkAQIdT1va+i74g/9CEmkZdVDmLrx8Wt4XqsPTqW1TExqA9
        wFivMIGT1EbH26McBcaOYWjbIDKBI0RbW/kZP9bB3wdM
X-Google-Smtp-Source: ABdhPJyVdCMOnBfuxdOXo7mr++S1KYb0UcW3ChSaGdt7b9E0n1fgEkI2UkTiLpd8VLW7qAN5L0A6mVbWRI2kld1V30o=
X-Received: by 2002:a17:906:5a4e:: with SMTP id my14mr1342308ejc.302.1641852316140;
 Mon, 10 Jan 2022 14:05:16 -0800 (PST)
MIME-Version: 1.0
References: <822c3852-1d15-2976-8672-e49ae34c328f@synopsys.com>
 <CAFBinCC_0RpCMsj3AUt9fZrjHi6_qFirQtRR1g5VJcn45GpWAw@mail.gmail.com>
 <ad475275-eb2c-6309-fc59-494f94bf0605@synopsys.com> <CAFBinCCXioWL+ZGwvC8Ltrmx4y2XpGK03JAm8X=wDB4_dQ+pFA@mail.gmail.com>
 <20210715014451.GA397753@rowland.harvard.edu> <CAFBinCD0GKcc8veWAkWG=NCban4k8n5E-QdhNfccuH8OXvtA6g@mail.gmail.com>
 <20210719145322.GA565905@rowland.harvard.edu> <CAFBinCDAXzDugaCcf52ubE+a==7CtDkmHpX2hAeO+DkJWQCNSg@mail.gmail.com>
 <20210721155817.GC633399@rowland.harvard.edu> <CAFBinCBkUsTsPiMQ2iN5U63NczxXFHv818O-G01WzJXZ36ybeA@mail.gmail.com>
 <20210803213216.GA376608@rowland.harvard.edu> <CAFBinCAvFbLXoobcTWiOoUrRSFnNzhOdn-=dkxvJOMkeOC+EAg@mail.gmail.com>
In-Reply-To: <CAFBinCAvFbLXoobcTWiOoUrRSFnNzhOdn-=dkxvJOMkeOC+EAg@mail.gmail.com>
From:   Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date:   Mon, 10 Jan 2022 23:05:05 +0100
Message-ID: <CAFBinCAMJXtK4VOknGmfPB0GwHnJNtQ8gSMwQR-8a-gJP6jL6g@mail.gmail.com>
Subject: Re: ODROID-C1/-C2 USB Detection only triggered by some devices dwc2
To:     Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
Cc:     Alan Stern <stern@rowland.harvard.edu>,
        Matt Corallo <oc2udbzfd@mattcorallo.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-amlogic@lists.infradead.org" 
        <linux-amlogic@lists.infradead.org>,
        "linux.amoon@gmail.com" <linux.amoon@gmail.com>,
        Artur Petrosyan <Arthur.Petrosyan@synopsys.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Minas,

On Sun, Dec 12, 2021 at 5:08 PM Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:
[...]
> On Tue, Aug 3, 2021 at 11:32 PM Alan Stern <stern@rowland.harvard.edu> wrote:
> >
> > Minas, you should look at analysis of the usbmon information below.
> Minas, it would be great if you could take the time to go through
> Alan's findings.
> Since it's been a while I am trying to summarize the current state of
> the findings here.
Since I sent my last email you were probably on vacation. I hope you
had a good time!

> In [0] Alan mentioned:
> > Minas, some of the things noted below may require your attention. In
> > particular, the usbmon traces don't show the root hub doing what it should,
> > which leads me to wonder whether the Genesys Logic hub attached to port 1
> > really is getting suspended and resumed properly.
>
> Then in [1] Alan goes through the usbmon traces from my Meson8b
> Odroid-C1+ and comes to the following conclusion:
> > [...] the trace shows that the GL hub was never fully suspended!
> >
> > So the question is: Why doesn't the port status on the DWC2 root hub
> > show the suspend feature set, and why doesn't the root hub port get
> > suspended?  This looks like a bug in the dwc2 driver. [...]
>
> Linux 5.16-rc4 is still affected by this issue, meaning that it hasn't
> been fixed in the meantime.
>
> I am happy about any feedback which can help resolve this issue. That
> means: even if you have an idea (like: flipping bit X in register Y
> could help) which you are unable to test yourself then please let me
> know - I can take care of the testing part (and share debug
> logs/usbmon traces if needed).
Could you please take out some time to go through Alan's findings and
let me know if/what you need from my end so we can resolve this issue?


Thank you!
Best regards,
Martin
