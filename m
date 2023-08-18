Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DAB07780DBC
	for <lists+linux-usb@lfdr.de>; Fri, 18 Aug 2023 16:13:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377663AbjHRONE (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 18 Aug 2023 10:13:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1377656AbjHROMn (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 18 Aug 2023 10:12:43 -0400
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7098A170E
        for <linux-usb@vger.kernel.org>; Fri, 18 Aug 2023 07:12:41 -0700 (PDT)
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id DD84F3F545
        for <linux-usb@vger.kernel.org>; Fri, 18 Aug 2023 14:12:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1692367959;
        bh=s0q3HaxL/YFdL22o+r4tOlZiSRwNRkwNXgdQ3e/hBrs=;
        h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
         To:Cc:Content-Type;
        b=JT11UgNhKLE5uz+Jut+R6U/bHa7H4Gu5aqVbeYqfKh5XqYnI2JGuQNc4AsAq8jTc5
         oC8NEftwmRUNsTL4WQwJOHvgHL8PbibSCC5qkPYQ9/MxFUXx08+X5WpcKhvoDXQvXU
         6rPP8DnGSyAqD5AQ5AW0MemO7LQ1G8IpPhGEWkbewLcCBGyXWA8VgNyzlALkpm+ulR
         IXdb3HYrE6xNg4rQBhpfKKzwqp30Aody6Y2TgTDPWUTG2GcMe/JbdBP/vj5gPFrGY5
         BEzQnluOQi4D2mhE3L2Zr59rqVZi/4fv7Cs/ARRDjmysfxMmo9/yJcwdKUQkBP5/1M
         SrwXQR8Vu9u/g==
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-2680f0cc480so1149800a91.0
        for <linux-usb@vger.kernel.org>; Fri, 18 Aug 2023 07:12:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692367958; x=1692972758;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s0q3HaxL/YFdL22o+r4tOlZiSRwNRkwNXgdQ3e/hBrs=;
        b=RBALfETSLeRt3KDVz3GB/cR9XRwvwbZPJNaABiChjNMYKVQO/l4wej2A8B2yGwmLzf
         JIpnNxdT3KrEfNwL4+NhLa3xtKld1/O5TwZkvTzeyo4gQeNjd4B/+QrHrHpObhTtIvSU
         rpAKrWs7XfOgGSuYruv7cckvhCpw21auUIBzTF4LWPd1/UcnvjCRAwARKXXHlaoAGQRb
         8qOS8OhZy+jdsbOC/J7OqJct0NVxtxFyYBga+d+gmZVaGrs3ZM1Yo1N7VvTaiFDYLHPp
         NK1uriQCWRqzQWHzYFhM/9enH+VudpQn5XQNrAIboag/+ZQn96VCn/hapYnrC1iOXeKW
         dXhA==
X-Gm-Message-State: AOJu0YzrizybBDaXJWjrL/7KhXfZn8JZTxWN7GED25gdo35N6UBr+9wB
        b2qW64QzmFBL+cunfKUIaICmw5X5qGupnZUlnfQappNp7HyfjZAr5B3q9iveNB54/MiWAHbH4dG
        IARnvEm5Dliqs1urku0MSjPfowPGvFba5PKtWq8WE6XvhqISM7lljVQ==
X-Received: by 2002:a17:90a:c287:b0:26b:2e08:a5b3 with SMTP id f7-20020a17090ac28700b0026b2e08a5b3mr2519373pjt.34.1692367958387;
        Fri, 18 Aug 2023 07:12:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFXhkm9RtOaa/xkyFHsIiSyqcHHZM1TvdVeesK8hEIt3vspHa/4YdzWGXHqKj/HIPC4Y5Cdevbys1wn9TNk92o=
X-Received: by 2002:a17:90a:c287:b0:26b:2e08:a5b3 with SMTP id
 f7-20020a17090ac28700b0026b2e08a5b3mr2519335pjt.34.1692367957744; Fri, 18 Aug
 2023 07:12:37 -0700 (PDT)
MIME-Version: 1.0
References: <20230817093305.212821-1-kai.heng.feng@canonical.com>
 <cab8a29b-816c-41c7-8d2a-418f787e406e@rowland.harvard.edu>
 <59898e32-f2ea-4df7-947b-3d74835ff9b7@rowland.harvard.edu>
 <CAAd53p5pxGfS0y260NsMF+m_Ota+d1ZKbtdq4dfM5s+T1z14bw@mail.gmail.com> <b08553d7-017e-477c-b18e-8564fe88646b@rowland.harvard.edu>
In-Reply-To: <b08553d7-017e-477c-b18e-8564fe88646b@rowland.harvard.edu>
From:   Kai-Heng Feng <kai.heng.feng@canonical.com>
Date:   Fri, 18 Aug 2023 22:12:25 +0800
Message-ID: <CAAd53p5EJG=gUOt48mk=o2QdMjoR-FgQqkt80BQX8f8uph4MVg@mail.gmail.com>
Subject: Re: [PATCH] xhci: Disable connect, disconnect and over-current wakeup
 on system suspend
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     mathias.nyman@intel.com,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Aug 18, 2023 at 11:08=E2=80=AFAM Alan Stern <stern@rowland.harvard.=
edu> wrote:
>
> On Fri, Aug 18, 2023 at 08:01:54AM +0800, Kai-Heng Feng wrote:
> > On Thu, Aug 17, 2023 at 10:22=E2=80=AFPM Alan Stern <stern@rowland.harv=
ard.edu> wrote:
> > >
> > > On Thu, Aug 17, 2023 at 10:07:37AM -0400, Alan Stern wrote:
> > > > On Thu, Aug 17, 2023 at 05:33:05PM +0800, Kai-Heng Feng wrote:
> > > > > HP ProOne 440 G10 AIO sometimes cannot suspend as xHCI wakes up t=
he
> > > > > system:
> > > > > [  445.814574] hub 2-0:1.0: hub_suspend
> > > > > [  445.814652] usb usb2: bus suspend, wakeup 0
> > > > > [  445.824629] xhci_hcd 0000:00:14.0: Port change event, 1-11, id=
 11, portsc: 0x202a0
> > > >
> > > > What is the meaning of the 0x202a0 bits?  What caused this wakeup?
> > >
> > > And more to the point, given that the previous line says "wakeup 0", =
why
> > > should any port change event cause a wakeup?
> >
> > I think the controller and roothub have to deal with the interrupt
> > about disconnecting regardless of the remote wakeup setting.
>
> This seems to contradict what you wrote in an earlier email:

Nothing is contradicting, what I mentioned is the wakeup of USB
touchpanel, not the controller or root hub.

>
> > > If remote wakeup isn't enabled then the do_wakeup variable will be 0,
> > > so your patch wouldn't make any difference.  The question is what
> > > happens when remote wakeup _is_ enabled.
> >
> > Nothing happens either per my testing.
> >
> > For USB keyboard, the remote wakeup is enabled, unplugging it when
> > suspend is suspended doesn't wake the system up, despite of PORT_WKDISC=
_E being set.
> > Plugging it back doesn't wake the system up either, despite of PORT_WKC=
ONN_E.
>
> You appear to be saying that when wakeup is disabled, unplugging a
> device will wake up the system -- but when wakeup is enabled, unplugging
> a device will not wake up the system!

No, what I was saying is that when PORT_WKCONN_E and PORT_WKDISC_E are
set, plugging/unplugging USB doesn't wake up the system from suspended
state.
What it really does for this case is to hinder the suspending process.

>
> Is that really what you meant?  It doesn't make sense.  Probably means
> there's a bug in the HCD.
>
> The point I'm trying to get at is that if wakeups are disabled for both
> the host controller and the root hub then _nothing_ should generate an
> interrupt or wakeup request.  Not pressing a key, not unplugging a
> device... nothing.  But if wakeup _is_ enabled for both the controller
> and the root hub, then any of those actions should generate an interrupt
> and wake up the system.

Like above, the wakeup I mentioned is on the USB touchpanel itself,
not on the controller and roothub.
There's no IRQ generated when controller's wakeup is disabled.

>
> If wakeup is enabled for the host controller but not for the root hub,
> then unplugging a device from the root hub should not generate a wakeup
> request or an interrupt.  But things like pressing a key on a
> wakeup-enabled keyboard should.  (In other words, the root hub shouldn't
> generate any wakeup requests on its own but it should relay wakeup
> requests that it receives from downstream devices.)  However, it's
> understandable if the system doesn't behave properly in this case since
> it's kind of an odd situation.

Do you mean when the system is suspended, or system is still suspending?
The issue only happens when the system is suspending.

Kai-Heng

>
> Alan Stern
