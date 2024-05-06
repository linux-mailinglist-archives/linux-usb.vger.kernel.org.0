Return-Path: <linux-usb+bounces-10043-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4303B8BC70A
	for <lists+linux-usb@lfdr.de>; Mon,  6 May 2024 07:38:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7447F1C20DAF
	for <lists+linux-usb@lfdr.de>; Mon,  6 May 2024 05:38:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CD5B4AEF5;
	Mon,  6 May 2024 05:34:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="aN/8LoSy"
X-Original-To: linux-usb@vger.kernel.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AA6A4EB23;
	Mon,  6 May 2024 05:34:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714973686; cv=none; b=bMgnt1vS+Yl/19n0ZsPvmUQG9XIdT10G/hOmneJY13EWMY6K2Mo/XDtEyRRbtZn+8+gdOqDYViP3j4yqoShlG1QD1YBA0ymkmSjyurHd3DUtCM+e8YDZUb7hZH8IDElxM0ntRZEqk81iUBLZ7Exg2PDo79hTB4utMWVpymMrJIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714973686; c=relaxed/simple;
	bh=8xvjr/ht3zWkhYVhUyGMabWqT4XEav9iQnTlri5SKTI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ISL2ODhztvlBMBqCAbpBeNF9aPoqgZUqu1pvk6bt5oOMKQtd0zqL9JhQ+bGoKy+08zntZnC93je2Phnd5IanjgjOcol+KvITmsDpK2uq/aoGXb+ODrHWmHXSwP8KTo1Fursjok/rENg5+22feuByAiOj7hsQpFo1b5Uue7CH9m8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=aN/8LoSy; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=FydlBevAEF4mzJz2SWHEtq0MwCv4D2rNkatjHyu9pvo=; b=aN/8LoSyjbH+yBzXXWDBqh7Lst
	/mnCEG9Cvp8yfLMdbuG14HFBAvBZXz0ErRpmnoP0bDx927JMdx53zB2rCj2zoggWXqBpVBrnZX5m/
	vUuucj/8Fu14/NxH3jyVibZ1zKXz48zmF1wcjc+5F/CPp22jJzY1oh9Y5rETF5DrVUc1PXHcfN+zg
	Y5ub0KXpRXFsfFJbAxgo8ZOE4aFfQf93ZrEzQMRyANt8QiiZUJFe9/d2hEpl7CrzzR8L0Wd6RZYls
	I09HXxbAva4b8+wXe3VyzqTihXgDK+54TaAD7CM8gfqqwV/9d0R/mnGD3ERboGmteyr2KBlUbFy+r
	AnJvQWcw==;
Received: from willy by casper.infradead.org with local (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s3qzj-0000000AFWO-0wr8;
	Mon, 06 May 2024 05:34:35 +0000
Date: Mon, 6 May 2024 06:34:35 +0100
From: Matthew Wilcox <willy@infradead.org>
To: qiurui <happyqiuqiu9604@gmail.com>
Cc: gregkh@linuxfoundation.org, corbet@lwn.net, linux-usb@vger.kernel.org,
	linux-doc@vger.kernel.org, qiurui@kylinos.cn
Subject: Re: [PATCH] docs: usb:gadget:hid: fix hid_gadget_test code in
 documentation of hid section
Message-ID: <Zjhr64kAcj5VBHrO@casper.infradead.org>
References: <20240506024408.19344-1-qiurui@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240506024408.19344-1-qiurui@kylinos.cn>

On Mon, May 06, 2024 at 10:44:08AM +0800, qiurui wrote:
> Fix bzero buffer before read()

why would we want to do that?

> Signed-off-by: qiurui <qiurui@kylinos.cn>
> ---
>  Documentation/usb/gadget_hid.rst | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/usb/gadget_hid.rst b/Documentation/usb/gadget_hid.rst
> index e623416de4f1..c4ee81a6b48e 100644
> --- a/Documentation/usb/gadget_hid.rst
> +++ b/Documentation/usb/gadget_hid.rst
> @@ -410,6 +410,7 @@ Sample code::
>  		}
>  
>  		if (FD_ISSET(fd, &rfds)) {
> +			bzero(buf, SIZE);
>  			cmd_len = read(fd, buf, BUF_LEN - 1);
>  			printf("recv report:");
>  			for (i = 0; i < cmd_len; i++)
> @@ -419,6 +420,7 @@ Sample code::
>  
>  		if (FD_ISSET(STDIN_FILENO, &rfds)) {
>  			memset(report, 0x0, sizeof(report));
> +			bzero(buf, SIZE);
>  			cmd_len = read(STDIN_FILENO, buf, BUF_LEN - 1);
>  
>  			if (cmd_len == 0)
> -- 
> 2.34.1
> 
> 

