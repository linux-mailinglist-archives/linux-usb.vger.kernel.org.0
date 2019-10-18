Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 331C0DCEC8
	for <lists+linux-usb@lfdr.de>; Fri, 18 Oct 2019 20:55:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2439849AbfJRSzj (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 18 Oct 2019 14:55:39 -0400
Received: from mail.kernel.org ([198.145.29.99]:55682 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726421AbfJRSzj (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 18 Oct 2019 14:55:39 -0400
Received: from localhost (unknown [38.98.37.137])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 69C1920640;
        Fri, 18 Oct 2019 18:55:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1571424937;
        bh=V2+NofitCA5skYH+5u+Gxxf7f1kn/YBPB2hxdGGU5vQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ynO1p4paeBDDcGtdH4OBkRF9mLXBXfEXuas82Gn7NEnkj5/pJsIVC669civBI3OOR
         Op52Jn4RikPL3bIkFE+onkkC5+WRGfKJk6Sx5zvmR2oLgeh8TZE3HTxSA+uiyvJfsf
         f5G1vRCVfMmux0+bVBmkwMtAJ7l4f9tkWr4kTW88=
Date:   Fri, 18 Oct 2019 11:55:12 -0700
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Johan Hovold <johan@kernel.org>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [GIT PULL] USB-serial fixes for 5.4-rc4
Message-ID: <20191018185512.GA1192379@kroah.com>
References: <20191018153953.GA10551@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191018153953.GA10551@localhost>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Oct 18, 2019 at 05:39:53PM +0200, Johan Hovold wrote:
> The following changes since commit 4f5cafb5cb8471e54afdc9054d973535614f7675:
> 
>   Linux 5.4-rc3 (2019-10-13 16:37:36 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial.git tags/usb-serial-5.4-rc4

Pulled and pushed out, thanks.

greg k-h
