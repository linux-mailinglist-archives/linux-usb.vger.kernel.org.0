Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 23E9C13ABBD
	for <lists+linux-usb@lfdr.de>; Tue, 14 Jan 2020 15:01:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729129AbgANOA1 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 14 Jan 2020 09:00:27 -0500
Received: from mail.kernel.org ([198.145.29.99]:49332 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728884AbgANOA1 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 14 Jan 2020 09:00:27 -0500
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id DB17E2467A;
        Tue, 14 Jan 2020 14:00:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1579010426;
        bh=H/51/5ZekFpSpHx8KB4PX8o7MbAINifRHPOl5iU9qxQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=tgsc0vIAH4ypovFs6+X7TCXJaixVEaZ3kmYgpSSQiuV9uX9j1TI4IytD7AN8c23NB
         a/sUBOs7OcRou2dLRq6ElfACP80NU4L7BTkYxd5HdO5HAeUIjFbxy2G5qE293D2b+x
         h/eNhyVub2cXQ85X/05WByxgbgQm6gAmL+A2hoj4=
Date:   Tue, 14 Jan 2020 15:00:23 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Andrey Konovalov <andreyknvl@google.com>
Cc:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Felipe Balbi <balbi@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Alan Stern <stern@rowland.harvard.edu>,
        Dmitry Vyukov <dvyukov@google.com>,
        Alexander Potapenko <glider@google.com>,
        Marco Elver <elver@google.com>
Subject: Re: [PATCH v5 1/1] usb: gadget: add raw-gadget interface
Message-ID: <20200114140023.GA1694074@kroah.com>
References: <cover.1579007786.git.andreyknvl@google.com>
 <461a787e63a9a01d83edc563575b8585bc138e8d.1579007786.git.andreyknvl@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <461a787e63a9a01d83edc563575b8585bc138e8d.1579007786.git.andreyknvl@google.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Jan 14, 2020 at 02:24:43PM +0100, Andrey Konovalov wrote:
> USB Raw Gadget is a kernel module that provides a userspace interface for
> the USB Gadget subsystem. Essentially it allows to emulate USB devices
> from userspace. Enabled with CONFIG_USB_RAW_GADGET. Raw Gadget is
> currently a strictly debugging feature and shouldn't be used in
> production.
> 
> Raw Gadget is similar to GadgetFS, but provides a more low-level and
> direct access to the USB Gadget layer for the userspace. The key
> differences are:
> 
> 1. Every USB request is passed to the userspace to get a response, while
>    GadgetFS responds to some USB requests internally based on the provided
>    descriptors. However note, that the UDC driver might respond to some
>    requests on its own and never forward them to the Gadget layer.
> 
> 2. GadgetFS performs some sanity checks on the provided USB descriptors,
>    while Raw Gadget allows you to provide arbitrary data as responses to
>    USB requests.
> 
> 3. Raw Gadget provides a way to select a UDC device/driver to bind to,
>    while GadgetFS currently binds to the first available UDC.
> 
> 4. Raw Gadget uses predictable endpoint names (handles) across different
>    UDCs (as long as UDCs have enough endpoints of each required transfer
>    type).
> 
> 5. Raw Gadget has ioctl-based interface instead of a filesystem-based one.
> 
> Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Signed-off-by: Andrey Konovalov <andreyknvl@google.com>
> ---
> 
> Greg, I've assumed your LGTM meant that I can add a Reviewed-by from you.

Yes, I was about to give it a "real" one, but that is fine here, thanks.

greg k-h
