Return-Path: <linux-usb+bounces-32357-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DA06ED21893
	for <lists+linux-usb@lfdr.de>; Wed, 14 Jan 2026 23:19:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 86E533013394
	for <lists+linux-usb@lfdr.de>; Wed, 14 Jan 2026 22:19:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9ADEF3AE705;
	Wed, 14 Jan 2026 22:19:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Aw2eqnlp";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="B6fEyAqd"
X-Original-To: linux-usb@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5A4C3A784F
	for <linux-usb@vger.kernel.org>; Wed, 14 Jan 2026 22:19:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768429178; cv=none; b=Vzrq8xz76Reg/G9v6st86DibtSLtkHCfKWPfnr8heGHnzcZixXrB1mACT5lQiEv5FHHGWqnczesR+5ba6URScCxlCzHrfExxQ+A9Qbo40nuEOvwteZ473TZma8R+QWjv+5Nrd7H/jrLpQu8VtlLjmqh59G0UEi0om6vY6LcfHtA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768429178; c=relaxed/simple;
	bh=Zd3hjooXcRLvny48hHqRzr6SITpUI+66uIBAPLtuRVk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=F3ZyxW9fbNkvL0pEmqhRAJ1R7PNF/aQmWacHgbORkNTod+Mq3qKi/WhIglp+96S8AUITrF/Mjf3XSWqNFy0XIPGk+DFAM349HTYYntrdisg5RHO+61GxZwtoJOweBMeE4Dtl3rbR1eZLc8NmbuvUSROghEFNfS3FK3JmfyYGoRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Aw2eqnlp; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=B6fEyAqd; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1768429167;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ftR49wJT1ig0dKZDi8tPuyXzRv13vJOC8jN0Oc8SYJ0=;
	b=Aw2eqnlpb2tUDBiGSvqOL69f6vSr86/nnqrYfZK/3hUDUeJ/EKpjH/gFt7PQL6EY6wZoCT
	CNmnmmPY0teoXcd465LNalM4nTTfMliC6xNVnAe1XighgyDs7O0prfZAG4JcGhVOcdyZuD
	H4zkwLXBWi5K6ljwDmLdnpx7ST8U4S0=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-428-g5ZldVVnND6EoVoyEBhtxQ-1; Wed, 14 Jan 2026 17:19:25 -0500
X-MC-Unique: g5ZldVVnND6EoVoyEBhtxQ-1
X-Mimecast-MFC-AGG-ID: g5ZldVVnND6EoVoyEBhtxQ_1768429164
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-432db1a9589so176926f8f.0
        for <linux-usb@vger.kernel.org>; Wed, 14 Jan 2026 14:19:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1768429164; x=1769033964; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ftR49wJT1ig0dKZDi8tPuyXzRv13vJOC8jN0Oc8SYJ0=;
        b=B6fEyAqdfIlD9e1DArygZ2NEEEmZtDLDgqKIAjfn/dy3kdvGyUEItLCkwjggoQzXCl
         /yW6u/S6Ko4u3ql1Zwst3DyoFuKK/+BP10DjTiQOb/OMDNV8Vo3Z1KEpHBq3WpcrJgcv
         m2UixGcX9YnNCHQBSSt/BGWRfyGqsnX/WnY1oC7oeyUdbI79rMzyuCpUlB0WnyRIVF+j
         sFnayxMcXdn9RGWE+XYdyU6GnuhfTUgL57LlkGPpZhUgZsan2tf4+fJ4ZUYPdRspZeCJ
         frZ3UaOmEOQNZRP74x6SJSyAiLI3RCSQ87xalE3qTgbO/RU+w4miVOitAqIxsUpU8ODR
         /nfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768429164; x=1769033964;
        h=content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ftR49wJT1ig0dKZDi8tPuyXzRv13vJOC8jN0Oc8SYJ0=;
        b=JoLot7tDq279C3sqYRF/xXr+HC0xXUcyy2DWgFp6glO/drmmVlVC0Rj6CYSrdfhOsk
         Rm3Klr711Khtj3dmTFUaWcCj6X1Pku3hn+6b2xDOQg0Bg/prqgdGy7ryS0tbcX/Sdoj3
         0ViSo/VvKnvODQe8p1Pq+rR6boVqfr0QvtFw98h7tSMR967HWZoRwuvXmgiAtKPNNCQC
         eOFdlsm0aom6nr6GpT7Z2Ouwjd0W8/pzbREyMoOg5uJlOa0UP5Pf0eb6Dp5CuWyMQae4
         av/T4Q4MJAu48jCGvig3fEvArA3sJPOWQKlkGRxhWT8oxNfHjTxt30opVcHYXj+hMQ+B
         j9HA==
