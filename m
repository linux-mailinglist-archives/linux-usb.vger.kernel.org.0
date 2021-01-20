Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E56322FD3D7
	for <lists+linux-usb@lfdr.de>; Wed, 20 Jan 2021 16:23:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390975AbhATPUY (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 20 Jan 2021 10:20:24 -0500
Received: from mail.kernel.org ([198.145.29.99]:51286 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2390194AbhATPUO (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 20 Jan 2021 10:20:14 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id F1D002336D;
        Wed, 20 Jan 2021 15:19:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1611155973;
        bh=4U0cTymur58aCFjU661WbxxMOBMWQK1vEfB7/iEaKLc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=HBgp4x8eFraXqtYXTUW1lV84kzGeNpOtvon3qMNLeUeODmTc6Vq69VEPVB0yA6enr
         RvXnPDHXzhZKIEC8swhl0U8ko+Sk/sEzlIY9i3ayf9+dPquDQBYU0nNy/IHtVEu6mV
         Qs/1UbhV8MtmOFeIf5ZzCxAfa63qL/PhG1i7Hkd0=
Date:   Wed, 20 Jan 2021 16:19:30 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Paul Wise <pabs3@bonedaddy.net>
Cc:     Krzysztof Opasiak <k.opasiak@samsung.com>,
        Matt Porter <mporter@linaro.org>,
        Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
        Karol Lewandowski <k.lewandowsk@samsung.com>,
        linux-usb@vger.kernel.org
Subject: Re: proposal: move Linux userspace USB gadget projects to linux-usb
 GitHub organisation?
Message-ID: <YAhKAiz2U9KQWQPE@kroah.com>
References: <c38162833d1c8fede734e41eb5ce23cf393d6555.camel@bonedaddy.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c38162833d1c8fede734e41eb5ce23cf393d6555.camel@bonedaddy.net>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Jan 20, 2021 at 04:06:59AM +0800, Paul Wise wrote:
> Hi Greg, all,
> 
> Right now all the Linux userspace USB gadget projects (libusbg,
> libusbgx, gt, gadgetd, cmtp-responder etc) are spread out across
> different GitHub organisations and user accounts.
> 
> https://github.com/libusbg/libusbg
> https://github.com/libusbgx/libusbgx
> https://github.com/kopasiak/gt
> https://github.com/gadgetd/gadgetd
> https://github.com/cmtp-responder/cmtp-responder

If you can get the "owners" of these repos to agree, than sure.

But we should work out the libusbg and libusbx issue, which is really
the "latest" one?

> I would like to move each of these projects to the linux-usb GitHub
> organisation and add some more folks to the list of admins so that
> these projects can be more collaboratively maintained. The linux-usb
> GitHub organisation is currently solely owned by Greg Kroah-Hartman.
> 
> https://github.com/linux-usb
> 
> I don't propose to move maintenance of these projects to kernel.org
> since the issue and pull request databases for them are on GitHub and
> would need to be preserved.

If you are moving the repos, why do you care about the issue and pull
request database anymore?  Will they just not end up going away?

I'm fine with keeping these on github, kernel.org is a great solution
for kernel developers to use, but that's about it :)

thanks,

greg k-h
