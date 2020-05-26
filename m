Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 852B51A0FA1
	for <lists+linux-usb@lfdr.de>; Tue,  7 Apr 2020 16:49:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729335AbgDGOtD (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 7 Apr 2020 10:49:03 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:44156 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729060AbgDGOtD (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 7 Apr 2020 10:49:03 -0400
Received: by mail-pg1-f195.google.com with SMTP id n13so399036pgp.11
        for <linux-usb@vger.kernel.org>; Tue, 07 Apr 2020 07:49:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=u+CLNaPUQYq2OplEHVq5gf8jMgu0kMxas5mZCBzFgZY=;
        b=M9ru2EIsxQ8aueuOKfm8D1/BG9Ethijs5O0Tfb7uLYNUws6PtzED2n44+4mlXvcobz
         hMgNJ5lY9jCjQal1mnzTncH2VofC+rhBul8dWjV8918gSlm4RygOYi7cLbcTcmeryqZn
         1TDJYTSk9q4wSowrYJ4AZ1WLDUPniMIQVrQkFOhXsDPMP6p5/KyCCYhzo4AiOUJOVUd8
         xv2kHKlvdnPlbTbREA/vlJbG968TkA0PIp1R3+ieWEf07suEbjsb4z/y9uESzYPLRvdh
         feOQYNrakJ+C8g3DU0+dO88NaGpzqi06J/N3UhPqFS6EEPX63YzM02K7hQ76Y7i8EFNt
         0vQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=u+CLNaPUQYq2OplEHVq5gf8jMgu0kMxas5mZCBzFgZY=;
        b=rOEj1ktmpYmaDARwwqpcg45eGdVcD+nxKkZ3JAu6efGnppoXRTNb7VLNiz9nqyOYsR
         TwzwNub6Y5zaMw7acQB4mi0xnfieIBq9lJJqNSyG+B20qmQ5evguL1Ei3rim+eCqcEpH
         sm5hajGiA/dFvUCgBbADwZFH3qhtANTVf58YIQtKIXnywQtCovhVvbT82erMcz2Xt+zp
         BVnAxQcRbxb0hf1b/esoaf44jTx+s0JRiX9MWWZtS5BloduJpkF28c3zoEFoK2nMVeK1
         T1FdqaJo8MCzSBmqdcFPAKHSDzWn1iAEM3E9h4/1mBkI4+ViQJ2h7j2uQXDpPFsG2iz7
         Tfdg==
X-Gm-Message-State: AGi0PuaTg0iOBu5atO67/XthVFwSpT4lkzdXbWgCPQmfFU6T6aEMC78Z
        4CtgmVzzkCMuNWBmgNxXMIzTBpin+Y0XK3RWxCAaCqeF
X-Google-Smtp-Source: APiQypL98I+FELC6QKAZBsq0lZb1fje6O55Jn8kAQX9mlDoKr5VlTyuh3jt3ZNEFrxJbdsN4xit107fZIl2NmJ2ZgVY=
X-Received: by 2002:a63:f411:: with SMTP id g17mr2389626pgi.440.1586270941629;
 Tue, 07 Apr 2020 07:49:01 -0700 (PDT)
MIME-Version: 1.0
References: <c4cedb13ee6159857ed7d9884e55718e4b1dede4.1586268809.git.andreyknvl@google.com>
 <20200407142936.GL2066@kadam>
In-Reply-To: <20200407142936.GL2066@kadam>
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Tue, 7 Apr 2020 16:48:49 +0200
Message-ID: <CAAeHK+x1wbSOt=EA-T1C3RjNhjYPa_uB0=vMmMS2-LECQFcj-g@mail.gmail.com>
Subject: Re: [PATCH v2] usb: raw-gadget: fix raw_event_queue_fetch locking
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        USB list <linux-usb@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Felipe Balbi <balbi@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Alan Stern <stern@rowland.harvard.edu>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Apr 7, 2020 at 4:29 PM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> On Tue, Apr 07, 2020 at 04:14:50PM +0200, Andrey Konovalov wrote:
> > @@ -89,11 +90,18 @@ static struct usb_raw_event *raw_event_queue_fetch(
> >        * there's at least one event queued by decrementing the semaphore,
> >        * and then take the lock to protect queue struct fields.
> >        */
> > -     if (down_interruptible(&queue->sema))
> > -             return NULL;
> > +     ret = down_interruptible(&queue->sema);
> > +     if (ret)
> > +             return ERR_PTR(ret);
> >       spin_lock_irqsave(&queue->lock, flags);
> > -     if (WARN_ON(!queue->size))
> > +     /*
> > +      * queue->size must have the same value as queue->sema counter (before
> > +      * the down_interruptible() call above), so this check is a fail-safe.
> > +      */
> > +     if (WARN_ON(!queue->size)) {
> > +             spin_unlock_irqrestore(&queue->lock, flags);
> >               return NULL;
>
> I'm sorry for not noticing this earlier.  When a function returns both
> error pointers and NULL then NULL is supposed to a special case of
> success.  For example:
>
>         my_struct_pointer = get_optional_feature();
>
> If there is a memory allocation failure then my_struct_pointer is
> -ENOMEM and we fail.  But say the optional feature is disabled, then
> we can't return a valid pointer, but it's also working as designed so
> it's not an error.  In that case we return NULL.  The surrounding code
> should be written to allow NULL pointers.
>
> So I don't think returning NULL here is correct.

No problem, sent v3, thanks!
