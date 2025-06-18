Return-Path: <linux-usb+bounces-24873-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 88F3AADE730
	for <lists+linux-usb@lfdr.de>; Wed, 18 Jun 2025 11:40:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 35F1C7A3B20
	for <lists+linux-usb@lfdr.de>; Wed, 18 Jun 2025 09:39:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57CB62836A3;
	Wed, 18 Jun 2025 09:40:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ispras.ru header.i=@ispras.ru header.b="cG61MWmE"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail.ispras.ru (mail.ispras.ru [83.149.199.84])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3869A1E0E14
	for <linux-usb@vger.kernel.org>; Wed, 18 Jun 2025 09:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=83.149.199.84
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750239621; cv=none; b=guahz6JglT1zXn3ISXqvEBjqOSSL7vKMjWZVYIK9XdhExOz5OVawPoEf51rzpgCzNIoNvvW/tvxPEoZM9W1uXg1IzWAOOtHB1r4tSvaEOQGMO29s40u/i+w45J1gZs8mZQ8Brds/lPkIYk42sl7KbRHcp+oBy+YY/D9YoeJp6xM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750239621; c=relaxed/simple;
	bh=3z/uxWRCRYWPYa0uJv7jlHImU15BLQJIRchXDVfZXzM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=bDW0gNRVDSHFzj7NMVEZuBxXq9+8srO/zmlm9ILgBTylO1Ix/utSiBmzQLjS9J8oFJ4zScBnvoNrln9X31HcQlXXskvOS7RyAiokZDlIM6T/Gw8ga6oYZrFuMb6rxg9/rycVkAUpw9khUuM/FLXXC+i6JxjTqJZQJAjLqpnNat0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ispras.ru; spf=pass smtp.mailfrom=ispras.ru; dkim=pass (1024-bit key) header.d=ispras.ru header.i=@ispras.ru header.b=cG61MWmE; arc=none smtp.client-ip=83.149.199.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ispras.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ispras.ru
Received: from localhost (unknown [10.10.165.4])
	by mail.ispras.ru (Postfix) with ESMTPSA id CE5AC401014B;
	Wed, 18 Jun 2025 09:40:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.ispras.ru CE5AC401014B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ispras.ru;
	s=default; t=1750239612;
	bh=A5YhXi2y5S6EYl4mv1b74AtVE5sbxA8Oj9mEmOpCmPg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=cG61MWmEDioUVMcHjDb5QgQnafZEJ0jH4oKzFd3jvvgTq09EdOhoLlA/RXMVcZn54
	 orOCemzsY9IBjJPmYsrQtPLAeLxQal7GbjFoOUzta0UjEe7dvPZdaJwkPtTCSbUqsv
	 44m/mgl4iiou0g8QM8PO0MOq8rj6s7ZDjqE13TZc=
Date: Wed, 18 Jun 2025 12:40:12 +0300
From: Fedor Pchelkin <pchelkin@ispras.ru>
To: Dmitry Antipov <dmantipov@yandex.ru>
Cc: Valentina Manea <valentina.manea.m@gmail.com>, 
	Shuah Khan <shuah@kernel.org>, Hongren Zheng <i@zenithal.me>, Yuyang Du <yuyang.du@intel.com>, 
	linux-usb@vger.kernel.org, syzbot+83976e47ec1ef91e66f1@syzkaller.appspotmail.com
Subject: Re: [PATCH 1/2] usbip: vhci-hcd: do not show port status if the
 latter is not ready
Message-ID: <rayccu3lpptyzxwcactdxtzvy2byedfd2ez34e7xwtut24rhiz@2hienne7w62f>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250610131717.2316278-1-dmantipov@yandex.ru>

On Tue, 10 Jun 2025 16:17:16 +0300 Dmitry Antipov wrote:
> In 'status_show_vhci()', do not go further if the port is
> not actually running but just emit 'dev_warn()' instead.
> 
> Reported-by: syzbot+83976e47ec1ef91e66f1@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=83976e47ec1ef91e66f1
> Fixes: 03cd00d538a6 ("usbip: vhci-hcd: Set the vhci structure up to work")
> Signed-off-by: Dmitry Antipov <dmantipov@yandex.ru>
> ---
>  drivers/usb/usbip/vhci_sysfs.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/usb/usbip/vhci_sysfs.c b/drivers/usb/usbip/vhci_sysfs.c
> index d5865460e82d..8c8e90646e6b 100644
> --- a/drivers/usb/usbip/vhci_sysfs.c
> +++ b/drivers/usb/usbip/vhci_sysfs.c
> @@ -76,6 +76,10 @@ static ssize_t status_show_vhci(int pdev_nr, char *out)
>  	}
>  
>  	hcd = platform_get_drvdata(pdev);
> +	if (hcd == NULL) {
> +		dev_warn(&pdev->dev, "port is not ready\n");
> +		return 0;
> +	}

Please have a look at discussion [1]. If checking for NULL actually
eliminates the problem, not just hides the symptom, this should be
thoroughly explained in the commit message.

[1]: https://lore.kernel.org/all/8f65d5d0-5142-400e-9486-34efe9a0ca47@rowland.harvard.edu/

>  	vhci_hcd = hcd_to_vhci_hcd(hcd);
>  	vhci = vhci_hcd->vhci;
>  
> -- 
> 2.49.0

