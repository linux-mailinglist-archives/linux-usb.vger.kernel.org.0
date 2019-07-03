Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3131C5CDD7
	for <lists+linux-usb@lfdr.de>; Tue,  2 Jul 2019 12:46:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725991AbfGBKqt (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 2 Jul 2019 06:46:49 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:43367 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725867AbfGBKqt (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 2 Jul 2019 06:46:49 -0400
Received: by mail-wr1-f66.google.com with SMTP id p13so17196530wru.10
        for <linux-usb@vger.kernel.org>; Tue, 02 Jul 2019 03:46:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=unipv-it.20150623.gappssmtp.com; s=20150623;
        h=message-id:subject:from:to:cc:date:user-agent:mime-version
         :content-transfer-encoding;
        bh=9mIX77VsesszTW96gmZViT/lzljGya5DrmFYXssiQzM=;
        b=UitxjCgkhI6hoKRwmwkLv8eMr6jLTmJUZ+haYwn39HWZ7s94VjadUEkxrhZZSKgizJ
         DO/8SqYOP9tBer8DSOfmQn/ONgtuS7XwZqO30BzEEs9nsWTT1dv3dI1wVVPhKpcqVrwz
         CmW/ZVN26S8fSDl9PK3qhpt6Lape6Ntv+RH1Q43lG4+ZYf0T5x6EHA/K6TbkRK6A0v4c
         jSpcuOSgCDf7vebknx9pH8CzM9X5EJqNbIYlci5OgrCqCyNA67kcQL9B3wBXLDu7ag3L
         FEahq/hRBANL843AVBENnPeY0SuKm/Mvep7atpq+11mZLAcWt3RtC1iNc473Dxk6OM5v
         Lq4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:user-agent
         :mime-version:content-transfer-encoding;
        bh=9mIX77VsesszTW96gmZViT/lzljGya5DrmFYXssiQzM=;
        b=JBzsWBN+i5oOKSFXG0F09/dFTm+NFlh/h81o9JNz7D8b9l6RPiPyUid+kPIQx6MaMY
         o0daTuO57KoHxJ50H9hmcz99ydllN/kYnIN+Y89f/TsOb6dQwtQq+sULV/56j5t7w49b
         OdUfWRNXHb5K4KvP4Fu0xhXLWONXEE+DUcmg6l5kqPcwdp6+YiHZbNDsSsZ25Pe+MYMQ
         Au6inE4lwUv4MTjEvIyTbyb9latqf4xAaTiAh/zUUO94n0nRNQPfW+b2hrHyVQsqduLx
         p2uGg7ptcEixqTR3pTGs2PNQrxpm/xn3zxYULtgEVKEUKG4sEr+25dC0IA/IcrOBLIpw
         nJ+Q==
X-Gm-Message-State: APjAAAU/ZoeEaB5GMyS4OhQhKu9pXpxb/8epvloVjYwQ/hwyN0r6ZJIo
        COehwIMW61ucCqRGBgfGFORCuw==
X-Google-Smtp-Source: APXvYqyfunA/pT/9Y+WYN7pOIW4S9jagoY5RLRfSr4ahsHXb7LVWMIsZPFALTXaiFLUWm548AhyrWQ==
X-Received: by 2002:a5d:494d:: with SMTP id r13mr24507695wrs.152.1562064406731;
        Tue, 02 Jul 2019 03:46:46 -0700 (PDT)
Received: from angus.unipv.it (angus.unipv.it. [193.206.67.163])
        by smtp.gmail.com with ESMTPSA id c1sm26364690wrh.1.2019.07.02.03.46.46
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 02 Jul 2019 03:46:46 -0700 (PDT)
Message-ID: <cc54d51ec7a203eceb76d62fc230b378b1da12e1.camel@unipv.it>
Subject: Slow I/O on USB media after commit
 f664a3cc17b7d0a2bc3b3ab96181e1029b0ec0e6
From:   Andrea Vai <andrea.vai@unipv.it>
To:     Jens Axboe <axboe@kernel.dk>
Cc:     linux-usb@vger.kernel.org, linux-scsi@vger.kernel.org,
        Himanshu Madhani <himanshu.madhani@cavium.com>,
        Hannes Reinecke <hare@suse.com>,
        Ming Lei <ming.lei@redhat.com>, Omar Sandoval <osandov@fb.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Greg KH <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>
Date:   Tue, 02 Jul 2019 12:46:45 +0200
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.5 (3.30.5-1.fc29) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,
  I have a problem writing data to a USB pendrive, and it seems
kernel-related. With the help of Greg an Alan (thanks) and some
bisect, I found out the offending commit being

commit f664a3cc17b7d0a2bc3b3ab96181e1029b0ec0e6
Author: Jens Axboe <axboe@kernel.dk>
Date:   Thu Nov 1 16:36:27 2018 -0600

    scsi: kill off the legacy IO path
    
    This removes the legacy (non-mq) IO path for SCSI.
    
So, here I am to notify you about the problem and ask you if I can
help in any way to work it out and fix it.

The problem is that if I copy a file from the internal SATA HD to the
pendrive, it takes ~10 times to complete (in respect of the time
needed with the patch reverted).

The test script, which I use to detect if the problem triggers or not,
is:

#!/bin/bash
logfile=...
uname -a | tee -a $logfile
echo -n "Begin: " | tee -a $logfile
date | tee -a $logfile
touch inizio
SECONDS=0
mount UUID="05141239-4ea5-494d-aa91-acd67db89ce5" /mnt/pendrive
cp /NoBackup/buttare/testfile /mnt/pendrive
umount /mnt/pendrive
tempo=$SECONDS
touch fine
echo -n "...end: " | tee -a $logfile
date | tee -a $logfile
echo "It took $tempo seconds!" | tee -a $logfile

If I run the test with a 512MB file it takes >10min vs. half a minute.

The problem is still present in last tested git (cloned today in the
morning).

You can see the previous discussion that lead to these results at

https://marc.info/?t=155922230700001&r=1&w=2

Thanks, and bye
Andrea

