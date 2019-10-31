Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DB3ADEAABA
	for <lists+linux-usb@lfdr.de>; Thu, 31 Oct 2019 07:48:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726864AbfJaGsy (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 31 Oct 2019 02:48:54 -0400
Received: from mail.kernel.org ([198.145.29.99]:38908 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726479AbfJaGsy (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 31 Oct 2019 02:48:54 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 82DAF2083E;
        Thu, 31 Oct 2019 06:48:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1572504533;
        bh=PWuDB8W5mWU2KdAnWDI61+VoPXli611Ab9ivIcC4oYw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=BvyV7dcpTkYgJ7ThJLalOn6gpehVZ/jx/n39ihnqBufn0uk5AHyiBVfY8ULIgvXkn
         N6YhNI6siUXXawmWovt7edVe1C8KHws22VFg4bUus6rv0Gl4KGXbmc4YtSq0/tVEVR
         QCAunPRDLSkaI7AdWKaOviTmHHFyDJ4lXOJYe2Fw=
Date:   Thu, 31 Oct 2019 07:48:49 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Pavel =?iso-8859-1?Q?L=F6bl?= <pavel@loebl.cz>
Cc:     linux-usb@vger.kernel.org, Johan Hovold <johan@kernel.org>
Subject: Re: [PATCH] usb: serial: mos7840: Add USB ID to support Moxa UPort
 2210
Message-ID: <20191031064849.GD727325@kroah.com>
References: <20191030195253.32579-1-pavel@loebl.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20191030195253.32579-1-pavel@loebl.cz>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Oct 30, 2019 at 08:52:53PM +0100, Pavel Löbl wrote:
> Adds usb ID for MOXA UPort 2210. This device contains mos7820 but
> it passes GPIO0 check implemented by driver and it's detected as
> mos7840. Hence product id check is added to force mos7820 mode.
> ---
>  drivers/usb/serial/mos7840.c | 9 +++++++++
>  1 file changed, 9 insertions(+)

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
