Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2205B165A7
	for <lists+linux-usb@lfdr.de>; Tue,  7 May 2019 16:29:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726674AbfEGO3F (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 7 May 2019 10:29:05 -0400
Received: from mail.kernel.org ([198.145.29.99]:37494 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726583AbfEGO3E (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 7 May 2019 10:29:04 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D04912087F;
        Tue,  7 May 2019 14:29:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1557239344;
        bh=vyN83eUQuZ49QPjApP1odWAbjm/bP3buAMjXwh3dTJs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=piiFL/o1lSEfne1qkRIeoTjU6hKxwb1iX+v0Da9b9X+B6vQzkbNbbFpJWHimdwi37
         nJZDYKeRp/X447OXTSFlZdtXLS8WhNVgz3Wrey+uky4F+Xt6bluTejNyMTToToKEoF
         ogHiXKZfCJmn2ZZKsxm2EcGDnaJm6WJMpt4yrnBA=
Date:   Tue, 7 May 2019 16:29:02 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Nikolai Kondrashov <spbnick@gmail.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: merge usbhid-dump into usbutils repo?
Message-ID: <20190507142902.GA29491@kroah.com>
References: <20190507140042.GA26528@kroah.com>
 <8f35c8e9-9ee0-a883-30e4-8b532316137d@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8f35c8e9-9ee0-a883-30e4-8b532316137d@gmail.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, May 07, 2019 at 05:23:05PM +0300, Nikolai Kondrashov wrote:
> Hi Greg,
> 
> On 5/7/19 5:00 PM, Greg KH wrote:
> > So, what do you think about the two options here?
> 
> I would absolutely be glad if you could take usbhid-dump under your wing!
> 
> I have little time for the DIGImend project these days, for which it was
> developed. I have a bit of financing from Patreon and occasional tablet
> manufacturer to work on the drivers, but that leaves very little time for the
> tools.
> 
> I wouldn't mind submitting any patches required to usbutils repo instead.
> And it's true the thing haven't needed much updates recently.
> Please also feel free to adjust it to your tastes too.
> 
> Thanks for looking after it!

Wonderful, so for now, I'll push what I have done with the merging of
the two repos together and make a public 012 release of usbutils, to fix
the issues the distros have already pointed out with usbhid-dump being
gone.

And then we can go from there forward, thanks for the quick response!

> P.S. It's awesome to see you receive Red Hat's Kernel CI effort so
> positively. Everyone's cheering for your feedback every time here :)

Hey, people testing my stable queue in a very-fast manner, why wouldn't
I like it?  :)

thanks,

greg k-h
