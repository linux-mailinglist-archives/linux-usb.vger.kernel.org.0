Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 55EE7413506
	for <lists+linux-usb@lfdr.de>; Tue, 21 Sep 2021 16:08:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233406AbhIUOJm (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 21 Sep 2021 10:09:42 -0400
Received: from mail.kernel.org ([198.145.29.99]:52758 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231781AbhIUOJm (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 21 Sep 2021 10:09:42 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 336C46058D;
        Tue, 21 Sep 2021 14:08:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1632233293;
        bh=hEe2kMl/yUbXvpXHI/QU+YS6PbyWpr75G7FTCeRYzEg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=nVkex8I/UfSLCHj1dj0RDUjh4QjHWxnyqTYMN8NYyyi3oCo2Cb0N1g8Jerw19D81i
         pyV0AqCFtebdJNeyHFep6GLaAyVgoIA4TKpqsHl2VRig0fxik8/YCOvmqGBSmE+EIX
         dvSkGSNEZ1CdJudW9skzR4uQCKOX9mwfYSV/Qvjw=
Date:   Tue, 21 Sep 2021 16:08:08 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Johan Hovold <johan@kernel.org>
Cc:     Himadri Pandya <himadrispandya@gmail.com>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] USB: serial: kl5kusb105: clean up line-status
 handling
Message-ID: <YUnnSO/RAhZ5fRxK@kroah.com>
References: <20210921133009.13739-1-johan@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210921133009.13739-1-johan@kernel.org>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Sep 21, 2021 at 03:30:06PM +0200, Johan Hovold wrote:
> As a follow up to the usb_control_msg_recv() conversion, this cleans up
> the line-status handling some more.
> 
> Johan
> 
> 
> Johan Hovold (3):
>   USB: serial: kl5kusb105: clean up line-status handling
>   USB: serial: kl5kusb105: simplify line-status handling
>   USB: serial: kl5kusb105: drop line-status helper
> 
>  drivers/usb/serial/kl5kusb105.c | 40 ++++++++++-----------------------
>  1 file changed, 12 insertions(+), 28 deletions(-)


Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
