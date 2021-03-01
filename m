Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC80032794C
	for <lists+linux-usb@lfdr.de>; Mon,  1 Mar 2021 09:34:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233165AbhCAIdo (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 1 Mar 2021 03:33:44 -0500
Received: from mail.kernel.org ([198.145.29.99]:54454 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233159AbhCAIdm (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 1 Mar 2021 03:33:42 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7773F64DDF;
        Mon,  1 Mar 2021 08:33:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1614587582;
        bh=T/R7z14RRAN4+3cmPneyHMVehxixYPltnuGQWGGpzWw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Lx6VVIuor4wg2LVTDF8pGTJmzpaqZRZB6yDk6PymLl/3cdEvQnVI9YRQUOVIeBxfm
         mPLiNxGdxYtpGppmIfeQv73USRxP8uD/rMO9iN8GjoDvGsl/mAxERdBF43sMI35oMY
         dwTnA+uH2P3r2P36imR01levxM/LeOxeR5Tzdhi8=
Date:   Mon, 1 Mar 2021 09:32:59 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     "Zhang, Qiang" <Qiang.Zhang@windriver.com>
Cc:     "zaitcev@redhat.com" <zaitcev@redhat.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: =?utf-8?B?5Zue5aSNOiBbUEFUQ0g=?= =?utf-8?Q?=5D?= USB: usblp: Add
 device status detection in usblp_poll()
Message-ID: <YDymu1AlS+8UjdXG@kroah.com>
References: <20210301040300.20834-1-qiang.zhang@windriver.com>
 <YDyfL/yg9QNM4nku@kroah.com>
 <BYAPR11MB263268B5FD6EB3C3B80B63FBFF9A9@BYAPR11MB2632.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <BYAPR11MB263268B5FD6EB3C3B80B63FBFF9A9@BYAPR11MB2632.namprd11.prod.outlook.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Mar 01, 2021 at 08:26:22AM +0000, Zhang, Qiang wrote:
> 
> 
> ________________________________________
> 发件人: Greg KH <gregkh@linuxfoundation.org>
> 发送时间: 2021年3月1日 16:00
> 收件人: Zhang, Qiang
> 抄送: zaitcev@redhat.com; linux-usb@vger.kernel.org
> 主题: Re: [PATCH] USB: usblp: Add device status detection in usblp_poll()
> 
> [Please note: This e-mail is from an EXTERNAL e-mail address]
> 
> On Mon, Mar 01, 2021 at 12:03:00PM +0800, qiang.zhang@windriver.com wrote:
> > From: Zqiang <qiang.zhang@windriver.com>
> >
> > If usblp device has been disconnected, direct return
> > 'EPOLLHUP | EPOLLERR' in usblp_poll().
> >
> >Why?  What problem are you solving here?  Is this fixing an >older
> >commit, if so, what one?
> >
> 
> There is not need fix older commit.
> After the device is disconnected, if the userspace call poll/select() function, will block and never be awakened .

If the device is disconnected, how can the file be opened at all?
Shouldn't it have been torn down already?

And now you are holding a lock across some poll_wait() calls, is that
going to cause problems?

thanks,

greg k-h
