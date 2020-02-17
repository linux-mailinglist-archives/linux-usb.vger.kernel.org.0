Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F243E1616C3
	for <lists+linux-usb@lfdr.de>; Mon, 17 Feb 2020 16:55:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729671AbgBQPyv (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 17 Feb 2020 10:54:51 -0500
Received: from mail.kernel.org ([198.145.29.99]:51898 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729664AbgBQPyt (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 17 Feb 2020 10:54:49 -0500
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 5EA08206F4;
        Mon, 17 Feb 2020 15:54:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1581954887;
        bh=V430jFj2L7DhXHtND43/1uiq2r1KBa2QOUh+1SiYQ7s=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=PPfL+xUCHc3RTqvoCMix4I6d07XXvbpFMcFCYjorYDvDjyoizR1Z8zIOkrd3cImnQ
         AGMLFtRKrADjXKD9VkOvGJJ+VKyRXgEAR3G8GSGMyeIUli6anLqlUKF9YLAsrb7GQ1
         uGx32b0x0yU0Cv4E/8ZEUjSupwJm9okSUrq42LeQ=
Date:   Mon, 17 Feb 2020 16:54:45 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     Ajay Gupta <ajayg@nvidia.com>,
        Colin Ian King <colin.king@canonical.com>,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH 0/3] ucsi driver changes (for v5.7)
Message-ID: <20200217155445.GA1475779@kroah.com>
References: <20200217144913.55330-1-heikki.krogerus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200217144913.55330-1-heikki.krogerus@linux.intel.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Feb 17, 2020 at 05:49:10PM +0300, Heikki Krogerus wrote:
> Hi Greg,
> 
> Here all the UCSI driver changes at this stage. I though the cleanup
> patch from Colin would conflict with the patches from Ajay, but there
> was no problem after all.
> 
> Let me know if you want anything to be changed.

All looks good, now applied.  And note, I already had applied Colin's
patch :)

thanks,

greg k-h
