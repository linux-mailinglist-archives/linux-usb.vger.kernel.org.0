Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5A0BB1AE7F8
	for <lists+linux-usb@lfdr.de>; Sat, 18 Apr 2020 00:10:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728469AbgDQWKC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 17 Apr 2020 18:10:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726284AbgDQWKB (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 17 Apr 2020 18:10:01 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7BEADC061A0C
        for <linux-usb@vger.kernel.org>; Fri, 17 Apr 2020 15:10:01 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id o81so4402408wmo.2
        for <linux-usb@vger.kernel.org>; Fri, 17 Apr 2020 15:10:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=09w18WqG1QvU7dZLohtkpmD4nwLSz/zlhw+BCMBmiCc=;
        b=LsSnL0NP8hy79BHb0yICULaHg9evX/4kAxjxlr4ymTkKUANK4VCcAcVNO6ub4zJQWr
         LkjU6bblfY6VZYsfnS/NbzTZVSHTPt1InuSC0lvGtnBxzVaUhIHYa0XXR3abqdEAtPM6
         EKm14f/xxk+yBDsxIRAyGmhfLJ7aurQdvdgEF3w+l6xVTvoHYHU42OX7RWwdqPmXfA0Y
         Zn7YNRMd2HzC53LyzxJkXukO0yHZ7XMM0FbV8MWE5+dnEbjpQiOyOS80gkCTeDeSItSN
         tJVo3qAXPSGEjl1wdQxt5leid3B0QqVpllfKYpkt5WtAV9L1JoPSwliAE4bps8cNFiBG
         /PxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=09w18WqG1QvU7dZLohtkpmD4nwLSz/zlhw+BCMBmiCc=;
        b=Jhn0ij0+uiR7NArtTETkeEgYf92DDm8Fi/gh9hIqC1EIAnVE5kkL8y9JyPSZjzigr2
         dxXSqfK/7oHU09o1EMzNn/24iEtdv049PxceNxVlnlH8fyMnwZnKm7cjY2PUdFKVzu3G
         ZYAn/80V//ucXytV4wP9bHwQVgcGyB+jwINTUTGXfyLNkkXElDTrUEu4Pgofu6RtlIi6
         HvaWM8Z5gx16GyMJy9ZCOWQT+1ixXeCATFn4pbXt/0p41LUXilzg+Rs72Ot8uM4eO2OL
         /Nvy1wK1E1dNjYB6/XlzEcvlGNZcmJfIQRynjwlmPnpu8B4UvcAd37INyKws7cAMtbJs
         pQWQ==
X-Gm-Message-State: AGi0PubgijBSQeYP/VtkBmM/fVYRsBLrv/QEURBxPYRWFDrnjhpm77wm
        yLXXCEKcdJZqg32bRjnLYWU=
X-Google-Smtp-Source: APiQypKb8eenFqHITbp+YNcKNxSehI2H38ZwrmXzYcQRL1gcxtWRKbspf8Na2OARx1hLysimt8hszg==
X-Received: by 2002:a1c:2392:: with SMTP id j140mr5385882wmj.136.1587161400182;
        Fri, 17 Apr 2020 15:10:00 -0700 (PDT)
Received: from Susan (91-164-97-136.subs.proxad.net. [91.164.97.136])
        by smtp.gmail.com with ESMTPSA id e5sm34587571wru.92.2020.04.17.15.09.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2020 15:09:59 -0700 (PDT)
Date:   Sat, 18 Apr 2020 00:09:57 +0200
From:   Cyril Roelandt <tipecaml@gmail.com>
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     USB list <linux-usb@vger.kernel.org>, sellis@redhat.com,
        pachoramos@gmail.com, labbott@fedoraproject.org,
        gregkh@linuxfoundation.org, javhera@gmx.com
Subject: Re: [BUG] Regression in Linux 5.4.17 for JMicron JMS566 enclosure
Message-ID: <20200417220957.GA4707@Susan>
References: <20200417183203.GA1889@Susan>
 <Pine.LNX.4.44L0.2004171539350.25043-100000@netrider.rowland.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Pine.LNX.4.44L0.2004171539350.25043-100000@netrider.rowland.org>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 2020-04-17 16:06, Alan Stern wrote:
> On Fri, 17 Apr 2020, Cyril Roelandt wrote:
> 
> > On 2020-04-15 21:21, Alan Stern wrote:
> 
> > > > I do not really mind not being able to use uas, however I would like to
> > > > be able to mount my partitions using usb-storage.
> > > 
> > > It's entirely possible that the blacklisting is not necessary any more.  
> > > After all, it was added four and a half years ago; the kernel has
> > > improved since then.  I guess you're not in a position to test this,
> > > but maybe Steve Ellis or Takeo Nakayama is...?
> > > 
> > > Does 5.3 work if you add a similar blacklist entry?
> > 
> > I cloned Linus' tree, and cherry-picked
> > bc3bdb12bbb3492067c8719011576370e959a2e6 on top of v5.3, rebuilt the
> > kernel and rebooted: I had the exact same issue.
> > 
> > > 
> > > Can you collect usbmon traces showing what happens with both uas and
> > > usb-storage?  Perhaps different sequences of commands get sent to the
> > > drive with the two drivers.
> > 
> > Here it is:
> 
> Two things.  First, you started the usbmon traces _after_ plugging in
> the drive.  As a result the traces do not contain a complete record of
> all the transfers between the computer and the drive; it's possible
> that something in the missing portions is responsible for your problem.
> For example, why does your uas log include a line ("[sdb] 4096-byte 
> physical blocks") that is missing in the usb-storage log?

Oh, sorry, I'm new to this. The logs became really long, so I've taken
the liberty of pasting them to paste.debian.net. I captured what
happened when plugging the WD drive and running "mount".

- With a 5.3 kernel, using uas: http://paste.debian.net/1141035/
- With a 5.4 kernel, using usb-storage: http://paste.debian.net/1141036/
- With a 5.4 kernel, using usb-storage, using a similar enclosure that
  works as expected (the Icy Box IB-268U3-B, which has the same product
  ID and vendor ID but a different bcdDevice: 2.03 instead of
  1.14): http://paste.debian.net/1141037/


> [...]
> Of course, this makes no sense because the drive had no problem
> understanding the exact same command when it was sent by uas.
> 
> At this point, all I can say is that something about the combination of
> the enclosure and the drive works with the UAS transport but not with
> the USB Mass-Storage transport.  As far as we can see from the usbmon 
> traces, the kernel isn't doing anything wrong.

I wrote in my original message that the enclosure worked fine with a
Fujitsu drive, but upon further testing this proved inexact: it worked
with an NTFS partition on said drive. Once I formatted it to ext4, it
started failing as well. To recap, when using usb-storage this is what
happens:

IB273 + WD Blue 1TB   (ext4)   -> Broken
IB273 + Fujitsu 250GB (ext4)   -> Broken
IB273 + Fujitsu 250GB (NTFS)   -> OK
IB268 + WD1TB         (ext4)   -> OK

Where:
- IB273 has idVendor=357d, idProduct=7788 and bcdDevice= 1.14
- IB268 has idVendor=357d, idProduct=7788 and bcdDevice= 2.03


Thanks for your help,
Cyril Roelandt.
