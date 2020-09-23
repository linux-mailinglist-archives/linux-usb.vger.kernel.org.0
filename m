Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EDA4E2751C1
	for <lists+linux-usb@lfdr.de>; Wed, 23 Sep 2020 08:43:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726647AbgIWGno (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 23 Sep 2020 02:43:44 -0400
Received: from mail.kernel.org ([198.145.29.99]:54420 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726550AbgIWGnn (ORCPT <rfc822;Linux-usb@vger.kernel.org>);
        Wed, 23 Sep 2020 02:43:43 -0400
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D69C520756;
        Wed, 23 Sep 2020 06:43:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600843423;
        bh=1uTQthKKzIwpHKo9zXSpMM7jd41KWyV09j3YIdPkmIg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=JKQAxf/OtrQhfounKpJZj/nyCQoKY4Xn981aih268aQV1PkgdVUobXHaV0k1j323M
         yhrO1F2klzDaVe1Eo7uu8nl94rNZj2EmC254boaRxbMkZLeMlaBlVahN+M9iA/yCul
         MyKylw+yeC0ohcS7RnfY8jcI0/nnktihmqHaDd8s=
Date:   Wed, 23 Sep 2020 08:44:02 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     GARG Shivam <shivam.garg@thalesgroup.com>
Cc:     "Linux-usb@vger.kernel.org" <Linux-usb@vger.kernel.org>,
        Peter Chen <hzpeterchen@gmail.com>
Subject: Re: Linux Crash with Gadget serial driver
Message-ID: <20200923064402.GA2732582@kroah.com>
References: <MRXP264MB0904FFAD5E50E6A6F4AB6419F8570@MRXP264MB0904.FRAP264.PROD.OUTLOOK.COM>
 <CAL411-oBThK1PqKWhbdUSEsCuApi6CWT5wzxye6P6RXsQuXhfg@mail.gmail.com>
 <MRXP264MB09048712EAB615DD8CF7AF5BF8540@MRXP264MB0904.FRAP264.PROD.OUTLOOK.COM>
 <20200826093534.GA2474406@kroah.com>
 <MRXP264MB09044A6FBB51DFFB273EA6B1F8380@MRXP264MB0904.FRAP264.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <MRXP264MB09044A6FBB51DFFB273EA6B1F8380@MRXP264MB0904.FRAP264.PROD.OUTLOOK.COM>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Sep 23, 2020 at 06:36:40AM +0000, GARG Shivam wrote:
> Hi All,
> 
> I agree it is an old kernel but still can you look into the backtrace and guide me how I can proceed to stop the host crash.

You are on your own here, sorry.  Please work with the company that you
are paying to give you support for such an old and obsolete and insecure
kernel tree.  You don't want that money to go to waste, right?  :)

good luck!

greg k-h
