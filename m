Return-Path: <linux-usb+bounces-19219-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CEABA0A970
	for <lists+linux-usb@lfdr.de>; Sun, 12 Jan 2025 14:10:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0E2617A0524
	for <lists+linux-usb@lfdr.de>; Sun, 12 Jan 2025 13:10:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 237DB1B424F;
	Sun, 12 Jan 2025 13:10:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="f38LmPKo"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 931CC1B393D;
	Sun, 12 Jan 2025 13:10:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736687446; cv=none; b=I7FI7J2KcAMJgymHq/3jEBnjpiO8NB6HrS8yj2uZa5Y5E41R64NXzH8wZOJ4LCRRsLarg5LTzBQGHKa3N7Ui8AiYnyrh3CvHZO4sazBiykCVQJUhabaGOGbwczAWq7gd57sCetB0tQboVOQie4baobEP91DSOf2FURBKN2/Yutk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736687446; c=relaxed/simple;
	bh=o3kOfC7Hhnelb75OOr2nVYOujxJj1mf3dLDLH1urtYM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IZQG7u8lUb02PJWtHRwfmcVrS8Kr0EO4PBEYF2HaRtBVm4VZhja8HWuSR5vr8uCHUFO3R+QjK6b2pW9Bs/m3Dcxob68E7Q/Gm2f2boM8JFSsWc+Z/K9a5UOykAJFtHJXBDlf1g8Jz+VNdJwjlTZueV1FgxzdVw8q6PhVKTsFQyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=f38LmPKo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90465C4CEDF;
	Sun, 12 Jan 2025 13:10:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1736687446;
	bh=o3kOfC7Hhnelb75OOr2nVYOujxJj1mf3dLDLH1urtYM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=f38LmPKoQ+7n/C0moZiklr+Ah9CnNrArGaTAiHmx0vOd/XvSOEnAovwykOHt8nlKm
	 18u3retHgwwbj/2leeLb6dPmybHqYfEzBaKdyJfz2gM4+cAak0OgGj1uk6shcyEB8Q
	 atg8zcB1JDVZGRqK3M7OA6HxAnTo742dOGtMfM3Y=
Date: Sun, 12 Jan 2025 14:08:40 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Qasim Ijaz <qasdev00@gmail.com>
Cc: Johan Hovold <johan@kernel.org>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] usb: Fix null-ptr-deref in qt2_process_read_urb()
Message-ID: <2025011258-shelving-entwine-ef76@gregkh>
References: <Z4ORrl4sZBhPiu2p@qasdev.system>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z4ORrl4sZBhPiu2p@qasdev.system>

On Sun, Jan 12, 2025 at 09:55:58AM +0000, Qasim Ijaz wrote:
> This patch addresses a null-ptr-deref in qt2_process_read_urb() due to
> an incorrect bounds check in the following:
> 
> ""
>        if (newport > serial->num_ports) {
>                dev_err(&port->dev,
>                        "%s - port change to invalid port: %i\n",
>                        __func__, newport);
>                break;
>        }
> ""
> 
> The condition doesn't account for the valid range of the serial->port
> buffer, which is from 0 to serial->num_ports - 1. When newport is equal
> to serial->num_ports, the assignment of "port" in the
> following code is out-of-bounds and NULL:
> 
> ""
>        serial_priv->current_port = newport;
>        port = serial->port[serial_priv->current_port];
> 
> ""
> 
> The fix checks if newport is greater than or equal to serial->num_ports
> indicating it is out-of-bounds.
> 
> Reported-by: syzbot <syzbot+506479ebf12fe435d01a@syzkaller.appspotmail.com>
> Closes: https://syzkaller.appspot.com/bug?extid=506479ebf12fe435d01a

Oh wow, syzbot is now starting to fuzz random USB devices?  And this is
the only thing it found for this device?  That's not all that bad, I
expected much worse.


> Signed-off-by: Qasim Ijaz <qasdev00@gmail.com>
> ---
>  drivers/usb/serial/quatech2.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/serial/quatech2.c b/drivers/usb/serial/quatech2.c
> index a317bdbd00ad..72fe83a6c978 100644
> --- a/drivers/usb/serial/quatech2.c
> +++ b/drivers/usb/serial/quatech2.c
> @@ -503,7 +503,7 @@ static void qt2_process_read_urb(struct urb *urb)
> 
>                                 newport = *(ch + 3);
> 
> -                               if (newport > serial->num_ports) {
> +                               if (newport >= serial->num_ports) {
>                                         dev_err(&port->dev,
>                                                 "%s - port change to invalid port: %i\n",
>                                                 __func__, newport);

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

