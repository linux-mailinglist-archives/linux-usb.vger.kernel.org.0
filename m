Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1A6558EBBC
	for <lists+linux-usb@lfdr.de>; Thu, 15 Aug 2019 14:42:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731703AbfHOMmE (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 15 Aug 2019 08:42:04 -0400
Received: from mail.kernel.org ([198.145.29.99]:34108 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725977AbfHOMmE (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 15 Aug 2019 08:42:04 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id EC5692084D;
        Thu, 15 Aug 2019 12:42:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1565872923;
        bh=Fs4BzkJvrJrfQMAEr386HjecxX0kE83h+eyln2fEU70=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=sN+vZD78RiF8Gmu3YvjeKVcRTt8dpUE61TMxT/fiuYxYDlI7VXJfnmx4pPeGPRpcH
         p+I5ZwfjJaY+UX3bt2d/vk4L+cBR3KFcu4EvIk0FjpLRi8Y6Qnd+thnnq0gNHYPIkG
         KihHHOYBp5DNlfuLhTDSyL6+nY6HPvNU1XVgD5sc=
Date:   Thu, 15 Aug 2019 14:42:01 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     soc@kernel.org, Vladimir Zapolskiy <vz@mleia.com>,
        Sylvain Lemieux <slemieux.tyco@gmail.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Alan Stern <stern@rowland.harvard.edu>,
        Felipe Balbi <felipe.balbi@linux.intel.com>,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH v2 01/13] usb: ohci-nxp: enable compile-testing
Message-ID: <20190815124201.GA30054@kroah.com>
References: <20190809144043.476786-1-arnd@arndb.de>
 <20190809144043.476786-2-arnd@arndb.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190809144043.476786-2-arnd@arndb.de>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Aug 09, 2019 at 04:40:27PM +0200, Arnd Bergmann wrote:
> The driver hardcodes a hardware I/O address the way one should
> generally not do, and this prevents both compile-testing, and
> moving the platform to CONFIG_ARCH_MULTIPLATFORM.
> 
> Change the code to be independent of the machine headers
> to allow those two. Removing the hardcoded address would
> be hard and is not necessary, so leave that in place for now.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/usb/host/Kconfig    |  3 ++-
>  drivers/usb/host/ohci-nxp.c | 25 ++++++++++++++++++-------
>  2 files changed, 20 insertions(+), 8 deletions(-)

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
