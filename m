Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1ADC23E3393
	for <lists+linux-usb@lfdr.de>; Sat,  7 Aug 2021 07:20:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230150AbhHGFUx (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 7 Aug 2021 01:20:53 -0400
Received: from mail.kernel.org ([198.145.29.99]:33546 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229718AbhHGFUx (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sat, 7 Aug 2021 01:20:53 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4C14D61159;
        Sat,  7 Aug 2021 05:20:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1628313636;
        bh=griKqQEBJ96E5biCQlMX86YI9iChBIKmKaGqT1w7S3Y=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=E6kRSQkEFToi1ps0QWhZfCnkyhGKVdTZo/x/GxKpGv3O3iMYbmt4ljwP6QI9AyFWt
         PKc3g+sydEqOB3ZTJoq+Ap8HFLda/VGJPwHvOS13NImoi00meoKBdoX0xSIg880GI8
         ssMR8w6P9i5RXRxKv9GgW1pEvNRLwfjSsQXowajs=
Date:   Sat, 7 Aug 2021 07:20:32 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     nil Yi <teroincn@gmail.com>
Cc:     johan@kernel.org, linux-usb@vger.kernel.org
Subject: Re: [BUG]drivers: usb: serial: mos7840.c: dangling pointer in
 function mos7840_open
Message-ID: <YQ4YIM0r8JwY0yw7@kroah.com>
References: <CANTwqXBzZaPGomgsy00RhgTHvETWEXg_ZiL1ujgKmEU2TUsc_A@mail.gmail.com>
 <YQaQU0hkHQRcdjRC@kroah.com>
 <CANTwqXCOBTWPyfS5yBpV2BQDrTYEevPUp8pGVtDg7d0ivM70gg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANTwqXCOBTWPyfS5yBpV2BQDrTYEevPUp8pGVtDg7d0ivM70gg@mail.gmail.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

A: http://en.wikipedia.org/wiki/Top_post
Q: Were do I find info about this thing called top-posting?
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?
A: Top-posting.
Q: What is the most annoying thing in e-mail?

A: No.
Q: Should I include quotations after my reply?

http://daringfireball.net/2007/07/on_top


On Sat, Aug 07, 2021 at 11:45:54AM +0800, nil Yi wrote:
> Sorry for the ambiguous description. I mean after usb_free_urb(urb) at line 723,
> do we need set NULL to mos7840_port->write_urb_pool[j], otherwise the
> freed urb pointer
> may be used somewhere?

How exactly could it be "used somewhere"?  I do not understand the
problem that you are trying to point out here.  Perhaps you could make a
patch to show how you think it needs to be fixed?

thanks,

greg k-h
