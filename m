Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A1D2630A37C
	for <lists+linux-usb@lfdr.de>; Mon,  1 Feb 2021 09:43:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232007AbhBAIns (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 1 Feb 2021 03:43:48 -0500
Received: from mail.kernel.org ([198.145.29.99]:46678 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230080AbhBAInq (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 1 Feb 2021 03:43:46 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0E5D764E33;
        Mon,  1 Feb 2021 08:43:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612168986;
        bh=4GHVwdKvr7NVXxwSGn+ugqaicjZ0MF+dQLEP9JdKRQc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=WIwBlnFaBosINORHaaUYGoM51p1E9/vW+2lDGeOqImeSjk8/C4RzLCHdddsP4py4O
         Xd3qK0a2TV12TXfxEIFitpiY3zHXD65axhqDOM4c0uog/o3IeQwafujKDTVmne84pr
         Gr1y3PMxTViITh7wifrAA0oT19V8ZUJ5dn1LQ3RJ7R08zXNrNdyXBBjz3Allx2Fflo
         XgMg5qmhlJAYwLLzkIlh5ordc4WFP3K0SD58t5MsBa2Vh2DTGTTM66x1Hf2ngxjIhC
         7ymLg2DHpi2k/+hQxcnOjZzcAi3bFJxchmV0E+KANgL1+TCvxVjT3hzUU3prFj9M8l
         eO3YzV/SB1KFA==
Received: from johan by xi.lan with local (Exim 4.93.0.4)
        (envelope-from <johan@kernel.org>)
        id 1l6Unl-0004Jp-TT; Mon, 01 Feb 2021 09:43:17 +0100
Date:   Mon, 1 Feb 2021 09:43:17 +0100
From:   Johan Hovold <johan@kernel.org>
To:     Joe Abbott <jabbott@rollanet.org>
Cc:     linux-usb@vger.kernel.org
Subject: Re: pl2303.c 110 baud not working
Message-ID: <YBe/Ja7ZFZ5JTbi7@hovoldconsulting.com>
References: <CADuz4ONmN299aw460r4wXCEK5F1v9kt_cewCCrdg2hb5nJV9uQ@mail.gmail.com>
 <X/gwVvn09NFiIOWw@hovoldconsulting.com>
 <CADuz4ONNPq+mADWYPKp8+M2rZtuoMwjO=+HDXfgrO2dQ0S1vQA@mail.gmail.com>
 <X/htEGiNbjGb2dy8@hovoldconsulting.com>
 <CADuz4OPCnq_4Xx-sWc-ZijoQRAZR-4+MRvpOx4np2rXifoCL5A@mail.gmail.com>
 <X/rtPpHMii7AxXPJ@hovoldconsulting.com>
 <CADuz4OPhcFSdRhw9pmjzhEwaLJMih+X-suZg=NRR-QwOq8410A@mail.gmail.com>
 <X/waQXmnsYGX3d1b@hovoldconsulting.com>
 <CADuz4OO9DnauGr5MwMupuZrKOxU7Jrr54-a2_vGGXRQTCxPc1Q@mail.gmail.com>
 <CADuz4OOVmpZtzjYFK7S=s+csAYnegjGpWE9KMh8enzmzEwn6Nw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CADuz4OOVmpZtzjYFK7S=s+csAYnegjGpWE9KMh8enzmzEwn6Nw@mail.gmail.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sat, Jan 30, 2021 at 05:30:15AM -0600, Joe Abbott wrote:
>  Sorry it's been so long.  Busy.

No worries.

>  > So in any case, we'd need to key this off of the device type.
>  >
>  Yes, key off type as I can't find the relationship.  Windows
>  uses a8 a6 01 80 02 07  for any request near 110  and switches
>  to direct encode for anything near 75 or 150.

Ok, thanks for checking.

>  > I noticed that
>  >
>  >         12000000 / 0x1a6a8 ~= 110.9
>  >
>  > Possibly just a coincidence, especially as 0x1aa22 would be closer
>  > match. But perhaps you can try a few more rates not in baud_sup and see
>  > if you can figure it out.
> 
>  Coincidence. 0x01aa22 doesn't work. Not even close.
> 
>  I had to give up.  Too many other things to do and hard coding
>  is working for me.

I fully understand. Let me check with Prolific and see if they are
willing to shed some light on this.

Johan
