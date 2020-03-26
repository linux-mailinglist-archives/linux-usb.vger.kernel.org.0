Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 802DC193CD1
	for <lists+linux-usb@lfdr.de>; Thu, 26 Mar 2020 11:16:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727959AbgCZKQk (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 26 Mar 2020 06:16:40 -0400
Received: from mail.kernel.org ([198.145.29.99]:45774 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727636AbgCZKQk (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 26 Mar 2020 06:16:40 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2BCFF2076A;
        Thu, 26 Mar 2020 10:16:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1585217799;
        bh=9re96SEXCRYFoiTD9BGKpeqcEyrOoChSKrB3wSIW0zU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=0GCsUaViLGigPFyOe9tNecN64Khh81g6lcT0SFOecaocwL7RMmzZ6fb6qcajabdkP
         ZfGofhdYPNUmQ87RDZ2JJizTY0C3fkSdAlMV58/1mXDWxe5p2KT/YCKSjL/ZkZH6Vq
         HRsD1CrFRow0F8+9/qh1pRwAfaaxT3aBPC99D5pQ=
Date:   Thu, 26 Mar 2020 11:16:05 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Johan Hovold <johan@kernel.org>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [GIT PULL] USB-serial updates for 5.7-rc1
Message-ID: <20200326101605.GA1011567@kroah.com>
References: <20200326100909.GA21067@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200326100909.GA21067@localhost>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Mar 26, 2020 at 11:09:09AM +0100, Johan Hovold wrote:
> The following changes since commit bb6d3fb354c5ee8d6bde2d576eb7220ea09862b9:
> 
>   Linux 5.6-rc1 (2020-02-09 16:08:48 -0800)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial.git tags/usb-serial-5.7-rc1

Pulled and pushed out, thanks.

greg k-h
