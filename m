Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9537B493649
	for <lists+linux-usb@lfdr.de>; Wed, 19 Jan 2022 09:25:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352408AbiASIZq (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 19 Jan 2022 03:25:46 -0500
Received: from ams.source.kernel.org ([145.40.68.75]:43568 "EHLO
        ams.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348696AbiASIZp (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 19 Jan 2022 03:25:45 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 8B344B8182E
        for <linux-usb@vger.kernel.org>; Wed, 19 Jan 2022 08:25:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91B90C004E1;
        Wed, 19 Jan 2022 08:25:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1642580743;
        bh=ZXrdQcXTTZV/het9fXM78u4bFsHveNpMZzruG2+WmX4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=e4o9oeNOihQf3bBenTRJuNADFTF/cEfYBmYGiAY1b8dlfd2VFKS1YzxXKEmTC6AvC
         IZuLUw8XRFiuJ+0hbnkuI+cD2nXX8OeqWg147WNrhaB/RTe8n5DrnPrYy5RN2ZVNu8
         ZQZAzgvDBIdTuHP1ZzF5DISVpR99iNhZRczJkSNk=
Date:   Wed, 19 Jan 2022 09:25:40 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     "ckamas dslextreme.com" <ckamas@dslextreme.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: Debugging crash in kernel module usbip-host
Message-ID: <YefLBBwm1pB9JSUJ@kroah.com>
References: <04f3e890-3e6f-4ad2-bfa8-f4cb0e672487@dslextreme.com>
 <5700736a-1ba4-9752-e73e-9d54829ce7bf@dslextreme.com>
 <YeZcISwRLAt8a4mO@kroah.com>
 <1959797703.662115317.1642549727537.JavaMail.zimbra@dslextreme.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1959797703.662115317.1642549727537.JavaMail.zimbra@dslextreme.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Jan 18, 2022 at 06:48:47PM -0500, ckamas dslextreme.com wrote:
> Greg,
> 
> Thanks for the feedback. I will update the kernel to 5.16 and verify the crash there too.
> 
> In the meantime, can you point me to where I can learn more about how these "stub" functions are generated?
> 
> Thanks,
> Chuck
> 
> 
> 
>  0) + 14.167 us   |  stub_complete [usbip_host]();
>  ------------------------------------------
>  0)    <idle>-0    =>  stub_tx-300  
>  ------------------------------------------
> 
>  0)               |    stub_send_ret_submit [usbip_host]() {
>  0)   6.250 us    |      stub_free_priv_and_urb [usbip_host]();
>  0) ! 130.781 us  |    }
>  0)   7.135 us    |    stub_send_ret_unlink [usbip_host]();

These are functions in the drivers/usb/usbip/stub_rx.c file.

