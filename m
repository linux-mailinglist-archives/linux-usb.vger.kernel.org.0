Return-Path: <linux-usb+bounces-4022-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0344380E81B
	for <lists+linux-usb@lfdr.de>; Tue, 12 Dec 2023 10:48:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 30E531C20A75
	for <lists+linux-usb@lfdr.de>; Tue, 12 Dec 2023 09:48:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBDAD58AD5;
	Tue, 12 Dec 2023 09:48:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="e7qpQHDs"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EDE98D2
	for <linux-usb@vger.kernel.org>; Tue, 12 Dec 2023 01:48:03 -0800 (PST)
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-55114c073b8so3014262a12.1
        for <linux-usb@vger.kernel.org>; Tue, 12 Dec 2023 01:48:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1702374482; x=1702979282; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jweqMOc7OFWaw93MNaYDtBcx1S8cPYzucvoOZnJSAPA=;
        b=e7qpQHDshVvL7Dt6LyC6srjh2nkewz3AqDOR6ThYIydQ3T3ibfKdK/YmQ7czasOb2A
         jNJACcs8ZAloWJRSqVQCjkVcfxivfbeTTOn/h1zo6VOFvBZjUzxw7V6KKr6g29Kf3k9L
         L6cc6LSReCMpnQ5RcI4tRTn0Dw4/EkouTNkZ9VswX5ra2mNfIGEZGGOQcULi06SDN0aH
         +K14ZVCcGJ6U3J2dpq5Dj88i+LbWzQglKVCCWKX0QjEhWR7gPTzts45TTrEcl+bfrtfH
         PKI/UcW/u94CH9/Ki8qh5hH7rivC4LFJWgE5XmVeknnjnPpvatdNmL0yIxnOsJaQxYV3
         2Ekg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702374482; x=1702979282;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jweqMOc7OFWaw93MNaYDtBcx1S8cPYzucvoOZnJSAPA=;
        b=UNIasLvecr/ieKnpdGhXU4pC8aJVALvXw1cjsult9hGR5XK6drR/dpqk/RZAbwFtCe
         Tt0NjBayprxUKi6uzVemAPNIpiAiKhZ/CZaUITukNkrsLFL7khfo/f9J+O/h/SJSKcvc
         rNbSHzqmvhQCIUS/st25Ll0MB1dcoMFf6IxDrF0PoNw8AjEU/oF2GlmbJGqfBOOPWG5v
         9ChXuP7EwhhLwLSlWgr5+khGhq+hNudV5MuJZnNRSr/YFiTD7EaCl+rQpWOnTHcJH/vU
         mfDvKRozN3yc7uy1Lc1G5RYkEUsXhqY0jjyCHPtSSlsaxR1sfYzdYIuAVky84PP/y+Pe
         PUug==
X-Gm-Message-State: AOJu0YxvAIX93iS11y96mcd9K9QK7/RZkf2ywx+y22FHqm0DilXK1+gJ
	6VRgInnWdiWw/nD9NmPlnx52OQ==
X-Google-Smtp-Source: AGHT+IFPh+rotPNYvxEv6NTfz6h+/Z9YdU/N4SZU6sG+RmivEuo83hlGruh/HNbdSq1uKR7pKzIe9Q==
X-Received: by 2002:a50:875e:0:b0:54d:a710:64f5 with SMTP id 30-20020a50875e000000b0054da71064f5mr1879164edv.106.1702374482375;
        Tue, 12 Dec 2023 01:48:02 -0800 (PST)
Received: from ?IPV6:2001:a61:13af:fb01:d424:8584:98d8:cd65? ([2001:a61:13af:fb01:d424:8584:98d8:cd65])
        by smtp.gmail.com with ESMTPSA id g6-20020a056402090600b0054c9211021csm4432308edz.69.2023.12.12.01.48.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Dec 2023 01:48:02 -0800 (PST)
Message-ID: <4d046193-afa7-4341-b308-8b475c4e820a@suse.com>
Date: Tue, 12 Dec 2023 10:48:01 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Question regarding CDC NCM and VNC performance issue
To: =?UTF-8?Q?Maciej_=C5=BBenczykowski?= <maze@google.com>,
 Hiago De Franco <hiagofranco@gmail.com>
Cc: Oliver Neukum <oneukum@suse.com>, Francesco Dolcini
 <francesco@dolcini.it>, davem@davemloft.net, edumazet@google.com,
 hiago.franco@toradex.com, kuba@kernel.org, linux-usb@vger.kernel.org,
 pabeni@redhat.com
