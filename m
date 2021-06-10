Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BCFB93A2F67
	for <lists+linux-usb@lfdr.de>; Thu, 10 Jun 2021 17:34:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231570AbhFJPgI (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 10 Jun 2021 11:36:08 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:17180 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231365AbhFJPgE (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 10 Jun 2021 11:36:04 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1623339247; h=In-Reply-To: Content-Type: MIME-Version:
 References: Message-ID: Subject: Cc: To: From: Date: Sender;
 bh=sF6NMZApoo9aWXMckXro/xfGEShqVev3nfjgAcTi8Yw=; b=B+dv2D5mf3ezsf9d3Op+2g4pNGdGZhnE+kZcL0QfVIMeiFSUj8utJkWKfMnKEKHEdXQXIaC+
 Ip6aV3dWKRyYWQCrbCacUI/XmffVqDh9trZ2sOGRugsSGZtS+R04SAkC6sIJSfhwMAfi+OBK
 Aff68NvZxE5HHaSWtSP/WT2ZE2Q=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyIxZTE2YSIsICJsaW51eC11c2JAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-west-2.postgun.com with SMTP id
 60c230e1ed59bf69cc0b08ef (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 10 Jun 2021 15:33:53
 GMT
Sender: jackp=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 7C552C43460; Thu, 10 Jun 2021 15:33:53 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from jackp-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: jackp)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 05BB5C4338A;
        Thu, 10 Jun 2021 15:33:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 05BB5C4338A
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=jackp@codeaurora.org
Date:   Thu, 10 Jun 2021 08:33:46 -0700
From:   Jack Pham <jackp@codeaurora.org>
To:     Felipe Balbi <balbi@kernel.org>,
        Sandeep Maheswaram <sanm@codeaurora.org>
Cc:     Alexandru Elisei <alexandru.elisei@arm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        p.zabel@pengutronix.de, linux-usb@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        arm-mail-list <linux-arm-kernel@lists.infradead.org>,
        linux-arm-msm@vger.kernel.org
Subject: Re: [BUG] usb: dwc3: Kernel NULL pointer dereference in dwc3_remove()
Message-ID: <20210610153346.GA26872@jackp-linux.qualcomm.com>
References: <c3c75895-313a-5be7-6421-b32bac741a88@arm.com>
 <87r1hjcvf6.fsf@kernel.org>
 <70be179c-d36b-de6f-6efc-2888055b1312@arm.com>
 <YLi/u9J5f+nQO4Cm@kroah.com>
 <8272121c-ac8a-1565-a047-e3a16dcf13b0@arm.com>
 <877djbc8xq.fsf@kernel.org>
 <20210603173632.GA25299@jackp-linux.qualcomm.com>
 <87mts6avnn.fsf@kernel.org>
 <20210607180023.GA23045@jackp-linux.qualcomm.com>
 <87sg1q1129.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87sg1q1129.fsf@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Jun 10, 2021 at 01:11:42PM +0300, Felipe Balbi wrote:
> Jack Pham <jackp@codeaurora.org> writes:
> > On Fri, Jun 04, 2021 at 11:20:12AM +0300, Felipe Balbi wrote:
> >> Jack Pham <jackp@codeaurora.org> writes:
> >> >> >>>> Alexandru Elisei <alexandru.elisei@arm.com> writes:
> >> >> >>>>> I've been able to bisect the panic and the offending commit is 568262bf5492 ("usb:
> >> >> >>>>> dwc3: core: Add shutdown callback for dwc3"). I can provide more diagnostic
> >> >> >>>>> information if needed and I can help test the fix.
> >> >> >>>> if you simply revert that commit in HEAD, does the problem really go
> >> >> >>>> away?
> >> >> >>> Kernel built from commit 324c92e5e0ee, which is the kernel tip today, the panic is
> >> >> >>> there. Reverting the offending commit, 568262bf5492, makes the panic disappear.
> >> >> >> Want to send a revert so I can take it now?
> >> >> >
> >> >> > I can send a revert, but Felipe was asking Sandeep (the commit author) for a fix,
> >> >> > so I'll leave it up to Felipe to decide how to proceed.
> >> >> 
> >> >> I'm okay with a revert. Feel free to add my Acked-by: Felipe Balbi
> >> >> <balbi@kernel.org> or it.
> >> >> 
> >> >> Sandeep, please send a new version that doesn't encounter the same
> >> >> issue. Make sure to test by reloading the driver in a tight loop for
> >> >> several iterations.
> >> >
> >> > This would probably be tricky to test on other "glue" drivers as the
> >> > problem appears to be specific only to dwc3_of_simple.  It looks like
> >> > both dwc3_of_simple and the dwc3 core now (due to 568262bf5492) each
> >> > implement respective .shutdown callbacks. The latter is simply a wrapper
> >> > around dwc3_remove(). And from the panic call stack above we see that
> >> > dwc3_of_simple_shutdown() calls of_platform_depopulate() which will 
> >> > again call dwc3_remove() resulting in the double remove.
> >> >
> >> > So would an alternative approach be to protect against dwc3_remove()
> >> > getting called multiple times? IMO it'd be a bit messy to have to add
> >> 
> >> no, I  don't think so. That sounds like a workaround. We should be able
> >> to guarantee that ->remove() doesn't get called twice using the driver
> >> model properly.
> >
> > Completely fair.  So then having a .shutdown callback that directly calls
> > dwc3_remove() is probably not the right thing to do as it completely
> > bypasses the driver model so if and when the driver core does later
> > release the device from the driver that's how we end up with the double
> > remove.
> 
> yeah, I would agree with that.
> 
> >> > additional checks there to know if it had already been called. So maybe
> >> > avoid it altogether--should dwc3_of_simple_shutdown() just skip calling
> >> > of_platform_depopulate()?
> >> 
> >> I don't know what the idiomatic is nowadays, but at least early on, we
> >> had to call depopulate.
> >
> > So any suggestions on how to fix the original issue Sandeep was trying
> > to fix with 568262bf5492? Maybe implement .shutdown in dwc3_qcom and have
> > it follow what dwc3_of_simple does with of_platform_depopulate()? But
> > then wouldn't other "glues" want/need to follow suit?
> 
> I think we can implement shutdown in core, but we need to careful with
> it. Instead of just blindly calling remove, let's extract the common
> parts to another internal function that both remove and shutdown
> call. debugfs removal should not be part of that generic method :-)

Hi Sandeep,

Upon re-reading your description in 568262bf5492 it sounds like the
original intention of your patch is basically to quiesce the HW so that
it doesn't continue to run after SMMU/IOMMU is disabled right?

If that is the case, couldn't we simply call only dwc3_core_exit_mode()
assuming there is no other requirement to do any other cleanup/teardown
(PHYs, clocks, resets, runtime PM, et al)? This function should do the
bare minimum of stopping the controller in whatever mode (host or
peripheral) it is currently operating in.

> Anything in that generic method should, probably, be idempotent.

Yes we'll need to ensure that dwc3_core_exit_mode() can be called
multiple times without additional side effects. At first glance this
probably means setting dwc->xhci and dwc->gadget to NULL from
dwc3_host_exit() and dwc3_gadget_exit(), respectively.

Thanks,
Jack
-- 
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
