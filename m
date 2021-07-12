Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 411C43C61F5
	for <lists+linux-usb@lfdr.de>; Mon, 12 Jul 2021 19:31:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235710AbhGLReP (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 12 Jul 2021 13:34:15 -0400
Received: from mail.kernel.org ([198.145.29.99]:60602 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235707AbhGLReP (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 12 Jul 2021 13:34:15 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 377E5611CD;
        Mon, 12 Jul 2021 17:31:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1626111085;
        bh=JoQAaUJAtUWbw5hrQCw8x5dLuxr2kucH8vBVtYuabUo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=1JE8ji8fA+IeSjOSXLyJ1vQofmfQEzzx+iCb/ZmD40gaVjhGvNTaTp0dr++XYukmL
         +eJAPk6H/awZi1wo6nvxe0FANwgOdU0SmOaNkarCOeUX0YI15FT55I8WmJAwV4uzIN
         NjynTjIvCgRlCNNrMTPj2KNwC2pF7UzKf+G/VzFY=
Date:   Mon, 12 Jul 2021 19:31:23 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
Cc:     Felipe Balbi <balbi@kernel.org>, linux-usb@vger.kernel.org,
        John Youn <John.Youn@synopsys.com>,
        Argishti Aleksanyan <Argishti.Aleksanyan@synopsys.com>
Subject: Re: [PATCH v2] usb: dwc2: gadget: Add endpoint wedge support
Message-ID: <YOx8a/8StvAj8SFt@kroah.com>
References: <3143ea6b8eee08761709a6c2788216292be46a34.1626087390.git.Minas.Harutyunyan@synopsys.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3143ea6b8eee08761709a6c2788216292be46a34.1626087390.git.Minas.Harutyunyan@synopsys.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Jul 12, 2021 at 03:05:23PM +0400, Minas Harutyunyan wrote:
> Add enpoint wedge support. Tested by USBCV MSC tests.

What does this mean?  Please write a good changelog text that describes
why you are doing something and what it is.  The kernel documentation
goes into this in detail if you want to look at that again.

thanks,

greg k-h
