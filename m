Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E180129C69C
	for <lists+linux-usb@lfdr.de>; Tue, 27 Oct 2020 19:28:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1827117AbgJ0SVi (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 27 Oct 2020 14:21:38 -0400
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:41333 "EHLO
        relay7-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753820AbgJ0OC3 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 27 Oct 2020 10:02:29 -0400
X-Originating-IP: 82.255.60.242
Received: from [192.168.0.28] (lns-bzn-39-82-255-60-242.adsl.proxad.net [82.255.60.242])
        (Authenticated sender: hadess@hadess.net)
        by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 76F292000A;
        Tue, 27 Oct 2020 14:02:23 +0000 (UTC)
Message-ID: <4f367aba2f43b5e3807e0b01a5375e4a024ce765.camel@hadess.net>
Subject: Re: [PATCH 1/2] usbcore: Check both id_table and match() when both
 available
From:   Bastien Nocera <hadess@hadess.net>
To:     "M. Vefa Bicakci" <m.v.b@runbox.com>, linux-usb@vger.kernel.org
Cc:     stable@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>
Date:   Tue, 27 Oct 2020 15:02:22 +0100
In-Reply-To: <20201022135521.375211-2-m.v.b@runbox.com>
References: <4cc0e162-c607-3fdf-30c9-1b3a77f6cf20@runbox.com>
         <20201022135521.375211-1-m.v.b@runbox.com>
         <20201022135521.375211-2-m.v.b@runbox.com>
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
> When a USB device driver has both an id_table and a match() function,
> make
> sure to check both to find a match, first matching the id_table, then
> checking the match() function.
> 
> This makes it possible to have module autoloading done through the
> id_table when devices are plugged in, before checking for further
> device eligibility in the match() function.
> 
> Signed-off-by: Bastien Nocera <hadess@hadess.net>
> Cc: <stable@vger.kernel.org> # 5.8
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Alan Stern <stern@rowland.harvard.edu>
> Co-developed-by: M. Vefa Bicakci <m.v.b@runbox.com>
> Signed-off-by: M. Vefa Bicakci <m.v.b@runbox.com>

You can also add my:
Tested-by: Bastien Nocera <hadess@hadess.net>

