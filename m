Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F891261465
	for <lists+linux-usb@lfdr.de>; Tue,  8 Sep 2020 18:19:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731816AbgIHQTW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 8 Sep 2020 12:19:22 -0400
Received: from mail.kernel.org ([198.145.29.99]:57572 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731791AbgIHQTS (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 8 Sep 2020 12:19:18 -0400
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 45CE4229EF;
        Tue,  8 Sep 2020 15:55:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1599580555;
        bh=FnWGHw0fqQqYvcj6WXpD7p7UPIkRR3967ne2GBcZG0U=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Ut3320r+HBIKO7QdUOViaYq1xmXeXqJg4IZ13A5trRWdjUTSDX9zo0QaKsKMZ8Wu6
         LPVyqhQeMUDuQIguSSDA93pfigkGsjGxnS0yv4/gghQhzlrtYWf7eX0ZKWEaQU6KC1
         FbDwlYnzmYoZEgElcfh3S1ue8WGi0vZ4btWmOBzU=
Date:   Tue, 8 Sep 2020 17:51:24 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Johan Hovold <johan@kernel.org>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [GIT PULL] USB-serial fixes for 5.9-rc5
Message-ID: <20200908155124.GA4174920@kroah.com>
References: <20200908154343.GA24328@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200908154343.GA24328@localhost>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Sep 08, 2020 at 05:43:43PM +0200, Johan Hovold wrote:
> The following changes since commit 9123e3a74ec7b934a4a099e98af6a61c2f80bbf5:
> 
>   Linux 5.9-rc1 (2020-08-16 13:04:57 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial.git tags/usb-serial-5.9-rc5
> 
> for you to fetch changes up to 2bb70f0a4b238323e4e2f392fc3ddeb5b7208c9e:
> 
>   USB: serial: option: support dynamic Quectel USB compositions (2020-08-31 08:37:17 +0200)

Pulled and pushed out, thanks.

greg k-h
