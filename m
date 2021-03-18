Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B9A62340751
	for <lists+linux-usb@lfdr.de>; Thu, 18 Mar 2021 14:59:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230159AbhCRN7L (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 18 Mar 2021 09:59:11 -0400
Received: from 185-244-97-28-rev.logitus.pl ([185.244.97.28]:12114 "EHLO
        mother.pipebreaker.pl" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229925AbhCRN6y (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 18 Mar 2021 09:58:54 -0400
X-Greylist: delayed 516 seconds by postgrey-1.27 at vger.kernel.org; Thu, 18 Mar 2021 09:58:53 EDT
Received: by mother.pipebreaker.pl (Postfix, from userid 1001)
        id E25D469A0618; Thu, 18 Mar 2021 14:50:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 mother.pipebreaker.pl E25D469A0618
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pipebreaker.pl;
        s=default; t=1616075413;
        bh=kMaQH2PhFf81cu/s1yLMSzuoD6Xti8ZNHfUu76DTVdA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=uX94CdH+cQtt6/g6P0TwI6gKo0hnAKoed21u1hM3JguA1olTyFnjqCPZrCDEZxoJt
         es5uADwFKJEF9J6mXqge2SNF2Ra1xnkdXzhvTfRTtrnRnfJjIpxPzfcQmrRdgrWRh6
         KxbnS9xXvJaQ7CKl1HZKncGAl6/lUxB2ViqjZ8nU=
Date:   Thu, 18 Mar 2021 14:50:13 +0100
From:   Tomasz Torcz <tomek@pipebreaker.pl>
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     Greg KH <greg@kroah.com>, systemd-devel@lists.freedesktop.org,
        usb-storage@lists.one-eyed-alien.net, linux-usb@vger.kernel.org,
        Matthias Schwarzott <zzam@gentoo.org>,
        hirofumi@mail.parknet.co.jp, Mike Tsai <miketsai@amazon.com>
Subject: Re: [systemd-devel] [PATCH] usb-storage: Add quirk to defeat
 Kindle's automatic unload
Message-ID: <YFNalS7Sl/l+zywM@mother.pipebreaker.pl>
References: <841a9a54-78ee-ffaa-fc3c-12defcf43b36@gentoo.org>
 <20210311143912.GA257360@rowland.harvard.edu>
 <f2acfeef-a81a-d7c0-90a8-b290a18cb742@gentoo.org>
 <20210316162650.GB448722@rowland.harvard.edu>
 <031a20c5-27c3-cc13-6e0b-a308644abce4@redhat.com>
 <20210316170433.GD448722@rowland.harvard.edu>
 <1d9f059e-8b21-0895-9a50-39b6b1a5cc5c@redhat.com>
 <20210317151746.GB488655@rowland.harvard.edu>
 <5f8c0755-0884-f505-c4e8-3a5e89001d58@gentoo.org>
 <20210317190654.GA497856@rowland.harvard.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210317190654.GA497856@rowland.harvard.edu>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Dnia Wed, Mar 17, 2021 at 03:06:54PM -0400, Alan Stern napisał(a):
> Matthias reports that the Amazon Kindle automatically removes its
> emulated media if it doesn't receive another SCSI command within about
> one second after a SYNCHRONIZE CACHE.  It does so even when the host
> has sent a PREVENT MEDIUM REMOVAL command.  The reason for this
> behavior isn't clear, although it's not hard to make some guesses.

  Could Kindle be fixed not to required such workaround? Is there a way
to open a bug with Amazon?

-- 
Tomasz Torcz                        Once you've read the dictionary,
@ttorcz:pipebreaker.pl              every other book is just a remix.
