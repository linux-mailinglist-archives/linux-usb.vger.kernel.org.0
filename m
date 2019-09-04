Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B9A2FA7FEC
	for <lists+linux-usb@lfdr.de>; Wed,  4 Sep 2019 12:01:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729563AbfIDKBh (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 4 Sep 2019 06:01:37 -0400
Received: from mail.kernel.org ([198.145.29.99]:38530 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726010AbfIDKBh (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 4 Sep 2019 06:01:37 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C3E4E2339E;
        Wed,  4 Sep 2019 10:01:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1567591296;
        bh=aggr3vv5VhvJRCHWx1jeMGaAXzhpEBiQa671AyYRvME=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=gyvRfJ/VcYiXAX6c7c7OinedoRdn/Lvwaup/qk6Od+1BbfFf2hqfQYuc4eCK68AGH
         4/vAIc6nsxZQO2lpKj019jrA0jv6rfPRhz0rBGflScd5lec5nLfU/mcU0Zbyr7T5Vd
         XpvfcDnAxRf8KVwkE/7KRjwAXZgUq5QEFXajBfpQ=
Date:   Wed, 4 Sep 2019 12:01:33 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Jacky.Cao@sony.com
Cc:     balbi@kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, stern@rowland.harvard.edu,
        Kento.A.Kobayashi@sony.com
Subject: Re: [PATCH] USB: dummy-hcd: fix power budget for SuperSpeed mode
Message-ID: <20190904100133.GB9615@kroah.com>
References: <16EA1F625E922C43B00B9D82250220500871C862@APYOKXMS108.ap.sony.com>
 <87sgpcmr7v.fsf@gmail.com>
 <20190904075839.GA28042@kroah.com>
 <16EA1F625E922C43B00B9D82250220500871C90C@APYOKXMS108.ap.sony.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <16EA1F625E922C43B00B9D82250220500871C90C@APYOKXMS108.ap.sony.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Sep 04, 2019 at 08:52:12AM +0000, Jacky.Cao@sony.com wrote:
> Hi, 
> 
> > I'm not ok with the whitespace damage making this patch impossible to apply :)
> 
> Sorry for the whitespace damage issue I didn't notice when I copied the content.
> Just now I submitted v2 for this patch with whitespace damage issue fix.
> Please help to confirm, thank you.

You can always confirm your own submissions by looking on the mailing
list itself, no need to ask anyone else to do that :)

greg k-h
