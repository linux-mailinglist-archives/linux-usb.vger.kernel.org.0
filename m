Return-Path: <linux-usb+bounces-31073-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 4064EC97FD4
	for <lists+linux-usb@lfdr.de>; Mon, 01 Dec 2025 16:14:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id D31F04E0739
	for <lists+linux-usb@lfdr.de>; Mon,  1 Dec 2025 15:14:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01C0331CA4C;
	Mon,  1 Dec 2025 15:14:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="e662CtCs"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF5A431A54B
	for <linux-usb@vger.kernel.org>; Mon,  1 Dec 2025 15:14:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764602052; cv=none; b=o5LcA5XkDX8HMMhbbZXb42tPNif4cdho4nd7RIsNxcEeYUzLW3kMC8+w0qe/HS0RYnO4T1Qtf0IitD2b7eBr82U1rZ4vc2MblJ+TvCS3aNl3sINWgFLRUVUBF9DcqhUbvwbNvVrgeJy52coz/lFsjo4Frj9rmxQ4j/+h4iYqdaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764602052; c=relaxed/simple;
	bh=KtMrIU76wgNwQP30rQykOnjusMExfEdx982yA6fGIzA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fI8v4bUua/fyvjuOCd8PQ/hiACfqqaeST5OYR1JKbrIW2eTPex0quXAtmK9nGbFqWFnG5eRkeeR+Bcl3asFfAq4tcFy+Ck3C5ivADbTIABAcokr8B/TryGs9K0fVrvRzaAnWvYrrwcdGQi7+tQkL7MMo5lHx0u2B8bDkykmqKcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=e662CtCs; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-4eda6a8cc12so41749311cf.0
        for <linux-usb@vger.kernel.org>; Mon, 01 Dec 2025 07:14:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1764602050; x=1765206850; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3SAul+0D+gAMzNGvYFGhRRRI5TXlnwSWvdm4xdNWnms=;
        b=e662CtCsrivj0GroUPeV+54pfECNPRsvyG5Sz4loQ1QRykIktXdCF1nGBVKhyTGZ4o
         bRSEAuBR+3tX2/kNc5mQJgBVtUBIU/PL2CFUvT+VIQ/1VUeMuJx4nasGsVWV1IJTl6WM
         g9DQ6+wqE5MIvs7ZOz4iNgnQpWgYrMEGvUJblUeiM5x2oYUmJ4cs2ObUnFXXnVvFferw
         oC/A/ohvyClg8dt0Y5JPe0tfWYSs9Um1RmqOP20skAgX8IIvkUNaIBs4CsH0hMhHBJPT
         4HAh1Jdv1m8PuqC7dSc614DzbSHIkyrzScANYBupX0TNUn3ruGj+hNqvAR4/0byKiQ8P
         ufAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764602050; x=1765206850;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3SAul+0D+gAMzNGvYFGhRRRI5TXlnwSWvdm4xdNWnms=;
        b=tuMjvkxIoSVK/3X8T7bOe6NGABcaxSJJNOC3VVftezS9gnP8uIEFiMZB9AL5sZpZAl
         7P5wPdrYtZENDLKloJRWnPjyf/jfxgceGNM9Xj7Z9QLi2QRqqcv0RDvNMhy31+vkskDg
         QPX0N1CH86gtrwb+fxfF6rIUnb5+I6SKQj3XEA9BbOn7DaE3rXyFqI3CGbOiC4VrvQYA
         iBrnf0bdw5OlWLEyQWlyZtQ37F5upp7UOWlVhGwpUCdGwEp7KZu0eBZcacfnsa6O2HaV
         ebnFOxBLSvApx3Jw03h7TqGyNE66Dk8nLE6uj3vTnBQtTMUV4EbyvSkEs1k3jVhbNSBG
         mWPw==
X-Forwarded-Encrypted: i=1; AJvYcCUU4ceEtih6/oqZyrvx8/E6Byoa4GZCAhbtuoidPQohMvOrSO7/HUQNhRvcOsWDsHwOPkVfgI/NOWs=@vger.kernel.org
X-Gm-Message-State: AOJu0YzN98Lds0zKv4u9gyud92iqRRa4dtEobeHnOYV54TwZ7rBdLv+X
	/aJLdeIjTDmFGQH4ZAbLAlWoisWrQKFNxHEHOkVsVTScNoD/QcFz5xIiFClitAxQ9A==
