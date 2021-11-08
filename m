Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E90D447FFE
	for <lists+linux-usb@lfdr.de>; Mon,  8 Nov 2021 14:02:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239773AbhKHNFa (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 8 Nov 2021 08:05:30 -0500
Received: from mail.kernel.org ([198.145.29.99]:45192 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230303AbhKHNF3 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 8 Nov 2021 08:05:29 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0BE6A61058;
        Mon,  8 Nov 2021 13:02:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1636376565;
        bh=fabL36Jbd/PUZZE6qeq7NlOCM+mioo9PAn2IMXiDqEg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=XHN55SliHH06S4r1RPXQuomkZbNESD8VUP73cW2VWuAKF+tWimUS7/9H33N22aUeE
         CSstr2xGKo/JUVCWuJbdZ+QTUifxxCSyGwpDUhysPPMlx7DR/T77rNkapV6foSVeVp
         Qy+INbTUeXJt2p/XQZ76yKNOXDnMdtFR/4H0Pp/M=
Date:   Mon, 8 Nov 2021 14:02:43 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Shantur Rathore <i@shantur.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: usb-gadget: dynamic reconfiguration
Message-ID: <YYkf87RxhhJ3eWuC@kroah.com>
References: <CABEcMwWwsa1Q_mZaf=QUQb-Gc-xe=gmL6F2v3BPGyrJ7-mfB2g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CABEcMwWwsa1Q_mZaf=QUQb-Gc-xe=gmL6F2v3BPGyrJ7-mfB2g@mail.gmail.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Nov 08, 2021 at 12:54:37PM +0000, Shantur Rathore wrote:
> Hi all,
> 
> I am trying to figure out if it's possible to reconfigure a usb-gadget
> when it's live.
> The idea is to create a gadget with 1 function - lets say a serial gadget.
> 
> Upon communication with the host, the host could specify (via Serial
> communication) which is the next gadget it needs for example a mass
> storage or ecm and the next gadget can be added to the configuration.
> 
> For now this only works if the gadget is disconnected and reconnected
> to the UDC.
> 
> I want to understand if it is technically possible to add more
> functions to a live config without affecting existing functions.

The USB standard does not allow for this type of thing, sorry.  So this
really isn't anything you could do on the gadget side and expect the
host side to notice it.

thanks,

greg k-h
