Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C691D202A13
	for <lists+linux-usb@lfdr.de>; Sun, 21 Jun 2020 12:34:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729803AbgFUKez (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 21 Jun 2020 06:34:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729754AbgFUKez (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 21 Jun 2020 06:34:55 -0400
Received: from smtp2.hosting90.cz (smtp2.hosting90.cz [IPv6:2a03:b780:1:0:216:3eff:fe00:24c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F739C061794
        for <linux-usb@vger.kernel.org>; Sun, 21 Jun 2020 03:34:55 -0700 (PDT)
Received: from [46.229.122.58] (helo=[10.10.0.107])
        by smtp2.hosting90.cz with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
        (Exim 4.92)
        (envelope-from <Jerry@jrr.cz>)
        id 1jmxJM-0002x4-MN; Sun, 21 Jun 2020 12:34:53 +0200
Subject: Re: [PATCH 1/1] usbserial: cp210x - icount support for parity error
 checking
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Johan Hovold <johan@kernel.org>, linux-usb@vger.kernel.org
References: <b4cd2557-9a61-5ccd-32ad-48b0c68bef6b@jrr.cz>
 <20200621085816.GB95977@kroah.com>
 <03712b5a-ecb6-ae42-ff8e-8d5d6f2ed918@jrr.cz>
 <20200621095509.GA120230@kroah.com>
From:   Jerry <Jerry@jrr.cz>
Message-ID: <470484c8-7afc-c593-5ca9-cdb97dba39e1@jrr.cz>
Date:   Sun, 21 Jun 2020 12:34:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Firefox/60.0 SeaMonkey/2.53.2
MIME-Version: 1.0
In-Reply-To: <20200621095509.GA120230@kroah.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Antivirus: Clamav/CLEAN
X-Scan-Signature: c559c1d859b56cd26d86b8c439b16ace
X-Authenticated-Id: jerry@jrr.cz
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Greg Kroah-Hartman wrote on 6/21/20 11:55 AM:
>> I read it, but still not sure what exactly was wrong? Yes, I wrapped lines
>> of description to 80 colums and now I noticed that only 75 columns is
>> allowed but I doubt that it is all?
> That is one thing, but also the "This patch..." should not be in a
> changelog, right?  Look at the other changes sent to the list for
> examples of how to do this.
Yes, I looked at another messages here and there are a lot of things 
which I don't understand. For example two dash -- marker at the end 
(bellow patch) with some strange number (2.7.4). I didn't find anything 
about that in documentation.

And documentation request diff -up
https://www.kernel.org/doc/html/v4.17/process/submitting-patches.html#diff-up
but patches here use another settings because diff -up never give me 
line like
index 86638c1..f1b46b5 100644
before file names but put me file date and time next to filename. So 
what version of diff should I use? I have diff (GNU diffutils) 3.7
>
>>>> Signed-off-by: Jaromir Skorpil <Jerry@jrr.cz>
>>> This does not match your From: line :(
>> I supposed that only mail address in From line matter?
>> I understand that real name is mandatory only for Signed-off-by field?
> It has to match the From: line of your email to ensure that this really
> is the same person.
Really?
I looked at another message as you advised and it seems that even YOUR 
name often changes?
https://marc.info/?l=linux-usb&m=159257306831535
https://marc.info/?l=linux-usb&m=159256948030250

Why is a name so important when you can't verify it? Typing the same 
text twice doesn't prove anything. In fact my real name can't be written 
in ascii because of diacritics marks and I doubt that it will work here 
correctly if I use unicode...
> thanks,
>
> greg k-h
Jerry
