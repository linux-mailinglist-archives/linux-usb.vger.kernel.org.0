Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E1A3A1E0D68
	for <lists+linux-usb@lfdr.de>; Mon, 25 May 2020 13:36:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390208AbgEYLgM (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 25 May 2020 07:36:12 -0400
Received: from mail.kernel.org ([198.145.29.99]:58248 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388733AbgEYLgM (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 25 May 2020 07:36:12 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4B05320723;
        Mon, 25 May 2020 11:36:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1590406571;
        bh=Hsvgo7cXkWqV9YjaMgYxtNBSn2GMPiEARBTxGDoSXwM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=WJszw50TSIw6QqK0eDHRKuYOV/rrRCknm2nJsQBZ2uWnR5qNHEq5imBqCYQCDmQM4
         5PaTcN6io7f1VdgllwGOVRJXgcEULQvf7P2s975yt8GmN62YsBNwZJ5nFuMwGR24iX
         CUjv4gudoP4EiImqfRnRYWSQuXpj64r7pYFSPSWs=
Date:   Mon, 25 May 2020 13:33:44 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Felipe Balbi <balbi@kernel.org>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [GIT PULL] USB for v5.8 merge window
Message-ID: <20200525113344.GA360751@kroah.com>
References: <87h7w4wcug.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87h7w4wcug.fsf@kernel.org>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, May 25, 2020 at 01:03:35PM +0300, Felipe Balbi wrote:
> 
> Hi Greg,
> 
> here's my pull request for v5.8 merge window. Note that we have a
> conflict in CDNS3 driver. The conflict is all about indentation, I don't
> really have an opinion if you want to choose my version or yours,
> whichever you choose works for me :-)
> 
> Most patches have been soaking for several weeks now without any
> reports.
> 
> Let me know if you want anything to be changed.
> 
> Cheers
> 
> The following changes since commit 0e698dfa282211e414076f9dc7e83c1c288314fd:
> 
>   Linux 5.7-rc4 (2020-05-03 14:56:04 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/balbi/usb.git tags/usb-for-v5.8

There was a simple conflict in drivers/usb/cdns3/gadget.c that I've
fixed up and pushed out.  If you could verify I got it right, that would
be great.

thanks,

greg k-h
