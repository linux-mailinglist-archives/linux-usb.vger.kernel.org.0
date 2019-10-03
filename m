Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6FFE2C9FF9
	for <lists+linux-usb@lfdr.de>; Thu,  3 Oct 2019 16:01:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729960AbfJCOBl (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 3 Oct 2019 10:01:41 -0400
Received: from relay1-d.mail.gandi.net ([217.70.183.193]:40877 "EHLO
        relay1-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727488AbfJCOBl (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 3 Oct 2019 10:01:41 -0400
X-Originating-IP: 83.155.44.161
Received: from classic (mon69-7-83-155-44-161.fbx.proxad.net [83.155.44.161])
        (Authenticated sender: hadess@hadess.net)
        by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id BDAE7240007;
        Thu,  3 Oct 2019 14:01:38 +0000 (UTC)
Message-ID: <5201bda9e7fffbf70c135730e1a12d0e06e9837f.camel@hadess.net>
Subject: Re: [PATCH] USB: rio500: Remove Rio 500 kernel driver
From:   Bastien Nocera <hadess@hadess.net>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, Cesar Miquel <miquel@df.uba.ar>
Date:   Thu, 03 Oct 2019 16:01:37 +0200
In-Reply-To: <20191003134205.GA2876749@kroah.com>
References: <6251c17584d220472ce882a3d9c199c401a51a71.camel@hadess.net>
         <3b91a9abd7489fc9bf866fff6f0daee39ccb7b1e.camel@hadess.net>
         <20191003134205.GA2876749@kroah.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.32.4 (3.32.4-1.fc30) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, 2019-10-03 at 15:42 +0200, Greg Kroah-Hartman wrote:
> On Thu, Oct 03, 2019 at 03:18:16PM +0200, Bastien Nocera wrote:
> > On Mon, 2019-09-23 at 18:18 +0200, Bastien Nocera wrote:
> > > The Rio500 kernel driver has not been used by Rio500 owners since
> > > 2001
> > > not long after the rio500 project added support for a user-space
> > > USB stack
> > > through the very first versions of usbdevfs and then libusb.
> > > 
> > > Support for the kernel driver was removed from the upstream
> > > utilities
> > > in 2008:
> > > https://gitlab.freedesktop.org/hadess/rio500/commit/943f624ab721eb8281c287650fcc9e2026f6f5db
> > > 
> > > Cc: Cesar Miquel <miquel@df.uba.ar>
> > > Signed-off-by: Bastien Nocera <hadess@hadess.net>
> > 
> > Anything else I need to do to land this?
> 
> Patience, 5.4-rc1 just came out, my queue is 1500+ patches deep, I
> will
> dig through it in the next week...

No worries, was just expecting some/any feedback before long.

