Return-Path: <linux-usb+bounces-11832-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D14E9247C6
	for <lists+linux-usb@lfdr.de>; Tue,  2 Jul 2024 21:01:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 149CD1F22DA9
	for <lists+linux-usb@lfdr.de>; Tue,  2 Jul 2024 19:01:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 197891CD5CE;
	Tue,  2 Jul 2024 19:00:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Aex1PcL4"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6921E1EB25
	for <linux-usb@vger.kernel.org>; Tue,  2 Jul 2024 19:00:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719946838; cv=none; b=LBQWF7Ni2IvPjdUTJtNVB1+L15QOG9pVCV02UIh5doOgbbcg5GJx7ri5Te6DIjXWoAUR6W8u/8EQ/WKvXnewCCMfe7tAQiMjSIsLbzuaINzuEh4me5dVxlJglLGXjeH/lz32Q6j82pQhyaXD26NQLnjKyu+SE/lqJmFzhBvhlgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719946838; c=relaxed/simple;
	bh=TRh3kCtvO58B3TS/ro9pEJNNo6FOlD9/z7qzRrzSlqs=;
	h=MIME-Version:In-Reply-To:References:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oqTIH13CyFiim1dT3bHmlP3vhPP3/8EWqCmyxAk8Lood5N07dn8Ccy0MvsFj3t+1LWQWVp6EUY6yJl+rR4jSk9RLwH3zoIbX8VAVwv6Uyt96IU1IcB19Y1bbaNEuAishGYibRZEpg9kpFytN9pXgL1U9oUl0otNUe6xy/OU6Bbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Aex1PcL4; arc=none smtp.client-ip=209.85.210.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-701eea2095eso2699374a34.2
        for <linux-usb@vger.kernel.org>; Tue, 02 Jul 2024 12:00:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1719946835; x=1720551635; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TRh3kCtvO58B3TS/ro9pEJNNo6FOlD9/z7qzRrzSlqs=;
        b=Aex1PcL4TQzx8xBTycaadMgX5n4tITaDJ7ONqUNBdF1vjeiOMgSC7gfpdYgMNs2lpz
         sN8BIfgFJPooNk7fLnAPOogWzWhcLP/V/GdwoECSQQ1PBIpuB69W9QQKCLX8UVGKuOV/
         hoy2aSRq+4RZcb1OEn93WMKX2ZPMXrFFYB+x8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719946835; x=1720551635;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TRh3kCtvO58B3TS/ro9pEJNNo6FOlD9/z7qzRrzSlqs=;
        b=T49UBQ6w1ZhsAfcpmddUxX6fYlpDxFaN7fI87bQjyAzfRNVu3tfXQHEduSgCvPPaz4
         zJF2GWUUs8mp1mTcXEeRimYr2u0WbPekFe9+ZRkNBIar/FkbSB9QLeDmsOeSCHaZAaeL
         pu+ZcIgXeQhzFIRcqwNmnBqkkvNnFriAEbT2pECRRp8uUkhlxsDe0SZmljZxC3pInV0Q
         MoKI9yzfcfWGk3wsnzzHF1ZU3++vSadaEAbV4hfLGFBGP9379S7RLOyCBgnLATZWWMLg
         SA6A1pz0S6tXsCG+TIlvV2VTNgjf6srC5zZiuGcoxzaKPsovP2CGbBtHoBCAk+HtMG9x
         sRmw==
X-Gm-Message-State: AOJu0YykpMOkN2iCHTsqnbeKi0POILor5hgprcSbjxSQjn5ccfYkhb/0
	IjyGc8EdrHq3TOhZxB8ChRjrx64tsSBomaQQf6erL30rJIWZceaIBS5tGZwnqwbnVvdMuzZSCJg
	cicxW+0MXG7HTsncjCD5qRf5R9oFE7cpPV+d9
X-Google-Smtp-Source: AGHT+IEuctwteLzkcWtPEA88NJi6Q3ar2tx3qa3jOR7L3cOw0C0DH0EuKI1yUKU29vx9JV4sFz9I67UQX3NV/JxAMfc=
X-Received: by 2002:a9d:6c56:0:b0:702:526:284e with SMTP id
 46e09a7af769-702076f2ed8mr10449874a34.33.1719946835587; Tue, 02 Jul 2024
 12:00:35 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 2 Jul 2024 12:00:34 -0700
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20240624-usb_core_of_memleak-v1-1-af6821c1a584@gmail.com>
References: <20240624-usb_core_of_memleak-v1-1-af6821c1a584@gmail.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Tue, 2 Jul 2024 12:00:34 -0700
Message-ID: <CAE-0n51SfZiQ_XnPXYrG4Fyu=H8xDc0zpJ_Hxa+MrFq8V8PXTQ@mail.gmail.com>
Subject: Re: [PATCH] usb: core: add missing of_node_put() in usb_of_has_devices_or_graph
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Javier Carrasco <javier.carrasco.cruz@gmail.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Quoting Javier Carrasco (2024-06-24 14:10:06)
> The for_each_child_of_node() macro requires an explicit call to
> of_node_put() on early exits to decrement the child refcount and avoid a
> memory leak.
> The child node is not required outsie the loop, and the resource must be
> released before the function returns.
>
> Add the missing of_node_put().
>
> Cc: stable@vger.kernel.org
> Fixes: 82e82130a78b ("usb: core: Set connect_type of ports based on DT node")
> Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

