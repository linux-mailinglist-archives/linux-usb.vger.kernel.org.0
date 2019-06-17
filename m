Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BD33E487EA
	for <lists+linux-usb@lfdr.de>; Mon, 17 Jun 2019 17:52:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727996AbfFQPw3 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 17 Jun 2019 11:52:29 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:39428 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726047AbfFQPw3 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 17 Jun 2019 11:52:29 -0400
Received: by mail-wm1-f66.google.com with SMTP id z23so9670922wma.4
        for <linux-usb@vger.kernel.org>; Mon, 17 Jun 2019 08:52:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=unipv-it.20150623.gappssmtp.com; s=20150623;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=ihZxZCyFAJImgxmZIDCtKX5ELosmgRTlRbhnf62hTm4=;
        b=qSyI1Hj4NncegrMhd6ljAtZuoFn+27xEOpnIe/0Bd4AA2oE8jEK6yDVYBGs6WAXf8S
         B+/FvvLwyUjYKl5O5eMpU5UEvM0Jt7je6aJg0DIdXjN0zIzeGPjWUs7ExF310vlzreRQ
         hTBoY2shA9BdOCRM5hbNO0PnUre/KGHV133n1kThwISVn+O/BcUNOtA51ONsuUWG61se
         fKpdj7SNy3yPHIn/B/hC8qojI2NF8u6q1c+fjFJ1Ev8C2sh43N9xovooinfGouxj13L9
         oxgpzp+A9NZBREiClWvx54AxeXIxv5/w3qDhRj2DsS0ZOJ0Q+t/IgrHiCz9EnbJ0sdMz
         wxsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=ihZxZCyFAJImgxmZIDCtKX5ELosmgRTlRbhnf62hTm4=;
        b=QkgtSbZKGWN0xXCaTqje0D1IgjqE6U1Zaw3mwMCIsqAiAqWxPcTaT8mmlvqrose/Bs
         DfinXHKq9Vij0VlU5bvBEBWIk+8gl6NtU2uqgamjuocxsC9DGnO/x7g+8X95KSL/5Ajk
         YrDobOlZldwiVSeCcGyMMv5LUVYj1tKF7VBvl4qasiZFjRk4aYeen8EYPfHZWH0djsXB
         gyk2Ee2o8BVseHPL3oPxUY//EiequpXoNfzyjVnvQWcNmQY8c3ik5AkswLGHS9ugv1OP
         28+RXvQ94DGD26Q9eX6Sl8olkrjIc1skWEwO+wja1S4t368XkCLrl7EVNp4Zh/F+PDr4
         kiqw==
X-Gm-Message-State: APjAAAXAih8OsAV2OdE/H4AHpQx4oGF3I8nSZ0tTOeoaE7kXAHh9vMVS
        49GkXLLOgmtuC8ZJIvYgn/f6Og==
X-Google-Smtp-Source: APXvYqxjCIYnbXUe1INiTYGdtHEwhgWYgymfwdn6GNTIwh/Gy40VYaJJLynCr1cllcbGuQm4IIIkBQ==
X-Received: by 2002:a1c:cfc3:: with SMTP id f186mr18166351wmg.134.1560786746436;
        Mon, 17 Jun 2019 08:52:26 -0700 (PDT)
Received: from angus.unipv.it (angus.unipv.it. [193.206.67.163])
        by smtp.gmail.com with ESMTPSA id l17sm17143563wrq.37.2019.06.17.08.52.25
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 17 Jun 2019 08:52:25 -0700 (PDT)
Message-ID: <01c48aab5eedb26db5ccd389293a975ca3ac197b.camel@unipv.it>
Subject: Re: Slow I/O on USB media
From:   Andrea Vai <andrea.vai@unipv.it>
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     Greg KH <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org
Date:   Mon, 17 Jun 2019 17:52:20 +0200
In-Reply-To: <Pine.LNX.4.44L0.1906101030280.1560-100000@iolanthe.rowland.org>
References: <Pine.LNX.4.44L0.1906101030280.1560-100000@iolanthe.rowland.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.5 (3.30.5-1.fc29) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Il giorno lun, 10/06/2019 alle 10.40 -0400, Alan Stern ha scritto:
> On Sat, 8 Jun 2019, Andrea Vai wrote:
> 
> [...]

Hi,
  I have concluded the (third) bisect, and still haven't come to an
