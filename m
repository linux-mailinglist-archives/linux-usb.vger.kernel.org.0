Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 26D82E9AED
	for <lists+linux-usb@lfdr.de>; Wed, 30 Oct 2019 12:39:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726198AbfJ3LjZ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 30 Oct 2019 07:39:25 -0400
Received: from mga05.intel.com ([192.55.52.43]:23379 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726065AbfJ3LjZ (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 30 Oct 2019 07:39:25 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 30 Oct 2019 04:39:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,247,1569308400"; 
   d="scan'208";a="193940510"
Received: from pipin.fi.intel.com (HELO pipin) ([10.237.72.175])
  by orsmga008.jf.intel.com with ESMTP; 30 Oct 2019 04:39:22 -0700
From:   Felipe Balbi <balbi@kernel.org>
To:     Jack Pham <jackp@codeaurora.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH 2/2] usb: gadget: composite: Support more than 500mA MaxPower
In-Reply-To: <20191030021103.GA12661@jackp-linux.qualcomm.com>
References: <20191023065753.32722-1-jackp@codeaurora.org> <20191023065753.32722-2-jackp@codeaurora.org> <871rv3kijy.fsf@gmail.com> <92d4a38890cbac34e6bb52dcf98f394c@codeaurora.org> <87wocnhkzk.fsf@gmail.com> <20191030021103.GA12661@jackp-linux.qualcomm.com>
Date:   Wed, 30 Oct 2019 13:39:21 +0200
Message-ID: <875zk6fonq.fsf@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


Hi,

Jack Pham <jackp@codeaurora.org> writes:
>> jackp@codeaurora.org writes:
>> > On 2019-10-23 00:49, Felipe Balbi wrote:
>> >> Hi,
>> >> 
>> >> Jack Pham <jackp@codeaurora.org> writes:
>> >>> USB 3.x SuperSpeed peripherals can draw up to 900mA of VBUS power
>> >>> when in configured state. However, if a configuration wanting to
>> >>> take advantage of this is added with MaxPower greater than 500
>> >>> (currently possible if using a ConfigFS gadget) the composite
>> >>> driver fails to accommodate this for a couple reasons:
>> >>> 
>> >>>  - usb_gadget_vbus_draw() when called from set_config() and
>> >>>    composite_resume() will be passed the MaxPower value without
>> >>>    regard for the current connection speed, resulting in a
>> >>>    violation for USB 2.0 since the max is 500mA.
>> >>> 
>> >>>  - the bMaxPower of the configuration descriptor would be
>> >>>    incorrectly encoded, again if the connection speed is only
>> >>>    at USB 2.0 or below, likely wrapping around UINT8_MAX since
>> >>>    the 2mA multiplier corresponds to a maximum of 610mA.
>> >>> 
>> >>> Fix these by adding checks against the current gadget->speed
>> >>> when the c->MaxPower value is used and appropriately limit
>> >>> based on whether it is currently at a low-/full-/high- or super-
>> >>> speed connection.
>> >>> 
>> >>> Incidentally, 900 is not divisble by 8, so even for super-speed
>> >>> the bMaxPower neds to be capped at 896mA, otherwise due to the
>> >>                 ^^^^
>> >>                 needs
>> >> 
>> >> Why do you need to cap it? DIV_ROUND_UP() should still work.
>> >
>> > The round up causes 900 on the input side to be greater than 900 when 
>> > doing the
>> > reverse, i.e. multiplication by 8.
>> >
>> > Alternatively we could just do a normal integer division here 
>> > (effectively
>> > round down).
>> 
>> (...)
>> 
>> >> DIV_ROUND_UP(896, 8) = 112
>> >> DIV_ROUND_UP(900, 8) = 113
>> >> 
>> >> Why value do you want here?
>>    ^^^
>>    I mean which, sorry
>> 
>> > Right, but now on the host it will do the reverse calculation, i.e.
>> > 113*8 == 904mA.  For a root port this would be greater than it's
>> > maximum power budget of 900mA and would result in not selecting the
>> > config.
>> 
>> That's a very good explanation of the problem, thank you. It seems like
>> a round down would be safer here in all cases.
>
> Ok, so do you mean something like:
>
> 	if (speed < USB_SPEED_SUPER)
> -		return DIV_ROUND_UP(val, 2);
> +		return DIV_ROUND_UP(min(val, 500U), 2);
> 	else
> -		return DIV_ROUND_UP(val, 8);
> +		/*
> +		 * USB 3.x supports up to 900mA, but since 900 isn't
> +		 * divisible by 8, we need to round down.
> +		 */
> +		return min(val, 900U) / 8;
>
> Or by "all cases" did you also mean high/full/low speeds too where the
> divisor is 2mA (in the first part of the if/else)? Otherwise it looks a
> little inconsistent using two modes of division here. Technically the
> calculation would then be changed for any odd values less than 500mA but
> we're only talking about a difference of 2mA here...

yeah, It should be okay to use round down for fs, hs and ls as
well. Thinking about it, this bMaxPower should be treated as a "at most
this much"; but never more than maximum.

-- 
balbi
