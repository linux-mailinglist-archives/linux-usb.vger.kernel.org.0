Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E6D9F10C481
	for <lists+linux-usb@lfdr.de>; Thu, 28 Nov 2019 08:47:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727415AbfK1HrB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 28 Nov 2019 02:47:01 -0500
Received: from mail-wr1-f46.google.com ([209.85.221.46]:40614 "EHLO
        mail-wr1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727227AbfK1HrB (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 28 Nov 2019 02:47:01 -0500
Received: by mail-wr1-f46.google.com with SMTP id c14so5219570wrn.7
        for <linux-usb@vger.kernel.org>; Wed, 27 Nov 2019 23:46:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=unipv-it.20150623.gappssmtp.com; s=20150623;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=VFy1sFwSgg5UC5QpoP/yzBe3ULMeokNC0smHjyZo8m4=;
        b=sIsfCzbGKgcWkjWZs8tRQZ8ly2AgdodFKrI77iPfs/g9E0h8uFx+PaxeLU8aUgCW6H
         yHFUBD7sJ47+sIOlOIGV8RKGI2MfjNjG462r0TntGLDw1nWlthY6JnsFVJtR/go5nAsp
         AQsff9HkdTPEWczYjhOO6oo1kY6E4btCGBpLW07kz94HBRW7zV7dQZIfZdlBnAgN8W9j
         mbp5hvlcLo/enGp+Uow9dpJMOr+zW11oonCSjEaKCYusq29/zHWQvk1LUAURLinBXSxu
         ZBIZbytrJ6aqHEi4SQ07nbyRkJWEOBBSIPFQcLGaHF/oeVmea7AMKxSRqOGcb7ucAWIQ
         Upxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=VFy1sFwSgg5UC5QpoP/yzBe3ULMeokNC0smHjyZo8m4=;
        b=A7DPpGQtkOAlz/ij42f49Sw4VQXjyzs4ccTcz1BMuuqC6ZERzFhRiRC7sHMNiBIVXO
         JRVvJHAl9G0EFyorbW8hS7BiKlI2/FCCq0XhNqOCOnT/viD3TT6EiwfdrcDWSGIw/q8h
         YCJjTCUxKWbmBxYCe+f7cHQm9PllJFbvMiDrMcW0BtVFT5KjreHrngJHcIo2gLn/YtMT
         1tUo5Q01SeWWpLiokBou0ZR/WuFqUSAjBepCbOI9q+d2rwOMaGE4KBrKQLf9KRi/Rk7x
         MTjwkwMdHGo36FOxwricsvMG8xLvmdwAjfWOlP5USk1xiy5ejAmShqwDIOZ5s9bgjbZZ
         4M8w==
X-Gm-Message-State: APjAAAWXeLMPnIHNKhoAiPQNs3q8/uHkGykMj3AjFdU4ZKR/50/RSDGe
        pQrncgQCZimlSw71AOLPgJfKOg==
X-Google-Smtp-Source: APXvYqxCSYsgjrZbWU5SOnX8qESM6uMlLYOpke32BDxN1R/HG9BIzYO5SpnDKowE/yTBZtmSSEZhXg==
X-Received: by 2002:adf:ef4e:: with SMTP id c14mr11747570wrp.142.1574927218879;
        Wed, 27 Nov 2019 23:46:58 -0800 (PST)
Received: from angus.unipv.it (angus.unipv.it. [193.206.67.163])
        by smtp.gmail.com with ESMTPSA id 19sm25110905wrc.47.2019.11.27.23.46.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Nov 2019 23:46:58 -0800 (PST)
Message-ID: <c1358b840b3a4971aa35a25d8495c2c8953403ea.camel@unipv.it>
Subject: Re: AW: Slow I/O on USB media after commit
 f664a3cc17b7d0a2bc3b3ab96181e1029b0ec0e6
From:   Andrea Vai <andrea.vai@unipv.it>
To:     "Schmid, Carsten" <Carsten_Schmid@mentor.com>,
        Finn Thain <fthain@telegraphics.com.au>
Cc:     Ming Lei <ming.lei@redhat.com>,
        Damien Le Moal <Damien.LeMoal@wdc.com>,
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
Date:   Thu, 28 Nov 2019 08:46:57 +0100
In-Reply-To: <cb6e84781c4542229a3f31572cef19ab@SVR-IES-MBX-03.mgc.mentorg.com>
References: <20191109222828.GA30568@ming.t460p>
         <fa3b0cf1f88e42e1200101bccbc797e4e7778d58.camel@unipv.it>
         <20191123072726.GC25356@ming.t460p>
         <a9ffcca93657cbbb56819fd883c474a702423b41.camel@unipv.it>
         <20191125035437.GA3806@ming.t460p>
         <bf47a6c620b847fa9e27f8542eb761529f3e0381.camel@unipv.it>
         <20191125102928.GA20489@ming.t460p>
         <e5093535c60fd5dff8f92b76dcd52a1030938f62.camel@unipv.it>
         <20191125151535.GA8044@ming.t460p>
         <0876e232feace900735ac90d27136288b54dafe1.camel@unipv.it>
         <20191126023253.GA24501@ming.t460p>
         <0598fe2754bf0717d81f7e72d3e9b3230c608cc6.camel@unipv.it>
         <alpine.LNX.2.21.1.1911271055200.8@nippy.intranet>
         <cb6e84781c4542229a3f31572cef19ab@SVR-IES-MBX-03.mgc.mentorg.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.32.4 (3.32.4-1.fc30) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Il giorno mer, 27/11/2019 alle 08.14 +0000, Schmid, Carsten ha
scritto:
> > 
> > > Then I started another set of 100 trials and let them run
> tonight, and
> > > the first 10 trials were around 1000s, then gradually decreased
> to
> > > ~300s, and finally settled around 200s with some trials below
> 70-80s.
> > > This to say, times are extremely variable and for the first time
> I
> > > noticed a sort of "performance increase" with time.
> > >
> > 
> > The sheer volume of testing (probably some terabytes by now) would
> > exercise the wear leveling algorithm in the FTL.
> > 
> But with "old kernel" the copy operation still is "fast", as far as
> i understood.
> If FTL (e.g. wear leveling) would slow down, we would see that also
> in
> the old kernel, right?
> 
> Andrea, can you confirm that the same device used with the old fast
> kernel is still fast today?

Yes, it is still fast. Just ran a 100 trials test and got an average
of 70 seconds with standard deviation = 6 seconds, aligned with the
past values of the same kernel.

Thanks,
Andrea

