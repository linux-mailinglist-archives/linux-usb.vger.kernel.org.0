Return-Path: <linux-usb+bounces-4088-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2371180F917
	for <lists+linux-usb@lfdr.de>; Tue, 12 Dec 2023 22:21:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2FE52282108
	for <lists+linux-usb@lfdr.de>; Tue, 12 Dec 2023 21:21:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A011F5E0C1;
	Tue, 12 Dec 2023 21:21:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="NyA4LCK8"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED97FA7
	for <linux-usb@vger.kernel.org>; Tue, 12 Dec 2023 13:21:16 -0800 (PST)
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-40c39e936b4so38468825e9.1
        for <linux-usb@vger.kernel.org>; Tue, 12 Dec 2023 13:21:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1702416075; x=1703020875; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4CJibAlIwCNktj7k60NYDG4UexEd4yzKxpoTMneg7sE=;
        b=NyA4LCK8S6ti+RLKjjr+oKd6XHXm566oTPiN08yotlXBQZFCHGoydakFC9pnxzFAXA
         3SPQes+gAyeNGRAtr7y+D/0uk/1f2Q8uFPIDLbXSMbfrIrnvq8E/76nIrNT/9Np4nran
         B1k5JsN3tnbMwtpNiR4DTMUWzH4PxZlvH6EdfzbgWxGtD/OIFWDONzynYLKX1bYw4jJP
         ClYFqk6+eX16EUSn/w99rQHo2jadOqDOsLovhc6cXjtHzdKn119bH9XQ+y82Sl6dFsrs
         i/wWZN/5WV7elRFrS+0/Xs1UfdCBLpFFMyK0c727TLHDe7SSYsfG5+oWvArfEacZV5+0
         v9pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702416075; x=1703020875;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4CJibAlIwCNktj7k60NYDG4UexEd4yzKxpoTMneg7sE=;
        b=bDwPsgSne9HYNytJcflxuSAlCnGKeYhePdW3OwYQTtm3H39I0zQjqUREwpk/yxi0Kv
         kro9BVfmFUCXG3jYHB0xcoC9JVtDQNw4IKofGPsyuDtq+Do9dp5dLmR0tjWOCDmTjsAD
         rG+TGXW+JBe0rmqcjHrvWuWyidiq82o9aiymfHD0nESjd2H9f4TpYlnm4YTab3v3HpRa
         0iKDnAfVJUIW5ubelqnfKcIaiXQrOxRWqoR6QhADVdNgeYSLW4WnQiEgtlPvl1s9oCWa
         6V1/mMw3+sPO+mB1tFUfDqT0NejIOyVfhzHYfggARx5TYgh+PO1ZQAW+Sei3nhgJKkbz
         ogmw==
X-Gm-Message-State: AOJu0YzI22kScuIGDqvxMwcZ+jcQgkfVT++liG7+hJZH69YQF1eQtkql
	6dcVeUhgYV/TfEyWwf+gJQi8TQ==
X-Google-Smtp-Source: AGHT+IGgit9hWGB4n6vPlIIWK8CVPTb0S7adZkFU9BXv4DjtIj3+l28/O8bkokJzEVw22qEKzlFKzA==
X-Received: by 2002:a05:600c:331f:b0:40c:2c60:dc3d with SMTP id q31-20020a05600c331f00b0040c2c60dc3dmr1700026wmp.308.1702416075403;
        Tue, 12 Dec 2023 13:21:15 -0800 (PST)
Received: from ?IPV6:2001:a61:13af:fb01:86:2ba4:6c05:7fe8? ([2001:a61:13af:fb01:86:2ba4:6c05:7fe8])
        by smtp.gmail.com with ESMTPSA id he43-20020a1709073dab00b00a1e21893a26sm6747750ejc.222.2023.12.12.13.21.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Dec 2023 13:21:15 -0800 (PST)
Message-ID: <ccb72864-6623-4652-8ccf-700c2c68916e@suse.com>
Date: Tue, 12 Dec 2023 22:21:13 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Question regarding CDC NCM and VNC performance issue
To: Hiago De Franco <hiagofranco@gmail.com>,
 =?UTF-8?Q?Maciej_=C5=BBenczykowski?= <maze@google.com>,
 Oliver Neukum <oneukum@suse.com>
