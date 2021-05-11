Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BCB5B37A16A
	for <lists+linux-usb@lfdr.de>; Tue, 11 May 2021 10:11:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230070AbhEKIMu (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 11 May 2021 04:12:50 -0400
Received: from mx2.suse.de ([195.135.220.15]:59790 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229935AbhEKIMt (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 11 May 2021 04:12:49 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
        t=1620720703; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=TWVXvnrJGKcCzxRqtOT1Qny8f0lpOip9d8xcmIIBgT4=;
        b=O1ndLASEpv7+JfgleJE6evX03cdjzjgRGWYcFD4mJUMMIymTXc7ckOE1wDE5pmyfMLHr6S
        WvCeeDiSd1pQz5Kzrl/Dx12NWFghL6l1gGfcQ7uHCvkZokaJZKCyUjbgTv5gk4cPg5f/O9
        gveSWuqqcPFdzoQkTwsr0YrL8oy1gDI=
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 06E74ABF6;
        Tue, 11 May 2021 08:11:43 +0000 (UTC)
Message-ID: <795e587aa6f956f92064e57445d3d527ad87460b.camel@suse.com>
Subject: Re: [PATCH] USB: cdc-wdm: Fix ODEBUG bug in wdm_disconnect
From:   Oliver Neukum <oneukum@suse.com>
To:     Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
        qiang.zhang@windriver.com, gregkh@linuxfoundation.org,
        lee.jones@linaro.org
Cc:     linux-usb@vger.kernel.org
Date:   Tue, 11 May 2021 10:11:41 +0200
In-Reply-To: <0e4131c7-0372-53cb-74a3-13d3a58ba25c@i-love.sakura.ne.jp>
References: <20210511033140.29658-1-qiang.zhang@windriver.com>
         <0e4131c7-0372-53cb-74a3-13d3a58ba25c@i-love.sakura.ne.jp>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.4 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Am Dienstag, den 11.05.2021, 14:48 +0900 schrieb Tetsuo Handa:
> On 2021/05/11 12:31, qiang.zhang@windriver.com wrote:
> > This warning is generated because when kfree wdm_device,
> > it is found that there is still an active work in workqueue,
> > This phenomenon may be due to the following reasons.
> > when the devices disconnect, although the work was cancelled,
> > but the schedule_work still may be called, therefore, before
> > scheduling work, we need to detect the status of the device.
> > 
> > Reported-by: syzbot <
> > syzbot+7da71853830ac3289474@syzkaller.appspotmail.com>
> > Signed-off-by: Zqiang <qiang.zhang@windriver.com>
> > ---
> >  drivers/usb/class/cdc-wdm.c | 13 ++++++++-----
> >  1 file changed, 8 insertions(+), 5 deletions(-)
> > 
> 
> Oliver Neukum is aware of this problem, and is considering poisoning
> approach than
> checking WDM_SUSPENDING/WDM_RESETTING/WDM_DISCONNECTING approach. I
> guess we could
> replace three test_bit() tests into OR'ed-bits test (something like
> test_bits()) ?
> 
>   
> https://lkml.kernel.org/r/2db36d52015b644cc1891fcffc87ef09c2b728b7.camel@suse.com
> 
> Oliver, how do we want to fix this problem?

Hi,

I was under the assumption that Greg had already merged the fix
18abf874367456540846319574864e6ff32752e2
Am I wrong?

	Regards
		Oliver


