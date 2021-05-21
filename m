Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2724738CCF4
	for <lists+linux-usb@lfdr.de>; Fri, 21 May 2021 20:08:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238620AbhEUSJ4 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 21 May 2021 14:09:56 -0400
Received: from mail.kernel.org ([198.145.29.99]:58356 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234697AbhEUSJy (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 21 May 2021 14:09:54 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 06099613D6;
        Fri, 21 May 2021 18:08:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1621620511;
        bh=WT03Yt1Dj5jVcpLCgJ/Y7SFTw0hFeHwalPXILj1VPuU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=OqZ4KZ9u+Rm90AonjgPVdYLlCrSDwwVYBpUfK8XjiiB6qyR/3RPUcBllbQfW8OaVe
         8te4yp6D9uVNO3s+Q5kahx5jIWUnbsVhROE7pDCm1pFLfvJ4GjCdFSjzUxqZExK6yL
         BhpNgJOcOf6y5W2fbqJQjJpNvBONA3LxWjCMyMd0=
Date:   Fri, 21 May 2021 20:08:22 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Johan Hovold <johan@kernel.org>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [GIT PULL] USB-serial fixes for 5.13-rc3
Message-ID: <YKf3Fr1XHvPonHX0@kroah.com>
References: <YKe8muaCX1NQmBhi@hovoldconsulting.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YKe8muaCX1NQmBhi@hovoldconsulting.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, May 21, 2021 at 03:58:50PM +0200, Johan Hovold wrote:
> The following changes since commit 6efb943b8616ec53a5e444193dccf1af9ad627b5:
> 
>   Linux 5.13-rc1 (2021-05-09 14:17:44 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial.git tags/usb-serial-5.13-rc3

Pulled and pushed out, thanks.

greg k-h
