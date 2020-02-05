Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AC5391539FD
	for <lists+linux-usb@lfdr.de>; Wed,  5 Feb 2020 22:18:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727104AbgBEVSP (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 5 Feb 2020 16:18:15 -0500
Received: from mail.kernel.org ([198.145.29.99]:36272 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727033AbgBEVSP (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 5 Feb 2020 16:18:15 -0500
Received: from localhost (unknown [193.117.204.200])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 7F3BA2082E;
        Wed,  5 Feb 2020 21:18:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1580937494;
        bh=cw/Q+0LM9/vBqCHeBQby87XziAnC/q/ln5gJPgJs8uY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=fxZmdrSJHuMsidDfa1uOS3dF6qWrcd1OHMT1o9OuFBK9hKVzLWq7ojVN9lkrLp9/k
         cF9aetR05NynOQvt76sMmLt2xxkuh8qCkTsMdM+ed5sarRKiug2OPwj2qmL9e6pAQT
         NouQx1+BIg6NaqlbvNVRh2Df1uZIZd/PLtErLRgw=
Date:   Wed, 5 Feb 2020 21:18:12 +0000
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Felipe Balbi <balbi@kernel.org>
Cc:     Andrey Konovalov <andreyknvl@google.com>,
        USB list <linux-usb@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Alan Stern <stern@rowland.harvard.edu>,
        Dmitry Vyukov <dvyukov@google.com>,
        Alexander Potapenko <glider@google.com>,
        Marco Elver <elver@google.com>
Subject: Re: [PATCH v5 1/1] usb: gadget: add raw-gadget interface
Message-ID: <20200205211812.GD1399643@kroah.com>
References: <cover.1579007786.git.andreyknvl@google.com>
 <461a787e63a9a01d83edc563575b8585bc138e8d.1579007786.git.andreyknvl@google.com>
 <87ftfv7nf0.fsf@kernel.org>
 <CAAeHK+wwmis4z9ifPAnkM36AnfG2oESSLAkKvDkuAa0QUM2wRg@mail.gmail.com>
 <87a7637ise.fsf@kernel.org>
 <CAAeHK+zNuqwmHG4NJwZNtQHizdaOpriHxoQffZHMffeke_hsGQ@mail.gmail.com>
 <87tv4556ke.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87tv4556ke.fsf@kernel.org>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Feb 05, 2020 at 06:42:41PM +0200, Felipe Balbi wrote:
> > Overall, supporting O_NONBLOCK might be a useful feature for people
> > who are doing something else other than fuzzing, We can account for
> > potential future extensions that'll support it, so detecting
> > O_NONBLOCK and returning an error for now makes sense.
> >
> > WDYT?
> 
> If that's the way you want to go, that's okay. But let's, then, prepare
> the code for extension later on. For example, let's add an IOCTL which
> returns the "version" of the ABI. Based on that, userspace can detect
> features and so on.

Ick, no, no version mess.  If you have a new api, just add a new ioctl
and away you go, userspace can easily test for that.  Don't go down the
path of trying to version your api, that way never works.

Trust me, been there, got the t-shirt, lived to regret it.

greg k-h
