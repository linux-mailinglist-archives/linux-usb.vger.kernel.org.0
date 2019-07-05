Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2AD3F6008A
	for <lists+linux-usb@lfdr.de>; Fri,  5 Jul 2019 07:19:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726061AbfGEFTD (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 5 Jul 2019 01:19:03 -0400
Received: from mail.kernel.org ([198.145.29.99]:59088 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725778AbfGEFTD (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 5 Jul 2019 01:19:03 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1D295218A0;
        Fri,  5 Jul 2019 05:19:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1562303942;
        bh=7e/bH7EgTT0KFsBceMi0WQk/n8T0fNBn8sy979earwc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=gYJdxWCHsG6x3bHTjUgANRXS+SGBvOKPylsPhjRkb8kNXAWW/jX9mgspbXDygExVj
         dYA63jNKEBSZjkVjtLu1KH/f+kFhwY0bx3GHq0jbZkabQCrzlC8TUgNnPB4qggKfPh
         8tEKOlZMqBDM3nHghvNf36XOuhVecWWSPHrXvhmY=
Date:   Fri, 5 Jul 2019 07:18:59 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Charles Yeh <charlesyeh522@gmail.com>
Cc:     Johan Hovold <johan@kernel.org>, linux-usb@vger.kernel.org,
        =?utf-8?B?WWVoLkNoYXJsZXMgW+iRieamrumRq10=?= 
        <charles-yeh@prolific.com.tw>
Subject: Re: [PATCH] [PATCH v7] USB: serial: pl2303: Add new PID to support
 PL2303HXN (TYPE_HXN)
Message-ID: <20190705051859.GB15821@kroah.com>
References: <20190702123006.11320-1-charlesyeh522@gmail.com>
 <CAAZvQQ6pxvhVKsH1oOwToF1n=rYAbShzVnPBGowZhivO2NYPiQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAZvQQ6pxvhVKsH1oOwToF1n=rYAbShzVnPBGowZhivO2NYPiQ@mail.gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-usb-owner@vger.kernel.org
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

On Fri, Jul 05, 2019 at 10:57:11AM +0800, Charles Yeh wrote:
> Is there any need to modify it?
> If there is no need to modify, how long does it take to complete REVIEW?

Please be patient, only ask after a week or two, all of us have lots and
lots of other patches to also review.

thanks,

greg k-h
