Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 45342E76AB
	for <lists+linux-usb@lfdr.de>; Mon, 28 Oct 2019 17:39:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391098AbfJ1QjO (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 28 Oct 2019 12:39:14 -0400
Received: from mail.kernel.org ([198.145.29.99]:48502 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1733084AbfJ1QjO (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 28 Oct 2019 12:39:14 -0400
Received: from localhost (100.50.158.77.rev.sfr.net [77.158.50.100])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2394921744;
        Mon, 28 Oct 2019 16:39:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1572280753;
        bh=Qe1TqCmyU1yMB9viNUbHgb9VtYCZWx4OtAZzSVEBMZc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=fqkXuc4MvNbMF4fBr0x2EEoWZ4bBRf6o1Y7e4VnykNzvpJdC3TQBkTz8+v7PH/tQ0
         H8xjwX3CJGskmESyJof6VW/+csnsGUbwSBmbU38z6FpD5Aj0GJgH0tlaz7eJVm2vpD
         3AF/cK1Tz91HfKG6NPFWO5ysDs6x65QSi9s/K2jw=
Date:   Mon, 28 Oct 2019 17:38:44 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Felipe Balbi <balbi@kernel.org>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [GIT PULL] USB fixes for v5.4-rc5
Message-ID: <20191028163844.GA321690@kroah.com>
References: <87v9say884.fsf@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87v9say884.fsf@gmail.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sun, Oct 27, 2019 at 09:10:19AM +0200, Felipe Balbi wrote:
> 
> Hi Greg,
> 
> Here's a pull request for this -rc cycle. It took me longer than usual
> to produce a pull request, sorry about that.
> 
> Anyway, pull request follows. Let me know if you want anything to be
> changed.

Pulled and pushed out, thanks.

greg k-h
