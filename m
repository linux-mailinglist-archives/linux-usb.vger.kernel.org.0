Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D7A02F5B8D
	for <lists+linux-usb@lfdr.de>; Thu, 14 Jan 2021 08:52:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727328AbhANHuX (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 14 Jan 2021 02:50:23 -0500
Received: from mail.kernel.org ([198.145.29.99]:55954 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727319AbhANHuW (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 14 Jan 2021 02:50:22 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 65459233FD;
        Thu, 14 Jan 2021 07:49:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1610610582;
        bh=GPgqayWa7ykvGcn6a7LLuziq41A+EEiloyOtgv0bL8Q=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=cvjpuFwvQ4irz9ZWBE24KdQJQEzCEdnznrqRXs2S/I0QE96rgF2/jRfzS/7JNvj3u
         vZToM7052lvei3OYNV19uJNIU/tg4lYDVWtIXv3Xe54JqG+92ZoT/e9HJF/BOg6V5I
         T+R7HwVKs7km1gO5xj83dQIS6PhrxH/2j1xP3Mf4=
Date:   Thu, 14 Jan 2021 08:49:38 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Alan Cooper <alcooperx@gmail.com>
Cc:     Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
        Felipe Balbi <balbi@kernel.org>,
        USB list <linux-usb@vger.kernel.org>
Subject: Re: Conflicting PCI ID in bdc driver
Message-ID: <X//3kiH8Frw2dTyM@kroah.com>
References: <CAMeQTsacNs-YVWeX6vFJyMBLeD_AX6imNQRodV_X-QS54wAREA@mail.gmail.com>
 <X/y1ekqBrjXK8lZO@kroah.com>
 <CAMeQTsaL0mx=WW2Ekr2gh_aCWKnumS4mSr5tTH_ac+cdarzxMA@mail.gmail.com>
 <CAOGqxeUkZ8VK-D3xutVvQk7e2t1=9GzLQL7oHz0GTj_FMdVeqw@mail.gmail.com>
 <CAMeQTsZA7a9WcJq2tudWhaJbc6Z4vb4jtcUnHOCzg9u3oLxzbw@mail.gmail.com>
 <X/1ksTC4SBgrQoak@kroah.com>
 <CAOGqxeXE4D7Dyf-9c=evZMG+PTGrycKTpY1=VBk7OVAWKmyh0A@mail.gmail.com>
 <X/7KJ1gbcnQDUWx3@kroah.com>
 <CAOGqxeWYcsQMRfGQeefufriba33hZ7__g+77dzwE=kT=csWywA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAOGqxeWYcsQMRfGQeefufriba33hZ7__g+77dzwE=kT=csWywA@mail.gmail.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Jan 13, 2021 at 03:07:03PM -0500, Alan Cooper wrote:
> Just to be clear, I'm only interested in removing the bdc_pci.c file
> and not the rest of the BDC driver.

Ok, that's better, please send a patch for this.

thanks,

greg k-h
