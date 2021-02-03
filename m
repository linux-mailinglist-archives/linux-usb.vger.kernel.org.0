Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3543730D9C0
	for <lists+linux-usb@lfdr.de>; Wed,  3 Feb 2021 13:28:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234395AbhBCMZh (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 3 Feb 2021 07:25:37 -0500
Received: from mail.kernel.org ([198.145.29.99]:39226 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232525AbhBCMZg (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 3 Feb 2021 07:25:36 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8B75B64F74;
        Wed,  3 Feb 2021 12:24:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1612355096;
        bh=wfcFzPDBpwzU7RY4U4jR8hi3Oc40kgqPHpRX4oJSsh8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=eMCLD4Qcz2/CkHDRTzrmdtT2iKjphoeMaCsS6SFOzwPSwlGdWPT5hIcSWWt/hBn4H
         Ftpp0POwa3Ugy8EvEcepQN7YSfDjyhD4VTLeGtZj1up7om98UsLAbEqcqesUYMUZbu
         mCg1EDkVCdDurlpiAVivPzo1bzQ/Qhb2eLW/cf7Q=
Date:   Wed, 3 Feb 2021 13:24:53 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Mathias Nyman <mathias.nyman@linux.intel.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [PATCH 0/1] xhci fix for usb-linus 5.11-final
Message-ID: <YBqWFaiMkJl0oOIk@kroah.com>
References: <20210203113702.436762-1-mathias.nyman@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210203113702.436762-1-mathias.nyman@linux.intel.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Feb 03, 2021 at 01:37:01PM +0200, Mathias Nyman wrote:
> Hi Greg
> 
> One last xhci fix for 5.11-final if it still can make it.

Now snuck in!

thanks,

greg k-h
