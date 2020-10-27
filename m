Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A088529C697
	for <lists+linux-usb@lfdr.de>; Tue, 27 Oct 2020 19:27:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1827109AbgJ0SVb (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 27 Oct 2020 14:21:31 -0400
Received: from relay5-d.mail.gandi.net ([217.70.183.197]:41595 "EHLO
        relay5-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753915AbgJ0OC7 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 27 Oct 2020 10:02:59 -0400
X-Originating-IP: 82.255.60.242
Received: from [192.168.0.28] (lns-bzn-39-82-255-60-242.adsl.proxad.net [82.255.60.242])
        (Authenticated sender: hadess@hadess.net)
        by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 29C601C0009;
        Tue, 27 Oct 2020 14:02:54 +0000 (UTC)
Message-ID: <c69233ce20acd04fcba780a0483a18031d9a541e.camel@hadess.net>
Subject: Re: [PATCH 2/2] USB: apple-mfi-fastcharge: don't probe unhandled
 devices
From:   Bastien Nocera <hadess@hadess.net>
To:     "M. Vefa Bicakci" <m.v.b@runbox.com>, linux-usb@vger.kernel.org
Cc:     Pany <pany@fedoraproject.org>, stable@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>
Date:   Tue, 27 Oct 2020 15:02:54 +0100
In-Reply-To: <20201022135521.375211-3-m.v.b@runbox.com>
References: <4cc0e162-c607-3fdf-30c9-1b3a77f6cf20@runbox.com>
         <20201022135521.375211-1-m.v.b@runbox.com>
         <20201022135521.375211-3-m.v.b@runbox.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.1 (3.38.1-1.fc33) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, 2020-10-22 at 09:55 -0400, M. Vefa Bicakci wrote:
> From: Bastien Nocera <hadess@hadess.net>
> 
> From: Bastien Nocera <hadess@hadess.net>
> 
> Contrary to the comment above the id table, we didn't implement a
> match
> function. This meant that every single Apple device that was already
> plugged in to the computer would have its device driver reprobed
> when the apple-mfi-fastcharge driver was loaded, eg. the SD card
> reader
> could be reprobed when the apple-mfi-fastcharge after pivoting root
> during boot up and the module became available.
> 
> Make sure that the driver probe isn't being run for unsupported
> devices by adding a match function that checks the product ID, in
> addition to the id_table checking the vendor ID.
> 
> Fixes: 249fa8217b84 ("USB: Add driver to control USB fast charge for
> iOS devices")
> Signed-off-by: Bastien Nocera <hadess@hadess.net>
> Reported-by: Pany <pany@fedoraproject.org>
> Link: https://bugzilla.redhat.com/show_bug.cgi?id=1878347
> Link: 
> https://lore.kernel.org/linux-usb/CAE3RAxt0WhBEz8zkHrVO5RiyEOasayy1QUAjsv-pB0fAbY1GSw@mail.gmail.com/
> Cc: <stable@vger.kernel.org> # 5.8
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Alan Stern <stern@rowland.harvard.edu>
> [m.v.b: Add Link and Reported-by tags to the commit message]
> Signed-off-by: M. Vefa Bicakci <m.v.b@runbox.com>

And along with the 1/2 patch:
Tested-by: Bastien Nocera <hadess@hadess.net>

