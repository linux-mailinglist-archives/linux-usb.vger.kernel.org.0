Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7C91D36DC6A
	for <lists+linux-usb@lfdr.de>; Wed, 28 Apr 2021 17:50:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240839AbhD1PvZ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 28 Apr 2021 11:51:25 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:32986 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S240612AbhD1PvY (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 28 Apr 2021 11:51:24 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1619625039; h=In-Reply-To: Content-Type: MIME-Version:
 References: Message-ID: Subject: Cc: To: From: Date: Sender;
 bh=/n3GSgHvXkd6PDpARz6TsthDOpENmCbO8rb/sEiN/Io=; b=Zr2WJ/5d7OZwTyi9lywqf23sx5QxRlXHUFNlaXabWA4Z8I8oENApdWG5m0yTgHuQxgCUL/RQ
 c57wwP/dwo9fHCV2teaMTgFbf/4BDavVRkBiZNlbgBx+bf23DYakNX64iSWhRuJlCxRHhgBK
 eo9VI7Gjsqxqe+ElGpHSq9cM2t8=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyIxZTE2YSIsICJsaW51eC11c2JAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-west-2.postgun.com with SMTP id
 6089844a2cc44d3aea6c75b4 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 28 Apr 2021 15:50:34
 GMT
Sender: jackp=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 1A972C43460; Wed, 28 Apr 2021 15:50:34 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from jackp-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: jackp)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id B5D86C4338A;
        Wed, 28 Apr 2021 15:50:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org B5D86C4338A
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=jackp@codeaurora.org
Date:   Wed, 28 Apr 2021 08:50:26 -0700
From:   Jack Pham <jackp@codeaurora.org>
To:     Felipe Balbi <balbi@kernel.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        linux-usb@vger.kernel.org, Wesley Cheng <wcheng@codeaurora.org>,
        Baolin Wang <baolin.wang7@gmail.com>
Subject: Re: [PATCH 2/2] usb: dwc3: gadget: Rename EOPF event macros to
 Suspend
Message-ID: <20210428155026.GE20698@jackp-linux.qualcomm.com>
References: <20210428090111.3370-1-jackp@codeaurora.org>
 <20210428090111.3370-2-jackp@codeaurora.org>
 <87eeeuk8jj.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87eeeuk8jj.fsf@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Felipe,

On Wed, Apr 28, 2021 at 01:28:16PM +0300, Felipe Balbi wrote:
> Jack Pham <jackp@codeaurora.org> writes:
> > The device event corresponding to End of Periodic Frame is only
> > found on older IP revisions (2.10a and prior, according to a
> 
> you're reading databook for dwc3.1, right? Remember the original support
> for the driver was on dwc3. This was always called EOPF back then. We
> should maintain the name.

I've looked through several revisions of the databook for both dwc3 and
dwc3.1. From what I can tell EOPF was nixed starting in DWC3 (not 3.1)
revision 2.20a. DWC3 revision 2.30a re-introduced event #6 for USB
suspend. And judging from the IP revision list in core.h, DWC3 is now
up to 3.30a (DWC3_REVISION_330A), so from number alone there are about
as many revisions that have this bit as EOPF as there are that use it
for SUSPEND. This carries over to DWC3.1 as well (not sure about DWC3.2)
so in fact there are probably more revisions of IP that no longer use
EOPF.

Hi Thinh, I'm wondering if you could please help corroborate the history
of this bit, and confirm whether it is also used as Suspend entry in DWC
3.2 IPs?

But I don't want to make it seem that I'm using revision history as a
gauge of how many real devices out there support EOPF vs Suspend. That
figure we'll never truly know.

> > cursory SNPS databook search).  On revisions 2.30a and newer,
> > including DWC3.1, the same event value and corresponding DEVTEN
> > bit were repurposed to indicate that the link has gone into
> > suspend state (U3 or L2/L1).
> >
> > EOPF events had never been enabled before in this driver, and
> > going forward we expect current and future DWC3-based devices
> > won't likely to be using such old DWC3 IP revisions either.
> 
> We still have original omap5 devices, running on revision 1.73a
> around. They'll remain supported for the time being.
> 
> > Hence rather than keeping the deprecated EOPF macro names let's
> > rename them to indicate their usage for suspend events.
> 
> what do we gain from this change? I mean, in practice, what changes?
> nothing realy, so why should we apply this?

I'm saying since this macro has never really been used to enable any
kind of event handling specifically for "End Of Periodic Frame", that
there is not much utility in keeping the name as EOPF. Instead as I
explained in patch 1, the same bit/event is used on newer revisions for
USB Suspend entry so assuming you accept that, then the purpose of this
follow-on patch is simply to make the code more readable by renaming the
macro to fit its usage.

Thanks,
Jack
-- 
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
