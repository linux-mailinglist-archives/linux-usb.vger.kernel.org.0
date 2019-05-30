Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EF5B62FC14
	for <lists+linux-usb@lfdr.de>; Thu, 30 May 2019 15:18:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726566AbfE3NST (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 30 May 2019 09:18:19 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:56256 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725919AbfE3NST (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 30 May 2019 09:18:19 -0400
Received: by mail-wm1-f68.google.com with SMTP id u78so3958164wmu.5
        for <linux-usb@vger.kernel.org>; Thu, 30 May 2019 06:18:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=unipv-it.20150623.gappssmtp.com; s=20150623;
        h=message-id:subject:from:to:date:user-agent:mime-version
         :content-transfer-encoding;
        bh=/92tb+flCLO5jSh12AsWD+Oh8tbLRXvhMgq53pYGuFc=;
        b=ogVCkUYr2oRsaatvK68GUHo9KpeUe/GUKTK4qf1iJJPJGOzj0Ub+u8rcxPep658M4E
         fPq5pn3Gy0aHtWODlHA2NT3JtprPUG6ZtWiOHWMF1e34tdrUwlNm6kwziZbX/YUc5pCD
         +IhkdOJ6izIu4/ws9vuzIxX22m8t6mq6vqBFKbRFCU0zCgIBqjhZ+Kw62PoY9rHefMuY
         BGyvvnWZ+0ZA9Yhp1ozQxI0KHFBWgkNaIvkoCvZG84IfT7/ANrW19g31PLfatEOmjJcu
         yMhWNn3FY5alcP387+0A+Fnhv1855dBgWmWADCXtlhEkgpVmjTp779sOSUeCgvARmyad
         o9fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:user-agent
         :mime-version:content-transfer-encoding;
        bh=/92tb+flCLO5jSh12AsWD+Oh8tbLRXvhMgq53pYGuFc=;
        b=dZmnkHqFCaCND6NiVNmJFHeSIsJBiJk118xbSVzSPCGJ+SMKnh2v+fJvBG3M0aQvib
         vYadNrAf2amho8fr/mmnWvqxvInMM8a2OXYfzKj4kbNcCaYdtd6a78TcJNQDBXaCOxa5
         c96w/Hm5MTS/ZA5aCXF3RotcexT5CnX/G1TKi+EzFkAeH5XG63WgOTWm+yWJc2g6LUY2
         q4B9BdtBp/rVBu79UCkadqrQns2hFpER3RrSLi8M7B37ID6e1+6UAiRV1OSrxRJoYDBU
         kW3sz+04Non1WJcTmw3E9vB5jOSSdr/aIyveWHQmlLAzMkVD52K0yiilhstizUhNyWEE
         S7aA==
X-Gm-Message-State: APjAAAXisyJ5S2vLMn6YCpeDa6WS7e7xRfstoKb1alvxM50cF8EX4XZr
        udDM7aMMimGsrvrs6j1gbF3ETjMyP5Y=
X-Google-Smtp-Source: APXvYqzGeiKsvq7naOo7IqIlHWDybGJyg3ggJzlfgkqPNSB8rO93EWYy5QvwKd6NCVIB9bymUuTiCQ==
X-Received: by 2002:a05:600c:22cc:: with SMTP id 12mr2295955wmg.141.1559222297340;
        Thu, 30 May 2019 06:18:17 -0700 (PDT)
Received: from angus.unipv.it (angus.unipv.it. [193.206.67.163])
        by smtp.gmail.com with ESMTPSA id i9sm1709716wmf.43.2019.05.30.06.18.15
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Thu, 30 May 2019 06:18:16 -0700 (PDT)
Message-ID: <2a9e1be71a2c6c940dac904752fdd34129745444.camel@unipv.it>
Subject: Slow I/O on USB media
From:   Andrea Vai <andrea.vai@unipv.it>
To:     linux-usb@vger.kernel.org
Date:   Thu, 30 May 2019 15:18:14 +0200
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.5 (3.30.5-1.fc29) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,
  I have a problem as described at [1], sorry for misunderstanding the
right place to report it.

The last kernel I can easily install and test was 5.0.17, but please
tell me if I should install a newer version (or anything else I should
do). I just tried installing 5.1.5 but suddenly stopped as I have
problem in compilation (please be patient with me, because I am not an
expert).

Here follows the bug report content:

I am experiencing slow I/O performance since kernel 5.0.1. File
operations are roughly 10 times slower than they used to be using
kernel up to 4.20. The problem is present when I use an USB pendrive,
and does not happen when I copy a file from an internal SATA to
another internal SATA hard disk.

You can see the discussion in the dar (backup software) mailing list
[2], because I first noticed the problem using dar, but then
discovered that also usual file operations such as "cp" suffer the
same problem.

Steps to Reproduce:
Copy a file (e.g. roughly 1GB) from an internal SATA HD to an USB
pendrive using "cp", using kernel 5.0.1+

Actual Results:
The file is copied in about 12 minutes

Expected Results:
The file is copied in about 1 minute (as it happens with kernel up to
4.20.13)

Running Fedora 29 on a Desktop PC.
Kernels found to be affected: e.g. 5.0.7, 5.0.9, 5.0.10, 5.0.13,
5.0.14, 5.0.17.

Thanks, and bye,
Andrea

[1] https://bugzilla.kernel.org/show_bug.cgi?id=203757
[2] https://sourceforge.net/p/dar/mailman/dar-support/thread/d490b5733731cbbb526d759c858a4b11a52fd179.camel%40unipv.it/#msg36660380

