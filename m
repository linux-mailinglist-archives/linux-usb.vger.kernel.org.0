Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 85F441589F3
	for <lists+linux-usb@lfdr.de>; Tue, 11 Feb 2020 07:17:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728187AbgBKGRm (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 11 Feb 2020 01:17:42 -0500
Received: from mail-ot1-f65.google.com ([209.85.210.65]:45966 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727953AbgBKGRm (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 11 Feb 2020 01:17:42 -0500
Received: by mail-ot1-f65.google.com with SMTP id 59so8960750otp.12
        for <linux-usb@vger.kernel.org>; Mon, 10 Feb 2020 22:17:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/MEQw0BcuYdl7OtM/Po64qcj8s7w0xeBRRKP2Qjooeg=;
        b=Ra5Yme6f+eJhQ+sE18QIS6TeOm5m5itvWkjIzpibvGQNTEEhAKV1Th6DIsD3pxOFav
         Mw5QQIwS7LuzVztrrYN7KOC0LXlLEkoAZYqPrrqI8EJnnRlwr0cf1Q0ZBhZvaAJmLI8p
         ioMj/xaGKLO5UiBOFH8cOfhklbNmAvcJFUT+Q2RZU6RJ0ZVRuiP0Ie47p3jAbGDIvRI1
         9yyLqfzSRang/16dsH321tTXBZgRcQQYvJHBcbB6w73BDLZmxdynCJZSg7XxkFGyfMHK
         V6p/in3KTrdjh7o6mKOOf5Qr3gLnEZ76jiCf+S2SGNGt4QrmLVklK3w4yFNqIBlS9cgm
         U7nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/MEQw0BcuYdl7OtM/Po64qcj8s7w0xeBRRKP2Qjooeg=;
        b=GMWD/5nEIz1WRRkC7YGscm4TOSZEykO/0zfLakAn/BEwA2iyiLqDKqkE1XZzPKk2SQ
         F6bksdgfRCFNXJlmj6EEpa2Y2GQdyvpjv7H4urPD/x4Gy8qi4bkeTZVTSFKd+4miI4Cy
         LNoUrTViwRGjLAn8ZaIsu+wOHPxCtq/qnbGLySIzs3nkbckNhDC2al+3IilIFukLTp6k
         j3CYgSbIrMozD0EbPaY8LLHarL3PYwo23JEizbiKZcPqCcQYxeU4NeMPyHydPWzAqRGL
         vx46VCE4GvoeWBhwZUqjEw+mywxZ+sM+be9tSmFCBJ5RDWnQFDg5anMAuY4bfGYdWZK8
         Fufw==
X-Gm-Message-State: APjAAAWln65Rm+DJ+MBEMFXEPZ/IxSX74BTTgsCSReMYkBl/e/H0cSG0
        Lu6SDFl8NmVowUusYSUYbc8PTneLuUuEfsfGiGYHQQ==
X-Google-Smtp-Source: APXvYqzCpc1eloKBOQlHM9vl8Lqq8p1DqTPYDqdlMMXCrsEpljaTTZi/quVzcZVdKfh65y9SE3OfvYXw2DSLCQR09+k=
X-Received: by 2002:a9d:6a85:: with SMTP id l5mr4218800otq.231.1581401860586;
 Mon, 10 Feb 2020 22:17:40 -0800 (PST)
MIME-Version: 1.0
References: <20191104143713.11137-1-alexandre.torgue@st.com>
 <20200206133918.15012-1-youling257@gmail.com> <0c4a37a9-0a2e-e698-f423-53060854ea05@ti.com>
 <CAOzgRdb5QfJDQzbtoHQry4wxUg52LwX5XFCPzzaYa=z+RqNWOQ@mail.gmail.com>
 <8bd72269-16ae-b24a-7144-44d22d668dc6@ti.com> <1cd5885d-7db4-59b9-ef2d-e3556f60ca68@st.com>
 <c2950949-6a9d-afe0-7c44-4378018b9d95@ti.com>
In-Reply-To: <c2950949-6a9d-afe0-7c44-4378018b9d95@ti.com>
From:   Saravana Kannan <saravanak@google.com>
Date:   Mon, 10 Feb 2020 22:17:04 -0800
Message-ID: <CAGETcx8oaigQKqaJ=n1PPAT7nyVgvm9DpaSnJFXqgTrd_FNmsw@mail.gmail.com>
Subject: Re: [PATCH] phy: core: Add consumer device link support
To:     Kishon Vijay Abraham I <kishon@ti.com>
Cc:     Alexandre Torgue <alexandre.torgue@st.com>,
        youling 257 <youling257@gmail.com>,
        yoshihiro.shimoda.uh@renesas.com,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        LKML <linux-kernel@vger.kernel.org>, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Feb 10, 2020 at 4:14 AM Kishon Vijay Abraham I <kishon@ti.com> wrote:
>
> Hi,
>
> On 10/02/20 5:00 PM, Alexandre Torgue wrote:
> > Hi Kishon,
> >
> > On 2/10/20 9:08 AM, Kishon Vijay Abraham I wrote:
> >> Hi Alexandre,
> >>
> >> On 07/02/20 12:27 PM, youling 257 wrote:
> >>> test this diff, dwc3 work for my device, thanks.
> >>>
> >>> 2020-02-07 13:16 GMT+08:00, Kishon Vijay Abraham I <kishon@ti.com>:
> >>>> Hi,
> >>>>
> >>>> On 06/02/20 7:09 PM, youling257 wrote:
> >>>>> This patch cause "dwc3 dwc3.3.auto: failed to create device link to
> >>>>> dwc3.3.auto.ulpi" problem.
> >>>>> https://bugzilla.kernel.org/show_bug.cgi?id=206435
> >>>>
> >>>> I'm suspecting there is some sort of reverse dependency with dwc3 ULPI.
> >>>> Can you try the following diff?
> >>>>
> >>>> diff --git a/drivers/phy/phy-core.c b/drivers/phy/phy-core.c
> >>>> index 2eb28cc2d2dc..397311dcb116 100644
> >>>> --- a/drivers/phy/phy-core.c
> >>>> +++ b/drivers/phy/phy-core.c
> >>>> @@ -687,7 +687,7 @@ struct phy *phy_get(struct device *dev, const char
> >>>> *string)
> >>>>
> >>>>          get_device(&phy->dev);
> >>>>
> >>>> -       link = device_link_add(dev, &phy->dev, DL_FLAG_STATELESS);
> >>>> +       link = device_link_add(dev, &phy->dev,
> >>>> DL_FLAG_SYNC_STATE_ONLY);
> >>>>          if (!link) {
> >>>>                  dev_err(dev, "failed to create device link to %s\n",
> >>>>                          dev_name(phy->dev.parent));
> >>>> @@ -802,7 +802,7 @@ struct phy *devm_of_phy_get(struct device *dev,
> >>>> struct device_node *np,
> >>>>                  return phy;
> >>>>          }
> >>>>
> >>>> -       link = device_link_add(dev, &phy->dev, DL_FLAG_STATELESS);
> >>>> +       link = device_link_add(dev, &phy->dev,
> >>>> DL_FLAG_SYNC_STATE_ONLY);

Definitely don't use SYNC_STATE_ONLY.

To give some context, drivers themselves are only expected to use
STATELESS links. Only the driver core is supposed to use MANAGED (if
you don't use STATELESS, it's MANAGED by default) links. And
SYNC_STATE_ONLY makes sense only for MANAGED links.

Also, as the SYNC_STATE_ONLY documentation says, it only affect
sync_state() behavior and doesn't affect suspend/resume in any way.

> >>>>          if (!link) {
> >>>>                  dev_err(dev, "failed to create device link to %s\n",
> >>>>                          dev_name(phy->dev.parent));
> >>>> @@ -851,7 +851,7 @@ struct phy *devm_of_phy_get_by_index(struct device
> >>>> *dev, struct device_node *np,
> >>>>          *ptr = phy;
> >>>>          devres_add(dev, ptr);
> >>>>
> >>>> -       link = device_link_add(dev, &phy->dev, DL_FLAG_STATELESS);
> >>>> +       link = device_link_add(dev, &phy->dev,
> >>>> DL_FLAG_SYNC_STATE_ONLY);
> >>>>          if (!link) {
> >>>>                  dev_err(dev, "failed to create device link to %s\n",
> >>>>                          dev_name(phy->dev.parent));Parent
> >>
> >> Can you check if this doesn't affect the suspend/resume ordering?
> >
> > With this fix, suspend/resume ordering is broken on my side. What do you
> > think to keep the STATELESS flag and to only display a warn if
> > "device_link_add" returns an error ? It's not "smart" but it could
> > solved our issue.
>
> yeah, that sounds reasonable for now. Can you find out the dependencies
> between dwc3 and ulpi and what exactly breaks. That would help Saravana
> to suggest a fix?

Yup, I don't have enough context of the dependencies here to suggest a
good fix. But if device_link_add() is failing with STATELESS and not
failing with SYNC_STATE_ONLY, I'm pretty sure you have a cyclic
dependency between these devices when you create this link. Keep in
mind that it can be a cycle involving more than 2 devices -- A -> B ->
C -> A. And cycles don't make sense when you are trying to order
suspend/resume. Looks like the new link is wrong or an existing link
is wrong. If the dependencies are actually correct in hardware, then
maybe your hardware device needs to be split into multiple devices so
that you don't have cycles and can suspend in a meaningful way?

Hope that helps.

Thanks,
Saravana
