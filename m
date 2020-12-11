Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 692772D7904
	for <lists+linux-usb@lfdr.de>; Fri, 11 Dec 2020 16:19:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406299AbgLKPSH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 11 Dec 2020 10:18:07 -0500
Received: from mail.kernel.org ([198.145.29.99]:41140 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2406596AbgLKPQ6 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 11 Dec 2020 10:16:58 -0500
Date:   Fri, 11 Dec 2020 16:17:17 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1607699778;
        bh=XfxqWoR3abgEkWKTbKL2nQfjhZiprG/6vqZkg4aPMug=;
        h=From:To:Cc:Subject:References:In-Reply-To:From;
        b=j77i+CkpK9NjiP3u71zxwGDA4cad4j4uP6QR3NvTBlUeJCKt8vApYBrFuP4Nlrr40
         8+LlFaRjY5Vt0xf8GzHp0+sUrR6c4aQhjHRPMlma4pKFCF86rTAsqsVyhWyPgAXUXL
         y4xJoCp8b09aBJ6pXZeKtMhri8UglbfEjyBLqMdk=
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Johan Hovold <johan@kernel.org>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [GIT PULL] USB-serial updates for 5.11-rc1
Message-ID: <X9ONfRNZjakXxHwb@kroah.com>
References: <X9OJhhsZdsQhw5cB@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <X9OJhhsZdsQhw5cB@localhost>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Dec 11, 2020 at 04:00:22PM +0100, Johan Hovold wrote:
> The following changes since commit 3650b228f83adda7e5ee532e2b90429c03f7b9ec:
> 
>   Linux 5.10-rc1 (2020-10-25 15:14:11 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial.git tags/usb-serial-5.11-rc1

Pulled and pushed out, thanks.

greg k-h
