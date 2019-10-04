Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 053ECCBC8F
	for <lists+linux-usb@lfdr.de>; Fri,  4 Oct 2019 16:02:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388884AbfJDOCK (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 4 Oct 2019 10:02:10 -0400
Received: from mail.kernel.org ([198.145.29.99]:60492 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388197AbfJDOCJ (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 4 Oct 2019 10:02:09 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D92C82077B;
        Fri,  4 Oct 2019 14:02:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1570197729;
        bh=6x1YhVQntV8YM+A37BfbLuFsGAaL1pjn8Akyw2xKSV4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=KxyhNqQmrMjCIg4Bf3d/9WsezEWiu1Fod2HGB9ZLZKBvkF0JQm/9DQWA3hz4b7NBI
         uWmGsTB4T8tzdJav+nH82FS5DH47YmGWhXUobJTJue2okT8H/p5V+Co4fyo7dZ9kRH
         V5aAeC5Jeg1Z5a+sozfYhTDX9VV119yePPWMWYkI=
Date:   Fri, 4 Oct 2019 16:01:59 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Johan Hovold <johan@kernel.org>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [GIT PULL] USB-serial fixes for 5.4-rc2
Message-ID: <20191004140159.GB729389@kroah.com>
References: <20191004135219.GA19566@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191004135219.GA19566@localhost>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Oct 04, 2019 at 03:52:19PM +0200, Johan Hovold wrote:
> The following changes since commit 54ecb8f7028c5eb3d740bb82b0f1d90f2df63c5c:
> 
>   Linux 5.4-rc1 (2019-09-30 10:35:40 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial.git tags/usb-serial-5.4-rc2

Pulled and pushed out, thanks!

greg k-h
