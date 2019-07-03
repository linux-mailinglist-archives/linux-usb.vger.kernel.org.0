Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E2FFC5D8F6
	for <lists+linux-usb@lfdr.de>; Wed,  3 Jul 2019 02:32:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727144AbfGCAb7 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 2 Jul 2019 20:31:59 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:44087 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726736AbfGCAb7 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 2 Jul 2019 20:31:59 -0400
Received: by mail-wr1-f66.google.com with SMTP id e3so644169wrs.11
        for <linux-usb@vger.kernel.org>; Tue, 02 Jul 2019 17:31:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=unipv-it.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=JInSnb+MJaSXZCOEGe3YY8e/3kSMpHX4By/rUITTuWc=;
        b=eqlTB5IxQSa3sdlXXgmz6/zMit4L7DH3QUQaf6w5t5luf7h4L3PXHJ1A5uf8vvsYRW
         JOc2DySYfOGDiTeLQrUKKzgUiPIOTutIFqTwyEndbQLQA5rf7D0q17CQzULBfue1GVD0
         VIJ9txt1MVj0OgI6g/TJdUlpZSBm0B2AnrdvsfkbhMYV5iB58HfttsTQZwcapIVXXdIh
         lcLd9ulBMCK5N5HnT0SEmn2LtwlVnosTyKCSBzVav/dkU8NM03j+PWLR8fMmQMT5NIvQ
         VLMqgdgk8/HOsTj8ywYNuxPL53jXcY4i5+xWzKR6o5LJM5dbkZigjACjUIn6H3KAkwdC
         YtzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=JInSnb+MJaSXZCOEGe3YY8e/3kSMpHX4By/rUITTuWc=;
        b=r1AGcIelkxgbA432mMfyDrhL/bfDfToXZfKSHUNMCsesF2vpf0oG/0EnHWa88dy6DG
         0lmgcd7W6NfsDt5IpuXY+9/4DMxgehTQjIFN9ITDozkuPR9HD6kth4waSfCHHui7aaVT
         +OqoUa7CjAVDLMgjf2PtaI6qQpI53UC91QuOK+J2cATBI/4ijZwHZDH71Syjf4BBDHOZ
         fGFvwlHnCxYDK3uANU7Fs4EFEil2W3XTogi7ZDGwEZhKNxl4Lpk2Pj3JzmB/kJAeZZDE
         TN0ZnJfJ6hGnxC+5LeD6ycHz5wvcpaNTdJaONHoy8XefJ/pOARBltwyZ/dwmjb0SYiCB
         zm7g==
X-Gm-Message-State: APjAAAV0Cy/qSYJQ7gOSut0lnAG3du6Wvi34Zmhcn/ilLDeZG/Y9DUlG
        yzusXLt8ftd6ZBxgWOTMDrCBhGCK3+A=
X-Google-Smtp-Source: APXvYqz+t9niUvQbZ1Ny8iH2o9HNKfC4j2jq+uOLYcqw6hKxvI3uNeGedg3HrWz9WccnFmdOtGu4pw==
X-Received: by 2002:adf:ef08:: with SMTP id e8mr4702925wro.271.1562107175139;
        Tue, 02 Jul 2019 15:39:35 -0700 (PDT)
Received: from brian.unipv.it ([37.162.88.147])
        by smtp.gmail.com with ESMTPSA id q20sm256252wra.36.2019.07.02.15.39.33
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 02 Jul 2019 15:39:34 -0700 (PDT)
Date:   Wed, 3 Jul 2019 00:39:31 +0200
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
Message-ID: <20190702223931.GB3735@brian.unipv.it>
References: <cc54d51ec7a203eceb76d62fc230b378b1da12e1.camel@unipv.it>
 <20190702120112.GA19890@ming.t460p>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190702120112.GA19890@ming.t460p>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 02/07/19 20:01:13, Ming Lei wrote:
> On Tue, Jul 02, 2019 at 12:46:45PM +0200, Andrea Vai wrote:
> > Hi,
> >   I have a problem writing data to a USB pendrive, and it seems
> > kernel-related. With the help of Greg an Alan (thanks) and some
> > bisect, I found out the offending commit being
> > 
> > commit f664a3cc17b7d0a2bc3b3ab96181e1029b0ec0e6
> > 
> >  [...]    
> >     
> 
> One possible reason may be related with too small 'nr_requests', could
> you apply the following command and see if any difference can be made?
> 
> echo 32 > /sys/block/sdN/queue/nr_requests

I applied it (echo 32 > /sys/block/sdf/queue/nr_requests), ran the test again, and still failed. I assumed I didn't have to build the kernel again, did I? (sorry but I am not skilled)

Many thanks,
Andrea

