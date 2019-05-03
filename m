Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3604D131B7
	for <lists+linux-usb@lfdr.de>; Fri,  3 May 2019 18:01:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728228AbfECQBw (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 3 May 2019 12:01:52 -0400
Received: from mail.kernel.org ([198.145.29.99]:38300 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726495AbfECQBw (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 3 May 2019 12:01:52 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 71D202075C;
        Fri,  3 May 2019 16:01:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1556899311;
        bh=zP7CX8b8fSiNqWOhHigSrhJEeeQpvv0aXgLi/myc8ow=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=gfX+3uHVUE1MNx/DemWxcRZvYcL2pZG4n5V6k3YSL/F8fOvhOOCMK08u3KKM8+C1s
         ZXd+CA30Wnxl3sfGa0/YwTuOmW+NAuQoFHWiCxQtwmvRs6yFP45uPQrC2XAX0ffelT
         EOKLvm/Ily5LO8mCP+cQPKx4VvzaWV6O+w/pr3pQ=
Date:   Fri, 3 May 2019 18:01:00 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Johan Hovold <johan@kernel.org>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [GIT PULL] USB-serial updates for 5.2-rc1
Message-ID: <20190503160100.GA7054@kroah.com>
References: <20190503153650.GA6170@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190503153650.GA6170@localhost>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, May 03, 2019 at 05:36:50PM +0200, Johan Hovold wrote:
> The following changes since commit 79a3aaa7b82e3106be97842dedfd8429248896e6:
> 
>   Linux 5.1-rc3 (2019-03-31 14:39:29 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial.git tags/usb-serial-5.2-rc1

Pulled and pushed out, thanks.

greg k-h
