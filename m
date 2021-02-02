Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A20F730B845
	for <lists+linux-usb@lfdr.de>; Tue,  2 Feb 2021 08:06:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232332AbhBBHEW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 2 Feb 2021 02:04:22 -0500
Received: from mail.kernel.org ([198.145.29.99]:51310 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232348AbhBBHC5 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 2 Feb 2021 02:02:57 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4608D64EE2;
        Tue,  2 Feb 2021 07:02:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1612249336;
        bh=qsA8IwEh36Y/Ul+jowp9eTk/cmAdTbHCD/kgirKfb98=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=A5lqjOCfepqo7ehnpRBEqZ6vLevYFx1lui9ACkY+U5ovWuvgMz5s4h/9Oj31/PzlT
         b26sGmVXS+QVpnfmHsUc2/On2bIvdlfI3ruRRApQBbfnBYwygCxsiXO1BBjILPO0U6
         BeNnWJ63zMGeEDoZgqF4ArLNaDqjht9eND3SXPJA=
Date:   Tue, 2 Feb 2021 08:02:13 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Paul O'Riordan <reverselogic@gmail.com>
Cc:     Oliver Neukum <oneukum@suse.com>, linux-usb@vger.kernel.org
Subject: Re: [PATCH v1] USB: CDC-ACM race condition during acm_disconnect
Message-ID: <YBj49esCvU5IEMj2@kroah.com>
References: <CAGh4sj+VDbXo0fLkWRx220xDagfcWqHKb-r5fJcPnVqfON0SYQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGh4sj+VDbXo0fLkWRx220xDagfcWqHKb-r5fJcPnVqfON0SYQ@mail.gmail.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Feb 02, 2021 at 03:29:11AM +0000, Paul O'Riordan wrote:
> From: Paul O'Riordan <reverselogic@gmail.com>
> 
> This patch fixes a race condition between acm_disconnect and
> acm_read_bulk_callback. acm_read_bulk_callback may be called after the
> acm_disconnect function has been called resulting in kernel crashes
> 
> Signed-off-by: Paul O'Riordan <reverselogic@gmail.com>
> ---
> 

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

- Your patch is malformed (tabs converted to spaces, linewrapped, etc.)
  and can not be applied.  Please read the file,
  Documentation/email-clients.txt in order to fix this.

- Your patch was attached, please place it inline so that it can be
  applied directly from the email message itself.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
