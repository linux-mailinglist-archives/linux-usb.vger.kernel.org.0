Return-Path: <linux-usb+bounces-921-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BF6F7B517D
	for <lists+linux-usb@lfdr.de>; Mon,  2 Oct 2023 13:36:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sv.mirrors.kernel.org (Postfix) with ESMTP id 523CC283A1E
	for <lists+linux-usb@lfdr.de>; Mon,  2 Oct 2023 11:36:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D64E214018;
	Mon,  2 Oct 2023 11:36:12 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FB38E566
	for <linux-usb@vger.kernel.org>; Mon,  2 Oct 2023 11:36:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B7CBC433C7;
	Mon,  2 Oct 2023 11:36:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1696246571;
	bh=/SvAUfHNHOqaNH3wrK1blT9BbadLS9FcB1QahZFyiD8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jrA/pbOlTWEcRt8iRFKXMPPDmpc0QMbeZEEtkPr0afWJZGTM50fAQyQFnYZxO+E1r
	 +PsWzaFxauGWmbFj7XxX4bMy8beCAU4fX+6sacCWIiOleTcCaRVtsbIu3UkQ9nS6p/
	 iwoan8sjW0PTrYH1CwtDOmQUcYUSowjuSlKLOYuM=
Date: Mon, 2 Oct 2023 13:36:07 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: "Jiazi.Li" <jqqlijiazi@gmail.com>
Cc: "Jiazi.Li" <jiazi.li@transsion.com>, linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: gadget: u_serial: Add null pointer check in gs_close
Message-ID: <2023100227-line-diabetes-5f95@gregkh>
References: <20230904105455.13090-1-jiazi.li@transsion.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230904105455.13090-1-jiazi.li@transsion.com>

On Mon, Sep 04, 2023 at 06:54:55PM +0800, Jiazi.Li wrote:
> If kfifo_alloc return err in gs_open, tty->driver_data will not
> be assigned a legal value.

How can kfifo_alloc fail under normal operation?

Have you seen this happen?

> This will result in a NULL pointer issue when calling gs_close in
> the following error handling:
> tty_open
>     ->tty_release
>         ->gs_close		

Odd trailing whitespace :(

> Add a null pointer check in gs_close to prevent this.
> 
> Signed-off-by: Jiazi.Li <jiazi.li@transsion.com>

Doesn't match your From: line :(

thanks,

greg k-h

