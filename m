Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2E70875D7A6
	for <lists+linux-usb@lfdr.de>; Sat, 22 Jul 2023 00:45:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229763AbjGUWpJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 21 Jul 2023 18:45:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230037AbjGUWpI (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 21 Jul 2023 18:45:08 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C3FD3A8C
        for <linux-usb@vger.kernel.org>; Fri, 21 Jul 2023 15:45:06 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-992b27e1c55so372218566b.2
        for <linux-usb@vger.kernel.org>; Fri, 21 Jul 2023 15:45:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1689979504; x=1690584304;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UlbhjqXQg7VrRY714bJFhKiLE8AjgGqQQTyreHqWQBI=;
        b=bFaE7+t/zSr4iNFjrMkLdx8PKhxsrqYK3T+HV5/GVHx3+tHyt5yJ0O3HNNW28v/lMx
         3V4RZgHgIxWgH3fBI3rkSpbMBdCIYeT0YG6hizU6Fc4iXx+tDCHHjIsVfKmBIDlQumI1
         tbzyfSey1jNMe1JtVV7eFnKYyO+AW/2oI6BrC5qWGNAeIiKhupGZChaLlxXT5DuIt8+J
         dcAxMAHsPeP6YFd+2S4rKxIONpewABwqe6plz4fkl5+6g0S2mJk+ML3QfPn9/iJHpTe6
         oW8y5rE+vY+mSxbVIp2jGuYvRdsk1AzY9W4qwfJBK6IS8Rs6mHFQX1EHYH+DCj+ZeMqi
         jgIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689979504; x=1690584304;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UlbhjqXQg7VrRY714bJFhKiLE8AjgGqQQTyreHqWQBI=;
        b=VypyGfaLUCP0HWrWDfqWe0Abe4emhzd/KOQjnE7f0HKRmt3/Ib8EW8u/FeRAKkYQ5C
         XvCTXacizjmrqwjtwZgOZE9xe7VcHSqLV5xP1cPKrB7GtRi8bZ6uTVjwQnGkYLX+MQSV
         /q1xKq51uskbyXWiQNN1TMjZD9+EIJD94JS4S01suDxY3WzmSb/fE4vJ/cYqbA5pQPhl
         wkt4WVELHIvGvhzcWyJYDUyxRbbgKn8+N3CRv5UmqHlfIvdpBvjV7Ge0wKFhZ0uPrS1t
         YXpBkkOiFAx3ewLGlxwMYv+jR/gMyw9tvBN95h2R6oiAFybdhqDn59Kgv4Dx9myCil7b
         HsKA==
X-Gm-Message-State: ABy/qLbIqetco7efNZmP38EfvJjkGuVuZ2hAi5zcTYsYmu8PtyDc8kSm
        PBV4jPluIqlQhm5Z/sbToR4XXgbYfOtk3PvDs/Sipw==
X-Google-Smtp-Source: APBJJlFqsU3gasrCHNKZ9kJk8nMha8Y8YvCbuUEEB8P0EMfi/Dh89x6T/v1ejQHZWk2Tb8MWzBbriZwVsx1lClzh0zk=
X-Received: by 2002:a17:906:3059:b0:994:673:8afa with SMTP id
 d25-20020a170906305900b0099406738afamr2683327ejd.28.1689979504498; Fri, 21
 Jul 2023 15:45:04 -0700 (PDT)
MIME-Version: 1.0
References: <4d7aa3f4-22d9-9f5a-3d70-1bd7148ff4ba@google.com>
 <8de4bb54-8daa-73c0-b5eb-4aa4b9675ce5@ideasonboard.com> <fa11d883-2c72-486f-9b7b-46f238e2e03f@rowland.harvard.edu>
In-Reply-To: <fa11d883-2c72-486f-9b7b-46f238e2e03f@rowland.harvard.edu>
From:   Avichal Rakesh <arakesh@google.com>
Date:   Fri, 21 Jul 2023 15:44:52 -0700
Message-ID: <CAMHf4WJ4QyvFfnAWSk_D3VuPOe7+if=pgQvunjLXOHTcBgi4Qw@mail.gmail.com>
Subject: Re: Kernel panic when unbinding UVC gadget function
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     Dan Scally <dan.scally@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Greg KH <gregkh@linuxfoundation.org>,
        Badhri Jagan Sridharan <badhri@google.com>,
        "Eino-Ville Talvala (Eddy)" <etalvala@google.com>,
        Jayant Chowdhary <jchowdhary@google.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Thank you both, Dan and Alan, for your comments!

On Fri, Jul 21, 2023 at 12:32=E2=80=AFPM Alan Stern <stern@rowland.harvard.=
edu> wrote:
>
> On Fri, Jul 21, 2023 at 04:57:51PM +0100, Dan Scally wrote:
> > Hi Avichal - thanks for all the detail
> >
> > > A dirty Patch for option 2 is attached below which skips calling
> > > usb_function_deactivate if uvc_function_disable was called before. It=
 seems
> > > to work okay in testing. Let me know if the analysis and solutions se=
ems okay
> > > and I can upload a formal patch.
> >
> >
> > For what it's worth the analysis makes sense; the patch looks ok to me =
so if
> > the conclusion is to fix the problem that way I think it's fine, but I'=
m
> > more inclined to consider this a locking problem in core - it'd be bett=
er to
> > fix it there I think.
>
> I'm not so sure that handling this in the core is feasible.  Removing
> the driver obviously needs to be synchronized with deactivation, since
> the two actions affect the same parts of the state (i.e., the pull-ups
> and the "connected" flag).

I don't have the full context on what caused the locking to be added,
but now that it
in place, it seems like there needs to be a clarification of
expectation between core
and the gadget drivers. Is it valid for the gadget drivers to call
usb_gadget_deactivate (and similar functions) as a part of disable/unbind
(in terms of API/expectations)?

1. If yes, maybe core can track when it is in the middle of resetting and
drop calls to usb_gadget_deactivate if called in the middle of the
disconnect--->unbind sequence. This is effectively what the patch above
does in UVC driver, but core might (with some extra state) have stronger
guarantees of when a call is redundant and can be safely dropped.

2. If no, then it becomes the gadget's responsibility to ensure that it doe=
sn't
call any of the usb_gadget_* functions when disabling/unbinding. However, i=
t
does require core to provide some concrete rules around when things are saf=
e
to call, and when they aren't.

>
> Consequently I don't see how to avoid a deadlock if the driver's unbind
> callback does a deactivate.  Besides, as the patch mentions, doing so is
> never necessary.
>
> However, even with that call removed we could still have a problem.  I
> don't know much about how the UVC function driver works, but it would be
> reasonable for the driver to have a private mutex that gets held both
> during unbind and when the user application closes the V4L2 node.  Then
> there's an ABBA locking issue:
>
>         Unbind: The UDC core holds connect_lock while calling the UVC
>         unbind handler, which needs to acquire the private mutex.
>
>         Close node: The UVC driver holds the private mutex while doing
>         a deactivate, which needs to acquire connect_lock.
>
> Any ideas on how to clear this up?
>

I think my question above gives us two options out based on the answer:

1. Core handling redundant calls is the more bullet-proof solution IMO. It
means that the gadget driver never holds connect_lock when it shouldn't.
No more ABBA!

One potential implementation is to track when core is resetting in a protec=
ted
flag. All functions related to resetting/disconnecting would check the
flag before
locking connect_lock and would become no-ops if gadget is in the middle of
resetting.

2. Some stronger guarantees will let the gadget driver's state machine deci=
de
if it can call usb_gadget_* functions. For example, if we can say for sure =
that
disable call will always be followed by the unbind call, and that usb_gadge=
t_*
functions are disallowed between the two, then UVC driver can handle ABBA
situation by tracking when it is between a disable and unbind call and skip
calling usb_gadget_* function until unbind finishes.

The downside of (2), is that a poorly written (or malicious) gadget driver =
can
grind the gadget to a halt with a somewhat simple deadlock.

Unfortunately, I am travelling over the next week, but I'll try to
create and attach
a dirty patch for core to handle redundant calls to usb_gadget_* over the n=
ext
week.

I am fairly new and don't know the full semantics around core, so if I
am missing
something simple here, please do let me know!

Regards,
Avi
