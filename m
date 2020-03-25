Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8231A192D3E
	for <lists+linux-usb@lfdr.de>; Wed, 25 Mar 2020 16:48:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727911AbgCYPsW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 25 Mar 2020 11:48:22 -0400
Received: from mx.kolabnow.com ([95.128.36.41]:23576 "EHLO mx.kolabnow.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727488AbgCYPsW (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 25 Mar 2020 11:48:22 -0400
X-Greylist: delayed 399 seconds by postgrey-1.27 at vger.kernel.org; Wed, 25 Mar 2020 11:48:21 EDT
Received: from localhost (unknown [127.0.0.1])
        by ext-mx-out002.mykolab.com (Postfix) with ESMTP id 520D9640;
        Wed, 25 Mar 2020 16:41:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kolabnow.com; h=
        message-id:references:in-reply-to:subject:subject:from:from:date
        :date:content-transfer-encoding:content-type:content-type
        :mime-version:received:received:received; s=dkim20160331; t=
        1585150900; x=1586965301; bh=0ph5OARN93v8JXiH+1jNUGgcgcS3WLAgdrc
        kNcyfzjU=; b=b31OZoWlD6N7eWy4uJVwy/8Z+Ek/g4rw9wgVOFhExysWdYqH9iC
        zMEeaiMYw6x+zns1lICLr5FKECay2KNhJdbo2S68ixq85KgM2wLAKr9iTNCTN7cj
        aF2GdBcFHL/FJ908G/8UKbwol91jV0QQ07NIgV0h1bmnzXZfVIWRRA2q6/v8kFUa
        Vl8+WW+f/G+n1hFbb4JxRIvCxIg/AR0KpZz6SyZAlAKiWMlptlrkYaqPOy+W9oDL
        f0gSUbT7RR1rhcn3fRepZEpmnqHxRtRWY1UfbIgIkTqce/6v6b87f7zKaZV7mb+8
        OEjDEtmgquuHQ5ibJmtlyl0ujmi673HnGMdwkXXF0mS1Wcl63fcMPhKJB9TQdlUY
        YG0PwblTbrQ6TsQf6ffJYhwbf4Jlu1RF+kXzDcLi1XmJhUdd72cgFXQNJT7Ekm5K
        gGPnsLWFgPna5UW5scSKcLJgc+wtvPZYaH2Lzrvx/AAQiITHsvI4zbusZcswvc2N
        VP98uicouMsYK2v82cNj4cTSGg7A1LkUG0rjDSTrpPD1Yf9t4B8W1Eswh8QcmaE+
        EaKKd5HgokaWLCr8V8YY/G690gyYbfV+lynjZLrHM9ANLgPUtBSoOrLCVxv8+KNt
        VxdG25L+T8gfhv6YMV2ebG9RGg5hTaARcqhN2v72Mq7Mqsu0j5NDZl8g=
X-Virus-Scanned: amavisd-new at mykolab.com
X-Spam-Flag: NO
X-Spam-Score: -1.9
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 tagged_above=-10 required=5
        tests=[BAYES_00=-1.9] autolearn=ham autolearn_force=no
Received: from mx.kolabnow.com ([127.0.0.1])
        by localhost (ext-mx-out002.mykolab.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id Gy1fIk1NUoiM; Wed, 25 Mar 2020 16:41:40 +0100 (CET)
Received: from int-mx002.mykolab.com (unknown [10.9.13.2])
        by ext-mx-out002.mykolab.com (Postfix) with ESMTPS id E4F871F5;
        Wed, 25 Mar 2020 16:41:39 +0100 (CET)
Received: from int-subm002.mykolab.com (unknown [10.9.37.2])
        by int-mx002.mykolab.com (Postfix) with ESMTPS id 8C39834FB;
        Wed, 25 Mar 2020 16:41:39 +0100 (CET)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Date:   Wed, 25 Mar 2020 16:41:38 +0100
From:   Hubert CHAUMETTE <hubert.chaumette@kolabnow.com>
To:     Rohit Sarkar <rohitsarkar5398@gmail.com>
Cc:     Oliver Neukum <oneukum@suse.com>, linux-usb@vger.kernel.org,
        linux-newbie@vger.kernel.org
Subject: Re: Beginner query regarding usbhid
In-Reply-To: <5e7b6f15.1c69fb81.d92d3.facb@mx.google.com>
References: <5e7b5fbc.1c69fb81.cace7.7aa1@mx.google.com>
 <1585147543.3831.8.camel@suse.com>
 <5e7b6f15.1c69fb81.d92d3.facb@mx.google.com>
Message-ID: <b799aa1720fecb94d832264b4561eb8a@kolabnow.com>
X-Sender: hubert.chaumette@kolabnow.com
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Le 25/03/2020 15:47, Rohit Sarkar a écrit :
> I was trying to mess around with the driver that drives my mouse. I
> found out that it is usbhid. I then added a printk statement to the 
> init
> and exit function of usbhid.
> I then compiled and installed the usbhid drivers. Post that I ran
> `sudo modprobe -r usbhid` and `sudo modprobe usbhid` but couldnt 
> observe
> any logs in dmesg.
> 
> I am certain I am missing something fundamental. Could someone help me
> with this.

Hi,

Did you check whether your module was effectively loaded with lsmod?
What log level did you use in your printk statement? Depending on your
system default loglevel your logs might not be printed. A quick fix
would be to use one of the lowest levels (pr_emerg, but pr_err might
suffice).
Regards,

Hubert Chaumette
