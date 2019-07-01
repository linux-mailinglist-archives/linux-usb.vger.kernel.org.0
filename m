Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 671CB24810
	for <lists+linux-usb@lfdr.de>; Tue, 21 May 2019 08:29:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726719AbfEUG3P (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 21 May 2019 02:29:15 -0400
Received: from mail.kernel.org ([198.145.29.99]:55458 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726193AbfEUG3O (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 21 May 2019 02:29:14 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id AC7B8217D8;
        Tue, 21 May 2019 06:29:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1558420154;
        bh=bN37WpgUZd6TY579JnL+mvLtP9wubXMAhz5jf7nWpRo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=WqkXl/djcwAkRr+JrG4uDcfEphZStfHScyT0pZzJZpJ5EKWYh1uejyuKH9N/6ANCJ
         ylSAc0/7CeY4BABS5i52904oi1dgWmm54U+LFtFL4sAgKzeUideHAyqT2Nw+oahAxw
         O1AeKxFnZeiWyhADcJr708rtrKleL+KEASpfzFis=
Date:   Tue, 21 May 2019 08:29:11 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Weitao Hou <houweitaoo@gmail.com>
Cc:     robh+dt@kernel.org, mark.rutland@arm.com,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: fix typos in code comments
Message-ID: <20190521062911.GA5791@kroah.com>
References: <20190519035542.22094-1-houweitaoo@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190519035542.22094-1-houweitaoo@gmail.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sun, May 19, 2019 at 11:55:42AM +0800, Weitao Hou wrote:
> fix lenght to length
> 
> Signed-off-by: Weitao Hou <houweitaoo@gmail.com>
> ---
>  Documentation/devicetree/bindings/usb/s3c2410-usb.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

You sent 2 different patches that do different things, yet have
identical subject lines :(

Please fix that up and resend these as a patch series, with unique
subjects.

thanks,

greg k-h
