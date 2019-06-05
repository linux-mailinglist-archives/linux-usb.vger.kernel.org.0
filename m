Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1D74A35D02
	for <lists+linux-usb@lfdr.de>; Wed,  5 Jun 2019 14:39:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727674AbfFEMjz (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 5 Jun 2019 08:39:55 -0400
Received: from mail.kernel.org ([198.145.29.99]:44364 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727273AbfFEMjz (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 5 Jun 2019 08:39:55 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 45378206BB;
        Wed,  5 Jun 2019 12:39:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1559738394;
        bh=YhqXl2SqimDOYydQJW1qhsG6VK8wr2s9MsvN1heZ7X0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ioo0vDfQ66WLT8U3+K2JZpXFLs/o1jDVNeV6cg5rWJ27ZoM/HLEJYNeHk2U4yc3u6
         108nCzCEdgX4D6b0juyMJQHQiUCnQ0utFNyQW3sh2VCHTTNWDvSL8hrdPO+6a8gfWQ
         C7T7IA9HwN3QKKM6eS/70IkVMOMjH4z2CGfsRNEQ=
Date:   Wed, 5 Jun 2019 14:39:52 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Marc Gonzalez <marc.w.gonzalez@free.fr>
Cc:     linux-usb <linux-usb@vger.kernel.org>,
        Felipe Balbi <balbi@kernel.org>,
        Chunfeng Yun <chunfeng.yun@mediatek.com>
Subject: Re: [PATCH v2] USB: move usb debugfs directory creation to the usb
 common core
Message-ID: <20190605123952.GA17558@kroah.com>
References: <20190605092816.GA23758@kroah.com>
 <6ba00d6b-f236-f640-44b2-e801d9f2aa11@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6ba00d6b-f236-f640-44b2-e801d9f2aa11@free.fr>
User-Agent: Mutt/1.12.0 (2019-05-25)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Jun 05, 2019 at 01:44:26PM +0200, Marc Gonzalez wrote:
> On 05/06/2019 11:28, Greg Kroah-Hartman wrote:
> 
> > The USB gadget subsystem wants to use the USB debugfs root directory, so
> > move it to the common "core" USB code so that it is properly initialized
> > and removed as needed.
> > 
> > In order to properly do this, we need to load the common code before the
> > usb core code, when everything is linked into the kernel, so reorder the
> > link order of the code.
> > 
> > Also as the usb common code has the possibility of the led trigger logic
> > to be merged into it, handle the build option properly by only having
> > one module init/exit function and have the common code initialize the
> > led trigger if needed.
> > 
> > Reported-by: From: Chunfeng Yun <chunfeng.yun@mediatek.com>
> 
> You have a spurious "From: " in there ;-)

Ugh, cut/paste error, thanks, will fix!
