Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8CC03218AD7
	for <lists+linux-usb@lfdr.de>; Wed,  8 Jul 2020 17:11:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729858AbgGHPLE (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 8 Jul 2020 11:11:04 -0400
Received: from mail.kernel.org ([198.145.29.99]:35484 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729625AbgGHPLD (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 8 Jul 2020 11:11:03 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id EB94A2078D;
        Wed,  8 Jul 2020 15:11:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1594221063;
        bh=JlkP9WBNvHgrvvtGhECXe1LtkxVQKlJIUqMRhWD/9b4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=z9UoilwvmjCK1gZidXRuXmrCSBkASOZ73D74AqCBsUvFQlgE6WWTbUdDgVPbpisXV
         PJRZv24ZM5u5UrgzdDaGaN7PQetnTWhyYhfGp9bemogJ7B1HItaPkNx0WozPHkU7qa
         TUeOMV9aoCWaHayl8iMyOJXzTWm7gAoHMOHt0Wf0=
Date:   Wed, 8 Jul 2020 17:10:51 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Johan Hovold <johan@kernel.org>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [GIT PULL] USB-serial fixes for 5.8-rc5
Message-ID: <20200708151051.GB685371@kroah.com>
References: <20200708130710.GA25398@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200708130710.GA25398@localhost>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Jul 08, 2020 at 03:07:10PM +0200, Johan Hovold wrote:
> The following changes since commit 48778464bb7d346b47157d21ffde2af6b2d39110:
> 
>   Linux 5.8-rc2 (2020-06-21 15:45:29 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial.git tags/usb-serial-5.8-rc5

Pulled and pushed out, thanks!

greg k-h
