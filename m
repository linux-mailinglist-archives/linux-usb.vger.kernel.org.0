Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9EB5F36082
	for <lists+linux-usb@lfdr.de>; Wed,  5 Jun 2019 17:47:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728260AbfFEPq7 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 5 Jun 2019 11:46:59 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:34567 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726421AbfFEPq7 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 5 Jun 2019 11:46:59 -0400
Received: by mail-wm1-f66.google.com with SMTP id w9so2076368wmd.1
        for <linux-usb@vger.kernel.org>; Wed, 05 Jun 2019 08:46:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=unipv-it.20150623.gappssmtp.com; s=20150623;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=HE51ESkuIHeTcBgI+yOqNPg0J5myJJSBjISSesu3PiY=;
        b=eZcno04HUyeG9ohjCFrWchF4PcGxjbz4nYOq4ILWAMFXGrBJjY+cMRVfUpYKntvDky
         ZAtGPIgVVjeCWzqGcw0jA2aCvznflm+5BxDHwYymfWDGDuyo2iuORRV/AmUpktCYVYC+
         U6CPy5stZgj+aWG0OVOeWh10mu+1bfongWlS2o5VF8VTBBFRaoWYZhRGdAxaJ5uhHGBj
         HNrOkQTUla0PEufiWHymf2s0WyQy6rc5Vvl15IpONgVU3u6oOlifQzEpBRxM01MsafOY
         UOT9+Ahxdg0rgo9fRVTE8wfP/nAJG4qPLQFIxepMm1dhvAp+Ml37Xzo2jDbw/B94qe4P
         QY5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=HE51ESkuIHeTcBgI+yOqNPg0J5myJJSBjISSesu3PiY=;
        b=mewW33CMPGOz4pAh1skX+FcEro74aGFH50i/meFJ7gQXtCeZjX3WSP2FuQTLr+qaew
         O7kjvyzfKlgj617ZbCF//qzdJQvJ9+z324XQ+aeMuZYtbUNA+CVdT8n7zhflmH282BkN
         XMJFRzmLNZUiaGawcgq/OBDRvhc5o0Q7CjfPogN66QY2oc1yUHqPLuLDuXDjAIPqgV7b
         q4zpnSlw5kBf7W8pJZlP+F6f54WBKIDNWxnIrpWEFIwlRYi6bEtcKSqAyeZ4Pz6+/JYM
         7tuTengQUr2UaNiQIWXpWbs2q26ODUcrEWia+owpoAGtjUIpDlN49wu4CPhMvfxPVR4i
         Xxyg==
X-Gm-Message-State: APjAAAXIGY8Ojyz0ln4AXq18fxBmmXRQRNzxsTWlh9sOuxSbbTQy6le/
        upTGKAOxAcRkI42V67JrjzRziQ==
X-Google-Smtp-Source: APXvYqz6r+zAbq7ggDJGp3dhfqHmM6zHL/VaH7v1XhfHYceMxuIZ8051yKCkF2qU7cH2tN2rbkOyEA==
X-Received: by 2002:a1c:9dc5:: with SMTP id g188mr11464833wme.93.1559749616944;
        Wed, 05 Jun 2019 08:46:56 -0700 (PDT)
Received: from angus.unipv.it (angus.unipv.it. [193.206.67.163])
        by smtp.gmail.com with ESMTPSA id p16sm37905894wrg.49.2019.06.05.08.46.56
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 05 Jun 2019 08:46:56 -0700 (PDT)
Message-ID: <4f2e5b456eb0f53b8c921465c1b1c4813b918f65.camel@unipv.it>
Subject: Re: Slow I/O on USB media
From:   Andrea Vai <andrea.vai@unipv.it>
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     Greg KH <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org
Date:   Wed, 05 Jun 2019 17:46:51 +0200
In-Reply-To: <Pine.LNX.4.44L0.1906051022380.1788-100000@iolanthe.rowland.org>
References: <Pine.LNX.4.44L0.1906051022380.1788-100000@iolanthe.rowland.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.5 (3.30.5-1.fc29) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,
Il giorno mer, 05/06/2019 alle 10.26 -0400, Alan Stern ha scritto:
> On Wed, 5 Jun 2019, Andrea Vai wrote:
> 
> > Hi,
> > Il giorno mar, 04/06/2019 alle 07.43 +0200, Greg KH ha scritto:
> > > On Mon, Jun 03, 2019 at 01:13:48PM +0200, Andrea Vai wrote:
> > > > Il giorno gio, 30/05/2019 alle 06.25 -0700, Greg KH ha
> scritto:
> > > > > [...]
> > > > Hi,
> > > > 
> > > > > Any chance you can use 'git bisect' to find the offending
> > > commit?
> > > > Yes, I am doing it as I managed to build the kernel from
> source
> > > 
> > > Great!  What did you find?
> > 
> > # first bad commit: [534903d60376b4989b76ec445630aa10f2bc3043]
> > drm/atomic: Use explicit old crtc state in
> > drm_atomic_add_affected_planes()
> > 
> > By the way, as I am not expert, is there a way to double-check
> that I
> > bisected correctly? (such as, e.g., test with the version before
> this
> > one, and then with this commit applied?)
> 
> That is exactly the way to do it: Build a kernel from that commit
> and 
> see that it fails, then revert the commit and see that the
> resulting 
> kernel succeeds.
> 
> (Note: The notion of "version before" doesn't have a firm meaning
> in 
> the kernel, because some commits have multiple parents.  The best
> way 
> to see if a single commit caused a change is to do what I said
> above: 
> revert the commit and see what happens.)
ok, thank you for pointing it out. So, my question is: how to revert a
commit? (sorry, I prefer to ask you because I am afraid I could do
something wrong, and don't trust too much myself and what I pick up
searching on the web. In the special case, I found "git revert", but
for example how could I revert back a "reversion"? :-/ (I know I miss
the basis, I never worked with git, so sorry for the stupid
question)).

> 
> Incidentally, it seems very unlikely that a commit for the drm 
> subsystem would have any effect on the behavior of a USB storage 
> device.

well, I had the same doubt and that's the reason I was trying to do
the check: I'm afraid I have done something wrong or made a mess with
the bisect process.

Thank you,
Andrea

