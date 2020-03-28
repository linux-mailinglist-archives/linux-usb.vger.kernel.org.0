Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 73B49196717
	for <lists+linux-usb@lfdr.de>; Sat, 28 Mar 2020 16:40:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727163AbgC1PkJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 28 Mar 2020 11:40:09 -0400
Received: from mail-lf1-f47.google.com ([209.85.167.47]:39174 "EHLO
        mail-lf1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726482AbgC1PkJ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 28 Mar 2020 11:40:09 -0400
Received: by mail-lf1-f47.google.com with SMTP id h6so4542835lfp.6
        for <linux-usb@vger.kernel.org>; Sat, 28 Mar 2020 08:40:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jZ3WyD6bhPSZNLt/bWleoqzt1UE2igSVRjTq69LMb28=;
        b=DQBberg+wl2RGBxqM34k1Z2AFubFDsMaSL7nTCJOr8GLn+8cdQCF38XoBKocdwkIqQ
         oWgyRi6pDUqA90dTUbBSG6JCuXU8ioXRS4V9tS2Ctb5GqJd+HZHic0+behd4Uflwj5JQ
         5stqB0oxrTMpk1VDSksBJ3pCI3GqoJHHwp43BP4lCvzx4d22ude/BzBaNlUiyXq6oAxW
         zeDJ2cVvNT/FNXS0up6SwdoNuLO0B4sXfNs0+Dr8dayQURfyDzRmmxOsDFhOzBhdA3vo
         xnEgY5j35iR8sQzf95Jj4m2aL28wtAnrtEtXN9RmfcZe6nhs++nsv7lDW/89c+J64l6z
         bl1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jZ3WyD6bhPSZNLt/bWleoqzt1UE2igSVRjTq69LMb28=;
        b=njZcQOJjbwHKSBkob7qAO00g8zBnPENOYN9KYUTOJlnD+Tau1RLfflbROVryvvFXIX
         1QkFnJ+CX7fDokZ/p8X7IndiTRaGcJ/eOnSmdaqizDegIzCAsvYxaVbHIo6qn+fn7aKp
         nYIle9mUt5pX/Qnqol+JJw5WaSrt79IIUVI3Oar03/zN3kIbZUf7aTJhStU7XkYe0219
         IjHl3NTnWhBybhCN2dic4e/qdEJ4atXdN8t+LNJEBHiE0Zlo+t+G0nys5uRuUK/jqX4p
         YLtm8lDeRcyFzAEkUppdBRodcClyAxDQAW+T72iiCt8+GFsKKibsZgjN704DdHRTKQWR
         6gTw==
X-Gm-Message-State: AGi0PuaEMPWAbVGEAHhaEob2XqzbQs9zioyza9gQUfYra31Vt38Cn87E
        PsmdrTmSMrcupJBJMz3itTM8CPWf4d03xV0zGaHZMw==
X-Google-Smtp-Source: APiQypJBo1gy8bZaFOTw68JPYpLCj3admqjUXa7gEPDIP5aWOAjjDZT76uFJmKfFqwt0pw0cShXpViG5dTbzkNXnFHU=
X-Received: by 2002:ac2:51c3:: with SMTP id u3mr2741176lfm.25.1585410006904;
 Sat, 28 Mar 2020 08:40:06 -0700 (PDT)
MIME-Version: 1.0
References: <CAEAjamuCnVEyRKDsTa-MiU_4eTnaD0d38dmSBPbbkmjd+MZxpQ@mail.gmail.com>
 <Pine.LNX.4.44L0.2003281131060.1088-100000@netrider.rowland.org>
In-Reply-To: <Pine.LNX.4.44L0.2003281131060.1088-100000@netrider.rowland.org>
From:   Kyungtae Kim <kt0755@gmail.com>
Date:   Sat, 28 Mar 2020 11:39:55 -0400
Message-ID: <CAEAjamvopuy0=wP_z_bMzoPvcjcMqSOSp0BFOj+Ai2oaOqFYDw@mail.gmail.com>
Subject: Re: Fwd: BUG: KASAN: use-after-free in usb_hcd_unlink_urb+0x5f/0x170 drivers/usb/core/hcd.c
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     USB list <linux-usb@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sat, Mar 28, 2020 at 11:31:32AM -0400, Alan Stern wrote:
> On Sat, 28 Mar 2020, Kyungtae Kim wrote:
>
> > On Thu, Mar 26, 2020 at 10:49:40AM -0400, Alan Stern wrote:
> > > On Tue, 24 Mar 2020, Kyungtae Kim wrote:
> > >
> > > > Thanks for the patch. Unfortunately, we don't have a repro program to
> > > > test right now.
> > >
> > > Okay.  Can you at least try running your tests with the patch installed
> > > to check that the patch doesn't actually break anything?
> > >
> > > Alan Stern
> > >
> >
> > I tested with that patch for more than 24 hours. It worked well
> > without triggering the same bug.
>
> Thanks for testing.  I'll write up the patch and submit it.
>
> Alan Stern
>

Thanks a lot.

Regards,
Kyungtae Kim
