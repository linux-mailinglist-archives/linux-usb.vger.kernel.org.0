Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 045641B6D6B
	for <lists+linux-usb@lfdr.de>; Fri, 24 Apr 2020 07:43:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726347AbgDXFnm (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 24 Apr 2020 01:43:42 -0400
Received: from mail.kernel.org ([198.145.29.99]:49384 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725554AbgDXFnm (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 24 Apr 2020 01:43:42 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0E45E20700;
        Fri, 24 Apr 2020 05:43:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1587707021;
        bh=+fWzvK78m35Nrirl6hSL9kZfLCz52AFClANj6wtO7RA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ZoGeHTBJIatLuhsokYNf9Z/d41yp0TdZbrnsgKhNp3pbAe5vUCGf347RltHi6cpQh
         CGznK9b9HY0ajyumY4GLTTJNvW3+DzRkaB1tGXhQAcU4XmbFn0xXYUiqPgo9IJnyVs
         qrcgSPq0iwDs+IYxU8g4fAulUYlFX4s6K1ihMItA=
Date:   Fri, 24 Apr 2020 07:43:39 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Andrey Konovalov <andreyknvl@google.com>
Cc:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Felipe Balbi <balbi@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Alan Stern <stern@rowland.harvard.edu>,
        Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH USB 1/2] usb: raw-gadget: fix return value of ep read
 ioctls
Message-ID: <20200424054339.GD103562@kroah.com>
References: <ca6b79b47313aa7ee9d8c24c5a7f595772764171.1587690539.git.andreyknvl@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ca6b79b47313aa7ee9d8c24c5a7f595772764171.1587690539.git.andreyknvl@google.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Apr 24, 2020 at 03:09:58AM +0200, Andrey Konovalov wrote:
> They must return the number of bytes transferred during the data stage.
> 
> Signed-off-by: Andrey Konovalov <andreyknvl@google.com>
> ---

Is this a bugfix?  If so, does it need to go to older kernels?  A
"Fixes:" tag would be nice...

thanks,

greg k-h
