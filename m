Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 805453F5C94
	for <lists+linux-usb@lfdr.de>; Tue, 24 Aug 2021 13:00:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236394AbhHXLBG (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 24 Aug 2021 07:01:06 -0400
Received: from mail.kernel.org ([198.145.29.99]:40036 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236358AbhHXLBE (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 24 Aug 2021 07:01:04 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 93CD061214;
        Tue, 24 Aug 2021 11:00:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1629802820;
        bh=dM871d1Wm3rDLNXhOtJaHU2FzJFlvEmF5WgZHty3nVQ=;
        h=References:From:To:Cc:Subject:Date:In-reply-to:From;
        b=pnPOIV0qNaCEKz6AMRfLr/UhilbE93p9f5ufa71anWAeFV1twBPLJchiFDIEUWxd2
         rpun8dLHWM0tw8/KMICZONkmHSScmS+6F6pZd482wtPmZFMREJHrfg1NUBpbmT8oCq
         Y5vh5fKDbYjwewWKATPPYrxR7NtPI4pMiC95UamF7nmxoTJ+pwGXwb1x0wbPLoo6vW
         j1qQsaze1qwHI3A9JBBJ8YmgxkwpXi/OETsfliSm56b0vjG7xzf7pJuuTrNZ/v27Wk
         kEWKBfMYWOI4lLZH2lGqohSQLZd26RjtfN7qjMUXXFFnxO2XxzKWuSc+8gKwZX34XK
         M2b1LlvuNfiyg==
References: <1629777281-30188-1-git-send-email-quic_linyyuan@quicinc.com>
 <1629777281-30188-2-git-send-email-quic_linyyuan@quicinc.com>
 <8735qz8deg.fsf@kernel.org> <87lf4r6y9s.fsf@kernel.org>
 <DM8PR02MB8198A157E55EBBD710905781E3C59@DM8PR02MB8198.namprd02.prod.outlook.com>
User-agent: mu4e 1.6.4; emacs 27.2
From:   Felipe Balbi <balbi@kernel.org>
To:     "Linyu Yuan (QUIC)" <quic_linyyuan@quicinc.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH V4 1/3] usb: gadget: configfs: add UDC trace entry
Date:   Tue, 24 Aug 2021 13:41:45 +0300
In-reply-to: <DM8PR02MB8198A157E55EBBD710905781E3C59@DM8PR02MB8198.namprd02.prod.outlook.com>
Message-ID: <87h7ff6rb2.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


Hi,

"Linyu Yuan (QUIC)" <quic_linyyuan@quicinc.com> writes:
>> Felipe Balbi <balbi@kernel.org> writes:
>> > Linyu Yuan <quic_linyyuan@quicinc.com> writes:
>> >> add trace in function gadget_dev_desc_UDC_store()
>> >> will show when user space enable/disable the gadget.
>> >>
>> >> Signed-off-by: Linyu Yuan <quic_linyyuan@quicinc.com>
>> >> ---
>> >>  drivers/usb/gadget/Makefile         |  1 +
>> >>  drivers/usb/gadget/configfs.c       |  3 +++
>> >>  drivers/usb/gadget/configfs_trace.c |  7 +++++++
>> >>  drivers/usb/gadget/configfs_trace.h | 39
>> +++++++++++++++++++++++++++++++++++++
>> >>  4 files changed, 50 insertions(+)
>> >>  create mode 100644 drivers/usb/gadget/configfs_trace.c
>> >>  create mode 100644 drivers/usb/gadget/configfs_trace.h
>> >>
>> >> diff --git a/drivers/usb/gadget/Makefile b/drivers/usb/gadget/Makefile
>> >> index 130dad7..8e9c2b8 100644
>> >> --- a/drivers/usb/gadget/Makefile
>> >> +++ b/drivers/usb/gadget/Makefile
>> >> @@ -9,5 +9,6 @@ ccflags-y				+= -
>> I$(srctree)/drivers/usb/gadget/udc
>> >>  obj-$(CONFIG_USB_LIBCOMPOSITE)	+= libcomposite.o
>> >>  libcomposite-y			:= usbstring.o config.o epautoconf.o
>> >>  libcomposite-y			+= composite.o functions.o configfs.o
>> u_f.o
>> >> +libcomposite-y			+= configfs_trace.o
>> >>
>> >>  obj-$(CONFIG_USB_GADGET)	+= udc/ function/ legacy/
>> >> diff --git a/drivers/usb/gadget/configfs.c b/drivers/usb/gadget/configfs.c
>> >> index 477e72a..f7f3af8 100644
>> >> --- a/drivers/usb/gadget/configfs.c
>> >> +++ b/drivers/usb/gadget/configfs.c
>> >> @@ -9,6 +9,7 @@
>> >>  #include "configfs.h"
>> >>  #include "u_f.h"
>> >>  #include "u_os_desc.h"
>> >> +#include "configfs_trace.h"
>> >>
>> >>  int check_user_usb_string(const char *name,
>> >>  		struct usb_gadget_strings *stringtab_dev)
>> >> @@ -270,6 +271,8 @@ static ssize_t gadget_dev_desc_UDC_store(struct
>> config_item *item,
>> >>  	if (name[len - 1] == '\n')
>> >>  		name[len - 1] = '\0';
>> >>
>> >> +	trace_gadget_dev_desc_UDC_store(config_item_name(item),
>> name);
>> >
>> > why tracing only the names? This gives us no insight into whatever bug
> This patch only trace user space operation when enable a composition
> like below of android or similar thing in another way,
>
> on property:sys.usb.config=mtp && property:sys.usb.configfs=1
>     write /config/usb_gadget/g1/configs/b.1/strings/0x409/configuration "mtp"
>     symlink /config/usb_gadget/g1/functions/mtp.gs0 /config/usb_gadget/g1/configs/b.1/f1
>     write /config/usb_gadget/g1/UDC ${sys.usb.controller}

yeah, that's fine. I'm simply stating that you're missing an opportunity
to get more data which may be relevant in the future. If you merely
print the name of the UDC, you get zero information about the state of
the UDC when the gadget started.

You see, from that UDC_store function, you have access to the
gadget_info, which gives you access to the usb_composite_driver and
usb_composite_dev. Both of which contain valuable information about the
state of the UDC.

Instead of making a single trace that prints the name of the UDC when
you call store, make a trace event class that takes a struct gadget_info
pointer and extracts the information from it. Something like so:

DECLARE_EVENT_CLASS(log_gadget_info,
	TP_PROTO(struct gadget_info *gi),
        TP_ARGS(gi),
        TP_STRUCT__entry(
                __string(drv_name, gi->composite->name)
                __string(udc_name, gi->cdev->gadget->name)

        	__field(bool, use_os_desc)
                __field(char, b_vendor_code)
                __field(bool, unbind)
                __field(bool, sg_supported)
                __field(bool, is_otg)
                __field(bool, is_a_peripheral)
                __field(bool, b_hnp_enable)

		/*
                 * and so on, anything that may come in handy should a
		 * bug happen here
                 */
	),
	TP_fast_assign(
        	__assign_str(drv_name, gi->composite->name)
                __assign_srt(udc_name, gi->cdev->gadget->name)

		__entry->use_os_desc = gi->use_os_desc;
                /* and so on */
	),
        TP_printk("%s [%s]: ....",
        	__get_str(udc_name), __get_str(drv_name), ....)
);
                
Then you can easily add traces to several functions that use a similar
argument:

DEFINE_EVENT(log_gadget_info, gadget_dev_desc_UDC_store,
	TP_PROTO(struct gadget_info *gi),
        TP_ARGS(gi)
);

DEFINE_EVENT(log_gadget_info, gadget_dev_desc_UDC_show,
	TP_PROTO(struct gadget_info *gi),
        TP_ARGS(gi)
);

DEFINE_EVENT(log_gadget_info, unregister_gadget,
	TP_PROTO(struct gadget_info *gi),
        TP_ARGS(gi)
);

DEFINE_EVENT(log_gadget_info, gadget_dev_desc_max_speed_show,
	TP_PROTO(struct gadget_info *gi),
        TP_ARGS(gi)
);

DEFINE_EVENT(log_gadget_info, gadget_dev_desc_bcdDevice_store,
	TP_PROTO(struct gadget_info *gi),
        TP_ARGS(gi)
);

DEFINE_EVENT(log_gadget_info, gadget_dev_desc_bcdUSB_store,
	TP_PROTO(struct gadget_info *gi),
        TP_ARGS(gi)
);

DEFINE_EVENT(log_gadget_info, gadget_dev_desc_max_speed_show,
	TP_PROTO(struct gadget_info *gi),
        TP_ARGS(gi)
);

DEFINE_EVENT(log_gadget_info, gadget_dev_desc_max_speed_store,
	TP_PROTO(struct gadget_info *gi),
        TP_ARGS(gi)
);


and so on, for any other function that has direct access to a
gadget_info pointer.

-- 
balbi
