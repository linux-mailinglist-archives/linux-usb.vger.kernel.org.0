Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 71C282B9BA2
	for <lists+linux-usb@lfdr.de>; Thu, 19 Nov 2020 20:45:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726854AbgKSTnC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 19 Nov 2020 14:43:02 -0500
Received: from netrider.rowland.org ([192.131.102.5]:37133 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1726644AbgKSTnB (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 19 Nov 2020 14:43:01 -0500
Received: (qmail 583283 invoked by uid 1000); 19 Nov 2020 14:43:00 -0500
Date:   Thu, 19 Nov 2020 14:43:00 -0500
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Alberto Sentieri <22t@tripolho.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Subject: Re: kernel locks due to USB I/O
Message-ID: <20201119194300.GA582614@rowland.harvard.edu>
References: <9428ae70-887e-b48b-f31c-f95d58f67c61@tripolho.com>
 <20201110205114.GB204624@rowland.harvard.edu>
 <8152190e-c962-e376-64fd-cc2ebf3e6104@tripolho.com>
 <20201111155130.GB237113@rowland.harvard.edu>
 <9687fac9-94de-50a3-f88e-b7e05d660aba@tripolho.com>
 <20201116170625.GC436089@rowland.harvard.edu>
 <1e58c6f4-c651-b45a-b0fc-7bee40fe61cb@tripolho.com>
 <20201119172250.GC576844@rowland.harvard.edu>
 <427818cf-aa35-54d3-83cf-02529a0ab5aa@tripolho.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <427818cf-aa35-54d3-83cf-02529a0ab5aa@tripolho.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Nov 19, 2020 at 02:21:47PM -0500, Alberto Sentieri wrote:
> lsusb -t in a similar configuration I use for development (it has just 6
> device, and not 36):
> 
> $ lsusb -t

> /:  Bus 02.Port 1: Dev 1, Class=root_hub, Driver=ehci-pci/4p, 480M
>     |__ Port 3: Dev 5, If 0, Class=Hub, Driver=hub/7p, 480M
>         |__ Port 1: Dev 6, If 0, Class=Hub, Driver=hub/2p, 480M
>             |__ Port 1: Dev 8, If 0, Class=Human Interface Device,
> Driver=usbhid, 12M
>         |__ Port 2: Dev 7, If 0, Class=Hub, Driver=hub/2p, 480M
>             |__ Port 1: Dev 10, If 0, Class=Human Interface Device,
> Driver=usbhid, 12M
>         |__ Port 4: Dev 9, If 0, Class=Hub, Driver=hub/2p, 480M
>             |__ Port 1: Dev 12, If 0, Class=Human Interface Device,
> Driver=usbhid, 12M
>         |__ Port 5: Dev 11, If 0, Class=Hub, Driver=hub/7p, 480M
>         |__ Port 6: Dev 13, If 0, Class=Hub, Driver=hub/7p, 480M
>             |__ Port 6: Dev 15, If 0, Class=Hub, Driver=hub/2p, 480M
>                 |__ Port 1: Dev 17, If 0, Class=Human Interface Device,
> Driver=usbhid, 12M
>             |__ Port 7: Dev 16, If 0, Class=Hub, Driver=hub/2p, 480M
>                 |__ Port 1: Dev 18, If 0, Class=Human Interface Device,
> Driver=usbhid, 12M
>         |__ Port 7: Dev 14, If 0, Class=Human Interface Device,
> Driver=usbhid, 12M

Previously you said that each HID microcontroller is connected to port 1
of a two-port hub.  But that clearly isn't true for device 14 in the
listing above.  What happened there?

Alan Stern

