Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 279112534DF
	for <lists+linux-usb@lfdr.de>; Wed, 26 Aug 2020 18:28:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728015AbgHZQ2a (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 26 Aug 2020 12:28:30 -0400
Received: from mail.kernel.org ([198.145.29.99]:52892 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726910AbgHZQ2X (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 26 Aug 2020 12:28:23 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2BF4E2074A;
        Wed, 26 Aug 2020 16:28:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1598459302;
        bh=mq/b+MVNeq8XU4EQiRCltmX6IVyQ2tsft3VaIaXCy+s=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=bRUQSVL8FCW3hOmJ5sjVlKRbVBMFdfy4/12MCvPkeyoNxtNkkXze0yWzW73im6PXx
         WpxaOg+g71XsZIIarlHkjJRsPmQ8t92a8aPlWm6op7R3+4ny+x+eAoPfa8+KxcKDuZ
         p+WbmXwhxcvLyW0c+8qXxXggcZSDcxpGysKkcWcw=
Date:   Wed, 26 Aug 2020 18:28:37 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Felipe Balbi <balbi@kernel.org>, linux-usb@vger.kernel.org,
        Brooke Basile <brookebasile@gmail.com>,
        Kees Cook <keescook@chromium.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [PATCH v1] USB: gadget: u_f: Unbreak offset calculation in VLAs
Message-ID: <20200826162837.GA28466@kroah.com>
References: <20200826162413.21637-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200826162413.21637-1-andriy.shevchenko@linux.intel.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Aug 26, 2020 at 07:24:13PM +0300, Andy Shevchenko wrote:
> Inadvertently the commit b1cd1b65afba ("USB: gadget: u_f: add overflow checks
> to VLA macros") makes VLA macros to always return 0 due to different scope of
> two variables of the same name. Obviously we need to have only one.
> 
> Fixes: b1cd1b65afba ("USB: gadget: u_f: add overflow checks to VLA macros")
> Cc: stable <stable@kernel.org>
> Reported-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/usb/gadget/u_f.h | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/usb/gadget/u_f.h b/drivers/usb/gadget/u_f.h
> index df4e1dcb357d..0b5c5f0dd073 100644
> --- a/drivers/usb/gadget/u_f.h
> +++ b/drivers/usb/gadget/u_f.h
> @@ -25,8 +25,8 @@
>  		size_t offset = 0;					       \
>  		if (groupname##__next != SIZE_MAX) {			       \
>  			size_t align_mask = __alignof__(type) - 1;	       \
> -			size_t offset = (groupname##__next + align_mask)       \
> -					 & ~align_mask;			       \
> +			offset = (groupname##__next + align_mask) &	       \
> +				  ~align_mask;				       \
>  			size_t size = array_size(n, sizeof(type));	       \
>  			if (check_add_overflow(offset, size,		       \
>  					       &groupname##__next)) {          \
> @@ -43,8 +43,8 @@
>  		size_t offset = 0;						\
>  		if (groupname##__next != SIZE_MAX) {				\
>  			size_t align_mask = __alignof__(type) - 1;		\
> -			size_t offset = (groupname##__next + align_mask)	\
> -					 & ~align_mask;				\
> +			offset = (groupname##__next + align_mask) &		\
> +				  ~align_mask;					\
>  			if (check_add_overflow(offset, groupname##_##name##__sz,\
>  							&groupname##__next)) {	\
>  				groupname##__next = SIZE_MAX;			\

This patch, while maybe fixing the issue, has a bunch of build warnings
so I can't take it as-is:

$ make drivers/usb/gadget/
  CALL    scripts/checksyscalls.sh
  CALL    scripts/atomic/check-atomics.sh
  DESCEND  objtool
  CC [M]  drivers/usb/gadget/configfs.o
In file included from drivers/usb/gadget/configfs.c:10:
drivers/usb/gadget/configfs.c: In function ‘ext_prop_make’:
drivers/usb/gadget/u_f.h:30:4: warning: ISO C90 forbids mixed declarations and code [-Wdeclaration-after-statement]
   30 |    size_t size = array_size(n, sizeof(type));        \
      |    ^~~~~~
drivers/usb/gadget/configfs.c:1066:2: note: in expansion of macro ‘vla_item’
 1066 |  vla_item(data_chunk, struct usb_os_desc_ext_prop, ext_prop, 1);
      |  ^~~~~~~~
drivers/usb/gadget/u_f.h:30:4: warning: ISO C90 forbids mixed declarations and code [-Wdeclaration-after-statement]
   30 |    size_t size = array_size(n, sizeof(type));        \
      |    ^~~~~~
drivers/usb/gadget/configfs.c:1067:2: note: in expansion of macro ‘vla_item’
 1067 |  vla_item(data_chunk, struct config_item_type, ext_prop_type, 1);
      |  ^~~~~~~~
drivers/usb/gadget/configfs.c: In function ‘usb_os_desc_prepare_interf_dir’:
drivers/usb/gadget/u_f.h:30:4: warning: ISO C90 forbids mixed declarations and code [-Wdeclaration-after-statement]
   30 |    size_t size = array_size(n, sizeof(type));        \
      |    ^~~~~~
drivers/usb/gadget/configfs.c:1194:2: note: in expansion of macro ‘vla_item’
 1194 |  vla_item(data_chunk, struct config_group, os_desc_group, 1);
      |  ^~~~~~~~
drivers/usb/gadget/u_f.h:30:4: warning: ISO C90 forbids mixed declarations and code [-Wdeclaration-after-statement]
   30 |    size_t size = array_size(n, sizeof(type));        \
      |    ^~~~~~
drivers/usb/gadget/configfs.c:1195:2: note: in expansion of macro ‘vla_item’
 1195 |  vla_item(data_chunk, struct config_item_type, os_desc_type, 1);
      |  ^~~~~~~~
drivers/usb/gadget/u_f.h:30:4: warning: ISO C90 forbids mixed declarations and code [-Wdeclaration-after-statement]
   30 |    size_t size = array_size(n, sizeof(type));        \
      |    ^~~~~~
drivers/usb/gadget/configfs.c:1196:2: note: in expansion of macro ‘vla_item’
 1196 |  vla_item(data_chunk, struct config_item_type, interface_type, 1);
      |  ^~~~~~~~

Care to try it again?

thanks,

greg k-h
