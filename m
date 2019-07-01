Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 723925B8C6
	for <lists+linux-usb@lfdr.de>; Mon,  1 Jul 2019 12:12:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728734AbfGAKMR (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 1 Jul 2019 06:12:17 -0400
Received: from mail.kernel.org ([198.145.29.99]:50342 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726247AbfGAKMR (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 1 Jul 2019 06:12:17 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E744A2133D;
        Mon,  1 Jul 2019 10:12:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1561975936;
        bh=8ueB3TD97v1Kpj2tb+rfU/syCKNrYndGOjPufVWQSaw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Wzlf2uNJ1haXsPLx546Yc11c5JWQC0TuDdcmRDvJWZotWUpVrrmUlZ7PL45JkjmWl
         Nph3dzKalL+EphjCqYFqFEINh5chp7IxlUKkS+M6/KFiv+UUsU4Mp7qFoLKwnrZlqA
         D5A8FFK25ggJqS1olQqmA4W5ryRxM0mtLgW0uKP8=
Date:   Mon, 1 Jul 2019 12:11:14 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Felipe Balbi <felipe.balbi@linux.intel.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [GIT PULL] USB: changes for v5.3 merge window
Message-ID: <20190701101114.GB23548@kroah.com>
References: <87y31nea2k.fsf@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87y31nea2k.fsf@linux.intel.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Jun 27, 2019 at 10:55:47AM +0300, Felipe Balbi wrote:
> 
> Hi Greg,
> 
> Here's my pull request for v5.3 merge window. Relevant patches have been
> tested on platforms I have available.
> 
> Let me know if you want anything to be changed
> 
> cheers
> 
> The following changes since commit a954e5fb4bc2d401b8fc3b4c7cd316497ff80225:
> 
>   Merge 5.2-rc5 into usb-next (2019-06-17 11:23:24 +0200)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/balbi/usb.git tags/usb-for-v5.3

Pulled and pushed out, thanks.

greg k-h