end, but I have collected as much information as I can:

- I started again from:
cd /NoBackup/kernel
rm -rf linux
git clone git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
cd linux
cp /boot/config-4.20.13-200.fc29.x86_64 .config
git bisect start
git bisect good v4.20

- To build each kernel, I have created a build script that simply
does:
make clean && make -j4 && make modules_install && make install &&
grub2-mkconfig -o /boot/grub2/grub.cfg && ls -lrt /boot/v*

- Then, used grubby --set-default to set the last kernel built (took
from the output of the last command of the build script)

- Rebooted and check with "uname -a" that the correct kernel is
actually the last built, comparing the # in the output of "uname -a"
with the content of the .version file;

- Do the test, using a script I created:

logfile=...
echo -n "Inizio: " | tee -a $logfile
date | tee -a $logfile
uname -a | tee -a $logfile
touch inizio
mount UUID="05141239-4ea5-494d-aa91-acd67db89ce5" /mnt/pendrive
cp /NoBackup/buttare/ubuntu-14.04.5-desktop-i386.iso /mnt/pendrive
umount /mnt/pendrive
echo -n "...fine: " | tee -a $logfile
date | tee -a $logfile
touch fine

Then, from the script output and the log file, I ran "git bisect bad"
each time the time taken was more than the time resulting with the
"good" kernel(s) (then started again with the build, and so on).

That happened ALL times, so I never encountered a kernel that made me
say "git bisect good". Usually, the time took more than 20 minutes
(remember, the good kernel takes 1min15sec to copy), except a couple
of cases where it took 11 and 15 minutes. I assumed that a "good"
kernel would be one that behaves the same as the "original good" one
(1:15 min), but may I be wrong in this assumption? Note that the
1:15min time is measured when the system usually makes (lot of) other
work, because it's the kernel I use regularly (i.e., also when I don't
do the tests).

Also, to answer to Alan:

   Also, it's possible that what you're testing for isn't caused by
   the 
   kernel in the first place (i.e., running the test several times
   under 
   the _same_ kernel might give different results).  In that case, 
   bisection would be pointless.

I have tried to exclude it by doing many tries (10) for some kernels.
I should have done it for all the kernels I built, but for now I did
it for the last one (see below) and "good" one (4.20) only, because I
would like to be sure the good one really runs fine, and in this case
the results are very homogeneous: average time is 1:12 (m:s), and the
standard deviation is 3 seconds.

For the other kernels I did one only try each, and they give very
different results among each other, spacing from 55min to 6min (other
examples are 38, 11, 22, 28, 23, 25, 15, 22, 30, 13 min), but even
with the best case the result was some 5 times slower than the "good"
one, so I marked it as "bad".

The ".config" file was never touched by me manually (I noticed that
sometimes I had to reply to some questions to configure the kernel,
and in those cases the .config content changed. Those cases were
frequent at the beginning of the bisect, and never happened after the
7th, 8th step roughly).

The last bisect command showed:

a1cccdcf330e2a59b72b1588a7ef87cbaaa8a4e9 is the first bad commit
commit a1cccdcf330e2a59b72b1588a7ef87cbaaa8a4e9
Author: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Date:   Thu Sep 20 12:27:04 2018 +0200

    drm/i915: Clean up casts to crtc_state in
intel_atomic_commit_tail()
    
    Use old/new_intel_crtc_state, and get rid of all the conversion
casts
    where they don't add anything.
    
    Signed-off-by: Maarten Lankhorst <
maarten.lankhorst@linux.intel.com>
    Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
    Link: 
https://patchwork.freedesktop.org/patch/msgid/20180920102711.4184-2-maarten.lankhorst@linux.intel.com


And reverting it may have helped "a little", but didn't make the
problem disappear: 10 tries gave 4:47 +/- 2:01 minutes (but note that
I didn't do the 10 trials for the preceding kernel, and the only trial
on it gave 6:25 min).

By the way, I noticed an error ("Unexpected system error") reported
sometimes by the Fedora ABRT tool, that states "this is not a software
bug, the kernel log indicates it is a hardware error", or something
similar (sorry, at the moment I don't know exactly where to find it).

I have described as accurately 	as possible the steps I took because I
hope that you can find some mistakes in them. Sorry if it turns out to
be boring.

What do you suggest me?

Many thanks in advance for your help,
Andrea Vai

