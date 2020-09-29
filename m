Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9F80B27BFE4
	for <lists+linux-usb@lfdr.de>; Tue, 29 Sep 2020 10:46:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727863AbgI2IqP (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 29 Sep 2020 04:46:15 -0400
Received: from mx2.suse.de ([195.135.220.15]:54320 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727827AbgI2IqN (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 29 Sep 2020 04:46:13 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
        t=1601369172;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=7DJt6CswZsR0WXH5f0kiK6dei1IKdjZHbxPkg8hINEs=;
        b=C7y5DKyHIvJozBTLCRTi2xu2cpKBU+Wiyn6l60/vl4nhPFEJBySzrV6fd+QPGGOOCrKuqR
        4jUuk8Tw0/CtdQQQQHkWTa6I17PK399dZ6IwoU1Wss1W4f5pQVnBWzYd4hZ+DiAAXHbHYN
        ChuEBLWcEjdXfdxoulCldhXJVnL+CVY=
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 0C5DEACA3;
        Tue, 29 Sep 2020 08:46:12 +0000 (UTC)
Message-ID: <18932c4871b63a5a1f86cf9b820b3d5401464281.camel@suse.com>
Subject: Re: [RFC] fixes for hangs and error reporting in CDC_WDM
From:   Oliver Neukum <oneukum@suse.com>
To:     Greg KH <greg@kroah.com>,
        Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Cc:     bjorn@mork.no, linux-usb@vger.kernel.org
Date:   Tue, 29 Sep 2020 10:46:09 +0200
In-Reply-To: <20200926054032.GB631346@kroah.com>
References: <20200922112126.16919-1-oneukum@suse.com>
         <20200925151103.GB3173449@kroah.com>
         <22e1b8f3-947a-6f15-a788-d639cbabde5c@i-love.sakura.ne.jp>
         <20200925152832.GA3191454@kroah.com>
         <c82c8fda-e9a1-ec70-21b1-761f75be5a43@i-love.sakura.ne.jp>
         <20200926054032.GB631346@kroah.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.4 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Am Samstag, den 26.09.2020, 07:40 +0200 schrieb Greg KH:
> On Sat, Sep 26, 2020 at 12:34:24AM +0900, Tetsuo Handa wrote:
> > On 2020/09/26 0:28, Greg KH wrote:
> > > > Do you want this fix as a series of patches (the former link)?
> > > > Since I think that the changeset should be atomically applied, I posted the latter link.
> > > 
> > > A single patch would be good to send to me again, burried at the end of
> > > a long thread is hard to dig out.
> > > 
> > > Also with proper authorship is needed, did Oliver write this, or did
> > > you?
> > 
> > Oliver wrote the majority part. I just squashed the series and updated comments
> > and deduplicated the code. Thus, I think main authorship should be given to Oliver.
> > 
> > > There is the co-developed-by: tag, which looks like it might be relevant
> > > here, can you do that?
> > 
> > If you prefer the co-developed-by: tag, you can add:
> > 
> > Co-developed-by: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
> 
> That seems reasonable, then put Oliver's address on the first line with
> a "From:" line to make this all work correctly when I apply it.

Hi,

I did sent out the series with a PATCH label last week.
Should I resend?

	Regards
		Oliver


