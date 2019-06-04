Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5C9F733E80
	for <lists+linux-usb@lfdr.de>; Tue,  4 Jun 2019 07:40:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726527AbfFDFks (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 4 Jun 2019 01:40:48 -0400
Received: from mail.kernel.org ([198.145.29.99]:58714 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726427AbfFDFks (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 4 Jun 2019 01:40:48 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8E3B824E0D;
        Tue,  4 Jun 2019 05:40:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1559626848;
        bh=Q1IeZXeBEM0M9DgChEpSuZNHDExw0k1MG2qLpwXbwus=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=jVehrERRGWNHFKI+C515p0izJeYKcirY89xNrAbej6LsX0CNiGuq6Svp/DNSSSutb
         aDpMCTn5T/1RohMkziS28ZtnmEXSAnoIy3Fqnku/X7enjY7umIys3bQjSmpNrwCCmo
         LCVNMTmGTW9h3q6yXNxgmPBOWhTS1jM+D4rgIQwU=
Date:   Tue, 4 Jun 2019 07:40:45 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Vladimir Yerilov <openmindead@gmail.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: kernel NULL pointer dereference, ucsi bug
Message-ID: <20190604054045.GD1588@kroah.com>
References: <CAB31r6U3Ha+JrbjGC+wKj-+gJfQ7dk+LSoL1n0tQBxVTPb2mRQ@mail.gmail.com>
 <20190603131258.GA10397@kroah.com>
 <CAB31r6VK12FXoPh6eNfE1v_Tgjv917Nh7699=TZpm4SkCVMm-w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAB31r6VK12FXoPh6eNfE1v_Tgjv917Nh7699=TZpm4SkCVMm-w@mail.gmail.com>
User-Agent: Mutt/1.12.0 (2019-05-25)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Jun 04, 2019 at 12:58:38AM +1000, Vladimir Yerilov wrote:
> No, I can't.
> 
> Unfortunately, this exceeds the scope of my knowledge. I simply don't
> know enough to understand your request correctly. What I can is to
> compile and try some pre-rc1 5.2 kernel and see how it goes. Also I
> managed to trace the source of this problem more precisely.

If you can use a pre-rc1 5.2 kernel, that means you are using git, so
just look at 'git bisect --help' for how that command works and how you
can use it to find the exact problem commit.

thanks,

greg k-h
