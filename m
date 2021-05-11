Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 029B337A281
	for <lists+linux-usb@lfdr.de>; Tue, 11 May 2021 10:50:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230480AbhEKIv0 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 11 May 2021 04:51:26 -0400
Received: from mail.kernel.org ([198.145.29.99]:51052 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230386AbhEKIvZ (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 11 May 2021 04:51:25 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 514ED61923;
        Tue, 11 May 2021 08:50:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1620723019;
        bh=Tes3pWYRTBf5SovW/6NduF1lAhKGSzutMyIVKDi4Xw0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=v6px2BzHJ5Pw0q3BtJh56btXjSJIzqP5ePB9uWDw2GgU9Xz4IAvMp8mxEqackOOcA
         WqFOlIF/t40/xsjxBKWwwgTJq60QYJDKwaywinR1OSfVsc8/+py5OrIwMDFbTlAiMh
         5+GEmDVFCABofJ4mtTVwBsQLPS+zqPwPbp1uhyeU=
Date:   Tue, 11 May 2021 10:50:16 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Oliver Neukum <oneukum@suse.com>
Cc:     Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
        qiang.zhang@windriver.com, lee.jones@linaro.org,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH] USB: cdc-wdm: Fix ODEBUG bug in wdm_disconnect
Message-ID: <YJpFSG8Djf9HSQuU@kroah.com>
References: <20210511033140.29658-1-qiang.zhang@windriver.com>
 <0e4131c7-0372-53cb-74a3-13d3a58ba25c@i-love.sakura.ne.jp>
 <795e587aa6f956f92064e57445d3d527ad87460b.camel@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <795e587aa6f956f92064e57445d3d527ad87460b.camel@suse.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, May 11, 2021 at 10:11:41AM +0200, Oliver Neukum wrote:
> Am Dienstag, den 11.05.2021, 14:48 +0900 schrieb Tetsuo Handa:
> > On 2021/05/11 12:31, qiang.zhang@windriver.com wrote:
> > > This warning is generated because when kfree wdm_device,
> > > it is found that there is still an active work in workqueue,
> > > This phenomenon may be due to the following reasons.
> > > when the devices disconnect, although the work was cancelled,
> > > but the schedule_work still may be called, therefore, before
> > > scheduling work, we need to detect the status of the device.
> > > 
> > > Reported-by: syzbot <
> > > syzbot+7da71853830ac3289474@syzkaller.appspotmail.com>
> > > Signed-off-by: Zqiang <qiang.zhang@windriver.com>
> > > ---
> > >  drivers/usb/class/cdc-wdm.c | 13 ++++++++-----
> > >  1 file changed, 8 insertions(+), 5 deletions(-)
> > > 
> > 
> > Oliver Neukum is aware of this problem, and is considering poisoning
> > approach than
> > checking WDM_SUSPENDING/WDM_RESETTING/WDM_DISCONNECTING approach. I
> > guess we could
> > replace three test_bit() tests into OR'ed-bits test (something like
> > test_bits()) ?
> > 
> >   
> > https://lkml.kernel.org/r/2db36d52015b644cc1891fcffc87ef09c2b728b7.camel@suse.com
> > 
> > Oliver, how do we want to fix this problem?
> 
> Hi,
> 
> I was under the assumption that Greg had already merged the fix
> 18abf874367456540846319574864e6ff32752e2
> Am I wrong?

That is in my usb-linus branch and is not in Linus's tree yet.  Give it
a week or so to get there...

thanks,

greg k-h
