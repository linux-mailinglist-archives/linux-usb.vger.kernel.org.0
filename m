Return-Path: <linux-usb+bounces-33633-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2OKoN1htnWkkQAQAu9opvQ
	(envelope-from <linux-usb+bounces-33633-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 24 Feb 2026 10:20:24 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A995184733
	for <lists+linux-usb@lfdr.de>; Tue, 24 Feb 2026 10:20:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DF3833028007
	for <lists+linux-usb@lfdr.de>; Tue, 24 Feb 2026 09:14:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4ACA736A01A;
	Tue, 24 Feb 2026 09:14:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ispras.ru header.i=@ispras.ru header.b="Udc9UAOp"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail.ispras.ru (mail.ispras.ru [83.149.199.84])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BDAB368275;
	Tue, 24 Feb 2026 09:14:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=83.149.199.84
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771924493; cv=none; b=Q4CaoFjxLLIYgk8ygTkjSJdRfmsaFfw6rY3HbxsVVzNaQOP5d9QkU+BmfgaEKYUhnImL++TrE3QiVwU2fGSmER27PhOriK1xYPU9pm4ZyElhC7L/OA9zjEQtWduiFPar18yZLenG74/hVfyppeUAqUCigEiahxtkkOb5gpard1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771924493; c=relaxed/simple;
	bh=Z7zWgwiocoh+Y4ulM3Bz0g7n3exwRdV7twweQBiMG64=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pVxL18GnzSqkjx2k/D67RVLExxJvawMGvWnoPBDH35oRkjTDkzukkZT6megJmevIbO/JyRijRjI7IPHhIn7xh3xx703JhDBOdsGkF1NFW30R9sLbF3guXruYXthAzxgcrXyfbmi6Lfnm0PNyueLmNZN6WPtaXRFEgUw2QCTxO58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ispras.ru; spf=pass smtp.mailfrom=ispras.ru; dkim=pass (1024-bit key) header.d=ispras.ru header.i=@ispras.ru header.b=Udc9UAOp; arc=none smtp.client-ip=83.149.199.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ispras.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ispras.ru
Received: from localhost (unknown [79.139.245.7])
	by mail.ispras.ru (Postfix) with ESMTPSA id 2C3E1406E9BF;
	Tue, 24 Feb 2026 09:14:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.ispras.ru 2C3E1406E9BF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ispras.ru;
	s=default; t=1771924482;
	bh=L+DgU/Dt01o1BXw7/e1ObG9QLI7GeTvGhrmp4Fd5vHA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Udc9UAOpQdK10c0wRfCjHsJPRexpzFy8MCZ7Z4bDLsX99WZhHdfKhE/gDW77G0v2F
	 KfeNk6Fp7Qw7YVKcZWMNMexIEV4nhih/9AD93oQWlBlmUW3B4WurUlz2M9THSKiGFU
	 2ZgXgSaFREtXZJBy318l01hJVS8w6nE/WUKSD0sI=
Date: Tue, 24 Feb 2026 12:14:42 +0300
From: Fedor Pchelkin <pchelkin@ispras.ru>
To: Vasiliy Kovalev <kovalev@altlinux.org>
Cc: Thomas Winischhofer <thomas@winischhofer.net>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	lvc-project@linuxtesting.org
Subject: Re: [lvc-project] [PATCH 2/2] USB: sisusbvga: Fix NULL pointer
 dereference in sisusb_read
Message-ID: <20260224114308-e0f1b8db4de3cdf49c12c108-pchelkin@ispras>
References: <20260218005523.1259725-1-kovalev@altlinux.org>
 <20260218005523.1259725-3-kovalev@altlinux.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260218005523.1259725-3-kovalev@altlinux.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ispras.ru,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[ispras.ru:s=default];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33633-lists,linux-usb=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pchelkin@ispras.ru,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[ispras.ru:+];
	TAGGED_RCPT(0.00)[linux-usb];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[altlinux.org:email,ispras.ru:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 2A995184733
X-Rspamd-Action: no action

Hi there,

On Wed, 18. Feb 03:55, Vasiliy Kovalev wrote:
> sisusb_read() passes the user-supplied buffer pointer as 'userbuffer' to
> sisusb_read_mem_bulk() in two branches:
> 
>     /* VRAM path */
>     errno = sisusb_read_mem_bulk(sisusb, address,
>             NULL, count, buffer, &bytes_read);
> 
>     /* MMIO path */
>     errno = sisusb_read_mem_bulk(sisusb, address,
>             NULL, count, buffer, &bytes_read);
> 
> If buffer == NULL (e.g. read(fd, NULL, count) from userspace), both calls
> reach sisusb_read_mem_bulk() with kernbuffer=NULL and userbuffer=NULL.
> The condition:
> 
>     if (userbuffer)
> 
> evaluates to false, the kernbuffer path is taken, and the subsequent
> dereference:
> 
>     swap32 = *((u32 *)kernbuffer);
> 
> panics the kernel:
> 
>   Oops: general protection fault, probably for non-canonical
>         address 0xdffffc0000000000: 0000 [#1] SMP KASAN NOPTI
>   KASAN: null-ptr-deref in range [0x0000000000000000-0x0000000000000007]
>   CPU: 3 UID: 0 PID: 370 Comm: sisusbvga-fops- Not tainted 6.19.0-next-20260217 #1
>   RIP: 0010:sisusb_read_mem_bulk.constprop.0 (drivers/usb/misc/sisusbvga/sisusbvga.c:1171)
>   Call Trace:
>    <TASK>
>    __pfx_sisusb_read_mem_bulk.constprop.0 (drivers/usb/misc/sisusbvga/sisusbvga.c:1092)
>    sisusb_read (drivers/usb/misc/sisusbvga/sisusbvga.c:2396)
>    vfs_read (fs/read_write.c:572)
>    ksys_read (fs/read_write.c:718)
>    do_syscall_64 (arch/x86/entry/syscall_64.c:94)
>    entry_SYSCALL_64_after_hwframe (arch/x86/entry/entry_64.S:130)
>    RIP: 0033:0x7f335af3fefc
>    </TASK>

This implies the error might be hiding in sisusb_read_mem_bulk().  Its
API should clarify the valid combinations of kernbuffer and userbuffer.
Just like sisusb_write_mem_bulk() does, see comment for that function:

 * If data is from userland, set "userbuffer" (and clear "kernbuffer"),
 * if data is in kernel space, set "kernbuffer" (and clear "userbuffer");
 * if neither "kernbuffer" nor "userbuffer" are given, it is assumed
 * that the data already is in the transfer buffer "sisusb->obuf[index]".

I guess something like that may be relevant for sisusb_read_mem_bulk()
as well, e.g. use sisusb->ibuf by default if both buffers are NULL.
Though it's only a blind guess.

I'd rather suggest making sisusb_read_mem_bulk() check kernbuffer and
userbuffer itself and return an error if both of them happen to be NULL.
That at least keeps current behavior, too.

> 
> Add a NULL check after the existing sanity checks, before the first
> branch, to guard both the VRAM and the MMIO paths. Release the mutex
> before returning, consistent with the existing -ENODEV path above.
> 
> Found by Linux Verification Center (linuxtesting.org) with Svace.
> Tested with 'USB Gadget Tests'[1]:
> 
> $ TEST=sisusbvga-fops-svace-null-deref
> $ echo $TEST > tests/list.txt && make && sudo ./check.sh
> 
> [1] Link: https://github.com/kovalev0/usb-gadget-tests
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Vasiliy Kovalev <kovalev@altlinux.org>
> ---
>  drivers/usb/misc/sisusbvga/sisusbvga.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/usb/misc/sisusbvga/sisusbvga.c b/drivers/usb/misc/sisusbvga/sisusbvga.c
> index 89d566d192aa..e14deb1955d9 100644
> --- a/drivers/usb/misc/sisusbvga/sisusbvga.c
> +++ b/drivers/usb/misc/sisusbvga/sisusbvga.c
> @@ -2319,6 +2319,11 @@ static ssize_t sisusb_read(struct file *file, char __user *buffer,
>  		return -ENODEV;
>  	}
>  
> +	if (!buffer) {
> +		mutex_unlock(&sisusb->lock);
> +		return -EFAULT;
> +	}

It's possible to perform the check without grabbing the mutex overall.
Another nit: this returns -EFAULT.  I think it's is supposed to be used
when the actual page fault has happened.  Incorrect parameters are usually
denied with -EINVAL.  Anyway, that's not a big deal here and there is no
strict documentation on that part.

Thanks.

> +
>  	if ((*ppos) >= SISUSB_PCI_PSEUDO_IOPORTBASE &&
>  			(*ppos) <  SISUSB_PCI_PSEUDO_IOPORTBASE + 128) {
>  
> -- 
> 2.50.1

