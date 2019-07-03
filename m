Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 92DF85DAB2
	for <lists+linux-usb@lfdr.de>; Wed,  3 Jul 2019 03:24:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727381AbfGCBYS (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 2 Jul 2019 21:24:18 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:40381 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726821AbfGCBYS (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 2 Jul 2019 21:24:18 -0400
Received: by mail-wm1-f65.google.com with SMTP id v19so453929wmj.5
        for <linux-usb@vger.kernel.org>; Tue, 02 Jul 2019 18:24:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=unipv-it.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=yUg05Hk1IFbGpfRrhKAsZAvC6wWCLTPkzcVqmZs4SKA=;
        b=g5iPeQmYLkfVdgBaJc3YBcT40rKuuYsJ+z7XCfgD2CCGWBDGKIquZvSYcM8XASQPFw
         OWdwjWTvaRS2B91hH8/ZjcPLuncpixJtFKBRqH5CjIovgA5GRC4Ts9h1vbo6nm7zjMI0
         s0cO5O2HploepnYJxLu0DKBsawX3kVep96gmUlbanWaY30/a8K63WPwde9tkASttbgPp
         xjy58UpjOMCu3qDjHYUxqrI7IzBcYo41iOspEKJ4Hhb1GzfhDBO/lM9f08CLYPi5h2vm
         /JkpWKhUPt/szBn9fVkV1DoU4Lv4VZztzs62svk96N3w/rXKfjrWCBjzgJVQYzJMDNWA
         3XVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=yUg05Hk1IFbGpfRrhKAsZAvC6wWCLTPkzcVqmZs4SKA=;
        b=DozJlMIz9NQkgssJbULTa91YEEiM5SfjtxV55ZFW6A2QP3HQ1rC9X/hf0lTEo2RT0r
         b71YZjCVJjIVJylpWeHFB6cbnqHZhoCGceTi4xPWtM/D546/NDMFKNEMyZODp85Obi6e
         vpn+pgTo2ftFjAFTJxM5qgLJC3ptv14nXcIclpGKxL7AMkG4nLJSgQg9qsfzGaJvPFYe
         SYwW72/XZJddZ9PZqzWYc3iI0CTRyLPBjd6vOr4qF3l4fLsRhVhPFAH+P//kxqrU2w0E
         4s3iZLvUwApG10n9eS25Rfhwtnk8iQHKxU/uElCFzqz+i+SeVDU3QUHrpzppo80xlcmQ
         BVog==
X-Gm-Message-State: APjAAAWrymWwleRZ6vGLQC1JQB+V6CDOv2YA53nsHyJEIIH4I3H09wjo
        w8VkaTkacwncx292R8pNl5kyoKHAw5I=
X-Google-Smtp-Source: APXvYqwAXjsPiygQ4TCbiDLx0JDEpLdDugHVs3Qg+aF7AKaEEbTDmboJT6HgQ5w7QajBFy+VPOe4FA==
X-Received: by 2002:a1c:ac81:: with SMTP id v123mr4932875wme.145.1562106995220;
        Tue, 02 Jul 2019 15:36:35 -0700 (PDT)
Received: from brian.unipv.it ([37.162.88.147])
        by smtp.gmail.com with ESMTPSA id t6sm540000wmb.29.2019.07.02.15.36.33
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 02 Jul 2019 15:36:33 -0700 (PDT)
Date:   Wed, 3 Jul 2019 00:36:30 +0200
From:   Andrea Vai <andrea.vai@unipv.it>
To:     Johannes Thumshirn <jthumshirn@suse.de>
Cc:     Jens Axboe <axboe@kernel.dk>, linux-usb@vger.kernel.org,
        linux-scsi@vger.kernel.org,
        Himanshu Madhani <himanshu.madhani@cavium.com>,
        Hannes Reinecke <hare@suse.com>,
        Ming Lei <ming.lei@redhat.com>, Omar Sandoval <osandov@fb.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Greg KH <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>
Subject: Re: Slow I/O on USB media after commit
 f664a3cc17b7d0a2bc3b3ab96181e1029b0ec0e6
Message-ID: <20190702223630.GA3735@brian.unipv.it>
References: <cc54d51ec7a203eceb76d62fc230b378b1da12e1.camel@unipv.it>
 <20190702115117.GC4463@x250.microfocus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190702115117.GC4463@x250.microfocus.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 02/07/19 13:51:17, Johannes Thumshirn wrote:
> On Tue, Jul 02, 2019 at 12:46:45PM +0200, Andrea Vai wrote:
> > Hi,
> >   I have a problem writing data to a USB pendrive, and it seems
> > kernel-related. With the help of Greg an Alan (thanks) and some
> > bisect, I found out the offending commit being
> > 
> > commit f664a3cc17b7d0a2bc3b3ab96181e1029b0ec0e6
> >
> > [...]
> 
> Hi,
> 
> Can you please check what IO scheduler you have set for your USB pendrive?
> 
> i.e. with:
> cat /sys/block/$DISK/queue/scheduler
>

# cat /sys/block/sdf/queue/scheduler
[mq-deadline] none

Many thanks,
Andrea

 
