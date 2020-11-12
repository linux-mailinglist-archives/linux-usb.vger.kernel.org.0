Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 46E992AFFD4
	for <lists+linux-usb@lfdr.de>; Thu, 12 Nov 2020 07:44:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726287AbgKLGo4 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 12 Nov 2020 01:44:56 -0500
Received: from mail.kernel.org ([198.145.29.99]:53484 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725959AbgKLGov (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 12 Nov 2020 01:44:51 -0500
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C78C8208FE;
        Thu, 12 Nov 2020 06:44:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1605163491;
        bh=ms84zS6nvXOPPy9ZCb5VdcXF53wCiDUhfQzWcrbNnOM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=PII7FtK7S28rWp8JCWJYiQOERkNbXdK44WUuirJft0/BeTWwzmqWLBq1soiPRFxKl
         Z5qq1p2WoBNvlCEXnEZModj1CUMVzsirCURsXlipW8DkPxTURgSGBaiVpyN7I5DMl1
         nS4kwbSJn8zo5JLraO7q9LcvqXSacIvqg4B0QbWs=
Date:   Thu, 12 Nov 2020 07:45:50 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc:     Alan Stern <stern@rowland.harvard.edu>, linux-usb@vger.kernel.org,
        usb-storage@lists.one-eyed-alien.net,
        clang-built-linux@googlegroups.com, Tom Rix <trix@redhat.com>,
        Nathan Chancellor <natechancellor@gmail.com>
Subject: Re: Use of uninitialized data in special error case of usb storage
 transport
Message-ID: <X6zaHl/RhW5xu89K@kroah.com>
References: <alpine.DEB.2.21.2011112146110.13119@felia>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.2011112146110.13119@felia>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Nov 11, 2020 at 10:08:26PM +0100, Lukas Bulwahn wrote:
> Dear Alan, dear Greg,
> 
> 
> here is a quick report from the static analysis tool clang-analyzer on 
> ./drivers/usb/storage/transport.c:
> 
> When usb_stor_bulk_transfer_sglist() returns with USB_STOR_XFER_ERROR, it 
> returns without writing to its parameter *act_len.
> 
> Further, the two callers of usb_stor_bulk_transfer_sglist():
> 
>     usb_stor_bulk_srb() and
>     usb_stor_bulk_transfer_sg(),
> 
> use the passed variable partial without checking the return value. Hence, 
> the uninitialized value of partial is then used in the further execution 
> of those two functions.
> 
> Clang-analyzer detects this potential control and data flow and warns:
> 
> drivers/usb/storage/transport.c:469:40: warning: The right operand of '-' 
> is a garbage value [clang-analyzer-core.UndefinedBinaryOperatorResult]
>         scsi_set_resid(srb, scsi_bufflen(srb) - partial);
>                                               ^
> 
> drivers/usb/storage/transport.c:495:15: warning: Assigned value is garbage 
> or undefined [clang-analyzer-core.uninitialized.Assign]
>                 length_left -= partial;
>                             ^
> 
> The tool is right; unfortunately, I do not know anything about the   
> intended function here. What is the further operation of those two  
> functions supposed to be when USB_STOR_XFER_ERROR is returned from 
> usb_stor_bulk_transfer_sglist()? Should the passed arguments remain 
> untouched, so setting *act_len to zero for the error paths would be
> a suitable fix to achieve that.
> 
> A quick hint on that point and I can prepare a patch for you to pick up...
> 
> Given that this code is pretty stable for years and probably in wider  
> use, the overall functionality is probably resilient to having this local 
> data being filled with arbitrary undefined data in the error case... but 
> who knows...

Sounds reasonable, testing error paths of "short reads" is something
that people are now only starting to notice and work to resolve.
Patches to resolve this are always gladly appreciated!

thanks,

greg k-h
