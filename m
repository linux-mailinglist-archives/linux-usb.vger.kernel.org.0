Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D205F4B5D10
	for <lists+linux-usb@lfdr.de>; Mon, 14 Feb 2022 22:41:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231482AbiBNVjR (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 14 Feb 2022 16:39:17 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:57830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231458AbiBNVjM (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 14 Feb 2022 16:39:12 -0500
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id 37A7D16BFB2
        for <linux-usb@vger.kernel.org>; Mon, 14 Feb 2022 13:39:02 -0800 (PST)
Received: (qmail 731368 invoked by uid 1000); 14 Feb 2022 16:39:01 -0500
Date:   Mon, 14 Feb 2022 16:39:01 -0500
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Sergey Shtylyov <s.shtylyov@omp.ru>
Cc:     linux-usb@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] usb: host: {e|o}hci-dbg: kill useless 'ret' variable
 initializers
Message-ID: <YgrL9SDXLJ7ho0z+@rowland.harvard.edu>
References: <901b7478-45b6-d8b3-f5c6-555712485232@omp.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <901b7478-45b6-d8b3-f5c6-555712485232@omp.ru>
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Feb 14, 2022 at 10:56:16PM +0300, Sergey Shtylyov wrote:
> The 'ret' local variables are often initialized to 0 but this value is
> unused, thus we can kill those initializers...
> 
> Signed-off-by: Sergey Shtylyov <s.shtylyov@omp.ru>
> 
> ---

Acked-by: Alan Stern <stern@rowland.harvard.edu>

> This patch is against the 'usb-next' branch of Greg KH's 'usb.git' repo.
> 
>  drivers/usb/host/ehci-dbg.c |    4 ++--
>  drivers/usb/host/ohci-dbg.c |    4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> Index: usb/drivers/usb/host/ehci-dbg.c
> ===================================================================
> --- usb.orig/drivers/usb/host/ehci-dbg.c
> +++ usb/drivers/usb/host/ehci-dbg.c
> @@ -931,7 +931,7 @@ static struct debug_buffer *alloc_buffer
>  
>  static int fill_buffer(struct debug_buffer *buf)
>  {
> -	int ret = 0;
> +	int ret;
>  
>  	if (!buf->output_buf)
>  		buf->output_buf = vmalloc(buf->alloc_size);
> @@ -956,7 +956,7 @@ static ssize_t debug_output(struct file
>  		size_t len, loff_t *offset)
>  {
>  	struct debug_buffer *buf = file->private_data;
> -	int ret = 0;
> +	int ret;
>  
>  	mutex_lock(&buf->mutex);
>  	if (buf->count == 0) {
> Index: usb/drivers/usb/host/ohci-dbg.c
> ===================================================================
> --- usb.orig/drivers/usb/host/ohci-dbg.c
> +++ usb/drivers/usb/host/ohci-dbg.c
> @@ -680,7 +680,7 @@ static struct debug_buffer *alloc_buffer
>  
>  static int fill_buffer(struct debug_buffer *buf)
>  {
> -	int ret = 0;
> +	int ret;
>  
>  	if (!buf->page)
>  		buf->page = (char *)get_zeroed_page(GFP_KERNEL);
> @@ -705,7 +705,7 @@ static ssize_t debug_output(struct file
>  			size_t len, loff_t *offset)
>  {
>  	struct debug_buffer *buf = file->private_data;
> -	int ret = 0;
> +	int ret;
>  
>  	mutex_lock(&buf->mutex);
>  	if (buf->count == 0) {
> 
