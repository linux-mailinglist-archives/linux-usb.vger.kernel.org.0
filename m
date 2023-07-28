Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5CD7976671F
	for <lists+linux-usb@lfdr.de>; Fri, 28 Jul 2023 10:28:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233510AbjG1I2X (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 28 Jul 2023 04:28:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60042 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235010AbjG1I1p (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 28 Jul 2023 04:27:45 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8B094231
        for <linux-usb@vger.kernel.org>; Fri, 28 Jul 2023 01:27:28 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-98de21518fbso266013066b.0
        for <linux-usb@vger.kernel.org>; Fri, 28 Jul 2023 01:27:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1690532847; x=1691137647;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NBeFeYu5LPdaj9QQr3EeLwjFgjov2ROm4dhoLXZCukk=;
        b=Elf9XDp64fVL8/PSoEY7hxtHFb8tb/EaXQleNbt4rQ3drbP0QZK9hyLCZ5RXayk0gn
         MIzwSEExZTjUf9BFP8CUawqJFnONbOxB+azP2U+kfw0zSay8/VyM0n1JIfGM8xfV7EdW
         n+ZGZG0dZP+OijrsZnr1ga4S7XcMP2VkwnDe6NofwtQl7HjY6vGU6J7hlO4CGRXoXTB8
         xDNvZMu2UwVY2xWvt1BIzSI/PpXzXWXLnGDmhJYcnDKOiLfnc39CIOKszeJ9Jd86/WQ1
         WyNOz25jRUzK3Ut+cBRFVhKDWtxENHnwtkY3B1UMubXWLt3z0/yo8fGiWoE0DLWwYlxo
         XhQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690532847; x=1691137647;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NBeFeYu5LPdaj9QQr3EeLwjFgjov2ROm4dhoLXZCukk=;
        b=Rs683mdwIbR8IUrl0zOO+xwp5EZ3wXBr4qrqWbbpf1dnk9Tn2puOmwsZHjqUdUW3/p
         vFNP0Z9CCe93P1EM/P8VcE4K+0aPGbkeS3zY5N3+nHAC0QtdSDyfjk6YW3tYdxeDbdlg
         MGcyr8qQW225UE+T3/QPc6JXZWHr39n2I00ELZ6Y3VBUQZuEvkTrUkv743+DNaLzp1fh
         8YufcNsYVUkCMI/mPu04mSEp/Re59ySLK/HiMSNYHsaxKFHEpGItwkE3uNCDtGN/ZMO9
         G81sPN1FXd7/evrberZOA7/N5vZl1y3P1WQqLGWVOsQvTpoNc0NDTKmTftZgUiEBOcnj
         Bm/g==
X-Gm-Message-State: ABy/qLaawZs2AHyoR2x7ffkQCMyitmfZ8x6+enNz/zHiGejudYi7xoOz
        ieLwxaefcZN5/76GuIfydQ2+jSO7U1uQqsIEjmgUSA==
X-Google-Smtp-Source: APBJJlFYAutt81VW3R5KxYbTD96ethCJQ3THBjO4+UygUewwLb6/FV6Y4pcj71BQ2lcaWXTG68oyUhrx7axdUmAMvwo=
X-Received: by 2002:a17:906:53d9:b0:99b:4bab:2844 with SMTP id
 p25-20020a17090653d900b0099b4bab2844mr2007605ejo.55.1690532846819; Fri, 28
 Jul 2023 01:27:26 -0700 (PDT)
MIME-Version: 1.0
References: <4d7aa3f4-22d9-9f5a-3d70-1bd7148ff4ba@google.com>
 <8de4bb54-8daa-73c0-b5eb-4aa4b9675ce5@ideasonboard.com> <fa11d883-2c72-486f-9b7b-46f238e2e03f@rowland.harvard.edu>
 <CAMHf4WJ4QyvFfnAWSk_D3VuPOe7+if=pgQvunjLXOHTcBgi4Qw@mail.gmail.com> <8242fba3-ebcc-481e-92bb-e25a3516853a@rowland.harvard.edu>
In-Reply-To: <8242fba3-ebcc-481e-92bb-e25a3516853a@rowland.harvard.edu>
From:   Avichal Rakesh <arakesh@google.com>
Date:   Fri, 28 Jul 2023 13:57:15 +0530
Message-ID: <CAMHf4W+d1P8_Ahgc=Wj5K7BJa2Oi+cfXozd8e0_cdzioAjHeBg@mail.gmail.com>
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
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sat, Jul 22, 2023 at 8:57=E2=80=AFPM Alan Stern <stern@rowland.harvard.e=
du> wrote:
>
> On Fri, Jul 21, 2023 at 03:44:52PM -0700, Avichal Rakesh wrote:
> > Thank you both, Dan and Alan, for your comments!
> >
> > On Fri, Jul 21, 2023 at 12:32=E2=80=AFPM Alan Stern <stern@rowland.harv=
ard.edu> wrote:
> > >
> > > On Fri, Jul 21, 2023 at 04:57:51PM +0100, Dan Scally wrote:
> > > > Hi Avichal - thanks for all the detail
> > > >
> > > > > A dirty Patch for option 2 is attached below which skips calling
> > > > > usb_function_deactivate if uvc_function_disable was called before=
. It seems
> > > > > to work okay in testing. Let me know if the analysis and solution=
s seems okay
> > > > > and I can upload a formal patch.
> > > >
> > > >
> > > > For what it's worth the analysis makes sense; the patch looks ok to=
 me so if
> > > > the conclusion is to fix the problem that way I think it's fine, bu=
t I'm
> > > > more inclined to consider this a locking problem in core - it'd be =
better to
> > > > fix it there I think.
> > >
> > > I'm not so sure that handling this in the core is feasible.  Removing
> > > the driver obviously needs to be synchronized with deactivation, sinc=
e
> > > the two actions affect the same parts of the state (i.e., the pull-up=
s
> > > and the "connected" flag).
> >
> > I don't have the full context on what caused the locking to be added,
> > but now that it
> > in place, it seems like there needs to be a clarification of
> > expectation between core
> > and the gadget drivers. Is it valid for the gadget drivers to call
> > usb_gadget_deactivate (and similar functions) as a part of disable/unbi=
nd
> > (in terms of API/expectations)?
> >
> > 1. If yes, maybe core can track when it is in the middle of resetting a=
nd
> > drop calls to usb_gadget_deactivate if called in the middle of the
> > disconnect--->unbind sequence. This is effectively what the patch above
> > does in UVC driver, but core might (with some extra state) have stronge=
r
> > guarantees of when a call is redundant and can be safely dropped.
> >
> > 2. If no, then it becomes the gadget's responsibility to ensure that it=
 doesn't
> > call any of the usb_gadget_* functions when disabling/unbinding. Howeve=
r, it
> > does require core to provide some concrete rules around when things are=
 safe
> > to call, and when they aren't.
> >
> > >
> > > Consequently I don't see how to avoid a deadlock if the driver's unbi=
nd
> > > callback does a deactivate.  Besides, as the patch mentions, doing so=
 is
> > > never necessary.
> > >
> > > However, even with that call removed we could still have a problem.  =
I
> > > don't know much about how the UVC function driver works, but it would=
 be
> > > reasonable for the driver to have a private mutex that gets held both
> > > during unbind and when the user application closes the V4L2 node.  Th=
en
> > > there's an ABBA locking issue:
> > >
> > >         Unbind: The UDC core holds connect_lock while calling the UVC
> > >         unbind handler, which needs to acquire the private mutex.
> > >
> > >         Close node: The UVC driver holds the private mutex while doin=
g
> > >         a deactivate, which needs to acquire connect_lock.
> > >
> > > Any ideas on how to clear this up?
> > >
> >
> > I think my question above gives us two options out based on the answer:
> >
> > 1. Core handling redundant calls is the more bullet-proof solution IMO.=
 It
> > means that the gadget driver never holds connect_lock when it shouldn't=
.
> > No more ABBA!
> >
> > One potential implementation is to track when core is resetting in a pr=
otected
> > flag. All functions related to resetting/disconnecting would check the
> > flag before
> > locking connect_lock and would become no-ops if gadget is in the middle=
 of
> > resetting.
> >
> > 2. Some stronger guarantees will let the gadget driver's state machine =
decide
> > if it can call usb_gadget_* functions. For example, if we can say for s=
ure that
> > disable call will always be followed by the unbind call, and that usb_g=
adget_*
> > functions are disallowed between the two, then UVC driver can handle AB=
BA
> > situation by tracking when it is between a disable and unbind call and =
skip
> > calling usb_gadget_* function until unbind finishes.
> >
> > The downside of (2), is that a poorly written (or malicious) gadget dri=
ver can
> > grind the gadget to a halt with a somewhat simple deadlock.
> >
> > Unfortunately, I am travelling over the next week, but I'll try to
> > create and attach
> > a dirty patch for core to handle redundant calls to usb_gadget_* over t=
he next
> > week.
> >
> > I am fairly new and don't know the full semantics around core, so if I
> > am missing
> > something simple here, please do let me know!
>
> Here's a proposal, along the lines of your first suggestion above.  The
> idea is to avoid holding the connect_lock mutex while invoking a gadget
> driver's callbacks.
>
> Unfortunately, this is unavoidable in the case of the ->disconnect()
> callback, but that's okay because the kerneldoc already says that
> ->disconnect() may be called in_interrupt, so it's not allowed to call
> any core routines that may sleep.  Just to make this perfectly clear,
> the patch adds a couple of comments along these lines.
>
> As far as I can tell, there is no real reason to hold connect_lock
> during the ->unbind() callback.  Not doing so should fix the problem in
> the UVC function driver.

Thank you for the patch (and apologies for the delay)! This is a neat
fix I completely glossed over. Looked around at other places where
unbind is called, and it looks like the lock isn't held anywhere else
either, so dropping the lock before calling unbind shouldn't break any
existing assumptions around the callback.

>
> Let me know if this works.
>
>
>  drivers/usb/gadget/udc/core.c |    9 +++++++++
>  1 file changed, 9 insertions(+)
>
> Index: usb-devel/drivers/usb/gadget/udc/core.c
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> --- usb-devel.orig/drivers/usb/gadget/udc/core.c
> +++ usb-devel/drivers/usb/gadget/udc/core.c
> @@ -822,6 +822,9 @@ EXPORT_SYMBOL_GPL(usb_gadget_disconnect)
>   * usb_gadget_activate() is called.  For example, user mode components m=
ay
>   * need to be activated before the system can talk to hosts.
>   *
> + * This routine may sleep; it must not be called in interrupt context
> + * (such as from within a gadget driver's disconnect() callback).
> + *
>   * Returns zero on success, else negative errno.
>   */
>  int usb_gadget_deactivate(struct usb_gadget *gadget)
> @@ -860,6 +863,8 @@ EXPORT_SYMBOL_GPL(usb_gadget_deactivate)
>   * This routine activates gadget which was previously deactivated with
>   * usb_gadget_deactivate() call. It calls usb_gadget_connect() if needed=
.
>   *
> + * This routine may sleep; it must not be called in interrupt context.
> + *
>   * Returns zero on success, else negative errno.
>   */
>  int usb_gadget_activate(struct usb_gadget *gadget)
> @@ -1639,7 +1644,11 @@ static void gadget_unbind_driver(struct
>         usb_gadget_disable_async_callbacks(udc);
>         if (gadget->irq)
>                 synchronize_irq(gadget->irq);
> +       mutex_unlock(&udc->connect_lock);
> +
>         udc->driver->unbind(gadget);
> +
> +       mutex_lock(&udc->connect_lock);
>         usb_gadget_udc_stop_locked(udc);
>         mutex_unlock(&udc->connect_lock);
>
>

Tried the patch, and it fixes the issue for UVC Gadget Driver! UVC
driver can now be unbound without locking up with the V4L2 release
callback. Logs confirm that the calls are still being interleaved, but
don't result in a deadlock now.

Regards,
Avi.
