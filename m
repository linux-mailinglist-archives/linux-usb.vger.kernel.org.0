Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D93D542892B
	for <lists+linux-usb@lfdr.de>; Mon, 11 Oct 2021 10:52:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235319AbhJKIyE (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 11 Oct 2021 04:54:04 -0400
Received: from mail.kernel.org ([198.145.29.99]:57904 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235320AbhJKIyC (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 11 Oct 2021 04:54:02 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 96E7C60E90;
        Mon, 11 Oct 2021 08:52:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1633942322;
        bh=lMFnaBGIxmiDvZGQaMM+gNcFDBu1lHtBgmcCDHpy8W0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=P8CMzIyWxK6mc0u6f59HkZKvUkvdb32NK0gVk2mQqegqlwk2KUT4xMIVLD6l/osCY
         m4ojSUejIRiLgicsLwWsqpGKVEXey9VFSpdgBsa4wTjoh3iWFeeU8/smkLFkhXIAf0
         ZUJzRgRAaYVUf2kJht2zjb83O1pSqgSGTXPa8ycg2gMJylRR6fsxGGutTLUl75a6v4
         tUWJEfhqiLXVHild3zUqFmS3h66OTUJKdnO6GjAp8P+87PuEd/mHZLRiSHewn7vlCM
         5rlQISjMV/Ulu6VYBSn+ccaiqrgg8Ik00RveM6heDbjXpyLWl7XI7ngkkGbp9P7HpF
         ky8N67MF4z4MQ==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1mZr2G-0002PX-Q4; Mon, 11 Oct 2021 10:51:52 +0200
Date:   Mon, 11 Oct 2021 10:51:52 +0200
From:   Johan Hovold <johan@kernel.org>
To:     bugzilla-daemon@bugzilla.kernel.org
Cc:     linux-usb@vger.kernel.org
Subject: Re: [Bug 213771] ch341 USB-Serial converter receives but does not
 send
Message-ID: <YWP7KExSjcnkfGYz@hovoldconsulting.com>
References: <bug-213771-208809@https.bugzilla.kernel.org/>
 <bug-213771-208809-JWjSQHgfJ8@https.bugzilla.kernel.org/>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bug-213771-208809-JWjSQHgfJ8@https.bugzilla.kernel.org/>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sat, Oct 09, 2021 at 08:07:00PM +0000, bugzilla-daemon@bugzilla.kernel.org wrote:

> --- Comment #5 from Denis Bondar (bondar.den@gmail.com) ---
> Hi,
> This version probably has the same or similar problem:
> 
> Linux home 5.11.0-37-generic #41~20.04.2-Ubuntu

That's also not a mainline kernel. Unless you can reproduce this with a
mainline (or stable) kernel, you need to report this to Ubuntu.

Providing answers to the questions I asked the original reporter might
help too.

Johan
