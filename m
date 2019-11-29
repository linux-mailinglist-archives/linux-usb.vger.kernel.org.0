Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B9C9510D625
	for <lists+linux-usb@lfdr.de>; Fri, 29 Nov 2019 14:33:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726857AbfK2Nda (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 29 Nov 2019 08:33:30 -0500
Received: from mail.kernel.org ([198.145.29.99]:42614 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726853AbfK2Nda (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 29 Nov 2019 08:33:30 -0500
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9FAA120869;
        Fri, 29 Nov 2019 13:33:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1575034410;
        bh=bVAwTfQZyJ+xVSCxG3m5UIa0RJZNvKqr27nrpVB4CWo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ugyv8Rym+9k5uZpea/OEw6cch1jB2Uk2mxYuQeytmQXIQu2yRuoWCAyjjAUM7WlCm
         SvHXzzl4cgq56t+9bgoypcQAvQ31CIZKe4Wi92r71haI89g1/STnXXH+vVRK1CWe8h
         YjEyo/lInhfM5Fd1IsGgHuxwfw5ctA7JsbR4xSAk=
Date:   Fri, 29 Nov 2019 14:33:27 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Vadim Troshchinskiy <vtroshchinskiy@qindel.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: usbip tools from 5.4 fail to build due to unaligned pointer
 value warning
Message-ID: <20191129133327.GB3703941@kroah.com>
References: <6296180.lmSoKh01SJ@gverdu.qindel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6296180.lmSoKh01SJ@gverdu.qindel.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Nov 29, 2019 at 01:24:30PM +0100, Vadim Troshchinskiy wrote:
> Hello,
> 
> Building the usbip tools from 4.15 is failing under Fedora 30, gcc version 
> 9.2.1:

When 4.15 was released, there was no such gcc version :)

4.15 is long end-of-life, please use a more modern kernel release with
newer versions of gcc.

thanks,

greg k-h
