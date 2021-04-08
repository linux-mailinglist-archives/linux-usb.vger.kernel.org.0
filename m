Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C396A357FD0
	for <lists+linux-usb@lfdr.de>; Thu,  8 Apr 2021 11:47:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231319AbhDHJrx (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 8 Apr 2021 05:47:53 -0400
Received: from mail.kernel.org ([198.145.29.99]:40694 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230291AbhDHJrx (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 8 Apr 2021 05:47:53 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5196661041;
        Thu,  8 Apr 2021 09:47:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1617875262;
        bh=GjlqAsmh2uiQv7GMYN6Xm9kKhIAIb6youbJXsF8s0vs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=veNhFzuWNU21qHqc+UD2uYbOFGQgVJ/CbXFQJGxtJdaf428QDll7tgiuUz628I5dH
         8TnWJdFtubbLjTNvfxr8IO4m7gcAszD5vDAOkjhWhMXNoEeCyyUsmULkiLzoov8eme
         /8D16yC7v5+haMU/b2idLizYIjpzdJiQY/lOTZCk=
Date:   Thu, 8 Apr 2021 11:47:39 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     YueHaibing <yuehaibing@huawei.com>
Cc:     Ye Bin <yebin10@huawei.com>,
        Valentina Manea <valentina.manea.m@gmail.com>,
        Shuah Khan <shuah@kernel.org>, linux-usb@vger.kernel.org,
        kernel-janitors@vger.kernel.org, Hulk Robot <hulkci@huawei.com>
Subject: Re: [PATCH -next] usbip: vudc: fix missing unlock on error in
 usbip_sockfd_store()
Message-ID: <YG7RO9w9PuLqUrbV@kroah.com>
References: <20210408085033.909377-1-yebin10@huawei.com>
 <bf976317-2bf5-d019-bf7b-4a4ead0b1c94@huawei.com>
 <YG7KhTDZyR8U0yNY@kroah.com>
 <d555fd00-9c4f-1ddb-4fb7-b4d015b6fe3a@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d555fd00-9c4f-1ddb-4fb7-b4d015b6fe3a@huawei.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Apr 08, 2021 at 05:39:06PM +0800, YueHaibing wrote:
> On 2021/4/8 17:19, Greg Kroah-Hartman wrote:
> > On Thu, Apr 08, 2021 at 04:57:11PM +0800, YueHaibing wrote:
> >>
> >> 这种bugfix最好加下Fixes tag
> > 
> > I am sorry but I can not parse that :(
> 
> Sorry, I just suggest to add this Fixes tag
> 
> Fixes: bd8b82042269 ("usbip: vudc synchronize sysfs code paths")

Yes, that would be great to have added, thanks!

greg k-h
