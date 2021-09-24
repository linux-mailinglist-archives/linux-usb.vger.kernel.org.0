Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB09D417B41
	for <lists+linux-usb@lfdr.de>; Fri, 24 Sep 2021 20:47:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346704AbhIXStb (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 24 Sep 2021 14:49:31 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:31109 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231202AbhIXStb (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 24 Sep 2021 14:49:31 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1632509278; h=In-Reply-To: Content-Type: MIME-Version:
 References: Message-ID: Subject: Cc: To: From: Date: Sender;
 bh=NEhjRmJpXzER6ijpqRIcf63kDEmUSJ689whPJdILO+k=; b=aXia4fUFOMCZhFig6CCuhX4J/me6lLJaNi1iYDVMiLq2X0sENP09HgIWkhiYNo2JwF7mZzga
 OTs4I1/NgnnpnlTwGRWb+9ZdF/X4zRcLR50sPQSD4SdvDgPcezduoiRzT/G7xHFhcCWBoPs2
 l/5K984gGsZJn2tw4022W2vi+8o=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyIxZTE2YSIsICJsaW51eC11c2JAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-east-1.postgun.com with SMTP id
 614e1d2ae0480a7d6f01bc31 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 24 Sep 2021 18:47:06
 GMT
Sender: jackp=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 70381C43619; Fri, 24 Sep 2021 18:47:05 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from jackp-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: jackp)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 2CCDBC4338F;
        Fri, 24 Sep 2021 18:47:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 2CCDBC4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
Date:   Fri, 24 Sep 2021 11:46:59 -0700
From:   Jack Pham <jackp@codeaurora.org>
To:     Pavel Hofman <pavel.hofman@ivitera.com>, Greg KH <greg@kroah.com>
Cc:     linux-usb@vger.kernel.org,
        Ruslan Bilovol <ruslan.bilovol@gmail.com>,
        Felipe Balbi <balbi@kernel.org>,
        Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [PATCH] usb: gadget: f_uac2: fixed EP-IN wMaxPacketSize
Message-ID: <20210924184659.GA13104@jackp-linux.qualcomm.com>
References: <20210924080027.5362-1-pavel.hofman@ivitera.com>
 <YU2KXJ/4Q2tq+ANv@kroah.com>
 <5c99651b-a0a2-cb44-e1ad-a79283449ce5@ivitera.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5c99651b-a0a2-cb44-e1ad-a79283449ce5@ivitera.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Pavel,

Thanks for sending out the patch.

On Fri, Sep 24, 2021 at 10:35:07AM +0200, Pavel Hofman wrote:
> Hi Greg,
> 
> Dne 24. 09. 21 v 10:20 Greg KH napsal(a):
> > On Fri, Sep 24, 2021 at 10:00:27AM +0200, Pavel Hofman wrote:
> > > Async feedback patches broke enumeration on Windows 10 previously fixed
> > > by commit 789ea77310f0 ("usb: gadget: f_uac2: always increase endpoint
> > > max_packet_size by one audio slot").
> > > 
> > > While the existing calculation for EP OUT capture for async mode yields
> > > size+1 frame due to uac2_opts->fb_max > 0, playback side lost the +1
> > > feature.  Therefore the +1 frame addition must be re-introduced for
> > > playback. Win10 enumerates the device only when both EP IN and EP OUT
> > > max packet sizes are (at least) +1 frame.
> > > 
> > > Signed-off-by: Pavel Hofman <pavel.hofman@ivitera.com>
> > > Tested-by: Henrik Enquist <henrik.enquist@gmail.com>
> > > Tested-by: Jack Pham <jackp@codeaurora.org>
> > > ---
> > >   drivers/usb/gadget/function/f_uac2.c | 14 ++++++++++----
> > >   1 file changed, 10 insertions(+), 4 deletions(-)
> > 
> > What commit does this fix?

IMO it Fixes: e89bb4288378 ("usb: gadget: u_audio: add real feedback
implementation").

> > Should it go to stable kernel(s)?

Yes, but probably just to 5.14 since the commit I pointed out with the
Fixes tag was introduced in 5.14-rc1 but don't think it was ever
backported to earlier stable kernels.

> It's the same effort direction as commit https://kernel.googlesource.com/pub/scm/linux/kernel/git/gregkh/usb/+/f5dfd98a80ff8d50cf4ae2820857d7f5a46cbab9
> which you added to your usb-linus branch https://kernel.googlesource.com/pub/scm/linux/kernel/git/gregkh/usb/+log/refs/heads/usb-linus/drivers/usb/gadget/function
> Therefore I would say usb-linus.
> 
> Please what are your rules for usb-linus and usb-next? There are some
> different commits in usb-next and usb-linus changing the same file -
> f_uac2.c . Likely not, but a conflict could potentially occur. I do not know
> what head to rebase my further patches which also make larger changes to
> that file.

Since this is a fix, I'd suggest you base on Greg's usb-linus since
patches queued there will be going out during the current 5.15-rc cycle.

Thanks!
Jack
-- 
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
