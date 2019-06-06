Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8D680376EB
	for <lists+linux-usb@lfdr.de>; Thu,  6 Jun 2019 16:36:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729132AbfFFOgW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 6 Jun 2019 10:36:22 -0400
Received: from mail.kernel.org ([198.145.29.99]:45440 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729127AbfFFOgT (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 6 Jun 2019 10:36:19 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id AAFF020684;
        Thu,  6 Jun 2019 14:36:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1559831779;
        bh=0+6yAN4x3LW/K99s/MXK1mbzTQ4ibuVWbt5QohmGAnE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=p+JWUakozH4qlGjRMvUqJKmWScqn+pXjEPKspuP/Wv1MoauGALSeO1W1pU5RWrYBt
         dy/KbL0jdi9wPFIY/BWoO4hEmSMe9PG3o9SWs7WV1ckIQAHMMNAUlGfsHVbgLtvHAi
         53sF+XxCvOafmq/W8ZCIWfhWPeK1lulqj10pQKvw=
Date:   Thu, 6 Jun 2019 16:36:16 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     "Bollinger, Seth" <Seth.Bollinger@digi.com>
Cc:     USB list <linux-usb@vger.kernel.org>,
        Seth Bollinger <seth.boll@gmail.com>
Subject: Re: USB reset problem
Message-ID: <20190606143616.GB11294@kroah.com>
References: <A2655C7A-C29C-4462-A668-8F7B9C81A648@digi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <A2655C7A-C29C-4462-A668-8F7B9C81A648@digi.com>
User-Agent: Mutt/1.12.0 (2019-05-25)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Jun 06, 2019 at 01:55:37PM +0000, Bollinger, Seth wrote:
> Hello All,
> 
> Recently we saw a problem where the device reset will fail due to a configuration descriptor check in hub.c:5600.
> 
>         if (memcmp(buf, udev->rawdescriptors[index], old_length)
>                 != 0) {
>             dev_dbg(&udev->dev, "config index %d changed (#%d)\n",
>                 index,
>                 ((struct usb_config_descriptor *) buf)->
>                     bConfigurationValue);
>             changed = 1;
>             break;
>         }
> 
> The descriptors returned from the device have a different iInterface.  I checked the usb spec and couldn’t find anything that says iInterface can’t change.  I don’t have the source for the device, but I think it’s probably generating the interface string each reset and returning a different index for it (“ADB interface”).
> 
> Has anyone else seen this?  Does the spec guarantee that iInterface should never change between device resets?

If the descriptor changes between resets, that means that something
changed and we need to start over with it.  What is the problem that
this is causing?

thanks,

greg k-h
