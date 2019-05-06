Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ED3621499B
	for <lists+linux-usb@lfdr.de>; Mon,  6 May 2019 14:32:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726085AbfEFMcZ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 6 May 2019 08:32:25 -0400
Received: from mail.kernel.org ([198.145.29.99]:54328 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725856AbfEFMcZ (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 6 May 2019 08:32:25 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 30D99206A3;
        Mon,  6 May 2019 12:32:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1557145945;
        bh=i2tywlRpfngrv5oUkY0H/gPgKVUeE2BRiuTHr/v7E4Q=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=QYecL6NYmgTz18E7kzmnTnCSsx2g5q4dxhdDG1m01YxUnjutWUnfyAZ65gOjsuOku
         vvlQh+2WNuhvW5MfzLQVjOG3lls7JUSmrKnf43AOv5zrFdXfPc/70ejjMDlKJUrGDw
         KNGYfGPKG6bq2WUrtCo4hjS/2Zgx7C6oo40szQSM=
Date:   Mon, 6 May 2019 14:32:21 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Mantas =?utf-8?Q?Mikul=C4=97nas?= <grawity@gmail.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: usbutils - various patches to the lsusb.py script
Message-ID: <20190506123221.GA25920@kroah.com>
References: <20190506090241.169665-1-grawity@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190506090241.169665-1-grawity@gmail.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, May 06, 2019 at 12:02:07PM +0300, Mantas Mikulėnas wrote:
> Hi,
> 
> I accidentally ended up hacking on the lsusb.py script and now have an
> assorted collection of patches:
> 
> - Output (controllers, hubs, etc.) sorted numerically.
> - Color enabled by default when on a tty.
> - Added --long-options.
> - Replaced hand-rolled binary search with ordinary dict lookups;
>   lost the -w (--warn-if-unsorted) option in the process.
> - Cosmetic changes to make it look more like Python and less like C.
> - Some changes to the output formatting that I liked to have in my own
>   local version.
> 
> 

I've applied all of these patches now, except for the usb.ids error
message that I responded to.  Note, I do not know python well, if at
all, so I just had to take your word for most of these :)

I don't like the usb.ids error message that happens here, it's not
essential that that file be found, especially given that most distros do
not ship it anymore as they have switched over to the hw database
format.  So maybe we can just drop the "error" as the tool does work
without it, or look for the hwids data instead?

thanks,

greg k-h
