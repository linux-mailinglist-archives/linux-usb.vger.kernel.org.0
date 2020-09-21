Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC75727217E
	for <lists+linux-usb@lfdr.de>; Mon, 21 Sep 2020 12:53:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726435AbgIUKxU (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 21 Sep 2020 06:53:20 -0400
Received: from mx2.suse.de ([195.135.220.15]:32812 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726427AbgIUKxR (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 21 Sep 2020 06:53:17 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
        t=1600685593;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=4aqUF8oM5imhn6Pmaxhq0N9L0qqrHu56xK0LvhGbhFE=;
        b=ZRFmN7XrO0tRqXOJ3bo7Sv3Fidgw4WpVNo1GaFUXDCJ/e2GbikHxCz063ItJsGqN2BtmkM
        74zC32ui2f9mIQByJLZhYv8l5TEK4B9L5T4wYGsqLqZrrApTc2fmWS1UT1WkaCQWQQN1WK
        M41co09n2BtBUwTQd6HW+nXyuZX778I=
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id AF3DCB01E;
        Mon, 21 Sep 2020 10:53:49 +0000 (UTC)
Message-ID: <1600685578.2424.72.camel@suse.com>
Subject: Re: [RFC 0/5] fix races in CDC-WDM
From:   Oliver Neukum <oneukum@suse.com>
To:     Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Cc:     bjorn@mork.no, linux-usb@vger.kernel.org
Date:   Mon, 21 Sep 2020 12:52:58 +0200
In-Reply-To: <52714f66-c2ec-7a31-782a-9365ba900111@i-love.sakura.ne.jp>
References: <20200812132034.14363-1-oneukum@suse.com>
         <ee0af733-903f-8e8f-8027-b5490a37032f@i-love.sakura.ne.jp>
         <1599728957.10822.9.camel@suse.com>
         <4f285044-aae9-c3be-23ba-90790cd624f1@i-love.sakura.ne.jp>
         <1600161279.2424.5.camel@suse.com>
         <4b8f6305-52fd-cb72-eb13-9d0a0bf07319@i-love.sakura.ne.jp>
         <1600251486.2424.17.camel@suse.com>
         <4e724e07-3993-bcaa-79e9-45a2f7e1f759@i-love.sakura.ne.jp>
         <1600336214.2424.39.camel@suse.com>
         <0bd0995d-d8a0-321a-0695-f4013bbc88ec@i-love.sakura.ne.jp>
         <1600352222.2424.57.camel@suse.com>
         <52714f66-c2ec-7a31-782a-9365ba900111@i-love.sakura.ne.jp>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Am Freitag, den 18.09.2020, 01:17 +0900 schrieb Tetsuo Handa:
> On 2020/09/17 23:17, Oliver Neukum wrote:
> > The API and its semantics are clear. Write schedules a write:
> > 
> >        A  successful  return  from  write() does not make any guarantee that data has been committed to disk.  On some filesystems, including NFS, it does not even guarantee that space has successfully been reserved for the data.  In this case, some errors might be
> >        delayed until a future write(2), fsync(2), or even close(2).  The only way to be sure is to call fsync(2) after you are done writing all your data.
> 
> But I think that this leaves a room for allowing write() to imply fflush()
> (i.e. write() is allowed to wait for data to be committed to disk).

That would be inferior and very bad for the non-blocking case.

> > If user space does not call fsync(), the error is supposed to be reported
> > by the next write() and if there is no next write(), close() shall report it.
> 
> Where does "the next" (and not "the next after the next") write() come from?

We would indeed by on spec. However, we perform best if we return an
error as soon as possible.

> You are saying that if user space does not call fsync(), the error is allowed to be
> reported by the next after the next (in other words, (N+2)'th) write() ?

Yes. The man page is clear on that.

> > > . At least I think that
> > > 
> > >         spin_lock_irq(&desc->iuspin);
> > >         we = desc->werr;
> > >         desc->werr = 0;
> > >         spin_unlock_irq(&desc->iuspin);
> > >         if (we < 0)
> > >                 return usb_translate_errors(we);
> > > 
> > > in wdm_write() should be moved to after !test_bit(WDM_IN_USE, &desc->flags).
> > 
> > Why?
> 
> Otherwise, we can't make sure (N+1)'th write() will report error from N'th write().

We should move the test for reporting errors later, so that it is sure
to be carried out? I am afraid I cannot follow that logic.

> Since I don't know the characteristics of data passed via wdm_write() (I guess that
> the data is some stateful controlling commands rather than meaningless byte stream),
> I guess that (N+1)'th wdm_write() attempt should be made only after confirming that
> N'th wdm_write() attempt received wdm_callback() response. To preserve state / data
> used by N'th wdm_write() attempt, reporting the error from too late write() attempt
> would be useless.

We cannot make assumptions on how user space uses the driver. Somebody
manually connecting and typing in commands letter by letter must also
work.

We can optimize for the common case, but we must operate according to
the specs.
> 
> 
> 
> > > In addition, is
> > > 
> > >         /* using write lock to protect desc->count */
> > >         mutex_lock(&desc->wlock);
> > > 
> > > required? Isn't wdm_mutex that is actually protecting desc->count from modification?
> > > If it is desc->wlock that is actually protecting desc->count, the !desc->count check
> > > in wdm_release() and the desc->count == 1 check in wdm_open() have to be done with
> > > desc->wlock held.
> > 
> > Correct. So should wdm_mutex be dropped earlier?
> 
> If recover_from_urb_loss() can tolerate stale desc->count value, wdm_mutex already

It cannot.

> protects desc->count. I don't know how this module works. I don't know whether
> wdm_mutex and/or desc->wlock is held when recover_from_urb_loss() is called from
> wdm_resume(). It seems that desc->wlock is held but wdm_mutex is not held when
> recover_from_urb_loss() is called from wdm_post_reset().

Indeed.
> 
> 
> 
> By the way, after the fixes, we could replace
> 
>   spin_lock_irq(&desc->iuspin);
>   rv = desc->werr;
>   desc->werr = 0;
>   spin_unlock_irq(&desc->iuspin);
> 
> with
> 
>   rv = xchg(&desc->werr, 0);
> 
> and avoid spin_lock_irq()/spin_unlock_irq() because there are many
> locations which needs to check and clear the error...

Have you checked whether this has implications on memory ordering?

	Regards
		Oliver

