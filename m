Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA16032B714
	for <lists+linux-usb@lfdr.de>; Wed,  3 Mar 2021 12:03:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238170AbhCCKbq (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 3 Mar 2021 05:31:46 -0500
Received: from mail.kernel.org ([198.145.29.99]:58282 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1842195AbhCCG5f (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 3 Mar 2021 01:57:35 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6B6FF64ECE;
        Wed,  3 Mar 2021 06:56:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1614754613;
        bh=I6l92LzMh5YUaseZIvqu7vZ5CAdgxdLLuRuet+wabjU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=n5XtWpOdCLjo9xQEIOkXYdz0HUIOkHRqqW6pJajsAkJQTkioiRhyLE+2u/ZoX9Zty
         LIQ2OSqWbBW+mNbTW8N282ZKHIQJPrLfuzZ32VT/Wxuthk6FUOyZY/ph08F6byunZs
         pChJcojalVI+L7zZftlukisSeQzkBxwCLCtJjDtU=
Date:   Wed, 3 Mar 2021 07:56:49 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     "Zhang, Qiang" <Qiang.Zhang@windriver.com>
Cc:     Pete Zaitcev <zaitcev@redhat.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: =?utf-8?B?5Zue5aSNOiBbUEFUQ0g=?= =?utf-8?Q?=5D?= USB: usblp: Add
 device status detection in usblp_poll()
Message-ID: <YD8zMaqC489jOGir@kroah.com>
References: <20210301040300.20834-1-qiang.zhang@windriver.com>
 <YDyfL/yg9QNM4nku@kroah.com>
 <BYAPR11MB263268B5FD6EB3C3B80B63FBFF9A9@BYAPR11MB2632.namprd11.prod.outlook.com>
 <YDymu1AlS+8UjdXG@kroah.com>
 <BYAPR11MB2632AE1A6D78903112F86062FF9A9@BYAPR11MB2632.namprd11.prod.outlook.com>
 <YD3jlIR7UJjXT6Se@kroah.com>
 <BYAPR11MB263258B4BD102A08BF454D82FF999@BYAPR11MB2632.namprd11.prod.outlook.com>
 <20210302231254.7a0e32cb@suzdal.zaitcev.lan>
 <BYAPR11MB2632C3C64F5B9116E0D074E4FF989@BYAPR11MB2632.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <BYAPR11MB2632C3C64F5B9116E0D074E4FF989@BYAPR11MB2632.namprd11.prod.outlook.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Mar 03, 2021 at 06:12:47AM +0000, Zhang, Qiang wrote:
> 
> 
> >________________________________________
> >发件人: Pete Zaitcev <zaitcev@redhat.com>
> >发送时间: 2021年3月3日 13:12
> >收件人: Zhang, Qiang
> >抄送: Greg KH; linux-usb@vger.kernel.org; zaitcev@redhat.com
> >主题: Re: [PATCH] USB: usblp: Add device status detection in >usblp_poll()
> >
> >[Please note: This e-mail is from an EXTERNAL e-mail address]
> >
> >On Tue, 2 Mar 2021 07:41:07 +0000
> >"Zhang, Qiang" <Qiang.Zhang@windriver.com> wrote:
> 
> > and also I find  similar usage in usb/class/usbtmc.c
> 
> >Seems like a bug indeed, but I don't like the example in usbtmc.c.
> >Please let me know if the following is acceptable:
>  
> I agree with this change .

Great, can I get a "Reviewed-by:" line from you then?

thanks,

greg k-h
