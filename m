Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D32A176744B
	for <lists+linux-usb@lfdr.de>; Fri, 28 Jul 2023 20:11:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229661AbjG1SLh (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 28 Jul 2023 14:11:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229874AbjG1SLe (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 28 Jul 2023 14:11:34 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5279010DD
        for <linux-usb@vger.kernel.org>; Fri, 28 Jul 2023 11:11:33 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-5222bc91838so3208585a12.0
        for <linux-usb@vger.kernel.org>; Fri, 28 Jul 2023 11:11:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1690567892; x=1691172692;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M8+e/zu3IyCw+qRQkR5dp2WinfO3x95KuMhytpfrR+E=;
        b=h0TykaBY33gWjirXCh21PWtcK8Bidg0nIcD+1mjbpGWVA2XSdo2TR458REcaSqaM6H
         eNYbI0aDd4bfoNvt9YkumkYX4mzViVel8CJRWrXthQ+fl/Mfh0bYsQ5iCU+VSV05UFBN
         b6XJKiCIunY6ZBnJ2gbpWT4VmagfxLprQfSd8NIqR4ObjF5dY2GeWd8kMKwW85Dn1hlV
         ZCm9SfokdKsh5yzR8eqy8Pvi5PuEHUitFFLHvAa4Tlsq5MfYAzzDdpfBeFxxZJi1mDlK
         Y3c+xkQx++i8K5bURvYrqkw5PdcHxJ6AIDCYd3hHJ1ALHDQqVmTfV3Li6wfoYwRr+wWZ
         EYgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690567892; x=1691172692;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M8+e/zu3IyCw+qRQkR5dp2WinfO3x95KuMhytpfrR+E=;
        b=RSQPK5nBcASm8NEyuA0g/KITm/LWYmnCZX7tYgHeQqGt9JwnFFSPx6VWku+OLQLM5T
         AFmapiGN9wt7wdh1Qcy0oZrxoI1NBhmMglksKBf5w4Vrp9qEK5G8NCC/KJwUMSn51QAo
         7xv1BHjPSFZMOoTkOCdwYA0QFI95AXvxyjkowb3S8Kbcks4mvls1cSTk+nfeiaayF6/e
         mde6E7JX7vQoHuTNcEhyVpsKtVZtz3r/hLmhvhaM5xudO9UYehyWWKrDaZk8187hm7/n
         1hocjfV68whCbnSWoDC2jhU4f1XHloaDU7l8FFd1euat5j+XIFuKngGsjVUBCh7XaWoJ
         QAsA==
X-Gm-Message-State: ABy/qLZRSTKzQ5aWZ+4hImal7PUI3QaAUwUogOALdxrsgZCmhm4aHysc
        StZMhM4fTCBSrppoUlCtXiCgUQJx50Xy2ZJn8of+zg==
X-Google-Smtp-Source: APBJJlH4uMdFjjvlo4Y8BSLJ3Q2ZwgAEpYzVrCmoDBtDeMQHhkEppaz3/GGf60+eWX5REY8e7Y+DXbu6GoXwW+2Qbh4=
X-Received: by 2002:a17:906:10a:b0:994:4ebe:7a6d with SMTP id
 10-20020a170906010a00b009944ebe7a6dmr130022eje.19.1690567891637; Fri, 28 Jul
 2023 11:11:31 -0700 (PDT)
MIME-Version: 1.0
References: <4d7aa3f4-22d9-9f5a-3d70-1bd7148ff4ba@google.com>
 <8de4bb54-8daa-73c0-b5eb-4aa4b9675ce5@ideasonboard.com> <fa11d883-2c72-486f-9b7b-46f238e2e03f@rowland.harvard.edu>
 <CAMHf4WJ4QyvFfnAWSk_D3VuPOe7+if=pgQvunjLXOHTcBgi4Qw@mail.gmail.com>
 <8242fba3-ebcc-481e-92bb-e25a3516853a@rowland.harvard.edu>
 <CAMHf4W+d1P8_Ahgc=Wj5K7BJa2Oi+cfXozd8e0_cdzioAjHeBg@mail.gmail.com>
 <7a71a4c9-324e-44a9-b38b-31ea87d60e6e@rowland.harvard.edu> <b55b51b3-7632-4ba5-b4fc-ea0384321149@rowland.harvard.edu>
In-Reply-To: <b55b51b3-7632-4ba5-b4fc-ea0384321149@rowland.harvard.edu>
From:   Avichal Rakesh <arakesh@google.com>
Date:   Fri, 28 Jul 2023 23:41:19 +0530
Message-ID: <CAMHf4WL8jWhkeDsLpH1z9sXi4-42+WExtCeJWjXNKy9R85oJQg@mail.gmail.com>
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

On Fri, Jul 28, 2023 at 9:07=E2=80=AFPM Alan Stern <stern@rowland.harvard.e=
du> wrote:
>
> On Fri, Jul 28, 2023 at 10:05:39AM -0400, Alan Stern wrote:
> > On Fri, Jul 28, 2023 at 01:57:15PM +0530, Avichal Rakesh wrote:
> > > On Sat, Jul 22, 2023 at 8:57=E2=80=AFPM Alan Stern <stern@rowland.har=
vard.edu> wrote:
> >
> > > > Here's a proposal, along the lines of your first suggestion above. =
 The
> > > > idea is to avoid holding the connect_lock mutex while invoking a ga=
dget
> > > > driver's callbacks.
> > > >
> > > > Unfortunately, this is unavoidable in the case of the ->disconnect(=
)
> > > > callback, but that's okay because the kerneldoc already says that
> > > > ->disconnect() may be called in_interrupt, so it's not allowed to c=
all
> > > > any core routines that may sleep.  Just to make this perfectly clea=
r,
> > > > the patch adds a couple of comments along these lines.
> > > >
> > > > As far as I can tell, there is no real reason to hold connect_lock
> > > > during the ->unbind() callback.  Not doing so should fix the proble=
m in
> > > > the UVC function driver.
> > >
> > > Thank you for the patch (and apologies for the delay)! This is a neat
> > > fix I completely glossed over. Looked around at other places where
> > > unbind is called, and it looks like the lock isn't held anywhere else
> > > either, so dropping the lock before calling unbind shouldn't break an=
y
> > > existing assumptions around the callback.
> >
> > > Tried the patch, and it fixes the issue for UVC Gadget Driver! UVC
> > > driver can now be unbound without locking up with the V4L2 release
> > > callback. Logs confirm that the calls are still being interleaved, bu=
t
> > > don't result in a deadlock now.
> >
> > Thanks for trying it out.  Is it okay for me to add your "Tested-by:"
> > tag when the patch is submitted?

Oh, yes of course!

>
> Another thing...
>
> It's not clear that the patch will fix the problem entirely.  Your
> original analysis of the bug stated:
>
> > This means that attempting to unregister the UVC Gadget Driver results =
in the
> > V4L2 resource cleanup being stuck behind udc->connect_lock, which will =
only
> > be released after uvc_function_unbind finishes. This results in either =
the
> > gadget deactivating after the unbind process has finished, or in a Kern=
el Panic
> > as it tries to cleanup a V4L2 node that has been purged.
>
> My patch removes the locking issue.  But if an execution path can
> occur with a lock present, it can also occur when the lock has been
> removed.  That means it may still be possible for the UVC gadget driver
> to try deactivating the UDC after the unbind process has finished or for
> it to try cleaning up a V4L2 node that has been purged.
>
> If either of those really could have happened (as opposed to just
> getting stuck in a deadlock, waiting for a mutex that would never be
> released), then it can still happen with the patch.  Fixing them would
> require changes to the UVC gadget driver.  So the problem may not be
> gone entirely.
>
The current situation can theoretically happen without the deadlock,
yes, but shouldn't happen in practice. UVC's disable/unbind code flow
looks as follows:

1. When disable callback is called, the gadget driver signals the
userspace application to close the V4L2 node.
2. Closing the V4L2 node calls the release callback to clean up
resources. It is this callback that calls into gadget_deactivate and
gets blocked currently (without your patch).
3. Separately, the unbind callback waits on release callback to finish
for 500ms, assuming the userspace application to behave well and close
the node in a reasonable amount of time.
4. If the release callback still hasn't been called, the V4L2 node is
forcefully removed and UVC driver waits for another 1000ms for the
release callback to clean up any pending resources.
5. The unbind process continues regardless of the status of release
callback after waiting at most 1.5s for release.

So the only way to run into the current issue is if the release
callback fails to finish in both step 3 and step 4 (for example, due
to a deadlock) in the span of 1.5s. It is possible, but fairly
unlikely (at least in my limited understanding) for the release
callback to be delayed for quite that long.

Hope that makes some sense!

- Avi.
