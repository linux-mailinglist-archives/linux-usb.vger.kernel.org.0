Return-Path: <linux-usb+bounces-12381-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EBBB93B270
	for <lists+linux-usb@lfdr.de>; Wed, 24 Jul 2024 16:11:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CAC8B1C23829
	for <lists+linux-usb@lfdr.de>; Wed, 24 Jul 2024 14:11:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A91D315957D;
	Wed, 24 Jul 2024 14:10:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="JQy6XQfu"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 548461591FC
	for <linux-usb@vger.kernel.org>; Wed, 24 Jul 2024 14:10:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721830255; cv=none; b=tAyYYfOOvVxeBpBVAFoP8UOUnhEe9mI7NWOmZ28bk8mP0GpMBzws1CvAQEZbOWhSl9VeEzq7obzX1RalNd4E9xN89buHSeJTZ/fWnJXKdSYjiiswVTg+ZolwRN5YH4TmflP2m7NtKKhPQF7RrNgJU2I0njJsJ+m6V9wrzeAx0zw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721830255; c=relaxed/simple;
	bh=WCJyBobz6smTbmKlx36emfO2oVXSkOoGiLvQctDNI5M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ky4rqW75GRQq2kHeah9nlGd9HoiEl1+WZ45FDy1yz/SZ0ZC0Wz4ylWELyXpSjjMV3L6FcCpllDVeGboJssxYuf0SPdts8jQUMCqMU69KeSuZOCgiekk/Unjuq2Z8eOgMzoRoSuP+tn78Vx2m7mAIbL8Ext11UUygKrCzvfXCQUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=pass smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=JQy6XQfu; arc=none smtp.client-ip=209.85.219.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=g.harvard.edu
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-6b5f46191b5so36145596d6.3
        for <linux-usb@vger.kernel.org>; Wed, 24 Jul 2024 07:10:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1721830251; x=1722435051; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vycBET30X6TjGJ5PxFXWeaVz1FTniAKOujocO4/MY08=;
        b=JQy6XQfuPgOtRijMsXOHkDzVLSjHYHANRoaj0NU6A/7AMW2PFHpCITrMnqCWs/2OrB
         Jt6aCGBuGJR90KvtZm64YXKot57k3cNIgepQHWGVay9KDYTJoWtICFRcacZm33vWPq4q
         JwhW8T4a6EObAZh2Ixo+Bqk9k6NqwkkPF5RSZKxPOWaBI0WLXpWnOqBHUzM439atQ/7I
         XlcmHP4G1AsV6G3AzclkrFSPJNUSOVMRIi+uW6LD6W4Uy1zd73ocKH1SEqm+8xU/z/LL
         t7wnphmTdsC8ffUjVyentszi7bkl8XacqikhV/NovSZKO3vSbzIS0t0g3Tf4+ynnhuCU
         7dHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721830251; x=1722435051;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vycBET30X6TjGJ5PxFXWeaVz1FTniAKOujocO4/MY08=;
        b=l5kHnTZ1YUZwos4XsawHok4RJn+ERekTJ6YbCGgiRCS7j2hXAeWMPjYC5Xz18GzW6T
         kbJtGiDaD3pNGI3/gGTUeEdUCWXJ4c3d0A7xGPMDjMcX1yOWynlSdhvV4DJg3ASU8NDe
         o4NzWCKKYDnkoh99frk4dbH9hWTQ0ANtZTqXTt9ncNyNCEb5n1blOVBLqNWKNrTtJzKu
         gsc0ntBxOl9VvOES086URVIr4olbZCHzjHtoBKDtoimMF44El19p0GAG3/bK+Rx9jX9V
         4HyHcflB3iKwhzNijtnj6ClGYOlVj0NfDF8HnsahlKFBcpXqmLUS4DgSC7ZrXUnZLm0O
         6jfg==
X-Forwarded-Encrypted: i=1; AJvYcCXKLPaeMRy8J4c9yKvaSoy11qGCgxHfdWwI+Dpt3fg8a3JRaPkWKm0HAn0HX/6T4DW3KS/cWWYvVU5M6Y+bDVUEkrUU3ESuQLcW
X-Gm-Message-State: AOJu0Yz/l7SEI+WLPzCJyGuHusSreNDTwi0ZJ8sGd6Y5nlTbixqGWLx8
	oy0XSjHrL6G9cHbzSxVUj3+9P2SmKApssHNC2hJDLRAY0JJSTRxojbvOeYC9eg==
