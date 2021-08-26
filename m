Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 082E33F861B
	for <lists+linux-usb@lfdr.de>; Thu, 26 Aug 2021 13:08:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241924AbhHZLJP (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 26 Aug 2021 07:09:15 -0400
Received: from mail.kernel.org ([198.145.29.99]:55422 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S242042AbhHZLJL (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 26 Aug 2021 07:09:11 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6228261053;
        Thu, 26 Aug 2021 11:08:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1629976104;
        bh=7MgiBerEg4y0eqYDUAvAgoKEWM6qzoY6MXkKpPJR6lc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=WYGulW7ZuEDQ1LI1Svidf1lzrPrf0uRbA1m1eIGdzXnk25FzTvgWTYNdevW0QuhUZ
         IDi1FL+4FdrH5DrQs73IQNRcl7JU0CBMKdZOfQN0Sa43nf8JeySujNrFzNIizpptsN
         m5E965VgvilUPsEWzBnXIi5LQZyAH8Zpv7Bf+Dkk=
Date:   Thu, 26 Aug 2021 13:08:19 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Takashi Iwai <tiwai@suse.de>
Cc:     Mathias Nyman <mathias.nyman@intel.com>,
        Moritz Fischer <mdf@kernel.org>, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: renesas-xhci: Prefer firmware loading on unknown
 ROM state
Message-ID: <YSd2I4IoFr00m3Vw@kroah.com>
References: <20210819113427.1166-1-tiwai@suse.de>
 <s5hilzswldm.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <s5hilzswldm.wl-tiwai@suse.de>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Aug 26, 2021 at 12:28:21PM +0200, Takashi Iwai wrote:
> On Thu, 19 Aug 2021 13:34:27 +0200,
> Takashi Iwai wrote:
> > 
> > The recent attempt to handle an unknown ROM state in the commit
> > d143825baf15 ("usb: renesas-xhci: Fix handling of unknown ROM state")
> > resulted in a regression and reverted later by the commit 44cf53602f5a
> > ("Revert "usb: renesas-xhci: Fix handling of unknown ROM state"").
> > The problem of the former fix was that it treated the failure of
> > firmware loading as a fatal error.  Since the firmware files aren't
> > included in the standard linux-firmware tree, most users don't have
> > them, hence they got the non-working system after that.  The revert
> > fixed the regression, but also it didn't make the firmware loading
> > triggered even on the devices that do need it.  So we need still a fix
> > for them.
> > 
> > This is another attempt to handle the unknown ROM state.  Like the
> > previous fix, this also tries to load the firmware when ROM shows
> > unknown state.  In this patch, however, the failure of a firmware
> > loading (such as a missing firmware file) isn't handled as a fatal
> > error any longer when ROM has been already detected, but it falls back
> > to the ROM mode like before.  The error is returned only when no ROM
> > is detected and the firmware loading failed.
> > 
> > Along with it, for simplifying the code flow, the detection and the
> > check of ROM is factored out from renesas_fw_check_running() and done
> > in the caller side, renesas_xhci_check_request_fw().  It avoids the
> > redundant ROM checks.
> > 
> > The patch was tested on Lenovo Thinkpad T14 gen (BIOS 1.34).  Also it
> > was confirmed that no regression is seen on another Thinkpad T14
> > machine that has worked without the patch, too.
> > 
> > Fixes: 44cf53602f5a ("Revert "usb: renesas-xhci: Fix handling of unknown ROM state"")
> > BugLink: https://bugzilla.opensuse.org/show_bug.cgi?id=1189207
> > Signed-off-by: Takashi Iwai <tiwai@suse.de>
> 
> A gentle ping to confirm whether this gets a review or not.

Given no one else objected, I'll go take it now, thanks.

greg k-h
