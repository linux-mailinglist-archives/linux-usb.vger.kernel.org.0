Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D6B42C231A
	for <lists+linux-usb@lfdr.de>; Tue, 24 Nov 2020 11:41:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731535AbgKXKkX (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 24 Nov 2020 05:40:23 -0500
Received: from mail.kernel.org ([198.145.29.99]:55140 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726744AbgKXKkX (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 24 Nov 2020 05:40:23 -0500
Received: from localhost (82-217-20-185.cable.dynamic.v4.ziggo.nl [82.217.20.185])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0C0F820708;
        Tue, 24 Nov 2020 10:40:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1606214422;
        bh=T+twtWVuCa+bu9LesNLpShr1bJmu2eHaK07x0ZWsuiQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=gyQDBBwHIB+PLURET9oBoSAV/O6z9NWFdW0pCiGFid+Gw/3jPtbUeSLdZPPT7IXyA
         JQ/QFylA61YJB7tSZ6V6eWRWn89juB/pN9osPTekrwuogEF+z4iUwdi1BX8rvIC+ye
         fIV/Sa6DpK7alUc/Vr8KmQnpZNpRwcElz/vcy3FM=
Date:   Tue, 24 Nov 2020 11:40:16 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     bugzilla-daemon@bugzilla.kernel.org
Cc:     linux-usb@vger.kernel.org
Subject: Re: [Bug 210345] New: xhci init fail
Message-ID: <X7zjEH2MaHDErc38@kroah.com>
References: <bug-210345-208809@https.bugzilla.kernel.org/>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bug-210345-208809@https.bugzilla.kernel.org/>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Nov 24, 2020 at 09:58:51AM +0000, bugzilla-daemon@bugzilla.kernel.org wrote:
> https://bugzilla.kernel.org/show_bug.cgi?id=210345
> 
>             Bug ID: 210345
>            Summary: xhci init fail
>            Product: Drivers
>            Version: 2.5
>     Kernel Version: 5.4.0-53-generic #59-Ubuntu SMP

Please file this with Ubuntu as this is a very old kernel release and we
at kernel.org have no idea what is actually included in this kernel
release.

thanks,

greg k-h
