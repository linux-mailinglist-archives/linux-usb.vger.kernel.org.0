Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DA5E9491F57
	for <lists+linux-usb@lfdr.de>; Tue, 18 Jan 2022 07:20:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241682AbiARGUX (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 18 Jan 2022 01:20:23 -0500
Received: from ams.source.kernel.org ([145.40.68.75]:57406 "EHLO
        ams.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241475AbiARGUW (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 18 Jan 2022 01:20:22 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 841A6B81223
        for <linux-usb@vger.kernel.org>; Tue, 18 Jan 2022 06:20:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC819C00446;
        Tue, 18 Jan 2022 06:20:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1642486820;
        bh=to6fpQ8h1LjAPqVUsKYItfWdFQPDTheotReAJ9Ayvr0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=vlW8mJsgZQL7rSksJI2bw9NLvnZpSKDhGQYyShCw8m2crnNImhGf7cwvZV6oM9myg
         MS71U+/kwxYxr/QhKMtvALuvQ2Jt5wRirelvM/Fxtyhwf8/1/+LiQ2PlBXAgdB7kbW
         6Ggyb7AA/V1j9CWtQmOa89v+J8A9WxEbLmfFtklA=
Date:   Tue, 18 Jan 2022 07:20:17 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Chuck Kamas <ckamas@dslextreme.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: Debugging crash in kernel module usbip-host
Message-ID: <YeZcISwRLAt8a4mO@kroah.com>
References: <04f3e890-3e6f-4ad2-bfa8-f4cb0e672487@dslextreme.com>
 <5700736a-1ba4-9752-e73e-9d54829ce7bf@dslextreme.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5700736a-1ba4-9752-e73e-9d54829ce7bf@dslextreme.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Jan 17, 2022 at 04:49:06PM -0800, Chuck Kamas wrote:
>  sysname    Linux
>  release    5.4.72-v7
>  version    #1 SMP Mon Oct 19 11:12:20 UTC 2020

That is a very old and obsolete and known-buggy kernel, can you please
try 5.16?

thanks,

greg k-h
