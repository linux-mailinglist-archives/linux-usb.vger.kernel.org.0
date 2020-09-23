Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 29A27275216
	for <lists+linux-usb@lfdr.de>; Wed, 23 Sep 2020 09:03:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726641AbgIWHD4 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 23 Sep 2020 03:03:56 -0400
Received: from mail.kernel.org ([198.145.29.99]:35906 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726550AbgIWHD4 (ORCPT <rfc822;Linux-usb@vger.kernel.org>);
        Wed, 23 Sep 2020 03:03:56 -0400
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 62490221F0;
        Wed, 23 Sep 2020 07:03:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600844636;
        bh=qjnHMHs225EUMDmM12dcPzI9fQNIZsjXwocbJanyrgE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=o2mxGMqStZev892VgYJ/DZiCUk6WvSheVqNM+Ruldc8YxHhC7/VTCbmHOTBAw38oK
         /RbG3Hc4RZu7Bc510HgZ8/vUTridBubAKsHZrjS+fI5cNV1dvzrht4EfOtVixS4xS8
         //7drUT1273uTi08vbi0txhFEZ8Jj29Amccx988w=
Date:   Wed, 23 Sep 2020 09:04:15 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     GARG Shivam <shivam.garg@thalesgroup.com>
Cc:     "Linux-usb@vger.kernel.org" <Linux-usb@vger.kernel.org>,
        Peter Chen <hzpeterchen@gmail.com>
Subject: Re: Linux Crash with Gadget serial driver
Message-ID: <20200923070415.GA2736466@kroah.com>
References: <MRXP264MB0904FFAD5E50E6A6F4AB6419F8570@MRXP264MB0904.FRAP264.PROD.OUTLOOK.COM>
 <CAL411-oBThK1PqKWhbdUSEsCuApi6CWT5wzxye6P6RXsQuXhfg@mail.gmail.com>
 <MRXP264MB09048712EAB615DD8CF7AF5BF8540@MRXP264MB0904.FRAP264.PROD.OUTLOOK.COM>
 <20200826093534.GA2474406@kroah.com>
 <MRXP264MB09044A6FBB51DFFB273EA6B1F8380@MRXP264MB0904.FRAP264.PROD.OUTLOOK.COM>
 <20200923064402.GA2732582@kroah.com>
 <MRXP264MB0904FE7CD168F36F476A877EF8380@MRXP264MB0904.FRAP264.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <MRXP264MB0904FE7CD168F36F476A877EF8380@MRXP264MB0904.FRAP264.PROD.OUTLOOK.COM>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Sep 23, 2020 at 06:51:52AM +0000, GARG Shivam wrote:
> Actually, we are using USB-C port at my host but vendor does not support USB-C. It is a customization that we did at our end in the hardware.
> 
> That is the reason, we are stuck a between Yacto and freebsd. If just, want to stop the kernel crash.

I understand the problem, but you are working with a heavily modified
and patched version of a kernel that was released over 5 years and
430277 changes ago.  An almost impossible task to debug for us, don't
you think?

good luck!

greg k-h