X-Forwarded-Encrypted: i=1; AJvYcCWFhfMqrF93DMUOrA2fDNaFW8QRzG08FjFVdLHymczFgocl9UxCmPzCVaUxfDrOmUzbHenCeZ9WzOk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxJBfUr7xDnfuCnYvIUXnW2cN8I/zSqrSiRMofBetow2KyYyWrT
	oCcA3+ebX8/8MUPI+Y5wzO3HFcWd955+B31UrZLcOoxAbfZ30fbzzQAh8WNmS22fIYVMtEMRXGo
	5BVkZGCiV8+2VmsXr6k6oIEwiG8TyB9rI7RKNS4eYYF2i/HbClSup4csg8OhEQQ==
X-Gm-Gg: AY/fxX5X7Eik53zRu8vzyUEFlJ4CeFAenQx23jt81IS8Z069UFOKhQivs0VPfTCeHYl
	raaDmLh9vTT180NZ5w8U649FGGprgG9Yeg/tRsGe7GReCsdVxibscMKsJyf4DOIoPD+3oz9Pu4U
	xRgAnvoK0MnLU24fIShDUCvZXVAGlDX+ieMG4FVxkTpg6u4q8q2wHWwh7XAhh8k1ejL2FwzTwxA
	L3sAlKODRh56TiMB5IWLbQT6zhtH5lpUcVLM4J8imMmeMKYQTQzFo5UwGvjCjvMoAMjqkysFIDQ
	Loxg6pz58F2RS1M4qd9TaUdQxFm+1nAz/Q+VE9QJADMjARdBRPdJNB0ZnqRiWbgMaIm4zLoCDIb
	RtXXUy1VaBImgc1jUo/lY
X-Received: by 2002:a5d:64e5:0:b0:433:1d30:45f with SMTP id ffacd0b85a97d-4342c3ed5c3mr4692490f8f.1.1768429164308;
        Wed, 14 Jan 2026 14:19:24 -0800 (PST)
X-Received: by 2002:a5d:64e5:0:b0:433:1d30:45f with SMTP id ffacd0b85a97d-4342c3ed5c3mr4692469f8f.1.1768429163890;
        Wed, 14 Jan 2026 14:19:23 -0800 (PST)
Received: from maya.myfinge.rs (ifcgrfdd.trafficplex.cloud. [2a10:fc81:a806:d6a9::1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-434af6535ddsm1648131f8f.15.2026.01.14.14.19.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 14:19:23 -0800 (PST)
Date: Wed, 14 Jan 2026 23:19:22 +0100
From: Stefano Brivio <sbrivio@redhat.com>
To: Laurent Vivier <lvivier@redhat.com>
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org, Oliver Neukum
 <oneukum@suse.com>, linux-usb@vger.kernel.org
Subject: Re: [PATCH] usbnet: limit max_mtu based on device's hard_mtu
Message-ID: <20260114231922.6b41e9ed@elisabeth>
In-Reply-To: <20260114090317.3214026-1-lvivier@redhat.com>
References: <20260114090317.3214026-1-lvivier@redhat.com>
Organization: Red Hat
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.49; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 14 Jan 2026 10:03:17 +0100
Laurent Vivier <lvivier@redhat.com> wrote:

> The usbnet driver initializes net->max_mtu to ETH_MAX_MTU before calling
> the device's bind() callback. When the bind() callback sets
> dev->hard_mtu based the device's actual capability (from CDC Ethernet's
> wMaxSegmentSize descriptor), max_mtu is never updated to reflect this
> hardware limitation).
> 
> This allows userspace (DHCP or IPv6 RA) to configure MTU larger than the
> device can handle, leading to silent packet drops when the backend sends
> packet exceeding the device's buffer size.
> 
> Fix this by limiting net->max_mtu to the device's hard_mtu after the
> bind callback returns.
> 
> See https://gitlab.com/qemu-project/qemu/-/issues/3268 and
>     https://bugs.passt.top/attachment.cgi?bugid=189
> 
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>

Thanks for fixing this!

Link: https://bugs.passt.top/show_bug.cgi?id=189
Reviewed-by: Stefano Brivio <sbrivio@redhat.com>

-- 
Stefano


