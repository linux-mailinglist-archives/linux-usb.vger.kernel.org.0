Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3DC7F387D7A
	for <lists+linux-usb@lfdr.de>; Tue, 18 May 2021 18:29:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238127AbhERQbL (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 18 May 2021 12:31:11 -0400
Received: from mail.kernel.org ([198.145.29.99]:33378 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237994AbhERQbK (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 18 May 2021 12:31:10 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1F0D1611CE;
        Tue, 18 May 2021 16:29:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1621355391;
        bh=HgIexHVI5E7UHVlQmPmXKGPxQKBdX3ZBlFB+5kn7wNc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ePOrVMjfvWpWxkih64syk7t7noNFpoDVbAC/8hifCdNaJOQs3CRHZxTZCwGNOhcse
         SVXaIJxhWf8HvCFHndyLCir8MmvCBw3KI1fy++jvj+XAq43k+dEX/5LK8HPIFNVoXn
         uiPXw06EK+dHdMNcyzvzw1IUdjUigwArY/z1I4oc=
Date:   Tue, 18 May 2021 18:29:49 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Daniel Mack <daniel@zonque.org>
Cc:     linux-usb@vger.kernel.org,
        Haojian Zhuang <haojian.zhuang@gmail.com>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        Felipe Balbi <balbi@kernel.org>
Subject: Re: [PATCH] USB: gadget: pxa25x_udc: remove dentry storage for
 debugfs file
Message-ID: <YKPrfb8qQBAn5vYz@kroah.com>
References: <20210518162054.3697992-1-gregkh@linuxfoundation.org>
 <00cc26c8-313c-9573-7138-754d86f4ca81@zonque.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <00cc26c8-313c-9573-7138-754d86f4ca81@zonque.org>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, May 18, 2021 at 06:23:33PM +0200, Daniel Mack wrote:
> On 5/18/21 6:20 PM, Greg Kroah-Hartman wrote:
> > There is no need to store the dentry pointer for a debugfs file that we
> > only use to remove it when the device goes away.  debugfs can do the
> > lookup for us instead, saving us some trouble, and making things smaller
> > overall.
> > 
> > Cc: Daniel Mack <daniel@zonque.org>
> 
> Acked-by: Daniel Mack <daniel@zonque.org>
> 
> 
> Greg, can you take this via your tree?

Yes I can :)

thanks for the review,

greg k-h
