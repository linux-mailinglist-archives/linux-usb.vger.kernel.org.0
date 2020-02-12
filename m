Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 74F8915B076
	for <lists+linux-usb@lfdr.de>; Wed, 12 Feb 2020 20:06:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727439AbgBLTGX (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 12 Feb 2020 14:06:23 -0500
Received: from mail.kernel.org ([198.145.29.99]:41000 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727279AbgBLTGX (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 12 Feb 2020 14:06:23 -0500
Received: from localhost (unknown [104.132.1.104])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id ACE3C20848;
        Wed, 12 Feb 2020 19:06:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1581534381;
        bh=v0K2H4gBWXFwH/xrBY/6Z+P8qGwclSA/DnT0aAGA8V0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=WZtxxc/Xmu+xdJWRfEw8wQOfEUSCP/Dh1xyM6p/FSOuHTNy3Gk5zMXzdzNwR7VX70
         K91pvTInNnlX9aURV2vcJADh0bo4gJhUEGNTumKKjOyQy+4uGBNk2F89IXKa2wLNTK
         rqoG+qeA4MQD8yQNEayutaXhhgg4yhCLXyXvtjvE=
Date:   Wed, 12 Feb 2020 11:06:21 -0800
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Bastien Nocera <hadess@hadess.net>
Cc:     linux-usb@vger.kernel.org,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Subject: Re: [PATCH v3 0/6] Add Apple MFi fastcharge USB device driver
Message-ID: <20200212190621.GA1970508@kroah.com>
References: <20191016093933.693-1-hadess@hadess.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191016093933.693-1-hadess@hadess.net>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Oct 16, 2019 at 11:39:27AM +0200, Bastien Nocera wrote:
> This is version 3 of the patch set.
> 
> Changes in v3:
> - Add Alan's ack
> - don't export usb_device_match_id()
> 
> Changes in v2:
> - checkpatch.pl is now quiet
> - fallback to the generic driver when driver ->probe() fails

Sorry for the long response to this, my fault.

At first, I really don't like the idea of using the usb device driver
interface, but I don't think there's a better way.  And, you did the
work to make it so that it works cleanly, which is always appreciated.

So all now queued up, let's see what breaks in linux-next with it! :)

One note, your patches had to be applied with "-p0" to git, normally we
do it with "-p1", I don't know how you generated your patches at 0
depth.

thanks,

greg k-h