X-Gm-Gg: ASbGncsd1K+7a7YHwGQwbRHUSx8K+T9+m4j1ItfIDQETrrmPXD6i15icaCi/IBKGnh/
	alug+BXytq1I4tONTnnhPVnqHP7IyOyshvFAbooqgZkcCCActZ/5BFs2lCqGoLTdfT/MPQaiWlN
	DJvsB+7EHi/7rDax3i1aPgxTpz6eLW81ec5WIt7ppIg3rGEJn/AZj+XUOz9bAVqRuAyTrp1u+wY
	SjLGgpz4KsFQIGvoesd9KP4pwL5Oox4nAZ1bdHKHV4fYPXldC9eKmxyEXBJBoc8Nxnk8gArL0dd
	YjrrrUKkr1lltVkfUxhZ/9STbKtU25fo7e1QmMLF274C9JmatDRy8f8xT4cU45bylXUJjTDlEY+
	QhuaPh+zLf3fi0oh3xdnQFgk0KM5JEASI1q598JwdGnBOSceKDQxi3jyPgpnPIC9wVHrV/zw97/
	AiJXkoUZH1/FF0cDe4gg408bc+rBDR0Q==
X-Google-Smtp-Source: AGHT+IFEzElQgBdVgqo9z3n2Q5soMOYA3WNZwWL/c3nFeMZaqmnQZjYiiyMVBbpkGnG48DSVdvDPvQ==
X-Received: by 2002:a05:622a:50:b0:4ee:213b:3393 with SMTP id d75a77b69052e-4ee58841e01mr603457661cf.4.1764602047909;
        Mon, 01 Dec 2025 07:14:07 -0800 (PST)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4efd2fd00c0sm74670311cf.13.2025.12.01.07.14.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Dec 2025 07:14:06 -0800 (PST)
Date: Mon, 1 Dec 2025 10:14:04 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Yi Cong <cong.yi@linux.dev>
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, yicong@kylinos.cn
Subject: Re: [PATCH] usb: linux/usb.h: Correct the description of the
 usb_device_driver member
Message-ID: <89c7cb17-c5bd-47e6-96b8-1108966b545d@rowland.harvard.edu>
References: <20251201085309.103379-1-cong.yi@linux.dev>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251201085309.103379-1-cong.yi@linux.dev>

On Mon, Dec 01, 2025 at 04:53:09PM +0800, Yi Cong wrote:
> From: Yi Cong <yicong@kylinos.cn>
> 
> In the current kernel USB device driver code, only the name field is
> required to be provided; all other fields are optional.
> Use the command grep -rnw "struct usb_device_driver" to inspect
> how specific drivers are declared.

That last sentence should not be part of the patch description; it 
doesn't explain the patch's purpose or what the patch does.  (It's not 
even correct, because the grep output doesn't show how the specific 
drivers are declared.  It mainly shows the filenames and line numbers 
where the declarations start.)

Aside from that,

Acked-by: Alan Stern <stern@rowland.harvard.edu>

Alan Stern

> Correct this part of the description.
> 
> Signed-off-by: Yi Cong <yicong@kylinos.cn>
> ---
>  include/linux/usb.h | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/include/linux/usb.h b/include/linux/usb.h
> index e85105939af8e..fbfcc70b07fbe 100644
> --- a/include/linux/usb.h
> +++ b/include/linux/usb.h
> @@ -1295,8 +1295,7 @@ struct usb_driver {
>   *	resume and suspend functions will be called in addition to the driver's
>   *	own, so this part of the setup does not need to be replicated.
>   *
> - * USB drivers must provide all the fields listed above except driver,
> - * match, and id_table.
> + * USB device drivers must provide a name, other driver fields are optional.
>   */
>  struct usb_device_driver {
>  	const char *name;
> -- 
> 2.25.1
> 
> 

