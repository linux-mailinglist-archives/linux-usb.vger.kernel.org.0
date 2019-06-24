Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5AB7E51C07
	for <lists+linux-usb@lfdr.de>; Mon, 24 Jun 2019 22:09:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731553AbfFXUJN (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 24 Jun 2019 16:09:13 -0400
Received: from mail-pl1-f181.google.com ([209.85.214.181]:33990 "EHLO
        mail-pl1-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729879AbfFXUJM (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 24 Jun 2019 16:09:12 -0400
Received: by mail-pl1-f181.google.com with SMTP id i2so7508220plt.1
        for <linux-usb@vger.kernel.org>; Mon, 24 Jun 2019 13:09:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gnarbox-com.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=NPtyegdpNC4BqNoq+ZWko7iuPtqXZMeBMglWMacX7Lg=;
        b=VnPvT0J4mSFyUCVArMl3zBh3yikj5V3y9DlyE+o0t7N4yWK/OXX/6WmPlRr65igmk3
         pE6FT1M/BxgOgbuo17cSkYfJX5+lAafAR83iI/1pyIrw99mVmmBqnjPFRXAFfDrFTTZk
         OCxEUvHTAZqfS+clz5zfKcuuvR1vpOWWG93aFm3zwOYdV084JubssNlkVIEVPZ8SSGaj
         7qaUGMMRUxU1XeYOcllWnAFAGjy8rh1iCGFdO1gsGo7C/lfgnQzpY6MrlhqXIGFZJACK
         8o2C6SGK5om/bP36vsBAI4dwAR9x0eMbrk4FdcEq8UN7z/aRt6ebph+EMH80MWeWDFjc
         kzRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=NPtyegdpNC4BqNoq+ZWko7iuPtqXZMeBMglWMacX7Lg=;
        b=uHMtbRNheWjVTr+fozDxe6UVi1vHSGNPqBDZnkIMQPatP0NscB+PRg5cMvtRbnWM84
         QD1wcplnyPrCwe+uZLIyuxKYteIXNkSOqMFSKiSI4mH0jO4CcOB3efgUsOwXEwH4g0i8
         SCNT+yIPnXsyh/QMKb8OpR1u3IuWsCPrHs4JvjEP5YYsCOlS2VAFZ2QqbTuuhw+HhiXP
         2oqjxX31oDccBJODMMsg+c8u3tzdg9ejCmkUd/HWxIgeqe3x40ILIMbK+0xSMkZFl/EG
         WViGmdvucJsDT1ngIVHl7nd//9GamDpR94Z19RHlc8EWPLyKxskl0C+wjkRaM/SYSYiE
         OwIw==
X-Gm-Message-State: APjAAAUuEmKxvAWpGmHFUbIoX/eb3Rd35i6/abQsSqmH8EOuVZ6a6hxC
        8Qpcm0xincWfuM9Edwd41An5T7Xey08BIA==
X-Google-Smtp-Source: APXvYqwXFixqSXhspKyGOgkPawdjKbC8oLMzNMVP1kVnY0WBGYs9D3RaTgVM1e17HX4QdEvysESbzQ==
X-Received: by 2002:a17:902:6b86:: with SMTP id p6mr81412286plk.14.1561406951860;
        Mon, 24 Jun 2019 13:09:11 -0700 (PDT)
Received: from coops ([12.244.160.210])
        by smtp.gmail.com with ESMTPSA id a16sm15687417pfd.68.2019.06.24.13.09.10
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 Jun 2019 13:09:10 -0700 (PDT)
Date:   Mon, 24 Jun 2019 13:09:08 -0700
From:   Rob Weber <rob@gnarbox.com>
To:     Mathias Nyman <mathias.nyman@linux.intel.com>
Cc:     mathias.nyman@intel.com, linux-usb@vger.kernel.org
Subject: Re: xHCI Driver Compliance Test Support
Message-ID: <20190624200908.GA25232@coops>
References: <20190619190307.GA18466@coops>
 <fc2609bc-2441-0293-1eca-3781af410414@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fc2609bc-2441-0293-1eca-3781af410414@linux.intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello,

On Mon, Jun 24, 2019 at 09:15:24AM +0300, Mathias Nyman wrote:
> On 19.6.2019 22.03, Rob Weber wrote:
> > I am working on running our custom USB dual-role product through some
> > compliance testing. It seems that the SoC and host controller are
> > not responding to the LFPS signaling and timeout that is supposed to
> > automatically begin the compliance test sequence.
> > 
> > I'm currently running a 4.9.115 kernel, and I'm afraid I might be
> > missing some critical patches for compliance test support. I noticed
> > these two patches came up in a google search:
> > 
> > https://patchwork.kernel.org/patch/10415345/
> > https://www.spinics.net/lists/linux-usb/msg160002.html
> > 
> > Besides these patches, is there anything else that comes to mind that I
> > might need to do to start compliance testing? I'm about to build a more
> > recent kernel to see if that improves my situation as well.
> 
> If xHC hw has a "Compliance Transition Capability" (CTC) bit set in the
> HCCPARAMS2 register then ports won't go to compliance unless software
> specifically allows it.
> 
> see xhci spec section 4.19.1.2.4.1 for more details.
> 
> Compliance can be allowed either with a SetPortFeature(PORT_LINK_STATE) request,
> or via debugfs.
> 
> To allow compliance using debugfs, first check port is in disabled state:
> 
> # cat /sys/kernel/debug/usb/xhci/0000:00:15.0/ports/port01/portsc
> Powered Not-connected Disabled Link:RxDetect PortSpeed:0 Change: Wake:
> 
> enable compliance by writing "compliance" to the port:
> # echo compliance > /sys/kernel/debug/usb/xhci/0000:00:15.0/ports/port01/portsc
> 
> This needs to be done for that specific port, and after every port warm reset.
> 
> After 1st LFPS timeout the port should go to compliance, can be read from portsc
> 
> Also make sure you don't have XHCI_COMP_MODE_QUIRK or XHCI_MISSING_CAS quirks set,
> these try to recover ports that accidentally enter compliance mode in normal use.

Thanks for the tip! I will try this approach with a newer kernel soon. I
learned that the port enters compliance mode after the 1st LFPS polling
timeout last week after watching the port become "disabled" after
the first connection. We're currently doing a full power cycle to
correct this state, but unbinding and re-binding the pci device with the
xhci_hcd driver has also been successful at resetting the xHC. The portsc
register and warm_reset file will help improve our workflow for compliance
testing.

> > Just for reference, our product uses an intel atom z8550 SoC that uses
> > an xHCI host controller and a dwc3 device controller. Our platform also
> > uses a USB 3.0 redriver. The datasheet for this redriver (tusb542)
> > indicates that it's internal LFPS controller supports full USB 3.0
> > compliance requirements.
> > 
> 
> z8550 is Cherry Trail? I unfortunately don't have those around anymore.

Yeah, they are increasingly hard to come by. But so far your description
aligns with our findings and research about the xHCI implementation in
this SoC. Thanks for your help!

Cheers,
Rob Weber
