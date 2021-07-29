Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F19263DA0EF
	for <lists+linux-usb@lfdr.de>; Thu, 29 Jul 2021 12:15:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235189AbhG2KP7 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 29 Jul 2021 06:15:59 -0400
Received: from mail.kernel.org ([198.145.29.99]:56998 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235155AbhG2KP5 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 29 Jul 2021 06:15:57 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id D285260F23;
        Thu, 29 Jul 2021 10:15:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1627553754;
        bh=gCFhz1kmb7frQ55S+6krZ1a1neNQDDNetTCrkx9FFUY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=J8MCL8Yv1KoXwgVbxkzuV5eohXkgWsJK68MSYtmxFlFuY0T9A23DyXof6rp6/MFMN
         MmMqv8EoxUz4oCZO/EIs5g+d+aE2KADluvk9nNEY2dKq21HlEzdMPcx0VnmwwuiefR
         Lu0lnyveLr/rx86XIdNX+vVLXqNf4234Lgi/wB1qGnb61r7QGBLLb0+inSU4n5l7oL
         7X6JCmy+JndgCFz5rBbdHZRCKYpcHN/3vD2TTYuQ5pHbLEmXEBNynoYfrJ8YF+vT0h
         w4Va9+5aW2C0F54/5QkXIXEDKGxyhrQopXUE4v+SIyx0JAXIDp0jzXoESrfA7JIy5U
         7Ci1icWSE2Sww==
Received: from johan by xi with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1m934O-0002Ou-FN; Thu, 29 Jul 2021 12:15:16 +0200
Date:   Thu, 29 Jul 2021 12:15:16 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Oliver Neukum <oneukum@suse.com>
Cc:     Chris <chris@cyber-anlage.de>, linux-usb@vger.kernel.org
Subject: Re: pl2303 : unknown device type
Message-ID: <YQJ/tJ5km8X01mHj@hovoldconsulting.com>
References: <2560053.x2KRyp2eMa@cyber-bucket>
 <870cef37-ac7b-42b7-5691-088434c3b558@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <870cef37-ac7b-42b7-5691-088434c3b558@suse.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Jul 27, 2021 at 03:24:28PM +0200, Oliver Neukum wrote:
> 
> On 27.07.21 14:37, Chris wrote:
> > This problem was introduced with 5.13 and still persists in 5.13.5
> > After downgrading to 5.12.x, everything works like expected. Tested on 
> > archlinux. The device is an "ICP-DAS I-7561"

> this is almost certainly 8a7bf7510d1f43994b39a677e561af4ee6a1a0ae
> 
> ("USB: serial: pl2303: amend and tighten type detection")

Indeed.

> Your device just says 0 everywhere:
> 
>   bDeviceClass            0
>   bDeviceSubClass         0
>   bDeviceProtocol         0

This is expected. The protocol is per-interface, and nothing besides the
bcdVersion really stands out in the report.

> We could add a default type, but does that make sense?

Yeah, we may need to fallback to something like HX type if turns out
that there are more devices out there with unexpected bcdDevice.

Johan 
