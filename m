Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D002F385DC
	for <lists+linux-usb@lfdr.de>; Fri,  7 Jun 2019 09:59:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727019AbfFGH7k (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 7 Jun 2019 03:59:40 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:34263 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726607AbfFGH7k (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 7 Jun 2019 03:59:40 -0400
Received: by mail-wm1-f66.google.com with SMTP id w9so3473149wmd.1
        for <linux-usb@vger.kernel.org>; Fri, 07 Jun 2019 00:59:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=unipv-it.20150623.gappssmtp.com; s=20150623;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=92UFKxRWmzm9n19XqIDRvt+py2OymbcIdoVcHXq6l4s=;
        b=iyqnbrdRMeOfRuPS4thdGZuXdLl4gTa4dT57jnErWjCuoZ8oCvvc6DzU6jFZCVExME
         V26oTulqDPaW5/4pnk1tmFwLiZVEUi+R71bGXuOLu6Aqt6CGGXJx8Pa7p7KTWPYqM65t
         IOiJekdL1n3iDbekWo3khfnETVPh3dJTKdB940e0FHEgEJCHSUQ1GfYq9jZ6qAYAtkCU
         G+wJ4de+qhuaUjjUnUYaB/xFtn6jSyJaeYxSktGkENHkPvlqJh/WEJe1p7r/Ra+aGL/a
         8UDO57v7M8UXOXuEdyJqrOlseO6pN6Iu+srVOTaSYQ4hkRkpXWmJ9D0MkktXF85mQL1+
         UTmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=92UFKxRWmzm9n19XqIDRvt+py2OymbcIdoVcHXq6l4s=;
        b=EHJk45tpRA5cdMgLpWF29GTsP0us7W2c9s630H7h2KZD0uSMXqUU7Lq1EZQbWN6laV
         tDW4pQz/pb1o0I9kuXqoQIc0Wg5yI89+gvd0O+/DKkVfqvk+SpuTrX141K1cPMuUqdai
         V7GPOQtyDvJdhRQ6nnl4HgTGcWJUAFwQJQ3fwVTAhICzXrcunI8ZgxjjpYzYjmMWBkcy
         uLW/k1Yh5E5czvgum24Jv8zucyVfA08pJxUP813ZG8OWegp15bO2BdHFTKClPajNq7Hs
         jnA4l5T6+TXtQY2oyP4m/sM/mg/bgy+7AKNoVH1OrX8KFBknCvcXwff0eVGxjroHlCm3
         ycEQ==
X-Gm-Message-State: APjAAAX4HXwRxC8wsjXTXoYeYYoMuL5SYqsqbC6vLjDDQqnBB53fFR0Y
        v60tTNQj7ASOVryqdGzSagNYPCbN8T8=
X-Google-Smtp-Source: APXvYqzLuW0+m+3r1H6Vuhqz+9E4Ta/YmfCYTPIqQfmP/pOuWpFSxAcp3hw55lsfn07nK4GrKQ+75w==
X-Received: by 2002:a7b:cb01:: with SMTP id u1mr2873745wmj.153.1559894377891;
        Fri, 07 Jun 2019 00:59:37 -0700 (PDT)
Received: from angus.unipv.it (angus.unipv.it. [193.206.67.163])
        by smtp.gmail.com with ESMTPSA id h200sm1489232wme.11.2019.06.07.00.59.37
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 07 Jun 2019 00:59:37 -0700 (PDT)
Message-ID: <4495ecd507b621746e3e661f52a900ffdcb9a469.camel@unipv.it>
Subject: Re: Slow I/O on USB media
From:   Andrea Vai <andrea.vai@unipv.it>
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, stern@rowland.harvard.edu
Date:   Fri, 07 Jun 2019 09:59:36 +0200
In-Reply-To: <20190606144757.GA12356@kroah.com>
References: <2a9e1be71a2c6c940dac904752fdd34129745444.camel@unipv.it>
         <20190530132522.GA21005@kroah.com>
         <86676f40a8c1aa44bf5799eac6019183d6d33336.camel@unipv.it>
         <20190604054300.GE1588@kroah.com>
         <9b013238be4e3c63e33181a954d1ecc3287d22e4.camel@unipv.it>
         <20190605145525.GA28819@kroah.com>
         <0c2adde7154b0a6c8b2ad7fc5258916731b78775.camel@unipv.it>
         <463fb315f901783543c3bd5284523912c3c31080.camel@unipv.it>
         <20190605173902.GE27700@kroah.com>
         <b159e1518b670d4b0126c7671c30c8c3cb8fffbc.camel@unipv.it>
         <20190606144757.GA12356@kroah.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.5 (3.30.5-1.fc29) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Il giorno gio, 06/06/2019 alle 16.47 +0200, Greg KH ha scritto:
> 
> 
> [...]
> 
> As Alan said, 4.20 is older than 4.20.13.

Thank you Greg, and thank you Alan for your explanations.

> 
> But, is the kernel.org version of 4.20.13 really "good" here?
> 
> I would start with Linus's tree and stay away from the stable trees
> for now.

ok, so hope I have understood correctly and started a new bisect from

git clone git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git

, built it, tested it (5.2.0-rc3+) and marked as "bad",

>   As you end up with odd "leafs" that can confuse 'git bisect'
> and everyone else.
> 
> So start with 4.20.0.  

and I hope have understood correctly and did

wget https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/snapshot/linux-4.20.tar.gz

and built it and tested it,

> Test that.  If it is "good", then great!

...and ok is good :-), so issued

git bisect good v4.20

...and I am going on there. So far:

$ git bisect log
git bisect start
# good: [8fe28cb58bcb235034b64cbbb7550a8a43fd88be] Linux 4.20
git bisect good 8fe28cb58bcb235034b64cbbb7550a8a43fd88be
# bad: [01047631df813f6247185547c3778c80af088a20] Merge tag 'xfs-5.2-fixes-2' of git://git.kernel.org/pub/scm/fs/xfs/xfs-linux
git bisect bad 01047631df813f6247185547c3778c80af088a20
# bad: [bcd49c3dd172c38e14faf151adca63c8db4c9557] Merge branch 'x86-cleanups-for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip
git bisect bad bcd49c3dd172c38e14faf151adca63c8db4c9557
# bad: [fcf010449ebe1db0cb68b2c6410972a782f2bd14] Merge tag 'kgdb-4.21-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/danielt/linux
git bisect bad fcf010449ebe1db0cb68b2c6410972a782f2bd14

Please correct if I am missing something, or doing something different
from what you meant.

Thank you!
Andrea


