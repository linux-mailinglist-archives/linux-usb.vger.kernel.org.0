Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 386643F59D8
	for <lists+linux-usb@lfdr.de>; Tue, 24 Aug 2021 10:29:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235262AbhHXIaj (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 24 Aug 2021 04:30:39 -0400
Received: from mail.kernel.org ([198.145.29.99]:56414 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233920AbhHXIai (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 24 Aug 2021 04:30:38 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 70C0561220;
        Tue, 24 Aug 2021 08:29:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1629793794;
        bh=0wZZ6xMyXlU+k8pU8bg/JwIY9FDDaqIQB4n81uxSbfE=;
        h=References:From:To:Cc:Subject:Date:In-reply-to:From;
        b=F9b0NBlMm88mAn4LE/E2gBUBDLtQ63BTP6CXI8o7tXjNRm5eiA/C/vOnWSD1pg5l5
         WHJkwSGSeh+CG53+14mYI+UrDyKuAle3xOzaYqjSgAyQpCFpWrbXWsPUN2uxT+Fyf7
         6KiNN/DIy/mlVC0xhUNjUg/yG9+QXz5epKLTM7tcYuPXq5tRoMj+eRT0Mq1PK8jBLR
         JInZ6Izra2+hxF52yESThmvVSP5MCugqlKbRlykl47GvpRpkEJvNlzQ+OXDuhxHGtU
         Gs6E1WXOWup1cdraoVIy22c+djKjdUuJbD1OQZ+Ae6dQrSAYU24GZfyY40jOJvAdTR
         ebVSEXnrq8nFw==
References: <1629777281-30188-1-git-send-email-quic_linyyuan@quicinc.com>
 <1629777281-30188-2-git-send-email-quic_linyyuan@quicinc.com>
 <8735qz8deg.fsf@kernel.org>
User-agent: mu4e 1.6.4; emacs 27.2
From:   Felipe Balbi <balbi@kernel.org>
To:     Linyu Yuan <quic_linyyuan@quicinc.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH V4 1/3] usb: gadget: configfs: add UDC trace entry
Date:   Tue, 24 Aug 2021 11:29:18 +0300
In-reply-to: <8735qz8deg.fsf@kernel.org>
Message-ID: <87lf4r6y9s.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


Hi again,

Felipe Balbi <balbi@kernel.org> writes:
> Linyu Yuan <quic_linyyuan@quicinc.com> writes:
>> add trace in function gadget_dev_desc_UDC_store()
>> will show when user space enable/disable the gadget.
>>
>> Signed-off-by: Linyu Yuan <quic_linyyuan@quicinc.com>
>> ---
>>  drivers/usb/gadget/Makefile         |  1 +
>>  drivers/usb/gadget/configfs.c       |  3 +++
>>  drivers/usb/gadget/configfs_trace.c |  7 +++++++
>>  drivers/usb/gadget/configfs_trace.h | 39 +++++++++++++++++++++++++++++++++++++
>>  4 files changed, 50 insertions(+)
>>  create mode 100644 drivers/usb/gadget/configfs_trace.c
>>  create mode 100644 drivers/usb/gadget/configfs_trace.h
>>
>> diff --git a/drivers/usb/gadget/Makefile b/drivers/usb/gadget/Makefile
>> index 130dad7..8e9c2b8 100644
>> --- a/drivers/usb/gadget/Makefile
>> +++ b/drivers/usb/gadget/Makefile
>> @@ -9,5 +9,6 @@ ccflags-y				+= -I$(srctree)/drivers/usb/gadget/udc
>>  obj-$(CONFIG_USB_LIBCOMPOSITE)	+= libcomposite.o
>>  libcomposite-y			:= usbstring.o config.o epautoconf.o
>>  libcomposite-y			+= composite.o functions.o configfs.o u_f.o
>> +libcomposite-y			+= configfs_trace.o
>>  
>>  obj-$(CONFIG_USB_GADGET)	+= udc/ function/ legacy/
>> diff --git a/drivers/usb/gadget/configfs.c b/drivers/usb/gadget/configfs.c
>> index 477e72a..f7f3af8 100644
>> --- a/drivers/usb/gadget/configfs.c
>> +++ b/drivers/usb/gadget/configfs.c
>> @@ -9,6 +9,7 @@
>>  #include "configfs.h"
>>  #include "u_f.h"
>>  #include "u_os_desc.h"
>> +#include "configfs_trace.h"
>>  
>>  int check_user_usb_string(const char *name,
>>  		struct usb_gadget_strings *stringtab_dev)
>> @@ -270,6 +271,8 @@ static ssize_t gadget_dev_desc_UDC_store(struct config_item *item,
>>  	if (name[len - 1] == '\n')
>>  		name[len - 1] = '\0';
>>  
>> +	trace_gadget_dev_desc_UDC_store(config_item_name(item), name);
>
> why tracing only the names? This gives us no insight into whatever bug
> may happen and we may want to use trace events to debug. Rather, try to
> think of trace events as tracking the lifetime of the UDC and
> gadget. Trace values that may change over time.
>
> I also think that all three patches could be combined into a single
> commit, but that's up to discussion.

nevermind this last paragraph, just saw that Greg asked you to split ;-)

The first paragraph remains valid, though

-- 
balbi
