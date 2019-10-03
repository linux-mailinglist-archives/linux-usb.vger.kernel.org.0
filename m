Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5BFDFC9F3C
	for <lists+linux-usb@lfdr.de>; Thu,  3 Oct 2019 15:18:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730371AbfJCNSW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 3 Oct 2019 09:18:22 -0400
Received: from relay10.mail.gandi.net ([217.70.178.230]:46165 "EHLO
        relay10.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726978AbfJCNSW (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 3 Oct 2019 09:18:22 -0400
Received: from classic (mon69-7-83-155-44-161.fbx.proxad.net [83.155.44.161])
        (Authenticated sender: hadess@hadess.net)
        by relay10.mail.gandi.net (Postfix) with ESMTPSA id AA94C240016;
        Thu,  3 Oct 2019 13:18:17 +0000 (UTC)
Message-ID: <3b91a9abd7489fc9bf866fff6f0daee39ccb7b1e.camel@hadess.net>
Subject: Re: [PATCH] USB: rio500: Remove Rio 500 kernel driver
From:   Bastien Nocera <hadess@hadess.net>
To:     linux-usb@vger.kernel.org
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Cesar Miquel <miquel@df.uba.ar>
Date:   Thu, 03 Oct 2019 15:18:16 +0200
In-Reply-To: <6251c17584d220472ce882a3d9c199c401a51a71.camel@hadess.net>
References: <6251c17584d220472ce882a3d9c199c401a51a71.camel@hadess.net>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.32.4 (3.32.4-1.fc30) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, 2019-09-23 at 18:18 +0200, Bastien Nocera wrote:
> The Rio500 kernel driver has not been used by Rio500 owners since 2001
> not long after the rio500 project added support for a user-space USB stack
> through the very first versions of usbdevfs and then libusb.
> 
> Support for the kernel driver was removed from the upstream utilities
> in 2008:
> https://gitlab.freedesktop.org/hadess/rio500/commit/943f624ab721eb8281c287650fcc9e2026f6f5db
> 
> Cc: Cesar Miquel <miquel@df.uba.ar>
> Signed-off-by: Bastien Nocera <hadess@hadess.net>

Anything else I need to do to land this?

Cheers

