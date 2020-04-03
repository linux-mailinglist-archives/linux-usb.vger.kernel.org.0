Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 80D4F19D955
	for <lists+linux-usb@lfdr.de>; Fri,  3 Apr 2020 16:42:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390850AbgDCOmu (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 3 Apr 2020 10:42:50 -0400
Received: from netrider.rowland.org ([192.131.102.5]:55081 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S2390796AbgDCOmu (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 3 Apr 2020 10:42:50 -0400
Received: (qmail 8726 invoked by uid 500); 3 Apr 2020 10:42:48 -0400
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 3 Apr 2020 10:42:48 -0400
Date:   Fri, 3 Apr 2020 10:42:48 -0400 (EDT)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@netrider.rowland.org
To:     Masahiro Yamada <masahiroy@kernel.org>
cc:     Felipe Balbi <felipe.balbi@linux.intel.com>,
        <linux-usb@vger.kernel.org>, Greg KH <gregkh@linuxfoundation.org>,
        Corentin Labbe <clabbe@baylibre.com>,
        David Howells <dhowells@redhat.com>,
        Felipe Balbi <balbi@kernel.org>,
        "Peter Zijlstra (Intel)" <peterz@infradead.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] usb: gadget: legacy: fix redundant initialization warnings
 from cppcheck
In-Reply-To: <20200403131652.8183-1-masahiroy@kernel.org>
Message-ID: <Pine.LNX.4.44L0.2004031042290.7035-100000@netrider.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, 3 Apr 2020, Masahiro Yamada wrote:

> Fix the following cppcheck warnings:
> 
> drivers/usb/gadget/legacy/inode.c:1364:8: style: Redundant initialization for 'value'. The initialized value is overwritten$
>  value = -EOPNOTSUPP;
>        ^
> drivers/usb/gadget/legacy/inode.c:1331:15: note: value is initialized
>  int    value = -EOPNOTSUPP;
>               ^
> drivers/usb/gadget/legacy/inode.c:1364:8: note: value is overwritten
>  value = -EOPNOTSUPP;
>        ^
> drivers/usb/gadget/legacy/inode.c:1817:8: style: Redundant initialization for 'value'. The initialized value is overwritten$
>  value = -EINVAL;
>        ^
> drivers/usb/gadget/legacy/inode.c:1787:18: note: value is initialized
>  ssize_t   value = len, length = len;
>                  ^
> drivers/usb/gadget/legacy/inode.c:1817:8: note: value is overwritten
>  value = -EINVAL;
>        ^
> 
> Reported-by: kbuild test robot <lkp@intel.com>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
> 
> I do not think this is my fault because the addressed commit did not
> touch this file, but the kbuild test robot sent me this report somehow:
> 
>   https://lkml.org/lkml/2020/4/3/395
> 
> Anyway, the warnings are real, so I removed the redundant assignments.
> I re-ran cppcheck and confirmed the warnings have been fixed.
> 
> 
>  drivers/usb/gadget/legacy/inode.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/gadget/legacy/inode.c b/drivers/usb/gadget/legacy/inode.c
> index aa0de9e35afa..3afddd3bea6e 100644
> --- a/drivers/usb/gadget/legacy/inode.c
> +++ b/drivers/usb/gadget/legacy/inode.c
> @@ -1361,7 +1361,6 @@ gadgetfs_setup (struct usb_gadget *gadget, const struct usb_ctrlrequest *ctrl)
>  
>  	req->buf = dev->rbuf;
>  	req->context = NULL;
> -	value = -EOPNOTSUPP;
>  	switch (ctrl->bRequest) {
>  
>  	case USB_REQ_GET_DESCRIPTOR:
> @@ -1784,7 +1783,7 @@ static ssize_t
>  dev_config (struct file *fd, const char __user *buf, size_t len, loff_t *ptr)
>  {
>  	struct dev_data		*dev = fd->private_data;
> -	ssize_t			value = len, length = len;
> +	ssize_t			value, length = len;
>  	unsigned		total;
>  	u32			tag;
>  	char			*kbuf;

Acked-by: Alan Stern <stern@rowland.harvard.edu>

