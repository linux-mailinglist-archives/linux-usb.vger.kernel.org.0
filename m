Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6BF21422B14
	for <lists+linux-usb@lfdr.de>; Tue,  5 Oct 2021 16:32:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235183AbhJEOeX (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 5 Oct 2021 10:34:23 -0400
Received: from netrider.rowland.org ([192.131.102.5]:58785 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S234355AbhJEOeX (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 5 Oct 2021 10:34:23 -0400
Received: (qmail 622646 invoked by uid 1000); 5 Oct 2021 10:32:32 -0400
Date:   Tue, 5 Oct 2021 10:32:32 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Robert Greener <rob@robgreener.com>
Cc:     USB mailing list <linux-usb@vger.kernel.org>
Subject: Re: [PATCH 09/13] usb: core: config: fix inline spacign
Message-ID: <20211005143232.GC621017@rowland.harvard.edu>
References: <cover.1633442131.git.rob@robgreener.com>
 <d36b554ae066057954eda49dbadb4e1d97323bfd.1633442131.git.rob@robgreener.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d36b554ae066057954eda49dbadb4e1d97323bfd.1633442131.git.rob@robgreener.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

You might want to fix the spelling error in the patch title (the
email's Subject: line).

On Tue, Oct 05, 2021 at 02:30:49PM +0100, Robert Greener wrote:
> This fixes the following checkpatch.pl warnings:
> 
> (many locations) CHECK:SPACING: No space is necessary after a cast
> core/config.c:332: CHECK:SPACING: spaces preferred around that '*' (ctx:VxV)

This is one of the recommendations in checkpatch.pl that I heartily
disagree with.  K&R put spaces after casts; I don't see why we
shouldn't do the same.

Alan Stern
