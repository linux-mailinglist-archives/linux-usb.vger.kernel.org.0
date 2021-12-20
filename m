Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D73A47A7DC
	for <lists+linux-usb@lfdr.de>; Mon, 20 Dec 2021 11:45:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229612AbhLTKpZ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 20 Dec 2021 05:45:25 -0500
Received: from ams.source.kernel.org ([145.40.68.75]:58104 "EHLO
        ams.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229459AbhLTKpZ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 20 Dec 2021 05:45:25 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id EE3C1B80E33
        for <linux-usb@vger.kernel.org>; Mon, 20 Dec 2021 10:45:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D431C36AE8;
        Mon, 20 Dec 2021 10:45:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1639997122;
        bh=2DzEFjxa8dcWu0VnnSctZJz/fpWAW00zYElRTGpHD+M=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Uc/esLT2GMjuKtTOQOve2QW3VzzYnXNJzuhgwrWaiyP4/847uB2yjYKnXcbZuKVd/
         Vj/kgcdQ3FF8e7mzCeaO2B5/NafGqokYYwI7xaBCuKuVqdOZZf2VXllwUOj5uqbDTD
         fJMG47P9uOKo5/AzqMbpKVRdRj1r2Rj53gTi1mdw=
Date:   Mon, 20 Dec 2021 11:45:20 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Filip =?utf-8?Q?=C5=BDaludek?= <filip.zaludek@oracle.com>
Cc:     linux-usb@vger.kernel.org, Konrad Wilk <konrad.wilk@oracle.com>
Subject: Re: [External] : Re: data throttling under load when serial to usb
 adapter is used
Message-ID: <YcBewGmzrjFlVR3y@kroah.com>
References: <738e20c6-c709-d149-fe48-ee89540fe38a@oracle.com>
 <YcA+qegbpj0heal4@kroah.com>
 <67ff29fb-98cd-1835-ee6e-4eba67ff269c@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <67ff29fb-98cd-1835-ee6e-4eba67ff269c@oracle.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Dec 20, 2021 at 11:19:03AM +0100, Filip Žaludek wrote:
> 
> > 
> > Using 'cat' is not a good way to ever use a serial port.  Please use a
> > tool that can properly detect and use the serial port flow control
> > settings, which should prevent the issues you are seeing here.
> > 
> > Is socat using flow control?  If so, which settings, hardware or
> > software flow control?
> > 
> > Also please note that the usb-serial devices you are using here are
> > _very_ cheap and not good for huge amounts of data like you seem to want
> > to use here.  I would recommend a much more robust usb-serial device if
> > you need high data rates and good hardware flow control handling.  Most
> > of the time, the devices you have here do not even have any hardware
> > flow control support as the manufacturers do not hook up those lines.
> > So be careful.
> > 
> > thanks,
> > 
> > greg k-h
> > 
> 
> 
> 
>  Yes, you are right! Such gadget hardware is without hw flow control. I am using
> serial line only to capture console logs. I've tested both commands also with
> sw flow control ixon, ixoff with similar results.
> 
>  Hopefully somebody sitting on scarce big iron with both usb port and serial port
> with proper hw flow control from this list gets attracted to kindly re-test.
> 
> Interesting part for me is that only serial to usb direction is failing..

Makes sense, these devices are not designed for lots of high-speed data
being sent to them.  Please use a device that is designed for that if
you wish to do this.

thanks,

greg k-h
