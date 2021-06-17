Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 622163AB794
	for <lists+linux-usb@lfdr.de>; Thu, 17 Jun 2021 17:35:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232495AbhFQPhI (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 17 Jun 2021 11:37:08 -0400
Received: from mail.kernel.org ([198.145.29.99]:51622 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231661AbhFQPhH (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 17 Jun 2021 11:37:07 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id CCB76613E3;
        Thu, 17 Jun 2021 15:34:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1623944099;
        bh=t4cqAotYFIZ9hB+jZeUS/qHr4r4rUoGAB2wzu7Ziro0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=TetBQJVuGcDP9+fEtcAQJFS5Qde+zVWUIvaLKcZIJSnwXed2m44u0uw3edbN0cu2G
         x5qYd/0uq9xEjG/t9o/SPD5BE5/wI7js3rGK4IMK3EJamvSZ4pUj4PS56oX0+hvKPk
         M5z85bIZFPfnAY6ykchz+1CT6WKmk1zZ22O/iCcU=
Date:   Thu, 17 Jun 2021 17:34:57 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Mathias Nyman <mathias.nyman@linux.intel.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [PATCH 0/4] xhci features for usb-next
Message-ID: <YMtroYzBimzT8tCz@kroah.com>
References: <20210617150354.1512157-1-mathias.nyman@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210617150354.1512157-1-mathias.nyman@linux.intel.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Jun 17, 2021 at 06:03:50PM +0300, Mathias Nyman wrote:
> Hi Greg
> 
> A few small patches for usb-next.
> 
> There's one double free fix here as well that I normally would send to
> usb-linus, but we're late in the cycle and this issue should be rare.
> It has been there since 5.6 and requires system to be out of memory, so
> I thought it can be added this way.

Yes, that's fine, all now applied, thanks.

greg k-h
