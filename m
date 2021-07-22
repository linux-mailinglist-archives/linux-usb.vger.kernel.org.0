Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 602363D1DC3
	for <lists+linux-usb@lfdr.de>; Thu, 22 Jul 2021 07:50:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229980AbhGVFKW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 22 Jul 2021 01:10:22 -0400
Received: from mail.kernel.org ([198.145.29.99]:51810 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229905AbhGVFKW (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 22 Jul 2021 01:10:22 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 28B536120C;
        Thu, 22 Jul 2021 05:50:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1626933057;
        bh=AjH7Cg3YC3K9NGAi+yhA6VeTABtRXMXLs3zQrP8RCtI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=MFVUmNX4+XVU5gdobnc8R6Jm7+v7byAq67Z8+6qtQspzZDdOGAoHjIpjuDZX9jGBf
         +cDs7KK5yh320XuyHTBH/UNgJIdt3r7/DBSxoV8VKIQia/H2FDVz63+qV+A0QYm5/A
         Vv4XllNqa7Wza1kOCGitCGhZ5pWAM7A3EGD9bqd8=
Date:   Thu, 22 Jul 2021 07:50:54 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Charles Yeh <charlesyeh522@gmail.com>
Cc:     Johan Hovold <johan@kernel.org>, linux-usb@vger.kernel.org
Subject: Re: [PATCH] USB: serial: pl2303: Add new PID to support PL256X
 (TYPE_MP)
Message-ID: <YPkHPm7ZZFvbYQyx@kroah.com>
References: <20210622120906.743-1-charlesyeh522@gmail.com>
 <CAAZvQQ6Kr0vbDAnKYum9EaCVxc9Ps69vBV+sg2mov06tB4KqNg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAZvQQ6Kr0vbDAnKYum9EaCVxc9Ps69vBV+sg2mov06tB4KqNg@mail.gmail.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Jul 22, 2021 at 12:58:21PM +0800, Charles Yeh wrote:
> Any update?

On what?
