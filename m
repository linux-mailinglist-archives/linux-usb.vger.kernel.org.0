Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7B6F210E63C
	for <lists+linux-usb@lfdr.de>; Mon,  2 Dec 2019 08:01:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726179AbfLBHBo (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 2 Dec 2019 02:01:44 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:36034 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725965AbfLBHBo (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 2 Dec 2019 02:01:44 -0500
Received: by mail-wr1-f66.google.com with SMTP id z3so42728090wru.3
        for <linux-usb@vger.kernel.org>; Sun, 01 Dec 2019 23:01:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=unipv-it.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=OIeJzPkfZfkQW+lmWkeb7QT4hklfgkIqwhLk0IajLpI=;
        b=N0aMOxI3Jdo7KPnUkFwlOU6WRz95oOUare7m7+UEZEH1gf0oxUY2Sg6BwmHMnmqsxA
         16sb6a2cCJGC6N9a5Z8MFlD6SRdnSa3brpX3oIbIX6dwHxxVrJLoNemalxtDUjRfi7hd
         B3+FaHjMo5z29AI7l8M6we/KAb458Hf2uVKk2fUC905zKCOK0bMfgi/cIOrgBp9nDmES
         u1FdhoQaIs3KeZp6rld6IjQJ2r1kugusvB8awjLaI/lXY4lxX8wTJejXHVuhseopbF2F
         lgTWq6l9iGr61CHvvTtWwcC5ZnjgxQTnPK4qL6Ka329egpWKhyXa6h3IUARfOIxTZKIf
         iwYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=OIeJzPkfZfkQW+lmWkeb7QT4hklfgkIqwhLk0IajLpI=;
        b=qf0f05nj255AJGAiI3SGdnim/NBusld4pXhh4BUQIMPrguWegC7uD0EtlISaLW1su0
         FYpywIed3YsToYC2N9H0O7QUFWELqpkM94GG1m0+tuhOq0pp2Ym8rvFVlR3La+SN5zhI
         EACz6+QsS9nhZZLwLWSxXZRJUkXzm7ZtIG7/AcK2H78kyq7KpkxHRJi3EKY4xak/fpSi
         j8oYp2ZPOIXdrxpb+fIBitFdXDmVk1d1/OLrfPBJA+J0RkMh8/1Nbyf/MYCYdVKFAvrW
         dxwXLRmohzDta9VLpa7HSekd4TwR6Drd93wGNyUwVPrJIyy2KTnWxBvDjhFZ0eTLpOoS
         0lsg==
X-Gm-Message-State: APjAAAVweGUfIx8HcP3S1CvT+AQuxd29V8hIGfIA8Chy2IQdM+QTT/lC
        mPwapxGw8jtoLFR+f0Fc7rb2gA==
X-Google-Smtp-Source: APXvYqyl7g6ZdPSB/hceL6L6wfDEpdQFMZPEbs1pMw1w54KtldT/IG0NSVgZ9wWB3C2j/9a6/78T0g==
X-Received: by 2002:adf:eb08:: with SMTP id s8mr24816066wrn.5.1575270102144;
        Sun, 01 Dec 2019 23:01:42 -0800 (PST)
Received: from brian.unipv.it ([37.163.132.5])
        by smtp.gmail.com with ESMTPSA id y139sm18984178wmd.24.2019.12.01.23.01.38
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 01 Dec 2019 23:01:41 -0800 (PST)
Date:   Mon, 2 Dec 2019 08:01:35 +0100
From:   Andrea Vai <andrea.vai@unipv.it>
To:     Bernd Schubert <bs_lists@aakef.fastmail.fm>
Cc:     Ming Lei <ming.lei@redhat.com>,
        "Schmid, Carsten" <Carsten_Schmid@mentor.com>,
        Finn Thain <fthain@telegraphics.com.au>,
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
Subject: Re: AW: Slow I/O on USB media after commit
 f664a3cc17b7d0a2bc3b3ab96181e1029b0ec0e6
Message-ID: <20191202070135.GA4634@brian.unipv.it>
References: <0876e232feace900735ac90d27136288b54dafe1.camel@unipv.it>
 <20191126023253.GA24501@ming.t460p>
 <0598fe2754bf0717d81f7e72d3e9b3230c608cc6.camel@unipv.it>
 <alpine.LNX.2.21.1.1911271055200.8@nippy.intranet>
 <cb6e84781c4542229a3f31572cef19ab@SVR-IES-MBX-03.mgc.mentorg.com>
 <c1358b840b3a4971aa35a25d8495c2c8953403ea.camel@unipv.it>
 <20191128091712.GD15549@ming.t460p>
 <f82fd5129e3dcacae703a689be60b20a7fedadf6.camel@unipv.it>
 <20191129005734.GB1829@ming.t460p>
 <3c57bba1-831b-fc97-d5f7-e670f43fbbdc@aakef.fastmail.fm>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3c57bba1-831b-fc97-d5f7-e670f43fbbdc@aakef.fastmail.fm>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 29/11/19 12:44:53, Bernd Schubert wrote:
> >> Trace attached. Produced by: start the trace script
> >> (with the pendrive already plugged), wait some seconds, run the test
> >> (1 trial, 1 GB), wait for the test to finish, stop the trace.
> >>
> >> The copy took 73 seconds, roughly as already seen before with the fast
> >> old kernel.
> > 
> > This trace shows a good write IO order because the writeback IOs are
> > queued to block layer serially from the 'cp' task and writeback wq.
> > 
> > However, writeback IO order is changed in current linus tree because
> > the IOs are queued to block layer concurrently from the 'cp' task
> > and writeback wq. It might be related with killing queue_congestion
> > by blk-mq.
> 
> What about using direct-io to ensure order is guaranteed? Pity that 'cp'
> doesn't seem to have an option for it. But dd should do the trick.
> Andrea, can you replace cp with a dd command (on the slow kernel)?
> 
> dd if=<path-to-src-file> of=<path-to-copy-on-flash-device> bs=1M
> oflag=direct

On the "new bad patched" kernel, this command take 68 seconds to complete (mean on 100 trials, with a narrow standard deviation), so perfectly
aligned with the cp command on the old fast good kernel.

Thanks, and bye
Andrea
