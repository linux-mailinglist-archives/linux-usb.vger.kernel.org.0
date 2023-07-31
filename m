Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4DEF476A0B9
	for <lists+linux-usb@lfdr.de>; Mon, 31 Jul 2023 20:58:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230174AbjGaS6T (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 31 Jul 2023 14:58:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229486AbjGaS6S (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 31 Jul 2023 14:58:18 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80D769E
        for <linux-usb@vger.kernel.org>; Mon, 31 Jul 2023 11:58:17 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-2b9bee2d320so72517411fa.1
        for <linux-usb@vger.kernel.org>; Mon, 31 Jul 2023 11:58:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1690829895; x=1691434695;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4oxjOcheoKpsDM2xN2U2v/k6YSBJ6FeRy8U903DeE8Y=;
        b=fZNfYS91HKAqcqDTbTgMivCTr03EJi0OQcsV9/rZJLwMcEkbfMfKSPGvXsjPf9si+C
         Z6mJN7dsFK1SdKu+K84K6AE38fwGrPiu8QcHDwYn3SdAIKfbwqy+p3Woqbq8EFI1TNX2
         yR8paVJesevnmeYms+TckQU0yih2wSb4gE1qWr9kYku4bkU9mawm77yQEvIb1Qvdo55q
         NdsEghYyscnMqIxyuHJLQ/dtsnVwo436whPKgaHmAc4xzXp0kXoNMflmOSql/mN6nIih
         9WDGf6LKBlEEn2wUsGkARHcsKrh+xvBYRimBvbnyPhQVpcYZvPUz2K3FLYm7b9mHH3JS
         z7pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690829895; x=1691434695;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4oxjOcheoKpsDM2xN2U2v/k6YSBJ6FeRy8U903DeE8Y=;
        b=fNroT5YEgxdzcnYCgfAdd9DCSQqxBjPolMij/uBTCY/3A2QSrGrA5vCeC8XTMPdImt
         Cy1SMd4GfdDBHNdXlrTYMUxjElOsjgAxayLYEtfvgRcPA71JMaMgeQmVCjSWKnMQ4Qob
         Wm83gBNgwsyecU7g9oDVxskq6kRAtrCjOfcC/KX9ZK7iiQTMtTKuOdGdF2pxuyJgxdPC
         tIJrB/SL6JXnU/89twuy00qefE5BAeq6alan+TBBeujQoJ/UlYLuLZPybN/7lK14MvTF
         Irkrk1b4fqAUnwlaTVpYKPs/S83f6HVDvdX9QQoo7FOyaYCtRzZrzlR1hFkdbIsx5Unj
         bOFg==
X-Gm-Message-State: ABy/qLYdc07iOohc+HsziEzAObt3XdCGdmlRG1AGKVngmmW38ErP53ok
        GI4VnrJ8rc0hvEZv1bgtfA2Iib/c6z2WWDrwGQDpeA==
X-Google-Smtp-Source: APBJJlGktSxx4YUN/wNDBst69t0w7/N5c4Y4nV00pgGZARtunHNrxoXkjhQxuGTuiQasbv0M03oTKvHtvotrZb1iHys=
X-Received: by 2002:a2e:870a:0:b0:2b8:36d4:7b0a with SMTP id
 m10-20020a2e870a000000b002b836d47b0amr539794lji.29.1690829895392; Mon, 31 Jul
 2023 11:58:15 -0700 (PDT)
MIME-Version: 1.0
References: <4d7aa3f4-22d9-9f5a-3d70-1bd7148ff4ba@google.com>
 <8de4bb54-8daa-73c0-b5eb-4aa4b9675ce5@ideasonboard.com> <fa11d883-2c72-486f-9b7b-46f238e2e03f@rowland.harvard.edu>
 <CAMHf4WJ4QyvFfnAWSk_D3VuPOe7+if=pgQvunjLXOHTcBgi4Qw@mail.gmail.com>
 <8242fba3-ebcc-481e-92bb-e25a3516853a@rowland.harvard.edu>
 <CAMHf4W+d1P8_Ahgc=Wj5K7BJa2Oi+cfXozd8e0_cdzioAjHeBg@mail.gmail.com>
 <7a71a4c9-324e-44a9-b38b-31ea87d60e6e@rowland.harvard.edu>
 <b55b51b3-7632-4ba5-b4fc-ea0384321149@rowland.harvard.edu>
 <CAMHf4WL8jWhkeDsLpH1z9sXi4-42+WExtCeJWjXNKy9R85oJQg@mail.gmail.com> <fe501805-2eec-4cd1-be61-ad446002af9c@rowland.harvard.edu>
In-Reply-To: <fe501805-2eec-4cd1-be61-ad446002af9c@rowland.harvard.edu>
From:   Avichal Rakesh <arakesh@google.com>
Date:   Tue, 1 Aug 2023 00:28:03 +0530
Message-ID: <CAMHf4WL+HyfeejbnkeTuVBw-nOG9J-dKECi7hjzUhaWJHw1n7Q@mail.gmail.com>
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

On Sat, Jul 29, 2023 at 2:33=E2=80=AFAM Alan Stern <stern@rowland.harvard.e=
du> wrote:
>
> On Fri, Jul 28, 2023 at 11:41:19PM +0530, Avichal Rakesh wrote:
> > On Fri, Jul 28, 2023 at 9:07=E2=80=AFPM Alan Stern <stern@rowland.harva=
rd.edu> wrote:
> > > It's not clear that the patch will fix the problem entirely.  Your
> > > original analysis of the bug stated:
> > >
> > > > This means that attempting to unregister the UVC Gadget Driver resu=
lts in the
> > > > V4L2 resource cleanup being stuck behind udc->connect_lock, which w=
ill only
> > > > be released after uvc_function_unbind finishes. This results in eit=
her the
> > > > gadget deactivating after the unbind process has finished, or in a =
Kernel Panic
> > > > as it tries to cleanup a V4L2 node that has been purged.
> > >
> > > My patch removes the locking issue.  But if an execution path can
> > > occur with a lock present, it can also occur when the lock has been
> > > removed.  That means it may still be possible for the UVC gadget driv=
er
> > > to try deactivating the UDC after the unbind process has finished or =
for
> > > it to try cleaning up a V4L2 node that has been purged.
> > >
> > > If either of those really could have happened (as opposed to just
> > > getting stuck in a deadlock, waiting for a mutex that would never be
> > > released), then it can still happen with the patch.  Fixing them woul=
d
> > > require changes to the UVC gadget driver.  So the problem may not be
> > > gone entirely.
> > >
> > The current situation can theoretically happen without the deadlock,
> > yes, but shouldn't happen in practice. UVC's disable/unbind code flow
> > looks as follows:
> >
> > 1. When disable callback is called, the gadget driver signals the
> > userspace application to close the V4L2 node.
> > 2. Closing the V4L2 node calls the release callback to clean up
> > resources. It is this callback that calls into gadget_deactivate and
> > gets blocked currently (without your patch).
> > 3. Separately, the unbind callback waits on release callback to finish
> > for 500ms, assuming the userspace application to behave well and close
> > the node in a reasonable amount of time.
> > 4. If the release callback still hasn't been called, the V4L2 node is
> > forcefully removed and UVC driver waits for another 1000ms for the
> > release callback to clean up any pending resources.
> > 5. The unbind process continues regardless of the status of release
> > callback after waiting at most 1.5s for release.
> >
> > So the only way to run into the current issue is if the release
> > callback fails to finish in both step 3 and step 4 (for example, due
> > to a deadlock) in the span of 1.5s. It is possible, but fairly
> > unlikely (at least in my limited understanding) for the release
> > callback to be delayed for quite that long.
> >
> > Hope that makes some sense!
>
> Yes, and it shows that there really is a bug in the UVC driver.  In
> kernel programming, fairly unlikely =3D=3D not impossible =3D=3D bound to=
 happen
> eventually!
>
> I don't know enough about the driver to make any detailed
> recommendations.  But you might consider, for example, that if the
> unbind routine can get along with forcibly removing the V4L2 node and
> not waiting for the release callback to finish, then why not have it
> behave that way all the time?  In other words, shorten the timeouts from
> 500 ms and 1000 ms to 0 ms.

Forcibly removing the V4L2 node doesn't clean up the associated
resources (for example, the fd held by the userspace application),
so we risk running into kernel panics if the V4L2 node is forcibly
removed without a clean release from the userspace application.

I don't see an easy way to reduce or remove the timeouts entirely,
but I might be missing something simple again. Dan and Laurent,
if you have ideas around this, I am happy to test stuff out!

>
> Whether you do that or not, someone definitely should fix up the release
> routine so that it won't get into trouble if it is called after (or
> concurrently with) all of the cleanup operations -- which is quite
> likely to happen if those timeouts are eliminated!  In particular, it
> shouldn't call gadget_deactivate unless it knows that an unbind hasn't
> happened yet.  And if that is the case, it should block the unbind
> routine until gadget_deactivate returns.  Basically, it's a bug for a
> function driver to call any gadget core routine after its unbind
> callback has returned.
>

This seems like a reasonable check to have. I am out until next week,
but I can test and put up a patch once I get back!

Thank you!

- Avi.
