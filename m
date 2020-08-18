Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5869C248E05
	for <lists+linux-usb@lfdr.de>; Tue, 18 Aug 2020 20:34:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726588AbgHRSeX (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 18 Aug 2020 14:34:23 -0400
Received: from netrider.rowland.org ([192.131.102.5]:38487 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1726716AbgHRSeV (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 18 Aug 2020 14:34:21 -0400
Received: (qmail 156023 invoked by uid 1000); 18 Aug 2020 14:34:20 -0400
Date:   Tue, 18 Aug 2020 14:34:20 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Patrik Nilsson <nipatriknilsson@gmail.com>
Cc:     Greg KH <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org
Subject: Re: high speed data to usb disk makes the kernel think that is has
 been unmounted
Message-ID: <20200818183420.GB152667@rowland.harvard.edu>
References: <a161e45d-6ce8-2077-c513-380b67c4dfd8@gmail.com>
 <20200811175655.GB828356@kroah.com>
 <47a5804c-835a-f1a2-abce-50b3531f2556@gmail.com>
 <20200811193150.GA344152@rowland.harvard.edu>
 <ef2937d6-f8a8-fbc6-decd-eeb4af94e863@gmail.com>
 <20200812061451.GE1299081@kroah.com>
 <95be674d-ee98-b904-6856-2f662ac7838f@gmail.com>
 <20200818085502.GB28036@kroah.com>
 <83a5be3e-9f93-e601-5161-cbb5d1957c5a@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <83a5be3e-9f93-e601-5161-cbb5d1957c5a@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Aug 18, 2020 at 08:22:55PM +0200, Patrik Nilsson wrote:
> Hi Greg,
> 
> Thank you for debugging the issue!
> 
> Is there a way to set a speed limit to the device? I mean like setting the
> usb-quirks. (i.e. usb-storage.quirks=174c:55aa:u)
> 
> Instead of buying a new enclosing for the drive... :(

You can try setting usb-storage.quirks=174c:55aa:g or :m.  They will 
slow down the data transfer rates.  The :g flag is used by the uas 
driver and the :m flag is used by usb-storage.

Alan Stern
