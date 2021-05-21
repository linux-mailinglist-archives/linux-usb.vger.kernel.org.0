Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7FA2138C5EE
	for <lists+linux-usb@lfdr.de>; Fri, 21 May 2021 13:45:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232008AbhEULqk (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 21 May 2021 07:46:40 -0400
Received: from mail.kernel.org ([198.145.29.99]:36882 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231504AbhEULqj (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 21 May 2021 07:46:39 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9D374613AE;
        Fri, 21 May 2021 11:45:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1621597517;
        bh=NqVFWJ3RxYE+V+QetfPDCTkX5LZnuUkEyoz97648fqU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=E888BM+QVbYxecd1/xhm5HguXmDDn5GPr0qNAEIJ0vDXkl3bwruLcaApwcBAPaT4i
         LnmNM8tJHkqHoMORI2uII5qgem0BhtUXWsRRgq9JdiiIL0lcHWwGsjXxyrv15YUnh/
         oXfgKXPesD7HtqG1b+j/CrcSvowchtOWEmn7ohu0=
Date:   Fri, 21 May 2021 13:45:15 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Felipe Balbi <balbi@kernel.org>
Cc:     linux-usb@vger.kernel.org, Vladimir Zapolskiy <vz@mleia.com>
Subject: Re: [PATCH] USB: gadget: lpc32xx_udc: remove debugfs dentry variable
Message-ID: <YKedS1Wamc7zNwT6@kroah.com>
References: <20210518162035.3697860-1-gregkh@linuxfoundation.org>
 <87k0nv9bep.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87k0nv9bep.fsf@kernel.org>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, May 19, 2021 at 03:05:18PM +0300, Felipe Balbi wrote:
> Greg Kroah-Hartman <gregkh@linuxfoundation.org> writes:
> 
> > There is no need to store the dentry for a fixed filename that we have
> > the string for.  So just have debugfs look it up when we need it to
> > remove the file, no need to store it anywhere locally.
> >
> > Note, this driver is broken in that debugfs will not work for more than
> > one instance of the device it supports.  But given that this patch does
> > not change that, and no one has ever seemed to notice, it must not be an
> > issue...
> >
> > Cc: Felipe Balbi <balbi@kernel.org>
> > Cc: Vladimir Zapolskiy <vz@mleia.com>
> > Cc: linux-usb@vger.kernel.org
> > Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> 
> Acked-by: Felipe Balbi <balbi@kernel.org>

Great, thanks for the review.

greg k-h
