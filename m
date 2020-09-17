Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 276C026D4D2
	for <lists+linux-usb@lfdr.de>; Thu, 17 Sep 2020 09:38:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726198AbgIQHiA (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 17 Sep 2020 03:38:00 -0400
Received: from mail.kernel.org ([198.145.29.99]:38336 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726142AbgIQHh6 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 17 Sep 2020 03:37:58 -0400
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id F09C82072E;
        Thu, 17 Sep 2020 07:37:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600328278;
        bh=FjSv8XEEoWrIMEanxIPT/0Qq1UiQIZi7fTyweXh+MrE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=lBxEr6zqOvX/1KOUDTxfvdHhepQeC2lcCD+APU7zie8biWAFQjrJ9K9bFM7s8ZIsa
         jAAt7zRXaCOcjvgkwe345rnZNBUpKm1LEEMIKESo4Ja/of2gHtWaxd8f2eYKgYdiTB
         PgYFQnTlBAXr/KP64fddduizEG/0iD/O13hsfocA=
Date:   Thu, 17 Sep 2020 09:38:31 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc:     Florian Fainelli <f.fainelli@gmail.com>, balbi@kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        bcm-kernel-feedback-list@broadcom.com, matthias.bgg@gmail.com,
        swboyd@chromium.org, linux-arm-kernel@lists.infradead.org,
        alcooperx@gmail.com
Subject: Re: [PATCH] MAINTAINERS: Add entry for Broadcom BDC driver
Message-ID: <20200917073831.GB3217334@kroah.com>
References: <20200710034806.15650-1-f.fainelli@gmail.com>
 <830cd104-87de-4246-35ff-47a0ed5b05a9@gmail.com>
 <1600325394.20109.16.camel@mhfsdcap03>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1600325394.20109.16.camel@mhfsdcap03>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Sep 17, 2020 at 02:49:54PM +0800, Chunfeng Yun wrote:
> On Sun, 2020-09-06 at 12:55 -0700, Florian Fainelli wrote:
> > 
> > On 7/9/2020 8:48 PM, Florian Fainelli wrote:
> > > The Broadcom BDC driver did not have a MAINTAINERS entry which made it
> > > escape review from Al and myself, add an entry so the relevant mailing
> > > lists and people are copied.
> > > 
> > > Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
> > 
> > This patch still does not seem to have been picked up (not seeing it in 
> > linux-next), can this be applied so we have an accurate maintainer 
> > information for this driver?
> Ping

Felipe should have picked this up.

If not, please resend it again and I can.

thanks,

greg k-h
