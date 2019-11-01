Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6C9B8EC8F3
	for <lists+linux-usb@lfdr.de>; Fri,  1 Nov 2019 20:18:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727666AbfKATSp (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 1 Nov 2019 15:18:45 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:39797 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727551AbfKATSp (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 1 Nov 2019 15:18:45 -0400
Received: by mail-pf1-f195.google.com with SMTP id x28so4471502pfo.6
        for <linux-usb@vger.kernel.org>; Fri, 01 Nov 2019 12:18:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:references:in-reply-to:subject:date:message-id
         :mime-version:content-transfer-encoding:thread-index
         :content-language;
        bh=osehSVNdt/SagmwR+cB/jri4DYvfHYJx1I2tYnAOprw=;
        b=iO+ljnHxtg/MojhZBErVGUfC3HlJaSOnvdM8aFYB7ajc8jbHmW5BJENiAJrLeXAOvq
         c+YNsr7H0/fqnsP+pp08cd8wMhuWq7T39SDxSOPDbuoDR3y1GKl+LHjaNZS4YyD4Ki6N
         iQWmn08uA8IJocJwbNfZdEAp1RI0Fnl3L5f/qNshJO4RyIoOaoPSY4VuNlSy7pGa3q6E
         j5liNcaZ5gPWX+EFYOdEccWJK7/iVEM5L+nXjegzm//Rp4dQUorGZkf9kaesppu/tLyH
         h80OFPWSaXHWEWabNx9lfsw354dAqnrFbvck1/XjmK4n1GN58xDuCieEjcxrvSqsk4Vh
         yC1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:references:in-reply-to:subject
         :date:message-id:mime-version:content-transfer-encoding:thread-index
         :content-language;
        bh=osehSVNdt/SagmwR+cB/jri4DYvfHYJx1I2tYnAOprw=;
        b=CbJzOR/qyn6m9BB+DzS9dMJlZ0pCNPbfeg3Y70DLsEutOitQ88Ucr0a/MrdlcXPiY+
         qq2g3pwwTHcTSx1jMKjmdXzRCQPYEiLeaTGMsxBMYQqV9lZK1q3edx7tnIrk2JTGclP1
         uXpjpbxObPuZudHlj/6DFkkcaxmZK5V+nj2zsaGm4gLcb40yv8BVOxkpjFzMlu0FVlYx
         nCZWkxjMhzpNYhTqbFyu+nq+sY8mp1wXnkDA7n1HdJ8ogbUOSmoBptoabyp4NFQ4BCkk
         viAc1l8LPx1H/WPLRLVhUaHzUtgCyQBWhAQA01syFVVf4nAcLWRg0j9P0EMUHEomtdJH
         E0qw==
X-Gm-Message-State: APjAAAV/0PeqjDzdsvyh8IXIGGV9vHoKkbr4fOdy6o/7+A2yN8a15Vu2
        QU1/OKAsgxODACrI3O1qYClyRz2bjdY=
X-Google-Smtp-Source: APXvYqyBR5ErfWOVPaqkm1hkem3IJFPlzw5Wiaplr700NCdpzKx/2yD7qtyPHm/mfN3qzY9p846u3g==
X-Received: by 2002:a17:90b:30d:: with SMTP id ay13mr17782699pjb.29.1572635924471;
        Fri, 01 Nov 2019 12:18:44 -0700 (PDT)
Received: from PC201407091922 (121-74-136-26.telstraclear.net. [121.74.136.26])
        by smtp.gmail.com with ESMTPSA id y11sm10330975pfq.1.2019.11.01.12.18.40
        (version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Fri, 01 Nov 2019 12:18:42 -0700 (PDT)
From:   "Jonathan Olds" <jontio@i4free.co.nz>
To:     "'Johan Hovold'" <johan@kernel.org>
Cc:     <linux-usb@vger.kernel.org>, <frank@kingswood-consulting.co.uk>,
        <werner@cornelius-consult.de>, <boris@hajduk.org>
References: <jontio@i4free.co.nz> <20190608051309.4689-1-jontio@i4free.co.nz> <20190620134318.GL6241@localhost> <000001d52e0e$5303de80$f90b9b80$@co.nz> <000501d58e8d$b360b4d0$1a221e70$@co.nz> <20191030094709.GB4691@localhost> <000901d59049$c59eaae0$50dc00a0$@co.nz> <20191101095725.GA3657@localhost>
In-Reply-To: <20191101095725.GA3657@localhost>
Subject: RE: [PATCH] USB: serial: ch341: fix wrong baud rate setting calculation
Date:   Sat, 2 Nov 2019 08:18:27 +1300
Message-ID: <001001d590e9$262004f0$72600ed0$@co.nz>
MIME-Version: 1.0
Content-Type: text/plain;
        charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Office Outlook 12.0
Thread-Index: AdWQmsdH0l90MvCgQXmUsxt3utaGVQARNY4w
Content-Language: en-nz
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Johan,

> Thanks for testing. Do you mind if I add a tested-by tag for you to the
> patch?

Sure no problems. I tested it on a 64 bit I5 computer with the ch340g.
The Kernel was 5.0.0-32-generic.

> Not sure why that doesn't work, perhaps you just need to provide an
> appropriate "-p" option to strip the directory prefix?

I figured out the patching issue, my email client was removing some
line breaks.

> I suggest you use git directly instead. Clone Linus's repo at
> kernel.org, or use mine
> 
> 	git://git.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial.git
> 
> to get the latest USB serial changes.
> 
> Then you can apply patches directly from a mailbox using git-am (or from
> a patch using git-apply).

Thanks, will do. I didn't know about the git-am and git-apply commands.

Cheers,
Jonti

