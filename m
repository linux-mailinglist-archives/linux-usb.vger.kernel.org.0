Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4973336F630
	for <lists+linux-usb@lfdr.de>; Fri, 30 Apr 2021 09:11:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229813AbhD3HMi (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 30 Apr 2021 03:12:38 -0400
Received: from mail.kernel.org ([198.145.29.99]:42002 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229590AbhD3HMh (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 30 Apr 2021 03:12:37 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9AF386142A;
        Fri, 30 Apr 2021 07:11:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619766709;
        bh=ABuAQsnLWjX6AbOqAZ4eaagtLZSJKXS74oQLZQ2wh8o=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=qSvTfUJAR13wGEo/gWV1Ztr4hbmrLsKb1lPwHoZZYaAqW7RsXmHeInVELpHSipFRE
         YI2hyFeXVYTJ6YuyOygrS3TGj5knXFhB/Ebed71XaffunDpEk+tG4i3Qy4CNXYlSdt
         lk2KqtxtOD9IMcMYO8u5cXLzNiPBta0bZBNifDXOdVkbEht+Egx0UivUWA1BpC/152
         F1ArKB/xCrVEpWkvZvfaZILNBeuyx65t9jUU2Tutk56vLnAS7WumCu9qr3O2YkTO6E
         C+SIYKdQxqAoW/7ZQy66vhHqJJwYQb/vvwEOcQuJwDXTW02IYJPvpbSlc4Kg+hbyfO
         udckjhSTbmm0Q==
Date:   Fri, 30 Apr 2021 15:11:45 +0800
From:   Peter Chen <peter.chen@kernel.org>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Pawel Laszczak <pawell@cadence.com>, gregkh@linuxfoundation.org,
        linux-usb@vger.kernel.org, kurahul@cadence.com
Subject: Re: [PATCH] usb: cdnsp: Useless condition has been removed
Message-ID: <20210430071145.GA4449@nchen>
References: <20210429084914.12003-1-pawell@gli-login.cadence.com>
 <20210430034349.GB3842@nchen>
 <20210430045248.GG21598@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210430045248.GG21598@kadam>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 21-04-30 07:52:48, Dan Carpenter wrote:
> On Fri, Apr 30, 2021 at 11:43:49AM +0800, Peter Chen wrote:
> > On 21-04-29 10:49:14, Pawel Laszczak wrote:
> > > From: Pawel Laszczak <pawell@cadence.com>
> > > 
> > > Patch removes the warning "variable dereferenced before
> > > check 'pdev->dcbaa'" from cdnsp_mem_cleanup.
> > 
> > You may describe the real problem you fix, but not the warning
> > message from some auto build system.
> > 
> 
> I really feel people have become too lost in the weeds of what matters
> and what does not.  For internships, people want picky feedback in case
> they're forced to deal with the ultra drill sargent maintainers.  But
> really the important thing in a commit message is if you can understand
> the problem and the fix.  In this case everyone who is capable of
> understanding the patch can understand the commit message.
> 
> Also if you're going to criticize someone's commit message then just
> write it the way you want so they can copy and paste.  I had someone
> yesterday say that my commit message where I deleted a NULL check and
> related dead code was not clear enough that the behavior was
> "intentional" and I took that to mean that they wanted me to say that
> deleting the dead code did not change runtime behavior.  I'm still not
> sure that's what they wanted me to add...  The point is no one can read
> your mind, if you want a commit message to say something specific then
> just say it instead of hinting around the bush and we have to send a v2
> and v3 commit message.
> 
> regards,
> dan carpenter

Hi Dan,

Thanks for your comments, it's the good suggestion. But everyone may have
slight different criteria that what's really clear.

For this patch, I don't understand the commits, the pdev->dcbaa is set as
NULL after dma_free_coherent, why it has this warning.

-- 

Thanks,
Peter Chen

