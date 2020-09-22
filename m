Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2A964273EC6
	for <lists+linux-usb@lfdr.de>; Tue, 22 Sep 2020 11:45:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726533AbgIVJpv (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 22 Sep 2020 05:45:51 -0400
Received: from mx2.suse.de ([195.135.220.15]:53606 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726470AbgIVJpu (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 22 Sep 2020 05:45:50 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
        t=1600767949;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=rExkCtx23UHvbgYSddRrOZtcNUlUxf+1M2O6bYuU6GY=;
        b=oYvd43rq8lasTnXB6dFqArnoTLjev62oX6jVRexgy0sWdJy/7qiY10d34OzdPzItkq8dTB
        xWAgkPrFq86GfEyW5rt8gnyJ9OU8hN/I2gK3pYcTQ1k6z47Ri5ba6vTLFsRup9UhVwl3qn
        7ohYDbFaDTHQCsgqrCbwHogfmr6z2Ac=
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 78535AD1A;
        Tue, 22 Sep 2020 09:46:26 +0000 (UTC)
Message-ID: <1600767931.6926.13.camel@suse.com>
Subject: Re: [RFC 0/5] fix races in CDC-WDM
From:   Oliver Neukum <oneukum@suse.com>
To:     Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Cc:     bjorn@mork.no, linux-usb@vger.kernel.org
Date:   Tue, 22 Sep 2020 11:45:31 +0200
In-Reply-To: <94896ccd-e1b3-11c5-be98-954ee01081ac@i-love.sakura.ne.jp>
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
         <1600685578.2424.72.camel@suse.com>
         <fab1cbfc-7284-73f4-b633-1e060c38acdb@i-love.sakura.ne.jp>
         <1600759983.6926.9.camel@suse.com>
         <94896ccd-e1b3-11c5-be98-954ee01081ac@i-love.sakura.ne.jp>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Am Dienstag, den 22.09.2020, 17:34 +0900 schrieb Tetsuo Handa:
> On 2020/09/22 16:33, Oliver Neukum wrote:
> > Am Dienstag, den 22.09.2020, 10:56 +0900 schrieb Tetsuo Handa:
> > > On 2020/09/21 19:52, Oliver Neukum wrote:
> > > To understand it, I must understand why it is safe to defer error reporting.
> > 
> > It is not. There is nothing to understand here. If user space needs
> > a guarantee that data has been pushed out without an error, it will
> > have to call fsync()
> > > I'm querying you about characteristics of data passed to wdm_write().
> > > Without knowing the difference between writing to cdc-wdm driver and normal file on
> > > some filesystem, I can't judge whether it is acceptable to defer reporting errors.
> > 
> > That is simply not a decision you or I make. The man page clearly
> > says that it is acceptable. If user space does not like that, it must
> > call fsync() after write().
> 
> Then, cdc-wdm driver did not implement fsync() was a big problem. Userspace
> needs to be careful not to give up upon -EINVAL when running on older kernels
> which did not implement wdm_fsync().

Very well. So I'll call the lack of fsync() a bug, which should be
fixed in stable.

> The remaining concern would be how to handle unresponding hardware, for blocking
> wdm_write()/wdm_read() and wdm_fsync() are using wait_event_interruptible(). If
> the caller do not have a mean to send a signal, the caller might hung up forever
> when the hardware stopped responding. Please add a comment that userspace needs to
> be careful when calling these functions.

wdm_flush() has such a comment. Yet no driver can make a guarantee that
a device will make progress in IO. The driver must, however, provide
a means of dealing with such cases. Usually that means handling
signals. That is the normal semantics of a write() syscall.

I believe we are covered on that.

	Regards
		Oliver

