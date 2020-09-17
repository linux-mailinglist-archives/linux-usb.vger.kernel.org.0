Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0C69026D84E
	for <lists+linux-usb@lfdr.de>; Thu, 17 Sep 2020 12:03:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726410AbgIQKDq (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 17 Sep 2020 06:03:46 -0400
Received: from mx2.suse.de ([195.135.220.15]:36460 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726285AbgIQKDp (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 17 Sep 2020 06:03:45 -0400
X-Greylist: delayed 801 seconds by postgrey-1.27 at vger.kernel.org; Thu, 17 Sep 2020 06:03:44 EDT
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=cantorsusede;
        t=1600336223;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=7UVYAh3T5Ee62pqNKcLahyPwKyTaGPHzfMgm4zCF5Jc=;
        b=PDUU68T2i2jlTEiUikPKbVWBnaj3xMHOAXRV7wUURC78h+JFMbBJ3kjoxWq/8bRkSY4pGN
        RyaUFD/EUXzltLIY30cjoAvI+MgPi+9DfF0MZDCFqM/i+iGBM7wCK31fcZijw0v9IwsL1x
        n7VuDaLVy4BCy7V1C98N3EhLEz4b3kHNdFZRPSM0QbYXbiFTcQVLaOFyWMO/odbJTxmNHM
        EF+uUlrG1mElR3fW39JB30Mc4t59AG3CbydNo3McM/kw3/RzCXnBTNa5KqI7ZPpE4my6Ud
        YUkb19HMn5AKiG+GpOREDUk51A3lL0aLCUcCM1E/8I6/Qhdc0wkcb1LOULeo7A==
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id DEB5FB20D;
        Thu, 17 Sep 2020 09:50:56 +0000 (UTC)
Message-ID: <1600336214.2424.39.camel@suse.com>
Subject: Re: [RFC 0/5] fix races in CDC-WDM
From:   Oliver Neukum <oneukum@suse.com>
To:     Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Cc:     bjorn@mork.no, linux-usb@vger.kernel.org
Date:   Thu, 17 Sep 2020 11:50:14 +0200
In-Reply-To: <4e724e07-3993-bcaa-79e9-45a2f7e1f759@i-love.sakura.ne.jp>
References: <20200812132034.14363-1-oneukum@suse.com>
         <ee0af733-903f-8e8f-8027-b5490a37032f@i-love.sakura.ne.jp>
         <1599728957.10822.9.camel@suse.com>
         <4f285044-aae9-c3be-23ba-90790cd624f1@i-love.sakura.ne.jp>
         <1600161279.2424.5.camel@suse.com>
         <4b8f6305-52fd-cb72-eb13-9d0a0bf07319@i-love.sakura.ne.jp>
         <1600251486.2424.17.camel@suse.com>
         <4e724e07-3993-bcaa-79e9-45a2f7e1f759@i-love.sakura.ne.jp>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Am Mittwoch, den 16.09.2020, 20:14 +0900 schrieb Tetsuo Handa:
> On 2020/09/16 19:18, Oliver Neukum wrote:
> > Am Dienstag, den 15.09.2020, 19:30 +0900 schrieb Tetsuo Handa:
> > > On 2020/09/15 18:14, Oliver Neukum wrote
> > > > Is there something we can do in flush()?
> > > 
> > > I consider that wdm_flush() is a wrong place to return an error. It is possible that
> > 
> > I am afraid that is a basic problem we need to resolve. As I understand
> >  it, flush() as a method exists precisely to report errors. Otherwise
> > you could implement it in release(). But this is not called for every
> > close().
> 
> I think fsync() or ioctl() is a better method for reporting errors.

Very well, I am implementing fsync(). However, I must say that the very
existance of fsync() tells us that write() is not expected to push
data out to devices and hence report results.

> Whether N'th write() request succeeded remains unknown until (N+1)'th
> write() request or close() request is issued? That sounds a strange design.

Welcome to the world of Unix. This is necessary if you want to block
as rarely as possible.

> If there is nothing more to write(), how userspace process knows whether
> N'th write() request succeeded? Wait for writability using poll() ?

Technically fsync(). poll() will tell you that you can write again.
That is a related but different concept.

> What is the purpose of sending the error to the userspace process via write() or close()?

Yes. However to do so, user space must be running. That the death
of a process interferes with error handling is independent from that.

> And I think that wdm_flush() is a strange interface for reporting the error.

Well, POSIX is what it is.The close() syscall is supposed to return
errors. Hence flush() must report them.

	Regards
		Oliver

