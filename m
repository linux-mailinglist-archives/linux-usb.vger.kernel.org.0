Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D6562B28BC
	for <lists+linux-usb@lfdr.de>; Fri, 13 Nov 2020 23:46:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726274AbgKMWqi (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 13 Nov 2020 17:46:38 -0500
Received: from mail.kernel.org ([198.145.29.99]:38342 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726278AbgKMWqi (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 13 Nov 2020 17:46:38 -0500
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4A1DE20825;
        Fri, 13 Nov 2020 22:46:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1605307597;
        bh=sAHfBWYsmVHR+SfGB/ln/MCDla0n1I2DT5/kzKpNhe8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=B2fCmjrrbXF0xrN0qS6XMm+4Hj//UETsVgUZyFZTHWUXr6eObcHsNgZXagEUMZF7i
         IRUV63HwnNuNPj+ZJ1PYunJ33/u3KdlNuS1lbSCJriIWj8T4D8gBCvcAYtK1cGOMpH
         FyR7ThmY7SEatk9nsGoRPs5W95RcFOAcr/RImVY0=
Date:   Fri, 13 Nov 2020 23:47:33 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc:     linux-usb@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH] usb: Remove RUN_CONTEXT
Message-ID: <X68NBdTy2F/IeZ2Y@kroah.com>
References: <20201113212704.2243807-1-bigeasy@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201113212704.2243807-1-bigeasy@linutronix.de>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Nov 13, 2020 at 10:27:04PM +0100, Sebastian Andrzej Siewior wrote:
> The last user of RUN_CONTEXT was removed in commit
>    97c17beb3b668 ("[PATCH] ehci-hcd (1/2):  portability (2.4), tasklet,")

I don't see that git commit id in Linus's tree, nor in my usb.git tree.
Where does it live?

thanks,

greg k-h
