Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 270621EF3D3
	for <lists+linux-usb@lfdr.de>; Fri,  5 Jun 2020 11:15:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726228AbgFEJOv (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 5 Jun 2020 05:14:51 -0400
Received: from mail.kernel.org ([198.145.29.99]:47518 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726144AbgFEJOv (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 5 Jun 2020 05:14:51 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 994992075B;
        Fri,  5 Jun 2020 09:14:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1591348491;
        bh=9/irAEKgQLs2mjoPzBDlR/SIym+QZ+oBpLry4Oo6pGQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ox4AV7UJIG9KUSCxbj1RnfI1D5s0XTCQdvXVsAyHvTef3UJU16+9C64UXo4nLHpkV
         GcQ9/o3UST4kOY22mcOpaeNRQ3OOpZh53kbX9tHnqogCNarYXCeUKpnv6ARKbNXErm
         4y2F2bBIoXtWr/Wu8aEI/rIB58ioQcu1bPL00RlY=
Date:   Fri, 5 Jun 2020 11:14:49 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Markus Elfring <Markus.Elfring@web.de>,
        Zhang Qiang <qiang.zhang@windriver.com>
Cc:     linux-usb@vger.kernel.org, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Alan Stern <stern@rowland.harvard.edu>,
        Felipe Balbi <balbi@kernel.org>,
        Kyungtae Kim <kt0755@gmail.com>
Subject: Re: [PATCH] usb: gadget: function: printer: Fix use-after-free in
 __lock_acquire()
Message-ID: <20200605091449.GA2321638@kroah.com>
References: <5207d179-0a7d-b5ff-af34-102fb21028b5@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5207d179-0a7d-b5ff-af34-102fb21028b5@web.de>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Jun 05, 2020 at 10:57:55AM +0200, Markus Elfring wrote:
> > Fix this by increase object reference count.
> 
> I find this description incomplete according to the proposed changes.
> 
> Would you like to add the tag “Fixes” to the commit message?

Hi,

This is the semi-friendly patch-bot of Greg Kroah-Hartman.  You seem to
have sent a nonsensical or otherwise pointless review comment to a patch
submission on a Linux kernel developer mailing list.

I strongly suggest that you not do this anymore.  Please do not bother
developers who are actively working to produce patches and features with
comments that, in the end, are a waste of time.

Patch submitter, please ignore this suggestion, it is not needed to be
followed at all, as the person/bot/AI that sent it is on almost all
Linux kernel maintainer's blacklists and is ignored by them.  Please
feel free to also do the same.

thanks,

greg k-h's patch email bot
