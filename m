Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 67F523A9416
	for <lists+linux-usb@lfdr.de>; Wed, 16 Jun 2021 09:34:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231293AbhFPHgR (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 16 Jun 2021 03:36:17 -0400
Received: from mail.kernel.org ([198.145.29.99]:49318 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231132AbhFPHgR (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 16 Jun 2021 03:36:17 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6FE346044F;
        Wed, 16 Jun 2021 07:34:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1623828850;
        bh=b3jTplNoe+ZjmXG0I+2AExe4Ma+uqkkAgZlF7jP1BrQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=P5+Gv/uBGJLYfRhe9QTFpdZt6u+eA+MwelvszuBy1QfhhoG0RfSPolHwTArrTMtdM
         Hl/UMCC/O18dITFQyOjp8Y3CGnOB2MeseOCkGXybSv4BDXvaneycLXdogFowHYRppU
         D51FDn+sb9DmZ/0PPFmYqstmNyK+yGBuzdO3Z+Bw=
Date:   Wed, 16 Jun 2021 09:34:08 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Peter Chen <peter.chen@kernel.org>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [GIT PULL] usb: fixes for v5.13
Message-ID: <YMmpcOULp2J+nB2+@kroah.com>
References: <20210616011617.GA19494@nchen>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210616011617.GA19494@nchen>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Jun 16, 2021 at 09:16:17AM +0800, Peter Chen wrote:
> The following changes since commit a9aecef198faae3240921b707bc09b602e966fce:
> 
>   usb: cdnsp: Fix deadlock issue in cdnsp_thread_irq_handler (2021-05-27 09:36:20 +0800)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/peter.chen/usb.git/ tags/usb-v5.13-rc7

Pulled and pushed out, thanks.

greg k-h
