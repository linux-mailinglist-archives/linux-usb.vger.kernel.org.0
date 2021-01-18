Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E16A12FA228
	for <lists+linux-usb@lfdr.de>; Mon, 18 Jan 2021 14:52:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392294AbhARNud (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 18 Jan 2021 08:50:33 -0500
Received: from mail.kernel.org ([198.145.29.99]:36708 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2392371AbhARNhH (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 18 Jan 2021 08:37:07 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 451292065E;
        Mon, 18 Jan 2021 13:36:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1610976979;
        bh=d3oB+IyrdTZjd9dYUCcoq6XGrhXqe0T2v1A10LVIZ+k=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=IdXGWIPPZUvBz1HCkF7cZkNCOpIkae0Wlgv22ojH3g40gyfZkhj8Ihq/uvAl01+LD
         knbO0PI7GAk/+uv8wcceRV/8f0v+jb+t/GAF8H2FPDL9NH1aOFy56ElmPUln6tGXRl
         1kTIFg8WPRF4hpVkxL8rysGHv9gxbqkcAXrjLDeq4iN47HLDI3GiKjYW5wt6aJjaMv
         KtdhgYvhJU1i38maGUz0a3psMqUHPeFiJkOTkCfkSOsIfvAK29ar7yhScXkkdaTpdy
         ocgArysGGW00EhvKI5HQSY0hzsLL0XPDitb4Bg7x4fOp1ofUEWEXd7GPnIpc/BJKuw
         ZRkSYvLkPF2DQ==
Received: from johan by xi with local (Exim 4.93.0.4)
        (envelope-from <johan@kernel.org>)
        id 1l1Uhl-0004ZV-Tq; Mon, 18 Jan 2021 14:36:25 +0100
Date:   Mon, 18 Jan 2021 14:36:25 +0100
From:   Johan Hovold <johan@kernel.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Johan Hovold <johan@kernel.org>, linux-usb@vger.kernel.org
Subject: Re: [PATCH 0/6] USB: serial: drop short control-transfer checks
Message-ID: <YAWO2T54rv1jNefD@hovoldconsulting.com>
References: <20210118111426.5147-1-johan@kernel.org>
 <YAWDJN8B03VU4sOw@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YAWDJN8B03VU4sOw@kroah.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Jan 18, 2021 at 01:46:28PM +0100, Greg Kroah-Hartman wrote:
> On Mon, Jan 18, 2021 at 12:14:20PM +0100, Johan Hovold wrote:
> > There's no need to check for short control transfers when sending data
> > so remove the redundant sanity checks from the drivers that had them.
> 
> It seems impossible to do a "short write", so I wonder why we even check
> it...

Right, and this series removes precisely those redundant checks. Or what
did you mean? :)

> Anyway, nice cleanups:
> 
> Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Thanks for reviewing, now applied.

Johan
