Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 63CE0108B6C
	for <lists+linux-usb@lfdr.de>; Mon, 25 Nov 2019 11:11:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727215AbfKYKLG (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 25 Nov 2019 05:11:06 -0500
Received: from mail-wm1-f49.google.com ([209.85.128.49]:34675 "EHLO
        mail-wm1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727433AbfKYKLG (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 25 Nov 2019 05:11:06 -0500
Received: by mail-wm1-f49.google.com with SMTP id j18so15790123wmk.1
        for <linux-usb@vger.kernel.org>; Mon, 25 Nov 2019 02:11:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=unipv-it.20150623.gappssmtp.com; s=20150623;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=Bwpubt5kO9MpF6+DhDd9tFXMqNxMMg0/sf7IorDXQyk=;
        b=vSvVHULp7DD7lYRvr2dnS4yvZFxgC2sHfS0hqs1sHp7uGdaRTaNLgh0nB15KXx49yI
         d9ndwlfx2sBiMePPGdCUiqrUVJmYbHkrbYzXF1vesYOZZldXSUjTo0a2hTmF9sjR9QyD
         6dxBUB1R7IAurqg4iAsu2obFxdeuVcAGHjc2J6u/3AGjCcEp8zpO6q7DjhE7qiu26MJN
         n9Yw/S1l3/MMIS/hPH2Wb1cTFITadmvYybyppnsA7vXNq8pdC/rO5U2rhFgsastbCupJ
         wdlwv5oVuAWFt07xWyzgcbt/Y0Hi1PQsGRAp1XBC1tThcm+in8vhIenirOlQClvvhFD9
         3BDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=Bwpubt5kO9MpF6+DhDd9tFXMqNxMMg0/sf7IorDXQyk=;
        b=l4l1icKK26vQgKco2ZWc8g/H7LSWqCCs6/fWBINQGVl5T8cz4bR4CynpVOTy9eJnS0
         9lv1zIHjkL1k0/iAznP5t7xl7jkFIsMukhmEGORuBvsVM0cBvAqjVFv7JoScrzDVFzeV
         mEIICKI/8gX3xTLqj5DUe5qmKmYHvTbiqJJzD0aMk0xVBygI4x3KKQg2/Zyn4dJVYUtS
         UwHIdiBmClErP/HxoLkiJZ9LiCaDDWuU3UyYidQMIiG3VfKZJAhrHno/3OHHcaz47XpI
         lOLf+hHVe7SfJkjF1WoNPgjBRlDwYkO1j2jJqiqchkc0DjTtxoNPe9YfGgUvzQdsP5IA
         onCQ==
X-Gm-Message-State: APjAAAUww6+d7w0O58vqPJbF0lgMIduXjN5BoMzQ2COz2mHArVvhJT5V
        6AhT4msiV5hs4RdDpOeGrmdwNg==
X-Google-Smtp-Source: APXvYqxYaE+TwA2dYd5tAr202DSVevWFDYjL18tBGvRXf25h/jnPJLpvFlNOJvKfFSjgx+2nhWTsXg==
X-Received: by 2002:a05:600c:2257:: with SMTP id a23mr29322180wmm.143.1574676662350;
        Mon, 25 Nov 2019 02:11:02 -0800 (PST)
Received: from angus.unipv.it (angus.unipv.it. [193.206.67.163])
        by smtp.gmail.com with ESMTPSA id 4sm8142393wmd.33.2019.11.25.02.11.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Nov 2019 02:11:01 -0800 (PST)
Message-ID: <bf47a6c620b847fa9e27f8542eb761529f3e0381.camel@unipv.it>
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
Date:   Mon, 25 Nov 2019 11:11:00 +0100
In-Reply-To: <20191125035437.GA3806@ming.t460p>
References: <Pine.LNX.4.44L0.1911061044070.1694-100000@iolanthe.rowland.org>
         <BYAPR04MB5816640CEF40CB52430BBD3AE7790@BYAPR04MB5816.namprd04.prod.outlook.com>
         <b22c1dd95e6a262cf2667bee3913b412c1436746.camel@unipv.it>
         <BYAPR04MB58167B95AF6B7CDB39D24C52E7780@BYAPR04MB5816.namprd04.prod.outlook.com>
         <CAOsYWL3NkDw6iK3q81=5L-02w=VgPF_+tYvfgnTihgCcwKgA+g@mail.gmail.com>
         <20191109222828.GA30568@ming.t460p>
         <fa3b0cf1f88e42e1200101bccbc797e4e7778d58.camel@unipv.it>
         <20191123072726.GC25356@ming.t460p>
         <a9ffcca93657cbbb56819fd883c474a702423b41.camel@unipv.it>
         <20191125035437.GA3806@ming.t460p>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.32.4 (3.32.4-1.fc30) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Il giorno lun, 25/11/2019 alle 11.54 +0800, Ming Lei ha scritto:
> On Sat, Nov 23, 2019 at 04:44:55PM +0100, Andrea Vai wrote:
> > Il giorno sab, 23/11/2019 alle 15.28 +0800, Ming Lei ha scritto:
> > > 
> > > Please post the log of 'lsusb -v', and I will try to make a
> patch
> > > for
> > > addressing the issue.
> > 
> > attached,
> 
> Please apply the attached patch, and re-build & install & reboot
> kernel.
> 
> This time, please don't switch io scheduler.

# patch -p1 < usb.patch outputs:

(Stripping trailing CRs from patch; use --binary to disable.)
patching file block/blk-mq.c
Hunk #1 succeeded at 1465 (offset 29 lines).
Hunk #2 succeeded at 3061 (offset 13 lines).
(Stripping trailing CRs from patch; use --binary to disable.)
patching file drivers/scsi/scsi_lib.c
Hunk #1 succeeded at 1902 (offset -37 lines).
(Stripping trailing CRs from patch; use --binary to disable.)
patching file drivers/usb/storage/scsiglue.c
Hunk #1 succeeded at 651 (offset -10 lines).
(Stripping trailing CRs from patch; use --binary to disable.)
patching file include/linux/blk-mq.h
Hunk #1 succeeded at 226 (offset -162 lines).
(Stripping trailing CRs from patch; use --binary to disable.)
patching file include/scsi/scsi_host.h
patch unexpectedly ends in middle of line
patch unexpectedly ends in middle of line

Just to be sure I have to go on, is this correct? Sounds like an error
but I don't know if it is important.

Thanks,
Andrea

