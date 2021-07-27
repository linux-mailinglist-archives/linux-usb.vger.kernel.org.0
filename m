Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5C6623D76F6
	for <lists+linux-usb@lfdr.de>; Tue, 27 Jul 2021 15:39:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236635AbhG0Njp (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 27 Jul 2021 09:39:45 -0400
Received: from netrider.rowland.org ([192.131.102.5]:59705 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S232443AbhG0Njp (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 27 Jul 2021 09:39:45 -0400
Received: (qmail 152322 invoked by uid 1000); 27 Jul 2021 09:39:44 -0400
Date:   Tue, 27 Jul 2021 09:39:44 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Eyal Lebedinsky <eyal@eyal.emu.id.au>
Cc:     list linux-usb <linux-usb@vger.kernel.org>
Subject: Re: usb port enumeration changed? [resolved]
Message-ID: <20210727133944.GA152080@rowland.harvard.edu>
References: <261c3985-28bc-b203-59fa-ecb650f2b42d@eyal.emu.id.au>
 <20210727022345.GA138425@rowland.harvard.edu>
 <a9c21e7b-0175-26b4-2ef7-84cd3c6ef1ec@eyal.emu.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a9c21e7b-0175-26b4-2ef7-84cd3c6ef1ec@eyal.emu.id.au>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Jul 27, 2021 at 04:43:35PM +1000, Eyal Lebedinsky wrote:
> Seeing the confidence of the reply I decided to do more testing.
> - booting the old kernel did not fix it.
> - unplugging and re-plugging the devices did not help.
> 
> I then crawled under the table and followed the large cables bundle to find that I should have
> trusted my instruments (the USB system).
> 
> While the correct cable was plugged into the correct socket, the far end used an extension which
> *was* plugged into the wrong thing. I then remembered that at one time the cable was pulled off
> accidentally and quickly re-attached...
> 
> In short, I am stupid and apology for the noise.

It happens to the best of us.  Don't worry about it.  ;-)

Alan Stern
