Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 85C3C31B6E3
	for <lists+linux-usb@lfdr.de>; Mon, 15 Feb 2021 11:09:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230137AbhBOKIo (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 15 Feb 2021 05:08:44 -0500
Received: from mail.kernel.org ([198.145.29.99]:59134 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230042AbhBOKIn (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 15 Feb 2021 05:08:43 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 11AD964DF0;
        Mon, 15 Feb 2021 10:08:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1613383682;
        bh=ET1Hiw3VjwlFBjDWUakjQiHaQ8qMFc8aJCeSWuEYtU8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=KqL6rhRBE9kzBgovDeKOtBEozkg1xEnuhOWajarBZ373tpwofmoZdM8txTkm/hdIu
         LcUwHXjHN5M5agqEZxFMRSsvZT0tsiAi9uZ5gIq2zxvNizJfYzXbE2P2S8F/qIpVW8
         z5mrb2n9eLSbEobMWBkKDAkx2uneS4BkGhXcP/UM=
Date:   Mon, 15 Feb 2021 11:07:59 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Cc:     Paul Wise <pabs3@bonedaddy.net>,
        Krzysztof Opasiak <k.opasiak@samsung.com>,
        Karol Lewandowski <k.lewandowsk@samsung.com>,
        linux-usb@vger.kernel.org
Subject: Re: proposal: move Linux userspace USB gadget projects to linux-usb
 GitHub organisation?
Message-ID: <YCpH/2PbQtrmUYhJ@kroah.com>
References: <c38162833d1c8fede734e41eb5ce23cf393d6555.camel@bonedaddy.net>
 <YAhKAiz2U9KQWQPE@kroah.com>
 <86c0f13b298c8584bc7070543637f424075e526f.camel@bonedaddy.net>
 <YB6WKs/6QMWJSS2t@kroah.com>
 <ffd238f1787b8e23f974a220e94aa39eb62b2e60.camel@bonedaddy.net>
 <8f31baea8cad893f416fac972a3a64922c97bcc5.camel@bonedaddy.net>
 <e80a776a-5d05-8936-82c9-21180cd87e22@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e80a776a-5d05-8936-82c9-21180cd87e22@collabora.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Feb 15, 2021 at 10:53:16AM +0100, Andrzej Pietrasiewicz wrote:
> W dniu 14.02.2021 o 03:17, Paul Wise pisze:
> > On Sun, 2021-02-07 at 07:28 +0800, Paul Wise wrote:
> > 
> > > All the standard benefits of the GitHub organisations feature and
> > > collaborative maintenance in general
> > 
> > Since the linux-usb GitHub organisation isn't yet available for
> > collaborative maintenance of Linux userspace USB gadget projects on
> > GitHub, we will create a linux-usb-gadgets GitHub organisation and can
> > move gadget projects to the linux-usb org when it becomes available.
> > 
> 
> Any prospects of it "becoming available"?

I still fail to see what this is going to help with here.  Are usb
userspace projects going to somehow get loads of more developers
somehow this way?  What is preventing that from happening today that
dumping them all in a single project going to change?

Am I now somehow the arbitrator of what is, and is not, a valid project
to join?  We already have competing libraries scattered around, lumping
them all in a single location isn't going to change that problem from
what I can tell.

So, what problem would this solve that the added maintenance burden by me
and others would be worth it?

thanks,

greg k-h
