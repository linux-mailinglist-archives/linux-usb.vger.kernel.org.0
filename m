Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C6530422B2E
	for <lists+linux-usb@lfdr.de>; Tue,  5 Oct 2021 16:38:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234568AbhJEOjx (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 5 Oct 2021 10:39:53 -0400
Received: from mail.kernel.org ([198.145.29.99]:54270 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234084AbhJEOjw (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 5 Oct 2021 10:39:52 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4DB0B61381;
        Tue,  5 Oct 2021 14:38:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1633444681;
        bh=MRkITms+TCFn5/FiGLufk98hJ3jC+4qlBh2I3RPugu4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=D9IEZIzVS6JlPwsvjN1UDg5S0C/JWGNouJtf86v6bqhh2LjDEh6pjhgCnpPIwJ1CO
         OrowQvSu9MdTNIoBcam5RCXCuLJwWIyNwGkJU1luk8vJc+EXRkbM54vOBvbxOLiq/B
         N1Yalndrj3FJJK6ehmq/Op9hBl3PtiQzs01dhWzQ=
Date:   Tue, 5 Oct 2021 16:37:59 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Robert Greener <rob@robgreener.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [PATCH 00/13] usb: core: config: fix all checkpatch.pl warnings
Message-ID: <YVxjRwICqt02inCM@kroah.com>
References: <cover.1633442131.git.rob@robgreener.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1633442131.git.rob@robgreener.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

First off, your cc: list was corrupted and stripped everything off :(

On Tue, Oct 05, 2021 at 02:55:31PM +0100, Robert Greener wrote:
> This patchset fixes all checkpatch warnings in drivers/usb/core/config.c

Why?

Please do not do this for subsystems that do not explicitly ask for it.
If you wish to work on checkpatch issues, please start with
drivers/staging/* and go from there.

For now, USB should be pretty "clean" with some minor issues.  The churn
here is not yet worth it as you have found.

sorry,

greg k-h
