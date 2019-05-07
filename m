Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C84821654D
	for <lists+linux-usb@lfdr.de>; Tue,  7 May 2019 16:00:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726575AbfEGOAq (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 7 May 2019 10:00:46 -0400
Received: from mail.kernel.org ([198.145.29.99]:58494 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726399AbfEGOAq (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 7 May 2019 10:00:46 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2C1F4205C9;
        Tue,  7 May 2019 14:00:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1557237645;
        bh=KqOQOgoDvEYwi6mpx38p7QeufqqUMtndelrSwcbGsz0=;
        h=Date:From:To:Cc:Subject:From;
        b=IgHqcxyeVTbna7YreG6vpFxCRAE5+T4KGP5kh2mpPv+/wM6k9EerjXmw73Q9hark9
         eQIKIcPadc/N7O0GYRlO2xn+Nva/1JhYiEtBNrjZ1nDxAL+fpRbwEn+B1Wv/eBRwrH
         toBNjPPOYqBLj/cu8kb4mIe9pQbpDvV/TajJ3tfw=
Date:   Tue, 7 May 2019 16:00:42 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Nikolai Kondrashov <spbnick@gmail.com>
Cc:     linux-usb@vger.kernel.org
Subject: merge usbhid-dump into usbutils repo?
Message-ID: <20190507140042.GA26528@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Nikolai,

As you know, usbhid-dump has been part of the usbutils repo for a long
time, as a git submodule.  And that's been fine, a bit messy at times
for when I forgot to update the submodule, but overall ok.

However, I've changed the way usbutils is being released (with the 011
release that I tagged yesterday, but did not announce anywhere).
Instead of a tarball generated on my "random desktop of the day" by
running 'make distcheck' on the tree, I wanted to rely on the kernel.org
infrastructure to do a "clean checkout" of the tree and make a tarball
just based on the git repo itself.

That way people can actually rely on what is in the tarball really is
what is in the git tree, and you don't end up running some random script
that my personal machine happened to create (not a good idea).

This is fine, except when it comes to the git submodule.  kernel.org
can't be expected to pull some random submodule from a random location
into it's tree when signing things, as that would be a total mess.

So, I came up with two possible solutions:
  1) remove usbhid-dump from usbutils.
  2) move usbhid-dump into usbutils.

The first option is a bit sad, as some users of usbhid-dump might find
it go away and now all of the distros have to go and dig and find a new
package to add to their repos.  You would also then be responsible for
doing releases and notifying everyone on your own, instead of having
that done for you like it is today.

The second option is in my opinion the best one.  You can contribute
directly to the usbutils repo by providing patches/pull requests when
changes are needed.  Given the slow-down in development of this package
over the years, I doubt much is left to do on it, so that shouldn't be a
big deal.

As a test-run, I've done a merge of the usbhid-dump repo into the
usbutils repo directly, by rewriting the directory location of the
usbhid-dump repo into usbhid-dump/ and then merging the two trees
together, such that no authorship or history is lost.  You can see the
result of that here in the branch here:
	https://github.com/gregkh/usbutils/tree/usbhid-dump-merge

That branch seems to work fine for me here, with everything building
properly.

Note, if we do go with the second option, I would like to look into
"simplifying" the usbhid-dump codebase a bit, moving away from a library
and loads of include files into something a bit simpler, as the
complexity of the build system here seems a bit of an overkill for a
"simple" binary.

So, what do you think about the two options here?

thanks,

greg k-h
