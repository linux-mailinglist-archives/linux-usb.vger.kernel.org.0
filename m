Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD7EB311D5F
	for <lists+linux-usb@lfdr.de>; Sat,  6 Feb 2021 14:16:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229711AbhBFNPD (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 6 Feb 2021 08:15:03 -0500
Received: from mail.kernel.org ([198.145.29.99]:34348 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229529AbhBFNPB (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sat, 6 Feb 2021 08:15:01 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1863764EAC;
        Sat,  6 Feb 2021 13:14:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1612617260;
        bh=98pvPC+Azr05p3eihrb0Y63eV43ReNEUOqKi+rOOMPg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=UziOMdcahYVIdrfhU/H+NomAm2KcD5lTICj+G+46FFHiCtCNLQcDhf4NHZ7UtXpmE
         qu3TRK56l6rBEQT5QzWKbAu9ozsX2Qtwap9hJnPt7jsfOv3G1MbBsKUuP+qZmELBa+
         UEeSZo9QnZeKUOIJMa/6ILlw7smvGgaZ7UFLB1x4=
Date:   Sat, 6 Feb 2021 14:14:18 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Paul Wise <pabs3@bonedaddy.net>
Cc:     Krzysztof Opasiak <k.opasiak@samsung.com>,
        Matt Porter <mporter@linaro.org>,
        Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
        Karol Lewandowski <k.lewandowsk@samsung.com>,
        linux-usb@vger.kernel.org
Subject: Re: proposal: move Linux userspace USB gadget projects to linux-usb
 GitHub organisation?
Message-ID: <YB6WKs/6QMWJSS2t@kroah.com>
References: <c38162833d1c8fede734e41eb5ce23cf393d6555.camel@bonedaddy.net>
 <YAhKAiz2U9KQWQPE@kroah.com>
 <86c0f13b298c8584bc7070543637f424075e526f.camel@bonedaddy.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <86c0f13b298c8584bc7070543637f424075e526f.camel@bonedaddy.net>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sat, Feb 06, 2021 at 07:35:00AM +0800, Paul Wise wrote:
> On Wed, 2021-01-20 at 16:19 +0100, Greg Kroah-Hartman wrote:
> 
> > If you can get the "owners" of these repos to agree, than sure.
> 
> A couple of owners of these repos have already agreed.
> 
> If you would like me to do the transition, I'm @pabs3 on GitHub.

I still don't see the benefit here, what is this going to change?

> Do you think the Linux Foundation, Samsung, Collabora or another
> company might be interested in investing in maintenance of the Linux
> userspace USB gadget projects?

I have no idea, sorry.

> If so I would be happy to be paid to do
> some initial polish on the projects and to shepherd continued community
> maintenance afterwards as well as package them for Debian and other
> distributions.

If Debian hasn't already packaged up any of these, that's a huge
indication that no one actually uses them :)

> If not I'll have less time for that but might at least
> bring the projects up to where they can be added to Debian.

What projects are not in Debian already that somehow need to be there?

thanks,

greg k-h
