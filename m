Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0F78A7A74B
	for <lists+linux-usb@lfdr.de>; Tue, 30 Jul 2019 13:49:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726363AbfG3Lt3 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 30 Jul 2019 07:49:29 -0400
Received: from mx2.suse.de ([195.135.220.15]:42336 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726167AbfG3Lt3 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 30 Jul 2019 07:49:29 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 4F23BAD2A;
        Tue, 30 Jul 2019 11:49:28 +0000 (UTC)
Date:   Tue, 30 Jul 2019 13:49:27 +0200
Message-ID: <s5h8ssfvj20.wl-tiwai@suse.de>
From:   Takashi Iwai <tiwai@suse.de>
To:     Hillf Danton <hdanton@sina.com>
Cc:     "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "syzkaller-bugs@googlegroups.com" <syzkaller-bugs@googlegroups.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Andrey Konovalov <andreyknvl@google.com>,
        syzbot <syzbot+d59c4387bfb6eced94e2@syzkaller.appspotmail.com>
Subject: Re: [alsa-devel] [PATCH] ALSA: usb-audio: Fix gpf in snd_usb_pipe_sanity_check
In-Reply-To: <20190730112856.876-1-hdanton@sina.com>
References: <20190730112856.876-1-hdanton@sina.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) SEMI/1.14.6 (Maruoka)
 FLIM/1.14.9 (=?UTF-8?B?R29qxY0=?=) APEL/10.8 Emacs/25.3
 (x86_64-suse-linux-gnu) MULE/6.0 (HANACHIRUSATO)
MIME-Version: 1.0 (generated by SEMI 1.14.6 - "Maruoka")
Content-Type: text/plain; charset=US-ASCII
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, 30 Jul 2019 13:28:56 +0200,
Hillf Danton wrote:
> 
> 
> On Tue, 30 Jul 2019 18:08:02 +0800 Takashi Iwai wrote:
> >
> > You don't have to copy the whole these texts at all.
> > In general, it'd suffice to point out the dashboard URL, and if the
> > stack trace is mandatory, drop the useless hex numbers and just show
> > the significant part of the stack trace.
> >
> I am used to give readers as much info as appropriate, and learning that
> an URL is enough in cases like this one. I will send you the pruned
> version next time.

That's fine, I already edited the commit message in my side.

> > > It was introduced in commit 801ebf1043ae for checking pipe and endpoint
> > > types. It is fixed by adding a check of the ep pointer in question.
> > >
> > > Reported-by: syzbot <syzbot+d59c4387bfb6eced94e2@syzkaller.appspotmail.com>
> > > Fixes: commit 801ebf1043ae ("ALSA: usb-audio: Sanity checks for each pipe and EP types")
> >
> > Drop "commit" word.
> >
> Yes, Sir.
> 
> > > Cc: Andrey Konovalov <andreyknvl@google.com>
> > > Signed-off-by: Hillf Danton <dhanton@sina.com>
> > > ---
> There is a typo, s/dhanton/hdanton/, as you pointed out in another mail.

Good, also corrected.

> > > This is to make syzbot happy for now and in long run we can make
> > > snd_usb_pipe_sanity_check() available outside sound/usb by making
> > > usb_urb_ep_type_check() a wrapper of the former. We will revisit
> > > sound/usb once when things in the usb/core get in place.
> >
> > Actually I expected to apply the "long-term" fix now.
> 
> There is change in usb/core included in that fix as you see, and
> according to the rule, one fix a patch, it is better and simpler
> IMO to fix the sound part first.

Yeah, that's a right approach, too.

What I expected was a patch series, containing two changes: one to
add/modify the USB core helper and another to apply it for usb-audio.
But it's fine to move that direction after addressing the usb-audio
problem quickly, of course.

> > The same kind
> > of fix was already submitted from me (<s5hlfwn376e.wl-tiwai@suse.de>),
> > but I didn't merge it because working on the usb core helper would be
> > a saner solution.
> >
> Feel free to merge that, Sir.

Heh, you did it right, so let's merge yours now.

Thanks!


Takashi
