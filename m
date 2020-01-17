Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 373C8140A78
	for <lists+linux-usb@lfdr.de>; Fri, 17 Jan 2020 14:13:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727005AbgAQNNg (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 17 Jan 2020 08:13:36 -0500
Received: from mail.kernel.org ([198.145.29.99]:48320 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726329AbgAQNNg (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 17 Jan 2020 08:13:36 -0500
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0AB0D206E6;
        Fri, 17 Jan 2020 13:13:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1579266815;
        bh=OduVNBkddglAb5wzi3uYSRrpBS0ktJBiMZtFhipHHks=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Whq2NUC8Aj9KeptLtjzwMqbTuHVkIsYCA6Dm0eOKX6dK64wzQ6dgc0Bp3IVhBofA2
         c72HTy/zbTXjFszK6BLRl1BUMSMPbppXYmfmgMNs7Kcg25k4K3m7TVzKp2G09sMFRl
         6pgcAAHQg5kwmYTdUAR0iQqWSE357+31pPMAAP+U=
Date:   Fri, 17 Jan 2020 14:13:30 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Johan Hovold <johan@kernel.org>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [PATCH 0/5] USB: serial: handle unbound ports
Message-ID: <20200117131330.GA1848214@kroah.com>
References: <20200117095026.27655-1-johan@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200117095026.27655-1-johan@kernel.org>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Jan 17, 2020 at 10:50:21AM +0100, Johan Hovold wrote:
> Drivers must make sure that a port is bound to a driver before accessing
> port data in non-port callbacks.
> 
> Note that this is needed even with the port-driver bind attributes
> removed as an individual port may have failed to probe.
> 
> Johan
> 
> 
> Johan Hovold (5):
>   USB: ch341: handle unbound port at reset_resume
>   USB: serial: io_edgeport: handle unbound ports on URB completion
>   USB: serial: io_edgeport: add missing active-port sanity check
>   USB: serial: keyspan: handle unbound ports
>   USB: serial: quatech2: handle unbound ports

For all 5:

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
