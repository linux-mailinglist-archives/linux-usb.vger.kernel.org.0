Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0679D23A915
	for <lists+linux-usb@lfdr.de>; Mon,  3 Aug 2020 17:05:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726816AbgHCPEt (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 3 Aug 2020 11:04:49 -0400
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:38853 "EHLO
        relay7-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726276AbgHCPEt (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 3 Aug 2020 11:04:49 -0400
X-Originating-IP: 82.255.60.242
Received: from classic (lns-bzn-39-82-255-60-242.adsl.proxad.net [82.255.60.242])
        (Authenticated sender: hadess@hadess.net)
        by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 27EE120012;
        Mon,  3 Aug 2020 15:04:46 +0000 (UTC)
Message-ID: <64c8caa8ee054ed9106683f15238b2be74f77aa2.camel@hadess.net>
Subject: Re: [PATCH v6 3/3] USB: Fix device driver race
From:   Bastien Nocera <hadess@hadess.net>
To:     linux-usb@vger.kernel.org
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>
Date:   Mon, 03 Aug 2020 17:04:46 +0200
In-Reply-To: <20200727104644.149873-3-hadess@hadess.net>
References: <20200727104644.149873-1-hadess@hadess.net>
         <20200727104644.149873-3-hadess@hadess.net>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.3 (3.36.3-1.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, 2020-07-27 at 12:46 +0200, Bastien Nocera wrote:
> When a new device with a specialised device driver is plugged in, the
> new driver will be modprobe()'d but the driver core will attach the
> "generic" driver to the device.
> 
> After that, nothing will trigger a reprobe when the modprobe()'d
> device
> driver has finished initialising, as the device has the "generic"
> driver attached to it.
> 
> Trigger a reprobe ourselves when new specialised drivers get
> registered.
> 
> Fixes: 88b7381a939d ("USB: Select better matching USB drivers when
> available")
> Signed-off-by: Bastien Nocera <hadess@hadess.net>

Greg, Alan, are you happy with this iteration?

If so, I can send it again with Alan's acks, along with a fix for the
function name Alan mentioned. I see that the first patch in the list
landed in usb-next already.

