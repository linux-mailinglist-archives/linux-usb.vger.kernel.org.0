Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 104C939C38
	for <lists+linux-usb@lfdr.de>; Sat,  8 Jun 2019 11:41:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726701AbfFHJlv (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 8 Jun 2019 05:41:51 -0400
Received: from mail.kernel.org ([198.145.29.99]:37914 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726638AbfFHJlu (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sat, 8 Jun 2019 05:41:50 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id EDE4A214AE;
        Sat,  8 Jun 2019 09:41:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1559986910;
        bh=hPFvNZ7BlR5N6sc+Gj0eb+3E+XlXIjScpmtvxYjByuw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=nSP1nYQdhN6g3BpyN2fIJG4VpJd7oBz0yaGNA9/Nc0wTxsABKidjymdIveZakJpyn
         l8L5JjycTKkfA/RQwHp0j6xqmSPXCqs29dZO65gDhksn7hmcUnNG3fsJAQ3lowBTLp
         d9LmiEVh7F326/brBxw8VbC86Q1sO569jrA+skPg=
Date:   Sat, 8 Jun 2019 11:41:33 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Felipe Balbi <felipe.balbi@linux.intel.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [GIT PULL] USB: fixes for v5.2-rc4
Message-ID: <20190608094133.GA24491@kroah.com>
References: <87o939dhvq.fsf@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87o939dhvq.fsf@linux.intel.com>
User-Agent: Mutt/1.12.0 (2019-05-25)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Jun 07, 2019 at 09:33:29AM +0300, Felipe Balbi wrote:
> 
> Hi Greg,
> 
> Here's my first set of fixes for this -rc cycle. Looks like most of what
> I have in my inbox these days are new features. Very little fixes. I
> guess folks are writing perfect code now :-p
> 
> Let me know if you want anything to be changed.
> 
> Cheers
> 
>  _________________________________ 
> < That's some perfect C, partner. >
>  --------------------------------- 
>         \   ^__^
>          \  (oo)\_______
>             (__)\       )\/\
>                 ||----w |
>                 ||     ||
> 
> The following changes since commit f2c7c76c5d0a443053e94adb9f0918fa2fb85c3a:
> 
>   Linux 5.2-rc3 (2019-06-02 13:55:33 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/balbi/usb.git tags/fixes-for-v5.2-rc4

Pulled and pushed out, thanks!

greg k-h
