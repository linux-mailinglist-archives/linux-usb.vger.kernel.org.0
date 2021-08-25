Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 313913F73C9
	for <lists+linux-usb@lfdr.de>; Wed, 25 Aug 2021 12:55:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239993AbhHYKzq (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 25 Aug 2021 06:55:46 -0400
Received: from mail.kernel.org ([198.145.29.99]:50200 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S240057AbhHYKzo (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 25 Aug 2021 06:55:44 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 377E7610F8;
        Wed, 25 Aug 2021 10:54:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1629888899;
        bh=9W1g4oeoMs3MQr+3JOfBVlNVPRw6ihDPRFq+csul4J0=;
        h=References:From:To:Cc:Subject:Date:In-reply-to:From;
        b=E8mzSx9zg/BNeoAwAceZE/3rUolMt2kuERVMClL+kaWjKQHYKonKf12AP1ubb0fVC
         8PQ1SQg3bpXhHbVfQOqC2bP4gEHhpCN+IbzBpUof25eqrqFX5JNXpk4ZV42wV0CArp
         V/VUpFC8GRf4sUOxvMW3mYbsPgA1bkUWUY1xxDn9tMu/7IhCIm/OnWdNLJl0dN4+R3
         +ziaFFH3aFeDwrcF/4gd3ZydmWsdj0IPJgXW+fmt6WAlso/y3G6TxBHEfmIU0p+Lo2
         fGeTzZDFWJKrY76kFHcwUuYAmYkNxcmjNEKf57TmHKNkEh6MQPfboKfS+PyiOAYqgt
         r8K7X6kg7MusQ==
References: <1629777281-30188-1-git-send-email-quic_linyyuan@quicinc.com>
 <1629777281-30188-2-git-send-email-quic_linyyuan@quicinc.com>
 <8735qz8deg.fsf@kernel.org> <87lf4r6y9s.fsf@kernel.org>
 <DM8PR02MB8198A157E55EBBD710905781E3C59@DM8PR02MB8198.namprd02.prod.outlook.com>
 <87h7ff6rb2.fsf@kernel.org>
 <DM8PR02MB81987A1D7C679D73867482F3E3C69@DM8PR02MB8198.namprd02.prod.outlook.com>
User-agent: mu4e 1.6.4; emacs 27.2
From:   Felipe Balbi <balbi@kernel.org>
To:     "Linyu Yuan (QUIC)" <quic_linyyuan@quicinc.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH V4 1/3] usb: gadget: configfs: add UDC trace entry
Date:   Wed, 25 Aug 2021 13:50:12 +0300
In-reply-to: <DM8PR02MB81987A1D7C679D73867482F3E3C69@DM8PR02MB8198.namprd02.prod.outlook.com>
Message-ID: <87v93taj5r.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


Hi,

"Linyu Yuan (QUIC)" <quic_linyyuan@quicinc.com> writes:
>> >> > why tracing only the names? This gives us no insight into whatever bug
>> > This patch only trace user space operation when enable a composition
>> > like below of android or similar thing in another way,
>> >
>> > on property:sys.usb.config=mtp && property:sys.usb.configfs=1
>> >     write /config/usb_gadget/g1/configs/b.1/strings/0x409/configuration
>> "mtp"
>> >     symlink /config/usb_gadget/g1/functions/mtp.gs0
>> /config/usb_gadget/g1/configs/b.1/f1
>> >     write /config/usb_gadget/g1/UDC ${sys.usb.controller}
>> 
>> yeah, that's fine. I'm simply stating that you're missing an opportunity
>> to get more data which may be relevant in the future. If you merely
>> print the name of the UDC, you get zero information about the state of
>> the UDC when the gadget started.
>> 
>> You see, from that UDC_store function, you have access to the
>> gadget_info, which gives you access to the usb_composite_driver and
>> usb_composite_dev. Both of which contain valuable information about the
>> state of the UDC.
>> 
>> Instead of making a single trace that prints the name of the UDC when
>> you call store, make a trace event class that takes a struct gadget_info
>> pointer and extracts the information from it. Something like so:
>> 
>> DECLARE_EVENT_CLASS(log_gadget_info,
>> 	TP_PROTO(struct gadget_info *gi),
>>         TP_ARGS(gi),
>>         TP_STRUCT__entry(
>>                 __string(drv_name, gi->composite->name)
>>                 __string(udc_name, gi->cdev->gadget->name)
>> 
>
> Do we need following two ?

say your QA team tells you that a particular situation is failing. You
ask them to collect trace events. You'll be glad to see a lot of
information available so you can understand how the device changed
stated as you used it.

>>         	__field(bool, use_os_desc)
>>                 __field(char, b_vendor_code)
>
>>                 __field(bool, unbind)
>
> why do you suggest following 4 fields ? it is not exist in gadget_info.

They are part of composite_dev, IIRC. They tell you important
information about what is supported by the UDC.

>>                 __field(bool, sg_supported)
>>                 __field(bool, is_otg)
>>                 __field(bool, is_a_peripheral)
>>                 __field(bool, b_hnp_enable)
>> 
>> 		/*
>>                  * and so on, anything that may come in handy should a
>> 		 * bug happen here
>>                  */
>> 	),
>> 	TP_fast_assign(
>>         	__assign_str(drv_name, gi->composite->name)
>>                 __assign_srt(udc_name, gi->cdev->gadget->name)
>> 
>> 		__entry->use_os_desc = gi->use_os_desc;
>>                 /* and so on */
>> 	),
>>         TP_printk("%s [%s]: ....",
>>         	__get_str(udc_name), __get_str(drv_name), ....)
>> );
>
> the gadget_info have few info to trace, from my view only

right...

> struct gadget_info {
> 	struct config_group group;
> 	struct config_group functions_group;
> 	struct config_group configs_group;
> 	struct config_group strings_group;
> 	struct config_group os_desc_group;
>
> 	struct mutex lock;
> 	struct usb_gadget_strings *gstrings[MAX_USB_STRING_LANGS + 1];
> 	struct list_head string_list;
> 	struct list_head available_func;
>
> 	struct usb_composite_driver composite;
> 	struct usb_composite_dev cdev;

... Then you can access the composite driver and the composite dev to
get more information which may be super useful when debugging some
issues.

Also keep in mind that changing trace events is not so easy since it
sort of becomes an ABI to userspace. Once we expose it, it's a little
harder to modify as there may be parsers depending on the format
(although they shouldn't).

> 	bool use_os_desc;
> 	char b_vendor_code;
> 	char qw_sign[OS_STRING_QW_SIGN_LEN];
> 	spinlock_t spinlock;
> 	bool unbind;
> };
>> 
>> Then you can easily add traces to several functions that use a similar
>> argument:
>> 
>> DEFINE_EVENT(log_gadget_info, gadget_dev_desc_UDC_store,
>> 	TP_PROTO(struct gadget_info *gi),
>>         TP_ARGS(gi)
>> );
>> 
>
> It is needed for show operation ?

you want to track both show and store.

>> DEFINE_EVENT(log_gadget_info, gadget_dev_desc_UDC_show,
>> 	TP_PROTO(struct gadget_info *gi),
>>         TP_ARGS(gi)
>> );
>> 
>> DEFINE_EVENT(log_gadget_info, unregister_gadget,
>> 	TP_PROTO(struct gadget_info *gi),
>>         TP_ARGS(gi)
>> );
>> 
>
> Following operation also not needed, right ? according to my
> experience, it is not change in project.

What if something changes some internal state behind our backs? We'd
like to see that. One way to notice is if some value changes even if
you're just calling the different show methods.

-- 
balbi
