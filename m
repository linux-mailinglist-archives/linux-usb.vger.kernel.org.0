Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6018F4AF0AD
	for <lists+linux-usb@lfdr.de>; Wed,  9 Feb 2022 13:05:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231661AbiBIMD0 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 9 Feb 2022 07:03:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231680AbiBIMDG (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 9 Feb 2022 07:03:06 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E01EDC0223F2
        for <linux-usb@vger.kernel.org>; Wed,  9 Feb 2022 03:33:55 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 96D16B81FDC
        for <linux-usb@vger.kernel.org>; Wed,  9 Feb 2022 11:33:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75B2DC340E7;
        Wed,  9 Feb 2022 11:33:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1644406433;
        bh=fNL6+rioppf+zbi33fk7F0tJHtg5P1Od15ji9bxmFYs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=vdd417IQkowLR8CPhNGHuLxQ+TUlnP8Hik0esCNc6SfUxdtMf1dm38iiE/nK52Si6
         Cs7GvRQAit1LYHJ/9uD0rJO6XBWpmNE9sjdnXyDqux/dpVsjyA36DvyiVSR1CGulcN
         vUu28FA3jJUVxnH0Q0X6mICFjQwgObUdhe4tpM3g=
Date:   Wed, 9 Feb 2022 12:33:50 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Sergey Shtylyov <s.shtylyov@omp.ru>
Cc:     Peter Chen <peter.chen@kernel.org>, linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: common: usb-otg-fsm: drop unreachable code in
 otg_statemachine()
Message-ID: <YgOmnsR2YJiyctGg@kroah.com>
References: <5c923258-67c3-bae1-80d1-87a187202a4c@omp.ru>
 <YgNSkY/Hd811Vhu1@kroah.com>
 <aa29a5b5-f45a-c08c-a955-4f48bd9e4920@omp.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aa29a5b5-f45a-c08c-a955-4f48bd9e4920@omp.ru>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Feb 09, 2022 at 01:33:53PM +0300, Sergey Shtylyov wrote:
> On 2/9/22 8:35 AM, Greg Kroah-Hartman wrote:
> 
> >> The *switch* statement in otg_statemachine() does handle all possible OTG
> >> states explicitly, so the *default* label is unreachable.
> >>
> >> Found by Linux Verification Center (linuxtesting.org) with the SVACE static
> >> analysis tool.
> >>
> >> Signed-off-by: Sergey Shtylyov <s.shtylyov@omp.ru>
> >>
> >> ---
> >> This patch is against the 'usb-next' branch of Greg KH's 'usb.git' repo.
> >> Peter Chen's 'usb.git' repo seems outdated, so I chose to ignore it...
> >>
> >>  drivers/usb/common/usb-otg-fsm.c |    2 --
> >>  1 file changed, 2 deletions(-)
> >>
> >> Index: usb/drivers/usb/common/usb-otg-fsm.c
> >> ===================================================================
> >> --- usb.orig/drivers/usb/common/usb-otg-fsm.c
> >> +++ usb/drivers/usb/common/usb-otg-fsm.c
> >> @@ -440,8 +440,6 @@ int otg_statemachine(struct otg_fsm *fsm
> >>  		if (fsm->id || fsm->a_bus_drop || fsm->a_clr_err)
> >>  			otg_set_state(fsm, OTG_STATE_A_WAIT_VFALL);
> >>  		break;
> >> -	default:
> >> -		break;
> >>  	}
> >>  	mutex_unlock(&fsm->lock);
> >>  
> > 
> > There is nothing wrong with leaving lines like this in the code to
> > handle any potential bugs.
> > Why do you think it needs to be removed?  What benefit does this patch
> > have?
> 
>    These lines as they are bring no value at all.
>    Note that (as I said)  all the values of 'enum usb_otg_state' are
> already handled with explicit *case* label...

And so now you will trigger the checkers that ask "you do not have a
default: line for your case statement!"

This is safer as is, please do not "clean up" things that are not
actually a problem.

thanks,

greg k-h
