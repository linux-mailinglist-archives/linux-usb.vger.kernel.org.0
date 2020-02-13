Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8604115C855
	for <lists+linux-usb@lfdr.de>; Thu, 13 Feb 2020 17:35:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728663AbgBMQfg (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 13 Feb 2020 11:35:36 -0500
Received: from mail.kernel.org ([198.145.29.99]:38330 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728631AbgBMQfg (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 13 Feb 2020 11:35:36 -0500
Received: from localhost (unknown [104.132.1.104])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id BAA8F24677;
        Thu, 13 Feb 2020 16:35:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1581611735;
        bh=yPKS+UrMFz3x44kMztMdAJSQU3E9zhn0sy1FKZSWtCo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=04qnajh6zSjtHTWCBKB/HywzrjwAUIeirBhttPfRGIfG4sU1M2YtGx1hPzw6HqklD
         if76XYCRzI2lQY7LPO3+kTxGBLxMV0c8fYjMaJrJorVx2yOvloqk/4kwr42wkg8Jzy
         38KVXZYhgVOnGmp9YWFvZ4AEE8c2aZy48cMnZuCk=
Date:   Thu, 13 Feb 2020 08:35:35 -0800
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Felipe Balbi <balbi@kernel.org>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [GIT PULL] USB fixes for v5.6-rc1
Message-ID: <20200213163535.GA3652355@kroah.com>
References: <87k14qqxix.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87k14qqxix.fsf@kernel.org>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Feb 13, 2020 at 06:09:42PM +0200, Felipe Balbi wrote:
> 
> Hi Greg,
> 
> not too many fixes this time around. Only 9 commits. Let me know if you
> need or want anything to be changed.
> 
> cheers
> 
> 
> The following changes since commit bb6d3fb354c5ee8d6bde2d576eb7220ea09862b9:
> 
>   Linux 5.6-rc1 (2020-02-09 16:08:48 -0800)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/balbi/usb.git tags/fixes-for-v5.6-rc1

Pulled and pushed out, thanks!

greg k-h
