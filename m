Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9D419E73DF
	for <lists+linux-usb@lfdr.de>; Mon, 28 Oct 2019 15:42:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729608AbfJ1Omr (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 28 Oct 2019 10:42:47 -0400
Received: from mx2.suse.de ([195.135.220.15]:57792 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727982AbfJ1Omr (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 28 Oct 2019 10:42:47 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 4F486B521;
        Mon, 28 Oct 2019 14:42:45 +0000 (UTC)
Date:   Mon, 28 Oct 2019 15:42:44 +0100
Message-ID: <s5hwocp9biz.wl-tiwai@suse.de>
From:   Takashi Iwai <tiwai@suse.de>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     syzbot <syzbot+0620f79a1978b1133fd7@syzkaller.appspotmail.com>,
        alsa-devel@alsa-project.org, andreyknvl@google.com,
        benquike@gmail.com, g@b4.vu, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, perex@perex.cz, rfontana@redhat.com,
        syzkaller-bugs@googlegroups.com, tiwai@suse.com,
        yuehaibing@huawei.com
Subject: Re: KASAN: slab-out-of-bounds Read in build_audio_procunit
In-Reply-To: <20191028143406.GE1922@kadam>
References: <000000000000df5189059580f8e9@google.com>
        <s5hsgnkdbsl.wl-tiwai@suse.de>
        <20191028143406.GE1922@kadam>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) SEMI/1.14.6 (Maruoka)
 FLIM/1.14.9 (=?UTF-8?B?R29qxY0=?=) APEL/10.8 Emacs/25.3
 (x86_64-suse-linux-gnu) MULE/6.0 (HANACHIRUSATO)
MIME-Version: 1.0 (generated by SEMI 1.14.6 - "Maruoka")
Content-Type: text/plain; charset=US-ASCII
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, 28 Oct 2019 15:34:06 +0100,
Dan Carpenter wrote:
> 
> I wish that this could have been detected with static analysis...
> 
> On Tue, Oct 22, 2019 at 05:45:14PM +0200, Takashi Iwai wrote:
> > diff --git a/sound/usb/validate.c b/sound/usb/validate.c
> > index 3c8f73a0eb12..a5e584b60dcd 100644
> > --- a/sound/usb/validate.c
> > +++ b/sound/usb/validate.c
> > @@ -75,7 +75,7 @@ static bool validate_processing_unit(const void *p,
> >  
> >  	if (d->bLength < sizeof(*d))
>             ^^^^^^^^^^^^^^^^^^^^^^^
> So we know that d->bLength is >= 10.
> 
> >  		return false;
> > -	len = d->bLength < sizeof(*d) + d->bNrInPins;
>         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> Len is 1 or 0.
> 
> > +	len = sizeof(*d) + d->bNrInPins;
> >  	if (d->bLength < len)
>             ^^^^^^^^^^^^^^^^
> 
> So this condition can't be false.
> 
> >  		return false;
> 
> But it just makes this return into dead code and we have a lot of dead
> code paths in the kernel so it doesn't make sense to generate a warning.
> ...  I don't know if I have a solution.
> 
> Maybe some day we will have a vim pluggin which will highlight all the
> dead paths and someone would notice that it that way.

That'd be awesome :)  Of even a simple checker code that can run in
the git commit hook should suffice for careless maintainers like me.


thanks,

Takashi
