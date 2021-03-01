Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EE90F3278CE
	for <lists+linux-usb@lfdr.de>; Mon,  1 Mar 2021 09:01:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232674AbhCAIBl (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 1 Mar 2021 03:01:41 -0500
Received: from mail.kernel.org ([198.145.29.99]:45114 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232634AbhCAIBd (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 1 Mar 2021 03:01:33 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id F0A5764DBA;
        Mon,  1 Mar 2021 08:00:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1614585650;
        bh=+8jFax16oph9+5OHySqp7hPVBJ10uynGIp0cUjwHkeE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ueaNFEvG/hxPEifuALT2ngWnAai4Wa5HiK/r5mVsgc+VbePwzNjPjC6TOOQPRtRa3
         p9Oodysx8S1rpDYlxRXPzcjXrYu9oQhSdqBH65oSdmMGkRekqJFWtmKJX3nZDqkpZu
         wEnbzCjSxg78gY48NYvMcmX1qd4sI31V49LnezPY=
Date:   Mon, 1 Mar 2021 09:00:47 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     qiang.zhang@windriver.com
Cc:     zaitcev@redhat.com, linux-usb@vger.kernel.org
Subject: Re: [PATCH] USB: usblp: Add device status detection in usblp_poll()
Message-ID: <YDyfL/yg9QNM4nku@kroah.com>
References: <20210301040300.20834-1-qiang.zhang@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210301040300.20834-1-qiang.zhang@windriver.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Mar 01, 2021 at 12:03:00PM +0800, qiang.zhang@windriver.com wrote:
> From: Zqiang <qiang.zhang@windriver.com>
> 
> If usblp device has been disconnected, direct return
> 'EPOLLHUP | EPOLLERR' in usblp_poll().

Why?  What problem are you solving here?  Is this fixing an older
commit, if so, what one?

Please provide a lot more information here, this is not very
descriptive.

thanks,

greg k-h
