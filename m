Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 86AA411EE1
	for <lists+linux-usb@lfdr.de>; Thu,  2 May 2019 17:46:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728385AbfEBPlz (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 2 May 2019 11:41:55 -0400
Received: from mail-oi1-f196.google.com ([209.85.167.196]:36380 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727737AbfEBPly (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 2 May 2019 11:41:54 -0400
Received: by mail-oi1-f196.google.com with SMTP id l203so2071419oia.3
        for <linux-usb@vger.kernel.org>; Thu, 02 May 2019 08:41:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=0zwnbqr+PBvZo/W8N/FG9Sj4vOUMec1PwHeXju5Ge14=;
        b=iNhbsSn5EdGbm5UeV7vwC/NOlDODSvzwOXxCIlSWMeNOdILtNtpQzyhEVzJeULkIYA
         rLH8rRlxLCdJ8HnJjpy70e5Lv4Xk7iQ9Zll6aYGBZvSRLQeQVTBKgnKMWAqWwFNlPJz/
         81qfCIgy8h/qIO7paDSkm8gOAZfPmOrig0NVXQffDlkV9/adF4C8K85rJgoJtIdkRYE+
         E83NERKRRLL0671axWJidLv8ipWAzfakdqFBNITeqVJqdMSITeE+OoOtV1WgTmrHzhWt
         1D3+u7Gb0syFnB2w+I6a6hWpI8A+Y8tIb3PDgXKIfasxagBXYM6KeVwO+RZ9xgw7Rtky
         rf9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=0zwnbqr+PBvZo/W8N/FG9Sj4vOUMec1PwHeXju5Ge14=;
        b=fm9/YjSdQBdnkjEbrPfVXta0/6B7jrnW+2J8YnW3e1TxwN/f64QeAHUOxKY/p3ZXPi
         MfCKJMy2SAw5VHBkLrOCbZB6izF7xYqnr8CYTkHrpsailgt/qwDEMMDha6NFOO6Ih5+B
         Z8KyPNaeOeLp0A6J5/cre1ANyugDG+L3mSl+mqVO7l41pRZZtJxoheduf7dJETiMmjj1
         p39ASyaqg6em3DhEVGCocSwWXuKkrowaF22nOxq/dlgzjzmN8wOjserWudLiUzkRYmk7
         xutFAoLNXSk4xQBufRoU93545nMRXx97fBnxSokRe8fWlPDJ6W7Ik/+hi0Sx/0NtngbJ
         79sQ==
X-Gm-Message-State: APjAAAWS1GcP2ZuByDdRk+MLSHpKRyu1mk6Qd821DPMzSBnXtFxHN6+Z
        ADtZxZYoSivINhxJShYKUIbfk+Nb3DOYVUc/YN+Dm9YUzEY=
X-Google-Smtp-Source: APXvYqxFgIy4Dv06Mq9IDnVYQhab+LYToQfIODFrLfV/ahpSBhYVvlWYClNWF6VnyRC2+gKT6TJb7MNg7+3LVOpUQhM=
X-Received: by 2002:aca:441:: with SMTP id 62mr1686843oie.123.1556811713540;
 Thu, 02 May 2019 08:41:53 -0700 (PDT)
MIME-Version: 1.0
References: <CACX8e9MkgUH4giW8SVwQb3rJSq3RK-jth4SJbkpkKF3E29bgFg@mail.gmail.com>
In-Reply-To: <CACX8e9MkgUH4giW8SVwQb3rJSq3RK-jth4SJbkpkKF3E29bgFg@mail.gmail.com>
From:   Shiv Dev <shivfsdev@gmail.com>
Date:   Thu, 2 May 2019 21:11:42 +0530
Message-ID: <CACX8e9NPUKbZTD0-+_Yrzd6mUGmsHrYFQuj3RPsS5AQ7rLQymQ@mail.gmail.com>
Subject: Re: not seeing console logs using usb serial
To:     linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

I am using a USB serial cable and want to see the kernel logs on the
console, and towards that have the below line in /etc/default/grub

console=ttyUSB0,115200 console=tty0

Hardware: Intel compute stick
OS      : ubuntu 18.04
kernel : 4.18.0-18
Driver  : pl2303

I do not see the kernel logs, and it drops to a dracut shell because
the root is encrypted.

I am however able to write to the /dev/ttyUSB0 device, and am able to
see the output in minicom at the other end, which means that the
requisite driver is loaded in initramfs.
dracut:/# echo 'hello' > /dev/ttyUSB0

Not sure what I am missing here. Please help.

Not sure if this is the correct mailing list. Would linux-console be a
more appropriate list?

Regards,
Shiv
