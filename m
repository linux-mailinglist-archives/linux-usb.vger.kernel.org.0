Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9CB4B33CE7D
	for <lists+linux-usb@lfdr.de>; Tue, 16 Mar 2021 08:19:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232276AbhCPHTG (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 16 Mar 2021 03:19:06 -0400
Received: from mail.kernel.org ([198.145.29.99]:39526 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232019AbhCPHSz (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 16 Mar 2021 03:18:55 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1CB6061585;
        Tue, 16 Mar 2021 07:18:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1615879134;
        bh=h0DlSzCba6aKDgoLk3XC1JIOexyhs6aEToypUPcNBi8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ci6nKh/vVaKGjBUGK/l44t5NIgu3EPQs3HMZK8+H4uLFABOlcP+0TxUGNv7mw9HWh
         4RfUEDnxAsMaY/lWIWTG205pokfQRwsSxWYmKmP0aZzTN+/VH+aq7kl6EzBXvDUOGh
         MhMh50z3LsREWVoH3Bn5+eEA8s63010XR38Uys6o=
Date:   Tue, 16 Mar 2021 08:18:52 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Peter Chen <peter.chen@kernel.org>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [GIT PULL] usb: fixes for v5.12
Message-ID: <YFBb3BXqJZ4hT7+b@kroah.com>
References: <20210316002450.GA15335@b29397-desktop>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210316002450.GA15335@b29397-desktop>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Mar 16, 2021 at 08:24:50AM +0800, Peter Chen wrote:
> The following changes since commit a38fd8748464831584a19438cbb3082b5a2dab15:
> 
>   Linux 5.12-rc2 (2021-03-05 17:33:41 -0800)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/peter.chen/usb.git/ tags/usb-v5.12-rc4

Pulled and pushed out, thanks.

greg k-h
