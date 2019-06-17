Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 27C724890D
	for <lists+linux-usb@lfdr.de>; Mon, 17 Jun 2019 18:34:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726215AbfFQQe2 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 17 Jun 2019 12:34:28 -0400
Received: from mail-wm1-f48.google.com ([209.85.128.48]:39785 "EHLO
        mail-wm1-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725863AbfFQQe1 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 17 Jun 2019 12:34:27 -0400
Received: by mail-wm1-f48.google.com with SMTP id z23so62546wma.4
        for <linux-usb@vger.kernel.org>; Mon, 17 Jun 2019 09:34:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=unipv-it.20150623.gappssmtp.com; s=20150623;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=uE54zMu9YsGK6fSWY6X+jSw3tcusDOPCl2EIF3Hl9/w=;
        b=bGCmSaPGRzSVskNxU1r6P/FmjeqnlzJp5IxJFn7YhLyY50HzcZUJadlWKyef7Vd7LO
         BkHLVgQAKN/HsKxj/8xb5PqICrm6agFmvEq/HeTcgyuqtvlS9w1Wrlm5zWjCj//FXOyb
         LVmzTsM8IiGqncgPSYXjTADLV/AEM2WRFdfD9NmBEBuXXM1gKVUWqqBdbiBGFjFKe4Ko
         RkvW/mr0OWVa2/mUy0y5K4/M1kq2gWTadd5GqXMKIePAnnYN92MyL6WTq367qcnn+xlB
         uiTJ8s3FauWExYAQjmVy2ovvZN7Hhv4RIL7MC06rnspacEoWrkkCt9OnHBlUxAmhnIWX
         j+0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=uE54zMu9YsGK6fSWY6X+jSw3tcusDOPCl2EIF3Hl9/w=;
        b=EHvlLf9NSBE7+Pq7vEhq5fyx0rKQujhIPKHBr5dYsGMDRl1gsUEBHVa5KLXM73WTcf
         1eVZPIggtxQN73ica42pE5Q1fGPv7yfinCWd+FvUh1WWv8R8Z3CvPtlnI2shBXHBBY30
         iyTMpKlaymcNckf5U/1EB+9k9oMTmVGby14m8LGpd5S/bLlJMpMS3dzkvcW3nTKm67JK
         TG9NuifjPsCoAQdJcEGk3/OReoqkWKjd0jN4xWAOiH0G5WPy7YcV57V2zeWFnPIQgwE/
         YWxohH6sLd7l50SDB9Kn8RigbX7o0b9w+tLUwp9kWbXWj/EPQpsEHhm5mDwdBomG6lTR
         lJVA==
X-Gm-Message-State: APjAAAWpnNg4MVODBirAR8vpAcOIBnSTQ8fmiNI6XxFdLPII61oseDg8
        6Q88iWSofb8orhk4/NMOoZ0ggeW+UG4=
X-Google-Smtp-Source: APXvYqzJPU/LcpWC2jTvpKC02O4cUQqgYo1svc8xoZFUgZ4vlxPMnr9EMSWdUFYDbfmjoe5LHEpq+g==
X-Received: by 2002:a1c:6242:: with SMTP id w63mr21098454wmb.161.1560789265248;
        Mon, 17 Jun 2019 09:34:25 -0700 (PDT)
Received: from angus.unipv.it (angus.unipv.it. [193.206.67.163])
        by smtp.gmail.com with ESMTPSA id r2sm16572783wma.26.2019.06.17.09.34.24
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 17 Jun 2019 09:34:24 -0700 (PDT)
Message-ID: <6ff3332b940f02d988d9bc578c1c293e8424e439.camel@unipv.it>
Subject: Re: Slow I/O on USB media
From:   Andrea Vai <andrea.vai@unipv.it>
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     Greg KH <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org
Date:   Mon, 17 Jun 2019 18:34:23 +0200
In-Reply-To: <Pine.LNX.4.44L0.1906171202580.1738-100000@iolanthe.rowland.org>
References: <Pine.LNX.4.44L0.1906171202580.1738-100000@iolanthe.rowland.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.5 (3.30.5-1.fc29) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Il giorno lun, 17/06/2019 alle 12.14 -0400, Alan Stern ha scritto:
> On Mon, 17 Jun 2019, Andrea Vai wrote:
> 
> > [...]
> > 
> > That happened ALL times, so I never encountered a kernel that made
> me
> > say "git bisect good".
> 
> Really?  That strongly suggests that the 4.20 kernel also should
> have
> been marked bad.  Did you really test it exactly the same way as all
> the others?  That is, did you go through the entire procedure
> starting
> with "git checkout v4.20", then running the build script, then the
> reboot and "uname -a", and then the test script?

well, honestly, no, because (sigh) I didn't know the "git checkout"
command, sorry. I started with building 4.20 from the source
downloaded with

 wget https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/snapshot/linux-4.20.tar.gz

, then said "git bisect good v4.20".

Is this different from "git checkout v4.20"? I hope it is, so we have
found the mistake I have done.


> Or did you just run a few tests with the Fedora 4.20.13 kernel and
> assume that the results would be the same as those?

no, I am sure I have never used the Fedora kernel(s) during the last
bisect process.

> 
> > [...]
> 
> If _all_ the kernels you built and tested were bad then you
> probably 
> did not start the bisection from the right commit.

so, I hope this is true :-)

> 
> > By the way, I noticed an error ("Unexpected system error")
> reported
> > sometimes by the Fedora ABRT tool, that states "this is not a
> software
> > bug, the kernel log indicates it is a hardware error", or
> something
> > similar (sorry, at the moment I don't know exactly where to find
> it).
> 
> Did you look in the kernel log?

Yes I did, but I didn't took care about it very much. I will do it
again, and report here, if as far as I understand you are saying that
it could be useful.

> 
> > [...]
> 
> Compare the mainstream 4.20 kernel with the Fedora 4.20.13 kernel.  
> Also, maybe compare the mainstream 4.20.13 with Fedora's 4.20.13.

Sorry, what do you mean here by "compare"? And what is the
"mainstream"? If the mainstream is the one I got with wget, and if
"compare" means "see if they behave differently", so I have already
done it and they are both "good".

Thank you,
Andrea

