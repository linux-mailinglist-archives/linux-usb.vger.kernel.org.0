Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0C8091077E4
	for <lists+linux-usb@lfdr.de>; Fri, 22 Nov 2019 20:16:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726939AbfKVTQf (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 22 Nov 2019 14:16:35 -0500
Received: from mail-wm1-f43.google.com ([209.85.128.43]:54729 "EHLO
        mail-wm1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726744AbfKVTQe (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 22 Nov 2019 14:16:34 -0500
Received: by mail-wm1-f43.google.com with SMTP id x26so8322545wmk.4
        for <linux-usb@vger.kernel.org>; Fri, 22 Nov 2019 11:16:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=unipv-it.20150623.gappssmtp.com; s=20150623;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=kLw3pFSIZDVbnCzJ9DTnz/kpdFIQj08MUYSImiLSK9M=;
        b=lAULhbd8gCUzzbSRRCbFnF6HAk0C7AHCoTACxfKB1tGKbxZSaDKIWDVgNHcAchLKv8
         LDscNLVVrwROJqNW/pTga43LR4PFONqZ7jHpBUOBg71E3CkWo1YRYhaaqichBafqJfKF
         y1rvUMfk4dHQAWQJDnFFWv26VPlA3Vqtqq2QWXvLiG0x0tMjKXr1IB3gh9MgBAFdtLVJ
         as+HJxKP7zNBtroVe5un15GzXgCXdDsVj8YIZrYL8pjzhQHQvbOcOVFECaRLTc1enM3e
         F2Q8pRjvMyCrDZYlMM9fVE1FRmDSieqznFogt6IAF67w6W8vbx5SUMzCF7Ycu1oo/c4b
         hVHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=kLw3pFSIZDVbnCzJ9DTnz/kpdFIQj08MUYSImiLSK9M=;
        b=AMVGycojndxSAvQ07PTe2kV5d3uUgbU4wcjMIkpfnlbTW8uIwnz9L599jkA17q+NxO
         AM6aAUIb4njADzZzHTQzc9v7AxSDLgGEZjFlAu9PvXolBWvaNUGgCkrHhozupp9E7TUX
         f3TJJaSxLFjZMctesgBGu/9XHcSEKt4Urhd0cKSQxlb9wteiFb7CWIVP3l1iWjoTrfVW
         acPNtq0TV3D0LlA5I45hrddAlm80IqI7YFVNNTl8PLjuf4KsJoEcTnClOHl5LaldH6Hm
         /1iGsvo5temGTDQNbb64YOJlWW34WC3pf5gXxEmGJ8oQQaRIE1iU1/UnxjYMMuMcYZsT
         9avw==
X-Gm-Message-State: APjAAAXVmfm3KWuz9j0+ofLAfGufChu+yufc0iPQbhO67nE+7TFNxYI/
        WXWx5MJofbhgV9K2Vaak0oh3YQ==
X-Google-Smtp-Source: APXvYqyS5KI1oHFoY6/zQrlq8Yiqp7iqxRVDi01q+CokCcH37IjXgrnE6wN04s/h+IuCAivbEKXemw==
X-Received: by 2002:a7b:c34a:: with SMTP id l10mr14130871wmj.66.1574450191767;
        Fri, 22 Nov 2019 11:16:31 -0800 (PST)
Received: from angus.unipv.it (angus.unipv.it. [193.206.67.163])
        by smtp.gmail.com with ESMTPSA id t14sm8525469wrw.87.2019.11.22.11.16.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2019 11:16:31 -0800 (PST)
Message-ID: <fa3b0cf1f88e42e1200101bccbc797e4e7778d58.camel@unipv.it>
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
Date:   Fri, 22 Nov 2019 20:16:30 +0100
In-Reply-To: <20191109222828.GA30568@ming.t460p>
References: <Pine.LNX.4.44L0.1911061044070.1694-100000@iolanthe.rowland.org>
         <BYAPR04MB5816640CEF40CB52430BBD3AE7790@BYAPR04MB5816.namprd04.prod.outlook.com>
         <b22c1dd95e6a262cf2667bee3913b412c1436746.camel@unipv.it>
         <BYAPR04MB58167B95AF6B7CDB39D24C52E7780@BYAPR04MB5816.namprd04.prod.outlook.com>
         <CAOsYWL3NkDw6iK3q81=5L-02w=VgPF_+tYvfgnTihgCcwKgA+g@mail.gmail.com>
         <20191109222828.GA30568@ming.t460p>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.32.4 (3.32.4-1.fc30) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Il giorno dom, 10/11/2019 alle 06.28 +0800, Ming Lei ha scritto:
> Another thing we could try is to use 'none' via the following
> command:
> 
>  echo none > /sys/block/sdh/queue/scheduler  #suppose 'sdh' points
> to the usb storage disk
> 
> Because USB storage HBA is single hw queue, which depth is 1. This
> way
> should change to dispatch IO in the order of bio submission.
> 
> Andrea, could you switch io scheduler to none and update us if
> difference
> can be made?

Using the new kernel, there is indeed a difference because the time to
copy a file is 1800 seconds with [mq-deadline], and 340 seconds with
[none]. But that is still far away from the old kernel, which performs
the copy of the same file in 76 seconds.

Side notes:

- The numbers above are average values calculated on 100 trials for
each  different situation. As previously noticed on this thread, with
the new kernel the times are also very different among the different
trials in the same situation. With the old kernel the standard
deviation on the times in a set of 100 trials is much smaller (to give
some mean/sigma values: m=1800->s=530; m=340->s=131; m=76->s=13; ).

- The size of the transferred file has been 1GB in these trials.
Smaller files don't always give appreciable differences, but if you
want I can also provide those data. Of course, I can also provide the
raw data of each set of trials.

Thanks,
and bye,

Andrea

