Return-Path: <linux-usb+bounces-32076-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id D879ED0445D
	for <lists+linux-usb@lfdr.de>; Thu, 08 Jan 2026 17:18:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 03E6B30445A7
	for <lists+linux-usb@lfdr.de>; Thu,  8 Jan 2026 16:13:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5F0B2673B7;
	Thu,  8 Jan 2026 16:12:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="A/6k7Z43"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7710F234994
	for <linux-usb@vger.kernel.org>; Thu,  8 Jan 2026 16:12:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767888766; cv=none; b=u70UfUI5Eu/U7rLPdz+VyoLg9b2QxUX1tfU2K8nQxVXcY4Eds0QOOPhpKoNvvN3Ln5yu3tLxd1ClXIvDO9CC33e4+9qOVta5vD70ryBX23qi75LgpMBBl0KqnR4KyWkSZarmHB+nhiTOCvmjLHcPE8dIiGvDyP4zPMqOFrBhGYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767888766; c=relaxed/simple;
	bh=7P1ewFUUR06PsdQ1+KopQdMrnStTDwmaVTfhLqJEUEE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sdJ9vRC23ed8ZCkkgf7DXIn2STWq0PiVdbPSomPvjYc7JHW2YgBqLLWyDsff/R18sZqv2I+NuzeV1nR+6f1uAmH1pdDIl8layWDwhnks2OTHjEsV6/YOM/8u3rXYeXM80fKc+qfjFHNHgYrLOJLmOmFZixLvIZSRlwXrOqqhPME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=A/6k7Z43; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-8ba3ffd54dbso487572785a.1
        for <linux-usb@vger.kernel.org>; Thu, 08 Jan 2026 08:12:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1767888763; x=1768493563; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nShBytfJ30YX6spitF78vqA/zVONafQ9czBgIRkdV/c=;
        b=A/6k7Z43QXQVyptsEPs0HnhgWP3U6RqPB8QonHOaHcnepGRZ4n3IOif07QTfXg5YVb
         O45+ZHjZzSB1oviuoiVKaNVIaiGEuzGTXpm4UDsHLRZR0QL5lm1ppdzLxMkuLVIIBLrx
         OtdGMUEnIS0S0+e1HLaMLei+jlAAEdoErERAXAwi3Grdt4D2mvA81nxbNAaEsHg64bVG
         bfSBUMF3L6AqcLxL57i/9Pw+t8b8r/If0x0L0NcZ5zPd9gtu1KTZ1wA36R74dSKhpX88
         igv9CyZgBwGsyzurEHVD1BbtZwx5Xx3caALQjhHqWqMoN13niNg/G9Wd7nzCOidPltZa
         GhGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767888763; x=1768493563;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nShBytfJ30YX6spitF78vqA/zVONafQ9czBgIRkdV/c=;
        b=Cm1yMyIPTkX4fiSnC4CpQ70qC5C7IlbiMncYFOElVrBTJhqzPOAm/uPpZ5fTRlSbNJ
         9F4NUm9PWEqV2Cuqkf9ScLae3bniC6FnoHEo2sbtZpZV2+SY12PxoWHhXm/u5H4pRmQ3
         JAf9gcCkIaCjv12Vfp9XnE6nmYm6rBES/RR6x34Sjq59kFQVPUXOTD+bqWxw/djrqqzL
         9OdA+0O8mbXO/grYw8tqVopDhe4IYYO5UZk0S0v1CqyPRNOj+XLZHfTF30yw+oR1Pjd3
         3+aYuswfwNApRPcIGMcTtnvn99MDQ0ID3T3qxx7IcFl0/iMLLxkxfthE30UQwEdKI1Et
         uIzQ==
X-Forwarded-Encrypted: i=1; AJvYcCWTggTF0kJ2WgOOIpo8mwXd8pMbPHGIb8GvcCKkYgW3jFD2DzlBpdkmGzdEq8nJbqhijhncViqfyqU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzdwelguJrD1B6zxTo1uw4EqfhkhW2oAR+qppo7hETqtLqVYffi
	dPzUbfbdEI3dZcoKA2fxxbLic2rYG0NIRtdn7S0rf4iDhRmg4b3gkwIBOIGMOGJ/zg==