Cc: Francesco Dolcini <francesco@dolcini.it>, davem@davemloft.net,
 edumazet@google.com, hiago.franco@toradex.com, kuba@kernel.org,
 linux-usb@vger.kernel.org, pabeni@redhat.com
References: <20231212203222.lxihy34lh22g6d3w@hdebian>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <20231212203222.lxihy34lh22g6d3w@hdebian>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 12.12.23 21:32, Hiago De Franco wrote:

Hi,

> On Mon, Dec 11, 2023 at 12:44:42PM -0800, Maciej Żenczykowski wrote:
>> On Mon, Dec 11, 2023 at 12:29 PM Hiago De Franco <hiagofranco@gmail.com> wrote:

>> Hiago, could you try lowering CDC_NCM_TIMER_PENDING_CNT, if need be all the way to 1?
>> It is defined in include/linux/usb/cdc_ncm.h as 3 currently
>> This applies to the host side.
> 
> On my side CDC_NCM_TIMER_PENDING_CNT is set to 2 by default, did you
> mean CDC_NCM_RESTART_TIMER_DATAGRAM_CNT?

Yes, I meant that. Sorry.

> Despite of that, I tried to lower both CDC_NCM_TIMER_PENDING_CNT and
> CDC_NCM_RESTART_TIMER_DATAGRAM_CNT all the way down to 1, first the
> CDC_NCM_TIMER_PENDING_CNT, then CDC_NCM_RESTART_TIMER_DATAGRAM_CNT and
> finally both at the same time, but it didn't help.
> 
> I've also put some printks as following:
> 
> 	ctx->tx_curr_frame_num = n;
> 	printk("hfranco: tx_curr_frame_num = %d", n);
> 
> 	if (n == 0) {
> 		printk("hfranco: n == 0");
> 		/* wait for more frames */
> 		/* push variables */
> 		ctx->tx_curr_skb = skb_out;
> 		goto exit_no_skb;
> 
> 	} else if ((n < ctx->tx_max_datagrams) && (ready2send == 0) && (ctx->timer_interval > 0)) {
> 		printk("hfranco: tx_max_datagrams = %d", ctx->tx_max_datagrams);
> 		printk("hfranco: timer_interval = %d", ctx->timer_interval);
> 		printk("hfranco: n inside else if = %d", n);
> 		/* wait for more frames */
> 		/* push variables */
> 		ctx->tx_curr_skb = skb_out;
> 		/* set the pending count */
> 		if (n < CDC_NCM_RESTART_TIMER_DATAGRAM_CNT)
> 			ctx->tx_timer_pending = CDC_NCM_TIMER_PENDING_CNT;
> 		goto exit_no_skb;
> 
> 	} else {
> 		printk("hfranco: n inside else = %d", n);
> 		if (n == ctx->tx_max_datagrams)
> 			ctx->tx_reason_max_datagram++;	/* count reason for transmitting */
> 
> I ran it on my host PC, compiled it as module for my Debian dekstop, and
> this is the dmesg:
> 
> [ 9663.478807] hfranco: tx_curr_frame_num = 1
> [ 9663.478816] hfranco: tx_max_datagrams = 40
> [ 9663.478818] hfranco: timer_interval = 400000
> [ 9663.478820] hfranco: n inside else if = 1
> [ 9663.478822] hfranco: timer started
> [ 9663.479645] hfranco: tx_curr_frame_num = 1
> [ 9663.479652] hfranco: n inside else = 1
> 
> And then it basically repeats. Looks like 'n' never passes the 1 value.
> By tweaking the flags mentioned before, 'n' got a value of 4, but that
> was the maximum value. I was wondering, why do you think this code looks
> suspicious? I basically just inserted some printks on the tx side, I
> will see if I can get something from the rx as well.

If we look at the statistics you initially gathered, we can see that all transmissions
on the host side happen because the timeout elapses. That, however, does
_not_ tell us that the host is to blame. We could look at two possible scenarios

A - the gadget is bundling up the packets with too much delay and the host
just answers to the megatransmissions with one packet and the delay on the host
is inconsequential

B - the timer on the host runs for too long or sometimes not at all. If that were
the case that code I pointed out would be most likely to blame

Could I suggest we try to localize the issue? Can you ping the host from the device?

	Regards
		Oliver

