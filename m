Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3CC551E9791
	for <lists+linux-usb@lfdr.de>; Sun, 31 May 2020 14:32:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727963AbgEaMcT (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 31 May 2020 08:32:19 -0400
Received: from mail.kernel.org ([198.145.29.99]:49166 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725912AbgEaMcS (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sun, 31 May 2020 08:32:18 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id BFAF4206F0;
        Sun, 31 May 2020 12:32:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1590928338;
        bh=y/8M7sTLFZYiKdn2WFCw/fjSoVkr1omZdIttKRVAZd4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=my+zT6SiC/+s+C34q196XygHtbU6gc2gA/+TeMXqC7KN6Z8bf6pjBHYETBfQM7RNm
         FBb4XeETr3cB54AMRZZpo1dC0ZdbsCOjQVD2uW2XxeBej2aj/QY2k8HW40zADuRUXr
         qO3xDpPTbbOFQHYYDgclF2/kjyyrROghFf6XmxFE=
Date:   Sun, 31 May 2020 14:32:15 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Rob Gill <rrobgill@protonmail.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb : Report additional USB classes
Message-ID: <20200531123215.GA1286968@kroah.com>
References: <20200531122226.23570-1-rrobgill@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200531122226.23570-1-rrobgill@protonmail.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sun, May 31, 2020 at 12:23:03PM +0000, Rob Gill wrote:
> Changelog : Add #defines and strings for additional USB classes

I don't understand, what does "Changelog :" mean here?

> 
> 0fh (Personal Healthcare), 10h (USB Type-C combined audio/video devices), 11h (USB billboard), 12h (USB Type-C bridge). [https://www.usb.org/defined-class-codes]

What is this a list of?

Please read the section entitled "The canonical patch format" in the
kernel file, Documentation/SubmittingPatches for what is needed in order
to properly describe the change.

thanks!

greg k-h
