Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E5FB273C0E
	for <lists+linux-usb@lfdr.de>; Tue, 22 Sep 2020 09:33:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729911AbgIVHdV (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 22 Sep 2020 03:33:21 -0400
Received: from mx2.suse.de ([195.135.220.15]:41694 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729634AbgIVHdV (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 22 Sep 2020 03:33:21 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
        t=1600760000;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=T5yYq/97oxzSyUQSLqbRi00/ZzkbRMvj1AoCXux4CHY=;
        b=DdAQS53cBhMq26eK9g1mBracZDCx1wBZeMYk9gcRPrpqhx/RD8sHdzhyhhjAXXb+jwdsP5
        0pvqlus8oAARFk6VjC6tmJVQ0xDM1pYlgVz9VfocACBoY+pH9wQG9fAZJ35QqRu6maFJKJ
        axftGwdVtiSSPmz0GqqWF3bJpSnG+SE=
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 1E20FAFCF;
        Tue, 22 Sep 2020 07:33:57 +0000 (UTC)
Message-ID: <1600759983.6926.9.camel@suse.com>
Subject: Re: [RFC 0/5] fix races in CDC-WDM
From:   Oliver Neukum <oneukum@suse.com>
To:     Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Cc:     bjorn@mork.no, linux-usb@vger.kernel.org
Date:   Tue, 22 Sep 2020 09:33:03 +0200
In-Reply-To: <fab1cbfc-7284-73f4-b633-1e060c38acdb@i-love.sakura.ne.jp>
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
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Am Dienstag, den 22.09.2020, 10:56 +0900 schrieb Tetsuo Handa:
> On 2020/09/21 19:52, Oliver Neukum wrote:

> 
> To understand it, I must understand why it is safe to defer error reporting.

It is not. There is nothing to understand here. If user space needs
a guarantee that data has been pushed out without an error, it will
have to call fsync()

Let me explain.
POSIX, as described in the man page, sets some rules about what
a driver must do and must not do. In other areas it makes
recommendations a good driver should follow. One of them is that
we block as little as possible, at the risk of delaying error
reporting. A good driver will report errors as soon as possible
while being compatible with doing IO asynchronously.

> I'm querying you about characteristics of data passed to wdm_write().
> Without knowing the difference between writing to cdc-wdm driver and normal file on
> some filesystem, I can't judge whether it is acceptable to defer reporting errors.

That is simply not a decision you or I make. The man page clearly
says that it is acceptable. If user space does not like that, it must
call fsync() after write().

> When an error occurred when writing to normal file on some filesystem, the userspace
> would simply treat that file as broken (e.g. delete such file). The userspace of this
> cdc-wdm driver might want that any error is immediately reported, for I'm thinking that
> each data passed to wdm_write() is stateful, for
> 
>   /* CDC-WMC r1.1 requires wMaxCommand to be "at least 256 decimal (0x100)" */
>   #define WDM_DEFAULT_BUFSIZE     256
> 
> and
> 
>         if (count > desc->wMaxCommand)
>                 count = desc->wMaxCommand;
> 
> makes me think that wdm_write() has to be able to handle chunk of data in atomic
> manner.

No. the WDM spec says the clear opposite and the man page of write says
so, too.

> I don't like [RFC 8/8]. Please drop [RFC 8/8] because not only it is unrelated to
> hang up problem syzbot is reporting but also lock dependency is still unclear.

Very well. I will make a patch set that clearly fixes bugs and a
secondary one with optimizations.

	Regards
		Oliver

