Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7783C60FA5
	for <lists+linux-usb@lfdr.de>; Sat,  6 Jul 2019 11:33:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725990AbfGFJde (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 6 Jul 2019 05:33:34 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:52369 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725934AbfGFJde (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 6 Jul 2019 05:33:34 -0400
Received: by mail-wm1-f67.google.com with SMTP id s3so11286554wms.2
        for <linux-usb@vger.kernel.org>; Sat, 06 Jul 2019 02:33:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=unipv-it.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=KhgqzCQR1IGaHi6EqGsNl677Y7LMM3Dec/41gZZE7/E=;
        b=gR2DkyD7wyDVjiEb1jMXkr6UfIlzpZc05RvCnt0yzOXun5+jkRdABFvumAV7zhPiiw
         DADQIi6j60RFWVves3wPB/j+FtFx0T+IrCl068AFMumb0vdfImPkgsGxURtnPv2m0V0/
         Q/VPfzvzm7YAAEynXo/tfDyQgdAnL8n0PNxwICcIhAULq0H1psx5dFlbgaw/E0d1y2OD
         vk81GxpzSni5+vF63uDvJj4dnkuMTf1VtWtysGmEJQOlPY1LQg2yhrhXJfRUmGBv57fN
         nk1n3JybdiohCbIwcAiD2NzEp/gMhBwpIpHznPAzYTe+w0qLbHzIZZmr5WMjtbD4Cjq+
         BHfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=KhgqzCQR1IGaHi6EqGsNl677Y7LMM3Dec/41gZZE7/E=;
        b=aY4I/2AeMWOtNiOciuFaQC5W3H9gAdCieJpvenK8Jel0+g0MpnobcXL5MmZvPFMVaH
         Cz1iCimGJqd+cTgHdq9XEqWLdodGCo/fQqNYcI7r0tSVbat3iML8qqDW1Hk+pYFQLdS2
         y1PsJqfV0KGlVvs9dUDAq8hMVhGJK7HlMI4B4zONQzN5YOmRrIwoh2ASGw4N7sq/3nAM
         tE53UExRBpGm1GyUg9uMUpPgSnSJw8wS7suH8AItb0Qr/efAnhiC7jqv8nnkfEBoPZIv
         ijcrWuqLpwlNhkA6b/EO5sX1oiyNqrVXQV+fZmf0XCuk5nXilnq3lb4ISwXkxwUI/6K3
         /a/Q==
X-Gm-Message-State: APjAAAX4UJiFx6oPozzelEbqt+N6glaKtAR9AdIu4ijOX7Qt6Apvtx6m
        x1LIvStc+z+d8kfyeuaJNUQw4g==
X-Google-Smtp-Source: APXvYqzCsMbYkP1Xj6vDsW5o/AARKwqoL8QsFKt0zc2PPmuxkGOaGrF0KV927epB16rTeabfSYcVHQ==
X-Received: by 2002:a7b:c104:: with SMTP id w4mr7786116wmi.42.1562405611513;
        Sat, 06 Jul 2019 02:33:31 -0700 (PDT)
Received: from brian.unipv.it ([5.170.48.41])
        by smtp.gmail.com with ESMTPSA id w23sm12328006wmi.45.2019.07.06.02.33.29
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 06 Jul 2019 02:33:30 -0700 (PDT)
Date:   Sat, 6 Jul 2019 11:33:27 +0200
From:   Andrea Vai <andrea.vai@unipv.it>
To:     Ming Lei <ming.lei@redhat.com>
Cc:     Jens Axboe <axboe@kernel.dk>, linux-usb@vger.kernel.org,
        linux-scsi@vger.kernel.org,
        Himanshu Madhani <himanshu.madhani@cavium.com>,
        Hannes Reinecke <hare@suse.com>,
        Omar Sandoval <osandov@fb.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Greg KH <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>
Subject: Re: Slow I/O on USB media after commit
 f664a3cc17b7d0a2bc3b3ab96181e1029b0ec0e6
Message-ID: <20190706093327.GA31927@brian.unipv.it>
References: <cc54d51ec7a203eceb76d62fc230b378b1da12e1.camel@unipv.it>
 <20190702120112.GA19890@ming.t460p>
 <20190702223931.GB3735@brian.unipv.it>
 <20190703020119.GA23872@ming.t460p>
 <20190703051117.GA6458@brian.unipv.it>
 <20190703063603.GA32123@ming.t460p>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190703063603.GA32123@ming.t460p>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 03/07/19 14:36:05, Ming Lei wrote:
> On Wed, Jul 03, 2019 at 07:11:17AM +0200, Andrea Vai wrote:
> > On 03/07/19 10:01:23, Ming Lei wrote:
> > > On Wed, Jul 03, 2019 at 12:39:31AM +0200, Andrea Vai wrote:
> > > > On 02/07/19 20:01:13, Ming Lei wrote:
> > > > > On Tue, Jul 02, 2019 at 12:46:45PM +0200, Andrea Vai wrote:
> > > > > > Hi,
> > > > > >   I have a problem writing data to a USB pendrive, and it seems
> > > > > > kernel-related. With the help of Greg an Alan (thanks) and some
> > > > > > bisect, I found out the offending commit being
> > > > > > 
> > > > > > commit f664a3cc17b7d0a2bc3b3ab96181e1029b0ec0e6
> > > > > > 
> > > > > >  [...]    
> > > > > >     
> [...]
> Then could you install bcc package and collect the IO trace?
> 
> 	sudo /usr/share/bcc/tools/biosnoop | grep sdN
> 
> sdN is your USB disk device name.

The command runs forever (or at least for hours) without giving any output through "|grep sdf". The device is connected, but not mounted. Maybe I should run the command with the device mounted? Or while performing the test?
The command itself seems to work, as /usr/share/bcc/tools/biosnoop | tee -a biosnoop.txt produces an output file sized about some MB in some hours. 

What should I do?

Thanks,
Andrea

