Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3FCA4D8EAA
	for <lists+linux-usb@lfdr.de>; Wed, 16 Oct 2019 12:54:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731578AbfJPKyS (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 16 Oct 2019 06:54:18 -0400
Received: from mail.kernel.org ([198.145.29.99]:50514 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726083AbfJPKyR (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 16 Oct 2019 06:54:17 -0400
Received: from localhost (unknown [209.136.236.94])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 824162067D;
        Wed, 16 Oct 2019 10:54:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1571223255;
        bh=yFzd53J4K2VB7WLByqAWeKHKRwRFjS6u0jt4bslhMbI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=PHpXkc0Rwa5omeBdC4gekAAL6HKvioRqL2J9e/WX8/GleZxWzR+FdCGvv7EmH4tsf
         Xn7mwFo0zCmJiOIi6gWyMeniVBa7PWzbHHuA3f6vQW4z5PWryMvLiRGMt50NsR1F4o
         JvEok6KCso4YIE0jMupjfr0Ja+uO1er1M/1jWCiQ=
Date:   Wed, 16 Oct 2019 02:18:15 -0700
From:   Greg KH <gregkh@linuxfoundation.org>
To:     pumahsu <pumahsu@google.com>
Cc:     heikki.krogerus@linux.intel.com, badhri@google.com,
        kyletso@google.com, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: typec: Add sysfs node to show cc orientation
Message-ID: <20191016091815.GA1175217@kroah.com>
References: <20191016034314.231363-1-pumahsu@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191016034314.231363-1-pumahsu@google.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Oct 16, 2019 at 11:43:14AM +0800, pumahsu wrote:
> Export the Type-C cc orientation so that user space can
> get this information.
> 
> Signed-off-by: pumahsu <pumahsu@google.com>
> ---
>  Documentation/ABI/testing/sysfs-class-typec |  7 +++++++
>  drivers/usb/typec/class.c                   | 11 +++++++++++
>  2 files changed, 18 insertions(+)

Hi,

This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent him
a patch that has triggered this response.  He used to manually respond
to these common problems, but in order to save his sanity (he kept
writing the same thing over and over, yet to different people), I was
created.  Hopefully you will not take offence and will fix the problem
in your patch and resubmit it so that it can be accepted into the Linux
kernel tree.

You are receiving this message because of the following common error(s)
as indicated below:

- It looks like you did not use your "real" name for the patch on either
  the Signed-off-by: line, or the From: line (both of which have to
  match).  Please read the kernel file, Documentation/SubmittingPatches
  for how to do this correctly.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
