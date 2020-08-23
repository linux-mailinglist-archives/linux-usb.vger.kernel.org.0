Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 192FC24EAC2
	for <lists+linux-usb@lfdr.de>; Sun, 23 Aug 2020 03:30:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726241AbgHWBad (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 22 Aug 2020 21:30:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726075AbgHWBad (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 22 Aug 2020 21:30:33 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE768C061573
        for <linux-usb@vger.kernel.org>; Sat, 22 Aug 2020 18:30:30 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id 83so5186515wme.4
        for <linux-usb@vger.kernel.org>; Sat, 22 Aug 2020 18:30:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ONoF4nyCdy6qW+/kdYQVGQOY4pZR/rgkArfV36+ileI=;
        b=TLqj+WY1WEJlm+xqUEeMN2coIxetGC3fl3uayXpLbbE66jZZJRx4jmyXS29sZqeDtw
         divyhkPVaUVwU+B8ZAsRT8ls4KmVSEeQAhty20sxbirCkY2fjRFtqOrA5apDK9UwQjDd
         4bKgZuyChbxgqkR+4wee0OgbwcIg/VnQk1HRY+ZZ6M1OosO5hWv4/yvM7TPznLmG7ZMT
         txwzQfBkT9z+juIxtAEoc2+LePGEFGPRQ4ojqozyOWx+lc7r5Y0LykJIrDTj5M6L7bl5
         St0Lm4dXQGV1qiG6y72hXZW6Z2N9LvTww3bkyZZwzxOz5hUBvgyr8r1QAkVv5ZNw1cQH
         AR2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ONoF4nyCdy6qW+/kdYQVGQOY4pZR/rgkArfV36+ileI=;
        b=h5rXPrgsI8IjzKvS+Ih6W6CVih1ScktTyXfqfiNyzZSDXvj+aj3siMkFLEK8v3pSSi
         9hP/E/tHY0QC/6S1s/GDt1XIdXuh2N+5GQ00xw/ZjraDoqtKESUqhzTDtagxYavHYMsx
         N5FRIepAxTUXVPNydcY8iveJgXNFpZFjc0KAPy2lzHJ/7WDAJ80I7b1lQtH++szWV/bF
         8C0XC9MFbKs2Z3qagSsPjj21FQmHe7jjzKml/ZJL6hf0X10wzwpVSOvxmJXt+61b3kV+
         WY6WLX/Gh3Hn2Ab3nQf5WZ3l41coQdgeBMUbFKAX6kHyd8T3U9iKW2kjQZNsh1lxh1n1
         GZ8w==
X-Gm-Message-State: AOAM533B6Hz8jiQ8vuwkwWtry9NbI311JvzBGE0Nneq4JL2d6ZjZ1LuF
        3p4fs7aXMAMbkQCZspBQHiE=
X-Google-Smtp-Source: ABdhPJwJs/7H+movoXmt3Gl60ZKcCiSe2yGPhtexIkUiGduAS4/q4ylKT/hOWPP31dcQmsOnQZOAxw==
X-Received: by 2002:a1c:96d7:: with SMTP id y206mr614681wmd.9.1598146228787;
        Sat, 22 Aug 2020 18:30:28 -0700 (PDT)
Received: from Susan (91-164-97-136.subs.proxad.net. [91.164.97.136])
        by smtp.gmail.com with ESMTPSA id k7sm5087551wrv.72.2020.08.22.18.30.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Aug 2020 18:30:27 -0700 (PDT)
Date:   Sun, 23 Aug 2020 03:30:25 +0200
From:   Cyril Roelandt <tipecaml@gmail.com>
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     USB list <linux-usb@vger.kernel.org>, sellis@redhat.com,
        pachoramos@gmail.com, labbott@fedoraproject.org,
        gregkh@linuxfoundation.org, javhera@gmx.com, brice.goglin@gmail.com
Subject: Re: [BUG] Regression in Linux 5.4.17 for JMicron JMS566 enclosure
Message-ID: <20200823013025.GA11449@Susan>
References: <20200417220957.GA4707@Susan>
 <Pine.LNX.4.44L0.2004191144550.4266-100000@netrider.rowland.org>
 <20200421030137.GA2492@Susan>
 <20200815001829.GA2786@Susan>
 <20200815021929.GC52242@rowland.harvard.edu>
 <20200815232357.GB2786@Susan>
 <20200816162642.GC86937@rowland.harvard.edu>
 <20200818041324.GA3173@Susan>
 <20200818145722.GA146472@rowland.harvard.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200818145722.GA146472@rowland.harvard.edu>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello,

On 2020-08-18 10:57, Alan Stern wrote:
> Somehow that commit is causing usb-storage to go crazy.  You're going
> to have to do some debugging to find out why.
> 
> Here's what to look for in drivers/usb/storage/usb.c:
> 
> 	Is storage_probe() getting called at all?

Yes.

> 
> 	If it is, it doesn't seem to get as far as calling
> 	usb_stor_probe1().  Can you find out where it goes off the
> 	rails and why?

Yes. I added a bunch of calls to printk[1] and noticed the following new
lines in dmesg:

[Fri Aug 21 23:02:42 2020] [+] Entering storage_probe
[Fri Aug 21 23:02:42 2020] [+] Using uas driver

So basically, the kernel realizes that UAS cannot be used, tries to use
usb-storage instead, and then usb-storage says "well, this device should
be using UAS, I'm not going to handle it". Somehow, we forget that UAS
is broken for this device along the way.

I commented out the call to uas_use_uas_driver()[2] and was able to see
my partitions, mount them, read and write data. Everything works as
expected.

Do you have any idea why usb-storage may be led to believe UAS is
suitable for this enclosure?


Cyril


[1] https://framagit.org/Steap/linux/-/commit/f70143e30fb1ca5f3ce7476ce6d51354786c72c9
[2] https://framagit.org/Steap/linux/-/commit/22b3a6ae411bc9fa98d3c81045308ce83f144b14
