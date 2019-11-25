Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 897AE109089
	for <lists+linux-usb@lfdr.de>; Mon, 25 Nov 2019 15:58:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728409AbfKYO6n (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 25 Nov 2019 09:58:43 -0500
Received: from mail-wr1-f44.google.com ([209.85.221.44]:33864 "EHLO
        mail-wr1-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728196AbfKYO6m (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 25 Nov 2019 09:58:42 -0500
Received: by mail-wr1-f44.google.com with SMTP id t2so18439735wrr.1
        for <linux-usb@vger.kernel.org>; Mon, 25 Nov 2019 06:58:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=unipv-it.20150623.gappssmtp.com; s=20150623;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=T38u6s14lrIokjD1pfLNotz8RAAutgMlPAmccZz9BPU=;
        b=cmrRsyyCllSniFrjyjMRP2Yq+xb/s78lts1IDyaIr80zUiVHhSDsEGvLidHhGIrZ6R
         ZwO3YdZ05CMmvY0kXGTB6Kuyjx7eFQMwmguM9fB8cI/Ma8S8LOrygGjGOJKOtL50dEo1
         OMCeKeQSxg8uvDKFgQnV3Z/6nUxTFCm3Mtyc744LDIp0Z2vY0h+WPJLvh2q/p+ZKhRMm
         kxcvSANreT5Olgl4GLV/6pFgznBPeGBMYZO665xL0C5V1K48/iczFWAabN9J8gCwqUfd
         dHcVHLF3fxRtgVvUaqIBDQdFgukSkp/wjtV43zd0UNKf0E4n9+O2udD7R55snM40piVb
         c3Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=T38u6s14lrIokjD1pfLNotz8RAAutgMlPAmccZz9BPU=;
        b=gB0BgbUgIxD2LUk3D+YqapPPJcgmcB4Q1wVKT60xzUjwf5wNJFuZOoP5bvsVejz4O/
         ADUChLPvhkf5U5ZPob7s2b7d9Ko4L3bQGcnMCNttb4mGTVfxwdkcsaJELJAtbLSDav8y
         3f1ckgwTQVA+E8dyenojWyXz/RSRvQY1so2SSI/ScXHmy/OT9xXqp1eBoOzku7lULEng
         W3yDAYkS44sQKoRBadsQmgM5HOxECfs00RAg7Q2sAWUBygvNtXtZZn2wTr6f3hbvgaFC
         eLqudCCt2YbjtEquERz4vfE+8zP/SspXYSSoGIkLTbY0F0rQan+hAV/wqpYw4Inj4UhX
         dJBw==
X-Gm-Message-State: APjAAAVZ2wOfcnpEa7GxJDKYO0cFGCmyFzRurCv0DbLxY8dCpKxDpoR2
        NEokmJjlGBtBMijLEGQaUSjkg2wuPRs=
X-Google-Smtp-Source: APXvYqwUlTUX50T3KRUQgx3L5evsrTDO/ep5jdtg2X5g0zuWja7jHszHn6fHn5H80Bj3MXxmxcrwTw==
X-Received: by 2002:a5d:640d:: with SMTP id z13mr13656971wru.181.1574693920561;
        Mon, 25 Nov 2019 06:58:40 -0800 (PST)
Received: from angus.unipv.it (angus.unipv.it. [193.206.67.163])
        by smtp.gmail.com with ESMTPSA id x8sm10676344wrm.7.2019.11.25.06.58.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Nov 2019 06:58:39 -0800 (PST)
Message-ID: <e5093535c60fd5dff8f92b76dcd52a1030938f62.camel@unipv.it>
Subject: Re: Slow I/O on USB media after commit
 f664a3cc17b7d0a2bc3b3ab96181e1029b0ec0e6
From:   Andrea Vai <andrea.vai@unipv.it>
To:     Ming Lei <ming.lei@redhat.com>
Cc:     Damien Le Moal <Damien.LeMoal@wdc.com>,
        Alan Stern <stern@rowland.harvard.edu>,
        Jens Axboe <axboe@kernel.dk>,
        Johannes Thumshirn <jthumshirn@suse.de>,
        USB list <linux-usb@vger.kernel.org>,
        SCSI development list <linux-scsi@vger.kernel.org>,
        Himanshu Madhani <himanshu.madhani@cavium.com>,
        Hannes Reinecke <hare@suse.com>,
        Omar Sandoval <osandov@fb.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Greg KH <gregkh@linuxfoundation.org>,
        Hans Holmberg <Hans.Holmberg@wdc.com>,
        Kernel development list <linux-kernel@vger.kernel.org>
Date:   Mon, 25 Nov 2019 15:58:34 +0100
In-Reply-To: <20191125102928.GA20489@ming.t460p>
References: <BYAPR04MB5816640CEF40CB52430BBD3AE7790@BYAPR04MB5816.namprd04.prod.outlook.com>
         <b22c1dd95e6a262cf2667bee3913b412c1436746.camel@unipv.it>
         <BYAPR04MB58167B95AF6B7CDB39D24C52E7780@BYAPR04MB5816.namprd04.prod.outlook.com>
         <CAOsYWL3NkDw6iK3q81=5L-02w=VgPF_+tYvfgnTihgCcwKgA+g@mail.gmail.com>
         <20191109222828.GA30568@ming.t460p>
         <fa3b0cf1f88e42e1200101bccbc797e4e7778d58.camel@unipv.it>
         <20191123072726.GC25356@ming.t460p>
         <a9ffcca93657cbbb56819fd883c474a702423b41.camel@unipv.it>
         <20191125035437.GA3806@ming.t460p>
         <bf47a6c620b847fa9e27f8542eb761529f3e0381.camel@unipv.it>
         <20191125102928.GA20489@ming.t460p>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.32.4 (3.32.4-1.fc30) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Il giorno lun, 25/11/2019 alle 18.29 +0800, Ming Lei ha scritto:
> On Mon, Nov 25, 2019 at 11:11:00AM +0100, Andrea Vai wrote:
> > Il giorno lun, 25/11/2019 alle 11.54 +0800, Ming Lei ha scritto:
> > > On Sat, Nov 23, 2019 at 04:44:55PM +0100, Andrea Vai wrote:
> > > > Il giorno sab, 23/11/2019 alle 15.28 +0800, Ming Lei ha
> scritto:
> > > > > 
> > > > > Please post the log of 'lsusb -v', and I will try to make a
> > > patch
> > > > > for
> > > > > addressing the issue.
> > > > 
> > > > attached,
> > > 
> > > Please apply the attached patch, and re-build & install & reboot
> > > kernel.
> > > 
> > > This time, please don't switch io scheduler.
> > 
> > # patch -p1 < usb.patch outputs:
> > 
> > (Stripping trailing CRs from patch; use --binary to disable.)
> > patching file block/blk-mq.c
> > Hunk #1 succeeded at 1465 (offset 29 lines).
> > Hunk #2 succeeded at 3061 (offset 13 lines).
> > (Stripping trailing CRs from patch; use --binary to disable.)
> > patching file drivers/scsi/scsi_lib.c
> > Hunk #1 succeeded at 1902 (offset -37 lines).
> > (Stripping trailing CRs from patch; use --binary to disable.)
> > patching file drivers/usb/storage/scsiglue.c
> > Hunk #1 succeeded at 651 (offset -10 lines).
> > (Stripping trailing CRs from patch; use --binary to disable.)
> > patching file include/linux/blk-mq.h
> > Hunk #1 succeeded at 226 (offset -162 lines).
> > (Stripping trailing CRs from patch; use --binary to disable.)
> > patching file include/scsi/scsi_host.h
> > patch unexpectedly ends in middle of line
> > patch unexpectedly ends in middle of line
> > 
> > Just to be sure I have to go on, is this correct? Sounds like an
> error
> > but I don't know if it is important.
> 
> Looks there is small conflict, however it has been fixed by patch,
> so
> it is correct, please go on your test.

Done, it still fails (2000 seconds or more to copy 1GB) :-(

cat /sys/block/sdf/queue/scheduler outputs:
[mq-deadline] none

What to try next?

Thanks,
Andrea

