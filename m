Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 17808B8B55
	for <lists+linux-usb@lfdr.de>; Fri, 20 Sep 2019 09:03:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2394932AbfITHDi (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 20 Sep 2019 03:03:38 -0400
Received: from mail-wr1-f48.google.com ([209.85.221.48]:38078 "EHLO
        mail-wr1-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2394945AbfITHDh (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 20 Sep 2019 03:03:37 -0400
Received: by mail-wr1-f48.google.com with SMTP id l11so5579127wrx.5
        for <linux-usb@vger.kernel.org>; Fri, 20 Sep 2019 00:03:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=unipv-it.20150623.gappssmtp.com; s=20150623;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=iPb11oBM4mXymFs4UUGvQ+4qCrRBdbOKjtlw3sgl95E=;
        b=vXH5kAAX82UGTz+MibXvrnLawKTxDfMWSdnpdfZBHXooZKTd9IPmuU6vDFC99SCQzf
         XJv/8sA6CkmKXBt0DcK1pq/NinQJfQdjXrmaTGlDsIlnOQgMdOykNegVIQZrvLBRSs3G
         HAWanLAYYDUlrVGm1MooqH1Vqig3yYYVvbPmlIzpb77lM62Fp4+IZ3ACuUab7Ws4lTti
         X3j3RAZ+L1jceTG2oasvZCGZljm+RnG5hLJWIrudPUr1VXqLWGoSHhUahmH7FMsG1f7k
         FjjqQBEVaiBAvZaPqJTfLHhDarGdwJA2N+VeMxT6n8cvnp2r3De+D6WuXLSoxvds8clv
         qtZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=iPb11oBM4mXymFs4UUGvQ+4qCrRBdbOKjtlw3sgl95E=;
        b=HWujeGD2RjcwWLRyYN0xZTE52qpn2MlvHWPdIN0klg+tlCP8hJAb/XkoX20+FUxVEM
         ktE7U07jsTECpSNEV0I0oZAAobwOWZdKud1ShK6id0LtsKzYZRepHNhY/VbwTlyzK2Iv
         egtq5qdps0pSqF2GUeiz9aFc8LWAVKQP29QrhULeE6Fh1xoEjI5GlAm6Rlo99nvCpUV4
         PCEsZiDayYLJEtBph6qGMxPaNcpTHoA8mOWaT0f9bLoLdU6BRg6FdlG+bYXDoaKmmZAc
         p6ZVR77fi7LM6EMcdxfi/0SKX9847b5lcSJPlKpdpiMtoUt+PlPq7MtbW74RFY49zf+b
         rDcw==
X-Gm-Message-State: APjAAAVBU01FrTK34QZdAf3fRs0XC61zFw4NuOXGEZ5wTlgRJ6LOLsEc
        dng5hbbiKocFH9/TIAriVWh3Hg==
X-Google-Smtp-Source: APXvYqxECgCqPApWMHtyOa4f71NdXx5G1agL/X1wWGLsI39s8kKDaXojKuC8fWTB1X4KO8/r+o+unQ==
X-Received: by 2002:adf:e4ce:: with SMTP id v14mr10751214wrm.15.1568963015062;
        Fri, 20 Sep 2019 00:03:35 -0700 (PDT)
Received: from angus.unipv.it (angus.unipv.it. [193.206.67.163])
        by smtp.gmail.com with ESMTPSA id v7sm1093401wru.87.2019.09.20.00.03.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Sep 2019 00:03:33 -0700 (PDT)
Message-ID: <981fc98a9995eaee5f65709cacc46f13a2c603ad.camel@unipv.it>
Subject: Re: Slow I/O on USB media after commit
 f664a3cc17b7d0a2bc3b3ab96181e1029b0ec0e6
From:   Andrea Vai <andrea.vai@unipv.it>
To:     Damien Le Moal <Damien.LeMoal@wdc.com>,
        Alan Stern <stern@rowland.harvard.edu>
Cc:     Johannes Thumshirn <jthumshirn@suse.de>,
        Jens Axboe <axboe@kernel.dk>,
        USB list <linux-usb@vger.kernel.org>,
        SCSI development list <linux-scsi@vger.kernel.org>,
        Himanshu Madhani <himanshu.madhani@cavium.com>,
        Hannes Reinecke <hare@suse.com>,
        Ming Lei <ming.lei@redhat.com>, Omar Sandoval <osandov@fb.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Greg KH <gregkh@linuxfoundation.org>,
        Hans Holmberg <Hans.Holmberg@wdc.com>
Date:   Fri, 20 Sep 2019 09:03:28 +0200
In-Reply-To: <BYAPR04MB581603F036943752D799AD5CE7890@BYAPR04MB5816.namprd04.prod.outlook.com>
References: <Pine.LNX.4.44L0.1909190958140.1585-100000@iolanthe.rowland.org>
         <BYAPR04MB581603F036943752D799AD5CE7890@BYAPR04MB5816.namprd04.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.32.4 (3.32.4-1.fc30) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Il giorno gio, 19/09/2019 alle 14.14 +0000, Damien Le Moal ha scritto:
> On 2019/09/19 16:01, Alan Stern wrote:
> [...]
> > No doubt Andrea will be happy to test your fix when it's ready.

Yes, of course.

> 
> Hannes posted an RFC series:
> 
> https://www.spinics.net/lists/linux-scsi/msg133848.html
> 
> Andrea can try it.

Ok, but I would need some instructions please, because I am not able
to understand how to "try it". Sorry for that.

> Andrea,
> 
> What is the device in question ? Is it a USB external HDD ? SSD ?
> Flash key ?

It is a USB flash key (a.k.a. pendrive, flash drive, etc.):

ID 0951:1666 Kingston Technology DataTraveler 100 G3/G4/SE9 G2

Thanks, and bye
Andrea

