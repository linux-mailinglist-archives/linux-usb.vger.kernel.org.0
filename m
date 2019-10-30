Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1F7A9E94F2
	for <lists+linux-usb@lfdr.de>; Wed, 30 Oct 2019 03:11:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726108AbfJ3CLM (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 29 Oct 2019 22:11:12 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:59466 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726025AbfJ3CLL (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 29 Oct 2019 22:11:11 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 47FF060F80; Wed, 30 Oct 2019 02:11:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1572401470;
        bh=1sQn92e5BuJCfchN1s4tutVNRXMPCxV2A2PGeWI82u4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=DKCPw/5bnaL5CCf6L73DJ25qSrEOANY1sP7oOCNAz8P/qrEzG+ec2duCWv/x/t7HU
         U0ma9Ep2AMqCZ++P4lR5a4TeKiiScUiln45cJO1hF0JfGWYj7lq/arazn5fJs8/U9t
         Hsc+pPKdqeTmI0cVYTVAH48JLov49cYYz420YIc0=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from jackp-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher DHE-RSA-AES128-SHA (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jackp@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 0DE1A60F74;
        Wed, 30 Oct 2019 02:11:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1572401467;
        bh=1sQn92e5BuJCfchN1s4tutVNRXMPCxV2A2PGeWI82u4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=QEk4sF4jxGY8QwUHZfN8787qepJzhekMWEtdVEZu3AECxp9MHGK2oTUCAvErMzX4j
         e3oySdOIqR2HSh1d+YjN1/XomdbcBerbKWzPrugrPpuI/y5ioO8DruLt+A+kKGVm4/
         cdYggA/MDvM4G/IN+PXzrIWhM8oQR/jcpN0UXu7k=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 0DE1A60F74
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=jackp@codeaurora.org
Date:   Tue, 29 Oct 2019 19:11:03 -0700
From:   Jack Pham <jackp@codeaurora.org>
To:     Felipe Balbi <balbi@kernel.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH 2/2] usb: gadget: composite: Support more than 500mA
 MaxPower
Message-ID: <20191030021103.GA12661@jackp-linux.qualcomm.com>
References: <20191023065753.32722-1-jackp@codeaurora.org>
 <20191023065753.32722-2-jackp@codeaurora.org>
 <871rv3kijy.fsf@gmail.com>
 <92d4a38890cbac34e6bb52dcf98f394c@codeaurora.org>
 <87wocnhkzk.fsf@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87wocnhkzk.fsf@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Felipe,

On Tue, Oct 29, 2019 at 01:03:27PM +0200, Felipe Balbi wrote:
> 
> Hi,
> 
> jackp@codeaurora.org writes:
> > On 2019-10-23 00:49, Felipe Balbi wrote:
> >> Hi,
> >> 
> >> Jack Pham <jackp@codeaurora.org> writes:
> >>> USB 3.x SuperSpeed peripherals can draw up to 900mA of VBUS power
> >>> when in configured state. However, if a configuration wanting to
> >>> take advantage of this is added with MaxPower greater than 500
> >>> (currently possible if using a ConfigFS gadget) the composite
> >>> driver fails to accommodate this for a couple reasons:
> >>> 
> >>>  - usb_gadget_vbus_draw() when called from set_config() and
> >>>    composite_resume() will be passed the MaxPower value without
> >>>    regard for the current connection speed, resulting in a
> >>>    violation for USB 2.0 since the max is 500mA.
> >>> 
> >>>  - the bMaxPower of the configuration descriptor would be
> >>>    incorrectly encoded, again if the connection speed is only
> >>>    at USB 2.0 or below, likely wrapping around UINT8_MAX since
> >>>    the 2mA multiplier corresponds to a maximum of 610mA.
> >>> 
> >>> Fix these by adding checks against the current gadget->speed
> >>> when the c->MaxPower value is used and appropriately limit
> >>> based on whether it is currently at a low-/full-/high- or super-
> >>> speed connection.
> >>> 
> >>> Incidentally, 900 is not divisble by 8, so even for super-speed
> >>> the bMaxPower neds to be capped at 896mA, otherwise due to the
> >>                 ^^^^
> >>                 needs
> >> 
> >> Why do you need to cap it? DIV_ROUND_UP() should still work.
> >
> > The round up causes 900 on the input side to be greater than 900 when 
> > doing the
> > reverse, i.e. multiplication by 8.
> >
> > Alternatively we could just do a normal integer division here 
> > (effectively
> > round down).
> 
> (...)
> 
> >> DIV_ROUND_UP(896, 8) = 112
> >> DIV_ROUND_UP(900, 8) = 113
> >> 
> >> Why value do you want here?
>    ^^^
>    I mean which, sorry
> 
> > Right, but now on the host it will do the reverse calculation, i.e.
> > 113*8 == 904mA.  For a root port this would be greater than it's
> > maximum power budget of 900mA and would result in not selecting the
> > config.
> 
> That's a very good explanation of the problem, thank you. It seems like
> a round down would be safer here in all cases.

Ok, so do you mean something like:

	if (speed < USB_SPEED_SUPER)
-		return DIV_ROUND_UP(val, 2);
+		return DIV_ROUND_UP(min(val, 500U), 2);
	else
-		return DIV_ROUND_UP(val, 8);
+		/*
+		 * USB 3.x supports up to 900mA, but since 900 isn't
+		 * divisible by 8, we need to round down.
+		 */
+		return min(val, 900U) / 8;

Or by "all cases" did you also mean high/full/low speeds too where the
divisor is 2mA (in the first part of the if/else)? Otherwise it looks a
little inconsistent using two modes of division here. Technically the
calculation would then be changed for any odd values less than 500mA but
we're only talking about a difference of 2mA here...

Jack
-- 
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
