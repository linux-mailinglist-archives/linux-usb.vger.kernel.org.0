Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 68075BB1FB
	for <lists+linux-usb@lfdr.de>; Mon, 23 Sep 2019 12:12:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406882AbfIWKM0 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 23 Sep 2019 06:12:26 -0400
Received: from mail.kernel.org ([198.145.29.99]:39820 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727141AbfIWKM0 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 23 Sep 2019 06:12:26 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id BD4C920820;
        Mon, 23 Sep 2019 10:12:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1569233544;
        bh=Nr40EapTU5JcbOJfKA8mtNj/BMy9MSn/LUALaTpz13A=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=N5gpC1JmLvIAXDGwo4SKZEPElpgYSt++0+CQaSXqwrcYCQYGddeE8r6QvCYG6sDWU
         iFmuD+plRDFFWDUZiPMKdNJenBjoGApQYgCIiDD/h0HkRiRxneEny2RijX1cF7m+1x
         gpL9kHzcMQn/MB3b0G6PzoIWcwEsga3snFJ7m4ww=
Date:   Mon, 23 Sep 2019 12:12:21 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Daniele Palmas <dnlplm@gmail.com>
Cc:     Johan Hovold <johan@kernel.org>, linux-usb@vger.kernel.org
Subject: Re: [PATCH 1/1] usb: serial: option: add Telit FN980 compositions
Message-ID: <20190923101221.GB2763897@kroah.com>
References: <20190923095142.10047-1-dnlplm@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190923095142.10047-1-dnlplm@gmail.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Sep 23, 2019 at 11:51:42AM +0200, Daniele Palmas wrote:
> This patch adds the following Telit FN980 compositions:
> 
> 0x1050: tty, adb, rmnet, tty, tty, tty, tty
> 0x1051: tty, adb, mbim, tty, tty, tty, tty
> 0x1052: rndis, tty, adb, tty, tty, tty, tty
> 0x1053: tty, adb, ecm, tty, tty, tty, tty
> ---

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

- Your patch does not have a Signed-off-by: line.  Please read the
  kernel file, Documentation/SubmittingPatches and resend it after
  adding that line.  Note, the line needs to be in the body of the
  email, before the patch, not at the bottom of the patch or in the
  email signature.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
