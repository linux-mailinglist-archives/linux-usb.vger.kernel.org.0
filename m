Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0311735C89F
	for <lists+linux-usb@lfdr.de>; Mon, 12 Apr 2021 16:22:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242216AbhDLOWk (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 12 Apr 2021 10:22:40 -0400
Received: from mail.kernel.org ([198.145.29.99]:55194 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S242175AbhDLOWf (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 12 Apr 2021 10:22:35 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9443161350;
        Mon, 12 Apr 2021 14:22:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1618237337;
        bh=MKbQNTppixqqdQb/RusbzLqw62fj4677D5R5QvMTr5k=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=0r/oevu9SDiIYWEI+BeOPVX+wjfi/VhI31SCyL4YXAVJuaE4hfFTycO/sNMm5KYfj
         /oyklCDd3wbZbBlHnUve4rrMp51Zg98Eeohgq1amZ7VMNqEZ2koUiggtI5b0Z0K4os
         me3+oZ1B9UqLUubRuwnad9OvQoBKjlbnpQtZt3kk=
Date:   Mon, 12 Apr 2021 16:22:05 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Peter Chen <peter.chen@kernel.org>
Cc:     linux-usb@vger.kernel.org
Subject: Re: usb: changes for v5.13-rc1
Message-ID: <YHRXjTvotTTB5hOw@kroah.com>
References: <20210412133522.GB15190@b29397-desktop>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210412133522.GB15190@b29397-desktop>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Apr 12, 2021 at 09:35:22PM +0800, Peter Chen wrote:
> The following changes since commit 14d34d2dbbe2d9144a65bae1549202d1717062e2:
> 
>   Merge 5.12-rc7 into usb-next (2021-04-12 08:15:27 +0200)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/peter.chen/usb.git/ tags/usb-v5.13-rc1

Much better :)

Pulled and pushed out, thanks.

greg k-h
