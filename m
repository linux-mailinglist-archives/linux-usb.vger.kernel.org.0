Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C215334AB81
	for <lists+linux-usb@lfdr.de>; Fri, 26 Mar 2021 16:29:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230272AbhCZP3X (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 26 Mar 2021 11:29:23 -0400
Received: from netrider.rowland.org ([192.131.102.5]:49259 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S230134AbhCZP3L (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 26 Mar 2021 11:29:11 -0400
Received: (qmail 833596 invoked by uid 1000); 26 Mar 2021 11:29:09 -0400
Date:   Fri, 26 Mar 2021 11:29:09 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Harald Dunkel <harri@afaics.de>
Cc:     linux-usb@vger.kernel.org
Subject: Re: 5.11.10: sync gets stuck after writing ubuntu live iso to usb
 stick
Message-ID: <20210326152909.GB832251@rowland.harvard.edu>
References: <1fd4daa4-ad11-51b2-6fc5-22d6213d551b@afaics.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1fd4daa4-ad11-51b2-6fc5-22d6213d551b@afaics.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Mar 26, 2021 at 07:57:52AM +0100, Harald Dunkel wrote:
> Hi folks,
> 
> using
> 
> 	dd if=ubuntu-20.10-desktop-amd64.iso bs=64k of=/dev/sdx
> 
> on 5.11.10 to write a live iso to USB stick dd never returns.
> 
> lsof shows that the file handles for source and destination
> have been closed, but dd doesn't exit. It cannot be interrupted
> or killed, either. If I run "sync" in another terminal, then this
> gets stuck as well.
> 
> I could reproduce this problem using Debian's 5.10.13-1 and
> 5.11.{9,10} built from the sources in git, on Debian 10 and
> Unstable. I tried to copy the ubuntu live iso and the RHEL 8.3
> installer iso. 3 different USB sticks.
> 
> There is no such problem using Debian's 4.19.0-16-amd64 kernel
> on Debian 10.
> 
> Can anybody reproduce this as well?

What does the dmesg log say when this happens?

Alan Stern