X-Gm-Gg: AY/fxX6ien89vLl5a4HYOoUecVqp3G2XUolEXEsQ8bWI0reoFCTGY5/VJQ772fTlYop
	khaNzZth/9sdGBr0wNkQGkvXFohANCGSxMrrb0XbT0GKpaTMCddIaSssNKw2ZUSLfBl7/Kf2VWA
	BFDRvViTadk9wlsuF6tDq0WL/2aei86Aulv7Gotu5GPrPkY6ASnGdhMCD1FjHNoQADPjAVfQURV
	G65CPMAH65Apv070I3Ak6vQSf9U6CxZY7yd5ZMps96CJEKqdm+S3mUyxyg6BLax9BEcyMj0IrsT
	s0ioZLsE5bAlu3ECagybUxM1m3N4bxtGtugqEWtJRXOzXC6Q7kl4C3d1iXa3bgqKTk6u5uTVchr
	9ToO0bcYPwvy4Nh3hGFdtRKFS5flCIAMdkCG/9nUKRGSnTXlnuxuUuRAk/N7o3fqiLlqLrkxykc
	ao+Je0/uh0sBFIAt6G2W4HhZGPRaZ0FseWwrNYURjtNOLcPcKuZdDySu+0JnlkWTJdroFIB6ECh
	esEaP+Y
X-Google-Smtp-Source: AGHT+IHllhV6W/ak2kviW3YrskoYeE0Pe04ld7bqv98x6GbLoOTW/sRLg/feO0ZHM4WF3u2dtAL5og==
X-Received: by 2002:a05:620a:bd6:b0:8c3:7027:400e with SMTP id af79cd13be357-8c389416de0mr891075885a.70.1767888763111;
        Thu, 08 Jan 2026 08:12:43 -0800 (PST)
Received: from rowland.harvard.edu (nat-65-112-8-61.harvard-secure.wrls.harvard.edu. [65.112.8.61])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c37f4b9373sm602639585a.15.2026.01.08.08.12.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 08:12:42 -0800 (PST)
Date: Thu, 8 Jan 2026 11:12:40 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Mario Peter <mario.peter@leica-geosystems.com>
Cc: peter.chen@kernel.org, gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org
Subject: Re: [PATCH v2] usb: chipidea: otg: use autosuspend in ci_otg_work
Message-ID: <bc08faa5-9089-44f6-8c7b-236a47aabb0f@rowland.harvard.edu>
References: <20260108153458.1707897-1-mario.peter@leica-geosystems.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260108153458.1707897-1-mario.peter@leica-geosystems.com>

On Thu, Jan 08, 2026 at 03:34:58PM +0000, Mario Peter wrote:
> Switch to autosuspend mechanism in ci_otg_work() to prevent race
> conditions during rapid device plug/unplug cycles.
> 
> The current implementation uses pm_runtime_put_sync() which triggers
> immediate runtime suspend. This creates a race condition when a USB
> device is unplugged and quickly replugged. The controller may suspend
> before the new device detection completes, causing detection to fail.

You should be aware that this change alone won't prevent race 
conditions.  They might not occur during rapid plug/unplug cycles, but 
they can still occur.

Consider what would happen if the device is unplugged and then plugged 
back in a few seconds later, exactly when the autosuspend mechanism 
kicks in and starts suspending the controller.

The real way to fix this race is by ensuring that device detection will 
occur in all cases, whether the controller is at full power, suspended, 
or in the process of switching between the two.

Alan Stern

> Replace pm_runtime_put_sync() with pm_runtime_put_sync_autosuspend()
> as recommended by Section 9 of Documentation/power/runtime_pm.rst.
> This updates the device's last_busy timestamp and delays the suspend
> until after the autosuspend_delay period, allowing pending device
> detection to complete. As documented, this approach prevents
> "bouncing too rapidly between low-power and full-power states".
> 
> The synchronous variant pm_runtime_put_sync_autosuspend() is used
> (rather than the asynchronous __pm_runtime_put_autosuspend()) to match
> the semantics of the original pm_runtime_put_sync() call.
> 
> Signed-off-by: Mario Peter <mario.peter@leica-geosystems.com>
> ---
> 
> Testing was performed using a scripted sequence with a relay to simulate
> USB plug/unplug operations at various timing intervals, verifying that
> devices are consistently detected after replugging.
> 
> v1: submitted (https://lore.kernel.org/linux-usb/zuzsjr6isq6i5izw3rkyo45opyikiqjmy5xk7flpmlgmqb6mgh@rpbdvi3s4u54/)
> v2: dropped redundant pm_runtime_mark_last_busy() call
> 
>  drivers/usb/chipidea/otg.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/chipidea/otg.c b/drivers/usb/chipidea/otg.c
> index 647e98f4e351..d19c27f44424 100644
> --- a/drivers/usb/chipidea/otg.c
> +++ b/drivers/usb/chipidea/otg.c
> @@ -230,7 +230,7 @@ static void ci_otg_work(struct work_struct *work)
>  		ci_handle_vbus_change(ci);
>  	}
> 
> -	pm_runtime_put_sync(ci->dev);
> +	pm_runtime_put_sync_autosuspend(ci->dev);
> 
>  	enable_irq(ci->irq);
>  }
> 
> base-commit: f0b9d8eb98dfee8d00419aa07543bdc2c1a44fb1
> --
> 2.43.0
> 
> 

