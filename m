Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 58F321E3EB8
	for <lists+linux-usb@lfdr.de>; Wed, 27 May 2020 12:12:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387782AbgE0KMi (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 27 May 2020 06:12:38 -0400
Received: from mail.kernel.org ([198.145.29.99]:56022 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387767AbgE0KMi (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 27 May 2020 06:12:38 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id ACD792088E;
        Wed, 27 May 2020 10:12:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1590574358;
        bh=FOjlm5UER4jby4rc5jYPlrHbBUjPG7n+36gIu/fnV4c=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=L303npg+YMdfX3GEph2tXstKysYi0f0vMbQIlFaEqJojyCDX0mImY7QAnSfnrOsL5
         mSnH41UUNmRhEBc7pPFDPU6rGB5La7Dp9VAirmWvcoDTc2qUSHSMqcac15hED1oRO8
         Iqc5RsPnX/twIEUnWw0/dNJ8m6KUWnhxs2auxgaU=
Date:   Wed, 27 May 2020 12:12:36 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
Cc:     "oneukum@suse.com" <oneukum@suse.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: ttyACM: disabled by hub (EMI?), re-enabling... Causes garbage
 chars & disconnect
Message-ID: <20200527101236.GB281913@kroah.com>
References: <1590418977.2838.16.camel@suse.com>
 <b39259fc7f397b27f4af145eeafb33ec36638660.camel@infinera.com>
 <a3f4a9bbde9efd2827b2a02c46f86c8ba7853bc6.camel@infinera.com>
 <1590482853.2838.26.camel@suse.com>
 <8cf71160e703a18b28d27a844406d42f6cadf39b.camel@infinera.com>
 <1590488084.2838.34.camel@suse.com>
 <42c92312c74e90e5507de4103bd15bbbe175f98d.camel@infinera.com>
 <4c2bd25aa7f6672cb132487f7af6a787ffc1fab6.camel@infinera.com>
 <1590568683.2838.42.camel@suse.com>
 <f4a809ba4ca132266e476ca1805e4ff9e5663f9f.camel@infinera.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f4a809ba4ca132266e476ca1805e4ff9e5663f9f.camel@infinera.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, May 27, 2020 at 09:40:47AM +0000, Joakim Tjernlund wrote:
> On Wed, 2020-05-27 at 10:38 +0200, Oliver Neukum wrote:
> > CAUTION: This email originated from outside of the organization. Do not click links or open attachments unless you recognize the sender and know the content is safe.
> > 
> > 
> > Am Dienstag, den 26.05.2020, 17:19 +0000 schrieb Joakim Tjernlund:
> > > 
> > > This "u-boot SPL" is the first thing u-boot writes and somehow this is remembered, I assume, by cdc_acm
> > > and gets echoed back when I open ttyACM0
> > 
> > Hi,
> > 
> > that makes sense, but it is not something that we could really
> > change in CDC-ACM, I am afraid.
> 
> Why not? CDC-ACM should echo back anything it has received before open of ttyACM

Is that in the specification somewhere?  I don't think there is any
requirement, otherwise that could be a huge waste of memory, right?  How
many bytes do you "keep" around?

thanks,

greg k-h