References: <c2ee0ecf-993e-4736-b005-588fa6ef51a3@suse.com>
 <604fb326-61d5-4d67-b009-649ece32a1e9@suse.com>
 <CANP3RGdr+snVzp2exMEzcd2PPQy8rOEL5PzpfXAEztdpZ8NK0g@mail.gmail.com>
 <20231207185712.p6cablxfdh4znbue@hdebian>
 <CANP3RGevXM03ixg3=c-Bpdbnoz+WTuVtL2KoUzJV-s0MdNk-tw@mail.gmail.com>
 <20231211202847.5egx3vihuaf63s67@hdebian>
 <CANP3RGd-uMNYPNP2FYxPNL3x3RewNVR3VxZhwaii5mhQcQ7wXg@mail.gmail.com>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <CANP3RGd-uMNYPNP2FYxPNL3x3RewNVR3VxZhwaii5mhQcQ7wXg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11.12.23 21:44, Maciej Żenczykowski wrote:
> On Mon, Dec 11, 2023 at 12:29 PM Hiago De Franco <hiagofranco@gmail.com> wrote:
>>
>> On Thu, Dec 07, 2023 at 08:37:09PM +0100, Maciej Żenczykowski wrote:
>>> On Thu, Dec 7, 2023 at 7:57 PM Hiago De Franco <hiagofranco@gmail.com> wrote:

Hi,

>>>> On Thu, Dec 07, 2023 at 12:07:25PM +0100, Oliver Neukum wrote:
>>>>> That suggests, but does not prove that the issue is on the host side.
>>>>> Could you post the result of "ethtool -S" after a test run? We should
>>>>> get statistics on the reasons for transmissions that way.

>>>> Finally, I changed from 8192 to 4096, and the perfomance was
>>>> better:
>>>>
>>>> $ sudo ethtool -S enx3a601e306de1
>>>> NIC statistics:
>>>>       tx_reason_ntb_full: 0
>>>>       tx_reason_ndp_full: 0
>>>>       tx_reason_timeout: 56067

This has grown two orders of magnitude.

>>>>       tx_reason_max_datagram: 0
>>>>       tx_overhead: 83630876
>>>>       tx_ntbs: 56064
>>>>       rx_overhead: 25437595
>>>>       rx_ntbs: 847920
>>>>
>>>> At 4096 I can use the VNC with my app, click on buttons and see the mouse
>>>> moving smoothly. Please note the device name changes because we're using
>>>> random MAC addresses. 'ethtool' was running on my Debian host PC. I tested
>>>> for 1min30s and then got the statics with ethtool for all 3 tests.

As you are testing for a constant time, the increase in transmissions
due to timeouts also decreases latency by two orders of magnitude.
Though this does not ultimately tell us which side is responsible.
>>>> While the flood is happening in parallel, the VNC runs very smoothly,
>>>> and, again, as soon as it stops, it's back to slow/frozen.
>>>>
>>>> I believe here the ping command is helping to fullfil the buffer, that's
>>>> why running it on parallel makes the VNC work...

Indeed. You can confirm this by running "ethool -S" before and after the ping.
During the ping tx_reason_timeout should stagnate and probably tx_reason_ndp_full
will go up.

>>>>> #define TX_TIMEOUT_NSECS 300000
>>>>> 300 us is too small to be noticeable by VNC imho, so I think something
>>>>> *must* be misbehaving.
>>>>> Perhaps timer resolution is bad and this 300us ends up being much larger...???

Now that you mention it and have taken a closer look I suspect this piece of code:

         } else if ((n < ctx->tx_max_datagrams) && (ready2send == 0) && (ctx->timer_interval > 0)) {
                 /* wait for more frames */
                 /* push variables */
                 ctx->tx_curr_skb = skb_out;
                 /* set the pending count */
                 if (n < CDC_NCM_RESTART_TIMER_DATAGRAM_CNT)
                         ctx->tx_timer_pending = CDC_NCM_TIMER_PENDING_CNT;
                 goto exit_no_skb;

Hiago, could you try lowering CDC_NCM_TIMER_PENDING_CNT, if need be all the way to 1?
It is defined in include/linux/usb/cdc_ncm.h as 3 currently
This applies to the host side.

	Regards
		Oliver

