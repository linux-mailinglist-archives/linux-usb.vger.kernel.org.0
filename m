Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C444471B7C
	for <lists+linux-usb@lfdr.de>; Sun, 12 Dec 2021 17:09:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231585AbhLLQJI (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 12 Dec 2021 11:09:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231533AbhLLQJH (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 12 Dec 2021 11:09:07 -0500
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47F3CC061714
        for <linux-usb@vger.kernel.org>; Sun, 12 Dec 2021 08:09:07 -0800 (PST)
Received: by mail-ed1-x52e.google.com with SMTP id y13so44356184edd.13
        for <linux-usb@vger.kernel.org>; Sun, 12 Dec 2021 08:09:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DkAulMTMtKw2w5bqZ/0CFo/a59odCZge/GAfRMdK6KI=;
        b=EYgow41kI9pVQWkOWpCMbVh/3BTTHFAI/nGfAP8NJd8EJv8ms06cABW64n446w/c8n
         apn7jT3DTPNB48aKcIbBqFHXoEA49pqgA2Rgk0w/DIpf59HSS6Eny+BPDhLojF1EfgRz
         CRQ744mkaWqxrE59yOtg3uLiB71rvKiJ0bSgkXyb3oAKaQqUlNo9Sp/tpXL5+bWPRzOD
         oY7Fdb2xaJ6VoDRmljpQMTD45fKhxGtQbkOQlrhYBS5R5+jDpI5ntAVzlHFkEQlAM+P9
         OqW402KAMLVETKk7tqiZEvPzA4loy1RU6Nchm6RqDKDP++qekuwgFkTGHlvROKt9uqky
         b2Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DkAulMTMtKw2w5bqZ/0CFo/a59odCZge/GAfRMdK6KI=;
        b=nAxweUu1xO9Hk5OE2LJ00YjV6FE/qLT488yaDO4uakVgrFSORAHKh8GsX4yhqCYoz/
         JPaSRaFJ/XW0O5qhZdN1iRAX4IAhbESiI+jxmUohIQDQdPYCx70oL4RB/Kyr4F4ftOGc
         ESgfwst/Wr0TaB2EJq1f3DoCcQOsholj3LUszbiQqsyGhEXBPWzfFwME1IOGu3ckiWdz
         v7UXXHN8nAJNC+ToZatCpEsD3Bgnc4R44//PaqzGzhY/+0cmvLdu9okFZQwqUOEIgfKN
         XtMT5+56BOissNwUorabRaqHS6fJzGuRQ7QZ6WIV5tvZnI/A0qGy3UfLKDKneEiDuGTD
         2RKQ==
X-Gm-Message-State: AOAM530j6AeVewdetCj6fB09QWDOBe0VEItSwvr2/umDwl95D0yOO2PP
        C40sHatqIwKQGkhFYGMnpzA0j/3XqgP0Vtb8H5k=
X-Google-Smtp-Source: ABdhPJyjprtNnmboFo6/kAeDa9wBPJFQsnjcSFIOvB3Yhj6K3BRo9u3lDYCsgLMdsTPkkf6y1tJEbTWAYrPEaDbS+4I=
X-Received: by 2002:a17:907:6e8e:: with SMTP id sh14mr37318893ejc.536.1639325345774;
 Sun, 12 Dec 2021 08:09:05 -0800 (PST)
MIME-Version: 1.0
References: <822c3852-1d15-2976-8672-e49ae34c328f@synopsys.com>
 <CAFBinCC_0RpCMsj3AUt9fZrjHi6_qFirQtRR1g5VJcn45GpWAw@mail.gmail.com>
 <ad475275-eb2c-6309-fc59-494f94bf0605@synopsys.com> <CAFBinCCXioWL+ZGwvC8Ltrmx4y2XpGK03JAm8X=wDB4_dQ+pFA@mail.gmail.com>
 <20210715014451.GA397753@rowland.harvard.edu> <CAFBinCD0GKcc8veWAkWG=NCban4k8n5E-QdhNfccuH8OXvtA6g@mail.gmail.com>
 <20210719145322.GA565905@rowland.harvard.edu> <CAFBinCDAXzDugaCcf52ubE+a==7CtDkmHpX2hAeO+DkJWQCNSg@mail.gmail.com>
 <20210721155817.GC633399@rowland.harvard.edu> <CAFBinCBkUsTsPiMQ2iN5U63NczxXFHv818O-G01WzJXZ36ybeA@mail.gmail.com>
 <20210803213216.GA376608@rowland.harvard.edu>
In-Reply-To: <20210803213216.GA376608@rowland.harvard.edu>
From:   Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date:   Sun, 12 Dec 2021 17:08:55 +0100
Message-ID: <CAFBinCAvFbLXoobcTWiOoUrRSFnNzhOdn-=dkxvJOMkeOC+EAg@mail.gmail.com>
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

first of all, I want to apologize for the big delay in this discussion.

On Tue, Aug 3, 2021 at 11:32 PM Alan Stern <stern@rowland.harvard.edu> wrote:
>
> Minas, you should look at analysis of the usbmon information below.
Minas, it would be great if you could take the time to go through
Alan's findings.
Since it's been a while I am trying to summarize the current state of
the findings here.

In [0] Alan mentioned:
> Minas, some of the things noted below may require your attention. In
> particular, the usbmon traces don't show the root hub doing what it should,
> which leads me to wonder whether the Genesys Logic hub attached to port 1
> really is getting suspended and resumed properly.

Then in [1] Alan goes through the usbmon traces from my Meson8b
Odroid-C1+ and comes to the following conclusion:
> [...] the trace shows that the GL hub was never fully suspended!
>
> So the question is: Why doesn't the port status on the DWC2 root hub
> show the suspend feature set, and why doesn't the root hub port get
> suspended?  This looks like a bug in the dwc2 driver. [...]

Linux 5.16-rc4 is still affected by this issue, meaning that it hasn't
been fixed in the meantime.

I am happy about any feedback which can help resolve this issue. That
means: even if you have an idea (like: flipping bit X in register Y
could help) which you are unable to test yourself then please let me
know - I can take care of the testing part (and share debug
logs/usbmon traces if needed).


Thank you and best regards,
Martin


[0] https://lore.kernel.org/linux-usb/20210721155817.GC633399@rowland.harvard.edu/
[1] https://lore.kernel.org/linux-usb/20210803213216.GA376608@rowland.harvard.edu/