X-Google-Smtp-Source: AGHT+IGM3RVQIsmIhKHe+YhNWt5+A1vmr9zp7TqkJna6ypfgkB+6E1J84W5dnHC4XkQwB87beI4ukQ==
X-Received: by 2002:a05:6214:40e:b0:6b7:a1be:a76a with SMTP id 6a1803df08f44-6b9907f5f34mr24105356d6.57.1721830251109;
        Wed, 24 Jul 2024 07:10:51 -0700 (PDT)
Received: from rowland.harvard.edu (iolanthe.rowland.org. [192.131.102.54])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6b7ac7f15c6sm57372646d6.68.2024.07.24.07.10.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jul 2024 07:10:50 -0700 (PDT)
Date: Wed, 24 Jul 2024 10:10:48 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Paul Menzel <pmenzel@molgen.mpg.de>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	David Brownell <david-b@pacbell.net>,
	Kai-Heng Feng <kai.heng.feng@canonical.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Greg Kroah-Hartman <gregkh@suse.de>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] USB: core: hub_port_reset: Remove extra 40 ms reset
 recovery time
Message-ID: <c7c299e7-605c-4bd6-afad-dfbfe266aa7e@rowland.harvard.edu>
References: <20240724111524.25441-1-pmenzel@molgen.mpg.de>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240724111524.25441-1-pmenzel@molgen.mpg.de>

On Wed, Jul 24, 2024 at 01:15:23PM +0200, Paul Menzel wrote:
> This basically reverts commit b789696af8b4102b7cc26dec30c2c51ce51ee18b
> ("[PATCH] USB: relax usbcore reset timings") from 2005.
> 
> This adds unneeded 40 ms during resume from suspend on a majority of

Wrong.  It adds 40 ms to the recovery time from a port reset -- see the 
commit's title.  Suspend and resume do not in general involve port 
resets (although sometimes they do).

> devices, where it’s not needed, like the Dell XPS 13 9360/0596KF, BIOS
> 2.21.0 06/02/2022 with

> The commit messages unfortunately does not list the devices needing this.
> Should they surface again, these should be added to the quirk list for
> USB_QUIRK_HUB_SLOW_RESET.

This quirk applies to hubs that need extra time when one of their ports 
gets reset.  However, it seems likely that the patch you are reverting 
was meant to help the device attached to the port, not the hub itself.  
Which would mean that the adding hubs to the quirk list won't help 
unless every hub is added -- in which case there's no point reverting 
the patch.

Furthermore, should any of these bad hubs or devices still be in use, 
your change would cause them to stop working reliably.  It would be a 
regression.

A better approach would be to add a sysfs boolean attribute to the hub 
driver to enable the 40-ms reset-recovery delay, and make it default to 
True.  Then people who don't need the delay could disable it from 
userspace, say by a udev rule.

Alan Stern

> Fixes: b789696af8b4 ("[PATCH] USB: relax usbcore reset timings")
> Cc: Kai-Heng Feng <kai.heng.feng@canonical.com>
> Cc: Hans de Goede <hdegoede@redhat.com>
> Cc: David Brownell <david-b@pacbell.net>
> Signed-off-by: Paul Menzel <pmenzel@molgen.mpg.de>
> ---
>  drivers/usb/core/hub.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
> index 4b93c0bd1d4b..487d5fe60f0c 100644
> --- a/drivers/usb/core/hub.c
> +++ b/drivers/usb/core/hub.c
> @@ -3110,7 +3110,7 @@ static int hub_port_reset(struct usb_hub *hub, int port1,
>  			usleep_range(10000, 12000);
>  		else {
>  			/* TRSTRCY = 10 ms; plus some extra */
> -			reset_recovery_time = 10 + 40;
> +			reset_recovery_time = 10;
>  
>  			/* Hub needs extra delay after resetting its port. */
>  			if (hub->hdev->quirks & USB_QUIRK_HUB_SLOW_RESET)
> -- 
> 2.45.2
> 
> 

