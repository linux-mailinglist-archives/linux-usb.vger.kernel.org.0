Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D98B32A47F
	for <lists+linux-usb@lfdr.de>; Tue,  2 Mar 2021 16:41:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1383174AbhCBKre (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 2 Mar 2021 05:47:34 -0500
Received: from mail.kernel.org ([198.145.29.99]:50608 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1836606AbhCBHFp (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 2 Mar 2021 02:05:45 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id B02C3600CD;
        Tue,  2 Mar 2021 07:04:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1614668695;
        bh=pOmSSnYbbtR/9TOEn1bApe04ogdZGTRfoSDl6AX/sio=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Ldt/9YW2tFOGUoidmIYVm8jDOhoc6ggh+EzNOzqXdMOf1ZLs/jcmTrp/7DRvS5z+f
         vm9VBZZPGCay6dpcgZdua02iTWNyGfODuDo/AH0+c+QNycagYpzcXtlkCtJb5LA/41
         KLGKvFQB38N+fAUFVBZrrBLjoeQwgRtDG7z4WCyw=
Date:   Tue, 2 Mar 2021 08:04:52 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     "Zhang, Qiang" <Qiang.Zhang@windriver.com>
Cc:     "zaitcev@redhat.com" <zaitcev@redhat.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: =?utf-8?B?5Zue5aSNOiDlm57lpI06IFtQQVRD?= =?utf-8?Q?H=5D?= USB:
 usblp: Add device status detection in usblp_poll()
Message-ID: <YD3jlIR7UJjXT6Se@kroah.com>
References: <20210301040300.20834-1-qiang.zhang@windriver.com>
 <YDyfL/yg9QNM4nku@kroah.com>
 <BYAPR11MB263268B5FD6EB3C3B80B63FBFF9A9@BYAPR11MB2632.namprd11.prod.outlook.com>
 <YDymu1AlS+8UjdXG@kroah.com>
 <BYAPR11MB2632AE1A6D78903112F86062FF9A9@BYAPR11MB2632.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <BYAPR11MB2632AE1A6D78903112F86062FF9A9@BYAPR11MB2632.namprd11.prod.outlook.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Mar 01, 2021 at 08:52:58AM +0000, Zhang, Qiang wrote:
> 
> 
> ________________________________________
> 发件人: Greg KH <gregkh@linuxfoundation.org>
> 发送时间: 2021年3月1日 16:32
> 收件人: Zhang, Qiang
> 抄送: zaitcev@redhat.com; linux-usb@vger.kernel.org
> 主题: Re: 回复: [PATCH] USB: usblp: Add device status detection in usblp_poll()
> 
> [Please note: This e-mail is from an EXTERNAL e-mail address]
> 
> On Mon, Mar 01, 2021 at 08:26:22AM +0000, Zhang, Qiang wrote:
> >
> >
> > ________________________________________
> > 发件人: Greg KH <gregkh@linuxfoundation.org>
> > 发送时间: 2021年3月1日 16:00
> > 收件人: Zhang, Qiang
> > 抄送: zaitcev@redhat.com; linux-usb@vger.kernel.org
> > 主题: Re: [PATCH] USB: usblp: Add device status detection in usblp_poll()
> >
> > [Please note: This e-mail is from an EXTERNAL e-mail address]
> >
> > On Mon, Mar 01, 2021 at 12:03:00PM +0800, qiang.zhang@windriver.com wrote:
> > > From: Zqiang <qiang.zhang@windriver.com>
> > >
> > > If usblp device has been disconnected, direct return
> > > 'EPOLLHUP | EPOLLERR' in usblp_poll().
> > >
> > >Why?  What problem are you solving here?  Is this fixing an >older
> > >commit, if so, what one?
> > >
> >
> > There is not need fix older commit.
> > After the device is disconnected, if the userspace call >poll/select() function, will block and never be awakened .
> >
> >If the device is disconnected, how can the file be opened at >all?
> >Shouldn't it have been torn down already?
> 
> If the device disconnect happen after the file be opend, and then we call poll/select() will always blocked.
> Also  before we operate the device, we need to judge the state of the device. If it is disconnected, there is no need for subsequent operation .

But shouldn't the normal call to poll_wait() fail here?

> >And now you are holding a lock across some poll_wait() calls, >is that
> >going to cause problems?
> 
> The 'usblp->present' is portect by 'usblp->mut',  when devices disconnect, will acquire 'usblp->mut', and set 'usblp->present'
> zero. 

But you are now holding a mutex across a very very long period of time,
what will that change?

thanks,

greg k-h
