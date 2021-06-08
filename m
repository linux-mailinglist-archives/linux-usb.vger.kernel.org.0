Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D32CB39F173
	for <lists+linux-usb@lfdr.de>; Tue,  8 Jun 2021 10:54:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230226AbhFHI4l (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 8 Jun 2021 04:56:41 -0400
Received: from mail.kernel.org ([198.145.29.99]:57312 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229507AbhFHI4k (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 8 Jun 2021 04:56:40 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 41E1361153;
        Tue,  8 Jun 2021 08:54:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1623142476;
        bh=hzSB65dSk1+MH9XZL2pUhTvn35/3ji2I6zANfZcsUgU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=UDkbkSzCjySaKP+AYCIwYE6KsKek/GUke/PqiBnSVk5+ID5Jb5u/OcdrDz7fl9gnP
         PheUh5Ic12lK491Yu1ltjVk5EXli3Z9zUAZbSJ3h96hJLOP46p/pW8MozQc8WvFA9H
         HymR1tHKwdUSiv8N56PGi0snYEYSHOG/VG5Tf2YU=
Date:   Tue, 8 Jun 2021 10:54:34 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Maciej =?utf-8?Q?=C5=BBenczykowski?= <zenczykowski@gmail.com>
Cc:     Maciej =?utf-8?Q?=C5=BBenczykowski?= <maze@google.com>,
        Linux USB Mailing List <linux-usb@vger.kernel.org>,
        Felipe Balbi <balbi@kernel.org>
Subject: Re: [PATCH] usb: fix various gadget panics on 10gbps cabling
Message-ID: <YL8wSsGso94F6lEH@kroah.com>
References: <20210608044201.3898589-1-zenczykowski@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210608044201.3898589-1-zenczykowski@gmail.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Jun 07, 2021 at 09:42:01PM -0700, Maciej Żenczykowski wrote:
> From: Maciej Żenczykowski <maze@google.com>
> 
> Cc: Felipe Balbi <balbi@kernel.org>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Signed-off-by: Maciej Żenczykowski <maze@google.com>
> ---
>  drivers/usb/gadget/config.c | 4 ++++
>  1 file changed, 4 insertions(+)

I can not take patches without any changelog text at all, sorry.

greg k-h
