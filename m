Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AF9FC1DA9F7
	for <lists+linux-usb@lfdr.de>; Wed, 20 May 2020 07:35:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726463AbgETFfx (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 20 May 2020 01:35:53 -0400
Received: from mail.kernel.org ([198.145.29.99]:41384 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726309AbgETFfw (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 20 May 2020 01:35:52 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id DC0612075F;
        Wed, 20 May 2020 05:35:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1589952952;
        bh=CSrKo7EwSHCHbAg+maPzrZYBezc3cvA8M70kudXqMp8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=1JBuSIwbuuotWnW3haCQvbdCMVJQF94FUxbVVEWXOfbdK+Nc/umP5qXEqWd0kcj3U
         NUILif0QNl165aS1cXmdFNEAW0+v3UI2IBqlG5CosQCCb41FP1UQmRty/j11qg1pSJ
         0oF1X26SIQyXvSRdBfGovfaPZ2Y4F9CyirgKj55s=
Date:   Wed, 20 May 2020 07:35:49 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Oliver Neukum <oneukum@suse.com>
Cc:     Johan Hovold <johan@kernel.org>, linux-usb@vger.kernel.org
Subject: Re: question on tty_operations->flush_char()
Message-ID: <20200520053549.GA2172873@kroah.com>
References: <1589902789.6470.8.camel@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1589902789.6470.8.camel@suse.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, May 19, 2020 at 05:39:49PM +0200, Oliver Neukum wrote:
> Hi,
> 
> is the flush_char() opertion of tty_operations allowed to sleep?

"flush_chars"?

I am pretty sure, given that the caller locations of it sleep before
they call it.  I thought I documented stuff like that a long time ago,
maybe not :(

thanks,

greg k-h
