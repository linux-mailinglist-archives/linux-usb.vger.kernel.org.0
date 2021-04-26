Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 513BA36B08F
	for <lists+linux-usb@lfdr.de>; Mon, 26 Apr 2021 11:29:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232161AbhDZJaG (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 26 Apr 2021 05:30:06 -0400
Received: from smtpfree-b.aruba.it ([62.149.128.215]:50353 "EHLO
        mxcm02.ad.aruba.it" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S232103AbhDZJaG (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 26 Apr 2021 05:30:06 -0400
Received: from darkstar ([151.18.35.88])
        by mxcm02.ad.aruba.it with bizsmtp
        id xMVE240051u5oC701MVGbN; Mon, 26 Apr 2021 11:29:23 +0200
X-SSL:  yes
Date:   Mon, 26 Apr 2021 11:29:11 +0200
From:   Leonardo Antoniazzi <leoanto@aruba.it>
To:     linux-usb@vger.kernel.org
Cc:     johan@kernel.org
Subject: Re: [PATCH] net: hso: fix NULL-deref on disconnect regression
Message-Id: <20210426112911.fb3593c3a9ecbabf98a13313@aruba.it>
In-Reply-To: <20210426081149.10498-1-johan@kernel.org>
References: <20210426081149.10498-1-johan@kernel.org>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-unknown-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aruba.it; s=a1;
        t=1619429363; bh=Spo/zmyLIvJjdOAkp3Te/otU9+LGnkWiOcg4zVN4PV0=;
        h=Date:From:To:Subject:Mime-Version:Content-Type;
        b=NSO4lU9Vl76pbBLTtM53OMW1Pl4jcXSmmIHs54E42z7+VR20NwT/TeJWMb4Qo4oJR
         5VLuEDTWKST/v1uUTlwkhnoqBC+XeVtYUdV2kaRhX63F4dbF5cjT2ctyv6lAHfteGe
         Mm474zXexJHcwL1NjzabCm2HDSNut2MmuuO9Rv/PDSVothTFbNa5gE596P3J2jpZpU
         zdzDqTr+Fve4Kx4UjQW58/bAoBRM8o1weT0DBkBKD3t3te3cHq/sc+lHS2lwU5yJ1D
         b67mOsbF5uwpxMB1hckkVyH+m1PQW8pyhQAEPwbPCND17RQ5n179956k7eq+gM1/OL
         Ja4zXIbrYNAzA==
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, 26 Apr 2021 10:11:49 +0200
Johan Hovold <johan@kernel.org> wrote:

> Commit 8a12f8836145 ("net: hso: fix null-ptr-deref during tty device
> unregistration") fixed the racy minor allocation reported by syzbot, but
> introduced an unconditional NULL-pointer dereference on every disconnect
> instead.
> 
> Specifically, the serial device table must no longer be accessed after
> the minor has been released by hso_serial_tty_unregister().
> 
> Fixes: 8a12f8836145 ("net: hso: fix null-ptr-deref during tty device unregistration")
> Cc: stable@vger.kernel.org
> Cc: Anirudh Rayabharam <mail@anirudhrb.com>
> Reported-by: Leonardo Antoniazzi <leoanto@aruba.it>
> Signed-off-by: Johan Hovold <johan@kernel.org>
> ---
>  drivers/net/usb/hso.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/net/usb/hso.c b/drivers/net/usb/hso.c
> index 9bc58e64b5b7..3ef4b2841402 100644
> --- a/drivers/net/usb/hso.c
> +++ b/drivers/net/usb/hso.c
> @@ -3104,7 +3104,7 @@ static void hso_free_interface(struct usb_interface *interface)
>  			cancel_work_sync(&serial_table[i]->async_put_intf);
>  			cancel_work_sync(&serial_table[i]->async_get_intf);
>  			hso_serial_tty_unregister(serial);
> -			kref_put(&serial_table[i]->ref, hso_serial_ref_free);
> +			kref_put(&serial->parent->ref, hso_serial_ref_free);
>  		}
>  	}
>  
> -- 
> 2.26.3
> 

hello,

the patch fix the problem

thanks

